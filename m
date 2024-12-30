Return-Path: <linux-gpio+bounces-14337-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 313E29FE187
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Dec 2024 01:59:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E355518819D2
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Dec 2024 00:59:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90D3018C31;
	Mon, 30 Dec 2024 00:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="emy12PWx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2072.outbound.protection.outlook.com [40.107.20.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 382452F44;
	Mon, 30 Dec 2024 00:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735520382; cv=fail; b=LxxYHmia5aWWtZi4u/DITZ6W1ZImuEerUKA0Yk5wiWSyS4MEYWjaWJIzHXYw6bvu29iHNGmqGEaT/rLHCiU+iYA8jPOgdfNDuGL+h8DVlHUvlPCehY0xzpbnnKHEhGuY0PaO/gOQFkMgGH3PSbMzX9lxh51slcBP5MkR8NxvJKQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735520382; c=relaxed/simple;
	bh=/gYoL3YXtAEpEweM8Stqu5LFucoKXo8EomhhS2ocpzo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=jTfbwbhaNUILDNaoku9CalLf0UsoA6Gz04Mlfi9A8DGuDTHh08TQtValdyqMiYHvxKH5n+oO0TiY8uaCLz3qKMhKrQiV/AX6i701OKuA+XzOM5Pyk4jfZEo1V0yK87cagPMPsRDB0X+vE+lOYGmnDlw3GQOwerUhtjaisrZxKbs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=emy12PWx; arc=fail smtp.client-ip=40.107.20.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FeYADHourPnuTZkHDCZINnQ6v0MEKIiH5vMgvd0rDk/OGZNkVMzB1LEK7fRiVe4kSeGrHO2B0v5ZbO0JGo4qoIWoD237LKr1yY5pXddwPru3beDAFWPnzJXoMd1h47tLkxGRCe38S2UVg5VbawZm0IjSo9EH6Ao9WTiom2KgvVKfMjRM0CnOJWWIIkd6kmVVMyapLKNoN/diHZYq/yGdt7QJn5NnVNxCo3ohFfvBO9/apv8iABT1q5nZlY8J+wesWU5yGGKDea/ceTrVM6+C6FX1WxNX1JnQ+DYmh8QT1idjOX1jvJaqXRFqRYuU5iNEhaUjhr5w9/QKJlD/8jYisw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ks8M5sa1MHCgD/1TLjTBZ9GpsLyTc3+AZGR3BFlhiAQ=;
 b=ZueP51z5DFKnZexJo9mUjfF5PhOQd0LoLCXzzSxJV265M5zZqn5g7akOeWrUT+F2cxHFr/oJ3guPwVh+Zb7GVToUrXeJgxiy9MCuoA8gx/VoENOi5b9RHOt8FDc5Zprs9iEGv2TN4y3ehLmeyfw6guIJPzw3hCVP6hw9RPvWAYl1L1bYnixdOKsIb/JUJ+jD6366BDYWky7oifRD5tiynRZX5GxgOi+PMWmtiw1Aa5kCjOVSbP/FfOseIi0sBWDwN8QAHWIIfQ+6PYuLOb0Y9nLh4vUj1fR6CBEF00gAnKu1DJLiD35MsgDfO+xm+W3pUyQxWrVP/HLypSKscYKE/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ks8M5sa1MHCgD/1TLjTBZ9GpsLyTc3+AZGR3BFlhiAQ=;
 b=emy12PWxSnLpnXgaBYQeZS8iBGaY2aKG8vs9h4jkSucb5RqJRDtdbn6WHV9wcDnHfnLmqYEwHwSP2DK09D+VK29BX2XMeWkcYv8RuOYVSVV/eI5kWmBlzbkwkVbog+NR2oXJ6JHogL6ubfH5wU4f/om3dZH6+JsEMeX9dyUbrrKSWXF+pc+Ma5vzL4N979SFFWvgvk8z7eQYJalcCEYa9Da+5wA/l+uuqWDmRolxHYHBxr3wfNVaE9QVRddnQO6gu5TYMKelgwmuhnPuay3qf6L6nXGg9XImVcy+vSTvBDLyQeHYHwZwsWu9yKFrtc4y1jKgsu/sK3FFI7OVHjMK5g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GV1PR04MB9086.eurprd04.prod.outlook.com (2603:10a6:150:21::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.18; Mon, 30 Dec
 2024 00:59:32 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8293.000; Mon, 30 Dec 2024
 00:59:32 +0000
Date: Mon, 30 Dec 2024 10:05:19 +0800
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
Message-ID: <20241230020519.GE28662@localhost.localdomain>
References: <20241225-scmi-fwdevlink-v1-0-e9a3a5341362@nxp.com>
 <20241225-scmi-fwdevlink-v1-1-e9a3a5341362@nxp.com>
 <20241227151306.jh2oabc64xd54dms@bogus>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241227151306.jh2oabc64xd54dms@bogus>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI2PR02CA0037.apcprd02.prod.outlook.com
 (2603:1096:4:196::8) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GV1PR04MB9086:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a66f598-ab33-4731-4541-08dd286d3845
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rLEqvefufKwTu0BPbK/j95n1C+VkePe/0kr5ZxkY6CELSTHHOegiURUreiTO?=
 =?us-ascii?Q?ss/6xfSeUL18nyQtk7MqP70gU/D/BNx1QAI1BmCn4mYhWPIIWC8O/nQXKe8n?=
 =?us-ascii?Q?iNiMYohyIxMzViRfJCt+DTcUYfpYuEWJxEPuvVssUf/qs+q2XQVFpwF4PBDG?=
 =?us-ascii?Q?N9lUt3c1I3CDgYXBYf5Y7uhFxRxANe4I30g2i8/G6CUSgbgLByFR3Rwce343?=
 =?us-ascii?Q?oxRaFQVO09R+nZion3xQAKzkFfN0Qr3N6rPsmDyhcZdleUBEiwVfFzfOjHA7?=
 =?us-ascii?Q?uEijO1BRJIZNp8F8+Vv33NOcZ/sUdrKqcmLuHDt0X6HLxbiT/H8xHsunJB+2?=
 =?us-ascii?Q?ieFcyuhL4/jnJx1NNzuFwZRBRT1njMF2HRa1XDY1JYGrjdF0SDE29wkqiBBv?=
 =?us-ascii?Q?er/K8U0c3eAF0/DJAtdeiDkiRsHmnExqlgURlm0Y1MvwAd9B56K1z880rxxb?=
 =?us-ascii?Q?YOTBSpv6FVvtOc8skns4NfTSBE3tW5KBXsWJgxr9aIIlhx849TK9YEOmoOmS?=
 =?us-ascii?Q?NkECJgVcYPNlm9Ay2iz5frRT+NBHvlyKFOsnV3Y0WRUReNVXsCC1IIzVk7f2?=
 =?us-ascii?Q?O/4aNlyTzIhEYJwCmeEWJKrYZGdfpu5Hfe/PjGMqbb/RU9cAXd44g8YmVwPB?=
 =?us-ascii?Q?ps2uB5MeU4q4F3d4EmoR/L75bQopaMMUxU92u0GiYucmqHakhxJ4QF3OZgN1?=
 =?us-ascii?Q?O2RpePzYJgmYojk5iTaME7hxP9eJ7FcTr3gygTTpqNs2B+4wrUSd5xZvcIhP?=
 =?us-ascii?Q?Ozv/6/tkb6qAL1I32/3FnmmmkDofFwMSqPtMWbR3oaa4XYNBQVqlspR7MyUK?=
 =?us-ascii?Q?UM5nw2yJT5189CuBwH1r1drUFFMNnA/tkbF98/N13baV1+QpXAapAH8n+7vt?=
 =?us-ascii?Q?7As3NMhoKADdGs4uSn2nYu3CjLudBt37NXIlXnGtBeB0XfmWXGTYQ0PriLF2?=
 =?us-ascii?Q?QS2DXuG86mOio+djFR3jhJF0H2E1N8CWqdalwf9bCsrNUGQ85p60PGq+0l5t?=
 =?us-ascii?Q?NoPOQQRaZ+3grdwxTUzp7qduG4VXGVzhFhRG50+N4O9bo907AfgdvlhCSctx?=
 =?us-ascii?Q?eKFeOoa6aWWR6Wu6TAwuvyN95swGA7v0Wrn7SykJtryvIG8RJ1tH/XOVXUaS?=
 =?us-ascii?Q?0PcthaIZaFdB1OvxfqIJIWAmd1dMcx/Rnmy+NInPMeBQNtyM4dh4K+Bqxoa6?=
 =?us-ascii?Q?tk9Gt3OoAyzNUk+9eRZPz/fnmZoxYV0wU0XBJwOtgTlW9PBuKlV+czWMaq7e?=
 =?us-ascii?Q?dyFn4Pf8DSmOdg4jokXJ3W51K+E/LSM6jK8a2AlSc+tyNU0/H95cRFOz+DKT?=
 =?us-ascii?Q?z1qche3IYn8/WGT+yokW4cL0dL2eRrL5OPRPUBvWs76+Oqdrd7CKdXcVXI+q?=
 =?us-ascii?Q?6JZOCnkykOH8c5t8Zs53aNydC8URTDipY6TCKlX/36fUXa0AzRgE0C+HQAqt?=
 =?us-ascii?Q?hACbXTyc0+J2ucTmv4iJvTfnGbF38UvY?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?p2o7vMjlI2U4PxsiUHwle2DdNd33oGscz95NDJ+JiwhAXrRRILjTKy3/drlb?=
 =?us-ascii?Q?dAJ4cQ6nS49ElZeUhqfEGJC5Hl0idzre57ZyOY2TeqEhCgeR9vrX603XMJzW?=
 =?us-ascii?Q?VGSDfbgIYRe3Mtuw+7YcH/CHTpxVeolaiPgAd//Gict8vFERK6ownTEmTUG/?=
 =?us-ascii?Q?a1z0apNN3rWa+BBTxcXcI17K9GThurKPWFYtuihO6zbJlkWofeNfBLA2Vy1i?=
 =?us-ascii?Q?CbnzXdnlF+bGtFmfAN0PE2ATPQ99f/ao5wjorTq/bugkh1AyeOFClgkWRM+8?=
 =?us-ascii?Q?jw2ZhVRw6+t9LrkjYXl+EMHc4eX9Dfr2U5VI5QsRBYm1L+MHQYLKvzojYu0l?=
 =?us-ascii?Q?EEwHKMulEBieuGvBMbAMyiqu1APJsgAnx+gzz728qKb1ZgV2n/DPnzZ6pRcS?=
 =?us-ascii?Q?JyCAXcaYlBaO7z2NIjKoz6cTLQfnrHNaCujWanuWjhtgyzEIfVYvZehfRLy9?=
 =?us-ascii?Q?HKZk+20edq62BF/eCe8bDByrxlh8tyc7FN/Tsn7SYrw4r4l8hv4AQrXv++jE?=
 =?us-ascii?Q?OsXVAtO34Ybn6wISqDWzuZJljh40lacZ7ZdYR0r8ygZSZ9pE/7wOQT3ASLDN?=
 =?us-ascii?Q?TN0pIzQfco10BZ9qM1ixu0Hvpl/fgNXKslwsONGothVIPKNINiMH++LL+MPL?=
 =?us-ascii?Q?lfKq46gt4JCDZZbe+WQvx4346va1VPGF/3FIJeKnLLq8UsnETQCkedUFS6wk?=
 =?us-ascii?Q?FFkFb1oikvzHF3u9AsB6N2VJ3bjXBQVR5DyUyyqBjdLRulN24JPXtxekOWhy?=
 =?us-ascii?Q?mEMQ43s4cfw8+Epwyu6ewhJPQPRkyEcSJS4JqCjvdILKeXQe+oXTJg5tvaxi?=
 =?us-ascii?Q?CDoaYSwV0BQnBJ2a1lz89n42387DlnO8g5iVUClCzZ+A3Ps0StSbGnGDBD4N?=
 =?us-ascii?Q?6WerlfFeqLIfrpFP6i2xT+vipbBvlO63V3RgIWNS1Gmm44KZxrLXr5Nc/wJp?=
 =?us-ascii?Q?c5ItUO+VPaIwUuQNmoSbyWLwgl8UsVqC3g1M/5Eu0FWl8/mgBjVqD0x3qpM4?=
 =?us-ascii?Q?EZmjG1usSDll8EWAVBW2vqws/VDxZVj/wfJfuoNai6v+D/P9M8bdF+naE0cb?=
 =?us-ascii?Q?McBZ8m+HSc5/LHJkNZlwhC1/X289lN3OGQrEUd+7uQejQ5QCAK3wXn0bJyni?=
 =?us-ascii?Q?ZLI8omz+2Pc1jfqh48tPeUTPX+M+xwH5uKhwpWG4AbLguTbut0u1OgszvtKc?=
 =?us-ascii?Q?vz/N418DOjwm8AvuCR4nmBaSi8f/hWNpeWf3y9Gz+pGzGrUi6Hfbajj2yLgB?=
 =?us-ascii?Q?raJs/xHXoFtmcPhqxPBxzWKM7MLoBE9aUdb36P2g2yvBIiBh05Ed/UqfLAwC?=
 =?us-ascii?Q?nhjvQZsJYsWbPSrCAPZk/N5CjT0poVqnRp7+u9ADfG+/HWXSwIPh/Z6Yvoep?=
 =?us-ascii?Q?0Si8KqB/7g5zmKPaqDPZ/EploHfkg7DKSm4KBzanIafqoK3klzbL1RxqPonI?=
 =?us-ascii?Q?cbnyfxrgSuKyiuqYTRZAqmK1wuw0mNCOUsnTk3IgBbPyqqireVdF/mGYfYDE?=
 =?us-ascii?Q?wTjGs9RCNQZaEvkkAadedefEa2MpRZTJqPrD3MVrnt85NxfMVfSAju193Uy3?=
 =?us-ascii?Q?0Eg5JTVLdkXa8oyGe85vyx3L+sy0gauzqDwOEiPO?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a66f598-ab33-4731-4541-08dd286d3845
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2024 00:59:31.9438
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZMaSlxClPSpzPEFx5WuITceZ2WzygKMC3Dbjwafchos0neFXKiV/yCAiQHeKFbSJ5p08knBywqZ5WhEz5jki5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9086

On Fri, Dec 27, 2024 at 03:13:06PM +0000, Sudeep Holla wrote:
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
>> Fixes: 96da4a99ce50 ("firmware: arm_scmi: Set fwnode for the scmi_device")
>> Signed-off-by: Peng Fan <peng.fan@nxp.com>
>> ---
>>  drivers/firmware/arm_scmi/bus.c | 15 ++++++++++++++-
>>  1 file changed, 14 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
>> index 157172a5f2b577ce4f04425f967f548230c1ebed..12190d4dabb65484543044b4424fbe3b67245466 100644
>> --- a/drivers/firmware/arm_scmi/bus.c
>> +++ b/drivers/firmware/arm_scmi/bus.c
>> @@ -345,6 +345,19 @@ static void __scmi_device_destroy(struct scmi_device *scmi_dev)
>>  	device_unregister(&scmi_dev->dev);
>>  }
>>
>> +static int
>> +__scmi_device_set_node(struct scmi_device *scmi_dev, struct device_node *np,
>> +		       int protocol, const char *name)
>> +{
>> +	/* cpufreq device does not need to be supplier from devlink perspective */
>> +	if ((protocol == SCMI_PROTOCOL_PERF) && !strcmp(name, "cpufreq"))
>> +		return 0;
>>
>
>This is just a assumption based on current implementation. What happens
>if this is needed. Infact, it is used in the current implementation to
>create a dummy clock provider, so for sure with this change that will
>break IMO.

If cpufreq needs the deivce_node, it will be parsed as a supplier from
devlink view. Then come to the issue, multiple scmi devices match one
of node, Saravana replied before in below thread

https://lore.kernel.org/arm-scmi/CAGETcx8m48cy-EzP6_uoGN7KWsQw=CfZWQ-hNUzz_7LZ0voG8A@mail.gmail.com/

So quote here
"
The best fw_devlink could do is just not enforce any dependencies if
there is more than one device instantiated for a given supplier DT
node.
"

Since we are here that fw_devlink not support multiple devices match one
of node and will not support(per my understanding), what scmi part could
do is: only set of node to the scmi device that needs to be supplier

Or we introduce compatible string to scmi node, and subnodes if
one protocol supports mutilple function, such as cpufreq and device performance
using PERF protocol. But this needs big change to scmi framework.

Thanks
Peng

>
>--
>Regards,
>Sudeep

