Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FEDC7CD2B1
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Oct 2023 05:34:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229462AbjJRDep (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Oct 2023 23:34:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbjJRDeo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Oct 2023 23:34:44 -0400
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2393CBA
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 20:34:41 -0700 (PDT)
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 39I3IE4N0949451, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
        by rtits2.realtek.com.tw (8.15.2/2.93/5.92) with ESMTPS id 39I3IE4N0949451
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 18 Oct 2023 11:18:14 +0800
Received: from RTEXMBS02.realtek.com.tw (172.21.6.95) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32; Wed, 18 Oct 2023 11:18:14 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXMBS02.realtek.com.tw (172.21.6.95) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Wed, 18 Oct 2023 11:18:13 +0800
Received: from RTEXMBS04.realtek.com.tw ([fe80::40c2:6c24:2df4:e6c7]) by
 RTEXMBS04.realtek.com.tw ([fe80::40c2:6c24:2df4:e6c7%5]) with mapi id
 15.01.2375.007; Wed, 18 Oct 2023 11:18:13 +0800
From:   =?utf-8?B?VFlfQ2hhbmdb5by15a2Q6YC4XQ==?= <tychang@realtek.com>
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "kernel test robot" <lkp@intel.com>
Subject: RE: [linusw-pinctrl:devel] BUILD SUCCESS WITH WARNING e8b4ff6a856d02ee64a6023edf45e11827badeef
Thread-Topic: [linusw-pinctrl:devel] BUILD SUCCESS WITH WARNING
 e8b4ff6a856d02ee64a6023edf45e11827badeef
Thread-Index: AQHZ8s10QdVP7VLHLUecGKXaUHnqJbBO9f+g
Date:   Wed, 18 Oct 2023 03:18:13 +0000
Message-ID: <97c8604460d34011b87eeb6b302a6b49@realtek.com>
References: <202309291530.qDP0N7ET-lkp@intel.com>
 <CACRpkda4SYP5twcxDGA_k4VzV0mh1Q190SZT0u7xqZykrPt=VA@mail.gmail.com>
In-Reply-To: <CACRpkda4SYP5twcxDGA_k4VzV0mh1Q190SZT0u7xqZykrPt=VA@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-originating-ip: [172.21.181.166]
x-kse-serverinfo: RTEXMBS02.realtek.com.tw, 9
x-kse-antispam-interceptor-info: fallback
x-kse-antivirus-interceptor-info: fallback
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-ServerInfo: RTEXH36505.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQpIaSBMaW51cywNCg0KU29ycnkgZm9yIHRoZSBkZWxheWVkIHJlc3BvbnNlLiBJIHdhcyBvdXQg
b2YgdGhlIG9mZmljZSBpbiB0aGUgcGFzdCBmZXcgd2Vla3MuDQoNCj4NCj5UenV5aSwgY2FuIHlv
dSBsb29rIGF0IHRoaXMsIEkgdW5kZXJzdGFuZCBzb21lIG9mIHRoZSB3YXJuaW5ncyBidXQgbm90
IGFsbCwgYW5kIEkgbmVlZA0KPkhXIGtub3dsZWRnZSB0byBmaXggdGhlIGNvbXBpbGUgd2Fybmlu
Z3M6DQo+DQo+T24gRnJpLCBTZXAgMjksIDIwMjMgYXQgMTA6MDTigK9BTSBrZXJuZWwgdGVzdCBy
b2JvdCA8bGtwQGludGVsLmNvbT4gd3JvdGU6DQo+DQo+DQo+PiBkcml2ZXJzL3BpbmN0cmwvcmVh
bHRlay9waW5jdHJsLXJ0ZC5jOjE4MDoyOTogd2FybmluZzogJyVzJyBkaXJlY3RpdmUNCj4+IGFy
Z3VtZW50IGlzIG51bGwgWy1XZm9ybWF0LW92ZXJmbG93PV0NCj4NCj5JIGRvbid0IHVuZGVyc3Rh
bmQgdGhpcyBhdCBhbGwuDQo+DQo+PiBkcml2ZXJzL3BpbmN0cmwvcmVhbHRlay9waW5jdHJsLXJ0
ZDEzMTVlLmM6MjMxOjM1OiB3YXJuaW5nOg0KPj4gJ3J0ZDEzMTVlX2Jvb3Rfc2VsX3BpbnMnIGRl
ZmluZWQgYnV0IG5vdCB1c2VkDQo+PiBbLVd1bnVzZWQtY29uc3QtdmFyaWFibGU9XQ0KPj4gZHJp
dmVycy9waW5jdHJsL3JlYWx0ZWsvcGluY3RybC1ydGQxMzE1ZS5jOjIzMTozNTogd2FybmluZzoN
Cj4+ICdydGQxMzE1ZV9yZXNldF9uX3BpbnMnIGRlZmluZWQgYnV0IG5vdCB1c2VkDQo+PiBbLVd1
bnVzZWQtY29uc3QtdmFyaWFibGU9XQ0KPj4gZHJpdmVycy9waW5jdHJsL3JlYWx0ZWsvcGluY3Ry
bC1ydGQxMzE1ZS5jOjIzMTozNTogd2FybmluZzoNCj4+ICdydGQxMzE1ZV9zY2FuX3N3aXRjaF9w
aW5zJyBkZWZpbmVkIGJ1dCBub3QgdXNlZA0KPj4gWy1XdW51c2VkLWNvbnN0LXZhcmlhYmxlPV0N
Cj4+IGRyaXZlcnMvcGluY3RybC9yZWFsdGVrL3BpbmN0cmwtcnRkMTMxNWUuYzoyMzE6MzU6IHdh
cm5pbmc6DQo+PiAncnRkMTMxNWVfdGVzdG1vZGVfcGlucycgZGVmaW5lZCBidXQgbm90IHVzZWQN
Cj4+IFstV3VudXNlZC1jb25zdC12YXJpYWJsZT1dDQo+PiBkcml2ZXJzL3BpbmN0cmwvcmVhbHRl
ay9waW5jdHJsLXJ0ZDEzMTVlLmM6MjMxOjM1OiB3YXJuaW5nOg0KPj4gJ3J0ZDEzMTVlX3dkX3Jz
ZXRfcGlucycgZGVmaW5lZCBidXQgbm90IHVzZWQNCj4+IFstV3VudXNlZC1jb25zdC12YXJpYWJs
ZT1dDQo+PiBkcml2ZXJzL3BpbmN0cmwvcmVhbHRlay9waW5jdHJsLXJ0ZDEzMTlkLmM6MjM3OjM1
OiB3YXJuaW5nOg0KPj4gJ3J0ZDEzMTlkX2Jvb3Rfc2VsX3BpbnMnIGRlZmluZWQgYnV0IG5vdCB1
c2VkDQo+PiBbLVd1bnVzZWQtY29uc3QtdmFyaWFibGU9XQ0KPj4gZHJpdmVycy9waW5jdHJsL3Jl
YWx0ZWsvcGluY3RybC1ydGQxMzE5ZC5jOjIzNzozNTogd2FybmluZzoNCj4+ICdydGQxMzE5ZF9y
ZXNldF9uX3BpbnMnIGRlZmluZWQgYnV0IG5vdCB1c2VkDQo+PiBbLVd1bnVzZWQtY29uc3QtdmFy
aWFibGU9XQ0KPj4gZHJpdmVycy9waW5jdHJsL3JlYWx0ZWsvcGluY3RybC1ydGQxMzE5ZC5jOjIz
NzozNTogd2FybmluZzoNCj4+ICdydGQxMzE5ZF9zY2FuX3N3aXRjaF9waW5zJyBkZWZpbmVkIGJ1
dCBub3QgdXNlZA0KPj4gWy1XdW51c2VkLWNvbnN0LXZhcmlhYmxlPV0NCj4+IGRyaXZlcnMvcGlu
Y3RybC9yZWFsdGVrL3BpbmN0cmwtcnRkMTMxOWQuYzoyMzc6MzU6IHdhcm5pbmc6DQo+PiAncnRk
MTMxOWRfdGVzdG1vZGVfcGlucycgZGVmaW5lZCBidXQgbm90IHVzZWQNCj4+IFstV3VudXNlZC1j
b25zdC12YXJpYWJsZT1dDQo+PiBkcml2ZXJzL3BpbmN0cmwvcmVhbHRlay9waW5jdHJsLXJ0ZDEz
MTlkLmM6MjM3OjM1OiB3YXJuaW5nOg0KPj4gJ3J0ZDEzMTlkX3dkX3JzZXRfcGlucycgZGVmaW5l
ZCBidXQgbm90IHVzZWQNCj4+IFstV3VudXNlZC1jb25zdC12YXJpYWJsZT1dDQo+DQo+VGhlc2Ug
YXBwZWFyIGJlY2F1c2UgdGhlcmUgYXJlIGZvciBleGFtcGxlOg0KPkRFQ0xBUkVfUlREMTMxNUVf
UElOKFJURDEzMTVFX0lTT19CT09UX1NFTCwgYm9vdF9zZWwpOyBCdXQgbm8NCj5jb3JyZXNwb25k
aW5nIFJURDEzMTVFX0dST1VQKCkuDQo+DQo+Q2FuIHlvdSBtYWtlIGEgcGF0Y2ggYWRkaW5nIHRo
ZSBtaXNzaW5nIGdyb3Vwcz8NCj4NCg0KVGhvc2UgcGlucyBhcmUgdGhlIGFjdHVhbCBoYXJkd2Fy
ZSBwaW5zIG9uIHRoZSBjaGlwcywgYnV0IHRoZXkgYXJlIG5vdCBjdXJyZW50bHkgaW4gdXNlLiBJ
IGZvcmdvdCB0byBhZGQgdGhlIGdyb3VwcyBmb3IgdGhlbS4gSSdtIHNvcnJ5IGFib3V0IHRoYXQu
DQpJIHRoaW5rIHRoZSBwYXRjaCB5b3UndmUgYXBwbGllZCBpbiB0aGUgZm9sbG93aW5nIGxpbmsg
aXMgYWxzbyBhIHNvbHV0aW9uLiBUaGFuayB5b3UuDQpodHRwczovL3BhdGNod29yay5vemxhYnMu
b3JnL3Byb2plY3QvbGludXgtZ3Bpby9wYXRjaC8yMDIzMTAwNi1maXgtcmVhbHRlay13YXJuaW5n
cy12MS0xLTA5YWYyNTMzMTJiYUBsaW5hcm8ub3JnLw0KDQpUaGFua3MsDQpUenV5aSBDaGFuZw0K
