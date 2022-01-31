Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74F624A3EFA
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Jan 2022 10:01:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232922AbiAaJBZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 31 Jan 2022 04:01:25 -0500
Received: from esa2.hc776-43.c3s2.iphmx.com ([216.71.158.83]:10553 "EHLO
        esa2.hc776-43.c3s2.iphmx.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231173AbiAaJBI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 31 Jan 2022 04:01:08 -0500
X-Greylist: delayed 429 seconds by postgrey-1.27 at vger.kernel.org; Mon, 31 Jan 2022 04:01:07 EST
IronPort-SDR: gmHRLKXLzgryGtkCEfGHjIgsxYW7ZnJDss1Pk+oHpR3Fjr3R/mdWQe8OJyeZzePZozEwCYbpQN
 Y+rlhqHGUrejiQMbSIZGuyx1a+cgWCF05rNCUZ0nWlZX0GhVtTfpcWTwjQm6FsyOV9XiyL44xT
 7A+dWA0ytKW+FEREFfUUfSrsUw9/2iMqcfLe+dNGLBdcbqiYAqhv42xdsf8Ku3tC8JKej3VHrN
 bIdrjKL1Td70kKC/MRynPWvY9uRsSLi2wIvce+LozCgw/DzBPkFB+V08E3FoEvRODa4lt9PFCq
 FjaKtyZ5FhNLJF2jHOEC99tj
Received: from mail-vi1eur04lp2053.outbound.protection.outlook.com (HELO EUR04-VI1-obe.outbound.protection.outlook.com) ([104.47.14.53])
  by esa2.hc776-43.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 31 Jan 2022 09:53:55 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vwgm3yR7qh5dzqLWAX4IUJDxMr6mPxkhyxbEpkIBBnqAEY0IYGr1r6jLoSQAV3G8FhRkvAeVCtg9RhGPhPBNOSFxBlHLKXvogqSVKGNQp/aXmdGcAm1UpC7HSUdsMfksz+EyQ8JZrAc+6+19ZIveB0r0Zn+cpPzf3kgNQ/ThQwdqSmGk7BfjiCAXktI+VYxLlNTrdIxM8968TIkMj8s12Z8V1J6bls35cD4DKWhLIU2s5xQC5Uq4jFIFwnqGY4OepeYaBWWKIPfUlc9iWqbEkFe+DrQ9wD051LemN4FgnWikIczaS8svvMSxlErepbgUrSXuYx7O6J4c7Wv+ONxBHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5wzgsfqQQFq7MVqwqXEp1G8AZBWWN9Aj1RmBlhewQ1o=;
 b=Ta8XlwpLSc5pERoCYxMz9sZ5p6CSxxsvFrrQ4XaO6XaF/BlIM5lXaiWHHigF69KDq9Hx7aEMNDgLOcysbCtSH3J8qjntXWsL9kX+dbmYMFF1AXH4fN6QrVhYR21ye75giwwEm9T86NOGBn+bhghhj7PUU3YPwD3dj9J/xlbEqdUxWAx/pGB/N3DUvhOZAxrrHSOzk4zq1McytsViiBVYLx7iuxbk5dFVdo1Pl+2a+8Rb0Hfi7i6HW7x6mkiKv20uuH9TNL6nxN0HghqhnLUNfr749y92ep6w51zTovPjP3RarLgogahm1dg+nzznsFo77O1dRQH4ZFOwIfGdnrcQ0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=datarespons.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5wzgsfqQQFq7MVqwqXEp1G8AZBWWN9Aj1RmBlhewQ1o=;
 b=bcOMXY7J3MxUwEfT52xw2MNBKeJU11eDqOoaTuDL9z890b2tNca079U4HZVAbL1I99kKap0iVBfqKhEXr3Zbf8wypTOgDT9Rx3pqYBEXPOI3spGQrSCuqVq9eDoaOEy1x1RoXBuxpP+yDx9snCDX55pmFdtRQgUYCV13YaK5M+8=
Received: from AM9PR03MB7607.eurprd03.prod.outlook.com (2603:10a6:20b:41c::17)
 by AM0PR03MB4372.eurprd03.prod.outlook.com (2603:10a6:208:cd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.21; Mon, 31 Jan
 2022 08:53:53 +0000
Received: from AM9PR03MB7607.eurprd03.prod.outlook.com
 ([fe80::7996:6931:10d3:744a]) by AM9PR03MB7607.eurprd03.prod.outlook.com
 ([fe80::7996:6931:10d3:744a%2]) with mapi id 15.20.4930.021; Mon, 31 Jan 2022
 08:53:53 +0000
From:   =?utf-8?B?TWlra28gU2Fsb23DpGtp?= <ms@datarespons.se>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: RE: gpio: aggregator: Using chips with can_sleep
Thread-Topic: gpio: aggregator: Using chips with can_sleep
Thread-Index: AdgSkHY8uQD+bwgsQIWTp8UcFte50ABwSqOAAADXxYAAinzAYA==
Date:   Mon, 31 Jan 2022 08:53:53 +0000
Message-ID: <AM9PR03MB7607B29D98EC0AAA3980534AAA259@AM9PR03MB7607.eurprd03.prod.outlook.com>
References: <AM9PR03MB76077A7FB926CAE37E1D8565AA209@AM9PR03MB7607.eurprd03.prod.outlook.com>
 <CAHp75VdOY8a85us-DEAbySRAMNz9F50JHjov0nJRsQva0huzOQ@mail.gmail.com>
 <alpine.DEB.2.22.394.2201281537170.2807703@ramsan.of.borg>
In-Reply-To: <alpine.DEB.2.22.394.2201281537170.2807703@ramsan.of.borg>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=datarespons.se;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5f979507-c9a2-4dcc-cd6c-08d9e497354b
x-ms-traffictypediagnostic: AM0PR03MB4372:EE_
x-microsoft-antispam-prvs: <AM0PR03MB4372B81E2D7C1E088BF60ACCAA259@AM0PR03MB4372.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MrRMRSkZJCg5/MhTCAmMDHDTPwLW05uClXXW5cV4iJAFGyoFK3m3BX2C9ESBwluALNJazGiSCWzPsVshEhnSN7feWbuTVWez32mobtU/SUiKDoLv8ijUSZCyrX2pwSNArZpOmfqmQ7BfW0F1yKgbPYZqzyay07DfH+vynkvJphPNvBnE+k+nn+a/a89VHvfGkCe3tINSKqqMPYRVpYEm+hQcjumBnnhrJqpWvvC0ptgKxTzGLu5yUeJ52xx8dMhsb3aYYTcBLIc5moWihbFHul5sjciukANTVmEQxNWZGdbs7uAcd1pkT4XRHiklDuAHixbKsysxrE48bPHZ/VXuj9w443MXIy6LPhAH7PZUtbzITKeWvG+DamPB5HyjBwhG5wkzuGDFEUbwdlktImxOiH+t3aPKF8dBX6jvtTnzutxoqdtk+zJ4JCMCTN+KZ41vgbJUJKrmnzlMCYdWrQJrJ8Z58QCqlgrEu89REd7CxqFx8r0ROYTjT43+W2FUQUfap5GhX/59/KkYOt4PXaKGktqnCTmBOClG2sdtmb+5xwGAqEa04aw0Qjbs5pvZtZDGVUyhrIDauB4HjCwTcu4jSiJNG+pADUQ0Tbpwd/GDcc5UXW3X6KBAmJ8wMujGamc+amCZDQz8FCUp59UktBeUA4i+jwRZeE1aarLMgcmtup+CK1QXgOWcF1/x47SOdTE+3Oegy+HoNVvlmc+osc++ZQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7607.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(346002)(136003)(376002)(396003)(39840400004)(8676002)(66574015)(38070700005)(83380400001)(55016003)(5660300002)(2906002)(33656002)(4326008)(52536014)(85182001)(85202003)(6916009)(76116006)(66476007)(508600001)(66946007)(64756008)(66556008)(66446008)(8936002)(86362001)(26005)(54906003)(53546011)(7696005)(6506007)(71200400001)(186003)(9686003)(122000001)(38100700002)(316002)(20210929001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Tkw0cEZ1bkx5SkJ6NnI0cTlJQW5qNTlGcDFOUmFJdzQrTkd1NTdHYlhPOXcz?=
 =?utf-8?B?TitOOVBQc1JXNjN1SzA2eS9zQkZQc29EMlhJaVRIK2VwOFJvbkhwM2ZabXhn?=
 =?utf-8?B?YnFQM0hYWUpWb2U0SXJLU29vbjBoa01CaEpXT0x5RHIrSnYzejFzSGxpcGZT?=
 =?utf-8?B?YmYwOHQyZTNZK01DMVBFY1hEUXhyQVR0MmxPSW5BanZFNVNlekVwbWM1Rm9E?=
 =?utf-8?B?Y2puRUlaa01qUWMxd0N2VHgvN0VQa3J5OWlZcUNzeGxteTYvbUZGQWQ0MFhP?=
 =?utf-8?B?SmxYMGlsVUd2MCtTWFZ1dlBZR1FIRXltNlNSSUZYTUJrZEJFemg0cWtHaHk2?=
 =?utf-8?B?VjhScG1LN1E2Z3pZSDMyZ29LVG45OUZwZDloM3g5TUp3UFZXZ1Q4UDBwVHJ2?=
 =?utf-8?B?Z1IxTW0xUlk5a0N1R0tFT3I3Nk5HOWZlOTduYk1oalFWc2lsMG5neXNPbyty?=
 =?utf-8?B?N2t4bGVUaG1pbmZpVmFpenBxMGRkQ2pVdE10RUsvZFlyV080amxmcFI5Mitm?=
 =?utf-8?B?eFBiWm9IaWlZQkRsQ3RWT1hML2pBZXNtSW05WVA3amJ3YmI2eE5oMHV4ZUNF?=
 =?utf-8?B?QXBaZVo2cFVHZS8wNkp3S0h0bWN6U1BsY24rSjZLQjhaUGdHRnJPMllLcndx?=
 =?utf-8?B?aG1ObElIaVJTdE8ya2MxMG84bXpGY3VIWjZsVG8xNHlTbFFMT2RqOWtJUzhL?=
 =?utf-8?B?SExaSExDKzFkUVdIYzhybnVrcDRLZ2Z6ZVR2cUZucDhzRVVxVjcvanA1YU9L?=
 =?utf-8?B?SUNjb3lMR1JwRW5pUEtmTE1FTHJaV1BsR1FLR0szTDR4R1czWGJuSVNFdGhR?=
 =?utf-8?B?dEl4MUo0MUtQM01oNEtPRjJVem1GdnVpY2tuTDhaS0R6b21GczFsQmg0TmF5?=
 =?utf-8?B?cFdEcE51bnBNMEpadVFLNW1EZUVHRWN1VkZ1aDZ6c1ZyQnNmVWdjZTBObndP?=
 =?utf-8?B?YzZSQmxlbGlvMDI2WmNQMUpVcGpQYXdZL3BPWXJnQUtiUUEzeHEvdzcxSnYx?=
 =?utf-8?B?ZlR4MjdBMWorb2lld3hESjIrbzE4UFJFZU9kbGdrRVVKTHEwMmpnMDlFUGpi?=
 =?utf-8?B?ZkFGaXhkTGhtL1FUUDFuL3RZUHV3N1ByT1FHNSt4dk9ybGdDc01iUWE0Y3RV?=
 =?utf-8?B?TFVkNk56LytSenZNbkpSRTJYc2lEYW1jbGRwakVHbEc0SlhDNFhvdlpNcnEx?=
 =?utf-8?B?Q2txZXJZdFVYMUJoc2N1RlFGTW9NWDhmOUR2SGU0bkVRaTh1Y3g2YzZXNXA1?=
 =?utf-8?B?aEZGSTE0U2VRZ2lLTVg1UWhnWUZPMXJJdk41UElSMi92VHF5Rk5VaWFnTWhI?=
 =?utf-8?B?MGNDaUswbVdqRGdOTEhLNXNOSkZhckk2K3U0QU84NTM4aVVpdkY4QkxIQWFN?=
 =?utf-8?B?M0tURm10WmNHRjNJR0crSDIwemI0WUVYcG1ubVdvc1J1RjUxeGRnVkkrTmRp?=
 =?utf-8?B?SVVXeGdlWFBhMjFBZmJHRXRaREplRzdiaHZCRTEvWUQyWHp6d0s3MzZYRG1a?=
 =?utf-8?B?NmlWQzlKU29Zd3l4dDh2dHBwK0RDL3NPU3ZuL3Y0S3JTZDR6U24wZHc5cGpW?=
 =?utf-8?B?eStNUTM1NjRCNlpBYUd3LzhSTVptR0JTVlF0OHVJWGxZVGxhS0E4OVZ0cEpF?=
 =?utf-8?B?SkJ0Q3BzeFNXVllBdjV1ekc1cnd3cXNvQWdreEFlOFBYRkJ3RFZWZHVKN282?=
 =?utf-8?B?M0VWSnVYcXVwM3oyS3pjcktTSHJBVHBtanpzSmtaT05vVUlVWDBoYjhLeUlm?=
 =?utf-8?B?RzlwcENZaDFxYnBYV1NoWGNYNll6ZzZ1cWxXSzVrWFJOQVVGVmVPZFRPQjhV?=
 =?utf-8?B?RGcxMVZaMHczM2NiSUNVVlZRUElzVVIraEdjT1haRFN0SjRHaHFxUnVsR3Jq?=
 =?utf-8?B?TzNUMTg4MTNZbWptYUxxQzUrUG1lTUFaTTRQZk1jeWc3cndySmZZMnpDckhV?=
 =?utf-8?B?cFJiOWhGYjZ2SDhqUHdYVW11WHdEZVZkT2dyN3N5eEJwekVlZE9rbEpjcHpQ?=
 =?utf-8?B?aU1reHg4Umhjem9PQXpUVDRSMkdpUHorZEcrY2xEcjJDTWxrMmdCVXNPRE5H?=
 =?utf-8?B?V0QvZzlvU2tJdUJ0eHltVEw4MFdIYTN0S2tHYXdkWWQrVHVoYk1hS1hyNFc0?=
 =?utf-8?B?MmZBZ0JXNm83MnNLQWFKY3JSUmhnUjBNZjU1ZlFoNEE5ayt6UkxDWjg4bHR3?=
 =?utf-8?Q?7kXENA0LqPGl++o2535jbKY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: datarespons.se
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7607.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f979507-c9a2-4dcc-cd6c-08d9e497354b
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2022 08:53:53.3897
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c2c6b4bf-37db-40c2-ae4f-9fd06f3f8b9a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LuvX3ewyYZSv3rDP8z2IVgUZ5HTPRKGC49yNgc9HSjjAfGRiQ859zgkLHF25Yiw+pi85FpWom7pu+c+NZQc/zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4372
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGVsbG8gR2VlcnQsDQoNClRoYW5rIHlvdSBmb3IgeW91ciBmZWVkYmFjay4NCg0KWW91ciBwcm9w
b3NlZCBjaGFuZ2VzIGFyZSBwcmVjaXNlbHkgd2hhdCdzIG5lZWRlZC4NCg0KSSByZWFsbHkgYXBw
cmVjaWF0ZSB5b3VyIHdvcmsgb24gZ3Bpby1hZ2dyZWdhdG9yLCBpdCBtYWtlcyBsaWZlIGVhc2ll
ciBpbiBleHBvc2luZyBzeXN0ZW0gbGV2ZWwgZ3BpbyB0byB1c2Vyc3BhY2UuDQoNClJlZ2FyZHMs
DQpNaWtrbw0KDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBHZWVydCBVeXR0
ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPiANClNlbnQ6IEZyaWRheSwgMjggSmFudWFy
eSAyMDIyIDE1OjQxDQpUbzogTWlra28gU2Fsb23DpGtpIDxtc0BkYXRhcmVzcG9ucy5zZT4NCkNj
OiBBbmR5IFNoZXZjaGVua28gPGFuZHkuc2hldmNoZW5rb0BnbWFpbC5jb20+OyBCYXJ0b3N6IEdv
bGFzemV3c2tpIDxicmdsQGJnZGV2LnBsPjsgbGludXgtZ3Bpb0B2Z2VyLmtlcm5lbC5vcmcNClN1
YmplY3Q6IFJlOiBncGlvOiBhZ2dyZWdhdG9yOiBVc2luZyBjaGlwcyB3aXRoIGNhbl9zbGVlcA0K
DQogCUhpIE1pa2tvLA0KDQpPbiBGcmksIDI4IEphbiAyMDIyLCBBbmR5IFNoZXZjaGVua28gd3Jv
dGU6DQo+ICtDYzogYXV0aG9yLCBtYWludGFpbmVycw0KDQpUaGFuayB5b3UsIEFuZHkNCg0KPiBP
biBXZWQsIEphbiAyNiwgMjAyMiBhdCAxMDozOCBQTSBNaWtrbyBTYWxvbcOka2kgPG1zQGRhdGFy
ZXNwb25zLnNlPiB3cm90ZToNCj4NCj4+IFRyeWluZyB0byBtYXAgZ3BpbyBmcm9tIGkyYyBjb25u
ZWN0ZWQgY2hpcHMgdHJpZ2dlcmVkIGtlcm5lbCB3YXJuaW5ncyBmcm9tIGxpYmdwaW9kIHdoZW4g
c2V0dGluZyBvciBnZXR0aW5nIHZhbHVlcy4gQnkgbXkgdW5kZXJzdGFuZGluZyB0aGUgZ2V0IGFu
ZCBzZXQgY2FsbHMgbmVlZCB0byBjaGFuZ2UgdG8gdGhlaXIgX2NhbnNsZWVwIGNvdW50ZXJwYXJ0
cyBmb3IgY2hpcHMgd2l0aCBjaGlwLT5jYW5fc2xlZXAuDQo+Pg0KPj4gRm9yIGV4YW1wbGU6DQo+
PiBncGlvZF9nZXRfdmFsdWUoKSAtPiBncGlvZF9nZXRfdmFsdWVfY2Fuc2xlZXAoKQ0KPj4NCj4+
IElzIHRoaXMgYW4gYWN0dWFsIGJ1ZyBvciBteSBtaXN1bmRlcnN0YW5kaW5nPw0KDQpUaGFua3Mg
Zm9yIHlvdXIgcmVwb3J0IQ0KSSB0aGluayB0aGlzIGlzIGFuIG92ZXJzaWdodCwgaS5lLiBhbiBh
Y3R1YWwgYnVnLg0KDQpEb2VzIHRoZSBiZWxvdyAoY29tcGlsZS10ZXN0ZWQgb25seSkgaGVscD8N
Cg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3Bpby9ncGlvLWFnZ3JlZ2F0b3IuYyBiL2RyaXZlcnMv
Z3Bpby9ncGlvLWFnZ3JlZ2F0b3IuYyBpbmRleCA4NjlkYzk1MmNmNDUyMThiLi43MGNjYWQxMDJj
YjFkZjk2IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncGlvL2dwaW8tYWdncmVnYXRvci5jDQorKysg
Yi9kcml2ZXJzL2dwaW8vZ3Bpby1hZ2dyZWdhdG9yLmMNCkBAIC0yNzgsNyArMjc4LDggQEAgc3Rh
dGljIGludCBncGlvX2Z3ZF9nZXQoc3RydWN0IGdwaW9fY2hpcCAqY2hpcCwgdW5zaWduZWQgaW50
IG9mZnNldCkNCiAgew0KICAJc3RydWN0IGdwaW9jaGlwX2Z3ZCAqZndkID0gZ3Bpb2NoaXBfZ2V0
X2RhdGEoY2hpcCk7DQoNCi0JcmV0dXJuIGdwaW9kX2dldF92YWx1ZShmd2QtPmRlc2NzW29mZnNl
dF0pOw0KKwlyZXR1cm4gY2hpcC0+Y2FuX3NsZWVwID8gZ3Bpb2RfZ2V0X3ZhbHVlX2NhbnNsZWVw
KGZ3ZC0+ZGVzY3Nbb2Zmc2V0XSkNCisJCQkgICAgICAgOiBncGlvZF9nZXRfdmFsdWUoZndkLT5k
ZXNjc1tvZmZzZXRdKTsNCiAgfQ0KDQogIHN0YXRpYyBpbnQgZ3Bpb19md2RfZ2V0X211bHRpcGxl
KHN0cnVjdCBncGlvY2hpcF9md2QgKmZ3ZCwgdW5zaWduZWQgbG9uZyAqbWFzaywgQEAgLTI5Myw3
ICsyOTQsMTAgQEAgc3RhdGljIGludCBncGlvX2Z3ZF9nZXRfbXVsdGlwbGUoc3RydWN0IGdwaW9j
aGlwX2Z3ZCAqZndkLCB1bnNpZ25lZCBsb25nICptYXNrLA0KICAJZm9yX2VhY2hfc2V0X2JpdChp
LCBtYXNrLCBmd2QtPmNoaXAubmdwaW8pDQogIAkJZGVzY3NbaisrXSA9IGZ3ZC0+ZGVzY3NbaV07
DQoNCi0JZXJyb3IgPSBncGlvZF9nZXRfYXJyYXlfdmFsdWUoaiwgZGVzY3MsIE5VTEwsIHZhbHVl
cyk7DQorCWlmIChmd2QtPmNoaXAuY2FuX3NsZWVwKQ0KKwkJZXJyb3IgPSBncGlvZF9nZXRfYXJy
YXlfdmFsdWVfY2Fuc2xlZXAoaiwgZGVzY3MsIE5VTEwsIHZhbHVlcyk7DQorCWVsc2UNCisJCWVy
cm9yID0gZ3Bpb2RfZ2V0X2FycmF5X3ZhbHVlKGosIGRlc2NzLCBOVUxMLCB2YWx1ZXMpOw0KICAJ
aWYgKGVycm9yKQ0KICAJCXJldHVybiBlcnJvcjsNCg0KQEAgLTMyOCw3ICszMzIsMTAgQEAgc3Rh
dGljIHZvaWQgZ3Bpb19md2Rfc2V0KHN0cnVjdCBncGlvX2NoaXAgKmNoaXAsIHVuc2lnbmVkIGlu
dCBvZmZzZXQsIGludCB2YWx1ZSkNCiAgew0KICAJc3RydWN0IGdwaW9jaGlwX2Z3ZCAqZndkID0g
Z3Bpb2NoaXBfZ2V0X2RhdGEoY2hpcCk7DQoNCi0JZ3Bpb2Rfc2V0X3ZhbHVlKGZ3ZC0+ZGVzY3Nb
b2Zmc2V0XSwgdmFsdWUpOw0KKwlpZiAoY2hpcC0+Y2FuX3NsZWVwKQ0KKwkJZ3Bpb2Rfc2V0X3Zh
bHVlX2NhbnNsZWVwKGZ3ZC0+ZGVzY3Nbb2Zmc2V0XSwgdmFsdWUpOw0KKwllbHNlDQorCQlncGlv
ZF9zZXRfdmFsdWUoZndkLT5kZXNjc1tvZmZzZXRdLCB2YWx1ZSk7DQogIH0NCg0KICBzdGF0aWMg
dm9pZCBncGlvX2Z3ZF9zZXRfbXVsdGlwbGUoc3RydWN0IGdwaW9jaGlwX2Z3ZCAqZndkLCB1bnNp
Z25lZCBsb25nICptYXNrLCBAQCAtMzQzLDcgKzM1MCwxMCBAQCBzdGF0aWMgdm9pZCBncGlvX2Z3
ZF9zZXRfbXVsdGlwbGUoc3RydWN0IGdwaW9jaGlwX2Z3ZCAqZndkLCB1bnNpZ25lZCBsb25nICpt
YXNrLA0KICAJCWRlc2NzW2orK10gPSBmd2QtPmRlc2NzW2ldOw0KICAJfQ0KDQotCWdwaW9kX3Nl
dF9hcnJheV92YWx1ZShqLCBkZXNjcywgTlVMTCwgdmFsdWVzKTsNCisJaWYgKGZ3ZC0+Y2hpcC5j
YW5fc2xlZXApDQorCQlncGlvZF9zZXRfYXJyYXlfdmFsdWVfY2Fuc2xlZXAoaiwgZGVzY3MsIE5V
TEwsIHZhbHVlcyk7DQorCWVsc2UNCisJCWdwaW9kX3NldF9hcnJheV92YWx1ZShqLCBkZXNjcywg
TlVMTCwgdmFsdWVzKTsNCiAgfQ0KDQogIHN0YXRpYyB2b2lkIGdwaW9fZndkX3NldF9tdWx0aXBs
ZV9sb2NrZWQoc3RydWN0IGdwaW9fY2hpcCAqY2hpcCwNCg0KR3J7b2V0amUsZWV0aW5nfXMsDQoN
CiAJCQkJCQlHZWVydA0KDQotLQ0KR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBv
ZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZw0KDQpJbiBwZXJzb25h
bCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhh
Y2tlci4gQnV0IHdoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJv
Z3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4NCiAJCQkJCQkJICAgIC0tIExpbnVzIFRv
cnZhbGRzDQo=
