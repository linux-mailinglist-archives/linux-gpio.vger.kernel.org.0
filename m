Return-Path: <linux-gpio+bounces-23082-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 977B4B00230
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 14:42:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 77D051AA565D
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 12:42:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51A882561C2;
	Thu, 10 Jul 2025 12:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="fVi0bGig"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010070.outbound.protection.outlook.com [52.101.69.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAAC92580D1;
	Thu, 10 Jul 2025 12:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752151327; cv=fail; b=LepUkMbp+TrG3LN8Q98CcSbseGSqIzql2sOqwO25J+nokYxbNFPF9x2Z/6/g4K2TYtdKwtWwm7/zMRfx0B2zzRA8wD8L47pa0Xy1ieeVqxxChUviyRxrVmI/ukHmdbb9v9Peiz5F1J5xYImakmUjARjIo2LkplYQMF/2sxpj4PA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752151327; c=relaxed/simple;
	bh=LIupibSDX4Iuj59TeMzmcamb6nQRFUS3WPH5yVzJ074=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=hDmdyNxRSNcqMQS3ZldjeFGRQHopvHpJZ7GEeAhsIT+CX1RE81DSasGwPTtfgLhPp47jS5sDXMR4/rx9hBuX6fTz8m6z3jRnAfMwj7oQzVGfswZDybRObH3AKUXEemmEvu17ZizJexdeYyPAc5Sw6TtQMRswgNXyAHxhe3s5Oyc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=fVi0bGig; arc=fail smtp.client-ip=52.101.69.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dQpvrvs4W01tZTZCILA7qaQFh5fctUbIUtQ0m7vFd66g6ogKddp8Abv7ibuLjeiyiFEnXRUDu2sJVDif2MFKeaEh6JCQLkfzLKmBPLYyMQE3KX8X6T+cd2A2q72J/kyT7FU/6o43xdG0iMnI4EylZKGacCEgoeuONe00D5Ji5lA1rZRnWeWxUrrimK0wpHddLlnlpzFHjdtqh3hHLMMMTG4HMvz/Un5CFqQvcpIjrxYdJ6lJHYA1JAUOnWv7bS9wtz40j3zW70YGTDFTITJR1LtElYdmrbeJefkIZHdmmX8xkTVAiVQucOz7r9JnFdGQDR6y/bnvk09M7f2Hn9OPUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9wXOlO3tnxf+8zkGbIpRriGBto8hhFR0lj7YlLv8DtQ=;
 b=kPCZbPgbXKZdAJOW2Dd3qAmTbT0j/FKg/MAxZpxL5uU94Pun6UndiXW/50BzNItgQC4HovhvNlIfyXhEQBwWBMZqm8tK+0D4ERaUT+dUafswSjolBJwSN9bWTjCA84QONB6CZIZeu9rLiZV3zHwW1p6Yh+yf8HsGVEJOUMKeodSljZdyglzuY83queOyNitaycU2sxOb2OHdfnwUsKURp5dlSfU4DTlKI4elHvvpmNF37oBbvefjf5VJTi8Nm1LDjdg+vZTqrrUlQLLizjLT53BC3eltb4uYVoF75fTNmJdztGDz+OBezYTFrekF0T6RyLG8iR6RjSUs8EQEuUA3Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9wXOlO3tnxf+8zkGbIpRriGBto8hhFR0lj7YlLv8DtQ=;
 b=fVi0bGig1SCza4p/qaXIQtOOfMxr7wCT6j7RTAupC3x5RI0pnEbVv0Fvao/dAo3f8TzIrWj9C0/M7jaSui3UyCokkD9j5ru0+Q+I8eWNeWx5TMYisiS69cGiE7M01/TRLz0Fyg6rcQg94pjeQUEbT792zqaAqRx6Bv6sg63kaz6BsLC8/pBzHLe9Y1hl7xQMmjqCsyCPqVR2rpE1sI0eIgHutr4n5nVUy+I7ahRkTOX5FFT2PfAI+8BVOlmlQKi/CNsEHjg3/9vgerh7tfkGDyMtMq790kqLZNUqT6bpR9GpCJhEIykIErXRjTcjuvNXNnevoZQlbRpzN4N2BafsDQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAXPR04MB8173.eurprd04.prod.outlook.com (2603:10a6:102:1ca::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Thu, 10 Jul
 2025 12:42:02 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%7]) with mapi id 15.20.8901.028; Thu, 10 Jul 2025
 12:42:01 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Thu, 10 Jul 2025 20:40:01 +0800
Subject: [PATCH v2 1/3] ASoC: codec: tlv320aic32x4: Drop aic32x4_pdata
 usage
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-asoc-gpio-1-v2-1-2233b272a1a6@nxp.com>
References: <20250710-asoc-gpio-1-v2-0-2233b272a1a6@nxp.com>
In-Reply-To: <20250710-asoc-gpio-1-v2-0-2233b272a1a6@nxp.com>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Peng Fan <peng.fan@nxp.com>, 
 Markus Niebel <Markus.Niebel@ew.tq-group.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752151210; l=1977;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=LIupibSDX4Iuj59TeMzmcamb6nQRFUS3WPH5yVzJ074=;
 b=2qHaXbSpXFWzaL1d3EFOHSXqDclavHHGB3kTdpQ/5xqov9ZZmedJeuGuz8C9xrbs0vhWHJTrd
 PCHuCqHHAuODJPUSiCL+/NFVbgGRFYDpPmm4FOg0offCOHeis4D2UJl
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: MA0PR01CA0008.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::15) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PAXPR04MB8173:EE_
X-MS-Office365-Filtering-Correlation-Id: eeea3283-9198-4c54-7aae-08ddbfaf2a98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|7416014|376014|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OE9wNkVBWGpRMDJwekl2VWEvaW1UV2NJcXM1c1VGRW9URXl5V1AxUmhTcm1Z?=
 =?utf-8?B?NGRtUmh0WWQ0Umc3MGFvU0Mwb2Q2K2F6UmxGWTQ3ZjdOVGVqelRVUWZyWHhX?=
 =?utf-8?B?UzhDamRjdEtrWUZZdmp1d3lVcXo1aklJb3Zhd21iMFdUcFhUa2xVNlNlZmVS?=
 =?utf-8?B?bW1kc2RYT1J3K3k4Rlk4OGsvNFhvSS9WRkJZVk1JMCs2dEJ6d1lLdG5vNXB0?=
 =?utf-8?B?cHVuODd5SXg4UnR3Wnhjc21GaGFYaEw4RkNFZ1pTU3ptazV1K1MvVkJWaith?=
 =?utf-8?B?MTdVNFVENjZwcktXQzlYYkZ0TW5WdzdLaG5yNFJ4c1NFYkpXK2tQY3dLbG5s?=
 =?utf-8?B?aU5ObjViZiswTlY0d0ExWDNpcGMxTnhsMFpWVTc5MHU0RHlNUU56elJVOUNz?=
 =?utf-8?B?cVZobkJsUkJQQjVsMkpSTGx2Q3dCTlk1TUV5dEU2R2NvSm1xWXZsYVFyUlFU?=
 =?utf-8?B?b0g5dU9mUDVPU2Zub3pNaUl1VW5MdXpna0c4V25oYksyTktMNFU5VUM2cjRF?=
 =?utf-8?B?TGs4RG1mSU1XV3pBWkxQWUk0akVtZFJHRHZDSVR1NzExbjBPb1ZSMmRzK0Zp?=
 =?utf-8?B?NDFhaEM0VHRXRm5ZMVhBS2pab3FCMGpCU01PT2xVcFFYY0tqbFh3Nk5WZFBM?=
 =?utf-8?B?RUZJSHpjaEtWcWpRWDg4QXNIRFhiV1JsNzR6eCtGNFUrVFJ3dXo1YUxoNzNE?=
 =?utf-8?B?TmJPb3hHQlJ5V2VOMVdUWWZHNWt1ZmFCTndYNUxGa1dtcjNCWlZtcndFN0or?=
 =?utf-8?B?cXdsZnorc1EvNmZyYjVrQXBNdHpmSjRHbzBpQXdlN3k0YlR0NVVodU5kc3pZ?=
 =?utf-8?B?WTRzNDFxeFNObDBkWmxmRFc5ajdWZzluc0cvMWFyY3NFczgyOHFTV1I4WWc0?=
 =?utf-8?B?Njg4bjFDbzFRUEx5a0RLaWdjMGVFMXFKUUNlNU9iVjR5MDU0L1BwVFpwSVlX?=
 =?utf-8?B?VG5MK1FmSHo1UmFVa3ErdXdrL3p5UUppc1gxRTN0Qm82cnhKZkN6QkQ4SnJT?=
 =?utf-8?B?Q1JsMENKaXVPbm5UdllNYkJXNzlTM29hVCt3aVpnYUhMRVhWbmIrWFFGcmxU?=
 =?utf-8?B?d0psK2Y4RTBmZXIyYnEzMWZOM245Z2ZUUFo5OFJ5R0xqZVVRKzRRUTBuRUlL?=
 =?utf-8?B?dVVKVlBXU2RKUzhoS0ltUGNKNEg2SDdzcFdUaDdmejcrd3YrVHVqc3BRdUtB?=
 =?utf-8?B?bUFaNDVRaWhBUDJHdUxkZkx2NTJrTzVxV0JIM1Nhb2JzemcrNXRRdjVCczN1?=
 =?utf-8?B?RENuZkc1YU1tVFNONXNXVUdQcHgvb2hzZHQ5eHVMNkJtanU3bHFsY0hRZ1VN?=
 =?utf-8?B?L3B2YjRpV3VkQ3ZUeDFmY2IzWW50N1d0Z2dOQVlCWEZZRjhSUWRhWmdGTVgy?=
 =?utf-8?B?M3hocW5WanFyYlZCZUszQUxycUhLSFkzSTJVblBiUk9pN3F3Q1dQa1NsTGVl?=
 =?utf-8?B?czFIenZRN3ArQnE4MmpLRlRyMEloclJiNFJuU1ZGREhTMnBQK1ptUENxUXZ4?=
 =?utf-8?B?Mmc5a3FYSkpZUnluMWJWVTV3UmlRV212dG9iamVqamRYdGJKNTYxZ2llb252?=
 =?utf-8?B?YWhVcWF0d0gyTGdxQjZ1SnpyOFF6ckx5T01yaysra0FkWWkrMTVqUlJWQ0cz?=
 =?utf-8?B?M3Q5TkhsaW44Vk5DRWVZV1NTS0lZYWVJdTNiUWd1ejVMK3Y5K0Y5aE8yNUNH?=
 =?utf-8?B?QkVORkt4QWRxRk45TXNLcXhEY1d4QVptTTkxYkZoa2R1SGtxT21TMFptcHRu?=
 =?utf-8?B?UURPbzJ0M0NwSHk2RDkrUmxHRDRNTWc2TUNhdkNkb09aRlBJN3JyUHQ5VE5q?=
 =?utf-8?B?aE41TTBaUzNHL2ZKQTlQaHBvV2dnbTJXK0gvaW81TnE4MVVic0pvU0JqbXJX?=
 =?utf-8?B?S0tGelg1M25Gcjl4TE4rTHFCRjV3U3FmSjNyR3dRNmRDeTFVMWFkd2pkMVlI?=
 =?utf-8?B?Zk5sZXhoWHZrdGZJN3pmN0I1VDdxdGRyMURIcmpVUFZBcFBWYkV2MGdKQ21T?=
 =?utf-8?Q?eiDD3XCOLIj4baAcdeDe4AI74H7WS8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(7416014)(376014)(52116014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R2VlOCtDMHFaak5WdWY5RWdvcFEzNXYzYkhiaXBhcDBWd2pwQWJneTdpamht?=
 =?utf-8?B?Y0V3Vk0yc2VTV3Y0Ny90TTVqSllkTGZ2VzFMUzhUQ1RwaWhZbHNuUVRHcG1J?=
 =?utf-8?B?TFp3TUcvZDZJeTltTnBsYmRBeXFaeDZnd1YvRk55TnI5SXI0M0JFU2hEQzBG?=
 =?utf-8?B?QzNsTk55SnlVemNRY0VPNXhDTVl1OXQ2M0NrSG5BQkdlUzFzY1BvcGd1aXI0?=
 =?utf-8?B?SnduRkUzeFN2MktKMnRFL3lvUWFoSnYyUlRmbk1IQWthT3lRSmpxdWlqdWxC?=
 =?utf-8?B?UTdBTy9WNXB6dmNnRTRsNnFOaVptZ28rRHdVL1ZWRUdkYVNVM3NLbnhCb282?=
 =?utf-8?B?UVVkaHpnM1hDNFNlYlMrVVlMTHFvZlhydHF6bXBWQm93MGIzVWt2alhLYVNm?=
 =?utf-8?B?UVk3L0JKRVNXSng0NURXeWpRaUFIRGw3R1ZQR2RlUnRPdUM3YzhQZU5oelBK?=
 =?utf-8?B?aDU0WWl3VFBwNUhQY0NGNEt4elRwS29ES0R1Vm1NdEl4VEtQR08xeVFGNDJE?=
 =?utf-8?B?cGR3NkF2a2c4SHRHU0p0eDVXVHZmN0hlSjlpYzlMK3J1S0M3SnhQSHRKV1gz?=
 =?utf-8?B?aEMwT0drSTk0UU1nTkFMVC9VYnozSkRIVzRGcmExc2R1SFhlMDBWeFk4MTNu?=
 =?utf-8?B?VVBhUW1Say9pUkZjUjdsSG53VEtTOHpkMWNtVjFGTG53dldDRysranBubkdE?=
 =?utf-8?B?aENwYTlIQm9ZbXFjdWxSU2J5S1ZwbnhueWRSdVhxdWxPL0poTTRIcFZaaWpT?=
 =?utf-8?B?clJKTWFSSnpqZHF3UG9VT1h3NTVoQ3BpT3dpZGZNL0c2c1Bsd21DMTNPQmZx?=
 =?utf-8?B?L25uOG5SWm5zNVAxOElpcjZjaUE1ejg2bUNxb2t4RlQ1bkhMN2lOc3VPVnI5?=
 =?utf-8?B?UGx0MVJNT1Q0MTVaY200VFprTi9vcWVYeitudFZWRnVQSFI0dENVU21zTGp5?=
 =?utf-8?B?ZGZGZmFucnN3MUNOc3U2NFpDRW81Rm0vRVhGV2I1cG0xTUlsRnFycWZsM1NL?=
 =?utf-8?B?TWRxT3Y3S0FpV1pVRFJWNDJBQXhlTDJ5ZTV1WkoxK09KVEtOT2VmaUlTODVW?=
 =?utf-8?B?Sk1abXNpZ29zMzIxY3p5MGlqSFdUcERETzFES0QxbTVLWDNhNGx2bmU1Q3Fn?=
 =?utf-8?B?VStHUEt1SUliYW43VzRVOXFVOVJ2TnpyWUNNa1hzQWRVb1BsSUl1Mjc3UzRx?=
 =?utf-8?B?NUl3REhMOENoRit1SDJoWFVSZjk4MkJMVnJDbDdKbU5YL0I5WEJBRWNoZFpt?=
 =?utf-8?B?REZ6UlJpQkl5ZWdDS3ZFY3pzTjluK1NjSVZnY0h6RXJaeVB6dU95VlhGVnRp?=
 =?utf-8?B?U3FnMUNJOHZNWHlYS1RGejluMTF0VVJiMWxiMkF0SzJ3TnNINHh4cjhaU0Fr?=
 =?utf-8?B?NlhVKzBlRFRFZ2ZQNkxEbXUvQ3o5aHdxNzd2YkZxN3JSVjBEZUNNdmp4MXZn?=
 =?utf-8?B?YjdNWTduNFgwbFlVanVacXFNNHNVMitLWmFFWEFnYnNidzllaDgyWWJ4cHFt?=
 =?utf-8?B?QnlkZnMyaTZBWm9vcC9vMkJPQlFCVmlRMTFkZDJpcHM5dWxKeHFQL0FpQzF6?=
 =?utf-8?B?SnppWWViOUVLd2ZKMFl0Vlk0azRhSCt6Nzlhb0lSS2tjVEFTcWl6aXl1alF6?=
 =?utf-8?B?Mm8xZFpyNzJuL3ltRmFTVEkxbGNuaVU3ak9uZmpSaWI1Q2s5azdKeEtzcC9Y?=
 =?utf-8?B?c0hidGl2K3NZNzhzNC9mQmlyNkRNTkJKaUdIbVc3eGk5OGxTem9hUzl2UjVq?=
 =?utf-8?B?NjZCaUNzK0RseWV4R1RJVHBHVjJGRlErVXg4a2RoSi83di9nZ2o3Mm9WWm03?=
 =?utf-8?B?cmt5L2FaR05rQ0s0Y2VJK2VjelJiUE12c0dFU3FhTHFqSVdpTzQ3MXFKVFBT?=
 =?utf-8?B?bHowTDlUSyswRFZHQkhqTnRDdmJuUFMzU2RyVElHYWp3TkQrT1FDUmJBb1Ex?=
 =?utf-8?B?a2h1VXNFZUZNMnpRbTdodHdXYnA0SVRBN0Y1SXIwMVRmRk1ieEh1OVVnM2Rh?=
 =?utf-8?B?bldVUVJGMGhrODEwL2VWZlVxK1JmbTNDVzV2Z3RrMU9kSEZIRkVpak92Y0pP?=
 =?utf-8?B?bVZXdFdmSjM4MEh2cGFCbjJXQXJHK0VRc2ZPMWc4UEh6em9MMGNsWE5ZblNK?=
 =?utf-8?Q?x0WS3dOmoHQwkLydVN2Rz58xl?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eeea3283-9198-4c54-7aae-08ddbfaf2a98
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 12:42:01.2820
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eIGpZAaZ4B47O+CKe5i3CqT/uADM6F5y0jvLxfdpPP9hT+rP9W8SZaBBR1b0gSMqGiAHKVJI2yf6jz58MobiQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8173

There is no machine is using aic32x4_pdata as platform_data, so
remove the dead code.

Cc: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 include/sound/tlv320aic32x4.h    | 9 ---------
 sound/soc/codecs/tlv320aic32x4.c | 9 +--------
 2 files changed, 1 insertion(+), 17 deletions(-)

diff --git a/include/sound/tlv320aic32x4.h b/include/sound/tlv320aic32x4.h
index 0abf74d7edbd69484c45ad6a1c39b3f67d61bd63..b779d671a99576deadc6e647edff9b1b3a5d33c2 100644
--- a/include/sound/tlv320aic32x4.h
+++ b/include/sound/tlv320aic32x4.h
@@ -40,13 +40,4 @@
 struct aic32x4_setup_data {
 	unsigned int gpio_func[5];
 };
-
-struct aic32x4_pdata {
-	struct aic32x4_setup_data *setup;
-	u32 power_cfg;
-	u32 micpga_routing;
-	bool swapdacs;
-	int rstn_gpio;
-};
-
 #endif
diff --git a/sound/soc/codecs/tlv320aic32x4.c b/sound/soc/codecs/tlv320aic32x4.c
index 54ea4bc58c276d9ab39a15d312287dfb300dbab9..7dbcf7f7130b04a27f58f20beb83eb3676c79c3d 100644
--- a/sound/soc/codecs/tlv320aic32x4.c
+++ b/sound/soc/codecs/tlv320aic32x4.c
@@ -1346,7 +1346,6 @@ int aic32x4_probe(struct device *dev, struct regmap *regmap,
 		  enum aic32x4_type type)
 {
 	struct aic32x4_priv *aic32x4;
-	struct aic32x4_pdata *pdata = dev->platform_data;
 	struct device_node *np = dev->of_node;
 	int ret;
 
@@ -1363,13 +1362,7 @@ int aic32x4_probe(struct device *dev, struct regmap *regmap,
 
 	dev_set_drvdata(dev, aic32x4);
 
-	if (pdata) {
-		aic32x4->power_cfg = pdata->power_cfg;
-		aic32x4->swapdacs = pdata->swapdacs;
-		aic32x4->micpga_routing = pdata->micpga_routing;
-		aic32x4->rstn_gpio = pdata->rstn_gpio;
-		aic32x4->mclk_name = "mclk";
-	} else if (np) {
+	if (np) {
 		ret = aic32x4_parse_dt(aic32x4, np);
 		if (ret) {
 			dev_err(dev, "Failed to parse DT node\n");

-- 
2.37.1


