Return-Path: <linux-gpio+bounces-8181-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF0392E674
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jul 2024 13:24:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0455F28761E
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jul 2024 11:24:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7585915A876;
	Thu, 11 Jul 2024 11:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="RtebbGaA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2060.outbound.protection.outlook.com [40.107.102.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 419BC37169;
	Thu, 11 Jul 2024 11:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720696800; cv=fail; b=QYzPw8883PYcKadWJY/bL1HgT3t0GFnwmot318B65Iq1phT/U6lxUS2OoDeWdYBA6Jms11CirLfIYF8jl06EP6A1NvmdX0hW+wuOAOprg4f+xclr66GSlYPg+kuF3k7o7m1zZ0fMtxMzKmyk3pYxxCLS3Mv8B8M66hx7PrAF2dw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720696800; c=relaxed/simple;
	bh=dxsNgk6TFwqDDwF4g0I/EDG+aCullZnrjD9ZaF11/Zs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=iwHBOu67L9BzN34+ccSA1a1ASeo7pgG+AcwYa9T9OBVTnco1mXHjDlVkdBq3luVq0DX2YzH1/DtXk75+SeYoO9doazFnEiagZF1hcAYv6cZUovM+ed97sKFyAc9T2It6DUkOt5ocN2J6aI3p3i4mEi5kzvsvntoMJfEHmTrYgS0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=RtebbGaA; arc=fail smtp.client-ip=40.107.102.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qFvtkNHUMVWAr9lOdDEGKE5SBXc0d+qT7t8t619D8P01Bzmzrqtccqetox3tT0jPGZvApdE5oXPtL73kszmPzOwhew/1pxo0z/YQTDOBXX0xdj6vks2MupadO7x0p0uqc+UcjTGorTzxqyKeGlVKkOX8CjnmltxiMFkVSnc5xIwm98rNoN56KZDWDg/mbch47RYpwYjCOk9Ex9q7hluULc1BShpFpR65IBjNMq3jbQsh7s75fOyyqRdiwH0no9iy8tkznpPFBBsqp8CNzWhEXJMTvTtopWNR/lqigpMmMEH+ZUW7FSCoBYE79jpWg5wEfExdclDjxUry/czV3WXPPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a05LRk0NWX2UUGtWdABMshmZsA0LM0K1Fx8eQ3+Imjo=;
 b=cRM2TXn/Tk6L0BMpRkTaPvQ9fjJAaUBBeqXUHpN9fRKxxj81okIeiKlBcN3A79BAzTup7ytkNtP1KuN/fNuJ+EoRNJM8EKQy0TR5ME7D6A0zmUvvOv9wdZXtAZw2m633ydD7q3/1rKtOG0z9CxmCrdlMoGeYUtHLq4mLdFH+bY7BQLDFDCcIcfeyh4LFjYABB+AvcGy/ZU+3VCfaV0g4uKfXqe8+KUdon9D6E70MWrfJFy/ENS67lOsIUNNH4a7Hw0F2mASH7pLfFIf/fgrS2s4ro2W+VC+RSZwBPMMMM/7LgTNhZ/d0t81esP+iU23TL2VpJtAo78iqLFS/DINRnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a05LRk0NWX2UUGtWdABMshmZsA0LM0K1Fx8eQ3+Imjo=;
 b=RtebbGaA5+UEtVejO6bIJqxgiCOkyBRUZC/nSVMsxP3pLcp4aTlnly2kYqklPMxOZtuDnsNMrixlfeXTZeTJxhdbfbnXwvDi2vPjYrzWSgvCEi6HORYjjQGGqJarBJoBgnUsOuNt9f8oOXGdySrqU+EMaMHUPo6R8ewirIUqoKU=
Received: from DM6PR12MB4465.namprd12.prod.outlook.com (2603:10b6:5:28f::17)
 by SA1PR12MB7198.namprd12.prod.outlook.com (2603:10b6:806:2bf::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Thu, 11 Jul
 2024 11:19:54 +0000
Received: from DM6PR12MB4465.namprd12.prod.outlook.com
 ([fe80::c403:4e91:4b3b:64f7]) by DM6PR12MB4465.namprd12.prod.outlook.com
 ([fe80::c403:4e91:4b3b:64f7%5]) with mapi id 15.20.7741.033; Thu, 11 Jul 2024
 11:19:54 +0000
From: "Buddhabhatti, Jay" <jay.buddhabhatti@amd.com>
To: "Potthuri, Sai Krishna" <sai.krishna.potthuri@amd.com>, Linus Walleij
	<linus.walleij@linaro.org>, "Simek, Michal" <michal.simek@amd.com>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Dhaval Shah <dhaval.r.shah@amd.com>, "Kundanala, Praveen Teja"
	<praveen.teja.kundanala@amd.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "saikrishna12468@gmail.com"
	<saikrishna12468@gmail.com>, "git (AMD-Xilinx)" <git@amd.com>, "Potthuri, Sai
 Krishna" <sai.krishna.potthuri@amd.com>
Subject: RE: [PATCH 3/3] pinctrl: pinctrl-zynqmp: Add support for Versal
 platform
Thread-Topic: [PATCH 3/3] pinctrl: pinctrl-zynqmp: Add support for Versal
 platform
Thread-Index: AQHa033SPIEmF7X8ckmVomMtGB/MULHxXjVA
Date: Thu, 11 Jul 2024 11:19:54 +0000
Message-ID:
 <DM6PR12MB446598C8CD60EEFFC6CF62BE9DA52@DM6PR12MB4465.namprd12.prod.outlook.com>
References: <20240711103317.891813-1-sai.krishna.potthuri@amd.com>
 <20240711103317.891813-4-sai.krishna.potthuri@amd.com>
In-Reply-To: <20240711103317.891813-4-sai.krishna.potthuri@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR12MB4465:EE_|SA1PR12MB7198:EE_
x-ms-office365-filtering-correlation-id: 0392baeb-976f-4b0e-58a6-08dca19b639f
x-ld-processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018|921020;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?zzackC7t+kv53B0IlKhD1mFq2PiDrTappIOZZzYxl7Ke7LGe2qHQkHVPjX9/?=
 =?us-ascii?Q?ifhh1sZAORWIBBdSjBImSlKvaUYa5kyAF3MheMYG/++nIkj3jjPXI1SXhzsw?=
 =?us-ascii?Q?GIJjRDOtv+sbPTs5PXzGOW/AVLr2h8SZ84AVFK9zDzZ/CyNR5oloazQuR/Cr?=
 =?us-ascii?Q?76+ddNQZnWR2renLSCi0xS+AIiZiaHwMbXpqQEsNDxP3+zfdFBbukhALduVS?=
 =?us-ascii?Q?gpkVtnMXTyWr2f66J0okBJaQMrlp5S0MjY8QK3acjwccQIbxr919u/1OSwpe?=
 =?us-ascii?Q?UuHQWBOqdhI8ythveABn4nTRaja4up3i8v4jPrOHS0RQv6Jd4E0fU9PYHCKo?=
 =?us-ascii?Q?fpUqf968IFTGfTAQ51EM8XYysOv/kcWnmILFzQLOPdogFuAfr3l2uKwwkjK+?=
 =?us-ascii?Q?I7XqzHfuEys/1k+qU1kaLUwQZQ8gEKmSd+U+5c/8yTvzKuLSmrl6mPmaOvzL?=
 =?us-ascii?Q?3bsuXq58GrRUG/JUzv0VlQ57NENqxjUp0fsiz3EJauLdgvdVj9XVTr8Xy3lv?=
 =?us-ascii?Q?J60bxVXP1GK4jvamnzS9Hwd4lezhntNOkt4Oj9kO+tJ19vZGhWhTt9qtyJL5?=
 =?us-ascii?Q?3NhcAUJ52SfSs5sEpdZ5sGixa8fmcVZyJ1ApoJu/hUS3UY/ovL9roA3FcgPF?=
 =?us-ascii?Q?LkoKR3sO+FK+RxEvIeitXrFoMbe4cUmKTpqX+Nzs3P2wFxGYE+wWth3woDX4?=
 =?us-ascii?Q?L6jqbPGMmO6mSGKvKTj5o1VuwWgl87OWVwalVwIJq9P+t8VNSNxMc87FhYEF?=
 =?us-ascii?Q?Culiuyu77qdQGDL4TatXBFz2L/H9j8PrUFMD9Q+c+epJsghIXZkok1ehYumj?=
 =?us-ascii?Q?37Em5bG34g/o5Grc328L3Mgjx5+BiH9zB66nC3eCqk7GNXjWibp6X0CnUQiW?=
 =?us-ascii?Q?EnseaIp+sEtOtBnmyZ3hrXHYVI2PQtzrq23h//BWfh7sF6pyFTL4ho+qoKGK?=
 =?us-ascii?Q?6ias6I1RbiYI1Os8TYTQxaXrCPslu564gjeAhmsb2lf3oGtuFzmrDO7w9Vg9?=
 =?us-ascii?Q?nEMjOj7fldW3gXRfepl8QNWtGFO4DpTrAVwoEjoPXKXiKFzcxJjnwzBDCzIx?=
 =?us-ascii?Q?nIOaBd16ZCPY5X9xZ6mQqD2vKicin0uVpH7SMbGYapRptR5BVrqzS6eDCbIP?=
 =?us-ascii?Q?JAydxTxz+iv7jg30GuaGUHdaVkJzO+iGJk3+sNt3DQjoYPxFmsMzrm3sAAlH?=
 =?us-ascii?Q?+5o3hIASvAqVgmfv5Ts4IpcOIA8WK4BejOdJOfRRQARxA1veMkRE2EPPpSUB?=
 =?us-ascii?Q?bqcp130Lqu6hxpIK5pJUEmoo+PV4mTWyACGRqfhac8Y0qAReEP6loCQ88qK4?=
 =?us-ascii?Q?tZBBJiTUQ+69gan6mZYWwn6EZo0mVkGtkiTqM922SRTZVO00Yw6TRtFYnnbd?=
 =?us-ascii?Q?UsCJswo1SkNOxEXg2P1G9KVdEKfQQHmUgy93GmjDWxzJC3YpaREOCTekw1Uc?=
 =?us-ascii?Q?GhguXeuYIdg=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4465.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?INlH74Bkpy0QUnvvFBbuCSW6FEdILbql40eDTUkncxQ8AbTC7pSSgYyLOP8l?=
 =?us-ascii?Q?UjzDxWa4+DImbdxHf6C2baKxgJVg6RjXix693x34APjjIHhVaHHlV2mDr2i4?=
 =?us-ascii?Q?9qTzM1G5GFCRmICcNChxbE5RExrfduP5lowB78F45NiaDPjD8mEc/sauNiLD?=
 =?us-ascii?Q?hX9o50zqU0iVk29t7ZMLkTPlzKg/4Kq77pQGQCcVimkw2BhCC62Rzh+tGyHr?=
 =?us-ascii?Q?paBx0IxgWo2eK7ZMC9HxJE8agYM4x+A+U8I8+mmaJ93dL7IySGFCix1QPhOm?=
 =?us-ascii?Q?G08KvyrEhp1Mw18GtDgrQM7zbP+8soBuSxcu5vIgvrHetzaij/PwnTHL6UI2?=
 =?us-ascii?Q?SyKAh+FbmTot9qNQC2McmpNnJHCHDoCJ4E2DubVxtwNWnRMiUpnNVfiYHFxa?=
 =?us-ascii?Q?St9nPP6mld65y6/Z+7jj3cIvuL6kXl9RkAZeKEww/4J6sDCX+Z5h5ofVVEKC?=
 =?us-ascii?Q?YPQ15Rsx7VI1EKLouzFC5imFdmz7a9VFqEO9irwYaT3xF9wv67RICVleAjfY?=
 =?us-ascii?Q?zPavY0k/TnhB4ZunZ9Ty8mXuLoxYcKQ6uOkLAbOEJIKdlxGUQ+QGMmI0aHYD?=
 =?us-ascii?Q?gdIA/uWeAcjlj+ODoes3624j1vCGBFmSrF9R4CrbnQQakVbb72bkcpBKCqfM?=
 =?us-ascii?Q?JBpNXkJuKFGoNc2GjqNeb0RFr9/HHyfJTzsPKex9fuxNyYrAiZFgiDhUXn8P?=
 =?us-ascii?Q?GZZUmvTFG3ZJ3SQdi1PRb25xa2iWWKEM3x/MlP14ObbQMHLsp7lxXip932TQ?=
 =?us-ascii?Q?3bwBi68TVLYPKV+6kWmy9QuoZ+TMS211bLnRN4yEHsw0fAkynpi6rQQm6iPR?=
 =?us-ascii?Q?mEM5oeDZFZJvjUqAly/9HgGhSwQlMy9I+xlRKMRhpXvXTRmm8g+BuFkv0Tmh?=
 =?us-ascii?Q?ohJItcR+6jQfrrK0tOuk08TzL7IhwDOXCd791i+P5aJufUjR8yhx9PzQgjCw?=
 =?us-ascii?Q?M8u1fLvpCE1oSjE17cxnvg1ZLOu5rPYTHqmz9RqCpKgYOBz7RTmGQZ1UADjH?=
 =?us-ascii?Q?KUnBvXUHRClWOASy6GfaUC8aoeofNZlkJlURKedim6VlxopbaY0x6+gspdn9?=
 =?us-ascii?Q?O9iGUtdsS07INbiMhARHshWTuG0if0EigKMVtnC069RjPtiTOiWGMIvAi4T2?=
 =?us-ascii?Q?VJ5L5TUyvG5RlFxcDLQaIiMiO6gIHouPtzBjrtjE+5f/zQZRg590MHwAiPMc?=
 =?us-ascii?Q?CObiTuUxvIJ9GY4NUyL/fWYh4F5azyE+roQR/tS9gb1WShwdp7fg0Tl15vtu?=
 =?us-ascii?Q?0QuX5U0upxUTaL4MozoMOoojoCNpaR0RpDjUcXNZ3r8YtHxbeB95AdJm8PIn?=
 =?us-ascii?Q?JqFBJ3rxmbKrWhGJVpGrPOiIMp6zLM1MG3ClC7nXkMDfZ/rrgLAiWkveFSBD?=
 =?us-ascii?Q?bKyRk1bnVic86RHUEum5UuiI4w/J+/nuGhSd0Gkov8RjNYhd4hR2eZ99DOSz?=
 =?us-ascii?Q?gkvAM4GTxvjRLsM8eI81JsLPl+5OgGac4JlATaHkSSQLZ7BUJ4dmHZvxLsaq?=
 =?us-ascii?Q?W+zeHlJ7mph/zEDtjbCt1AGy/NA/miwtm6KntqHQaj58Uz7jPG7233jxVIk/?=
 =?us-ascii?Q?DCSNCLds8VvidOK4EG4=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4465.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0392baeb-976f-4b0e-58a6-08dca19b639f
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2024 11:19:54.3073
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FY+2yKJNOovd7AfurtcjINor6pRQ9efZILh2KUwottMwycRBiDsbP3GdUZ+PgDjr3lU7PRMgC8BwcX1dkOWjmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7198

Hi Sai,

>-----Original Message-----
>From: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
>Sent: Thursday, July 11, 2024 4:03 PM
>To: Linus Walleij <linus.walleij@linaro.org>; Simek, Michal
><michal.simek@amd.com>; Rob Herring <robh+dt@kernel.org>; Krzysztof
>Kozlowski <krzysztof.kozlowski+dt@linaro.org>; Conor Dooley
><conor+dt@kernel.org>; Buddhabhatti, Jay <jay.buddhabhatti@amd.com>;
>Dhaval Shah <dhaval.r.shah@amd.com>; Kundanala, Praveen Teja
><praveen.teja.kundanala@amd.com>; Greg Kroah-Hartman
><gregkh@linuxfoundation.org>
>Cc: linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org; li=
nux-
>gpio@vger.kernel.org; devicetree@vger.kernel.org; saikrishna12468@gmail.co=
m;
>git (AMD-Xilinx) <git@amd.com>; Potthuri, Sai Krishna
><sai.krishna.potthuri@amd.com>
>Subject: [PATCH 3/3] pinctrl: pinctrl-zynqmp: Add support for Versal platf=
orm
>
>Add Pinctrl support for Xilinx Versal platform.
>Driver checks for firmware support to retrieve the Pin information, if it
>is supported then proceed further otherwise it returns error saying
>operation not supported. Latest Xilinx Platform Management Firmware must
>be used to make use of the Pinctrl driver for Versal platform.
>
>Signed-off-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
>---
> drivers/pinctrl/pinctrl-zynqmp.c | 91 ++++++++++++++++++++++++++++++--
> 1 file changed, 86 insertions(+), 5 deletions(-)
>
>diff --git a/drivers/pinctrl/pinctrl-zynqmp.c b/drivers/pinctrl/pinctrl-zy=
nqmp.c
>index 3c6d56fdb8c9..e2cfd3d512e8 100644
>--- a/drivers/pinctrl/pinctrl-zynqmp.c
>+++ b/drivers/pinctrl/pinctrl-zynqmp.c
>@@ -10,6 +10,7 @@
>
> #include <dt-bindings/pinctrl/pinctrl-zynqmp.h>
>
>+#include <linux/bitfield.h>
> #include <linux/bitmap.h>
> #include <linux/init.h>
> #include <linux/module.h>
>@@ -44,6 +45,12 @@
> #define DRIVE_STRENGTH_8MA	8
> #define DRIVE_STRENGTH_12MA	12
>
>+#define VERSAL_LPD_PIN_PREFIX		"LPD_MIO"
>+#define VERSAL_PMC_PIN_PREFIX		"PMC_MIO"
>+
>+#define VERSAL_PINCTRL_ATTR_NODETYPE_MASK	GENMASK(19, 14)
>+#define VERSAL_PINCTRL_NODETYPE_LPD_MIO		BIT(0)
>+
> /**
>  * struct zynqmp_pmux_function - a pinmux function
>  * @name:	Name of the pin mux function
>@@ -596,8 +603,12 @@ static int zynqmp_pinctrl_prepare_func_groups(struct
>device *dev, u32 fid,
> 			if (!groups[resp[i]].name)
> 				return -ENOMEM;
>
>-			for (pin =3D 0; pin < groups[resp[i]].npins; pin++)
>-				__set_bit(groups[resp[i]].pins[pin], used_pins);
>+			for (pin =3D 0; pin < groups[resp[i]].npins; pin++) {
>+				if (of_device_is_compatible(dev->of_node,
>"xlnx,zynqmp-pinctrl"))

Use zynqmp_pm_get_family_info() to distinguish ZynqMP or Versal platform in=
stead of depending on compatible string.
Refer drivers/firmware/xilinx/zynqmp.c for more info.

>+					__set_bit(groups[resp[i]].pins[pin],
>used_pins);
>+				else
>+					__set_bit((u8)groups[resp[i]].pins[pin] -
>1, used_pins);
>+			}
> 		}
> 	}
> done:
>@@ -873,6 +884,70 @@ static int zynqmp_pinctrl_prepare_pin_desc(struct
>device *dev,
> 	return 0;
> }
>
>+static int versal_pinctrl_get_attributes(u32 pin_idx, u32 *response)
>+{
>+	struct zynqmp_pm_query_data qdata =3D {0};
>+	u32 payload[PAYLOAD_ARG_CNT];
>+	int ret;
>+
>+	qdata.qid =3D PM_QID_PINCTRL_GET_ATTRIBUTES;
>+	qdata.arg1 =3D pin_idx;
>+
>+	ret =3D zynqmp_pm_query_data(qdata, payload);
>+	if (ret)
>+		return ret;
>+
>+	memcpy(response, &payload[1], sizeof(*response));
>+
>+	return 0;
>+}
>+
>+static int versal_pinctrl_prepare_pin_desc(struct device *dev,
>+					   const struct pinctrl_pin_desc
>**zynqmp_pins,
>+					   unsigned int *npins)
>+{
>+	u32 lpd_mio_pins =3D 0, attr, nodetype;
>+	struct pinctrl_pin_desc *pins, *pin;
>+	int ret, i;
>+
>+	ret =3D zynqmp_pm_is_function_supported(PM_QUERY_DATA,
>PM_QID_PINCTRL_GET_ATTRIBUTES);
>+	if (ret)
>+		return ret;
>+
>+	ret =3D zynqmp_pinctrl_get_num_pins(npins);
>+	if (ret)
>+		return ret;
>+
>+	pins =3D devm_kzalloc(dev, sizeof(*pins) * *npins, GFP_KERNEL);
>+	if (!pins)
>+		return -ENOMEM;
>+
>+	for (i =3D 0; i < *npins; i++) {
>+		ret =3D versal_pinctrl_get_attributes(i, &attr);
>+		if (ret)
>+			return ret;
>+
>+		pin =3D &pins[i];
>+		pin->number =3D attr;
>+		nodetype =3D
>FIELD_GET(VERSAL_PINCTRL_ATTR_NODETYPE_MASK, attr);
>+		if (nodetype =3D=3D VERSAL_PINCTRL_NODETYPE_LPD_MIO) {
>+			pin->name =3D devm_kasprintf(dev, GFP_KERNEL, "%s%d",
>+						   VERSAL_LPD_PIN_PREFIX, i);
>+			lpd_mio_pins++;
>+		} else {
>+			pin->name =3D devm_kasprintf(dev, GFP_KERNEL, "%s%d",
>+						   VERSAL_PMC_PIN_PREFIX, i -
>lpd_mio_pins);
>+		}
>+
>+		if (!pin->name)
>+			return -ENOMEM;
>+	}
>+
>+	*zynqmp_pins =3D pins;
>+
>+	return 0;
>+}
>+
> static int zynqmp_pinctrl_probe(struct platform_device *pdev)
> {
> 	struct zynqmp_pinctrl *pctrl;
>@@ -882,9 +957,14 @@ static int zynqmp_pinctrl_probe(struct platform_devic=
e
>*pdev)
> 	if (!pctrl)
> 		return -ENOMEM;
>
>-	ret =3D zynqmp_pinctrl_prepare_pin_desc(&pdev->dev,
>-					      &zynqmp_desc.pins,
>-					      &zynqmp_desc.npins);
>+	if (of_device_is_compatible(pdev->dev.of_node, "xlnx,versal-pinctrl")) {

Same as above.

>+		ret =3D versal_pinctrl_prepare_pin_desc(&pdev->dev,
>&zynqmp_desc.pins,
>+						      &zynqmp_desc.npins);
>+	} else {
>+		ret =3D zynqmp_pinctrl_prepare_pin_desc(&pdev->dev,
>&zynqmp_desc.pins,
>+						      &zynqmp_desc.npins);
>+	}
>+
> 	if (ret) {
> 		dev_err(&pdev->dev, "pin desc prepare fail with %d\n", ret);
> 		return ret;
>@@ -907,6 +987,7 @@ static int zynqmp_pinctrl_probe(struct platform_device
>*pdev)
>
> static const struct of_device_id zynqmp_pinctrl_of_match[] =3D {
> 	{ .compatible =3D "xlnx,zynqmp-pinctrl" },
>+	{ .compatible =3D "xlnx,versal-pinctrl" },
> 	{ }
> };
> MODULE_DEVICE_TABLE(of, zynqmp_pinctrl_of_match);
>--
>2.25.1


