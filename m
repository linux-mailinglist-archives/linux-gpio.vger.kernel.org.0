Return-Path: <linux-gpio+bounces-6110-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4BA8BBF2A
	for <lists+linux-gpio@lfdr.de>; Sun,  5 May 2024 05:40:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F2F121C20ACB
	for <lists+linux-gpio@lfdr.de>; Sun,  5 May 2024 03:40:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2F65AD2C;
	Sun,  5 May 2024 03:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="M+zd36s1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on2050.outbound.protection.outlook.com [40.107.6.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22A911712;
	Sun,  5 May 2024 03:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.6.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714880404; cv=fail; b=gkoKy26MVGiFUVl9O6W5JtkJ8K4eB9J1MI8wgad3B8+tIYEdbU+p9/SkSITdO3zpACZp8RVmODyAEhkVxvPE3BHG0IwBvD2jSdar92DtTW5vAfy7B27QG+yG8C+TIKg5IdSf3JjMCSKX47I5qnX33legNnHk7oQIWjylX88xcSA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714880404; c=relaxed/simple;
	bh=pnQfvjcg8gty3KvV5qIV2Km23PdUXViO9ur/K27O52I=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=QrxIb6X49pNe1BBGalylnLk5hjg3IZHAQPzk+Kb+wbzPw6eblFGo8To537vlnF7zYVCjXaBq8HeBQ6AYR2xpvksEYjzcevSMtlIJNQUxiY5fnX34Tzb4q4QF/eO9C4FWVySsl3VWHHZcp5osMnbjDzG6OSa4bRPvecmUs5CbmwY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=M+zd36s1; arc=fail smtp.client-ip=40.107.6.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PhMJ5ctiymI/swPTEuMF84rkSaGfCpl4AMvgvu1Bsma0JPHoRnt+0CX9DnflwDJKjkzkKiLFJw1WyqFPY4SPc233xT+akuqFqLm3SSIMEadFUZ8ji5sgdL2XW/XWk9bHGQUGrhYhxL1gK0nNiEcSn7sBZ9HbkGsyf0VMkhpncSJ/lBg8sPX0I6zEH8mtp8yy6NzNvlJrscm71cGaJ6taZj8C4xlxgn25LmHoBTF+jofi4VnZ0Xh16cELmoxOdjA4nAw/gbxjRoXJ5vjbf14uAULOE4uyWiN7OaWUBHu2sAzBnz3OuUuTxwdU9FTegnt34uIZOVUGQjUx63hwyF6FVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MICHok6sPr8pa2cf9OH6WUBu2RhwppFXYPYOCVKvmIU=;
 b=OufZ5M0YL02tMiQu2PmR+5FH3ZuJ1LNmUI8sxyQ0o7/0wMjXN8Rf6ukHbWoOje4FbWOuihsJ2hKgPogT1aSHtA11xFOLwAg6EKWYTBcZSzIjyd/y8mlofuiZdYgKQjFvtWGbeDsICiiu+TJuV2Sf73RrKtXayuoh82AXQ+Ma7hszn+bTViJQBUQKWa72fYEYHVqzXBbr6SWfWcvqw5z+AWc6IhOrup9isfs3IC1n1/ZtqRtsuqOoyPgS8PF5xvvsQ2OyuUTnG2gVdbg8myhYdR9noDwD7eBRwG4SI9VH+0ocePBtQWs93sR+nJ5GAZsaIOQaIi7Kvn7E8kJsbabDsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MICHok6sPr8pa2cf9OH6WUBu2RhwppFXYPYOCVKvmIU=;
 b=M+zd36s1EnkOLh+vOkT9WRc9A29v5VU5ZdRXP50mE0fZkg4pgtkgRwbuW1V2qlF79Mw8pSI203X2VI30RV4OkTNNVT4ai6zPpy7UEyLDmyiPuunhtPPJ94KnPmOlFq5QINF3u8Du+9Dp33qNkGz7l3ZAWMFVl153g7j5B+rvRB0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by PA4PR04MB7599.eurprd04.prod.outlook.com (2603:10a6:102:ea::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.39; Sun, 5 May
 2024 03:39:38 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d%4]) with mapi id 15.20.7544.036; Sun, 5 May 2024
 03:39:38 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Sun, 05 May 2024 11:47:19 +0800
Subject: [PATCH v4 3/3] pinctrl: imx: support SCMI pinctrl protocol for
 i.MX95
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240505-pinctrl-scmi-oem-v3-v4-3-7c99f989e9ba@nxp.com>
References: <20240505-pinctrl-scmi-oem-v3-v4-0-7c99f989e9ba@nxp.com>
In-Reply-To: <20240505-pinctrl-scmi-oem-v3-v4-0-7c99f989e9ba@nxp.com>
To: Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-gpio@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714880848; l=18054;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=IM8T/Fw/7itj6/oIqmhPHcq37uIf+3Ap9SbdT79HT64=;
 b=q0Q/DZOOGSx9FqTnmW+Pgm0SZzbpKWSxf2GwQrCl9zdXloNJWq7BEFWSg42PAuji9wATOWPRD
 h1JL2hUQtKRBf2uez2nQvtB5oPi79damvwKoXnelihIvGcnTxaAOyWZ
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI2PR01CA0022.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::14) To DU0PR04MB9417.eurprd04.prod.outlook.com
 (2603:10a6:10:358::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9417:EE_|PA4PR04MB7599:EE_
X-MS-Office365-Filtering-Correlation-Id: 042f24a5-2c15-475c-7dd3-08dc6cb4fd8b
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|7416005|1800799015|52116005|376005|366007|921011|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M2RSekZ5Z2l1RldzbkNpeG9xTzlaeXFZUlo3dUtTVXhPbXJrbmJXUFhDSmNu?=
 =?utf-8?B?Yk9FUU4yNG1BM3BUYTBjbzFIVmdqUlBVdlY2MFc0L3k1WUs4ckJUZWRuZ0pr?=
 =?utf-8?B?bFhkNEdxbUxHMjNabk50UHZLazBxS1c5RkNnVE5Db1BsSllmaW9VRG9Rck0v?=
 =?utf-8?B?ZU1aRXVHcHk1bEx0dHYrV2JjSjU2V3htNUxndjhaejFFL0Z2SWpxU1o1UU5Y?=
 =?utf-8?B?dVBoOWRsVlZkak45SWM0UHpWb2hnendHRGFjOXVFYjRIWEc4TGtIYWt0K2Uz?=
 =?utf-8?B?NU9lM2s4SXpjOUVIU0pWMEpaWWRiMmo4UlJyYlhvYmxzVXBhUVBoWHRmeEJL?=
 =?utf-8?B?MjE2K2JkRktLVjRVODFuWklzN2dSNjhqRkRXcTVqZVA5MDVjbHh4eXBYck8y?=
 =?utf-8?B?Y21EbkNxbzc1Ums0NEpFdE5oOFNKTmZiNlQzSmJkU0ZiZHhQRDUvaURJalY4?=
 =?utf-8?B?SUc5bHVhRDMyS1FRU0VNdEw5Um5wWGJJc0JrRkVuVk9FNlliSlV2YUlpWVlt?=
 =?utf-8?B?SStPU3dZeFRvV3o3bWtHTm5zd29IWllrbldpZjlxWjZKWEpnN2pOYVdVanhN?=
 =?utf-8?B?NkVQdTV2b3FXYnprbnFmdmJpSDl3dURMQ2dLNldKSzQyS0c0TmVScERQKzYr?=
 =?utf-8?B?WlJxLytlRVZWS1ZCOGNZdFNxVE5vNmEwOXNoYS90M3F3ZFB0MGdWQWtIbmNa?=
 =?utf-8?B?Ni92L00zQVRoZmUwN2J2YXh1aVVvZCtIZEhTREhNcXYvQ2RUZjJQeFNodWpR?=
 =?utf-8?B?QVpBS1JqYzlnS3M3bmRHK0QxZmEvQzNndUpMS0pGaDk2elRPa1FBVlEzWEN2?=
 =?utf-8?B?Z0NXdUxETkhia1VqTEFtOFJlbCt6U3JCRkFFVGZBM2JZa2dCSVRLeDZWek1p?=
 =?utf-8?B?MEdzWVRINUdSNHlKeXNYMTRyUjY1aENqZy9Id2szVFVLdy9kMkdGNXBESWVY?=
 =?utf-8?B?NGcvWGZOQldqaldXU1BhUjEwUVlaWXJ3b01YV25xRWQ3ZEZ5bDkvazZaTWx2?=
 =?utf-8?B?TEZpa1dHS3J3SmcrVEZxZWlicnp6QmgrbDVUeGpSZCtBN0RadkUvQWwzVUhq?=
 =?utf-8?B?US9qSFZ4RHBqN2JsSGI5M3hxVlFOM092Y1pzbkpZNE03aThkSmNhUEpEM2xx?=
 =?utf-8?B?NGhDM29vZEo0TEtFWVRobDcxTzVHZEQ2MWM2bzBGOTNMYU41Y1N1dXJBV2U1?=
 =?utf-8?B?UDZpYjhERHpleUpIVGlmT3pTOFhHRWI1NXVDYWR2STJxZ2YrcTNwdmV5aG9K?=
 =?utf-8?B?QUFjcHpUcXdvdnArR0hVSng4T3BBUGlRWFcydDQzdzd4bDNoNU15QzF6N0gw?=
 =?utf-8?B?aGVJWU9zM1Z4bWFUZDFBbk9GbHI1L1BTdkFVOUdneUx6c244cDlYejRwMjBj?=
 =?utf-8?B?MUtpZzVDSUU1dGdlOHpab2pZUmZYd3Y3SW9rZ0xJUm5ya1F6QXVycDRYV0l3?=
 =?utf-8?B?NU9CNzM2V1lDNTRaM0tINDIrMHNyUXMvTy8reENRMHVKYWJNdkFaL055aHho?=
 =?utf-8?B?UTBXSnc4S09za1NRZHZ4dllQR2FrRitBNVpkc21WbGZPdGduQ2VrU0FKNTg1?=
 =?utf-8?B?VVlFZUpGSjBlNER3c3VUT2hXbGJOQUtRRWRVamV0dFNIVXFPQ0d4VmxhYW10?=
 =?utf-8?B?dVJhWkFndUtleTZ0c29Qb1oyZnFMaE40S3U5SGllMGxXN2owS3NlNFJtYXRI?=
 =?utf-8?B?WlcwMWtEcHR0eXd5eHpTcHRWOEpnNTJOUVJzQUlaVUxEV1JIV0dzWkZ3TVFk?=
 =?utf-8?B?WVFIMkI3NThzRGNxbElrWi9jN3o5MUVPMGpiVXlMRjQ5YWNiZDRBc0NOZFd2?=
 =?utf-8?Q?YoG7tFbOXTBbVWATUjQu7DU7UeXpHeIMfT43I=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7416005)(1800799015)(52116005)(376005)(366007)(921011)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MUp6UDRlNG5uRHJYMEtOemRsS3pTVm52b1Y0N1pFUG9KNkZvdUZ1clJtWmkx?=
 =?utf-8?B?UENyTmF0eEtuSTgwdlNEd3Rqb1E2VUZPVVJheUpiWEVmSWZuTU5ZWXNZTHBL?=
 =?utf-8?B?KzY0bE8rWXJTYUJLdVppYkM5aVlzYVZCYlRDQ0RKK3E2UmRMRDNuZjZTaVZs?=
 =?utf-8?B?SnZQT0RUbjd6M0g0RzZPUXpIK3ZydFJJZ1ZjY3BXUnlXZWJPM05BYnBPWFZH?=
 =?utf-8?B?NzJiMDYvZHRPblJkdDN2NTgyNVdSZWhVSnh5cXRQYy9NZnE2SnRFVkhhNzRi?=
 =?utf-8?B?UEtRV1hBZ1NRVUpHWEVRM2xwM2lsWC94UzBpZ2VkNGhnMWxsdFJNVzJVdVJB?=
 =?utf-8?B?Ynp6TDdzZUwra2xDbHhnVzZ0WGJha2pick9kTTdXM3VoenpjK24rdzVOOGo2?=
 =?utf-8?B?dWRWbW9FWE5tK09uMXZrZFMyVVpxQjh0ZFpwVHZweVVvUW9pU3FLT2VocFll?=
 =?utf-8?B?cHpSZExnb1FwWFZvT2lrZlUwVFpYYktlT0kvMU9UZm1JMC9sU3VkTWYvOEs0?=
 =?utf-8?B?UVpHbkNLRGlKRWcxWml3ZEFQTHYyR1dQeklrdXlMbXlNakRHOWtyMmZTN3NB?=
 =?utf-8?B?WXVwRFYxSlVFbHNSbzJUWGlFL3F4cXA4YmtRUXFYN1hPSjRFUWNSUlRUSnhu?=
 =?utf-8?B?Z3U2ZGNTTXk0ckVwajZKOXFKSjNJRTU0RUVuZ0haV0lscEVldFVoNXlmTFEv?=
 =?utf-8?B?eCtxWWVWWnA2dnhGWWp6YTVjSmcvSWpCekdnRE1EMDBGWS9weTh4QUE3R3pN?=
 =?utf-8?B?RmoxRi9QcC9ROXBHT2hpOUxiNjY4cytuRmdTSjhRUWs3MTh2T2ZRZnpJZjFZ?=
 =?utf-8?B?WW1PVTZpQXZXaStHTEFSNU1tSm1pSkc4MkVDWHFFejlvblNJalFWbGViZ0l0?=
 =?utf-8?B?UVM0VVRXVENOcG01ekdLOHlkT0F4SG0rWEdzN2lwSERuaU5rZUVIMzFnYnNh?=
 =?utf-8?B?UjM0K1ZEZWNvSFNXL3EzTEEzNVFGNEFFZ0twOGNtOGJpTDBqREQ4SGdBVCtq?=
 =?utf-8?B?c0hoS2tLeFJWdUwramZDMG52cTFkUFNDWXdPR1dWQjJ5QzdFajlxSGRFY3Zq?=
 =?utf-8?B?WXpPalNGK2Z3NDk3OTlEVG1ESWJ1QTFYTnVIb0Y4Y25nUkZ5SjhuZlpjU1B5?=
 =?utf-8?B?SFppSTVZU1ZCQzF4WTMrR3EzWjhqRUpJU0ZsSUJTcTFJUm82bkU0a1Rxek50?=
 =?utf-8?B?TzI4V0dPUHMxRDFXbnNvY1htRDhqK0JTc1lsTGpMMENFMm9JNXFMVzRSM0Rv?=
 =?utf-8?B?Zy9FeHQ0WHdEVDJVeEZQRzJ2WkdQQWNtTEdia1BITVVjbEo5K0RBZ0gyWTYx?=
 =?utf-8?B?dk55K09EUHBuczRxdGltQWQrZ2NjUDdnZldFWG93dElTOHE4NnAvSitVYm1Z?=
 =?utf-8?B?WEErU3BFRm5jSStsam5FMlNQM1MyQnJBUzNmVlFyN1dxRE83Nmk2M2ZIelRR?=
 =?utf-8?B?V0NidklZY2JCOTVRTUhYcERjYkJqd3RjakJhQklJaEt4Z3pjOXpsQWZ0VVQ4?=
 =?utf-8?B?V1ozK0VoN3dxNmwrMkVzRlJIbGl4djh6OGlZUHUyVGMybWpuNCtoc09IRVdx?=
 =?utf-8?B?U2NBcXlGckRlRGxUTDJFVnlhUjlMYUZOZlgrTDhwZWdYbnlQUXROaVZsdDc0?=
 =?utf-8?B?dFJjbDRqdUVGYXB1QlV1QlhDNC9CNVF0RGtDeUVTRUJyNXZ5VEdMVS8vQm51?=
 =?utf-8?B?WGhrcDA4TzA4aWZUUjdsT0tMM0hNRUJKVTZ5NnNYdlM5c3RxemdqMkQyVEpr?=
 =?utf-8?B?M0dFWnlsN1ZPcTE4Wmo0UE1GWkV6ZUtRenlVN0hLNExJbVFXU0FuNVFtc3Bw?=
 =?utf-8?B?cFFPVVpEQXJnMmdkb28zWEF0WXRXTGpZa2lkeFFrK25EWE5mL0cxOXRBYVZ3?=
 =?utf-8?B?WkpXZmREM0ozd2piZHl1OURoVTRoQkFJdG1zZlJCUkxNQXJiVlRvMDdGUjJN?=
 =?utf-8?B?WlMvZmZSdmwrakhpeGtMYVdtWHJUU2tSaFVUWENMQmNyeGcyRHM4cHhLK0dC?=
 =?utf-8?B?TTduY1dxSGdNVHh5c0gxUy9CWUVQeVhjTEdYb25PczRiQWJkSWhERXlvWmRS?=
 =?utf-8?B?UEhKZGhsVlMrN1h6TTB0SWFpbFA2TkNOZGY3bjVlVVJSMThiNm9KWFhQL0hJ?=
 =?utf-8?Q?XfbZCJKYQ3bQS9vqCuNdr6b72?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 042f24a5-2c15-475c-7dd3-08dc6cb4fd8b
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2024 03:39:38.4618
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DPst6aqLL/3Orcww+2TG46FTGNGFBupSSB4geYH2/vVE4K1BnCWUMQMbyn9yzAfOp8Ecct+m21oa+4TozC1Zqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7599

From: Peng Fan <peng.fan@nxp.com>

The generic pinctrl-scmi.c driver could not be used for i.MX95 because
i.MX95 SCMI firmware not supports functions, groups or generic
'Pin Configuration Type and Enumerations' listed in SCMI Specification.

i.MX95 System Control Management Interface(SCMI) firmware only supports
below pin configuration types which are OEM specific types:
    192: PIN MUX
    193: PIN CONF
    194: DAISY ID
    195: DAISY VAL

To support Linux generic pinctrl properties(pinmux, bias-pull-[up,
down], and etc), need extract the value from the property and map
them to the format that i.MX95 SCMI pinctrl protocol understands,
so add this driver.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/pinctrl/freescale/Kconfig            |   9 +
 drivers/pinctrl/freescale/Makefile           |   1 +
 drivers/pinctrl/freescale/pinctrl-imx-scmi.c | 586 +++++++++++++++++++++++++++
 3 files changed, 596 insertions(+)

diff --git a/drivers/pinctrl/freescale/Kconfig b/drivers/pinctrl/freescale/Kconfig
index 27bdc548f3a7..23c71d2ea388 100644
--- a/drivers/pinctrl/freescale/Kconfig
+++ b/drivers/pinctrl/freescale/Kconfig
@@ -7,6 +7,15 @@ config PINCTRL_IMX
 	select PINCONF
 	select REGMAP
 
+config PINCTRL_IMX_SCMI
+	tristate "i.MX95 pinctrl driver using SCMI protocol interface"
+	depends on ARM_SCMI_PROTOCOL && OF
+	select PINMUX
+	select GENERIC_PINCONF
+	help
+	  i.MX95 SCMI firmware provides pinctrl protocol. This driver
+	  utilizes the SCMI interface to do pinctrl configuration.
+
 config PINCTRL_IMX_SCU
 	tristate
 	depends on IMX_SCU
diff --git a/drivers/pinctrl/freescale/Makefile b/drivers/pinctrl/freescale/Makefile
index 647dff060477..e79b4b06e71b 100644
--- a/drivers/pinctrl/freescale/Makefile
+++ b/drivers/pinctrl/freescale/Makefile
@@ -2,6 +2,7 @@
 # Freescale pin control drivers
 obj-$(CONFIG_PINCTRL_IMX)	+= pinctrl-imx.o
 obj-$(CONFIG_PINCTRL_IMX_SCU)	+= pinctrl-scu.o
+obj-$(CONFIG_PINCTRL_IMX_SCMI)	+= pinctrl-imx-scmi.o
 obj-$(CONFIG_PINCTRL_IMX1_CORE)	+= pinctrl-imx1-core.o
 obj-$(CONFIG_PINCTRL_IMX1)	+= pinctrl-imx1.o
 obj-$(CONFIG_PINCTRL_IMX27)	+= pinctrl-imx27.o
diff --git a/drivers/pinctrl/freescale/pinctrl-imx-scmi.c b/drivers/pinctrl/freescale/pinctrl-imx-scmi.c
new file mode 100644
index 000000000000..d055c58165f9
--- /dev/null
+++ b/drivers/pinctrl/freescale/pinctrl-imx-scmi.c
@@ -0,0 +1,586 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * System Control and Power Interface (SCMI) Protocol based i.MX pinctrl driver
+ *
+ * Copyright 2024 NXP
+ */
+
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/errno.h>
+#include <linux/module.h>
+#include <linux/mod_devicetable.h>
+#include <linux/of.h>
+#include <linux/scmi_protocol.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+
+#include <linux/pinctrl/machine.h>
+#include <linux/pinctrl/pinconf.h>
+#include <linux/pinctrl/pinconf-generic.h>
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/pinctrl/pinmux.h>
+
+#include "../pinctrl-utils.h"
+#include "../core.h"
+#include "../pinconf.h"
+#include "../pinmux.h"
+
+#define DRV_NAME "scmi-pinctrl-imx"
+
+#define SCMI_NUM_CONFIGS	4
+
+struct imx_pin_group {
+	struct pingroup data;
+};
+
+struct scmi_pinctrl_imx {
+	struct device *dev;
+	struct scmi_protocol_handle *ph;
+	struct pinctrl_dev *pctldev;
+	struct pinctrl_desc pctl_desc;
+	struct pinfunction *functions;
+	unsigned int nfunctions;
+	struct pinctrl_pin_desc *pins;
+	unsigned int nr_pins;
+	const struct scmi_pinctrl_proto_ops *ops;
+	unsigned int grp_index;
+	struct imx_pin_group *groups;
+	unsigned int ngroups;
+};
+
+/* SCMI pin control types, aligned with SCMI firmware */
+#define IMX_SCMI_NUM_CFG	4
+#define IMX_SCMI_PIN_MUX	192
+#define IMX_SCMI_PIN_CONFIG	193
+#define IMX_SCMI_PIN_DAISY_ID	194
+#define IMX_SCMI_PIN_DAISY_CFG	195
+
+/*
+ * pinmux format:
+ * pin[31:21]|mux[20:16]|daisy_value[15:12]|daisy_valid[11:11]|daisy_id[10:0]
+ */
+#define IMX_PIN_ID_MASK		GENMASK(31, 21)
+#define IMX_PIN_MUX_MASK	GENMASK(20, 16)
+#define IMX_PIN_DAISY_VAL_MASK	GENMASK(15, 12)
+#define IMX_PIN_DAISY_VALID	BIT(11)
+#define IMX_PIN_DAISY_ID_MASK	GENMASK(10, 0)
+
+static inline u32 get_pin_no(u32 pinmux)
+{
+	return FIELD_GET(IMX_PIN_ID_MASK, pinmux);
+}
+
+static inline u32 get_pin_func(u32 pinmux)
+{
+	return FIELD_GET(IMX_PIN_MUX_MASK, pinmux);
+}
+
+static inline u32 get_pin_daisy_valid(u32 pinmux)
+{
+	return FIELD_GET(IMX_PIN_DAISY_VALID, pinmux);
+}
+
+static inline u32 get_pin_daisy_val(u32 pinmux)
+{
+	return FIELD_GET(IMX_PIN_DAISY_VAL_MASK, pinmux);
+}
+
+static inline u32 get_pin_daisy_no(u32 pinmux)
+{
+	return FIELD_GET(IMX_PIN_DAISY_ID_MASK, pinmux);
+}
+
+static int pinctrl_scmi_imx_map_pinconf_type(enum pin_config_param param,
+					     u32 *mask, u32 *shift)
+{
+	u32 arg = param;
+
+	switch (arg) {
+	case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
+		*mask = BIT(12);
+		*shift = 12;
+		break;
+	case PIN_CONFIG_DRIVE_OPEN_DRAIN:
+		*mask = BIT(11);
+		*shift = 11;
+		break;
+	case PIN_CONFIG_BIAS_PULL_DOWN:
+		*mask = BIT(10);
+		*shift = 10;
+		break;
+	case PIN_CONFIG_BIAS_PULL_UP:
+		*mask = BIT(9);
+		*shift = 9;
+		break;
+	case PIN_CONFIG_SLEW_RATE:
+		*mask = GENMASK(8, 7);
+		*shift = 7;
+		break;
+	case PIN_CONFIG_DRIVE_STRENGTH:
+		*mask = GENMASK(6, 1);
+		*shift = 1;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int pinctrl_scmi_imx_dt_group_node_to_map(struct pinctrl_dev *pctldev,
+						 struct device_node *np,
+						 struct pinctrl_map **map,
+						 unsigned int *reserved_maps,
+						 unsigned int *num_maps,
+						 const char *func_name)
+{
+	struct device *dev = pctldev->dev;
+	unsigned long *cfgs = NULL;
+	unsigned int n_cfgs, reserve = 1;
+	int i, n_pins, ret;
+	u32 ncfg, val, mask, shift, pin_conf, pinmux_group;
+	unsigned long cfg[IMX_SCMI_NUM_CFG];
+	enum pin_config_param param;
+	struct property *prop;
+	const __be32 *p;
+
+	n_pins = of_property_count_u32_elems(np, "pinmux");
+	if (n_pins < 0) {
+		dev_warn(dev, "Can't find 'pinmux' property in node %pOFn\n", np);
+		return -EINVAL;
+	} else if (!n_pins) {
+		return -EINVAL;
+	}
+
+	ret = pinconf_generic_parse_dt_config(np, pctldev, &cfgs, &n_cfgs);
+	if (ret) {
+		dev_err(dev, "%pOF: could not parse node property\n", np);
+		return ret;
+	}
+
+	pin_conf = 0;
+	for (i = 0; i < n_cfgs; i++) {
+		param = pinconf_to_config_param(cfgs[i]);
+		ret = pinctrl_scmi_imx_map_pinconf_type(param, &mask, &shift);
+		if (ret) {
+			dev_err(dev, "Error map pinconf_type %d\n", ret);
+			goto free_cfgs;
+		}
+
+		val = pinconf_to_config_argument(cfgs[i]);
+
+		pin_conf |= (val << shift) & mask;
+
+	}
+
+	reserve = n_pins * (1 + n_cfgs);
+
+	ret = pinctrl_utils_reserve_map(pctldev, map, reserved_maps, num_maps,
+					reserve);
+	if (ret < 0)
+		goto free_cfgs;
+
+	of_property_for_each_u32(np, "pinmux", prop, p, pinmux_group) {
+		u32 pin_id, pin_func, daisy_id, daisy_val, daisy_valid;
+		const char *pin_name;
+
+		i = 0;
+		ncfg = IMX_SCMI_NUM_CFG;
+		pin_id = get_pin_no(pinmux_group);
+		pin_func = get_pin_func(pinmux_group);
+		daisy_id = get_pin_daisy_no(pinmux_group);
+		daisy_val = get_pin_daisy_val(pinmux_group);
+		cfg[i++] = pinconf_to_config_packed(IMX_SCMI_PIN_MUX, pin_func);
+		cfg[i++] = pinconf_to_config_packed(IMX_SCMI_PIN_CONFIG, pin_conf);
+
+		daisy_valid = get_pin_daisy_valid(pinmux_group);
+		if (daisy_valid) {
+			cfg[i++] = pinconf_to_config_packed(IMX_SCMI_PIN_DAISY_ID,
+							    daisy_id);
+			cfg[i++] = pinconf_to_config_packed(IMX_SCMI_PIN_DAISY_CFG,
+							    daisy_val);
+		} else {
+			ncfg -= 2;
+		}
+
+		pin_name = pin_get_name(pctldev, pin_id);
+
+		dev_dbg(dev, "pin: %s, pin_conf: 0x%x, daisy_id: %u, daisy_val: 0x%x\n",
+			pin_name, pin_conf, daisy_id, daisy_val);
+
+		ret = pinctrl_utils_add_map_configs(pctldev, map, reserved_maps,
+						    num_maps, pin_name,
+						    cfg, ncfg,
+						    PIN_MAP_TYPE_CONFIGS_PIN);
+		if (ret < 0)
+			goto free_cfgs;
+	};
+
+free_cfgs:
+	kfree(cfgs);
+	return ret;
+}
+
+static int pinctrl_scmi_imx_dt_node_to_map(struct pinctrl_dev *pctldev,
+					   struct device_node *np_config,
+					   struct pinctrl_map **map,
+					   unsigned int *num_maps)
+
+{
+	unsigned int reserved_maps;
+	int ret;
+
+	reserved_maps = 0;
+	*map = NULL;
+	*num_maps = 0;
+
+	for_each_available_child_of_node_scoped(np_config, np) {
+		ret = pinctrl_scmi_imx_dt_group_node_to_map(pctldev, np, map,
+							    &reserved_maps,
+							    num_maps,
+							    np_config->name);
+		if (ret < 0) {
+			pinctrl_utils_free_map(pctldev, *map, *num_maps);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static const struct pinctrl_ops pinctrl_scmi_imx_pinctrl_ops = {
+	.get_groups_count = pinctrl_generic_get_group_count,
+	.get_group_name = pinctrl_generic_get_group_name,
+	.get_group_pins = pinctrl_generic_get_group_pins,
+	.dt_node_to_map = pinctrl_scmi_imx_dt_node_to_map,
+	.dt_free_map = pinconf_generic_dt_free_map,
+};
+
+static int pinctrl_scmi_imx_func_set_mux(struct pinctrl_dev *pctldev,
+					 unsigned int selector, unsigned int group)
+{
+	/*
+	 * For i.MX SCMI PINCTRL , postpone the mux setting
+	 * until config is set as they can be set together
+	 * in one IPC call
+	 */
+	return 0;
+}
+
+static const struct pinmux_ops pinctrl_scmi_imx_pinmux_ops = {
+	.get_functions_count = pinmux_generic_get_function_count,
+	.get_function_name = pinmux_generic_get_function_name,
+	.get_function_groups = pinmux_generic_get_function_groups,
+	.set_mux = pinctrl_scmi_imx_func_set_mux,
+};
+
+static int pinctrl_scmi_imx_pinconf_get(struct pinctrl_dev *pctldev,
+					unsigned int pin, unsigned long *config)
+{
+	int ret;
+	struct scmi_pinctrl_imx *pmx = pinctrl_dev_get_drvdata(pctldev);
+	enum pin_config_param config_type;
+	u32 mask, val, shift;
+	u32 config_value;
+
+	if (!config)
+		return -EINVAL;
+
+	config_type = pinconf_to_config_param(*config);
+
+	ret = pinctrl_scmi_imx_map_pinconf_type(config_type, &mask, &shift);
+	if (ret)
+		return ret;
+
+	ret = pmx->ops->settings_get_one(pmx->ph, pin, PIN_TYPE,
+					 IMX_SCMI_PIN_CONFIG, &val);
+	/* Convert SCMI error code to PINCTRL expected error code */
+	if (ret == -EOPNOTSUPP)
+		return -ENOTSUPP;
+	if (ret)
+		return ret;
+
+	config_value = (val & mask) >> shift;
+	*config = pinconf_to_config_packed(config_type, config_value);
+
+	dev_dbg(pmx->dev, "pin:%s, conf:0x%x, type: %d, val: %u",
+		pin_get_name(pctldev, pin), val, config_type, config_value);
+
+	return 0;
+}
+
+static int pinctrl_scmi_imx_pinconf_set(struct pinctrl_dev *pctldev,
+					unsigned int pin,
+					unsigned long *configs,
+					unsigned int num_configs)
+{
+	struct scmi_pinctrl_imx *pmx = pinctrl_dev_get_drvdata(pctldev);
+	enum scmi_pinctrl_conf_type config_type[SCMI_NUM_CONFIGS];
+	u32 config_value[SCMI_NUM_CONFIGS];
+	enum scmi_pinctrl_conf_type *p_config_type = config_type;
+	u32 *p_config_value = config_value;
+	int ret;
+	int i;
+
+	if (!configs || !num_configs)
+		return -EINVAL;
+
+	if (num_configs > SCMI_NUM_CONFIGS) {
+		dev_err(pmx->dev, "num_configs(%d) too large\n", num_configs);
+		return -EINVAL;
+	}
+
+	for (i = 0; i < num_configs; i++) {
+		/* cast to avoid build warning */
+		p_config_type[i] =
+			(enum scmi_pinctrl_conf_type)pinconf_to_config_param(configs[i]);
+		p_config_value[i] = pinconf_to_config_argument(configs[i]);
+
+		dev_err(pmx->dev, "pin: %u, type: %u, val: 0x%x\n",
+			pin, p_config_type[i], p_config_value[i]);
+	}
+
+	ret = pmx->ops->settings_conf(pmx->ph, pin, PIN_TYPE, num_configs,
+				      p_config_type,  p_config_value);
+	if (ret)
+		dev_err(pmx->dev, "Error set config %d\n", ret);
+
+	return ret;
+}
+
+static const struct pinconf_ops pinctrl_scmi_imx_pinconf_ops = {
+	.is_generic = true,
+	.pin_config_get = pinctrl_scmi_imx_pinconf_get,
+	.pin_config_set = pinctrl_scmi_imx_pinconf_set,
+	.pin_config_config_dbg_show = pinconf_generic_dump_config,
+};
+
+static int scmi_pinctrl_imx_parse_groups(struct device_node *np,
+					 struct imx_pin_group *grp,
+					 struct scmi_pinctrl_imx *pmx)
+{
+	const __be32 *p;
+	struct device *dev;
+	struct property *prop;
+	unsigned int *pins;
+	int npins;
+	u32 i = 0, pinmux;
+
+	dev = pmx->dev;
+
+	dev_dbg(dev, "group: %pOFn\n", np);
+
+	/* Initialise group */
+	grp->data.name = np->name;
+
+	npins = of_property_count_elems_of_size(np, "pinmux", sizeof(u32));
+	if (npins < 0) {
+		dev_err(dev, "Failed to read 'pinmux' property in node %s.\n",
+			grp->data.name);
+		return npins;
+	}
+	if (!npins) {
+		dev_err(dev, "The group %s has no pins.\n", grp->data.name);
+		return -EINVAL;
+	}
+
+	grp->data.npins = npins;
+
+	pins = devm_kcalloc(pmx->dev, npins, sizeof(*pins), GFP_KERNEL);
+	if (!pins)
+		return -ENOMEM;
+
+	i = 0;
+	of_property_for_each_u32(np, "pinmux", prop, p, pinmux) {
+		pins[i] = get_pin_no(pinmux);
+		dev_dbg(pmx->dev, "pin reg: 0x%x", pins[i] * 4);
+		i++;
+	}
+
+	grp->data.pins = pins;
+
+	return 0;
+}
+
+static int scmi_pinctrl_imx_parse_functions(struct device_node *np,
+					    struct scmi_pinctrl_imx *pmx,
+					    u32 index)
+{
+	struct pinfunction *func;
+	struct imx_pin_group *grp;
+	const char **groups;
+	u32 i = 0;
+	int ret = 0;
+
+	dev_dbg(pmx->dev, "parse function(%u): %pOFn\n", index, np);
+
+	func = &pmx->functions[index];
+
+	/* Initialise function */
+	func->name = np->name;
+	func->ngroups = of_get_child_count(np);
+	if (func->ngroups == 0) {
+		dev_err(pmx->dev, "no groups defined in %pOF\n", np);
+		return -EINVAL;
+	}
+
+	groups = devm_kcalloc(pmx->dev, func->ngroups, sizeof(*func->groups),
+			      GFP_KERNEL);
+	if (!groups)
+		return -ENOMEM;
+
+	for_each_child_of_node_scoped(np, child) {
+		groups[i] = child->name;
+		grp = &pmx->groups[pmx->grp_index++];
+		ret = scmi_pinctrl_imx_parse_groups(child, grp, pmx);
+		if (ret)
+			return ret;
+		i++;
+	}
+
+	func->groups = groups;
+
+	return 0;
+}
+
+static int scmi_pinctrl_imx_probe_dt(struct scmi_device *sdev,
+				     struct scmi_pinctrl_imx *pmx)
+{
+	int i, ret, nfuncs;
+	struct device_node *np = sdev->dev.of_node;
+
+	pmx->dev = &sdev->dev;
+
+	nfuncs = of_get_child_count(np);
+	if (nfuncs <= 0) {
+		dev_err(&sdev->dev, "no functions defined\n");
+		return -EINVAL;
+	}
+
+	pmx->nfunctions = nfuncs;
+	pmx->functions = devm_kcalloc(&sdev->dev, nfuncs,
+				      sizeof(*pmx->functions), GFP_KERNEL);
+	if (!pmx->functions)
+		return -ENOMEM;
+
+	pmx->ngroups = 0;
+	for_each_child_of_node_scoped(np, child)
+		pmx->ngroups += of_get_child_count(child);
+
+	pmx->groups = devm_kcalloc(&sdev->dev, pmx->ngroups,
+				   sizeof(*pmx->groups), GFP_KERNEL);
+	if (!pmx->groups)
+		return -ENOMEM;
+
+	i = 0;
+	for_each_child_of_node_scoped(np, child) {
+		ret = scmi_pinctrl_imx_parse_functions(child, pmx, i++);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int
+scmi_pinctrl_imx_get_pins(struct scmi_pinctrl_imx *pmx, struct pinctrl_desc *desc)
+{
+	struct pinctrl_pin_desc *pins;
+	unsigned int npins;
+	int ret, i;
+
+	npins = pmx->ops->count_get(pmx->ph, PIN_TYPE);
+	pins = devm_kmalloc_array(pmx->dev, npins, sizeof(*pins), GFP_KERNEL);
+	if (!pins)
+		return -ENOMEM;
+
+	for (i = 0; i < npins; i++) {
+		pins[i].number = i;
+		/* no need free name, firmware driver handles it */
+		ret = pmx->ops->name_get(pmx->ph, i, PIN_TYPE, &pins[i].name);
+		if (ret)
+			return dev_err_probe(pmx->dev, ret,
+					     "Can't get name for pin %d", i);
+	}
+
+	desc->npins = npins;
+	desc->pins = pins;
+	dev_dbg(pmx->dev, "got pins %u", npins);
+
+	return 0;
+}
+
+static const struct of_device_id scmi_pinctrl_imx_allowlist[] = {
+	{ .compatible = "fsl,imx95", },
+	{ }
+};
+
+static int scmi_pinctrl_imx_probe(struct scmi_device *sdev)
+{
+	int ret;
+	struct device *dev = &sdev->dev;
+	struct scmi_pinctrl_imx *pmx;
+	const struct scmi_handle *handle;
+	struct scmi_protocol_handle *ph;
+	struct device_node *np __free(device_node) = of_find_node_by_path("/");
+	const struct scmi_pinctrl_proto_ops *pinctrl_ops;
+
+	if (!sdev->handle)
+		return -EINVAL;
+
+	if (!of_match_node(scmi_pinctrl_imx_allowlist, np))
+		return -ENODEV;
+
+	handle = sdev->handle;
+
+	pinctrl_ops = handle->devm_protocol_get(sdev, SCMI_PROTOCOL_PINCTRL, &ph);
+	if (IS_ERR(pinctrl_ops))
+		return PTR_ERR(pinctrl_ops);
+
+	pmx = devm_kzalloc(dev, sizeof(*pmx), GFP_KERNEL);
+	if (!pmx)
+		return -ENOMEM;
+
+	pmx->ph = ph;
+	pmx->ops = pinctrl_ops;
+
+	pmx->dev = dev;
+	pmx->pctl_desc.name = DRV_NAME;
+	pmx->pctl_desc.owner = THIS_MODULE;
+	pmx->pctl_desc.pctlops = &pinctrl_scmi_imx_pinctrl_ops;
+	pmx->pctl_desc.pmxops = &pinctrl_scmi_imx_pinmux_ops;
+	pmx->pctl_desc.confops = &pinctrl_scmi_imx_pinconf_ops;
+
+	ret = scmi_pinctrl_imx_get_pins(pmx, &pmx->pctl_desc);
+	if (ret)
+		return ret;
+
+	ret = scmi_pinctrl_imx_probe_dt(sdev, pmx);
+	if (ret)
+		return ret;
+
+	ret = devm_pinctrl_register_and_init(dev, &pmx->pctl_desc, pmx,
+					     &pmx->pctldev);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to register pinctrl\n");
+
+	return pinctrl_enable(pmx->pctldev);
+}
+
+static const struct scmi_device_id scmi_id_table[] = {
+	{ SCMI_PROTOCOL_PINCTRL, "pinctrl-imx" },
+	{ }
+};
+MODULE_DEVICE_TABLE(scmi, scmi_id_table);
+
+static struct scmi_driver scmi_pinctrl_imx_driver = {
+	.name = DRV_NAME,
+	.probe = scmi_pinctrl_imx_probe,
+	.id_table = scmi_id_table,
+};
+module_scmi_driver(scmi_pinctrl_imx_driver);
+
+MODULE_AUTHOR("Peng Fan <peng.fan@nxp.com>");
+MODULE_DESCRIPTION("i.MX SCMI pin controller driver");
+MODULE_LICENSE("GPL");

-- 
2.37.1


