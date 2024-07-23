Return-Path: <linux-gpio+bounces-8363-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF99793A13B
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jul 2024 15:21:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DD24FB224D4
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jul 2024 13:21:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 803E8154C07;
	Tue, 23 Jul 2024 13:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="g8amCbL7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012025.outbound.protection.outlook.com [52.101.66.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE9D15442A;
	Tue, 23 Jul 2024 13:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721740799; cv=fail; b=H30SYQ+b56GhJAwhnBNq5w57MN11SvnJ14mQ83mpiq8nKFWSo4OTARKFxcw5JP8IpacsiGnyCeMHXqCeqh+BeAM7Dv+pDtZEHCuq9rkn4tuYBg0n+s9Kn6hazv2ZKoq3Hq4A+48cCPjmDhSRuKYZYrrJxx8NEvQOU2iNnQNHeHw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721740799; c=relaxed/simple;
	bh=2NdiY+T3N9IcorQfLiDyGR/+JqBOfZq2H1rJqijaljE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=u0Eu3Sxllm15FWJlKIUByXfbfWUnvxbJdmoBEXTkr6lZSzTExmzFQB+a0F+oNfTCfTvifiEkkb4Zg3GX89R3VH3Ww/PXgcS2IFqQfLcffglx3xsr0bwm0WbDmab26FXO/TyoosGmFns3PNcQxjRA0KflSW/wXDEQjotUOgCi2Rs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=g8amCbL7; arc=fail smtp.client-ip=52.101.66.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BxAFK8lQ6Xyp48GqjFTnZrGdLJK/yCulCClmm2k5jtWMDSTgCLTzt27+sOmrACB8OBj7Kto7BoiVOVvopQpDXvFJs4+3onIHOTzngBUwsuTUVvOa2oOBcYCN4gxZnkfGFuF3WBgjQOrLD6yZNXaoeFpKmbGG5TCg5tb66yKN8ynK05TPM95YkzW/nOtx4EiJN51Nl98FerSWQlS+vo7DsU6UzdGforUM9OHm6y/CQqLbZQkIIuQjYMIMpAqLnSOz4tUpR5mU9ySbEhcHKL7dkcUpkkYaTBXntGj5xA0j4doZtbvvw59wWzY9YAX0gfgXbvbWbps/Wzxd+HA88hK6Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KZmlq/AZNxoGPdGzwa05dL1hWgBWRU/ZlkGDI4yIPQ0=;
 b=Jc5g0MwMm5aoNPoIMyMf2FOXpg45lP9F4E9C48jH3+Lr/ej1uN1FQD5YWdNyDb7vXJMOUvmz06rinxhrfIL/c7p2NI0S0Lfn7kNQchkyhDCdCKJ4hfIzMPiXBdwwiWxlKHh3SkgErSoxBZ7qeuOk/M65Vd2vWzr6ae+fu6XURK5rcSD2nQRPZF/ehzUgI3gjZhvKhqv662lR9rn4pey0oIPuOUjs5kSKvY7MR5wGe/5DYIxf0tDoMdGMva2xIaw9fFZfuYpAAFNcpoBfPVYNi06kTo+AqRaAgOpsF0BVFkfYL0YQIWuQoGknGS9zJrUEvT2ykfFogDBjDo7UUTp4Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KZmlq/AZNxoGPdGzwa05dL1hWgBWRU/ZlkGDI4yIPQ0=;
 b=g8amCbL7wmOt66lxGiK3CILFGkm8sISwNpddSsKeUtnhlQRI3xaI/rpv555+d9MlcVFqKMX4N52+IREWdDAnFIgScruxTv0B4ZUo/HOG8InKuPu+Yyt3cG7ZYxTaK2UsLwdWkeWyRfEIbDp7XYaBCQmKIF+BCE4s7Vbgacbn3i8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by PR3PR04MB7258.eurprd04.prod.outlook.com (2603:10a6:102:80::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Tue, 23 Jul
 2024 13:19:54 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%5]) with mapi id 15.20.7784.013; Tue, 23 Jul 2024
 13:19:54 +0000
From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>,
	Florin Buica <florin.buica@nxp.com>
Subject: [PATCH 1/3] pinctrl: s32cc: enable the input buffer for a GPIO
Date: Tue, 23 Jul 2024 16:18:30 +0300
Message-ID: <20240723131832.1171036-2-andrei.stefanescu@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240723131832.1171036-1-andrei.stefanescu@oss.nxp.com>
References: <20240723131832.1171036-1-andrei.stefanescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4PR09CA0016.eurprd09.prod.outlook.com
 (2603:10a6:20b:5d4::8) To AM9PR04MB8487.eurprd04.prod.outlook.com
 (2603:10a6:20b:41a::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8487:EE_|PR3PR04MB7258:EE_
X-MS-Office365-Filtering-Correlation-Id: df165f30-729d-4797-9ed5-08dcab1a23f9
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c0dqbCtHUlExL0FzTHEvRENlQUVHR2syS0hKclc1MlZiYmY5d3hQWTZNVkpw?=
 =?utf-8?B?ckFvZ2tCSkJHTXI1S2o0OC9SaFZkRlZEWWRsWm5OU25KREYrUVZ5eXRlV2g2?=
 =?utf-8?B?bW1XaURxNUFaUlFTamNPTVlYbjZMUjEzbGYxM1d0NFppTVJkb3VNSDZFSXZo?=
 =?utf-8?B?Mkd5bWFDcktqRzEyWXQ4ZDlqSGgzbkZ0bzRHd0RhMk9pQW50UUl0K01vOVB0?=
 =?utf-8?B?b0lyZ1o5c3pubEIzV1Boaml5M1d0WFlxb09uTmMxTFA0OEJGanQ5WkVWTGZG?=
 =?utf-8?B?ZzJRQVBBUy85OE1QaVVPZUJKRHJzaXRoVVNYOGZNL3RwMUpKVGZWbWV6cDcv?=
 =?utf-8?B?cFlKbXJ5N1UwTFlIVHFISld0Z3VwZDgrb2ZIckVGbmZnUUxCOXFYUVJXeVhU?=
 =?utf-8?B?VXcvaG5OSnZtTFp4bWRtdVo2RXZ2anlXMVdwTVoweHY2RDVFWWpFbmcxU3Jl?=
 =?utf-8?B?dEJSdXZxNlBIUFE2NVpKVy9ub2Y0aHpGREZtRkN2bnVlaDVtZms5cEpEcUFw?=
 =?utf-8?B?ZEtudFdUUHluTDVGUHRIRTJjbzRVTkJycmd1MlcyelFwcVJpbEtJQU91VzFU?=
 =?utf-8?B?RExFMkk5QnQ5ZHdpR1p1NURQTkh5NDNMUCtmRmFvRTVXMEhydURyd2pRdDRR?=
 =?utf-8?B?ajhES2h2K1BkU0VhZ3h0NVZ4UkRpTm4rUnBtdnRWZUFSZmtwQURRQzduNnJD?=
 =?utf-8?B?K1hnQzg4bGwxWmtJRVVEKzQ3TDVJNTI5RW9qRkt0R0pUU2h2UzJlTkJkWXhF?=
 =?utf-8?B?NXQ1WUxDOGJlb2FQTXVERVVaWnl3Rm5LcDU3TXN1ZmF4OXlHWmVFN0U4SExp?=
 =?utf-8?B?MUdQa0Raa0hncGZ6TW9kdGovK0F2MDRCNkU2eTU1ZjZ0R2V2eVZhZG15cDYr?=
 =?utf-8?B?N3dqbmljZkZ5OExhcGVEZnJEWitaREFQRUFvSUxaVUlpVlVKQzVocVJZcCtm?=
 =?utf-8?B?NUNnL0dwbGxlaFFuempEL3Flb2NLN3NKWlhsSWdaNkcwZkRSOU1FcERtK0to?=
 =?utf-8?B?bEtvVFpQTGQ0U00rSXE3RG80TFFPSWdKR3RmZjRidnpUdHNMTHQvY2JNMVg3?=
 =?utf-8?B?OFF0VlIyWDJxKys2Yi9iOWx1aTZkSGV4QXlDeVpBLzl4bkMzbnk5MGFLZy9X?=
 =?utf-8?B?Y250K0UzRzQwamZqUUFhb3BVNnRyTXNzNkRnaDd5cjFZelFOeW9JSWVyRDhP?=
 =?utf-8?B?OU55YTN6K2hZQzF4VUxRQkFRSWg0b2hIZWphOU1vWFI5aDMwZ1NlQTJQQks4?=
 =?utf-8?B?MEl5bG1YdXJJVkNBNTQ0cTBuWjJuUkZobDNTamZ6QzE3M1FsWnlVVVBzZWk2?=
 =?utf-8?B?WG9RWkQ4UlFhaFYyUWlINDA4clNUNGwvZDJmendXM2hDWWxRaTdsbHQ1L3h4?=
 =?utf-8?B?NGJEYjAydVR2ZXhTOEFwMXlCNmJoTTNXMEQ2ZnQvTitmcUo1am44M3B0TGlF?=
 =?utf-8?B?RTZLOVYrUW1lYitNRjBjdnVneDJBZ2h3VjNRV0k2SnlVNVVmeHVMRVp5RkpO?=
 =?utf-8?B?eTBCcnByNktldlF3Zmo0SHR3Q0dpNWxNMDYzZlpnTnl0YjRVdE1sZ29ZMFRM?=
 =?utf-8?B?SThkR2dJeDQrUkMwa1k0Qi90NzVJcDArS2RVUmJZVld5UFhqaTZrM0RYalVw?=
 =?utf-8?B?TVYyc2p3VDE3eUhydnFPalJ1amlUUjJzYWNFUmdFTTlHVWUzQVhzU2RjUWw4?=
 =?utf-8?B?UTVhM2srUWxIaW1lNVo2dHgyZzErU3VxZmthcHAwYzFNVzZseGdRTmdlNWc0?=
 =?utf-8?B?eHhiRmx5STRKVjBtbXc0RmE3U0t1UlVMcmlmdmJjUGxhdDZESmpPMW5zTmcy?=
 =?utf-8?B?VHgrM0VnUzQ2V3h6VDhJR3ZMVzl5R3RXN1JBZXBiaU9tSHVrSVZmTTdEdDFJ?=
 =?utf-8?B?WlVtOWpnc3RDVFRXalJZM2lrYzhXVUpOaVR5bW00U2g0Q1E9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aHVqN1dhVWZmVVVleHhWcUM4eFM1K3pSUysyS3EvTkNIWVJzVHM0dHRRUk9Z?=
 =?utf-8?B?TUNuWTNvYUVqQmFYSTBrWU9Qa0k3ckRPRHd1cHZ1YnVyOVZYNzRUcjJlUVg0?=
 =?utf-8?B?bTF2VHZtbmJ1MHBaQzY1aGxqbUdmak5VTXpnOGxkbHNhVTQwRmRUdHdOUnlr?=
 =?utf-8?B?UmdJdmFhL09hV0JvdVpVOHVSbE1GaUFEVWpwVU8zN3NGd2kzUC9LaWJ5ZHI0?=
 =?utf-8?B?M1BablRtam9zV0hIY2Q5S0U5dURCbElrRnlsTGlEcFNPcjgvNUFKQkVreWRs?=
 =?utf-8?B?OGdLMWYxMkc1N2RzSWtzaStKVklqK1NFVTJTY2JobTdhdHVOM0RMalpERUJ2?=
 =?utf-8?B?dUVzdWEvZnhIMWhOYitReVpxY3doSmJiZVRqRFBTZEFtZHlrMzBaUFpQNmc5?=
 =?utf-8?B?dFhzQXh1Q3I4RTdRZ0ZSU0U3M2VaekNsZTJxZVdBRmZUVGQvUGsvQUw3M0Jl?=
 =?utf-8?B?MnRwQ3VXZEtYZU91K0lUVnIzTGVaYWRzS1JWMjB3YzRybSt5Y3BIQkIwLzl1?=
 =?utf-8?B?aDIvSzRPdUR5eVhOZjdlWWtDdWorYTgwTnhLQStUMHRxZEFKSU1jR0tJci9K?=
 =?utf-8?B?V1VsZEtaWExvbGFRcDhNYnBiRHNQRzRIMTNTbUx5bUMxRWFjUjhPYis0MTJM?=
 =?utf-8?B?blVQeFBhSVZPT1FRS0o1MTdXTlEydlYzWUpkYmRSWEl1eFd1cTJEMGZjTmcx?=
 =?utf-8?B?ZWFDakUxRXV6WXJUb2VUdVV4VnZXQ0YxU0F0YkNJU1VOZnNmVEhZTmI2ajR1?=
 =?utf-8?B?andpYzhPYnpCTkNYVWVJZ1EwcldMMmVDOWpFK0NkUDdLZTRFQWFoRjRyUWNC?=
 =?utf-8?B?WkprckppMjM0QnVxdVQyR01LYWtLRmY4ejZKME9UaGhHR2RCY2IwS0dCMnFE?=
 =?utf-8?B?M2ZJWFMwTDA3Uk1XbnNOVDdoWDFSdFdsK2RSVC9Ta05vcHRwcVNDUnE5bnlu?=
 =?utf-8?B?UWZmNU1ySUxsTHVKaWsvM2R2UlBIZ0dOc1kvMEthVXN3K21ncFdZeVNkaTRJ?=
 =?utf-8?B?Zk5DRFp3Y1BWcndtblhaelMvQVI3dE5yZTdJY3lCeUh6anRjMmhXOFUveWxu?=
 =?utf-8?B?Mk5pd25zMW9DSGduSGFQaExJOHJZQlI3K1hDaDgwVVdTMkxlK2tkSmh6TUR1?=
 =?utf-8?B?TERRQ2M4OFp4MjdpOGZ6NHVSNEhRZm02Y2s1dUN0ZHhXb3llLzlKeVVRaFNl?=
 =?utf-8?B?VmxicytVQU91NlV0RGw0dUMvQ28rVEF5Y3lTTzA1STNzTUlVVkNqdTJSYWF3?=
 =?utf-8?B?ekIxM0Q0WVorVlkzeWw4TGZZT0o5TFN3N1Q1TVJDN2NBZVIvT3ZVSkN4b0tL?=
 =?utf-8?B?MG01ZWNXdUsrRTNLMENJS0R0dTFaRkx2SS95NlBmeE40WDB5ci82a0s2eUM3?=
 =?utf-8?B?VWc0SU5lY2o0cjFrNVYyU2ZHT3pUWjJuanNJVk1LYmUzVFhnOEtBZVNRMCtL?=
 =?utf-8?B?MGxmU0krVyswVm5yaGR2blVaZ0prenYxdXRWLzBrRDJPT01qNkYrQnowU0Fl?=
 =?utf-8?B?eGxKL1ZVTXE3Y1Y0K2lMcnJUL21SMXNkQkhTZW9qeTFMOGtaQS9RRitpbFNY?=
 =?utf-8?B?WVdLemlZTjdqMFYyc0t1LzEydTdQcGVIV3hlc2wrbUxzbks5eVJkQ0tzemJq?=
 =?utf-8?B?ZTZJbGg0dzh2WXVqN3dhY1hhSWJFb04rNm1DeHkzamZwalgrbXByWElXY3lO?=
 =?utf-8?B?WkpzdHg5U0Y1NmkzbGFEUFNGTjhYMmRrT1ZjRzJVcGlBZ1dpUlNWWDNtcEdC?=
 =?utf-8?B?NWQ5TjBHZUJGeUlRaGFWa29Wam9WeTY0MVZVYzdHbjAxQlUvZURsaW1FS1kz?=
 =?utf-8?B?YUwvbXZjUy9FcHlwVndPckwwbnVPTThYZkhCTUVsQWcwdkpqK1dPVyt6MFQ3?=
 =?utf-8?B?Zk1SQ2Z6Mml2TU03VWUveEE2RCttQWpkWDVtUG8vZEtpQlVLeUZ6YXQzNjBF?=
 =?utf-8?B?a3dlL2pKb21JV0tuOUswOU5CQVlVc2lzV1k2MmsvcmdTMFJiN3U2ZXhZQWdQ?=
 =?utf-8?B?N1RPOXdKK2czNWI0V2htbzdFU2F0a1B2WVRrZjJwMXUwNlZxbkU0L1N0Y1dJ?=
 =?utf-8?B?aG1tUzlvZUp1YVg3MUNQRVhmRkhtR0paMkd5Q0tOejYwVCt1T1U2MDhUNnBo?=
 =?utf-8?B?WHcxdmpseUFDYXV1SXVoL01xZEc0MDRQeGVNQnRuMFJQZU01Qk9tQkIvdGNB?=
 =?utf-8?B?M1E9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df165f30-729d-4797-9ed5-08dcab1a23f9
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2024 13:19:54.2458
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iH+o3YPJmkbbO+kEXBTAZzi2KiVeVyS+ImVaNH9qFxWAoALmmO7t4+pBz3EgRYn95wEVR3a9NiMA/LwS1d7wI5rsUeh4YdGKtxAijiYUHCQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7258

The IBE (input buffer enable) should be enabled for a GPIO. Reading the
value will return the one from the input register, writing the value
will return the one from the output register.

This offers the flexibility to check if the value intended to be set
matches the actual physical one.

Signed-off-by: Florin Buica <florin.buica@nxp.com>
Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
---
 drivers/pinctrl/nxp/pinctrl-s32cc.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/pinctrl/nxp/pinctrl-s32cc.c b/drivers/pinctrl/nxp/pinctrl-s32cc.c
index f0cad2c501f7..1f58772c472e 100644
--- a/drivers/pinctrl/nxp/pinctrl-s32cc.c
+++ b/drivers/pinctrl/nxp/pinctrl-s32cc.c
@@ -2,7 +2,7 @@
 /*
  * Core driver for the S32 CC (Common Chassis) pin controller
  *
- * Copyright 2017-2022 NXP
+ * Copyright 2017-2022,2024 NXP
  * Copyright (C) 2022 SUSE LLC
  * Copyright 2015-2016 Freescale Semiconductor, Inc.
  */
@@ -436,16 +436,15 @@ static int s32_pmx_gpio_set_direction(struct pinctrl_dev *pctldev,
 				      unsigned int offset,
 				      bool input)
 {
-	unsigned int config;
+	/* Always enable IBE for GPIOs. This allows us to read the
+	 * actual line value and compare it with the one set.
+	 */
+	unsigned int config = S32_MSCR_IBE;
 	unsigned int mask = S32_MSCR_IBE | S32_MSCR_OBE;
 
-	if (input) {
-		/* Disable output buffer and enable input buffer */
-		config = S32_MSCR_IBE;
-	} else {
-		/* Disable input buffer and enable output buffer */
-		config = S32_MSCR_OBE;
-	}
+	/* Enable output buffer */
+	if (!input)
+		config |= S32_MSCR_OBE;
 
 	return s32_regmap_update(pctldev, offset, mask, config);
 }
-- 
2.45.2


