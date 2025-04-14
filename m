Return-Path: <linux-gpio+bounces-18764-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F01A87A7E
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Apr 2025 10:35:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3A8057A56BA
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Apr 2025 08:34:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1314E259CB5;
	Mon, 14 Apr 2025 08:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="TboJ+6LZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012049.outbound.protection.outlook.com [52.101.71.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783122594B9;
	Mon, 14 Apr 2025 08:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744619746; cv=fail; b=e03zJRUpgNVFPNgVAmUdgoEZEDSWUC/0n6SA82UEFCgHb9sM3El1TADvJ/GyIU5qKggiqgAJE8u9HTvHfwHbnkWmJhx3SFY+nCurBEKk+i+YFYxW9WvvhnuwqHYdBaS4sqO0pwKUEt5z6N5eaF4aIoZO+Z/O26CrFN4yjylpFSM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744619746; c=relaxed/simple;
	bh=NJEtEFgyFixb4/KtIji+kxyUqShSX9fj9khTEH9rIk0=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=pPsm2U9rCUhAnzkAmt/wUdcfoA2wKWrKC29uqq4Tf89WcjHHqax5+pcriXD0ttbAhyFKN9Dxg10ccR/k6A59Mr9xjEmQEIpiV4neMV2up7pob/XT0nL5wgHfCo9uzXzPJqqbTVb+XZtX44xha2a+cluZ++OSrAeXC76MphhnGbA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=TboJ+6LZ; arc=fail smtp.client-ip=52.101.71.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iL6h+1lmFcWJ94ZD8zX14OlfHGG1P8M3kJBxzn/bOfybbuKrmy/YSGJOR9WAJYZOBDmy4jOdojPsgfzDkSZC0FOtMOlhTvT6pKXZ9qoEGW8D7oXRitgVbA+IQ6ibJ2GLZd4fsxTt6JFnWlF4LvFkh5dbxSc+V7H+aRgTjJ5AOkl2S+VDaUeGlBhiHCqAvfZbOQIWHkud/3XhaQo3ceCS71W6U4fp65cugehfLFyaiqYOWzaohoBDwfsALqY0ggXKYuvywN6wMa5FMoY5oaEu1NiH2MnhnVuw8c02OiDeNdYUgF7b4yJlZb7IvSv4iIUHOtlwD4vP9jDmpnTrN+oSKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NMIvI1NO1/gJLk0gt5qhQbJCriOe/7GCK/jHzv11hhw=;
 b=uH/2mAIUthtM/eSQpUqta+va+wqfNzGQJv/3y0cJn2PnjOnmfN1ZfkoaC9LdPfNm61AQXyl/dDgI18VNZIlEc3YhGtOT/ZUWSUAJkorgA077eW009taATvD7TrgkuXndD4WYE63+THLtLf1hjDadzPbR1FGgFtplrwB1LnZizdW5zt7vNDNZ2DCVHLphzOj2PwhFx+cBqEZ/AUL2jKkXE+KHfwfSHV30De0eaRV4JyJB37adiKuuaYjeZrEGMwbiVcUVIUy6sh9cSJ13LooR8cNdNBm8nVh9DlP46k1U2R4WXzTWC0lAwNOLqoFRgxi6zLathxdDPyNTXdKWckXJkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NMIvI1NO1/gJLk0gt5qhQbJCriOe/7GCK/jHzv11hhw=;
 b=TboJ+6LZk5a6x4G/BTJ/PUEDD5+WPYJOwzGACI8VsT40JdFtwkVXBCM/r/FYCavKSJBWHMpmGCDN+1TBmTp3fyo1fAjLlWKzHVdowuTLdzoV+5SUPhs4yB/gCtOoDcIA/rYSbDVXNiBQrcJ2jUfl9I4DTfeRhMvGQql8TpLzbbp9nodOpKSJCWNuPDyEy6+ptg9bUdTIvE5WhLru+rafsA3Rlb1aO7G2ITShRLL5w7q5/R3EbBd3R3u6S4wbxlxHlMzhDHgigkbayvz7QCdfCPxDbkpkzEyxMIQbgXkdoZ5DDQvGd+8nfqrUSZkJMWPuONYNbAQyPX/K5Kes6AgkFw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAXPR04MB8408.eurprd04.prod.outlook.com (2603:10a6:102:1c9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Mon, 14 Apr
 2025 08:35:40 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 08:35:40 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH 0/3] ASoC: codec: tpa6130a2: Convert to GPIO descriptors
Date: Mon, 14 Apr 2025 16:34:22 +0800
Message-Id: <20250414-asoc-tpa6130a2-v1-0-5f4052e656a0@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI7I/GcC/x3MQQqAIBBA0avIrBPUNKmrRAuzqWZjohGBePek5
 Vv8XyBjIswwsQIJH8p0hQbZMfCnCwdy2ppBCWWElpq7fHl+RzfIXjjFpbej1asxwozQophwp/c
 fzkutH6SLGpNgAAAA
X-Change-ID: 20250414-asoc-tpa6130a2-1c7974b55059
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Peng Fan <peng.fan@nxp.com>, 
 Lucas Stach <l.stach@pengutronix.de>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744619674; l=1200;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=NJEtEFgyFixb4/KtIji+kxyUqShSX9fj9khTEH9rIk0=;
 b=0vogsQsmKJcsy52tdZUaYEptSEyY509bmlymO7jLEz74ln7d/juzq1LxIf6uDD3zhMnOxR+6I
 qLrpX2re+lIBZssQ9RuUDJ8OHDRh35eJ5sS7mvT2ptA5ITcwP1GJMeU
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR01CA0145.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::25) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PAXPR04MB8408:EE_
X-MS-Office365-Filtering-Correlation-Id: 2492d1bc-692e-44c5-7811-08dd7b2f5652
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|7416014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZEVkNVVLdmRRTjVQSmgvRFpSS2g1dzc3Z21SQUxxYzJvQmpicCtPZVJJZmdh?=
 =?utf-8?B?aTZmUnA4WVIzWkJ1Ly8zNlA3RVE0bGtBYWpWMjlQaDVrS2ZZL2tWN1YzWkNM?=
 =?utf-8?B?dGM0bHdlYUcwWnkvbVRFUGdCRUg3NkZPVGlJWk5rejNGck9RMVcyaTZjUm8y?=
 =?utf-8?B?VjVweDByc2JRVEUwei9mOWRqVUozSTJNdEIvbFhWY2h3MUhLVzBBSElPZHU1?=
 =?utf-8?B?alhQZkw3OHp1OFhVb1dRSCtzaHV1WkQyZ1Z2NU5YaUtsZnBVQjB3S2NRM1Fn?=
 =?utf-8?B?KzVzYm5qenhCRWhBVkl6emJ3RjZMaERza3dmUEFRR2ZFL2hubXgvczJ4MmlM?=
 =?utf-8?B?NzRBS2t2T0dHUitHWFFRSkJNQTNPQXNvVDFzRTBxSFc3QkQydTZkSXdPeVc4?=
 =?utf-8?B?cEhnbFpaRHpYNHJrT3FjRkh6MHpMMzZlUTdRbUppdWF5UXV4V0dwUCtpNXhy?=
 =?utf-8?B?WGVsVStycG1Hc1hpT1E3bW0wclZXclMvQ2ViVFUveUdWdnpXVWQ1SFlYNDBH?=
 =?utf-8?B?T0hWVFBHQzEzM3BzMWpCRFRYZDBDdDRvT3RmMDVFbTVTL093RytUVHVvc3ky?=
 =?utf-8?B?QzlCL09xZzZQRWVib21EdXBpT0huTXdRalg2NmEra2hXdU93bHcxazR3NVRB?=
 =?utf-8?B?Vml6R0JOU0t5S1hTaEFsNVZDN3ExMXNoK2FRaHFTWVAzNW82bmQrelNaUXFl?=
 =?utf-8?B?V0t3N0h1WE5DZkxncnBFUVFpQmlUbzI5bVB6RTJQc0N5eURJeW9ZdnkyQjJj?=
 =?utf-8?B?UHIxcWhiKzFFSjZiMTVKZk5xc2Y0VldiOStNMFdrTVFtL0ViTzVIOFFqVk9k?=
 =?utf-8?B?Z2gyWTRrTkFxd1pIeldaL0Zsd0IvYVFyTEFCN0Q3ZlB2Y0FMa1pSU3kvUTJX?=
 =?utf-8?B?MDhVRHRKdDFiQ01tc2Q1ejZPOGRlMklqYURZenl0MFdvMVJCbzhRK3pkSk00?=
 =?utf-8?B?VXpXS2VXMDlxbzBONjJ4MCs3MXNiSXZFYnFLVlZvd3JZQXZiRUZYay9MSTlV?=
 =?utf-8?B?b25YODY0VDFTdW9pQU5sUlBpLzYyWTc5c016bEkzUDZIUy9MdExmSllGK3BW?=
 =?utf-8?B?Ri9PWktqNjlCbm9Ndm5oblNpdStKTDdMZGcwTTlUY2JZZ1U3MTMzK3Nqa1ZV?=
 =?utf-8?B?SERKQXREdTVzbEVBaVZ6bmxBRUllQ2Fta1BYTnhMVGZ6MDhGTEhjZjFLekRN?=
 =?utf-8?B?V3RieXNWMXdWVjd4a3UrMnUwRWJHWHVFdG5LaUZXWVVETHVaOTNzM1hkUy9o?=
 =?utf-8?B?b1JDNlMrL2hLakcxY3FxbGFVdm1IOFdNL0s2eUdzakZNMGpuWTVyUWIzZ0kr?=
 =?utf-8?B?cnhiT2EvaEU1dmgxNHhxVGRiTE8xOGs2cnpwTXA3TU56TEhaeFl0R0h4cklR?=
 =?utf-8?B?Tkc1QXdoakhvTTNib1hjbm1sOFIvYllGR2RVWlZUU21jV0FiTVZvNHEzTEhZ?=
 =?utf-8?B?eHpwcG9mVnlqZW8zWUMrRndrMFVqUXdaVnUxdDVHSEg3MGVIZENsZk8rM0hL?=
 =?utf-8?B?ZkRoK25CQ1IzTElpRksweVJBTDZtcjh1UE9pMVM3QjhEMXpBbHYrU1QvaEVY?=
 =?utf-8?B?ZUxKZXhQT01jUTl4WjZWOU1FQlU5L1RNam40MjRPcWVaWmljemtJQmVWbUlG?=
 =?utf-8?B?YTA0YnNxQTE5N1JoL2RocVNCR1A1ODkxaDJnNXNYRVNNb0kvM0paVXA1R200?=
 =?utf-8?B?MkV5dnNYbEtFM2JtN1k2MWhORWtVU2ZPcjNHSnFQdkRRam5TZU5mTlhJK1Zh?=
 =?utf-8?B?RXhWWWFDSDQyNWtnbDF3Y0todnVMRDhxVUIyRGNjYnF6bVFYbFBueU90MndL?=
 =?utf-8?B?T0orNEl5M3BPQjFXSTBKUjdQK0lJUE5PRVcyVkFnMDd0ZTdUdWVOaURTTWVu?=
 =?utf-8?B?TEhtYys0YzhicysvNFpUWmE3RG5IUk9rSk16V21aUVlzM0J3NFIzTmN5cVFL?=
 =?utf-8?B?NkloYmhRY2hpUDhwaHBsSzQwaGNMb3RrMTJudHRjOEpGRk9VcHViQ2lPcDBZ?=
 =?utf-8?Q?Pkt6LjepAQdC1k+Qo4BTMLqBROKwdQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(7416014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MDJncGxhblRmWmo5QkE0cUlEVSswNWRFbjNESEtuai9IK2N6WDNwbVh5RW01?=
 =?utf-8?B?RjVXbVZueUhzY0FQdEdSYWx3cjNZVmUzS3d2bEpHZXBNeVNnSTBHNnpYYnBj?=
 =?utf-8?B?OEFsM1VWWDBmdktsa3FrS1o0WDlDYkszenJ1b0toZndkS1dIeFBkd0x4LzZM?=
 =?utf-8?B?VEwzb1F4MUZodHF0TGhHUVFReWljRGF4aVVhaERJK3VXNkdrTU5IQ2JhSlhy?=
 =?utf-8?B?QXJLNzR3UkM3THpMV1prcTkvT3hLdThnOHpjSndWT1Noam8xMyt6TndkQyts?=
 =?utf-8?B?YnNJcE1HbHhPNWttT0xvMHdZT1pnZkM0MEVqSnJuem9UV1lYQm9uN3NyYll4?=
 =?utf-8?B?dkMwODdDUEdSQis4UXZzWERCZW9VaG14RXNwS0JHZEllMzBNRk5ZbytQaFdE?=
 =?utf-8?B?WHBOUjlSMnE2Z2xBVWJBVGxQeEFqTnl4VUhDQjR3d1R3TE9ydTV0SjJrdndT?=
 =?utf-8?B?MHFMei82M3hOVlN6eXd6cjhYUUwvS0FhTEhNWTZQdnlHWHo1a215MStYbWNr?=
 =?utf-8?B?UlNKbnczVVJNL0grbnFlUUtVL1ROOTNHM1B0anplaFVubU1EN1BkVURFMnNN?=
 =?utf-8?B?V3FveTdlUlR6eEV0WFRDcHBKZ1UxK2ZhT0ljVURpYkk1VUIvczU1MmhWWFhk?=
 =?utf-8?B?N2NZMERXV2lVQ1pRMUJWR1hBOUZFTm4zRmhQMDNJQ0UrUXNmTGxjQzNFZ3NY?=
 =?utf-8?B?d3N4U0xpOW5zbno3U0Vzb1RPMUIydkxvbGZ4MlBIZ0dYNGwydVd4eXF5NHE2?=
 =?utf-8?B?WTdRTnFwVWVHQVA5WjhJMWxza2loMnVGUThRbUljOW9wa3AzdlNuWjB5c0Nk?=
 =?utf-8?B?OXRScVFXSVc5Z1RlN1QxVDBlUjhwUWJsdStUMi9BaVBQQnBBVnMycTQ5OXdP?=
 =?utf-8?B?WEhhWW1NWkhHN0ZreFcxYWpUNzI1VlRFTXNHd2xOZkdYWlZXU2VRZzZ6M3ZH?=
 =?utf-8?B?V3J4RmI5Y3RZT3c0ZVdwU1RPZnBDK1pSeHlWa2laVy9KalR4MWZxQ3ZxRk1h?=
 =?utf-8?B?RG1iSERrWjh3aW42ZEViMkhWc0xIQXNzS2pZWVlZYXBrV3U5K0xqT0F3dUNp?=
 =?utf-8?B?QzZtSzBBcjZrelArZXJpNXI2S2hRUHc4alJOcHNIVEM3RjJaVHhkeXBFN3BL?=
 =?utf-8?B?VFc4OXJhTlZqYklyMTMwZm9qdnBDZ1NzVFJDdFJIZS9TNktMdkw3RHpTdWRZ?=
 =?utf-8?B?QVRMUnV6NGF0ZTJnRGVZZWZHODJSZDZHemwycUpKRjR5MUh0QmRaMjd0NUwy?=
 =?utf-8?B?YUJCMXh3NHRTYVJRQXRiZXZIQUlwQUk3YzlBQXgxQ05NT2RYMXhQSXJ0bTNR?=
 =?utf-8?B?RWdCRTVlZVNralpaSVVDbGp4cEkyOEEvTlg4YVVzd0lKWWZGdHQvVXRNSGl2?=
 =?utf-8?B?SzQ3Z20vYjBIVUVBQmxUcDArYzY3dzhybXF1Vk9Zd1F6ZDdONi9lRnAyTG5U?=
 =?utf-8?B?cWRYTzhOS0p3L0Z3bDAzdnVNSkNrd3JTdytyWGtCSHFLL29XRlJGcHN3Vm1k?=
 =?utf-8?B?V0NidStJejVzLytVb3YrUFIyWnM5L2RTN2tteW51cFBOREtDVkRTVzVXakdW?=
 =?utf-8?B?RmQrY3l2cGF4Y1RRZnFPVHljM2RMZVNGM2NQQVNGSVZvd09UdWdla1E2b215?=
 =?utf-8?B?R2tvTG1Nd2lBQjlMd1RIZzRuVnpXS1lYWC9sUVRZSnhrUnlTSmUza1JSYjlQ?=
 =?utf-8?B?T0FOVzRHUkZHK0NtZFdLSTRWM2psalZodHluTjcyM1BEL2VzUnY2ZzZWRU1J?=
 =?utf-8?B?dzZ2YXZML1RrMkcwUDRlSStXYlhTdEJuWDEwTmNPaGdhL0YrRkplbjZIQ1BF?=
 =?utf-8?B?MldqM0JmQUl3UlByVmxlYlhaU3ZVMjBIWmxhT2hLV3J2K2Q5ZFNTdCtkajdT?=
 =?utf-8?B?ZkplSWRkRzQvVFJBYy9CL3I5UmJjbEljbm9kaU96V3JWbi9FVHcwSk1ZUDhh?=
 =?utf-8?B?QTl5MTdxclF3aG4yTzVPdWZseGtpSU5wSzdjMGNIL3kwZDEydkt3WUxHMEtq?=
 =?utf-8?B?c3I2VUNNNnBlMlpnemFhMEhJVkpsUTNWMVNyVmd5L3p5RUZIZENUdm1lMDVB?=
 =?utf-8?B?UTBXSGowNmpsaGI2UUQzUUJJRHJYeW12bXdLb0lyYnpKU1Era2dUbThwWkEr?=
 =?utf-8?Q?l3tmho1UYvmA+iz0lxslZSxL4?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2492d1bc-692e-44c5-7811-08dd7b2f5652
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 08:35:40.2455
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hoEXDyFCtle87N3rmCM8Wq9mtdW65hVZIrKWmloXogYK4OwNp5UstTaHCMheBvtfGzqej3+6znNvp8GTacd1pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8408

Per Mark's comments in [1], each driver in one patchset and not merge
the changes to one driver in one patch, so worked out three patches.

- Sort the included headers.
- Drop sound/tpa6130a2-plat.h because no user is creating the device using
   platform data
- Covert to GPIO descriptors

Checking the DTS polarity, all users are using GPIOD_ACTIVE_HIGH.
so all should work as expected with this patch.

I not have hardware to test, just my best effort to do this.

[1] https://lore.kernel.org/all/66db9962-d773-4c7a-bf59-4698eca9eedc@sirena.org.uk/

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Peng Fan (3):
      ASoC: codec: tpa6130a2: Sort headers alphabetically
      ASoC: codec: tpa6130a2: Remove tpa6130a2_platform_data
      ASoC: codec: tpa6130a2: Convert to GPIO descriptors

 MAINTAINERS                    |  1 -
 include/sound/tpa6130a2-plat.h | 17 -------------
 sound/soc/codecs/tpa6130a2.c   | 54 +++++++++++++-----------------------------
 3 files changed, 16 insertions(+), 56 deletions(-)
---
base-commit: b425262c07a6a643ebeed91046e161e20b944164
change-id: 20250414-asoc-tpa6130a2-1c7974b55059

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>


