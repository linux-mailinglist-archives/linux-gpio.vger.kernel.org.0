Return-Path: <linux-gpio+bounces-40068-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UboOLRZcVmr53wAAu9opvQ
	(envelope-from <linux-gpio+bounces-40068-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 17:56:06 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B0B756AFB
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 17:56:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=advantech.com header.s=selector2 header.b=XBfLfaTS;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-40068-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-40068-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=advantech.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 20DBA3079C59
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 15:55:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FC904968FC;
	Tue, 14 Jul 2026 15:55:23 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023110.outbound.protection.outlook.com [52.101.127.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 599E34963D9;
	Tue, 14 Jul 2026 15:55:21 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784044523; cv=fail; b=t7Q198YYzpeTCofK5FoG61EQpVfR3iTC9qV0oJdCSWONdyK968aUalp6R5fWsNHaiDYQ5gWoNpSkXdKGIbgNQIRJx52WpXPBuyeMSbo3NORWU9f6aMifZL0DHLO4uCjujMPQlZfElghCB8yug7ypxIxxWSzT+iKfX+tar3xSP8k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784044523; c=relaxed/simple;
	bh=o3xQb+Kb4nE0n1YarbvAQPCz5oz9H0n4kTID+Qv3PbE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=MPu9g9bpvv7jwMXejrHWhYx5RH7nWlfagPUqjLSK3M+AaNxJN69mE0F4QxjXQHEe1QyVc0IJ2kUNO48ex6jwHf/QAf9RIqTNQWiIVzVyUaqBaKEXN0++FsEoxl+thOGqOQvfdoeIt+CLQEv3W8uWUbMH02UMHUv6l+hRfUv5tp0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=advantech.com; spf=pass smtp.mailfrom=advantech.de; dkim=pass (2048-bit key) header.d=advantech.com header.i=@advantech.com header.b=XBfLfaTS; arc=fail smtp.client-ip=52.101.127.110
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ybOy9YpxExhCxfIunpbX7eQC+WGHbVjWs+amcsokbgpewAJ7d+/gxxnihLkBKHNUzHSOXS8P8os3a2okwNiF4AGTndYKzWY2Gy5UhlaIcQBtTbmFEyPXa8a1y27ttOjlaw9F1fFBUySBuTLF3MeVtv1zqu5tXX/ClBIuNFXoTwKzV4/381INnKocD+dvC0oqu05bzYY2ivOrWO0KCm8W2cZVkkK4k7rC1Ib1upbvoI6KfExXEtorVIDLUG6bffIDfl9etffGGLlYfq7mQ5iq7QeBwZp8y55LfRJe4gcZJbesCwekFH2qiL08z5YBPO5lkNTnUAXPx2kbgFzOTRVBPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hF92Zx0ptTPN5PMTMy0OGCj/V0J9xXzMnxxdC0MJ3+A=;
 b=FtwZSjR0d674qtKx1nMPFzg1vkwJZ6sPkaTs9MmYPx6nqEPUT8uP9I2/XB5qoJP6aCnoQqeKdY7iCg94IQv5WM2uvC+nQoLZYjm6C14ma5l+b6l3aY5VjlLx0tV2tgPq4RDxtw061MfcidwRB6FpEJmvFxkM34YhaHQljKAFY71RC7+h4cJW97XYdnDc9HL6zNeru6jr2Qv/GQuxwG90uYh59mixgjq8ZEbGO5VDzgJtnb1iHWKDptC3iiaSPqZPloFU8f8g6+77MH60026zZrct0TUX5InBTdqF80zVXuLUChzcGIrESvHfGRt4LPcIhCvAjT6CwjsSIe5k8wpQxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=advantech.de; dmarc=pass action=none header.from=advantech.com;
 dkim=pass header.d=advantech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=advantech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hF92Zx0ptTPN5PMTMy0OGCj/V0J9xXzMnxxdC0MJ3+A=;
 b=XBfLfaTSIK/hUtLCLg1meH3mRbA0dOYuWjwENkRSu/HLgY+L3vQLoyZgTjCuaPt+x+YduQE1VfCqUMDDjnQ9DKXwdLpQ0gxWICjRyOgXlsB96xU9zMCq1Tqd0QDKKl/QSoBrSoqjPfCzfiSFerWp3pnUvPWAy8GxZnx1JKBlwv94S1iH13hf5zNQNG/cEvyEYWti+nW5LVZmhAeHhyJVbI47YjbkhiTxc6pT/PHp3CH0c9l6wGRXp3XIsQTkYFyTEgR++UQ++5On2TR5GqBvSi4bqd4yoGQxloinkpWDwP9sqey4RcuUBgRrErtRiY9ZEJhPlRewL2R+CSAmQG/aLQ==
Received: from PSAPR02MB4502.apcprd02.prod.outlook.com (2603:1096:301:21::6)
 by JH0PR02MB6851.apcprd02.prod.outlook.com (2603:1096:990:4d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Tue, 14 Jul
 2026 15:55:16 +0000
Received: from PSAPR02MB4502.apcprd02.prod.outlook.com
 ([fe80::44e6:6433:8000:35aa]) by PSAPR02MB4502.apcprd02.prod.outlook.com
 ([fe80::44e6:6433:8000:35aa%3]) with mapi id 15.21.0202.018; Tue, 14 Jul 2026
 15:55:16 +0000
From: Ramiro Oliveira <ramiro.oliveira@advantech.com>
Date: Tue, 14 Jul 2026 17:54:19 +0200
Subject: [PATCH v2 5/8] Add Advantech EIO Backlight driver
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-upstream-v2-v2-5-76e5e41026db@advantech.com>
References: <20260714-upstream-v2-v2-0-76e5e41026db@advantech.com>
In-Reply-To: <20260714-upstream-v2-v2-0-76e5e41026db@advantech.com>
To: Lee Jones <lee@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Andi Shyti <andi.shyti@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
 linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-i2c@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 linux-pm@vger.kernel.org, Wenkai Chung <wenkai.chung@advantech.com.tw>, 
 Francisco Aragon-Trivino <francisco.aragon-trivino@advantech.com>, 
 Hongzhi Wang <hongzhi.wang@advantech.com>, 
 Mikhail Tsukerman <mikhail.tsukerman@advantech.com>, 
 Thomas Kastner <thomas.kastner@advantech.com>, 
 Ramiro Oliveira <ramiro.oliveira@advantech.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8206;
 i=ramiro.oliveira@advantech.com; h=from:subject:message-id;
 bh=o3xQb+Kb4nE0n1YarbvAQPCz5oz9H0n4kTID+Qv3PbE=;
 b=owEB7QES/pANAwAKAc7t0Ke8vbAJAcsmYgBqVlu4Qpw9ZQVUzW2aEdXdSLkU27l9+rR3TwCe8
 +w0eqXWF5mJAbMEAAEKAB0WIQS1Nkng0ZvJmBKh6GLO7dCnvL2wCQUCalZbuAAKCRDO7dCnvL2w
 CfzfDACYs7c+6KP777EuatLF71DYZOwuZH+Y//4ei5CCZjFp8gUZyWwo1YBLrqsd2MlthUE6RPl
 fZkRKAxAzwP6FnPUrw69M6uV4vD8j5Vvca3JrU1MioeUAi5l9XmxIPNYf8/FWYGEz9SYW0XHZdz
 vAA8Wk/xCTvB89YOb58ELuaisnVEZtP/9YyvS9I9DfFljtoKUVPAkXfPmANH9KTTVOf1lNdGuq7
 vJe541A3f7Ojru8p3HUQOo3WyLHLOKEJOuxlZpVS7JcRQD9VeWBHVNeQ9jl5OC+GSQhVNsc6Vir
 D/osHmk2ssIvUdMGZzehjEUlI/ZwR8q5+mJ4drrA/2y6B6NQJGg7nxdzHkqZuRQIiFTq+FgfQDa
 fEk3NEE8yPHI/4a36CHqrPa7F41ziSZOWlRB81MKJHhcCE/RHmT/EAImsgsRobluwuEf+OG3oZQ
 td993pYlZgCbkFGwN22IbGUrQNMJaxQG+wB0KKgr/AFObtUZK6VsKXtDIO4Nhn9iFhE1s=
X-Developer-Key: i=ramiro.oliveira@advantech.com; a=openpgp;
 fpr=B53649E0D19BC99812A1E862CEEDD0A7BCBDB009
X-ClientProxiedBy: FR2P281CA0086.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::14) To PSAPR02MB4502.apcprd02.prod.outlook.com
 (2603:1096:301:21::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PSAPR02MB4502:EE_|JH0PR02MB6851:EE_
X-MS-Office365-Filtering-Correlation-Id: 04be9ba1-081f-425c-b009-08dee1c04c78
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|23010399003|376014|366016|1800799024|38350700014|921020|56012099006|11063799006|55112099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	uiIhmfHlQy8myR2iwDyeiNrJ9KTzWlrgR6joso4QKaTUpMW/pYp/80I0i1Ubx4RRt9WOB8BJAsTaLyPE0lBvjhwGhGFfdD5p6Eof7tIyCZNMZDmCfQg2gUFkqkw2k5nJYvnqG7xoDmIebzIVgwGLpjb+CnZ+4ZSg5MwP9lymZUbm0n0c4AymuYWZN29tc8hNGwNjBh0NctMJqPwua7kE7rgrrvQFzUet3g+Kz88kILHc990RfeVEqBqM20ahxrapvCOADdvRXP6Zc6OTOhdh5mcdAsYFzi4M43xv58Uw2F7y1aNpuIXyPmGK4zrtaN50tWpORZ62XkbKiv4wTQ0wTeENlS1Wja4dnvm1y5lGq119EGvjMdN8wdiRod1n8JrZwDLY2mNQFYpE5f1lyp7NCKACa2Hc4N2FWE2VLZDFW3RWfDtm+ZKBF1XaJaVrDMtFHvxO8669TnFgDJxS4Pk08ZHEKUSiyLeDxewSVgizUeCd4mfzicxLXmVVna3PaU5LDeuh8cUSHkhjEhqTz9/YGbb4fTUvC5ndZf9u/cUSALdBCi3/l27Y3+roeGsQeAZpGlCRqIYBwAr7meCXCDX4r1Oamhk8keghXzTkw7Z8qySWUWMJx3A8eIbF7fJp+cODgO8bgN1f1b70W1Kj5LpXhu6g+H6tDWmJIqhQ0ZLOZjh25FNRRAFVp06J8SupWGzUWRDo/YtZzZcvR8XqWygRBJAHhOUg0BOufgV930AsRBs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR02MB4502.apcprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(23010399003)(376014)(366016)(1800799024)(38350700014)(921020)(56012099006)(11063799006)(55112099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SnVodHhiYjJiWmc3WktlcS9wOHkrUFJhYXhvdVRyV1RPM09LcjhpNVVocklO?=
 =?utf-8?B?Y2N0ZnhaL0pqRDhMYW1CMThnMkk5M1FHUWZhRTZ2a3JybUJtZmwzWXF6c2to?=
 =?utf-8?B?N3hzY2psYk9vdkRqeW9CTy9BNXBQWjNWMS9aV3huVzRHTkFoZTc0aXk0dU9S?=
 =?utf-8?B?MjE0SFQrbldLSUp1TFJJQ251MTN5d1NtL0l4bDRDdHRWeWk3WE9PTURFMG1W?=
 =?utf-8?B?TmtYWEtESU9hZHVScmlxMUN5RWJvM2E1ellRdlAyeFZmK05nMFRCekJCdHh1?=
 =?utf-8?B?QzN1dFE2cDV5ZDVOTXZQcnN1L2ROVW9JMVVJU2VIeVlZTXNpY3QvS0FxR3l5?=
 =?utf-8?B?R3kyRVBJTHY5d1cwL1JxQXpFTG1PM3BVY2pVSVZqd0pGKzNSWkl4dC9XUmIv?=
 =?utf-8?B?ZmUyd1ZWL0poS1d5Y2lnalNieGxVR3hBRjk2azdxSDV2VW40VFhYcmZ5MGp2?=
 =?utf-8?B?V0Q0RFRIS1JTcXlmQUV2UHFEQ0ZQYWJ5NElaejA1dzZRZmwyQ2VhWkIyU2hs?=
 =?utf-8?B?WjNzK3k5WmtYVmpib2tzeGQwMzQzRGVOQU9LOElTR1p0d055N1FNV3FGdHd6?=
 =?utf-8?B?c2x2cXRlaStJbVNCUVBjNVJZM2szak9LbFNhV25vaklKMTlOQTVlR1NZbVBs?=
 =?utf-8?B?eEtBcG12N1dVbHZQQXFuMGR4R1MrWCtvWnVWWXQyQ1pRSVV3Z1ZpVWVLQ2ZN?=
 =?utf-8?B?N0pYU2VaQ2ZqWUJ1VExOTHg1dFlDaVNPbDJNUnBNT2F5bnlVTjFRd2VoVHdZ?=
 =?utf-8?B?ZXBJVEwzVXl6WTA4N1ZxbGc5WWoxWHB3NTJjam9RZzZkNXFFd0ZDN3pYQnp4?=
 =?utf-8?B?VTRMeDlsbGlrYTdyanJnclA2SWg2K0hTcjZwRXdHWlhsM1YremdlQzQ0eGoy?=
 =?utf-8?B?RlRmRkRHWVRPbVk1WmVBSkFZaEhyY3d4c3NVaUxvajRNVnh0ZFM2MjQ1TzY5?=
 =?utf-8?B?NXdyNmZSYkdNb3ZmTWcrQmJpVG5zNHpNcHdlWjFXOWRFN0xhNE4xVVVEYkNq?=
 =?utf-8?B?eEt6azN5U21NT1cyRFEzclAzQkx4V1VkU1BoOFlVSWZQNDdxMGVnQS80MDBS?=
 =?utf-8?B?M3JITmdFM2EyMkZiM2xEdVcwMjNRTjNvY1A3SVNTc0NDcGJzdTRHM2NCUy9k?=
 =?utf-8?B?cUcybHpiNWJFa0hzLzVvS0ZOc1Ztd29CYnNmV2tpaG5EKzBhSGpiRTFTN0Jo?=
 =?utf-8?B?V200UmowRWN6cE1IVUg4LzcyVWlFZ0dDMmZMdzdyMDZtOFdYU0FTYisvSTY2?=
 =?utf-8?B?TCtXVnp1WGFpcDBML2xqWXB6dm9qQW9SUXVNaTJobGQveWdOVFMwSVFiZDI5?=
 =?utf-8?B?UFNtYmdOdzRCTnZNM2ZYbnpyTEtrNUJBeTFmQmZUMnRKbFp5SGN5M2lkWmto?=
 =?utf-8?B?QUdLczVsYXJHT24ya1ZWcmNmT3BlckUwVmdFVU1haEd6dndRb3NteDVrT2dY?=
 =?utf-8?B?SVRiQXJUVlIxaDJTVEZuVlRLa0FXeS9Od2M3Wm5pUzJYeVhNaXJJL29KVWxo?=
 =?utf-8?B?VElFMitSUHpqOHhtSXpMbU9CQWtyL2wrUVZ1S0RtbkdZR2pXSm1YVVZacVdL?=
 =?utf-8?B?Wjc1VzRoL21nTzdRS2Mwci9JYzh6WmtzVUpYNms3dXgwQms3V0twU1VScklD?=
 =?utf-8?B?MmtDeEhsOFhFdldrYk1NVTN1cVphR0c2UjVtazV0WEE4MEV4bjhKcGFsMlY2?=
 =?utf-8?B?NnFPYkV2aHJpSkltYnV5UVdKNFlwcEoxTnNNSHROQ2MvWG1pLzFKOUc1cVpS?=
 =?utf-8?B?QlNJSXlHKzJucGJ3U0c0Y0c4ZStLWHZ4aTV5QlpuOW5KUHo2eVlkMDA1UlZ0?=
 =?utf-8?B?NUsxTE5SU3dFZWZvYVhpdEFrRHFYN2VnaG9TbGRnRDZyc3o5NVpxYUlNczNU?=
 =?utf-8?B?RTI5NlRJMklWS1Fwa3pEZG1hZHpjQlV0MitjaVRhRTRYVWFiWFdVU3dWdVdE?=
 =?utf-8?B?bHZtVmZHUlIxUlBybFArNFlVT3FSYkoxWXpBTVVYUTJEcDJhWjRGU3RxaDM1?=
 =?utf-8?B?RWZNMUlzN0w5OVpyekh4RDFidUZXK3UvS05OZGozbi8zcGZmZGJobUVVSDl2?=
 =?utf-8?B?Tm1DYTRMSzZOOENHSEhDRkZQYU9FRUZzOWtjb1I1UXErRXRsWTlycGZ0SzYw?=
 =?utf-8?B?cFNTZ0ViQ0dXSWs2UXpVOVh2SnRMbVlEb1ErT3B3akwrNHE2Y01VOXJHRVdj?=
 =?utf-8?B?YW9NTjlEVEg4R2JSU1NPNXN1d3dQTk1taU1sL25DVktrQ2xybkJMZWwxKytM?=
 =?utf-8?B?WUtTZHZIZnpnVHVaYmt3OEtrTTBZZ2NoYlJVMW9HRlcvQlNCSmkrOW0zUGM2?=
 =?utf-8?B?MFRvUGYwOW1nZnhiMFRDVmxwT3BVL3hGUDZoMEV1QnRjbkplaGZ5c0VMWUZK?=
 =?utf-8?Q?cqBNUgar3C43EyF4=3D?=
X-OriginatorOrg: advantech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04be9ba1-081f-425c-b009-08dee1c04c78
X-MS-Exchange-CrossTenant-AuthSource: PSAPR02MB4502.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 15:55:16.7486
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a77d40d9-dcba-4dda-b571-5f18e6da853f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A1dEubcnqGNG76Lx5Ryv8RPcY3OI1BiP2ozTxyOyLkqfMVbA+j4UClWr+wpAYIBYhVh+LWRWbRMQF1sqaIUU90JHsSFiMdbF18bz/0ioSok=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR02MB6851
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[advantech.com,quarantine];
	R_DKIM_ALLOW(-0.20)[advantech.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-40068-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:linux@roeck-us.net,m:andi.shyti@kernel.org,m:danielt@kernel.org,m:jingoohan1@gmail.com,m:deller@gmx.de,m:wim@linux-watchdog.org,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:rui.zhang@intel.com,m:lukasz.luba@arm.com,m:linux-kernel@vger.kernel.org,m:mfd@lists.linux.dev,m:linux-gpio@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-fbdev@vger.kernel.org,m:linux-watchdog@vger.kernel.org,m:linux-pm@vger.kernel.org,m:wenkai.chung@advantech.com.tw,m:francisco.aragon-trivino@advantech.com,m:hongzhi.wang@advantech.com,m:mikhail.tsukerman@advantech.com,m:thomas.kastner@advantech.com,m:ramiro.oliveira@advantech.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,roeck-us.net,gmail.com,gmx.de,linux-watchdog.org,intel.com,arm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ramiro.oliveira@advantech.com,linux-gpio@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ramiro.oliveira@advantech.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[advantech.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,advantech.com.tw:email,advantech.com:from_mime,advantech.com:mid,advantech.com:email,advantech.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 22B0B756AFB

This driver controls the Video Backlight block of the Advantech EIO chip.

Signed-off-by: Ramiro Oliveira <ramiro.oliveira@advantech.com>
---
 MAINTAINERS                      |   1 +
 drivers/video/backlight/Kconfig  |   6 +
 drivers/video/backlight/Makefile |   1 +
 drivers/video/backlight/eio_bl.c | 243 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 251 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e228d12a2326..d2d7d815ed44 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -616,6 +616,7 @@ F:	drivers/gpio/gpio-eio.c
 F:	drivers/hwmon/eio-hwmon.c
 F:	drivers/i2c/busses/i2c-eio.c
 F:	drivers/mfd/eio_core.c
+F:	drivers/video/backlight/eio_bl.c
 F:	include/linux/mfd/eio.h
 
 ADVANTECH SWBTN DRIVER
diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
index 7c66b8840d88..a5559a7db75d 100644
--- a/drivers/video/backlight/Kconfig
+++ b/drivers/video/backlight/Kconfig
@@ -522,6 +522,12 @@ config BACKLIGHT_RAVE_SP
 	help
 	  Support for backlight control on RAVE SP device.
 
+config BACKLIGHT_EIO
+	tristate "Advantech EIO Backlight"
+	depends on MFD_EIO && BACKLIGHT_CLASS_DEVICE
+	help
+	  Backlight driver for Advantech EIO.
+
 config BACKLIGHT_LED
 	tristate "Generic LED based Backlight Driver"
 	depends on LEDS_CLASS && OF
diff --git a/drivers/video/backlight/Makefile b/drivers/video/backlight/Makefile
index 34469711c6cd..724246242526 100644
--- a/drivers/video/backlight/Makefile
+++ b/drivers/video/backlight/Makefile
@@ -31,6 +31,7 @@ obj-$(CONFIG_BACKLIGHT_CGBC)		+= cgbc_bl.o
 obj-$(CONFIG_BACKLIGHT_CLASS_DEVICE)	+= backlight.o
 obj-$(CONFIG_BACKLIGHT_DA903X)		+= da903x_bl.o
 obj-$(CONFIG_BACKLIGHT_DA9052)		+= da9052_bl.o
+obj-$(CONFIG_BACKLIGHT_EIO)		+= eio_bl.o
 obj-$(CONFIG_BACKLIGHT_EP93XX)		+= ep93xx_bl.o
 obj-$(CONFIG_BACKLIGHT_GPIO)		+= gpio_backlight.o
 obj-$(CONFIG_BACKLIGHT_HP680)		+= hp680_bl.o
diff --git a/drivers/video/backlight/eio_bl.c b/drivers/video/backlight/eio_bl.c
new file mode 100644
index 000000000000..c2826400de45
--- /dev/null
+++ b/drivers/video/backlight/eio_bl.c
@@ -0,0 +1,243 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Backlight driver for Advantech EIO Embedded controller.
+ *
+ * Copyright (C) 2025 Advantech Corporation. All rights reserved.
+ */
+
+#include <linux/backlight.h>
+#include <linux/errno.h>
+#include <linux/mfd/core.h>
+#include <linux/mfd/eio.h>
+#include <linux/module.h>
+#include <linux/uaccess.h>
+
+#define PMC_BL_WRITE		0x20
+#define PMC_BL_READ		0x21
+
+#define BL_CTRL_STATUS		0x00
+#define BL_CTRL_ENABLE		0x12
+#define BL_CTRL_ENABLE_INVERT	0x13
+#define BL_CTRL_DUTY		0x14
+#define BL_CTRL_INVERT		0x15
+#define BL_CTRL_FREQ		0x16
+
+#define BL_MAX			2
+
+#define BL_STATUS_AVAIL		0x01
+#define BL_ENABLE_OFF		0x00
+#define BL_ENABLE_ON		0x01
+#define BL_ENABLE_AUTO		BIT(1)
+
+#define USE_DEFAULT		-1
+#define THERMAL_MAX		100
+
+static uint bri_freq = USE_DEFAULT;
+module_param(bri_freq, uint, 0444);
+MODULE_PARM_DESC(bri_freq, "Setup backlight PWM frequency.\n");
+
+static int bri_invert = USE_DEFAULT;
+module_param(bri_invert, int, 0444);
+MODULE_PARM_DESC(bri_invert, "Setup backlight PWM polarity.\n");
+
+static int bl_power_invert = USE_DEFAULT;
+module_param(bl_power_invert, int, 0444);
+MODULE_PARM_DESC(bl_power_invert, "Setup backlight enable pin polarity.\n");
+
+struct eio_bl_dev {
+	struct device *mfd;
+	u8 id;
+};
+
+static int pmc_write(struct device *mfd, u8 ctrl, u8 dev_id, void *data)
+{
+	struct pmc_op op = {
+		.cmd       = PMC_BL_WRITE,
+		.control   = ctrl,
+		.device_id = dev_id,
+		.payload   = (u8 *)data,
+		.size      = (ctrl == BL_CTRL_FREQ) ? 4 : 1,
+	};
+
+	return eio_core_pmc_operation(mfd, &op);
+}
+
+static int pmc_read(struct device *mfd, u8 ctrl, u8 dev_id, void *data)
+{
+	struct pmc_op op = {
+		.cmd       = PMC_BL_READ,
+		.control   = ctrl,
+		.device_id = dev_id,
+		.payload   = (u8 *)data,
+		.size      = (ctrl == BL_CTRL_FREQ) ? 4 : 1,
+	};
+
+	return eio_core_pmc_operation(mfd, &op);
+}
+
+static int bl_update_status(struct backlight_device *bl)
+{
+	struct eio_bl_dev *eio_bl = bl_get_data(bl);
+	u8 duty = clamp_val(backlight_get_brightness(bl), 0, THERMAL_MAX);
+	u8 sw = backlight_is_blank(bl);
+	int ret;
+
+	/* Setup PWM duty */
+	ret = pmc_write(eio_bl->mfd, BL_CTRL_DUTY, eio_bl->id, &duty);
+	if (ret)
+		return ret;
+
+	/* Setup backlight enable pin */
+	return pmc_write(eio_bl->mfd, BL_CTRL_ENABLE, eio_bl->id, &sw);
+}
+
+static int bl_get_brightness(struct backlight_device *bl)
+{
+	struct eio_bl_dev *eio_bl = bl_get_data(bl);
+	u8 duty = 0;
+	int ret;
+
+	ret = pmc_read(eio_bl->mfd, BL_CTRL_DUTY, eio_bl->id, &duty);
+
+	if (ret)
+		return ret;
+
+	return duty;
+}
+
+static const struct backlight_ops bl_ops = {
+	.get_brightness = bl_get_brightness,
+	.update_status	= bl_update_status,
+	.options	= BL_CORE_SUSPENDRESUME,
+};
+
+static int bl_init(struct device *dev, int id,
+		   struct backlight_properties *props)
+{
+	int ret;
+	u8 enabled = 0;
+	u8 status = 0;
+
+	/* Check EC-supported backlight */
+	ret = pmc_read(dev, BL_CTRL_STATUS, id, &status);
+	if (ret)
+		return ret;
+
+	if (!(status & BL_STATUS_AVAIL)) {
+		dev_dbg(dev, "eio_bl%d hardware report disabled.\n", id);
+		return -ENODEV;
+	}
+
+	ret = pmc_read(dev, BL_CTRL_DUTY, id, &props->brightness);
+	if (ret)
+		return ret;
+
+	/* Invert PWM */
+	if (bri_invert > USE_DEFAULT) {
+		ret = pmc_write(dev, BL_CTRL_INVERT, id, &bri_invert);
+		if (ret)
+			return ret;
+	}
+
+	ret = pmc_read(dev, BL_CTRL_INVERT, id, &bri_invert);
+	if (ret)
+		return ret;
+
+	if (bri_freq != USE_DEFAULT) {
+		ret = pmc_write(dev, BL_CTRL_FREQ, id, &bri_freq);
+		if (ret)
+			return ret;
+	}
+
+	ret = pmc_read(dev, BL_CTRL_FREQ, id, &bri_freq);
+	if (ret)
+		return ret;
+
+	if (bl_power_invert >= USE_DEFAULT) {
+		ret = pmc_write(dev, BL_CTRL_ENABLE_INVERT, id, &bl_power_invert);
+		if (ret)
+			return ret;
+	}
+
+	ret = pmc_read(dev, BL_CTRL_ENABLE_INVERT, id, &bl_power_invert);
+	if (ret)
+		return ret;
+
+	/* Read power state */
+	ret = pmc_read(dev, BL_CTRL_ENABLE, id, &enabled);
+	if (ret)
+		return ret;
+
+	props->power = enabled ? BACKLIGHT_POWER_OFF : BACKLIGHT_POWER_ON;
+
+	return 0;
+}
+
+static int bl_probe(struct platform_device *pdev)
+{
+	u8 id;
+	int ret;
+	struct device *dev = &pdev->dev;
+	struct eio_dev *eio_dev = dev_get_drvdata(dev->parent);
+
+	if (!eio_dev) {
+		dev_err(dev, "eio_core not present\n");
+		return -ENODEV;
+	}
+
+	for (id = 0; id < BL_MAX; id++) {
+		char name[32];
+		struct backlight_properties props;
+		struct eio_bl_dev *eio_bl;
+		struct backlight_device *bl;
+
+		memset(&props, 0, sizeof(props));
+		props.type           = BACKLIGHT_RAW;
+		props.max_brightness = THERMAL_MAX;
+		props.power          = BACKLIGHT_POWER_OFF;
+		props.brightness     = props.max_brightness;
+		props.scale	     = BACKLIGHT_SCALE_NON_LINEAR;
+
+		eio_bl = devm_kzalloc(dev, sizeof(*eio_bl), GFP_KERNEL);
+		if (!eio_bl)
+			return -ENOMEM;
+
+		eio_bl->mfd = dev->parent;
+		eio_bl->id  = id;
+
+		ret = bl_init(eio_bl->mfd, id, &props);
+		if (ret) {
+			dev_info(dev, "%d No Backlight %u enabled!\n", ret, id);
+			continue;
+		}
+
+		snprintf(name, sizeof(name), "%s%u", pdev->name, id);
+
+		bl = devm_backlight_device_register(dev, name, dev, eio_bl,
+						    &bl_ops, &props);
+
+		if (IS_ERR(bl)) {
+			ret = PTR_ERR(bl);
+			if (ret == -EPROBE_DEFER)
+				return ret;
+
+			dev_err(dev, "register %s failed: %d\n", name, ret);
+			continue;
+		}
+	}
+	return ret;
+}
+
+static struct platform_driver bl_driver = {
+	.probe  = bl_probe,
+	.driver = {
+		.name = "eio_bl",
+	},
+};
+
+module_platform_driver(bl_driver);
+
+MODULE_AUTHOR("Wenkai Chung <wenkai.chung@advantech.com.tw>");
+MODULE_AUTHOR("Ramiro Oliveira <ramiro.oliveira@advantech.com>");
+MODULE_DESCRIPTION("Backlight driver for Advantech EIO embedded controller");
+MODULE_LICENSE("GPL");

-- 
2.43.0


