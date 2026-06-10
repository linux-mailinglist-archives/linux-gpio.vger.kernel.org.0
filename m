Return-Path: <linux-gpio+bounces-38250-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uQCjAHJmKWr/WAMAu9opvQ
	(envelope-from <linux-gpio+bounces-38250-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 15:28:18 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FEDA669B99
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 15:28:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=dig01HTy;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38250-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38250-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7CE76336B6FB
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 13:21:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E18A1A23A6;
	Wed, 10 Jun 2026 13:21:29 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011001.outbound.protection.outlook.com [52.101.65.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8BE409134;
	Wed, 10 Jun 2026 13:21:22 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781097688; cv=fail; b=hOgIm3EUpJoSNB/fktC0tcCV3Gwg5IVvy2P5Vx+JKLi9pNH3/TJY8immCuDa4JD8LtykF3evoq6ie8ykhHwGTo3zUk6E13GBLF5AeebyTSeB2orX2WUdMonp/tc79wkhdlRddrXSK4rEWQkJaUE/bDDNhWOwojb7Vp3cy0HTRRg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781097688; c=relaxed/simple;
	bh=Be1c7A3ylaaKNCQjOm/S+9mUmIJdhUG51T/955iEQG8=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=kJ6PEdTxiziNqvkJoYaPa9fiCGq1ovdZOOgXA3Hib/D/ZRXuE2m8A6vIby4JcWDoDTkRM2TQOUHB20fT5YDF3Ob9HKjeJ9NrlfKJgDkYLoCKsHIwNEJopRCTQCEDXt4cjk+dVd1It/0DyJeOftplEeZuDcC/n8k1udGrh3yVSw0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=dig01HTy; arc=fail smtp.client-ip=52.101.65.1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bO46S3pnFHSE1fbhxFaYlhxU+un0oG065XBG5F5um0CP5rQ4vs95SeC4ubgc4GgnoE5CIb7gPMwjkFApAk7RaKsTZV42b+AAGuoH9ztT21pwCiIO6xaXrtQFrp50qY0evQgNJIN1MLEgDEh1fxY0Udta4ewj4FkdcGbc/8fsTLqMpYHkihfqiiClJFZBX/Dv9F3ymXo90OENJHNpN7MogX2uceMsFXYCzCaToAiymnyPfFWDPrG0yamM/U1b9H5dPVw6hVCP17DNA/Ova2p1Or8sx7nwia+jAPhoUDsdD1f4zrI0+LVQGdN58ikfnuuuBq5Iv70t84BZ2MTzH7iHZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=drt5aU1vv5EZi/WvJghB2txl0pHsyFWDzdivobp2RP4=;
 b=Y4Km71P398gl+i0cM5H/hnibPnmXEIIJD46zNz4zP3kGr2kbgyEZsjjPIDma1FvzEApBapGIvulaEK9Z5nlo4YoM4GEvfSmsbcEvnCjEd+cLCDLFie1LNZSwhiNPzlYO4Tv0CrnemAr2mAqRFspLjniNlNnLA3k/N0Z2m0+GcUbmrOCdosSWlYcT5VCuKbN80G2eRXVw8xlmtJ3i6KFdc4IV1hxqO5gqnlLNREin+yzoCE+wj7xb7Hfw2G+A6oaAEBezwhdRv+UX9N1d2W9I7uB/C2kU+73Ww4weYvwiFCOYMuVdb3F5Kn6bAqVgtVF7ETlfUR6Q0zhiMmSSThSjWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=drt5aU1vv5EZi/WvJghB2txl0pHsyFWDzdivobp2RP4=;
 b=dig01HTyWuUG3si7j1JAnI0QyGT6HxmE0iLDQopcfV6W4mwPggvUKQKSO1hbE33eVewQtlldxdSati7lXOVJnQ4Iogysq7BxdR9hXG3hjNWkG1tzcu2Wvztyie/rq2pqj6xJ++jp2/fF8Tt/AFBI8OJWJFdOhuX/n6H0KmRdue//CFF+RrqrHAgy4t1mDJx7ItNmXp/YlM5XRae8JlvpJ/eZcw7tFQNzrOm9173JXxLS28VYtI93TB/d67S3p6tNwRzi+Ai9XVD1eiivJ+EpXCynm6UTxhcOp5J/X2cZeZXNEiz1KKbTtnlNZNRaCla+y87Wn0nmu3q5RC7/XoyZEg==
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::20)
 by PAXPR04MB9121.eurprd04.prod.outlook.com (2603:10a6:102:22b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Wed, 10 Jun
 2026 13:21:18 +0000
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85]) by AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85%6]) with mapi id 15.21.0113.011; Wed, 10 Jun 2026
 13:21:18 +0000
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
Subject: [PATCH v11 0/6] gpio: siul2-s32g2: add initial GPIO driver
Date: Wed, 10 Jun 2026 15:21:10 +0200
Message-Id: <20260610132116.1998140-1-khristineandreea.barbulescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P190CA0041.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d1::15) To AM9PR04MB8179.eurprd04.prod.outlook.com
 (2603:10a6:20b:3b5::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8179:EE_|PAXPR04MB9121:EE_
X-MS-Office365-Filtering-Correlation-Id: 860f4ac0-0630-45f7-504b-08dec6f327aa
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|23010399003|366016|1800799024|19092799006|7416014|376014|921020|56012099006|3023799007|11063799006|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info:
 mMn/PXVuvFPgTiGO/Jjmfp9eL9gx2PFqnZrmjRw7hiQtlSnC/qxHzNxb+wWwE2CQIynSviqyzDpa2kpVXhzj79JJnOdciGadNsmpg5Ux7YJHIPHp78ETKthuAYawS4yZWcn0/k6GbvSkgke9TYYep1JnJjRn/3Cos+JkHidFCkhvJzkrwra0i6KuHELdbQNk15Azt/SDJbz67eqpR+1oAUbF8r1HOXg9HYnXSCLllj7ap/RuuIp2qqp4p1/XoZ554CkutODdKcK3iIcIeOae7X57dJIG0whCrTrIHOvjB6y6if5vITcnYRd+S83PuepODyKOt6dzLQ7U0Z6LnJ3aIo6t/BnzxcQEAGx2s0hJNxh0XAKWMJKOt7B/Y/66Nl/gZhzKbaFfed6mdWXtSpPkAwsX4cwO/aEqEVRhAYfFv09Q5eZeHr3U+PHqQG6cwtkgKYKuW0WeYyq8CQ+1/oWKSaA+A6IKg9rHCIU367aVtJcgPhb/ZEVaTphiP/eKEVTbVBLQrUdLevxJY/ETJPXGBHbEE5897IfAcOuTGvFc3bXI+aQTRpC7TRY755oZj/hWtEGfmIh4bkF4uu2o4LCHkPx0cxjCE+Ixqfp9Mpq8MPfxJiBFPe4acqqrN+ypX7gRtT+8YB0O/WHcRDhFsacOFJz2gxsrljCOQuIyP/e3+92L2cH8Zhwfrstn/Ny2b4sEqXlwi8uN41RjgM334XN+5Jbrt0eeg56gQ3FLqZBSJJo=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8179.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(19092799006)(7416014)(376014)(921020)(56012099006)(3023799007)(11063799006)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?WU44b0ZiY0lpdlRVTmpyMHBPQ3ppNjBUdEpDQTREM1NDTzdmc2hKWkJXeGJa?=
 =?utf-8?B?YTJPdmxYZDFHSDhaL0RJL0pJWUpxMk5uV0djMWhkVk5FS3lFYng5QUpjRXNM?=
 =?utf-8?B?eDJ2Y0s0VWs0QW5DWml3a0Q0QjYvV2M0bVhCZktVSHBydlU4QjFKWFl4bU5j?=
 =?utf-8?B?MDJ1ckVpTmM5NlYvbEFiMDFoTlUyUkNXSm1PNWZOd0pWUXVWNTQvRHJoNUhm?=
 =?utf-8?B?VU5kd3hGQ0hSdUtvMTdnWFZvZUR0SjFHZ0Fsb3RsSlJpeFdzbHhCT1F2TTE3?=
 =?utf-8?B?QWhTVHR4RnVCZ2RNZzNvR2lNcVdxdnhaQkMvV0FqZ05qOTdmcnZXaWhmbzJy?=
 =?utf-8?B?M05IOXd2K1N5RXNhZGVUK1NMN2NIaVU0MWgvRWR1dFozODRDZDlwRnZBTExC?=
 =?utf-8?B?ZnFjai9GbW8ralYzUWUzc1JoVERseE8vaXJNdStweExwdXJMeUF3c1hRUHBy?=
 =?utf-8?B?R09QTWhVbVZKQTJ3TmVtdS9QcU0yY1ZDajA2ZER2RVJFUVpKODd1REpqL0Vk?=
 =?utf-8?B?UHkzZEpoeWhKRks0RDdhQkorbERvQmZ2YXRDbE5wQzdPcWJwN0UvMUZ2a3Fy?=
 =?utf-8?B?eU0rV2t4WndUVFBXRUFwTGtqOTdRVHA2MUZ6bDUwVEh1Q1c2RGsvWEZOREIw?=
 =?utf-8?B?Z0ZLbUtKWGRJdExadzdBVS85UVo5eXBuRzlqNFNLV1Y0ZXJFNVc5TU0yczVj?=
 =?utf-8?B?SGo5UVdXZGpZeDI4TEtlM2MxSUNHVWdWNGhRRm82dkVxbllRR0xNa1NONGN2?=
 =?utf-8?B?MnJIMzVKMlllbDlGa3kvVEhseGFVeVhGc3J1MnhteUUvYmpHQ3BsVTI5V3Qy?=
 =?utf-8?B?a2QzYTVLNG4rOTVmREtuaGFvVkcvcWR5SlR2MVZrSkYvYTB3dTlIT2NQck1t?=
 =?utf-8?B?LytHbUorMVlIWnMrOWZyOGpjWGF4akVKUDBjR3hpQWgrUmpCOG5pd2RMbDJK?=
 =?utf-8?B?SENKdmJBSDFBcEdEYlF5QlBFbTBvVldhN1VsMTRVSmlzaktDUXM1dWdyaEVv?=
 =?utf-8?B?TlA3Y0Ixa2MwN08yQlcwN0NhZXlEUCt2UFhSMjVieGRRRzBOWjRqN2pHem5x?=
 =?utf-8?B?elRwR3orbURFRjJCYndUODZBSU1LUWp3UVg5VDlEOU82SWc2VUdybUdlc1Bw?=
 =?utf-8?B?dmhwclMxQmhhTEczVUpiSW00Sy9VNzVLbVVWOFNxakZmck1oaE1aSitHKzJi?=
 =?utf-8?B?ejNjdnUyT2JwWGo1N056cnhuV2pndFFRVDd6ZFp1MjR4Wm9kWEJvS2RIYlA5?=
 =?utf-8?B?RnhtKzlpcExPNHl1bElYcnJ0MEptaVBrTHZXWXRoV1dKeEZlK2huWmdYblUr?=
 =?utf-8?B?dm9VRkppbDYzYTEvTHhmd3l2eWdTeEpGWHo4eU5kR0htSVFkRVhRNnh0M3k0?=
 =?utf-8?B?YlRhU1NMV3Y0L1llQ1BDUEVySEFDdEhwQXBnU2JoejJYV2M1WlZEY09jNC9M?=
 =?utf-8?B?WmFVVmk0aHlzV3JkZVBidzZaNFVKNXJLY2lNeUxicHVvY0w0dFgyZldlVSt0?=
 =?utf-8?B?RHdkeXVHbCt4Sm41ckw1ZXcvTEtRU0xRYUh6MExEMmFPTzliYkRXYnFYQW5l?=
 =?utf-8?B?UkkrNzJlOFAxek8xY1FJUUQvTEdmSHd6UTlacWJ4Yjg4VEhQaUQxWkQyejBj?=
 =?utf-8?B?SGUrc2lVaWY3OFEwaVhtTldXYjRicVlCR05sbHVucDN6Q1RkcUNvT0NtSXVo?=
 =?utf-8?B?YStjTkdQWUt1Qy93TjNHS3B4dzZGVVh6aGRiM2VUdFl0YVlZUno1VHhza3Va?=
 =?utf-8?B?Qzl6bjg1NGI1ZWxaUjZLV2lOQm1ZYWNnZ2JLMmVFNy9QQXRXVXRndXliS0kz?=
 =?utf-8?B?Tmd5U29PZmJ3YlZ1SDFnYkJZWDZBN2JUa3hGTmE1RzUyTmhmbzRWSzVZR3Zn?=
 =?utf-8?B?UW0vemFEdEZvdHl1aUIydm9ySUFoZWhvZFF6UDBZQkJnOUZwYlhySXErS2xP?=
 =?utf-8?B?Zjg1djZYUiswNGQ4MGxqaXhhbFBiVXBKVU9DN0RWNjVqVU1CNGdyMVgxSCtq?=
 =?utf-8?B?OW1mYS94b1cwTWRNVzN2L28ycGpOOTNQMDdFblRMa2hSektHZXd0S2swZnR6?=
 =?utf-8?B?bmdYWkc2a0Nhdm9kV1E1Qk13eEhMelFBc3M1R1Y4YTB4TVJ1dk92dTh1WTdK?=
 =?utf-8?B?ODlualpvaXhNRGpCMUt4aUJScGNuREZ6QTBPY3BidG82YUhjYkZ5SHZxYlJQ?=
 =?utf-8?B?R0w1R0Ziby9BQ01ROFMwRzN6ZTkvam5XMkRXdVFYVVZ6NDRJYkZFTVFqTW9v?=
 =?utf-8?B?U0kyMWZuVy82bnNWNzV0Uml1VHV4NVBYUjZIRHBXWGVNOER2Ri9rRmxjWExQ?=
 =?utf-8?B?aHFQL2EyNGlJbExMVDVMV3VETjF3ZE9CTjRkVnhWRkErMHlEU0Vkdm5zbCtH?=
 =?utf-8?Q?J42R5r6/7o9YmpR/F0UEvOCx+/AdDZREnSKYs?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 860f4ac0-0630-45f7-504b-08dec6f327aa
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8179.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 13:21:17.9794
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 035BmBm3mNGCjqLMlnibY/c4KMTRW3idJD6+eeRlZ5rBoizxt3LHiIDBGy1jjOTTxAF7FjYpBq9cz44mRMEt1fjhvvpyDIpSKGr8eCdb8Meaye311hGvY0iVufmpfcJw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9121
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38250-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[NXP1.onmicrosoft.com:dkim,sashiko.dev:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.nxp.com:mid,oss.nxp.com:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0FEDA669B99

This patch series adds support for basic GPIO
operations using gpio-regmap.

There are two SIUL2 hardware modules: SIUL2_0 and SIUL2_1.
However, this driver exports both as a single GPIO driver.
This is because the interrupt registers are located only
in SIUL2_1, even for GPIOs that are part of SIUL2_0.

There are two gaps in the GPIO ranges:
- 102-111(inclusive) are invalid
- 123-143(inclusive) are invalid

Writing and reading GPIO values is done via the PGPDO/PGPDI
registers(Parallel GPIO Pad Data Output/Input) which are
16 bit registers, each bit corresponding to a GPIO.

Note that the PGPDO order is similar to a big-endian grouping
of two registers:
PGPDO1, PGPDO0, PGPDO3, PGPDO2, PGPDO5, PGPDO4, gap, PGPDO6.

v11 -> v10:
- add GPIOLIB as explicit Kconfig dependency
- mark regmap config as fast_io to avoid mutex overhead
- propagate regmap errors in debug show callback and
  suspend/resume paths instead of silently discarding them
- introduce a per-range sparse flag to handle SIUL2 instances
  with a non-linear PGPD layout
- dt-bindings: drop redundant minItems from legacy oneOf branch,
  add gpio-controller: false and related properties to prevent
  GPIO/IRQ properties without the required reg entries and
  drop maxItems from the GPIO+IRQ branch

v10 -> v9:
- implement GPIO via gpio-regmap backed by a regmap for
PGPDO/PGPDI register translation
- remove the successful probe message from the driver
- switch back to a single compatible string for both the
legacy and extended binding layout
- update binding: GPIO/IRQ properties required only
when extended reg layout is used
- remove unnecessary return value checks for MMIO
regmap operations
- replace kernel-doc style comments with regular comments
- solve relevant sashiko.dev findings
- rework GPIO request handling to preserve pinctrl ownership
- use __free(kfree) and no_free_ptr() in GPIO request path cleanup

v9 -> v8
- remove the SIUL2 syscon child nodes from the
device tree and DT bindings
- remove syscon child handling from the MFD
and pinctrl drivers
- remove the MFD driver and use a single monolithic
pinctrl/gpio/irqchip driver
- add a new compatible for the pinctrl+gpio binding
while keeping the previous compatible for the legacy
pinctrl-only binding
- update bindings to include the PGPDO/PGPDI and
IRQ register regions in the DT node for the
pinctrl/gpio/irq binding
- add IRQ-related entries in the bindings to
document the intended hierarchy; IRQ support
itself will be added in a future patch series
- update DT nodes to match the new hierarchy and
compatible scheme
- fix dtb warnings
- reorder commits: bug fixes, API changes, DT bindings,
driver implementation, DTS changes
- split commits further to separate minor
style-only adjustments

v8 -> v7
- remove all ': true' lines from properties in dt bindings
- remove NVMEM MFD cell from SIUL2 in dtsi
- remove NVMEM driver and configs
- expose SoC information via syscon cells SIUL2_0
and SIUL2_1 in MFD driver
- add SIUL2_0 and SIUL2_1 syscon nodes in dtsi
- add patternProperties for "^siul2_[0-1]$" for syscon nodes
- update example to include syscon cells with proper format
- remove `reg` property from pinctrl node in dt binding
- update Kconfig help text to reflect new syscon structure
instead of NVMEM for SoC information
- squash deprecated SIUL2 pinctrl binding with new MFD binding
- dropped "nxp,s32g3-siul2" from MFD driver match table
- fixed commit messages
- fixed dtb warnings

v7 -> v6
- fixed MAINTAINERS wrong file path
- add unevaluatedProperties, change siul2 node name, remove
  jtag_pins label in the device tree schema
- change compatible definition in schema
- change node name in dtsi
- mentioned binding deprecation in commit messages
- split mfd cell conversion commit in two: one for the
  previous refactoring, one for the mfd cell conversion
- removed Acked-by: Linus Walleij from commit:
  "pinctrl: s32: convert the driver into an mfd cell"
  because of changes to that commit
- deprecate the nxp,s32g2-siul2-pinctrl binding
- add NVMEM MFD cell for SIUL2
- made the GPIO driver not export invalid pins
  (there are some gaps 102-111, 123-143)
- removed the need for gpio-reserved-ranges
- force initialized pinctrl_desc->num_custom_params to 0

v6 -> v5
- removed description for reg in the dt-bindings and added
  maxItems
- dropped label for example in the dt-bindings
- simplified the example in the dt-bindings
- changed dt-bindings filename to nxp,s32g2-siul2.yaml
- changed title in the dt-bindings
- dropped minItmes from gpio-ranges/gpio-reserved-ranges
  and added maxItems to gpio-reserved-ranges
- added required block for -grp[0-9]$ nodes
- switch to using "" as quotes
- kernel test robot: fixed frame sizes, added description
  for reg_name, fixed typo in gpio_configs_lock, removed
  uninitialized ret variable usage
- ordered includes in nxp-siul2.c, switched to dev-err-probe
  added a mention that other commits will add nvmem functionality
  to the mfd driver
- switched spin_lock_irqsave to scoped_guard statement
- switched dev_err to dev_err_probe in pinctrl-s32cc in places
  reached during the probing part

v5 -> v4
- fixed di_div error
- fixed dt-bindings error
- added Co-developed-by tags
- added new MFD driver nxp-siul2.c
- made the old pinctrl driver an MFD cell
- added the GPIO driver in the existing SIUL2 pinctrl one
- Switch from "devm_pinctrl_register" to
  "devm_pinctrl_register_and_init"

v4 -> v3
- removed useless parentheses
- added S32G3 fallback compatible
- fixed comment alignment
- fixed dt-bindings license
- fixed modpost: "__udivdi3"
- moved MAINTAINERS entry to have the new GPIO driver
  together with other files related to S32G

v3 -> v2
- fix dt-bindings schema id
- add maxItems to gpio-ranges
- removed gpio label from dt-bindings example
- added changelog for the MAINTAINERS commit and
  added separate entry for the SIUL2 GPIO driver
- added guard(raw_spinlock_irqsave) in
  'siul2_gpio_set_direction'
- updated the description for
  'devm_platform_get_and_ioremap_resource_byname'

v2 -> v1
dt-bindings:
- changed filename to match compatible
- fixed commit messages
- removed dt-bindings unnecessary properties descriptions
- added minItems for the interrupts property
driver:
- added depends on ARCH_S32 || COMPILE_TEST to Kconfig
- added select REGMAP_MMIO to Kconfig
- remove unnecessary include
- add of_node_put after `siul2_get_gpio_pinspec`
- removed inline from function definitions
- removed match data and moved the previous platdata
  definition to the top of the file to be visible
- replace bitmap_set/clear with __clear_bit/set_bit
  and devm_bitmap_zalloc with devm_kzalloc
- switched to gpiochip_generic_request/free/config
- fixed dev_err format for size_t reported by
  kernel test robot
- add platform_get_and_ioremap_resource_byname wrapper

Andrei Stefanescu (2):
  pinctrl: s32cc: change to "devm_pinctrl_register_and_init"
  pinctrl: s32cc: implement GPIO functionality

Khristine Andreea Barbulescu (4):
  pinctrl: s32cc: add/fix some comments
  pinctrl: s32cc: remove inline specifiers
  dt-bindings: pinctrl: s32g2-siul2: describe GPIO and EIRQ resources
  arm64: dts: s32g: describe GPIO and EIRQ resources in SIUL2 pinctrl
    node

 .../pinctrl/nxp,s32g2-siul2-pinctrl.yaml      |  90 ++-
 arch/arm64/boot/dts/freescale/s32g2.dtsi      |  23 +-
 arch/arm64/boot/dts/freescale/s32g3.dtsi      |  23 +-
 drivers/pinctrl/nxp/Kconfig                   |   3 +-
 drivers/pinctrl/nxp/pinctrl-s32.h             |  35 +-
 drivers/pinctrl/nxp/pinctrl-s32cc.c           | 756 ++++++++++++++++--
 drivers/pinctrl/nxp/pinctrl-s32g2.c           |  47 +-
 7 files changed, 877 insertions(+), 100 deletions(-)

-- 
2.34.1


