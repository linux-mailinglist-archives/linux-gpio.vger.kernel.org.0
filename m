Return-Path: <linux-gpio+bounces-18508-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 22AD0A80F12
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 16:59:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9F49C1BC0C0A
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 14:56:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AEE221B9C2;
	Tue,  8 Apr 2025 14:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="sLhTy3gc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2045.outbound.protection.outlook.com [40.107.21.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14FC20CCD8;
	Tue,  8 Apr 2025 14:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744124148; cv=fail; b=pBqnBYh69ZGrz1gfQCjwBgDC124Gfi2Q8THYOW0WQmaYEAC3myW5TR3CkTCZRo4LJje2uedVdSnWof/wAEdA1e88NFgafh6EWG9/amMiFShILtKGWcrSDzVdOAyc0YUoc4uMKFGYAmrckZK19/QfC2ZiRP5XE+e648WqhqB2KaA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744124148; c=relaxed/simple;
	bh=VkH4PgbeJKxNANW9w/l2HGVd/Z6Or94Pl1Yz5Bua6QU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=MCff2vesT+Z5AyeTvKYmB82grqHQc8Ad0hwkbYjLwK6BM/qUz4pGVTIkaNrqYdrd797uKMSt4AxFFF0/YbHFQ0of5ef8YjX8TNDUbR1ouzkU0RCrDJYQUsewfyGxfYb2QHtfy0pmWYa7gBMYdiWTRIfpC14P8FX9f4+oHpDP3Dc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=sLhTy3gc; arc=fail smtp.client-ip=40.107.21.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XAcNZCeV9+wUc+8gIQ9O96Vt9x4ZVJvNapLpP9XfwWsTb6VO4gBNC8YUt3hFKlvavA8HUwAFGn2gKZPMKC1UfSBci6MGtQ00/FZN9vPeHMY6P9AKbgU0hmEKqU54MiK7y2bjfD0rTbONdBSRDbXxTpOslm/B9QCRVJTvjMUBwbaKf61Fbw+sOd5oPzZcZy9ywGmyXWYp/FQlxq5m27R2bhcaVNLnjLe/6ji+Qpjmcv90iwqnAPhTi+/p1zhMUOg+FkXUoIRG/B16qnQlODH04Il8kWSIqGgMRk4dshCmroq6UuFBcQVKRaSUO6GT7rKjh4HpAjZX8UnhSP8MI84cDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tqrPkC3ac3/xpGpqd4uOlI2P2PGeTn3kcqXzwUqW/Gg=;
 b=mfpa2p/qsY5PXM39mrawoE9bfcg5BzbxmIoTE1PPX9jxJKBvMTR1Xu5V9lyUNS2IsI/U7JbZYoh/NtmlTVtJfSe3uw7hnRNoq38vdxPQJ2vz2UrwHU2c1xCBliwNtSR3dVA9PeoOqIB0zWsyUARmBP3LR5F+D9bW1UZ7D7d/h0ZMQM9lsAPdFalYhk2/BR2HW7gDPnrB2RW1Y+hTaD+/sqFVIcf1BGtvZpbZAv2vXEe5/Ow0qfHiJa+oU1KE6+2kjKsMiz63zkKsABQz5GzmbPwrNqNkVOEeLjGz0kHxl3CdMs43kWijZr6at3tSsvnrjjLv7JtiARBpJORoNMbu/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tqrPkC3ac3/xpGpqd4uOlI2P2PGeTn3kcqXzwUqW/Gg=;
 b=sLhTy3gc0Bnm0448p5+HmdH7h+W7tPpaJhQafwd6feIMeKnetzWfyp63A/s3NHtAahaYuEqpiUON4Sq5psx5voF8lPHayGaPzmP+fF1oZac68D6fArRc6opnlLxtcl61XnpLi+QwkmkDw3OtiJYW9qzSx8qjxTbKz4JNjME3w7xeSRlxSGWqSQCm79uwQ0+Fwt4ZLWZIxlKnpFN4kCOtdWHl9h2nRcnmTltAn8W3vIurOUFIc+1uf/p4cKAcas/IQQbhb3NSjAIMmyRqIsQfUEavW+7cyJYC/H89GEmZ8RObOzj3TYhH6w9bTz+ie+OpJDX4dOPfUvK7Ldu+HpAcBA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB7720.eurprd04.prod.outlook.com (2603:10a6:20b:299::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Tue, 8 Apr
 2025 14:55:42 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.8606.033; Tue, 8 Apr 2025
 14:55:42 +0000
Date: Wed, 9 Apr 2025 00:04:08 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Mark Brown <broonie@kernel.org>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, patches@opensource.cirrus.com,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 4/7] ASoC: codec: cs42l56: Convert to GPIO descriptors
Message-ID: <20250408160408.GB31497@nxa18884-linux>
References: <20250408-asoc-gpio-v1-0-c0db9d3fd6e9@nxp.com>
 <20250408-asoc-gpio-v1-4-c0db9d3fd6e9@nxp.com>
 <66db9962-d773-4c7a-bf59-4698eca9eedc@sirena.org.uk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <66db9962-d773-4c7a-bf59-4698eca9eedc@sirena.org.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SG2PR02CA0111.apcprd02.prod.outlook.com
 (2603:1096:4:92::27) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS8PR04MB7720:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ac24a5e-81ff-4dd7-1291-08dd76ad6f58
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?obJ57QjDW2MnmDxrTE0p/SBK2WMvcUk8hrrTKF8aWl/y9r/QAk1MgO8+r16d?=
 =?us-ascii?Q?GDo6KERt3stypKa9j/UoKhsi675NognagFE3B++joBVQgH8cdQXxLIO8Pcl+?=
 =?us-ascii?Q?4q0Z9+lvYNdVqNzw6Gsqtz9swU53hfbHOPLafXlHS9flnkMlCcULBLQFvyJX?=
 =?us-ascii?Q?Xax4I613Zbirx9jJI5XK7VKgEfQXiENR4h9r6bKWyvKFKaWhSyAKtvloQxJH?=
 =?us-ascii?Q?ROeyr1/AMBWSbgIaSvGeyZMJKcZ/83VFB3xh+FJGqdaTBpUZsv7SR3jR5hmm?=
 =?us-ascii?Q?UrbcCxtPYMNITWXrbvy8e+aAXILY9RFK2N240N0OiKOF6imWV/bZELE48mRh?=
 =?us-ascii?Q?cxdcC4ZeZcuyg9yGbhuNcx4vHaRniI+X63TFxGJBCBz5ukZ1rMT4NUzcB5qr?=
 =?us-ascii?Q?unWSd3ztBcAuPSQUee8DMoMWjo5rhGlnzU81qLWvxNhYzoBdB/W6XQdd6LQK?=
 =?us-ascii?Q?qy+i3vbzcF1Uv+ScN/vhSosFcfhgF2sJO12pbZBPd+1pkdaKFoFnHgSdvWTb?=
 =?us-ascii?Q?43JIoHPMZ9eRrSBPxY8WRYLl2MFk6jKePXTVRyr9KhAFF4wDz0SEYVa0HrxJ?=
 =?us-ascii?Q?A3dz7cSKgqMQ+ZDxs+p74XYPBsjX56JY2GrPfZFplngDwfmopqhoVZGaDkMb?=
 =?us-ascii?Q?WS2ck8xKmeJAi42/6mPOG5EEft2g7FgCS3WHJprS2n6Klt5DR9Kr0u8fY8tf?=
 =?us-ascii?Q?pX09rG5i3QV4KkQSIWgqww129GtmF/6g1lgaM2ztJBqMWkwRv4M/dfbsIxD9?=
 =?us-ascii?Q?A/7IY75jr2yAhc7RPD3/VOyQ1oTiHJW77kfiZuPNMbFhhWDLWsjQaHvKH9/g?=
 =?us-ascii?Q?IMOWCH7xuMCTkojDPHnxMHsvWQuinVccbG1trgG0DfEyiOogAev56IdUkaQK?=
 =?us-ascii?Q?DzditEmH3bHmj1pB9vgdGm2PC4HBzzHKXv6Zlxr6dPS9CJcnNG2AE30tqgjI?=
 =?us-ascii?Q?kSIxFwWYj3J5Rs5f7SpBeqKoq9t/tdYhFXmG2Yk4QHyEM+99HGvIqGjgIXf3?=
 =?us-ascii?Q?vifMP5SHZPnm1DrzXLb2amdUZrFahCN1cO+myVR3IjtkbEl3xGFY7QQ7cU9S?=
 =?us-ascii?Q?HuhA/g3upTqyRzK8LEZ35SGh74zB7d+G20Vp1+irQB6ixMul3x3bXrStM1qQ?=
 =?us-ascii?Q?4HJiuDky5V+oamLnqXSKoqU/Bu+0KVdTOAM5ilsYBM6bxX59TT3zj2k/zHh2?=
 =?us-ascii?Q?hf9Fq+aSKjgVDnCbTFadWQQfON14PBNTi6tIJqu4IBb/mUJU1+LWqr5AXkqA?=
 =?us-ascii?Q?fnai+OMlWbekhtpzRu/Arjz/Lwvj/R8VH6dujyu5gxftn2FJxPAfjvoRJuwT?=
 =?us-ascii?Q?8KhotaPqob98fP4VxNlkiLAohPpDcB4TTQ2dUSJZmMr16nlUnauwWi/7fA9y?=
 =?us-ascii?Q?q/o/NtRcYmqo6L7ocr2Y6YvlhJN9Dljy/m8Xjh89xDnjTsxB0GXPHrZkdoZC?=
 =?us-ascii?Q?st838yzp+GiNKQOUfkmc5X7nwN6kMtBh?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nk/TynLX7bzdVRuk+6cLqhTqPEl8yN+whJp5ZHg9i5rnUHs1rsG+zVibkTzv?=
 =?us-ascii?Q?SmrUKBEbPp5qfRdS06Bg+GFczM71qnFK5tuX46t8+lhp4t0149yOcTjzDbjz?=
 =?us-ascii?Q?13wBN2IXzNfA4mPJFG6VM0XAv928sB1jAANyNdoLZXwqWZ248cklbEzHU/So?=
 =?us-ascii?Q?hJ47lMnupTLHe9+4MWltpzpkY2fllXYk3AOnnmfhTvA2s537pPdxD7qyhpG6?=
 =?us-ascii?Q?NDD1aiZcRgRYERPRzcb7DtdMWC/aNZb1uGR7cXU4TkBLTzJ/cGQdC9Udgnl2?=
 =?us-ascii?Q?Tvu/M8FFYpnVlm/QmwYe1trzhmgrcSIYyaHWDvoS8n8Sgq+AuDChq2/lU8j8?=
 =?us-ascii?Q?zRbvnlyh1Hs7Lsi32PwAa7/stJ2FkAxC8j8D6gWZfQvvuHECearUzIRwlCn6?=
 =?us-ascii?Q?/13kZKqySd8SkQY8nGxzmqfDgwNOVp4frouWbo9tQ0KRv2urYry+mlzUyVJT?=
 =?us-ascii?Q?OjxdD5q621aZU69IxfVDjAkBHZBF4n9GHaTSX4ddcMxU9uU4318pPEJwn0z8?=
 =?us-ascii?Q?DIbCHBeMR2Y73dw1H5bAAksw9YkhTOeDCDTD+DvovEQHNa1Tp1np4MJu/gjF?=
 =?us-ascii?Q?TIxd+wwzE9J31ds4+Mc4/LoJOKvZ/l8//M/bxAqu7WN2+5fcOOxacat4GI9K?=
 =?us-ascii?Q?IC6WBrsQSkpAs5yoZjjDq1jCxzDJ2p8NKZB+J7HzZ90ltLGddUTW3xFSWNCG?=
 =?us-ascii?Q?UVHANmQ4OpLb6f8tOtcQgKk8iE57cCvnUsTUvTRf1CxHRO2K6KjwJJJtYbm7?=
 =?us-ascii?Q?Y0pQX/WRDD1w0gDfbhqtJFLad/vAcUvnrdEemoWXaqAOmdFahy1qSfiXmk4u?=
 =?us-ascii?Q?BKgmcKaLHrlXPcbzOoZOiSYQg8P1KHedMAg7FECSqwF20l4QvU9Chdyd0B7o?=
 =?us-ascii?Q?my8+7q+avF5WO8Fv2nIIfHG7sNJnaytOYAo8tIbWPlMEJtbSilaWw+GsXFmd?=
 =?us-ascii?Q?w/cGNNYvA7dyDojadD3/UWHkbTJiSy4N8GRAEm7YfjALrdtqPvLA+5YQUWNT?=
 =?us-ascii?Q?4orJgQtNxDMpGIFjUEa3h8pVSsmLwKk8sdymdOCoFDkqMYqFz+Cr8bK3OWt/?=
 =?us-ascii?Q?BIuhJ/VPsvd7TCQHdzRDr1+tqTC372D2ecBE8WvuWrHeEFRtWGKCGE+koZ7J?=
 =?us-ascii?Q?YreLFlJvDG2wkGh0GN7skh879rN+2jXNolrmBPEKfPvh2S0GXyH9r2nkvNVC?=
 =?us-ascii?Q?4wV1+AbNMWRYDKkpLn5PbxLspt++YDSBEgeLLMb1kqDB+T2uw80B+5jqZa7+?=
 =?us-ascii?Q?HMPsH/IerHY6yhOgJibXcO8RFNfeix9cE8SsedRRTZ/lKuM7eJm7Ds3TlQuh?=
 =?us-ascii?Q?oqFnJGqENf/DOCxdN+6/58iIXb9/BzoZuAhCpBBIIrXeo9h/beH3pH423d9i?=
 =?us-ascii?Q?npmPvw/sCQ4km+yFmFZmBEC4jZ8mN5Ilfq07fucFGbeVXbLALdTLCBW/R4iJ?=
 =?us-ascii?Q?poHmC6giSOvSOHDDs3R4XSWsmdzDsc0Zrlq18kJDgaH2r8fmti7UDVrUwQ6s?=
 =?us-ascii?Q?KMuiNXgvNTtPzPIKCXKe392GWQP3kzee44zxUcmItgj/QEuhLgotV5WmbGGo?=
 =?us-ascii?Q?QqV2HVPkolg+NJ+vJWc+jAHdb846QIntkAJTCUnC?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ac24a5e-81ff-4dd7-1291-08dd76ad6f58
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 14:55:42.7256
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 56b3m0SRe0UsAxqciBT7MSz31re0w1jbBueforAGVSSH9AL7v2bRH31LdJzaNxxC+Y1G2CNOvYC0TxRWrz6Z/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7720

On Tue, Apr 08, 2025 at 03:24:35PM +0100, Mark Brown wrote:
>On Tue, Apr 08, 2025 at 09:40:00AM +0800, Peng Fan (OSS) wrote:
>> From: Peng Fan <peng.fan@nxp.com>
>
>> of_gpio.h is deprecated, update the driver to use GPIO descriptors.
>>  - Use devm_gpiod_get_optional to get GPIO descriptor with default
>>    polarity GPIOD_OUT_LOW, set consumer name.
>>  - Use gpiod_set_value_cansleep to configure output value.
>
>> While at here
>>  - reorder the included headers.
>>  - Move cs42l56_platform_data from sound/cs42l56.h to driver code
>>  - Drop sound/cs42l56.h because no user is creating the device using
>>    platform data
>
>This is a good sign that things should be split into multiple patches.
>The series would probably be a little more manageable in general if it
>were done per driver.

Sure. Just drop this patchset, I will do the patches per driver and
split the changes to a single driver into multiple small patches.

>
>> Per datasheet, the DTS polarity should be GPIOD_ACTIVE_LOW. The binding
>> example use value 0(GPIOD_ACTIVE_HIGH) which seems wrong. There is
>> no in-tree DTS has the device, so all should be fine.
>
>This is the whole thing where gpiolib introducing inversion causing
>confusion.

Let's see whether Linus and Bartosz prefer a polarity quirk for this.

But honestly, I am thinking if might be better to remove the drivers
that for end-of-life chips and no users for quite long time(years?).

Thanks,
Peng


