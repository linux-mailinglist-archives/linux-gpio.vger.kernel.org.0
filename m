Return-Path: <linux-gpio+bounces-38720-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id r2MYB+djNWqduwYAu9opvQ
	(envelope-from <linux-gpio+bounces-38720-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jun 2026 17:44:39 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FBFB6A6C9C
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jun 2026 17:44:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=K2iFN2us;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38720-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38720-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7B466302F430
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jun 2026 15:42:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71E3A3B47CD;
	Fri, 19 Jun 2026 15:42:13 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011017.outbound.protection.outlook.com [52.101.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98BD63B7744;
	Fri, 19 Jun 2026 15:42:00 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781883732; cv=fail; b=LRbRj2g8dgqlielkB0CUVqivFCMDOJuDv8MzOq8cBPone+K6TXxRh4fBa3bmdy3j9/AFzv//sEYl0kJW4XtyVAadHn9/+MzHj6LoXTt6WwcCgZx7XBwQ5zMs2iSwFJZw8j2cHQeGpz+k6nUVCu/YiuOyivyUWgm05rHKaqfKO/M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781883732; c=relaxed/simple;
	bh=IaRhKAYAI7uXAr4rhgh9AM6DRkbVY3u6qRU2ItqkyOk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=FKdqTvrhz+zWzDPVAR5wJE98gAzFGC6cieEICc8m2sEKcCviZhklvZrEVHnUlDzqxnzS3lrqKWPm6tPdUQIhG4Hmlo2JKBXPBnEIFWtbNTN4lzuoBlAtzt9UYzPQilY99z/C1xS3mRRhQdxQrRU3M6CYAMTl2MGiaIHbq4ATzSg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=K2iFN2us; arc=fail smtp.client-ip=52.101.65.17
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bQgxzZsoHemil96bbSkDzzV/keFUb2HqLCtmZTVEDvRTxN4poTQge9W0dqwZYdDLquwsZaGCM4iNnTe2WSBZwuGUAPAfbkxH+/uMQy7FM4yQcNsMFXaE6PJ+HjG+myaXLrDFrsEhPaj71eDI+cGwqAJ4xTjt3SPJ3Quw21eIZp6knRbXzqEK4QuXjHHrcz6+efXz+qdY7gPY6SFv1L+hzsji4ceMzYpBfqw3LHAgoeq7R+v3SXUOZUbQBbX2Fv2LcA28fuHhyRUN9bQE1meezZiTZEpP7Pi/uJyQEs+9F4/YiS8Cw+2xbrsUAFR7OVsgln67mXmaVUgsPjQJjScwUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X0YOPM0si2P8uOWgNnZI2CowJlUcC+2VzFeDoHw8xr4=;
 b=kTYMwwJ7GZSQHJQiKKZose+pOpGyntSHddrBh3+GcSWdDmMEABh0yv4EIpVAxfPiVsYGM2KvLGdENLZx7GAmd+fG9Tis+hedISAnZ7bFG4om9JnTIx96fzP4ODqszVehOtjrejoQPqE43e7hA7fuBTZ+nIXHYvtBskM6/DcmRdBdFMj0pRSvRWGazKAp1tEpqUYrs80zrmP3ozq3w0ck0trwZtkj8mbCYhg28oCfq+FigFqc6VC+MxTry0EOvjSbJL+wdT4HLKdbZmLonwRoZlvKD4wb4T3IPSq0TWrn76Tk6zLXAKEK4Rn8oFrELV1ERpirVokznxHYInWWg7UHmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X0YOPM0si2P8uOWgNnZI2CowJlUcC+2VzFeDoHw8xr4=;
 b=K2iFN2us/pMpWtcSLUqD6do8lKs3NaYotAMTmOsJD+PJ5jl2zv49quKiDBR7THyNM1JJZpdHtr6mU9x9Ae+lM2f/lmRsb+v1eivvBRxhAjRkun8cDmu5gg3bzgNfTh74P1kb8OoZcOBYkKkoJpfXr7RtvyJwTt6iQJdBFJ5JSigK6a0v7mLkZwg9hqmg6zUyp+r9K6owFIjcAndhG/NP0nA5WJgA/xdiZmWgf7dqxBVTM5uSiqoBqlffmFFRz7NkjKlZD5LL/6wSsciHzfmz6+uFeoq4FiI157Qs58IMIPoxhasgMvCg6W5P0F3701J9z0M+0avTajFum2UYvkTZwQ==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAWPR04MB11550.eurprd04.prod.outlook.com (2603:10a6:102:50b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.13; Fri, 19 Jun
 2026 15:41:57 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0113.015; Fri, 19 Jun 2026
 15:41:57 +0000
From: Frank.Li@oss.nxp.com
Date: Fri, 19 Jun 2026 11:41:05 -0400
Subject: [PATCH 08/11] ARM: mach-lpc: Remove NOMMU platform support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260619-dts_cleanup_arm_mcore-v1-8-0101795a2662@nxp.com>
References: <20260619-dts_cleanup_arm_mcore-v1-0-0101795a2662@nxp.com>
In-Reply-To: <20260619-dts_cleanup_arm_mcore-v1-0-0101795a2662@nxp.com>
To: Arnd Bergmann <arnd@arndb.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Stefan Agner <stefan@agner.ch>, Fabio Estevam <festevam@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
 NXP S32 Linux Team <s32@nxp.com>, Linus Walleij <linusw@kernel.org>, 
 Vladimir Zapolskiy <vz@mleia.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-hardening@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781883675; l=53546;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=drapZ5rvUY38W2af/FVVZ7mLqB4sQ+tnYGN/Fi0xPIk=;
 b=gatfRLYM+Gttt/XxKcnPh0kCCEni1ZaUgQOkW8XN32VkAg6DSATfPzdNF1zyicG3MACprnN+/
 eEYQrDrydzgCAukEzpGX7osRmxxuAQyhdCcTb65qtdJsq9X/hKq7N6T
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SN7PR04CA0115.namprd04.prod.outlook.com
 (2603:10b6:806:122::30) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAWPR04MB11550:EE_
X-MS-Office365-Filtering-Correlation-Id: 68f5f603-d81e-4d8b-e48f-08dece194b60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|7416014|376014|366016|19092799006|6133799003|11063799006|56012099006|18002099003|22082099003|921020;
X-Microsoft-Antispam-Message-Info:
	VC2iGu3N9KJEELb7UndslgNjOeCmFjRxc62ZYCy5qrMAVW6qyUwCoOETobXCo2MHeq7+CEcVypIOzarVCjpnekpDEsRj8EUSg6XXWAKbFfbnpMypO97jAPMEi1uKai+hDudZMBkg4hXlK6RPGCPTnWZQtx3GVYVf7ctybcDJqcmQe0hjwcvIPOD2xPsTN7MO7/PDsGZMlU1tFgdZ2t+/GswVoSaJnENTg26CGGLKeIiFTviUZRvJeK985H+o9FizOjE+MfktP6qJeeQYyvWRqsAJtKN1q3NfMrRVM9slbtgVTrXNgHQXp6faas3mvtaFU/vMlVXAy5mu0eTYmdv4c8HqXooFxSKXoxji47ViFK+omwQ7VRIq9MoXpBFZYiq5MjhJaHHhvkegXgK2rZanYElBxaNN3LsKXJW/6eqQr9cIEQ7WBVMA8p945xsmehe1M9eEbVNIB9+YOnq2n8J99u0AE66xa/ZJbNUX5X/Da51r6xG+Tz2OcqBboQ+2g/z7XbpxseSilqNbfPqkhE11sjODGgFovVsbGBSymkHbTUzVLu+2Why4qrCsKqzWt9+bLmIB/Zui/nYLdLTXT26g5QeRFHOwSDCs73lQtjDWEpBUOrJGAlBqgy2XciKYuxGCrLGC0ImySAXDIiwTNIRW8dHZiYFZ5npN4mL7OQoSXl+ttxLsqry6sjFU3ZsJImDYgJQNFT2qc1gPf3vUT7bg6Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(376014)(366016)(19092799006)(6133799003)(11063799006)(56012099006)(18002099003)(22082099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bUx6ODhmbXRSTFpzVjkxb3BLdERGWlMxT0lMSnBhd2p0Qy9vUDRZVDdwdUxh?=
 =?utf-8?B?a2dmcmdyYy9tR3JJZ3J1OXR0RjVqaVFYNDdEczZmbVdKTVBiV3o0QW9BSk9q?=
 =?utf-8?B?bGNlc2NYdC9yaUNKaUhtOGlQWFV2WnVoVnlWeUEzdGMxYlpwRDlIM3c0MmRo?=
 =?utf-8?B?VDNleXNId3pNSnV2OG4rS0xNaEdsV0pHWmtKWjdtTGd0K2xJZTkyaG1KZ2R4?=
 =?utf-8?B?VGFUNWRTWmtPN3cyOWkrcjFTRjQ0TUxDTkFXMWxZQTdrWjFpMlBvYXlrY25j?=
 =?utf-8?B?TTJxSmhMT3N5cXBQM3FJTG1Ddk8rWkZYVUFkbDhDcU1aV2p4dExKTTVWYkJ3?=
 =?utf-8?B?WmlJVlR2c3N3TjJaRnptK254d1RsaFJ5OC9vYlYwNzFkRVJibUpFUXhUWUhZ?=
 =?utf-8?B?RFRKTHFqaVdKczJVZGpvb1UvQkRxZlZqd2lJd2RNVHhwdWJmRGhkS2gzcFVu?=
 =?utf-8?B?RVMzTDl5b1ZqTXhodEhmOGhzSkt2TUlKZGJ5Tk1ReEErek9DczRWUDdxUlpi?=
 =?utf-8?B?akMwWFhmNHNROEk4Y1pmMUhTSEh4TitZU1BxeUUwQ1BoaUdJZElabFpHalRj?=
 =?utf-8?B?enNmS3dLcVgrVXFSQlhENGsxYkNqUHFuUjQ1UE82MURDelIwMmFhS1M5bHd2?=
 =?utf-8?B?NkJId0dWRU9ldklTZ3krK0ZDcHRydkJNV3krekp6cE52NFpPa1lGeFBDWGhV?=
 =?utf-8?B?OTFDbHlZckdrZFNyT092aC9mczR3ZHZVQXVvU29ZYS8zM1l6cXM0R1VlalZJ?=
 =?utf-8?B?WEx4OWxNWDNLbVFPWTMzY1c2MnRFQmRZU2dPSUlnSzloSm0vZXdpSHFHaktm?=
 =?utf-8?B?ditlclVDNEVYSERHUU8xRUo5blV6MGtiRlNJQkMzejlWRFpUbi9RTGYwZnJY?=
 =?utf-8?B?aklKcWlXMDcveWI5dGMyVk9nUld4YlM4bDFSaWVLOC9LWkM1anFlbXNnSFFX?=
 =?utf-8?B?NUpnejkyZTdGQ0RSSHlPbzZDaXAxeW4wQWk4bDEwQ1FiOFdxWExCVUQ0TmpJ?=
 =?utf-8?B?OTBObUlYbHhSQm01WDNNZHRCc2VtRHM4a1h5WDNvN3owMXdGTS9TcE9peWZJ?=
 =?utf-8?B?YmM5d2pYWTFHMWpCUU1KOFhmWWM3Vk9rMTRvMDFSUy9pNVZiR01UOEo2UFRY?=
 =?utf-8?B?TDkxbUdNaFJtbktPWStsOHRGOGJubDJMc3JSMmN4RmhjSk9ieDNYN3d4aHlq?=
 =?utf-8?B?RmFpL1FHNEtpZVEwT2djcDJZVkZVYlZvT3VkKzUxUS9tTVloNjh4emRNU3B2?=
 =?utf-8?B?MC9EdDlGL3U1OUtSSWU3Q0c1NmMycU5oTE9neTJGMDc5bmI1Unhob3AwQ0Fo?=
 =?utf-8?B?OG5sMDErL3FVa1doWkRlakc3Q1dobmM4ZFdWNWFwUzFZSXllWEduWU5KOFla?=
 =?utf-8?B?OXlTVy9IT2g2ZytEa1k5QVYyWS9Sdm4vT09aNWlrSEdOWDlQMGpIdWlhcGs2?=
 =?utf-8?B?WkxlMkxpVVovQjZQT1dVekg1STFBZTFmWllnVG1oSWRjS1VGNFJUcG1QNEtO?=
 =?utf-8?B?Y2lUMXlsRHBuZWtyL0NtUldTS0Z6TkFxdUZKUVNuVjZnWTNVT0QxMUZOVGdH?=
 =?utf-8?B?dzlodFBKMjJUeGpuYXZ0M1N4YW4zdTUxL2JEWWVnMnFVSGV1L3RNbGJYbU05?=
 =?utf-8?B?QWpNamRmOHFSTkxQTW91S0thNDFzOVdvc1E1ZE56UUEwS3diQmNmS28yelph?=
 =?utf-8?B?V0dRNlRaYVBUamFxZXZyYUkwZWQvZXowaGFKdXFSN0NNYWdVblkvRjVYMlRS?=
 =?utf-8?B?WjYyNEMrRzZrSW15Y3VlMnZsUDZQaDZWWXdLcU8xNXJsUlJOZ3dNeWRZelFZ?=
 =?utf-8?B?YU1HYjJpZ2hyZHFXYVJHTW5pZHUydkN3cVdnNmw0bWIramFCQnlBU1VWS1BR?=
 =?utf-8?B?aEFwWHJ5emJ2ek5hMzZ1aG5zdnhhd0F3VkxyKzVKVW8raFJkWGFqajJOMU80?=
 =?utf-8?B?RWJIbHFSeVJYSFNsdXpMNjBZNm1HSkxIVld6VG9VNFFSR01GUFZRT2h4NG9p?=
 =?utf-8?B?WUI5MkZIU3RoOEg4ZFFjb21kWFV4bjFCQTZSVi9laXB6NGpYMnpDMzQxUVZS?=
 =?utf-8?B?TXRqTVpFREV3T0dBMk1pbVgzSDF1WFEvU1hvREJ1bnJJZ3EyOTlsWEgyZng4?=
 =?utf-8?B?Z0tvSEJnOXVIOVZkaHBGbUt2TkNCbnBzY1Y0cTV4RUUvRlI2UWpBRGNVdWZq?=
 =?utf-8?B?MTBYYU4zL0FRdlNHUnlad0RET29rRlhFMHkrTEFDeWtjdkQySFBXRHFGOU1y?=
 =?utf-8?B?TDdrQy8xdllQUmRzOHMzZXZYaGc5QnRueTY0OUpmU1k2UmxXY21JeDhqZnhO?=
 =?utf-8?B?dVlrN0taYjNsZlc3K20ydDZVdndxRy9GalcwK3VXWklTend4dFE1U0E2TTBN?=
 =?utf-8?Q?GU8cnUZkxDv5BICdxmiTSWZKr+HfivbxuMYCr?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68f5f603-d81e-4d8b-e48f-08dece194b60
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 15:41:56.9862
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aYWzEKyhFP2Fht6fOPyJ3G60GgU3k+Zr69DfYFYloKkAiVgOCpT0g2KeO5iYRMNTwoqovn5wthVF9X9EwOGZMYtqq/SsADiytyVVLqhSf+MoqxmF3Da9Byt/1vvYdSMd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB11550
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:arnd@arndb.de,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:stefan@agner.ch,m:festevam@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux@armlinux.org.uk,m:abelvesa@kernel.org,m:peng.fan@nxp.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:aisheng.dong@nxp.com,m:ping.bai@nxp.com,m:s32@nxp.com,m:linusw@kernel.org,m:vz@mleia.com,m:piotr.wojtaszczyk@timesys.com,m:kees@kernel.org,m:gustavoars@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:imx@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:Frank.Li@nxp.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-38720-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[Frank.Li@oss.nxp.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	FREEMAIL_TO(0.00)[arndb.de,pengutronix.de,agner.ch,gmail.com,kernel.org,armlinux.org.uk,nxp.com,baylibre.com,redhat.com,mleia.com,timesys.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@oss.nxp.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,nxp.com:mid,nxp.com:email,oss.nxp.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,NXP1.onmicrosoft.com:dkim,mvista.com:email,antcom.de:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5FBFB6A6C9C

From: Frank Li <Frank.Li@nxp.com>

Commercial users and hardware vendors migrated to Zephyr or other RTOS
solutions years ago, leaving the NOMMU platform support effectively
unused and unmaintained.

Remove the obsolete support to reduce maintenance burden and simplify the
NXP/Freescale platform code.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/Kconfig                 |  12 -
 arch/arm/Makefile                |   2 -
 arch/arm/mach-lpc18xx/Makefile   |   2 -
 arch/arm/mach-lpc18xx/board-dt.c |  19 --
 arch/arm/mach-lpc32xx/Kconfig    |  13 -
 arch/arm/mach-lpc32xx/Makefile   |   8 -
 arch/arm/mach-lpc32xx/common.c   | 125 -------
 arch/arm/mach-lpc32xx/common.h   |  32 --
 arch/arm/mach-lpc32xx/lpc32xx.h  | 717 ---------------------------------------
 arch/arm/mach-lpc32xx/phy3250.c  |  92 -----
 arch/arm/mach-lpc32xx/pm.c       | 135 --------
 arch/arm/mach-lpc32xx/serial.c   | 148 --------
 arch/arm/mach-lpc32xx/suspend.S  | 148 --------
 13 files changed, 1453 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 9187240a02db5..fe67d41f4a107 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -401,8 +401,6 @@ source "arch/arm/mach-ixp4xx/Kconfig"
 
 source "arch/arm/mach-keystone/Kconfig"
 
-source "arch/arm/mach-lpc32xx/Kconfig"
-
 source "arch/arm/mach-mediatek/Kconfig"
 
 source "arch/arm/mach-meson/Kconfig"
@@ -470,16 +468,6 @@ source "arch/arm/mach-zte/Kconfig"
 source "arch/arm/mach-zynq/Kconfig"
 
 # ARMv7-M architecture
-config ARCH_LPC18XX
-	bool "NXP LPC18xx/LPC43xx"
-	depends on ARM_SINGLE_ARMV7M
-	select ARCH_HAS_RESET_CONTROLLER
-	select ARM_AMBA
-	select CLKSRC_LPC32XX
-	select PINCTRL
-	help
-	  Support for NXP's LPC18xx Cortex-M3 and LPC43xx Cortex-M4
-	  high performance microcontrollers.
 
 config ARCH_MPS2
 	bool "ARM MPS2 platform"
diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index 573813ef5e77a..dd30c256780d9 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -191,8 +191,6 @@ machine-$(CONFIG_ARCH_HIGHBANK)		+= highbank
 machine-$(CONFIG_ARCH_HISI)		+= hisi
 machine-$(CONFIG_ARCH_IXP4XX)		+= ixp4xx
 machine-$(CONFIG_ARCH_KEYSTONE)		+= keystone
-machine-$(CONFIG_ARCH_LPC18XX)		+= lpc18xx
-machine-$(CONFIG_ARCH_LPC32XX)		+= lpc32xx
 machine-$(CONFIG_ARCH_MESON)		+= meson
 machine-$(CONFIG_ARCH_MMP)		+= mmp
 machine-$(CONFIG_ARCH_MV78XX0)		+= mv78xx0
diff --git a/arch/arm/mach-lpc18xx/Makefile b/arch/arm/mach-lpc18xx/Makefile
deleted file mode 100644
index c80d80c199d37..0000000000000
--- a/arch/arm/mach-lpc18xx/Makefile
+++ /dev/null
@@ -1,2 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only
-obj-y += board-dt.o
diff --git a/arch/arm/mach-lpc18xx/board-dt.c b/arch/arm/mach-lpc18xx/board-dt.c
deleted file mode 100644
index 4729eb83401ae..0000000000000
--- a/arch/arm/mach-lpc18xx/board-dt.c
+++ /dev/null
@@ -1,19 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Device Tree board file for NXP LPC18xx/43xx
- *
- * Copyright (C) 2015 Joachim Eastwood <manabian@gmail.com>
- */
-
-#include <asm/mach/arch.h>
-
-static const char *const lpc18xx_43xx_compat[] __initconst = {
-	"nxp,lpc1850",
-	"nxp,lpc4350",
-	"nxp,lpc4370",
-	NULL
-};
-
-DT_MACHINE_START(LPC18XXDT, "NXP LPC18xx/43xx (Device Tree)")
-	.dt_compat = lpc18xx_43xx_compat,
-MACHINE_END
diff --git a/arch/arm/mach-lpc32xx/Kconfig b/arch/arm/mach-lpc32xx/Kconfig
deleted file mode 100644
index 138599545c24c..0000000000000
--- a/arch/arm/mach-lpc32xx/Kconfig
+++ /dev/null
@@ -1,13 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only
-
-config ARCH_LPC32XX
-	bool "NXP LPC32XX"
-	depends on ARCH_MULTI_V5
-	depends on CPU_LITTLE_ENDIAN
-	select ARM_AMBA
-	select CLKSRC_LPC32XX
-	select CPU_ARM926T
-	select GPIOLIB
-	select LPC32XX_DMAMUX if AMBA_PL08X
-	help
-	  Support for the NXP LPC32XX family of processors
diff --git a/arch/arm/mach-lpc32xx/Makefile b/arch/arm/mach-lpc32xx/Makefile
deleted file mode 100644
index 3bac1d17a207b..0000000000000
--- a/arch/arm/mach-lpc32xx/Makefile
+++ /dev/null
@@ -1,8 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only
-#
-# Makefile for the linux kernel.
-#
-
-obj-y	:= common.o serial.o
-obj-y	+= pm.o suspend.o
-obj-y	+= phy3250.o
diff --git a/arch/arm/mach-lpc32xx/common.c b/arch/arm/mach-lpc32xx/common.c
deleted file mode 100644
index 304ea61a07160..0000000000000
--- a/arch/arm/mach-lpc32xx/common.c
+++ /dev/null
@@ -1,125 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * arch/arm/mach-lpc32xx/common.c
- *
- * Author: Kevin Wells <kevin.wells@nxp.com>
- *
- * Copyright (C) 2010 NXP Semiconductors
- */
-
-#include <linux/init.h>
-#include <linux/soc/nxp/lpc32xx-misc.h>
-
-#include <asm/mach/map.h>
-#include <asm/system_info.h>
-
-#include "lpc32xx.h"
-#include "common.h"
-
-/*
- * Returns the unique ID for the device
- */
-void lpc32xx_get_uid(u32 devid[4])
-{
-	int i;
-
-	for (i = 0; i < 4; i++)
-		devid[i] = __raw_readl(LPC32XX_CLKPWR_DEVID(i << 2));
-}
-
-/*
- * Detects and returns IRAM size for the device variation
- */
-#define LPC32XX_IRAM_BANK_SIZE SZ_128K
-static u32 iram_size;
-u32 lpc32xx_return_iram(void __iomem **mapbase, dma_addr_t *dmaaddr)
-{
-	if (iram_size == 0) {
-		u32 savedval1, savedval2;
-		void __iomem *iramptr1, *iramptr2;
-
-		iramptr1 = io_p2v(LPC32XX_IRAM_BASE);
-		iramptr2 = io_p2v(LPC32XX_IRAM_BASE + LPC32XX_IRAM_BANK_SIZE);
-		savedval1 = __raw_readl(iramptr1);
-		savedval2 = __raw_readl(iramptr2);
-
-		if (savedval1 == savedval2) {
-			__raw_writel(savedval2 + 1, iramptr2);
-			if (__raw_readl(iramptr1) == savedval2 + 1)
-				iram_size = LPC32XX_IRAM_BANK_SIZE;
-			else
-				iram_size = LPC32XX_IRAM_BANK_SIZE * 2;
-			__raw_writel(savedval2, iramptr2);
-		} else
-			iram_size = LPC32XX_IRAM_BANK_SIZE * 2;
-	}
-	if (dmaaddr)
-		*dmaaddr = LPC32XX_IRAM_BASE;
-	if (mapbase)
-		*mapbase = io_p2v(LPC32XX_IRAM_BASE);
-
-	return iram_size;
-}
-EXPORT_SYMBOL_GPL(lpc32xx_return_iram);
-
-void lpc32xx_set_phy_interface_mode(phy_interface_t mode)
-{
-	u32 tmp = __raw_readl(LPC32XX_CLKPWR_MACCLK_CTRL);
-	tmp &= ~LPC32XX_CLKPWR_MACCTRL_PINS_MSK;
-	if (mode == PHY_INTERFACE_MODE_MII)
-		tmp |= LPC32XX_CLKPWR_MACCTRL_USE_MII_PINS;
-	else
-		tmp |= LPC32XX_CLKPWR_MACCTRL_USE_RMII_PINS;
-	__raw_writel(tmp, LPC32XX_CLKPWR_MACCLK_CTRL);
-}
-EXPORT_SYMBOL_GPL(lpc32xx_set_phy_interface_mode);
-
-static struct map_desc lpc32xx_io_desc[] __initdata = {
-	{
-		.virtual	= (unsigned long)IO_ADDRESS(LPC32XX_AHB0_START),
-		.pfn		= __phys_to_pfn(LPC32XX_AHB0_START),
-		.length		= LPC32XX_AHB0_SIZE,
-		.type		= MT_DEVICE
-	},
-	{
-		.virtual	= (unsigned long)IO_ADDRESS(LPC32XX_AHB1_START),
-		.pfn		= __phys_to_pfn(LPC32XX_AHB1_START),
-		.length		= LPC32XX_AHB1_SIZE,
-		.type		= MT_DEVICE
-	},
-	{
-		.virtual	= (unsigned long)IO_ADDRESS(LPC32XX_FABAPB_START),
-		.pfn		= __phys_to_pfn(LPC32XX_FABAPB_START),
-		.length		= LPC32XX_FABAPB_SIZE,
-		.type		= MT_DEVICE
-	},
-	{
-		.virtual	= (unsigned long)IO_ADDRESS(LPC32XX_IRAM_BASE),
-		.pfn		= __phys_to_pfn(LPC32XX_IRAM_BASE),
-		.length		= (LPC32XX_IRAM_BANK_SIZE * 2),
-		.type		= MT_DEVICE
-	},
-};
-
-void __init lpc32xx_map_io(void)
-{
-	iotable_init(lpc32xx_io_desc, ARRAY_SIZE(lpc32xx_io_desc));
-}
-
-static int __init lpc32xx_check_uid(void)
-{
-	u32 uid[4];
-
-	lpc32xx_get_uid(uid);
-
-	printk(KERN_INFO "LPC32XX unique ID: %08x%08x%08x%08x\n",
-		uid[3], uid[2], uid[1], uid[0]);
-
-	if (!system_serial_low && !system_serial_high) {
-		system_serial_low = uid[0];
-		system_serial_high = uid[1];
-	}
-
-	return 1;
-}
-arch_initcall(lpc32xx_check_uid);
diff --git a/arch/arm/mach-lpc32xx/common.h b/arch/arm/mach-lpc32xx/common.h
deleted file mode 100644
index 32f0ad2178077..0000000000000
--- a/arch/arm/mach-lpc32xx/common.h
+++ /dev/null
@@ -1,32 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- * arch/arm/mach-lpc32xx/common.h
- *
- * Author: Kevin Wells <kevin.wells@nxp.com>
- *
- * Copyright (C) 2009-2010 NXP Semiconductors
- */
-
-#ifndef __LPC32XX_COMMON_H
-#define __LPC32XX_COMMON_H
-
-#include <linux/init.h>
-
-/*
- * Other arch specific structures and functions
- */
-extern void __init lpc32xx_map_io(void);
-extern void __init lpc32xx_serial_init(void);
-
-/*
- * Returns the LPC32xx unique 128-bit chip ID
- */
-extern void lpc32xx_get_uid(u32 devid[4]);
-
-/*
- * Pointers used for sizing and copying suspend function data
- */
-extern int lpc32xx_sys_suspend(void);
-extern int lpc32xx_sys_suspend_sz;
-
-#endif
diff --git a/arch/arm/mach-lpc32xx/lpc32xx.h b/arch/arm/mach-lpc32xx/lpc32xx.h
deleted file mode 100644
index 5eeb884a19939..0000000000000
--- a/arch/arm/mach-lpc32xx/lpc32xx.h
+++ /dev/null
@@ -1,717 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- * arch/arm/mach-lpc32xx/include/mach/platform.h
- *
- * Author: Kevin Wells <kevin.wells@nxp.com>
- *
- * Copyright (C) 2010 NXP Semiconductors
- */
-
-#ifndef __ARM_LPC32XX_H
-#define __ARM_LPC32XX_H
-
-#define _SBF(f, v)				((v) << (f))
-#define _BIT(n)					_SBF(n, 1)
-
-/*
- * AHB 0 physical base addresses
- */
-#define LPC32XX_SLC_BASE			0x20020000
-#define LPC32XX_SSP0_BASE			0x20084000
-#define LPC32XX_SPI1_BASE			0x20088000
-#define LPC32XX_SSP1_BASE			0x2008C000
-#define LPC32XX_SPI2_BASE			0x20090000
-#define LPC32XX_I2S0_BASE			0x20094000
-#define LPC32XX_SD_BASE				0x20098000
-#define LPC32XX_I2S1_BASE			0x2009C000
-#define LPC32XX_MLC_BASE			0x200A8000
-#define LPC32XX_AHB0_START			LPC32XX_SLC_BASE
-#define LPC32XX_AHB0_SIZE			0x00089000
-
-/*
- * AHB 1 physical base addresses
- */
-#define LPC32XX_DMA_BASE			0x31000000
-#define LPC32XX_USB_BASE			0x31020000
-#define LPC32XX_USBH_BASE			0x31020000
-#define LPC32XX_USB_OTG_BASE			0x31020000
-#define LPC32XX_OTG_I2C_BASE			0x31020300
-#define LPC32XX_LCD_BASE			0x31040000
-#define LPC32XX_ETHERNET_BASE			0x31060000
-#define LPC32XX_EMC_BASE			0x31080000
-#define LPC32XX_ETB_CFG_BASE			0x310C0000
-#define LPC32XX_ETB_DATA_BASE			0x310E0000
-#define LPC32XX_AHB1_START			LPC32XX_DMA_BASE
-#define LPC32XX_AHB1_SIZE			0x000E1000
-
-/*
- * FAB physical base addresses
- */
-#define LPC32XX_CLK_PM_BASE			0x40004000
-#define LPC32XX_MIC_BASE			0x40008000
-#define LPC32XX_SIC1_BASE			0x4000C000
-#define LPC32XX_SIC2_BASE			0x40010000
-#define LPC32XX_HS_UART1_BASE			0x40014000
-#define LPC32XX_HS_UART2_BASE			0x40018000
-#define LPC32XX_HS_UART7_BASE			0x4001C000
-#define LPC32XX_RTC_BASE			0x40024000
-#define LPC32XX_RTC_RAM_BASE			0x40024080
-#define LPC32XX_GPIO_BASE			0x40028000
-#define LPC32XX_PWM3_BASE			0x4002C000
-#define LPC32XX_PWM4_BASE			0x40030000
-#define LPC32XX_MSTIM_BASE			0x40034000
-#define LPC32XX_HSTIM_BASE			0x40038000
-#define LPC32XX_WDTIM_BASE			0x4003C000
-#define LPC32XX_DEBUG_CTRL_BASE			0x40040000
-#define LPC32XX_TIMER0_BASE			0x40044000
-#define LPC32XX_ADC_BASE			0x40048000
-#define LPC32XX_TIMER1_BASE			0x4004C000
-#define LPC32XX_KSCAN_BASE			0x40050000
-#define LPC32XX_UART_CTRL_BASE			0x40054000
-#define LPC32XX_TIMER2_BASE			0x40058000
-#define LPC32XX_PWM1_BASE			0x4005C000
-#define LPC32XX_PWM2_BASE			0x4005C004
-#define LPC32XX_TIMER3_BASE			0x40060000
-
-/*
- * APB physical base addresses
- */
-#define LPC32XX_UART3_BASE			0x40080000
-#define LPC32XX_UART4_BASE			0x40088000
-#define LPC32XX_UART5_BASE			0x40090000
-#define LPC32XX_UART6_BASE			0x40098000
-#define LPC32XX_I2C1_BASE			0x400A0000
-#define LPC32XX_I2C2_BASE			0x400A8000
-
-/*
- * FAB and APB base and sizing
- */
-#define LPC32XX_FABAPB_START			LPC32XX_CLK_PM_BASE
-#define LPC32XX_FABAPB_SIZE			0x000A5000
-
-/*
- * Internal memory bases and sizes
- */
-#define LPC32XX_IRAM_BASE			0x08000000
-#define LPC32XX_IROM_BASE			0x0C000000
-
-/*
- * External Static Memory Bank Address Space Bases
- */
-#define LPC32XX_EMC_CS0_BASE			0xE0000000
-#define LPC32XX_EMC_CS1_BASE			0xE1000000
-#define LPC32XX_EMC_CS2_BASE			0xE2000000
-#define LPC32XX_EMC_CS3_BASE			0xE3000000
-
-/*
- * External SDRAM Memory Bank Address Space Bases
- */
-#define LPC32XX_EMC_DYCS0_BASE			0x80000000
-#define LPC32XX_EMC_DYCS1_BASE			0xA0000000
-
-/*
- * Clock and crystal information
- */
-#define LPC32XX_MAIN_OSC_FREQ			13000000
-#define LPC32XX_CLOCK_OSC_FREQ			32768
-
-/*
- * Clock and Power control register offsets
- */
-#define _PMREG(x)				io_p2v(LPC32XX_CLK_PM_BASE +\
-						(x))
-#define LPC32XX_CLKPWR_DEBUG_CTRL		_PMREG(0x000)
-#define LPC32XX_CLKPWR_BOOTMAP			_PMREG(0x014)
-#define LPC32XX_CLKPWR_P01_ER			_PMREG(0x018)
-#define LPC32XX_CLKPWR_USBCLK_PDIV		_PMREG(0x01C)
-#define LPC32XX_CLKPWR_INT_ER			_PMREG(0x020)
-#define LPC32XX_CLKPWR_INT_RS			_PMREG(0x024)
-#define LPC32XX_CLKPWR_INT_SR			_PMREG(0x028)
-#define LPC32XX_CLKPWR_INT_AP			_PMREG(0x02C)
-#define LPC32XX_CLKPWR_PIN_ER			_PMREG(0x030)
-#define LPC32XX_CLKPWR_PIN_RS			_PMREG(0x034)
-#define LPC32XX_CLKPWR_PIN_SR			_PMREG(0x038)
-#define LPC32XX_CLKPWR_PIN_AP			_PMREG(0x03C)
-#define LPC32XX_CLKPWR_HCLK_DIV			_PMREG(0x040)
-#define LPC32XX_CLKPWR_PWR_CTRL			_PMREG(0x044)
-#define LPC32XX_CLKPWR_PLL397_CTRL		_PMREG(0x048)
-#define LPC32XX_CLKPWR_MAIN_OSC_CTRL		_PMREG(0x04C)
-#define LPC32XX_CLKPWR_SYSCLK_CTRL		_PMREG(0x050)
-#define LPC32XX_CLKPWR_LCDCLK_CTRL		_PMREG(0x054)
-#define LPC32XX_CLKPWR_HCLKPLL_CTRL		_PMREG(0x058)
-#define LPC32XX_CLKPWR_ADC_CLK_CTRL_1		_PMREG(0x060)
-#define LPC32XX_CLKPWR_USB_CTRL			_PMREG(0x064)
-#define LPC32XX_CLKPWR_SDRAMCLK_CTRL		_PMREG(0x068)
-#define LPC32XX_CLKPWR_DDR_LAP_NOM		_PMREG(0x06C)
-#define LPC32XX_CLKPWR_DDR_LAP_COUNT		_PMREG(0x070)
-#define LPC32XX_CLKPWR_DDR_LAP_DELAY		_PMREG(0x074)
-#define LPC32XX_CLKPWR_SSP_CLK_CTRL		_PMREG(0x078)
-#define LPC32XX_CLKPWR_I2S_CLK_CTRL		_PMREG(0x07C)
-#define LPC32XX_CLKPWR_MS_CTRL			_PMREG(0x080)
-#define LPC32XX_CLKPWR_MACCLK_CTRL		_PMREG(0x090)
-#define LPC32XX_CLKPWR_TEST_CLK_SEL		_PMREG(0x0A4)
-#define LPC32XX_CLKPWR_SFW_INT			_PMREG(0x0A8)
-#define LPC32XX_CLKPWR_I2C_CLK_CTRL		_PMREG(0x0AC)
-#define LPC32XX_CLKPWR_KEY_CLK_CTRL		_PMREG(0x0B0)
-#define LPC32XX_CLKPWR_ADC_CLK_CTRL		_PMREG(0x0B4)
-#define LPC32XX_CLKPWR_PWM_CLK_CTRL		_PMREG(0x0B8)
-#define LPC32XX_CLKPWR_TIMER_CLK_CTRL		_PMREG(0x0BC)
-#define LPC32XX_CLKPWR_TIMERS_PWMS_CLK_CTRL_1	_PMREG(0x0C0)
-#define LPC32XX_CLKPWR_SPI_CLK_CTRL		_PMREG(0x0C4)
-#define LPC32XX_CLKPWR_NAND_CLK_CTRL		_PMREG(0x0C8)
-#define LPC32XX_CLKPWR_UART3_CLK_CTRL		_PMREG(0x0D0)
-#define LPC32XX_CLKPWR_UART4_CLK_CTRL		_PMREG(0x0D4)
-#define LPC32XX_CLKPWR_UART5_CLK_CTRL		_PMREG(0x0D8)
-#define LPC32XX_CLKPWR_UART6_CLK_CTRL		_PMREG(0x0DC)
-#define LPC32XX_CLKPWR_IRDA_CLK_CTRL		_PMREG(0x0E0)
-#define LPC32XX_CLKPWR_UART_CLK_CTRL		_PMREG(0x0E4)
-#define LPC32XX_CLKPWR_DMA_CLK_CTRL		_PMREG(0x0E8)
-#define LPC32XX_CLKPWR_AUTOCLOCK		_PMREG(0x0EC)
-#define LPC32XX_CLKPWR_DEVID(x)			_PMREG(0x130 + (x))
-
-/*
- * clkpwr_debug_ctrl register definitions
-*/
-#define LPC32XX_CLKPWR_VFP_CLOCK_ENABLE_BIT	_BIT(4)
-
-/*
- * clkpwr_bootmap register definitions
- */
-#define LPC32XX_CLKPWR_BOOTMAP_SEL_BIT		_BIT(1)
-
-/*
- * clkpwr_start_gpio register bit definitions
- */
-#define LPC32XX_CLKPWR_GPIOSRC_P1IO23_BIT	_BIT(31)
-#define LPC32XX_CLKPWR_GPIOSRC_P1IO22_BIT	_BIT(30)
-#define LPC32XX_CLKPWR_GPIOSRC_P1IO21_BIT	_BIT(29)
-#define LPC32XX_CLKPWR_GPIOSRC_P1IO20_BIT	_BIT(28)
-#define LPC32XX_CLKPWR_GPIOSRC_P1IO19_BIT	_BIT(27)
-#define LPC32XX_CLKPWR_GPIOSRC_P1IO18_BIT	_BIT(26)
-#define LPC32XX_CLKPWR_GPIOSRC_P1IO17_BIT	_BIT(25)
-#define LPC32XX_CLKPWR_GPIOSRC_P1IO16_BIT	_BIT(24)
-#define LPC32XX_CLKPWR_GPIOSRC_P1IO15_BIT	_BIT(23)
-#define LPC32XX_CLKPWR_GPIOSRC_P1IO14_BIT	_BIT(22)
-#define LPC32XX_CLKPWR_GPIOSRC_P1IO13_BIT	_BIT(21)
-#define LPC32XX_CLKPWR_GPIOSRC_P1IO12_BIT	_BIT(20)
-#define LPC32XX_CLKPWR_GPIOSRC_P1IO11_BIT	_BIT(19)
-#define LPC32XX_CLKPWR_GPIOSRC_P1IO10_BIT	_BIT(18)
-#define LPC32XX_CLKPWR_GPIOSRC_P1IO9_BIT	_BIT(17)
-#define LPC32XX_CLKPWR_GPIOSRC_P1IO8_BIT	_BIT(16)
-#define LPC32XX_CLKPWR_GPIOSRC_P1IO7_BIT	_BIT(15)
-#define LPC32XX_CLKPWR_GPIOSRC_P1IO6_BIT	_BIT(14)
-#define LPC32XX_CLKPWR_GPIOSRC_P1IO5_BIT	_BIT(13)
-#define LPC32XX_CLKPWR_GPIOSRC_P1IO4_BIT	_BIT(12)
-#define LPC32XX_CLKPWR_GPIOSRC_P1IO3_BIT	_BIT(11)
-#define LPC32XX_CLKPWR_GPIOSRC_P1IO2_BIT	_BIT(10)
-#define LPC32XX_CLKPWR_GPIOSRC_P1IO1_BIT	_BIT(9)
-#define LPC32XX_CLKPWR_GPIOSRC_P1IO0_BIT	_BIT(8)
-#define LPC32XX_CLKPWR_GPIOSRC_P0IO7_BIT	_BIT(7)
-#define LPC32XX_CLKPWR_GPIOSRC_P0IO6_BIT	_BIT(6)
-#define LPC32XX_CLKPWR_GPIOSRC_P0IO5_BIT	_BIT(5)
-#define LPC32XX_CLKPWR_GPIOSRC_P0IO4_BIT	_BIT(4)
-#define LPC32XX_CLKPWR_GPIOSRC_P0IO3_BIT	_BIT(3)
-#define LPC32XX_CLKPWR_GPIOSRC_P0IO2_BIT	_BIT(2)
-#define LPC32XX_CLKPWR_GPIOSRC_P0IO1_BIT	_BIT(1)
-#define LPC32XX_CLKPWR_GPIOSRC_P0IO0_BIT	_BIT(0)
-
-/*
- * clkpwr_usbclk_pdiv register definitions
- */
-#define LPC32XX_CLKPWR_USBPDIV_PLL_MASK		0xF
-
-/*
- * clkpwr_start_int, clkpwr_start_raw_sts_int, clkpwr_start_sts_int,
- * clkpwr_start_pol_int, register bit definitions
- */
-#define LPC32XX_CLKPWR_INTSRC_ADC_BIT		_BIT(31)
-#define LPC32XX_CLKPWR_INTSRC_TS_P_BIT		_BIT(30)
-#define LPC32XX_CLKPWR_INTSRC_TS_AUX_BIT	_BIT(29)
-#define LPC32XX_CLKPWR_INTSRC_USBAHNEEDCLK_BIT	_BIT(26)
-#define LPC32XX_CLKPWR_INTSRC_MSTIMER_BIT	_BIT(25)
-#define LPC32XX_CLKPWR_INTSRC_RTC_BIT		_BIT(24)
-#define LPC32XX_CLKPWR_INTSRC_USBNEEDCLK_BIT	_BIT(23)
-#define LPC32XX_CLKPWR_INTSRC_USB_BIT		_BIT(22)
-#define LPC32XX_CLKPWR_INTSRC_I2C_BIT		_BIT(21)
-#define LPC32XX_CLKPWR_INTSRC_USBOTGTIMER_BIT	_BIT(20)
-#define LPC32XX_CLKPWR_INTSRC_USBATXINT_BIT	_BIT(19)
-#define LPC32XX_CLKPWR_INTSRC_KEY_BIT		_BIT(16)
-#define LPC32XX_CLKPWR_INTSRC_MAC_BIT		_BIT(7)
-#define LPC32XX_CLKPWR_INTSRC_P0P1_BIT		_BIT(6)
-#define LPC32XX_CLKPWR_INTSRC_GPIO_05_BIT	_BIT(5)
-#define LPC32XX_CLKPWR_INTSRC_GPIO_04_BIT	_BIT(4)
-#define LPC32XX_CLKPWR_INTSRC_GPIO_03_BIT	_BIT(3)
-#define LPC32XX_CLKPWR_INTSRC_GPIO_02_BIT	_BIT(2)
-#define LPC32XX_CLKPWR_INTSRC_GPIO_01_BIT	_BIT(1)
-#define LPC32XX_CLKPWR_INTSRC_GPIO_00_BIT	_BIT(0)
-
-/*
- * clkpwr_start_pin, clkpwr_start_raw_sts_pin, clkpwr_start_sts_pin,
- * clkpwr_start_pol_pin register bit definitions
- */
-#define LPC32XX_CLKPWR_EXTSRC_U7_RX_BIT		_BIT(31)
-#define LPC32XX_CLKPWR_EXTSRC_U7_HCTS_BIT	_BIT(30)
-#define LPC32XX_CLKPWR_EXTSRC_U6_IRRX_BIT	_BIT(28)
-#define LPC32XX_CLKPWR_EXTSRC_U5_RX_BIT		_BIT(26)
-#define LPC32XX_CLKPWR_EXTSRC_GPI_28_BIT	_BIT(25)
-#define LPC32XX_CLKPWR_EXTSRC_U3_RX_BIT		_BIT(24)
-#define LPC32XX_CLKPWR_EXTSRC_U2_HCTS_BIT	_BIT(23)
-#define LPC32XX_CLKPWR_EXTSRC_U2_RX_BIT		_BIT(22)
-#define LPC32XX_CLKPWR_EXTSRC_U1_RX_BIT		_BIT(21)
-#define LPC32XX_CLKPWR_EXTSRC_MSDIO_INT_BIT	_BIT(18)
-#define LPC32XX_CLKPWR_EXTSRC_MSDIO_SRT_BIT	_BIT(17)
-#define LPC32XX_CLKPWR_EXTSRC_GPI_06_BIT	_BIT(16)
-#define LPC32XX_CLKPWR_EXTSRC_GPI_05_BIT	_BIT(15)
-#define LPC32XX_CLKPWR_EXTSRC_GPI_04_BIT	_BIT(14)
-#define LPC32XX_CLKPWR_EXTSRC_GPI_03_BIT	_BIT(13)
-#define LPC32XX_CLKPWR_EXTSRC_GPI_02_BIT	_BIT(12)
-#define LPC32XX_CLKPWR_EXTSRC_GPI_01_BIT	_BIT(11)
-#define LPC32XX_CLKPWR_EXTSRC_GPI_00_BIT	_BIT(10)
-#define LPC32XX_CLKPWR_EXTSRC_SYSCLKEN_BIT	_BIT(9)
-#define LPC32XX_CLKPWR_EXTSRC_SPI1_DATIN_BIT	_BIT(8)
-#define LPC32XX_CLKPWR_EXTSRC_GPI_07_BIT	_BIT(7)
-#define LPC32XX_CLKPWR_EXTSRC_SPI2_DATIN_BIT	_BIT(6)
-#define LPC32XX_CLKPWR_EXTSRC_GPI_19_BIT	_BIT(5)
-#define LPC32XX_CLKPWR_EXTSRC_GPI_09_BIT	_BIT(4)
-#define LPC32XX_CLKPWR_EXTSRC_GPI_08_BIT	_BIT(3)
-
-/*
- * clkpwr_hclk_div register definitions
- */
-#define LPC32XX_CLKPWR_HCLKDIV_DDRCLK_STOP	(0x0 << 7)
-#define LPC32XX_CLKPWR_HCLKDIV_DDRCLK_NORM	(0x1 << 7)
-#define LPC32XX_CLKPWR_HCLKDIV_DDRCLK_HALF	(0x2 << 7)
-#define LPC32XX_CLKPWR_HCLKDIV_PCLK_DIV(n)	(((n) & 0x1F) << 2)
-#define LPC32XX_CLKPWR_HCLKDIV_DIV_2POW(n)	((n) & 0x3)
-
-/*
- * clkpwr_pwr_ctrl register definitions
- */
-#define LPC32XX_CLKPWR_CTRL_FORCE_PCLK		_BIT(10)
-#define LPC32XX_CLKPWR_SDRAM_SELF_RFSH		_BIT(9)
-#define LPC32XX_CLKPWR_UPD_SDRAM_SELF_RFSH	_BIT(8)
-#define LPC32XX_CLKPWR_AUTO_SDRAM_SELF_RFSH	_BIT(7)
-#define LPC32XX_CLKPWR_HIGHCORE_STATE_BIT	_BIT(5)
-#define LPC32XX_CLKPWR_SYSCLKEN_STATE_BIT	_BIT(4)
-#define LPC32XX_CLKPWR_SYSCLKEN_GPIO_EN		_BIT(3)
-#define LPC32XX_CLKPWR_SELECT_RUN_MODE		_BIT(2)
-#define LPC32XX_CLKPWR_HIGHCORE_GPIO_EN		_BIT(1)
-#define LPC32XX_CLKPWR_STOP_MODE_CTRL		_BIT(0)
-
-/*
- * clkpwr_pll397_ctrl register definitions
- */
-#define LPC32XX_CLKPWR_PLL397_MSLOCK_STS	_BIT(10)
-#define LPC32XX_CLKPWR_PLL397_BYPASS		_BIT(9)
-#define LPC32XX_CLKPWR_PLL397_BIAS_NORM		0x000
-#define LPC32XX_CLKPWR_PLL397_BIAS_N12_5	0x040
-#define LPC32XX_CLKPWR_PLL397_BIAS_N25		0x080
-#define LPC32XX_CLKPWR_PLL397_BIAS_N37_5	0x0C0
-#define LPC32XX_CLKPWR_PLL397_BIAS_P12_5	0x100
-#define LPC32XX_CLKPWR_PLL397_BIAS_P25		0x140
-#define LPC32XX_CLKPWR_PLL397_BIAS_P37_5	0x180
-#define LPC32XX_CLKPWR_PLL397_BIAS_P50		0x1C0
-#define LPC32XX_CLKPWR_PLL397_BIAS_MASK		0x1C0
-#define LPC32XX_CLKPWR_SYSCTRL_PLL397_DIS	_BIT(1)
-#define LPC32XX_CLKPWR_SYSCTRL_PLL397_STS	_BIT(0)
-
-/*
- * clkpwr_main_osc_ctrl register definitions
- */
-#define LPC32XX_CLKPWR_MOSC_ADD_CAP(n)		(((n) & 0x7F) << 2)
-#define LPC32XX_CLKPWR_MOSC_CAP_MASK		(0x7F << 2)
-#define LPC32XX_CLKPWR_TEST_MODE		_BIT(1)
-#define LPC32XX_CLKPWR_MOSC_DISABLE		_BIT(0)
-
-/*
- * clkpwr_sysclk_ctrl register definitions
- */
-#define LPC32XX_CLKPWR_SYSCTRL_BP_TRIG(n)	(((n) & 0x3FF) << 2)
-#define LPC32XX_CLKPWR_SYSCTRL_BP_MASK		(0x3FF << 2)
-#define LPC32XX_CLKPWR_SYSCTRL_USEPLL397	_BIT(1)
-#define LPC32XX_CLKPWR_SYSCTRL_SYSCLKMUX	_BIT(0)
-
-/*
- * clkpwr_lcdclk_ctrl register definitions
- */
-#define LPC32XX_CLKPWR_LCDCTRL_LCDTYPE_TFT12	0x000
-#define LPC32XX_CLKPWR_LCDCTRL_LCDTYPE_TFT16	0x040
-#define LPC32XX_CLKPWR_LCDCTRL_LCDTYPE_TFT15	0x080
-#define LPC32XX_CLKPWR_LCDCTRL_LCDTYPE_TFT24	0x0C0
-#define LPC32XX_CLKPWR_LCDCTRL_LCDTYPE_STN4M	0x100
-#define LPC32XX_CLKPWR_LCDCTRL_LCDTYPE_STN8C	0x140
-#define LPC32XX_CLKPWR_LCDCTRL_LCDTYPE_DSTN4M	0x180
-#define LPC32XX_CLKPWR_LCDCTRL_LCDTYPE_DSTN8C	0x1C0
-#define LPC32XX_CLKPWR_LCDCTRL_LCDTYPE_MSK	0x01C0
-#define LPC32XX_CLKPWR_LCDCTRL_CLK_EN		0x020
-#define LPC32XX_CLKPWR_LCDCTRL_SET_PSCALE(n)	((n - 1) & 0x1F)
-#define LPC32XX_CLKPWR_LCDCTRL_PSCALE_MSK	0x001F
-
-/*
- * clkpwr_hclkpll_ctrl register definitions
- */
-#define LPC32XX_CLKPWR_HCLKPLL_POWER_UP		_BIT(16)
-#define LPC32XX_CLKPWR_HCLKPLL_CCO_BYPASS	_BIT(15)
-#define LPC32XX_CLKPWR_HCLKPLL_POSTDIV_BYPASS	_BIT(14)
-#define LPC32XX_CLKPWR_HCLKPLL_FDBK_SEL_FCLK	_BIT(13)
-#define LPC32XX_CLKPWR_HCLKPLL_POSTDIV_2POW(n)	(((n) & 0x3) << 11)
-#define LPC32XX_CLKPWR_HCLKPLL_PREDIV_PLUS1(n)	(((n) & 0x3) << 9)
-#define LPC32XX_CLKPWR_HCLKPLL_PLLM(n)		(((n) & 0xFF) << 1)
-#define LPC32XX_CLKPWR_HCLKPLL_PLL_STS		_BIT(0)
-
-/*
- * clkpwr_adc_clk_ctrl_1 register definitions
- */
-#define LPC32XX_CLKPWR_ADCCTRL1_RTDIV(n)	(((n) & 0xFF) << 0)
-#define LPC32XX_CLKPWR_ADCCTRL1_PCLK_SEL	_BIT(8)
-
-/*
- * clkpwr_usb_ctrl register definitions
- */
-#define LPC32XX_CLKPWR_USBCTRL_HCLK_EN		_BIT(24)
-#define LPC32XX_CLKPWR_USBCTRL_USBI2C_EN	_BIT(23)
-#define LPC32XX_CLKPWR_USBCTRL_USBDVND_EN	_BIT(22)
-#define LPC32XX_CLKPWR_USBCTRL_USBHSTND_EN	_BIT(21)
-#define LPC32XX_CLKPWR_USBCTRL_PU_ADD		(0x0 << 19)
-#define LPC32XX_CLKPWR_USBCTRL_BUS_KEEPER	(0x1 << 19)
-#define LPC32XX_CLKPWR_USBCTRL_PD_ADD		(0x3 << 19)
-#define LPC32XX_CLKPWR_USBCTRL_CLK_EN2		_BIT(18)
-#define LPC32XX_CLKPWR_USBCTRL_CLK_EN1		_BIT(17)
-#define LPC32XX_CLKPWR_USBCTRL_PLL_PWRUP	_BIT(16)
-#define LPC32XX_CLKPWR_USBCTRL_CCO_BYPASS	_BIT(15)
-#define LPC32XX_CLKPWR_USBCTRL_POSTDIV_BYPASS	_BIT(14)
-#define LPC32XX_CLKPWR_USBCTRL_FDBK_SEL_FCLK	_BIT(13)
-#define LPC32XX_CLKPWR_USBCTRL_POSTDIV_2POW(n)	(((n) & 0x3) << 11)
-#define LPC32XX_CLKPWR_USBCTRL_PREDIV_PLUS1(n)	(((n) & 0x3) << 9)
-#define LPC32XX_CLKPWR_USBCTRL_FDBK_PLUS1(n)	(((n) & 0xFF) << 1)
-#define LPC32XX_CLKPWR_USBCTRL_PLL_STS		_BIT(0)
-
-/*
- * clkpwr_sdramclk_ctrl register definitions
- */
-#define LPC32XX_CLKPWR_SDRCLK_FASTSLEW_CLK	_BIT(22)
-#define LPC32XX_CLKPWR_SDRCLK_FASTSLEW		_BIT(21)
-#define LPC32XX_CLKPWR_SDRCLK_FASTSLEW_DAT	_BIT(20)
-#define LPC32XX_CLKPWR_SDRCLK_SW_DDR_RESET	_BIT(19)
-#define LPC32XX_CLKPWR_SDRCLK_HCLK_DLY(n)	(((n) & 0x1F) << 14)
-#define LPC32XX_CLKPWR_SDRCLK_DLY_ADDR_STS	_BIT(13)
-#define LPC32XX_CLKPWR_SDRCLK_SENS_FACT(n)	(((n) & 0x7) << 10)
-#define LPC32XX_CLKPWR_SDRCLK_USE_CAL		_BIT(9)
-#define LPC32XX_CLKPWR_SDRCLK_DO_CAL		_BIT(8)
-#define LPC32XX_CLKPWR_SDRCLK_CAL_ON_RTC	_BIT(7)
-#define LPC32XX_CLKPWR_SDRCLK_DQS_DLY(n)	(((n) & 0x1F) << 2)
-#define LPC32XX_CLKPWR_SDRCLK_USE_DDR		_BIT(1)
-#define LPC32XX_CLKPWR_SDRCLK_CLK_DIS		_BIT(0)
-
-/*
- * clkpwr_ssp_blk_ctrl register definitions
- */
-#define LPC32XX_CLKPWR_SSPCTRL_DMA_SSP1RX	_BIT(5)
-#define LPC32XX_CLKPWR_SSPCTRL_DMA_SSP1TX	_BIT(4)
-#define LPC32XX_CLKPWR_SSPCTRL_DMA_SSP0RX	_BIT(3)
-#define LPC32XX_CLKPWR_SSPCTRL_DMA_SSP0TX	_BIT(2)
-#define LPC32XX_CLKPWR_SSPCTRL_SSPCLK1_EN	_BIT(1)
-#define LPC32XX_CLKPWR_SSPCTRL_SSPCLK0_EN	_BIT(0)
-
-/*
- * clkpwr_i2s_clk_ctrl register definitions
- */
-#define LPC32XX_CLKPWR_I2SCTRL_I2S1_RX_FOR_TX	_BIT(6)
-#define LPC32XX_CLKPWR_I2SCTRL_I2S1_TX_FOR_RX	_BIT(5)
-#define LPC32XX_CLKPWR_I2SCTRL_I2S1_USE_DMA	_BIT(4)
-#define LPC32XX_CLKPWR_I2SCTRL_I2S0_RX_FOR_TX	_BIT(3)
-#define LPC32XX_CLKPWR_I2SCTRL_I2S0_TX_FOR_RX	_BIT(2)
-#define LPC32XX_CLKPWR_I2SCTRL_I2SCLK1_EN	_BIT(1)
-#define LPC32XX_CLKPWR_I2SCTRL_I2SCLK0_EN	_BIT(0)
-
-/*
- * clkpwr_ms_ctrl register definitions
- */
-#define LPC32XX_CLKPWR_MSCARD_MSDIO_PIN_DIS	_BIT(10)
-#define LPC32XX_CLKPWR_MSCARD_MSDIO_PU_EN	_BIT(9)
-#define LPC32XX_CLKPWR_MSCARD_MSDIO23_DIS	_BIT(8)
-#define LPC32XX_CLKPWR_MSCARD_MSDIO1_DIS	_BIT(7)
-#define LPC32XX_CLKPWR_MSCARD_MSDIO0_DIS	_BIT(6)
-#define LPC32XX_CLKPWR_MSCARD_SDCARD_EN		_BIT(5)
-#define LPC32XX_CLKPWR_MSCARD_SDCARD_DIV(n)	((n) & 0xF)
-
-/*
- * clkpwr_macclk_ctrl register definitions
- */
-#define LPC32XX_CLKPWR_MACCTRL_NO_ENET_PIS	0x00
-#define LPC32XX_CLKPWR_MACCTRL_USE_MII_PINS	0x08
-#define LPC32XX_CLKPWR_MACCTRL_USE_RMII_PINS	0x18
-#define LPC32XX_CLKPWR_MACCTRL_PINS_MSK		0x18
-#define LPC32XX_CLKPWR_MACCTRL_DMACLK_EN	_BIT(2)
-#define LPC32XX_CLKPWR_MACCTRL_MMIOCLK_EN	_BIT(1)
-#define LPC32XX_CLKPWR_MACCTRL_HRCCLK_EN	_BIT(0)
-
-/*
- * clkpwr_test_clk_sel register definitions
- */
-#define LPC32XX_CLKPWR_TESTCLK1_SEL_PERCLK	(0x0 << 5)
-#define LPC32XX_CLKPWR_TESTCLK1_SEL_RTC		(0x1 << 5)
-#define LPC32XX_CLKPWR_TESTCLK1_SEL_MOSC	(0x2 << 5)
-#define LPC32XX_CLKPWR_TESTCLK1_SEL_MASK	(0x3 << 5)
-#define LPC32XX_CLKPWR_TESTCLK_TESTCLK1_EN	_BIT(4)
-#define LPC32XX_CLKPWR_TESTCLK2_SEL_HCLK	(0x0 << 1)
-#define LPC32XX_CLKPWR_TESTCLK2_SEL_PERCLK	(0x1 << 1)
-#define LPC32XX_CLKPWR_TESTCLK2_SEL_USBCLK	(0x2 << 1)
-#define LPC32XX_CLKPWR_TESTCLK2_SEL_MOSC	(0x5 << 1)
-#define LPC32XX_CLKPWR_TESTCLK2_SEL_PLL397	(0x7 << 1)
-#define LPC32XX_CLKPWR_TESTCLK2_SEL_MASK	(0x7 << 1)
-#define LPC32XX_CLKPWR_TESTCLK_TESTCLK2_EN	_BIT(0)
-
-/*
- * clkpwr_sw_int register definitions
- */
-#define LPC32XX_CLKPWR_SW_INT(n)		(_BIT(0) | (((n) & 0x7F) << 1))
-#define LPC32XX_CLKPWR_SW_GET_ARG(n)		(((n) & 0xFE) >> 1)
-
-/*
- * clkpwr_i2c_clk_ctrl register definitions
- */
-#define LPC32XX_CLKPWR_I2CCLK_USBI2CHI_DRIVE	_BIT(4)
-#define LPC32XX_CLKPWR_I2CCLK_I2C2HI_DRIVE	_BIT(3)
-#define LPC32XX_CLKPWR_I2CCLK_I2C1HI_DRIVE	_BIT(2)
-#define LPC32XX_CLKPWR_I2CCLK_I2C2CLK_EN	_BIT(1)
-#define LPC32XX_CLKPWR_I2CCLK_I2C1CLK_EN	_BIT(0)
-
-/*
- * clkpwr_key_clk_ctrl register definitions
- */
-#define LPC32XX_CLKPWR_KEYCLKCTRL_CLK_EN	0x1
-
-/*
- * clkpwr_adc_clk_ctrl register definitions
- */
-#define LPC32XX_CLKPWR_ADC32CLKCTRL_CLK_EN	0x1
-
-/*
- * clkpwr_pwm_clk_ctrl register definitions
- */
-#define LPC32XX_CLKPWR_PWMCLK_PWM2_DIV(n)	(((n) & 0xF) << 8)
-#define LPC32XX_CLKPWR_PWMCLK_PWM1_DIV(n)	(((n) & 0xF) << 4)
-#define LPC32XX_CLKPWR_PWMCLK_PWM2SEL_PCLK	0x8
-#define LPC32XX_CLKPWR_PWMCLK_PWM2CLK_EN	0x4
-#define LPC32XX_CLKPWR_PWMCLK_PWM1SEL_PCLK	0x2
-#define LPC32XX_CLKPWR_PWMCLK_PWM1CLK_EN	0x1
-
-/*
- * clkpwr_timer_clk_ctrl register definitions
- */
-#define LPC32XX_CLKPWR_PWMCLK_HSTIMER_EN	0x2
-#define LPC32XX_CLKPWR_PWMCLK_WDOG_EN		0x1
-
-/*
- * clkpwr_timers_pwms_clk_ctrl_1 register definitions
- */
-#define LPC32XX_CLKPWR_TMRPWMCLK_MPWM_EN	0x40
-#define LPC32XX_CLKPWR_TMRPWMCLK_TIMER3_EN	0x20
-#define LPC32XX_CLKPWR_TMRPWMCLK_TIMER2_EN	0x10
-#define LPC32XX_CLKPWR_TMRPWMCLK_TIMER1_EN	0x08
-#define LPC32XX_CLKPWR_TMRPWMCLK_TIMER0_EN	0x04
-#define LPC32XX_CLKPWR_TMRPWMCLK_PWM4_EN	0x02
-#define LPC32XX_CLKPWR_TMRPWMCLK_PWM3_EN	0x01
-
-/*
- * clkpwr_spi_clk_ctrl register definitions
- */
-#define LPC32XX_CLKPWR_SPICLK_SET_SPI2DATIO	0x80
-#define LPC32XX_CLKPWR_SPICLK_SET_SPI2CLK	0x40
-#define LPC32XX_CLKPWR_SPICLK_USE_SPI2		0x20
-#define LPC32XX_CLKPWR_SPICLK_SPI2CLK_EN	0x10
-#define LPC32XX_CLKPWR_SPICLK_SET_SPI1DATIO	0x08
-#define LPC32XX_CLKPWR_SPICLK_SET_SPI1CLK	0x04
-#define LPC32XX_CLKPWR_SPICLK_USE_SPI1		0x02
-#define LPC32XX_CLKPWR_SPICLK_SPI1CLK_EN	0x01
-
-/*
- * clkpwr_nand_clk_ctrl register definitions
- */
-#define LPC32XX_CLKPWR_NANDCLK_INTSEL_MLC	0x20
-#define LPC32XX_CLKPWR_NANDCLK_DMA_RNB		0x10
-#define LPC32XX_CLKPWR_NANDCLK_DMA_INT		0x08
-#define LPC32XX_CLKPWR_NANDCLK_SEL_SLC		0x04
-#define LPC32XX_CLKPWR_NANDCLK_MLCCLK_EN	0x02
-#define LPC32XX_CLKPWR_NANDCLK_SLCCLK_EN	0x01
-
-/*
- * clkpwr_uart3_clk_ctrl, clkpwr_uart4_clk_ctrl, clkpwr_uart5_clk_ctrl
- * and clkpwr_uart6_clk_ctrl register definitions
- */
-#define LPC32XX_CLKPWR_UART_Y_DIV(y)		((y) & 0xFF)
-#define LPC32XX_CLKPWR_UART_X_DIV(x)		(((x) & 0xFF) << 8)
-#define LPC32XX_CLKPWR_UART_USE_HCLK		_BIT(16)
-
-/*
- * clkpwr_irda_clk_ctrl register definitions
- */
-#define LPC32XX_CLKPWR_IRDA_Y_DIV(y)		((y) & 0xFF)
-#define LPC32XX_CLKPWR_IRDA_X_DIV(x)		(((x) & 0xFF) << 8)
-
-/*
- * clkpwr_uart_clk_ctrl register definitions
- */
-#define LPC32XX_CLKPWR_UARTCLKCTRL_UART6_EN	_BIT(3)
-#define LPC32XX_CLKPWR_UARTCLKCTRL_UART5_EN	_BIT(2)
-#define LPC32XX_CLKPWR_UARTCLKCTRL_UART4_EN	_BIT(1)
-#define LPC32XX_CLKPWR_UARTCLKCTRL_UART3_EN	_BIT(0)
-
-/*
- * clkpwr_dmaclk_ctrl register definitions
- */
-#define LPC32XX_CLKPWR_DMACLKCTRL_CLK_EN	0x1
-
-/*
- * clkpwr_autoclock register definitions
- */
-#define LPC32XX_CLKPWR_AUTOCLK_USB_EN		0x40
-#define LPC32XX_CLKPWR_AUTOCLK_IRAM_EN		0x02
-#define LPC32XX_CLKPWR_AUTOCLK_IROM_EN		0x01
-
-/*
- * Interrupt controller register offsets
- */
-#define LPC32XX_INTC_MASK(x)			io_p2v((x) + 0x00)
-#define LPC32XX_INTC_RAW_STAT(x)		io_p2v((x) + 0x04)
-#define LPC32XX_INTC_STAT(x)			io_p2v((x) + 0x08)
-#define LPC32XX_INTC_POLAR(x)			io_p2v((x) + 0x0C)
-#define LPC32XX_INTC_ACT_TYPE(x)		io_p2v((x) + 0x10)
-#define LPC32XX_INTC_TYPE(x)			io_p2v((x) + 0x14)
-
-/*
- * Timer/counter register offsets
- */
-#define LPC32XX_TIMER_IR(x)			io_p2v((x) + 0x00)
-#define LPC32XX_TIMER_TCR(x)			io_p2v((x) + 0x04)
-#define LPC32XX_TIMER_TC(x)			io_p2v((x) + 0x08)
-#define LPC32XX_TIMER_PR(x)			io_p2v((x) + 0x0C)
-#define LPC32XX_TIMER_PC(x)			io_p2v((x) + 0x10)
-#define LPC32XX_TIMER_MCR(x)			io_p2v((x) + 0x14)
-#define LPC32XX_TIMER_MR0(x)			io_p2v((x) + 0x18)
-#define LPC32XX_TIMER_MR1(x)			io_p2v((x) + 0x1C)
-#define LPC32XX_TIMER_MR2(x)			io_p2v((x) + 0x20)
-#define LPC32XX_TIMER_MR3(x)			io_p2v((x) + 0x24)
-#define LPC32XX_TIMER_CCR(x)			io_p2v((x) + 0x28)
-#define LPC32XX_TIMER_CR0(x)			io_p2v((x) + 0x2C)
-#define LPC32XX_TIMER_CR1(x)			io_p2v((x) + 0x30)
-#define LPC32XX_TIMER_CR2(x)			io_p2v((x) + 0x34)
-#define LPC32XX_TIMER_CR3(x)			io_p2v((x) + 0x38)
-#define LPC32XX_TIMER_EMR(x)			io_p2v((x) + 0x3C)
-#define LPC32XX_TIMER_CTCR(x)			io_p2v((x) + 0x70)
-
-/*
- * ir register definitions
- */
-#define LPC32XX_TIMER_CNTR_MTCH_BIT(n)		(1 << ((n) & 0x3))
-#define LPC32XX_TIMER_CNTR_CAPT_BIT(n)		(1 << (4 + ((n) & 0x3)))
-
-/*
- * tcr register definitions
- */
-#define LPC32XX_TIMER_CNTR_TCR_EN		0x1
-#define LPC32XX_TIMER_CNTR_TCR_RESET		0x2
-
-/*
- * mcr register definitions
- */
-#define LPC32XX_TIMER_CNTR_MCR_MTCH(n)		(0x1 << ((n) * 3))
-#define LPC32XX_TIMER_CNTR_MCR_RESET(n)		(0x1 << (((n) * 3) + 1))
-#define LPC32XX_TIMER_CNTR_MCR_STOP(n)		(0x1 << (((n) * 3) + 2))
-
-/*
- * Standard UART register offsets
- */
-#define LPC32XX_UART_DLL_FIFO(x)		io_p2v((x) + 0x00)
-#define LPC32XX_UART_DLM_IER(x)			io_p2v((x) + 0x04)
-#define LPC32XX_UART_IIR_FCR(x)			io_p2v((x) + 0x08)
-#define LPC32XX_UART_LCR(x)			io_p2v((x) + 0x0C)
-#define LPC32XX_UART_MODEM_CTRL(x)		io_p2v((x) + 0x10)
-#define LPC32XX_UART_LSR(x)			io_p2v((x) + 0x14)
-#define LPC32XX_UART_MODEM_STATUS(x)		io_p2v((x) + 0x18)
-#define LPC32XX_UART_RXLEV(x)			io_p2v((x) + 0x1C)
-
-/*
- * UART control structure offsets
- */
-#define _UCREG(x)				io_p2v(\
-						LPC32XX_UART_CTRL_BASE + (x))
-#define LPC32XX_UARTCTL_CTRL			_UCREG(0x00)
-#define LPC32XX_UARTCTL_CLKMODE			_UCREG(0x04)
-#define LPC32XX_UARTCTL_CLOOP			_UCREG(0x08)
-
-/*
- * ctrl register definitions
- */
-#define LPC32XX_UART_U3_MD_CTRL_EN		_BIT(11)
-#define LPC32XX_UART_IRRX6_INV_EN		_BIT(10)
-#define LPC32XX_UART_HDPX_EN			_BIT(9)
-#define LPC32XX_UART_UART6_IRDAMOD_BYPASS	_BIT(5)
-#define LPC32XX_RT_IRTX6_INV_EN			_BIT(4)
-#define LPC32XX_RT_IRTX6_INV_MIR_EN		_BIT(3)
-#define LPC32XX_RT_RX_IRPULSE_3_16_115K		_BIT(2)
-#define LPC32XX_RT_TX_IRPULSE_3_16_115K		_BIT(1)
-#define LPC32XX_UART_U5_ROUTE_TO_USB		_BIT(0)
-
-/*
- * clkmode register definitions
- */
-#define LPC32XX_UART_ENABLED_CLOCKS(n)		(((n) >> 16) & 0x7F)
-#define LPC32XX_UART_ENABLED_CLOCK(n, u)	(((n) >> (16 + (u))) & 0x1)
-#define LPC32XX_UART_ENABLED_CLKS_ANY		_BIT(14)
-#define LPC32XX_UART_CLKMODE_OFF		0x0
-#define LPC32XX_UART_CLKMODE_ON			0x1
-#define LPC32XX_UART_CLKMODE_AUTO		0x2
-#define LPC32XX_UART_CLKMODE_MASK(u)		(0x3 << ((((u) - 3) * 2) + 4))
-#define LPC32XX_UART_CLKMODE_LOAD(m, u)		((m) << ((((u) - 3) * 2) + 4))
-
-/*
- * GPIO Module Register offsets
- */
-#define _GPREG(x)				io_p2v(LPC32XX_GPIO_BASE + (x))
-#define LPC32XX_GPIO_P_MUX_SET			_GPREG(0x100)
-#define LPC32XX_GPIO_P_MUX_CLR			_GPREG(0x104)
-#define LPC32XX_GPIO_P_MUX_STATE		_GPREG(0x108)
-#define LPC32XX_GPIO_P3_MUX_SET			_GPREG(0x110)
-#define LPC32XX_GPIO_P3_MUX_CLR			_GPREG(0x114)
-#define LPC32XX_GPIO_P3_MUX_STATE		_GPREG(0x118)
-#define LPC32XX_GPIO_P0_MUX_SET			_GPREG(0x120)
-#define LPC32XX_GPIO_P0_MUX_CLR			_GPREG(0x124)
-#define LPC32XX_GPIO_P0_MUX_STATE		_GPREG(0x128)
-#define LPC32XX_GPIO_P1_MUX_SET			_GPREG(0x130)
-#define LPC32XX_GPIO_P1_MUX_CLR			_GPREG(0x134)
-#define LPC32XX_GPIO_P1_MUX_STATE		_GPREG(0x138)
-#define LPC32XX_GPIO_P2_MUX_SET			_GPREG(0x028)
-#define LPC32XX_GPIO_P2_MUX_CLR			_GPREG(0x02C)
-#define LPC32XX_GPIO_P2_MUX_STATE		_GPREG(0x030)
-
-/*
- * USB Otg Registers
- */
-#define _OTGREG(x)			io_p2v(LPC32XX_USB_OTG_BASE + (x))
-#define LPC32XX_USB_OTG_CLK_CTRL	_OTGREG(0xFF4)
-#define LPC32XX_USB_OTG_CLK_STAT	_OTGREG(0xFF8)
-
-/* USB OTG CLK CTRL bit defines */
-#define LPC32XX_USB_OTG_AHB_M_CLOCK_ON	_BIT(4)
-#define LPC32XX_USB_OTG_OTG_CLOCK_ON	_BIT(3)
-#define LPC32XX_USB_OTG_I2C_CLOCK_ON	_BIT(2)
-#define LPC32XX_USB_OTG_DEV_CLOCK_ON	_BIT(1)
-#define LPC32XX_USB_OTG_HOST_CLOCK_ON	_BIT(0)
-
-/*
- * Start of virtual addresses for IO devices
- */
-#define IO_BASE		0xF0000000
-
-/*
- * This macro relies on fact that for all HW i/o addresses bits 20-23 are 0
- */
-#define IO_ADDRESS(x)	IOMEM(((((x) & 0xff000000) >> 4) | ((x) & 0xfffff)) |\
-			 IO_BASE)
-
-#define io_p2v(x)	((void __iomem *) (unsigned long) IO_ADDRESS(x))
-#define io_v2p(x)	((((x) & 0x0ff00000) << 4) | ((x) & 0x000fffff))
-
-#endif
diff --git a/arch/arm/mach-lpc32xx/phy3250.c b/arch/arm/mach-lpc32xx/phy3250.c
deleted file mode 100644
index 66701bf432488..0000000000000
--- a/arch/arm/mach-lpc32xx/phy3250.c
+++ /dev/null
@@ -1,92 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0+
-/*
- * Platform support for LPC32xx SoC
- *
- * Author: Kevin Wells <kevin.wells@nxp.com>
- *
- * Copyright (C) 2012 Roland Stigge <stigge@antcom.de>
- * Copyright (C) 2010 NXP Semiconductors
- */
-
-#include <linux/amba/pl08x.h>
-#include <linux/mtd/lpc32xx_mlc.h>
-#include <linux/mtd/lpc32xx_slc.h>
-#include <linux/of_platform.h>
-
-#include <asm/mach/arch.h>
-#include "common.h"
-
-static struct pl08x_channel_data pl08x_slave_channels[] = {
-	{
-		.bus_id = "nand-slc",
-		.min_signal = 1, /* SLC NAND Flash */
-		.max_signal = 1,
-		.periph_buses = PL08X_AHB1,
-	},
-	{
-		.bus_id = "nand-mlc",
-		.min_signal = 12, /* MLC NAND Flash */
-		.max_signal = 12,
-		.periph_buses = PL08X_AHB1,
-	},
-};
-
-static int pl08x_get_signal(const struct pl08x_channel_data *cd)
-{
-	return cd->min_signal;
-}
-
-static void pl08x_put_signal(const struct pl08x_channel_data *cd, int ch)
-{
-}
-
-static struct pl08x_platform_data pl08x_pd = {
-	/* Some reasonable memcpy defaults */
-	.memcpy_burst_size = PL08X_BURST_SZ_256,
-	.memcpy_bus_width = PL08X_BUS_WIDTH_32_BITS,
-	.slave_channels = &pl08x_slave_channels[0],
-	.num_slave_channels = ARRAY_SIZE(pl08x_slave_channels),
-	.get_xfer_signal = pl08x_get_signal,
-	.put_xfer_signal = pl08x_put_signal,
-	.lli_buses = PL08X_AHB1,
-	.mem_buses = PL08X_AHB1,
-};
-
-static struct lpc32xx_slc_platform_data lpc32xx_slc_data = {
-	.dma_filter = pl08x_filter_id,
-};
-
-static struct lpc32xx_mlc_platform_data lpc32xx_mlc_data = {
-	.dma_filter = pl08x_filter_id,
-};
-
-static const struct of_dev_auxdata lpc32xx_auxdata_lookup[] __initconst = {
-	OF_DEV_AUXDATA("arm,pl080", 0x31000000, "pl08xdmac", &pl08x_pd),
-	OF_DEV_AUXDATA("nxp,lpc3220-slc", 0x20020000, "20020000.flash",
-		       &lpc32xx_slc_data),
-	OF_DEV_AUXDATA("nxp,lpc3220-mlc", 0x200a8000, "200a8000.flash",
-		       &lpc32xx_mlc_data),
-	{ }
-};
-
-static void __init lpc3250_machine_init(void)
-{
-	lpc32xx_serial_init();
-
-	of_platform_default_populate(NULL, lpc32xx_auxdata_lookup, NULL);
-}
-
-static const char *const lpc32xx_dt_compat[] __initconst = {
-	"nxp,lpc3220",
-	"nxp,lpc3230",
-	"nxp,lpc3240",
-	"nxp,lpc3250",
-	NULL
-};
-
-DT_MACHINE_START(LPC32XX_DT, "LPC32XX SoC (Flattened Device Tree)")
-	.atag_offset	= 0x100,
-	.map_io		= lpc32xx_map_io,
-	.init_machine	= lpc3250_machine_init,
-	.dt_compat	= lpc32xx_dt_compat,
-MACHINE_END
diff --git a/arch/arm/mach-lpc32xx/pm.c b/arch/arm/mach-lpc32xx/pm.c
deleted file mode 100644
index 2572bd89a5e8d..0000000000000
--- a/arch/arm/mach-lpc32xx/pm.c
+++ /dev/null
@@ -1,135 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * arch/arm/mach-lpc32xx/pm.c
- *
- * Original authors: Vitaly Wool, Dmitry Chigirev <source@mvista.com>
- * Modified by Kevin Wells <kevin.wells@nxp.com>
- *
- * 2005 (c) MontaVista Software, Inc.
- */
-
-/*
- * LPC32XX CPU and system power management
- *
- * The LPC32XX has three CPU modes for controlling system power: run,
- * direct-run, and halt modes. When switching between halt and run modes,
- * the CPU transistions through direct-run mode. For Linux, direct-run
- * mode is not used in normal operation. Halt mode is used when the
- * system is fully suspended.
- *
- * Run mode:
- * The ARM CPU clock (HCLK_PLL), HCLK bus clock, and PCLK bus clocks are
- * derived from the HCLK PLL. The HCLK and PCLK bus rates are divided from
- * the HCLK_PLL rate. Linux runs in this mode.
- *
- * Direct-run mode:
- * The ARM CPU clock, HCLK bus clock, and PCLK bus clocks are driven from
- * SYSCLK. SYSCLK is usually around 13MHz, but may vary based on SYSCLK
- * source or the frequency of the main oscillator. In this mode, the
- * HCLK_PLL can be safely enabled, changed, or disabled.
- *
- * Halt mode:
- * SYSCLK is gated off and the CPU and system clocks are halted.
- * Peripherals based on the 32KHz oscillator clock (ie, RTC, touch,
- * key scanner, etc.) still operate if enabled. In this state, an enabled
- * system event (ie, GPIO state change, RTC match, key press, etc.) will
- * wake the system up back into direct-run mode.
- *
- * DRAM refresh
- * DRAM clocking and refresh are slightly different for systems with DDR
- * DRAM or regular SDRAM devices. If SDRAM is used in the system, the
- * SDRAM will still be accessible in direct-run mode. In DDR based systems,
- * a transition to direct-run mode will stop all DDR accesses (no clocks).
- * Because of this, the code to switch power modes and the code to enter
- * and exit DRAM self-refresh modes must not be executed in DRAM. A small
- * section of IRAM is used instead for this.
- *
- * Suspend is handled with the following logic:
- *  Backup a small area of IRAM used for the suspend code
- *  Copy suspend code to IRAM
- *  Transfer control to code in IRAM
- *  Places DRAMs in self-refresh mode
- *  Enter direct-run mode
- *  Save state of HCLK_PLL PLL
- *  Disable HCLK_PLL PLL
- *  Enter halt mode - CPU and buses will stop
- *  System enters direct-run mode when an enabled event occurs
- *  HCLK PLL state is restored
- *  Run mode is entered
- *  DRAMS are placed back into normal mode
- *  Code execution returns from IRAM
- *  IRAM code are used for suspend is restored
- *  Suspend mode is exited
- */
-
-#include <linux/suspend.h>
-#include <linux/io.h>
-#include <linux/slab.h>
-
-#include <asm/cacheflush.h>
-
-#include "lpc32xx.h"
-#include "common.h"
-
-#define TEMP_IRAM_AREA  IO_ADDRESS(LPC32XX_IRAM_BASE)
-
-/*
- * Both STANDBY and MEM suspend states are handled the same with no
- * loss of CPU or memory state
- */
-static int lpc32xx_pm_enter(suspend_state_t state)
-{
-	int (*lpc32xx_suspend_ptr) (void);
-	void *iram_swap_area;
-
-	/* Allocate some space for temporary IRAM storage */
-	iram_swap_area = kmemdup((void *)TEMP_IRAM_AREA,
-				 lpc32xx_sys_suspend_sz, GFP_KERNEL);
-	if (!iram_swap_area)
-		return -ENOMEM;
-
-	/*
-	 * Copy code to suspend system into IRAM. The suspend code
-	 * needs to run from IRAM as DRAM may no longer be available
-	 * when the PLL is stopped.
-	 */
-	memcpy((void *) TEMP_IRAM_AREA, &lpc32xx_sys_suspend,
-		lpc32xx_sys_suspend_sz);
-	flush_icache_range((unsigned long)TEMP_IRAM_AREA,
-		(unsigned long)(TEMP_IRAM_AREA) + lpc32xx_sys_suspend_sz);
-
-	/* Transfer to suspend code in IRAM */
-	lpc32xx_suspend_ptr = (void *) TEMP_IRAM_AREA;
-	flush_cache_all();
-	(void) lpc32xx_suspend_ptr();
-
-	/* Restore original IRAM contents */
-	memcpy((void *) TEMP_IRAM_AREA, iram_swap_area,
-		lpc32xx_sys_suspend_sz);
-
-	kfree(iram_swap_area);
-
-	return 0;
-}
-
-static const struct platform_suspend_ops lpc32xx_pm_ops = {
-	.valid	= suspend_valid_only_mem,
-	.enter	= lpc32xx_pm_enter,
-};
-
-#define EMC_DYN_MEM_CTRL_OFS 0x20
-#define EMC_SRMMC           (1 << 3)
-#define EMC_CTRL_REG io_p2v(LPC32XX_EMC_BASE + EMC_DYN_MEM_CTRL_OFS)
-static int __init lpc32xx_pm_init(void)
-{
-	/*
-	 * Setup SDRAM self-refresh clock to automatically disable o
-	 * start of self-refresh. This only needs to be done once.
-	 */
-	__raw_writel(__raw_readl(EMC_CTRL_REG) | EMC_SRMMC, EMC_CTRL_REG);
-
-	suspend_set_ops(&lpc32xx_pm_ops);
-
-	return 0;
-}
-arch_initcall(lpc32xx_pm_init);
diff --git a/arch/arm/mach-lpc32xx/serial.c b/arch/arm/mach-lpc32xx/serial.c
deleted file mode 100644
index 3b1203db81b2c..0000000000000
--- a/arch/arm/mach-lpc32xx/serial.c
+++ /dev/null
@@ -1,148 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * arch/arm/mach-lpc32xx/serial.c
- *
- * Author: Kevin Wells <kevin.wells@nxp.com>
- *
- * Copyright (C) 2010 NXP Semiconductors
- */
-
-#include <linux/kernel.h>
-#include <linux/types.h>
-#include <linux/serial.h>
-#include <linux/serial_core.h>
-#include <linux/serial_reg.h>
-#include <linux/serial_8250.h>
-#include <linux/clk.h>
-#include <linux/io.h>
-#include <linux/soc/nxp/lpc32xx-misc.h>
-
-#include "lpc32xx.h"
-#include "common.h"
-
-#define LPC32XX_SUART_FIFO_SIZE	64
-
-struct uartinit {
-	char *uart_ck_name;
-	u32 ck_mode_mask;
-	void __iomem *pdiv_clk_reg;
-	resource_size_t mapbase;
-};
-
-static struct uartinit uartinit_data[] __initdata = {
-	{
-		.uart_ck_name = "uart5_ck",
-		.ck_mode_mask =
-			LPC32XX_UART_CLKMODE_LOAD(LPC32XX_UART_CLKMODE_ON, 5),
-		.pdiv_clk_reg = LPC32XX_CLKPWR_UART5_CLK_CTRL,
-		.mapbase = LPC32XX_UART5_BASE,
-	},
-	{
-		.uart_ck_name = "uart3_ck",
-		.ck_mode_mask =
-			LPC32XX_UART_CLKMODE_LOAD(LPC32XX_UART_CLKMODE_ON, 3),
-		.pdiv_clk_reg = LPC32XX_CLKPWR_UART3_CLK_CTRL,
-		.mapbase = LPC32XX_UART3_BASE,
-	},
-	{
-		.uart_ck_name = "uart4_ck",
-		.ck_mode_mask =
-			LPC32XX_UART_CLKMODE_LOAD(LPC32XX_UART_CLKMODE_ON, 4),
-		.pdiv_clk_reg = LPC32XX_CLKPWR_UART4_CLK_CTRL,
-		.mapbase = LPC32XX_UART4_BASE,
-	},
-	{
-		.uart_ck_name = "uart6_ck",
-		.ck_mode_mask =
-			LPC32XX_UART_CLKMODE_LOAD(LPC32XX_UART_CLKMODE_ON, 6),
-		.pdiv_clk_reg = LPC32XX_CLKPWR_UART6_CLK_CTRL,
-		.mapbase = LPC32XX_UART6_BASE,
-	},
-};
-
-/* LPC3250 Errata HSUART.1: Hang workaround via loopback mode on inactivity */
-void lpc32xx_loopback_set(resource_size_t mapbase, int state)
-{
-	int bit;
-	u32 tmp;
-
-	switch (mapbase) {
-	case LPC32XX_HS_UART1_BASE:
-		bit = 0;
-		break;
-	case LPC32XX_HS_UART2_BASE:
-		bit = 1;
-		break;
-	case LPC32XX_HS_UART7_BASE:
-		bit = 6;
-		break;
-	default:
-		WARN(1, "lpc32xx_hs: Warning: Unknown port at %08x\n", mapbase);
-		return;
-	}
-
-	tmp = readl(LPC32XX_UARTCTL_CLOOP);
-	if (state)
-		tmp |= (1 << bit);
-	else
-		tmp &= ~(1 << bit);
-	writel(tmp, LPC32XX_UARTCTL_CLOOP);
-}
-EXPORT_SYMBOL_GPL(lpc32xx_loopback_set);
-
-void __init lpc32xx_serial_init(void)
-{
-	u32 tmp, clkmodes = 0;
-	struct clk *clk;
-	unsigned int puart;
-	int i, j;
-
-	for (i = 0; i < ARRAY_SIZE(uartinit_data); i++) {
-		clk = clk_get(NULL, uartinit_data[i].uart_ck_name);
-		if (!IS_ERR(clk)) {
-			clk_enable(clk);
-		}
-
-		/* Setup UART clock modes for all UARTs, disable autoclock */
-		clkmodes |= uartinit_data[i].ck_mode_mask;
-
-		/* pre-UART clock divider set to 1 */
-		__raw_writel(0x0101, uartinit_data[i].pdiv_clk_reg);
-
-		/*
-		 * Force a flush of the RX FIFOs to work around a
-		 * HW bug
-		 */
-		puart = uartinit_data[i].mapbase;
-		__raw_writel(0xC1, LPC32XX_UART_IIR_FCR(puart));
-		__raw_writel(0x00, LPC32XX_UART_DLL_FIFO(puart));
-		j = LPC32XX_SUART_FIFO_SIZE;
-		while (j--)
-			tmp = __raw_readl(
-				LPC32XX_UART_DLL_FIFO(puart));
-		__raw_writel(0, LPC32XX_UART_IIR_FCR(puart));
-	}
-
-	/* This needs to be done after all UART clocks are setup */
-	__raw_writel(clkmodes, LPC32XX_UARTCTL_CLKMODE);
-	for (i = 0; i < ARRAY_SIZE(uartinit_data); i++) {
-		/* Force a flush of the RX FIFOs to work around a HW bug */
-		puart = uartinit_data[i].mapbase;
-		__raw_writel(0xC1, LPC32XX_UART_IIR_FCR(puart));
-		__raw_writel(0x00, LPC32XX_UART_DLL_FIFO(puart));
-		j = LPC32XX_SUART_FIFO_SIZE;
-		while (j--)
-			tmp = __raw_readl(LPC32XX_UART_DLL_FIFO(puart));
-		__raw_writel(0, LPC32XX_UART_IIR_FCR(puart));
-	}
-
-	/* Disable IrDA pulsing support on UART6 */
-	tmp = __raw_readl(LPC32XX_UARTCTL_CTRL);
-	tmp |= LPC32XX_UART_UART6_IRDAMOD_BYPASS;
-	__raw_writel(tmp, LPC32XX_UARTCTL_CTRL);
-
-	/* Disable UART5->USB transparent mode or USB won't work */
-	tmp = __raw_readl(LPC32XX_UARTCTL_CTRL);
-	tmp &= ~LPC32XX_UART_U5_ROUTE_TO_USB;
-	__raw_writel(tmp, LPC32XX_UARTCTL_CTRL);
-}
diff --git a/arch/arm/mach-lpc32xx/suspend.S b/arch/arm/mach-lpc32xx/suspend.S
deleted file mode 100644
index a95c5e0e40384..0000000000000
--- a/arch/arm/mach-lpc32xx/suspend.S
+++ /dev/null
@@ -1,148 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * arch/arm/mach-lpc32xx/suspend.S
- *
- * Original authors: Dmitry Chigirev, Vitaly Wool <source@mvista.com>
- * Modified by Kevin Wells <kevin.wells@nxp.com>
- *
- * 2005 (c) MontaVista Software, Inc.
- */
-#include <linux/linkage.h>
-#include <asm/assembler.h>
-#include "lpc32xx.h"
-
-/* Using named register defines makes the code easier to follow */
-#define WORK1_REG			r0
-#define WORK2_REG			r1
-#define SAVED_HCLK_DIV_REG		r2
-#define SAVED_HCLK_PLL_REG		r3
-#define SAVED_DRAM_CLKCTRL_REG		r4
-#define SAVED_PWR_CTRL_REG		r5
-#define CLKPWRBASE_REG			r6
-#define EMCBASE_REG			r7
-
-#define LPC32XX_EMC_STATUS_OFFS		0x04
-#define LPC32XX_EMC_STATUS_BUSY		0x1
-#define LPC32XX_EMC_STATUS_SELF_RFSH	0x4
-
-#define LPC32XX_CLKPWR_PWR_CTRL_OFFS	0x44
-#define LPC32XX_CLKPWR_HCLK_DIV_OFFS	0x40
-#define LPC32XX_CLKPWR_HCLKPLL_CTRL_OFFS 0x58
-
-#define CLKPWR_PCLK_DIV_MASK		0xFFFFFE7F
-
-	.text
-
-ENTRY(lpc32xx_sys_suspend)
-	@ Save a copy of the used registers in IRAM, r0 is corrupted
-	adr	r0, tmp_stack_end
-	stmfd	r0!, {r3 - r7, sp, lr}
-
-	@ Load a few common register addresses
-	adr	WORK1_REG, reg_bases
-	ldr	CLKPWRBASE_REG, [WORK1_REG, #0]
-	ldr	EMCBASE_REG, [WORK1_REG, #4]
-
-	ldr	SAVED_PWR_CTRL_REG, [CLKPWRBASE_REG,\
-		#LPC32XX_CLKPWR_PWR_CTRL_OFFS]
-	orr	WORK1_REG, SAVED_PWR_CTRL_REG, #LPC32XX_CLKPWR_SDRAM_SELF_RFSH
-
-	@ Wait for SDRAM busy status to go busy and then idle
-	@ This guarantees a small windows where DRAM isn't busy
-1:
-	ldr	WORK2_REG, [EMCBASE_REG, #LPC32XX_EMC_STATUS_OFFS]
-	and	WORK2_REG, WORK2_REG, #LPC32XX_EMC_STATUS_BUSY
-	cmp	WORK2_REG, #LPC32XX_EMC_STATUS_BUSY
-	bne	1b @ Branch while idle
-2:
-	ldr	WORK2_REG, [EMCBASE_REG, #LPC32XX_EMC_STATUS_OFFS]
-	and	WORK2_REG, WORK2_REG, #LPC32XX_EMC_STATUS_BUSY
-	cmp	WORK2_REG, #LPC32XX_EMC_STATUS_BUSY
-	beq	2b @ Branch until idle
-
-	@ Setup self-refresh with support for manual exit of
-	@ self-refresh mode
-	str	WORK1_REG, [CLKPWRBASE_REG, #LPC32XX_CLKPWR_PWR_CTRL_OFFS]
-	orr	WORK2_REG, WORK1_REG, #LPC32XX_CLKPWR_UPD_SDRAM_SELF_RFSH
-	str	WORK2_REG, [CLKPWRBASE_REG, #LPC32XX_CLKPWR_PWR_CTRL_OFFS]
-	str	WORK1_REG, [CLKPWRBASE_REG, #LPC32XX_CLKPWR_PWR_CTRL_OFFS]
-
-	@ Wait for self-refresh acknowledge, clocks to the DRAM device
-	@ will automatically stop on start of self-refresh
-3:
-	ldr	WORK2_REG, [EMCBASE_REG, #LPC32XX_EMC_STATUS_OFFS]
-	and	WORK2_REG, WORK2_REG, #LPC32XX_EMC_STATUS_SELF_RFSH
-	cmp	WORK2_REG, #LPC32XX_EMC_STATUS_SELF_RFSH
-	bne	3b @ Branch until self-refresh mode starts
-
-	@ Enter direct-run mode from run mode
-	bic	WORK1_REG, WORK1_REG, #LPC32XX_CLKPWR_SELECT_RUN_MODE
-	str	WORK1_REG, [CLKPWRBASE_REG, #LPC32XX_CLKPWR_PWR_CTRL_OFFS]
-
-	@ Safe disable of DRAM clock in EMC block, prevents DDR sync
-	@ issues on restart
-	ldr	SAVED_HCLK_DIV_REG, [CLKPWRBASE_REG,\
-		#LPC32XX_CLKPWR_HCLK_DIV_OFFS]
-	and	WORK2_REG, SAVED_HCLK_DIV_REG, #CLKPWR_PCLK_DIV_MASK
-	str	WORK2_REG, [CLKPWRBASE_REG, #LPC32XX_CLKPWR_HCLK_DIV_OFFS]
-
-	@ Save HCLK PLL state and disable HCLK PLL
-	ldr	SAVED_HCLK_PLL_REG, [CLKPWRBASE_REG,\
-		#LPC32XX_CLKPWR_HCLKPLL_CTRL_OFFS]
-	bic	WORK2_REG, SAVED_HCLK_PLL_REG, #LPC32XX_CLKPWR_HCLKPLL_POWER_UP
-	str	WORK2_REG, [CLKPWRBASE_REG, #LPC32XX_CLKPWR_HCLKPLL_CTRL_OFFS]
-
-	@ Enter stop mode until an enabled event occurs
-	orr	WORK1_REG, WORK1_REG, #LPC32XX_CLKPWR_STOP_MODE_CTRL
-	str	WORK1_REG, [CLKPWRBASE_REG, #LPC32XX_CLKPWR_PWR_CTRL_OFFS]
-	.rept 9
-	nop
-	.endr
-
-	@ Clear stop status
-	bic	WORK1_REG, WORK1_REG, #LPC32XX_CLKPWR_STOP_MODE_CTRL
-
-	@ Restore original HCLK PLL value and wait for PLL lock
-	str	SAVED_HCLK_PLL_REG, [CLKPWRBASE_REG,\
-		#LPC32XX_CLKPWR_HCLKPLL_CTRL_OFFS]
-4:
-	ldr	WORK2_REG, [CLKPWRBASE_REG, #LPC32XX_CLKPWR_HCLKPLL_CTRL_OFFS]
-	and	WORK2_REG, WORK2_REG, #LPC32XX_CLKPWR_HCLKPLL_PLL_STS
-	bne	4b
-
-	@ Re-enter run mode with self-refresh flag cleared, but no DRAM
-	@ update yet. DRAM is still in self-refresh
-	str	SAVED_PWR_CTRL_REG, [CLKPWRBASE_REG,\
-		#LPC32XX_CLKPWR_PWR_CTRL_OFFS]
-
-	@ Restore original DRAM clock mode to restore DRAM clocks
-	str	SAVED_HCLK_DIV_REG, [CLKPWRBASE_REG,\
-		#LPC32XX_CLKPWR_HCLK_DIV_OFFS]
-
-	@ Clear self-refresh mode
-	orr	WORK1_REG, SAVED_PWR_CTRL_REG,\
-		#LPC32XX_CLKPWR_UPD_SDRAM_SELF_RFSH
-	str	WORK1_REG, [CLKPWRBASE_REG, #LPC32XX_CLKPWR_PWR_CTRL_OFFS]
-	str	SAVED_PWR_CTRL_REG, [CLKPWRBASE_REG,\
-		#LPC32XX_CLKPWR_PWR_CTRL_OFFS]
-
-	@ Wait for EMC to clear self-refresh mode
-5:
-	ldr	WORK2_REG, [EMCBASE_REG, #LPC32XX_EMC_STATUS_OFFS]
-	and	WORK2_REG, WORK2_REG, #LPC32XX_EMC_STATUS_SELF_RFSH
-	bne	5b @ Branch until self-refresh has exited
-
-	@ restore regs and return
-	adr	r0, tmp_stack
-	ldmfd	r0!, {r3 - r7, sp, pc}
-
-reg_bases:
-	.long	IO_ADDRESS(LPC32XX_CLK_PM_BASE)
-	.long	IO_ADDRESS(LPC32XX_EMC_BASE)
-
-tmp_stack:
-	.long	0, 0, 0, 0, 0, 0, 0
-tmp_stack_end:
-
-ENTRY(lpc32xx_sys_suspend_sz)
-	.word	. - lpc32xx_sys_suspend

-- 
2.43.0


