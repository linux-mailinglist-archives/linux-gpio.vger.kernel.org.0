Return-Path: <linux-gpio+bounces-20008-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8179AB4C44
	for <lists+linux-gpio@lfdr.de>; Tue, 13 May 2025 08:47:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D23EF7AEB01
	for <lists+linux-gpio@lfdr.de>; Tue, 13 May 2025 06:46:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B3E01EB5D4;
	Tue, 13 May 2025 06:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="e6nf3a/x"
X-Original-To: linux-gpio@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011019.outbound.protection.outlook.com [40.107.130.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E311917ED;
	Tue, 13 May 2025 06:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747118839; cv=fail; b=ByG/XxqdadzJjuLetJ2njEPTebE6Tehr/J0IEbrPqrHPMSmazrxcrcNn0kXbFqf3UYDYlknWLQ2rYK7WBq5YrU1oG4sLoJvhpVciouUDreZrWNLgxU24G7eSDm116UKCwMlzCk7VPhtgzukZ3z8g8LF9C2JbGHz8ZoqtHCqpbXM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747118839; c=relaxed/simple;
	bh=f+fu04mcpnKrMNy67ZH6qJiVQp4eMOmtzBocXpN7nao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ljRQPrNTixsf2oaitK6Mq/Kay+RiifuveDJGnU+B5/PQ1vM+MHFmpg/iSqs8kutBV4zKVnRyj3w7pKFFPc5ec3g4O7hKFsxCOn7XchSCFAg1jCMvDrRC59GqtFh1/wZmIYl3GWQoqPpTAYsIqUAbuwtV3eoVbwCi47SmZqYh+W4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=e6nf3a/x; arc=fail smtp.client-ip=40.107.130.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AaGypkQmYW1JTPP62XPDW1wOODLjCiEAA16B9Nj6lmBmSvPz6aZY91Giwr5Uq5w5YqrGl0mvQ5L4fojtOsJC7to1LElz5M9SYrniPFiPap8eU7fZbzvPbtjrPzn2iXYZ3lHur7s3SOAFxOK9Y2+Nv4AkgExenF2sJ7HPDWVoOp7ULjDCLTT7Gg+p6SlPOA3nDz8Pv4VoBaseV9ZTgTTws8AjGsRXqLPR5ToR37Nq15PauV/RBQziLEx+/fSwRUOWcIV1aHGYzKtniV2midAQt4vt942Eod404nnwN2q2igGeXQo/7MhSLiKzHeCQn9VAI7vdv9CrZMhqExIOaePKdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rgIWSxI49N0edLzGykwXj9H+T/Sdhd4ujMSuZIOEexA=;
 b=k3+PA28g0URwJexNwpqoFOiA6poYHYsw+mnDBeNAcNJ4GU1v1rx7i4qLRs+SM0x3f45HfeUfw/S4ttlrTW6njQY/R6TEJwWLC10bTG/vWfuMnVPQFhvFlzRt/sQAZr2c2qIndQuS/CQ9ltOBP7nbjn53lRvXR9QfX2acpv1EzsdFYz91qGUc0WA2hSyUj6Ylks6tBmdyjWVygNu9DiIDgaKX99SNotkziXyBx6z1hHW7h4Sn5SkPN3062ugFCBA02CyhZzPncSlYSPj7cB+Xo7yIIPTTK3KekbvblEwhpgZLhVrbQkPkw5yH1nkVCEKiWTci6NYVBq35zsxLacd1bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rgIWSxI49N0edLzGykwXj9H+T/Sdhd4ujMSuZIOEexA=;
 b=e6nf3a/xkWUSsSg2+mAh9lgDA/yUiluiyb1PW4Pl7Rjo9rIFe1VeX5J8lce2J1wj0nvfnrUKhvSBZHQWBm2Qv5+ZnNe1F+fpN9y4nJby5JrMFwctpjEb+YjzvPZJ7qCh5G3GFUAhycyV90lv2NviwrvkGGyAUfTSk/GHFPEp0fb/ng0Cj4bS+4cxqdwjXEgxzh+XWncJ3bidwU75opxtTUBpofI01/nSIYQ8gtil+MIfM71zo+AYyPf1rvF8MoahFweFyaQWkcPkazdejf5OguLCvVT0h0ljO1ay7+bJMK43+hZVyp4phZPTQgpMR4FdLjwROGoC9Oi1LGo6Et3/Ag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM9PR04MB8338.eurprd04.prod.outlook.com (2603:10a6:20b:3ec::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Tue, 13 May
 2025 06:47:14 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 06:47:14 +0000
Date: Tue, 13 May 2025 15:56:38 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 2/3] pinctrl: imx-scmi: Get daisy register offset from DT
Message-ID: <20250513075638.GC14572@nxa18884-linux>
References: <20250512-pin-v1-0-d9f1555a55ad@nxp.com>
 <20250512-pin-v1-2-d9f1555a55ad@nxp.com>
 <aCGShsaItUTf2Z14@pengutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCGShsaItUTf2Z14@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SG2PR02CA0041.apcprd02.prod.outlook.com
 (2603:1096:3:18::29) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM9PR04MB8338:EE_
X-MS-Office365-Filtering-Correlation-Id: 2037c4d2-691e-4aed-2d54-08dd91e9fee7
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XF0+PuXBgjTJ/iZQ3uV3pzESaRtWRovsq0qwHEMVh4ojm6ynAV2jwBgmQ+5C?=
 =?us-ascii?Q?wCnG947Ns1omlbIU/3Hk+gYwM4MJM//hwvJYVjxtypbNTaUvBa8Vw1/yZhkh?=
 =?us-ascii?Q?uKajOA1dGG3fmyRgJsebDI3lXAVNfun+3MfMEdMUrXHps4q/Qn94ZKUKIA1U?=
 =?us-ascii?Q?P3q5A9QiqDQjD/B08ofvldLB1UWo85Msi2vHML/IU7IOanITnNVGi1AuIrJr?=
 =?us-ascii?Q?RP487S/L3PP2dx+Yh64K+FUvEOpCbKcTSGCq7XGImDVUz1CtZrTgG6OfYdHR?=
 =?us-ascii?Q?AJtHjD+st/Vf1rzGYynpU6E+546CP9Rzbbc/hX09lJHr5uxrsq1MRqcofIYW?=
 =?us-ascii?Q?bQO95MN4cpBlaJ7F8Woz0il/22iVNUWmkIQujNhK8dftBs+spuQEecdG6hUX?=
 =?us-ascii?Q?+DBDcI4lq2OHhCq35yHer4JUAHI+cDtckW/tVXdukiMxZxO3koLxI8OSIAXo?=
 =?us-ascii?Q?sRPE2hOB6GdswYUnQmPFfk4jFKKILjJe+EFAur0AUsAeL3pJ2yDtQW4dQ+2q?=
 =?us-ascii?Q?qUBvVxWD5hRfEqE3p+/jUoWlOdmXHZ6qVXof8PpKLk+xxqj4xNxOtk8tUlSS?=
 =?us-ascii?Q?cW1E9x5roE4SJZsMXJpewBHWUf9BVuwtHHyPEoSZvHT7DrUnK9jkcZNuZVKQ?=
 =?us-ascii?Q?s0wIuPc4nIE7m57GY6cIwac6fNF67yu6LMVN6NdCuLlINKMktFKjtLzyxsks?=
 =?us-ascii?Q?gkQLLMMAwsUYNaAknfBdeL7NAi8YfPJGaIt2sLh0rBFxyY3nNuy+95DRlU5N?=
 =?us-ascii?Q?IyXyB18K9qkfnzQm7mfn8NCc1i5d/ppyqMbaR6hGC7cl8goR5WaLS40NUCq8?=
 =?us-ascii?Q?DYkLt/L1FbYnXBp4g0byUjvS9bdjTSyAv7anAl8zdU4EglpQMpO4jyc+UG4J?=
 =?us-ascii?Q?LreolQ16HJAfAs44by+TtATiISOGbzVi5Q9xI3nl1VUKg03f9j9NFAfUrY5G?=
 =?us-ascii?Q?xPKgVvat/gIVSwL6mpfuU96wymxqGwGRHiQRPeABIfJQ7u5kCLFvx7OgBWvZ?=
 =?us-ascii?Q?khMD4ZJlzm4zIBkD8Y6IygyTL+OHTgkY37mr1jtO9UqE23lYvVfLNgErRjHb?=
 =?us-ascii?Q?cdQHH2/PM/B7ddyiydmge+LNhhKOL3nwBbu9iNXECZfrUkYpmOiliAabB/IN?=
 =?us-ascii?Q?MnTqRPD338S+YknQvYCCPvPc5UY2SdHMxC9uilNZ31CngxNeIm/hcLiroqmK?=
 =?us-ascii?Q?wcVbYyFhqSjMPaSG32CZqKJx4gWziw7kXpeS2UPDPd+lM99LOYbRjE+Skjho?=
 =?us-ascii?Q?aYKvOdj3G4t31b2EbesFBpeUiV6eK9UhFu2llQYIadLMa0RL9IdQFTb+VBZ6?=
 =?us-ascii?Q?8vvim2qzJLA/Gc2oNGsEAXIJTa2OGv6gilNe8T1dV/x/zT6cQyQBHL5114Sm?=
 =?us-ascii?Q?FGiQwWFeOyB7L/dXtwxNKW0gBVhV2jw8zc4AB8OPL+lRRx/IwHgvpVoCV6Xi?=
 =?us-ascii?Q?FtaGUaL8qic=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EyhQ/GUyueSj+u+MxyTjcuv/e4dIh4ZIUBhya2UXsEyj5yIKX/Q17duIgnHY?=
 =?us-ascii?Q?YKoiPIHR0rzgNaYYCOXbu6EmJLWrjySFjxlZ9eqhblbG8fEtleyAonITMEGD?=
 =?us-ascii?Q?84bhT/7fJCwPhIwqUaJYTqQINmEzMHTOs8ICEHhFwcml3HhB+sok+iyjdFEO?=
 =?us-ascii?Q?fg2+zZiI2ex0Q/LaKBtGAxVe1TFFQqoduAaYvETOfDEhwA/fEC5S8H5xutQF?=
 =?us-ascii?Q?Af1HYuieJ5PfE80+RBqeNDn6LX+8IQBBn7CaV4Iis0pibNmqYITajsqWsrqj?=
 =?us-ascii?Q?6hIH2YO9YhpW874SyqqbTcj8QGl39ONuScHJiEKoMnsBc8oGI/F1zvwiA9ca?=
 =?us-ascii?Q?QM80sHTT8J4jNQAl7vDmHyJ81k08ejxop9M5fp2DNJltkH/UtvznaWcNpPlB?=
 =?us-ascii?Q?jrtgz+PXHcrOB83lVq9hOqcRfJVCnoJnUY2+Oj5OcIo84LG6/aRSLQiNhtx3?=
 =?us-ascii?Q?JI8E0rjVK698KrpuicfVHwFgshelhjdPg9d/tWEAis2JCMOyUCuHaXxP4GOC?=
 =?us-ascii?Q?rtTdjKnHTzTLSduW51pusFc0drDb1qag2jsdb04HHpB+uZJVD3grPfcSaY5S?=
 =?us-ascii?Q?yOifoSBBeXbF1Qxnx4eK7aBV8A/CMEiIv6cIX7I6J86uzhvJjqLFHGoDpwe3?=
 =?us-ascii?Q?2npIhl6Dr9sO0XqnqWagSfakYd7S1yB1FrldS0EKegQmZ/03BI0B7q+ygOl0?=
 =?us-ascii?Q?Kt0PS894xsWYQR+qSPYKDBMI2I6WSlsN+oJhhhxsAbdjlm/aoEpm69oeVi5f?=
 =?us-ascii?Q?xVzp7d2zPN8zf2QWbBj8qfJpI+QGDT1trZkRbzhWx5cRzhl9wTrirezz02It?=
 =?us-ascii?Q?cb5U8gupEJttr3VYmOTdNOElTGBhdlMiO7WBgsEmEYKDpXE6Jz1QbVGtnudr?=
 =?us-ascii?Q?vAyZSf99Jl6nzOasS/78X2jBg9Y0nG0FgjGOPNjxXaIPuhywz6s2OoTtt1sO?=
 =?us-ascii?Q?XaUz8tEVwpnyqB0qbIk8WlL1IAZFwAR8YPzvjXpUmcWz5XYnc777AqteTWci?=
 =?us-ascii?Q?dNak9gEmqTcHM+SQ9XZefOZIXXvr9jkyVgM20k9nOFMiaCZJJznjBOgIHWq9?=
 =?us-ascii?Q?DKWcgUvanx6VWsu7SH4dNpEhv7q+est4SonezjfRwxvwNSp1Gi3sDrmIg43m?=
 =?us-ascii?Q?HzfOydGk5dkNAXi/Lk8uDkQSV6zoAAtWf46pX22n4Zc8to5TS/xg2nbJq+MN?=
 =?us-ascii?Q?1407z00E3Z6jF6/sJEwICAQAXv25cCBTqprhSjup1yuq+3JE3JgPQVahBMDb?=
 =?us-ascii?Q?rNl8hkIWgo1odD/CSg3TCn27jbG9n3R7z3Aev3GUuN9jtKwQSbpJU8FA7ZgX?=
 =?us-ascii?Q?yuU/CNdqAyL4/rlLhYNteU6vYgGwHNZmKltcRHwIFR2I+XwAMm+GAKIxtcac?=
 =?us-ascii?Q?jjxmssDnBz35z9zmGe42p9Ufaho2tPekVfKrGhzQf0S4wRxPwZ/c70RsyevR?=
 =?us-ascii?Q?UR6de3FhUpYf5Tdj6KTFZf+Ew1OB5glRKYVl2CY+uN63riqXnj3UiSJkeHpL?=
 =?us-ascii?Q?BaRQOS9BUW1W2SyK+NDtH+mrYSSS9wQW1PguMl6EQRKNV8vJ9pVEvgVxX6yY?=
 =?us-ascii?Q?AVf201Yd7TbWtn3FU7UmBe3ALcWr1n2WJOKRnyal?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2037c4d2-691e-4aed-2d54-08dd91e9fee7
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 06:47:14.8060
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uhGPL/l00LRTo3b3/m9lLXv5o/spxtSjrHRtG2edh11lGTkNxHRc119hvG7Y0oPAYXecEykCdxOT1sDpKIvnAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8338

On Mon, May 12, 2025 at 08:17:42AM +0200, Sascha Hauer wrote:
>On Mon, May 12, 2025 at 10:14:15AM +0800, Peng Fan (OSS) wrote:
>> From: Peng Fan <peng.fan@nxp.com>
>> 
>> Parsing the "nxp,iomuxc-daisy-off" to get the daisy register offset,
>> then no need to hardcode the register offset in driver for new SoCs.
>> 
>> To keep backwards comatibility, still keep the register offset for i.MX95.
>> 
>> Signed-off-by: Peng Fan <peng.fan@nxp.com>
>> ---
>>  drivers/pinctrl/freescale/pinctrl-imx-scmi.c | 26 +++++++++++++++-----------
>>  1 file changed, 15 insertions(+), 11 deletions(-)
>> 
>> @@ -315,6 +307,18 @@ static int scmi_pinctrl_imx_probe(struct scmi_device *sdev)
>>  	if (!pmx)
>>  		return -ENOMEM;
>>  
>> +	ret = device_property_read_u32(dev, "nxp,iomuxc-daisy-off", &pmx->daisy_off);
>
>"off" is really a poor acronym for "offset" as it unnecessarily confuses
>the reader by suggesting this is about turning some feature off. Please
>add the three bytes and just call it offset.

I will use "nxp,iomuxc-daisy-offset" in V2.

Thanks,
Peng

>
>Sascha
>
>-- 
>Pengutronix e.K.                           |                             |
>Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
>31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
>Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

