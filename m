Return-Path: <linux-gpio+bounces-12471-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2471F9B974D
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2024 19:21:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A7AD61F2123C
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2024 18:21:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E07C91CDFD7;
	Fri,  1 Nov 2024 18:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="PmihFnZw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2057.outbound.protection.outlook.com [40.107.21.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D281AB523;
	Fri,  1 Nov 2024 18:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730485267; cv=fail; b=p+6/zsWAPZe7BTqdCS+iPmjYEEoxksuTv5fEy7bviuOJsK1TyMmAy9HLF0GZKSsfFBJee9KovQswfZfc2TkQy5Mxvouy43VmvIpvysPZhuAE2nP8x3o+lgH+i1sEd9Vw0pv8sK4uQo3SDxauw+7sipDlP+m5ICDF31yxajM3NoA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730485267; c=relaxed/simple;
	bh=FWIjrpqclT8MzmvOEVduSGGSXqZViA/ftbgapaFRSQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=NPTremx97KyC2JxfTrBh34bVq0JMRQWkTi+7mBK+yDy8WtkbqXy/UOyr4gcdv0LHfFOKiSUjokFfbhtlPDr206XrR095zNVfHNDR0MvXpSl+k6qdjG9FMCDRvHiL6VeS7hR8twJ0Gj1zs8aShAsZ4UR3/JdnFRtsuSr15Hp+leg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=PmihFnZw; arc=fail smtp.client-ip=40.107.21.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j7yIFh4nEWIZnppWo9l7BqnYIlreN3qnChN2jCpDArbyYma633rRGybiCT6BKGZ7oNbe/HIV6Gpl/3DpmHr6eCluAP0sD4/LxM9KQ2Cl5C0YIM9SUloIF2KVseeHicFkK4gMvqwYsaBd2DGuxsOfEQDwHtz7ph5Q5MXcdAlgxNhIjs9uDgjHM5/h6sj72p/z2w8mZXzcGQ9gW8ZzdwqV7t7d9/4ur+pVedacr06n5DqYBH2O9Up1rbHMSf7HB8lIqI6fg0ldetmSA8tQV5MRlcU5pNWYHcP0kyNB0tCxd/aosk7vPmhnCud4GTRo5GhWIFHLIeGD2LuqoppzXnPhlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z81Jk2znZq/llD3WxpRLMAQpeONlqDuYgHLEbWH3v2w=;
 b=WJnKPCCrTWmV9F6rUUXeUFXw0xdCTitjov5TF190u2AaOd7nMFU7KQLm+zueklT16belMsewD9yP4RMJ7iLI3mQVZW+jeMM+Kem826G6tbI1aPAZpbmrxC9uRIMDTo9MvZlTBDPZFPz2Mr2GyWrpnvJja8HXkQeks9HcyhNIj/OeqgDc6XvqA4ZvAYQhMeOrtcDjVxumzLDK2zZ3jn7C1GA2gfeNJUS8ur3xA5tt1JY9aUqGo31YAAQxW4ZSRjlezeKY+BMIAAp98FWbChGWsHZKD4h4uTwbIRq4ulD8kcIkWzw6CaWRupmUWO+brahOQZrJFvhn2tvbV27+iVg70g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z81Jk2znZq/llD3WxpRLMAQpeONlqDuYgHLEbWH3v2w=;
 b=PmihFnZwomZXdqW7KhpXEAn7uu8K4yafMoW9MhbQWV3Qit+eTyUcqLCvKyBdDDlnDfarkTsdA2/mU3+lYWLpvf6SOdupjlVHsHyUuVRuwdOKDNes0/KbotQ3lYtfvlEnVvo1k4INVS772PF6ObSwU3X74SN2Y1QTPXJcnJ44FijygJ/mO6kGXS3o/7eqcdnuO34nyhCNmfyxwpWF5s9GzXhqSZQ1LFJKrc5usgV6kaSWmz/DzNbqUz3YnStWwIhBvaE+1V0bsqDgXWsq4EHiPzsvJ71uHnR6qXWyMcaTZCWU/muu//iwGCJ3befELCU+CGxOGPpk+XSNPhIP3J8RyQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU4PR04MB10483.eurprd04.prod.outlook.com (2603:10a6:10:565::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.20; Fri, 1 Nov
 2024 18:20:59 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%4]) with mapi id 15.20.8093.027; Fri, 1 Nov 2024
 18:20:59 +0000
Date: Fri, 1 Nov 2024 14:20:51 -0400
From: Frank Li <Frank.li@nxp.com>
To: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>,
	Larisa Grigore <larisa.grigore@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>, Lee Jones <lee@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev
Subject: Re: [PATCH v5 2/7] mfd: nxp-siul2: add support for NXP SIUL2
Message-ID: <ZyUcA/qoh731L5qV@lizhi-Precision-Tower-5810>
References: <20241101080614.1070819-1-andrei.stefanescu@oss.nxp.com>
 <20241101080614.1070819-3-andrei.stefanescu@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241101080614.1070819-3-andrei.stefanescu@oss.nxp.com>
X-ClientProxiedBy: SA1P222CA0192.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c4::13) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU4PR04MB10483:EE_
X-MS-Office365-Filtering-Correlation-Id: 67d4f0ab-4005-44c7-afa9-08dcfaa1ef36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6zN9vR9zNJooISeDqvPmZGGQMnXX/Nz71D7QoU1FfoLriu3XrYw+XC95rK2S?=
 =?us-ascii?Q?qwCNqCb5MGwSsG1K8VEyAbEfKTBxhpm9LnaYvMad8gmTBD5FViWNLyChJBUX?=
 =?us-ascii?Q?oCtKX4DnJZ8WSMChDXKn94zEvYVndH81JfdTYXAzNaQXc+42cTc0HJCrVrw0?=
 =?us-ascii?Q?bEpW+Qsgp6ichax7ujCleehzKHuKP6GeMs03Sr+GDG2jBv4DG6ff+Y3YV6u4?=
 =?us-ascii?Q?AJ8ZpY4V8IJTlM6D/clWzwFVci4Jly3L0MYkFT52nqLGpIbsTPHIyDbbFgow?=
 =?us-ascii?Q?NetaZGFBs46MD+lpp9nbk89TZgOIfRu2VdhmLYru+tma8u7tHQTuJSuzWM7B?=
 =?us-ascii?Q?0B1WqVMlHuB8D1x8C5G1ntleDj5tzazM4yhypvwWr4/FotEQv/m0aJt2lz5G?=
 =?us-ascii?Q?FAzWXtYSUQqfVmfbPyRSGRf5BeBYxNQ4BhLa4T+MClZoM1LXloj7KrldxnEZ?=
 =?us-ascii?Q?7+Z2bgkDoTA0PJm03hFFu3ne//tZCz9mq11nEmege9DQxl9yzwAijQUWjfP9?=
 =?us-ascii?Q?shw3ldOyD48uO8sYoAt9zOi6W62c+I8VHLtP3Zer87luJJXO3HrJsvo8VEa/?=
 =?us-ascii?Q?zeO79LNFlvKS7AdEP2x0sUt+VWMIvED8/5A4/se1S1o3PeAYEpRA8cRZsR7+?=
 =?us-ascii?Q?HQuEBshD0QgJoPfGG+hBtYZZ35rpLE+7mnmn7bzEKmRlIHFlY7VVXd8OkACq?=
 =?us-ascii?Q?gWh7+DAcBz+qa3T28bzNsC/ivyakDOaWztTXvMypgk6mJdgUWDCb6wLVinC1?=
 =?us-ascii?Q?n2x3oMKC8D4JCKRFZ/aNHphI5MjKUUopi0W18pkwWl6+Obh048T3/w8kK4PB?=
 =?us-ascii?Q?JSrmM2NDvdCZd8af2lSywUSZ1hPoWm2XbWB7KWC6KuAhxvW9y+0Y9gBNmFEH?=
 =?us-ascii?Q?6eHR/NE42DVgAdNESZr2LdYcaMFjKZwE0kfrkqV5ncGl84fBsuk8LWuvhiHf?=
 =?us-ascii?Q?97a2OviQSbx7SPuiN+WNp0X+beP9QDVUaw9bahuNIoj4+gmbxVXZbBGsWn6Q?=
 =?us-ascii?Q?SE2/ut1TT9Ufo/luPsVDMSQ4atwK4PpC4ptauADA6y3AtJu9h4+rVegoEMmU?=
 =?us-ascii?Q?nHd5EBwRq08zoBZqWWlxRsU6EdbR/wrI0jwEa47XPWLRYi8w5IwF2+0sb6H2?=
 =?us-ascii?Q?MLGtKzeO0jWUaterxrT5Kb+17+KPxc2tHdvCC85XzHP84+BeTR0rWXk997FK?=
 =?us-ascii?Q?CJvpuDMcTotGjow9B5d8m2S7eBEzthFEU9FfUJ6ae0ouU44K2I6xFdhbi/PN?=
 =?us-ascii?Q?DfSNJ4JKKYiAbzdOjOGNG221F1zgi+0lVxvaoIrwYWzidXH7FuAQ9tDtVQE2?=
 =?us-ascii?Q?Wv8sQLXbjRTdUUF7GbvQ5/FrdgRhYSbkuPdmhackaSzSNjAGkYW3hNx2pC5T?=
 =?us-ascii?Q?YGuRStU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NQKgIo3wnaPEQVlSHuPvX5qWbdU7XuHXey88SFO7BrXtanqU690GI2xZuBGv?=
 =?us-ascii?Q?7yjt30ZgscnwmnwS3SVnfuI/11xon01C6onrJSyXhq1toDzoh9EZYM1u4OEL?=
 =?us-ascii?Q?jfO2wmqWcEo55Qg78srrYo9pbo8wLj2ESDgyir51Kc7RL0ucdR8atOY39JdN?=
 =?us-ascii?Q?/lyJ/TYtqSAM+EMjSIBAq5DzB2tkSxI+/+fbBuo/2ScbikXx5E/5Udv+kVEe?=
 =?us-ascii?Q?DeepRa7u+tQAcp29H9DLi5ehoIeNyLrY9NGbcDDB4PU/+VKDNvy8HEL5Ud3D?=
 =?us-ascii?Q?JbYGkuFRH1RB3egPlI+2FbYvr5xLfGPDmr4+Z2Kwjl1+mLHme41NcauAxnCL?=
 =?us-ascii?Q?3cGDbR0TrivyE1++S0Qm5l8JuySaCfR+5nGPBR3cZhC2tN6Heymy9ZkWUAox?=
 =?us-ascii?Q?km1eyzQVrVscNRmD5ZdqxG4ZD4UraRcbPHtRkDvGZRDDX7u8n9lMPh+TtVI5?=
 =?us-ascii?Q?Qdqu1r144nc050/7QlPsLpjDB+HXHdLTAM3eH65obagX/ishp1OyyhROq83w?=
 =?us-ascii?Q?WrttRSC/o5p10uDWzDT7K8RrmCThPdPkf4/OENmviYC8ucn61VKK8Fu+6MFP?=
 =?us-ascii?Q?j4VHjnn8+uX9AU/Dd0looK0CQpLZ7sV1tLSao8/ptT29if/CEjZ+W7kxSesL?=
 =?us-ascii?Q?NP4tqOshRkQg25zHsAqn53IDlgIBDw1QUhY8NjShboQaE/or6FJRWuf852xO?=
 =?us-ascii?Q?r+cxxiT1yjmptXzoCaQCfnLwHjnY/J4q40fejMZgYaVCtt3t5w+JvABNlswY?=
 =?us-ascii?Q?G8yAS22TpULTyDGq5E9VJ8tgpoyV3xntPj1B7QIK96qp466QhDaU3HCJ75YB?=
 =?us-ascii?Q?K1fKf8KfQEyD8IWYF1iVLrwaNHJZqSYrFBcafTk3E/GM/hbdeFuZFM3FqhHY?=
 =?us-ascii?Q?DMbk/FgNNQMzQkJaZDCkj5Lm4nehThkECDeThvPl8snOuAu5OxKFsIrZsdOd?=
 =?us-ascii?Q?IFEJ+uJW9TTPBBStRDASR0TZMBk2erQ1PcztmgAMa3YrXnJBGlBi9HzOSRbh?=
 =?us-ascii?Q?K7wcO7AciyW3qTrGxMQAQuS2Pij60EuGFSXRcNL4L+CilRl4RYlY0P6GAEGF?=
 =?us-ascii?Q?+8EZQyTGXk8V73KABsH4+pS4OdgpAXxkjd9REZdKfyPsLFfAptFuOFPEIJwh?=
 =?us-ascii?Q?X50fPQgrCKTUIDEolXHjc3YJwujog390PA4Oznt9mawhz6Y+Ayz61u8zqazJ?=
 =?us-ascii?Q?SzfQmC1FCz/VpIRuwScbqIdCT9GGWwpAeYaDQP0/ic8S9K4Qd6vzXWtQBidT?=
 =?us-ascii?Q?UnyifSC1fPyaAPFoLhAAB1jg17PncCDShSZ68SFK+jPaFcXiE+MBzjcUKEaC?=
 =?us-ascii?Q?0eZ+a8FgDYZQ0irJKwePtHbMzixFlHwBxFYHSYSAm3St1FtjfFSkY64jsCMB?=
 =?us-ascii?Q?31zAkqeIQbqhmEwJ942czaf4Rrj+1ounTBWBpuz9CD9W5eQT7XLL/iB3bpaK?=
 =?us-ascii?Q?TGCmHEkXnFEcJaN6EZJyFW2mJF9X2SME3Zb8J6vD/j9SwZl/wubb+hjql+93?=
 =?us-ascii?Q?4ONpKjQT1+iYu0hks0AC/s5HcMkLDytEHcVA4NEHYa1G2ll8xwkIJ/FP4zlW?=
 =?us-ascii?Q?TTNAX0G7TwR2pJM/T6Mg+4gW6ZR9FOEzg+In1i2R?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67d4f0ab-4005-44c7-afa9-08dcfaa1ef36
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2024 18:20:59.2205
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2wUz1W8XEoC0YEdjww7is6PHQPQAW6cTtjZ4OJQQidj/4+WUpC59FTCxBi/CfHlM0tAGmYcwVROgMCNXHRy3ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10483

On Fri, Nov 01, 2024 at 10:06:08AM +0200, Andrei Stefanescu wrote:
> SIUL2 (System Integration Unit Lite) is a hardware module which
> implements various functionalities:
> - reading SoC information
> - pinctrl
> - GPIO (including interrupts)
>
> There are multiple register types in the SIUL2 module:
> - MIDR (MCU ID Register)
> 	* contains information about the SoC.
> - Interrupt related registers
> 	* There are 32 interrupts named EIRQ. An EIRQ
> 	  may be routed to one or more GPIOs. Not all
> 	  GPIOs have EIRQs associated with them
> - MSCR (Multiplexed Signal Configuration Register)
> 	* handle pinmuxing and pinconf
> - IMCR (Input Multiplexed Signal Configuration Register)
> 	* are part of pinmuxing
> - PGPDO/PGPDI (Parallel GPIO Pad Data Out/In Register)
> 	* Write/Read the GPIO value
>
> There are two SIUL2 modules in the S32G SoC. This driver handles
> both because functionality is shared between them. For example:
> some GPIOs in SIUL2_0 have interrupt capability but the registers
> configuring this are in SIUL2_1.
>
> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
> ---
>  drivers/mfd/Kconfig           |  12 +
>  drivers/mfd/Makefile          |   1 +
>  drivers/mfd/nxp-siul2.c       | 411 ++++++++++++++++++++++++++++++++++
>  include/linux/mfd/nxp-siul2.h |  55 +++++
>  4 files changed, 479 insertions(+)
>  create mode 100644 drivers/mfd/nxp-siul2.c
>  create mode 100644 include/linux/mfd/nxp-siul2.h
>
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index f9325bcce1b9..fc590789e8b3 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -1098,6 +1098,18 @@ config MFD_NTXEC
>  	  certain e-book readers designed by the original design manufacturer
>  	  Netronix.
>
> +config MFD_NXP_SIUL2
> +	tristate "NXP SIUL2 MFD driver"
> +	select MFD_CORE
> +	select REGMAP_MMIO
> +	depends on ARCH_S32 || COMPILE_TEST
> +	help
> +	  Select this to get support for the NXP SIUL2 (System Integration
> +	  Unit Lite) module. This hardware block contains registers for
> +	  SoC information, pinctrl and GPIO functionality. This will
> +	  probe a MFD driver which will contain cells for a combined
> +	  pinctrl&GPIO driver and nvmem drivers for the SoC information.
> +
>  config MFD_RETU
>  	tristate "Nokia Retu and Tahvo multi-function device"
>  	select MFD_CORE
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index 2a9f91e81af8..7b19ea014221 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -226,6 +226,7 @@ obj-$(CONFIG_MFD_INTEL_PMC_BXT)	+= intel_pmc_bxt.o
>  obj-$(CONFIG_MFD_PALMAS)	+= palmas.o
>  obj-$(CONFIG_MFD_VIPERBOARD)    += viperboard.o
>  obj-$(CONFIG_MFD_NTXEC)		+= ntxec.o
> +obj-$(CONFIG_MFD_NXP_SIUL2) 	+= nxp-siul2.o
>  obj-$(CONFIG_MFD_RC5T583)	+= rc5t583.o rc5t583-irq.o
>  obj-$(CONFIG_MFD_RK8XX)		+= rk8xx-core.o
>  obj-$(CONFIG_MFD_RK8XX_I2C)	+= rk8xx-i2c.o
> diff --git a/drivers/mfd/nxp-siul2.c b/drivers/mfd/nxp-siul2.c
> new file mode 100644
> index 000000000000..ba13d1beb244
> --- /dev/null
> +++ b/drivers/mfd/nxp-siul2.c
> @@ -0,0 +1,411 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * SIUL2(System Integration Unit Lite) MFD driver
> + *
> + * Copyright 2024 NXP
> + */
> +#include <linux/module.h>
> +#include <linux/init.h>
> +#include <linux/of.h>
> +#include <linux/mfd/core.h>
> +#include <linux/mfd/nxp-siul2.h>

order alphabet

> +
> +#define S32G_NUM_SIUL2 2
> +
> +#define S32_REG_RANGE(start, end, name, access)		\
> +	{						\
> +		.reg_name = (name),			\
> +		.reg_start_offset = (start),		\
> +		.reg_end_offset = (end),		\
> +		.reg_access = (access),			\
> +		.valid = true,				\
> +	}
> +
> +#define S32_INVALID_REG_RANGE		\
> +	{				\
> +		.reg_name = NULL,	\
> +		.reg_access = NULL,	\
> +		.valid = false,		\
> +	}
> +
> +static const struct mfd_cell nxp_siul2_devs[] = {
> +	{
> +		.name = "s32g-siul2-pinctrl",
> +	}

Only one device? If add later, commit message should said add more mfd
later.

Frank

> +};
> +
> +/**
> + * struct nxp_siul2_reg_range_info: a register range in SIUL2
> + * @reg_start_offset: the first valid register offset
> + * @reg_end_offset: the last valid register offset
> + * @reg_access: the read/write access tables if not NULL
> + * @valid: whether the register range is valid or not
> + */
> +struct nxp_siul2_reg_range_info {
> +	const char *reg_name;
> +	unsigned int reg_start_offset;
> +	unsigned int reg_end_offset;
> +	const struct regmap_access_table *reg_access;
> +	bool valid;
> +};
> +
> +static const struct regmap_range s32g2_siul2_0_imcr_reg_ranges[] = {
> +	/* IMCR0 - IMCR1 */
> +	regmap_reg_range(0, 4),
> +	/* IMCR3 - IMCR61 */
> +	regmap_reg_range(0xC, 0xF4),
> +	/* IMCR68 - IMCR83 */
> +	regmap_reg_range(0x110, 0x14C)
> +};
> +
> +static const struct regmap_access_table s32g2_siul2_0_imcr = {
> +	.yes_ranges = s32g2_siul2_0_imcr_reg_ranges,
> +	.n_yes_ranges = ARRAY_SIZE(s32g2_siul2_0_imcr_reg_ranges)
> +};
> +
> +static const struct regmap_range s32g2_siul2_0_pgpd_reg_ranges[] = {
> +	/* PGPD*0 - PGPD*5 */
> +	regmap_reg_range(0, 0xA),
> +	/* PGPD*6 - PGPD*6 */
> +	regmap_reg_range(0xE, 0xE),
> +};
> +
> +static const struct regmap_access_table s32g2_siul2_0_pgpd = {
> +	.yes_ranges = s32g2_siul2_0_pgpd_reg_ranges,
> +	.n_yes_ranges = ARRAY_SIZE(s32g2_siul2_0_pgpd_reg_ranges)
> +};
> +
> +static const struct regmap_range s32g2_siul2_1_irq_reg_ranges[] = {
> +	/* DISR0 */
> +	regmap_reg_range(0x10, 0x10),
> +	/* DIRER0 */
> +	regmap_reg_range(0x18, 0x18),
> +	/* DIRSR0 */
> +	regmap_reg_range(0x20, 0x20),
> +	/* IREER0 */
> +	regmap_reg_range(0x28, 0x28),
> +	/* IFEER0 */
> +	regmap_reg_range(0x30, 0x30),
> +};
> +
> +static const struct regmap_access_table s32g2_siul2_1_irq = {
> +	.yes_ranges = s32g2_siul2_1_irq_reg_ranges,
> +	.n_yes_ranges = ARRAY_SIZE(s32g2_siul2_1_irq_reg_ranges),
> +};
> +
> +static const struct regmap_range s32g2_siul2_1_irq_volatile_reg_range[] = {
> +	/* DISR0 */
> +	regmap_reg_range(0x10, 0x10)
> +};
> +
> +static const struct regmap_access_table s32g2_siul2_1_irq_volatile = {
> +	.yes_ranges = s32g2_siul2_1_irq_volatile_reg_range,
> +	.n_yes_ranges = ARRAY_SIZE(s32g2_siul2_1_irq_volatile_reg_range),
> +};
> +
> +static const struct regmap_range s32g2_siul2_1_mscr_reg_ranges[] = {
> +	/* MSCR112 - MSCR122 */
> +	regmap_reg_range(0, 0x28),
> +	/* MSCR144 - MSCR190 */
> +	regmap_reg_range(0x80, 0x138)
> +};
> +
> +static const struct regmap_access_table s32g2_siul2_1_mscr = {
> +	.yes_ranges = s32g2_siul2_1_mscr_reg_ranges,
> +	.n_yes_ranges = ARRAY_SIZE(s32g2_siul2_1_mscr_reg_ranges),
> +};
> +
> +static const struct regmap_range s32g2_siul2_1_imcr_reg_ranges[] = {
> +	/* IMCR119 - IMCR121 */
> +	regmap_reg_range(0, 8),
> +	/* IMCR128 - IMCR129 */
> +	regmap_reg_range(0x24, 0x28),
> +	/* IMCR143 - IMCR151 */
> +	regmap_reg_range(0x60, 0x80),
> +	/* IMCR153 - IMCR161 */
> +	regmap_reg_range(0x88, 0xA8),
> +	/* IMCR205 - IMCR212 */
> +	regmap_reg_range(0x158, 0x174),
> +	/* IMCR224 - IMCR225 */
> +	regmap_reg_range(0x1A4, 0x1A8),
> +	/* IMCR233 - IMCR248 */
> +	regmap_reg_range(0x1C8, 0x204),
> +	/* IMCR273 - IMCR274 */
> +	regmap_reg_range(0x268, 0x26C),
> +	/* IMCR278 - IMCR281 */
> +	regmap_reg_range(0x27C, 0x288),
> +	/* IMCR283 - IMCR286 */
> +	regmap_reg_range(0x290, 0x29C),
> +	/* IMCR288 - IMCR294 */
> +	regmap_reg_range(0x2A4, 0x2BC),
> +	/* IMCR296 - IMCR302 */
> +	regmap_reg_range(0x2C4, 0x2DC),
> +	/* IMCR304 - IMCR310 */
> +	regmap_reg_range(0x2E4, 0x2FC),
> +	/* IMCR312 - IMCR314 */
> +	regmap_reg_range(0x304, 0x30C),
> +	/* IMCR316 */
> +	regmap_reg_range(0x314, 0x314),
> +	/* IMCR 318 */
> +	regmap_reg_range(0x31C, 0x31C),
> +	/* IMCR322 - IMCR340 */
> +	regmap_reg_range(0x32C, 0x374),
> +	/* IMCR343 - IMCR360 */
> +	regmap_reg_range(0x380, 0x3C4),
> +	/* IMCR363 - IMCR380 */
> +	regmap_reg_range(0x3D0, 0x414),
> +	/* IMCR383 - IMCR393 */
> +	regmap_reg_range(0x420, 0x448),
> +	/* IMCR398 - IMCR433 */
> +	regmap_reg_range(0x45C, 0x4E8),
> +	/* IMCR467 - IMCR470 */
> +	regmap_reg_range(0x570, 0x57C),
> +	/* IMCR473 - IMCR475 */
> +	regmap_reg_range(0x588, 0x590),
> +	/* IMCR478 - IMCR480*/
> +	regmap_reg_range(0x59C, 0x5A4),
> +	/* IMCR483 - IMCR485 */
> +	regmap_reg_range(0x5B0, 0x5B8),
> +	/* IMCR488 - IMCR490 */
> +	regmap_reg_range(0x5C4, 0x5CC),
> +	/* IMCR493 - IMCR495 */
> +	regmap_reg_range(0x5D8, 0x5E0),
> +};
> +
> +static const struct regmap_access_table s32g2_siul2_1_imcr = {
> +	.yes_ranges = s32g2_siul2_1_imcr_reg_ranges,
> +	.n_yes_ranges = ARRAY_SIZE(s32g2_siul2_1_imcr_reg_ranges)
> +};
> +
> +static const struct regmap_range s32g2_siul2_1_pgpd_reg_ranges[] = {
> +	/* PGPD*7 */
> +	regmap_reg_range(0xC, 0xC),
> +	/* PGPD*9 */
> +	regmap_reg_range(0x10, 0x10),
> +	/* PDPG*10 - PGPD*11 */
> +	regmap_reg_range(0x14, 0x16),
> +};
> +
> +static const struct regmap_access_table s32g2_siul2_1_pgpd = {
> +	.yes_ranges = s32g2_siul2_1_pgpd_reg_ranges,
> +	.n_yes_ranges = ARRAY_SIZE(s32g2_siul2_1_pgpd_reg_ranges)
> +};
> +
> +static const struct nxp_siul2_reg_range_info
> +s32g2_reg_ranges[S32G_NUM_SIUL2][SIUL2_NUM_REG_TYPES] = {
> +	/* SIUL2_0 */
> +	{
> +		[SIUL2_MPIDR] = S32_REG_RANGE(4, 8, "SIUL2_0_MPIDR", NULL),
> +		/* Interrupts are to be controlled from SIUL2_1 */
> +		[SIUL2_IRQ] = S32_INVALID_REG_RANGE,
> +		[SIUL2_MSCR] = S32_REG_RANGE(0x240, 0x3D4, "SIUL2_0_MSCR",
> +					     NULL),
> +		[SIUL2_IMCR] = S32_REG_RANGE(0xA40, 0xB8C, "SIUL2_0_IMCR",
> +					     &s32g2_siul2_0_imcr),
> +		[SIUL2_PGPDO] = S32_REG_RANGE(0x1700, 0x170E,
> +					      "SIUL2_0_PGPDO",
> +					      &s32g2_siul2_0_pgpd),
> +		[SIUL2_PGPDI] = S32_REG_RANGE(0x1740, 0x174E,
> +					      "SIUL2_0_PGPDI",
> +					      &s32g2_siul2_0_pgpd),
> +	},
> +	/* SIUL2_1 */
> +	{
> +		[SIUL2_MPIDR] = S32_REG_RANGE(4, 8, "SIUL2_1_MPIDR", NULL),
> +		[SIUL2_IRQ] = S32_REG_RANGE(0x10, 0xC0, "SIUL2_1_IRQ",
> +					    &s32g2_siul2_1_irq),
> +		[SIUL2_MSCR] = S32_REG_RANGE(0x400, 0x538, "SIUL2_1_MSCR",
> +					     &s32g2_siul2_1_mscr),
> +		[SIUL2_IMCR] = S32_REG_RANGE(0xC1C, 0x11FC, "SIUL2_1_IMCR",
> +					     &s32g2_siul2_1_imcr),
> +		[SIUL2_PGPDO] = S32_REG_RANGE(0x1700, 0x1716,
> +					      "SIUL2_1_PGPDO",
> +					      &s32g2_siul2_1_pgpd),
> +		[SIUL2_PGPDI] = S32_REG_RANGE(0x1740, 0x1756,
> +					      "SIUL2_1_PGPDI",
> +					      &s32g2_siul2_1_pgpd),
> +	},
> +};
> +
> +static const struct regmap_config nxp_siul2_regmap_irq_conf = {
> +	.val_bits = 32,
> +	.val_format_endian = REGMAP_ENDIAN_LITTLE,
> +	.reg_bits = 32,
> +	.reg_stride = 4,
> +	.cache_type = REGCACHE_FLAT,
> +	.use_raw_spinlock = true,
> +	.volatile_table = &s32g2_siul2_1_irq_volatile,
> +};
> +
> +static const struct regmap_config nxp_siul2_regmap_generic_conf = {
> +	.val_bits = 32,
> +	.val_format_endian = REGMAP_ENDIAN_LITTLE,
> +	.reg_bits = 32,
> +	.reg_stride = 4,
> +	.cache_type = REGCACHE_FLAT,
> +	.use_raw_spinlock = true,
> +};
> +
> +static const struct regmap_config nxp_siul2_regmap_pgpdo_conf = {
> +	.val_bits = 16,
> +	.val_format_endian = REGMAP_ENDIAN_LITTLE,
> +	.reg_bits = 32,
> +	.reg_stride = 2,
> +	.cache_type = REGCACHE_FLAT,
> +	.use_raw_spinlock = true,
> +};
> +
> +static const struct regmap_config nxp_siul2_regmap_pgpdi_conf = {
> +	.val_bits = 16,
> +	.val_format_endian = REGMAP_ENDIAN_LITTLE,
> +	.reg_bits = 32,
> +	.reg_stride = 2,
> +	.cache_type = REGCACHE_NONE,
> +	.use_raw_spinlock = true,
> +};
> +
> +static int nxp_siul2_init_regmap(struct platform_device *pdev,
> +				 void __iomem *base, int siul)
> +{
> +	struct regmap_config regmap_configs[SIUL2_NUM_REG_TYPES] = {
> +		[SIUL2_MPIDR]	= nxp_siul2_regmap_generic_conf,
> +		[SIUL2_IRQ]	= nxp_siul2_regmap_irq_conf,
> +		[SIUL2_MSCR]	= nxp_siul2_regmap_generic_conf,
> +		[SIUL2_IMCR]	= nxp_siul2_regmap_generic_conf,
> +		[SIUL2_PGPDO]	= nxp_siul2_regmap_pgpdo_conf,
> +		[SIUL2_PGPDI]	= nxp_siul2_regmap_pgpdi_conf,
> +	};
> +	const struct nxp_siul2_reg_range_info *tmp_range;
> +	struct regmap_config *tmp_conf;
> +	struct nxp_siul2_info *info;
> +	struct nxp_siul2_mfd *priv;
> +	void __iomem *reg_start;
> +	int i, ret;
> +
> +	priv = platform_get_drvdata(pdev);
> +	info = &priv->siul2[siul];
> +
> +	for (i = 0; i < SIUL2_NUM_REG_TYPES; i++) {
> +		if (!s32g2_reg_ranges[siul][i].valid)
> +			continue;
> +
> +		tmp_range = &s32g2_reg_ranges[siul][i];
> +		tmp_conf = &regmap_configs[i];
> +		tmp_conf->name = tmp_range->reg_name;
> +		tmp_conf->max_register =
> +			tmp_range->reg_end_offset - tmp_range->reg_start_offset;
> +
> +		if (tmp_conf->cache_type != REGCACHE_NONE)
> +			tmp_conf->num_reg_defaults_raw =
> +				tmp_conf->max_register / tmp_conf->reg_stride;
> +
> +		if (tmp_range->reg_access) {
> +			tmp_conf->wr_table = tmp_range->reg_access;
> +			tmp_conf->rd_table = tmp_range->reg_access;
> +		}
> +
> +		reg_start = base + tmp_range->reg_start_offset;
> +		info->regmaps[i] = devm_regmap_init_mmio(&pdev->dev, reg_start,
> +							 tmp_conf);
> +		if (IS_ERR(info->regmaps[i])) {
> +			dev_err(&pdev->dev, "regmap %d init failed: %d\n", i,
> +				ret);
> +			return PTR_ERR(info->regmaps[i]);
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int nxp_siul2_parse_dtb(struct platform_device *pdev)
> +{
> +	struct device_node *np = pdev->dev.of_node;
> +	struct of_phandle_args pinspec;
> +	struct nxp_siul2_mfd *priv;
> +	void __iomem *base;
> +	char reg_name[16];
> +	int i, ret;
> +
> +	priv = platform_get_drvdata(pdev);
> +
> +	for (i = 0; i < priv->num_siul2; i++) {
> +		ret = snprintf(reg_name, ARRAY_SIZE(reg_name), "siul2%d", i);
> +		if (ret < 0 || ret >= ARRAY_SIZE(reg_name))
> +			return ret;
> +
> +		base = devm_platform_ioremap_resource_byname(pdev, reg_name);
> +		if (IS_ERR(base)) {
> +			dev_err(&pdev->dev, "Failed to get MEM resource: %s\n",
> +				reg_name);
> +			return PTR_ERR(base);

return dev_err_probe()

> +		}
> +
> +		ret = nxp_siul2_init_regmap(pdev, base, i);
> +		if (ret)
> +			return ret;
> +
> +		ret = of_parse_phandle_with_fixed_args(np, "gpio-ranges", 3,
> +						       i, &pinspec);
> +		if (ret)
> +			return ret;
> +
> +		of_node_put(pinspec.np);
> +
> +		if (pinspec.args_count != 3) {
> +			dev_err(&pdev->dev, "Invalid pinspec count: %d\n",
> +				pinspec.args_count);
> +			return -EINVAL;

return dev_err_probe();
> +		}
> +
> +		priv->siul2[i].gpio_base = pinspec.args[1];
> +		priv->siul2[i].gpio_num = pinspec.args[2];
> +	}
> +
> +	return 0;
> +}
> +
> +static int nxp_siul2_probe(struct platform_device *pdev)
> +{
> +	struct nxp_siul2_mfd *priv;
> +	int ret;
> +
> +	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->num_siul2 = S32G_NUM_SIUL2;
> +	priv->siul2 = devm_kcalloc(&pdev->dev, priv->num_siul2,
> +				   sizeof(*priv->siul2), GFP_KERNEL);
> +	if (!priv->siul2)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, priv);
> +	ret = nxp_siul2_parse_dtb(pdev);
> +	if (ret)
> +		return ret;
> +
> +	return devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO,
> +				    nxp_siul2_devs, ARRAY_SIZE(nxp_siul2_devs),
> +				    NULL, 0, NULL);
> +}
> +
> +static const struct of_device_id nxp_siul2_dt_ids[] = {
> +	{ .compatible = "nxp,s32g2-siul2" },
> +	{ .compatible = "nxp,s32g3-siul2" },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, nxp_siul2_dt_ids);
> +
> +static struct platform_driver nxp_siul2_mfd_driver = {
> +	.driver = {
> +		.name		= "nxp-siul2-mfd",
> +		.of_match_table	= nxp_siul2_dt_ids,
> +	},
> +	.probe = nxp_siul2_probe,
> +};
> +
> +module_platform_driver(nxp_siul2_mfd_driver);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("NXP SIUL2 MFD driver");
> +MODULE_AUTHOR("Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>");
> diff --git a/include/linux/mfd/nxp-siul2.h b/include/linux/mfd/nxp-siul2.h
> new file mode 100644
> index 000000000000..238c812dba29
> --- /dev/null
> +++ b/include/linux/mfd/nxp-siul2.h
> @@ -0,0 +1,55 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later
> + *
> + * S32 SIUL2 core definitions
> + *
> + * Copyright 2024 NXP
> + */
> +
> +#ifndef __DRIVERS_MFD_NXP_SIUL2_H
> +#define __DRIVERS_MFD_NXP_SIUL2_H
> +
> +#include <linux/regmap.h>
> +
> +/**
> + * enum nxp_siul2_reg_type - an enum for SIUL2 reg types
> + * @SIUL2_MPIDR - SoC info
> + * @SIUL2_IRQ - IRQ related registers, only valid in SIUL2_1
> + * @SIUL2_MSCR - used for pinmuxing and pinconf
> + * @SIUL2_IMCR - used for pinmuxing
> + * @SIUL2_PGPDO - writing the GPIO value
> + * @SIUL2_PGPDI - reading the GPIO value
> + */
> +enum nxp_siul2_reg_type {
> +	SIUL2_MPIDR,
> +	SIUL2_IRQ,
> +	SIUL2_MSCR,
> +	SIUL2_IMCR,
> +	SIUL2_PGPDO,
> +	SIUL2_PGPDI,
> +
> +	SIUL2_NUM_REG_TYPES
> +};
> +
> +/**
> + * struct nxp_siul2_info - details about one SIUL2 hardware instance
> + * @regmaps: the regmaps for each register type for a SIUL2 hardware instance
> + * @gpio_base: the first GPIO in this SIUL2 module
> + * @gpio_num: the number of GPIOs in this SIUL2 module
> + */
> +struct nxp_siul2_info {
> +	struct regmap *regmaps[SIUL2_NUM_REG_TYPES];
> +	u32 gpio_base;
> +	u32 gpio_num;
> +};
> +
> +/**
> + * struct nxp_siul2_mfd - driver data
> + * @siul2: info about the SIUL2 modules present
> + * @num_siul2: number of siul2 modules
> + */
> +struct nxp_siul2_mfd {
> +	struct nxp_siul2_info *siul2;
> +	u8 num_siul2;
> +};
> +
> +#endif /* __DRIVERS_MFD_NXP_SIUL2_H */
> --
> 2.45.2
>

