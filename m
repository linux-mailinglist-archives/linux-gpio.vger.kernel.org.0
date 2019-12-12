Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F08EA11C601
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2019 07:37:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727985AbfLLGhZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Dec 2019 01:37:25 -0500
Received: from mailgate1.rohmeurope.com ([178.15.145.194]:56242 "EHLO
        mailgate1.rohmeurope.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727891AbfLLGhZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Dec 2019 01:37:25 -0500
X-AuditID: c0a8fbf4-183ff70000001fa6-19-5df1e0225db1
Received: from smtp.reu.rohmeu.com (will-cas001.reu.rohmeu.com [192.168.251.177])
        by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id A6.17.08102.220E1FD5; Thu, 12 Dec 2019 07:37:22 +0100 (CET)
Received: from WILL-MAIL001.REu.RohmEu.com ([fe80::2915:304f:d22c:c6ba]) by
 WILL-CAS001.REu.RohmEu.com ([fe80::d57e:33d0:7a5d:f0a6%16]) with mapi id
 14.03.0439.000; Thu, 12 Dec 2019 07:37:18 +0100
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>
CC:     "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "andy@kernel.org" <andy@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 3/3] pinctrl: pinctrl-baytrail: Use GPIO direction
 definitions
Thread-Topic: [PATCH v2 3/3] pinctrl: pinctrl-baytrail: Use GPIO direction
 definitions
Thread-Index: AQHVsLZrB9Q1s2l+2ESMPpyYFEKwtqe1+wcA
Date:   Thu, 12 Dec 2019 06:37:18 +0000
Message-ID: <db6cb75bb21ce4cb48961bad024f0bb371877d37.camel@fi.rohmeurope.com>
References: <cover.1576132131.git.matti.vaittinen@fi.rohmeurope.com>
         <0e8c584bff32da970510201b504e43a84a340cae.1576132131.git.matti.vaittinen@fi.rohmeurope.com>
In-Reply-To: <0e8c584bff32da970510201b504e43a84a340cae.1576132131.git.matti.vaittinen@fi.rohmeurope.com>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.255.186.46]
Content-Type: text/plain; charset="utf-8"
Content-ID: <3DD922BE2F693D4C935C1D40171A07E5@de.rohmeurope.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0gUURj17szOXh8T13Vtb6sJDUUYpGmBG0hYv7Z+hGKkJKZjTq6kuzKz
        K9ovMdFUMk3TXJ+oayWS+KBU1EwMHxFh5SPUfCIopFhiiaLNuL7+3Hu+e+4557vcDxLKNEoD
        Yw0mjjewcQzlQHa/2mw8z0yvhl9orfXTfuhtpLQFWy9l2uaKLaD91l5KaUut/aS24F2vIoDS
        tVkmFbqmukxKNzHSQenKB4J0f5o8AuV3HP2jWFNicGyMwftKpKN+rW5FntBCJtWMjJMpoIbM
        AvYQo0s4u2+MyAIOUImGAV743AVsRT/Aj9+WiAWEFPLHWT8UElShy7hxyFm6QiCrDDeU98ol
        IxcUgnN+je6aqlAo7tupVNiwL26ZbqAkTKIzOHNnlpAwjW7i6qKve8HVAOf35ewS9kiPH6UN
        yiQM0EmcmbK8iwmkxk0Lf+W2rhGu6fhC2LArXpzb3jtncOfGDCk1SiBP3NDubZMG4I2Uqj2b
        U7gge0Zh68EZDxTPk7nguOVIguVQbTmithxRW46oK4G8DuB4NjYuhjVxPl48Z/bijfp4cbtn
        jG8Ctv9cawU7Pdd7gAyCHnACyhhXmhxeDVceizJGJ+tZQR/Bm+M4oQdgSDAqui99OVxJR7PJ
        DzneuE+5QZJR02dn8sKVSMp6wHEJHL/PukPIYPrWT9HUmediuKT7sXGmQ1oG7SVzB41K4AzR
        HM+aTfoIaT4iBHFAJMpJzBWmRDktJLDx4qlNOgh8YO5iWRUBe8us4jq60mkllKTBaOA0avq7
        lIckgd5sOIhbAmoIGBf6hsQ6iaN94LYkBsnEoMxo6YGCiT2kNCmAL3TckX/UVEVeHOoOSUfX
        2kqs9IDa/X2rrDlDZWcJspsdq/dz96wtnnsxELauDN5YcVh9QnoEd22m/q6+2uDBbT/PSwtb
        h8UuoWzi3Ywpt9elWzGnTeY3lfWTFcmt+anzgc+qP0XolOO4yHMwwLnstnwMJAsLBteJp4W+
        5f8YUtCzPucIXmD/Ax1+iwuXAwAA
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGVsbG8gQW5keSwNCg0KT24gVGh1LCAyMDE5LTEyLTEyIGF0IDA4OjM1ICswMjAwLCBNYXR0aSBW
YWl0dGluZW4gd3JvdGU6DQo+IFVzZSBuZXcgR1BJT19MSU5FX0RJUkVDVElPTl9JTiBhbmQgR1BJ
T19MSU5FX0RJUkVDVElPTl9PVVQgd2hlbg0KPiByZXR1cm5pbmcgR1BJTyBkaXJlY3Rpb24gdG8g
R1BJTyBmcmFtZXdvcmsuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBNYXR0aSBWYWl0dGluZW4gPG1h
dHRpLnZhaXR0aW5lbkBmaS5yb2htZXVyb3BlLmNvbT4NCj4gQWNrZWQtYnk6IEFuZHkgU2hldmNo
ZW5rbyA8YW5kcml5LnNoZXZjaGVua29AaW50ZWwuY29tPg0KDQpJIHRyYW5zbGF0ZWQgeW91ciBM
R1RNIGFzIGFuIGFjay4gUGxlYXNlIGxldCBtZSBrbm93IGlmIHRoaXMgaXMgbm90IE9rLg0KDQpC
ciwNCglNYXR0aQ0K
