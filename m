Return-Path: <linux-gpio+bounces-12805-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2BB9C3705
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Nov 2024 04:26:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CC47B1C21B5E
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Nov 2024 03:26:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98FBF481D1;
	Mon, 11 Nov 2024 03:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="miH4Bfc5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2102.outbound.protection.outlook.com [40.107.255.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC162595;
	Mon, 11 Nov 2024 03:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.255.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731295593; cv=fail; b=hOO5eo48889u2favnxxhMaPfQkf6WmjDYfXGqn2JPe9fx/Lc5k4qo9/veTP45kPttlEDphe6l693ppzh2saKNVsXJ4GzggJjCv+E8Mz3pFfCkBWe9ZRSt7WtdsV1R2w+ijeydgnEKlNJ0EsdipPfWeoscKv3+P5CiYAzkvDRyOg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731295593; c=relaxed/simple;
	bh=2l75LTFOIKcitdDdplc9c4eV7JRd9iFjbCvAetXQh4w=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Yd/K1uC9NWfoW+Y4EiZ/4FU7foCOwP5g0jr8JPQwwdgSoRhd5aC/I5lN4wUkqRcyUV9y9jK0ZDvv6Wp0pICiLi8/UMX6pi9oIDL+vaBKjgdpXZjaqHZ9y7Ox/RvpaiP5ZlrsJMYL6vCL0mtlW27xbI6yaYynzPzXR0d4z3tEi1Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=miH4Bfc5; arc=fail smtp.client-ip=40.107.255.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DlzFOXLd++2WXPXA1WsZKDeDp909S73+T4E8mAr/XoN8MiQRXV1OlxaM0OjKz1oTfINztXNw5UEuFgY5DuYD+TvopMbC7hEkNRQkhOtWD/K3VjHPBXaO7bikEsLH9Ouk1z1KRX5xbra4fIariA/2DuVVs9xHyA6Ht2b1iIQxEqhQ9dLeKL5JWw2Wy6KNF1RbfyuGTzv3M6N4r4w7bxgP7MHGEcr/4yb2VgV7cHu6La9wg4OUniYag9bpIlcQKJdjjy/o+LA0rBrVNU6KdMkzh4etJh5QgbXeuy3NknjN+uFkBVhSGSaL9zZVcgg2WY7qD9Ksns896uPjYpn7G+8kcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=doP71opKT2b+RKy5tLzcMqFti2lj91TW60BP2cdSHqE=;
 b=KmMxcp24Vxi6HA6SBEd1X5dKT9ua7/vqGENsXJlMc+NdUe8EuD9Gf0de8pLPqV3TuS7HK5wfAj4BJoQtS0IYv5Auzl/I8dIGBWrFPcpoZbXofEgB/cZ4rmLyOaLHS9csmW60G5m7OJtQuu5eVvN+vSLCwI3Y6pTChT+QjgiPSM/QzZxu4TWRFrt9Et1xvNIvdo66/qrzTZqwTgCOoP0uZ/3XVrFHI6tWXgFcZ3LWvas7lK09E3FjPyUVBPbmGBaJASsSiW0l+EdEW61iW7wBZY7gbvO/J4CuQ5cQvm8OEVwtaeEbl+GpOweY/7cmhKo8G49Oy32/qLSopeMC/EN2wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=doP71opKT2b+RKy5tLzcMqFti2lj91TW60BP2cdSHqE=;
 b=miH4Bfc5BxfWuL0bdWtTfBzGo+0QkOe+QUUKbifCeKFJNizWHGqtEDo7MO7HNnOlv69868fBhyeIKtOyyRGCz8cV3Zzb2iWh2lnnV3TnhBf64DZT4IQWiMeLH4L4Fk7/1GP2ZvgFobY+Tx9s6b+h7olxpYvIxzhKq4BFbgxeFbz9RNwEh1yIA2DmF81fDcJPJUrCEBJHhwxiEpNbPDU/5/t7cU3OoK8NIYHcP2vSXScE7noxgEzO9oaJrKrGRfqVHT4i9Mw+MzBfizlu3VlbflxIBWe0RksvhRz7pVTxpMk7gCCzQn47erGN1JpDY8ZlLDMvyubNwtskEUI6upuRPw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by SEYPR03MB7144.apcprd03.prod.outlook.com (2603:1096:101:d9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Mon, 11 Nov
 2024 03:26:17 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123%5]) with mapi id 15.20.8137.018; Mon, 11 Nov 2024
 03:26:15 +0000
Message-ID: <84bbb8b3-d638-47e5-a0e9-371e9e56c89f@amlogic.com>
Date: Mon, 11 Nov 2024 11:26:09 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v4 0/4] Pinctrl: A4: Add pinctrl driver
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20241101-a4_pinctrl-v4-0-efd98edc3ad4@amlogic.com>
 <27aa3716-1d28-4da8-80e6-212d7f94d193@linaro.org>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <27aa3716-1d28-4da8-80e6-212d7f94d193@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR06CA0008.apcprd06.prod.outlook.com
 (2603:1096:4:186::23) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|SEYPR03MB7144:EE_
X-MS-Office365-Filtering-Correlation-Id: fbd6f396-d3cc-406e-87eb-08dd0200993b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Yk05Y0ZiM3J4Sm9IcGUxUFNjcnZVS3N4ajJhYWYvb1B3OWFNZjRWd3FUclVJ?=
 =?utf-8?B?Sm1Fc2xnSldtam5rQ2RUcUpvOHhuVUwvZ0dOeHpnVnVBdWRoWmdDZGlQRlJX?=
 =?utf-8?B?b3NpVTNPYmdoekh6N2dtZzBaZWg3bmQ2cW9vVmVUZkJHbndqMDFBT3JoV0J1?=
 =?utf-8?B?SGRERnp5Rm5IWS8xaklTTHByOWltamY2VVBOWS9HMFVQMTEvRXp4aGU4RURn?=
 =?utf-8?B?QVVXcmsvdnNwcDVBQWJ4dVh0a3UzdGM5bFY2U0gxWk5NU3lZa0tlaWhVTmdx?=
 =?utf-8?B?RUJseDJpOS81WWpXaDRBMjh3emZqQVJ4eE9UY3FSRitmWE9DK2lxa1hvcWEz?=
 =?utf-8?B?QTRBYnV6L1pQQzVqK3kyYW5wbkFPalBITWQ4T3p4SVBaVXowTFR3TUFWR2Zp?=
 =?utf-8?B?ZVpVaGRKSVZkcnE1YXlPN0FlekxZRzBnSU9UL05aU21ramlHN2lYdlgyZ3hq?=
 =?utf-8?B?b2tQWlJ6WXEzUXdVZ09nT1Qvd3ZFMDdzMDBLcDFwaHNUb2V0RGxwQk5CbEZU?=
 =?utf-8?B?dVYyUHBXS3R6R3pteVpsRERwSVUwWHgyNFRod0cyUVpQZURURjlXWEt3bERI?=
 =?utf-8?B?OGpDY0dybjFaTktOaElXQzY1dWJseHdQSU13WlpmVFJ2NkV3bngzd1l4T2d0?=
 =?utf-8?B?VVN0dE1TMFNTZmhhb2RzcnIrKzRoSTFmby8vZUxML1AvQ2FKLzJicU1qZHox?=
 =?utf-8?B?b2FnUUFsTmx1Q0R1WHFQenlqa2dyQWRnN1VjdDlmTWtvaFpNYjNOMGoxVTYz?=
 =?utf-8?B?U243aVZrV2Fod1ZPbCtYNnZKeVNyQWNCSncvRlRoTDRaUTJZR2JBTzgvVmdC?=
 =?utf-8?B?cTdta0lISXFvMWVCbjZhb1FwTU5vNllmamd2MWFEUmhVT2FVZzVONXpTZUhR?=
 =?utf-8?B?NVZ3Z2xpaTF6RWY3cXE0b0M3dXBzeFZyWmMvVFlUWUVENVZXc0FScGh6L3pm?=
 =?utf-8?B?VWRxSldHOFA1VGdpR3FRZDBkVENKRGkrekh0UzR4d25hL0kzRmJHS3Fwd1Jx?=
 =?utf-8?B?c3MySHBHVGJ4cEkvZWYweUM1UEtkcyttSGtXdjF3aGZ6RmRpTmJhRlVFZEl2?=
 =?utf-8?B?T2E0bkVNdjUydC9nVEtSeGNjRnJISjVSMzVnQmg5UUFhV0VWelpEN2UrbVBz?=
 =?utf-8?B?RzVQTUNMVWFuMWtESXY2Rm00aVM2c3hWRjJFeGpDb0NPM2hVckpaU2RyNHAv?=
 =?utf-8?B?QTAvbC9xaldGRHBhNjd2VXRhZUtCVXRMemVoTlowSDlXTEhaTkloV1FROTIv?=
 =?utf-8?B?Q01sbTNVQXZzTm9NOUQwdVVQRmJZczNFQTZGNlJPNkRadkpXM3NQWnV6NVNz?=
 =?utf-8?B?eFlhTjdaQzNjUjhRQzJGMnZtQmU2dDU5VkR0T0dCRGtHMndaRDZqVWl2TXhY?=
 =?utf-8?B?QmRBNlJUdjE2MzJ6ZUpiT3ZacHpzOHBrQXJNZjZTMlVvYWVqaGo5YWhpS0NU?=
 =?utf-8?B?MFJHbi9UUjBGeWczdWxDQ09WOXFvcW5aSDZOUktLcGZOcVFTbGwyNm9PQVo1?=
 =?utf-8?B?N0kzTHRGK3dDeTZ1MFlGbTdJRy9tNFV0Y2J6QlgyWmRUSEViZGVGL2pYNEtP?=
 =?utf-8?B?cXR3ZWdUZ21GUFFxWDlhaURkbFBzcjBUOWxFRXFNMnVUT2RIaHNtd3F5ajVV?=
 =?utf-8?B?N0JMWHlOOXNGMW43eWVoY0RJMkwrbFpRazFtU0MxTVphcmZFSHpjMThMdldX?=
 =?utf-8?B?UEJRRFhhajljNmMwOUNJSExLMloySktVT2x2ODI5V0g1ZnZ2Y3A0aTlJeGll?=
 =?utf-8?Q?1lWf32Ao1LDGWlFgW8cjcLK8hXqfU4QTw904fiL?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VHRndHZpSDNYZk83cC9VQVl4YmJDUGh0OWVFYWpmY29pOUZ6MTZEQzZjaTJQ?=
 =?utf-8?B?WWovSFJZZGk5MU40QkFmaEFSYmhIU05KQUJ0VWhXZE1sT1QxeXdHclJrcXJJ?=
 =?utf-8?B?bjR3TzVYSlpvT241TjFtbU9LcDV6dHhCSCtObk1oL1VEU0JZOExBbm9iN2ZD?=
 =?utf-8?B?VDNVZ01BbmFWai80V09LYWxoUTNLMVFwNW1oVHBHK1RBaUVuOWM0VmJ1YWZK?=
 =?utf-8?B?S1ltNzZ6UXJWL1E2eG1EdzNzTUhjaHQxSXk0TWdMNDUrTTFMc0N5ZW5HQ2ZE?=
 =?utf-8?B?ZmRxamxiTU9USkZDYkdKQWRnV1FQZktWL1ZtK0NYR1RPWFVIeDllbVo5b2xu?=
 =?utf-8?B?eXpYK2tyOHh2SlFyUE5RWlhUbmlsSm5XaXpBU2RFaG1SUU4ydDlGVG92S0VE?=
 =?utf-8?B?RmNwR2ZjenZYV25CS3diWFA3d2hEUVE0eWc4YWZ0Z0M4dEdtTGhIUXBpdEph?=
 =?utf-8?B?N2tDOHJNSHZ4enVHaWg3Rkt1VHFxemswUXFOZldBRU0ySk4zOGhRNG14WmZU?=
 =?utf-8?B?ZE9lTVN4MmhPblhyK0N6YXdWdWZQR3YzSzROaVNkQ3gzWDRRZDN6cWtMYzEr?=
 =?utf-8?B?NitBaVNkb0o1WFRNY21VQVJvZmJoZUFuWTFtWUoxeEl6YW0wcFMrNkhtTFRs?=
 =?utf-8?B?U3hRRkg5aHB2cGlHZXozMWlZKy9STFpFWmkzSGs3QUJuVlV3L21NVGF2aUlW?=
 =?utf-8?B?LzQ3MEZlbXUzUkZOVmNaTWJpWkZFVjEzdFFCRm5tVVc4VW9kYzYwdVZ4SWxw?=
 =?utf-8?B?QVpBSnV2UUNRaU11SzdKVUlTRitVaDR4eFhKcFRMRENsQ1F3YzBrd2plTWty?=
 =?utf-8?B?V0xxMzlibzgycitjN2JObk85bjVoVS82UkxESkx2WmJiMXdXZGlIMldMWm1p?=
 =?utf-8?B?TVhPU0t6UE9BZU8wQkk1OEtIek1XcThpTnkwUlAydk9lOTg4VVg5SXdkdC9Y?=
 =?utf-8?B?UTc4cUZPaWhUYVpnQVYzSDdGU2w2bDNlVmpKU1FuQlEzVUZKSmpHZEVWZ01T?=
 =?utf-8?B?REgxZTBub3Z5RnNmcjdjbTFta1VPN1FOOWVabnBRWUFWUFo4b1RxTm5HRnNt?=
 =?utf-8?B?Y2U2ZXhHQUJGV1FraGdtSDNIRWlJUWJxQ0tpOTFVc3pQb1hrVEh1djhpMndw?=
 =?utf-8?B?UGlpRkFnS1NFQ0lzMTBvcWpRTW8rVDNUcExvMXdWZ3U4UzhVQlBES1JsMU5X?=
 =?utf-8?B?WDFoeE9ua1dlRlA5RGozQmExWUt0WmJqVFJvWFRJTmFnOGd1bGdhbUltQ2dP?=
 =?utf-8?B?ZnF0UFhDajNRa3lVWXQ3YjIvUDk4Vi9ZRXlvTU8xSWhZVFU1R21MWlBEYTVR?=
 =?utf-8?B?ZEQ2WUU1bkxUUFkwQmNnVFlxdlo2a2MvdHgzRFc5NUlmWWpTRE5qam5VeVV4?=
 =?utf-8?B?d2czUFdneDhGVkdIY2htK1JoY0tSdWx3eEF0UHdCeXVJY0duVzVkMWtaM2Z5?=
 =?utf-8?B?ekpkMlVtQk9DeXpVUWNkU3hTdkVhdGpFUVNGUVQ5TWg2T3h3RnVETytQdFhY?=
 =?utf-8?B?VldyMkdaS09XVTE2SzAzejMrSDBaeVFOYldPa2x0RjJHU09FRzRuR2VUY3E3?=
 =?utf-8?B?WDdEYkJqRk1PTEpweUwycFZVbHdmZG5EaGhXT2x0bTY2ZnN1RGVGVXFmZTgz?=
 =?utf-8?B?ZEhxeFlJWWlrZWdxdWFaVk91WlVJdStpMUx0WXl2OW5nLzRvUWx3ZE0vZkhQ?=
 =?utf-8?B?QTk3QjJjajBoS1RJMUU5YXdXK2VlV3ZWbTdwQ1RnT251ZnphWUE0OUxNSmt3?=
 =?utf-8?B?bHNJdzhJdWo1QW5RdTVZM0JtaStTUlp3cVUxU3pyRmdIblV3bi96N2VtbmFq?=
 =?utf-8?B?ZE1kckllcFo0dzgrR0FUWVBxTHdoOXVtVXFBNWg2VGViSkVKaUF1Z1hOYkVK?=
 =?utf-8?B?bXpqUkYybmNyRmZyU1lXcC9FcmxpWlZlTGRJSmhzM3BiVThlWEw0S1U2ak1u?=
 =?utf-8?B?L051a24ySmp5TjZMS09uY0lUT0k1NmpCd1Zic3RpSlFqQ3hpRG1BUE5md1ND?=
 =?utf-8?B?OEdoYmZCVDBEcE0xSGNpbm8rcVRzcjJ6NHJXWkR2WXJ4ZFVuN0tTU0R4UnMr?=
 =?utf-8?B?R05nNHZvMS9GVWtnTjhDTTIvS1pUUkpRZGpqNTVjRU9SMGFXK01najE1R01M?=
 =?utf-8?B?RXlhK0psQ2FPdVpxdFk5dkFKZjJiOFZXMnZzS1RJTzV4UVZGWGdLYUtLb2pn?=
 =?utf-8?B?S2c9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbd6f396-d3cc-406e-87eb-08dd0200993b
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2024 03:26:15.2831
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yZk444e6K1KAV2/maJc6nkx52JnPT3DNRjbhTQdl8lUPKuOu+jHhrudR1gS1ziwY9j2Sunjm6arL3J30QNN4l+IEnH/wUvMUZZQMIWEepPo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7144

Hi Neil,
    Thanks for your reply.

On 2024/11/10 20:24, Neil Armstrong wrote:
> [ EXTERNAL EMAIL ]
> 
> Hi,
> 
> Le 01/11/2024 à 09:27, Xianwei Zhao via B4 Relay a écrit :
>> Add pinctrl driver support for Amloigc A4 SoC
>>
>> I want to find out what kind of solution is feasible to
>> meet the needs of all parties. This RFC verion is one of them.
>>
>> All of Amogic SoCs GPIO device requirement is met here by
>> adding GPIO bank definition instead of the pin definition.
>> Binding header files will no longer be added to future
>> SoCs's pin devices.
>>
>> The pinctrl software only adds insterface of of_xlate to support
>> for transformation without affecting the overall framework and
>> is compatible with previous drivers.
>>
>> The code in DTS file is also readable when using GPIO, as below:
>>
>> reset-gpios = <&gpio AMLOGIC_GPIO(AMLOGIC_GPIO_X, 6) GPIO_ACTIVE_LOW>;
> 
> Fine, but why not use 3 cells instead of this macro ? Since you 
> introduced the
> custom xlate, parsing the 3 cells would be easier that using a macro:
> 
> reset-gpios = <&gpio AMLOGIC_GPIO_X 6 GPIO_ACTIVE_LOW>;
> 
> Neil

I was prepared to do this before, mainly later considering incompatible 
binding, using the original two parameter passing

If use three parameters, I  need to modify the corresponding binding 
property. in file:
Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml

       "#gpio-cells":
         const: 2
It must be compatible with the current number of parameters(3)

> 
>>
>> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
>> ---
>> Changes in v4:
>> - Add interface of of_xlate support.
>> - Add const for some variable.
>> - Link to v3: 
>> https://lore.kernel.org/r/20241018-a4_pinctrl-v3-0-e76fd1cf01d7@amlogic.com
>>
>> Changes in v3:
>> - Remove head file from binding.
>> - Move GPIO define to file *.c.
>> - Link to v2: 
>> https://lore.kernel.org/r/20241014-a4_pinctrl-v2-0-3e74a65c285e@amlogic.com
>>
>> Changes in v2:
>> - Use one marco instead of all pin define.
>> - Add unit name for dts node.
>> - Link to v1: 
>> https://lore.kernel.org/all/20240611-a4_pinctrl-v1-0-dc487b1977b3@amlogic.com/
>>
>> ---
>> Xianwei Zhao (4):
>>        dt-bindings: pinctrl: Add support for Amlogic A4 SoCs
>>        pinctrl: meson: add interface of of_xlate
>>        pinctrl: meson: Add driver support for Amlogic A4 SoCs
>>        arm64: dts: amlogic: a4: add pinctrl node
>>
>>   .../bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml |    2 +
>>   arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi        |   36 +
>>   drivers/pinctrl/meson/Kconfig                      |    6 +
>>   drivers/pinctrl/meson/Makefile                     |    1 +
>>   drivers/pinctrl/meson/pinctrl-amlogic-a4.c         | 1321 
>> ++++++++++++++++++++
>>   drivers/pinctrl/meson/pinctrl-meson.c              |    4 +
>>   drivers/pinctrl/meson/pinctrl-meson.h              |    4 +
>>   include/dt-bindings/gpio/amlogic-gpio.h            |   50 +
>>   8 files changed, 1424 insertions(+)
>> ---
>> base-commit: 58e2d28ed28e5bc8836f8c14df1f94c27c1f9e2f
>> change-id: 20241012-a4_pinctrl-09d1b2a17e47
>>
>> Best regards,
> 

