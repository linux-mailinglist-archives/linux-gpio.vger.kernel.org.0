Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F181BEB800
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Oct 2019 20:35:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727423AbfJaTfi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 31 Oct 2019 15:35:38 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:41040 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727419AbfJaTfi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 31 Oct 2019 15:35:38 -0400
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 7FC5E886BF;
        Fri,  1 Nov 2019 08:35:33 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1572550533;
        bh=E93uVfw+8Sv9aFniBPMkATe9ycroU/eB0+p7RpM6SlA=;
        h=From:To:CC:Subject:Date:References:In-Reply-To;
        b=F7Q+3WazE4DEFImOB2xZ4pivLcl6lyZDOa051lMUsnuJjiDOnLZqYdJB2InfY74Kw
         d+WMefMFl20rEyIL5JZCP4Yh0RAYAxQhOpIJbMWV2edqp7fkjiw3txEIuO+u4Ei7qm
         spAmx5eRqXnoC/3/rjAW14AWozrfUOrc7pvnKKsFrtQqsMJYpeIo3B0XtUufTB82gD
         4SLwNZHjmU761wfyV+eg1CabIjsNy/Bd5Kc2hWe7gINE5L79DE67K6zQSdR5tfroEs
         hf8tJOMxgOkhtWsI+qTFbkvqbZTAzqxtja04Wvn5cFtblGoMNJPNiNDL5MnA1+o8Rs
         6nFEovFHVG7Jw==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[10.32.16.77]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5dbb37840000>; Fri, 01 Nov 2019 08:35:32 +1300
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) with Microsoft SMTP Server
 (TLS) id 15.0.1156.6; Fri, 1 Nov 2019 08:35:31 +1300
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1156.000; Fri, 1 Nov 2019 08:35:31 +1300
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     "scott.branden@broadcom.com" <scott.branden@broadcom.com>,
        "enric.balletbo@collabora.com" <enric.balletbo@collabora.com>,
        "tomeu.vizoso@collabora.com" <tomeu.vizoso@collabora.com>,
        "mgalka@collabora.com" <mgalka@collabora.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "matthew.hart@linaro.org" <matthew.hart@linaro.org>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "bot@kernelci.org" <bot@kernelci.org>,
        "khilman@baylibre.com" <khilman@baylibre.com>,
        "guillaume.tucker@collabora.com" <guillaume.tucker@collabora.com>
CC:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "bcm-kernel-feedback-list@broadcom.com" 
        <bcm-kernel-feedback-list@broadcom.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "sbranden@broadcom.com" <sbranden@broadcom.com>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "rjui@broadcom.com" <rjui@broadcom.com>
Subject: Re: linusw/devel boot bisection: v5.4-rc1-31-g6a41b6c5fc20 on
 rk3399-puma-haikou
Thread-Topic: linusw/devel boot bisection: v5.4-rc1-31-g6a41b6c5fc20 on
 rk3399-puma-haikou
Thread-Index: AQHVkBrPgYhki3sbH0mOvdKD5EMjb6d0SpEA
Date:   Thu, 31 Oct 2019 19:35:30 +0000
Message-ID: <9d1a6cba9687f94b2d36a82f42f5d4be2b16e7a6.camel@alliedtelesis.co.nz>
References: <5dbb2acf.1c69fb81.54ce2.2f48@mx.google.com>
In-Reply-To: <5dbb2acf.1c69fb81.54ce2.2f48@mx.google.com>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [2001:df5:b000:22:f9a5:3a1:c94b:a6f5]
Content-Type: text/plain; charset="utf-8"
Content-ID: <007B585A5A5044459D519245F35A99C3@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

T24gVGh1LCAyMDE5LTEwLTMxIGF0IDExOjQxIC0wNzAwLCBrZXJuZWxjaS5vcmcgYm90IHdyb3Rl
Og0KPiAqICogKiAqICogKiAqICogKiAqICogKiAqICogKiAqICogKiAqICogKiAqICogKiAqICog
KiAqICogKiAqICogKg0KPiAqIFRoaXMgYXV0b21hdGVkIGJpc2VjdGlvbiByZXBvcnQgd2FzIHNl
bnQgdG8geW91IG9uIHRoZSBiYXNpcyAgKg0KPiAqIHRoYXQgeW91IG1heSBiZSBpbnZvbHZlZCB3
aXRoIHRoZSBicmVha2luZyBjb21taXQgaXQgaGFzICAgICAgKg0KPiAqIGZvdW5kLiAgTm8gbWFu
dWFsIGludmVzdGlnYXRpb24gaGFzIGJlZW4gZG9uZSB0byB2ZXJpZnkgaXQsICAgKg0KPiAqIGFu
ZCB0aGUgcm9vdCBjYXVzZSBvZiB0aGUgcHJvYmxlbSBtYXkgYmUgc29tZXdoZXJlIGVsc2UuICAg
ICAgKg0KPiAqICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgKg0KPiAqIElmIHlvdSBkbyBzZW5kIGEgZml4LCBwbGVhc2UgaW5jbHVk
ZSB0aGlzIHRyYWlsZXI6ICAgICAgICAgICAgKg0KPiAqICAgUmVwb3J0ZWQtYnk6ICJrZXJuZWxj
aS5vcmcgYm90IiA8Ym90QGtlcm5lbGNpLm9yZz4gICAgICAgICAgKg0KPiAqICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKg0KPiAq
IEhvcGUgdGhpcyBoZWxwcyEgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgKg0KPiAqICogKiAqICogKiAqICogKiAqICogKiAqICogKiAqICogKiAqICogKiAqICog
KiAqICogKiAqICogKiAqICogKg0KPiANCj4gbGludXN3L2RldmVsIGJvb3QgYmlzZWN0aW9uOiB2
NS40LXJjMS0zMS1nNmE0MWI2YzVmYzIwIG9uIHJrMzM5OS1wdW1hLWhhaWtvdQ0KPiANCj4gU3Vt
bWFyeToNCj4gICBTdGFydDogICAgICA2YTQxYjZjNWZjMjAgZ3BpbzogQWRkIHhncy1pcHJvYyBk
cml2ZXINCj4gICBEZXRhaWxzOiAgICBodHRwczovL2tlcm5lbGNpLm9yZy9ib290L2lkLzVkYmIx
MmJmNTliNTE0NDA0ZjYwZWU3OQ0KPiAgIFBsYWluIGxvZzogIGh0dHBzOi8vc3RvcmFnZS5rZXJu
ZWxjaS5vcmcvL2xpbnVzdy9kZXZlbC92NS40LXJjMS0zMS1nNmE0MWI2YzVmYzIwL2FybTY0L2Rl
ZmNvbmZpZy9nY2MtOC9sYWItdGhlb2Jyb21hLXN5c3RlbXMvYm9vdC1yazMzOTktcHVtYS1oYWlr
b3UudHh0DQo+ICAgSFRNTCBsb2c6ICAgaHR0cHM6Ly9zdG9yYWdlLmtlcm5lbGNpLm9yZy8vbGlu
dXN3L2RldmVsL3Y1LjQtcmMxLTMxLWc2YTQxYjZjNWZjMjAvYXJtNjQvZGVmY29uZmlnL2djYy04
L2xhYi10aGVvYnJvbWEtc3lzdGVtcy9ib290LXJrMzM5OS1wdW1hLWhhaWtvdS5odG1sDQo+ICAg
UmVzdWx0OiAgICAgNmE0MWI2YzVmYzIwIGdwaW86IEFkZCB4Z3MtaXByb2MgZHJpdmVyDQo+IA0K
PiBDaGVja3M6DQo+ICAgcmV2ZXJ0OiAgICAgUEFTUw0KPiAgIHZlcmlmeTogICAgIFBBU1MNCj4g
DQo+IFBhcmFtZXRlcnM6DQo+ICAgVHJlZTogICAgICAgbGludXN3DQo+ICAgVVJMOiAgICAgICAg
aHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbGludXN3L2xp
bnV4LWdwaW8uZ2l0Lw0KPiAgIEJyYW5jaDogICAgIGRldmVsDQo+ICAgVGFyZ2V0OiAgICAgcmsz
Mzk5LXB1bWEtaGFpa291DQo+ICAgQ1BVIGFyY2g6ICAgYXJtNjQNCj4gICBMYWI6ICAgICAgICBs
YWItdGhlb2Jyb21hLXN5c3RlbXMNCj4gICBDb21waWxlcjogICBnY2MtOA0KPiAgIENvbmZpZzog
ICAgIGRlZmNvbmZpZw0KPiAgIFRlc3Qgc3VpdGU6IGJvb3QNCj4gDQo+IEJyZWFraW5nIGNvbW1p
dCBmb3VuZDoNCj4gDQo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gY29tbWl0IDZhNDFiNmM1
ZmMyMGFiY2VkODhmYTBlZWQ0MmFlNWU1Y2I3MGIyODANCj4gQXV0aG9yOiBDaHJpcyBQYWNraGFt
IDxjaHJpcy5wYWNraGFtQGFsbGllZHRlbGVzaXMuY28ubno+DQo+IERhdGU6ICAgRnJpIE9jdCAy
NSAwOToyNzowMyAyMDE5ICsxMzAwDQo+IA0KPiAgICAgZ3BpbzogQWRkIHhncy1pcHJvYyBkcml2
ZXINCj4gICAgIA0KPiAgICAgVGhpcyBkcml2ZXIgc3VwcG9ydHMgdGhlIENoaXAgQ29tbW9uIEEg
R1BJTyBjb250cm9sbGVyIHByZXNlbnQgb24gYQ0KPiAgICAgbnVtYmVyIG9mIEJyb2FkY29tIHN3
aXRjaCBBU0lDcyB3aXRoIGludGVncmF0ZWQgU29Dcy4gVGhlIGNvbnRyb2xsZXIgaXMNCj4gICAg
IHNpbWlsYXIgdG8gdGhlIHBpbmN0cmwtbnNwLWdwaW8gYW5kIHBpbmN0cmwtaXByb2MtZ3BpbyBi
bG9ja3MgYnV0DQo+ICAgICBkaWZmZXJlbnQgZW5vdWdoIHRoYXQgYSBzZXBhcmF0ZSBkcml2ZXIg
aXMgcmVxdWlyZWQuDQo+ICAgICANCj4gICAgIFRoaXMgaGFzIGJlZW4gcG9ydGVkIGZyb20gQnJv
YWRjb20ncyBYTERLIDUuMC4zIHJldGFpbmluZyBvbmx5IHRoZSBDQ0ENCj4gICAgIHN1cHBvcnQg
KHBpbmN0cmwtaXByb2MtZ3BpbyBjb3ZlcnMgQ0NCKS4NCj4gICAgIA0KPiAgICAgU2lnbmVkLW9m
Zi1ieTogQ2hyaXMgUGFja2hhbSA8Y2hyaXMucGFja2hhbUBhbGxpZWR0ZWxlc2lzLmNvLm56Pg0K
PiAgICAgTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDE5MTAyNDIwMjcwMy44MDE3
LTMtY2hyaXMucGFja2hhbUBhbGxpZWR0ZWxlc2lzLmNvLm56DQo+ICAgICBBY2tlZC1ieTogU2Nv
dHQgQnJhbmRlbiA8c2NvdHQuYnJhbmRlbkBicm9hZGNvbS5jb20+DQo+ICAgICBTaWduZWQtb2Zm
LWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+DQoNCkhtbSwNCg0K
SSBkb24ndCBzZWUgaG93IHRoaXMgY29tbWl0IHdvdWxkIGhhdmUgY2F1c2VkIHRoZSBvb3BzLiBU
aGUgbmV3IGRyaXZlcg0Kc2hvdWxkbid0IChhbmQgZG9lc24ndCBhcHBlYXIgdG8gYmUpIHJ1biBv
biBhbnkgcGxhdGZvcm0gYXMgbm90aGluZw0KZGVjbGFyZXMgLmNvbXBhdGlibGUgPSAiYnJjbSxp
cHJvYy1ncGlvLWNjYSIgKHlldCkuDQoNCg==
