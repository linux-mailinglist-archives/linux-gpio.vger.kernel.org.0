Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74C4837F4B5
	for <lists+linux-gpio@lfdr.de>; Thu, 13 May 2021 11:10:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232156AbhEMJLV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 13 May 2021 05:11:21 -0400
Received: from eu-smtp-delivery-151.mimecast.com ([207.82.80.151]:54914 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232149AbhEMJLU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 13 May 2021 05:11:20 -0400
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mtapsc-4-O-l6zddbOw-DLiJ4G39p_w-1; Thu, 13 May 2021 10:10:08 +0100
X-MC-Unique: O-l6zddbOw-DLiJ4G39p_w-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Thu, 13 May 2021 10:10:07 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.015; Thu, 13 May 2021 10:10:07 +0100
From:   David Laight <David.Laight@ACULAB.COM>
To:     'Colin King' <colin.king@canonical.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        Srinivas Neeli <srinivas.neeli@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
CC:     "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH][next] gpio: xilinx: Fix potential integer overflow on
 shift of a u32 int
Thread-Topic: [PATCH][next] gpio: xilinx: Fix potential integer overflow on
 shift of a u32 int
Thread-Index: AQHXR9VSZMAtotrvl0OPmMzLRkGfrKrhHwxw
Date:   Thu, 13 May 2021 09:10:07 +0000
Message-ID: <ca5918c4d9a240bc80bad1ad16d929f9@AcuMS.aculab.com>
References: <20210513085227.54392-1-colin.king@canonical.com>
In-Reply-To: <20210513085227.54392-1-colin.king@canonical.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
        auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

RnJvbTogQ29saW4gS2luZw0KPiBTZW50OiAxMyBNYXkgMjAyMSAwOTo1Mg0KPiANCj4gRnJvbTog
Q29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4NCj4gDQo+IFRoZSBsZWZ0
IHNoaWZ0IG9mIHRoZSB1MzIgaW50ZWdlciB2IGlzIGV2YWx1YXRlZCB1c2luZyAzMiBiaXQNCj4g
YXJpdGhtZXRpYyBhbmQgdGhlbiBhc3NpZ25lZCB0byBhIHU2NCBpbnRlZ2VyLiBUaGVyZSBhcmUg
Y2FzZXMNCj4gd2hlcmUgdiB3aWxsIGN1cnJlbnRseSBvdmVyZmxvdyBvbiB0aGUgc2hpZnQuIEF2
b2lkIHRoaXMgYnkNCj4gY2FzdGluZyBpdCB0byB1bnNpZ25lZCBsb25nIChzYW1lIHR5cGUgYXMg
bWFwW10pIGJlZm9yZSBzaGlmdGluZw0KPiBpdC4NCj4gDQo+IEFkZHJlc3Nlcy1Db3Zlcml0eTog
KCJVbmludGVudGlvbmFsIGludGVnZXIgb3ZlcmZsb3ciKQ0KPiBGaXhlczogMDJiM2Y4NGQ5MDgw
ICgiZ3BpbzogeGlsaW54OiBTd2l0Y2ggdG8gdXNlIGJpdG1hcCBBUElzIikNCj4gU2lnbmVkLW9m
Zi1ieTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4NCj4gLS0tDQo+
ICBkcml2ZXJzL2dwaW8vZ3Bpby14aWxpbnguYyB8IDIgKy0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3Bpby9ncGlvLXhpbGlueC5jIGIvZHJpdmVycy9ncGlvL2dwaW8teGlsaW54LmMNCj4gaW5kZXgg
MTA5YjMyMTA0ODY3Li4xNjRhM2E1YTkzOTMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3Bpby9n
cGlvLXhpbGlueC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3Bpby9ncGlvLXhpbGlueC5jDQo+IEBAIC05
OSw3ICs5OSw3IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCB4Z3Bpb19zZXRfdmFsdWUzMih1bnNpZ25l
ZCBsb25nICptYXAsIGludCBiaXQsIHUzMiB2KQ0KPiAgCWNvbnN0IHVuc2lnbmVkIGxvbmcgb2Zm
c2V0ID0gKGJpdCAlIEJJVFNfUEVSX0xPTkcpICYgQklUKDUpOw0KPiANCj4gIAltYXBbaW5kZXhd
ICY9IH4oMHhGRkZGRkZGRnVsIDw8IG9mZnNldCk7DQo+IC0JbWFwW2luZGV4XSB8PSB2IDw8IG9m
ZnNldDsNCj4gKwltYXBbaW5kZXhdIHw9ICh1bnNpZ25lZCBsb25nKXYgPDwgb2Zmc2V0Ow0KPiAg
fQ0KDQpUaGF0IGNvZGUgbG9va3MgZHViaW91cyBvbiAzMmJpdCBhcmNoaXRlY3R1cmVzLg0KDQpJ
IGRvbid0IGhhdmUgMDJiM2Y4NGQ5MDgwIGluIGFueSBvZiBteSBzb3VyY2UgdHJlZXMuDQpCdXQg
dGhhdCBwYXRjaCBtYXkgaXRzZWxmIGJlIHZlcnkgZHViaW91cy4NCg0KU2luY2UgdGhlIGhhcmR3
YXJlIHJlcXVpcmVzIGV4cGxpY2l0IGJpdHMgYmUgc2V0LCByZWx5aW5nDQpvbiB0aGUgYml0bWFw
IGZ1bmN0aW9ucyBzZWVtcyBwb2ludGxlc3MgYW5kIHBvc3NpYmx5IHdyb25nLg0KQ2xlYXJseSB0
aGV5IGNhdXNlIGFkZGl0aW9uYWwgcHJvYmxlbXMgYmVjYXVzZSB0aGV5IHVzZSBsb25nW10NCmFu
ZCBoZXJlIHRoZSBjb2RlIG5lZWRzIHUzMltdLg0KDQoJRGF2aWQNCg0KLQ0KUmVnaXN0ZXJlZCBB
ZGRyZXNzIExha2VzaWRlLCBCcmFtbGV5IFJvYWQsIE1vdW50IEZhcm0sIE1pbHRvbiBLZXluZXMs
IE1LMSAxUFQsIFVLDQpSZWdpc3RyYXRpb24gTm86IDEzOTczODYgKFdhbGVzKQ0K

