Return-Path: <linux-gpio+bounces-36229-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +B1pHNMX+mlYJQMAu9opvQ
	(envelope-from <linux-gpio+bounces-36229-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 18:16:19 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E50A84D114B
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 18:16:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 032123043D4A
	for <lists+linux-gpio@lfdr.de>; Tue,  5 May 2026 16:09:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D86B48A2CC;
	Tue,  5 May 2026 16:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="IsBKayJY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012017.outbound.protection.outlook.com [52.101.66.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81838481FB8;
	Tue,  5 May 2026 16:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777997382; cv=fail; b=laBvEC/u2cialeLG0MRjAg/y84yoJ8eb5dsRsk7wvLj5EkttfLZ2NiMch7Ln6Kp1nd5ynSOJdl++0HQ7hP6HDv05uPHilpqaS1v6LRSTouB/m8nyUX7fun4jbQDUjpx6isjv8ZXXqmgbGMf8lAziH1ouDI28yPvRNh/rv9HkEys=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777997382; c=relaxed/simple;
	bh=x2irwGAJxDD6wdc+ytllLzJlMZLgGsVtyOT6fUDrYTM=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=cdbIBp4+46/VcJdh54xVylp6RY9Zs9hk4I8BJg6Sqw2POppdxQGz2buYgmNDrlNEClQnIfcJMaON7F4jC+kgdfcB5pRx3Z6BsqX+MzD1z5K3R0SEQ4mnCsP0ABGzUNOEyde+AzgSSZESaTPQGxuNz9fHNAxdqW43vy5Umz5uBRM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=IsBKayJY; arc=fail smtp.client-ip=52.101.66.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TDehr20tiRHa3JkMCwmMggEmso1EVqeHWOTUA+pEk5I2JbYq5Pu9cpHXfqZeTR2jcbCZI5BbdVrQDNlLxyU2235F41fwK4KtTFH4yCOIMgXWAFODHu76Z+tCxM//rKostH0Z6q8osXm+dH8EWVk4gAGvwkb0+plp+REsbu389Hu1nqj30TNolfN590ePgPHGkwqZbWKS9IaHFGgfkDiNfq/hcxy+6TOh8U2fh6LocNZVl+ZdFlmn5csH4SFlDySoLCUm7hEduJetYrOKtoDNePgMEeiPt73TNIQTuOkCo8ZuHPqVbLeUvJKhiBlHoaYupkLnXC2HxS33WZIvVIWSFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p80F+20euBb7mmbVWVtUc6ggQungfbWvqdlCfd4GntA=;
 b=guc0a/yAbivZbrInSeRLJxhMGLbQsNcRqeEeiGbkhFjGHrdDOj2PHQixzSTJgbkSVvc0QPfi2KRInPltJDM3hdC3tIN9hRp4TIuH/eB3d68qdskOqGtRIlJ9RJelKVb9IrzNCKUBr/aZBfXIAGAtZANiGx9h7tftfPDiz0etNgnyMMQZ7nq7fjvjJF64u9vmx3VXY+p+a8AtFY5zk4fQkD09E48A/BUtNPoVGm4+ycQDwDGJBsVU3wg3WXCckh4IS7HzwtYdKRPysPQ0M18KJKjEmxaTpQkexbK3LW32Eq9n8ghEOWmciJ4hw3TOoDeTVhGlchmSmH8U57Thybua+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p80F+20euBb7mmbVWVtUc6ggQungfbWvqdlCfd4GntA=;
 b=IsBKayJYEzFvRoUl5kjIDrxZD3SfeIgzT+mcR/4MqoPY1Gl9uFSZtg4CV85jO1a/MrZtQi1JumLFNUeLjHf/wAjP1aGLs2OagPJe6EGM4OEMvMR6nM12xtVneN4ZsZTFieHeT/nGpgqWtsqSmNnA85R4+2XzD0aJrUFHy/Chbm8FY/0ajWDqd9EN7MrVbljYyHeva//0ZAj+3uEzIGun9I2/3SROnXDrSwRth6h5BIQ9LhMOr9M6XaJPC77l57KDs5jko1BM7a0W22e2ExZc/l1ev+V3BDJSrMutVftbLxZ6mI0Bp+73+xdIVfBWnomUCvt3PY9FirLcJrcXJ8j+hw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PA1PR04MB11531.eurprd04.prod.outlook.com (2603:10a6:102:4df::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 16:09:36 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 16:09:36 +0000
From: Frank Li <Frank.Li@nxp.com>
To: =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP S32 Linux Team <s32@nxp.com>,
	Linus Walleij <linusw@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	linux-gpio@vger.kernel.org (open list:PIN CONTROLLER - FREESCALE),
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH v2 1/1] pinctrl: imx1: Allow parsing DT without function nodes
Date: Tue,  5 May 2026 12:09:02 -0400
Message-ID: <20260505160902.1425532-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8PR05CA0023.namprd05.prod.outlook.com
 (2603:10b6:510:2cc::8) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PA1PR04MB11531:EE_
X-MS-Office365-Filtering-Correlation-Id: 26c870c0-4023-4bef-0f5a-08deaac0b3ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|19092799006|366016|18002099003|38350700014|921020|56012099003;
X-Microsoft-Antispam-Message-Info:
	GLJ4KQ8gr+zIcWpPEkZkA1WAfs83cI0UlpLaUQv0AtUrXtnN48hXoZFh9alitVAWeEw6+S9r1ob1dlfan75Wr50PHYrcmqAMTI7CAYjnrxb1zxd1j/sl3/NRVb4J6ujgAiOBAVAqgosarRpxphrY4AMSovSwYheAOf7j2gKGAYAOzjk2bVSwjiJX59Q8fPWJEJ5sNviEGtaEqxPFBxTny4ZhMeMJaPKCbA6v7rsEKDT5GkHVxZa3EQjDofXuov68zsplFWmz2OLQK190+yXPv60CHY3MEvBAPP/R0dAbWtzAKDGlUbWwhW36gpKLHqFWmgzJyDCuGS3DLe/HDw3jcaKpYJFD4Is0AX5u02yYHiPCtILZjTPg+LybAVU7pORG3f8K5ucaNj7G3Q0R6NZ7pf4O3b5B68qe1W5GusFzyq3ptaPT98iBkPODqX3ilFMv5Vii6mBaKNHQlNu9/wciWh3ZqNrf3/7oua0laLTRAQSECu7rNSb/26xklEkbFTZVZFh1YWRDIGGS+nqYblHn+V0+S762TFECrhhOwvXq6TaJKRXv6ownBKK+PtuBEkJPPwoIWlNPBho3W3A+xtLvAIoL3EEPpMXNbplRwhaRU41+dKgOgiIYiplJwjvg49ZVbsdCWT5e83CU97f6EKUWdOHJ9Hulvn5X55Ztr8vwTj/Tx4VgDRFoiuELMNtfLALKu4Sv2GAtdp6mwigB65V3pg+bQlfM3VhlZF9hQ7bqLOKNSi6Veo+e9erAbZETSu8u4smopBMaMsrXd/hjp0uuMw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(19092799006)(366016)(18002099003)(38350700014)(921020)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?elo0YnNULzVHdWpRRzhHN1hJajVSb2FDVG5VRVgzZkpIZzZaUnJjaWlRdzNB?=
 =?utf-8?B?dmduUGZRZk1Ed091TmxIY05lUER3U1poZzRXUlZCcUhPRUVhS3k1Y1pHNVly?=
 =?utf-8?B?eS9NeEhBRGp3N29xOFY3Y0tLTWtneDJPRGFBU29JNFNxWjdPU3NEcGdoSjRr?=
 =?utf-8?B?TUJ6SkpyUnpaTnJPMUJvWkVIRkMzZ3JrNnpRVFVzWlJrd0hmYjQ5aXY1NUJP?=
 =?utf-8?B?N1piOXNVTHBKdDBpQ3lDY0lSejhyYVRMRWJ6Y2l4UmtGYjhCVWYva05NTXRI?=
 =?utf-8?B?OXM4bDdFTFpKQXlhWTdyR0pqOUM2ZGxzV0xuU2RyTXV6ZkNXNXlJeGl4em1w?=
 =?utf-8?B?R09nQlhsK3ZKL1dZTjlCNXR4bCtlSk9LT2tCTVlTMENmUlF2TVF6SEpMSHlI?=
 =?utf-8?B?dHhHVUJzS1FmMnRzTUVKN3I5SDFDNHZDV3RCTU9VbUNCblQ1R3VVTHJWUnB1?=
 =?utf-8?B?R3BWQ25GeFI1akJOQmZOamIvRnhqdGlhVC8vUnV0R1plRFVhTnR1UWIyYXlJ?=
 =?utf-8?B?OG1vTUFyZFRQZE1xT0VEeWtJY0lkV0hsclJoeit2bkl3aU02THFaSGdnV3dJ?=
 =?utf-8?B?WkxreUVNQVBmbTNSWlFUR3ZwSEh4Y3FuTnc4aGx6TFNDa1BkSUhYR05Xb3RS?=
 =?utf-8?B?TjNRL0txdFE0aFBSWVZleUVXZzFEWEtSSjM4U2RKY2tCVEI0OGdCZXR4RWpJ?=
 =?utf-8?B?ekVOZWFQNGljOXFTZnFISTgybXRXNkpXNEhMTllVOVg5elBPSCtjSlpmRHRQ?=
 =?utf-8?B?SlR1Qmlsc3pmV3QzTm9EbEM4eHVMeTFoMzRjSkxtbThwZFgwN2pDSWNwaG81?=
 =?utf-8?B?V1d5d2xYeStjQ1IvRFlGdW81bGJiNk5kL0N4TWZZS29rUFQvL2o5TW1PNzE0?=
 =?utf-8?B?QThRN1Z1RVV0RXM5aHBvUWRuS09KbmdVTkI0aHRMMmlFd3NXRENnM3l1QUM4?=
 =?utf-8?B?RmVncnpac25VTVR0Qk1kbmxYbDZPd0ZQSkRiaVpiQzFrT1pFV3c5MFErTCth?=
 =?utf-8?B?Z3IyK2svSUNRbHpmclloOXhOekNicEtSaUdxMlRYb0xHdkllZDZFZ1V1TlZp?=
 =?utf-8?B?VzI2TFhndEhhZ2UrYmw1QS85R0RjUE52VEhRMmN3MXI2dFM1OXdqUEtwZURJ?=
 =?utf-8?B?RVpWWHVHQWhuc3R0ZEl4WHNqWFRUTGVXeXBWNCtpSzBPdEtrcVVPcHRmdVFU?=
 =?utf-8?B?Q05Jcy9LMXJiTlVpTmorN2ROOUpuUDdIZ1pDMU1WWjl0dkhvMEVXZGh3WndB?=
 =?utf-8?B?dDhzbmZnbEQxUFFwODFtaXdvN2NSaitVRDdrRWtUV05vS1pWaEloRlI0UHZZ?=
 =?utf-8?B?V0VHeVhWY1BBNUQ4aEx3Q2NyT3lMelorQ2llTXA2ajhza0VubGQ5QlNGbVJ4?=
 =?utf-8?B?aXpYS01wcm4yM2N5aVJQMUxpWGVBZCtSS2paZFgvd2hWcmxjQnpIbmNVN3R1?=
 =?utf-8?B?Z2RwSHFvcWJKcDBkQWZJM0lNOUhHemJwdmZDaVVJZFJYK0hSdm0xR2QvekNi?=
 =?utf-8?B?TW43SStzWkdLSjFPZHRYK0J2cjJVbkRQUFlzUDFDMzFDSS8yNFY3eVBnMEY0?=
 =?utf-8?B?YWtaL0RnR2dZNU5oSkwwNVc4UFV2SmpqZHR1UmJEN21hVlF5SHd3anhQd2w2?=
 =?utf-8?B?aHZHc1ZqVktQT0JZcFNiLzJIaERqaEkyTlBaMXozSGZnQlNYdHlUVDMrSmZy?=
 =?utf-8?B?NTJ1MURkSHZBRW8rcEV3ZmZHL0J5UkZJVzk0SlY3akJQQ2lpTkI5dHdiSlFE?=
 =?utf-8?B?KzczcGxTTGhzQ1Zna1ljWDlONndJVnJjeHlmNm1Wa3BpOU1MTHdIVGc4bUEx?=
 =?utf-8?B?WVVKUHdHRG5nc01lMWlNdGJFa3oxcGtHcXdzYXFxbEc4aXBCY1k0N3ZzcUF3?=
 =?utf-8?B?cVoxWEl0Z1VXY3VBSmU1QVVYTkpwcFhlYUpFcXRMTGhWWEZnaUU1US84M0Nv?=
 =?utf-8?B?YlNVNWR0SW5SSm1FRlNOdi9nSzhRaXVkNWpQbUsrTW53QzVmL1pMNHlseGpl?=
 =?utf-8?B?R2JTZlNWbWplSE83NHZhWjV6OEJyWVdjaE9wZ0xWckR3cFdETlpURGJZNUtW?=
 =?utf-8?B?ditIOWxSUXhxR3UxNGF4ejNma2JJbjhiMEpqY0ZsSTlGcXhGTHgrQ3g2Ly93?=
 =?utf-8?B?T29pRjVOeURHd2RmL3NNV3djRWMrb0phN25tMkVXRjNpQkQxS2Q4bHVDc015?=
 =?utf-8?B?NzRRcTE5dkM2WDNDUERiNC96d2tiR0hubmg4Tml2QWFDckhHK1pXMnZScUQr?=
 =?utf-8?B?SERrRk9zVUNjeXJ4WmR2aE80OHVsYStHcUZXUHFiU0t6ZDVPcm1EeU9pc3Ev?=
 =?utf-8?B?MlZNTVlRcGllQVdkM2o4NWpnS1A1cnU3dVk2RHBrRHlha3JsUXpKUT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26c870c0-4023-4bef-0f5a-08deaac0b3ef
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 16:09:36.5680
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MAnHTQ391LtsgHsVdPtz2YZObdV1BC7wZq09Q+htLQpGh/148/folBxoYzRMux+9z46XfkAAP3CQYl+4Gs79zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11531
X-Rspamd-Queue-Id: E50A84D114B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36229-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[armadeus.com,nxp.com,gmail.com,pengutronix.de,kernel.org,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@nxp.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[armadeus.com:email,i.mx:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nxp.com:email,nxp.com:dkim,nxp.com:mid]

The old format to define pinctrl settings for imx in DT has two hierarchy
levels. The first level are function device nodes. The second level are
pingroups which contain a property fsl,pins. The original ntention was to
define all pin functions in a single dtsi file and just reference the
correct ones in the board files.

The commit ("5fcdf6a7ed95e pinctrl: imx: Allow parsing DT without function
nodes") already make moden i.MX chip support flatten layout.

Make legacy chipes (more than 15 years) support this flatten layout also.

Fixes: e948cbdc41d6f ("ARM: dts: imx: remove redundant intermediate node in pinmux hierarchy")
Tested-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Change in v2
- Add Tested-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
- Use of_property_present()
---
 drivers/pinctrl/freescale/pinctrl-imx1-core.c | 48 ++++++++++++++++---
 1 file changed, 41 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx1-core.c b/drivers/pinctrl/freescale/pinctrl-imx1-core.c
index b36c8a1461b7c..b7bd4ef9c0db5 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx1-core.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx1-core.c
@@ -540,10 +540,34 @@ static int imx1_pinctrl_parse_functions(struct device_node *np,
 	return 0;
 }
 
+/*
+ * Check if the DT contains pins in the direct child nodes. This indicates the
+ * newer DT format to store pins. This function returns true if the first found
+ * fsl,pins property is in a child of np. Otherwise false is returned.
+ */
+static bool imx1_pinctrl_dt_is_flat_functions(struct device_node *np)
+{
+	struct device_node *function_np;
+	struct device_node *pinctrl_np;
+
+	for_each_child_of_node(np, function_np) {
+		if (of_property_present(function_np, "fsl,pins"))
+			return true;
+
+		for_each_child_of_node(function_np, pinctrl_np) {
+			if (of_property_present(pinctrl_np, "fsl,pins"))
+				return false;
+		}
+	}
+
+	return true;
+}
+
 static int imx1_pinctrl_parse_dt(struct platform_device *pdev,
 		struct imx1_pinctrl *pctl, struct imx1_pinctrl_soc_info *info)
 {
 	struct device_node *np = pdev->dev.of_node;
+	bool flat_funcs;
 	int ret;
 	u32 nfuncs = 0;
 	u32 ngroups = 0;
@@ -552,9 +576,15 @@ static int imx1_pinctrl_parse_dt(struct platform_device *pdev,
 	if (!np)
 		return -ENODEV;
 
-	for_each_child_of_node_scoped(np, child) {
-		++nfuncs;
-		ngroups += of_get_child_count(child);
+	flat_funcs = imx1_pinctrl_dt_is_flat_functions(np);
+	if (flat_funcs) {
+		nfuncs = 1;
+		ngroups = of_get_child_count(np);
+	} else {
+		for_each_child_of_node_scoped(np, child) {
+			++nfuncs;
+			ngroups += of_get_child_count(child);
+		}
 	}
 
 	if (!nfuncs) {
@@ -574,10 +604,14 @@ static int imx1_pinctrl_parse_dt(struct platform_device *pdev,
 	if (!info->functions || !info->groups)
 		return -ENOMEM;
 
-	for_each_child_of_node_scoped(np, child) {
-		ret = imx1_pinctrl_parse_functions(child, info, ifunc++);
-		if (ret == -ENOMEM)
-			return -ENOMEM;
+	if (flat_funcs) {
+		imx1_pinctrl_parse_functions(np, info, 0);
+	} else {
+		for_each_child_of_node_scoped(np, child) {
+			ret = imx1_pinctrl_parse_functions(child, info, ifunc++);
+			if (ret == -ENOMEM)
+				return -ENOMEM;
+		}
 	}
 
 	return 0;
-- 
2.43.0


