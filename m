Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71B922D9278
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Dec 2020 06:12:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727999AbgLNFMF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Dec 2020 00:12:05 -0500
Received: from mail-eopbgr1400139.outbound.protection.outlook.com ([40.107.140.139]:50346
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725776AbgLNFMF (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 14 Dec 2020 00:12:05 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IdsRf/N37trIKyjcLgSe8X6bBEnwxEn77VkUuUb2wNCUj7VxHoA6WFCbdELwkgVtuLxQ59hl1mttRB4CL0rkPqFZ4iz2OMmTmyNtUkDLOImIt0fpF0Qa0UGbeVO2Nzqo3kZASEgOyzQSpmScaXflk2ttK0Ypj2dC0oS/S3rJaB4wzb/mx2LX8LjSmr7DjEVgtWExmkkbf3u5XF0u0/AhqKN7Rdi6aNp8vc9cj/4OMDmQbVcBIOG/T5z2xvVMfN2x6pAlkeqgROp9JIoyjBtgNsDPr8tCS1rxx289qmtR83Y4Vju0UGCNo+4MoVJsWfM8FTJVcqnbeZKnseqvD1VTQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=laSb3A1PS7HNMczdwqdQhR02b3eeT5Jz3Xqk20DJmsA=;
 b=kgAvg91yYEHypBJc5qn8Ehqw/OW9bsrEMIHLPMEEPjN4gmpijNz5V6NAqpAJiUDec/C3FU/i3582MHh8j4rg7b+68I/A9zzAVh/IBrkYuJPKYSXC1DXZ+liliPCk53wmu12aI6k85VjTutC1RFufTberl5XydqqCtClAMyoX7G6ftoDqjKUByGzzy7zQWALighQBaJr5HBKxHL71iqYhlbKRJZZDQQ/nv8yqdMSXanecYLu/5NVsfsWdDiw+5OVM3kBxgG6QcBn3CYD6tgwy16ES4v3rbisG7IvwaazpK2AynqDDTPngZHiaOBHtPDPeMUVPyG8of0CR3ZXBY2VBRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=laSb3A1PS7HNMczdwqdQhR02b3eeT5Jz3Xqk20DJmsA=;
 b=CQX1K4EW7f2DO7MVvP4uH/w7VDG30b6Mkf2CPCoqwrGVP+NIXw4FL7mnEMZ7i9w4w6uZDDQHSTiFWCX5jjui7+dP9jwrgiHD3oZEb9462fF2yrRUbqoi3bmuyK5SRyL+M9QziXmA97uXIGVwq4JQYXL1qgz/c6BIrUfuANR2aEw=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYAPR01MB3214.jpnprd01.prod.outlook.com (2603:1096:404:7f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.18; Mon, 14 Dec
 2020 05:11:15 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::2023:7ed1:37c3:8037]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::2023:7ed1:37c3:8037%5]) with mapi id 15.20.3654.025; Mon, 14 Dec 2020
 05:11:15 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "marek.vasut+renesas@gmail.com" <marek.vasut+renesas@gmail.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>
CC:     linux-power <linux-power@fi.rohmeurope.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Khiem Nguyen <khiem.nguyen.xt@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 07/10] gpio: bd9571mwv: Add BD9574MWF support
Thread-Topic: [PATCH v2 07/10] gpio: bd9571mwv: Add BD9574MWF support
Thread-Index: AQHWz7CtZd3OPT8upki88GGKNcKzL6nx2k+AgAQx4TA=
Date:   Mon, 14 Dec 2020 05:11:15 +0000
Message-ID: <TY2PR01MB3692C65167FAB05C8F9D9981D8C70@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <1607686060-17448-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
         <1607686060-17448-8-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <0d0e0b6e47cdc28f2053d0f2be7e237f2586d46c.camel@fi.rohmeurope.com>
In-Reply-To: <0d0e0b6e47cdc28f2053d0f2be7e237f2586d46c.camel@fi.rohmeurope.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: fi.rohmeurope.com; dkim=none (message not signed)
 header.d=none;fi.rohmeurope.com; dmarc=none action=none
 header.from=renesas.com;
x-originating-ip: [240f:60:5f3e:1:1453:ff:c191:5a7a]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d7a69dcf-46f8-4f35-c1ee-08d89feeaef2
x-ms-traffictypediagnostic: TYAPR01MB3214:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TYAPR01MB3214ED65D80D49ABB79A0877D8C70@TYAPR01MB3214.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SHRlDe6YSM/H824LAE5LS/2gPZT4oBNrOB+t8V1+ODi5B3Q4H4uaTWh9eFllbKZdGduM4bQiFyPrqyaBO0M3kykXpvTw+WyURmW632HQAkv6bRxDKv9ftZSMb9nf+jGcxzzvQB6KPeo92UO/a4XkIz7NVwGCOX4ERseYvjkZYJBs7w+IIN1C/y+Rk8Dexa4U/S8OJe6+nZKglfaka/QmzxLSTorlv6EvO/sOfsxRgs7Eh3NB5p/UDrYtiqPgE70uZA+sD4qVu09IIXLFuaqGMGdgOIhiHPYsOzPAfUop2pP1j810QuFLldR7lGDdOnIJmYzO+UkOCk4ePsvjSCQmBQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(366004)(39860400002)(136003)(2906002)(186003)(66946007)(83380400001)(66476007)(64756008)(478600001)(71200400001)(66556008)(316002)(7696005)(86362001)(9686003)(6506007)(76116006)(66446008)(55016002)(5660300002)(8676002)(7416002)(8936002)(4326008)(33656002)(4001150100001)(52536014)(110136005)(54906003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?NUFHaE1CR1I1dGlNWU04ZzYweTVnZWc5a1N4b0J6QnJDaE1oOEQ2SzFybGlq?=
 =?utf-8?B?RjdNanVOcWkybTRleXJVZHM4NmRsSldaOGkwQ3VZdE1Da3BBbFlGbjI5MmE0?=
 =?utf-8?B?T0x0TExmcWkwUmliSmE1cDAwRkpKdVpDNmZkRm1ya0RtUVdGaEFHMHYzTHlz?=
 =?utf-8?B?SFJqOVM4c3dweDJoTWZQYnFTTVRtSTdia002UGZYd05oTnVDSmVqOUZsT3Rh?=
 =?utf-8?B?RnFpczVsM3h1c0xISlZUYUM3RGtTK3Zkekc4bVA5cmJPTlluYmtCTXVrSDJq?=
 =?utf-8?B?SEF6ZmVUQU8zOEVTK0hvMVlPUHIwaXlKUlo5d3dKdmx5bEVlQVk1SkY3Z2k1?=
 =?utf-8?B?VnBqTmlNS0RQcUFpOEw0UFBPOEJZUFBLa0p1cnFIVW9iNmQwLzgyOGw5cHB3?=
 =?utf-8?B?Y2liaFdFT0h4ZGN1TURYK0ZnTFBkOEtJZDZmV3loSUdDQVRDU1p1d1poRW9u?=
 =?utf-8?B?MElKUXBFcG5NaVJyNGJQUVozVlN1eDlFWE5BQUtiSFVqaVZCaG5WQ0J2YVZr?=
 =?utf-8?B?WEY5dXZyMVhtRUF2VW50dSthWWtvdE1Nd3JtS3phMHRnNXFSRjlLY0sxeVlo?=
 =?utf-8?B?VFc5YWpOaDJGNTdkZGp2c2FNY2xHVTAyNHVXMmxoUFZuMFVjS0w3S3RqajVS?=
 =?utf-8?B?RitJK2RwYU9RaXRrRU1TazMxdXVDWE5KY1lKdWN5TFd6RUlXdHRYN1ZuQXVE?=
 =?utf-8?B?enY0N2s5QjdtOGU5U0NLNkFhRnllbGlhaFFEemdKV0NoRHdmVTJRMFZ5TG5Z?=
 =?utf-8?B?dDBoUy9KNHJ0ellwdXdWNGRDcTRlbXBHS1BUWEF2MkN4a1k4TEJ4SWNVU2Rw?=
 =?utf-8?B?WjNGTitCSVVXTWpmNnh3TU04dVc1ZThuS3dsUVNmTENjTmtETGdOdVN6dHg3?=
 =?utf-8?B?S3hJUEJlbG9ZR25VRWh4aXlJdHBHd05KWWtrRzNQS0lFTlNlcEVqUThKblZa?=
 =?utf-8?B?QS80MFRoQ0FNb2s0MjRMcnVoZ3NBR1dYOS9yYm03RWxoUXJKb3hiTVhkUlg2?=
 =?utf-8?B?VUM4S0xVTXRyclJ2WnV4R3hCZXdLUS9hdDhjY3BRUFN0TlJsMjVSU0N6L0NU?=
 =?utf-8?B?b2xRM3hQYmV2Z3praXZBT0tLWDN5U0c2ZHY1ajJwcGxuWU5NcXU0VjJVNEIz?=
 =?utf-8?B?elU5VitWb3ZJQm1kOWR1OEY5WE9CWkk5TDA3UXdEamJZQWRiQW9sUUMxNXBy?=
 =?utf-8?B?eGNqM25PVWJxREFoTGUxVkJHcHNsaUJmY1hIVWJldTNBRWVRTDA4MldwS0k4?=
 =?utf-8?B?QUpJUVdOOHpSajJ5M3NOaUpDaHpFNHVsL0xySXdFcU10dmJHQXgwVUVtYzMr?=
 =?utf-8?B?WXc5TTdZMjVQR1JKZVV5a1NIZmpmendCYTc0WGtyZmZiR0xvU2VXVUxpTEV6?=
 =?utf-8?Q?1h4BGho3zB9GWVU3oI71tsabqD3nVX68=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7a69dcf-46f8-4f35-c1ee-08d89feeaef2
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2020 05:11:15.8423
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +R19Nus6k41ScBfsOiMqlujRBxVzzWdXsGq3CqYsPNDjz9Qu/Vwu5Peh3HpDncHHGCrEyZRBt/n/L+MhLBbS+VyC1ZszRbqbWATxXH+Vy6E4ynMOKXthABb6StBDm/Wr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB3214
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkgTWF0dGktc2FuLA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgcmV2aWV3IQ0KDQo+IEZyb206IFZh
aXR0aW5lbiwgTWF0dGksIFNlbnQ6IEZyaWRheSwgRGVjZW1iZXIgMTEsIDIwMjAgOTo1NSBQTQ0K
PiANCj4gT24gRnJpLCAyMDIwLTEyLTExIGF0IDIwOjI3ICswOTAwLCBZb3NoaWhpcm8gU2hpbW9k
YSB3cm90ZToNCj4gPiBBZGQgc3VwcG9ydCBmb3IgQkQ5NTc0TVdGIHdoaWNoIGlzIHNpbGltYXIg
Y2hpcCB3aXRoIEJEOTU3MU1XVi4NCj4gPiBOb3RlIHRoYXQgQkQ5NTc0TVdGIGhhcyBhbiBhZGRp
dGlvbmFsIGZlYXR1cmUsIGJ1dCBkb2Vzbid0DQo+ID4gc3VwcG9ydCBpdCBmb3Igbm93Lg0KPiAN
Cj4gbml0Og0KPiBQZXJoYXBzIG1lbnRpb24gd2hpY2ggZmVhdHVyZT8NCg0KQkQ5NTc0TVdGIEdQ
SU9bMDFdIGhhdmUgNCBmdW5jdGlvbnMgbGlrZSBiZWxvdy4NCiAxKSBHUElPLCAyKSAiUkVDT1Zf
R1BPVVQiLCAzKSAiRlJFUVNFTCIsIDQpICJSVENfSU4iDQoNCkl0IHNlZW1zICJwaW5jdHJsIiBm
ZWF0dXJlcyB0aG91Z2ggYW5kIEkgZG9uJ3Qga25vdw0KdGhlc2UgZmVhdHVyZXMgaW4gZGV0YWls
IGZvciBub3cuDQoNCj4gQW5kIEkgdGhpbmsgeW91IG1lYW4gdGhlIGRyaXZlciBkb2VzIG5vdCBz
dXBwb3J0IGl0IHlldD8NCg0KWW91J3JlIGNvcnJlY3QuIE5vdyB0aGlzIGRyaXZlciBvbmx5IHN1
cHBvcnQgdGhlIDEpIEdQSU8uDQoNCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFlvc2hpaGlybyBT
aGltb2RhIDx5b3NoaWhpcm8uc2hpbW9kYS51aEByZW5lc2FzLmNvbT4NCj4gDQo+IEZXSVc6DQo+
IFJldmlld2VkLUJ5OiBNYXR0aSBWYWl0dGluZW4gPG1hdHRpLnZhaXR0aW5lbkBmaS5yb2htZXVy
b3BlLmNvbT4NCg0KVGhhbmsgeW91IGZvciB5b3VyIHJldmlldyENCg0KPiA+IC0tLQ0KPiA+ICBk
cml2ZXJzL2dwaW8vZ3Bpby1iZDk1NzFtd3YuYyB8IDYgKysrKy0tDQo+ID4gIDEgZmlsZSBjaGFu
Z2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncGlvL2dwaW8tYmQ5NTcxbXd2LmMgYi9kcml2ZXJzL2dwaW8vZ3Bpby0NCj4g
PiBiZDk1NzFtd3YuYw0KPiA+IGluZGV4IDBlNTM5NWYuLmRmNjEwMmIgMTAwNjQ0DQo+ID4gLS0t
IGEvZHJpdmVycy9ncGlvL2dwaW8tYmQ5NTcxbXd2LmMNCj4gPiArKysgYi9kcml2ZXJzL2dwaW8v
Z3Bpby1iZDk1NzFtd3YuYw0KPiA+IEBAIC0xLDYgKzEsNiBAQA0KPiA+ICAvLyBTUERYLUxpY2Vu
c2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5DQo+ID4gIC8qDQo+ID4gLSAqIFJPSE0gQkQ5NTcx
TVdWLU0gR1BJTyBkcml2ZXINCj4gPiArICogUk9ITSBCRDk1NzFNV1YtTSBhbmQgQkQ5NTc0TVdG
LU0gR1BJTyBkcml2ZXINCj4gPiAgICoNCj4gPiAgICogQ29weXJpZ2h0IChDKSAyMDE3IE1hcmVr
IFZhc3V0IDxtYXJlay52YXN1dCtyZW5lc2FzQGdtYWlsLmNvbT4NCj4gPiAgICoNCj4gPiBAQCAt
MTAsNiArMTAsNyBAQA0KPiA+ICAgKi8NCj4gPg0KPiA+ICAjaW5jbHVkZSA8bGludXgvZ3Bpby9k
cml2ZXIuaD4NCj4gPiArI2luY2x1ZGUgPGxpbnV4L21mZC9yb2htLWdlbmVyaWMuaD4NCj4gPiAg
I2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPg0KPiA+ICAjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1f
ZGV2aWNlLmg+DQo+ID4NCj4gPiBAQCAtMTE4LDcgKzExOSw4IEBAIHN0YXRpYyBpbnQgYmQ5NTcx
bXd2X2dwaW9fcHJvYmUoc3RydWN0DQo+ID4gcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiA+ICB9
DQo+ID4NCj4gPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2VfaWQgYmQ5NTcx
bXd2X2dwaW9faWRfdGFibGVbXSA9IHsNCj4gPiAtCXsgImJkOTU3MW13di1ncGlvIiwgfSwNCj4g
PiArCXsgImJkOTU3MW13di1ncGlvIiwgUk9ITV9DSElQX1RZUEVfQkQ5NTcxIH0sDQo+ID4gKwl7
ICJiZDk1NzRtd2YtZ3BpbyIsIFJPSE1fQ0hJUF9UWVBFX0JEOTU3NCB9LA0KPiANCj4gSSBndWVz
cyB0aGVzZSBDSElQX1RZUEVTIGFyZSB1c2VkIGJ5IHN1YnNlcXVlbnQgcGF0Y2hlcz8NCj4gDQo+
IEkgZ3Vlc3MgdGhpcyBtZWFucyB0aGUgZXhpc3RpbmcgZnVuY3Rpb25hbGl0eSBpbiBib3RoIGNo
aXBzIGlzIHNhbWUsDQo+IHJpZ2h0PyAoR1BJTyByZWdpc3RlciBhZGRyZXNzZXMgZXRjPyAtIEkg
ZG9uJ3QgaGF2ZSBCRDk1NzEgZGF0YS1zaGVldA0KPiBzbyBJIGNhbid0IGNoZWNrKQ0KDQpZZXMs
IHRoZSBleGlzdGluZyBmdW5jdGlvbmFsaXR5IGluIGJvdGggY2hpcHMgaXMgc2FtZS4NCkdQSU8g
cmVnaXN0ZXIgYWRkcmVzc2VzIGFuZCBiaXRzIGFyZSB0aGUgc2FtZS4NCk5vdGUgdGhhdCBCRDk1
NzRNV0YgaGFzIG9uZSBtb3JlIHJlZ2lzdGVyLCBidXQgdGhlIGRyaXZlcg0KZG9lc24ndCB1c2Ug
aXQgZm9yIG5vdy4NCg0KQmVzdCByZWdhcmRzLA0KWW9zaGloaXJvIFNoaW1vZGENCg0K
