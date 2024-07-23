Return-Path: <linux-gpio+bounces-8362-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3E293A130
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jul 2024 15:20:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 25A79B2293D
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jul 2024 13:20:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2801E153509;
	Tue, 23 Jul 2024 13:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="EY+dcCT/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011053.outbound.protection.outlook.com [52.101.65.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9521514F3;
	Tue, 23 Jul 2024 13:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721740791; cv=fail; b=eLs1YIzu7/QC6sCZ2bzhlE3Cq4AVgoiqEnLHX0jZjVu1Mxigio4lTtvX7OIsw96cWj/rjKyxuM9rbr+YGgHPFW0st+KluG3vS/pd7aTfiZk/WRmWtvn74DulATafYgB6qrYP3MAHsFFJRp5gEeS28W+H8G25U2YqE6Flf/emTEs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721740791; c=relaxed/simple;
	bh=E2NDRPJYWOOXAJCOeJzrzQaw1NqpCXwvtk8f9dz3v5Q=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=rtCS2328B+YmyIc18RX/zXGtw4X/GUta4uQKPE6tRmS4yPXlMP7UUXy0vCJKDNIe64y/XT4/7YX8QGa60c6KZocGsyB5CGhvVN9tJsWbSFyvRkmUfYviGKpqk1YNGzNOAlJhpWZXbdq3ULNB01kae7DFiNIH2oJzAaHNEB7baF0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=EY+dcCT/; arc=fail smtp.client-ip=52.101.65.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aoo98mThb3q0Y6UWG+K8Bda31fJaaIrDvhVpVN2Emd8F60H+XO6cna1Spc48WnfS+NKB2GKwJgk3sjwwCyRZ/xoVHdh8n8IkaL5igZGu+W/kCbm4/nxAhLGVLd2eMcd9j4VuNL+NLh/DVbc+jE374V9Rrn3IuFHmrwZY/ePnDjatRl2O02RAosaEnaCmdcTE4cQMG68ytQ9hmLwzwoY5mZ+rVHOmzcP1K5A8xtcLt/UvOtEeiRoREYMW4QYXP4gNYvta4zH8cN2GYD//RBF1r/MoAxGvjondlb+OqxG7ev96bPHvlcjmiBz4L83Qgbtq3XCzLH+txQrXvtkF8IILqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vqqU0bwu9IL8zyXuJ7VMnBjXgOp23A7QaEooCeG7o7Q=;
 b=ar4v+31cOk0R8lrZjzUN1sjA12RuJswdfU0dxgkoRyprJgwGmElH5Uqlq2ViqVBgPX1+7Y2OebyUoNQMQ8iqbmI1QMPyfvEGXRK2ertPowO1ULEbOK/jq/gQ0WdrDaLtYpXGkqKbD7SAl/RFrwctpRLneTCbX3KkprvzjPOiI0pqyodqKT63pY6d3yNwQvJAetlHbLE7TEbe5mOs/SPe98CJNUx4qHu7jXkkRqZR01J5hCoHU05DtVcrrR8Euwt2n93BqAu3PX/JTKDL0zsFjNTaeOdMSRTcNC7csZLS5H5cx+JcNDoiV+1deTiqKYjnQbzeCtwKrPeK/b1u1eWDVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vqqU0bwu9IL8zyXuJ7VMnBjXgOp23A7QaEooCeG7o7Q=;
 b=EY+dcCT/2etyvf3xyseXzc6KTT7A7JS16wxQd3Xi2VdNeEFie5WQzbXTVR4G1FlRDKLjr8zBvIVyeXXQ1yrglKBtdbVeBC90Jqa9brV/oJYNWRFck5aEBApSUBRWt1Lv5032QeFxTOaZxS9C3mIbgvwo4EHDiqBvY0RM8/w/mC8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by PR3PR04MB7258.eurprd04.prod.outlook.com (2603:10a6:102:80::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Tue, 23 Jul
 2024 13:19:46 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%5]) with mapi id 15.20.7784.013; Tue, 23 Jul 2024
 13:19:46 +0000
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
	Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Subject: [PATCH 0/3] add small improvements to the S32G pinctrl driver
Date: Tue, 23 Jul 2024 16:18:29 +0300
Message-ID: <20240723131832.1171036-1-andrei.stefanescu@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
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
X-MS-Office365-Filtering-Correlation-Id: 4123c9b1-1a2a-49ef-ec58-08dcab1a1f12
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Vk1PVktveWx4R2VkYzU2MkNWY2N5TjlkTWV1dElVSTdhSXNNQUlsOXdRNTdW?=
 =?utf-8?B?ZU9xMEJuNHFGeTd0T3d6OGVRT0I0ck43MkZnYi9VVGYvR09qRGlHcU42M3VQ?=
 =?utf-8?B?c0lEZjlIRmZDa2hLMFlpMy90VWRSS2tSVjNhUUZoOEVxM091MTBiU3h2R3ha?=
 =?utf-8?B?cCtPVFZIR1ZqaFpYQmNDbThydy9vSU4vbU04aGgrblBMUGtWRXZHRHFBL0NT?=
 =?utf-8?B?Mzg5NlMrZ29EK2hodVRtSEdGbUJLblB0bEpqcmJGNVcrbW9LNnBlYU85WFFa?=
 =?utf-8?B?eldxaUQ2dkZsK09GNXlmNitmdWtsdGZtTVFiV3ZQSUd6QXdmU01mb2dPaEgy?=
 =?utf-8?B?SjZ0enNxbk5CS2pNSzBwM0U1NjVVYjRsWktUenRBdkVuc1dVL1c4cGk1TVNM?=
 =?utf-8?B?YWpwaXhQZm1tMWVEM0cvTFNaRjVSeENJK2UrdnA1L2FjK3VyYTQyZEpxem9t?=
 =?utf-8?B?K0xjRUpCK2I4Z3F5YjA0OFV2ZDJCOXpDTDlKMHIxUUlnVGhrNEZWbW0yeWpj?=
 =?utf-8?B?N1FXejk5ZldmT21IcUxvN0hJMGU0Y0NYano5RmMvS2RHaEdRYVJhdnh4MDBR?=
 =?utf-8?B?aTYwVkFqWmkzUTRaMHZkRWZMQzArcjNxeVVscUl0Mmwvdm5GYTNWNW1WY1JG?=
 =?utf-8?B?Y3JoZFpvTldxWkNBWHc0YU94REdjT041d2lwajE1b2l4ck1hcTJCNDA4OTg0?=
 =?utf-8?B?azJxVC9ZSk54L3gvUmRSbHN2akE1anVnQWtxSE1JYStnSHpCbm5YYjlObzNP?=
 =?utf-8?B?cHBDbm55V3RkRmsrc3R5a2h5S2dwT0NMV1ZUS29KS242TmpvQ2NoMTdmdllm?=
 =?utf-8?B?MGhRUzRORDJTS1ZEV2hqZW54TnlxL2FwaU5ienRIbUgwaUkzWVdGRlJoSDV2?=
 =?utf-8?B?NUtmRkNDdHZZYksrU3BSU2NBN3dwTkRkUTd0ZlZYYkhHMzRzcDVkbHVMdEFE?=
 =?utf-8?B?cmUvY2NMQlFrOG1OaGZTeFNVNVVPdmJqTEpmM1R6Q2JFdStOZWtMOFFXTEhF?=
 =?utf-8?B?bDNZOG9Db2lxaUdOZUwyS1lwV3I5Slc4VHF4eTdBWVdWZzFZb0d5UHVEdVFu?=
 =?utf-8?B?RjRGdzlsYXZaM0tvUHAxdHJDZmFYbnpFMVM2RkpLQlJFUlRmY09xMGhYcEs1?=
 =?utf-8?B?MTMwWHVTUFZrMnZKeU44MjlPNGsrYkp1dU51YlRIU0VLMjlmWkt0T0tsTkkr?=
 =?utf-8?B?M3Q3R1EwL2M2Qy9GOERjb1BrR2paeEovY0ExMnp4REpLVGRCUTRORlBwVXVm?=
 =?utf-8?B?Z0RJY2JZQ05ueXJYZ1Z3bzR0YTJBSDVyOUxKbEZrUGpXWlQ4OXV2elNXZG9a?=
 =?utf-8?B?NjY2VEpVZUlaR0RHWjM5czJpTTVqSDU5ZGxoeFVhMzVjV3BLMGxMOWEyODhC?=
 =?utf-8?B?WnRabEJkQytJVVV6dkw4TFlCZlhoZjQwc2YvaTB0YlE4d0FTRnpOcHIyYUlQ?=
 =?utf-8?B?OWt1enkwcXZhM05YbEJpUXYyby9aSGx4TWZuVHJpNXh2emZ6c0tDcXlPYTc1?=
 =?utf-8?B?VDdOeko5TXNhcElrN3N1ck53amtKZGs0WWdIRGhjRzJUZk4wNnFJN2VIYkd3?=
 =?utf-8?B?N1NOTkJVdWZwVWJLQ1g1STVPaEp5S0VDMzFBeERSVlBzUWVobHZLK004Y0Z5?=
 =?utf-8?B?MndGNXFhNDlwNXNoWml5aS8vMTN4bGlHa0VEVkloRnlLc1pvV25QZjJ5bVJm?=
 =?utf-8?B?SFk1VEgrSCs5WkIzRVBnSmdjVFpzRmdrVlJrYmlsY21POEJqMkF3anRHaVly?=
 =?utf-8?B?R2ZJZVorUDhFYVloRFFzcVUzTXhYZUVVNVlVakhHSjJ2bC9VQnR6eCtYWkQz?=
 =?utf-8?Q?t3aGVJfSUp6K79sXvHp9a3dGFXxZyYOVl4HdM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?allLdUFYc1dsWkVLUmxvY3RlZUxuOGUxT1NpOUFzN3lpYWZSdjRIb0tKY2JK?=
 =?utf-8?B?VjRkM0tLSUlybGo5NWp1VWNHT1l1WEpwTFJSMW92V2xwV0J1NDFnQ3MybGU5?=
 =?utf-8?B?WTllTGk1TmNaZFBob2tmNDF2K3ZsaWhpRlBkNFdkU1BGZkRFRUw2K0VUcVdV?=
 =?utf-8?B?OEhPaDhCbjA1a3BCQXNxc3ZORUF5TVF6VkVTUHA2UjNlZGNZZjNjYnR5RVRJ?=
 =?utf-8?B?OGRTNFNlZlVyWHpRNGVHRjFXWForTW14T2FWdTRrdWFUNDc2QVdlVFRKN3hC?=
 =?utf-8?B?MllxS3FZUERlVVpRVVJQQTF4WWx6bEdjdUM1UWV6S3BhUk1XR1dGaUlpaVp0?=
 =?utf-8?B?cFVwMCtubU1TTUpOL1pIU0ZyWC9qa1hhZmY4RHc1bUlQbGU1ckRTMldQQjFR?=
 =?utf-8?B?UHpKRXVHZzVoWWhQSDREdVo3MCtzV2dHSGJWN3NRVWpTOWR3WGRJNU5vTDNh?=
 =?utf-8?B?V0RrSS9BNVZZQnhqNlBQa3N2aEk1dG5IWGhpbGY1eEc5K2kzdUxRdHNZNVRI?=
 =?utf-8?B?NllUaGJPdXNzSitTTFdDNnRTaXJzTjcrS2dieXRkOVJkK1VaZ0pJUGlWOCs4?=
 =?utf-8?B?Y1ZZbGFCOElObkdSTDc1YU9ncWZQUHRGby9ORy9JZkJIajl0dXNHeWtERDhp?=
 =?utf-8?B?YURzKzhvUElCMWVUa3hDUkNPcGxsdkNWSFd6VUtLVnh2ZGV0ZGsyTld1SFFZ?=
 =?utf-8?B?QWFRemQrMG5CeVVXZE5rc3FhMHZwNTN2NHMvdFAwdXlJbTdvKzZzQ3pBbVV4?=
 =?utf-8?B?dGNkVFVFRm5uUXF5c0FXckFkQk53bzBFd3FScHdWbk9WUjlmcVd4SVRjeEhm?=
 =?utf-8?B?MklTcFptREJwRzV0UTdwTWJWSkkrK3VUMUhJVVMyNTNLc3ppQnpRcjNlRDZP?=
 =?utf-8?B?NTlOdlk5U1NvblRZSWdwdnhJVXpWakhzT0JXUkQxaEJSUEVtbjhZblZMVFNN?=
 =?utf-8?B?dWY1VzIvQzlXdUxCZHhLTzRrZDdnSThORWptZ2ZkOGdwd0ZlRTFWWGVMSldv?=
 =?utf-8?B?VkxRZ3NKZWNjOHNCdW5JSUl3OHNsTkZEOTRZeGlSV0lmR2JOTmVnZ2hVeDFO?=
 =?utf-8?B?Y29rWENWK0pNNnlnYUdnbUVxeE5iRlBhSmFLWllGZlBMaXM1UllWcHhJeWkw?=
 =?utf-8?B?ZWdJay9Nbk9hZE1uTzZ6eUpCNTliYkYvOFU3UjY2ZTJSZXV0Y1F4L1hqbVk1?=
 =?utf-8?B?amw5WGQzOVdxeWRJYnFEWGdlWUd0VFpSSTUzOGFhTm83eDZHZlJISEhKcjll?=
 =?utf-8?B?RDN4dFU2N3lVTVpLS2lWTTVDRVFJZVY3M1R5WjNxQjZPWlVZR0E5U1VBWEs5?=
 =?utf-8?B?YlBmK0VEY0VKaS9SeWVQSmwwbnA5RHNPaGtBdUgyd00wT2N0bTB4NllmSUpO?=
 =?utf-8?B?R0pSZ2Nnb0t2R0xrQWlHMGF4dDZCWTdXRkxvdE80aWVWZStsalNWTXVjSE9F?=
 =?utf-8?B?b3NGM0xaamMxZ2Y2U3NQOXY0TUdybndyVXRsMlBDQ0Q2MkxVMis1M3RYdVR1?=
 =?utf-8?B?OCtrcFdad2tCcUY5S29EalJGZnBYQnVLdXVUNVpsSFlFbFkvWGExcE5mTlRn?=
 =?utf-8?B?SExGOWtwU3NVczJTSVl3QmcwZWJrRGhacUIxRUVqR2Z6YkZJM2Q2SjlGU2dZ?=
 =?utf-8?B?UTNCRTR0QnZrVUhPNVA5NFZRbU5QZzYwWjNUbmh4NUJkZWxrUXRBTWJCb3lC?=
 =?utf-8?B?NEJjYkhKbEFrSkJQQnVQS2FacEg5OW9idUFCUVZ6RFdnSlAvM2NJYXl3ckpt?=
 =?utf-8?B?S2FoTFYwN0xmamU0eUdEaEMyOXZPUiszcEVkRnI5UWovMXBid0wxeWhCR092?=
 =?utf-8?B?Q3lpOGZFa3g0M2xIdVVkWjZaWitOekxNWFFxTm9ScmMwWG13NUIvTUZKREQv?=
 =?utf-8?B?ZWNXTE5DNmlGTTlOZHZwbE5Ya3JuWTh0VFY0cXM1MUhyZ2kwQlpQUWNzcnc1?=
 =?utf-8?B?dFozYW5ycEU1ZUVYWTEwM1dmR2d0RFU0NnJHUGdJTkswNXMwSkFwc3NrcGlm?=
 =?utf-8?B?bGRBRHhnQXQ3NVFpSWJ5ZnNFOGZEcDZZbWZIdVYvZDJqNzgvKzBpVEJSOVJk?=
 =?utf-8?B?RmlSVW80Q1NyMVJ2ZnhVVXY1Sk9kTjJzQm5MVDJVZHVVYmVsY1NYcjBNTnRN?=
 =?utf-8?B?T21UT3c1VmlWYXBFMzFnMDRJV3I0VS9VL2pnRTVhVDZwaGVaU1lhZ08reDNq?=
 =?utf-8?B?TVE9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4123c9b1-1a2a-49ef-ec58-08dcab1a1f12
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2024 13:19:46.2311
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kXDJayc+GrfaEjZr9DjoIQbRRHJ8WADrdtJTomiRSbxBt9N6OKjNoT/LZ/stElerdsW4l7s/BwSbcciNFJi7z8pDQA6zT2wDLJf5ZyrYtC8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7258

This patch series adds various small improvements to the pinctrl
driver used by S32G SoCs. These can also be found in the
downstream kernel version [1].

[1] - https://github.com/nxp-auto-linux/linux

Andrei Stefanescu (3):
  pinctrl: s32cc: enable the input buffer for a GPIO
  pinctrl: s32cc: configure PIN_CONFIG_DRIVE_PUSH_PULL
  pinctrl: s32cc: add update and overwrite options when setting pinconf

 drivers/pinctrl/nxp/pinctrl-s32cc.c | 51 ++++++++++++++++++++---------
 1 file changed, 35 insertions(+), 16 deletions(-)

-- 
2.45.2


