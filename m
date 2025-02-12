Return-Path: <linux-gpio+bounces-15799-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AAE8A31E55
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 06:55:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B7E2A7A4007
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 05:54:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB6A71FBC94;
	Wed, 12 Feb 2025 05:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="nO4KjoE2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2042.outbound.protection.outlook.com [40.107.241.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75EE11FBE8C;
	Wed, 12 Feb 2025 05:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739339674; cv=fail; b=Y851etexOFcByO82LqOefKxHRGI1hTYcefjPrSwy8XujDUbsK7aEDEm6QJQs9z9cdnieiXWF74Yyi0FLQATd5QaLqPSaIwkQD+xDKYT+mNjQAfULSUkqEH3D9LV+P+8hYs0qtS/j1WiIaDxe7T5MQcHfgniSnBUNZDFBkvo9NZE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739339674; c=relaxed/simple;
	bh=IC2H1cgPQC7qwszIkwivAi4ork1fdPEQmzbPZne55TY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=r8amk7IDwQZPFrsL59lUgvLfwMs6/G2mbhugMuIdmlT8sgGCNrWqISp+frTiNjEviasiGWnR5f437MUDvrX0cCHpLk/JPSNF5YlHeFot9rAV6XFEGavStlfrwFcdDNai9qeKPKrxQYayJJizuKEOR4mmT90NgytPH3elf8e/8qI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=nO4KjoE2; arc=fail smtp.client-ip=40.107.241.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e9W/ZIkhAIEBRLK/OASswJGYkj/w+OifJdtc4nVmUpJFcAHZrZUjDilggapQOe/wqmdM5a8+xXP9wHcgK+R8kPYwSQ5N8noSscLOpVSEygsX3gNlkChyhFoVLe+GDxEDpJHi62MuVPYKDnQssH2LE/x2DTm0VE8xZMhL7DXqcxZPMtRMmKUxM1hkjBaLrqx/rId6YV2tQ2+++yRN/1UcUWVt1ElvHOuveSETjhWCbHgPZmUQ/wWgtGb7ounWC0CURCBUWvpz3Ux7keRWouqzC3ixKFcLyij5PHvp44ZBUY0w2fdPqN93vuHqVl/8klIytExoN5MwNfJ3leNtH/tyAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9jr6LG0dBSu6kKb2z4dzU/wWCatAAcGA0BZVgEFJFyo=;
 b=t4R8UM+6NWKMu1RB4Ki5c73DAjD+7WqeYFL1aIaFU1L09tnhJuP9JlPqpitPd4rb0ORTa6w1hcJMH6T7vfYyosWn1NdIEkFZSA9WlyGknFQPh9NhivdBeqOJW1cRLm1lTl/nlGheHr8rj7jJWQwWZ/sJotlv9xDcsrGA+Uv+t4nun0/vVMlfomiNyrdUllfWIGpKlROQwhM0AVtGvEGjxk87jcUYJB07BahX9HHPOFlbw+MfycRWP1WWmp5HBRGQlhFdYi1Xbbi78Q7YHckd1gTp+dDpmUGggR17XveFs/iGpbc3JYZ1wInVO6dnvWiUZE3qfHpgxOu6kZhT4NsI+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9jr6LG0dBSu6kKb2z4dzU/wWCatAAcGA0BZVgEFJFyo=;
 b=nO4KjoE2gs7KExN8AoN8HgiAiONismAFlczhZd3+j4Mm5eeBI+HLZR6oWRwJHscybCHPUoGMhKjSWv9wCU9de64U4zPhu9wZY0sU2OciwJ9H5uX0Y/rHvsiaIwE+AzNluWZzhW+I8dVIWOEL+Rb0e4xAWVy5s4TmYngKWyuWsLjghjY/1AapiIcQEDuapIWzO/WQcKlQI+WL5EHTTc12FoYzTCSDxlRK2RqyL3QYhcCTwJRY/+oVVF7Bdbb+UM8hloRa8rs1h5i5nMeJOZPI4bnbfFgoOngP/PFN7pX5sl3AtRweb8RmUX+ccR+YcQanq0OUvZYwkJ11UT7M5nQ/2Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB8500.eurprd04.prod.outlook.com (2603:10a6:20b:343::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.21; Wed, 12 Feb
 2025 05:54:28 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8445.008; Wed, 12 Feb 2025
 05:54:28 +0000
Date: Wed, 12 Feb 2025 15:01:20 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
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
Subject: Re: [PATCH 1/4] firmware: arm_scmi: bus: Bypass setting fwnode for
 scmi cpufreq
Message-ID: <20250212070120.GD15796@localhost.localdomain>
References: <20241225-scmi-fwdevlink-v1-0-e9a3a5341362@nxp.com>
 <20241225-scmi-fwdevlink-v1-1-e9a3a5341362@nxp.com>
 <Z6uFMW94QNpFxQLK@bogus>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6uFMW94QNpFxQLK@bogus>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI1PR02CA0040.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::7) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS8PR04MB8500:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ea91f08-6775-431d-efc9-08dd4b29b676
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LX5BYVXRk/emmKDPcoYYdNyzWwX3dV0ZsxVOeTHZytrR9JR0o9+ix2K5OSiR?=
 =?us-ascii?Q?jRUwTg9s9dKBMEIiiUiuAfLWyoqZycpP5zO8bcqnduciI2ILVkJKZ/ea6kjU?=
 =?us-ascii?Q?hCeRLdTrnQg49pQM7bHWLiNbuvFYdNVjI/Uj2z2slIwaAh/PoGHtP3g2IS3i?=
 =?us-ascii?Q?DriLNAQMGoWuZ6Masf1Z4z2OphnWmpF1G+sUSkLbWplF9SptPIK1lsCABwOB?=
 =?us-ascii?Q?zbfQqWYDGFILfUWHKME/1Brnw+PV8AunVS6MSOZxJrGzmtK/0Xgzfx2hu1TW?=
 =?us-ascii?Q?Opczq/4jN1g/vnh8FlL7/VQt1Iz4Hc0F+CKduz2KGH8af7q5gIzjG/QZsxmn?=
 =?us-ascii?Q?8BPt5rIJBym1BfknkXJy23ovTjyGeUhZN22/LXtJKQodGeqaJ5Epnv/xWjeN?=
 =?us-ascii?Q?fD+kylVUjdAy8ldL0GZZ6hyc3s2kZgI9vuXVw6zt61pWLuWookNoordJIHli?=
 =?us-ascii?Q?Adw4jmTH/VrAyMcsnO8H9nOxVOSK0sKJ3PJIJSEcrLsP/dHk4bk8eEFRA9tQ?=
 =?us-ascii?Q?1kn2Q9ioaZrsMSbUL8iqfdMTWZVmYQeOv9BHy3nv/23hhSm7LYBOFwaNThpa?=
 =?us-ascii?Q?IKrhCeLK/fEsB1C+e2Hbr1suohtHFDIYgFbY1Y2IZGK+2rsNhFL/y+3j2xp2?=
 =?us-ascii?Q?07lV485Z71RZ+wmhKYpzqVwu28+x6nHBUJ5Fz4Z207XFrkvlM1GsoycGtcc/?=
 =?us-ascii?Q?DeNbiV+Ksf+hVgPi9MUEQX54NtQP4CO94B2q/pYvd+iR1bJG7rg/0fqS78Il?=
 =?us-ascii?Q?TPD1AIXPllrBbRzVYh0YBGMzHNxJhbKQfPZfcacxpZJHKrnvsD0ce9ixIyqE?=
 =?us-ascii?Q?RHPDncDFfj5HJCjVctkgan1P7FPW4Q8P/btDRcfAAZOjpM2Rg549F/tDkcio?=
 =?us-ascii?Q?nD/dOZhQw/d2HiUV0LvovIIHRdcLINH0JSjoAfX33SXJWcoGiL3Y7CW+5eZj?=
 =?us-ascii?Q?h3mWh3zjmrvanYe5hoj3Ql1A9eIvyjFrN16MuqQBG3kqAjQknSGu7dMGD8Wx?=
 =?us-ascii?Q?D2k1koLiaL/AWwouzTwHahiWzpk9SFviyyx51I0N+qCiLdXWuglFb5fZHpYd?=
 =?us-ascii?Q?nycgdDd8x3Z+1YbUq21q662cKAG9zDl0KUGDjWSCCuCBxQZ6300ytDJKJAsf?=
 =?us-ascii?Q?2yAZ2aJKrhkQVyY60Ln3FDdKGGAE72odfD1X69jBoTHTl68Mt7qB2aUzpc/l?=
 =?us-ascii?Q?Zvtsfc6TK3w0AlGazA9fdXkbYnBepOv3WifAiuwNI9BKci5i635wMU3spWcD?=
 =?us-ascii?Q?TfzhoQY2FMTm2KPc9zFtDXMkapL+pqGoqaArkSKvDAj7rmkrZkg43UGQ7tLS?=
 =?us-ascii?Q?B6o9E/zOuFxcXGTtrkHwfNcw9ZWsciORM85yTWByQJf8XKjD7t/mNzl2Nmsx?=
 =?us-ascii?Q?BvwTheB61AH+XLc2Fu0vmqybK5JZRsciBNrI3KxuvFLPQaffVFWlX6fhOk9K?=
 =?us-ascii?Q?VZyjOu0aBkORnjR6aYbnb5UMHfuKRIcl?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?f9JP44W6pbDfplX7IeDy836q0nkkgXjwGG00l/VFRBV2wG501PyhpwM/VVbB?=
 =?us-ascii?Q?CG+IsdPRFE6YOeIxT6zdtBrYFAMulQkbG9EuvBzzfSgsAHWIFjXHbK5/0BNN?=
 =?us-ascii?Q?2+83dDp7nxzxZdKeBXUvZ5CYTFR/OHS4TGUyRF+qMr7CsMX0+jU37bqUMVZQ?=
 =?us-ascii?Q?18Tn6c0DobIpxmGY9zPX105VYFLMwvE/2O83Atg/QUjbdfV2vhrJHOvpFv/f?=
 =?us-ascii?Q?4yuhxKdmAYq/ROQvY4MsuOjQuFZaN/ij7XHiDoV97574+oQOgEPaqZbf4BWj?=
 =?us-ascii?Q?WSZ5zjTCMGY4UnDCK3tKc5zWYW/krlNrJys5B8Qt0/nuNpD9LF6SJ2OuHg8W?=
 =?us-ascii?Q?dNihMUUa5O6lOI26vn1YwyWH/TLzKmaeeSJRcpXLJ+uo3iFPO1KyaL4Sr9Pf?=
 =?us-ascii?Q?C/pYyWE56ByP7+joscc9mXczWTRH5/uJXEtYwd+659/JgqkdyOJe1tbEMFZY?=
 =?us-ascii?Q?Jk6gZFEkxNKATXxwbp4i8Qhi077BTmiOkIurrreKyzk0NPf7le4hFJCDBWPF?=
 =?us-ascii?Q?DOtBk1eLHMB2O7YiaCJ/1B+YGQCSPDPQtEl26iDQ25AcMPhUzJBu3tWZKHyK?=
 =?us-ascii?Q?i5aiq+yl2tTAQefS7LbhL8+aX8weuLrcZwQlfqABaE/4b3cTNt0bb2RfTpr/?=
 =?us-ascii?Q?knKjuXRrlBPrY9gJd/4O2mOohRAvtspiOZ53OTGDd+aFZvC3Qr912fEpk/oO?=
 =?us-ascii?Q?/ebus2dHi/SFn7MkUxyo4kbL2If+8jB8uBNsDvClgNelSO2lsVHd6O+H7wPB?=
 =?us-ascii?Q?EDCmub6+ogQNRaPUKJbwImUKym0N1FEYJoPlfqEictLjCTyceav5i/HM0e2f?=
 =?us-ascii?Q?ZMmf4Bxa/vGp8FBAfHCCu8wzcn9FB6bon23UiDHxPjvf/MQprOLD0edM9v8/?=
 =?us-ascii?Q?uJI9EcEMKe3z5C/xjRs+fu93tw7rz6DCDB5ajKslqwSWTerEpgvVlaQeW5ek?=
 =?us-ascii?Q?ADQ3eNHR2vBO7YWYqv7otKJTcRKO/JhOH40BfdT1eCDGIL8cIyXqzcIltiBf?=
 =?us-ascii?Q?MMTG6pB+fLyoQuu2ajcCjz/hKRjfWLO1YTiJPdRhrTITO6AqtbnRdMUHdPcF?=
 =?us-ascii?Q?QXCnx+SFJcorTjPMw5t8OyoGL1P3vmsjzSKxE+MyEkAxC/0rAV6YhM/oHETE?=
 =?us-ascii?Q?0KtZFKjlDuN7T9T44fMBGzoxml0JRkPVB1UqRcx3wjzzif8qaUE9PSwYFd/W?=
 =?us-ascii?Q?coUmKL9IVHUzQJXFfzaVIBxZ/igUSWwDIcxisA/BOy8FFnJvT+cJohW+Xdm1?=
 =?us-ascii?Q?OvxHboKlIaUmgNSSBZKfK0K2JYo91HmKx9aNeJCm1U4Biz1QxcB92GjWLCuH?=
 =?us-ascii?Q?ydffvvS7B0UsyV5vp6SPEKpP6fmURfUmcPxMNu0j8EI85C2AQm+en5OEfJD1?=
 =?us-ascii?Q?dArBbswREMvaUdi3+CqI0BvWQpKJo/6Idy2F8MEX5TMsch9srRnN5DyVaXdG?=
 =?us-ascii?Q?CvZib8ltPC+zx8ZT6dxhUJ4QC9DIEe16E7lpPq6wfhxrLkrIVpxoXzVwB6M9?=
 =?us-ascii?Q?jNDu4qJTbJqA0umWRSySx3U9spIcqr+j+EgoxRD41MvH/A4pUwX7SvpMIj1I?=
 =?us-ascii?Q?H5hGb2w76xsk+JdJnBlxg7D2xCuJyew4kKPhBHXG?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ea91f08-6775-431d-efc9-08dd4b29b676
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 05:54:28.6954
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xpSjY31kqxh7m7jdm0vcwkmj6ZMoTuQXbenaYQtA01f431djafsaQm86N8ZrRN1a9am2UlPqws6wdxWfumTwYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8500

On Tue, Feb 11, 2025 at 05:13:21PM +0000, Sudeep Holla wrote:
>On Wed, Dec 25, 2024 at 04:20:44PM +0800, Peng Fan (OSS) wrote:
>> From: Peng Fan <peng.fan@nxp.com>
>> 
>> Two drivers scmi_cpufreq.c and scmi_perf_domain.c both use
>> SCMI_PROTCOL_PERF protocol, but with different name, so two scmi devices
>> will be created. But the fwnode->dev could only point to one device.
>> 
>> If scmi cpufreq device created earlier, the fwnode->dev will point to
>> the scmi cpufreq device. Then the fw_devlink will link performance
>> domain user device(consumer) to the scmi cpufreq device(supplier).
>> But actually the performance domain user device, such as GPU, should use
>> the scmi perf device as supplier. Also if 'cpufreq.off=1' in bootargs,
>> the GPU driver will defer probe always, because of the scmi cpufreq
>> device not ready.
>> 
>> Because for cpufreq, no need use fw_devlink. So bypass setting fwnode
>> for scmi cpufreq device.
>>
>
>Not 100% sure if above is correct. See:
>
>Commit 8410e7f3b31e ("cpufreq: scmi: Fix OPP addition failure with a dummy clock provider")
>
>Am I missing something ?

Could we update juno-scmi.dtsi to use ?

 &A53_0 {
-       clocks = <&scmi_dvfs 1>;
+       power-domains = <&scmi_perf x>;
+       power-domain-names = "perf";
 };

Even for scmi-cpufreq.c that needs fw_devlink because of the clocks entry in
juno-scmi.dtsi, there is no issue here.
Because the dummy clock provider will always be ready before opp with
your upper fix. So we could safetly ignore fw_devlink per my understanding.

Regards,
Peng

>
>-- 
>Regards,
>Sudeep

