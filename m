Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C24E1ECCC7
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jun 2020 11:42:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726693AbgFCJmc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Jun 2020 05:42:32 -0400
Received: from smtp2207-205.mail.aliyun.com ([121.197.207.205]:38821 "EHLO
        smtp2207-205.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725854AbgFCJmc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Jun 2020 05:42:32 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.2710627|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.65995-0.00341976-0.33663;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03302;MF=frank@allwinnertech.com;NM=1;PH=DW;RN=14;RT=14;SR=0;TI=W4_5899425_DEFAULT_0A9326FD_1591177348188_o7001c552e;
Received: from WS-web (frank@allwinnertech.com[W4_5899425_DEFAULT_0A9326FD_1591177348188_o7001c552e]) by e02c03276.eu6 at Wed, 03 Jun 2020 17:42:28 +0800
Date:   Wed, 03 Jun 2020 17:42:28 +0800
From:   "=?UTF-8?B?5p2O5oms6Z+s?=" <frank@allwinnertech.com>
To:     "Maxime Ripard" <maxime@cerno.tech>
Cc:     "wens" <wens@csie.org>, "robh+dt" <robh+dt@kernel.org>,
        "mturquette" <mturquette@baylibre.com>, "sboyd" <sboyd@kernel.org>,
        "linus.walleij" <linus.walleij@linaro.org>,
        "p.zabel" <p.zabel@pengutronix.de>,
        "=?UTF-8?B?6buE54OB55Sf?=" <huangshuosheng@allwinnertech.com>,
        "tiny.windzz" <tiny.windzz@gmail.com>,
        "linux-arm-kernel" <linux-arm-kernel@lists.infradead.org>,
        "devicetree" <devicetree@vger.kernel.org>,
        "linux-kernel" <linux-kernel@vger.kernel.org>,
        "linux-clk" <linux-clk@vger.kernel.org>,
        "linux-gpio" <linux-gpio@vger.kernel.org>
Reply-To: "=?UTF-8?B?5p2O5oms6Z+s?=" <frank@allwinnertech.com>
Message-ID: <d7d6ee84-bfbb-4fef-9ed8-1f7045494594.frank@allwinnertech.com>
Subject: =?UTF-8?B?5Zue5aSN77yaW1BBVENIIDEvNF0gY2xrOiBzdW54aS1uZzogYWRkIHN1cHBvcnQgZm9yIHRo?=
  =?UTF-8?B?ZSBBbGx3aW5uZXIgQTEwMCBDQ1U=?=
X-Mailer: [Alimail-Mailagent revision 4][W4_5899425][DEFAULT][Chrome]
MIME-Version: 1.0
References: <20200522030743.10204-1-frank@allwinnertech.com> <20200522030743.10204-2-frank@allwinnertech.com>,<20200522151403.7ovbdza2o3cjrb7a@gilmour.lan>
In-Reply-To: <20200522151403.7ovbdza2o3cjrb7a@gilmour.lan>
x-aliyun-mail-creator: W4_5899425_DEFAULT_LjMTW96aWxsYS81LjAgKFdpbmRvd3MgTlQgMTAuMDsgV2luNjQ7IHg2NCkgQXBwbGVXZWJLaXQvNTM3LjM2IChLSFRNTCwgbGlrZSBHZWNrbykgQ2hyb21lLzU2LjAuMjkyNC44NyBTYWZhcmkvNTM3LjM2TM
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Pj4gKyAvKiBFbmFibGUgdGhlIGxvY2sgYml0cyBvbiBhbGwgUExMcyAqLwo+PiArIGZvciAoaSA9
IDA7IGkgPCBBUlJBWV9TSVpFKHBsbF9yZWdzKTsgaSsrKSB7Cj4+ICsgIHZhbCA9IHJlYWRsKHJl
ZyArIHBsbF9yZWdzW2ldKTsKPj4gKyAgdmFsIHw9IEJJVCgyOSk7Cj4KPkhhdmluZyBhIGRlZmlu
ZSBmb3IgdGhhdCB3b3VsZCBiZSBuaWNlIGhlcmUKPgo+PiArICB3cml0ZWwodmFsLCByZWcgKyBw
bGxfcmVnc1tpXSk7Cj4+ICsgfQo+PiArCj4+ICsgLyoKPj4gKyAgKiBJbiBvcmRlciB0byBwYXNz
IHRoZSBFTUkgY2VydGlmaWNhdGlvbiwgdGhlIFNETSBmdW5jdGlvbiBvZgo+PiArICAqIHRoZSBw
ZXJpcGhlcmFsIDEgYnVzIGlzIGVuYWJsZWQsIGFuZCB0aGUgZnJlcXVlbmN5IGlzIHN0aWxsCj4+
ICsgICogY2FsY3VsYXRlZCB1c2luZyB0aGUgcHJldmlvdXMgZGl2aXNpb24gZmFjdG9yLgo+PiAr
ICAqLwo+PiArIHdyaXRlbCgweGQxMzAzMzMzLCByZWcgKyBTVU41MElfQTEwMF9QTExfUEVSSVBI
MV9QQVRURVJOMF9SRUcpOwo+Cj5TYW1lIGhlcmUKCkhhdmluZyBhIGRlZmluZT8gSSBkb27igJl0
IHF1aXRlIHVuZGVyc3RhbmQgd2hhdCB5b3UgbWVhbiwgCmNhbiB5b3UgZ2l2ZSBtZSBhbiBleGFt
cGxlPwoKTUJSLApZYW5ndGFv
