Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B45ABE899A
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Oct 2019 14:34:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388579AbfJ2Neu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Oct 2019 09:34:50 -0400
Received: from mailgate1.rohmeurope.com ([178.15.145.194]:64122 "EHLO
        mailgate1.rohmeurope.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387890AbfJ2Neu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Oct 2019 09:34:50 -0400
X-AuditID: c0a8fbf4-199ff70000001fa6-09-5db83ff87284
Received: from smtp.reu.rohmeu.com (will-cas001.reu.rohmeu.com [192.168.251.177])
        by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id 7F.1D.08102.8FF38BD5; Tue, 29 Oct 2019 14:34:48 +0100 (CET)
Received: from WILL-MAIL002.REu.RohmEu.com ([fe80::e0c3:e88c:5f22:d174]) by
 WILL-CAS001.REu.RohmEu.com ([fe80::d57e:33d0:7a5d:f0a6%16]) with mapi id
 14.03.0439.000; Tue, 29 Oct 2019 14:34:43 +0100
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>
CC:     "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: bd70528: Add MODULE ALIAS to autoload module
Thread-Topic: [PATCH] gpio: bd70528: Add MODULE ALIAS to autoload module
Thread-Index: AQHViZx3BBbcd3pOS0G3M8VDNrhq+adoLVAAgAlp9wA=
Date:   Tue, 29 Oct 2019 13:34:42 +0000
Message-ID: <181cd407bf95ba38b7edae21df94bf950210ae4e.camel@fi.rohmeurope.com>
References: <20191023122150.GA2524@localhost.localdomain>
         <CAMpxmJUhwLOey+NtLrkvvj4apfyZyqLM_P87et+jHvGtBETspA@mail.gmail.com>
In-Reply-To: <CAMpxmJUhwLOey+NtLrkvvj4apfyZyqLM_P87et+jHvGtBETspA@mail.gmail.com>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.255.186.46]
Content-Type: text/plain; charset="utf-8"
Content-ID: <77C472C4743C5C49B8A684AD6218304E@de.rohmeurope.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrGKsWRmVeSWpSXmKPExsVyYMXvjbo/7HfEGrQ/s7L4MvcUi8WUP8uZ
        LDbP/8NocXnXHDaLOUtPsDiwery/0crusXPWXXaPO9f2sHl83iQXwBLFbZOUWFIWnJmep2+X
        wJ3x8/db1oJbzBXnfz9lb2A8w9zFyMkhIWAicfJuE2MXIxeHkMBVRonlNxYwQTgnGCXWbHjL
        1sXIwcEmYCPRdZMdpEFEwFri7fUzYDXMAh8YJTbc/AM2SVjAXaJ3TTNUkYfEtQVvWSFsK4n3
        X16xgdgsAqoStycvYQGxeQX8JH7snsIGsayRUWLq1fVggzgFAiXO7F4H1swoICvR2fCOCcRm
        FhCX2PTsOyvE2QISS/ach3pBVOLl439QcSWJvT8fsoAczSygKbF+lz5Eq4PEghPLGCFsRYkp
        3Q/ZIW4QlDg58wnLBEaxWUg2zELonoWkexaS7llIuhcwsq5ilMhNzMxJTyxJNdQrSi3VK8rP
        yAVSyfm5mxgh8fhlB+P/Q56HGJk4GA8xSnIwKYny/jm2PVaILyk/pTIjsTgjvqg0J7X4EKME
        B7OSCO/FM9tihXhTEiurUovyYVLSHCxK4rzqDyfGCgmA7MpOTS1ILYLJynBwKEnw/rfdESsk
        WJSanlqRlplTgpBm4uAEGc4lJVKcmpeSWpRYWpIRD0og8cXAFAKS4gHaqwhMbEK8xQWJuUBR
        iNZTjNocE17OXcTMcWTu0kXMQix5+XmpUuK8v+yASgVASjNK8+AWvWIU52BUEuZlARnEA0zM
        cHNeAa1gAlqh8xPkteKSRISUVANj3mxRv4lftm85uejHNpFGkzs6h64/Ep5WeUtYTHLLjSCt
        DdbPb01WmfF6jkrX9iU/3VrnL3SrftKwQT3USEYxnefi9GqTg8bnI//XSOyy2mn2uNXgQfQ+
        gZmRblub7zTrJ3eV3NMr3lenaXPAPIGn3YJ3tWRUYc/J/vLnwf0tbwrnV2hU9DYrsRRnJBpq
        MRcVJwIAzPXfPIkDAAA=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQpPbiBXZWQsIDIwMTktMTAtMjMgYXQgMTY6NDkgKzAyMDAsIEJhcnRvc3ogR29sYXN6ZXdza2kg
d3JvdGU6DQo+IMWbci4sIDIzIHBhxbogMjAxOSBvIDE0OjIyIE1hdHRpIFZhaXR0aW5lbg0KPiAN
Cj4gPiBJJ20gbm90IHJlYWxseSBzdXJlIGlmIHRoaXMgaXMgYSBidWctZml4IG9yIGZlYXR1cmUg
YnV0IEkgZ3Vlc3MgdGhlDQo+ID4gRml4ZXMgdGFnIHdvbid0IGhhcm0sIHJpZ2h0Pw0KPiANCj4g
SXQncyBkZWZpbml0ZWx5IGEgZmVhdHVyZSwgbm90IGEgYnVnLWZpeC4gSSBhcHBsaWVkIGl0IHRv
IGZvci1uZXh0DQo+IGJ1dA0KPiBkcm9wcGVkIHRoZSB0YWcuDQoNClRoYW5rcyENCg0KLS1NYXR0
aQ0K
