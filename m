Return-Path: <linux-gpio+bounces-22035-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 28EDCAE5BC1
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jun 2025 07:10:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C259443D80
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jun 2025 05:10:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B127B221F3E;
	Tue, 24 Jun 2025 05:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="CeZ0FHuv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011032.outbound.protection.outlook.com [52.101.125.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6FDB35946;
	Tue, 24 Jun 2025 05:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750741848; cv=fail; b=jwUeb13OiBeAK1ccrSy0aTxMQwIrnmpm9pRU42pawusFFWU0An5dvq945fdP1V4x/oqep7od8Pup3W1a3pkStuV4PhOEzwr5Y4GHCmUhFMIZHT0MyMyZ8f4EgSp4sPtA8Qtv0xnS7XIdyoO6VMXps5avrc2edSurF5dB4Uis3/8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750741848; c=relaxed/simple;
	bh=t0ANQ5e3Nm7W9Gy5vW9gLaBYNDfSpHJoi0B+vcTupns=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=jpYdwKBRpqUUASEi9pp9DhFhIcSZ65vwfVyLvUyVs2T8I24lsZlIlDiAA1a/4nLQXegRe/li98eS5HewJjbkWL8UuCUcfEXGwQudmHLuyFOmnsGxzZPV7jByTCjrGa/Pk8ObOhS1aLYONUKOCl6KrzqluTRyrYBtDdi1koA3gGo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=CeZ0FHuv; arc=fail smtp.client-ip=52.101.125.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E7HQ8q770cXfewEAUHjEg6zX9fiuSH2/wtfBe3ldIZ/SKu68pLqGkszlNXFl1/23xSFKZ8hzNFmjHvIO4jMkmZ5Srh6rtqzNS12Vpnrl9IQnF/gPI9wSjoD/GbwH8uIatxLI7dwDqC3lrx3N/26EtvRsYdg3iZqN2GbhfKCogwAaZLu/GHHycQRV8THY49Xg2ck2kN28lxJgaCos9KX60NnnWQOnlBgLlncQQ6BYqc0NKApXOKEHshvBvFZm8443KiZgjactMGPpI0mmKKGpCMOGDKxMZUknio5WacMmFtPQrNa0xuF5l+BOZYgOsT2UsIgKedDPXuSRAgW51w3E7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OghIMYygF8wUkgY3v+mBTrddzPFjCgpvLPktnJuOloQ=;
 b=hj9kLKc3x80vu+ARKrHb1uauOP/PH+TXDuS3hAbWgRkHeKaysxUcm5RlJQ5x2WXSa0DI8G98RmPJn9lGk06Dh+mYwNSu8sH/i3qjH6i+wygtkMnxp28iQFsVU2mlN/J+cKjFtpLHjiZYKj8OzU/XPAU2SC7eVGgWkaUEHuPnW852OlPkPgifvhWRl5y+LkleQvJOEaYPT+Yw/JIP9rVLKbcVeR24gIbFtNttvzKrSgEvnhRv/hX0Tan66pEldQhSPi0jdMw5uj391Kq9ixMs2IbUAHZJxZtE9274NiyJvTiosg6YBRdC5yj30TzxJbK5WcX0ZzQICQRoGdi2HL9xlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OghIMYygF8wUkgY3v+mBTrddzPFjCgpvLPktnJuOloQ=;
 b=CeZ0FHuvvG6uUWhhageLkl9XDk7CpEH+Ks6Ugd5/Py9oywAjrXBFkw3zb0buponasJ568t+Bpb5em4o2roTlLpbuFUPnKRQUUU11GTN805oVvzYlGY+RVZxVYvI6yBH84YJijm496M09+wlJLoLX2r3gNPtaH2ON8K0NDtY0Z44=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS7PR01MB15007.jpnprd01.prod.outlook.com
 (2603:1096:604:39a::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Tue, 24 Jun
 2025 05:10:43 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 05:10:42 +0000
Message-ID: <87ecv9ragd.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 0/2] pinctrl: renesas: tidyup Kconfig
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 24 Jun 2025 05:10:42 +0000
X-ClientProxiedBy: TY4PR01CA0024.jpnprd01.prod.outlook.com
 (2603:1096:405:2bf::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS7PR01MB15007:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fe7da17-c3a2-404b-e585-08ddb2dd77ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?h21GZqFK1JGGVWhJ2FtTgLhFM8VMlQNxgnG6sLKH+2relVQj6l7znaafVD81?=
 =?us-ascii?Q?dVEKKgw/92Lw4H8oVZ0Ixvgc1eWv6eu30sWf+Q0tjbmvLXeFDa0/woH+pSBl?=
 =?us-ascii?Q?JJXEKswcHcYWCps/UjNXAEJDc1M6wDg0lU7WNJqj3SPymm9MpTSMUMXv/0Ih?=
 =?us-ascii?Q?iU6exlQY5tkI/BhS0fW6vcddsXF7YhcqR3WJedjkSchpEAuJ9XxdFIpL2Jnn?=
 =?us-ascii?Q?+S+LztRFpEOW4pv4eMyuP7FPpFQXtMQQAwaSVl2ycVFgzaAzdn12n1C3/3c2?=
 =?us-ascii?Q?ZZSHfiZDGal9aqVmzuQarI4RWzVu+ffzPKbHhupy3yvMNE70OEC9gsK8aZYw?=
 =?us-ascii?Q?8CbsgtUCRsLM9fECbLdDje822hgDGURSQ4P/JF+M7MFcA0PaIROLQhYp3z5T?=
 =?us-ascii?Q?lIJAEbgTwEFTqwvXaRqhIBzF6LnjRMAhQcs6dlixSBuML55KlyPVkNs+Zcp7?=
 =?us-ascii?Q?UjT+FOU458Kn/cQbEQMFtyF19+6R/azsIZUYAKmjflyrZ0wQMCKXAkDjhpEh?=
 =?us-ascii?Q?JK2oDaxq+BdeDa2ZrHpsP6Y7sRK3IL6jDk4nlrDrSezqfQX085idOWJ0op5L?=
 =?us-ascii?Q?kmCWKebn01tZsyL9tbzssVDrzrFCBpCK0tjCHXuclmMUBz1Byv9ONpGKU048?=
 =?us-ascii?Q?2tq3ajGkvdA1FYcYD2XqsvpHEwLdjjB6zGRtfoItQ5WdIChGwWUT21AnfrCL?=
 =?us-ascii?Q?/4rFi2qoLBcdf3XszbyrcIYHbXUXN1FvTscgHZqpAVIGLg/fvBwGcSrKTEcu?=
 =?us-ascii?Q?KL+E9l3oEErjKZ9esA2baIVulb/zRQUjVCOpXzo9j+oKMt0GuqD9ublnC52R?=
 =?us-ascii?Q?r9XeZhAfin5eCn7ez4RcSm2zizeIRixZ9uI+S6AOwMosmae8w38UMCUnSK2t?=
 =?us-ascii?Q?RxSWGOycwp3sFAkDP72MYlz1gnImW3LtCmXZr14TpN6KQ6u2H2EPRT49AuYE?=
 =?us-ascii?Q?vrwi90rSty4BGX5oX7KIIGk+9Ku2gH7OGM1dIcUpnHfx/V52a5llxFZXVnlU?=
 =?us-ascii?Q?iOZoiv+gKhwxQfyqWF1BuO+jj7g5MQ6fu6pqZ90SgVXo/O9vK++HI14Lwp1m?=
 =?us-ascii?Q?crnhBwXAb2jeexMuvstVCm/bHbklY3uNur9Aqrs6DhOVm9/C7uVyYQTycib+?=
 =?us-ascii?Q?VBsC+WoW0F78DKAlG+U2wmKFXn0W4ragI1zOF90ajWIde1zwv8BHsWjq77zP?=
 =?us-ascii?Q?5TKkJAeBWf6SxFVng5ZLogX+0UbtFS8Z8KDE5r2HWbsNfTkp+NihN4u2GKAI?=
 =?us-ascii?Q?EeRQiPIud/oXzcG9m9BqCKoCZquD9UjdCMnQB0HMeoS/l3SrdxCXSERV7UUe?=
 =?us-ascii?Q?lOg1lW0m6H2DoKJdyYYBC4TP22K1wK6lp4uwCCrOKQ+tOtEgySC9ccea1u1w?=
 =?us-ascii?Q?wSTtlU0Y7/zVZswgqkSM213B6PLjLpeD9VqizfocO1sZ1qcGcYt/1wzoPszx?=
 =?us-ascii?Q?PI910G6z3wfcfVNrNe6rzYcRGohbsi8gIKq5uK2qxCPkhHFOsszwzw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kqv36yBIOWPUUW00hjbgLCGBeMj8irB9S8A3HfU9ghWkps18NHaqGzoYEZhV?=
 =?us-ascii?Q?4Lz7cZzleAlFH8qnJug0Q4C+qUwKwKKRonGxrhFsgXPcwG4RERDHOruVN4mr?=
 =?us-ascii?Q?SaSosOYWj7pC+xT0MsEN2k8UUk5Ej+vDDhnSTYd/8yAuKBnhl//Epl4WrHub?=
 =?us-ascii?Q?mN5XHMO7mHeA+U7ZKHaVSRTJLY5qFRcuJ2ZEvIjMC71cPEuM9RpDmYiYaszI?=
 =?us-ascii?Q?LkoYfGAohYN3m6ABUmxm681hOgS3vYhnWS1x7F8fiAMkY59Vum1PCoEYkIYB?=
 =?us-ascii?Q?Qz3GZuxInLL2w8V2SLruMxL+FUzvogEwQlg/EFu+otqxmTJKCsGoHISv9RDN?=
 =?us-ascii?Q?UsgrYq0564oZuA5ZNwilT9qkuuSqMJ7URPVm4ZLVK8D7pAhuKOBjkV/0S+L0?=
 =?us-ascii?Q?xpJWRuau214+TzZ/E7cg5/91vFna8LroY34e6yqo0UztOv37urg9nH5mgATx?=
 =?us-ascii?Q?vYZaif5EYBi4uboVq+XUXalOLuLnBIeKzhuNpcLo4LX3wUEXvOyoKNDIDx1L?=
 =?us-ascii?Q?bJImHyKH/fLdOJmDIEz2A8KcKcC/m0oul4LO3sGkNbCQ2QWqMzbS+hd/7HBr?=
 =?us-ascii?Q?IMAyv13QnignZNXjl0O1Ga7i5rGbbZz0P5JOfvAxUIaBwGXamEyzq99RJh8U?=
 =?us-ascii?Q?/DOuZ5VJ5qj6M6Ph8RgnoksvuDWqVHlYEajCbTdNQ99lDyhPRpblhSqxef3s?=
 =?us-ascii?Q?c3mhbxN683EY4wIDHwEIiaiTuEQqx0JdABjPQDMxXAE6gK125t2NbUb+Ecch?=
 =?us-ascii?Q?fj1J3aAsPT/+g5kotShGrf745IB11RmWyE3P+Icy7ao2Ob22EoMDAS9zQg34?=
 =?us-ascii?Q?uw9Txm6bEvHlD0jRxbQ3sYXg3nAuFUwSfUv+3coiv9qMzUtEw+a+n9ywdawi?=
 =?us-ascii?Q?ABT+ktngrCET/lhuqzIiJCw1kgSGHPdEvInhsqDl2nUxJJqIJr/eUnLr3BGk?=
 =?us-ascii?Q?phK19Qn50855BX7deSG+X4WDpVPgPDr+4ZKsNQ+pWWOyTm3PyOPOcLUgSkhR?=
 =?us-ascii?Q?rp4cIlyZWirbnq7Cma29KwhMYaS/qO8kfkZu+jHJ+F1utD56oqvCat91TbxH?=
 =?us-ascii?Q?V1LHWyIoGfkkVzHNLF98PpM1xG2qh1Ld5whbEzh4hQQrOz/ZP/5IKUBlu1ng?=
 =?us-ascii?Q?MDJF54mcLolZmQYhwCyOKG+ScnsFrXOCx2H76gggO/O3l94terhPtE04o1DQ?=
 =?us-ascii?Q?Gt5aubMxXcRdKvNVpNTLbXuP4W3OXiiawcowhiHn4cTbWb6vqwmd/8uPMG5g?=
 =?us-ascii?Q?rs8k66NjTjGlbdjsnXuNbIOKxcmlWTUshw5RlbzCAGuQ4SzbesGYQGYxWDA/?=
 =?us-ascii?Q?lqH+NfH+jJjhX5epYUfk+84lRjVIijGmWPdXS0G9UbrRgUWI4+xq3jVk87fq?=
 =?us-ascii?Q?UIITC1ht5ZXtvL2qN/5VfXMRZwQXRhivBvbUa9Ts/47KIfcxoPbjGApoLh8z?=
 =?us-ascii?Q?2PDyVdyvJ5k3cFgTmC2CbeJwb89Bx+cYbZovay6HeVRj8CPHWapNdA4k4RER?=
 =?us-ascii?Q?fZMgQ7sGOQDiB33vMl7BIJ8WQLxlBai5oNBEkzm6CctdZt5cuWDV+OGzQwP+?=
 =?us-ascii?Q?1Kvc5VYbwlcmFN/oKXPrO3DE/4VJibk8dbJjae6llSUTkJElRYX6h/6A4cRy?=
 =?us-ascii?Q?khSU+jkb7qdaicJSEn6CejU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fe7da17-c3a2-404b-e585-08ddb2dd77ed
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 05:10:42.7544
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SP/x5xe/TWXWi/L56tA7JUVACqC7yLNZETxiVkfpJUdW2MXTFp3Bfo1UbHRYtuLvcow34m/Maz9b49JYVFE+BClOn11y8ADlBOT9jdlJsc3CqR555zHYF99dxB6o2wCu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB15007


Hi Geert

Current Renesas pincontrol Kconfig is randomly sorted.
And, the menu prompt is also ramdom.
This patches tidyup these.

Kuninori Morimoto (2):
  pinctrl: renesas: sort Renesas Kconfig configs
  pinctrl: renesas: unify config naming

 drivers/pinctrl/renesas/Kconfig | 246 ++++++++++++++++----------------
 1 file changed, 123 insertions(+), 123 deletions(-)

-- 
2.43.0


