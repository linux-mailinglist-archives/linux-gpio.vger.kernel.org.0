Return-Path: <linux-gpio+bounces-8210-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DAAE931172
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jul 2024 11:40:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ECE76B21EFB
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jul 2024 09:40:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89B2A186E58;
	Mon, 15 Jul 2024 09:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="zOTB7bhw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2066.outbound.protection.outlook.com [40.107.223.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A016641C79;
	Mon, 15 Jul 2024 09:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721036451; cv=fail; b=dAPLYccUAr2wsfci0yIPUZZnDRRCWQebc2PPdtOK3b2W/cvwCs7Ea4h5H4u2fpbeD4dzuYxn0SRBGGFHsBsxB6h9cPQSYMSGb5/pLfzCCgxyxxNlAATFblY0z6omzmxjXBYUFRat9BsP3mwz1Qp3jW/V8vtP5k67tuicj47t+Es=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721036451; c=relaxed/simple;
	bh=sMQtTkXE/wFls7GOv4Cmd33ChhaOz7p818C1AUAUOb4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=R3YgxSprf6JC3tAbQ6vPE5FOjkkzvuZTg6+PY/BmlJ4ruK+H9dd4GgGxveu0dhRyM7xL+F5piv35tUaPaETFg3zKbclLoZolW1GEIoYQQBMV/mOAUvVHdiU5HwaU5S6Vx20a85mIBqC/GsY+JhREm8iIrIM6/rmwq79c2ESepHU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=zOTB7bhw; arc=fail smtp.client-ip=40.107.223.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t42xUqseH3laxCLQ4z39EEsyHV3nZzB6n0wQIgRHf3QKGnjpjGrqKXZpJBjd4atag9upXM9A9JgQVMXI0SBuZLE7s3ZOdLAUR7tzrcuFQ1HJ3+7agUCtnUN5IZlb+cxRMqu+eAH86x2lWAINmqWY01q2zRcMdi1tIXOWxA1+tI+w/+kLbx4PL897G9PUqKLR68ZhI/Lgayf0yE2ZFF/buJ+mEPht4ILE9g9fVmabuZC0ARWX3frBImTmQvGxCzTXo1mpVHqu6KX22LOwg0HEyF+WjbF4F/8HT7EhucPqMnTm+C+xps4mjlAcCTFj0sA3ePgzN8Y9PSxr12WIxIwP/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Us/WzP7AlBzOkfJlN1TvXiSizFLXKXyY3io6PrZLwb4=;
 b=jhDonr2skIYhMh0c1zC/Zf7u2Xahkf1bzBm0EPOPSbHmbrk1NAof3HXaDSEE9lJnrSZ8dfaUPny0XXIhtDM6ElMtpdOOT21FwHY+a3VcJKinDyFR/xXRhnGnhZeDI2Z4NjeeF5IvoaiAsBbGragPAnaHEMVkbMaBZvgWCp884tAlNnInsq8HzCgE3okIYmIqDBsEB/ybVBRQgT8ePkvmAYAPcyJqylek9epqz5DhI1+AvizcTwgJzVwcze1H5vi1XoWPpStF6F1hg0aBOgQIDZFBqEhYaTJ9j4nvET1Vqe7KSSGmYkzPXj9iZGBojWWaZgz9ZQh/NOKhwBNPv5Bo3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Us/WzP7AlBzOkfJlN1TvXiSizFLXKXyY3io6PrZLwb4=;
 b=zOTB7bhwPR3/QOJBkZShhCQ/eaa3PsM7q7WsIBHl5tKp0eVZFioIpKSvAjm39sKmWHMNiy3YdsZBsbeEIlqxkRaDMsVwP5mfD1aosbTZkxlltS2pRhQ4Ni1TrvYFoyZTY7TTegQA6TY0pmgucf5x0gRkwWgiOPSNX9tuTWNtpSI=
Received: from BY5PR12MB4258.namprd12.prod.outlook.com (2603:10b6:a03:20d::10)
 by PH7PR12MB7987.namprd12.prod.outlook.com (2603:10b6:510:27c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.25; Mon, 15 Jul
 2024 09:40:46 +0000
Received: from BY5PR12MB4258.namprd12.prod.outlook.com
 ([fe80::3228:a925:2191:98b3]) by BY5PR12MB4258.namprd12.prod.outlook.com
 ([fe80::3228:a925:2191:98b3%4]) with mapi id 15.20.7762.025; Mon, 15 Jul 2024
 09:40:46 +0000
From: "Potthuri, Sai Krishna" <sai.krishna.potthuri@amd.com>
To: Rob Herring <robh@kernel.org>
CC: Linus Walleij <linus.walleij@linaro.org>, "Simek, Michal"
	<michal.simek@amd.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	"Buddhabhatti, Jay" <jay.buddhabhatti@amd.com>, "Kundanala, Praveen Teja"
	<praveen.teja.kundanala@amd.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "saikrishna12468@gmail.com"
	<saikrishna12468@gmail.com>, "git (AMD-Xilinx)" <git@amd.com>
Subject: RE: [PATCH 1/3] dt-bindings: pinctrl: Add support for Xilinx Versal
 platform
Thread-Topic: [PATCH 1/3] dt-bindings: pinctrl: Add support for Xilinx Versal
 platform
Thread-Index: AQHa033QW308t/1/wEicTxYqFPt3LbHyHoIAgAVuDDA=
Date: Mon, 15 Jul 2024 09:40:46 +0000
Message-ID:
 <BY5PR12MB4258706FC70CC02A0A7FCC48DBA12@BY5PR12MB4258.namprd12.prod.outlook.com>
References: <20240711103317.891813-1-sai.krishna.potthuri@amd.com>
 <20240711103317.891813-2-sai.krishna.potthuri@amd.com>
 <20240711223618.GA3237343-robh@kernel.org>
In-Reply-To: <20240711223618.GA3237343-robh@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR12MB4258:EE_|PH7PR12MB7987:EE_
x-ms-office365-filtering-correlation-id: 8556f67c-1021-428a-85c1-08dca4b233fe
x-ld-processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?SnSLzk6n5JizNwtNBja8hsJISBP6VT6MAw6G/YlzrJs9dNAlpma2CfZ4X6wN?=
 =?us-ascii?Q?1kH82v/H5rCbn449d3iczWI5hLXWkumRZX83Cqdj3bUUBdMCP1/Hc3JUK9V6?=
 =?us-ascii?Q?ZecR853yvSGc56E+Ijjk1bHjgajfe8+RLzDIh5Lek+i35Z51SIsvBlnSAeAs?=
 =?us-ascii?Q?6ZVonDyVZzJt3r/fnGAw3HUEgbp3aqvMEV+HLbEEUyZ/04rCy/Y9nmgUroKK?=
 =?us-ascii?Q?SVAnXvW7ZjajeGvgbSaHgorBQ880YPRJi7ymaS0iDQfdx3f+onsmrSs6P1ci?=
 =?us-ascii?Q?y9OEHk0VX97qgPlMDhvcWinFeB2vZGDQWM4BFDJF63ucEph4x8aeFQYiaR3s?=
 =?us-ascii?Q?pjverD+cLTdHQGf7DEH7DOj26pz+ci+5voQ6w6dUNYEmObbHJ0ImznmxEUD8?=
 =?us-ascii?Q?W8ycIKuowTUMCxWsn/xw+MFlrOqfBecpvi39BZnZX3XIMM+vmMl1jzQgW0ZP?=
 =?us-ascii?Q?ia9qdb2He5h5sXJYwz0QDX90fTM/KQzrlFyOh91D0IfJil6PNZR+MJCkuhhP?=
 =?us-ascii?Q?l5d3P+2ouTLldXFOJB9WjklW+YwphOqWBjHPsA2IEh6CuLEdjopJuYJPPqOG?=
 =?us-ascii?Q?jIFcEESGEAWZY586c+o68pfHXnfmPH8XZ891bZ52BlAlzHJnOgGeCfGv5NZT?=
 =?us-ascii?Q?NvrUTwdOb0DAnlol8XTkxey3rEVKaQUkSP4rcJjXX5r9jLJpNacBYenDyi2U?=
 =?us-ascii?Q?nBqM5EeCDeeYlIL/Vu1JDuw2BNza3UbFLSvuX7jrZHZQJ9sKC+moEHafWRDI?=
 =?us-ascii?Q?cylmPIlShaHEByVEtDbnBgdDX/xGI/0gpC3ssiZlPZlrdiFU6dhH2xVYrDW4?=
 =?us-ascii?Q?BnDGdaOo98C8iDEluE3VtfkDaCAR3/l2fjFr9RI4CUy43O3NNFzByn+9WcF+?=
 =?us-ascii?Q?mlrMnskG9uvZLJFSUqlE+eCmyKG27VISJ2N0nvLiQ1mwcNtzomqiWDeMNalY?=
 =?us-ascii?Q?5E8MVYbe7NwLKTCQIzbqWJoj0fAd99/0nz6hKJ1Z81ONgUd8GxM2TAdfuuj/?=
 =?us-ascii?Q?oaWWRdpyhqsVRsYj5waniV3Ankcsto13KuYB3T6/K7kIxnUaPTR2ngeXQa/W?=
 =?us-ascii?Q?rd96kWEY1gwVb3RrFMUYHOg0sMLLy2txasvw7WUYN87TV1ZfeTJeWOhF5X14?=
 =?us-ascii?Q?zJ4fP50VYva5R4ILdDphcqz1A0f6OZBwoaF/v/XYvMWv3q8ftybH6hQl8OOW?=
 =?us-ascii?Q?U0fjuLL3zwIqAvyy+XyR0ZAlEBUeqcuKOzXiERIl0/F+qM2H9yr2nBMnjRlT?=
 =?us-ascii?Q?UgkN+nG8s3unMUJ1o+dT4yoDKGeg+Vtidm3dT8e779aHY98jZYYrMV83qxYB?=
 =?us-ascii?Q?vKUOgWnAU+EFb9kQ6Mfq/mkghvq1tg9ZShZXeh6d+FfaWSaXCXzl7tC0eydO?=
 =?us-ascii?Q?PJpnYKEuB0P1GiCAge1jft6bmnguoWF+kNu0xWUnVLFvLlhBaw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4258.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?9Tl+Jkp+JM8G2ZFPrpmBCvhziqHYgpzOyw4XXwKDUKRcSeQG9Xth1oDyF6m8?=
 =?us-ascii?Q?ajbUn9qX3PyOF9kEeicMQPDmPzlepbosJjGvEuk/12fPuEfb6suUnwaTToaT?=
 =?us-ascii?Q?Zd2PRoKUA+lbo6pFSs4z5zaS/BNYpuDoVjEh2h0Q7rAN0d0KtmqmtOl2/eIO?=
 =?us-ascii?Q?vg+M44I8E+Vg4WS7wA7jdyRyuIDDkZiwGgj3Y+T60CTcsPc2WhxQJGbufu58?=
 =?us-ascii?Q?rgREPoz9uwS6ZHrehrJR4MxvbwY5EvCnOgqKC/FPL5miQbsqdDtZht2wBBU1?=
 =?us-ascii?Q?uU/LM1+fLfobaGHkGdj+RpfoIpp5qQ/dDyTGV35KjMQ0LowUQ3mMSyIpAYPl?=
 =?us-ascii?Q?FRjEV8CCli2Qohu7fgReefDF+HWmk8vGvYRQVSyOJ46H5diirBqkII+nGyLY?=
 =?us-ascii?Q?ujd4hg4rUnE3O6DBEraULU0gGm7I8rGsg9nu550sNbZSYb8FpHflwz837J6G?=
 =?us-ascii?Q?jBjPyG2LNyQ1OIzZFcRsMD+lg/98Vdh+JZzhuuBP6r/rpqzOB7lu6TM5Fhp2?=
 =?us-ascii?Q?zyXDMzK2M5OF+dAh8NKUjP8OC23/YaHiIEYcjajPp1tbVdqe3lJU2xWqZ6mJ?=
 =?us-ascii?Q?A0/1iCbGhT3kVaXlw/Xeh4iLLJ5M1/KV1y6Oda8X2CDSnN9mRtRSKyfL+p1o?=
 =?us-ascii?Q?lbJpdmgoEVxx2wTdoEfUBICf7ElYaulCS6QkesqGDCHhgKlDfAFLQ1elxA6A?=
 =?us-ascii?Q?lyFNIgkTEY4QhLvfiIeRfef/E9uTq2daCIDlfk3TNK7VLxCanRT1lCMtMuFl?=
 =?us-ascii?Q?LqutSzmeuKjEhcaUhhs6NspnPdP0qh3GyKCDdtfhBHDmRz9V54+mMOCNEWOX?=
 =?us-ascii?Q?bNmCf/yrDFE1570C0eFMtqO74jmc4uBO/Q6BnHxx1KKN2ZxJbjYr7U9oyla4?=
 =?us-ascii?Q?B58fJ10C7PNg6ONIvmqZ4+7ZRYO5DmyYhU3KbH+jaeFMMJaHMGp/m9jtJsW+?=
 =?us-ascii?Q?JM0krvHoJ6jGDkh7SwHjet0XS5xiXmbGRRzIli5vjGWnUoG6TWKPuThSS49w?=
 =?us-ascii?Q?voxIXmPCRfyOxY6O97RvmFbVeJ+1LpjJ7XufGO21zfHxUYAnp+MqwQp9gPpD?=
 =?us-ascii?Q?nw34uZDQukYXQiHp8bkpiW0YR0H2g+5gUx+R/nFA0Ilea8hoDhqSlxR81CS4?=
 =?us-ascii?Q?LoQyV6nChQKwYjOh3B907qlQdjbhfULqjWXNLnuCvBgUtjkw4axATTtacWHb?=
 =?us-ascii?Q?7Tm6c4PcG8Qc2b+WcbD9hYqNUKj2G2RZ3/Pup+PpIkyh99esnLb1VKXl389o?=
 =?us-ascii?Q?MJQV78zV4b0HVmznY4JEux/j+NS0fPmjGFu40mbc+/aiYOh4lPUiUbu1beHx?=
 =?us-ascii?Q?w56Z4NYIVoCQK/fgIzwgPJvpDiOh5O08whqN0rskB2dxdxFp2v5QuDJDfIjb?=
 =?us-ascii?Q?bRwWBQesTu6RaLvBby7DHHFRVCVfAyO9Bn8sz6ab4+jso3Q32CYP8wd/U5bj?=
 =?us-ascii?Q?bSyg8wpgsbjud/GjG+J8NkPfLmfsDgpYUVi2Fgo4aWtMzN8Ya2mPzMEl8fQ8?=
 =?us-ascii?Q?+QJJRl04xU22szNSqJ3xK7O8UaRAGI63++mDsH/eQ87K0BTK2kcTszGKRzdu?=
 =?us-ascii?Q?TvOlqNHpvg/Kxth9bg8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4258.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8556f67c-1021-428a-85c1-08dca4b233fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2024 09:40:46.2724
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GBFWSmxf9wOYb/iXmvedO+gC8UePQC8EmRFv453naXDU68dtHDXcX57lf4qm55X71rwebQVbn113T4P6XDerHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7987

Hi Rob,

> -----Original Message-----
> From: Rob Herring <robh@kernel.org>
> Sent: Friday, July 12, 2024 4:06 AM
> To: Potthuri, Sai Krishna <sai.krishna.potthuri@amd.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>; Simek, Michal
> <michal.simek@amd.com>; Krzysztof Kozlowski
> <krzysztof.kozlowski+dt@linaro.org>; Conor Dooley <conor+dt@kernel.org>;
> Buddhabhatti, Jay <jay.buddhabhatti@amd.com>; Dhaval Shah
> <dhaval.r.shah@amd.com>; Kundanala, Praveen Teja
> <praveen.teja.kundanala@amd.com>; Greg Kroah-Hartman
> <gregkh@linuxfoundation.org>; linux-arm-kernel@lists.infradead.org; linux=
-
> kernel@vger.kernel.org; linux-gpio@vger.kernel.org;
> devicetree@vger.kernel.org; saikrishna12468@gmail.com; git (AMD-Xilinx)
> <git@amd.com>
> Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: Add support for Xilinx Ver=
sal
> platform
>=20
> On Thu, Jul 11, 2024 at 04:03:15PM +0530, Sai Krishna Potthuri wrote:
> > Add Xilinx Versal compatible string and corresponding groups, function
> > and pins properties to support pin controller features on Versal platfo=
rm.
> >
> > Signed-off-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
> > ---
> >  .../bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml | 509
> > +++++++++++-------
> >  1 file changed, 329 insertions(+), 180 deletions(-)
> >
> > diff --git
> > a/Documentation/devicetree/bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml
> > b/Documentation/devicetree/bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml
> > index ce66fd15ff9c..68c378b17f49 100644
> > ---
> > a/Documentation/devicetree/bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml
> > +++ b/Documentation/devicetree/bindings/pinctrl/xlnx,zynqmp-pinctrl.ya
> > +++ ml
> > @@ -28,7 +28,9 @@ description: |
> >
> >  properties:
> >    compatible:
> > -    const: xlnx,zynqmp-pinctrl
> > +    enum:
> > +      - xlnx,zynqmp-pinctrl
> > +      - xlnx,versal-pinctrl
> >
> >  patternProperties:
> >    '^(.*-)?(default|gpio-grp)$':
> > @@ -46,196 +48,334 @@ patternProperties:
> >              description:
> >                List of pins to select (either this or "groups" must be =
specified)
> >              items:
> > -              pattern: '^MIO([0-9]|[1-6][0-9]|7[0-7])$'
> > +              allOf:
> > +                - if:
> > +                    properties:
> > +                      compatible:
> > +                        contains:
> > +                          const: xlnx,zynqmp-pinctrl
> > +                  then:
> > +                    pattern: '^MIO([0-9]|[1-6][0-9]|7[0-7])$'
> > +                  else:
> > +                    pattern: '^((LPD|PMC)_)?MIO([0-9]|[1-6][0-9]|7[0-7=
])$'
>=20
> Did you test whether this works? It doesn't because the schema is
> nonsense. The schema applies to a property's value, but the "if" schema
> applies to a node. And it's not even the node you are at, but the parent
> node. IOW, there is no "compatible" in this node.
>=20
> The 'else' schema covers both cases, so I'd just change the pattern and b=
e
> done with it.
Ok, got it. Realized now that while testing i used group which is common fo=
r
both the platforms, might be that is the reason it did not flagged any issu=
e.
>=20
> However, based on the rest of the patch, you should just do a new schema
> doc. There's little overlap of the values.
Ok, will create a new binding document for Versal platform.

Regards
Sai Krishna

