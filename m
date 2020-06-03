Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09A0F1ECCDD
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jun 2020 11:44:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726482AbgFCJol (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Jun 2020 05:44:41 -0400
Received: from smtp2207-205.mail.aliyun.com ([121.197.207.205]:42018 "EHLO
        smtp2207-205.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725854AbgFCJok (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Jun 2020 05:44:40 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.1363638|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.0250509-0.000374926-0.974574;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03312;MF=frank@allwinnertech.com;NM=1;PH=DW;RN=14;RT=14;SR=0;TI=W4_5899425_DEFAULT_0AC2668F_1591177476445_o7001c856;
Received: from WS-web (frank@allwinnertech.com[W4_5899425_DEFAULT_0AC2668F_1591177476445_o7001c856]) by e01l07394.eu6 at Wed, 03 Jun 2020 17:44:36 +0800
Date:   Wed, 03 Jun 2020 17:44:36 +0800
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
Message-ID: <8c7a8eeb-f4ea-4df7-b381-5aeab6dd170a.frank@allwinnertech.com>
Subject: =?UTF-8?B?5Zue5aSN77yaW1BBVENIIDIvNF0gcGluY3RybDogc3VueGk6IGFkZCBzdXBwb3J0IGZvciB0?=
  =?UTF-8?B?aGUgQWxsd2lubmVyIEExMDAgcGluIGNvbnRyb2xsZXI=?=
X-Mailer: [Alimail-Mailagent revision 4][W4_5899425][DEFAULT][Chrome]
MIME-Version: 1.0
References: <20200522030743.10204-1-frank@allwinnertech.com> <20200522030743.10204-3-frank@allwinnertech.com>,<20200522152803.twvfvuhd6ztunvll@gilmour.lan>
In-Reply-To: <20200522152803.twvfvuhd6ztunvll@gilmour.lan>
x-aliyun-mail-creator: W4_5899425_DEFAULT_LjMTW96aWxsYS81LjAgKFdpbmRvd3MgTlQgMTAuMDsgV2luNjQ7IHg2NCkgQXBwbGVXZWJLaXQvNTM3LjM2IChLSFRNTCwgbGlrZSBHZWNrbykgQ2hyb21lLzU2LjAuMjkyNC44NyBTYWZhcmkvNTM3LjM2TM
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Pj4gKyBTVU5YSV9QSU4oU1VOWElfUElOQ1RSTF9QSU4oRiwgMCksCj4+ICsgIFNVTlhJX0ZVTkNU
SU9OKDB4MCwgImdwaW9faW4iKSwKPj4gKyAgU1VOWElfRlVOQ1RJT04oMHgxLCAiZ3Bpb19vdXQi
KSwKPj4gKyAgU1VOWElfRlVOQ1RJT04oMHgyLCAibW1jMCIpLCAgLyogRDEgKi8KPj4gKyAgU1VO
WElfRlVOQ1RJT04oMHgzLCAianRhZyIpLCAgLyogTVMxICovCj4+ICsgIFNVTlhJX0ZVTkNUSU9O
KDB4NCwgImp0YWciKSwgIC8qIE1TX0dQVSAqLwo+Cj5XZSBzaG91bGQgdXNlIGFub3RoZXIgbmFt
ZSBoZXJlLCBzaW5jZSB0aGUgY29kZSB3aWxsIGp1c3QgcGljayB0aGUgZmlyc3Qgb25lIGFuZAo+
aWdub3JlIHRoZSBzZWNvbmQuIFdoYXQgYWJvdXQganRhZy1ncHU/CgpUaGUgdW5kZXJzY29yZXMg
YXJlIHVzZWQgaW4gZnJvbnQsIHNvIGNoYW5naW5nIGl0IHRvIGp0YWdfZ3B1IG1heSBiZSBtb3Jl
IGNvbnNpc3RlbnQuCgo+PiArIFNVTlhJX1BJTihTVU5YSV9QSU5DVFJMX1BJTihCLCA3KSwKPj4g
KyAgU1VOWElfRlVOQ1RJT04oMHgwLCAiZ3Bpb19pbiIpLAo+PiArICBTVU5YSV9GVU5DVElPTigw
eDEsICJncGlvX291dCIpLAo+PiArICBTVU5YSV9GVU5DVElPTigweDIsICJzcGRpZiIpLCAgLyog
RElOICovCj4+ICsgIFNVTlhJX0ZVTkNUSU9OKDB4MywgImkyczAiKSwgIC8qIERPVVQwICovCj4+
ICsgIFNVTlhJX0ZVTkNUSU9OKDB4NCwgImkyczAiKSwgIC8qIERJTjEgKi8KPgo+SSBndWVzcyB0
aGUgc2Vjb25kIG9uZSB3b3VsZCBiZSBpMnMxPwoKTm8sIGVhY2ggaTJzIG1heSBoYXZlIG1hbnkg
aW5wdXRzIGFuZCBvdXRwdXRzLiAKCiBTVU5YSV9QSU4oU1VOWElfUElOQ1RSTF9QSU4oSCwgMTkp
LAogICAgIFNVTlhJX0ZVTkNUSU9OKDB4MCwgImdwaW9faW4iKSwKICAgICAgICAgICAgICBTVU5Y
SV9GVU5DVElPTigweDEsICJncGlvX291dCIpLAogICAgICAgICAgICAgIFNVTlhJX0ZVTkNUSU9O
KDB4MiwgImNpcjAiKSwgICAgICAgICAgLyogSU4gKi8KICAgICAgICAgICAgICBTVU5YSV9GVU5D
VElPTigweDMsICJpMnMzX2RvdXQzIiksICAgICAgIC8qIERPVVQzICovCiAgICAgICAgICAgICAg
U1VOWElfRlVOQ1RJT04oMHg0LCAiaTJzM19kaW4zIiksICAgICAgIC8qIERJTjMgKi8KICAgICAg
ICAgICAgICBTVU5YSV9GVU5DVElPTigweDUsICJsZWRjIiksCiAgICAgICAgICAgICAgU1VOWElf
RlVOQ1RJT05fSVJRX0JBTksoMHg2LCA2LCAxOSkpLAoKQ29uc2lkZXJpbmcgdGhhdCB0aGUgc2Ft
ZSBwaW4gaGFzIG11bHRpcGxlIHNhbWUgZnVuY3Rpb25zLCAKc28gYWRkIGEgc3VmZml4LCBsaWtl
IGkyczNfZG91dDMgYW5kIGkyczNfZGluMz8gICAKCk9yIHNwZWNpZnkgbXV4c2VsIGluIHRoZSBk
ZXZpY2UgdHJlZSBtYXkgYmUgYW5vdGhlciBzb2x1dGlvbi4KCj4+ICsgU1VOWElfUElOKFNVTlhJ
X1BJTkNUUkxfUElOKEgsIDIpLAo+PiArICBTVU5YSV9GVU5DVElPTigweDAsICJncGlvX2luIiks
Cj4+ICsgIFNVTlhJX0ZVTkNUSU9OKDB4MSwgImdwaW9fb3V0IiksCj4+ICsgIFNVTlhJX0ZVTkNU
SU9OKDB4MiwgImkyYzEiKSwgIC8qIFNDSyAqLwo+PiArICBTVU5YSV9GVU5DVElPTigweDMsICJj
cHUiKSwgIC8qIENVUl9XICovCj4KPldoYXQgaXMgImNwdSIgc3VwcG9zZWQgdG8gYmU/CgpBcyBm
YXIgYXMgSSBrbm93LCB0aGlzIGlzIGEgZnVuY3Rpb24gdGhhdCBoYXMgbmV2ZXIgYmVlbiB1c2Vk
LgpUaGUgaGFyZHdhcmUgZ3V5IHNhaWQgdGhhdCBpdCBjYW4gYmUgdXNlZCB0byBjb250cm9sIHRo
ZSBDUFUgdG8gcmVkdWNlIHRoZSBjdXJyZW50LgoKVGh4LApZYW5ndGFv
