Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B32B2300E1
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Jul 2020 06:53:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726319AbgG1Exg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Jul 2020 00:53:36 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:52546 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726308AbgG1Exf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Jul 2020 00:53:35 -0400
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 8EECF8066C;
        Tue, 28 Jul 2020 16:53:32 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1595912012;
        bh=c8Sth13n0TSxhUF7C9X9Qt0unw2FETHySTn87JDXkps=;
        h=From:To:Subject:Date;
        b=MO0WxJyCJ5MBgTUG2pRIpDwBS2GvEE8OaCNW8UVhBt66MCCFIzijQBuoN9UDuzKD9
         9UkeVYpBImkf9vk5MsxhXr0Wyjl79dajBe9MtfQNYk0yEMFpmDF0OWKpRvy4MM6bIh
         8yomuOLw7bGOw6JtXziZ2ELJ8rqmymTq7Bf95skMVuYQkQSPgCnFz3GVUOfxMhVzmh
         2nqpDQ5UDMjsgOGdijChJB5SJQQNZ4EyiaNNH3ejLe1INbAQZHNrhmAeko3bi12FJL
         MRPt32CmebYzJsGEdMsRdU0wAbfwoEm51iPt2PS+Gthj0o1dTo/aOmjWiBRyWfQghJ
         PbxyLmG0wWIlg==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[10.32.16.77]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5f1faf4c0001>; Tue, 28 Jul 2020 16:53:32 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8)
 by svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with
 Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 28 Jul 2020 16:53:31 +1200
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.006; Tue, 28 Jul 2020 16:53:31 +1200
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: pinctrl: kirkwood: gpio mode not being selected
Thread-Topic: pinctrl: kirkwood: gpio mode not being selected
Thread-Index: AQHWZJsKop0hXSCVP0S3idoJEe2QKw==
Date:   Tue, 28 Jul 2020 04:53:31 +0000
Message-ID: <cd7367f5-d08f-44a4-33b8-3667e7ca735a@alliedtelesis.co.nz>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.1.11]
Content-Type: text/plain; charset="utf-8"
Content-ID: <53B3DE3F2867DA4CB4F2D4AE42BD2E6B@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGksDQoNCkknbSBpbiB0aGUgcHJvY2VzcyB1cGRhdGluZyBvdXIgcGxhdGZvcm1zIGZyb20gYSB2
NC40LnggYmFzZWQga2VybmVsIHRvIA0KYSB2NS43IGJhc2VkIG9uZS4NCg0KT24gb25lIG9mIG91
ciBNYXJ2ZWxsIEtpcmt3b29kIGJhc2VkIGJvYXJkcyBJJ20gc2VlaW5nIGEgcHJvYmxlbSB3aGVy
ZSBhIA0KZ3BpbyBpc24ndCBiZWluZyBkcml2ZW4gKHRoZSBncGlvIGhhcHBlbnMgdG8gYmUgYSBy
ZXNldCB0byBhIFBIWSBjaGlwIA0KdGhhdCBvdXIgdXNlcnNwYWNlIHN3aXRjaGluZyBjb2RlIGlz
IGF0dGVtcHRpbmcgdG8gdGFsayB0bykuDQoNCk91ciBib290bG9hZGVyIGlzIGluYWR2ZXJ0ZW50
bHkgY29uZmlndXJpbmcgTVBQMTUgaW50byB1YXJ0MCBSVFMgbW9kZSANCihwcm9iYWJseSBhIGNv
cHkgYW5kIHBhc3RlIGZyb20gdGhlIHJlZmVyZW5jZSBib2FyZCkuDQoNClVuZGVyIHRoZSB2NC40
IGtlcm5lbCBieSB0aGUgdGltZSB1c2Vyc3BhY2UgZ2V0cyBzdGFydGVkIHRoZSBNUFAxNSBwaW4g
DQpoYXMgYmVlbiBwdXQgaW50byBHUElPIG1vZGUuIFdpdGggdGhlIGxhdGVzdCB2NS43IGtlcm5l
bCB0aGUgaW5jb3JyZWN0IA0KbW9kZSBpcyByZXRhaW5lZC4NCg0KSSBoYXZlbid0IGdvbmUgYmlz
ZWN0aW5nIGJ1dCBJJ20gZ3Vlc3Npbmcgc29tZXRoaW5nIHNvbWV3aGVyZSBoYXMgDQpkZWNpZGVk
IG5vdCB0byBwdXQgdGhlIHBpbiBpbnRvIEdQSU8gbW9kZSAoYmVjYXVzZSB0aGF0IGlzIHRoZSBo
YXJkd2FyZSANCmRlZmF1bHQpLg0KDQpJIHByb2JhYmx5IG5lZWQgdG8gZGVmaW5lIGFuIGV4cGxp
Y2l0IHBpbmN0cmwgbm9kZSBpbiBteSBkdHMsIGJ1dCBJIA0Kd2FudGVkIHRvIG1ha2Ugc3VyZSB0
aGF0IHRoaXMgd2FzIGFuIGludGVudGlvbmFsIGNoYW5nZSBpbiBiZWhhdmlvdXIuDQoNClRoYW5r
cywNCkNocmlzDQo=
