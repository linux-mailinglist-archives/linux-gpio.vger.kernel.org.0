Return-Path: <linux-gpio+bounces-31601-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KLn+EFtUjGnblAAAu9opvQ
	(envelope-from <linux-gpio+bounces-31601-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 11:05:15 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E3CBC12323F
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 11:05:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4A2D83094673
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 10:03:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE52F366DB6;
	Wed, 11 Feb 2026 10:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="FCiKggKR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011065.outbound.protection.outlook.com [52.101.70.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C8C352C42;
	Wed, 11 Feb 2026 10:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770804189; cv=fail; b=iHSDm72oD42hCT+8WmxJgFaXCs2vqlYyLM7s2MdxFPnGtTn/ubWGJzaGt6nGTXRvEx6boRxCfzUzsgqJ5ZPd2fSTnYyoGCwcv0NJNuGh25jxisYsbdhGmnjXZu/o6NFWl1k2npnkeC+l7XAMyuJKW9HleFoRdWI0bkRRxKlAj7w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770804189; c=relaxed/simple;
	bh=U29iTyK0jhgXhWdND/vYUioJQhbqD5kf93nHorJknMw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=NCXYQ7wO8stpd5l5swt0L75OENxy3BhPzxBLpW3ZH4VU/pcXgv5+UHZcc652SQVoLjj/kQ75h1cpxDu3yws4PrTGpvwrt698lbT34Iiod8un4VPW7uSwTZsT65LiyFHLbe1hnnzaZXlrycP56Wjb39ZD9s7tD8+ADDrzhc4VUIQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=FCiKggKR; arc=fail smtp.client-ip=52.101.70.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eVX4f/hghsHskO0gD39vjGa1k7PdY8zFgFgyBJ1+Dk/gEyFyIcQEZQ5HNeQ1lI0PZR3RqJA/iK67zMCSbKGqDgl8PKIQJYXp1EGkiSUlmlAAv5v/UEo+U4mkOyOGg0X+lxyaPsOHYQwxiNOSRI9+Z/aiK+eiyAooLkHpOk7Nvs1gjzruV5+SXYrjD2e9a9nbjTZB02iaaZo9zHPCxI7DGs6sLyJ/ygZNePGEa14ZzZOYfM7DQbKbpOwtpjhWFq4EgytWkVU/rsOLJZ7d/e2FkFVPBfHncVHhe5+MEHJN2xrIBG7cg7Uyfs4JGXVJ5CBwG4zoQFN/FXDygCMC1XRXEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TcOe8L2tyRDd33CrrvLSrMMp+nLG6uS1h2tFgrWjJiQ=;
 b=kTa5mQW9BbHL/VU8hjwc65An4DJIMW404T6RJ80UBbj4fAzqQ9d4U7oexK8ODgpmI6/y5DcRDJ3CO1IwLHg7ety/JnHxYJgmCSb6qz3ZfOEnQk1beLuyq5EYz8GLq4o/SFe0rkwB1pwng5eqfSVM2whQ8Aqspo+UJHhW+4wiZ61fF45OSlmT7emRUHtLNJZoJebcUW68a4H1q9AzbMUMVMvsP1acIoq/4ApLXOD8qiiwTMckyz65xU7P9WpyROuwVq0tO8xcmRDcB2Bs6zrGx3bIdd6eILxPcDVFA7QS0lEmEQpDHU0CD8r1p2+i2dJfd3DaU+3WBGLWK8wIS+N0fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TcOe8L2tyRDd33CrrvLSrMMp+nLG6uS1h2tFgrWjJiQ=;
 b=FCiKggKRjOaUd4yjEvqhtbARm5NreEl1FuaTVG40s/ezQoJJxlHGoDgTFlEFtpG//z30J5K9XHS/tGsN5ShCUPMBBKfX2hoSTGyOXADh/kMV2Eoj07jTOJmexyyCzKLbAgx0pGjBgrThxgEQ7YtpwuYF/YcjUoUEH6m3jeFV47XwCbg3FlguiBWfbf24syvJgf6F8ItohOOW7lhJM0kXDgtFuC3lMDjjN1NfjOkjZegvQ7ZHQVRNP6i49ZbNeXnX9zs47K5vNkauXPsSIfy68YGU0Tw54H8XhueHPjNiO27tc9hxJJXVZqa+WV3z40tOkDFaOYIBr09D2kWSALQ5xQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8253.eurprd04.prod.outlook.com (2603:10a6:102:1bf::7)
 by PAXPR04MB8141.eurprd04.prod.outlook.com (2603:10a6:102:1bf::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Wed, 11 Feb
 2026 10:03:05 +0000
Received: from PAXPR04MB8253.eurprd04.prod.outlook.com
 ([fe80::2b4e:8130:4419:d633]) by PAXPR04MB8253.eurprd04.prod.outlook.com
 ([fe80::2b4e:8130:4419:d633%3]) with mapi id 15.20.9587.010; Wed, 11 Feb 2026
 10:03:05 +0000
Date: Wed, 11 Feb 2026 12:03:00 +0200
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Saravana Kannan <saravanak@kernel.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Pascal Eberhard <pascal.eberhard@se.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v8 3/8] irqchip/ls-extirq: Use for_each_of_imap_item
 iterator
Message-ID: <zlgj2xi72amihcs3r3vzifci6hrce7rio4bqx23aet6bo2f624@2qnwemabjlql>
References: <20260114093938.1089936-1-herve.codina@bootlin.com>
 <20260114093938.1089936-4-herve.codina@bootlin.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260114093938.1089936-4-herve.codina@bootlin.com>
X-ClientProxiedBy: AS4P250CA0013.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:5df::15) To PAXPR04MB8253.eurprd04.prod.outlook.com
 (2603:10a6:102:1bf::7)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8253:EE_|PAXPR04MB8141:EE_
X-MS-Office365-Filtering-Correlation-Id: df35bd97-868a-42a5-9aa1-08de6954bfc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+loLQ2ub9xbLM65tRfl7zQt7fuwSTRKTZnxZkR/uOGY2408FA3LbGxtJmZol?=
 =?us-ascii?Q?JpRQ14OXG9KgqHC4VbdIfSk3NJQBc3jj/KoICnSwOhAemllrB2stXHfVL9wa?=
 =?us-ascii?Q?dKRtwtTLkH1CnhV6HpZkOyamg8JqyS7GN7ftcYQ4ldHSKPAdMKJr84SL/DN+?=
 =?us-ascii?Q?WIaugp6K3TsguoUqryiRZmcNSs8+piBm6nhmzMFflCm0XoijxR56/2AnSomF?=
 =?us-ascii?Q?9QDifF/ZGWtGvjnbQ4FNmutxjBMc4KIJXXUwHgMr6qVrjzl4u+w6AQPplfzL?=
 =?us-ascii?Q?rdOSDXipITkHFPKGm+2q0TWfmFW5tCwuChxrg1X7IoTpB8XKRNitMzNP4DxQ?=
 =?us-ascii?Q?RRFs+B2DP9B5lUY7hTpeg1r8wzwaDebXFOiBhUNqJibYsM8uYeKbQnRL6LKY?=
 =?us-ascii?Q?8tcN2QYxHFzkLw/Xp8WL+3kbK7zMNlrkDg4HkhMwYFifyVWS/n4ltmPu7A2J?=
 =?us-ascii?Q?Xd1fmNNA3W7i9KRMYOcMtmN5Uo38HZJm0LrneYxnTuGcuN57RZsSf4IzVsW3?=
 =?us-ascii?Q?MQeNCgHju9yj6jPj25jgF8UKKFknmpfNH4k8cEJUIhT9RwtN+2aTo0E/9hBB?=
 =?us-ascii?Q?oLsGXxzyR7ewl46sd6X71bD0LjdPllSh3PKFPtrdxPrXwOeU4IKVarpp0f6k?=
 =?us-ascii?Q?fE0zTPi5KKfnZFp3LLgpnRBmNDj6bN3an2zkQNoLLLAPuM1R5FhhnRtgprhs?=
 =?us-ascii?Q?YGj18Tmfnd4wb6apDEJBjf4LWo3NAh4OLpLSmRSJgakwR+017YW0MAF4vW3P?=
 =?us-ascii?Q?uKfWnjGNrfH4ER74M150+aJzti5ruAUo9c3TqeRifnleReFoGtigIasX+nf9?=
 =?us-ascii?Q?KGBqPXj265ZNxjSMRmObI6nFavwQNvqsRqRrNL0+KSsX+sHGSlSZetEMdNft?=
 =?us-ascii?Q?gJ1nlabH+vYCjSRqojU6s4MdAoAceCTMCoEuc1x+fWkfcXF1SbyyWsPoKQOs?=
 =?us-ascii?Q?te93BHqfBiyRGJhuK9ig+thXMNX/unakE34ryBgz349SE2Ip0e8KdpMe7hNA?=
 =?us-ascii?Q?+y9G3Md0NSdGeEMECt4PfBsUyZd0SKbMq0wl7zySQnpWwJjJV0lF9iQfawuU?=
 =?us-ascii?Q?aRy9RY7CLSVCFd+U7AM9vtrYABeThhin1M+D2KHFx7wi5tyYJX33a71xX4BJ?=
 =?us-ascii?Q?dq4koMmULm+bKYmgxKf6zx2RYq9j8kcsWgy33N63rfg1v7Vg387wSlEJySyG?=
 =?us-ascii?Q?jmTy/gG5XQwMj8uOp0fO3VmqWq0jc31iO1ba54YzB53iuP+FSNyHYhVQvmsE?=
 =?us-ascii?Q?ve4ZpBoSnLTzTS3MNHb6XZylRyvwn0wdrzA7We3pJhR6690SCLqEj7bq2Hrc?=
 =?us-ascii?Q?ukCN3yR/LBj+ug+TbXcibngyHgCotgrMSNL0TNxqWJZyzcIV6WV3/NFiP6/9?=
 =?us-ascii?Q?4RI/xjneMShnwLNq2ZCfjUdtcvQtKJFrTpv4YhN07uQy52epccTlvJU1ShZT?=
 =?us-ascii?Q?0JbFiaoKa/6SQY+BDoDafOCuU74Y98v5Wdfklg6n6Z9Cq+T/bl+oxYRLLoFA?=
 =?us-ascii?Q?glOp2Bkyeiv4H1AkOz7bugbSHY9/29S0Qh8D4pwWlCSYZCKz9FABOFnKUesR?=
 =?us-ascii?Q?+vmC2SSZuZGIBJ7oUQA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8253.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/obzY43Ni2ae6J9p1lw//AjGtLaldVVL6z6oS8DxdSycnWRUwjoywgob89BY?=
 =?us-ascii?Q?KSFI+76EjWXYA9bQEwh9H0bsFcCd1bL9FRYtG2Sqv5df6a6YRsB/WhDWiOO4?=
 =?us-ascii?Q?ELgRWEsfdr4w3Bdp85SYFW3/RAwSCjBTbXrQiSaqIW9+eM1hzhxXji+5u7C/?=
 =?us-ascii?Q?ZnWf9gD44+fxh5dUWQP4xiJYQ9zkG1vIViGbATYf93VaqKXYUgvxo5A8xQxl?=
 =?us-ascii?Q?N2kHqN/x74eXgHTtG4htsOaZsq+1xkWvQlSf5RjTHpYeenzZWct0znN+KEMY?=
 =?us-ascii?Q?Tlbd1UFrhHdDlelQnG/+dcp7x+q74xOhy9mTRbPNEIkqe/ORASghwH1/b7LZ?=
 =?us-ascii?Q?hzXzWjeVHIW4J8850zMe4g5u9B87iar8IHCt3ZJAZJEdOuKMlc5mR4XUvhop?=
 =?us-ascii?Q?3lHDQGmUiq4u2t27IkhbMJTzZR/HihvS1Biky0n4cahRtXR0DFJqbFOLpFF0?=
 =?us-ascii?Q?iZiNqBrqYegUpBMAGyChllYDdgjLwHTpgeaidf7tb8VgJlMUUaEdy/yVpWO4?=
 =?us-ascii?Q?bQvd1X36KIDDCEr0AcrSqf6665P4tB10QkMBiqeHfmykyACy1yBS5NKzMEmm?=
 =?us-ascii?Q?wKI2sKPUFpjTGeM+DOAB9kiYmqBLQXkCEeTN3ugjK4OXCgKnrXkDXhG7bL2M?=
 =?us-ascii?Q?LzF3fpWHuQrq7+lWtE0Uc9yz/yXUiU0wbgIYL1+vCOWv4pE9qE4oVOpeOmP4?=
 =?us-ascii?Q?nNMavDcH6s6HGT5g6RXaDUFzWG3a1YIkdJzFZjXkG/QDtYmc2Ze+CYM9hv3N?=
 =?us-ascii?Q?iP+BUvF5YCvUC2fgMW+8IzhFqP7ltx6zPssMPvhxTDpsz6Ik/n+d7ug88Rwg?=
 =?us-ascii?Q?wSdmjZrrEtx22sSWtkKbWTWEmnCqzqKH1+0Fe8TQAIUsyoIkADlfGsHbsu8f?=
 =?us-ascii?Q?ajoT1wgapkBRhZmI49XDCoqOQaQ1eGYlm3hBa0m0dUOb3CfUXymdiUkEdPjP?=
 =?us-ascii?Q?ku+QRbuPEb4XQHj3Zpi3uKv7Ea0ekfq0Wsp23dh0MZTJKeEDgU6Lf8pSMFOn?=
 =?us-ascii?Q?lhyVSYDuAY912Om13bMYuVEG8SI6JwiTbHsB8Mje0eD+CL8GvHJyarL6lIDH?=
 =?us-ascii?Q?eXMk4nLwjliIlX2JYLp/axmLD7aGfmaomGJRKTGf8FsTr470dOubOhhUHcPx?=
 =?us-ascii?Q?XuJqPrONYWnDnHzlSad6Sb+yH5WIfPkpaRhlvYkESlSO9wpIjAMPQp2ZF3dS?=
 =?us-ascii?Q?7M+s+fOQgt3eKVSVlvwIaGdK9CWsS0j/sFnRipnjBcT88RKnBX3TIIuXJI13?=
 =?us-ascii?Q?g0NPXWVQL8ZtroUvPy0X/c1PKAGoB4fvfvQVlHd9ilQsfL388z9NnBsfc0NP?=
 =?us-ascii?Q?g1ijHBCWPkpCl2X+mRSIriiTJmz70fY5k15ju5h8foCztZVr2zFjuleX+85t?=
 =?us-ascii?Q?EZt7+Hf6mJlL/CMS1Fulsf3RGmGssh1Jxt94kBrAwveo5tA4wm44wu5whMXz?=
 =?us-ascii?Q?clP1YnCTXWzor9haRqR5JDUkM5M5rfzQ2vQvJehK47LhqXdhUkntGEadu5wQ?=
 =?us-ascii?Q?S15T9ejBIyZlqnKeEOSqQVgQ2Cxy/MQrLA8+oSKeDFj6IrxfBWBEypAgxnUN?=
 =?us-ascii?Q?fR+kSbaweWZ/IH69ErJ91w1zBXBx9TFs9lYdLXosPFzj/03/NgJ/4momdVPm?=
 =?us-ascii?Q?90EDAnid2bDTD8et2atdFPdWa+oqYdyvIoDf7A/rP56WXF4T29YKHHNaa8xc?=
 =?us-ascii?Q?3QdhfMd4jyXoZrVuDBi8h5Ldfv6pFDXF0Q4ESTLVeEnkv2KbXlmIdvce4XFm?=
 =?us-ascii?Q?3mksud9FHQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df35bd97-868a-42a5-9aa1-08de6954bfc5
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8253.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 10:03:05.0593
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 91lNpcgdSJkUGQ1vtTNE+pr6umxt/3iyA7WjuzGisoANJ+fwZLeqvcUrBGexidf/LWrfivXcj5lal6KK/6NX/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8141
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31601-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ioana.ciornei@nxp.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[linutronix.de,sang-engineering.com,linaro.org,bgdev.pl,kernel.org,glider.be,gmail.com,vger.kernel.org,se.com,bootlin.com];
	TAGGED_RCPT(0.00)[linux-gpio,renesas,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E3CBC12323F
X-Rspamd-Action: no action

On Wed, Jan 14, 2026 at 10:39:32AM +0100, Herve Codina (Schneider Electric) wrote:
> The ls-extirq driver parses the interrupt-map property. It does it using
> open code.
> 
> Recently for_each_of_imap_item iterator has been introduce to help
> drivers in this parsing.
> 
> Convert the ls-extirq driver to use the for_each_of_imap_item
> iterator instead of open code.
> 

The ls-extirq uses interrupt-map but it's a non-standard use documented
in fsl,ls-extirq.yaml:

	# The driver(drivers/irqchip/irq-ls-extirq.c) have not use standard DT
	# function to parser interrupt-map. So it doesn't consider '#address-size'
	# in parent interrupt controller, such as GIC.
	#
	# When dt-binding verify interrupt-map, item data matrix is spitted at
	# incorrect position. Remove interrupt-map restriction because it always
	# wrong.

This means that by using for_each_of_imap_item and the underlying
of_irq_parse_imap_parent() on its interrupt-map property will
effectively break its functionality.

Unfortunatelly, I am not sure how this can be fixed other than with a
revert.

Ioana

