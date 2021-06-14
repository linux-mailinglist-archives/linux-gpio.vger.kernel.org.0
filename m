Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A56FC3A614E
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Jun 2021 12:44:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233536AbhFNKqJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Jun 2021 06:46:09 -0400
Received: from mail-mw2nam12on2088.outbound.protection.outlook.com ([40.107.244.88]:2880
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233425AbhFNKl2 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 14 Jun 2021 06:41:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fW5cbVbiVr4YvhaTH1zc+b8L/YwTaU0KUDQHyhaRzx8iutG+ReQIWPOjTscXIdjIK0xhlZ63KyMQvOFNbMkPzeE6TiMDiDzRaDbw7E+E4k556v/+6c20JLPzowLTwHggH2FH1zzGTHzhpBwfVPNidwgym0RaN+sDwvyWgULU/nfYCuEDqRzVPlwaasiS4uvaLhj0bazA+tQS9GTDs9G9QSYdFVoOfqCDY1GzxqZ9gwfjaMeCDNvxaQ7MlD22X6DD+fKh4WgLOrghl8fecfPUcBflNFzQs5MfugvE2DcRIWVMOs1ikKINwlwuREBbYRva/hNpOrWG2Kt7U3yPMKoC7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=engp7dJFXqxktgH7kSNLGM9+a2rWNOtSFbpcY0iVe5c=;
 b=IjVrt+cMyX9dcfU7MDpAduFqS/pYWamDGtUM0KkOjVQrweNxEp/mxSgkltDqTuqnWuV9KrwBHqMi+Le9Za2nlett+f85G6y2DDHT+BM9331qjbZk0MeHcYh9kx55ASY9MDxiZqpVyv4l2IKvMMq9p2Kmr5IeQW6XAmdBgWayRCFxrpIXd5Vsm3iDYvth8t8Mse5ULAqQCce/FgU/qbc+EiU7LQabH0ghjWQxWJVDeMECxzJbffDLjX+GGZZNZcO8hWFp3zOyBSK+iMs64rA40T9lIExrmWsgZDDico7EA8fzXmucte+kYbiCzQzSU4RhpqQ0kzWCbnC4nJaoC9sqjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=engp7dJFXqxktgH7kSNLGM9+a2rWNOtSFbpcY0iVe5c=;
 b=V3Y1ezzo1jOwOMITqf6qpyxZ08bepnb4semlQozIUnmkkBeFPN13Xe/QasCc5eMmQq81cbA/pNeTGGZb7sL8oXFqQFXU0bE9QAQe/Zw+WmEOaQlCnjFBQAMSQT3L7Niix1aZ9vd9LZKZ2Ee4RG/dG1FKfk2WHQVjSYD9Xi42cjg=
Received: from DM6PR02MB5386.namprd02.prod.outlook.com (2603:10b6:5:75::25) by
 DM5PR02MB3178.namprd02.prod.outlook.com (2603:10b6:4:67::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.25; Mon, 14 Jun 2021 10:39:23 +0000
Received: from DM6PR02MB5386.namprd02.prod.outlook.com
 ([fe80::90fb:2d02:150c:cd10]) by DM6PR02MB5386.namprd02.prod.outlook.com
 ([fe80::90fb:2d02:150c:cd10%6]) with mapi id 15.20.4219.025; Mon, 14 Jun 2021
 10:39:23 +0000
From:   Srinivas Neeli <sneeli@xilinx.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
CC:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        Michal Simek <michals@xilinx.com>,
        Shubhrajyoti Datta <shubhraj@xilinx.com>,
        Srinivas Goud <sgoud@xilinx.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        git <git@xilinx.com>
Subject: RE: [PATCH 1/3] gpio: zynq: use module_platform_driver to simplify
 the code
Thread-Topic: [PATCH 1/3] gpio: zynq: use module_platform_driver to simplify
 the code
Thread-Index: AQHXLUnQ5yxYlAncvUSZ3jc0NDWaD6qsvx6AgAWKEwCAAdR/wIADZCgAgFw0VGA=
Date:   Mon, 14 Jun 2021 10:39:23 +0000
Message-ID: <DM6PR02MB5386A84774C2430F4BDED84BAF319@DM6PR02MB5386.namprd02.prod.outlook.com>
References: <20210409140806.31824-1-srinivas.neeli@xilinx.com>
 <20210409140806.31824-2-srinivas.neeli@xilinx.com>
 <CAHp75Vddd6ygr4mJ9Z+SuGZmfLcgDLWLZaxby2XE2mX8War-qQ@mail.gmail.com>
 <CAMpxmJW=HWf_NxGpfBkX=utgOTs4+6RtypxnKGtpuYnX=t8rGQ@mail.gmail.com>
 <DM6PR02MB5386CADF5A10EF28A640AD76AF4E9@DM6PR02MB5386.namprd02.prod.outlook.com>
 <CAMpxmJV_CtFQpZvr_H0g3DvPMQZwqa-9z2FVxCLX=tF9Ytkj7Q@mail.gmail.com>
In-Reply-To: <CAMpxmJV_CtFQpZvr_H0g3DvPMQZwqa-9z2FVxCLX=tF9Ytkj7Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=none action=none header.from=xilinx.com;
x-originating-ip: [149.199.50.129]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 92f57a3c-0fbe-4abb-fa87-08d92f20acfd
x-ms-traffictypediagnostic: DM5PR02MB3178:
x-ld-processed: 657af505-d5df-48d0-8300-c31994686c5c,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR02MB3178096D3BF349A4A288FCE2AF319@DM5PR02MB3178.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: W3VGYJ20h79L8343htjueDdoTVWuOZ1AIgpCnC0vqtj14owhJUlC6950qUBnGt3GtDSRUa5Pe6OuDK6ety48fRgLlwzdjrwpV3LPMmsW611mTXrmNt3x0LwehjhOoyN31scUfxxkqi4V1aIFd/u0V4lyweiRu75+bOJamApfaChhkdRPoML5GhL0m/FlqMi478Tlie/phiVmcYhj60t5GwVortNszb9+Wx/h49rR3OA983AruwxAntGcXWIy8AgaQofh2Xzd2x+ZYRL15MqRrnb8Llmb1O/dbgY+hEq/iodxEM3deIzvXESVsfcD2Pm78BcB+aV/NbTtoYsWWZnZmn1AvEmz/qVkyUjSXo5rrDqiTHXGNBB+P0yuo+x9NATKFrtaPcHPuIv+jeM2iwfOuDCH3OMt8S2s/GIQt20KylZikQoYWmfdsLxQoaBe9UMTWSKaJk0Jb/u4aJWyF7NZaDyKi3egXSWpOcj+SKagLw26wvY+DyoYaPZx71nWZPYT5VZNqgNToZD322HFzEEpzp8GtfjGK+GZOQVOgTdxotIv3LvdKoJuGaI54JtiwGOD9mdmToDNa4OmgLU6C4+xMZz/Nc9YKLRu9Rj/UuyrsYfciHMs94plx2ATxoTGGIED2uMrzZmBk1SOyJNHuVIzJamk6APfbJ4Tn8OvTIcrA8dn4Azq+YMzHrqT3iMbi1ECqVGX+jienGBRKvXb7CaMI/MnvodteC+5E42YA/9Y3Fc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR02MB5386.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(346002)(396003)(376002)(39850400004)(71200400001)(54906003)(107886003)(316002)(4326008)(55016002)(26005)(2906002)(9686003)(122000001)(38100700002)(66446008)(64756008)(66556008)(66476007)(186003)(53546011)(6506007)(6916009)(86362001)(66946007)(52536014)(478600001)(5660300002)(7696005)(8936002)(966005)(76116006)(8676002)(83380400001)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UUJRbWpCdVU0VEM0MlpKNjNGekFIZTRwS0JEYS9HSzV2R2Jpc1JqeU0wd0s1?=
 =?utf-8?B?aElqVHYyYnNodDVnZDV3anVxWG5zVVBWV1ZrRW11K0NiZGozMlNIdVhZeDVC?=
 =?utf-8?B?N2RCV0MrTG5RR2ZPY2NnU09XRWpQKytzVFdNYWFoa1BHaG52Y1lWZU1QckV6?=
 =?utf-8?B?ZUhsd2ptSGpNbTRHM2tFdVBWREphQW9RcGQzOGMzdkVlc0hPN0NSZElGTTVa?=
 =?utf-8?B?eXk5WjdrdnZub0pnTHlwcTZ5aHVHUnVJeG9yL3B3RzJPQzdjVCtUd2dyOXJC?=
 =?utf-8?B?WWhNRGxjeXEyVWRxRjhjZlFvMWZUT2RzOE4ydjIwRGFVc21sK0p6dG5YeXhO?=
 =?utf-8?B?VUVCRUN2ejJTN3FCRUw5Vkk4bjJyWDZ0TkFrOG1tdjhxNnNRelllYy9sRG5s?=
 =?utf-8?B?ZzdGSlhTeDZXWlhyQXM2VXFIbHA5SGhoRzBnVitNN1dOQzhlWFFzelkyVWN5?=
 =?utf-8?B?TUZCSit1WER2Nmo5TSticWFLc2g5Q0d0TWR2UmJrZGhXOXN1QzhkeHJqdVMw?=
 =?utf-8?B?aW1HUWpzb1Jocml4OGhpQzZhVTk2Y2RkVEJ5WEF6b2IwZTEzMWd3QmpOdlQ4?=
 =?utf-8?B?VmN1SjkyK3BKSG9wcTlzcWlEaDRVQU9OZFkzektISWttenJaTVNHQWFrY3J1?=
 =?utf-8?B?cUVJOUNjRWlvWHhLZnRPVXVGUjRwa2l2OGZhL3ZPMDBmY3JLNEIvYkRoN2gz?=
 =?utf-8?B?cWNYUk9BK3A2d3VWRWZjZlczNURRU0l5RitlQS9Pb29iNFlMMkhIVmRsZkJ3?=
 =?utf-8?B?K1pZRFJHcE1MN2YrL0d6OXZhenRsLzJEWklnT1hnUGhWdHdqWk9TaEc2VFNh?=
 =?utf-8?B?Zy81UlFubVdXei9rcDBDR3hmSDYvU1JGUm5ibHJSVG50TCt6NkJBYTRrc00w?=
 =?utf-8?B?NzJROGM2VW9Ya1ViYk4zUWp1cHR2RUREQ1lxcmFQZUtIZFI2cTJQbkRCSHlr?=
 =?utf-8?B?d3p4TzNnMzRFekRpNUxTczU0ajNoTVpvYi92TXFIWmFxdTR4aHJvSGtDNkti?=
 =?utf-8?B?ZzhwaWt6SkFFbC95di9RVVdjZkhBa2NwZ0VMTnB3S2FBbGtzUXBoVTFrNkZQ?=
 =?utf-8?B?MlBVall5b2VZTmxCbklvL056bEtNbHFXUjdWamtDM0RhZU1FUVVqelJXU01U?=
 =?utf-8?B?di9sUGV5RlZOWEJPVzJZZGdEays4eWlzY0NzVys3TDJUU3FpTGxSSG5IclFs?=
 =?utf-8?B?cEFwVHFkWWVUemEvVkNFakMvUmxjL2VtengzM2szL1ZIZUdQSUdZcEhjSDNa?=
 =?utf-8?B?ZVhvVWRVTDlpWkp3L3c0cElISzFrVENBSXh1S0FSUnRHbEl5UWJSRmZkejd2?=
 =?utf-8?B?ZWcyODVUR3RVNVJ3UjBKQ25WRW9RWVZ0U2ZZdXZVTVNtU2ZZS3dkSnZFNTB4?=
 =?utf-8?B?S3RHN0o4ZzJqTGRBN1RwdVZlRWtzK0c5UzIwWC84VW9QVzZoVlIwTGZ4U3p2?=
 =?utf-8?B?czU0a0w3ZU80dUJ2ZTVHU0k3ZmJJSTdMd3Q2SkNIemJNaERQcDVkOUpsQjFJ?=
 =?utf-8?B?eXZpd2lEUUVvckRyeGJZTXNuSWthVlFBNTBuaXNoRzNlWlN4MTdVY0NKMUhU?=
 =?utf-8?B?a0tZTDVXRmNiMkNkWVhsRlhtdzBmQzBCeHVXT0sxY2F5NDRQcmo1QXJBb2pE?=
 =?utf-8?B?czBVYnNvNHNZSmRUT3laTTI2WWt1V3NSVDBpOHNNUFFTR2lYcDBsOXJLdG9o?=
 =?utf-8?B?L2N5NkxibWJYNzZnc04vTVJQOCt6WXMyQUFNbXdmQ0E3WnUzc2owTHNCRm1a?=
 =?utf-8?Q?7m7njgAh78qt64M6PFvEY8OkZfZebTws1zHgbbj?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR02MB5386.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92f57a3c-0fbe-4abb-fa87-08d92f20acfd
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2021 10:39:23.5591
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ayz8E4c2KngyJWbh2c0q7nTz+TiOmBI1HRnVyYA86gZ+XxT8x0Ip5jbdDXN87UtPSQQUBRyLwyrKK56REYPLuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB3178
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQmFydG9zeiBHb2xh
c3pld3NraSA8YmdvbGFzemV3c2tpQGJheWxpYnJlLmNvbT4NCj4gU2VudDogRnJpZGF5LCBBcHJp
bCAxNiwgMjAyMSAxMTo1OCBQTQ0KPiBUbzogU3Jpbml2YXMgTmVlbGkgPHNuZWVsaUB4aWxpbngu
Y29tPg0KPiBDYzogQW5keSBTaGV2Y2hlbmtvIDxhbmR5LnNoZXZjaGVua29AZ21haWwuY29tPjsN
Cj4gbGludXMud2FsbGVpakBsaW5hcm8ub3JnOyBNaWNoYWwgU2ltZWsgPG1pY2hhbHNAeGlsaW54
LmNvbT47IFNodWJocmFqeW90aQ0KPiBEYXR0YSA8c2h1YmhyYWpAeGlsaW54LmNvbT47IFNyaW5p
dmFzIEdvdWQgPHNnb3VkQHhpbGlueC5jb20+OyBsaW51eC0NCj4gZ3Bpb0B2Z2VyLmtlcm5lbC5v
cmc7IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsgbGludXgtDQo+IGtlcm5l
bEB2Z2VyLmtlcm5lbC5vcmc7IGdpdCA8Z2l0QHhpbGlueC5jb20+DQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggMS8zXSBncGlvOiB6eW5xOiB1c2UgbW9kdWxlX3BsYXRmb3JtX2RyaXZlciB0byBzaW1w
bGlmeQ0KPiB0aGUgY29kZQ0KPiANCj4gT24gV2VkLCBBcHIgMTQsIDIwMjEgYXQgNDo0NSBQTSBT
cmluaXZhcyBOZWVsaSA8c25lZWxpQHhpbGlueC5jb20+IHdyb3RlOg0KPiA+DQo+ID4gSEkgYmFy
YXRvc3ogYW5kIEFuZHksDQo+ID4NCj4gDQo+IEl0J3MgQmFydG9zei4gWW91IGxpdGVyYWxseSBq
dXN0IG5lZWQgdG8gY29weSAmIHBhc3RlIHRoZSBuYW1lIGZyb20gbXkgZW1haWwuLi4NCj4gDQo+
ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4gRnJvbTogQmFydG9zeiBHb2xh
c3pld3NraSA8YmdvbGFzemV3c2tpQGJheWxpYnJlLmNvbT4NCj4gPiA+IFNlbnQ6IFR1ZXNkYXks
IEFwcmlsIDEzLCAyMDIxIDQ6MTQgUE0NCj4gPiA+IFRvOiBBbmR5IFNoZXZjaGVua28gPGFuZHku
c2hldmNoZW5rb0BnbWFpbC5jb20+DQo+ID4gPiBDYzogU3Jpbml2YXMgTmVlbGkgPHNuZWVsaUB4
aWxpbnguY29tPjsgbGludXMud2FsbGVpakBsaW5hcm8ub3JnOw0KPiA+ID4gTWljaGFsIFNpbWVr
IDxtaWNoYWxzQHhpbGlueC5jb20+OyBTaHViaHJhanlvdGkgRGF0dGENCj4gPiA+IDxzaHViaHJh
akB4aWxpbnguY29tPjsgU3Jpbml2YXMgR291ZCA8c2dvdWRAeGlsaW54LmNvbT47DQo+ID4gPiBs
aW51eC1ncGlvQHZnZXIua2VybmVsLm9yZzsgbGludXgtYXJtLSBrZXJuZWxAbGlzdHMuaW5mcmFk
ZWFkLm9yZzsNCj4gPiA+IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGdpdCA8Z2l0QHhp
bGlueC5jb20+DQo+ID4gPiBTdWJqZWN0OiBSZTogW1BBVENIIDEvM10gZ3BpbzogenlucTogdXNl
IG1vZHVsZV9wbGF0Zm9ybV9kcml2ZXIgdG8NCj4gPiA+IHNpbXBsaWZ5IHRoZSBjb2RlDQo+ID4g
Pg0KPiA+ID4gT24gU2F0LCBBcHIgMTAsIDIwMjEgYXQgMTI6MDggQU0gQW5keSBTaGV2Y2hlbmtv
DQo+ID4gPiA8YW5keS5zaGV2Y2hlbmtvQGdtYWlsLmNvbT4gd3JvdGU6DQo+ID4gPiA+DQo+ID4g
PiA+DQo+ID4gPiA+DQo+ID4gPiA+IE9uIEZyaWRheSwgQXByaWwgOSwgMjAyMSwgU3Jpbml2YXMg
TmVlbGkgPHNyaW5pdmFzLm5lZWxpQHhpbGlueC5jb20+DQo+IHdyb3RlOg0KPiA+ID4gPj4NCj4g
PiA+ID4+IG1vZHVsZV9wbGF0Zm9ybV9kcml2ZXIoKSBtYWtlcyB0aGUgY29kZSBzaW1wbGVyIGJ5
IGVsaW1pbmF0aW5nDQo+ID4gPiA+PiBib2lsZXJwbGF0ZSBjb2RlLg0KPiA+ID4gPj4NCj4gPiA+
ID4+IFNpZ25lZC1vZmYtYnk6IFNyaW5pdmFzIE5lZWxpIDxzcmluaXZhcy5uZWVsaUB4aWxpbngu
Y29tPg0KPiA+ID4gPj4gLS0tDQo+ID4gPiA+PiAgZHJpdmVycy9ncGlvL2dwaW8tenlucS5jIHwg
MTcgKy0tLS0tLS0tLS0tLS0tLS0NCj4gPiA+ID4+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDE2IGRlbGV0aW9ucygtKQ0KPiA+ID4gPj4NCj4gPiA+ID4+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwaW8vZ3Bpby16eW5xLmMgYi9kcml2ZXJzL2dwaW8vZ3Bpby16eW5xLmMNCj4gPiA+
ID4+IGluZGV4IDM1MjFjMWRjM2FjMC4uYmIxYWMwYzVjZjI2IDEwMDY0NA0KPiA+ID4gPj4gLS0t
IGEvZHJpdmVycy9ncGlvL2dwaW8tenlucS5jDQo+ID4gPiA+PiArKysgYi9kcml2ZXJzL2dwaW8v
Z3Bpby16eW5xLmMNCj4gPiA+ID4+IEBAIC0xMDIwLDIyICsxMDIwLDcgQEAgc3RhdGljIHN0cnVj
dCBwbGF0Zm9ybV9kcml2ZXINCj4gPiA+ID4+IHp5bnFfZ3Bpb19kcml2ZXINCj4gPiA+ID0gew0K
PiA+ID4gPj4gICAgICAgICAucmVtb3ZlID0genlucV9ncGlvX3JlbW92ZSwgIH07DQo+ID4gPiA+
Pg0KPiA+ID4gPj4gLS8qKg0KPiA+ID4gPj4gLSAqIHp5bnFfZ3Bpb19pbml0IC0gSW5pdGlhbCBk
cml2ZXIgcmVnaXN0cmF0aW9uIGNhbGwNCj4gPiA+ID4+IC0gKg0KPiA+ID4gPj4gLSAqIFJldHVy
bjogdmFsdWUgZnJvbSBwbGF0Zm9ybV9kcml2ZXJfcmVnaXN0ZXINCj4gPiA+ID4+IC0gKi8NCj4g
PiA+ID4+IC1zdGF0aWMgaW50IF9faW5pdCB6eW5xX2dwaW9faW5pdCh2b2lkKSAtew0KPiA+ID4g
Pj4gLSAgICAgICByZXR1cm4gcGxhdGZvcm1fZHJpdmVyX3JlZ2lzdGVyKCZ6eW5xX2dwaW9fZHJp
dmVyKTsNCj4gPiA+ID4+IC19DQo+ID4gPiA+PiAtcG9zdGNvcmVfaW5pdGNhbGwoenlucV9ncGlv
X2luaXQpOw0KPiA+ID4gPg0KPiA+ID4gPg0KPiA+ID4gPg0KPiA+ID4gPiBJdOKAmXMgbm90IGFu
IGVxdWl2YWxlbnQuIEhhdmUgeW91IHRlc3RlZCBvbiBhY3R1YWwgaGFyZHdhcmU/IElmIG5vLA0K
PiA+ID4gPiB0aGVyZSBpcw0KPiA+ID4gbm8gZ28gZm9yIHRoaXMgY2hhbmdlLg0KPiA+ID4gPg0K
PiA+ID4NCj4gPiA+IFllcCwgdGhpcyBoYXMgYmVlbiBsaWtlIHRoaXMgc2luY2UgdGhlIGluaXRp
YWwgaW50cm9kdWN0aW9uIG9mIHRoaXMgZHJpdmVyLg0KPiA+ID4gVW5mb3J0dW5hdGVseSB0aGVy
ZSdzIG5vIGRvY3VtZW50ZWQgcmVhc29uIHNvIHVubGVzcyB3ZSBjYW4gdGVzdCBpdCwNCj4gPiA+
IGl0IGhhcyB0byBzdGF5IHRoaXMgd2F5Lg0KPiA+ID4NCj4gPiBJIHRlc3RlZCBkcml2ZXIsIGZ1
bmN0aW9uYWxpdHkgd2lzZSBldmVyeXRoaW5nIHdvcmtpbmcgZmluZS4NCj4gPiBCYXNlZCBvbiBi
ZWxvdyBjb252ZXJzYXRpb24sIEkgbW92ZWQgZHJpdmVyIHRvIG1vZHVsZSBkcml2ZXIuDQo+ID4g
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvcGF0Y2h3b3JrL3BhdGNoLzgxODIwMi8NCj4gPg0KPiAN
Cj4gQW5keTogSG93IGFib3V0IHdlIGdpdmUgaXQgYSB0cnkgdGhlbj8gSWYgYW55b25lIHllbGxz
LCB3ZSdsbCBqdXN0IHJldmVydCBpdC4NCg0KQ291bGQgeW91IHBsZWFzZSBhcHBseSB0aGlzIHNl
cmllcyB0byBncGlvIGZvci1uZXh0IGJyYW5jaCBpZiB0aGVyZSBhcmUgbm8gaXNzdWVzIC4NCg0K
PiANCj4gPiBUaGFua3MNCj4gPiBTcmluaXZhcyBOZWVsaQ0KPiA+DQo+ID4gPiBCYXJ0b3N6DQo+
IA0KPiBCYXJ0b3N6DQoNClRoYW5rcw0KU3Jpbml2YXMgTmVlbGkNCg==
