Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B988930498B
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Jan 2021 21:06:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730057AbhAZF1K (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Jan 2021 00:27:10 -0500
Received: from out28-148.mail.aliyun.com ([115.124.28.148]:59085 "EHLO
        out28-148.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727481AbhAZCdj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 Jan 2021 21:33:39 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.1040655|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.0226422-0.00566553-0.971692;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047188;MF=liu.xiang@zlingsmart.com;NM=1;PH=DW;RN=8;RT=8;SR=0;TI=W4_6085603_DEFAULT_0A9326FC_1611628298842_o7001c387u;
Received: from WS-web (liu.xiang@zlingsmart.com[W4_6085603_DEFAULT_0A9326FC_1611628298842_o7001c387u]) by ay29a011140100199.et135 at Tue, 26 Jan 2021 10:32:49 +0800
Date:   Tue, 26 Jan 2021 10:32:49 +0800
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
Message-ID: <cc667d1a-3c8e-4481-980d-20efe0faeced.liu.xiang@zlingsmart.com>
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

LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCgo+IE9uIFRodSwgSmFuIDIxLCAyMDIxIGF0IDU6NDAgUE0gTWF4aW1lIFJpcGFy
ZCA8bWF4aW1lQGNlcm5vLnRlY2g+IHdyb3RlOgo+IE9uIFR1ZSwgSmFuIDE5LCAyMDIxIGF0IDAy
OjI5OjA4UE0gKzA4MDAsIExpdSBYaWFuZyB3cm90ZToKPiA+IFdoZW4gQ09ORklHX1JFR1VMQVRP
UiBpcyBub3Qgc2V0LCBzdW54aV9wbXhfcmVxdWVzdCgpIGFsd2F5cyByZXR1cm4KPiA+IHN1Y2Nl
c3MuIEV2ZW4gYSBncm91cCBvZiBwaW5zIGNhbGwgc3VueGlfcG14X3JlcXVlc3QoKSwgdGhlIHJl
ZmNvdW50Cj4gPiBpcyBvbmx5IDEuIFRoaXMgY2FuIGNhdXNlIGEgdXNlLWFmdGVyLWZyZWUgd2Fy
bmluZyBpbiBzdW54aV9wbXhfZnJlZSgpLgo+ID4gVG8gc29sdmUgdGhpcyBwcm9ibGVtLCBnbyB0
byBlcnIgcGF0aCBpZiByZWd1bGF0b3JfZ2V0KCkgcmV0dXJuIE5VTEwKPiA+IG9yIGVycm9yLgo+
ID4KPiA+IFNpZ25lZC1vZmYtYnk6IExpdSBYaWFuZyA8bGl1LnhpYW5nQHpsaW5nc21hcnQuY29t
Pgo+Cj4gSXMgdGhlcmUgYW55IGRyYXdiYWNrIHRvIGRlcGVuZGluZyBvbiBDT05GSUdfUkVHVUxB
VE9SPwo+Cj4gR2l2ZW4gdGhhdCB3ZSBuZWVkIHRob3NlIHJlZ3VsYXRvcnMgZW5hYmxlZCBhbnl3
YXksIEkgZ3Vlc3Mgd2UgY291bGQKPiBqdXN0IHNlbGVjdCBvciBkZXBlbmRzIG9uIGl0Cj4KPiBJ
IGFncmVlLgo+Cj4gTGl1IGNhbiB5b3UgbWFrZSBhIHBhdGNoIHRvIEtjb25maWcgdG8ganVzdCBz
ZWxlY3QgUkVHVUxBVE9SPwo+IFBvc3NpYmx5IGV2ZW4gdGhlIHNwZWNpZmljIHJlZ3VsYXRvciBk
cml2ZXIgdGhpcyBTb0MgaXMgdXNpbmcKPiBpZiBpdCBpcyB2ZXJ5IHNwZWNpZmljIGZvciB0aGlz
IHB1cnBvc2UuCj4KPiBZb3VycywKPiBMaW51cyBXYWxsZWlqCgpTdXJlLiBJIHdpbGwgc2VuZCBh
IG5ldyBwYXRjaC4KCllvdXJzLApMaXUgWGlhbmc=
