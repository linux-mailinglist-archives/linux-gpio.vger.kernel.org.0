Return-Path: <linux-gpio+bounces-20066-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 791E1AB5712
	for <lists+linux-gpio@lfdr.de>; Tue, 13 May 2025 16:26:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF9303A7C7A
	for <lists+linux-gpio@lfdr.de>; Tue, 13 May 2025 14:26:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F0BA2BDC18;
	Tue, 13 May 2025 14:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="naNHX8Gn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2058.outbound.protection.outlook.com [40.107.236.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60CF212FBD;
	Tue, 13 May 2025 14:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747146392; cv=fail; b=VvsLhqNfv5qXcr/N156LwlQyRkuZLmeVWT3Snz0KEkbtR7Fgbhnb8OycbCm7PMVVcNQE0xQ8uUTu+LEcC6/jjIFROu0AhBv2YL6EApJUDttmP9MMN76i8GHG/MJwbth7GTLT1YpciNBhbJ2OeTiPu6mBz+Z6+WqpSDsUkG+mZO0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747146392; c=relaxed/simple;
	bh=8YcDJBWlGu14B0ZD+9E5mb8J2HpXX+BNpAF/uaT8OL4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=IyHeXHBSa8JJ/VsfKXfBKr6NvVsfKurgXleV8z52DuPxuTj189/dsj6K9PhvarVE4sO9s6gxSYCXvfIfWV1hsNSFy9CIDkeXEsOcKD7zKaJ2Ffw7y/9Uu9RIhjbXLY6gSwDGLq9inL/eyJdcnq9qUjXTB5a8fsql0tx4yFWT7ME=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=naNHX8Gn; arc=fail smtp.client-ip=40.107.236.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b4POCyCEAjcGlDhvQ0hoRzNX5aRMMAyXvb59zQ6J4iiaWqX05pnnwzCZ87MfGoCZTOY4DLFIfGqtn2H/0FdaR9TlAJFs5GTtL2YCOolzvSn/8dA3AKxzh/Ks8BXpFe7GB+yrEV7YggJx+XsZQrcMmDlmcFJBjqINGONsPtjK8X45KSkTOctPcYydD25hmMmOPGGmFXwLwQRHFaY/hEa9yMnmvPj5ko1H3ue3uV6htWtM1NlTLQa1jSjxJa+CuPLcZsc5pvEhPVhkSfOB2vsJj96mgmCC3icMK4X6zIIWJfHpwUz65WWjajrEtzd8VRz6qgeKxTvLgwWpp0UZ9elZuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lrdQRoJOEMtq9Y9qXZnYtl9ydcYqy8JgXv5Cf40cCa4=;
 b=yz/rK3/LXcNZWx5DwvNF2ZpIZUQs0bsvN9yCQwNXp7ufDrX4Xp606mYC9fJIVA4G6dUJufo6svo6W+GCE9iqoU9EjHQFyPy61/ppfDewzh5dS8Dftg1blOm9/trZX2W3VT86cgx3cPkAA+DPCeORRHErn0CaPgzsjYPir81nNwdFgTcTEg5JAWmyzMcaycRsR1BKJzXgELBG9zeYUkFcX9T5pz6/UNdJOdA/iyeloZdlWNJ534TRWZDwPl3T6rn0pqF6yQyokPJhTVIJRrwMuuIGRUVvnDjj2Y2lMM8Ons+5cYpbBaC8NHDWlpvD2NGSCyKBZ/zzQZ6oXg66j6UCXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lrdQRoJOEMtq9Y9qXZnYtl9ydcYqy8JgXv5Cf40cCa4=;
 b=naNHX8Gnoecp0KnGUVGcdBkV5qxkMNryHfRROer5wFBvxBiZGS+JhOI41uvkVZZXViuhSNrHyVoezU42pyb0Du2phwiUgk36sV8A06UD5tyetFEiaXAyBg6y+vixxPxhf2HDv10+uPdR9owU4IXnKsLFA9lD+cNeFEbqpsA0I97MNeaNG/4VxcnPDQfLgoxsaoKAP/5uV2n67wZ78cUyROcLfrHpH60/XCOXz07bd9rq99aRulnQFSnHD/Y40wuK0A8HsJcbA1AdtNbyi4R6NoYrwntAObCZw5S01/0V8EmtsNm0T2Tylf4BSV73VHcb3LKX7Nq/VfnIrO+OvMRsNw==
Received: from PH8PR11MB7965.namprd11.prod.outlook.com (2603:10b6:510:25c::13)
 by BL4PR11MB8845.namprd11.prod.outlook.com (2603:10b6:208:5aa::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Tue, 13 May
 2025 14:26:26 +0000
Received: from PH8PR11MB7965.namprd11.prod.outlook.com
 ([fe80::ad6c:cf56:3c3d:4739]) by PH8PR11MB7965.namprd11.prod.outlook.com
 ([fe80::ad6c:cf56:3c3d:4739%7]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 14:26:26 +0000
From: <Ronnie.Kunin@microchip.com>
To: <Rengarajan.S@microchip.com>, <VaibhaavRam.TL@microchip.com>,
	<Kumaravel.Thiagarajan@microchip.com>, <arnd@arndb.de>,
	<gregkh@linuxfoundation.org>, <linus.walleij@linaro.org>, <brgl@bgdev.pl>,
	<linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<UNGLinuxDriver@microchip.com>
CC: <Rengarajan.S@microchip.com>
Subject: RE: [PATCH v1 char-misc-next 1/2] misc: microchip: pci1xxxx: Add PCIe
 Hot reset disable support for Rev C0 and later devices
Thread-Topic: [PATCH v1 char-misc-next 1/2] misc: microchip: pci1xxxx: Add
 PCIe Hot reset disable support for Rev C0 and later devices
Thread-Index: AQHbw+gjXcEcB6a0LEe3pRMswGcUKLPQnIyQ
Disposition-Notification-To: <Ronnie.Kunin@microchip.com>
Date: Tue, 13 May 2025 14:26:26 +0000
Message-ID:
 <PH8PR11MB79656E8B640C7497F074DDF49596A@PH8PR11MB7965.namprd11.prod.outlook.com>
References: <20250513091557.3660-1-rengarajan.s@microchip.com>
 <20250513091557.3660-2-rengarajan.s@microchip.com>
In-Reply-To: <20250513091557.3660-2-rengarajan.s@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB7965:EE_|BL4PR11MB8845:EE_
x-ms-office365-filtering-correlation-id: 75b466c6-6e63-4b6c-e57c-08dd922a24f1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|921020|7053199007|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?YH1CeHkNTcf/QV22MVLQj9rufgg3rf2MRxvMwVIjs8xYQhnsiXkqlfeYILWJ?=
 =?us-ascii?Q?DPJNWARbiEv9DHdwXyt6WYJWL7dkG9/XMe5m9ecxF4fb3RfWdKsEgv6LYXBI?=
 =?us-ascii?Q?+C1Ke+X2zxq2+9EY02obb6E7bCXhsTTqxPZnYiwMJ2pbMv89rnXebPVhkdut?=
 =?us-ascii?Q?DyJcCYsZAYnh2t8N5/Kd91bZNPLVi0DSGaGXLMXScNTcva33Lrs+k43K6kVJ?=
 =?us-ascii?Q?MIVnfoESAFP52Yp9djeYt5oeJZjvN7wNVMTd01lbbPIIvyAYlVkbPlL9fm+/?=
 =?us-ascii?Q?hFQxgGgSxhobQmTo5xEU8afq4wBBV+a6B+cZqxbh6AO2d8T+x6fT81SNcq5S?=
 =?us-ascii?Q?OICCOkdHUtxYBUsIOOR8G4ASX8b8mYUffzmoe+C6ET05B7JTdg/Z8rl7dnGh?=
 =?us-ascii?Q?aI6ZPJVAk4fDlf1IAYuJwwPmlKe7cx1g2r+OvWE3QOTQEvoazOA+Wy/2t59B?=
 =?us-ascii?Q?k/LfM9VI+BCRbwUeD9GKXZG16+nmIx/jUHljV1O8+yhYoeQMRbI540YnbseF?=
 =?us-ascii?Q?40BBg2vBlC3nmRlMRCd4HjBTo7Q2LNCPcHJrS3yg5HHqPEL4KYmM1o6tFLfy?=
 =?us-ascii?Q?7ptN4gAWzjDOvil8qqoyCJzLKGxi+q2Hz9E5IJEsA/Ntwp6OqFNGD6jRdv8Y?=
 =?us-ascii?Q?/c3T9IGnVozMhB2VPAmhjlrWDDKR05gePI+XJz724A2ZSPA5q7xLYJNXYq79?=
 =?us-ascii?Q?bq00rgFvxdxWVo7kcIc4dPCBfv6W0sWR68jauZ0FQZkkX1URRVd6z2Xwlccy?=
 =?us-ascii?Q?QNXxsFkgalOMlsfdClAgxDvNkK+b/nKRQz5QoUG53xt3uF2JcTNPRg1aeaPj?=
 =?us-ascii?Q?NyQedvT2zPHSI34jc8dR4Hpv7BeNUK9ERhvE06nviW2NmlamRrKaRvXi8V4Y?=
 =?us-ascii?Q?o5wZz1EIxk57IKuJcNm9HOPzJK1Js3OHcD7QlyzYNA0BhqA2cUIoYALmi+mb?=
 =?us-ascii?Q?isCDN9nE0MKabfm6m4JGevhFBXkrkHGwr9DaRL2pkMd0uaikGvH7rAhOvYFA?=
 =?us-ascii?Q?xM6pzV4UOiuhmqNzfdiAKzJsmuPNE1DmDaGsBdM4lf/ZkYm3BkVR+qs243bf?=
 =?us-ascii?Q?8uDYzf8603rEY0gBI+ICCgjQhUusn5GKCdxiU0Trik11ebrezxhSt9BPWq/y?=
 =?us-ascii?Q?MDqEPL22qIewwLjdEd26+ApFRhpocba121Wt71me158zJ51f1+OquN3G3dQ3?=
 =?us-ascii?Q?yDZ8cTf910IqMMHbJcYnM1DjeZQ50mXRo+DWPit7XyjVMRHegWFp5cJb+gF1?=
 =?us-ascii?Q?9ABb8arFDyqupy2X7iXY+SjbbePeG1i3GnWXRxrE+1dTp9u6UO2r6NOKOzNI?=
 =?us-ascii?Q?IQp+JD9eu2UHi9QYQxxFrSyjudESEU7ezLR19Mz4q/KuwdBtWo9atoXFlStR?=
 =?us-ascii?Q?HYHDVKnBxntZYVXUmQbzq0eQw6Cev0g2IQSXP9A6xgZz2lUbCxqFsCQeB51G?=
 =?us-ascii?Q?ZVV5rNkDc71PGchnpuv+mS6jj1GE8KjVoiNnQN8eLD20ziVSu6YLW0UF2rci?=
 =?us-ascii?Q?cOb3+hRhNJwsu1Aoru2dRBtvDRhxIpulsUZi?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB7965.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(921020)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?xkRmktk+75u+x2Ck1yTVB2cxTaYRTbB9SNqQMG4Mv5sb7zKgnibCrYTPwYn/?=
 =?us-ascii?Q?XMpVgz3sRqKC563ScdpxO7H/K7o5szQEEMgB0pVvRhRYoiHbI9VdsUxGgTun?=
 =?us-ascii?Q?CC5XKabDunyDqLaeby9eZFGjEQUewE3brxCRdYnWQorpnWJXX5lfDaAdLaaU?=
 =?us-ascii?Q?O9FYa3ZO2T4q+R7kyygVua9VtW2ZG/73xf51IPq7rCO5CK3aeK90JUqtl7W0?=
 =?us-ascii?Q?rHlxrvbI35Kxqy8gr9CZ1B3ph4G/TGsA4UVF2l8D/yb4+wPYSPZSt4ERjozW?=
 =?us-ascii?Q?wt/0ufjIW8Q4mypFsjh2SxLbHbkodRXoopR4qam8JIycpTptltcxeUi7RU2c?=
 =?us-ascii?Q?TgEslU6n/SqM7POXJ3VZwLnhBeMvnM09vRfBpQoy9uJDbjBeQ5v1okvTbaKP?=
 =?us-ascii?Q?nRNUImVmcVu7flG6sZuKxRZkB0hGLOCgpD/rYkt4/KcOZ/ee3XDTABlPcKtk?=
 =?us-ascii?Q?FiyG1P5unmB9Q3SeywbORO046THp4UZ56Nw38l6vKSV4wYBGF9LGtNkc1Tw+?=
 =?us-ascii?Q?uXOxBPyf/GnRdwh8TofWOKBntcKWb/85zA+xAzDt8Tn1CovRegZhvboOi6/0?=
 =?us-ascii?Q?lhkWgHhD0j/JFA2xZX0v2OtKqRmNtW7p1u6QtbbCrnvhfxbA64Mht2ePXRjb?=
 =?us-ascii?Q?ZqE/2m/ClYGod5rgRvGBG8crXCSXDNAnrebu8XJyU13thAP3G7DTHMqqiuOs?=
 =?us-ascii?Q?E1pGmeWgV+w74magPAUNiRS0Fx5DApyxm604nNGsFzwcYpXBc3lcXr7wi5hh?=
 =?us-ascii?Q?viPEwkwtPqgLrT/VpigwMX8p07cqQsWBufBXU3TV6k70xx7uT/Ft6DIOR/ir?=
 =?us-ascii?Q?XDaWRGt+BY3uo2LYY8E2Wu0J/s69Kzb+9UcApyRVxpjxYlLIw6vKbdaPGgGI?=
 =?us-ascii?Q?6yanCJt1p320ivy7KAs0sG4uKrOTDem3VaGu60tyxIvb+46m9BEqQNnv+UQ/?=
 =?us-ascii?Q?INO0JSfMJ1mK5gknP346i4u25UZjIU2wXkrze46eEAQJbE8qnlcPWE96VyT9?=
 =?us-ascii?Q?bEmWx/QU67gGNSGWmF1GbIMC90WB6Ef/pkD9cExS33l1+zMjDeHycETWBe6P?=
 =?us-ascii?Q?n2RMCInyHnfJK2uWlWyLWCWWuJlvGhHR/EzqNpPA9Q/0Ohbqx2V2S+aOvEUd?=
 =?us-ascii?Q?Dg1kMClHCRsZf3hwH1SScC44BhXyTU7o7z2CjJblTh36ScvAE7eoR50Z4+WM?=
 =?us-ascii?Q?H1dstkvWLVUXJkNgTp4pESx42ZdZqbIyokc7VZ8GHF4PhCy7TrlvmIaUuF7T?=
 =?us-ascii?Q?1At5EQ1u/cAg621LUtXN21iBFRPJNIIv9mWQ4PIMWU21Mrd/EVnXhppMl6T9?=
 =?us-ascii?Q?n+95yEwvV798R4HOr8d9HA3UoL62EQg/hoWFtsH07Z7AYsXqV6x4soVAL95f?=
 =?us-ascii?Q?dPLUgApgmWNHSvZvuPXaVkQ1Qe9uBSVvjhMT3CvWPQyKFI4vL15o0F151OuQ?=
 =?us-ascii?Q?VbEUcTv2wa/MWVWwnarxR4LSPI1KPOZwhVP2ypycTLnMzElEk6HeIuaN76Gz?=
 =?us-ascii?Q?IkGefyy/j0cSKwRjkXi7h5mysIpdcbRCpHXPI9gpW+IHRGe/Q7RmPKXUxNHj?=
 =?us-ascii?Q?itw3hinqPzLoOJt2hZwwqlQ//hADJy72pouOU8wv?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB7965.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75b466c6-6e63-4b6c-e57c-08dd922a24f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2025 14:26:26.2248
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0GfdaqF+wPBFumlZG+HGFdH5RJQw/EiCWeqayt4K0lCj/qT5ISlDr8aitFChd5wGKrXyR/5e/k8Xr/o609wGwFPcJCCjIC+LKELq+4+3S7c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR11MB8845



> -----Original Message-----
> From: Rengarajan S <rengarajan.s@microchip.com>
> Sent: Tuesday, May 13, 2025 5:16 AM
> To: VaibhaavRam TL - I69105 <VaibhaavRam.TL@microchip.com>; Kumaravel Thi=
agarajan - I21417
> <Kumaravel.Thiagarajan@microchip.com>; arnd@arndb.de; gregkh@linuxfoundat=
ion.org;
> linus.walleij@linaro.org; brgl@bgdev.pl; linux-gpio@vger.kernel.org; linu=
x-kernel@vger.kernel.org;
> UNGLinuxDriver <UNGLinuxDriver@microchip.com>
> Cc: Rengarajan S - I69107 <Rengarajan.S@microchip.com>
> Subject: [PATCH v1 char-misc-next 1/2] misc: microchip: pci1xxxx: Add PCI=
e Hot reset disable support
> for Rev C0 and later devices
>=20
> Systems that issue PCIe hot reset requests during a suspend/resume cycle =
cause PCI1XXXX device
> revisions prior to C0 to get its GPIO configuration registers reset to ha=
rdware default values. This results
> in device inaccessibility and GPIO read/write failure. Starting with Revi=
sion C0, support was added in the
> device hardware (via the Hot Reset Disable Bit) to allow resetting only t=
he PCIe interface and its
> associated logic, but preserving the GPIO configurations during a hot res=
et. This patch enables the hot
> reset disable feature during suspend/ resume for C0 and later revisions o=
f the device.
>=20
> mchp_pci1xxxx_gpio is an auxiliary child of mchp_pci1xxxx_gp and does not=
 have access to system
> register address space for reading the device revision. Hence, the device=
 revision is retrieved directly
> from PCIe config space.
>=20
> Signed-off-by: Rengarajan S <rengarajan.s@microchip.com>
> ---
>  .../misc/mchp_pci1xxxx/mchp_pci1xxxx_gpio.c   | 31 +++++++++++++++++++
>  1 file changed, 31 insertions(+)
>=20
> diff --git a/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gpio.c
> b/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gpio.c
> index 98d3d123004c..3a2a1a4ef612 100644
> --- a/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gpio.c
> +++ b/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gpio.c
> @@ -7,12 +7,14 @@
>  #include <linux/gpio/driver.h>
>  #include <linux/bio.h>
>  #include <linux/mutex.h>
> +#include <linux/pci.h>
>  #include <linux/kthread.h>
>  #include <linux/interrupt.h>
>=20
>  #include "mchp_pci1xxxx_gp.h"
>=20
>  #define PCI1XXXX_NR_PINS		93
> +#define PCI_DEV_REV_OFFSET		0x08
>  #define PERI_GEN_RESET			0
>  #define OUT_EN_OFFSET(x)		((((x) / 32) * 4) + 0x400)
>  #define INP_EN_OFFSET(x)		((((x) / 32) * 4) + 0x400 + 0x10)
> @@ -41,8 +43,25 @@ struct pci1xxxx_gpio {
>  	struct gpio_chip gpio;
>  	spinlock_t lock;
>  	int irq_base;
> +	u8 dev_rev;
>  };
>=20
> +static int pci1xxxx_gpio_get_device_revision(struct pci1xxxx_gpio
> +*priv) {
> +	struct device *parent =3D priv->aux_dev->dev.parent;
> +	struct pci_dev *pcidev =3D to_pci_dev(parent);
> +	int ret;
> +	u32 val;
> +
> +	ret =3D pci_read_config_dword(pcidev, PCI_DEV_REV_OFFSET, &val);
> +	if (ret)
> +		return ret;
> +
> +	priv->dev_rev =3D val;
> +
> +	return 0;
> +}
> +


Reiterate my comment close to an year ago for the SPI driver=20
https://jira.microchip.com/browse/UNG_BRIDGEPORT-5468?focusedId=3D4336619&p=
age=3Dcom.atlassian.jira.plugin.system.issuetabpanels:comment-tabpanel#comm=
ent-4336619

"Just so we are clear. using the PCI config Revision ID field is NOT as com=
prehensive/safe a solution for checking the chip revision as checking the i=
nternal BAR DEV_REV_REG register's REVID. You are only guaranteed Revision =
ID to match the DEFAULT value of DEV_REG REVID.
While it would be highly unusual to do that, if a customer were to customiz=
e the (VID/PID) / Rev for his device they will not."

If you are going to continue to check revision ID thru config space in more=
 drivers for now, then for each one please open a new Jira so that whenever=
 you decide to do it the proper way you do not forget any driver that needs=
 to be updated.=20

>  static int pci1xxxx_gpio_get_direction(struct gpio_chip *gpio, unsigned =
int nr)  {
>  	struct pci1xxxx_gpio *priv =3D gpiochip_get_data(gpio); @@ -315,6 +334,=
10 @@ static int
> pci1xxxx_gpio_suspend(struct device *dev)
>  	pci1xxx_assign_bit(priv->reg_base, PIO_GLOBAL_CONFIG_OFFSET,
>  			   17, false);
>  	pci1xxx_assign_bit(priv->reg_base, PERI_GEN_RESET, 16, true);
> +
> +	if (priv->dev_rev >=3D 0xC0)
> +		pci1xxx_assign_bit(priv->reg_base, PERI_GEN_RESET, 17, true);
> +
>  	spin_unlock_irqrestore(&priv->lock, flags);
>=20
>  	return 0;
> @@ -331,6 +354,10 @@ static int pci1xxxx_gpio_resume(struct device *dev)
>  	pci1xxx_assign_bit(priv->reg_base, PIO_GLOBAL_CONFIG_OFFSET,
>  			   16, false);
>  	pci1xxx_assign_bit(priv->reg_base, PERI_GEN_RESET, 16, false);
> +
> +	if (priv->dev_rev >=3D 0xC0)
> +		pci1xxx_assign_bit(priv->reg_base, PERI_GEN_RESET, 17, false);
> +
>  	spin_unlock_irqrestore(&priv->lock, flags);
>=20
>  	return 0;
> @@ -412,6 +439,10 @@ static int pci1xxxx_gpio_probe(struct auxiliary_devi=
ce *aux_dev,
>  	if (retval < 0)
>  		return retval;
>=20
> +	retval =3D pci1xxxx_gpio_get_device_revision(priv);
> +	if (retval)
> +		return retval;
> +
>  	dev_set_drvdata(&aux_dev->dev, priv);
>=20
>  	return devm_gpiochip_add_data(&aux_dev->dev, &priv->gpio, priv);
> --
> 2.25.1


