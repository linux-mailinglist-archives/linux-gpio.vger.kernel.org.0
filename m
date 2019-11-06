Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C6D7F0F5C
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2019 07:58:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730844AbfKFG63 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Nov 2019 01:58:29 -0500
Received: from mailgate1.rohmeurope.com ([178.15.145.194]:48522 "EHLO
        mailgate1.rohmeurope.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726772AbfKFG63 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Nov 2019 01:58:29 -0500
X-AuditID: c0a8fbf4-199ff70000001fa6-b7-5dc26f136c77
Received: from smtp.reu.rohmeu.com (will-cas001.reu.rohmeu.com [192.168.251.177])
        by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id 88.5A.08102.31F62CD5; Wed,  6 Nov 2019 07:58:27 +0100 (CET)
Received: from WILL-MAIL002.REu.RohmEu.com ([fe80::e0c3:e88c:5f22:d174]) by
 WILL-CAS001.REu.RohmEu.com ([fe80::d57e:33d0:7a5d:f0a6%16]) with mapi id
 14.03.0439.000; Wed, 6 Nov 2019 07:58:23 +0100
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "linus.walleij@linaro.org" <linus.walleij@linaro.org>
CC:     "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "vilhelm.gray@gmail.com" <vilhelm.gray@gmail.com>
Subject: Re: [PATCH 02/62] gpio: gpio-104-dio-48e: Use new
 GPIO_LINE_DIRECTION
Thread-Topic: [PATCH 02/62] gpio: gpio-104-dio-48e: Use new
 GPIO_LINE_DIRECTION
Thread-Index: AQHVk8E0yWwGMoSA7E67RuXMsgXB/Kd8oc+AgAEFEYA=
Date:   Wed, 6 Nov 2019 06:58:23 +0000
Message-ID: <d1d33dee96a4dea71a14dfdb6d590beade529c2c.camel@fi.rohmeurope.com>
References: <cover.1572945605.git.matti.vaittinen@fi.rohmeurope.com>
         <d25edcc3a5d912be9d7c3a927bad6baf34a1331e.1572945605.git.matti.vaittinen@fi.rohmeurope.com>
         <CACRpkdav+Sz04WE6N5KkKMQLOtx2BZrjWrEin06yPZQ31a47hg@mail.gmail.com>
In-Reply-To: <CACRpkdav+Sz04WE6N5KkKMQLOtx2BZrjWrEin06yPZQ31a47hg@mail.gmail.com>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.255.186.46]
Content-Type: text/plain; charset="utf-8"
Content-ID: <4BA1251DF78AFF4482333777D31C11BA@de.rohmeurope.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0gUURiGOTPj7PEyMa6aR03LRZIKbxCxloldfmxZYZQJ4aKjTu7iXmx2
        De2GhcG6lqylQcuKJormjzRNUjGrNfGC0A/poha4GeKNjFIzr8043n6d95z3e773g/NBXLrg
        5AvVOiPL6RiNjHQh3tYsvgjx0NuV4f2mQ/KZ0l5CXrxUjckby5aAvL/VRsptVd2E/MF0FRlD
        Kqa/3JMoWqzfJIqvn9pIxZ+GgDjismtUCmO8dkGdrguLTnZVzQ3mZL70yC7ItZO5YEZqBs4Q
        0QfR6KqDNAMXKKU/AjQ2YZKIly6AHtdancwAQpKOQuYBiQB40pGoo9tGCDU4XY2hyTtDmGB4
        0HFoZdJEikXn0fLnZUzUh1HTdN6aJuggNP50aK0RRZ9Dd20OXAybBKhk7BkQDGceftTzkBA0
        oP1Rfu7PNRinvVHD6F8ncWwaVbZ9wEXthcZHVtbfZej1PwchDI3T+1Bda5iIxqDVlS5S1IGo
        uMCxPoM76nnyg7CAndZtCdYt2rqNtm6jrdvocuBUC5CWUWvSGSMbEcqxWaGcXqXlj1S9tgGI
        fznTDFbtp+wAg8AOfCAm86JOq98ppTtS9Gk5KsagSuKyNKzBDhDEZZ5UYiHvUWlMznWW029Y
        fpCQeVPBjiKllBayMlg2k+U23F0QyhDVqrErpe4cm85mX1FrjFs2Bp2F5i6+ngZWl8ZyTJZR
        lSTsR5KBXxDBcuNzSS2PU4ZMRsu/imgvOAAt46UVOHxfWlWBSwmdXsf6elNzQhItlKqydJtB
        E8AbApkHZRIaufELvdlngo/A+IgzI+1ChJHZsnxzAVfZVHKx6sZNx+038eGRr+4/sZQ3dw+f
        SJj/PlWbNzvogytKiso7d5uPN87XH/OJtwUULrbsUfhFrsTGYOOxoUxfqnTBPrjXcasjIrTy
        V0LppeHAo1PtJfmJygzL75DOAcnq2eezMzXRya3x/pYpOgpeNdUHtXT21dUHJ5V5HTkpIwwq
        JmI/zhmY/ylzeX6NAwAA
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQpPbiBUdWUsIDIwMTktMTEtMDUgYXQgMTY6MjMgKzAxMDAsIExpbnVzIFdhbGxlaWogd3JvdGU6
DQo+IE9uIFR1ZSwgTm92IDUsIDIwMTkgYXQgMTE6MTAgQU0gTWF0dGkgVmFpdHRpbmVuDQo+IDxt
YXR0aS52YWl0dGluZW5AZmkucm9obWV1cm9wZS5jb20+IHdyb3RlOg0KPiANCj4gPiBJdCdzIGhh
cmQgZm9yIG9jY2FzaW9uYWwgR1BJTyBjb2RlIHJlYWRlci93cml0ZXIgdG8ga25vdyBpZiB2YWx1
ZXMNCj4gPiAwLzENCj4gPiBlcXVhbCB0byBJTiBvciBPVVQuIFVzZSBkZWZpbmVkIEdQSU9fTElO
RV9ESVJFQ1RJT05fSU4gYW5kDQo+ID4gR1BJT19MSU5FX0RJUkVDVElPTl9PVVQgdG8gaGVscCB0
aGVtIG91dC4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBNYXR0aSBWYWl0dGluZW4gPG1hdHRp
LnZhaXR0aW5lbkBmaS5yb2htZXVyb3BlLmNvbT4NCj4gDQo+IFBsZWFzZSBtZXJnZSBhbGwgb2Yg
dGhlc2UgcGF0Y2hlcyAyLW4gaW50byBvbmUgdG8gYXZvaWQgcGF0Y2ggYm9tYnMNCj4gYW5kIGp1
c3QgbWFrZSBvbmUgdGVjaG5pY2FsIHN0ZXAuDQo+IA0KPiBPaCB0aGUgcGF0Y2ggYm9tYiBhbHJl
YWR5IGRyb3BwZWQsIGhlaGUuIA0KDQpJIHdhcyBzbGlnaHRseSBpbXBhdGllbnQgXl9eOw0KDQpJ
IGRpZCBzcGxpdCB0aGUgcGF0Y2ggc2V0IGludG8gdGhpcyBtYW55IHBhdGNoZXMgc28gdGhhdCBk
cml2ZXINCm1haW50YWluZXJzIHdvdWxkIG9ubHkgbmVlZCB0byBjaGVjayB0aGVpciBvd24gZHJp
dmVyIChqdXN0IGZldyBsaW5lcykuDQpJIGFsc28gdGhvdWdodCB0aGF0IGlmIHNvbWUgZHJpdmVy
IG1haW50YWluZXJzIGhhdmUgb2JqZWN0aW9ucyB0aGVuIGl0DQppcyBlYXN5IHRvIGRyb3Agb3V0
IHN1Y2ggcGF0Y2guIFRoZSAicGF0Y2ggYm9tYiIgDQoNCih3aGljaCB5b3UgcmVmZXJyZWQgaW4g
dGhlIG90aGVyIG1haWwgDQpodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sL0NBQ1Jwa2RhditT
ejA0V0U2TjVLa0tNUUxPdHgyQlpyaldyRWluMDZ5UFpRMzFhNDdoZ0BtYWlsLmdtYWlsLmNvbS8N
CikNCg0Kd2FzIHJlYWxseSBvbmx5IHN1Y2ggYm9tYiBmb3IgeW91IGFuZCBCYXJ0b3N6ICgrR1BJ
Ty9MS01MIG1haWwgbGlzdHMpIC0NCkkgZGlkIG5vdCBDQyBhbGwgcGF0Y2hlcyB0byBldmVyeW9u
ZSAtIGRyaXZlciBtYWludGFpbmVycyBvbmx5IGdvdCB0aGUNCnBhdGNoIGFkZGluZyB0aGUgZGVm
aW5lKHMpIGFuZCBhIHBhdGNoIGZvciB0aGVpciByZXNwZWN0aXZlIGRyaXZlcihzKQ0KOikgVW5m
b3J0dW5hdGVseSBJIG1lc3NlZCB1cCB0aGUgbWVzc2FnZSBJRHMgZnJvbSBtYWlsIGhlYWRlcnMg
c28gdGhlDQptYWlscyBmb3IgdGhlIHNlcmllcyB3ZXJlIG5vdCBwcm9wZXJseSB0aHJlYWRlZCA6
Lw0KDQo+IEFueXdheXMgSSB3YW50IG9uZQ0KPiBiaWcgcGF0Y2ggdG8gYXBwbHkuIFBsZWFzZSBt
YWtlIHN1cmUgaXQgYXBwbGllcyBvbiB0aGUgR1BJTyB0cmVlJ3MNCj4gImRldmVsIiBicmFuY2gu
DQoNClJpZ2h0LiBJIGd1ZXNzIEkgY2FuIGRvIHRoYXQuDQoNCj4gQ29sbGVjdCBhbnkgQUNLcyBh
bmQgZHJvcCBtb3N0IGZyb20gdGhlIENDIGVsc2UgdGhlIGRyaXZlcg0KPiBtYWludGFpbmVycyBt
YXkgZ2V0IGFubm95ZWQuDQoNCk15IHByb2JsZW0gaXMgdGhhdCBJIGRvbid0IGtub3cgd2hvIGFy
ZSB0aGUgZHJpdmVyIG1haW50YWluZXJzIEkgc2hvdWxkDQprZWVwIGFuZCB3aG8gSSBzaG91bGQg
ZHJvcC4gSSBkb24ndCB1c3VhbGx5IGtub3cgd2hvIGFyZSBpbnRlcmVzdGVkIGluIA0Kd2hpY2gg
Y2hhbmdlcy4NCg0KDQo+IA0KPiBZb3VycywNCj4gTGludXMgV2FsbGVpag0KDQo=
