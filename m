Return-Path: <linux-gpio+bounces-31190-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gN0dFoZ2eWkSxQEAu9opvQ
	(envelope-from <linux-gpio+bounces-31190-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 03:37:58 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4839C53F
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 03:37:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 78F34301159C
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 02:37:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 357081CAA6C;
	Wed, 28 Jan 2026 02:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="zkNwTd/U"
X-Original-To: linux-gpio@vger.kernel.org
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023100.outbound.protection.outlook.com [52.101.127.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 172E52264CF;
	Wed, 28 Jan 2026 02:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.100
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769567855; cv=fail; b=N+Y0thdef64fZe/TIJa2KKqgIzGJC0Af5cJTMg2grWftrPBDbH1kqTX6OOFM0kmeJpBO3zySbQuZsIrUESyK05MuISJAXKKiq8cNhbHvcu+IVtAynRXSw13W+SmcRCzV7HNjkjok/+UcQqAHhgdT9Nr8DzuRAlOLGWOHncnheZc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769567855; c=relaxed/simple;
	bh=630AW6M7kL1gcZDGGtBnKQrfptSM8CW2Q8rd85sz/7g=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=rXYEaCOlA1DFhzhuRGBJYnNmaqMHFBxj3h0fHhQQy9vduF9K6dQlTrB3ZzSWBalfcexlxUyiHmN1l6X9EJbOrmm2KQ4hykBOKfEp0QO6/V3AnmUecnroQeojcJxxs+AcvrBxHxOEc/8OoJN2o/mNBiUVan0VAxlCLz3JDasnuzU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=zkNwTd/U; arc=fail smtp.client-ip=52.101.127.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=keb3x852kFeOsAfU2gubGaut38ohsFPP3tANZC77fasvoRaRATWN3ZcThCMHShMs++fS8kNBeogBWWL6V4WtEqxYFFA3DtCiTlw5yH7bmNquxMBW6kFiWh9R38jvKKI44zxJqRBcMDbZoRU4g6r4ujONjTAu1AQRUiVi7SpStdUL7cgbFQZJeNe9LfXyS4IqNHnOwhNmHQErWkmqAqCyZqkGzF/5c293vnQH1DphUtpW6hoB3omy8zR+uKWrEwkoIz5Iwu/jNdsKvhZrVKxJB4LP2SG4GkF3jvZUExmLT6o/Xdal42vCnMvi2/UlA8J247MBqVdE/6kxqu/BttbVnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ERpqpcONiTiDZCHwuhHhHEoWuyggYK9ul8eZLLg3Sys=;
 b=rDoDsgbiiyJB3iYcJrsuCyUCcnkYK5NkYgorfqNKfuPxrCWHup+4xePfnx3ma/vSB/HmJW7VcXlP6QTBzLfYYaz9dNM4BoA5mjWMZaz93w0soH/Q+bNfEq63fVy3Q3ztLoTVY1LTiBAFUuj6/A7SPGjBykGUVEA/EsTHMQysNl1wEJ6SOlsMVFt1KTr/nFqO/O+48yBtFk3Uvu8qO4zvgRgWZDxnEv4zgdd4XlWMfjOr8TXpy23iq1YnarpqklG62yewniKR0gBwqJl/FLZOYcOiyn0QB7A3mVXVaBWecGQxLcWzwaLAjtW0sqj8Qf0yGdsMcNqA8Clp6Z2SgrvfyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ERpqpcONiTiDZCHwuhHhHEoWuyggYK9ul8eZLLg3Sys=;
 b=zkNwTd/USj8iOTbsjhe4AlEsQPp1qNIXUHMl2KpeenocZ76MyDPMZJYfWwOoCzQE5OF1mzaGKvHJBjXratSR9McQS5hUKPZ5RIUPX0iOQ51w7DMJHmTqCFsX4MsMIReKpLrNk9qY98udoCghl6I7QmI51mEgua8+tshr8HP2XtGaZlybYo/QYg4rNBK88InvxHEDKjSiRVLSBtAjXHE5GODrU2eOiYqnK9PHNpoed4qzJYUhWWYeQ0hTqKQtoQ79Evin7Cfg4DD3Y9r4qwGhOYd+u2W8vECc/D+puUigIR/uNRwNMO1SyOAN5XrYB2e3cYVD8rKzSr3Sew2ma836KQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by JH0PR03MB7633.apcprd03.prod.outlook.com (2603:1096:990:9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Wed, 28 Jan
 2026 02:37:30 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4%4]) with mapi id 15.20.9564.006; Wed, 28 Jan 2026
 02:37:29 +0000
Message-ID: <5e95f52c-92d3-426a-b91c-22bdf42dd65c@amlogic.com>
Date: Wed, 28 Jan 2026 10:37:25 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: meson: amlogic-a4: Fix device node reference
 leak in bank helpers
Content-Language: en-US
To: Felix Gu <ustc.gu@gmail.com>, Linus Walleij <linusw@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260128-amlogic-v1-1-c8aeb2953dcf@gmail.com>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <20260128-amlogic-v1-1-c8aeb2953dcf@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0012.apcprd02.prod.outlook.com
 (2603:1096:4:194::7) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|JH0PR03MB7633:EE_
X-MS-Office365-Filtering-Correlation-Id: a9af6252-ad50-4b36-d4cb-08de5e162e83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TXNJYzJlNFY3bnQ3c2VmckoyaXZ5VzlUNmsrYkRwOFBMRnhvT01haUtjb0Fa?=
 =?utf-8?B?MTBrSGg0ZXFUNXg4dzJVS1pxbUVrSGtPcXh3dWtsMjByY2JyUzJScTFBc3Nv?=
 =?utf-8?B?ZmF0dUJ6Z3d1TWNRRDB5VWVhbVMyOUEwd2ExcE8ydm1GZExXYzYrYVRlNllY?=
 =?utf-8?B?VGQzQWp5cUZid1NmYzFqRFZuM09tellBSnNJZXNJclBzSDQrdy9oUWRncXRF?=
 =?utf-8?B?S0ZPK3YyRUFxQjh1K3VGRW5Rd2trRitoV1J0K0l3RUlROGNRUVU1QzJwb3hj?=
 =?utf-8?B?cEhFZDhicVlhVmI3enlrWTJMaXFRVnVGUmFSbVhpdzB0dXVFZlJvcG9LR2tG?=
 =?utf-8?B?NzlpaWJscklzcWpYdFNkbkhYR29qNEp1VStZVVFpR05FRWhiSmw2QnVpQ0hE?=
 =?utf-8?B?N0JyNEhrVkdRdVRjQjcwUS9CaEVzMEM5UTJTem5rSmlFUkNUOFJPUVl3Kzlu?=
 =?utf-8?B?UDdTVXhDTElqdmhoRW9odWw1cjV3UjFxdXpCYW5DMGhhL1FFVzhxdFBuWTRs?=
 =?utf-8?B?Nk82amZoZU1lSnMrUWw4cnUvVzFjazZGL1NjNjRDTmVVVUFLQndsT05WUVN6?=
 =?utf-8?B?cUNGaWhzUS9DRVNIc2l3ZVp0YnNEY2IzY1Z0UHdyZ1FDL1JIUk9uTnR3WGNo?=
 =?utf-8?B?VWR1bnNtdU4zNEg0aEFJWS9ibFdGdUczaWdueldZZzIxZzYrM3AxK21RUGZk?=
 =?utf-8?B?bnVxejgwQ3c5RTRFYkU0UXA0SFBHQTFacklqczdRb3V0VTVleXloNEJ6cktV?=
 =?utf-8?B?aFVsampxbzYvN2k3WlpyWFFxOHYwUlJubHFLR0p3enp1RE1hTGhHSHk1Nk9S?=
 =?utf-8?B?VmJ0bGVVVHlaMWVIUWN5T0NSQ3FNUlhCam12UVArQTNVQUs2T21UNTBBYjJ4?=
 =?utf-8?B?WEpoaGVjTUZRdGhYeGlUeERmUytodi9KejJ5eHdoYUl0WDlhc29iTlpSQUdn?=
 =?utf-8?B?T0F2cXRlMGM4aVUxejV0aG10cFFTRXU5SjhlT2ZXYS9pSzZaeWRhZk1LN0t5?=
 =?utf-8?B?MEFqd1hIOTlPdXN6RTRmSm5oQU5kTGxaNFFzcU9LUE81blgvcFlYdHBIWGlT?=
 =?utf-8?B?ZjdiMmpOVklLYkE5a2FJSjlyUFpBZ0d6eUFtT0ZTb0dscDQwQm1mREZNZjdH?=
 =?utf-8?B?V2NIOGdhUUxkZ3RrMk1lSHBaTEtnSWw0SVAvSytsZUxuQk9ubmhiSjJPSmIw?=
 =?utf-8?B?TmlzK0JQVmtCQjk5MFFuek0wMXR4UEVGSFFYdDhsb3NKMEFWSnAwbWJBWjhF?=
 =?utf-8?B?QXMvVHdiclZEeTY5b2k3WHZEY05MQ3NDaGloVFBXVzgvaHpyVlcyMStUYzVs?=
 =?utf-8?B?a0xYbmxCK3ltMFNQbVJLZDBsVEt2eFpIVE40b0JYTVN0NnJWblZKUnJLYU1l?=
 =?utf-8?B?N2NlNzVjdlNaSjhlVFhKTm92VjQ5WXdtZnZtWlAzeUg1NmlhY0gveFAvYkQz?=
 =?utf-8?B?VHJyUytjTGl4TGNGYlY0MWsvTTFJVU1CbGMyT1NETjVlM2Q4QlFMMndNa2xC?=
 =?utf-8?B?a1BlRmdqVElKYzIwSFJESzZFQlZEbHJQV1pqRVJyVHYrRW9XL1I5cXkyb2sw?=
 =?utf-8?B?Ui95RkM1SGhBZUU0MGlyWnlQeDM5VkttNk9VaERwc2lJSHhaZnp4NG16ODVs?=
 =?utf-8?B?cnF2WUNyR2ZNdnN3S3dzbXBWTmFjZVgyR3NiaGdaQ2wwN01WSWRLUVM2bGtV?=
 =?utf-8?B?UmVndTZ2V2VsdldoZnQya09mS1JXczFING5uNGorbXZ4Z2p0aWxpZ0F0b0dN?=
 =?utf-8?B?a2Y1MGFIc0N2dTNVejgzemh6RkZxcWpBOWN1MGhjYnBnb3dCQ2N2YUswRUlm?=
 =?utf-8?B?QmplKzNhZGpzcE1SeXZXWUJNcXdVTGR2U0RBSHhka3pqMGhrQUJJY2pTQ3ZY?=
 =?utf-8?B?amsvVHRuMG42ZU5MRW50RG1wNVRobE94THJxakQ2MU01K0pBNTluTmJiSXpW?=
 =?utf-8?B?NnV1cndGaXk0dVdOTlZrTXlRMVBBdWJ2dERpUUdVN3pCZTVzbEdJcjRqdmR2?=
 =?utf-8?B?MVgzYk93azJQeUt2RGhCVmxTNkJ4Yjd0ZitDM2lOTHkxZEhaOFhPMXc1MnYz?=
 =?utf-8?B?VnJZeUZ4VFFDV1lHSktaRmdpWFVuc28xWW9nYlVvajlOZDlkKzBDMzFISkNw?=
 =?utf-8?Q?uzVM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NTRlWWk5aTFwUHNsNGUwOHphOWpHZ1BMQjJtMisxSFR5UU9RRmtOSXRPbTA3?=
 =?utf-8?B?bEhISEVaNXpnd3FzUkg2Yzl4bW1SOWZBVGxTc1krQjFEcmZ2MVhRa0tTWEtP?=
 =?utf-8?B?ajZwdjRaWkh6VWVsR1BUbmtLWDE3U0U0ejg0bGhBUElkeGw5Q0I4ZEZ2NDlq?=
 =?utf-8?B?eHB5UVAwK3pDNEVPR0dSNG5rdjl6YTZrdHRpdTRieGwyYnplcU5OS0hWUXU3?=
 =?utf-8?B?Ui9VRUdpN2FzRmNzbGNLSGs3OEd3QjFhTXB6djl0V09GaW9WcEp0MExUYWpU?=
 =?utf-8?B?OEF6d0pWcHorOXBycHdCWHJMeVIvT3Z1VGdWZVRiNmpEUWI2VGo0bkZhWDRU?=
 =?utf-8?B?REpUbjBoYzRUU0VNc3o5dFRKM2hnSEtGRHVVK3RsRklXNTcrNDJDMVlKdm5a?=
 =?utf-8?B?UFk2aklIMWFMb0wzbzlzd0duYTduaTl1Ulh6QUgyWFljQnp3SWxqVUUxSlc4?=
 =?utf-8?B?aVBnSW0xTGFJdEZuTU9JNEVFd3pFWnlYVGNwcGdQcUxWTm1lNjQ1aTlLZSs5?=
 =?utf-8?B?UGF5TFkrdDg2YTBBYTBNOHV6MDJYblpCRnZueldiYThmUlY5MnNLaEEzSnUr?=
 =?utf-8?B?cTNTZ2l0T3BDVkhRVklYYWV6ZlFwb3dqMHZaeHUvdTQwY3l3RXlBcEI4c0F4?=
 =?utf-8?B?cFhDallQUnhRL2I2ang5VEFxSGVmRXB6blZMTlpqVjF0bDRQRnBpTHJueEZt?=
 =?utf-8?B?UDdhTS9QQmFuWXhTcG43M1RBS3lidTIwenl0R251cWExbFYwVVZObm1kV3Fo?=
 =?utf-8?B?SVgxTmRuODBMMFFtYmNnUFNjZkZhVktIZll4RWozaS9oL1AzbHhGVXZkanYr?=
 =?utf-8?B?aXlQYUorWDFBNEV1WGkwTnVxeEplakNBekdkMGhvc2cvNE1LK3BLNFViMk9G?=
 =?utf-8?B?cXh5c0xQUzUyM3NleWlaY2g2UC9Ydld5OUhmOTIxeW40QjRRU29nQXhvaTZX?=
 =?utf-8?B?eHRmL3F4bUQ5d2JLU083ajdLWWNWSElISjdRcjV1UlBnK0U0dEJ4Q1BJcEVw?=
 =?utf-8?B?Q28zVVJGWk9FSDcwM1VCaHlRNERic1V3MXM0aDE5NGJMMWwwZlFnNnpmZzBl?=
 =?utf-8?B?bk1OTFcwVHZ3WTFSRzJ5VFFacHNHcC9aRVZBY0huYnZUbnpZbktlS21QRmwz?=
 =?utf-8?B?VWUzMWRGNlBLbnN6WkUrVWZUbGczTWNrTElJc2lEZVZIclZkR0ZVcFZMWE9O?=
 =?utf-8?B?a1M0S0RGQjJLT3pCMklqNFZ1R2RpTU43VE4yL2NyVWhseFpvbDI4UCtUaTU0?=
 =?utf-8?B?aHV5akNTaXE5R05xSnQ2UEw5YWViaEtlNG9ac1ZtRGZ1emQzOTFheSt2Y0ZK?=
 =?utf-8?B?Nm4vSkhRcWVlSDFkMUxRL3NjbENCQmF5T0k2eTBsYjk5YnZZNHJwRXh5Zmd4?=
 =?utf-8?B?VStuNHpyWkxQTURXZzRXNysrWFdjdU5jUmptUzNldDBHTjBEM2xCTENpSTJM?=
 =?utf-8?B?RVJrd3VYQzFMM3FpSmxJdHJERGN5OWlBWHRVZVA4aXRGeTVMbnpHVktYa3Vm?=
 =?utf-8?B?VkxTOEZTSjFQRmZ2aVhVckVISm1CVGplN2tOVyt3ajRJV2dwQTN4SzVRMlpq?=
 =?utf-8?B?SXZvZUU1WjFhbk5oQ0d6cVJkdDNROHZaSEFmNXFjdjIvNy9ZbkR6V1lpVEZK?=
 =?utf-8?B?Q0hsekY1Y2JWRk1oa04rQmtSZmE1bkZZWThvK25PTzB4UGRlUXl2c25ZbVBa?=
 =?utf-8?B?c0N4SXRJdHRzQnZnckdJbm1BVC90YStlNFpXOEJVU2RCMmRIZW12Y1NTSVdP?=
 =?utf-8?B?d2tPZDBoVTR4eURoWnJYTXhPUW90bWJKMFhhODV3c3Bhd2M0aG5VT0x0N2pF?=
 =?utf-8?B?dUErZUNJTEQ0QThkdmhadjN6Z0ZuMEZkTG9rczRqend3RDFqR2RjeElQWFFI?=
 =?utf-8?B?cDdKbzBCeDJMRlhaTUdEbFY5dFBteVZBV0VrY0NNQURzZjNieFhsWjA2azJY?=
 =?utf-8?B?LzdsUSszVXVYUHNrOWxtUlNYdVppNGttV0NrSGh1Nmxjcy8wOG9qODg4aVJx?=
 =?utf-8?B?YVAwU1JzWXRLZG9JTzEzZlVUME1iQkVYNnEvaWFyazZhS0MyZGVOZ3o1Yysv?=
 =?utf-8?B?R0lISG1RZ1BPblpXbVhnQnZCVVdHdVRGc0Q2a25kWnpjRFJEMFhCZkRYWlZm?=
 =?utf-8?B?ZjlNZlpzai9MNHZEaVg0SWoyS21PWWxZNnV5YWtEN3hFTDVlWFIzSXpGMjk0?=
 =?utf-8?B?amFpMVdjaWI5V3dGbk1QeE1uc0JtRm5LLzA1cFhocDBxTEh6aW12RTBPMWhn?=
 =?utf-8?B?WDNPNG5kSkdFSDhtQ0g3MXhDNUxWYXdkU1d4VHorZUhia1hJaHNDT2crYjVG?=
 =?utf-8?B?d2NPeXBydElUZUZLVFVSMUdxbWFCbWloU3pZU3U4eG12dVh2UXorZz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9af6252-ad50-4b36-d4cb-08de5e162e83
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 02:37:29.7911
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XuT1bB10vNxUyyPBLDm2zKh5vvq2JykkqdxyoOcPSIAehH1hmuFXT8RsR48YCsnt8DXUln3LLal//twbJ5uWZqFcSpaZDWc5/oy4qq74H+k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB7633
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amlogic.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amlogic.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-31190-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linaro.org,baylibre.com,googlemail.com];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amlogic.com:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xianwei.zhao@amlogic.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	REDIRECTOR_URL(0.00)[aka.ms];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,of_args.np:url,aka.ms:url,amlogic.com:email,amlogic.com:dkim,amlogic.com:mid]
X-Rspamd-Queue-Id: 9F4839C53F
X-Rspamd-Action: no action


Reviewed-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
On 2026/1/28 02:23, Felix Gu wrote:
> [You don't often get email from ustc.gu@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> [ EXTERNAL EMAIL ]
> 
> of_parse_phandle_with_fixed_args() increments the reference count of the
> returned device node, so it must be explicitly released using
> of_node_put() after use.
> 
> Fix the reference leak in aml_bank_pins() and aml_bank_number() by
> adding the missing of_node_put() calls.
> 
> Fixes: 6e9be3abb78c ("pinctrl: Add driver support for Amlogic SoCs")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>
> ---
>   drivers/pinctrl/meson/pinctrl-amlogic-a4.c | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
> index ded7b218e2ec..40542edd557e 100644
> --- a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
> +++ b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
> @@ -725,8 +725,9 @@ static u32 aml_bank_pins(struct device_node *np)
>          if (of_parse_phandle_with_fixed_args(np, "gpio-ranges", 3,
>                                               0, &of_args))
>                  return 0;
> -       else
> -               return of_args.args[2];
> +
> +       of_node_put(of_args.np);
> +       return of_args.args[2];
>   }
> 
>   static int aml_bank_number(struct device_node *np)
> @@ -736,8 +737,9 @@ static int aml_bank_number(struct device_node *np)
>          if (of_parse_phandle_with_fixed_args(np, "gpio-ranges", 3,
>                                               0, &of_args))
>                  return -EINVAL;
> -       else
> -               return of_args.args[1] >> 8;
> +
> +       of_node_put(of_args.np);
> +       return of_args.args[1] >> 8;
>   }
> 
>   static unsigned int aml_count_pins(struct device_node *np)
> 
> ---
> base-commit: 615aad0f61e0c7a898184a394dc895c610100d4f
> change-id: 20260128-amlogic-0d08ef086c8b
> 
> Best regards,
> --
> Felix Gu <ustc.gu@gmail.com>
> 

