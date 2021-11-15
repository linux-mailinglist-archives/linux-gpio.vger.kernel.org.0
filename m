Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 019B84501F2
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Nov 2021 11:04:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230364AbhKOKH0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Nov 2021 05:07:26 -0500
Received: from esa.microchip.iphmx.com ([68.232.154.123]:28004 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230419AbhKOKHZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Nov 2021 05:07:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1636970671; x=1668506671;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=4AUSo0XrFssgXSiWm+nBo7q41F1P3Cavtihzzn/N/0s=;
  b=UcCjsQ6Ffxi09fYh+fwyuDrTyLUx/hEPTvjCru5yh8i3QCJekNO+4S5Z
   rcEEtAjNB5jNSMAUWzvCSBgxTFoZQYt2N87E7RSMSXBtrjQmRhfQdBNoY
   Zh0nLkdRTZ4r4r/Iqa565yTwCYgEyXHhpvfKQ9b8sktbcONmwMWFKp9Ul
   Qf0lxVbgDP+9t81VF+iERsKuTKySttZ++UaywRcl+5NN0QpqiURBsImWU
   nk0p7bXpiDfQi3U6cwc/o/+BuneLaNnuzPDLgeVaBAsJJLQ6mUAW/FT7c
   fvp7h9GvF6QLm05/D4PAZhauw2hXkqmJ0zF2xXsxcrZLymSKkkqu1g5fx
   Q==;
IronPort-SDR: pJr82+QllOUJKduiGE2p+i45/3wOP1tbZZOebvPvrVQfohjKt9/jwH7ZxSm+Q+knowz6imbRwS
 A6F9aI0KpCPGyo7Ybj1RrqVjHcADCy6iBKaY9mAQ48ZXubr3qQEI3RC+ASy3knUJCtlivFTn1F
 xIqzLvjFA6YqXH/U0ljx+Of3SvPIy4cLOXxeQJOnIB+gMggMVj11Vo0YYIORLd25q90R0OEfDI
 rkh/PDKnFym0y5UMo51QO9/FJZHsHs1imc8i+qdNREFbZXhgrpdoTw0N6uVpNqEohgniQnaHFp
 S3KLFEOyrurURR3H7gYApzzP
X-IronPort-AV: E=Sophos;i="5.87,236,1631602800"; 
   d="scan'208";a="139122046"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Nov 2021 03:04:30 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 15 Nov 2021 03:04:29 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14 via Frontend
 Transport; Mon, 15 Nov 2021 03:04:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U5ZSK5oYPc4zixSp2zQdUutjrzLsKogA/r2cRS+xkV0kfvkXHU2BSCgf5JUbZr3SwvwTXlEYy4yS34LPBFGBbVnhV/fXvJ8Q22pXfW+1yjqjGR7BwfDwb1iV907qdCU0qw8yEjs6DhXsNHqX3Ty2JD+QBrnQhOq3OnuunNzT5ye3JUxrmNKZOCoZOZkblaqBSWYj63IgP5KItPeqyckGglEryhBe7FbOLrPQafS4qt03Ct4STa6viYWm29BhxoFbYdNFasqU0bBZ6SPt688SofDUhNz6mH46WoacQ5ZbR2g4fi+8lufsmKUgGCveGCUdqL6v0VFumPnoQwJ6qXDYvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4AUSo0XrFssgXSiWm+nBo7q41F1P3Cavtihzzn/N/0s=;
 b=gcwSV5K3bgi/YHI4+iE04ddlYDuEa7Rm5DHApLTCoHGh80bgtAg9VHUwo+vlN0eA2SVBK8WGtseTuZewsZmBnuq8iUVuYfTSwAPxnBDxPY939FecAHsXkCQsaucac+P8Ay7/L21ACl9f9nEben9B9GD56ykb9fLSkEC8eIIqef+Rr5oq3PetUoePmIedFKS3pnEtH30FWEjXqQHEzyx7RA+TldqWmZ59CuwKOauIVLnmvH8mjYgijPBs9BF++UEqYURFGgLE4FPwhwK3GzqmdtwgWWLryM60a24Btv+kgkqbj2u/nnnegIHYtlFU4wBV0a5VbYQ6w9NgxeDeWxee9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4AUSo0XrFssgXSiWm+nBo7q41F1P3Cavtihzzn/N/0s=;
 b=hkvl+lN9lTDWQHl/Nw00v3RDcnt4GPEiCG2dmbjdShLK5MFcLeFvutW2SEcjBoXWuxw9BDB1L0cZk9Pl4a1lBOp2G3L6BRvYQhcimFnvbpBuTsfoMHSNioVlP4MKZUr8H1OQiVbYE0CrFs1iioE7ZOm85200T2dkbiq0AquMTiw=
Received: from CO1PR11MB4865.namprd11.prod.outlook.com (2603:10b6:303:9c::9)
 by CO1PR11MB4962.namprd11.prod.outlook.com (2603:10b6:303:99::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15; Mon, 15 Nov
 2021 10:04:24 +0000
Received: from CO1PR11MB4865.namprd11.prod.outlook.com
 ([fe80::9c2c:29bd:3533:c0b6]) by CO1PR11MB4865.namprd11.prod.outlook.com
 ([fe80::9c2c:29bd:3533:c0b6%4]) with mapi id 15.20.4690.027; Mon, 15 Nov 2021
 10:04:24 +0000
From:   <Kavyasree.Kotagiri@microchip.com>
To:     <alexandre.belloni@bootlin.com>, <quentin.schulz@bootlin.com>
CC:     <robh+dt@kernel.org>, <linus.walleij@linaro.org>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <UNGLinuxDriver@microchip.com>
Subject: RE: [PATCH 0/2] Extend pinctrl-ocelot driver for lan966x
Thread-Topic: [PATCH 0/2] Extend pinctrl-ocelot driver for lan966x
Thread-Index: AQHXzKczQLW5pTJxGk6wI30c2nh+X6v6s6iAgAnDIBA=
Date:   Mon, 15 Nov 2021 10:04:24 +0000
Message-ID: <CO1PR11MB48652BF54099D976FDF50D6292989@CO1PR11MB4865.namprd11.prod.outlook.com>
References: <20211029092703.18886-1-kavyasree.kotagiri@microchip.com>
 <CACRpkdb6-Wa8KGnx9kD5zhPLBw1YDZQgfDPm35VJzNnt27d3Vw@mail.gmail.com>
In-Reply-To: <CACRpkdb6-Wa8KGnx9kD5zhPLBw1YDZQgfDPm35VJzNnt27d3Vw@mail.gmail.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2e7478f1-7514-4050-6ced-08d9a81f4d79
x-ms-traffictypediagnostic: CO1PR11MB4962:
x-microsoft-antispam-prvs: <CO1PR11MB4962997B274F803B1F69183192989@CO1PR11MB4962.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lEfJF0yMAKoY/z3X+JGw+l3t5mgRTjUk4CjgqT+onGxxbosxd4jVyccWBT5fU+vwevIfS5CbmPFsh5DRunX9AeD795u8K+4PNhZCU8rOn10dMRkMRGY2jOYx0uMoasP9kGhJgJ0uoaWTIkyhzH5J5bwKrL5Ql1A+pQylulhjhZZUhBePciyM+c2k/Jvzmdet2fwtrxZkafictUqqjG4v5bVU9qr1DDH6kjWnrsNDKwP9zRYMklLxLAIjdnwhVSr9JQhfs/1iPueSw4Kc/ezgWhiT0DTTSB/9aPkTHuEqMdlx/eph2UVvIqNaXxkD5WzrMMvzJIYF5GFcsFDnaTbUJUZ64q/CG/j6THN93GRJMl0jSVuUkgfofM4vwLeLTkGzZ8kiofEprxslHnob3HmknsqKaiIkMb/5ljES6kQKGsuMJNO4a5KOTlk3oQEWcNuarNjmcYzW6xN0ndw9hdPldmOTLWbcLgyZcwWpX/tvRYN9QFmgP9EpNFwyptvQJ6IaMFUa1YpIouM0iTQ5F3kDYsPSGFe9WMLOet2q/PmyI2DWnYjaX3zm9kbzCsc56tvmGsLWNjudjLYm6tGVoz9cPdWFjTBAHm78iAc4dzE/yqGQI1x0vNxgNRYM6EQdmF5TMAmzolhyIDu8RckPK8iuSCzdGa5zBd5S4xA+surkOfQFmpmNesT3GBJH/wmfuXaklQIEjL9qi05j6PjooaHiMg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4865.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(107886003)(8676002)(8936002)(7696005)(9686003)(66446008)(64756008)(66556008)(66476007)(26005)(53546011)(66946007)(55016002)(86362001)(76116006)(4744005)(38100700002)(122000001)(38070700005)(6506007)(2906002)(33656002)(4326008)(316002)(508600001)(83380400001)(110136005)(54906003)(5660300002)(52536014)(71200400001)(186003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q3dqVHJrTFdrdEFyanRoQ0NNOVhtUDJibTFodTJWQzJHUXI4UkFzOVBOT283?=
 =?utf-8?B?NkVKeFRpSklma1NJUkcveEdheWp2M3RaUDMraTlHSFdDUlJjTWZyM3hBZ2l2?=
 =?utf-8?B?L2M0WEw5cE9veDhQUW45QlU5N253RWEzdFZGaXAzUDlsZUFCWHlnQjBYVmk3?=
 =?utf-8?B?QWNNMkdRL1pmZnVLWFE3RTlsL3R0TUhRRVBuYno4MG81M3ZUNTVnazBHZE5k?=
 =?utf-8?B?RGpqRnkvWTEwVnVzb1c3Mjc5T1dMUnVTTmFsU2llSEFVMEltQndpMjU0czhO?=
 =?utf-8?B?a29HV2hjc2hYTjYzOFA5bldBMHNVN040V1BvaFVIUDVpTVFjUmR4a3ZBTFNN?=
 =?utf-8?B?Q1czb1FCU3h3aS9WSm1HSXVISThBWmYzSE5FQnNBYjBkVlhQQ1AvSWhXMzdH?=
 =?utf-8?B?SS9RSVZlUEhuUlczUFFpZUl3NjBkckZYS0RHc3huT2d2NnFoRlplSmRxaW42?=
 =?utf-8?B?WFJOQ1A2SWNzNFZCWFRxVXp1cEJaNHVvenZ5T1c2NW5BMUp0ZWQzaU1uTm5H?=
 =?utf-8?B?MzRJMDZxNDJnVkt2TXZOdlVMR21VeXNYMm9PT0l2dWZmT2xYMys3b3A2R3pF?=
 =?utf-8?B?cCs2dDBMRWluSzhtNWk3SFNLUzl2SFNVOGh3ODFDY1lKLzc4VUF1bFlaZXFE?=
 =?utf-8?B?amw2RFEyRWhjV1I2Tm1ES1BSQnZvRGRPUXlLKzQ2NklXWlNkeVNvR0JwSFVz?=
 =?utf-8?B?YWVuL296MmhGMC84YkdUeGxhQnVBTEFoVEF4UFBLdWFXcG8rRGo5dk9KRG5H?=
 =?utf-8?B?NDRjSWl2M0N4czl0SUg1VjVtQjRJUnlCT2R3clF2RktsbG1UNjRRR2s3R1NI?=
 =?utf-8?B?d2MxUlViVnRCTW1kNEd0cjhSTEt5M2ZtWVZuT2c0QlNyTHVVVkpmUXg4enRT?=
 =?utf-8?B?VVpoWmRWS3JRSUMvb1pVWTkyeXVRRzFucytGUDBzNm16NWNDK04yZ1diLy93?=
 =?utf-8?B?S0t2b21DWGRKWUNGb3cyUnMxdk52NEMwV2JBVk9BRFhPanMwSWVqWll2OUJ2?=
 =?utf-8?B?cndzZ2FYWmkxSHV3L2VXTDljS1REeWViT2d1djBzcGhqOWlPSit6b25vUGt5?=
 =?utf-8?B?cGpBTGxnYStTbk1kQVUxbFVWbjA0RmJqc0N1czBjZkh4NGVxWTBNT1U4NjFx?=
 =?utf-8?B?WUMrdXR1dTRXdnR0THhvUkwzOVpDYmQ0NU44WnhXOUt1VHRaVkE4YkV1dE9k?=
 =?utf-8?B?MHMxRWsySytCUDFXdW9vdFdMZDFpN0d2dTl0VWV4bENubzkrR2NtYU56QVJa?=
 =?utf-8?B?M1dhQmZETjdkd2h2VzFtcjhqRmhhdnlPV3pSZ2FyN21qbk1CVFc4VmR1RDcr?=
 =?utf-8?B?Y0llaTlBcGkrb0d6MVpuSG9RbHRSWU1aOVVVOWdRRXoyYVZNdVB3eHNYWjB1?=
 =?utf-8?B?QXlHTVJCelF4QXNwMVRoTVBMbjJPUC9CUWprRG1RME1qS0RpeE5pbnRmVEw0?=
 =?utf-8?B?OFVpNG1SY2Z5RStLQURLVTU3aW13SjNsT2NLaXE3em1JT2I3ZFhybmJ0V1gw?=
 =?utf-8?B?MEZBMUVoTWpUK0RwTlFNTVVXVmRRTFNISnl1YS9TQ1diTXhOU3R4MVhHZWF5?=
 =?utf-8?B?WUY5Z0xPcDlaU3c5S0VZMktjRWxkUHVmOXN6eVVyUWN5b0JWYW9SVHVpZ01N?=
 =?utf-8?B?MGpPaTd6YjQ2WFh0UHhNaERScTRjWitNVVdhMVRpb0FRZWJ5cTJhWEVCdlJJ?=
 =?utf-8?B?RFNuSlQ3TnBydk8rekFYK1JPL1BSdmJ2VUFjR1hPNmlBSGRkT01zejFSUHEv?=
 =?utf-8?B?WllKU0Nma000UFlKL3hSZktVZWZoTjFBTmhxaVBPenFSWTBwUERVRnIrd3Fm?=
 =?utf-8?B?SFZDaWp6Zjk4NzdoOERQR2lleHRibW80Q3hFVWs4cXhKS3BWU2tDZWY5SlMw?=
 =?utf-8?B?RjlMelp3T252MDFtWkFYajJnTkpBRW9wTk5kQ2J0VkRjVW8wUXYyQUd0YjJS?=
 =?utf-8?B?NWs4V3AvSUZoQnpvd2JxRkhLeDNreng2bGpKUkNZdTk0WG5tRUFLeFV5Wk1l?=
 =?utf-8?B?L3ZrZjg2dXVCOTA0SkQySFhPU21WNy8rN2tZUi9vKzgwaU50akQ5YkhkNEF5?=
 =?utf-8?B?c2JVU0VpZlE2azJNaG1CUmd3eW96QnpyMjlWRlEzcEI4U0RwUUZycFBxOGp0?=
 =?utf-8?B?U2hVcHE4MlVMbk10TGMzblp4UGNManllYWQzMTJSOVd5Ti9RL2lEK2dxWWVS?=
 =?utf-8?B?aEVyTUpMejBUczh2bTZhQnl5QytXKzBrSXRDSEd0N29ZSzBKbmpJQi9hR2NW?=
 =?utf-8?B?UXVrWk9YR0UvbHJjMkhFaGYybkZYOGRZMC9kdkxUUTEwdDZlbHJyUXZ4Q1Vl?=
 =?utf-8?Q?TkOln4ZAK39CAPlKyy?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4865.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e7478f1-7514-4050-6ced-08d9a81f4d79
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2021 10:04:24.5179
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pqENVb4Kei61FliHcPx3uvbhf9JohwWB/Lhkd2QnsUv+UFB4bAhobc80IOSUmn8vs17TILyMSurq7TWOfFeccPsFQ2DlExxg6KXdGxHYllngCInijhdCMPTF5spzcH1r
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4962
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkgQWxleCBhbmQgUXVlbnRpbiwNCg0KUGxlYXNlIHByb3ZpZGUgeW91ciBjb21tZW50cyBvbiB0
aGlzIHBhdGNoIHNlcmllcy4NCg0KVGhhbmtzLA0KS2F2eWENCj4gLS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0NCj4gRnJvbTogTGludXMgV2FsbGVpaiBbbWFpbHRvOmxpbnVzLndhbGxlaWpAbGlu
YXJvLm9yZ10NCj4gU2VudDogVHVlc2RheSwgTm92ZW1iZXIgOSwgMjAyMSAxMDoyOSBBTQ0KPiBU
bzogS2F2eWFzcmVlIEtvdGFnaXJpIC0gSTMwOTc4IDxLYXZ5YXNyZWUuS290YWdpcmlAbWljcm9j
aGlwLmNvbT47DQo+IEFsZXhhbmRyZSBCZWxsb25pIDxhbGV4YW5kcmUuYmVsbG9uaUBib290bGlu
LmNvbT47DQo+IHF1ZW50aW4uc2NodWx6QGJvb3RsaW4uY29tDQo+IENjOiByb2JoK2R0QGtlcm5l
bC5vcmc7IGxpbnV4LWdwaW9Admdlci5rZXJuZWwub3JnOw0KPiBkZXZpY2V0cmVlQHZnZXIua2Vy
bmVsLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgVU5HTGludXhEcml2ZXINCj4g
PFVOR0xpbnV4RHJpdmVyQG1pY3JvY2hpcC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMC8y
XSBFeHRlbmQgcGluY3RybC1vY2Vsb3QgZHJpdmVyIGZvciBsYW45NjZ4DQo+IA0KPiBFWFRFUk5B
TCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlv
dSBrbm93IHRoZQ0KPiBjb250ZW50IGlzIHNhZmUNCj4gDQo+IE9uIEZyaSwgT2N0IDI5LCAyMDIx
IGF0IDExOjI3IEFNIEthdnlhc3JlZSBLb3RhZ2lyaQ0KPiA8a2F2eWFzcmVlLmtvdGFnaXJpQG1p
Y3JvY2hpcC5jb20+IHdyb3RlOg0KPiANCj4gPiBUaGlzIHBhdGNoIHNlcmllcyBleHRlbmRzIHBp
bmN0cmwtb2NlbG90IGRyaXZlciB0byBzdXBwb3J0IGFsc28NCj4gPiB0aGUgbGFuOTY2eC4NCj4g
DQo+IEFsZXhhbmRyZSBCZWxsb25pIGFuZCBRdWVudGluIFNjaHVsdHogd29ya2VkIG9uIHRoaXMN
Cj4gZHJpdmVyIGEgbG90LCBzbyBwYWdpbmcgdGhlbSBmb3IgZmVlZGJhY2svcmV2aWV3Lg0KPiAN
Cj4gWW91cnMsDQo+IExpbnVzIFdhbGxlaWoNCg==
