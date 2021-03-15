Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 239C633AB60
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Mar 2021 07:03:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229679AbhCOGCc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Mar 2021 02:02:32 -0400
Received: from mail-eopbgr80052.outbound.protection.outlook.com ([40.107.8.52]:7749
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229937AbhCOGCI (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 15 Mar 2021 02:02:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lBs/bddfFniBxAfgaIa61M8A4VlNYabxdfMiKmA+BudoR7w3s1+2Hx/AH4wMTGT5saurK1jkVbqJCycNiOYiFsRlkWXNTsgNNrw14mJjqa7Qc5rcN9jtErNCGOOBb71PcxGRks0Q+mDERWLU/COU/9Mlk5hbT8CMDyx+PCB0qKC0eW42XS1n9ywnaszg4euGs/pc6SHAnXnkI28KzPejr7oQqg8E0PdfW6Yeii12HyIhaAtw/3zWBaBaX0CXpkZKRFEpaGxdo23hT/BVVJ0D1EUbZZUaUQXeP06zG+35Uo4g9/92nEcLfWMh3ILl7EmXco/jIqqhHfLk5ncfQuIaWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2XXTVx0DbHXVzRVDazfWX2gYSlWxHcDME7lqvenTkBk=;
 b=MVysUAWSEd+Uz+jAMk3lH43fcVvkR31lO1AtmrW0qFfYERF75jBZVQAW6/hy9D8guAKxr+8MOYD2S4k81kd/bkSFMjM10xcQkv0DJTVstCyIvZYtUWnrI7GUZ0/JZ6VV08KE+ftFmlx70zQYl8Jbnw/GnmRVGHNQ9Y+aey5pbTwnh33R9IDrsN7qfaxEKRHowM4aL19McZmlbagR+CpMEiy6O6SmRPcy5wADJ7VqKNkmGbKu8bnWxJ6ol4I31Rpsru9LfLZ0ShgZGx/YXOMBjtuvBnlyjJpsvlohdIEXMcfT20kHfO8muS3JyLDb/REebnb0nZkDQFufZfj9ATbFFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2XXTVx0DbHXVzRVDazfWX2gYSlWxHcDME7lqvenTkBk=;
 b=liizLyD+enN+FpaszRoVCiH6XtMYkZHAVSse4B+vUE/TEcup/XfLRNTl1AoW8oJMJNVKo/34/sTF33WPbYAddhLr9B/XpVVzD3VqVuPiLIuHO3DEXCngS/GmFqrRGE4eS4Ua/pmbyCwazMknL+wdUBrTE4w+RKmk3aWi2AIZPBc=
Received: from AM6PR04MB5413.eurprd04.prod.outlook.com (2603:10a6:20b:96::28)
 by AM6PR0402MB3895.eurprd04.prod.outlook.com (2603:10a6:209:1a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Mon, 15 Mar
 2021 06:02:05 +0000
Received: from AM6PR04MB5413.eurprd04.prod.outlook.com
 ([fe80::b4f2:d00e:93a1:8685]) by AM6PR04MB5413.eurprd04.prod.outlook.com
 ([fe80::b4f2:d00e:93a1:8685%3]) with mapi id 15.20.3912.031; Mon, 15 Mar 2021
 06:02:05 +0000
From:   Ran Wang <ran.wang_1@nxp.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] gpio: mpc8xxx: Add ACPI support
Thread-Topic: [PATCH] gpio: mpc8xxx: Add ACPI support
Thread-Index: AQHXFwwpLHvnJWCO3UK4nTufOmNaDqqDhEkAgAEJpKA=
Date:   Mon, 15 Mar 2021 06:02:04 +0000
Message-ID: <AM6PR04MB5413E348ECB06BFEF4F4772BF16C9@AM6PR04MB5413.eurprd04.prod.outlook.com>
References: <20210312065855.37072-1-ran.wang_1@nxp.com>
 <CAHp75VeZyfVEQ6tDnfm2-vZggg=CnG7idwihvykSgJOvjd_=tA@mail.gmail.com>
In-Reply-To: <CAHp75VeZyfVEQ6tDnfm2-vZggg=CnG7idwihvykSgJOvjd_=tA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d8c9038a-4533-4e2e-c0db-08d8e777dbf4
x-ms-traffictypediagnostic: AM6PR0402MB3895:
x-microsoft-antispam-prvs: <AM6PR0402MB38950DDEA7072D098A1C8952F16C9@AM6PR0402MB3895.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OXHbOYufNuQwcQO6TZgy5U0Mq4luZIxJaEn8T5W1rzXrdH8eOk+yrZnaxIn+XUTHoanWuEEAim/X8XRzuGkHJngKA2E0SKC/9z/leHiMH+nm+pMuZBIfzlFHnOrO2T8vUPo7QKr5DnBRu4nusvT9Pj8LY+sUzFFqgAvcwGcG3YPK2UzEOvNhyatzPyOJwu6f/z1KXX3WsV+p4PPXZ8icuHI9bPcUZMkcjxnpvUHFEtL+m5i/tcY7iv6lx5fys7R/DuYbLoEycNMnVSlgIFzI+m7dIZ/LFtUkyDlV3sJwUFzT9vDohDNVFT6Gw0AZDIggOtD6Rw0B2f5DXTrvJBN8UcxdkUy3OrtWO1VbTl0F4MidElTjANfeqcSwITohWq4Y6xFEbqBnTdc8gdAgs8G9E/jUCMNr7BCtPc2OJNBC2uoWU9lXfK3omesMONzHHpYetHMXCvK9Lbb38AjPFlaFS3ozIogKVa+6tlkg/Pv7VGckpmhwaKg6RcXBuhSjUd8IepVxyQElLPeybnaPOPR8OFh9qoFakFVwJ7FxC1yRfcMAR4kaIwGTyg/wbtqN2hbWTHlRNRI22sMhe5ENTlQ4dx38sRwoQ1iA37XgFlL2BWw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB5413.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(136003)(366004)(376002)(396003)(2906002)(53546011)(5660300002)(316002)(52536014)(86362001)(6506007)(7696005)(71200400001)(6916009)(55016002)(83380400001)(9686003)(8936002)(4326008)(66556008)(64756008)(54906003)(66946007)(76116006)(66476007)(8676002)(186003)(478600001)(33656002)(66446008)(26005)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?WXVCc3dvOUk4SjkreW52N3pyU0dNNTNaRUNVK0owdHhEbWVrbVlodGJSNDR6?=
 =?utf-8?B?TGl6dWtzTU43SzNhVElhOGVRWm1HZlk3eVFyQTJENnp2QXRrMDBsLzZ3TldQ?=
 =?utf-8?B?NGl3dFdDckZ4dUJYVW5XalIzZy83dTFsOFQvZDk0Vi8zRVhOYjF3U1h0dHB5?=
 =?utf-8?B?alFXRHAyeHkrQ2dTdFhQdE9nbm1GNlpBVEhhalBwaGRneUlQUHlvL0JoaHgx?=
 =?utf-8?B?dnR4aFowY0t3V2hsWjBiNDNPVGRnc3pZbi9iMUVZWkx4QUlLMzlvRlgzeG5W?=
 =?utf-8?B?eDR4OVczY1JTTHArMVAzNXZDWHdGMTBUUWRRK1E1RlhtaURyM3l4OEpndUVJ?=
 =?utf-8?B?NkwwT2RkZ2tHLzJkQldZQWw2bHJKd2Q2VHc4enVyeWR1cVljbzFVWDJlWXFj?=
 =?utf-8?B?RmdPdDE1cDB0VzJaVURXVDdlZmJ2NFZ1VGdCR2k3WjNFdnl4OHZoVklqWTRh?=
 =?utf-8?B?MktPUWUwYU1HOUxWZktpVXJLVXhUR2F3RjluVExLaTBnait1ZDZnK0FVZVpy?=
 =?utf-8?B?NDhCaWtMWVdqL1Jkc1dzamFkYWNGQmROZ29BQzc1enNRQ3Z0Zjc2b1FXVUxQ?=
 =?utf-8?B?UVljSU80RitoUmpoNHYxek0rN3haVDlsR1J1T1AyMU14VXdEb2ozVkROc1h0?=
 =?utf-8?B?RG5NU1ZSUWZISW5OQWIyOWNoVk5DbkMwK2d5SG82eXEyc0YvcFV6TUlPRTdJ?=
 =?utf-8?B?dERNR2NUeElRaHI0MkgrZUdPalowVy9mOHBNNW9iZUhWNFdUYi9HbzduRFl4?=
 =?utf-8?B?VFdRRjhTL1c4UE96YUN3NjJOdXdYMmVvb0swTFZWcU5tUGFoZVNteVZ1NFBN?=
 =?utf-8?B?MEJOUnluejFqNk5DaHNIR3oyTVRHK0xna2NBY1kxaEdEd0t3TzJ4NGYwY1Jl?=
 =?utf-8?B?OTlGQnVkWWc5NlJNMldhcVFRclY0aWd5MUdJUmlwWFVXOXVmRkZzVVg2Q1BR?=
 =?utf-8?B?dTdHVitSODUrbXZtd0laTzlQS3lUSWlySHlaRUMxM0daRkhlWUtXRkZHUE04?=
 =?utf-8?B?MnU3TFI1MlpZdnJkaklXZWNMN0E0TFYra1A0WjJLTER2MWg2SEkvQnBHQUcv?=
 =?utf-8?B?YXVnaHVuY2haeHpLOGVaaWJFT0xtN0FsN2tsSHlRd25tYXM2eGluTVJBeHR5?=
 =?utf-8?B?czZqQUhkeG5yVCtob0JIekRmTjZlN3pLSXNpZGVXWHlCVWVRcUZldDZyRnkv?=
 =?utf-8?B?RjRVOEV1bGdJVWMxNlM3S3dsSmU2N29hMFdGQ1RxeDYyWTB1SGNuZjQxK1dN?=
 =?utf-8?B?NTVrTDN0TlJJS0NjMU5jZ3Y1NkxXcmx0NmMrUUQzUjQ3Nnk2MHdyZEFOU2t4?=
 =?utf-8?B?YVNwM1pDZXE2b2JMZzRIR0wyV29wMll1Qk5YZ0dKREkrVWYvejV6L0NIMkVn?=
 =?utf-8?B?WDE4MzV2b1g0UERJQVZZcWdGTHc3aHFpWE9xckhYeVhpTmFYWjlLVXBFaTFL?=
 =?utf-8?B?K3RiTlNwMjZCSnMxVitHVmJtU2tDVFkzY0RzZVZRZTYxL09EKzhtcjB1WG5N?=
 =?utf-8?B?a1owOU9tb1pOZ2tjWXdzeXZtb3BnbVVucmVYeHM3b2JQd2hoVWh6SjJibmxM?=
 =?utf-8?B?N2RES0QrbU9DWUoydURmQXZyQTFqWGtiT0dQbFdQZDU4eDlZQlFTckpvclZu?=
 =?utf-8?B?cTBrR1pGVmtDd3Q3ZGtZbi9KNmRITTVucVVKQWhGNkMxS0p0RUR0UlBjaG84?=
 =?utf-8?B?a090Qy84OVFHeHkvLy9Kblh1clVMQWRLbHRyREp3V2xVQU1YVWE1Z0pBM1Q3?=
 =?utf-8?Q?II8vyy6gcDZ1Pr3t6Si6vVcu1P2gtbNad0w4MaU?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5413.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8c9038a-4533-4e2e-c0db-08d8e777dbf4
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Mar 2021 06:02:04.9480
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fK8Fak1zV7jxVepnqeY3OFE0HCi9uK/h2E5nIzlHZ7+DNXEIXr/6+HrYzxciDOW3jzx1c//g/LrcFg40aOmJkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3895
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkgQW5keSwNCg0KT24gU3VuZGF5LCBNYXJjaCAxNCwgMjAyMSA5OjUyIFBNLCBBbmR5IFNoZXZj
aGVua28gd3JvdGU6DQo+IA0KPiBPbiBGcmksIE1hciAxMiwgMjAyMSBhdCA4OjUzIEFNIFJhbiBX
YW5nIDxyYW4ud2FuZ18xQG54cC5jb20+IHdyb3RlOg0KPiANCj4gRmlyc3Qgb2YgYWxsLCBwbGVh
c2UgYWRkIG1lIHRvIHRoZSBDYyBsaXN0IGZvciB0aGUgbmV4dCB2ZXJzaW9uIG9mIHRoZSBwYXRj
aC4NCj4gDQo+ID4gQ3VycmVudCBpbXBsZW1lbnRhdGlvbiBvbmx5IHN1cHBvcnRzIERULCBub3cg
YWRkIEFDUEkgc3VwcG9ydC4NCj4gPg0KPiA+IE5vdGUgdGhhdCBjb21wYXJlZCB0byBkZXZpY2Ug
b2YgJ2ZzbCxxb3JpcS1ncGlvJywgTFMxMDI4QSBhbmQNCj4gDQo+IHRvIGRldmljZXMNCj4gDQo+
ID4gTFMxMDg4QSdzIEdQSU8gaGF2ZSBubyBleHRyYSBwcm9ncmFtbWluZywgc28gc2ltcGxpZnkg
cmVsYXRlZCBjaGVja2luZy4NCj4gDQo+IC4uLg0KPiANCj4gPiArI2luY2x1ZGUgPGxpbnV4L2Fj
cGkuaD4NCj4gDQo+IE5vcGUsIHlvdSByYXRoZXIgbmVlZCBwcm9wZXJ0eS5oIGFuZCBtb2RfZGV2
aWNldGFibGUuaC4NCg0KSWYgSSByZXBsYWNlIGFjcGkuaCwgd2lsbCBlbmNvdW50ZXIgYmVsb3cg
ZXJyb3IgKGV2ZW4gaGF2ZSBhZGRlZCBwcm9wZXJ0eS5oIG1vZF9kZXZpY2V0YWJsZS5oKToNCg0K
Q0MgICAgICBkcml2ZXJzL2dwaW8vZ3Bpby1tcGM4eHh4Lm8NCmRyaXZlcnMvZ3Bpby9ncGlvLW1w
Yzh4eHguYzo0Mzk6MTogd2FybmluZzogZGF0YSBkZWZpbml0aW9uIGhhcyBubyB0eXBlIG9yIHN0
b3JhZ2UgY2xhc3MNCiAgNDM5IHwgTU9EVUxFX0RFVklDRV9UQUJMRShhY3BpLCBncGlvX2FjcGlf
aWRzKTsNCiAgICAgIHwgXn5+fn5+fn5+fn5+fn5+fn5+fg0KZHJpdmVycy9ncGlvL2dwaW8tbXBj
OHh4eC5jOjQzOToxOiBlcnJvcjogdHlwZSBkZWZhdWx0cyB0byDigJhpbnTigJkgaW4gZGVjbGFy
YXRpb24gb2Yg4oCYTU9EVUxFX0RFVklDRV9UQUJMReKAmSBbLVdlcnJvcj1pbXBsaWNpdC1pbnRd
DQpkcml2ZXJzL2dwaW8vZ3Bpby1tcGM4eHh4LmM6NDM5OjE6IHdhcm5pbmc6IHBhcmFtZXRlciBu
YW1lcyAod2l0aG91dCB0eXBlcykgaW4gZnVuY3Rpb24gZGVjbGFyYXRpb24NCmNjMTogc29tZSB3
YXJuaW5ncyBiZWluZyB0cmVhdGVkIGFzIGVycm9ycw0KbWFrZVsyXTogKioqIFtzY3JpcHRzL01h
a2VmaWxlLmJ1aWxkOjI3MTogZHJpdmVycy9ncGlvL2dwaW8tbXBjOHh4eC5vXSBFcnJvciAxDQpt
YWtlWzFdOiAqKiogW3NjcmlwdHMvTWFrZWZpbGUuYnVpbGQ6NTE0OiBkcml2ZXJzL2dwaW9dIEVy
cm9yIDINCm1ha2U6ICoqKiBbTWFrZWZpbGU6MTg0OTogZHJpdmVyc10gRXJyb3IgMg0KbWFrZTog
KioqIFdhaXRpbmcgZm9yIHVuZmluaXNoZWQgam9icy4uLi4NCg0KPiAuLi4NCj4gDQo+ID4gKyAg
ICAgICBpZiAocGRldi0+ZGV2Lm9mX25vZGUpIHsNCj4gPiArICAgICAgICAgICAgICAgZGV2dHlw
ZSA9IG9mX2RldmljZV9nZXRfbWF0Y2hfZGF0YSgmcGRldi0+ZGV2KTsNCj4gPiArICAgICAgIH0g
ZWxzZSB7DQo+ID4gKyAgICAgICAgICAgICAgIGFjcGlfaWQgPSBhY3BpX21hdGNoX2RldmljZShw
ZGV2LT5kZXYuZHJpdmVyLT5hY3BpX21hdGNoX3RhYmxlLA0KPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZwZGV2LT5kZXYpOw0KPiA+ICsgICAgICAg
ICAgICAgICBpZiAoYWNwaV9pZCkNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBkZXZ0eXBl
ID0gKHN0cnVjdCBtcGM4eHh4X2dwaW9fZGV2dHlwZSAqKSBhY3BpX2lkLT5kcml2ZXJfZGF0YTsN
Cj4gPiArICAgICAgIH0NCj4gDQo+IE5vLCBwbGVhc2UgdXNlIGRldmljZV9nZXRfbWF0Y2hfZGF0
YSgpIGluc3RlYWQgb2YgdGhlIGVudGlyZSBjb25kaXRpb25hbCBibG9jay4NCg0KT0sNCg0KPiAN
Cj4gPiArICAgICAgIGlmIChwZGV2LT5kZXYub2Zfbm9kZSkgew0KPiA+ICsgICAgICAgICAgICAg
ICBpZiAob2ZfZGV2aWNlX2lzX2NvbXBhdGlibGUobnAsICJmc2wscW9yaXEtZ3BpbyIpKQ0KPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgIGdjLT53cml0ZV9yZWcobXBjOHh4eF9nYy0+cmVncyAr
IEdQSU9fSUJFLCAweGZmZmZmZmZmKTsNCj4gPiArICAgICAgIH0gZWxzZSB7DQo+ID4gKyAgICAg
ICAgICAgICAgIGlmIChhY3BpX21hdGNoX2RldmljZShwZGV2LT5kZXYuZHJpdmVyLT5hY3BpX21h
dGNoX3RhYmxlLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAm
cGRldi0+ZGV2KSkNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBnYy0+d3JpdGVfcmVnKG1w
Yzh4eHhfZ2MtPnJlZ3MgKyBHUElPX0lCRSwgMHhmZmZmZmZmZik7DQo+ID4gKyAgICAgICB9DQo+
IA0KPiBZZWFoLCBubyBuZWVkIHRvIGNhbGwgYWNwaV9tYXRjaF9kZXZpY2UoKSBoZXJlLg0KPiBJ
bnN0ZWFkIHVzZSBzdHVmZiBmcm9tIE9GLCBsaWtlDQo+IA0KPiBpZiAob2ZfZGV2aWNlX2lzX2Nv
bXBhdGlibGUoKSB8fCAhKElTX0VSUl9PUl9OVUxMKGZ3bm9kZSkgfHwNCj4gaXNfb2Zfbm9kZShm
d25vZGUpKSkNCj4gKGNoZWNrIHRoZSBsb2dpYykNCg0KR290IGl0IQ0KDQo+IC4uLg0KPiANCj4g
PiArI2lmZGVmIENPTkZJR19BQ1BJDQo+IA0KPiBObyB1Z2x5IGlmZGVmZmVyeSwgcGxlYXNlLg0K
DQpSZW1vdmUgaXQgd2lsbCBjYXVzZSBzYW1lIGNvbXBpbGUgZXJyb3IgYWJvdmUuDQoNCj4gPiAr
c3RhdGljIGNvbnN0IHN0cnVjdCBhY3BpX2RldmljZV9pZCBncGlvX2FjcGlfaWRzW10gPSB7DQo+
ID4gKyAgICAgICB7Ik5YUDAwMzEiLH0sDQo+ID4gKyAgICAgICB7IH0NCj4gPiArfTsNCj4gPiAr
TU9EVUxFX0RFVklDRV9UQUJMRShhY3BpLCBncGlvX2FjcGlfaWRzKTsgI2VuZGlmDQo+ID4gKw0K
PiA+ICBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBtcGM4eHh4X3BsYXRfZHJpdmVyID0g
ew0KPiA+ICAgICAgICAgLnByb2JlICAgICAgICAgID0gbXBjOHh4eF9wcm9iZSwNCj4gPiAgICAg
ICAgIC5yZW1vdmUgICAgICAgICA9IG1wYzh4eHhfcmVtb3ZlLG0NCj4gPiAgICAgICAgIC5kcml2
ZXIgICAgICAgICA9IHsNCj4gPiAgICAgICAgICAgICAgICAgLm5hbWUgPSAiZ3Bpby1tcGM4eHh4
IiwNCj4gPiAgICAgICAgICAgICAgICAgLm9mX21hdGNoX3RhYmxlID0gbXBjOHh4eF9ncGlvX2lk
cywNCj4gDQo+ID4gKyAgICAgICAgICAgICAgIC5hY3BpX21hdGNoX3RhYmxlID0gQUNQSV9QVFIo
Z3Bpb19hY3BpX2lkcyksDQo+IA0KPiBEcm9wIEFDUElfUFRSKCkuDQoNCldpbGwgZW5jb3VudGVy
IGJlbG93IGVycm9yIGlmICFDT05GSUdfQUNQSToNCg0KQ0MgICAgICBkcml2ZXJzL2dwaW8vZ3Bp
by1tcGM4eHh4Lm8NCmRyaXZlcnMvZ3Bpby9ncGlvLW1wYzh4eHguYzo0NDk6MjM6IGVycm9yOiDi
gJhncGlvX2FjcGlfaWRz4oCZIHVuZGVjbGFyZWQgaGVyZSAobm90IGluIGEgZnVuY3Rpb24pDQog
IDQ0OSB8ICAgLmFjcGlfbWF0Y2hfdGFibGUgPSBncGlvX2FjcGlfaWRzLA0KICAgICAgfCAgICAg
ICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fg0KbWFrZVsyXTogKioqIFtzY3JpcHRzL01h
a2VmaWxlLmJ1aWxkOjI3MTogZHJpdmVycy9ncGlvL2dwaW8tbXBjOHh4eC5vXSBFcnJvciAxDQpt
YWtlWzFdOiAqKiogW3NjcmlwdHMvTWFrZWZpbGUuYnVpbGQ6NTE0OiBkcml2ZXJzL2dwaW9dIEVy
cm9yIDINCm1ha2VbMV06ICoqKiBXYWl0aW5nIGZvciB1bmZpbmlzaGVkIGpvYnMuLi4uDQogIEND
ICAgICAgbmV0L2NvcmUvcGFnZV9wb29sLm8NCm1ha2U6ICoqKiBbTWFrZWZpbGU6MTg0OTogZHJp
dmVyc10gRXJyb3IgMg0KbWFrZTogKioqIFdhaXRpbmcgZm9yIHVuZmluaXNoZWQgam9icy4uLi4N
Cg0KVGhhbmtzICYgUmVnYXJkcywNClJhbg0KDQoNCg==
