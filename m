Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C65742FFC77
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Jan 2021 07:16:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726160AbhAVGQf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Jan 2021 01:16:35 -0500
Received: from out28-75.mail.aliyun.com ([115.124.28.75]:37392 "EHLO
        out28-75.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726175AbhAVGQd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Jan 2021 01:16:33 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.1835507|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_enroll_verification|0.0327216-0.000828416-0.96645;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047198;MF=liu.xiang@zlingsmart.com;NM=1;PH=DW;RN=8;RT=8;SR=0;TI=W4_6085603_DEFAULT_0AC266AA_1611285509314_o7001c272f;
Received: from WS-web (liu.xiang@zlingsmart.com[W4_6085603_DEFAULT_0AC266AA_1611285509314_o7001c272f]) by ay29a011140100187.et135 at Fri, 22 Jan 2021 14:15:36 +0800
Date:   Fri, 22 Jan 2021 14:15:36 +0800
From:   "liu xiang" <liu.xiang@zlingsmart.com>
To:     "Maxime Ripard" <maxime@cerno.tech>
Cc:     "linux-gpio" <linux-gpio@vger.kernel.org>,
        "linus.walleij" <linus.walleij@linaro.org>, "wens" <wens@csie.org>,
        "jernej.skrabec" <jernej.skrabec@siol.net>,
        "linux-arm-kernel" <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel" <linux-kernel@vger.kernel.org>,
        "liuxiang_1999" <liuxiang_1999@126.com>
Reply-To: "liu xiang" <liu.xiang@zlingsmart.com>
Message-ID: <7c97264c-8d54-427d-8453-6fd1085c36d3.liu.xiang@zlingsmart.com>
Subject: =?UTF-8?B?UmU6IFtQQVRDSF0gcGluY3RybDogc3VueGk6IGZpeCB1c2UtYWZ0ZXItZnJlZSBpbiBzdW54?=
  =?UTF-8?B?aV9wbXhfZnJlZSgp?=
X-Mailer: [Alimail-Mailagent revision 794][W4_6085603][DEFAULT][Chrome]
MIME-Version: 1.0
References: <20210119062908.20169-1-liu.xiang@zlingsmart.com>,<20210121164013.cqfxvach4ugkohm7@gilmour>
x-aliyun-mail-creator: W4_6085603_DEFAULT_AoSTW96aWxsYS81LjAgKFdpbmRvd3MgTlQgMTAuMDsgV09XNjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS83NS4wLjM3NzAuMTAwIFNhZmFyaS81MzcuMzY=zN
In-Reply-To: <20210121164013.cqfxvach4ugkohm7@gilmour>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

PiBIaSwKCj4gT24gVHVlLCBKYW4gMTksIDIwMjEgYXQgMDI6Mjk6MDhQTSArMDgwMCwgTGl1IFhp
YW5nIHdyb3RlOgo+IFdoZW4gQ09ORklHX1JFR1VMQVRPUiBpcyBub3Qgc2V0LCBzdW54aV9wbXhf
cmVxdWVzdCgpIGFsd2F5cyByZXR1cm4KPiBzdWNjZXNzLiBFdmVuIGEgZ3JvdXAgb2YgcGlucyBj
YWxsIHN1bnhpX3BteF9yZXF1ZXN0KCksIHRoZSByZWZjb3VudAo+IGlzIG9ubHkgMS4gVGhpcyBj
YW4gY2F1c2UgYSB1c2UtYWZ0ZXItZnJlZSB3YXJuaW5nIGluIHN1bnhpX3BteF9mcmVlKCkuCj4g
VG8gc29sdmUgdGhpcyBwcm9ibGVtLCBnbyB0byBlcnIgcGF0aCBpZiByZWd1bGF0b3JfZ2V0KCkg
cmV0dXJuIE5VTEwKPiBvciBlcnJvci4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBMaXUgWGlhbmcgPGxp
dS54aWFuZ0B6bGluZ3NtYXJ0LmNvbT4KCj4gSXMgdGhlcmUgYW55IGRyYXdiYWNrIHRvIGRlcGVu
ZGluZyBvbiBDT05GSUdfUkVHVUxBVE9SPwoKPiBHaXZlbiB0aGF0IHdlIG5lZWQgdGhvc2UgcmVn
dWxhdG9ycyBlbmFibGVkIGFueXdheSwgSSBndWVzcyB3ZSBjb3VsZAo+IGp1c3Qgc2VsZWN0IG9y
IGRlcGVuZHMgb24gaXQKPgo+IE1heGltZQoKClllcywgSSB0aGluayBzby4gQnV0IENPTkZJR19S
RUdVTEFUT1IgaXMgbm90IGVuYWJsZWQgYnkgZGVmYXVsdCBub3cuClNvIEkgY2FuIGZpbmQgdGhp
cyBwcm9ibGVtIGR1cmluZyBzdGFydHVwLg==
