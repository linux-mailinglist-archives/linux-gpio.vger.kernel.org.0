Return-Path: <linux-gpio+bounces-14522-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB35DA01E3B
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jan 2025 04:35:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 805E53A119B
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jan 2025 03:35:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36D4D7080D;
	Mon,  6 Jan 2025 03:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="dOjGTap5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2079.outbound.protection.outlook.com [40.107.105.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C4517E0;
	Mon,  6 Jan 2025 03:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736134530; cv=fail; b=WCDCT1XV2srQnXJa7Uf2xGxMvdZyJDq0i0xH8qYF6kWJ3pR9fHYUMicwvUDMuIs2/9pi8SZdJt1LitpLVkJ4TKIOBdtxVT2BZv19K34mRQc/zn4tVFWzL41SvggybBU6A2c2j8AgzwuePyjw4UK+4x5JcjHCCY8HPz2b9jMo3wk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736134530; c=relaxed/simple;
	bh=c1E00SSVipV/sNJSlH6ZtHaRt+r4DK8DGunat5maaSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Y0y9DyAG/IoheAumU0ZtU1X+rRkrhR8jb9H4bP7g3sQsJewR2ho4Cx3LIJmdG1Rdm9dJfloKoreuxDQnt8cMUsSZQUrOF2pj55cd4Jc1ttzfHZIQb0vxSmgDzahKzHlBrr08DE56xA1oIYe9zUlZPimbTXnf4qovldAB90y0RbQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=dOjGTap5; arc=fail smtp.client-ip=40.107.105.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fyUFVAaOH1lnSjKrhqKy1S/VJUKGju5SDrsddC7lb7tyyiDo5NqrKUptLyYNNPfkrNsvhNG2gUwNmGV1BSycXCumt7gXmCQFlgG7H70XPWf7WhtvQot+fiqYoA0n/NqF2Fbwk7Rz8HPJq7wITRsYwBqvF/tWxfYCJtTCQeOg6jYZHLG776GxOU6BKPmKFEVW43Lr2+cNrw7jD0yIBajr32O2XL29N9RGUxE0kgj7ESpoIxxyByE6E8XQpEzndne5QNlw1x83X2z4JWcQPYDuGNExduJZmbqYqPemVAJYAkbWTDIptzXwaz1bZwtnkYmBrJOs41Tdi20kZEQ0bWH7Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ET0R2iKrLBKnjjQXSOk56XWa88UUHti3xYGH2/U9IXo=;
 b=X+5+nNfE22zydlAyEPiv2dN+5/tIEr14uEtiQ0N/pyz8rpwFMfB33GaTFDVbb2Z8JERpZCuUCck46Zmw2cUnP8wWokDE4EViK31rPrhLZIQmCMDj75NLtiYlFT+rklLTIf5RSKLgjxC+Osb00URyQun4Pzu9cznRq9lM8oJ342zJ3lFAhLKH+vP/onZG0poXUp7uN48VyJCRA7skbXnmYPBMn5UIlXbYcL88zGhwfycrRvAdhbHUjUGjWSckX0NcAWcnPDlK6H15VavZKM8KgLZ9R+pGtXfdRTQ0789ncCFj2ZiMOouTeJC2TYFW6X01FwkbwBOLhE+7kDLDEbrBJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ET0R2iKrLBKnjjQXSOk56XWa88UUHti3xYGH2/U9IXo=;
 b=dOjGTap5SMNieOKdbHgD/rNnz/aBHRIHZIn5Yj4OYdtghq/H/9DuaJKNCFzHcbuDdSzcVNytx0JMyV2g95ptfGdg3mUI2Tle53YF2JXu8dLBIUW4lM3Ug3j1S8jS1x1fOtKb/N0r5WWm34mTGzp9RavqrTdYVhqecWalaJav4XpkeDZGN0o3Zl3SwmN2xAhikqyubE5bY1yz7s1ZEwfWZWCH56I6n2BEx3xx2Q07J79Fot8ReNjoqCn6+mQgkdA/mjcqKnHjQIwF7BRblILPMcqUWXkY8zfQybfkFXzRAYcgZefdgprTBdmaKE5ScWMJVmYptqvqHsCYrap90gkmIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PR3PR04MB7482.eurprd04.prod.outlook.com (2603:10a6:102:8f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Mon, 6 Jan
 2025 03:35:21 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8314.015; Mon, 6 Jan 2025
 03:35:21 +0000
Date: Mon, 6 Jan 2025 12:41:20 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, imx@lists.linux.dev,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 2/4] firmware: arm_scmi: bus: Bypass setting fwnode for
 pinctrl
Message-ID: <20250106044120.GB14389@localhost.localdomain>
References: <20241225-scmi-fwdevlink-v1-0-e9a3a5341362@nxp.com>
 <20241225-scmi-fwdevlink-v1-2-e9a3a5341362@nxp.com>
 <20241227152807.xoc7gaatejdrxglg@bogus>
 <Z3Q07EDfN0kTiVRV@pluto>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z3Q07EDfN0kTiVRV@pluto>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI2PR02CA0051.apcprd02.prod.outlook.com
 (2603:1096:4:196::10) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PR3PR04MB7482:EE_
X-MS-Office365-Filtering-Correlation-Id: bdab594f-7acf-4185-5f58-08dd2e03259d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?D+HN7/V/YZXHB+Yd9IM7DEZgphwByy3Oc03SSHIdu5OGebTfPZqkEy/L2xi1?=
 =?us-ascii?Q?w4YAKPCuZ/4IjUJjS77PIqokgVw10jr0dwCUqEOmDvl2YbkWzxn+2HsEtM+h?=
 =?us-ascii?Q?Q3PvdCavql2X01pakGvwjCwXSXXd9+MIKqfa9j5Y2BIysLEaXaL/+/HcUWwC?=
 =?us-ascii?Q?6wpUyN1rf5WZFdN/lAczLLZUgjcR0ZPq1CEU8EIh+ysNoeSppVhIo25FMIDP?=
 =?us-ascii?Q?MBmr2VUQ9Jhb7Lv6hJxZedqD3N+IGYHjrIgmUTWGoEJLRv69w7eh619VCxWD?=
 =?us-ascii?Q?CzOGEYeczu4+QHN+A4andZgKWdETn3ZnB8BNDZATVAbu5uC1uhZPMmzF36gO?=
 =?us-ascii?Q?5vFNrWa2SMikLdL/uNUXnQ2pEtqI5mFheesjBP5jw5DFquFx9cVfRpaCy640?=
 =?us-ascii?Q?I/uBGbZLd7QtOpCdkXQKngx3elICFOVAHCmmubW+iUi6C5MipX5QixqM1/si?=
 =?us-ascii?Q?d+BEcVgQWWZid6tzLEapLnKAzkSI9GF0Bc3DYIm4WUg98OPZwjTa84fBOR2N?=
 =?us-ascii?Q?Bu6vyiehBLM2CJ1ZfaIxa7L2U7LbXR1kttt7rzt79gDjMpI4eQk6xyymFkJi?=
 =?us-ascii?Q?W/xEkuV4+43d+vK2gyRqwRXzXhYP7upQp58f1bL+jmgpldaAgWdkC7ILKJup?=
 =?us-ascii?Q?qv6BTsoMeKj7UPY71P2V3cDRYlEQ506EGdiSLX5AByeVQ0KjMOVQ2Un/5MKL?=
 =?us-ascii?Q?uA9k34u/toVcVgCmAEwj3gdP20Yryl0FbO85uQZsypKR8M3Kiko9sr9pqo1a?=
 =?us-ascii?Q?9xQzJ79DGQpe56CmxzV0Bc6NtAAOw2bMMlEBwhwYdw/JLIwGxmNxklTShUz/?=
 =?us-ascii?Q?64KfBStjHfz2J+CqK6VrkxdsGf6Zs0YqEsz8zl5LPiPYlJiue2I/HZNLovwT?=
 =?us-ascii?Q?cKRU5tqz6ANRoCI8UBt/ln3CIxHVeccS+qYfWiDp/B2QfFVSkCpfZmo8XujQ?=
 =?us-ascii?Q?OzU41yjitIfq2tmk7pXhtQK4rjOXL3/WIcNa3hXX6Xim0lUhygGzWODKlJ5E?=
 =?us-ascii?Q?jkpUW48GFq+utp0nOMZv9iARfe83jCtxPqp6lsvooOtFIPRzgQzFdgXJSjUv?=
 =?us-ascii?Q?FmumQclN9RYejD7iApXulGiQm5yTksij6IzrcCCacsnOqOvye9Us0lG4xXPm?=
 =?us-ascii?Q?ka+bBwBH0Kjq/l/dBcEyBDTh7hyJkcMTirmKJ3+J4D3DqBMH0FRp4qhvufyl?=
 =?us-ascii?Q?EkQDAIX4UlwCFAAwtacr8mkJvJWSACMayodJHblmdQ0718FzWoa0wn57G+i0?=
 =?us-ascii?Q?UXoI205gQqeH8F66d4cSk6zw5LyDhYoHKuOpqpGSvOBQEOD+dDy7ZJzAeGP+?=
 =?us-ascii?Q?MuGI5cDDRi2jY6rC1J0gME1QKow8hGzqsMGDpM+fenCZ4sU32E3EAcrnt+1e?=
 =?us-ascii?Q?bsbGNr1fDjbaEoTcPUUbfUunoDyXCmcLgenmX4k+7kRv6Du0pjshmd5GX9f3?=
 =?us-ascii?Q?IDcUPlHVZ5vhgLIzFSGhytX8/OgQIqyb?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KvAkzNEff70vVhuv4/DVAeKD8k79fcOlFn3HgGvNiT7jFuauF3Q/mqP29k4M?=
 =?us-ascii?Q?Ye3aG8RBEUyOhxHHsXBdrWjLCFp6zKfg36crO8LRTpvnG4ySXHPc6uAtPT4p?=
 =?us-ascii?Q?7p7xr9gtEzxgrBpWLaukfaWWFiUc+F1G0pO3u2/Vdiu8l2VDmOAPBZ8CvkqU?=
 =?us-ascii?Q?4hWahtxavv4Fd/6xbq7yUosFfdAiL1t10iuHsAFhLAa9Xp9RqxWknzaK7V9E?=
 =?us-ascii?Q?6uTD48uui6FWvH2QqVFvtJ99IeZnmgA4WvO/YbSakEbc/kf0S3Zn71o1c2Lt?=
 =?us-ascii?Q?QKt/nATICFdY1zYwcFGxVdBuhLZU90ycQ1MvAPe2EI/fR/gSLMBdUElRUGg8?=
 =?us-ascii?Q?pZjjNefdkm1D470r20kG0+II2MogjZiz/BmiwkMvvTdJOBz63n0RXb7KG03l?=
 =?us-ascii?Q?4hZep2beIaRjJVk1uXRuHa3/6ULePHwWvnI8by2KYDE19G/uDNCX0lceDCCU?=
 =?us-ascii?Q?w3N9hZZekdQZCu21P5qLs6y9w+GXDa8d0Ct7zB2u10xBF5Rc0QvsTMs8nctp?=
 =?us-ascii?Q?VLQXnU1NwFGnD7qoc9DlloyfWp1NchSBw1Umj1ShH79yz+kbv0tTXnE/6WRP?=
 =?us-ascii?Q?wscCxHneJhl+ohXJ5760OMb3TsBeKTvgdBUDGF2Gb+9pkC+5M0PwioiJCLiA?=
 =?us-ascii?Q?kJGS2+WsSRAh9fJ98bgRZuNAikzbIRdohT8q2lG1hkVm/fjBg/7IHUR1ztR7?=
 =?us-ascii?Q?Knn8MK+f/ixH2IHSZOja9tls2Wn61lK8hyc83/LWPO3NCC8Gf1ggITjlwzkK?=
 =?us-ascii?Q?k+TcArS1L+e5phoYyG70kEr7SMW2jCmHm2jtB3jMsvmW9a1WMa8xqCqe+hW9?=
 =?us-ascii?Q?we1rP2bMTiLy6SefAul5KX4y5gTazDgoUuULkGxVryx21OmcWnJnIIQM96XC?=
 =?us-ascii?Q?No7m+7AUS3Uqp0Q+kLH0RihIqt9yjmEAUXkAULk+sfY10XH7uFMpZINTDeU9?=
 =?us-ascii?Q?I4k37p/Gv77Blgk6Ffic3k1QI3r4ScrI4zUiriNTW77rCn9n1xWlr98Ou/FB?=
 =?us-ascii?Q?rElrqnfmTT8tLNHc2vSZWhmkEXfKpgEdmB5ID8C98sVhlgL/WXvdHTxNF34r?=
 =?us-ascii?Q?ucwpOXu5cV4h9fH/m+HHqiRjgHxvJEEJd3ABq9IQ0BRVEnz0Yf3HpEtvzOo7?=
 =?us-ascii?Q?COXTHs9ZaBGQ2tjk09LCCw2xpWDVmnBdLB+kE1XlFdFHWxCt9uyF1mpUNR2C?=
 =?us-ascii?Q?ZMH2ia9w0TBtI1ofGRwwQkDtWWI2y8UM7RgFubix2hyrnDXyOsMK42VZx1+L?=
 =?us-ascii?Q?jncon4WbxcoEr2IeIwcZ77jK8c9rm1+h0Ewgz9OJF8OodtaffczPvKoIIagL?=
 =?us-ascii?Q?e6FcJoTR1II9Mwp/jF1v93c9jkdnfx1Q9t9ZWsnpInjvgWSsDz1MjtdJDPhV?=
 =?us-ascii?Q?+l1fzVufIjQ7nfzISo9AMf5aQbGLbGH4g1xbrObllYfjj96eov5PWSKB/drm?=
 =?us-ascii?Q?Y9MScb7/OITOX5qEWQ8pf8LF1dEkTL1BUdpms5jCRmoJUfTyo1W4U2io5krr?=
 =?us-ascii?Q?0k8nPz556R0JhXYkMbtvqBu3evSnQESUR5F8WZK3YdiRNDR4Bka/GsWxu0FJ?=
 =?us-ascii?Q?WK0M/ZSHG38SKXNBlpbGR07/KbYImZsYVm6EXjB0?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdab594f-7acf-4185-5f58-08dd2e03259d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2025 03:35:21.0856
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y6gbYFIXLCsg9I6/n86g7LDqcdYZprU3QcZbBxP+lOiK1wlvv6Lq+N9mH9XTZhEQBTlLP42FwwKUBAHEQbCVHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7482

On Tue, Dec 31, 2024 at 06:16:12PM +0000, Cristian Marussi wrote:
>On Fri, Dec 27, 2024 at 03:28:07PM +0000, Sudeep Holla wrote:
>> On Wed, Dec 25, 2024 at 04:20:45PM +0800, Peng Fan (OSS) wrote:
>> > From: Peng Fan <peng.fan@nxp.com>
>> >
>> > pinctrl-scmi.c and pinctrl-imx-scmi.c, both use SCMI_PROTOCOL_PINCTRL.
>> > If both drivers are built in, and the scmi device with name "pinctrl-imx"
>> > is created earlier, and the fwnode device points to the scmi device,
>> > non-i.MX platforms will never have the pinctrl supplier ready.
>> >
>> 
>> I wonder if we can prevent creation of "pinctrl-imx" scmi device on non
>> i.MX platforms instead of this hack which IMO is little less hackier
>> (and little more cleaner as we don't create problem and then fix here)
>> than this change.
>
>...or indeed this is another possibility

I am doing a patch as below, how to do you think?

With below patch, we could resolve the devlink issue and also support mutitple
vendor drivers built in, with each vendor driver has a machine_allowlist.

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index 1d2aedfcfdb4..c1c45b545480 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -55,6 +55,20 @@ static int scmi_protocol_device_request(const struct scmi_device_id *id_table)
        unsigned int id = 0;
        struct list_head *head, *phead = NULL;
        struct scmi_requested_dev *rdev;
+       const char * const *allowlist = id_table->machine_allowlist;
+       const char * const *blocklist = id_table->machine_blocklist;
+
+       if (blocklist && of_machine_compatible_match(blocklist)) {
+               pr_debug("block SCMI device (%s) for protocol %x\n",
+                        id_table->name, id_table->protocol_id);
+               return 0;
+       }
+
+       if (allowlist && !of_machine_compatible_match(allowlist)) {
+               pr_debug("block SCMI device (%s) for protocol %x\n",
+                        id_table->name, id_table->protocol_id);
+               return 0;
+       }

        pr_debug("Requesting SCMI device (%s) for protocol %x\n",
                 id_table->name, id_table->protocol_id);
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index 688466a0e816..e1b822d3522f 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -950,6 +950,9 @@ struct scmi_device {
 struct scmi_device_id {
        u8 protocol_id;
        const char *name;
+       /* Optional */
+       const char * const *machine_blocklist;
+       const char * const *machine_allowlist;
 };

 struct scmi_driver {

Thanks,
Peng
>
>Thanks,
>Cristian

