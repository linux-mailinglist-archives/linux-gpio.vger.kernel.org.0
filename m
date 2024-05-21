Return-Path: <linux-gpio+bounces-6494-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5710B8CA7E9
	for <lists+linux-gpio@lfdr.de>; Tue, 21 May 2024 08:17:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C78BC1F21657
	for <lists+linux-gpio@lfdr.de>; Tue, 21 May 2024 06:17:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F9AE481CE;
	Tue, 21 May 2024 06:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Fm2o0gXy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2058.outbound.protection.outlook.com [40.107.22.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937974D5BD;
	Tue, 21 May 2024 06:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716272245; cv=fail; b=EwMVGiDxALyNhtqZpasQjT1hF13Y9wcPWsqx1sZhwkKSkQj3dwCe8gcKHMVY10/lvGi7nDvcrZcOZ937xY7A5X3jZsOBjQSBbHeJxltUYQF9bTiPS/ryLDjuE/pPaVj5+tek+qZqltSYXvJckVP0QLleAW55FSnqYlKru4huHsc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716272245; c=relaxed/simple;
	bh=E+f5BzOEob/3ydVV0uzsJAZ9sf/7UXgZ06CwIQ+z2B0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=A3NbJaGTY95JEt79zBFTkAQtFeA11QSHMBT0NvCEWtYa7oSI9A3zKV4nzjd2pgrl6/S6YyFcytVoVivELFok2L+eFaI7p+BuHIKdSZGVX4jON8L0RP5zK6D69FkXaCHSKlqzWLHATnhe72OG+fphhwoOxqKJs7HmxjjR2kzP8LI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Fm2o0gXy; arc=fail smtp.client-ip=40.107.22.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xh0ACmYRykvUPveYwIJy09P/UufZBl/o2wB8wOw8Oc0TdXhE+6BXMnVpLPLVojl3DUaR8pFcD/IrASLCosu2ur0p5J8axJSZTZQtykVXPoj0qybN99008yFk8lkquILs/ZRnFxGKNiKST3diegeC9n14Bu2YVe99972tIgGlcQdfkovRU2oCLw5XvUzFZ+qcUc9Cu2m9nA3OFqXJlPcUw5m+DfsHviuNBMqx+LhAxxCUqRnw/ey0jBdtetzZ4Tf2s9NYarA33WB8JptiXyFgZHvF50jcphjBwBKmpwj8H2hVKh9OL+loxw2RJCe6/6Mw9QmwTNCCLQgkKeYgRA/r9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KmD0YFXDYJh6S05DmzfZsFHpX49Q7e8f8bFQm4qkEvE=;
 b=BQ0gKMpmLEZcs1f2z87p3Xy1kHMdC4NRTmWvVCNgCwdWxX9UpK4Y6cwaEb8rAtx3Aqy6DY7QeJIYrX/23IGNmsgi/SpkVyGgkNr3Jmxkjp3XRXr5bH8b8ediB8ax98GCCqYA6VgM4hddpJYwnBCjXGRvwmqLUrsODix9XmKaQaJ7NaO7nn8W2MyhgiArJzNbWaXyYghtCVG+Sqo1U3yaiPoFPZvv5HahK+yfPFVlcjleODgUV8koT/8DmmgmxVZh8ERDxqa5guiuhoIIH3G8hhCNO73zjSnMv4g2N6PvxNUQSLhO3/rRf4U1HsUYpQksUSirFTevlaFKD19OxMlH0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KmD0YFXDYJh6S05DmzfZsFHpX49Q7e8f8bFQm4qkEvE=;
 b=Fm2o0gXyK3sf9VkLx4+deL8gdW8nGwMJlod5gHcNhVSMKVay/PNsKgdBG7TV0mtS83zroykf1y31YaPs1qg8eKHTcZkdYZnnlSkal5UkKkCF5sCLnZ1GMYNui81XnVA9r05qUmHqJvpkxh/PT+MOMb9o3ZFdo58bHzPWxH70M/g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by GVXPR04MB10705.eurprd04.prod.outlook.com (2603:10a6:150:223::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Tue, 21 May
 2024 06:17:20 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::557f:6fcf:a5a7:981c]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::557f:6fcf:a5a7:981c%6]) with mapi id 15.20.7587.035; Tue, 21 May 2024
 06:17:20 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 21 May 2024 14:25:59 +0800
Subject: [PATCH 3/3] pinctrl: imx: support SCMI pinctrl protocol for i.MX95
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240521-pinctrl-scmi-imx95-v1-3-9a1175d735fd@nxp.com>
References: <20240521-pinctrl-scmi-imx95-v1-0-9a1175d735fd@nxp.com>
In-Reply-To: <20240521-pinctrl-scmi-imx95-v1-0-9a1175d735fd@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716272771; l=12502;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=l+00njiRg3DuMhS2ZjmxnpkN5gbVjq8Dvu96gz/WGts=;
 b=FvJBdBNtn/WV7NZIirZThYu9UIkMTNlIsrNwYM2bYxhjMrVwFZnH/XzNySq0LzbiJfktl3AlD
 +PQL1Kv+WChDlWzZaym9ZDd0KD/KwAv2cMtMvW+iWQUDAeJrbdNHXho
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR01CA0157.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::13) To DU0PR04MB9417.eurprd04.prod.outlook.com
 (2603:10a6:10:358::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9417:EE_|GVXPR04MB10705:EE_
X-MS-Office365-Filtering-Correlation-Id: fd5ef55a-528c-4836-77f9-08dc795dabd3
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|366007|7416005|1800799015|52116005|376005|921011|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VU9wZGtKY1VqOGZCZTlnK3RJdWVzQzFQOTZiS1hMVUUyQjFRYmd0NWU0bnBl?=
 =?utf-8?B?cS9xenlveURYNmlFR3kzR3c0T0dKS05vY05BYjZWWHViMFlLeVd5M0JzUm1H?=
 =?utf-8?B?bGEybjlVMmlsMkNYTnlIYlgrVG42VWx6VFRuRG90Q1dCb25EblRQRWRjREVw?=
 =?utf-8?B?UWZsZEVTMFNXZ0xJYkJxVE5zT1RkWC9Mc3lwQUF4WlNrQThhRk5HanFLcytG?=
 =?utf-8?B?SGIrazBPbHA4dGVHRXlIVFpDQVZ4emZsZ1RobWdWcUlHaGUyOEw4OFYwbWt4?=
 =?utf-8?B?YVNUN01Eb05KTGViQS90aW00VXUweG51b0ZFanAvWWpmMUZ6UmVwMU04R0po?=
 =?utf-8?B?TEc1bkJIVkpWcUlJeWdmUkN3UkF6UmU0eCtGK3IwbklFL1o4UXBSd3FUWVk3?=
 =?utf-8?B?Zll2cjQyM3oraXdETUUyY3lCaUIrSG14aE80QUtWYnVpd3JtTGE0SythZlJ5?=
 =?utf-8?B?VzdBT3hFQm0wSXV1ZFVIUjFPbGI3ditnU29QRnhoSDlWN2l6Rk8zOTkwUnRk?=
 =?utf-8?B?R2t0NnJHNzNJaExYamhyaGN2WUZNSzJJclJueituMU5DUWc2dWg0STBUalBn?=
 =?utf-8?B?aHYzdS9ZQ3NpeGhpalhLRStjUHdRNTRlbllNVlR0UnlPNEhsVTFuSlFGZTJN?=
 =?utf-8?B?QnVoems5TENraG5xMCtMS2d3SzFZaDVydHY1SkRBWWNoTVNBNWdtTU10VFo5?=
 =?utf-8?B?ejFVVld1bDk2SHJDS3pGV251ajgzR0VveVh4ditib0sxeHBDKzYwendKZGxE?=
 =?utf-8?B?YStiQ095TWpHVk5lZDh2WVkwUUxBLzY0RzNIR01nVXVmRjhWUStLcFpwS0pD?=
 =?utf-8?B?NmJyaUtYeFhRVVBQV0JJOW1IRjFCcU9OOVVXZFk1WDAwVjVyOVV0dUlVOS9X?=
 =?utf-8?B?Z2UvUGN6QTBwNWxrTlRIeGRWZUV4S2hlTTE0RnMrYXlRejFIcmEvVXZPOC91?=
 =?utf-8?B?ZnlLWVBjZmtCTVNhc1B4TXEraDMrMHpCMURPNnpCQTk1Yldma0tuSmlIVjA5?=
 =?utf-8?B?WHB3MFFoSW5PNjRNMkUwV1FTT0R3SmV2bW9VOWcyRkljTGVML0M0ZkhSMEJ5?=
 =?utf-8?B?NHFnTkVhSHJBSTFZcFJ3aEozMzRxbGtMVGlnZXd4MXd2SDFwY2ljWG9lenla?=
 =?utf-8?B?T3V4NDk2QWlaRGlpdHlHZWU1V243UjczcEsxbG5iVVJxb0lWV25jQXRjeEov?=
 =?utf-8?B?bzFhWXpRZWFlSWVsQkhaZW51OVdSa3pkOXFFeXVJYzZGYTVTZjR0b2ZBSGxr?=
 =?utf-8?B?SXNtaXJLdG9Ea21LRVpGL0MxOEdEVGVKSzNGMXpXeURkNEdHSlZ0MU9ncnd6?=
 =?utf-8?B?T3B0S2ZjMmwvekpvZHE1YlZzSDhJNUs1ODBZNkE4QUk3U0hNMStwSjdweTFE?=
 =?utf-8?B?ZnZrZU51YlNCc3cxSXRTYkw0ZnoxZDZvZ2NVa1ZqcWREaXcyay9sY05CK1RE?=
 =?utf-8?B?OWN1ODQ3a3JZZ3FKUys2Z0ZIdGIrUDhaU0V5dDlFbmIrMksrNGpucUFZQVBC?=
 =?utf-8?B?UUlBZEN2aDBCTlMybVpzbzdOSFRFQzBYb3JYVmMrR3JLT3g4ZE5LMlk0d01O?=
 =?utf-8?B?SXRidDBHN0RuRXJPWWllKzkvSnRFb0drelFST0NLM3pXd1VDVEx2c0ZxVFVr?=
 =?utf-8?B?Ym51UVczVk9yQ1RZc0hQYkNLUUUvNnFmMkZxZmxwb3RmZlRERWhaRTI4Tm5r?=
 =?utf-8?B?WDFiajAxTkc1YW5Qa083blFtUW9za2d0MFdoT2hla2Fid0JCZjdlaUNIRWxz?=
 =?utf-8?B?ZXptTmQ3UTgySS9wRFJxWEtzL2lMQ1pCVUMyTk9CNkxsdjlyNWZZcUxOVlZK?=
 =?utf-8?Q?W2uyK/qJggUM23EPDYNQDRaydcxvPKnGJndxQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(7416005)(1800799015)(52116005)(376005)(921011)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RWUwM1RHTkhWSExha01IeUZJQXU2OFFKYTl6b3pGRmI4RXpQeWNIMVUzN1E4?=
 =?utf-8?B?ZHdDUmc1QnNpaXRpUVJ3QmVENzlRMWxMWGdDTnNncnVjOWVHSVZrNmdWNFJM?=
 =?utf-8?B?NmVPZ2IreTBkTno4amVoMnhTaHBBR2UvOGZoL1ZLSlJVUFBmQmV0NWhNc081?=
 =?utf-8?B?MUpFdHFka2dqa04yUVJuWkJFUmJkeUJaZFVQWklnOXVqQ2RZU0FkQ21GSFJl?=
 =?utf-8?B?VDk2dWZwQ3dDanNhQ2Q3WFY4R215TGkvZmZaVWc2RjJLSVJVcjNMWXF4V3lu?=
 =?utf-8?B?TEU2MWNDcmdRcG9WYnQzU2llcmErUW80UmIyMFh4Yk0rQ0IreWZ4dHIzZmJT?=
 =?utf-8?B?ZmhwYXlzNFRFdm9uMm54N2pucUFCNnRsUFNScG5DNWZQeGNWUEsyN3NXb1p6?=
 =?utf-8?B?aElabTZpeS9nRGJBQVQvRm1wRUVZTitraGFOeVlVKzRWMGZDUzdCTG93ajVV?=
 =?utf-8?B?M0ZyQ3dic0FxU1U1UzVEZE5GZWdMMy82c2tZOGg5RGdyVUNEVGNxUDRJNm1u?=
 =?utf-8?B?RUxYZWRML1ZOcEgza2kxdmtKWG5wblM1UWRBUjFKLzBhdHdoUFJqL3ZjdXJz?=
 =?utf-8?B?WHQ0NDgzNUFGUnZESXQ0S0hFbURSNGRKdEJpZ2h6bDNPWnBxbjdpM1ltOTA5?=
 =?utf-8?B?bmFEMEZyeDJ1OVpLazlhYlVYeXhIdUhSUmsxRVBXZjF4VThEN0wvRFh2WjBi?=
 =?utf-8?B?amNXaWFZMnlGZ2J5b1kzLzhBWVI5MWNyUHFiSGhia2h1ZnFVQUd4WFp5Q3hi?=
 =?utf-8?B?eTZ5Q0tPamtSbnhrZ3Zxd3NOT2NSMjc1Mm1HRDVodEt0dStvdzlaNldkMGVE?=
 =?utf-8?B?bm8vQnVvSENieFFZVDVsT3p1d1NrUm5NbmJ5bElTWWlIQWRXYyt2RUROSnND?=
 =?utf-8?B?QUpycjJEcm0wWDBJVC9LUXBkQkpCQTNFVWdzRWF4TjJpWXJzcjhsTHJMTFF6?=
 =?utf-8?B?bmlBelh0RGVyOHBvdDZWbGdPOHZ3dzFuUnlLNTRMMEVBbi9NbUFIMGpZcGFt?=
 =?utf-8?B?WnUvZmdtdlc2NTZHZkFwWjh0aGppNXpDbTVWYjZoaXhRWjc0cVllWVJRRnc5?=
 =?utf-8?B?Qzl5Y210L3BUQWNFb3NEdTk4UmZRSkZsUDM3Q1BtaVFVR0JFYzdwL09xY2dP?=
 =?utf-8?B?MTRrcTNYVzdBaFF1SzFVU0JVUGk3VFJrdnVmNktmQWFRd243TEp6eTBPcmhG?=
 =?utf-8?B?bWZwS2RBN25zM1NOWm1NN1RWT0t5MmtEWGY2VmJVRzh1Y0dONWhlWDNBMS9k?=
 =?utf-8?B?TlRwR21QTW1oQmlrejF0bWpuam9jenBXS3BmSUZFZHJ2cnJ1dTdZNEVaRlBp?=
 =?utf-8?B?U0dOVTRXMkdLblN6VWNyU21iTHFUTzRYKzRDRkc3S3AweWltRDNaWStTdEYz?=
 =?utf-8?B?RHJsOEZJYk81U3RoZldjMzVlL1RKSFNWS2p6QTcwVFpWTlFIZTI1NjBNRTJ6?=
 =?utf-8?B?MjR1SHRDZnBnZUw0dTZ4VzgrRVpuckx4QTBoNUJoeW5GcE02K3JXU3k2QklH?=
 =?utf-8?B?L005TGlxcGp0YkpBdS9JL3RKelA1ekNyQjAxRWU5M0Iyam9tdDZmeFRobVAx?=
 =?utf-8?B?WkIrWE1NWUIvL1J3dlpKSHVSV2dGbFRHTG1XdnJpcHFQZFh6bnNGd3VFYlR6?=
 =?utf-8?B?WXdNaGliRDJqdTM2VWFnaDFzSlBMdzlZcm9kOEpDUE5ValdFMldHRWFtdUF2?=
 =?utf-8?B?SFdsL2s5a1NtUy8wYTUwa1dEZUROc2Y0bnVWVUJyT0VrM3hBZ0hTVGFpRDRw?=
 =?utf-8?B?NXhMTTV4dzZKM1o0VmFoQXJvOWhEeXBkZlo5NUFwZmhraTRtUXhDQzNISjJB?=
 =?utf-8?B?MXQ5by9iUHRLNkN3MTJOU1dNaTNmL0YzZ1ZnbVNjZCthdzBnaysxbWdiZVRB?=
 =?utf-8?B?TjlWOFJNVlVnTzlJbG90K1ZKbVVuQWl1SUZBR003TzY3YkRHajEwd25HbG5C?=
 =?utf-8?B?QUJFWWZqRzZnTEZvdXE3dEpMQ1UyRGdnaUM3NjFBU0w3b2d6eFFqTHNxWUtP?=
 =?utf-8?B?RDlPbXhKRGd5bHdaeHM0QVdxLytmNXBEaXQrbzh2aS9ESENsRXhPem1ESWVw?=
 =?utf-8?B?Y1hNNkduenZJL29zdVdPaXBzYXM4VExZamg0NWlOaERhc0RNdWp1aSt4SmtQ?=
 =?utf-8?Q?s7RnvP0Gw46oyEcnw5RNUm0gj?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd5ef55a-528c-4836-77f9-08dc795dabd3
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 06:17:20.2536
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5GlEU/kGWQ8dw1KB/DjBmBphhB/4YcIquLe4d4nOmFNqDk8qP9eO5xcdmHNWTOLcSol383BxaMNm1V1Muusbjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10705

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

To Support fsl,pins property together with SCMI OEM protocol, add this
driver.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/pinctrl/freescale/Kconfig            |   9 +
 drivers/pinctrl/freescale/Makefile           |   1 +
 drivers/pinctrl/freescale/pinctrl-imx-scmi.c | 357 +++++++++++++++++++++++++++
 3 files changed, 367 insertions(+)

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
index 000000000000..2991047535bc
--- /dev/null
+++ b/drivers/pinctrl/freescale/pinctrl-imx-scmi.c
@@ -0,0 +1,357 @@
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
+#include <linux/seq_file.h>
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
+struct scmi_pinctrl_imx {
+	struct device *dev;
+	struct scmi_protocol_handle *ph;
+	struct pinctrl_dev *pctldev;
+	struct pinctrl_desc pctl_desc;
+	const struct scmi_pinctrl_proto_ops *ops;
+};
+
+/* SCMI pin control types, aligned with SCMI firmware */
+#define IMX_SCMI_NUM_CFG	4
+#define IMX_SCMI_PIN_MUX	192
+#define IMX_SCMI_PIN_CONFIG	193
+#define IMX_SCMI_PIN_DAISY_ID	194
+#define IMX_SCMI_PIN_DAISY_CFG	195
+
+#define IMX_SCMI_NO_PAD_CTL		BIT(31)
+#define IMX_SCMI_PAD_SION		BIT(30)
+#define IMX_SCMI_IOMUXC_CONFIG_SION	BIT(4)
+
+#define IMX_SCMI_PIN_SIZE	24
+
+#define IMX95_DAISY_OFF		0x408
+
+static int pinctrl_scmi_imx_dt_node_to_map(struct pinctrl_dev *pctldev,
+					   struct device_node *np,
+					   struct pinctrl_map **map,
+					   unsigned int *num_maps)
+{
+	struct pinctrl_map *new_map;
+	const __be32 *list;
+	unsigned long *configs = NULL;
+	unsigned long cfg[IMX_SCMI_NUM_CFG];
+	int map_num, size, pin_size, pin_id, num_pins;
+	int mux_reg, conf_reg, input_reg, mux_val, conf_val, input_val;
+	int i, j;
+	uint32_t ncfg;
+	static uint32_t daisy_off;
+
+	if (!daisy_off) {
+		if (of_machine_is_compatible("fsl,imx95")) {
+			daisy_off = IMX95_DAISY_OFF;
+		} else {
+			dev_err(pctldev->dev, "platform not support scmi pinctrl\n");
+			return -EINVAL;
+		}
+	}
+
+	list = of_get_property(np, "fsl,pins", &size);
+	if (!list) {
+		dev_err(pctldev->dev, "no fsl,pins property in node %pOF\n", np);
+		return -EINVAL;
+	}
+
+	pin_size = IMX_SCMI_PIN_SIZE;
+
+	if (!size || size % pin_size) {
+		dev_err(pctldev->dev, "Invalid fsl,pins or pins property in node %pOF\n", np);
+		return -EINVAL;
+	}
+
+	num_pins = size / pin_size;
+	map_num = num_pins;
+
+	new_map = kmalloc_array(map_num, sizeof(struct pinctrl_map),
+				GFP_KERNEL);
+	if (!new_map)
+		return -ENOMEM;
+
+	*map = new_map;
+	*num_maps = map_num;
+
+	/* create config map */
+	for (i = 0; i < num_pins; i++) {
+		j = 0;
+		ncfg = IMX_SCMI_NUM_CFG;
+		mux_reg = be32_to_cpu(*list++);
+		conf_reg = be32_to_cpu(*list++);
+		input_reg = be32_to_cpu(*list++);
+		mux_val = be32_to_cpu(*list++);
+		input_val = be32_to_cpu(*list++);
+		conf_val = be32_to_cpu(*list++);
+		if (conf_val & IMX_SCMI_PAD_SION)
+			mux_val |= IMX_SCMI_IOMUXC_CONFIG_SION;
+
+		pin_id = mux_reg / 4;
+
+		cfg[j++] = pinconf_to_config_packed(IMX_SCMI_PIN_MUX, mux_val);
+
+		if (!conf_reg || (conf_val & IMX_SCMI_NO_PAD_CTL))
+			ncfg--;
+		else
+			cfg[j++] = pinconf_to_config_packed(IMX_SCMI_PIN_CONFIG, conf_val);
+
+		if (!input_reg) {
+			ncfg -= 2;
+		} else {
+			cfg[j++] = pinconf_to_config_packed(IMX_SCMI_PIN_DAISY_ID,
+							    (input_reg - daisy_off) / 4);
+			cfg[j++] = pinconf_to_config_packed(IMX_SCMI_PIN_DAISY_CFG, input_val);
+		}
+
+		configs = kmemdup(cfg, ncfg * sizeof(unsigned long), GFP_KERNEL);
+
+		new_map[i].type = PIN_MAP_TYPE_CONFIGS_PIN;
+		new_map[i].data.configs.group_or_pin = pin_get_name(pctldev, pin_id);
+		new_map[i].data.configs.configs = configs;
+		new_map[i].data.configs.num_configs = ncfg;
+	}
+
+	return 0;
+}
+
+static void pinctrl_scmi_imx_dt_free_map(struct pinctrl_dev *pctldev,
+					 struct pinctrl_map *map, unsigned int num_maps)
+{
+	kfree(map);
+}
+
+static const struct pinctrl_ops pinctrl_scmi_imx_pinctrl_ops = {
+	.get_groups_count = pinctrl_generic_get_group_count,
+	.get_group_name = pinctrl_generic_get_group_name,
+	.get_group_pins = pinctrl_generic_get_group_pins,
+	.dt_node_to_map = pinctrl_scmi_imx_dt_node_to_map,
+	.dt_free_map = pinctrl_scmi_imx_dt_free_map,
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
+	u32 config_type, val;
+
+	if (!config)
+		return -EINVAL;
+
+	config_type = pinconf_to_config_param(*config);
+
+	ret = pmx->ops->settings_get_one(pmx->ph, pin, PIN_TYPE, config_type, &val);
+	/* Convert SCMI error code to PINCTRL expected error code */
+	if (ret == -EOPNOTSUPP)
+		return -ENOTSUPP;
+	if (ret)
+		return ret;
+
+	*config = pinconf_to_config_packed(config_type, val);
+
+	dev_dbg(pmx->dev, "pin:%s, conf:0x%x", pin_get_name(pctldev, pin), val);
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
+	enum scmi_pinctrl_conf_type config_type[IMX_SCMI_NUM_CFG];
+	u32 config_value[IMX_SCMI_NUM_CFG];
+	enum scmi_pinctrl_conf_type *p_config_type = config_type;
+	u32 *p_config_value = config_value;
+	int ret;
+	int i;
+
+	if (!configs || !num_configs)
+		return -EINVAL;
+
+	if (num_configs > IMX_SCMI_NUM_CFG) {
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
+		dev_dbg(pmx->dev, "pin: %u, type: %u, val: 0x%x\n",
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
+static void pinctrl_scmi_imx_pinconf_dbg_show(struct pinctrl_dev *pctldev,
+					      struct seq_file *s, unsigned int pin_id)
+{
+	unsigned long config = pinconf_to_config_packed(IMX_SCMI_PIN_CONFIG, 0);
+	int ret;
+
+	ret = pinctrl_scmi_imx_pinconf_get(pctldev, pin_id, &config);
+	if (ret)
+		config = 0;
+	else
+		config = pinconf_to_config_argument(config);
+
+	seq_printf(s, "0x%lx", config);
+}
+
+static const struct pinconf_ops pinctrl_scmi_imx_pinconf_ops = {
+	.pin_config_get = pinctrl_scmi_imx_pinconf_get,
+	.pin_config_set = pinctrl_scmi_imx_pinconf_set,
+	.pin_config_dbg_show = pinctrl_scmi_imx_pinconf_dbg_show,
+};
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
+	pmx->dev = &sdev->dev;
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


