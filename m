Return-Path: <linux-gpio+bounces-9152-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7164695EC3A
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Aug 2024 10:42:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 28036280F5F
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Aug 2024 08:42:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91C4013BACC;
	Mon, 26 Aug 2024 08:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="JkgEwlWy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011030.outbound.protection.outlook.com [52.101.70.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5548712BF25;
	Mon, 26 Aug 2024 08:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724661772; cv=fail; b=K08VEL1K5ioFPI0kU0eAUibPF4dgNdRTGqfgg9q0quuYuGjHZyMnDRkXfs8znq5SS+yqZBcLaxqGGcePWJgQEAcKTvrQuoUgUOzgsSsG6xKK32WBLAWiurvHl6WoIqL79l/LqG3p8bFrtz5SoCivxY35Z+CYxpXrJqGjEO2DiAg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724661772; c=relaxed/simple;
	bh=I4IZ3daj30N8nx/B8gcerfNpA45fsIhyv5GmK6hx5aw=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=FW1A0S3tcPIgBwKFN/c5soCeJ146zF/0hWhA3/L+PzthhsIYVglkEH52tZ2gKT1l5ACZRxBhtH8LhYZViznsogdlyiiui0z6T24Q5IU9ichUUw1hXe0oCCC4ZksPf09RObpI1LLX4qz2p+/vFfIdahzistEb9FaT2RVsVgKtFL4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=JkgEwlWy; arc=fail smtp.client-ip=52.101.70.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TSUfhnvfdff9PgTBxOMstBJDmnKEF+Jw25gqHb9djdVTIAUFReuHDPrOQbU1nJiBlfQs9+cEOHjcxFeJ0SZf3OoYGqHipNsQ6tmgbJqe8c8zf76w4T6nlFpQ3BtQ+zEf1NPzOmZ70ykiqWSffDE55fMxg/9uebIvLtjH/jgSvvkaj6+uuxD8njR3lIAatoVGBamCDeB9uPTFk7RtEtO1Ue5mK4DOKEA0o4YbspfYzlbIcn/H9/sbMFhZnXZQzzuo/MbZNoPLpDpZoQ69DDt8WR6TggR4/B6Yx2pzZmk45VRZkV/+8HdHZBNl4vfaGGOZ3MsRqjdAowQga6tRqXXDUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CQ3Bt4/iEL4ldqZfk8r/bd6bT7li8msHDl9YSogD92o=;
 b=rxBGnJZP8h2fP5bwLm0LrYPFkH/HElTjDLoUAPyZ5tkGDvmApcXc2x0kxLbEej7mNfs+WoBcl0AEIU5pL/3Y3DA5VMW+N1cgWsbkBKlQRlncKK77gwugJATH7UDRVNUNUqU6T+thLWbVIQ+rZSgP05+VR8gMJKrnCJwpJevZZlEqcYEWHkQa9gOf8w0NCohp5IlXGQV3Qv4l65/o8SQB0nFeXaWHwCmWF+66X1QwPtgf1Qp3gOPR9+IVlZJjqgbVmksrZGRl4j2qjMC2NJAMrU2ay18vdZie7DJLqRPm880GzvvJ+oCb93Q6LPwo/BOGu4aYoikfO/mnkgFkGTG2/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CQ3Bt4/iEL4ldqZfk8r/bd6bT7li8msHDl9YSogD92o=;
 b=JkgEwlWy7LXwQ0vQ/28TR+63GRknWgbx/aJ6yw88Mt5MKEsDOU95U2rz1dBavqsAYRver4SDGh6FLaO7ASpWzwAi7UVsIUa6apqXi20zdW/FnRXKoWdaRuQjiNEQ27f0fjGPW4WTthgoUwVHyZr/YaF4u7F4SLTPWFoEkU8KSaWB55pq7cSucDNy/pC8EY/r+hLXFswa3wADW6Tmm5O9j/PfJtRQA0PY8KZqa0efDjnY2UESlQEZ+dmSEsyPqDSDXU2MyK6YLCHFJETYXJAqWLo/iww8wDjeHlkBrbjsQmgWrb6ld72+tCoB0LsdOdtwlvQYPB5kT+aia59CkFMBNg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by PAXPR04MB9680.eurprd04.prod.outlook.com (2603:10a6:102:23e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.23; Mon, 26 Aug
 2024 08:42:47 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%4]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 08:42:47 +0000
From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>,
	Larisa Grigore <larisa.grigore@nxp.com>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Subject: [PATCH 0/3] gpio: siul2-s32g2: add initial GPIO driver
Date: Mon, 26 Aug 2024 11:42:07 +0300
Message-ID: <20240826084214.2368673-1-andrei.stefanescu@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P191CA0043.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:657::10) To AM9PR04MB8487.eurprd04.prod.outlook.com
 (2603:10a6:20b:41a::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8487:EE_|PAXPR04MB9680:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b16ca59-cb4b-43c2-14e0-08dcc5ab0f3b
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RkZPOCt0Tm9TZGY0YnFFbWFEQzV4aDF2Ny8vejVEQi83dy90QVBzcXJhektO?=
 =?utf-8?B?WU15MEMwTXhZbTE4SVp3bEk1aVhCRXpZVXhBSDM3RFVJeitmWjlFVDVYbDEy?=
 =?utf-8?B?bHM1ckhWdDZSMm9ZVGlpTGxWUGp5Y3pSVHoyeThpeTNDTVF6bnozMHRrdkJu?=
 =?utf-8?B?N2pKS0ZvMXVCQStBQnIyL2RyWEt5WHpYTFdXV0N4ZXIwOVBrcTlmWDBCQXMv?=
 =?utf-8?B?T25RMzRHd3FidzFtZG80cnZQSklNa1lGUFMwUnNGa2tQUXE0RTNPVGtycFhj?=
 =?utf-8?B?RTcxbXJzclc5SHM5L3ZwYWhhd0tjMVBIVFNZUm5PcmU0SXB4UWF4d003Z0pU?=
 =?utf-8?B?RERhenpDN2M0Y3g5aE10RXJzQ3Bnb2wraTljYlRheW1YbnUrak9GNUMzRkpo?=
 =?utf-8?B?aW8rSGd0MHpGaU9SZUErV1l4ajRaZXhqbmdFR0JSaER3MVppYjVwTGNzSW8w?=
 =?utf-8?B?NjFBbGRzR0xiYndyMkJKOHJFUHFYek0xempXMHMzT3FtblFzT0oyV3hWb09w?=
 =?utf-8?B?TExoZjROYUhhcDlaZUtEYiswSEhOc2Q5SytSb1VaU3NLU3NTNEMvYUFRdVN1?=
 =?utf-8?B?c0lWREgzWFY0SmJKWXhKcEE3UnNNRTVLeUp1OFdWU1dmaGhZak5IQ3d6QUx3?=
 =?utf-8?B?c2FKWGc1S3VYSHJKUDRYcjc3VHlhZDNaa3VwWkd6OU1vMnJDSE9ZYmNvV0RF?=
 =?utf-8?B?bURmRkNNMm9LTlFlbDhsNlQ2WnI1SFhnZElELzFHclJzMnNVVmVLRUZJaVlh?=
 =?utf-8?B?eS90T2FYVVpzL2tQTFYydHZmV2dEMlNZci9YTEF1UDhRN2szMnowWk4yNUFK?=
 =?utf-8?B?U3JicXNKaS9EOU0rZ212ZEdlMjFVUWhLNXR6YUVzOHNyMG9ZMUl2eGF5M2U1?=
 =?utf-8?B?VW8vYVBVVnRYQ0kzQUZzZy9UWUFHNWl3cHFDZEw4dTgwYWh4elFrNUF5eTZp?=
 =?utf-8?B?NE5kTUZoNnJWTHRQU28xUVBqVlpVaEtOT2FxR2VEWkliSEdmcU1TaFExaHg4?=
 =?utf-8?B?bW9BSm0xbGhiWHlUOXpDRXdKcEVCcHhDMmU3OGxtbTFHbjJiTHBhRml3Q0oy?=
 =?utf-8?B?WHRKS1RQcC9CVXJDL1Z1QUgwUWJqSjE2eUgvdEd5VU1NN1JDcXhMVGZ5bWJT?=
 =?utf-8?B?a2lIM1NKNSs4bHdXSDVKa3U0UTkzdENqZTc3eWE2aTYrMkZ1MHZTcE5TOXdN?=
 =?utf-8?B?U1BnaFVObjJDcDFvdjdqY3htM3NTV0ZVOGRDRW5nbVd5Z1BDWUNHV0t2Rnp0?=
 =?utf-8?B?Ym1EUUkzT3hZVjhUYWJCb3pWOHdBU0hCRFFJQVJCR2Rza1lTYWxheWxYYXNw?=
 =?utf-8?B?RlU4eFoxWmtHdE53RVNpalRwQVhaS2prZXl6ZEVJT2thUWhrbG5ycDVkRW1M?=
 =?utf-8?B?NGtJZmYxL2lyL3U2UTNRamxJem5lNkZZakhJWGVNOEJwRHI4UDJaL3plUTc2?=
 =?utf-8?B?UExJV3VQMnFwK1VnY1FPbitpclNBVTYzb0xlMkVuNUoxdEgzMnZuSmpIVkJj?=
 =?utf-8?B?SWJWdjJWZUpUVklKWWI4RUlML1J4WmNxZFZwTnYxSG9TWDRueVI4NUx1YzJ6?=
 =?utf-8?B?Ync0LysrVUVtNXlCWnY4L1lKV0thSVZjTDlpczFSVWpjN0ZqSjB0RW5mOWZ4?=
 =?utf-8?B?YmVhbVplZ0VTUXlkKzJPRjZiaFlYUkc4TVRpZkxqZlpIUzVZdTJDU2IwRExq?=
 =?utf-8?B?WUxkMFhuSUNzZng2UmRraGFqQSs1QldtdXc0dUZMT0RGYklaQm41RUUvQWpV?=
 =?utf-8?B?K1dMOHA3clNqMTBHcDNCanVGa3ZrQjl6U0FEK0hnK2s4WHdESTJoUlpVaVhQ?=
 =?utf-8?B?ZDE2Yk9YSUE5L0V4bWg5OW9DSW5WL1A2djZJMFloMjNzZHBTZnZ3cU1nZlpY?=
 =?utf-8?B?U09MMTJ1RVlYd21TeklNWW9jZURlSXcxeFBvbDhuL3k5TFE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V3E2dDMvdmVoY0cySUdvZ1ErS3FUblJIVmFuYktLVDV0eFFOYnBPUXkrSWtD?=
 =?utf-8?B?V0FRd05VYjF3ZmVzYi9uUjVoOHFlT2o3d1lBRi9QcXlGWEVTRHhQR0hJblpP?=
 =?utf-8?B?dXhaU3hmUzNuVm5TNjg5SXFROWt0WXFHdExybjI4RnFUODNzRiszdHROeDJB?=
 =?utf-8?B?c1JWRUZkMkpsVGtZQWtUUFRDYjYxN2s5MVpweGR6Y09Ra0RkMVVPdVFxY3RM?=
 =?utf-8?B?L3Fad1hPUGlTaWE4QzRuanQ1UlRUZWFTWWIxZUx2V1FqRHZIcHNKUGZQM2xF?=
 =?utf-8?B?UStWT2pVbFd2K21lb0U5SlZvVGwvMS84TEw3UXlvNVVyelNBbnEybFFPMm9j?=
 =?utf-8?B?Z1BGemNtQVVCSjFNR2paUGJaV2FmZHBsYitRN053Z2tqN29VZWsrQjZEMk00?=
 =?utf-8?B?bHFPdk0vTkJPVDNubWcwR25KRkJtVWI4d0x1ZHg1WXpxeC9PMnV5UGRtRDVO?=
 =?utf-8?B?QTVTZFlFRUdTc1R1MXNtZnBrVmpNRkNBMnkvVjZiWmlkd2FScEhkSkxOeWRQ?=
 =?utf-8?B?ZmZ5WG5qbEJkSFlkTzRTT2tPNGVLS1dwcFkzMklTNjlEVUhFeHlBR05TNXQ2?=
 =?utf-8?B?ZS91MnluNDEramNsOGlLNHJDREEybzQrQ1ZNenNJeVJsbUZKcEdxeFlXaHlG?=
 =?utf-8?B?U0VXUjNMT0FzSjJvWkJxcXB5TVdrak85SkNZMnZTdkgwRm00Sjh3OE9NN211?=
 =?utf-8?B?U0M2RENINU9GZk13dmJxM1BiMHptUkYvZDluM0VrZmN2T0k0eHJxRHdGWmMw?=
 =?utf-8?B?empoV0lzUzRrbUR1T1JhOFJremtaQkg0Z0VSa2VENjJ0TC95M3d4ZllRa1dG?=
 =?utf-8?B?VXd4dDZKS1lHWTFhQ25UOFhndFNQSThyUUhTZVRnUW9ZTWQ5RmFKZ1RjTGxF?=
 =?utf-8?B?NmgvNlBVdVZXV1RXSUE0L0x0dTg2Z2h2c2dlbTRtNm4ydzdPMDZPWFYyWW5N?=
 =?utf-8?B?RXJpa0xoL1BLbUQ1QmdHNUdzZXNWajJMSmYxZ21jVHlHelo2N05tZ3ptTFUz?=
 =?utf-8?B?YTZpZ1JBRUZ2Rlg0QVppWkhweVd0Um1MYVRNa3hCM3p1VXMyVE9kV3pLZ3l1?=
 =?utf-8?B?L1dPdzR4aFZjYVd5MHJkcHVQcVFzbk4rN0FMNnVadUJNWklJaGoxMTV3U293?=
 =?utf-8?B?UHk3NnlOM1g2a0VSbzVlQzFDT2owaitUSkRiYmlFN3ZiVnoxZjVkMFdTcWw3?=
 =?utf-8?B?cnMxakpoQWRIbXpURk40UjN5em0rWTF0OTI2c0VvZG5RTEE3Y3VqVjJpelRM?=
 =?utf-8?B?UXlOd2VrQ0dPUXZ6KzJuanFHYVVJRzdGVmRzM0VsKzBtWkhnR0VabVAvUTVa?=
 =?utf-8?B?TFIvREcrY2pwTlhtZENadnE0d1JiTGt0TWVnNXIwcU5Jc0c1QURpK21ZS0pl?=
 =?utf-8?B?WWhZekQxK1ZuSWhGck5YRTlXRmFvdVQrSTR0b0NkZ05iY2lpYzFrUCtJeW9Y?=
 =?utf-8?B?ZlM3YVdGRjdTM1J1WXVQajlGN0ZWZGViL3YwUWJuRTRRQ2thTTlrNFQrMnhI?=
 =?utf-8?B?VkdSam9mRW9zSFZpYUlCZEVHenJhTFU3RkpSSGp5Ny83cHNUM2ZxcFFJaVhE?=
 =?utf-8?B?OXB6OWlPUFB3bTNpSXQvbzBHZFpSSVRxUEZsN3ZVRE9RazArNGZGZ1V6eUl5?=
 =?utf-8?B?VWdMVW40U2xKcGllSjMwZWFqQWx6ZUlQaVJJMWpOaStMNHJKaWtMVkhFQ2Zw?=
 =?utf-8?B?eHhDelVUYjB6S1ljZ2tSemVyTVJyc2R3SENLYTVmajFXRkFGZlpjandoYkdn?=
 =?utf-8?B?dVg4K0ljMGtGeDJZWXh6SWsyWHBvSGptUHpJV01xNjh3QVM3MC9XenZpWUNo?=
 =?utf-8?B?WlBOVkt0aEJReGRjWHpLd20zMk9BTHNZUWw2Q0hhMU1aTTVOOUZRbDJYeXVI?=
 =?utf-8?B?N0dWTXZZWUlZYUJ4SisyakRVMHp4L0d6TmVhZ3VNWWlzT1FFY3A5cmxaNjBC?=
 =?utf-8?B?emkwYVNoR2VoR2I5QUVUSXo0d3BheHh4a1cyNndKUnY0S28xdXQrU0R2d2ZF?=
 =?utf-8?B?ZnIxTHV4dWZDRWcyQWVkdXFXaTVGTitHZ29oa055eVpkQmV5TUx0N2VIUWpI?=
 =?utf-8?B?dVJjbkw0SEZUQ2xQQnVsWEdrNDF2T3VxWU9pQmxVVVdvL2xpeDhKcnVsTDR4?=
 =?utf-8?B?ZkRKaGZBd0QrVEdBcmRXbXpsSWF5Nnhjc1J1UFZrYTg3S3pnUVdvOHhkUWxQ?=
 =?utf-8?B?dWc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b16ca59-cb4b-43c2-14e0-08dcc5ab0f3b
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 08:42:46.9873
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LvuXwo3wIysLr+1i7wpWTVNRK8S01xrdfEhlLnPCFPXMGcoF+faTlrlE73rKqMzJThUKRs7Yiffb/nFU7SwozeLedpi+rD5+cCfFVb+84pI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9680

This patch series adds support for basic GPIO
operations(set, get, direction_output/input, set_config).

There are two SIUL2 hardware modules: SIUL2_0 and SIUL2_1.
However, this driver exports both as a single GPIO driver.
This is because the interrupt registers are located only
in SIUL2_1, even for GPIOs that are part of SIUL2_0.

There are two gaps in the GPIO ranges:
- 102-111(inclusive) are invalid
- 123-143(inclusive) are invalid

These will be excluded via the `gpio-reserved-ranges`
property.

Writing and reading GPIO values is done via the PGPDO/PGPDI
registers(Parallel GPIO Pad Data Output/Input) which are
16 bit registers, each bit corresponding to a GPIO.

Note that the PGPDO order is similar to a big-endian grouping
of two registers:
PGPDO1, PGPDO0, PGPDO3, PGPDO2, PGPDO5, PGPDO4, gap, PGPDO6.

I have other patches for this driver:
- interrupt support
- power management callbacks

which I plan to upstream after this series gets merged
in order to simplify the review process.

Andrei Stefanescu (3):
  dt-bindings: gpio: add schema for NXP S32G2/S32G3 SoCs
  drivers: gpio: siul2-s32g2: add NXP S32G2/S32G3 SoCs support
  MAINTAINERS: add MAINTAINER for S32G2 SIUL2 GPIO driver

 .../bindings/gpio/nxp,gpio-siul2-s32g2.yaml   | 134 ++++
 MAINTAINERS                                   |   2 +
 drivers/gpio/Kconfig                          |   8 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-siul2-s32g2.c               | 607 ++++++++++++++++++
 5 files changed, 752 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/nxp,gpio-siul2-s32g2.yaml
 create mode 100644 drivers/gpio/gpio-siul2-s32g2.c

-- 
2.45.2


