Return-Path: <linux-gpio+bounces-8850-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 495AF958195
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Aug 2024 11:02:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E64031F22E4C
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Aug 2024 09:02:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BA6815575B;
	Tue, 20 Aug 2024 09:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="qXYtTkoE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2077.outbound.protection.outlook.com [40.107.255.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE5D918E349;
	Tue, 20 Aug 2024 09:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.255.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724144517; cv=fail; b=X/qS5bgRKxgEncdXKqYaXEOgYsAeMNd7LFqN7T4fVTz8iVJY7RJfEWArpjHzJMAWum5oStQnj1JYi1W+nGKLbb1r+62QsILJXKZmCeJrLkG2s4caGUQ/NKRTSVXZ29a2Rzwzedjyds09j7q+kV1aP/wtgdl+PzPjqRgpsrdcikU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724144517; c=relaxed/simple;
	bh=IQxwChgBkH6T3R2XwOZBXbp5E25evHPR6uB//EtWPoM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=RaQFKgJQrK8KULiYHSeLnv20QtCDm6jw7lybUg6xfTu50eaY+GgWsPxA0IpI8cBul8PlC5eCxKiGF04WTpHTGPinAROG/moUnspRtMJrLzteMG5pzoVq8w2WuVzouxLZNav7Zieq1bszTmjEbVVZ69GVzhR01icN1EHWUKN5jvo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=qXYtTkoE; arc=fail smtp.client-ip=40.107.255.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tRLOw9qLRZT6RrtwRcagu2rizsU+ZyHbAXJgbNp9PkZ8z3x0eI5fYiPWLy1Kes2tqQYO9A2Mo8iNPu2W+x12GYu7C/tVYuwAmDoi/y5QnqsCNZqvUADgEflXhKYGq6Dsx1NwqH97Yp570iwozqygpVycEmyD4cLIlfsLCuaaQoTz3qoo/zFIqXH4FdXlarlwKnaAzUuIJye8NOmI4R2sB7n7pQw7eXVu6FmQXxiCfHowUPz4c7/XlwXKi/247LJ11giimYKxqxTDp4JClkiZdHVcm6FaSVkRonocCbdtAuin6lhFfVOPMbJI3OJzcccRv6zQ2oALXgNqYeJ5oFw8LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=odmXP5TLBAT122Y+MlThv6YkzS2Ks6uVykkwM1F6kdM=;
 b=hmze04Etfa4FEYvpHxAv62ZfedBa/CMHxhd2xqQ6vmlx2NEicPhWgr/R5KRL2TUUJgJLRrrmHr+4b/tO26IBO2FWkvb0JLgjDceHJw2I/xUxPcukXggSpHBb9YzCHULtmHvYsQksS7NRqITAlrCG1q6upTuaDnKJJ1nEzBYxYgQ2OlwJJBsdT3ZtnBdgNKoxSYYIqj0B1QN472yjps64pR4BEP86ABoCJ5H7vMCedzvdd2gz5rME6LctEr8bie5lgygcVIOhfGvXN3vOFGS/LVeR+kkfcWNetaHA4+Cr51VGAlLbhTQ9t9eyBSyPOrRr/kle4k8Jr02nHTWrwr+j4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=odmXP5TLBAT122Y+MlThv6YkzS2Ks6uVykkwM1F6kdM=;
 b=qXYtTkoEzTNgQC/Fj1Uj38grbXS567Lerdg8vFlo//W8gK//xJU453GwVHkLLfu15DyLqxU5+9L/n+mTlL/gjfU1qAx9r01RxgJQWpymuMVRpD2MuqvDrkMT135r9ufZwiObaKh3jlfD8u+7dJxXdw4YyuURNTvPb4eehIgs0lItXj2ZSutqWuUoJtosJbWOaKtMDjKMY+6fPa+IrAUcKkJxfmwQK4liaeww2yogmOOo4Uk04HL0as+3nCSLjs8pelcRqFY14KCMXXLJfxRG0Mf1zzrJnbAL2BAcwLDI5XANk+4kfTipv9YbJlV61DwOQOVGVDsgJwDR8j5dgd+uVg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 SI2PR06MB5314.apcprd06.prod.outlook.com (2603:1096:4:1e9::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7875.19; Tue, 20 Aug 2024 09:01:52 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%6]) with mapi id 15.20.7875.019; Tue, 20 Aug 2024
 09:01:52 +0000
Message-ID: <8cd47dde-07cd-42e9-b6a5-144a61243677@vivo.com>
Date: Tue, 20 Aug 2024 17:01:44 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpio: Simplify using devm_clk_get_enabled()
Content-Language: en-US
To: Bartosz Golaszewski <brgl@bgdev.pl>, Rong Qianfeng <rongqianfeng@vivo.com>
Cc: Keerthy <j-keerthy@ti.com>, Linus Walleij <linus.walleij@linaro.org>,
 Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
 Srinivas Neeli <srinivas.neeli@amd.com>, Michal Simek
 <michal.simek@amd.com>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 opensource.kernel@vivo.com
References: <20240820083323.62485-1-rongqianfeng@vivo.com>
 <CAMRc=MdN045+6LzxeWa9VwuzDDbVy7o0pESXc3hrCxrnatSSLw@mail.gmail.com>
From: Rong Qianfeng <11065417@vivo.com>
In-Reply-To: <CAMRc=MdN045+6LzxeWa9VwuzDDbVy7o0pESXc3hrCxrnatSSLw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYCP286CA0056.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::17) To SI2PR06MB5140.apcprd06.prod.outlook.com
 (2603:1096:4:1af::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|SI2PR06MB5314:EE_
X-MS-Office365-Filtering-Correlation-Id: cf10e1d0-ae2e-47f4-ce9a-08dcc0f6bb5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|1800799024|376014|38350700014|81742002;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TFZ2Tk1Dc0w0WWJ6ZHQwWU5LRE5tMVJ3eGlCZWN3RVYxcjZ6dWJNZ05qdS9P?=
 =?utf-8?B?N2wrSDh2S1oxK1BCSHJqTDdUamRZSittMXNHQmN5MlRFMHRXdkwzaUJjaGcx?=
 =?utf-8?B?VVdLK1dWUUFkbk0rei80VHZvajZ0empVdjdXT05YOG9yam5xRXZWaW1zeFpO?=
 =?utf-8?B?cVkyL21IV1dIeTlMSGExTnBPa1FCbXBadjltNm92ZTRFMkZJQjBINXk2SS9l?=
 =?utf-8?B?TElpOTE3d0lSTUJxSFBxdElLK0duWk5MWklJa3RBQ1lSKzEzRUFDNWs5OFJz?=
 =?utf-8?B?bVJsRlpIK0FIZHYzOHArcFR3UzFvVEdXdGVIYXNwdUltMjY3dTZoV2FKSkxj?=
 =?utf-8?B?eUZpdkh1SGVlUS9vZHRMNVNkTGFIUXlYa1AzbmlKd1N6TlZYYWEwMTI0dDNs?=
 =?utf-8?B?OGQzaFBPbVRES0VFNHZoSDEwRWdiS1l2NHUwY3kzQ09tbjJ0ZTNJVEx5aU9U?=
 =?utf-8?B?cUFpSUhyeDFYc0RuNmxqWUhlWDdKOVRtb1M5TzQ5NDVJaUx2Yy94ZENmV1B5?=
 =?utf-8?B?MVZ1OVNWS0dnbjVhOXNTeW9WS3B4V3phM3RNMUswaVRqSGJuV0xjRVZqanVm?=
 =?utf-8?B?T1NpMGZ3VmJUZHlKOSsxZXRCZ0x5U2ZFTzI2ejlmMG1QdEZsaGRJUWo4cnRr?=
 =?utf-8?B?bllya3docm5UdnJwVk1hS2dQMldXL3B0dnV3aithc1pCSUxMOTdaV01xa0F5?=
 =?utf-8?B?OHZjdG8zaEFnYngxZG8zN3lPaWtWRzlIRHpVQUdScjhzSm5uWWNFUDhIalZy?=
 =?utf-8?B?VUNHcW8zd0lwWXZNdXVOTTlhelQ2Q3ZkN2F1ejVEc3huSXU0eExlcEVZNzN4?=
 =?utf-8?B?ckJQWjB3ckJlbm9iaUJMNWt1MHY3MFdjRHI3ZnBxWWw5QkMwT1RLTGk5a1gv?=
 =?utf-8?B?eXd2V3ZvLzcvZUFRdEQ4YlgweXp5SU1HZi9hWitFWElpdjdpN3B6eG9MZFE2?=
 =?utf-8?B?V284MjlCazB3Y3lGSmo1cTNGMGdocksrbVBqaEFweGF0SGl3T0hwZVpEQXp2?=
 =?utf-8?B?VmdsdFZqeU1YZUMvdVR2UmtyZ3dnOG1rdUJtRGdVclUzOURYcGtjQlRjbUZ0?=
 =?utf-8?B?c3k1Q1VuVW05T2M0TlpYZ29sTXUyT2JieDI0ZUowZ2VFVk5LUXFUUlZybnBj?=
 =?utf-8?B?bzZqRW9qSUZ3VFVqSVl5V3IzcFJCTTRDZnlscjRLNGxzQmI5RFJWUUQzRERx?=
 =?utf-8?B?YW1SQTZ6cjFWeURNVEpMckIySDFUY2MxN01PT2l2MGgzUTJLMGF6L25MRWRS?=
 =?utf-8?B?UjFqcXY1SUVacU5RaTM0c0FVUUtreU9Ob3p6UDA0cTZmY3Z0TVJyd2twTnhJ?=
 =?utf-8?B?ajJlUGVTei9rVDNCV2ZYSlFXUmpjNVlwOFVxM0xuUjRQaFRCeTlwWmY1b2h0?=
 =?utf-8?B?TDFBbDUyQThEeTl4UHhaNVZRb0ViUC9wMWFrSFpOMFVYYng0TkdCbkp0Nk84?=
 =?utf-8?B?NjdCYTY1Zlh1OEtGdmF5Wi8xTWxqSGc5R0s4QWRrTUZEUG5RdDdhQmN5ZzJt?=
 =?utf-8?B?eVVDQndOZFE0Vm5lQi9KcFl4TnpwOUZYbGd1S3dLbHlxcUcxRnoxQWpHbUtt?=
 =?utf-8?B?MzAvc3lDZHNabE5TOVkzZGpXbVcxL2dTSFNwWkpUK2t0bHJaNkhCR3BFT3dS?=
 =?utf-8?B?S1FqNDA1QWl3Y21qSFpaY0pWR29GWmk0cUtTU2srZHNaeDRFL3hDNnljY3hu?=
 =?utf-8?B?VEx1UG5mRjF4ZGwrM1A2akJIV293aFBzamdpZzV3TE02S1ZSN2tLZ0dQR2pC?=
 =?utf-8?B?YmdnTEJ6eE5mWHVaN3lsT2tZbmRDREp4NkN4clYyMjJYT2ZZUmkrbXlZTnYz?=
 =?utf-8?B?bVlyM1JmMmNhYWRhMWVCblB3aUVJQ2VtMk9Ga1pyMFpJYXRwU2hPbmVCbkhv?=
 =?utf-8?B?cDFFTkRuS3YyWDN0WTg2dGM1dC9NQjFoSWl6TTl0SFZTbEdSY0toTlVZTDFv?=
 =?utf-8?Q?BxuQlsu0syQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5140.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(38350700014)(81742002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z3dGUFZYbVhmcS90MVZ5L0I1M21Tc2NQZEpzMXNqY1g3aklhbXpMbXZ3Smsr?=
 =?utf-8?B?R285NE1jaDc5UjZ6YWdtVnFXdVRCSzlTWHlrVU9pUlEyUHNKWDZVUUloVjF2?=
 =?utf-8?B?MTQ4cFdXc1NKdjBobmZMRklVNXFRUlJBSlI4TUpoSGVaOW1TWmRXRGV2WU1O?=
 =?utf-8?B?dGM3S1FwN1dlN2wxN0dTWm9Pako2eWlsTHZiTXdraDNQeWRvR0g2SzViUkhn?=
 =?utf-8?B?Q1VUVXFUbGwxQThDYW9ndTJOOTVQUEFaeTUxd2tVOXNXUFh5WnNLc3d6UkdD?=
 =?utf-8?B?aTArV0JzdkVsaGVOYnJKbVdzZzVuajdLRWc5YVA5UXhLY0g3S1NRQ0NmYVk2?=
 =?utf-8?B?aW5Zb2dWRHlscnRmVFQ1MlkrK0xzRWVYZ2NTTk5VRiticjlwTFpDK3U5QmFz?=
 =?utf-8?B?dHA2ckhCZ3VNTmI0U3pzMVhabGpGeUtyc0kxSTNraUJNREp3UHdSang5WGR6?=
 =?utf-8?B?YmcvNTBtbDBMTDBFUFU2YmlrSjRCdWZiTUkwSGRpVmxEbGw1U1FDYmtnUG1i?=
 =?utf-8?B?R09acTdVR0NHWjBzeWhZTmUramhmOHhUOTR1L3VaenFJei9BZjhOR2xnU1Vp?=
 =?utf-8?B?RGYzNWtZajZ1QVpCaUYzcVlvbjJqbndha0s5K0V6NmVWcFNrNXFXTzEyNTg2?=
 =?utf-8?B?MitsekFDU3hJWVFScVZWSit6Wi9pR0pXK0QxcmV4SDZaeXdxWDJlZGNaOGVM?=
 =?utf-8?B?dnppSUtmblBZMkxGKy9jaWZuRTk2akZwdXNJVGl3dk1MU0VwT3FxMUIwOFEx?=
 =?utf-8?B?TG9zbTRaRUI0NVVaVVVQMVFLelUyZFNTREpMK1hpMlNVWTI3NGxOWDVFMWVh?=
 =?utf-8?B?bWlYN0lzVWlPUmFZVUZzMGZGTmpkaGhQZVp4bGovNytMcmRGMHlSUjU2TTVl?=
 =?utf-8?B?MVpCc3NnaUtjNXhMamxKTDgxbjJPNDFRWnZML1V4L0o2RHEvQ2Fra2tCdTAw?=
 =?utf-8?B?UEZjdGFzektyNU84TGFoeXdOMXlkNzh1Rkl5L3k4akxTTC92eXJLMC81a2pN?=
 =?utf-8?B?b1R2RFNpY1BCa3gzbnZLSlpnejN4TzZTZkUzRmppV1lvY1hrMzFXZW5QbWlk?=
 =?utf-8?B?cjFNRFFBYjUrRkpudEw1UStvaTIyV2lpZlJlZSs2ZGlYUC9zNFdyOW1oUy9i?=
 =?utf-8?B?eDhheHNrNXA4ZWdkY3dHaHNsc3NtRnM1UmtCVEtucUN0SkZBd1dGb1Y3WFFC?=
 =?utf-8?B?eW03OEtGdysyVUxQNTJONnYxdHRWckV5dXFiSTUrL2QrMmhGVi8walpsSTBp?=
 =?utf-8?B?cXdLRTMvaDl2eVQ5YjdFV3R5cHVYeHV0VFBjY2tsb2ovbStaTW5LeW1mMkJn?=
 =?utf-8?B?TkZnUk1UaTRacFAyMktOV2J5bkZMcW5VbTVoamxtejV2bUF0ZVNHdWt6cG1U?=
 =?utf-8?B?TUdRbFJTWXpOaG9CVkFxbHpncTF6akxTUXN1aUNxajR5STFSM0FqOWtkVU5X?=
 =?utf-8?B?Wk1pRUoyQUl3c2pyOEhZQVJuWWdoL25CNXNoNGMweDNncXJiNXFsV3F6cy9O?=
 =?utf-8?B?Nk1MMHNxbUdCZS9pelFPT0R2L1VnRnJ5TnNBR2liUHdtMHdWd0FwdXI5dTBj?=
 =?utf-8?B?QlBCbjQ3a2dxTDFNMjNzUE9HcHRNOTdyY0wwM0dmK2VZZnZ1cDRvU2hrejZD?=
 =?utf-8?B?QWczd0N0MUtsYTdNWkNsUkpjVklBQXBVY3Vna3ltK0JXUk5LNVJ3WENRdnZS?=
 =?utf-8?B?UGVTWnUrRTlKUU0vZy9FUGdxRCt4amNWOFFvOTUyM1R3WE1RMEhESXhlYWli?=
 =?utf-8?B?NUhTUzJvaWtBVUlJdGRYVzdqTFlEejIwZnljcjFEQk1NYWZiNkk2cy94dFA3?=
 =?utf-8?B?cWtmZjRkR1ZSYWw5K20xUWVxaFlPUUZQZHdkUzZ2alZjbXJwN3BVK2FTZVVW?=
 =?utf-8?B?bVZUSDM5b0U1cjFQTjBERVRwb2MrVDh4cHVOa0lIaFhBeFUzYzdtU1ZRajY5?=
 =?utf-8?B?NTRRQSt3VVdmeDVWeE5xeUFFempSU09pOVVMNzRCdjR2VVhnNGFvSXczRVlk?=
 =?utf-8?B?b0dRNWkzZzIrU1BMM1FzRUQvRTUyZVFZcEtvZElhU3hKN1lxcnBNSXlOVUZl?=
 =?utf-8?B?UXpMUGs2dWtvTjM0TE54eG1kTzVoZG1DRngyQWlPOE84MlVGNndUc0pNVjVE?=
 =?utf-8?Q?M7kr2BtmItu6Lx8f9F8YD4Yww?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf10e1d0-ae2e-47f4-ce9a-08dcc0f6bb5e
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 09:01:51.9874
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9GA5OJuULpL/bWGzf9s61H0JdCGZccK7Tv/C/+UHaL27voxjqns/T60eh112g33tHGOzUZ0gXkZM9jE8iQnfXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB5314


在 2024/8/20 16:36, Bartosz Golaszewski 写道:
> On Tue, Aug 20, 2024 at 10:33 AM Rong Qianfeng <rongqianfeng@vivo.com> wrote:
>> devm_clk_get_enabled() will call devm_clk_get() + clk_prepare_enable()
>> and the clock will automatically be disabled, unprepared and freed when
>> the device is unbound from the bus. So simplify .probe() and .remove()
>> accordingly.
>>
>> Signed-off-by: Rong Qianfeng <rongqianfeng@vivo.com>
>> ---
>>   drivers/gpio/gpio-davinci.c  | 13 ++-----------
>>   drivers/gpio/gpio-stp-xway.c | 10 ++--------
>>   drivers/gpio/gpio-zynq.c     | 10 +---------
>>   3 files changed, 5 insertions(+), 28 deletions(-)
>>
>> diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
> I already sent a patch like that for davinci, please drop that part.
> Please split the other two into their separate per-driver patches.
Ok.

Best regards,
Qianfeng
>
> Bart

