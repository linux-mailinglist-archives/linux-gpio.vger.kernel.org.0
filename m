Return-Path: <linux-gpio+bounces-6334-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9418C3FF3
	for <lists+linux-gpio@lfdr.de>; Mon, 13 May 2024 13:38:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A5CA2283FCC
	for <lists+linux-gpio@lfdr.de>; Mon, 13 May 2024 11:38:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38EAE14F9E0;
	Mon, 13 May 2024 11:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="VbyKQcMd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2048.outbound.protection.outlook.com [40.107.21.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A01914F106;
	Mon, 13 May 2024 11:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715600274; cv=fail; b=h+a9kDuFiiXdXyBuMj9uy4u4xjGvgoZaGgC3s6Tv3LiS9A5MprmkrnKujagUpkS5DpcJ7oVICSj8dYOT7XptGERn2xLfzp57wPne+VT0vyTZZF6O9rPur9NQSdBCnGlRm1QNPSQeIiwkovT9g9Z716O59nPvqnlp6Vw2PxJXFIY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715600274; c=relaxed/simple;
	bh=9ba0X9eIoyuBobLN2QGm99jM8aUhb+2BISPxyzMa+pA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=k2U0wljkJ1M8gCCSLlA5+eMPjzZ5hK4o2sNJqwMQjgxCRryb4sx8U1l+eURQ/Ms763yPaRmyFv8CDTwr/N2YUDwQZIvruh94RpQGwF/gSBAUSQj2MhlQE67XbdL7OKzIiJQoSeNtKCS5BGAAI2fJphxCaa1PFlgqHU2Z/2RVPDs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=VbyKQcMd; arc=fail smtp.client-ip=40.107.21.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RZAVS03RSoDaRlUDzCqnEn4oRHIvELK6c66SQ/iW5TqOpESAFZldHc8Pjin/MKgq0/Xcluq+QXCRCw2VXxjsL8d1JxoLc1Rbr59+8/evlNR3ypXQ51n0eRQfXFPJHAkQ2ftxlW4+OPZGkk2Lq7c8IbSnnIx/g6rjssbv82vfXNkezcNq0I0rk7+WHqmz9ZIUsV3zzcmQ+iH6p61HSVN80oBDfYV+NNYLF0tcw6VJ3m1PbSiS09LZffCJ/iLM/U7xnJag4CrjuFHdLccZ0T3606RnFDYZIUj/YFoYlLjNWJyvxupaPN/unwUHx753HbuMtORzqiUSw7uJSrPI57IiRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IVYfNd5FwnQoA7ycSfQ21AyxVF497ss2I9vmjLhgxrA=;
 b=IXtBUC9N/RozdOnP1mQmtyfu4Y1dfoTMv1gFxtbCnRDia4zxfA+bmImKTpgCwJRinAlSBwBY+9bQD0Ih/+I+Xe8X4CH4qpMCMn+Ckl7Q2fWucbt034DQHU8F+JpJVzrxKVid/ngp5n92QwGTQ1w9Bak9SgoQL8+0g/wDUtoD00cmNwrJuObnzvMYVe3gT9V2hWlHqe9jTKumn+aDVdGmwNF+rRDDaqAZ1tPyq6MCC0/vFNNeNtnR0+8Vljof2o+6iNK8gcvBIFpKe7JmGifadEnXs8urvuRywrjtQBVcsVS1rXVzRHQGdQ5af8iFh+RMIl1cPKB0O5ccaNVuzb/dJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IVYfNd5FwnQoA7ycSfQ21AyxVF497ss2I9vmjLhgxrA=;
 b=VbyKQcMdfAgPIc57v7jBT1Ot5oCPYNDMW8T0sbZlCWmPpvAOJmj2mkhovFYCI0xTfJ/F310DjH3vVHYARYEq3HdxOdEsHnXmtWuqK0YKIon9qX8kzh9JD7dr3uBvNhuv9D2HZzpFwUKgDF5G4bIVNfVXy3IclfTedVNxDROOmhw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DU2PR04MB9116.eurprd04.prod.outlook.com (2603:10a6:10:2f7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Mon, 13 May
 2024 11:37:47 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d%4]) with mapi id 15.20.7544.052; Mon, 13 May 2024
 11:37:47 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 13 May 2024 19:45:26 +0800
Subject: [PATCH v6 3/3] pinctrl: imx: support SCMI pinctrl protocol for
 i.MX95
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240513-pinctrl-scmi-oem-v3-v6-3-904975c99cc4@nxp.com>
References: <20240513-pinctrl-scmi-oem-v3-v6-0-904975c99cc4@nxp.com>
In-Reply-To: <20240513-pinctrl-scmi-oem-v3-v6-0-904975c99cc4@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1715600734; l=17862;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=bUQerR9OSusu69bAUDnPuLZQLR6f6dhZGyyGnUKiybY=;
 b=5FbNxTYd/fXr7rcIoB1Yn5nE38lR+SSdw/J7JJB/I66krOXWMu4VqkHfukc/M2G++9+WoSvcy
 PThbhJ8JOJRBPVa0VuJCLmXIug+IJSdmpXvfx/zwevylhbSWK11nCV+
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR03CA0089.apcprd03.prod.outlook.com
 (2603:1096:4:7c::17) To DU0PR04MB9417.eurprd04.prod.outlook.com
 (2603:10a6:10:358::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9417:EE_|DU2PR04MB9116:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a28a945-5934-461b-8cd0-08dc73411ca2
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|7416005|366007|52116005|1800799015|376005|921011|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TXJEZ0tsNWhnVDhGOXduaEdaeWo1RW9CVUNCQm5BUk1LNDhYbXRaZmZ1Y2x0?=
 =?utf-8?B?S3BVMWtHUUNRMkdiZW4zdzUyM2o0YUdGQWhvV3Z5U2RlQnJWYnN1UW9PSFJn?=
 =?utf-8?B?L3ZaaVlTTkRsK2VvRzJDd0hBK0EzRjhUb1BZWG0xM2gvQm42Z29sZkY1RUlV?=
 =?utf-8?B?S1ZwMkhUYVNrMzV3T2hVM1VPa1hiREcxVEdlM3dHY0djWnR4Qkt2L1hZYW1p?=
 =?utf-8?B?U3FleWVxQnpySnBnNHcxZXF1b0lNT09wZVltYngzbU5QYkljWU43NWRDYVEz?=
 =?utf-8?B?VVQvelVNdHlYUmxPY0d6dmhVRU80Vmh0bzhIYnlHZms1U2hsYnVhcWdHZ3Vm?=
 =?utf-8?B?cGprRzkxNDNKdjYxREhyUFA5TFZ2T01WSkFPZm1CQjk3dnVjc2FoWi9OREtv?=
 =?utf-8?B?d1QwOFg0eG00bTJKWEg5eTBMTWZXazhKQ1ZINnNjZ20wUDF1OGNNZlR0SCt4?=
 =?utf-8?B?cE9EMWI5Wlk3Tmw4RlhlZkRzS1l3Y3k4SkdDS2ljTFc0UThXdVIvUEsyRlBJ?=
 =?utf-8?B?TnhleHdsUlNwUDRHTkU0SnM0a3ZrenVRRU45cVpsT1A5blZWNFI2WVl0NnI4?=
 =?utf-8?B?TU1UbjFINXpOMERWZ3FKR2xWemVXK203TEhseEZLam9kQmU4aVZ5ZTdTM0hl?=
 =?utf-8?B?SUNXUkplUVNrVlFRRU1oK240RzNLLy90RWI4cHE4UnZjbDMzUC9rTllUaElk?=
 =?utf-8?B?STdPb01RbHhCMi82WFpubkwvN0RPM0dNaHVyUSs0UUkvNmh0RVNmcFpjcVlk?=
 =?utf-8?B?NjhBSGg2akVIaHNvRXNLa2JSN25KYTBxOGNOZXJlZDlkcHJTTjdnYXpkbGd1?=
 =?utf-8?B?VlpMWjB6Ni95RXp5cEhuUmdIdUY1a2ptcjIwN0xrUWp0eDljTFhZN3BKYktT?=
 =?utf-8?B?WUhXS3YrZlE1ZVIrNmt4UDFWbDl1UVQ1L05LZGd5R25HdFZEMGcyQlhid1lX?=
 =?utf-8?B?ODY4NVhnNmQ2Q21jYXdvR2MzUUpnVTdNc2dCTEJ4Zm9FcG12Ymdyd0lLZXRh?=
 =?utf-8?B?NWdnbUFHNXRUMUNVS0VYd2VPTFUrSzZsRzdGNmltNlN3dks1ejU2VTNWcksr?=
 =?utf-8?B?d1NJRE5ncVljK2VhRmVmZ0pGaWF2bGMxOVhWVW5hZ0N5UEorYWlsSExCVTUy?=
 =?utf-8?B?bUQ0aDk1bzJrdVpPelZZcGsxMnBybW1Rd1lzZFZPWmMzVDluMHdFWm9YNlN4?=
 =?utf-8?B?SHVWMGwxZStDci9VMEVVeEM4WTZPSEo0ZTVOTWhiR2kydGJtUmVYYzJSWmhZ?=
 =?utf-8?B?MGdacHFSOGZFeTY5QU1XZUNtSVN3K3JxQXZYYi9OeXgyQlljVjhzME5EeGxW?=
 =?utf-8?B?OWY0KzNWLzZlTjZjaDI2UC85aHdtWVZ0YytyTW1tQWdIYkwxdUVaN2Z6di85?=
 =?utf-8?B?YlpxTGhNZjd1WTJSWXBVRTF4TkhQNnVDVnVuT25zSkMvTU02OGpKZjdlY0RV?=
 =?utf-8?B?TEJTWUY0UUxDTGVjUGRvWTM4eHdDTHNPQ0xMeXBMM0JaVmFjaHMvY1J1MlQ4?=
 =?utf-8?B?ajFiWWp5ZXA5V1RDVkxqUGtvUEFlTUk0TFhQbXdSMXlWeVZ2UU9ZS2FOSlBW?=
 =?utf-8?B?bW0rcHdtbnVmalliSjkxWEJNc3ZUM1paa0FuNVVvek9qN3pHYWxwWi9ieURw?=
 =?utf-8?B?bjZCdlNwQ2REd01nVk14M2JsL3g2cmdGZ1BEc0VudVllQTZIZDBwNnhKclNw?=
 =?utf-8?B?OGNkcGJFekZJNHBSVlpZUS9yV1Blb1dkM1BpdzROOUNaZFhrbDVubUlOeXlT?=
 =?utf-8?B?Z1Y2MVZMdDM5elpSNk5jT0c4bFhFTDAvbFB1bm9NdzkyaVpPYXJLUFdITExQ?=
 =?utf-8?Q?8YXUssibya7rZOHjN8UWx50JAj6G4biSzhrLE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7416005)(366007)(52116005)(1800799015)(376005)(921011)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QkNYNVNyNXdReENLTnZudFUyc294VElNRExKdGdoTEM2WGxSMFRzOWpjRHh2?=
 =?utf-8?B?NkR5VEZZam5hZXJxN1pMSVNaYnBZVGR2Y05kOHZoZEZIYzRKOGlpWm91SXN6?=
 =?utf-8?B?dVJDYk9EZVhGUkdCWVIyMFpyRzdVYnNtTmdKbUlVNDFwOVRmbnlOVjdCVER6?=
 =?utf-8?B?ZGNjL0dJTVQyZFhxZjFzLy9xNkhMRWc0MTlKOVE1VUJYektvU2NLWjZLcUJN?=
 =?utf-8?B?TUcwaEY3QTRETXNBeHRVM0F6ZEVmQWRXaFlIWlcweVlScmkwUzlmQzNTSmkx?=
 =?utf-8?B?VVJDb0pFbWMrcHc5VzNyNlQzOS9EcDFFSUp5ODdSdlZPai8wR3pMZnpiWGZL?=
 =?utf-8?B?a29rQWkxdVJ4YTZ0bGIva0dpV0Iyd0p4M0FxMlJFQUo2Tnd6TmNjU01PVzdC?=
 =?utf-8?B?R2JERlBIbFVJSkN2QnBCb3A0Uk5DZUM4Mkw2VUU1UklPSCt4TmVWa29Id1Yv?=
 =?utf-8?B?d0lPNHU3YnpLeVJrSVk5NVFrYkR2QUVuT0FWRUZNTGgzMktwMVhnOWxhcXlO?=
 =?utf-8?B?M3IxR3pCcjRKWktQWUdzZFFBSGJINU9ydHZvenBzdDRhVEVoM3Z4QnM3TktG?=
 =?utf-8?B?YjRuYktqT0N6a2hJbWFWVkc1QUtieHVBeVpQZy9UQ290ZUsvNmVZU2dGVEsx?=
 =?utf-8?B?SFZRZlhJZ1RWaTh1UkpCWFQzNGt5QzFYNjhnMUh1ajlVTWp5aHo1T2hWYWV4?=
 =?utf-8?B?NVJsT2JDK3JyOFc0MjFkMjFIZ0dUeWpaU3JqU0VCeW4wV3Z0eGNEdytNR3ZI?=
 =?utf-8?B?YVdNbG1OZkp4aXZ2bnBPZG5IaWN3VmlhVDJ5alFwTDBzZjFFb2ZzYWFZV1Nx?=
 =?utf-8?B?SHJSUkhMQmQ1MHBHd0laYjVNbmg5VzQ3OTdsZm93MktVSTdyRFlmMG4rL0xL?=
 =?utf-8?B?L3krc28wWS9FN3g5OTBVVy9GSi9HR1pNdEJKR00wSDZTNlh4eU9hRStsbmIy?=
 =?utf-8?B?ZkxyTUhIYWdlVkJHajNqUjluSzRXOGJIeStsbkRhMjRyUEgyTGZXUk12OFZt?=
 =?utf-8?B?QkI5ZEJsRlJqenRpUmFyTG42MUxnU1c4ZS9EMTNreE5oRDVIb01NS01tRHF2?=
 =?utf-8?B?Tk4xOTRHR2VMRDdVdmVYMEViWVdvTDNUNTFZU0h5L3d1TEdVdTRBYkxrdC9T?=
 =?utf-8?B?V3NUOFozSWlQcHhFZEFBemFLYm5OdDFMSFJ3T2J2UytiYXNTNlprYzZYYUxm?=
 =?utf-8?B?SE9JUjMrc25URmVobklSaFhuV25mZGFHY0VWdnJWbTRha0pCNGlZNTRwZE1E?=
 =?utf-8?B?TEErQ3YxdUE3MHBTOWxKOHNYS3Exb3lRTGd5RHVHdldnU2k3azdEODExb1A0?=
 =?utf-8?B?bUdTSkJqTUtGTzh5RXVsc0xOU3MzbWFqcDExNWNPY01PZHRpTVRnNXZYZEVS?=
 =?utf-8?B?eGtiV0pYa0dHUWJCT04xTUVmSTJ3NDZtVXRUaDI5ZCtwNjhJYjYrMUJ6V2J1?=
 =?utf-8?B?K2d4S1NXR3E4YXlGSFFPaklQNTFmc3d6SU11ZG9NMDgrNnBJaURJZ3NRRjVF?=
 =?utf-8?B?blQ5YW80bm9hK1ZqWVorQlhtUEZpaXI4OVlxQ1R5S3QvT0p3VVBlb1dqWEsx?=
 =?utf-8?B?aHdTaUlkL29oblNXN1QvQnRnVkZTSWZDd05Wbjl6VUhmdHJpdmZLQUZiUngw?=
 =?utf-8?B?QXlZajJwWEFCNXdIR0dGdkhxa3NhcWpHNCtGaHBCUm5DMk9BWTlLU0U4RFlq?=
 =?utf-8?B?bmpOVG9rR1VhTStvKzVVT2FEK1BVV0pLbFFGTVlKNlU4Y2x3eUJOOFM1VnZI?=
 =?utf-8?B?a2Q5U1J4bURNcncwNWsyNEUzOWZUbVJPbmlIYUxhcDNiQ2JKU1E5ZEVMNGhH?=
 =?utf-8?B?Y2FMWmsyNUdaOWhvVXFPK3l3Qzg1b3h4ZW53QUd5cjZXdWdKQW9UaWF3dVlU?=
 =?utf-8?B?ZVZMT2hHZWc2Mnl6NCtLTXM0K1l3VUxNbEpCeEs5ay9uUkVvUnBHWXZZQVRO?=
 =?utf-8?B?M3JmdW1Mb0hvUVRIR0Y1a2NNbU5UL3c4eVAvQTN3emhCUGIxcFp1c0NjMEVZ?=
 =?utf-8?B?RGlKZW5kbytyZUo5cEhQakFqMzFsZGdwNTZNTStCSEFXakE4ZWxHeTRUSnlu?=
 =?utf-8?B?R2FaWGkvc3I1YXhtVUVRenpRaURKemhtMXNEeXBzK1N5dXVJa2J1Q2J6elEz?=
 =?utf-8?Q?JlHxaO/ItSCobGvko1vF5JEwF?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a28a945-5934-461b-8cd0-08dc73411ca2
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2024 11:37:47.1338
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DIWhJZmA2EjrsND/F8xitKeenJtvWrrVmS7tudxkkmZaAFOnn58hnAd0rw3GjSQjYOgwrHp5w21P+VEjWGqwbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9116

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
 drivers/pinctrl/freescale/pinctrl-imx-scmi.c | 579 +++++++++++++++++++++++++++
 3 files changed, 589 insertions(+)

diff --git a/drivers/pinctrl/freescale/Kconfig b/drivers/pinctrl/freescale/Kconfig
index 27bdc548f3a7..711a5ab3ceb1 100644
--- a/drivers/pinctrl/freescale/Kconfig
+++ b/drivers/pinctrl/freescale/Kconfig
@@ -7,6 +7,15 @@ config PINCTRL_IMX
 	select PINCONF
 	select REGMAP
 
+config PINCTRL_IMX_SCMI
+	tristate "i.MX95 pinctrl driver using SCMI protocol interface"
+	depends on ARM_SCMI_PROTOCOL && OF || COMPILE_TEST
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
index 000000000000..e5ecde1ed4e9
--- /dev/null
+++ b/drivers/pinctrl/freescale/pinctrl-imx-scmi.c
@@ -0,0 +1,579 @@
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
+	struct pingroup *groups;
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
+					 struct pingroup *grp,
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
+	grp->name = np->name;
+
+	npins = of_property_count_elems_of_size(np, "pinmux", sizeof(u32));
+	if (npins < 0) {
+		dev_err(dev, "Failed to read 'pinmux' property in node %s.\n",
+			grp->name);
+		return npins;
+	}
+	if (!npins) {
+		dev_err(dev, "The group %s has no pins.\n", grp->name);
+		return -EINVAL;
+	}
+
+	grp->npins = npins;
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
+	grp->pins = pins;
+
+	return 0;
+}
+
+static int scmi_pinctrl_imx_parse_functions(struct device_node *np,
+					    struct scmi_pinctrl_imx *pmx,
+					    u32 index)
+{
+	struct pinfunction *func;
+	struct pingroup *grp;
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
+static const char * const scmi_pinctrl_imx_allowlist[] = {
+	"fsl,imx95",
+	NULL
+};
+
+static int scmi_pinctrl_imx_probe(struct scmi_device *sdev)
+{
+	struct device *dev = &sdev->dev;
+	const struct scmi_handle *handle = sdev->handle;
+	struct scmi_pinctrl_imx *pmx;
+	struct scmi_protocol_handle *ph;
+	const struct scmi_pinctrl_proto_ops *pinctrl_ops;
+	int ret;
+
+	if (!handle)
+		return -EINVAL;
+
+	if (!of_machine_compatible_match(scmi_pinctrl_imx_allowlist))
+		return -ENODEV;
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


