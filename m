Return-Path: <linux-gpio+bounces-22179-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B990AE802C
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 12:50:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D8A607B6F77
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 10:48:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CD892D12EC;
	Wed, 25 Jun 2025 10:46:41 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023113.outbound.protection.outlook.com [40.107.44.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B883595D;
	Wed, 25 Jun 2025 10:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.113
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750848401; cv=fail; b=LFc/OjmolOJjihHYsNKkoRsEdAh9pg7Lsu6UDh322tSLsbtr3WJfUxRuwq6dTAVYa52sZ40Sw0V3QYHtyrFAN7+1DxT//nkxr+yYrmmHVhybg6/smr7dwhRiq6LLswuOfBet7enZJNo1BSNS2vINywa0LrksV1isvWbklXOlfuc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750848401; c=relaxed/simple;
	bh=VIhFaDMEsOzG+Zzt9T6H00c8rvTUodQyBzBM87uqQsk=;
	h=Message-ID:Date:Cc:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BvYZj8fT6rTPm922iCFho+cT7tzGZQzd8qnbGQx/HGlnuXbNyVqHqUQ3rsZvF3aA0UK7WcmNHMqFV8SDzQaqGolRhx/ujoYHVng1CJ+iRB8qenKC4gTT9Ke+ghxU1tqNlmLtlI/0S2nh4GLU6HmTdMzVC3UC0Eu99kgC453PZHI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com; spf=pass smtp.mailfrom=linumiz.com; arc=fail smtp.client-ip=40.107.44.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linumiz.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z/cVZD6gzyIwtypCOXQkkw9s5n+GFOtbrS3SevyInf3XFbgGHKEKiM9HZClvWYa3O10n9D7ETXpuD9ZjdJGHWCKGiiK3PISWKJ2cLlF+BJQptNgQJ6dUBy4S/fAs8btNM8KHuwKcSC3+MoTdGGx4W61clHcBAZOTZ7NOYUi991wpsrff8iSc7QOfUM9FEKfnZwCTXkYzqES5BMM4b1Dm+8gJNbeKzEAm2GM9/pmTDzaKEEFGlUlQy7jXNsMvTWynoX1m61W/dB+w3ltXlX0NqRnHEJht2p/CXFKYKLimHIMN82aGL4XWm5J8AFHzoEh/WZOxxuUOsji19Li9OhCsIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6GPayLFeyFy8AGSQx8pyFGX30ykYr+8hUzqZ3P9JXbE=;
 b=QVNKoCq0/YvYLmuALkdEfTcSqQuTfGSPmggsfTByf+/49agovAoLMkiYJlnI+nwFuMj2NAwfZrVpxSh+9uQs6djQfUFSLpDovOC95qzPhNcO0REgiMOsm80mJeM65gqmxbPmxIeCo3FErQw3BXvudpzV7M0Csm9aVxJUcBmtBPjjUDN2drlbTdQcnKlKLEu7EgI0BnBf6rFX/nhSC8B1eF7s6LYXSdAdPo/z7UohSCxVAubpAe8kqmIZuCoRWD2Vk5Gn/VA1PQA8hZ+fc57UKBFwRQowlNSmasVlTTda61uPNqP4GDsT9Zx0p4VnmhZXMrTg8OuGHiHfs+Kj0BfBGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=linumiz.com; dmarc=pass action=none header.from=linumiz.com;
 dkim=pass header.d=linumiz.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=linumiz.com;
Received: from TYZPR06MB6935.apcprd06.prod.outlook.com (2603:1096:405:3c::9)
 by SEYPR06MB5062.apcprd06.prod.outlook.com (2603:1096:101:53::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Wed, 25 Jun
 2025 10:46:35 +0000
Received: from TYZPR06MB6935.apcprd06.prod.outlook.com
 ([fe80::9e42:3253:9a2e:b565]) by TYZPR06MB6935.apcprd06.prod.outlook.com
 ([fe80::9e42:3253:9a2e:b565%7]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 10:46:35 +0000
Message-ID: <802387ec-31a9-446c-8f90-c81a7345410f@linumiz.com>
Date: Wed, 25 Jun 2025 16:16:29 +0530
User-Agent: Mozilla Thunderbird
Cc: parthiban@linumiz.com, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH 10/22] pinctrl: sunxi: add missed lvds pins for a100/a133
To: Paul Kocialkowski <paulk@sys-base.io>
References: <20241227-a133-display-support-v1-0-13b52f71fb14@linumiz.com>
 <20241227-a133-display-support-v1-10-13b52f71fb14@linumiz.com>
 <aFu3fAMa8KPwjPbX@shepard> <9c3ea5fb-a045-46bd-9753-26ffa67fe1bc@linumiz.com>
 <aFvLO6GUY6NezkcF@shepard>
Content-Language: en-US
From: Parthiban <parthiban@linumiz.com>
Organization: Linumiz
In-Reply-To: <aFvLO6GUY6NezkcF@shepard>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MAXP287CA0019.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::28) To TYZPR06MB6935.apcprd06.prod.outlook.com
 (2603:1096:405:3c::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB6935:EE_|SEYPR06MB5062:EE_
X-MS-Office365-Filtering-Correlation-Id: 087bdfa2-66d1-4c7c-9a24-08ddb3d58e21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?STJlZXVuMFdLTURsVnpYRHhWMmNOMnMxNitLMkZZUnRONUhWYVVIWVV1elE5?=
 =?utf-8?B?eUdOMmdiZ0QzNmtjYmwwY2JjMjRlR0pRSTJGSUxUWW9jdG02bGViUHVPbVEr?=
 =?utf-8?B?d1pBeFVENGFTRWxLR1dJdVZGUjRIZ3pFWDZTelBGNHJJS1RYNkd0Mmg2Tys0?=
 =?utf-8?B?STk2SmxMWnlhSmxDenVJS2V0R2dPclZrcElnQlpFM0lBdnZuV1dXT0hKTHlM?=
 =?utf-8?B?NC9tazF1NGNsWjlvZ3RtcDRuQ0VqWGx4Z1R0Y2FRVXROMEx5Wi95dXE1L0RI?=
 =?utf-8?B?eFBDalBTWHFKWjg4ejdhaWVTNXJPQmlTWHl2NWdibktjbExEaTl1TW1KY3FP?=
 =?utf-8?B?MnBkV3cwcHRkbnJXeGx6QmRjOTZQSmJUVXMwbUhQYS9RZmppanZMVTMrSG9w?=
 =?utf-8?B?OTVtWjd4WUtsSkxTejRqSEkrL0NKWVJHQjhWVkJUUTA2TnV1ZUI2U0VCSmtt?=
 =?utf-8?B?VW95Nmg4d1B3TkgzbFdFM28xZXd4SEdtcmcvU2JralZ0UkVDNyt2czBDNWs1?=
 =?utf-8?B?NnliTmNPM3hvYTFzTmdseC9wekUya0pETnFqcnAvbkhxNWJFU3hRZTlGVC9B?=
 =?utf-8?B?cGJTaFdhaitWcVZLY3hsN2VsYkNzY013ZkY2WnUweDRibGtFODRrekpOSVlw?=
 =?utf-8?B?T0YxRTVWK3NoSTl5eGxXNGNrdjhtOHltV3pTRy9xdHdpeVlSMEVXQmpxelNu?=
 =?utf-8?B?aFk3cnhsU3FLQXRJaDNoOFdVakV0WWZERXJ0ZUYrS3JwK28wUnpHRll0aHgz?=
 =?utf-8?B?Y04wZDFaTHNlODdmQnRoZk5tSk1kbWN2Uk5hZVRzandpUnlHWVdFYWswWmVo?=
 =?utf-8?B?d25yZzNpV3JwdEdjQ1NaRDhwVzMrNTZzYys4VXdvRVdXdGZqbDVSczAzL0Va?=
 =?utf-8?B?ckIvTlF6N3hwNFBhWUZubEFDMGplaVJ3L2E5SVQzbDFiNmpvNGJya2pHcVBD?=
 =?utf-8?B?dE9CWkJGWUFpNWNyR3daZGtwWGwwOG5rUklLSU1NQ2VLejhXWERZK29Cc3RW?=
 =?utf-8?B?YmFqL0wrbHkwSytLMzhKSEVKRlVObTd5N0YvZUhOU0FDT3NPMXlwWTJlUUkr?=
 =?utf-8?B?dCtFeGwrMHZhTXlnNzJsZFVIWVM4YURvMzdUNzJXT1JYQm1wVHk5WnVROWM0?=
 =?utf-8?B?YkpFR01RQWNUbWV1Si9HelVEUDRHOW9VNXQyM2dYTVhCYzVzSWROcTRyY2o0?=
 =?utf-8?B?cGlHQ2d4WnhBODYxaFV2b3J5U1MzN3ZKbFlkdkNuRGZDdUFOVUlXWGFMNEhh?=
 =?utf-8?B?UXlWQzZKMFdCTVQvckhmeDlZaU1raHBySXh5N3NLeE9YbUFzZG1BdEQ5Ti9n?=
 =?utf-8?B?NE84YTRmUW82QmN1OStpY2wrdUlJbmpqNytiYTFyVjRNNW1pNGJyeng0WkxQ?=
 =?utf-8?B?bTcvalJwajZESDR3dWRLNkNIV1BPck8yS0E0WHVKTGxZL1NRemozb2I0Vnd6?=
 =?utf-8?B?RzJFLzRac3FjMkp2TWJvdDRiQUtUMVJvbHlyUkJtTURveXFQVkRnSGJsbnZt?=
 =?utf-8?B?YzZQYTBkSjJieHIwQXEvRERVTURFZ0RPWWxyay82MmxPNGs4MXR4eWMvbTJU?=
 =?utf-8?B?RkUwREZrbHl1SXdqVXFZUDN5bU92K0dXZEpkMWoyZHk2UTlMV3ZqVXZpTjAy?=
 =?utf-8?B?QUdFS1owQXN0ZGVsQmN5MlpZOUhuVUxraDBwWFF4RUo3eDFkaHlyeHVSbFJM?=
 =?utf-8?B?aTI3emltRmJHRFVhRzZzWUt5eDFTY2VQOE41MnpxS3hLTlFXcmU2ZzZHdzkr?=
 =?utf-8?B?R1Ixam16bXhJZFF1bXFtT2tkV29taVFvMVJDQ1d2YTlxdzl4bVpMVTQ1QUN2?=
 =?utf-8?Q?/ClRGQWA7rCvPOznI5ahRSFc8pwNI2etKYmFU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB6935.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YUpNaWlYV1hIWXM4SU5jRGl6NVBsOGRWalNsTEpYTVFJaUlSMW9NWXQzcTNF?=
 =?utf-8?B?NTJRMm9FM0VNQzBsb1R5eUdhbitPMXNJdHBDNUpYM1oreEJ0bHdLU3hRZnFm?=
 =?utf-8?B?M1ZIN2lzQ3hLTnEybFlScDZuaE9HZnpiR1B2UnRJc3FZZ2g4VU9ubVlqVTRV?=
 =?utf-8?B?ZitYdHRLK01oOWY2ZGlJdjVxK1F3d3hrTjYyVldMZ2hLOUk0bkZkNzBUYjR4?=
 =?utf-8?B?WXkrTG0wSkRFSm84eFBkbFhqWXpzYnZVREhYY1dYalQrVG1sWkFCeHFvMXJI?=
 =?utf-8?B?QTFYTTlPODN6K3ZXL2FWU2k5bi96OW0xV2U0RjhQbVpjN0JiYUNHMzhHVDhs?=
 =?utf-8?B?L1U5a1JFdEd5Rk9BeURFY1g0c01SaUxRTUYyNFdoT1BER0VTcFZhT2lSeGlI?=
 =?utf-8?B?ODBnNk1jZ1UzU1lBRkpzd2lwMzB2Z0ovU1NpdGwyNUVqVUdVV1VKVldiQmdz?=
 =?utf-8?B?WXp0eHlNc3NzY002aGUrWTkxeHV1SWgyQUdaMWsvY210ZDE0cVg1V29UR1dh?=
 =?utf-8?B?MkJKd01XS2Y1SVZOdTQxYTZvZ2hDbHJoczRoSk1scThWT3lWUXVTR1d0RjRN?=
 =?utf-8?B?RFFtb09waDRBbkRPQzBtMGNJUzJJS1NJZTlSalY2M3lHUjNzb2c3TW5idnRX?=
 =?utf-8?B?SDg2M2J5bTFIRHpPYnJwdjRNS2hnVUVEYzhhbFM2Z3JEV29JUFNhNmdKOGk1?=
 =?utf-8?B?Y1lvK3VZdi9FclZYckg1dXdIQjZFbmdUTzNFSDZqT2RyT09Ycjd5ZXhsTG9u?=
 =?utf-8?B?QWpXN3orRGFGaFo5SUJrWWpaTnVuNXE5dGdNVGU2Zm5LYmdiVzh1TVh0bFkv?=
 =?utf-8?B?aTNMaTh3alJpNURuWWZoa1MxWFFmSm9qdnIyRWU0aTR3Wjc5Um9aTmRnUFZL?=
 =?utf-8?B?ZmU5a3FrU3BKUWlhNFR0aldkN1p0Vk5QTEJmK0N6YWtoa2R5VGMra1Y4Zi85?=
 =?utf-8?B?Yk1zL21BT2NDTFZBMWREcG54WkFnZm04TThZdG9RNkFuSGtHL2FWU3ExT3pE?=
 =?utf-8?B?YWI0NThYSy9Mb0hFWmlML0R1OGdnVEhkQnVTTHk4TWxQQXA5UVBSVktiOFZs?=
 =?utf-8?B?VStYNFJaWWZ5V2hLckZYMVFJbm81VEhHb2lBbCtKTlNtRVRUY24wcGMwWldI?=
 =?utf-8?B?QzhQcFBiQjNNank1SDVpZU0yeGhHZEpZZUcycHM4b2V3RS9mMHpkMEE3MWIz?=
 =?utf-8?B?aGFTVGpBUVVjU2J5ZnJreHpWSkpoMzJjdXR1ODlsTW5hRUFGdWI1N1hJYTdZ?=
 =?utf-8?B?Z25VNm53TE54VDM0Z1JGaEt5UTFsTnJIQzZZdDZxL1l4aDZtbjFVajkxZXZY?=
 =?utf-8?B?eUk3OTdWWEJOME8zWlA1eEZ4RVhaV1VLTHUwMlNrUTlCbm5ZL25ZdmJvd2Fu?=
 =?utf-8?B?NklKZEplaEJ2LzdKTmZ4TGFnbGR4ZElSOVk3TlJyelovUkk5ejFPa05VVnFv?=
 =?utf-8?B?NWUzRXFHdC92bnR0d2U0MXI2WnhDWXUwSzBYc0tHT2ovY1RXQXVwWWMvUnJt?=
 =?utf-8?B?OC9TWTZZNmhIVGlGTFB6bENyMDlxQVhsNG50VUVTallrS1VhV28wZGk0SG9E?=
 =?utf-8?B?MnZUZDNuUm1GaHo1cHAzQmlpWEVCajZ1MDF4cnhOUWpOMHJjbm1qQ0NJVnJW?=
 =?utf-8?B?RWxRd0ZlZ1NZdHNJMDFEcjRRREJGMThySkVUMHRNY1JoOVN1V3RyNVYzdXQx?=
 =?utf-8?B?bk05ZnkvV29PRWRiTXpSRE9xMEttWXNERmdSLzRTRFArUUZIKzNvdVpCNDda?=
 =?utf-8?B?clhEMSs0V0tVN1VodXFOd2pHckFVbDRBZ3NFMnZQMVgxbmVwNVdzcWdNRzNC?=
 =?utf-8?B?a2M0RkNveGdqK3JIS0NkN1NvOWp5ZTZYWXRQV2ljelhHdVN6Mko1cC9hTi9P?=
 =?utf-8?B?cmV3QXQ4TWpyNUl3VUpkWk1wUktDQjNMWk80MEpKUmg1cGtJSW12ZkJIQnBh?=
 =?utf-8?B?dFk5UmpHcmV6VnpHbVdwTHhGakZpK3pGdUxhazdHNkRPRXFacTJHcUxkVW1U?=
 =?utf-8?B?N25SSDZnNTd3RUJRZlNlQ3hteW1FTjFYV1Nva2VuVm84UUFMZFFsOEM2WU1S?=
 =?utf-8?B?c2ZrNElHVWV3c1BvdnFKU05lUUVBRXE2QURKTVBGVjNLd1RrRVNnTU5BbldK?=
 =?utf-8?B?MEZaQ2hMdDhCWE1RaGY2OEtVVWRwakUxTEVUSisrNnBhdGV1MktHNG1weS9T?=
 =?utf-8?B?QVE9PQ==?=
X-OriginatorOrg: linumiz.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 087bdfa2-66d1-4c7c-9a24-08ddb3d58e21
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB6935.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 10:46:35.1483
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 808466aa-232a-41f4-ac23-289e3a6840d4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EdyE+TkmcnlPXJyo7pqdIAvrDYVw+CpHAN2cbK1FkxO6rx0gb60N/wA8VCHQBWdWr3i5DusjEIjTe8Vinpkvog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5062


On 6/25/25 3:41 PM, Paul Kocialkowski wrote:
> On Wed 25 Jun 25, 15:06, Parthiban wrote:
>>
>> On 6/25/25 2:16 PM, Paul Kocialkowski wrote:
>>> Hi and thanks for your work!
>>>
>>> On Fri 27 Dec 24, 16:37, Parthiban Nallathambi wrote:
>>>> lvds, lcd, dsi all shares the same GPIO D bank and lvds0
>>>> data 3 lines and lvds1 pins are missed, add them.
>>> Would it also make sense to submit device-tree pin definitions here?
>>
>> this patch is already merged. 
>> git show --stat cef4f1b5ba99a964cd6dd248bb373520573c972f
>> commit cef4f1b5ba99a964cd6dd248bb373520573c972f
>> Author: Parthiban Nallathambi <parthiban@linumiz.com>
>> Date:   Fri Dec 27 16:37:57 2024 +0530
>>
>>     pinctrl: sunxi: add missed lvds pins for a100/a133
>>     
>>     lvds, lcd, dsi all shares the same GPIO D bank and lvds0
>>     data 3 lines and lvds1 pins are missed, add them.
>>     
>>     Signed-off-by: Parthiban Nallathambi <parthiban@linumiz.com>
>>     Link: https://lore.kernel.org/20241227-a133-display-support-v1-10-13b52f71fb14@linumiz.com
>>     Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>>
>>  drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c | 12 ++++++++++++
>>  1 file changed, 12 insertions(+)
>>
>> Do you mean the consumer/board devicetree changes?
> 
> I mean the pin definitions for lvds in the sun50i-a100.dtsi device-tree.
> 
> But maybe you wanted to submit those after the bindings/driver changes are
> merged?

                pio: pinctrl@300b000 {
                        compatible = "allwinner,sun50i-a100-pinctrl";
                        reg = <0x0300b000 0x400>;
                        interrupts = <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>,
                                     <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>,
                                     <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>,
                                     <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>,
                                     <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>,
                                     <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>,
                                     <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>;
                        clocks = <&ccu CLK_APB1>, <&dcxo24M>, <&osc32k>;
                        clock-names = "apb", "hosc", "losc";
                        gpio-controller;
                        #gpio-cells = <3>;
                        interrupt-controller;
                        #interrupt-cells = <3>;
                        
                        lcd_lvds0_pins: lcd-lvds0-pins {
                                pins = "PD0", "PD1", "PD2", "PD3", "PD4",
                                        "PD5", "PD6", "PD7", "PD8", "PD9";
                                function = "lvds0";
                        };
                        
                        lcd_lvds1_pins: lcd-lvds1-pins {
                                pins = "PD10", "PD11", "PD12", "PD13", "PD14",
                                        "PD15", "PD16", "PD17", "PD18", "PD19";
                                function = "lvds1";
                        };
                        
                        dsi0_pins: dsi0-pins {
                                pins = "PD0", "PD1", "PD2", "PD3", "PD4",
                                        "PD5", "PD6", "PD7", "PD8", "PD9";
                                function = "dsi0";
                        };

                        mmc0_pins: mmc0-pins {
                                pins = "PF0", "PF1", "PF2", "PF3",
                                       "PF4", "PF5";
                                function = "mmc0";
                                drive-strength = <30>;
                                bias-pull-up;
                        };

It got missed when my email server refused to send all the patches.
I will send the revised full patch series after fixing the comments.
Anyways above are the pin definitions.

Thanks,
Parthiban
https://linumiz.com
https://www.linkedin.com/company/linumiz

Linumiz GmbH
Am Hohen Rott 9, 37170, Uslar
Registergericht: Amtsgericht Göttingen, HRB 207840
Geschäftsführer: Madan Raj Mohanraj

> 
> Cheers,
> 
> Paul
> 


