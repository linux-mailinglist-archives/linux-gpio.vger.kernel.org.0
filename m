Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3118304690
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Jan 2021 19:39:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391473AbhAZRWb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Jan 2021 12:22:31 -0500
Received: from out28-74.mail.aliyun.com ([115.124.28.74]:53738 "EHLO
        out28-74.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731585AbhAZGdN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Jan 2021 01:33:13 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.09914935|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.044853-0.0191849-0.935962;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047203;MF=liu.xiang@zlingsmart.com;NM=1;PH=DW;RN=8;RT=8;SR=0;TI=W4_6085603_DEFAULT_0AC2669D_1611642513078_o7001c447c;
Received: from WS-web (liu.xiang@zlingsmart.com[W4_6085603_DEFAULT_0AC2669D_1611642513078_o7001c447c]) by ay29a011140100061.et135 at Tue, 26 Jan 2021 14:31:55 +0800
Date:   Tue, 26 Jan 2021 14:31:55 +0800
From:   "liu xiang" <liu.xiang@zlingsmart.com>
To:     "Maxime Ripard" <maxime@cerno.tech>,
        "Linus Walleij" <linus.walleij@linaro.org>
Cc:     "=?UTF-8?B?b3BlbiBsaXN0OkdQSU8gU1VCU1lTVEVN?=" 
        <linux-gpio@vger.kernel.org>, "Chen-Yu Tsai" <wens@csie.org>,
        "Jernej Skrabec" <jernej.skrabec@siol.net>,
        "Linux ARM" <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "liuxiang_1999" <liuxiang_1999@126.com>
Reply-To: "liu xiang" <liu.xiang@zlingsmart.com>
Message-ID: <5c4b7a8c-c549-43ae-8ec6-5ae3ed26d321.liu.xiang@zlingsmart.com>
Subject: =?UTF-8?B?UmU6IFtQQVRDSF0gcGluY3RybDogc3VueGk6IGZpeCB1c2UtYWZ0ZXItZnJlZSBpbiBzdW54?=
  =?UTF-8?B?aV9wbXhfZnJlZSgp?=
X-Mailer: [Alimail-Mailagent revision 794][W4_6085603][DEFAULT][Chrome]
MIME-Version: 1.0
References: <20210119062908.20169-1-liu.xiang@zlingsmart.com> <20210121164013.cqfxvach4ugkohm7@gilmour>,<CACRpkdb1gn2e9=ip6ipAwW27vmf1FCs_y1Z=w-K8y8Z9MXVBMw@mail.gmail.com>
x-aliyun-mail-creator: W4_6085603_DEFAULT_AoSTW96aWxsYS81LjAgKFdpbmRvd3MgTlQgMTAuMDsgV09XNjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS83NS4wLjM3NzAuMTAwIFNhZmFyaS81MzcuMzY=zN
In-Reply-To: <CACRpkdb1gn2e9=ip6ipAwW27vmf1FCs_y1Z=w-K8y8Z9MXVBMw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

PiBPbiBUaHUsIEphbiAyMSwgMjAyMSBhdCA1OjQwIFBNIE1heGltZSBSaXBhcmQgPG1heGltZUBj
ZXJuby50ZWNoPiB3cm90ZToKPiBPbiBUdWUsIEphbiAxOSwgMjAyMSBhdCAwMjoyOTowOFBNICsw
ODAwLCBMaXUgWGlhbmcgd3JvdGU6Cj4gPiBXaGVuIENPTkZJR19SRUdVTEFUT1IgaXMgbm90IHNl
dCwgc3VueGlfcG14X3JlcXVlc3QoKSBhbHdheXMgcmV0dXJuCj4gPiBzdWNjZXNzLiBFdmVuIGEg
Z3JvdXAgb2YgcGlucyBjYWxsIHN1bnhpX3BteF9yZXF1ZXN0KCksIHRoZSByZWZjb3VudAo+ID4g
aXMgb25seSAxLiBUaGlzIGNhbiBjYXVzZSBhIHVzZS1hZnRlci1mcmVlIHdhcm5pbmcgaW4gc3Vu
eGlfcG14X2ZyZWUoKS4KPiA+IFRvIHNvbHZlIHRoaXMgcHJvYmxlbSwgZ28gdG8gZXJyIHBhdGgg
aWYgcmVndWxhdG9yX2dldCgpIHJldHVybiBOVUxMCj4gPiBvciBlcnJvci4KPiA+Cj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBMaXUgWGlhbmcgPGxpdS54aWFuZ0B6bGluZ3NtYXJ0LmNvbT4KPgo+IElzIHRo
ZXJlIGFueSBkcmF3YmFjayB0byBkZXBlbmRpbmcgb24gQ09ORklHX1JFR1VMQVRPUj8KPgo+IEdp
dmVuIHRoYXQgd2UgbmVlZCB0aG9zZSByZWd1bGF0b3JzIGVuYWJsZWQgYW55d2F5LCBJIGd1ZXNz
IHdlIGNvdWxkCj4ganVzdCBzZWxlY3Qgb3IgZGVwZW5kcyBvbiBpdAo+IAo+IEkgYWdyZWUuCj4g
Cj4gTGl1IGNhbiB5b3UgbWFrZSBhIHBhdGNoIHRvIEtjb25maWcgdG8ganVzdCBzZWxlY3QgUkVH
VUxBVE9SPwo+IFBvc3NpYmx5IGV2ZW4gdGhlIHNwZWNpZmljIHJlZ3VsYXRvciBkcml2ZXIgdGhp
cyBTb0MgaXMgdXNpbmcKPiBpZiBpdCBpcyB2ZXJ5IHNwZWNpZmljIGZvciB0aGlzIHB1cnBvc2Uu
Cj4gCj4gWW91cnMsCj4gTGludXMgV2FsbGVpagoKSSBmb3VuZCB0aGF0IHRoZSByZWd1bGF0b3Ig
ZHJpdmVyIGlzIHJlbGF0ZWQgdG8gdGhlIHNwZWNpZmljIGJvYXJkLCBub3QgdGhlIFNvQy4KVGhl
cmUgaXMgbm8gYm9hcmQgY29uZmlnIGZvciBBUk02NCBTb0MgbGlrZSBBUk0uCklzIGEgZ29vZCBp
ZGVhIHRvIHNlbGVjdCB0aGUgcmVndWxhdG9yIGRyaXZlciBpbiB0aGUgcGluY3RybCBLb25maWc/
IE9yIGp1c3QgCnNlbGVjdCBDT05GSUdfUkVHVUxBVE9SX0ZJWEVEX1ZPTFRBR0UgdG8gYXZvaWQg
dGhlIHVzZS1hZnRlci1mcmVlIHdhcm5pbmc/
