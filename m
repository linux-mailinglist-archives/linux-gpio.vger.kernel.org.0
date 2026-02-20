Return-Path: <linux-gpio+bounces-31961-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6OWLKKpsmGn4IAMAu9opvQ
	(envelope-from <linux-gpio+bounces-31961-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 15:16:10 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B95168400
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 15:16:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A79063067586
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 14:15:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFDCD34CFC2;
	Fri, 20 Feb 2026 14:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="gFnKD5yB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011026.outbound.protection.outlook.com [52.101.65.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59DC034CFAD;
	Fri, 20 Feb 2026 14:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771596906; cv=fail; b=d2U7dzkh08W2XXOwxzv7/PGPry9OlDlctMosGpAG/I8LiL660nyPK4t1Wy8bJzVvBtciMuHY1q1szNPsv7pT5yH+52rztnzEx5c3g05OjQJkIcEfYu0DfUfZbKb9QuX20xYiHF5TfFHthoiM0PThcNgzsZGSsVdHxbo/cx24USk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771596906; c=relaxed/simple;
	bh=I9dcSWf48sQM6UjHGijcIFWsOnVNCf3Ob///f6U9pck=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=j/yECqxiCrA7/YpOaSO3uOjih8XEb7WGrQ3hRdLI9Jd2t0YcA6vPCzORrWsy/CQS1hxafe8ACIAWT+tD+ybxWYCMm4r2+qeDRcDZeVk9JljrYYthuQrfNhCWMrljOrBIQSX3LPPv29peQ54juo7oOjkpbU1z2XcUdg2cilaMdP0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=gFnKD5yB; arc=fail smtp.client-ip=52.101.65.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YyFWXDs6D1gMB/PW4BOhmmtM2/pnLZRfpmRlUwdeFcEZoqOFnW9pCgfd+RIygfvGO9OU3AAGvnDFR9B/DwKaFWDEpwrq7wxBnQOa/Ijtoj5Os+7nhdKtRbKavaS6DkbkDi1UJ/Px/grQLcRoKmYtQr1CVgsmQURd3LoonNZVmfd+Lje9+lYWHPWM/dJvAhmWPAMjm69cm0mDqs1sJcR/FmDd3Vqx8DqzC3dPxo1TarXXusCUgqWExMwGix2//LQvHVPz0EBwdnzVnb0LNMSE/xuTdknRAE4JYjZcGONj5t/yAj2RdddyTc3J9TBXp1Df1swburvlo5Av9dBTuGicNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1GXawhFPuCG3s33AeYwWDg3N7Ml1VJJxyeLiD/vivZY=;
 b=b0hhtcCW6k2Qm6qgwPvqvgfbJAQ6doD8OajWN6KNJ5GdQGU5gLrC6/XqrsKaFaZS+frEk386g5t6nO0icUikKWa6b41pEpqUaHHf2wUOa8Wob7uDiZV41tObfszY02LP1/nmFOPPO+ZpzDRl2QHfT3dPQ2ayXmanWbPl+e9+guERLkN2/jMZJW4jp8pOXBfIJ3IzVtY3vhvUiiPG/uqSyv3I3Gh79iOwPRjC5KY6sbX1yALfbrtgKDaJfMn5w6xKSOVk10uk6LwypMUheAXHBXEnxDyUuVJzuPYpQ6LJuA8KFCCmu1OFUtn6Fv9R0qXIrtGz2szsPFOvkzeb/tyg1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1GXawhFPuCG3s33AeYwWDg3N7Ml1VJJxyeLiD/vivZY=;
 b=gFnKD5yB47GaG1bVcPEEdYbk9TiGGt6qd4nMuUCDwTRSmsq3cTo/nXLeQwV6hBBWAkKoA/uTCdAygRhOYdzwnBf/DeOQBBVJjil3tvgH9flfIEe5APfEQVua2HEmdJ6qDoA5bIQaQDs5+pSG+1xQgqW2nZPlfyo5Yqmhbw8IQx9lzA8ITgZDJsFxiPdhqG1TgwCGZJV8XOXxsdNu+xlu4q22nkWIgiqcumihxf3/vVKa7BjeMx4zy+TRNWi5xn+lgsSktXHsA5ZI/im3TFXdCEaF2yRAa27YsxE/eG1MObT1R+gUHpO0uJXSw5rJQiWZ3QRVzfcD99GEVdcn1b4Grw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8190.eurprd04.prod.outlook.com (2603:10a6:102:1bf::23)
 by DUZPR04MB9918.eurprd04.prod.outlook.com (2603:10a6:10:4db::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Fri, 20 Feb
 2026 14:15:01 +0000
Received: from PAXPR04MB8190.eurprd04.prod.outlook.com
 ([fe80::4608:7dcb:899b:e4a1]) by PAXPR04MB8190.eurprd04.prod.outlook.com
 ([fe80::4608:7dcb:899b:e4a1%4]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 14:15:01 +0000
Message-ID: <8a8ea87a-19d7-455b-882e-dac5a17756a0@oss.nxp.com>
Date: Fri, 20 Feb 2026 16:14:55 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 01/10] dt-bindings: mfd: add support for the NXP SIUL2
 module
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
 Larisa Grigore <larisa.grigore@nxp.com>, Lee Jones <lee@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Dong Aisheng <aisheng.dong@nxp.com>,
 Jacky Bai <ping.bai@nxp.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Alberto Ruiz <aruizrui@redhat.com>, Christophe Lizzi <clizzi@redhat.com>,
 devicetree@vger.kernel.org, Enric Balletbo <eballetb@redhat.com>,
 Eric Chanudet <echanude@redhat.com>, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 "Vincent Guittot devicetree @ vger . kernel . org"
 <vincent.guittot@linaro.org>, Rob Herring <robh@kernel.org>
References: <20260120115923.3463866-1-khristineandreea.barbulescu@oss.nxp.com>
 <20260120115923.3463866-2-khristineandreea.barbulescu@oss.nxp.com>
 <20260121021913.GA1704619-robh@kernel.org>
 <e956750b-0333-4465-b37e-5f460b5e092f@oss.nxp.com>
 <9949202e-7eaf-4072-a24c-6119e0eed493@kernel.org>
Content-Language: en-US
From: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
In-Reply-To: <9949202e-7eaf-4072-a24c-6119e0eed493@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR02CA0130.eurprd02.prod.outlook.com
 (2603:10a6:20b:28c::27) To PAXPR04MB8190.eurprd04.prod.outlook.com
 (2603:10a6:102:1bf::23)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8190:EE_|DUZPR04MB9918:EE_
X-MS-Office365-Filtering-Correlation-Id: 43f8ceaa-cafd-4adb-63ba-08de708a6f3c
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|19092799006|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZlZaUTMwNnBTZlFaNUVCY240akZkVFJ2Z2tJaEdhdTBZWi9FL1lCUS9NeE1P?=
 =?utf-8?B?WjRsdXEyODlVSzFuN2RvbHNBVlg5VEdvOXlQOE5qaGtpUW1xNFlzUFNaeWoy?=
 =?utf-8?B?SGg3b0tRMXQ5dVdyT0Z5S09lcFc0YUZYVUEwbVFjZUdzMEZHdFJmTVBHK2lq?=
 =?utf-8?B?dEFxeHZRZkwxMjlqS1A1MDMrVTE1QlNHelNsTzU5V3B0NjE5K0Z4YUVLRzJh?=
 =?utf-8?B?c2JqUDZYczhzQ3NIZVJEUzJveHd6Nm1KekYxelZ0RHhkMXZieGJ4V0lEOVUv?=
 =?utf-8?B?cHA5M2hpYTNEZ0srQWhkTDI1azFMMVowb05tQ1VQbDdBQVplakJtR0FPWGky?=
 =?utf-8?B?WmxPRWdyaW94bksvNElCUjZTMDAvbUg0REwveEYxY2hLZGRsQkdvTVQxa2E3?=
 =?utf-8?B?L3FOai92c2tPcHhNdisrTDUzcVk1RnNEbU5pZlVIbmszdlZqdGRVWnlLVnNp?=
 =?utf-8?B?bUpIOTZVemxlbDFSZVUybk5PY0hrV1JLT1BxMmhBSElDVnFCMzhiYXB5RkZE?=
 =?utf-8?B?OU1OZWdGek9td2lpRFpCTGs5K0xyRTRlQXdrWjF5UE5wN1BudUFZK3ZCclR3?=
 =?utf-8?B?SjNzbFdDZHVCY1lRd2o0Q1l2QlByV0R5eE9KZzNNNFpaUDVabk1oQ2o0YWM0?=
 =?utf-8?B?aWJOUHhPcXBMdXJLQ3dSaGNUcC9xNmk0Ym9KTU96bDlCeU15NEI5RHNubUdB?=
 =?utf-8?B?dVl5SXpSL3RGYTFVOHk5QmhnN3YvbzM0ZG1zdTFRMGRza3RBV3NSbjFaekFN?=
 =?utf-8?B?TkVBY1o2bDNEVmpFckdMUWFBVlpMMTVpS210VExVZGo3bjZaUjJaNHhqeUVT?=
 =?utf-8?B?MVgvdStRcUpYOFdpMUhxVjJnbW91M0hxamRaWnVhZ0d1MzdUZXMxNk9GclpU?=
 =?utf-8?B?Zk5XcGJ6OVBweG4yQzhjWjI1d2hwQytHZTRhN0hkeDBxMU5iOUZWUFlWeW1r?=
 =?utf-8?B?NTNWNnJYck1qdDVIRHJCakxZWnhQMlJOdEJIR1ZSNnVuQVR3ZUdYS2pjNWpY?=
 =?utf-8?B?UVFDTVNWS3ZqK3I2bVlUYlRYWm9EZ2tpWWVHNG9ua0JFZjZhUzdMZWlhQW5z?=
 =?utf-8?B?T1pmMUxZaFZ0dElzOC9naGhyTnYzOHRPNXJsLzZNNi83blhpVlREdWoxeFQ5?=
 =?utf-8?B?ZnJlU1FZY3hOcUkzNU90eHQrNnVlTk8xYnlOUUdTOHdRRXV0WXlwTFlERngy?=
 =?utf-8?B?cUxBZDFGZzlNeEpCb1lYRG4rdlhBeUNWUFp3L3JJM281SUhSdDFTcTI1Rktu?=
 =?utf-8?B?TXViRW4vcmlUWnVKbkNtVUpuazNVRmRwQ1VYaTIwQkRhV05tcU14ZG45YXdO?=
 =?utf-8?B?UWtpUFJRb3RHblozZ0pCb2hpZjJGaXhFMXhIN0pGaEdoRlpRZmpaZW9PdXVJ?=
 =?utf-8?B?M0JVOVJTVzdORXZYNXhJQWRMa1lydW1KMlI2VUhKUjFLcXhBdlRneFEzN1d6?=
 =?utf-8?B?clpTSWtTSnVwdWhVS1NqNjBzS2dtbnp5OFlsRDNpNHUzbWdtU2o1dnRJUGh2?=
 =?utf-8?B?ZXNUSVBFSVgyeXhiQmtkZ3lmTHNpcVVKR1ZDdTB5cUh5ckNGcjNvREhScEdq?=
 =?utf-8?B?NW9GbzZNRHJmWWJUbG9PajZxbnlBbXVoenc0aFlacXJtcFYvckJUVm1LQVZW?=
 =?utf-8?B?MW13Ym1vMXA1bWRkOXZacmdzTm1uMEx2ZTQ0bVArNGx0b2RyWCtkcUY4OExK?=
 =?utf-8?B?aElnVDQvd0k1QmNiS2liQUlNNk5XVU1qRmFpN0s5d0I5N3dKc1JSS0JlTEZH?=
 =?utf-8?B?QlJ2akN3S0dtMytoTkt6ZnF5WXZSOHl0NTlDZkl6WTVJNUxPREo5dGtIdVcy?=
 =?utf-8?B?MTU5cW9JQWFYdnFHcm1yMS8wL01qeWg2cVJYMmE4WDFLV0pYT0p3bDJpajli?=
 =?utf-8?B?N0ZRZUMrVmk5OGdoeXlwMmxxTGdmY3VnVFM2ME5CSjYxbnBpNEZrNytUd2Rt?=
 =?utf-8?B?UDU2SmtiY0FPR0RrL2JkU0xReEQ2MHpPbVl0TDJsa0V4RU1UY3hrZ1BtK3c5?=
 =?utf-8?B?cEpOd1I3MFFLZEJ4UEYrSVRGcE12SnVIdU41d0ozcnVPTDhwUDNMamlmcG8x?=
 =?utf-8?B?T2J6MEYrSmJ0bDRhd201U0lTdCtYWW5zaWFIWTJUZFBGSDZmRVRmUDhWRDg3?=
 =?utf-8?Q?EPHs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8190.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(19092799006)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ejNCb2lNZWJ4K1czK0s5OVo5K0tCNEhqc29rcEkzY0I2WWJJSTN0VnNLbTBM?=
 =?utf-8?B?S1BUL3c5UURnUjgzZWFTQmJmUG5hL2NtV0VFam82TGZ3Zk53WERUSktYWXhm?=
 =?utf-8?B?bDRDSUttZ21TY3Z2RHBtRHpIKysvMjUrdjRaMUVtYjF1NGUvSTJNQkp0blhE?=
 =?utf-8?B?M2VzTzJCM2ExRUhtRjEySnB6dUpDdjhHZjJtRm1GSHJjcENQUXZ2US9TQ0dO?=
 =?utf-8?B?dEVIUE1mYnphRVB5bXliVTFvQkc4YS9kVUZPME90Wi9qRElWSXNTcVlDSXYx?=
 =?utf-8?B?ZFRaaVVaVnJlTTRMQ1MxbTNRamovemNnY0lZa2srTnJyKzJWS2YwZkVuL1RB?=
 =?utf-8?B?ZkU1TXhYMFZPMTVraXJqdHMwK29WYlVJdTNnRlVITTRrWUFNUlc2TVBEY0p5?=
 =?utf-8?B?UndNVjM1MTBSQUUyYW45RFVlS1laN0hrcXQzaWN3a2NDM0JmbUk5b2pyZFYz?=
 =?utf-8?B?VkpCUS9sVkN6R1h1anplWVdzMGZFTEQxWFhVeFp4K2p6L2xPT1ZKS0xHcTJz?=
 =?utf-8?B?bHo1OTBoUzc1WUpMK3Z4V1pZQUVuSU5aaE10OEZ4Q3NCZHo0Z1V2VXhseXM2?=
 =?utf-8?B?bUNoS1VhWE9sNDBWTVlIcGt0ZXRzY3VjWWlwSENBeHZoU1R2bXczeGNJVHEr?=
 =?utf-8?B?TDJKcVZ1YzVQdUphVWpvVzluTmI3TkptZDhoOEt5SEowZWYyZWM2QWwyU29a?=
 =?utf-8?B?eGFwaG9mVzBJcStGYkozdGIyK2dLVENhTVEzWm1PeG9QY3BkYzltbkMyT05t?=
 =?utf-8?B?SjA4aFpXRTk3elVFZjM2dVhvOUwxKzdZWXdGUklMbWR1aUlPQlJQNUo4V2Rw?=
 =?utf-8?B?aEFVL0xyeFBQbUVHNkhqZ1B3YVRaU0RYUEQ3a05uU3k1cFVvdUdqaEttaDhn?=
 =?utf-8?B?anJ3UXNZeWRKYWZzZVJ5SXh3RWVTQXJ3bFJ5NnRRb25ZSjhRYzNRNG8xcFZa?=
 =?utf-8?B?cENrY2U3N3JKS1UzY01RYXV1STlidUc4ZFpoTzg1dmU0eXAxN0RwcE1SbUIy?=
 =?utf-8?B?TTU0UVJEUDFlUW5xMmFPZ3JEMk1JZTBycmJqd0hZbTVudVMvVGVJK0dVdm1n?=
 =?utf-8?B?V2I4Yi80KzRGR1VlNW9rVkp2V2tqQ0toRHZIWUlFL2s4NVRmSFA3Z1ZMRlFX?=
 =?utf-8?B?NjQ3cjROWXY5QlgwaC8ra0ZodDIyTTR4NDdhSTFPb1hFVnZlRnR0OFBTMVZ1?=
 =?utf-8?B?eFlrdi9RbzQ2eFp4Tzhla1dFSmM3WTVLQmR4THJWYkhtRWhiZlpibmVGRnpH?=
 =?utf-8?B?QVZMbzI4aXRuNWhLU2VQWG0xZmREcGVBQVNyWktGZWdablpSa2hSem5jbk9V?=
 =?utf-8?B?cjVXeDNEdFhQZkxWK2xHUUFCY1lkNEVLNmhmU0RGamcycDNzR2kzdVBNYlV5?=
 =?utf-8?B?YUlrOTg1elVLYktVRGZPdjNWRmRwUThuTmR6Rzg1QjYrU1NGWkhPamNaQ05S?=
 =?utf-8?B?ZU8rc3hWWHAvTFVTaWZDOFhSYkkxMDZ4VWJEM1cyUzJWaDV0bzZTTXh2QlQ4?=
 =?utf-8?B?QXdueVpWNVFQV0NZSGtKMmNHN1FUNmtaV0ZwRVBBQ3UxUVR1Ly9YMC8zaVV2?=
 =?utf-8?B?VU5zQWE0aEo2L2dYQ1VvYTdtbDdZd0t5S1hxQU1WNWFJZDBpamwxWTFOSHFm?=
 =?utf-8?B?cmVrQlBTWG9ldEVXWW1xeUNuY1NjTTRkcld2UUtQdHNxR3ljNjFrVHI5NjNR?=
 =?utf-8?B?R1psODE4VTlqaUxNRGg2cnJyQmxkWTFkOWFUeHNoMnJpS1dSVzU1eFpodmFJ?=
 =?utf-8?B?ZFA0RUhFei8vcHhPd3Y0TjRYUE5xWStNUWVWV25xY2U3cjAxTEVhaDJsL0pP?=
 =?utf-8?B?dStqb3NhdkxXRndTYmtjaWVvcHZpenMySVlQbDcxNkQwMS9DWW5FeXdLZHhm?=
 =?utf-8?B?dWRvbUZBL3ZyWENvaXAxSUR1b3h1QTdob0hEaWZDOG8wVTFNNENsWXRBMXpk?=
 =?utf-8?B?UFZFdmp3YnZoUEczNDFCV3VsSUYzdWIzVmlWYWFvY054bUNEUUxwSlEzTG1n?=
 =?utf-8?B?MW8xT2pSNlNtRW9mWHMwMWJwY29oK0hwSDBYNnk5c2cwVGR1NENVTlNkQU5P?=
 =?utf-8?B?UE1URnpqR2Y3d3pkUjdlT0p6a3VzZEJoNUpKSnQ4eklhSmpWZWtyd2tJQnlk?=
 =?utf-8?B?L0ZyQnlRdVV2ZHBJbGRxb2tMbGFnVG1UYlVRaytFZE1mWVhsNzA2Wk9EZnNV?=
 =?utf-8?B?UVgyOTJYVkFYa3hVMDU2TTgwVG8xaVVtMUx5UTRqdWZjdFhrK2dRdS9CTXhU?=
 =?utf-8?B?d0F1NWV4TmI2NVhiQ0VtRkJPOFBKMDVOWmlVTWxnbDRJUy84eUFpSWFLbVkv?=
 =?utf-8?B?bmxRNFQxQmowTlJqQmZpeGZQbjZvbDlYM3lySHVtbWJQMW5vTmpEbUMySko4?=
 =?utf-8?Q?A1n4Ur7pfH1jklfOfqO5VffqAyjYMwGvLbAJr?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43f8ceaa-cafd-4adb-63ba-08de708a6f3c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8190.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 14:15:00.9597
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y3O1rYGig7IS2suWBwvZ1EctA1scXTS6gYm64vLVEAWNnUPbvsD3iux/kWYKhdvG21yUoA4OaBRIwYAns5p9ZlUwZO7kvTahuQiQMmxkHGHKRf+P7Dj7NVkNIr6pQv99
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9918
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31961-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	FREEMAIL_CC(0.00)[linaro.org,bgdev.pl,kernel.org,gmail.com,suse.com,nxp.com,pengutronix.de,linuxfoundation.org,redhat.com,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[khristineandreea.barbulescu@oss.nxp.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	REDIRECTOR_URL(0.00)[aka.ms];
	DBL_BLOCKED_OPENRESOLVER(0.00)[aka.ms:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F0B95168400
X-Rspamd-Action: no action

Hello Krzysztof,

On 2/20/2026 12:18 PM, Krzysztof Kozlowski wrote:
> [You don't often get email from krzk@kernel.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> On 19/02/2026 12:36, Khristine Andreea Barbulescu wrote:
>> Hello Rob,
>>
>> On 1/21/2026 4:19 AM, Rob Herring wrote:
>>> On Tue, Jan 20, 2026 at 01:59:13PM +0200, Khristine Andreea Barbulescu wrote:
>>>> From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
>>>>
> 
> 
> BTW, one more thing, replying one month after the review, which was
> given to you within one day, means entire context is gone, so actually
> we assume that you will agree with the review, not discuss it.
> 
> Otherwise, please wait one more month for our response to your response,
> before you post next version. :/
> 
> Best regards,
> KrzysztofThanks for the review. I’ve recently taken over this patch set
which has a long history and I delayed replies to avoid sending
incomplete or misleading information while I was catching up.
I understand your point about timing and will prioritize replying
if there is anything unclear going forward. Apologies for my delay.

Best regards,
Khristine

