Return-Path: <linux-gpio+bounces-40063-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KHJbFBxcVmr/3wAAu9opvQ
	(envelope-from <linux-gpio+bounces-40063-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 17:56:12 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E9880756B0D
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 17:56:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=advantech.com header.s=selector2 header.b=X0K0w1xs;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-40063-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-40063-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=advantech.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6745C3105826
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 15:54:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 554FB4963BB;
	Tue, 14 Jul 2026 15:54:48 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023132.outbound.protection.outlook.com [52.101.127.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1872C466B7B;
	Tue, 14 Jul 2026 15:54:45 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784044488; cv=fail; b=f5N+XvKSGuACGPAJPZxtE6lc8Q13r/QseDl827gjDxzwW9bMYEX8jisqDHuvQlj2O+5oZUXmbuUUUeai6RJZ37lZuU+Lyyurc25mFE1ar0GTr4+dpSffflYeKs1Yyg0efrsgXg9eOJdPnoU2ROg6ug4oUDOub7XZbqHN6bKYtU4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784044488; c=relaxed/simple;
	bh=wMMp4npTjkgvcvtY7cVHFmd8fOZPZ2Gt0CxGmbxMXGs=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=fVJUUxU3awcw6MWM6UU2tsBdSqLVutDureOFfuN81pxlP+DWB5I85VIPpbUTGJcsQid3NKNuCF+wscZhwKAGDp7FcmMGgXuK3+parxRkngvQIsbKol1JWtNYygpEfwI14gYjwg4UR6Bshjeodx8FjOdJtpf6DNtrS6qwLPacsD8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=advantech.com; spf=pass smtp.mailfrom=advantech.de; dkim=pass (2048-bit key) header.d=advantech.com header.i=@advantech.com header.b=X0K0w1xs; arc=fail smtp.client-ip=52.101.127.132
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=inDDIDp3KUkutCqEVN1a/xU7s1AdeeJNJ452uRf83yeC0LRKFmt8Vg1y/XzdsXVWZdoDS2Cnx1PjAae5xQLJqE2IvZTW4Vn5/EL1nVCYcAYwaOYpR86y/wgh2N2dPmPVEZ/GKEq9C6l1Wt+C1tVZ6uxzy1Aj2bfY7tBN9t3RK462KPy6j4SCw+jXjKdneN+3xZqjugsZKPLPo38l9yP/woThuo2YqHn050WVsUqX6XoObXI6CWX3d86zVY70F23rC1JsIz2uRLR/D0jbXS9NOsyboQVBK+/djpFf3FXY54ND/OfCBqxMN7esl1amhe5EMcY2EoPqjU35Xh9AY9ulMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/3mqKVxxuf7JSBBvFbFVIH2js7NM9iwRn3cPt4+Uql8=;
 b=f7Pu9gJj+l6YEJDyTjHFsZPPS6l7Smu07Mboqkf6crCJ4z44ZkSsaUpROFduJ7o4iHXBH63NArZN5hhVNmIencF3LMOdnD9Nz1bZY9hLLw/HLyvO4y/+frt38o0/SjsZb3zRDePO1B5DNB4mhCWPRz8tVZhSLsTzaoOtmvxp5S0xHTcwF5ufCHES1SFzC+IOEWE8cYDxO26bpvJDhEjNvmCsrCeUCQZ5WKquUzSlMpPcM/eRViTrs6Y9ilC2dYkF5j/pk8aELiZ9gPnVZ4fSRa35D6iILaRmwhnvAFyxLmHjzfuojiRFQv65whgX4VJF3zce7A/xpXiJf+ZZSNueBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=advantech.de; dmarc=pass action=none header.from=advantech.com;
 dkim=pass header.d=advantech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=advantech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/3mqKVxxuf7JSBBvFbFVIH2js7NM9iwRn3cPt4+Uql8=;
 b=X0K0w1xsdDDdPYdpai6byqk7dDd8Ie8IVn3xu24jOrISw88VWls3EgxsZD0KzDYpxHsGjfFs9xms1kNmW5AZwbxf5IvKb4FMn56KXAwyrgOoa12gnd4tQ/cHfhITnDDBNJLqM6082bv9LyBwZexP9/hygmDDQD7jCT921s29Jrsdb2qnUkTaP79jWqqe8CNwzKQduqb3zRfEriNgolu6Gh4q4cFMU6QWlvyoH69hSDFP2X99c6whlwH1rizpwPxeNeZL28TFxbpFH40ZHMNNp5gU0HBcZsp3e5TU2WdmwYsqNppfpyT25i6R3Tl6s9uS2u0yVqb4YNzoCBys3R+0Bw==
Received: from PSAPR02MB4502.apcprd02.prod.outlook.com (2603:1096:301:21::6)
 by KL1PR02MB6189.apcprd02.prod.outlook.com (2603:1096:820:bd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.20; Tue, 14 Jul
 2026 15:54:40 +0000
Received: from PSAPR02MB4502.apcprd02.prod.outlook.com
 ([fe80::44e6:6433:8000:35aa]) by PSAPR02MB4502.apcprd02.prod.outlook.com
 ([fe80::44e6:6433:8000:35aa%3]) with mapi id 15.21.0202.018; Tue, 14 Jul 2026
 15:54:40 +0000
From: Ramiro Oliveira <ramiro.oliveira@advantech.com>
Subject: [PATCH v2 0/8] Add support for Advantech EIO MFD series devices
Date: Tue, 14 Jul 2026 17:54:14 +0200
Message-Id: <20260714-upstream-v2-v2-0-76e5e41026db@advantech.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKdbVmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDIzMDc0MT3dKC4pKi1MRc3TIj3aTUxNRko6TExGSDFCWgjoKi1LTMCrBp0bG
 1tQCpQqb1XQAAAA==
To: Lee Jones <lee@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Andi Shyti <andi.shyti@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
 linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-i2c@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 linux-pm@vger.kernel.org, Wenkai Chung <wenkai.chung@advantech.com.tw>, 
 Francisco Aragon-Trivino <francisco.aragon-trivino@advantech.com>, 
 Hongzhi Wang <hongzhi.wang@advantech.com>, 
 Mikhail Tsukerman <mikhail.tsukerman@advantech.com>, 
 Thomas Kastner <thomas.kastner@advantech.com>, 
 Ramiro Oliveira <ramiro.oliveira@advantech.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3220;
 i=ramiro.oliveira@advantech.com; h=from:subject:message-id;
 bh=wMMp4npTjkgvcvtY7cVHFmd8fOZPZ2Gt0CxGmbxMXGs=;
 b=owEB7QES/pANAwAKAc7t0Ke8vbAJAcsmYgBqVlu0YNkY9NL15znGwiha+i99kJxcm8VHDOWO6
 mBdLSae/7qJAbMEAAEKAB0WIQS1Nkng0ZvJmBKh6GLO7dCnvL2wCQUCalZbtAAKCRDO7dCnvL2w
 CatIDADES7J1HWpYc5Ps303bGjQL4SJgqtfQJpvm4xRxTWSiNjZRFRSqnE3gxFX7F5fhIPkqYJQ
 dOFDsuct3gpKr5gPJjQzhbWouKVbZCeYh9Llcv+kzt2ZX6E3oUSThQFavGpmXBQpmKwHVIAhuXf
 4r+yS0sgdREg3pGQaLZKQIDSN6BW+IUSAOf8+h0g6QD3fiiSwZp6K80N4m95WFQnvAUQIXTht5B
 LT9M+QEtIlhIlzHYpz9IRfUodeDXeUV20rimtAt661TbxUrtHrPcmEG7OBKUascd1u1epGcbZJt
 JXTFURjRycnQWiYkwsX97Z6kkWspjeMoas8hr2zMHWVZlhmnr1PR/hxfsUtFDypO6pWdcGXknUA
 DrjtYU+fq9YbXMkVY7flialTN/NBeuuM8Hquvcui4h/sZrVZK0EAccrx7hRfQXIbb0KVxWXgNc1
 wK1qi+ZotzICdh8jyglJR3+yCs7kWhWN8FBIWEzNDY1Y6vMo+KFGETFDKSdezftC8cp8s=
X-Developer-Key: i=ramiro.oliveira@advantech.com; a=openpgp;
 fpr=B53649E0D19BC99812A1E862CEEDD0A7BCBDB009
X-ClientProxiedBy: FR2P281CA0086.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::14) To PSAPR02MB4502.apcprd02.prod.outlook.com
 (2603:1096:301:21::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PSAPR02MB4502:EE_|KL1PR02MB6189:EE_
X-MS-Office365-Filtering-Correlation-Id: a3d789a8-8bad-44d3-df20-08dee1c036c1
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|52116014|7416014|376014|921020|38350700014|56012099006|11063799006|6133799003|55112099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	LONwMRbhfH9gmoT6wAIqYPzk+jHRg3lBFs6rlJppS4+hOBehzV0A+Sjyb7VlRimYoHDUcDdzOQK98cf8k4Cl/DFZfxorw9qu8ON9Sp4tnR9fxmNApKSV+2qy1vkk9JYe00iQKfloRFg5EONwddH634vli6M+4VE8dDidSFkexCYUtjoBABRMgvJA2zgs/zPiTg8ZeaPIUvQOHAecJVFZwy+5BhT33r3ByXtxIoiSSpi0BZ+WGdO0akTzJ5rwyvSdTxuC7qkgCZJQx7NKsoPvShHrGpLQJjjtpLNVCYbOVm0KBm3pl3dyd+MM2edhgy5UE2BW37+v5PdUXQsoLDHJY13LGEtov5KaapE/Zr9fcJ/NMdxfwV/CtO80+FsESZnZUZ/Nk6X738/wLDXVv3B13gMD1LkNHAmFB7skT0sikrMSUPqjGvtnya+8AXiSPpxaA9KVjgtTWH190/KllyeYZzTu/xCuB1CdRUCNCaFC3WqK5Ub9803AJCe3Sp0M03k6N0gDUsgo4pR/86ZKEUi4THluj35ZKkwvYzLnE5yMFaRE0b695psD3T82PPm/WTomrh58zVwcpUk0ASLWutGq26xuKdBdrEVcULTmxMs5l8BnDWbg6pKl/+E2fnUwLSu8K0uozUIKrZDLrQt4NMwISPY0M74jWOLdgX0nPe8KSgUp4RNfJGvW9rNLC5F7kqV9H3ItCZJBMMntphSDV8nLYi4lPiZecc9juDRATDE98hIUPb4Bpc6ss4rhsKDiZB95
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR02MB4502.apcprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(52116014)(7416014)(376014)(921020)(38350700014)(56012099006)(11063799006)(6133799003)(55112099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RG1IemxJZFhVZXg5N0VBWGNRTXlGZkVRRFI3NE9nNkdYTVI4bDd0ZGxZRjVv?=
 =?utf-8?B?aVpJWm8rNVVCaUVxaHN6NldqMUE3Y1dMRm9uQXZSSFlFMi90bUdsM1VsVkxQ?=
 =?utf-8?B?UnI5UDM3TEJLSGlRL2FqNUx6NHhFWG5rWUxjOUcwUzNWRjlVdnV5TW0yWjNR?=
 =?utf-8?B?YUVNcmU5eDJmenhHeFdYYk1oSzFSRTJLNmhQaWIvck5WTkhYeWhnN2YvczE5?=
 =?utf-8?B?elowTWRRRENDWncwOVlwVUJYV3JqRnNVZCsyZVlkMTNKekVQTGRMT2xJOXJX?=
 =?utf-8?B?RzZUa2Rydnc3MjRoVXpCSUJrRjBZb1dkbWprV1paK2JHS0JlWmdkOVBWK2NR?=
 =?utf-8?B?aUpHUnIvN1phN1hPR3BLTmJwZnd5RmhYamtWQ0RjcHhmTVA2Q2dSLzVMeWtk?=
 =?utf-8?B?NWIvQXZ4am0wZmVwaWRtaThHdWRRRndwSEN4d2xCRkZIaXE4cmFZeXIrUGVn?=
 =?utf-8?B?YWlDOEdXY3V4YnZvYzltVjRuTG4xV2c3RTNjNWpXQXhzR2w1bWdGN0JHbTBJ?=
 =?utf-8?B?TXdHS1g3R2ltZWdGMndIblMvRUNkY0gwRkdJNjVQRGp5MXV6TGF6WC9RODE3?=
 =?utf-8?B?aDl0MmlKKzRma1VJa2pCd1VxQ3RYS0N0eW5Edy9oTXNFaStrZXFDV2g0cmFG?=
 =?utf-8?B?WSthQ3E1WGJNVzdONkVYZ2RwYXNEeWlWeDRHUkM4d1c5czc5M0RodUtmblE5?=
 =?utf-8?B?VW5mMFU0RDdCSmNkRWJQd3QrLy9FZ3VZcGJFa2ZXMzdIVzBiSzFkQm13c2dR?=
 =?utf-8?B?OXF2RG1VRER1a0ZHRGJkaVdRdE13M2lGWHowTS9uaENHekFaOVg5Q2RtVHMw?=
 =?utf-8?B?b0FFQTh3a1YzbHRFUm9FbWlSc3JDVUt0eVJ3eitxSUI3UGxEcWd4UnZKaWlo?=
 =?utf-8?B?a1JoTVNoN1RTK09XVHZqT0MvcG8xam41MFNaeEFpOTM2SWhkdmd5b0lCWTdB?=
 =?utf-8?B?QS9IM1ZsWDJXKzVBSHJ0aGpRV0dpeHpEQjcvaG9OYldtbXhGQXB6Q3g4Tklh?=
 =?utf-8?B?ZU82YzZEalR6U3Zpdy94d3hqcXR6TFlyNXFJR2FBOS9pNDU2OTQzNktlQmx1?=
 =?utf-8?B?UHVKeS9NcTh2SGEvTGtuU3VoYURKdGZteUhNZ3RQSFMramFpa283MDhaMmFk?=
 =?utf-8?B?dlhwbnBrL0xmczZ1bmptNFZ4dkR4WFdEZFhlREtUNThmOUlQVm82cWRrcW1y?=
 =?utf-8?B?UStNZlpHdEJSblF0UGpzSkE1MitQTEgrZ0dQNzJhdjgwSy9kdlhZbTVtYWJm?=
 =?utf-8?B?L1ZzY1pyQnAwZHBERlUxeTU4NDdnR1o0ZVdLcGsyZ0QzSm1pMm5xREdNMkI3?=
 =?utf-8?B?WU82cmsrMkFWWHcrWWliVjlrdGdnSVJwNGFVOVNjL2loVkM5NzQwZWRLL01o?=
 =?utf-8?B?d0tYdEEvK3RrVHZUTmYxQUxJUDhCY29iT1U5OFJLM2l5a3RGYUpEUW9XWDhF?=
 =?utf-8?B?c2xJR2p3UnBqK2QycHVDTlQxYXJwOWg5U0NQSDJidSt1TFZrME9TQUI0WkN2?=
 =?utf-8?B?bmkvRytGZnFoQ3RGR3prSXRCU2tLQkJucnBHTmZJdE1LRG9mMUhIQ1FPWVlH?=
 =?utf-8?B?cnhveFg2V29nVXpIVWlseFF0SEhsb0lrMEF6S2MyRHZHWkRYaFFibElFc0Zy?=
 =?utf-8?B?QnNEWi9DZnBrNHlOdDJpdTNRcHNjeFB6ZjNONCtEMkNYN1hKWTRLU0pIOE11?=
 =?utf-8?B?K3Z6TS80cFpkM3FvWWQ2aDhMMkJsYS9oK09XSDlGeWRuOUU0TFhFY0xHZE5N?=
 =?utf-8?B?ejR2NDZnbXNuT0ZhVnNNWUNmL0h1blBYeGRJTnE5QXkra01ZQWxEbW5Fcjk2?=
 =?utf-8?B?R2pFa3ArMFJpNDZ6TmttTHpsaDVpOW9XcFFQNXEvbkF2U1pkbW1KdFczQ0hH?=
 =?utf-8?B?bTY2aXIxQkJrNUtndUxuNzF5TTRzQXFoMGlSV2I4WGZrYmFJWHFReHdoMDZu?=
 =?utf-8?B?OGI3aEVkZzF5OGhIMDhwUGVlWlJNd2pSTVM4WTZBWG5zL0lHN2xwRnBVN1JV?=
 =?utf-8?B?ZmF6d0oxckdoR2t2azFMSnV3NllzTk1jalBhUXFUQVJlK3NWdkZKSmdCbnNP?=
 =?utf-8?B?TjJ2WjhKak9VRFhGZGJYU2l6NS84ZHFwczM2LzdweWtPZVZHWnF6N2MyeXRP?=
 =?utf-8?B?czUxNGRKajRJZE1wbmdqS2U3N25NYXZ4OW5LcW9lMUlrYmc5Mm04V1FmTThs?=
 =?utf-8?B?aTVnRzVjNkhJZmtsQXhBN2tjeDFTb1JCc29ianBpcjJsLy83SUJPMm92eUlL?=
 =?utf-8?B?a1FHbjVNb0UzaWxkWGxmRmVIMk1pMFZTZ1I4MUNoalBObE9mMXprMW4rZ3Jh?=
 =?utf-8?B?NVNTL1h6UzZ6OXFsRUlKTHE4TnpmU0E1QTBtaWxpdFhoVGRoT0hwOVhVaHpO?=
 =?utf-8?Q?Jf/hf8GI919nm3h0=3D?=
X-OriginatorOrg: advantech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3d789a8-8bad-44d3-df20-08dee1c036c1
X-MS-Exchange-CrossTenant-AuthSource: PSAPR02MB4502.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 15:54:40.3579
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a77d40d9-dcba-4dda-b571-5f18e6da853f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VwIhwrgJz7k/mIzQ8vDOMVvJxUNyY3KVUPvq9GetXsj4tzG7nyfQ58RqhThPqoTVfUUFKZ/EcA70/rf/aZ9GqzRgV5whWh9HL+PAEdUd94E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR02MB6189
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[advantech.com,quarantine];
	R_DKIM_ALLOW(-0.20)[advantech.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-40063-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:linux@roeck-us.net,m:andi.shyti@kernel.org,m:danielt@kernel.org,m:jingoohan1@gmail.com,m:deller@gmx.de,m:wim@linux-watchdog.org,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:rui.zhang@intel.com,m:lukasz.luba@arm.com,m:linux-kernel@vger.kernel.org,m:mfd@lists.linux.dev,m:linux-gpio@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-fbdev@vger.kernel.org,m:linux-watchdog@vger.kernel.org,m:linux-pm@vger.kernel.org,m:wenkai.chung@advantech.com.tw,m:francisco.aragon-trivino@advantech.com,m:hongzhi.wang@advantech.com,m:mikhail.tsukerman@advantech.com,m:thomas.kastner@advantech.com,m:ramiro.oliveira@advantech.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,roeck-us.net,gmail.com,gmx.de,linux-watchdog.org,intel.com,arm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ramiro.oliveira@advantech.com,linux-gpio@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ramiro.oliveira@advantech.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[advantech.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,advantech.com:from_mime,advantech.com:mid,advantech.com:email,advantech.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E9880756B0D

This series implements a set of drivers allowing to support the
Advantech EIO-2xx series of devices.

This includes GPIO, hwmon, I2C bus, backlight controller, watchdog,
thermal and a fan driver.

This series of patches targets several different subsystems, but the MFD
subsystem is the main target.

Changes in v2:
- Rebased on v7.2
MFD
- code cleanup
- Remove timeout from sysfs
- Propagate errors
- Remove version.h
GPIO
- Code cleanup
- Move gpio_chip to probe
- Remove timeout from sysfs
HWMON
- Code cleanup
- Refactor to use hwmon register with info
- Remove tacho, same interfaces as fan
I2C
- Remove timeout from sysfs
Backlight
- Code cleanup, remove ununsed max parameter
- Remove timeout sysfs
- Use helper functions instead of direct calls
- Correct return value in bl_init
- Initializing scal ein backlight_properties
- Return correct value when no backlight is enabled
- Remove log on successful probe
Watchdog
- Remove timeout and IRQ from sysfs
- Remove unnecessary logging from set_timeout/pretimeout wdt_get_type
- Remove timeleft function
- Rewrite wdt_set_irq_io to correctly handle return codes
- Remove unneeded watchdog_init_timeout
Thermal
- Remote timeout from sysfs
Fan
- Remove timeout from sysfs
- Remove unused variable temps_mc

- Link to v1: https://lore.kernel.org/all/20251212-upstream-v1-v1-0-d50d40ec8d8a@advantech.com/

Signed-off-by: Ramiro Oliveira <ramiro.oliveira@advantech.com>
---
Ramiro Oliveira (8):
      Add Advantech EIO driver
      Add Advantech EIO GPIO driver
      Add Advantech EIO Hardware Monitor driver
      Add Advantech EIO I2C driver
      Add Advantech EIO Backlight driver
      Add Advantech EIO Watchdog driver
      Add Advantech EIO Thermal driver
      Add Advantech EIO Fan driver

 MAINTAINERS                      |   19 +
 drivers/gpio/Kconfig             |    6 +
 drivers/gpio/Makefile            |    1 +
 drivers/gpio/gpio-eio.c          |  252 +++++++++
 drivers/hwmon/Kconfig            |   10 +
 drivers/hwmon/Makefile           |    1 +
 drivers/hwmon/eio-hwmon.c        |  461 ++++++++++++++++
 drivers/i2c/busses/Kconfig       |    6 +
 drivers/i2c/busses/Makefile      |    1 +
 drivers/i2c/busses/i2c-eio.c     | 1135 ++++++++++++++++++++++++++++++++++++++
 drivers/mfd/Kconfig              |   10 +
 drivers/mfd/Makefile             |    1 +
 drivers/mfd/eio_core.c           |  644 +++++++++++++++++++++
 drivers/thermal/Kconfig          |   17 +
 drivers/thermal/Makefile         |    2 +
 drivers/thermal/eio_fan.c        |  478 ++++++++++++++++
 drivers/thermal/eio_thermal.c    |  346 ++++++++++++
 drivers/video/backlight/Kconfig  |    6 +
 drivers/video/backlight/Makefile |    1 +
 drivers/video/backlight/eio_bl.c |  243 ++++++++
 drivers/watchdog/Kconfig         |    7 +
 drivers/watchdog/Makefile        |    1 +
 drivers/watchdog/eio_wdt.c       |  641 +++++++++++++++++++++
 include/linux/mfd/eio.h          |  124 +++++
 24 files changed, 4413 insertions(+)
---
base-commit: 50c051a08a731c52933608fa8e9174cd9875fcc4
change-id: 20260714-upstream-v2-beaec2baac0d

Best regards,
-- 
Ramiro Oliveira <ramiro.oliveira@advantech.com>


