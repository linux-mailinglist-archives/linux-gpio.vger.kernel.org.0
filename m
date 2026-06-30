Return-Path: <linux-gpio+bounces-39209-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +bHXHpe9Q2rpgAoAu9opvQ
	(envelope-from <linux-gpio+bounces-39209-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 14:59:03 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3AE6E487C
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 14:59:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=uhSQn0Nr;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39209-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39209-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 599903006120
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 12:54:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A79440FDAD;
	Tue, 30 Jun 2026 12:54:15 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011067.outbound.protection.outlook.com [52.101.65.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6439A40E8F8;
	Tue, 30 Jun 2026 12:54:13 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782824054; cv=fail; b=sguy/QgYr+jstpyLIgjUUDAlTsnpsJmtZcW0plZjotOVH6hALNz83NHkb5TZ+sh/F9syo/wRO0giEJybzFoG+e4w1wwHbJjotW1ZXZFA6uJTqnWOjKn9Uk0X5t5Aup+/NFOaFBzTaX5/FCDIsEMhizsuNm1zloaikYVGREIt3gg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782824054; c=relaxed/simple;
	bh=X/sPs0EWWErv471gJGXGABlnW+2IvZ5QlrBaVJDUcw8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=C8VgT+KbLX57Oc7y1GvbWQH4ndSxba3vg9OSdAWGKQjkqZj29SpRnSsl2oRC8FLlAnT3MLMLlbwVrrxBXkOiidXNQ6f40A0PrRTfw3xPvI8hY6CExUTR4nRjqXKHz+8akQ0lbqcYIBOFOUGbsVM4feJVxpRl/WuxtIbgLKSUIlU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=uhSQn0Nr; arc=fail smtp.client-ip=52.101.65.67
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QAwa1CeN9rVHAkREuPn4NqmrNW6SUkNX8ZIoJ2SLxqfdJBqHLdOxglnRBxHwKQG3Swiz9uf+f+OCLTfDVoHS969uGGIcDOZDy6p/GI0iYGhQfWUz5r6/Bg9Fwnv/lPgOrVnzslP2gElMPEfA8dBDCLKN+zyq1cGS6t+QnYtYfqAKPZyg/VLyQFDyxLxY81eIlyyEvraTZQwX5/fcjopBvGfsDyD2VxbsP1Rfh3s0OjfK5Es4tQRD38a0GD6eccdGHIbYGJIDig0TS2joxOXiG9etDXohtjngJRmeStRBlpCF/LV4ChZSWbL2H16bDaFXrYdtXJgfxC7pXzb3c8X/4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xhqe8WlEGC8IkBKPbnb1OqNr7u9dbecpwKY85Vjo9K4=;
 b=WVgG5Dr8wPY/bG1MBFDxofNW8ct82TsDjr9rqAbNF0HWWeShjVOkeBgYEGRH/wDt1kPJM3YCik4Gd1xYrRsecKf6bIPUOk1GYN25NL2nqzuQ5OtT6OAO8dzUh8Lsgk2/3V+aJHD+IxM/muVSe2BTG+kDBnI5R89R8hAFA+fJsN8SBkSAJbZkXWPPGwlgeUWEfz31tgJg5N27iNT9Cbd1mZD4Lv9O7O2jMPLktA4/3NsOhvKOjkC30rB/CldD3ms7XCmo0fIXZNh4lmhsiS5pTO6kufm94VwX5X+VWaX3hWNYKAkByNszSF2iiI2PJwPQ7vDDSVeS4rOSi7DHqwi+2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xhqe8WlEGC8IkBKPbnb1OqNr7u9dbecpwKY85Vjo9K4=;
 b=uhSQn0NrxnFCHKi5tVdMiCcYI/BzwfEvVDE1ly8n9V11F7ZnOHIl4THoK8JTgm79TCZMsXHwwERfJhPs2/U8tNRE391E5yQTMN2XFmkCDyz+gmA/9iJK58YXY7KkLe0mMcPjNGK/Dtpjio9FbbvwmVUOvJhSBn8RsGugHPvCU5P1E4TI0vDKntqB9abaZfUktpuKLZ76bsmENsB++XklxEjM3EjXSSWT4SeBxRg5eNVz6/bLzvZR5a7i0o8GoBzUZj6A2d9ZkPODIKvcq+ykAHlLEb5rnZAm+uxSBJJ9w35bGVOBuNbcg8rbwUnvXoxHGGZH9OTR/IQIlstdXji93g==
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::20)
 by VI2PR04MB10883.eurprd04.prod.outlook.com (2603:10a6:800:27f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 12:54:07 +0000
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85]) by AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85%5]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 12:54:07 +0000
From: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
	Larisa Grigore <larisa.grigore@nxp.com>,
	Lee Jones <lee@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>
Cc: Alberto Ruiz <aruizrui@redhat.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	devicetree@vger.kernel.org,
	Enric Balletbo <eballetb@redhat.com>,
	Eric Chanudet <echanude@redhat.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH v12 1/6] pinctrl: s32cc: add/fix some comments
Date: Tue, 30 Jun 2026 14:53:58 +0200
Message-Id: <20260630125403.546375-2-khristineandreea.barbulescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260630125403.546375-1-khristineandreea.barbulescu@oss.nxp.com>
References: <20260630125403.546375-1-khristineandreea.barbulescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0071.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::6) To AM9PR04MB8179.eurprd04.prod.outlook.com
 (2603:10a6:20b:3b5::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8179:EE_|VI2PR04MB10883:EE_
X-MS-Office365-Filtering-Correlation-Id: 76ef8fdc-0921-42cb-c114-08ded6a6abf2
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|23010399003|7416014|376014|366016|19092799006|921020|22082099003|18002099003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
 QM/EE8Hpfw+CiI8k8b6h1TzsJp7LemUppeuLUD82EYMMvGNVUz5VRBYle3NGpWsN3LTov6UYsgTF+z2xs0jnPbBb5dU0yKY1RgFfpDAtkAUXkZmR2I20w2rY1hCdKmnw8hZJiMBi/fGGZKffRgvNHcmAcFYmYNSKchefZsLFXtodabKvFdkVQrDWzaoagtsnphS3W+fceG3YulY5zk0qPXxZVs6Wc0Z5bPlfCtCQEx+gCIZanudfX6DzU0HD2gMGZz63EWWqGzQfZbxVIkFP19v4tJy/IJk/aOIznUrwwvG5XtKVLdT8iLcfkfoOYYMWK1urIZR02bRKW8CtRj/FWBKssbs06zMUeBc9kTlDA0bqKL++bDK8nbRirGr8wVoL34FG+a3srRVVwz0AtHYjuUgk7kv96//5pG7oTluEJwMZEz+x7qO4MYKYBXgB70+y+hMmb3I5CcxnpZlDQPBroNKtIiV/IvK2hY2TCSez3XxmpvuEJGuP/2LyxoCJ2ijHCluMYNaRmku2f0bMtuPAd0+biN76eQxpcBTJ3SsO4vkcMr2yAz6ctJAaAcGOjsjg9D1damL2r7i0pCL+gBKXhTLa5ZgYfNl2aw7X3n0gTeusgfaOKE+fzsCkjdYgl6Vuuso0R1+wY1z7bQyQMhhF2N6JKDN3Lh8WTAs+4fPXr/aJPldn7BtoF07o2iPbJWw724RD1IYwHhYvaizyJAggPw==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8179.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(376014)(366016)(19092799006)(921020)(22082099003)(18002099003)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?YloxL2lVTG1WcHo2S0dIWW44QXRxUGVrQnN6YTJhREJvVGJTVXlCQm5ENXRz?=
 =?utf-8?B?VVl5TmkwK3pPdWtkZ3NYbGwxbUh1MGo0eEVNWjNoRzVpY2ROcmcwNm1DMytu?=
 =?utf-8?B?a0dFNmVvd2trYlRwU0Y4RVU3S3B5aThpZzh2VEVtOFhKOXNJUWF0eXpOWE1J?=
 =?utf-8?B?S3lCVjFYMkZOTWYwbmxYWXhnSHU3UnZzOFdkYWpXZVZoeGg2NGpkOU1qSVdJ?=
 =?utf-8?B?akZvZXB6ZklZUmJEbVdNSDJVaVdicHZSWjNKejBxRHVsSWVxdzlSVGoxQWhv?=
 =?utf-8?B?emJadkI4Zk1zT09GT3JNSUdzNC9hTmU3alYrdDNEY050N2daUEdGek1wMlJi?=
 =?utf-8?B?VnB1RXJEb0NSNlU0Vlk1ZndFZnpPOVF2NFIyS1N6bC9nTVNMQ1BiRzE3Z0oy?=
 =?utf-8?B?QmlRWmY5ZzhCbWFxRjBWYlVFczlTQXJjNkJVRitVQUVSSVBIMUppTE9telNm?=
 =?utf-8?B?UThZMFlrRXFudjNYd1BqZXliRzh1L0UyU0ptT1IrYkRGOVZxK09lOGgxdXpl?=
 =?utf-8?B?bThVSlp4cHZpb3I1czNDMlBJRmVXV1JqOFFNcEtMZmJxQk9mdFlQRUJZVU5j?=
 =?utf-8?B?cTFYU2U5R3piRzRaRlRwRTVEWC9uTVVTWVFuRFVPK2dyZ0dOaFVRbGhodHJJ?=
 =?utf-8?B?YnhPZ2pOZzRjOGg3dWtMOHBxZkJvQWE3UXkxSEVDcmY1U0ttVEZMZlFyUldO?=
 =?utf-8?B?enRha0tMeVhqcWM2Q293MjZ1bWwvMnArSGllKzA2TGUwTGUzMnBIZjgzcmF1?=
 =?utf-8?B?Z05Gemk4QkFmMStJVzRaa21oWmJNa1dLbjh2bS85WUZKdHBOR05PMXBnTlFo?=
 =?utf-8?B?UCtPZk9VVGZSOG9valNvSVphR1dPcVhmam93cElKZlpXSWUyUTVvTjU4RHMr?=
 =?utf-8?B?RHV4b1pqWXBmUUtxeE94S0RnUDdQL2xsWnlDZjZDLzFmMmMyaVRMVk9JbTZS?=
 =?utf-8?B?OG5GTEJ0dGsyVUoydUdoZSt5K3BhL2p3VWtPRExvVFZpSm54SGVqZkFLOFNP?=
 =?utf-8?B?SmVpQWxYQVV1QW5TV0RYWUEvUm56elhkWTZGMmNMdDJiRzhISHhaSXZyQW91?=
 =?utf-8?B?czlETEM1S3NuUHhPNHUxUUlFQlVNczJJbys0ZFU4VGpRaThOVGdrVFVnRk5v?=
 =?utf-8?B?TVBabW1mY1p3Y3pvL3V4b1hQQlVYT2R0VGpIM05HazlaMkFJVnRlSTZOZENZ?=
 =?utf-8?B?VkN2OFVVcXdPcmtpSXdsUWRvYkVSWVVnKzVUSnZGQ1BCZGZhdmpYV3J2WnVk?=
 =?utf-8?B?LzYwamQzK0xBbWhJYmVEdC9xSHdrT3RjU1JQOEFYbURxTWpwZjN0ZnRCTkhV?=
 =?utf-8?B?Vy92aVVjbnRrekZxUnZvMzI2YVY4WXd6UFRTWXg2UTVManRhODNMZ3lra2k5?=
 =?utf-8?B?TDFSOUlCdGZsWmZ4dWJZdUM5MkNHeUZhcVc4dW1UMlJWYzFNNHlzSVZ4WHMx?=
 =?utf-8?B?QW1WTklXMzF3M1dENmFWRkVkWUg1ckNoTmY5bEVsY254OTRrUTE4ZEc1Nmw4?=
 =?utf-8?B?cE5oUDlRZldmcVpjTEJzTnpGa2k3NGRoOVduNHhUZjgzWUd0ZE56UGZPOElh?=
 =?utf-8?B?ZEw4LzdXNXA1cHpWcmd1VHoyWEdzanFTUVBuQTl6SkUyN3E1b3VYa0l1SjN2?=
 =?utf-8?B?SVNlY0s2NmszNEkwT3FlNzBtUmJoRGFwdUNDcVZuV1NVd0JGb1F0UFJtWWdv?=
 =?utf-8?B?bGZaWm9pOStRT2VXRTZYSjFzNzVzUHBsTkxjdG9uZUpFMWJHNmlsdWxPdGZD?=
 =?utf-8?B?QVRDV21SOXVpdWhlbTkzOXN2Yitmb3BXcEY1eU12TGtxbHowZzhSd1FiakRl?=
 =?utf-8?B?UGpJa3ZsNjJveWszK1diNmt0NytQSzl2MjRHT3NRQVFTL2MxNTNGMXUvc1BJ?=
 =?utf-8?B?TXZnblNWelJsUC80WG01em8yUEtMVVF1Wi9BWHBJd0JjNnZDZUlVeVBCd25p?=
 =?utf-8?B?bDd2ZWVDa0NGSExtUkw5UGpadDVreXFqWGs2bkhzeFNNR0drKzRpbUU1RlBq?=
 =?utf-8?B?VTM3b1pBakxuck5zbTZGL2hKeGtvc3EwNkd6LzUvOTFNZTFVNDg4Y1JJazdz?=
 =?utf-8?B?OHgrYXh2V1VxU0VHSU1WSEtHeXRxQVBnZGQ5cmlxT2lOc3k2UmdwdGJHR090?=
 =?utf-8?B?MmErekhUM25xRFR6Y2k0MHJFTllKbXBzNFVaMlN5K2hXclk0a29uMmlXR1Q1?=
 =?utf-8?B?MWtoai96TEcyNklDRG5pZFF4cFRoZWtwdXlFYXVoY3NqbmZ4T3Y3WDE3S09J?=
 =?utf-8?B?YTJDbnV2U2hoM0krTnF1dGJvOGdzWXhnNDVQWFpULzVRUVd5ZGJhdCtxSXA2?=
 =?utf-8?B?RW51d0hhUVA4RERRK2hVT3BFajFMVkFZM0xMM0QvM0FqZjJiOUlHdTIxOGtY?=
 =?utf-8?Q?yaY2zLkdL5EheHUeEKO63npqgHLPBjxGZsPSE?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76ef8fdc-0921-42cb-c114-08ded6a6abf2
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8179.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 12:54:07.2171
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iTN7zsSiUnmELRCVZkZ/o/6cC//j8quIqOW4xKZa3sfD2RYTU/fIPBMjMOOfB97guezEx/wIC2nMAp8xfbOO7u9gfXgxbBKMEGKOWPIE8XHUwrL1CXD1TU9C1L6V5EzA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10883
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39209-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:brgl@bgdev.pl,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:chester62515@gmail.com,m:mbrugger@suse.com,m:ghennadi.procopciuc@nxp.com,m:larisa.grigore@nxp.com,m:lee@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:festevam@gmail.com,m:aisheng.dong@nxp.com,m:ping.bai@nxp.com,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:srini@kernel.org,m:aruizrui@redhat.com,m:clizzi@redhat.com,m:devicetree@vger.kernel.org,m:eballetb@redhat.com,m:echanude@redhat.com,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:s32@nxp.com,m:kernel@pengutronix.de,m:vincent.guittot@linaro.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[khristineandreea.barbulescu@oss.nxp.com,linux-gpio@vger.kernel.org];
	FREEMAIL_TO(0.00)[kernel.org,bgdev.pl,gmail.com,suse.com,nxp.com,pengutronix.de,linuxfoundation.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[khristineandreea.barbulescu@oss.nxp.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.nxp.com:mid,oss.nxp.com:from_mime,qualcomm.com:email,vger.kernel.org:from_smtp,nxp.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0F3AE6E487C

Add/fix some comments and print statements.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
---
 drivers/pinctrl/nxp/pinctrl-s32cc.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/nxp/pinctrl-s32cc.c b/drivers/pinctrl/nxp/pinctrl-s32cc.c
index 56be6e8d624e..2a32df932d8a 100644
--- a/drivers/pinctrl/nxp/pinctrl-s32cc.c
+++ b/drivers/pinctrl/nxp/pinctrl-s32cc.c
@@ -60,6 +60,12 @@ static u32 get_pin_func(u32 pinmux)
 	return pinmux & GENMASK(3, 0);
 }
 
+/*
+ * struct s32_pinctrl_mem_region - memory region for a set of SIUL2 registers
+ * @map: regmap used for this range
+ * @pin_range: the pins controlled by these registers
+ * @name: name of the current range
+ */
 struct s32_pinctrl_mem_region {
 	struct regmap *map;
 	const struct s32_pin_range *pin_range;
@@ -67,7 +73,7 @@ struct s32_pinctrl_mem_region {
 };
 
 /*
- * Holds pin configuration for GPIO's.
+ * struct gpio_pin_config - holds pin configuration for GPIO's
  * @pin_id: Pin ID for this GPIO
  * @config: Pin settings
  * @list: Linked list entry for each gpio pin
@@ -79,20 +85,22 @@ struct gpio_pin_config {
 };
 
 /*
- * Pad config save/restore for power suspend/resume.
+ * struct s32_pinctrl_context - pad config save/restore for suspend/resume
+ * @pads: saved values for the pards
  */
 struct s32_pinctrl_context {
 	unsigned int *pads;
 };
 
 /*
+ * struct s32_pinctrl - private driver data
  * @dev: a pointer back to containing device
  * @pctl: a pointer to the pinctrl device structure
  * @regions: reserved memory regions with start/end pin
  * @info: structure containing information about the pin
- * @gpio_configs: Saved configurations for GPIO pins
- * @gpiop_configs_lock: lock for the `gpio_configs` list
- * @s32_pinctrl_context: Configuration saved over system sleep
+ * @gpio_configs: saved configurations for GPIO pins
+ * @gpio_configs_lock: lock for the `gpio_configs` list
+ * @saved_context: configuration saved over system sleep
  */
 struct s32_pinctrl {
 	struct device *dev;
@@ -970,7 +978,7 @@ int s32_pinctrl_probe(struct platform_device *pdev,
 					    ipctl);
 	if (IS_ERR(ipctl->pctl))
 		return dev_err_probe(&pdev->dev, PTR_ERR(ipctl->pctl),
-				     "could not register s32 pinctrl driver\n");
+				     "Could not register s32 pinctrl driver\n");
 
 #ifdef CONFIG_PM_SLEEP
 	saved_context = &ipctl->saved_context;
-- 
2.34.1


