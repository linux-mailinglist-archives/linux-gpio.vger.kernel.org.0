Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6C6213BB4C
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jan 2020 09:41:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728905AbgAOIli (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Jan 2020 03:41:38 -0500
Received: from mailgate1.rohmeurope.com ([178.15.145.194]:49080 "EHLO
        mailgate1.rohmeurope.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726472AbgAOIli (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Jan 2020 03:41:38 -0500
X-AuditID: c0a8fbf4-199ff70000001fa6-4b-5e1ed03f6ebe
Received: from smtp.reu.rohmeu.com (will-cas002.reu.rohmeu.com [192.168.251.178])
        by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id DB.3C.08102.F30DE1E5; Wed, 15 Jan 2020 09:41:35 +0100 (CET)
Received: from WILL-MAIL002.REu.RohmEu.com ([fe80::e0c3:e88c:5f22:d174]) by
 WILL-CAS002.REu.RohmEu.com ([fe80::fc24:4cbc:e287:8659%12]) with mapi id
 14.03.0439.000; Wed, 15 Jan 2020 09:41:31 +0100
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "lee.jones@linaro.org" <lee.jones@linaro.org>
CC:     "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "dmurphy@ti.com" <dmurphy@ti.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "pavel@ucw.cz" <pavel@ucw.cz>,
        "broonie@kernel.org" <broonie@kernel.org>
Subject: Re: [PATCH v9 02/12] dt-bindings: mfd: Document ROHM BD71828
 bindings
Thread-Topic: [PATCH v9 02/12] dt-bindings: mfd: Document ROHM BD71828
 bindings
Thread-Index: AQHVyGRfelgxjt7dUUiwtNLQXcjh4KfrW4mAgAACGQA=
Date:   Wed, 15 Jan 2020 08:41:30 +0000
Message-ID: <5fd2c53ed4943f47e1c38902c3e8782d25363773.camel@fi.rohmeurope.com>
References: <cover.1578644144.git.matti.vaittinen@fi.rohmeurope.com>
         <b58952aedd1cce08aa4d7f346007a24923bb2b64.1578644144.git.matti.vaittinen@fi.rohmeurope.com>
         <20200115083403.GE325@dell>
In-Reply-To: <20200115083403.GE325@dell>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.255.186.46]
Content-Type: text/plain; charset="utf-8"
Content-ID: <5DF6E6B2751CBC468BB5D38AE91BB94F@de.rohmeurope.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01Te0gTcRznd3e7naurX2u2X5qCI8mMfIDQj5CSIjghyugFQa4rL2fNTW6z
        siiW0MMlZNlDh48emqHSYynVMDLTXFMySe1lj9EqXNmDXlhm3W2W/nUfvp/Xlx/fY0i1lw5j
        skxWQTTxRh2toprP/3LOXXg/Mj2h9nsCruruVeIDH84p8ddyD4WPe300rmy9p8CHOhoU+Gnj
        JQq/+NYG8PeegwQ+NlxD4M+FzxX4SuUwwA9cZTRufH8B4Dt1PTSufthN4LJqN4W7PUvwM08b
        jffdaFXikb7LVEooV19RD7iPj/YpuYr6Xdx1xzMl56wtoLn+viaaa390leBOVgwR3Pm6H0ru
        izMyTbVuQvJG3rptZVamKX7BhgkG/9thIicf7tj7pl9hA52T7SCEQTAJ9biclIzVsBeg4ltb
        7EAlYTdAr5r/ADtgGBomI/tjpazRwERU5X5NyRoSVjGo2PMcyMRUmIYGS94TQdEK9Kng6Khh
        PrL3nVXImILRyD9kD8xZuAzd/PmTCJa1ANRw8kmACIExyG/zBYIAjEAFtg8BTEItcr75oQhu
        DVFVUxcZxKFo4NXI6FyHbgx5KXlpEs5GF13xQWsKah9+PRoThY4d8o7uMAXdLfVRRWCaY1yD
        Y8ztGOd2jHM7xrlPAUUtQNl8ljGTtwqJcaKQGyeaDdnSZ5M52wmCJ/P1GvjTktoCCAa0gOkM
        oQtlNU0R6epJG80ZeQbeYtCLuUbBIj0EQ+o07N0SiWMz+Lydgmj+R4UzlE7LzvIeWa+GctdW
        QcgRxH/sDIbRITapKzJdPUUUMoUdm7OM1jGaYELkcFWYxiKYMgSRz7Ua9PJ96C3SgcjURKn3
        imxnLTl8tjQNWj1gDlM0UH6GZFrLq8+QaspkNglhWvaSLIWy1JBr+l/kB1oG6Kay9nsSO1H6
        b/7n+KUKQqooWhyosPJjVJgNZK5+F7fIq6JKo6NaRwZFOHDi4i9YfHtEn947ubDLx5YaO8u2
        ry5sWHnZdvhlUvvyvhCnqc4d09aYH5V6AZ7e7Qpv8+dNm5Xmzj/euPSFJqUkddNM/mhlRy+0
        LMhbNG9dbM27/t97Dq9xkdGRpWkrzOG+mOT7q9bu10cM1mhTKlQ6ymLgE2NJ0cL/BbbN66H0
        AwAA
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGVsbG8gTGVlLA0KDQpPbiBXZWQsIDIwMjAtMDEtMTUgYXQgMDg6MzQgKzAwMDAsIExlZSBKb25l
cyB3cm90ZToNCj4gT24gU2F0LCAxMSBKYW4gMjAyMCwgTWF0dGkgVmFpdHRpbmVuIHdyb3RlOg0K
PiANCj4gPiBST0hNIEJENzE4MjggUG93ZXIgbWFuYWdlbWVudCBJQyBpbnRlZ3JhdGVzIDcgYnVj
ayBjb252ZXJ0ZXJzLCA3DQo+ID4gTERPcywNCj4gPiBhIHJlYWwtdGltZSBjbG9jayAoUlRDKSwg
MyBHUE8vcmVndWxhdG9yIGNvbnRyb2wgcGlucywgSEFMTCBpbnB1dA0KPiA+IGFuZCBhIDMyLjc2
OCBrSHogY2xvY2sgZ2F0ZS4NCj4gPiANCj4gPiBEb2N1bWVudCB0aGUgZHQgYmluZGluZ3MgZHJp
dmVycyBhcmUgdXNpbmcuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogTWF0dGkgVmFpdHRpbmVu
IDxtYXR0aS52YWl0dGluZW5AZmkucm9obWV1cm9wZS5jb20+DQo+ID4gUmV2aWV3ZWQtYnk6IFJv
YiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+DQo+ID4gLS0tDQo+ID4gTm8gY2hhbmdlcyBzaW5j
ZSB2OCAgDQo+ID4gDQo+ID4gIC4uLi9iaW5kaW5ncy9tZmQvcm9obSxiZDcxODI4LXBtaWMueWFt
bCAgICAgICB8IDE5Mw0KPiA+ICsrKysrKysrKysrKysrKysrKw0KPiA+ICAxIGZpbGUgY2hhbmdl
ZCwgMTkzIGluc2VydGlvbnMoKykNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0DQo+ID4gRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9yb2htLGJkNzE4MjgtcG1pYy55YW1sDQo+
IA0KPiBJIG9ubHkgaGF2ZSBwYXRjaGVzIDItNiwgc28gSSBjYW5ub3QgaGVscCB3aXRoIG1lcmdp
bmcuDQo+IA0KPiBNeSBndWVzcyBpcyB0aGF0IHNvbWUgb2YgdGhlIG90aGVyIHBhdGNoZXMgd2ls
bCBoYXZlIGRlcGVuZGVuY2llcyBvcg0KPiBiZSBkZXBlbmRhbnRzIG9mIHRoZSBNRkQgY2hhbmdl
cywgdGh1cyBzb21lb25lIGVsc2Ugd2lsbCBlaXRoZXIgaGF2ZQ0KPiB0byBtZXJnZSB0aGUgc2V0
IGFuZCBzZW5kIG91dCBhIHB1bGwtcmVxdWVzdCBmb3IgdGhlIG90aGVyDQo+IG1haW50YWluZXJz
DQo+IHRvIGNvbnN1bWUsIG9yIHlvdSB3aWxsIGhhdmUgdG8gc2VuZCB0aGUgd2hvbGUgc2V0IG91
dCBhZ2Fpbi4gDQoNCkkgaGF2ZSB0aGUgcGF0Y2hlcy4gSSdsbCBqdXN0IHNlZSBJIGhhdmUgbm90
IGFjY2lkZW50YWxseSBkcm9wcGVkIG91dA0KYW55IG90aGVyIHBlb3BsZSBhbmQgZG8gcmVzZW5k
IHRoZSBzZXJpZXMuIFNob3VsZG4ndCB0YWtlIGxvbmcuDQoNCkkgaGF2ZW4ndCByZWNlaXZlZCBh
Y2sgZnJvbSBQYXZlbCBmb3IgTEVEIGNoYW5nZXMgKHBhdGNoZXMgMTEgYW5kIDEyKSAtDQpzbyBw
ZXJoYXBzIHRob3NlIHNob3VsZCBzdGlsbCBiZSBsZWZ0IG91dC4gSSBndWVzcyByZXN0IG9mIHRo
ZSBwYXRjaGVzDQphcmUgT2sgdG8gZ28gaW4gLSB1bmxlc3MgeW91IHN0aWxsIGhhdmUgc29tZSBz
dWdnZXN0aW9ucy4gTEVEIHBhcnQgY2FuDQpiZSBhZGRlZCBsYXRlci4NCg0KQnIsDQoJTWF0dGkg
VmFpdHRpbmVuDQoNCg0K
