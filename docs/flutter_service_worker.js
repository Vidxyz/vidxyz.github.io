'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "b919654f391f40a8fc92b9a9459238ee",
"version.json": "bd341ba74d38c530da636604a427deda",
"index.html": "fc3710feaf966611e47fa3119ccfed6d",
"/": "fc3710feaf966611e47fa3119ccfed6d",
"loader.css": "3ed0540af717cd56f01a37a08f714759",
"main.dart.js": "c4c091fb4fc8fa42c274a25e219c0e23",
"AssetManifest.json": "dd607b2ce82fae60939daf3cfc580f15",
"flutter.js": "24bc71911b75b5f8135c949e27a2984e",
"favicon.png": "3e2de479b4738b030900c2a2fe6016b5",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "76858bfccb016815b5d8257df072ea5f",
"assets/AssetManifest.json": "dd607b2ce82fae60939daf3cfc580f15",
"assets/NOTICES": "05a289565d050ef3b5da3815284eabcd",
"assets/FontManifest.json": "ea48c12bd53ecbeef3f08ad2d4858592",
"assets/AssetManifest.bin.json": "c612a077fb34de936390fd8574d151c2",
"assets/packages/flutter_devicon/fonts/FlutterDEVICON.ttf": "20e50df99a2adaab0678501ffb5c81cd",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "5f72d664707e4d711a1c0c240912cd50",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "b72c617acdf2227c8b1413215f620711",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "a5d7457fda15b7622c14f432ba63039a",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "f25e8e701660fb45e2a81ff3f43c6d5c",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/shaders/stretch_effect.frag": "40d68efbbf360632f614c731219e95f0",
"assets/AssetManifest.bin": "530609b6c6fdd6dd5f11238c1845eade",
"assets/fonts/MaterialIcons-Regular.otf": "c3e34ca595d0877438988e3861b1a66e",
"assets/assets/person_asset.png": "c9326110016f566fbc06a2d5042f5968",
"assets/assets/experience/sap.png": "3dd1799f00f485a647a57321136ac4ae",
"assets/assets/experience/billie.png": "e81617b5100127332ae79ad6ca0be165",
"assets/assets/experience/improving.png": "ed1fa6f10b431742b2816d33420ce352",
"assets/assets/experience/ims.png": "af2b7341531e64ea93cf09fc2c48f7e0",
"assets/assets/experience/capital_one.png": "2c2d2fabc8654af6e2570364e67c2f89",
"assets/assets/experience/intel.png": "8cffaeb84096893a19ad6ba4c83c87ef",
"assets/assets/experience/okta.png": "8a0847613ff821b9bcb94f2739af7628",
"assets/assets/experience/askuity.png": "6d880bd9cd6cfa53f5abd935bf37f744",
"assets/assets/email.png": "715076f07d7a64910c5e22a9c3f470e1",
"assets/assets/one_2.png": "6337fdce79774c4406cf693a86c937b2",
"assets/assets/mappin.png": "9cc090022ae31337336d2024160714b8",
"assets/assets/design.png": "6aaec412d8837ac9a83f03f453877606",
"assets/assets/dev_spacejunk.png": "27eff808d6e4e7052abd685afda77bb1",
"assets/assets/dev_cluein.png": "b2e133368e8dd2dc4525ae7d35a28d56",
"assets/assets/person_asset_small.png": "60f36898a2b193b0a468c6f19368aa7f",
"assets/assets/github.png": "ec3a60c8c6539a07eb70b52f6737ea6e",
"assets/assets/gcp.png": "b3af3f41f15b89644569a89d6cb76ed6",
"assets/assets/person_asset_small_2.png": "6be5fe3f419dabddf3ee030f0b356886",
"assets/assets/pdf/resume.pdf": "20bc13a9ffe0183bd1ba64b4c2eabf3f",
"assets/assets/promote.png": "2bd8adcad79a4ebb80888d1a0583b3c4",
"assets/assets/airflow.png": "1c5f22ff0de9804fdc51dfd4f7e2ed24",
"assets/assets/dev_flappybird.png": "4d93fd9c25ba8c6efad242adbbae71c7",
"assets/assets/neo4j.png": "f98db14ad79418d32c6af24049f90af2",
"assets/assets/google-play-badge.png": "1e91d02cf5a902f38f2923c006d79281",
"assets/assets/circleci.png": "d935075860d0f00f19fe71f0cec05899",
"assets/assets/quote.png": "1a0aa9a06293ac5689bc32012e0e13e6",
"assets/assets/develop.png": "471c2c94d5d04112086eba9fd78c6809",
"assets/assets/laptop.png": "fb49e3c0c36437239db5f8c114b03062",
"assets/assets/dev_carpedia.png": "637c2df03dc3ef6a6551a0c12a780e75",
"assets/assets/linkedin.png": "30c453b7f5fbdb09ea0cb42a5dc7a6e5",
"assets/assets/one.png": "639b46572c65cb20a456e318233cceff",
"assets/assets/dev_header.png": "ba4fd2badd5e7fcfe2b978de2627cb02",
"assets/assets/k8s.png": "83dc427bb7e81ab76918c5f1a3faf1f5",
"assets/assets/phone.png": "45903a1ffa9ede882171aca9f71c4c29",
"assets/assets/ios.png": "49f79e21da11e96b8cf0e3b8bef6616c",
"assets/assets/akka.png": "266d586c28d97de11c8534aa451fe82f",
"assets/assets/azure.png": "b021ae619d58b9b7d3faae7531a670ae",
"assets/assets/write.png": "dc4f0d3df06d5fc9b13b9168b88e2560",
"assets/assets/person_asset_2.png": "f5dcc2132f3e3c7bb4e88785ee2ab5ce",
"assets/assets/whatsapp.png": "426617ad28567da23a2346566d84b5a6",
"assets/assets/dev_president.png": "6e88d93fb82c9461f399d562f2b8e79c",
"assets/assets/play.png": "1d627942f0b2f115f8638936a212244a",
"assets/assets/fastapi.png": "5f6d1d433b2793d87f70b1b63dd46622",
"assets/assets/terraform.png": "1b65a4be0b533cb0566cfafebc8574ad",
"assets/assets/app-store-badge.png": "77ca8b6daef7f3a2c81f8266a17cd96a",
"assets/assets/platform_header.png": "0da7ab4a461831f382ffce59f68a8a57",
"assets/assets/elixir.png": "81f297a1fcf343af13808b1f16a4f82e",
"canvaskit/skwasm.js": "8060d46e9a4901ca9991edd3a26be4f0",
"canvaskit/skwasm_heavy.js": "740d43a6b8240ef9e23eed8c48840da4",
"canvaskit/skwasm.js.symbols": "3a4aadf4e8141f284bd524976b1d6bdc",
"canvaskit/canvaskit.js.symbols": "a3c9f77715b642d0437d9c275caba91e",
"canvaskit/skwasm_heavy.js.symbols": "0755b4fb399918388d71b59ad390b055",
"canvaskit/skwasm.wasm": "7e5f3afdd3b0747a1fd4517cea239898",
"canvaskit/chromium/canvaskit.js.symbols": "e2d09f0e434bc118bf67dae526737d07",
"canvaskit/chromium/canvaskit.js": "a80c765aaa8af8645c9fb1aae53f9abf",
"canvaskit/chromium/canvaskit.wasm": "a726e3f75a84fcdf495a15817c63a35d",
"canvaskit/canvaskit.js": "8331fe38e66b3a898c4f37648aaf7ee2",
"canvaskit/canvaskit.wasm": "9b6a7830bf26959b200594729d73538e",
"canvaskit/skwasm_heavy.wasm": "b0be7910760d205ea4e011458df6ee01"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
