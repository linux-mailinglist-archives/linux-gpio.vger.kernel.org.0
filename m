Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13FC4124871
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Dec 2019 14:33:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726945AbfLRNdO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 18 Dec 2019 08:33:14 -0500
Received: from mailgate1.rohmeurope.com ([178.15.145.194]:58044 "EHLO
        mailgate1.rohmeurope.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726735AbfLRNdN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 18 Dec 2019 08:33:13 -0500
X-AuditID: c0a8fbf4-199ff70000001fa6-7b-5dfa2a97b167
Received: from smtp.reu.rohmeu.com (will-cas002.reu.rohmeu.com [192.168.251.178])
        by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id 01.2F.08102.79A2AFD5; Wed, 18 Dec 2019 14:33:11 +0100 (CET)
Received: from WILL-MAIL002.REu.RohmEu.com ([fe80::e0c3:e88c:5f22:d174]) by
 WILL-CAS002.REu.RohmEu.com ([fe80::fc24:4cbc:e287:8659%12]) with mapi id
 14.03.0439.000; Wed, 18 Dec 2019 14:33:05 +0100
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "broonie@kernel.org" <broonie@kernel.org>
CC:     "corbet@lwn.net" <corbet@lwn.net>,
        "phil.edworthy@renesas.com" <phil.edworthy@renesas.com>,
        "dmurphy@ti.com" <dmurphy@ti.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "mchehab+samsung@kernel.org" <mchehab+samsung@kernel.org>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "arnd@arndb.de" <arnd@arndb.de>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "noralf@tronnes.org" <noralf@tronnes.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>,
        "pavel@ucw.cz" <pavel@ucw.cz>
Subject: Re: Applied "regulator: bd71828: Basic support for ROHM bd71828
 PMIC regulators" to the regulator tree
Thread-Topic: Applied "regulator: bd71828: Basic support for ROHM bd71828
 PMIC regulators" to the regulator tree
Thread-Index: AQHVtNcCPO+Kt0OMfE2l+CzrBWADfqe/eY8AgABW2wCAAAR/gA==
Date:   Wed, 18 Dec 2019 13:33:05 +0000
Message-ID: <60906cc2c51c726a8d7f4fbfd31deb72489ceb04.camel@fi.rohmeurope.com>
References: <applied-5b1c4a22c7945e97ff2a7924abfeb3239043f8eb.1576054779.git.matti.vaittinen@fi.rohmeurope.com>
         <de7424126e285d9bbd21a70945415d78203c2ba7.camel@fi.rohmeurope.com>
         <20191218131700.GB42175@sirena.org.uk>
In-Reply-To: <20191218131700.GB42175@sirena.org.uk>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.255.186.46]
Content-Type: text/plain; charset="utf-8"
Content-ID: <4D3FA5736842F04EAD470EBE9F8DE766@de.rohmeurope.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02Tf0wTZxjH895d7w7wtrMivHa6uEs2h0bU6ZI3hhi2ZPGWmc3MbFm2VDzH
        jevsD7iWRbYsYRomBcYAIcTG1smvNVitVtGNYGwqOtepS7UC4pQ0NEwIgYyhUBDcXW8Kf73P
        83yf7/N5/nheGte3UQbaZHWIslUwc2QqEfTOBtY3rp0xbhwZfBG1RO5Q6NBYG4Xm6q5SaNId
        JlBDLE6iePAQQMe6b+pQ5R/ndOhgs59E9zpOE2jg0RWAHkfLMVT/5GcM/VP1QIeOf99CoLPH
        ngB0u/MoiTpGTwF09USURK29EQwdbb1GoPEJJ4Yi4XdQQ3iMQvfDV0h0MNKHo7KL3RSa7zlD
        oOqb23NX8T6PD/CzM3WAH+8ro3iP7xv+V9d9ig+0O0n+r54ukr/k9lF8c/VhHf/4ei3BDx33
        E/xvfRcwvtGTwHh/VTfgvSemKP7fwMs72U/TcvYKjq92mQqsG7btSZNuPP0RK6yh909PnwSl
        YJKqACk0ZLfAvuAEWQFSaT17B8ByTwOlJdcAbJw+qSQ0TbI5sOJu0pDOrocNM81JA85G02BT
        9DCuCsvYIvjD2TCuNcmwf26Y0OK34W3PIKHOIdhXYfvpHLXMsO/DA74I0FgDALo7R3WqkMJu
        hv1tdUkYYFdBZ+kYpsY4mwkDQ1M6bWsWtnT9iWvxcjg8OP9/nYMXE7EkC2ezoL9zg2bNhaNn
        xnEtfgXWV8YobYel8PcjcaIGZLgWEVwLbtcit2uR27XI/RPQtQNoEUzmAsEhbsqWxeJs2SZZ
        lOdzmyUAtLub/AU8Db0bAhgNQmAFjXHLGU5KGPUv7LXll0iCXcqTi82iPQQgjXPpzL1yRWPy
        hZKvRdn2THqJJrhMZk2s1qhnVdY+USwU5WfqSprmIFP/+oxRv1QWC8T9X5jMjgUZo1PU4amG
        dLtozRdlodgh5an3kWdXDkSVlijch6qdsRcKFqWqWcNgHV0z7G7C6W53axOuJ6w2q2jIZJjX
        lFZWbZWKrc9BIyCTBtwy5nKWoi5RPt/zOSMKAlMQdFYS4RAWJEMpyPe7gh+sTv8sr3Br9se2
        +IG5pqH6T8zBjJKp2iMfTmz7aF124u9dlaa7CL25h/zSd+FyRny7rac/ZfNq83vznt27nVtb
        Z3fs3HGeJApiFqvzEmGAiY7eN7xEyfm3Ho70DnRFT50rGm3bOBi6Vb2yrIozr4gYvVsk7yN7
        0Xffrsl9wBF2Sdi0Fpftwn8xKXZtOQQAAA==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQpPbiBXZWQsIDIwMTktMTItMTggYXQgMTM6MTcgKzAwMDAsIE1hcmsgQnJvd24gd3JvdGU6DQo+
IE9uIFdlZCwgRGVjIDE4LCAyMDE5IGF0IDA4OjA2OjA0QU0gKzAwMDAsIFZhaXR0aW5lbiwgTWF0
dGkgd3JvdGU6DQo+IA0KPiA+IEkgdGhpbmsgeW91IG1pc3NlZCB0aGUgW1BBVENIIHY2IDA4LzE1
XSByZWd1bGF0b3I6IGJkNzE4eDc6IFNwbGl0DQo+ID4gZHJpdmVyIHRvIGNvbW1vbiBhbmQgYmQ3
MTh4NyBzcGVjaWZpYyBwYXJ0cw0KPiANCj4gSSBkaWRuJ3QgbWlzcyBpdCwgaXQgd2FzIHF1ZXVl
ZCBidXQgaXQgZG9lc24ndCBhcHBseS4NCg0KQWxscmlnaHQuIEkgdGhvdWdodCB5b3UgbWlzc2Vk
IGl0IGFzIHlvdSBhcGxpZWQgdGhlIDkvMTUgYWxyZWFkeS4gSQ0KdGhpbmsgSSBoYWQgdGhlIHY2
IHdyaXR0ZW4gb24gdG9wIG9mIGxpbnV4IHRhZyB2NS41LXJjMS4NCg0KQW55d2F5cywgSSdsbCBj
bG9uZSB0aGUgcmVndWxhdG9yIHRyZWUgYW5kIHJlYmFzZSB0aGlzIHBhdGNoIG9uIHRvcCBvZg0K
Zm9yLTUuNiBoZWFkLiAoSXQnbGwgbWVhbiB0aGVzZSBwYXRjaGVzIGNvbWUgaW4gd3Jvbmcgb3Jk
ZXIgYXMgdGhlDQphbHJlYWR5IGFwcGxpZWQgMDkgZGVwZW5kcyBvbiBub3QteWV0LWFwcGxpZWQg
MDggLSBidXQgYXMgd2UgZG9uJ3QgaGF2ZQ0KdGhlIGNvbmZpZyBmb3IgQkQ3MTgyOCBpbi10cmVl
IHlldCB0aGlzIHdvbid0IG1hdHRlciwgcmlnaHQ/KQ0KDQpUaGFua3MgZm9yIHRha2luZyB0aGlz
Lg0KDQpCciwNCglNYXR0aQ0K
