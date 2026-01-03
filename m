Return-Path: <linux-gpio+bounces-30088-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B5930CEF9A7
	for <lists+linux-gpio@lfdr.de>; Sat, 03 Jan 2026 01:52:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 170BC30181BF
	for <lists+linux-gpio@lfdr.de>; Sat,  3 Jan 2026 00:52:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8F2A29E110;
	Sat,  3 Jan 2026 00:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="fOuGgRzn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011028.outbound.protection.outlook.com [40.107.130.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56BAF2749C7;
	Sat,  3 Jan 2026 00:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767401564; cv=fail; b=pCZ0XWDRAGlfIduovfuGlmzezPFu8Ca7B/rj4UahjLgNjOnIk7zV6iumzh7iN+rdOsHjJGSNgt5P0VLcxmgBUROITAlgFgczL9NTBpyO3B2AHqpL9JS1fch17AbQHDzPgP/1F0/QDSoX8XcEd/D1GQCUg9BEclloDnGBCoJg9tI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767401564; c=relaxed/simple;
	bh=whOCMFqp8iM/aWh0BL85qeb3GBW6XQTBHcTc7sbxCxc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=YNfDj7eYcfL59EDVD0nOiARPjZf8jSQNpcPGju0LW/iNLpNJeXCUCLuqrFIM/sNBxCJ/OG6EIl7XVO36zQhvsO5G+jTFsSObiY5vuoUSVLUvfO6T4qgDp7fkvF7IWxILxWVI644djPP855HtifdbFVhdZi1BgRFaGj6vkdsAm3k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=fOuGgRzn; arc=fail smtp.client-ip=40.107.130.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Aq1IYVtuO3z2frTEnhv61w7RSQt3veHm6BaFXvvXzSxUm24axvcEbO2K9mHVjh8ubcVpaGAaAvB8q5MCCdJsDK4JfNhHrRJJqHgvkyavOqNyj2KDTaxvbEmfJiSs5BhTqdXczDHHwqZ+8Vk3mj4T4CBopWdqVRdat07dvW7He3ophPj+WdqsfdMWDlEJfHV/jsDtWPDQ0wzLvUyxnbuVBGF3GaMw6qCkLmCq1zHQLmxdWl/9n+FgNmLashJknuFrzClnwrQ5ybMf3NLn+WsdvZVfj+vzanwuJdxlVNsJjxpvLVLDrtLqiVcrYGbun3hsMlllzX9++5h1s80dPpO/3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=whOCMFqp8iM/aWh0BL85qeb3GBW6XQTBHcTc7sbxCxc=;
 b=s+8NcBVjbLn/sEgqCfHwZJ0eAuZHGHyIwwHCsDrbmCd1Adw1gGpwLRCqiK+yU+e+vDc8Bho8wXlmDOymXq7riWwEewxY3BZh3WludogWJgRZXMCAallVRzb2ZvdlHpR27t99rr8ISv03ou8m6dx05mfwQKVMkZIcR3n+Iwz5o2ra7An5EfkvF3EhoKYTRZYbIDndIXMlYVsc9MgG3TUhButDIfWnwKwGDWYK+1QrVXenJuX9mpCBA2MegILeinO0OQbKM55Xy9ho41gCZsbuzeD4FZgMsRTK4J2AqrsqcQ5Nv9C+ZLuH8U6ehXBF/at0Azcxf2TyWB4N5YaKu4pZqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=whOCMFqp8iM/aWh0BL85qeb3GBW6XQTBHcTc7sbxCxc=;
 b=fOuGgRznOm4SkJ+Txpo1n4ARmbE+98ZECqPeOPF5lvHnWbzyiDS6toR5fMXxjkmI7GVq8Qky557f4NCHtzyQ3/5Rm1hdRuOJsz/UG+gQMBk3xduUGkB03SMwvZtj7uBBokXDm2WK4MrChFVBH0veA6ctGXidEMKpKUsjZ7oKrgEuVWJF0MMeJfVWm4lWDKY4rZVhiLmrk2ZXkL8N2IvG4MFvEng8bTALUXC7+/hgu1kYqJy+nm0wOcSBtU45K+f00fPkno17QangIby/i/OZXXqUQf7p+oLiJY62FM3Po11K2qEN6KSvMItZNIVu3hgUhN6amHiT9VcpM59X01FS0g==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM8PR04MB7828.eurprd04.prod.outlook.com (2603:10a6:20b:24e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Sat, 3 Jan
 2026 00:52:39 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9478.004; Sat, 3 Jan 2026
 00:52:38 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Linus Walleij <linusw@kernel.org>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
CC: Aisheng Dong <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, dl-S32 <S32@nxp.com>, Sascha Hauer
	<s.hauer@pengutronix.de>, Sudeep Holla <sudeep.holla@arm.com>, Cristian
 Marussi <cristian.marussi@arm.com>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "arm-scmi@vger.kernel.org"
	<arm-scmi@vger.kernel.org>
Subject: RE: [PATCH 2/2] pinctrl: imx: Add support for NXP i.MX952
Thread-Topic: [PATCH 2/2] pinctrl: imx: Add support for NXP i.MX952
Thread-Index: AQHcbv6gz0ZafxdVxEemUIql1JjEcrU9etYAgAI9OfA=
Date: Sat, 3 Jan 2026 00:52:38 +0000
Message-ID:
 <PAXPR04MB8459577B062A2D2B84510C2E88B8A@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20251217-imx952-pin-v1-0-2747f09144dd@nxp.com>
 <20251217-imx952-pin-v1-2-2747f09144dd@nxp.com>
 <CAD++jL=6bMXHp4KuVN7xxSidZDhuxLkuiJRnjybJxk4pVeeEFg@mail.gmail.com>
In-Reply-To:
 <CAD++jL=6bMXHp4KuVN7xxSidZDhuxLkuiJRnjybJxk4pVeeEFg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|AM8PR04MB7828:EE_
x-ms-office365-filtering-correlation-id: caca0cc7-3d68-4615-eb9c-08de4a6264a8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|19092799006|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?RUVyY3RvQ0t1ay9YYW56b1duNkFxWFBqYzRIZkpHcWYxWVZsWmVsVUFteXFp?=
 =?utf-8?B?cGlLeURyRWVhblRsdkZ4TTFoUG4xQ1NZdCtZdlFsZnRDV2ZpcHRBNUdHd1Y2?=
 =?utf-8?B?UXhVQ2VzYTVIazMwODNlZndxRFNBTFVUMTlGczFCc0xIWlVmRHJNQVN5UDg4?=
 =?utf-8?B?ZGovZXdOUko4TTMrazArZTdtQTNENHl1ZDhlWGpFUjJmQWdUV25YODRpN2JE?=
 =?utf-8?B?TWRLT2MzZ3FsZ3V5YVRZalgwc1o1WmJXRU5rM2wxa1AyL0plS0hWeXh6WFIw?=
 =?utf-8?B?NnVLaDFOYTFXQ01ocTc4VXlxdTJRVys4SnRpcTM0V1hEY3lTU21GSXFnUTdx?=
 =?utf-8?B?Ui9OTTRtVnhnUG10WkVOSmYydW1yR0FPZnlJdisvUGRWZFVxQ2dMandhcW9n?=
 =?utf-8?B?cUR2Skw0SjJkVFU1UGdsMlZQRFo3QlEvZDJQZ2Q5Sll5TXZHOFVyODM3YWky?=
 =?utf-8?B?c005bFdBcnM2YWo3TnJwd01oVFU3enFHKzRIUFdGUy9IKzBDOVp0clJPSWJ1?=
 =?utf-8?B?K2hCK3d1NXdkeWh5OXQ1MWhaUGROejR5RHRLa0VMSUNaV1pvdU9RTFgyZS81?=
 =?utf-8?B?K2ovVHhrOWlINkFJMzVCQWcwQ3o2azd2bk11RlN4NUhESlhEWGxZVWdQT0Uz?=
 =?utf-8?B?TzRuZHZJS3ArMS9lTnk5TklvSWpYN2dwbWkvclV6S0NaSEJWcXQ5RExoV3pk?=
 =?utf-8?B?cFRSRHgvc3VsN0ZDeUlSbm1aWGF4TUpzTnNkdHQrbnVuNUJRcDhwVHFSeEgr?=
 =?utf-8?B?NGNTNmczSWF4dlM3c3loNERvUU5QTnlObkJSdTlZdEJWMjd0djlzeHE0Yy9W?=
 =?utf-8?B?MlRoQm55ZW01anJya01oVGo2TlVPYktMbDBLa0xCUjljem5KbVVZQlUwN0x0?=
 =?utf-8?B?RVlvUXpiYTlJS1VSV243UHBVVVJ2czdoMDZGNW9Mc1MvMXN3SDk5aWVPZnVo?=
 =?utf-8?B?UXM1YWJNV0M0eWNrMEt1NlczSndneG1iM3crZzY3RU1tc2RYTStEY0JQa1d2?=
 =?utf-8?B?V3pSUVphdWJuVStmYXQ4OG5WQUljR3o3ckIvMTlZR1hjSk9EVnA3T2tvSkRk?=
 =?utf-8?B?QUdoOWdpcFBzYlg2QnVvSTdDaUdrdW00Vzh0RFV6MFFGQjVVS1NDRS81NEhV?=
 =?utf-8?B?Rzc5VmlDRzE0TklYMHRERzU1QmlEbnNld1ZzVUxQSlJMWUt1R2ZkVWJ2MHRl?=
 =?utf-8?B?MjZMZjh4R1Roc2dmTW9pZnVBTnpBQVVyVWJyelkvKzV0cVc3U3pCWGl5U1Np?=
 =?utf-8?B?YzBvbjhPaEZvNVlZb0RIODQ5TnpYd2Fub3hERHBjZ3JaMmdYTGJXQWVXSWRV?=
 =?utf-8?B?RUkzL0IzNUJmSG5nUVhwVjJZUHlRSTJBaWVKYSsxRFVFblFJOHEzVytqSzdS?=
 =?utf-8?B?Q2t1SHUzNTZjTks4dzlld1A0R2d0RVNGMmpzQkh0NklnSkJlUXlhRDJyUWFJ?=
 =?utf-8?B?R1BOY3M5QWpOSTdPYTIvdTM5QTZWdzN2c2ZhdkhKaHZGaW9odmM5d2tCajhK?=
 =?utf-8?B?anp2Mk9hOUhkSDZydTRwNVh6c1RDQXd1UWR3NkVpSmUxamo5bVYwOG9McGx6?=
 =?utf-8?B?S1pMNzFYL0xQeFpVVUswa21HRjFLWjVoNDQ0cnZ4a2QxdGRTcFFqdUxzRmRu?=
 =?utf-8?B?ZTh2c3hRTEYwYTN3UWdVNStiOVV5eUtCQzh3VGtzZ0Qzek12ZHBBdGtuMFps?=
 =?utf-8?B?d0EzZjlEUEZDdHdVRjZicVk1cjlLdVF0b2RydE9GaXRHNXlnY2NYaml0WGpD?=
 =?utf-8?B?b05wSmlvVU9RbzR4aUJFVHF5RGhvSDFZekN4dTRpQlk0WmF4TmwrVXdKTmJI?=
 =?utf-8?B?Z1dYWGRtOU85OExiNW14SEJHdWw1c0JiUy9DSU9heUMxWE82MU5RSWprYlNH?=
 =?utf-8?B?RjZ6ZUREU1Qwa3dSWDV6bjNVYlEyYXFWOTE1M1BOQzdoNkR2WEZpUGJ0anNP?=
 =?utf-8?B?bGxqeFIzcEhXU1ZKMVVkNnhTb1VPUmtJUlBMdnlqNldVb1BIUnAwb21VS2N1?=
 =?utf-8?B?dXNlaWNmVkZoM2xQeHpiWE1BbkVDRlQyODU1U1JTbkZrOURqWitUdTIyOXly?=
 =?utf-8?Q?j4ketJ?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dEFkdEN1a0hNeVl6QnNENTNmdXFtYXlKeDZDcXRwNHhhTkZhSmQ2VEhTc2lh?=
 =?utf-8?B?V0VudXRnVlVnY1RGOEQ3U2VuRzdLWkJZZGhsWG5ReG9qUG5KY0dNWkdvS2Nr?=
 =?utf-8?B?UlBvVW5GTXJUbEw1aDBHSkRVNGdDeUw0amhScXZUaXNKZVhQd2VNTlpwMUtU?=
 =?utf-8?B?Vy9wUmlwT1ByaHp4alllU3ZMS2hkNWZtQzU2dTNmbGFEY1JtelUrZUl1cnE2?=
 =?utf-8?B?K3p4N1FLYXV6YUlBRkI2aHp2emE2OXc3OWhmRkVjZnZpRDR5a1gwVVZCdEJa?=
 =?utf-8?B?NTB5bUtTQkVOa0NmWG8wOHlPK1Z0bVB6dkFpejJsMEJlRVRPTTVZVWlZT05P?=
 =?utf-8?B?dGJ5N21XT2x2b1g0cFpPcWtJenEwNHJUSWxWSmdYSVUzbVNta2ZIVXJsTmtO?=
 =?utf-8?B?Q3JteU1SbFhrekdMYVNvNHlwR1lTWHJoMUhlNUYzWnYxSTF2emxHQUZ5bjBK?=
 =?utf-8?B?RWlOcUR4OEdXSEhUL3A2akR1NERIUURycTlMQUVJZkprcC9pZjdNYjV2TnFo?=
 =?utf-8?B?aTNOdmFwVmFPN0JqR2M1RVRjaDlYOU1IWkV0cEkxdW1CaWVxYUhsNjRhdFFC?=
 =?utf-8?B?U1d0dmxhTzNBWHROcHdYSi8yd3BnQkpFOWwwN3FkYzJSSmZXdUtpQWFUbEJo?=
 =?utf-8?B?Y280NUMzOVRaTTRhS2d6VEh1TGNUL251S2ExQmk3TGE2R0h5U3BzOGxzL0ow?=
 =?utf-8?B?dk0vVHliQTJzdFl1RVM5N2xFdm9NeHcvOUFSVkN4WWIxeXg4aWQ4UG9BS2w4?=
 =?utf-8?B?bXlkNFdsMTBSME1UeWRycWVaV3lDVzJiSll3aGZQRk5SRlNaSThIT3hFOWhS?=
 =?utf-8?B?dWw5RTNDMzZkd2l1eTUrdlZFdkpRcnpPbTBRbWRQTFZod2FoLzBScWdXRjg2?=
 =?utf-8?B?dUNldFhoMXZvc2dBR1VyR3o0ZjRZajNEWnZMcGVGMFVZVW9KTzBGdEZEZVpj?=
 =?utf-8?B?Ti8rU05UU1BBd3o2MGlxSkg2TWNOZStsQ2RZSnN1SmZrbFc5Wmx2ZGtBZG5l?=
 =?utf-8?B?b1JtQnJoTUphTll1cHc0WG56Y3dsYWx4NUxOSHBBellnMERBQmxzaVNVVlk0?=
 =?utf-8?B?aVJwRGJ4L1dRbjdEV1M0d1F4YkJ5ZndJTVFrblJ5Q1grcUR6b2ZYY3BXVjM0?=
 =?utf-8?B?M015Vm5VVFoycituWVJ6R2cyR2JmbmdBaDQ1WWJEdmJyeU9SRitCb2QySmtG?=
 =?utf-8?B?ZkpNQWYrU1NtazVqRFVHLzZuQXVQOUlIU3ZkbGp0UllNTUg4U3ZjcnJHRjRj?=
 =?utf-8?B?YU4zYVpON3hsblBZNlFIck80TUdJZ2VncHE0b256ZmwyME9qT2Roc29UWFJk?=
 =?utf-8?B?Q0FHS3RvUUdHMXJ2My9mTW9vQjI1THY2RlN4bk1GYmp0N1FQbG41RDQycGM0?=
 =?utf-8?B?dGU4dy9BaVI4cmZ6THNlTFNOUjFYY3dpZWVsZGVWblpEMEwvbzh6aUVUOWVX?=
 =?utf-8?B?MlloWW5pdzFNSXl0S3NibStGMHlkTWNnWEk4SlpCajl0TW1LL1AwRTZNREJ6?=
 =?utf-8?B?M053WmRRQm1sdFNVVUtHVzU3THdoVE9hV0FZWmFIVkFENjNZWUdJdGRPbUtx?=
 =?utf-8?B?ZDZFZ2kreVRSeHBiRWhqdkNNZmJnN2RQalJoNy9HQWtQK0V2aFpxQ1paVkNr?=
 =?utf-8?B?YUNuVnhiR3NKZGZuVnVpUzdVbTJ0dnplUW5zK1hoRW1WTWpPZHFJRVNSY21K?=
 =?utf-8?B?andoYmQzVjFBelgxK2tFWENrM1R6VHE4cWl6TGF0ZnlpVkw3R1k1TE5jcG5W?=
 =?utf-8?B?YldVMWZ2TThUZURHUHhnVGc5dnlOQ2Q5eVRpWEJ5d2tTSU5CL1VpVmR5bmtl?=
 =?utf-8?B?Q2RkQzJVSFNOaUV6bjZkNFp0K2V0L1RIOFZ2N2c3WkUwUDRSbEVuMzhYMlNC?=
 =?utf-8?B?RitKaVdwNzQyRVprTGp1Sm1FMGp5OXNpTUp5M053eDN3VmM4Y0VwSmhZYVh3?=
 =?utf-8?B?bDl5VXg5aFhxamVDN2d3ZkRiSzBNZlVldWlkLzA2UnhkL01JYlBSc0ZnT0Zp?=
 =?utf-8?B?akxGaVBjakEwRDN0STcwQlJJWGIvZjRMNTlSZ29FM3VaOEZZQVZjOFBiMGJi?=
 =?utf-8?B?MVFLQ2VGWXRDZk81L3laeGhoTXhrTFZtdVRvR1liaFhkWFozTU5ISWFqTWFP?=
 =?utf-8?B?bDNEU2lRWjVUaWFLYWN1Ti9vRlNuNWhHbVZpTllpempmS2VVZGtxclMzNGNR?=
 =?utf-8?B?OW9PRHVzeWhpVGREMHk0NUV0R2JFUjdSaVpGSEhJbmNWbWRjcTNMZE9iY0tN?=
 =?utf-8?B?VVlTWXZPZmljU29COHJNTDJRUUxMUWNnV3Jkd25YODRBVEEzeVhJREtqdTRQ?=
 =?utf-8?Q?CO3asoztUDX4YKOK28?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: caca0cc7-3d68-4615-eb9c-08de4a6264a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jan 2026 00:52:38.8758
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aklEz7s7lZx5Jr6yNS7VjnTgsCtzi5pYZOOqJOGXVPixc+g81wO/33fhF2IPbOq/aVFsA0JyK/ds/mOPk1Yt/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7828

SGkgTGludXMsDQoNCj4gU3ViamVjdDogUmU6IFtQQVRDSCAyLzJdIHBpbmN0cmw6IGlteDogQWRk
IHN1cHBvcnQgZm9yIE5YUCBpLk1YOTUyDQo+IA0KPiBPbiBXZWQsIERlYyAxNywgMjAyNSBhdCAz
OjQx4oCvQU0gUGVuZyBGYW4gKE9TUykNCj4gPHBlbmcuZmFuQG9zcy5ueHAuY29tPiB3cm90ZToN
Cj4gDQo+ID4gIHN0YXRpYyBjb25zdCBjaGFyICogY29uc3Qgc2NtaV9waW5jdHJsX2lteF9hbGxv
d2xpc3RbXSA9IHsNCj4gPiAtICAgICAgICJmc2wsaW14OTUiLA0KPiA+ICAgICAgICAgImZzbCxp
bXg5NCIsDQo+ID4gKyAgICAgICAiZnNsLGlteDk1IiwNCj4gPiArICAgICAgICJmc2wsaW14OTUy
IiwNCj4gDQo+IFdoZXJlIGlzIHRoZSBiaW5kaW5nIGZvciBmc2wsaW14OTUyIG1lcmdlZD8NCj4g
DQo+ICQgZ2l0IGdyZXAgZnNsLGlteDk1Mg0KDQpJdCBpcyBpbiBTaGF3bidzIGkuTVggZm9yLW5l
eHQgdHJlZS4gSXQgc2hvdWxkIGJlDQppbiBsaW51eC1uZXh0IG1hc3RlciBicmFuY2ggd2hlbiBs
aW51eC1uZXh0DQpnZXRzIHVwZGF0ZWQuDQoNCmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3Nj
bS9saW51eC9rZXJuZWwvZ2l0L3NoYXduZ3VvL2xpbnV4LmdpdC9jb21taXQvP2g9Zm9yLW5leHQm
aWQ9NmI0YmNlZjA1NDllMzViNzc3ODk2ZTVkYTBlYzhhZjAwZmE5NDJjMSANCg0KVGhhbmtzLA0K
UGVuZy4NCg0KPiANCj4gb24gdjYuMTktcmMxIHlpZWxkcyBub3RoaW5nLg0KPiANCj4gWW91cnMs
DQo+IExpbnVzIFdhbGxlaWoNCg==

