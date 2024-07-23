Return-Path: <linux-gpio+bounces-8365-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7460293A140
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jul 2024 15:21:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E719A1F2330F
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jul 2024 13:21:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9133315530B;
	Tue, 23 Jul 2024 13:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="PCt33HSU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013037.outbound.protection.outlook.com [52.101.67.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F00155310;
	Tue, 23 Jul 2024 13:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721740815; cv=fail; b=mfx8RcnS66UbVbDjGtnJrIYXiffeLhk6ZpcVzFQcY0133b1LAEDo0ZFGNs0jw/LHAdYPjdGNI2yke7YB1q5aNvhFEWQWFY83s3VS3BQ5jD0/MPA6w6B50ktetORZekEq7HnBp18wZfPHjBk0vRq0nVu7qqsmhpMzQz2Nit1pmn4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721740815; c=relaxed/simple;
	bh=gO2mjjguCnlspKAgAp5/kj62pKS/cJBaAhDvBZl4lUI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=J+DLTYJ1CsWHt3Ri75G9eEvMJNFVpelIsp5861u1nNFUJpXUScmuB3IGZCduQGPBSZauWl8T5WbV3c93PuPxG7jPccKIRb1qxIex3jsQb7EeWZoq/5XeHbqfzPVCwri7NR1hXx258l23jqnZuXMCMKZwj2VJDqD81wJfo+fzh7I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=PCt33HSU; arc=fail smtp.client-ip=52.101.67.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VWxmIQxbwvyJ1VRSr8ghVN6PPppGUZ8TvRomGvGl0ZgKGi6ovWsvNleNkEOf5vxt6JSzqIxiUt5rGgKYzQ34004RrHFZ0bT/2XG6x0WwP6Rkd7f3dsg7xyhiDTe73hvfUHmibmFGL1a7ZGXxE9DDc41T8Fc9TPrlW3mVJYQgkQWDe02KMbirQyq2mtkJFn3yOMrzP5S1u1cfLDjCKhk4NIKg2A2u/8vTgBCrtmGhsQEa0NKHFZUxR2BBUAgGut9VrHXX/19BYOM5cQ9smiP9fy569qAwpIdS0UJwqjd8Xif7S25T/ZWiStLACcdVGB3b0/BbqeE88dYoBeXIKQCKjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6egOWLKVhVFBVORRxktMQIkTrxVwpPnvW+W4Nj5dG9Q=;
 b=fa10DT5wJkuUi+bQ8GeAtvtXWdPlhpLrmudJcX2XrRwoFiBrjr9qe5ggmS5rg47pm92gYIOeM9JbQ4o8PINQ0OrmGGabILvV8rSxrtqKYGlHiwts1MRn1Kv4tAZ3K/GHlI5E1bZ8hYdj11XNFauNM3U3B7yFMh/tXpct153z0WJQ2SVvwTTJcCsr/FmKscqx2aplQgWqzqIM4m+Kf0NdwMv4wlhYIbsrV0/1Z1gi75/tP4u/96VbyVbBPgmeC87hOGS6fi0ESOJ7+y3l3JicnnB8gb9VkTkHVu4q6WM3/s7eJDpBuJlPj+44hX099pfoZNh7CzhyO5oyl6DEG/XVWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6egOWLKVhVFBVORRxktMQIkTrxVwpPnvW+W4Nj5dG9Q=;
 b=PCt33HSUBkJIChCBnc1U1uFe2GNREm6kmAfc28BcA2Pi22b4O7TXOsK+9+IuV5/T7t2/w5L6Dntp29e0ChfoqjlBrmRAAhdwXvkOD0fOavILSK4PYRhVnbizp0XXQSfTc/a8I7XCPtzBAKXTjDfwkeNF9KfPYG7+fRFSiXiBFQk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by PR3PR04MB7258.eurprd04.prod.outlook.com (2603:10a6:102:80::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Tue, 23 Jul
 2024 13:20:10 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%5]) with mapi id 15.20.7784.013; Tue, 23 Jul 2024
 13:20:10 +0000
From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>,
	Radu Pirea <radu-nicolae.pirea@nxp.com>,
	Florin Buica <florin.buica@nxp.com>
Subject: [PATCH 3/3] pinctrl: s32cc: add update and overwrite options when setting pinconf
Date: Tue, 23 Jul 2024 16:18:32 +0300
Message-ID: <20240723131832.1171036-4-andrei.stefanescu@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240723131832.1171036-1-andrei.stefanescu@oss.nxp.com>
References: <20240723131832.1171036-1-andrei.stefanescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4PR09CA0016.eurprd09.prod.outlook.com
 (2603:10a6:20b:5d4::8) To AM9PR04MB8487.eurprd04.prod.outlook.com
 (2603:10a6:20b:41a::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8487:EE_|PR3PR04MB7258:EE_
X-MS-Office365-Filtering-Correlation-Id: 525944ba-cc69-4c3b-f036-08dcab1a2d95
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SklSYTJ6bnRZdDE2c3czUVZFT1dqNTZaWWR5U1dMYlpPZ0VPcERwTk03N1ZH?=
 =?utf-8?B?d1htd00ycGtLTCtQZlViWEhyT3RydkZvTHdWQjNSN0pHNTl3RzFYSVRtT0Fp?=
 =?utf-8?B?NFg5R2Y3dmJFMk15cW1yNlBQdS8xcTM5REs4Vk5JSlRqK0hJNnFZM1AzVDg5?=
 =?utf-8?B?V3BsNnNDTTF4azdBUFN6WWVLVzhsZWt6VFdvT3NrR0U5bVZNVm8wMnptZXpr?=
 =?utf-8?B?T0ZrSldLaG1rcU05Y09uMnNrSjdYeDU2SEhaK2ZubzBEaVh3NEJjc0FTNWhp?=
 =?utf-8?B?TU5rU3k0QWUyeExIci9YTjdhNksvWCtVbXVUL2M4d1ZDcXVIQUtaNm15N2JE?=
 =?utf-8?B?Y3BMek40TXdaNFMzOEpNWmhxMUVFUGlObzh1WlhkSmNKeFV4M2U5WSt6OVlm?=
 =?utf-8?B?UEtrekZrUUlKVU9XMzk5VUFrT1JwMVNwOVAwRXJuUCtHTm1MMFl6Ni9jS3Q3?=
 =?utf-8?B?V0ZrZzFXZ1p5ejNaTFMxR21ROHpKSWlUVGlqQUtLaXhhUmRhTldaemY2bWQ4?=
 =?utf-8?B?b01KY1Z5WjNjQW5SeFZYZXZYdG5WSTBqdUpPejFHZ2hTQW1iNkhBbG43ZGd0?=
 =?utf-8?B?RjBQbmVDZEVIZ1hZdGlaYUFHVENiL251bkVUV2UxMjRPY2ZTYWJOWTRxeHBX?=
 =?utf-8?B?ZGFsa28vamxzRkJoSkpTYnFLaFZoNjJ2dmY3RDBVVzQwczdkNVpmcVJoaWRy?=
 =?utf-8?B?Umx6c0dPUXprbmxLSDFTMWhkTUxkRFBhWENSVzkycFhEZktvSjlOTndZRmlh?=
 =?utf-8?B?SFV0bnlpaXVpQ3BhSGQyY2hvL2xyY2F1M3hyOGtqYXlGRE82Sy93dFQzVzgx?=
 =?utf-8?B?a0VzNVhSOExlZTdnV1JuQlFvanhxY285ZGpyK0ZPbDNta3NWVjNHcC9Ta2E3?=
 =?utf-8?B?ZVdTVUZTNnRsSGF0cjA1ZGJIaVMzWENodVRnU04zSlZ1WWFtb2lnTTVHWU1j?=
 =?utf-8?B?Z1hQenBNWkxyZWxqdStLUFhsclVlamd5bkE1OWFWUThFTkdxLzRwc0tEYzR0?=
 =?utf-8?B?MWFTZkpSVkFzY3VhUU9BaHhQWnhCalRaR3JXa21ZV2RSMWZKRXBSUGY0OXh2?=
 =?utf-8?B?NVpoV09XN0pBUk9HeFZjcTloci9wcjZ2U202eU1QMUtyUFdZVzhsREdOTFNV?=
 =?utf-8?B?NTcyWGhjMTFxQnBMd2t2YzJwdHJzYUNod0VKUGNRaDFSczlJa0Y0dXVwU3hN?=
 =?utf-8?B?MG5LQ3FtSjFIRDNqZm1ubmZWcC9ic0o0SGNFczdZdjhncEJZOFpVZ21taGxl?=
 =?utf-8?B?d3M0NUdRV1JPM2VWZXRpOFIzNlVwb1BUWFpOVzZnQ2dGUzFwRVQ3Mk43R2pC?=
 =?utf-8?B?SExtT3JsbW15eFozSHZlQWI0WW5Ham5vcnFVclRidmI0WC93SkFEYjVjM2p6?=
 =?utf-8?B?YXVZdHBEa29PTzhEKzNKUG02THhYTHQvMDJDN1Y3VEtyWGVUSmpWU2MvMlZs?=
 =?utf-8?B?NGNTbnhJb2g2R1R2cHpTczNoRnFRdUpFREtSbzlVbmNRVnk4TTB0dGcxQUlw?=
 =?utf-8?B?bWIrZjlMZGZwN3FIbmx2d1FRd3ZvWWVaM3h0bmZQZTVJbTkzTWh6dnpNL3M3?=
 =?utf-8?B?cFZ1UlBYTXpCUkZhMXhYY2J1YndDdjBTUTNIVDBNbFphR1h5MDJJR1lISGdq?=
 =?utf-8?B?QVpaR1dXand3V2lNemRvQ2FkYVhKQVlhUk8yRG53THI3M2FLU0F1UlJGYVdw?=
 =?utf-8?B?RUFlaUhGeHVyeUY4a2VCcmRpOTYrOU9SVlpTbUlYaVdnTmRrVlRPZ2F2dFdp?=
 =?utf-8?B?VnFPUTVzcXFuOENsRVowY01JcU9COWREZHVCY1U4c0xHbFNpeEtBWXJRanFY?=
 =?utf-8?B?c2x6d2tTbWNwdnhnYXZmUHp1TVc2Ny9NeG95UDVKcmozVC9jVCtYa2JJSnAx?=
 =?utf-8?B?Y21KUk5DNkNYMEY2UkRpamRYNFgydE9iMmJQWXM0YU1taUE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NWs5L2tsaXh3UWJEVTFHNEs2aXVlSDlhb3prQTEzYkJONjdoRTVZNnc1bTNz?=
 =?utf-8?B?R0xTY1NVNksxUjFvZnIvN0s2MVZsWXY1TGs5cm9BRFJWZkRWYU9qUDhjZ21h?=
 =?utf-8?B?OHVWRThDWENITEFvNVhwQXNKVkJzOU1ObW1wNmNQV3FxSUowTlBESHhlWk1L?=
 =?utf-8?B?Nk4xTGJtMGFkcXIxYkZFY0lERm9tRGIwM095WkNsK3ozbmY0TnpyRlk0aXJD?=
 =?utf-8?B?bFMxNUhhamo0Q2FkaG1KRXM3cjZjYndGM0EwVEtqWlNWNnZUUzJBNGhDTHZ3?=
 =?utf-8?B?cVlLQStxY1BpeVZkVzRuNEVuOTd2NXdmS29rN2I0Y3YrVjIrRks4bkFjUWNk?=
 =?utf-8?B?NDFIdkRYSXA4ZERyZTg0RU5DTWJwdXEvcC9icnN4YVpOTENTMnZEWDM0L2R0?=
 =?utf-8?B?dEtVdERYeVN2czRaN0didEFudGsyUnJrY2cvbE1TOVR5QUJoTXNXQ21WdHhu?=
 =?utf-8?B?Z0hiYWJYT0MzUW5sT3JEQXpzMElQM1FGMGRqTjRjNjE1ZldLSjB6MG9NUm0y?=
 =?utf-8?B?QnlzalBVRXdlQ0dydDEwNDE3cFU5VDJsT2MyZzl1ek95Z2VjREp6d2FBT0R4?=
 =?utf-8?B?R2t4dnFhand0WDJxeVU5Q2tyWXpIcU5LN2kya2tZdHlQenVHaTB3d2R2b1lB?=
 =?utf-8?B?Rm1TRkRPd3M2ZS9Jdm5iMHdoNzFRZnp6YW94T2xsZlNDOU5PanRocU9oSjJj?=
 =?utf-8?B?SUN4a2oya2l6WUlxSWFmaldEbVBkeTlkZmFWT2tMekdnMDRHN2tBdmQxM0Jp?=
 =?utf-8?B?dFpnSURHMjNpaEN4SGo2aXZpVG83dk9JQmU5dlVoQVNTSHdOYzAzeDZYajRC?=
 =?utf-8?B?YVUzSWlBMVAxVmtZUjdrbG0raENNVEpUbDNmakR2SzdmRW9HUE5TUlhuUWhY?=
 =?utf-8?B?eUx2Zi9WT1h3a2N0dEFsdnFoZ3I4aCtxS0RGeFdKSU9VR0xjTXVvUUpOVEVK?=
 =?utf-8?B?LzlEbVI5RVRXSFNnZFF4TDRGeDltK0YrNkN4cXlwUHVKekxnNkFiNlpaK0tx?=
 =?utf-8?B?NWpBQUI2N0E4OGs4cCtGbXRsUGpZTlJ3MU4rN0dGa0NyT3IveGtRUThBbG0y?=
 =?utf-8?B?cVpSVEhKandGNmVXWWZyWURCZjZVdDJlSDhJd0V0RG01TFN6WnM0dFZSdktF?=
 =?utf-8?B?WXlJL2hTUE1LWmc4RGd6UG95U2VLdklaTWZnenRmeU1WeFVNR3hhdW56d21w?=
 =?utf-8?B?YU10VUp2WDJnR042VFpHZ29nSk5RQVJiSUZjWXY5N2hsR3cvVVJOYlZJQ3hu?=
 =?utf-8?B?MmxFMHJmbTR2MkIrbnZIV1BrQk9GNlBkaVNjQ1ZYdERCNXlXREFucy83bk5z?=
 =?utf-8?B?ZU5tYnUwOHg4VWl4UHRUcjNWWXVTOXlHME1FalNHNWx4OXhGeDgySnhtL2Ft?=
 =?utf-8?B?TFdIT1JvVURyWFlHVVVZWHNUYVFObHRiOXhMNVVwQU9jSFd6MGppOXRraUMx?=
 =?utf-8?B?ZzNhVys2YVBnU2JDZjBsZkhJMmszbHMyclgrVFAzcCtiN3NCazVGc1FIekFX?=
 =?utf-8?B?QjJTTzRRM29sd1pLUkR6ZTJOcWVHRFExVEk1WVRHRExPVXQ4NjBQZFMvazlP?=
 =?utf-8?B?SGJJR3hMbTRTVkVETml6bW9QZGUxbE4zUXJCVzkzQnlLM29IQmVQcFJNV1Vi?=
 =?utf-8?B?djQzam1qZ0d0aVgzMkRNVlZaWlBMR0JMOE5uRDZjVVo2ZWQ5bVBIc2lpWmlv?=
 =?utf-8?B?RmFmeFlvQXFuaWdia2EycW9uN3RKeVlndysyWWdkUzFTbm45RUxUUVZHTFBD?=
 =?utf-8?B?bjFLVmhlQUdBbVEwWkJRajhYRFQyVmQ5SUo5QlRGU1NuOW16Qm9kK2xsc21O?=
 =?utf-8?B?NWJxMmh2bWtzZUovYU1CejYrS0pERFNERWx0UVM3Ym1sSFArSVEydlVhWmJZ?=
 =?utf-8?B?bHFKNnNsWVA2NWl4eFVxQ0FGcDF3amZaN2lZVnVOMmNZUWRNNVYzTEhYR2lj?=
 =?utf-8?B?TkVJaHBNRUtPWUtrajdJektNVHpCSWhOeUhhRDdDcCtGaXJOYWh5N1VKWVBr?=
 =?utf-8?B?cGNOTTVjZ3FUb2MrTVFBTkFuN2JmWXJEbUVQVkRvdk1QajdLL01rRzZnZjQv?=
 =?utf-8?B?N1NlVFRyNFpibHh2QmZSRGxtekEyWFBGc3NyK1VIOHk4Y3pmYW0xRVQyLzJR?=
 =?utf-8?B?bE9PUlpHcEM2ZXViZzZNcXh5WnV6eGVkRGJnbkduSnpWY0NpVWtXaTZHNnhw?=
 =?utf-8?B?aGc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 525944ba-cc69-4c3b-f036-08dcab1a2d95
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2024 13:20:10.3729
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +Tf3dJshMKM/ooKQpmkaiEY5cL9zYk+bG2kBSY+N9eaR2aLr3VcKwl6XJlRnRhROoiY3XjRluaJpOdD4ZxoJjmpI+Qz2pgeiNMMQ27zDLM4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7258

The previous pinconf settings(made by the bootloader) need to be
overwritten when configuring the pinctrl of a driver during the boot
process.

Configuring the bias of a GPIO at runtime (e.g. pull-up) needs to
preserve the other settings unaltered.

This patch introduces changes to differentiate between the two cases.

Signed-off-by: Radu Pirea <radu-nicolae.pirea@nxp.com>
Signed-off-by: Florin Buica <florin.buica@nxp.com>
Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
---
 drivers/pinctrl/nxp/pinctrl-s32cc.c | 30 ++++++++++++++++++++++-------
 1 file changed, 23 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/nxp/pinctrl-s32cc.c b/drivers/pinctrl/nxp/pinctrl-s32cc.c
index 48d9d6df953f..9c730f2ca172 100644
--- a/drivers/pinctrl/nxp/pinctrl-s32cc.c
+++ b/drivers/pinctrl/nxp/pinctrl-s32cc.c
@@ -39,6 +39,11 @@
 #define S32_MSCR_ODE		BIT(20)
 #define S32_MSCR_OBE		BIT(21)
 
+enum s32_write_type {
+	S32_PINCONF_UPDATE_ONLY,
+	S32_PINCONF_OVERWRITE,
+};
+
 static struct regmap_config s32_regmap_config = {
 	.reg_bits = 32,
 	.val_bits = 32,
@@ -557,10 +562,11 @@ static int s32_parse_pincfg(unsigned long pincfg, unsigned int *mask,
 	return 0;
 }
 
-static int s32_pinconf_mscr_update(struct pinctrl_dev *pctldev,
+static int s32_pinconf_mscr_write(struct pinctrl_dev *pctldev,
 				   unsigned int pin_id,
 				   unsigned long *configs,
-				   unsigned int num_configs)
+				   unsigned int num_configs,
+				   enum s32_write_type write_type)
 {
 	struct s32_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
 	unsigned int config = 0, mask = 0;
@@ -579,10 +585,20 @@ static int s32_pinconf_mscr_update(struct pinctrl_dev *pctldev,
 			return ret;
 	}
 
+	/* If the MSCR configuration has to be written,
+	 * the SSS field should not be touched.
+	 */
+	if (write_type == S32_PINCONF_OVERWRITE)
+		mask = (unsigned int)~S32_MSCR_SSS_MASK;
+
 	if (!config && !mask)
 		return 0;
 
-	dev_dbg(ipctl->dev, "update: pin %u cfg 0x%x\n", pin_id, config);
+	if (write_type == S32_PINCONF_OVERWRITE)
+		dev_dbg(ipctl->dev, "set: pin %u cfg 0x%x\n", pin_id, config);
+	else
+		dev_dbg(ipctl->dev, "update: pin %u cfg 0x%x\n", pin_id,
+			config);
 
 	return s32_regmap_update(pctldev, pin_id, mask, config);
 }
@@ -598,8 +614,8 @@ static int s32_pinconf_set(struct pinctrl_dev *pctldev,
 			   unsigned int pin_id, unsigned long *configs,
 			   unsigned int num_configs)
 {
-	return s32_pinconf_mscr_update(pctldev, pin_id, configs,
-				       num_configs);
+	return s32_pinconf_mscr_write(pctldev, pin_id, configs,
+				       num_configs, S32_PINCONF_UPDATE_ONLY);
 }
 
 static int s32_pconf_group_set(struct pinctrl_dev *pctldev, unsigned int selector,
@@ -612,8 +628,8 @@ static int s32_pconf_group_set(struct pinctrl_dev *pctldev, unsigned int selecto
 
 	grp = &info->groups[selector];
 	for (i = 0; i < grp->data.npins; i++) {
-		ret = s32_pinconf_mscr_update(pctldev, grp->data.pins[i],
-					      configs, num_configs);
+		ret = s32_pinconf_mscr_write(pctldev, grp->data.pins[i],
+					      configs, num_configs, S32_PINCONF_OVERWRITE);
 		if (ret)
 			return ret;
 	}
-- 
2.45.2


