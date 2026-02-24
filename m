Return-Path: <linux-gpio+bounces-32104-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iC0BDaVlnWlgPQQAu9opvQ
	(envelope-from <linux-gpio+bounces-32104-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 09:47:33 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F104183F3E
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 09:47:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 79560309F1CC
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 08:47:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC8BA368277;
	Tue, 24 Feb 2026 08:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="HljI3TBm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013069.outbound.protection.outlook.com [40.107.162.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0755C366554;
	Tue, 24 Feb 2026 08:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771922833; cv=fail; b=aim8VYAMaR5eqX3NA9WJVBXuekmFqSvKBiWOHemzMTI4lx5/EWXUu0rEKrrCBSMgcXYGGF1d1UYrwK/k7R4id1xWEqy4mGbaFYWJumfaAG2ONAewf6xfzXFdFGi1RnYuN80rmShOj0YV6WN/Wr8CeUahBIMG93hYocS0lyEaaGA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771922833; c=relaxed/simple;
	bh=WaFoOIYQUKuhk6Eu+ZnvnwU/uS8NolYW4dmDST0AeYQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=UEyOasFHWuRFoIVgSH6T7AFCJVaoAF30uRytRlFzicGPh4tQrpxNG/EgSgX152Sc1Du698WSdwvBHQtbDLeMD1THsm1iGMrcAGQjUw8ZZoaFAjacjnyZ89mkOg+fSMJw32EkDnmeLPmMzYIkaADQx6RGvq4TFpg5ShiKbwmvhIo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=HljI3TBm; arc=fail smtp.client-ip=40.107.162.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tunv3jJZjBOehSQn+EYKZop4hrV8G/n3jFwKHXRRGCxpxu/RcfcfCosFbqt/mrDYPjgXXMDofJyurEAUksM/tGn/K71RpHusrjz8O6sXuaDNTnlSc709WtXXVJ5kG7EVpkRHHSNyQtdH9Mm/4f2MJB+w5XXUPJS9G7aNXVFGBdTA03OMvqP8jYeSpNVomGK3FrvxSKz/GOpefaRk0THWpd3VWntTVq6jbCChzXE5LLpASvrqSyZdQbaVIFTfacAfxRwVSzdC04uulyTMm3fn99C4iKl3K4JFADziR8VgKb2k49t+GN9eCX3bq4SaY6ZJqMWNrPj8/oysbuDesg06kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZTTLSNYnK9nGExzK9CSYkt6hNF81OW8iDbyT3OwkpJY=;
 b=k5Y6BSWUDHpwBzji6Od66VqNgICNJw7FAmn6kfK4ZFSExdqOrR+1KzmkQPzr4AfLMwMpG9gmYNPGr9eyv7i8yejnRrP7jgQmgEgPQkW22MRcB+/mngE2wzRdM1k3PBW34llTn1F2GEwpyU3hGxyd5RnaIJHfyEUQrFSM8Fg2Q1SmH0CssypiaIZsX6TfDU49zE35k53kToJ9ERsHzSjJr0ify/7QHTNy8anJPnJAThlVdOwQ+H60gE0/QEKUjxhlGxUOt/XZB7j/ruABk5X8wOHKr/AyPQBRMy/mbZI6ceJ48uqbCfXt/xGA1ygRc7CktqLuPSpxgavh6sTLozenlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=nxp.com smtp.mailfrom=foss.st.com; dmarc=fail
 (p=none sp=none pct=100) action=none header.from=foss.st.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZTTLSNYnK9nGExzK9CSYkt6hNF81OW8iDbyT3OwkpJY=;
 b=HljI3TBmlx0kXPiXY/ijRO5Is9OD7/N8YzEigDPRtlrZ0G8L/AuhDYu9W02yXm4QjQaBPbafbJLy5Rg20Kz/GWtbwP++P2wNQnPvGv0CVkrNzHC9Ub7pgu52ZJk98p2gOzGwq77J4i+QVF6Wtvienwh9tS9wAHSnqqSQCmeVOtIUBZRizzYRdYZkPdxBTwgehhyC3h0H/JJf0zGRmxP5j2/muOX0/CtD5l0B5vybuaMi9k8tTCKnqHYp+/mRRw6ofiiqPw2QwxQpZWabY1mTppy7yXceXA5kdveb5Ya+6Q/VKtgvRqw/T2qZIouaaKYU7YeR5ZLrjLYkK80MCzhosg==
Received: from DU2PR04CA0061.eurprd04.prod.outlook.com (2603:10a6:10:232::6)
 by VI1PR10MB7854.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:1c4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Tue, 24 Feb
 2026 08:47:02 +0000
Received: from DU2PEPF00028D05.eurprd03.prod.outlook.com
 (2603:10a6:10:232:cafe::df) by DU2PR04CA0061.outlook.office365.com
 (2603:10a6:10:232::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 08:46:55 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU2PEPF00028D05.mail.protection.outlook.com (10.167.242.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 24 Feb 2026 08:46:57 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 09:49:13 +0100
Received: from [10.48.87.127] (10.48.87.127) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 09:46:56 +0100
Message-ID: <64ef5dbf-6264-4758-a5d8-d8c52c359fcc@foss.st.com>
Date: Tue, 24 Feb 2026 09:46:54 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
To: Shenwei Wang <shenwei.wang@nxp.com>, Linus Walleij <linusw@kernel.org>
CC: Andrew Lunn <andrew@lunn.ch>, Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Bjorn
 Andersson" <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Frank Li <frank.li@nxp.com>, Sascha Hauer
	<s.hauer@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	"Peng Fan" <peng.fan@nxp.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
References: <20260212213656.662437-1-shenwei.wang@nxp.com>
 <20260212213656.662437-4-shenwei.wang@nxp.com>
 <aae7c851-a93b-4d57-a118-43c6e68c4790@foss.st.com>
 <13f9d767-61d6-4e29-b36e-6dcc860ccb11@lunn.ch>
 <fd257c80-d97f-45b0-a12f-3a1888ba81db@foss.st.com>
 <396819f2-dd00-4c09-8bc7-c035a5282a56@lunn.ch>
 <PAXPR04MB9185A908F5090F0CA4FF05F78968A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <b21b9ee5-d84e-47f8-86b5-c111ecc3d43d@lunn.ch>
 <PAXPR04MB918576D67A268E59242964A08968A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <CAD++jLkUVFckLTq=SoivNFoFymhJo4KM=qGmajFcv9T9+7tPmg@mail.gmail.com>
 <b4c422ce-3538-40aa-8bfa-b70f02774b5d@foss.st.com>
 <PAXPR04MB91859B642802813F908B03DA8977A@PAXPR04MB9185.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
In-Reply-To: <PAXPR04MB91859B642802813F908B03DA8977A@PAXPR04MB9185.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D05:EE_|VI1PR10MB7854:EE_
X-MS-Office365-Filtering-Correlation-Id: 4edd8e12-6da1-4a46-99da-08de738144f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|7416014|376014|82310400026|1800799024|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TlRjWEN3R3dvVnFleVQ4YWNDTGc2RFVSdklGcDYxTEdzTHY1aGFCKzVwUVFM?=
 =?utf-8?B?K2xROG42L0x6enM3THNpK21IV0JZd3ZEekt5b084bEpPcGdld0NMZkxsekdw?=
 =?utf-8?B?RVRUNmNGeCt1djdoYU1vTktvTHdDa1pIZExKWFR6ZTMzWnJPSHpBSVorUVV2?=
 =?utf-8?B?TkxwdHNRYS92a2R1dVpBR0JqckNuUTNvWGJaOXZNL0g2TGRvMTFLTERaSzdv?=
 =?utf-8?B?aHJHdXduVC9BRDdkVmd6cmJaNFhpcENyZzZyYlV4Y2dpMHhQdU1EQ1hXam5C?=
 =?utf-8?B?aHUzbitrMlpOSS9wOUEwbUtodk92Q3R2c1U5L2J6QmJXaFpiYytoTkxTZ3dZ?=
 =?utf-8?B?UktPNUdVcTlSek5abEY1b1Fhazl4TnVBV1lPdGptNDZPUzE2SnhsVWlaVnhj?=
 =?utf-8?B?Z1NISFlrNHBJNXM2cVd3M3MrUCtiK0oxZG92eVNqcnVzOGpMckRDNWlYdjBv?=
 =?utf-8?B?b1hub3hrZnFLSWFTZWdKLyt0V2pDWXVyemZXOWJ1YXkxa0Y4emQvWkVBT2lP?=
 =?utf-8?B?c0pSS0pvTWVWTlZVVVhBMWhoa1Z4VHRRUWdpRnlhS3J2TWF6bDBaRktSU2Jj?=
 =?utf-8?B?UktkMnovWGIzcGN4dlRscnpQY2UxVHVLZGo0RmxJRWJHVnJ5WWJPd3FWNFVt?=
 =?utf-8?B?eVhxYzhhZ2ltWS9qbE9zRXRSN2E3SWh5bTU1MUI3L21ReWhBVkNJMEpxZ1Rm?=
 =?utf-8?B?YVN4a2ZlVGZockgwL2Y5ZjRtR2lIUTZWR3ZOK3BxVEZhZWJjU3p1VmQ2UzIy?=
 =?utf-8?B?YnprMWVGZSsvd09PeHJGNndqMFlZejRJTjhUTFBsTW9QY1VuMFZMOTdyVUVn?=
 =?utf-8?B?a2xVS3pVcGczK28vWjZnRHdPTWlrYUQxcjZCalM1Q2JScDVZY09LK3pPWW1S?=
 =?utf-8?B?RFdCK2tRSVMrTjlZcFpZOWNCb2xRQUtmZWVydEFCTC9wbE1wa1BWOGkzLzg0?=
 =?utf-8?B?djFKQ2doSWdRUzhtenpvM053Zi9FcUcvL1pqSWYybmdCWEtOMXpvK1J4d29B?=
 =?utf-8?B?b2FzdXhLcmRzV3hzVW9MdlR5eGQyUWl4TGh2VUh4NXVKcGlRQXpscWZrMmg0?=
 =?utf-8?B?NXpyaC9renluTWNPK2ZLQ2hGLytnM1BIS1pBMGZDZEcvM3ZiU0FncENrYTVl?=
 =?utf-8?B?RzRvUEpid2NmNVNOTXp0OTdkU0pVOUU2bm1NNkdIRlFzMENGZU41UWRScjkw?=
 =?utf-8?B?ZWc5ZzB1RHdyaUt1c0xMWjN2eVR2UXRIanB4RTc4cWFaOVB6djA5eVpGbU9O?=
 =?utf-8?B?QVp6R3dNSkluU082blhVSjdGVmkxSm1OZVFpSzZCQ0E1QytScHpnNENzbHZo?=
 =?utf-8?B?QnU1TFJjNzlOWmthM3RqYzdEblJYdXZ6dk0wczRoMHc1QXpLMVpoM1NJcjQw?=
 =?utf-8?B?NjluTmtnYi9VQk1jc0R4Y0RSZVU5Ly9Fc1ZTV3RjcE1CajlDZ1Vsc0pwRGRw?=
 =?utf-8?B?dE9JRzRTQk9NQUczMEN4aGtXb1RaVmdhNHhLbVFwaFd6NDNyaG9YQWtzZUJT?=
 =?utf-8?B?cGVSRm9ZaktaU3RUMXJZTXlVbDdoL3ZybTdqd21HZ1JPNzRaczBpUWRnT2lS?=
 =?utf-8?B?ejJ4MXNMbXQzZ29zRWhVS21rMnROWW81VHYzSG5zYmk4YUpYTmRoMWdaR2lT?=
 =?utf-8?B?K1huZ0xxV2MyZ3pNTXRlNitVTlYwUnhaRkZZUUhsdHJLdHdlSS9WSVowWlpk?=
 =?utf-8?B?dTUvTzd0WUh0Q0RZNVpjcjBYTzQ1a3oxV0ltQjBadS9RNlVpaThTLzNRMjBK?=
 =?utf-8?B?OFlaREN0M0RtWXUveHpVbGRIUGIya3UxYU5OaXMxSXAvOFI5MW0rWU52UEI0?=
 =?utf-8?B?K2xRQWUzNWIxWDdSS2VPUmZOekxHSGJVdXZ5cHZ1SUZrck5pem0rR0FuQmt1?=
 =?utf-8?B?c2hlbjMxOHZFYk1rbkVFc21wZTdHWFVudVBySzdXZzViVlYzUS9oc0p0TTJ1?=
 =?utf-8?B?bGZSNUw1ZFNZeWovMU1sc3QvOFJxdndMOG8yWDAvRVZUVDVzeXdiWm84UFZk?=
 =?utf-8?B?RUtIdG1BeFRpVkVab1UxbkJnaDlGS2NQNTdjaUwvZkw0cUJqbXZFZHU1eXhp?=
 =?utf-8?B?c295M3luVzIraWEvTU9IMXFZVWhVOWtnNEErYWxkQlMxaDVnT2REYzAxcmxL?=
 =?utf-8?B?NHh2YncvN09IM2NQcldVN1V6TVNoaEpTYWxQMGMvYk5QRWxGcVFmY3M5WndW?=
 =?utf-8?B?V2l2WUlhSXo0SFRZZ3A4MFBGc0xIQ25ZdWdyT0NoN294OFlLTzJSc2l5ZFFQ?=
 =?utf-8?B?SlBQcXdTYlJhSnY3amJ1NzRHZDdBPT0=?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(376014)(82310400026)(1800799024)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	K+ZEhVIYgBmaH1oS8xQaHErfhOOjg1T3ek4ePdQioBdRH5G34bGcXVqD24L+fINQLxHG7k0iyy6naK+TxEKjd5+LKHrbNZyAK1KLFiMTact9Itw7NJ1OKM/4YEBcyuiaVkgfSBXCID1b4tNnik68muMk1glw0bZixwlJcvT03yzGi9A0ycnGw64xO7B09+sO2fFVHNNtNJMu6d6/EDl7C8/ovlPiO92yA7pfO07Z5CEEz6UNS/Epr+3BDzH70OVtvRFYASD4iel6JOeFeyh45jHbo6L0672s7frT/7It3EI+p6pCaXkZVvceU6EKzBrOsMFW0ekXtxrHrBMtnuGEhtgRmyzdxK91Bbcnn9y8WNwD/H1aMsTDlADURhQt13u27OJQ3CSUUdbgAdo6z/XevpWrlyHFjJLwN2pbe/lEBQWs65yks0IydOpkwvKbRSTa
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 08:46:57.6895
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4edd8e12-6da1-4a46-99da-08de738144f4
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D05.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB7854
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[foss.st.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32104-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[lunn.ch,kernel.org,lwn.net,linaro.org,nxp.com,pengutronix.de,linuxfoundation.org,vger.kernel.org,gmail.com,lists.linux.dev,lists.infradead.org,bgdev.pl];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnaud.pouliquen@foss.st.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 9F104183F3E
X-Rspamd-Action: no action

Hello Shenwei

On 2/23/26 21:33, Shenwei Wang wrote:
> 
> 
>> -----Original Message-----
>> From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
>> Sent: Monday, February 23, 2026 8:25 AM
>> To: Linus Walleij <linusw@kernel.org>; Shenwei Wang
>> <shenwei.wang@nxp.com>
>> Cc: Andrew Lunn <andrew@lunn.ch>; Bartosz Golaszewski <brgl@kernel.org>;
>> Jonathan Corbet <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysztof
>> Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Bjorn
>> Andersson <andersson@kernel.org>; Mathieu Poirier
>> <mathieu.poirier@linaro.org>; Frank Li <frank.li@nxp.com>; Sascha Hauer
>> <s.hauer@pengutronix.de>; Shuah Khan <skhan@linuxfoundation.org>; linux-
>> gpio@vger.kernel.org; linux-doc@vger.kernel.org; linux-kernel@vger.kernel.org;
>> Pengutronix Kernel Team <kernel@pengutronix.de>; Fabio Estevam
>> <festevam@gmail.com>; Peng Fan <peng.fan@nxp.com>;
>> devicetree@vger.kernel.org; linux-remoteproc@vger.kernel.org;
>> imx@lists.linux.dev; linux-arm-kernel@lists.infradead.org; dl-linux-imx <linux-
>> imx@nxp.com>; Bartosz Golaszewski <brgl@bgdev.pl>
>> Subject: [EXT] Re: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
>> Hello Linus,
>>
>> On 2/22/26 15:48, Linus Walleij wrote:
>>> On Fri, Feb 20, 2026 at 7:57 PM Shenwei Wang <shenwei.wang@nxp.com>
>> wrote:
>>>
>>>> Given that, I’d like to hear from the GPIO subsystem maintainers —
>>>> @Linus Walleij and @Bartosz Golaszewski — on whether a driver that
>>>> works with the current hardware/firmware design could still be
>>>> acceptable for upstream inclusion. My understanding is that upstream
>> generally supports existing, real-world hardware as long as the driver meets
>> subsystem standards.
>>>
>>> What a swell party this has become.
>>>
>>> In this kind of situations I usually refer to
>>> Documentation/process/management-style.rst
>>>
>>
>> Thank you for pointing out the document, I was not aware of its existence. Very
>> informative!
>> That help me to understand you proposal below.
>>
>>
>>> What is the message I as a maintainer is getting from NXP regarding
>>> "gpio: rpmsg: add generic rpmsg GPIO driver"?
>>>
>>> Arnaud, who is the only person in this discussion who actually wrote a
>>> standard RPMSG driver (drivers/tty/rpmsg_tty.c), must ACK this patch
>>> if it wants to call itself a "generic" RPMSG GPIO driver, if he does
>>> not, then it isn't.
>>
>> In Fact there are already 2 "generic" drivers, the second one it the
>> drivers/rpmsg/rpmsg_char.c, both are used on several platforms.
>>
>> It is in my plan to test the rpmsg-gpio on ST platform if we go with the generic
>> approach.
>>
>>>
>>> Is it generic? If it is not, let's call it "NXP rpmsg GPIO driver" and
>>> rename files etc accordingly. Maybe it can share code with the actual
>>> generic RPMSG driver once that arrives, that is more of a library question.
>>
>> I would like to (re)express my concerns regarding the creation of an NXP-specific
>> driver. To clarify my concerns, ST, like probably some other SoC vendors, has
>> rpmsg-gpio and rpmsg-i2c drivers in downstream with plans to upstream them.
>>
> 
> Linus, thank you for jumping in and providing the guidance.
> 
> I would like to clarify one point here: what we are discussing now is not whether the
> driver itself is generic, but rather that the current protocol is not as perfect as Arnaud
> would expect, since it contains a few fields that may not be required on their platforms.
> 
> Arnaud, if you agree with the points above, my proposal is the following:
>   - Remove the fields you mentioned in the protocol and update the driver accordingly so
> that we can establish a true baseline for a generic implementation we all agree.
>   - Then prepare a separate patch to add support for existing NXP platforms by introducing
> the necessary fix‑up functions.
> 
> Please let me know if this approach works for you. My goal is to find a solution that works for
> everyone — even though I know that pleasing everyone is almost impossible.
This looks reasonable to me, but I am not a maintainer, so I will let 
maintainers share their opinions on your proposition.

Please note that you have also to answer to Bjorn and Mathieu about the 
rational to use RPMsg instead of the virtio protocol.

For the ST platform, the main advantage of RPMsg is the ability to mix 
buses on one virtio interface, whereas Virtio requires allocating vrings 
and mailbox channels per Virtio type. When data rate is not the 
priority, RPMsg may be preferable.

Another limitation e observed, when prototyping a virtio-i2c between 
Linux and a remote processor is the allocation of specific DMA memory 
region shared between the processors[1].

[1] 
https://github.com/arnopo/linux/commit/ae47a1cbf95125ab10952283622653d626e56e6a

Thanks and regards,
Arnaud

> 
> Thanks,
> Shenwei
> 
>> If we proceed in this direction:
>>
>> -Any vendor wishing to upstream an rpmsg-gpio driver might submit their own
>> platform-specific version.
>>
>> - If NXP upstreams other rpmsg drivers, these will likely remain NXP-centric to
>> maintain compatibility with their legacy firmware and the nxp-rpmsg-gpio driver,
>> leading to platform-specific versions in several frameworks.
>>
>> - The implementation will impact not only the Linux side but also the remote side.
>> Indeed, some operating systems like Zephyr or NuttX implement the rpmsg device
>> side (Zephyr already implements the rpmsg-tty)
>>
>> Maintaining a generic approach for RPMsg, similar to what is done for Virtio,
>> seems to me a more reliable solution, even though it may induce some
>> downstream costs (ST would also need to break compatibility with legacy ST
>> remote proc firmware).
>>
>>
>> In the end, I am just trying to influence the direction for RPMsg, but based on the
>> discussions in this thread, it seems others share similar expectations, which
>> should probably be taken into account as well.
>>
>> Thanks and Regards,
>> Arnaud
>>
>>
>> I just want to
>>
>>>
>>> Yours,
>>> Linus Walleij
> 


