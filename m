Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6849C1188A1
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Dec 2019 13:42:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727242AbfLJMl6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Dec 2019 07:41:58 -0500
Received: from mailgate1.rohmeurope.com ([178.15.145.194]:55286 "EHLO
        mailgate1.rohmeurope.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727116AbfLJMl6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Dec 2019 07:41:58 -0500
X-AuditID: c0a8fbf4-199ff70000001fa6-b0-5def92928a3f
Received: from smtp.reu.rohmeu.com (will-cas001.reu.rohmeu.com [192.168.251.177])
        by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id 72.EB.08102.2929FED5; Tue, 10 Dec 2019 13:41:54 +0100 (CET)
Received: from WILL-MAIL001.REu.RohmEu.com ([fe80::2915:304f:d22c:c6ba]) by
 WILL-CAS001.REu.RohmEu.com ([fe80::d57e:33d0:7a5d:f0a6%16]) with mapi id
 14.03.0439.000; Tue, 10 Dec 2019 13:41:49 +0100
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "broonie@kernel.org" <broonie@kernel.org>
CC:     "corbet@lwn.net" <corbet@lwn.net>, "pavel@ucw.cz" <pavel@ucw.cz>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "dmurphy@ti.com" <dmurphy@ti.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "jeffrey.t.kirsher@intel.com" <jeffrey.t.kirsher@intel.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "mchehab+samsung@kernel.org" <mchehab+samsung@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "hkallweit1@gmail.com" <hkallweit1@gmail.com>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "hofrat@osadl.org" <hofrat@osadl.org>,
        "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "phil.edworthy@renesas.com" <phil.edworthy@renesas.com>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>
Subject: Re: [PATCH v5 01/16] dt-bindings: regulator: Document ROHM BD71282
 regulator bindings
Thread-Topic: [PATCH v5 01/16] dt-bindings: regulator: Document ROHM BD71282
 regulator bindings
Thread-Index: AQHVndzxthsd4Y8wKkm7W/92Uslk+KeRDPcAgAAbkICAAZUNgIAACqYAgAAMmACADvFigIAASP2AgBE6YYCAAA/YgIAACHeA
Date:   Tue, 10 Dec 2019 12:41:47 +0000
Message-ID: <557a4c5993a6fb16710342438f74f92bdfb40ec0.camel@fi.rohmeurope.com>
References: <cover.1574059625.git.matti.vaittinen@fi.rohmeurope.com>
         <d29e0eb587b764f3ea77647392e45fac67bbd757.1574059625.git.matti.vaittinen@fi.rohmeurope.com>
         <20191118162502.GJ9761@sirena.org.uk>
         <fd1e4e652840346bd990c769eabe2f966bda4ed6.camel@fi.rohmeurope.com>
         <20191119181325.GD3634@sirena.org.uk>
         <fa69d01504817e3260d2b023ae2637aa2f1b2862.camel@fi.rohmeurope.com>
         <20191119193636.GH3634@sirena.org.uk>
         <eb685cc78b936bc61ed9f7fbfa18c96398b00909.camel@fi.rohmeurope.com>
         <20191129120925.GA5747@sirena.org.uk>
         <ccc533df4e00bdcbe18ea45a0e0679161ff41354.camel@fi.rohmeurope.com>
         <20191210121129.GA6110@sirena.org.uk>
In-Reply-To: <20191210121129.GA6110@sirena.org.uk>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.255.186.46]
Content-Type: text/plain; charset="utf-8"
Content-ID: <AB9C9F4EC100FC4ABA3424286CA79A0F@de.rohmeurope.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01Ta0xbVRzPuW8eVy+ls0emU26yTDf30mlOlmn44LI7YtS5ZIkmyC5woY20
        JbcFB35hzg3aMQRkmTQ8Nh4bYWhdR/eEBQsIVkUbCmOuDLHNIptpIwILG9u8d9cNPp1f/r/X
        Ocn/MLjuFJ3CmCx2SbaI+TwVT/S23zuzvqYmlrHJf38rag2M0qgsepJGsw1+Ah2dilAo0lsG
        UFP/MIkO/9RFoubY1yRyOMpJdN37HYGGzk4CNDk3ANB8sBxDtYunMPRPxQ0SnTjUSqCzTYsA
        jVyqp5D3728B+uF0kELf9E/QqO1qAEP1bUMEis04MBTwb0cT/gEKHQiM4+hgTz+NHoydIVDl
        8I60VUJnYycQYuMHaaGx8zPhomuCFlq6pzHB0+GghNBYNyW0VH5FCn9V9BHC/M/VhFDZ1QGE
        myfchDA4fh4TjjUuYEL76Tu08K9n1fvcRwnbskR70W5TnmXjW3sTjDO3rxAFVbp91QeOUKUg
        mOQEcQzktsCKaBSoWMeNAtgYeMUJ4hU8BGDdeDnmBAxDcdug8xqtavTcenj0bgulYpyrS4S+
        vgQVJ3N7YdftMKFpRHh8/h6mYQu8PvkbocYQ3Go4H3lPHbPcu9D5RRhoVeUkDPQNP/LGca/C
        shv7cRUD7nnoKI1iWpcBem7eIbU7c7C1+1dcwyvgdPjB/3Me9ixMPerCuZeh+9JGDaZB/93X
        tJRUWHt4itaukAR/rIsQVeAZ17IC15LZtWR2LTO7lpmPA7IDQLNoys8T7dLmDbJUuEG2Gs3K
        kW01e4C2eLMXwEPfTh/AGOADzzIYv4KNlMQydE9lWXOKjaLNmCkX5ks2H4AMzuvZwUPRDB2b
        IxaXSLL1MbWSIXgDu2aqOkPHqV2fSFKBJD9mn2MYHrJjVUpokizlSftyTfn2JRpj4tTw+BS9
        TbLkSLJYaDdmqruRaVOWQ6USld7Lqp21FYhmZapZ/WAdUzXd0Iwz/Q1tzbiOsFgtUoqBDatS
        TpUaCy1Pim4BAwP4ZHZrtcImKr/vSc4tpQJTKhw56tNsdnGJSikFnvum7aO/z3T/kVbyy5qB
        Gv2mN0vr9c1NPQ+vxc4tmLzZu15a+frIyd5UR43nyNN7ikO7PmS+dLvNQXfHMcOLn/POc2KU
        DONlL+yk/pwbFCqycj81zaUWLRYlpX+8J3f2KrYl7+30zvPBsUj7SGj/lXfSk0Pfez/IpkLw
        jYveHfZaE0/YjOLmtbhsE/8DnRHE3joEAAA=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGVsbG8gTWFyaywNCg0KT24gVHVlLCAyMDE5LTEyLTEwIGF0IDEyOjExICswMDAwLCBNYXJrIEJy
b3duIHdyb3RlOg0KPiBPbiBUdWUsIERlYyAxMCwgMjAxOSBhdCAxMToxNDo0OEFNICswMDAwLCBW
YWl0dGluZW4sIE1hdHRpIHdyb3RlOg0KPiANCj4gPiBQcm9ibGVtIGlzIHRoYXQgaWYgbm8gZGVm
YXVsdCB2b2x0YWdlcyBhcmUgZ2l2ZW4gZnJvbSBEVCwgdGhlIHRoZQ0KPiA+IGZpcnN0DQo+ID4g
dm9sdGFnZSBjaGFuZ2VzIGFyZSBsaWtlbHkgdG8gYmUgc2xvdyAocmVxdWlyZSByZWdpc3RlciBh
Y2Nlc3MgLSBJDQo+ID4gZ3Vlc3MgdGhlIEhXIGRlZmF1bHRzIGFyZSBub3Qgd29ya2luZyBmb3Ig
bWFueSB1c2UtY2FzZXMpIC0gd2hpY2gNCj4gPiBtYXkNCj4gPiBiZSB1bmRlc2lyYWJsZS4NCj4g
DQo+IEkgZG9uJ3QgdGhpbmsgdGhhdCdzIGxpa2VseSB0byBiZSBhIHByYWN0aWNhbCBwcm9ibGVt
LCBhbmQgaXQncyBub3QNCj4gbGlrZWx5IGl0J2QgYmUgd29yc2UgdGhhbiBhbHdheXMgZG9pbmcg
d3JpdGVzLiAgQSBsb3Qgb2YgdGhpbmdzIGFyZQ0KPiBzbG93ZXIgdGhlIGZpcnN0IHRpbWUgeW91
IGRvIHRoZW0gYW5kIHlvdSdyZSBzdGlsbCBnb2luZyB0byBoYXZlIHRvDQo+IGRvIHRoZSB3cml0
ZXMgbm8gbWF0dGVyIHdoYXQuDQoNClRoZSB0aGluZyBpcyB0aGF0IGlmIHdlIGRvIGluaXRpYWwg
c2V0dGluZyBvZiB2b2x0YWdlcyAoYmFzZWQgb24NCmJpbmRpbmcgZGF0YSkgd2UgY2FuIHNldCB0
aGUgdm9sdGFnZXMgdG8gcmVnaXN0ZXJzIGJlZm9yZSB3ZSBzd2l0Y2ggdG8NCnRoYXQgcnVuLWxl
dmVsLiBJZiB3ZSBkb24ndCBkbyBpbml0aWFsIHNldHRpbmcgdGhlbiB3ZSB3aWxsIG9ubHkgZG8N
CnNldHRpbmcgd2hlbiB2b2x0YWdlIGNoYW5nZSBpcyBhY3R1YWxseSByZXF1ZXN0ZWQgLSB3aGlj
aCBtYXkgYmUgdG9vDQpsYXRlLiAoSSBhY3R1YWxseSBoZWFyZCBzb21ld2hlcmUgdGhhdCB0aGVy
ZSBpcyA0MCB1UyB0aW1lIGxpbWl0IC0gYnV0DQpJIGRvbid0IHNlZSBob3cgdGhpcyBpcyBjb3Vu
dGVkLiBTdGFydGluZyBmcm9tIHdoYXQ/IC0gYW5kIEkgZG9uJ3Qgc2VlDQpob3cgdGhpcyBpcyBn
dWFyYW50ZWVkIGV2ZW4gd2l0aCBHUElPIGlmIGludGVycnVwdHMgYXJlIHRvIGJlIHNlcnZlZCku
DQoNCk9UT0gsIEkgYWxzbyBoZWFyZCB0aGF0IHRoZSBTb0MgcHJvYmFibHkgcmVxdWlyZSBhdCBs
ZWFzdCB0d28gb2YgdGhlDQpidWNrcyB0byBiZSBjb250cm9sbGVkIGFzIGEgZ3JvdXAgKGJ1Y2tz
IGNvbm5lY3RlZCB0byBTUkFNIGFuZCBDT1JFKSAtDQpwcm9iYWJseSBhbGwgZm91ci4NCg0KU28s
IEkgYW0gYWdhaW4gd29uZGVyaW5nIGlmIEkgc2hvdWxkIGp1c3QgdXBzdHJlYW0gdGhlIGJhc2lj
IGNvbnRyb2wNCndpdGggSTJDIGZvciBTb0NzIHdoaWNoIGRvIG5vdCByZXF1aXJlIGZhc3QgRFZT
IHZvbHRhZ2UgY2hhbmdlcyBhbmQNCnBlcmhhcHMgbWFpbnRhaW4vcHJvdmlkZSBvd24gc2V0IG9m
IHBhdGNoZXMgd2l0aCBhZGRpdGlvbmFsIGludGVyZmFjZQ0KZm9yIHJ1bi1sZXZlbCBjb250cm9s
IGZvciB0aG9zZSBjdXN0b21lcnMgd2hvIHJlcXVpcmUgaXQuLi4gU29ycnkgZm9yDQpiZWluZyBz
dWNoIGEgZGlmZmljdWx0IGd1eS4gRGVjaXNpb24gbWFraW5nIHNlZW1zIHRvIG5vdCBiZSBteSBz
dHJvbmcNCnBvaW50IDovDQoNCkJyLA0KCU1hdHRpIFZhaXR0aW5lbg0K
