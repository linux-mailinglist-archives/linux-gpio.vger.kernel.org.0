Return-Path: <linux-gpio+bounces-18403-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 474BAA7F25D
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 03:42:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2D07B17A187
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 01:42:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E79725EFAA;
	Tue,  8 Apr 2025 01:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="sihSI/9M"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2065.outbound.protection.outlook.com [40.107.20.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD8824EAA6;
	Tue,  8 Apr 2025 01:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744076510; cv=fail; b=QTjWG9nGnQOwiCv+YrryUwtITFH8jIuCIUWaQAHY0yYPjhWYACZP/6ybv5QoaGbMjxXkreWiBmE7Au0aMojsfIs33YRuGPfusYL9Hx5YVE0B3kZp8gD00iV1xIIMmdclznDn2Yk3DuTEzH2eijJsfFAbpAhMPvM34YXXa00PgJo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744076510; c=relaxed/simple;
	bh=BUxNiApnvye5alDCdMNEPtePh9oueSRE/yqX/sIB8/g=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=DATILpNfNIb9ILVf+GDd21D3fQ7gb93yRbztWEdS00Kfpb9zC0jE8dvQtqgxwCPhLRux9aovl0A4jj2rMIShAAP/4BpHjzzhgR6pmIEOaDse3jxOVjX33RtXmfhd3+j2wb1SYZMM/jEF56ID16pW26vHxGuSTQX2zE/IwrjsY8I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=sihSI/9M; arc=fail smtp.client-ip=40.107.20.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kGF8lR7DihfzALewom/ZOrrd4MrEHGvTsJicEFWAuVrcIZFgDfuR9PY2mjKxj2gaksm97gUjQgGxFrg32emFDCwyMNeK7tR+rOnXX358xTqN+KHyyNMoDyjyvAfADtmb/TKNhtW62tJkt7d3ts7HudReJGjqGY7Gqzs/7fmGQDNmbKoB76sAh/+ueSy4D/k2F1hZfjaFtG5seWs2X6pFvQhF/pXejBxAeN6D1LtedKsue33GoingB2EEGFRup3ocCxGSgPEzKZ2BSsiDTOIuRo7xnvz6by21SsJQOZ8+ck2l1XeajiRSCh2o1eV5nI7/IPbhZ+Nh3sunbF0nGpz7oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y1BnHj4K/3SKx3qA5nTe/mWmQwkqm6kOAuFVPjzkVQQ=;
 b=FbyyKqNy/jsj2HslNSmukfhEE8rZ71rSFOJgJGKWIeB84dJjLolY+oDujeyXUQDE2JbQhhf6TmRlu7+LdzX+5K+E+bTuukcghv6/TfIzR3dbTpwNe8rTDGF0+x+wHNg4Md7rfZYzj+naYK8gWYYe7VRW8YaKpKTjeLpcucEWLt1BBGj81AuP4wI7Vc2Iz6oE/Z2FwPeA7TjlXFG1zmOJZkv7rwVF71LokJg8AQFzfkKo7+W4X/MREerzXCdLBWeKx72N3Ng5CE01DzanJmUxJ2sVMyOhVVpb3aJrlhmO1/3th2/9IKriA7eaTHNJyLlNIm+f3c4+TEeckz+5YOadNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y1BnHj4K/3SKx3qA5nTe/mWmQwkqm6kOAuFVPjzkVQQ=;
 b=sihSI/9Ml/v3fgV8SXeHG5Tl2c7Ktabx6/5l5S4vmdArCa3H7BNxPivYyrLs1lBftgB0w/zu8QSBykgmOADnbglJxUFePm0YkR9M+ljMfZZFegKgturWl6QN9xh7KfLxJszKJ8azkviXMHc/ej8qWT53XYG9nPmltVcJ5hiJa5Fj281lgUV0vKSclI0dpGZqWJrRzcbYFjW+7UWVIXmasoXw4i7YaLJjNWeh2k+c0lV5XObZkVklcG2PmBouHI+2UmrfJOoCDlx8Hrtz84lKFO/nKMsSKOvZdu7rAtdeZdMO9N4QFjVoLcV+Tcl9FlxXDYHLFIIRlm4HKnI4L6Yxng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GV1PR04MB10199.eurprd04.prod.outlook.com (2603:10a6:150:1a8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Tue, 8 Apr
 2025 01:41:43 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.8606.033; Tue, 8 Apr 2025
 01:41:43 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 08 Apr 2025 09:40:01 +0800
Subject: [PATCH 5/7] ASoC: codec: cs42l73: Convert to GPIO descriptors
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-asoc-gpio-v1-5-c0db9d3fd6e9@nxp.com>
References: <20250408-asoc-gpio-v1-0-c0db9d3fd6e9@nxp.com>
In-Reply-To: <20250408-asoc-gpio-v1-0-c0db9d3fd6e9@nxp.com>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Peter Ujfalusi <peter.ujfalusi@gmail.com>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, patches@opensource.cirrus.com, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744076413; l=6197;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=mCFvuqpvYP6zAiAQN0XFIgyC6gWp32Imiy6lQKfJQ18=;
 b=BHkDEwJ6y4PE6yxAvNERYtCFbXeJHlvivndbAEi2PKrKauJOspOhdhoyAyUhWE1YqI+QZ8erQ
 AWsdyXlakERAFpKS+Dkg3LYkOVn4r6Mgu+X+Y5wJTynzUkCvqIqHGCo
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI2PR01CA0048.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::17) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GV1PR04MB10199:EE_
X-MS-Office365-Filtering-Correlation-Id: f278bd70-a8e2-42ba-de27-08dd763e8441
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ajlxOVZTT0tZczlXS0FjbW9hU2Nvc2srSFloVDF3U2ZRcmhJTUlsclY3Z1ZH?=
 =?utf-8?B?KzlQYWFHbTZLWmE3SEFpaHh2bmpzeDl1bEtVeFBrWXhiYlFZcUM2VmJabi9D?=
 =?utf-8?B?amlzdnpCVDNaT0JXR0taem56aFJYZlpwZCtxN3Ruc2gxNFJEeVg3VDhYVkhU?=
 =?utf-8?B?UDZlMTNXUFM1aEMxd0dST3JWdkZHcW02U3JVbnJsdThvemhiWHNiY0JrdzFi?=
 =?utf-8?B?VndObkhydVFSMzNLN1g2L0t2YmE4RnRhYkEzK09NbG1VWStvZ2dPL1BzenRN?=
 =?utf-8?B?S0V6WUFJbVZpd0pTRDRoTVQ3cFhpLzRSMkZmdkpaUzNtMnNIeWRWeXpyMFRC?=
 =?utf-8?B?Zk0yS1JQVSt2RnBvMFk1bUQ2dVB0ejdkUjRsMk5LeDJsZ1R3b0ExMXdRbE5r?=
 =?utf-8?B?d2JZanlLay85bFJkMEs4citUZGZwM21OdUlIMCtKZ0NBNjJGMmx5VSsxVGZ3?=
 =?utf-8?B?UzUxSXhFT0pEZnk4dXFGSFExR0R5cEVWYW5GNyt2NkpFakh0QkpJQy9uQzFF?=
 =?utf-8?B?MkF3aTVoNVhvUzEvbmpLSFFZa2s2Rkh5anNDdDYzZFNNSWxUOFZxb2JmSWlR?=
 =?utf-8?B?b09WcGlNRmRYbXd3QVN4TzRZVVBmUVpxVlNnamNadUhRcCtzV3Q5U21BVDhx?=
 =?utf-8?B?czN5Q3NKbG8rc3V6cURFb0IwUTJOY2tpNm9LclRueHlSa0R4dlNOUnNnSzBy?=
 =?utf-8?B?VHdaVFU5bXJpN1hYWDlWZW10SG01SkR6ZHdjWDQ5TU9jR2ZjVEpCUnJWdmEw?=
 =?utf-8?B?aURtTGM3M1Y5dVNUYkNNbFBYV1NkTm1OTWhxS3JYQUhWOFZEdU9CZUdUT1V2?=
 =?utf-8?B?N3J1d1ZyOGVMRW5PUCtxekh4MXd6UUVvVlRJc0NnOTZmcDJGeHNUM2lLVGpZ?=
 =?utf-8?B?UTk1Y3NVaGdBZkllbis4SDEzKzc5cFJXZTlIMS8rcU5VYmRsMU1BMWxhdndp?=
 =?utf-8?B?Mzlrck9nbU5OcEZDYlhuc01NN3lLcndOSHNvclo2RU5FdmllbkNIUmRmNlNO?=
 =?utf-8?B?cExnNWhNZThJU0tWbjZqSmpBWVp5VVF4N0JldWFXa0pBNUVCakNLdFlTa0Vz?=
 =?utf-8?B?RlphYmxOWlM2N1hoeXU3OHVBYnp1Y0lQZmJDMU9HQitiSTk4eXdTS3d5a3Vj?=
 =?utf-8?B?bUIxeENYSTRwcTBSRTZic0wrbTFLdUJ5eklRRy9FRnYzbUF0ZERmT3U3WEFs?=
 =?utf-8?B?Ynd5WnJKWk01c052cGtVTkhSMGhaVmY3aEZCcksrZWZ3VXRXQXFzelNKS1dD?=
 =?utf-8?B?QkxSVy9lU3Y5Ynl3bkpJWVFQczc3WUZjZWR6a0ZDSkh3L24vNWgzbjVVUkpm?=
 =?utf-8?B?eEpJZHU2YXZFaHVDd1F4MXFIM2Ztd3NVc0t5dmJRN0hsdExIQXN5VkVjSVND?=
 =?utf-8?B?N2dpTnBvbEg3Um1WcVJGd25IZ1Y2SUIrQkV2YnVCSWwwZWVRN1crS2JsUG93?=
 =?utf-8?B?WUV1UGZwNkx1TUhHYnljdHZZdmhsU3lDWEh2K3p4cUhvWlQxUWpvVFJHeXZa?=
 =?utf-8?B?RUZFYnRZbG1KQlJsYTE1N3dZQ01XWEU2c1FqcS8xdHNaeGlqNUV2U3BZaWNZ?=
 =?utf-8?B?cFpJRk1YUFBCQVNpQW9nL2txd0NNUjlZcVphcndocmFGWEprcHI2VTRtZUFD?=
 =?utf-8?B?VWtJVk9FamZvQ2FQMFFIdVBNOXNPdnVzYXlRRDQvUkV4Wk9DOWNnM0lMdTg0?=
 =?utf-8?B?bk0yYURkUlk2OEpHVWF6Vk9zbTViY1hrUHMwSmd5MitSeWVncnMyR2R6OWhI?=
 =?utf-8?B?eEV1K1Z3SmFLNUg3YWcvVjNFUzZMSjREeXdsWWhGcDNFaFhvb014RXpISXdR?=
 =?utf-8?B?dzZnVVMrd3ZwQXdnSXNTbE1ZaXFFbWNnR1ZIR0JkNzAvUjBpeVpQSm0rVzl1?=
 =?utf-8?B?eXd1UUxXdGFnNG1JcjE5bGlidlpYQTAxSUM3QWplVGpNVEFaVzM0QjhKdmgz?=
 =?utf-8?B?TnpVeTZVWXo3NlBDOGgvSXZPSm81elpWeHdDNTJoQVF6R29VczY0RXlMbDNS?=
 =?utf-8?B?RkxwSjUrbzB3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Sy91T3U2bGpQUXFEL25zdW50c1ZmZmIyNGU1Tm9XaXdsb3N0WVU4RXVMUldt?=
 =?utf-8?B?clZvbmR3dFAvQzJqTTJIa0VscUJVdnZYTXdETCtLN0xQd1l1dHdGZHVDL1Bl?=
 =?utf-8?B?YUpMa290RDNmTXowM3lIcytHQzNxaFBOMWdzYmtnbTBUWEN4djNTU3BndFVZ?=
 =?utf-8?B?R2NhZUc5OGE3RkpYRDRSQytVa1JXUkJib2JaV1A3VGtoUFFCd1ZmcFVkc3JQ?=
 =?utf-8?B?bVcyWW5EclhwVTF2WU4zcjd6Y2VSOU9MUkszT2MxWUhWVW1EYUp1NXo2eHE3?=
 =?utf-8?B?djhTVGdsSVdpYmpnc2RBVitCWlFvRTNTOVdKSTZNeGE1a0E1d0dzb015VXo5?=
 =?utf-8?B?M3d2OW5DYVZBVm85NVdXTFF0cFZOd2FNWjhFV2Rld3owelRFOW1BMGhrRTB6?=
 =?utf-8?B?YWVrWjZQM3pWK3pnUlpld1lXVllVU1l5THROVUpQWFIvUXI5eFhnZjJPRld5?=
 =?utf-8?B?LzQ3Y0JrU1JQYUQvZ1lWZDVVbTB4OUFKUWJkOFltdmFieVhTNjEvendEV1pv?=
 =?utf-8?B?YTdNMGFHZ243bjVLcXl1dXRkTEN6dzFENWMzRW5VNjR0Y3J0c29OY29OUU00?=
 =?utf-8?B?R3crK0Y5eTB3dVhhdjZ3VjRLaVRmU1RJTzNDWDU4WTV2Q2kvbmFURjZCZENM?=
 =?utf-8?B?T3VIOFBlSFg4azVOOFl6ejhWTlBFZDgrSVdXTEZHTzM1eS9DUmJXZzI1dEw3?=
 =?utf-8?B?ajVNVWJUVFMxS3hyN0tXTFFrUWNSM3FZNGc2NGU0WHFWMnRlZ1FKQjB6Z1Z2?=
 =?utf-8?B?TDRKM1ZKRDBXWVhrbDl2ZXB1c2pERVBiMGNNbi9VYVYrY3JFdWo0anhPdUVQ?=
 =?utf-8?B?OUQ1eGt3RFQyNU05NkUvSEtZTDU1ZmlZSjhxbHUxblBDWTUyT09sbk9BQ2tF?=
 =?utf-8?B?eXVCWFIwRmVXWVBML1k2VUxHcFVnc3l0Ujl0bCtJcWdqUTZwY0JTY3FkVmVT?=
 =?utf-8?B?c29pQy9ORVU0ZkdNdkFySVd2L1ZxSUFMdTdYaFdtQW1NVnk5b0JLVmthTzJu?=
 =?utf-8?B?b0JWSTh4VW5yUVY2Vy9Qc2dlbU1YTmpsRVdUVXNjOXA3ODdCNkkvK3NEeWxo?=
 =?utf-8?B?RklkYU93ZEs2RkxyakxXZGh1T0N6MkdTdDErbm5Vd3Z6RzZXNFhXV1lHQ3pI?=
 =?utf-8?B?UG1JcHpucEc0dGhEMDhYcjBTQWtTKzltVUVEdVR4NUdRL0lhemxKa2dwR0h5?=
 =?utf-8?B?WWY2YVp5eVF5QmtqLzl3ZG93RmUzeU8veVMraUN3UjF1d0IrSkZuYzJqdmVS?=
 =?utf-8?B?YVRjRFVqTThXYlBhNk9vUUhheUVQWGNoSC9UcVhPalU5R01ZQXJoU2daTElC?=
 =?utf-8?B?YkhmbEVyOXUvbS9FZzdFRDJ1NnRRQTBDVmNvR00zWkl2cDZKTVg4dzQvTHRp?=
 =?utf-8?B?bjE5a1dOVXZNRXo3dUdUOW8ybXZQSCt3a0tFTlVZYXRkZDNoQnBDbytLdlpK?=
 =?utf-8?B?dTZXQnIxVWNPSnJGQWVuMVFieDN6NW5EaGJuRklwNlJjK2U1VWJOdGg1RWlp?=
 =?utf-8?B?MlNTcDF0aGFiQ0dJKzR0c1RjaGhiQjhUS1k3bktReGdrOWw0d01DVStWYmpX?=
 =?utf-8?B?YjBObWZNQ1AwLy9vR2JCQ1E0NlpYc3dtOCtjamJPR0hReU9JSUtDaXFIa3R0?=
 =?utf-8?B?VnRIeS9vLzMvdnNmOXhwTTNjLzJRSW91NTRIU1lBbW4xemdSQ1lGdU9ZaGNV?=
 =?utf-8?B?TFNycjVkUW02eUdEMjRWZ25abklNR2h5SDJ0U203eDAvVTRGc2RsTFREVU5Y?=
 =?utf-8?B?dC8zWFB3eXZKcnRSY3Z5dWJRUXlCL2RoaUlXMVJuSnFpLy9ZcE5KMk1uTHFi?=
 =?utf-8?B?Y2VLUEdRay8rTS9Qd09pa2FVSU1iY0t1Rmg1d3I4K3FsSGZkZlM3QjdiSXVx?=
 =?utf-8?B?cTluR2VSdGVMdG5RcHRlY1R6dmZ1UVo0aE9ZNmNPOUd5VVhneEdLOWxQYU0r?=
 =?utf-8?B?cjFEd3h1YzB3MWlhVUVQWk1BR2J0ZjRCdkkxSWhxUDZyQVBZK1ZBTDlSYTJu?=
 =?utf-8?B?OGtScURYS0wzTFlHU1k1VDJrR3p4bmhkUTFzL3QrU3FlL2M2NHA3MDJELzJD?=
 =?utf-8?B?WnlQanlyeHMxQ20xZkpseHhnVjh1bVlJMG1VbGJzQnQwT3kyWkJBRS9HdjNq?=
 =?utf-8?Q?Q+MMLl4bN4XcGcIkz9iusVlJz?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f278bd70-a8e2-42ba-de27-08dd763e8441
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 01:41:43.6328
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5wxBvMplz+H70FpSt9UA47zLTuFnhel1XSj+o6TOBUD9JkN765g3CbRuE2wCaxCvXr1tp6pWzA8bVA2K1bEmDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10199

From: Peng Fan <peng.fan@nxp.com>

of_gpio.h is deprecated, update the driver to use GPIO descriptors.
 - Use devm_gpiod_get_optional to get GPIO descriptor with default
   polarity GPIOD_OUT_LOW, set consumer name.
 - Use gpiod_set_value_cansleep to configure output value.

While at here
 - reorder the included headers.
 - Move cs42l73_platform_data from sound/cs42l56.h to driver code
 - Drop sound/cs42l73.h because no user is creating the device using
   platform data

Checking the current driver using legacy GPIO API, the
reset value is first output HIGH, then LOW, then HIGH.

Checking the datasheet, Hold RESET LOW (active) until all the power
supply rails have risen to greater than or equal to the minimum
recommended operating voltages.

Since the driver has been here for quite long time and no complain on
the reset flow, still follow original flow when using GPIOD
descriptors.

Per datasheet, the DTS polarity should be GPIOD_ACTIVE_LOW. The binding
example use value 0(GPIOD_ACTIVE_HIGH) which seems wrong. There is
no in-tree DTS has the device, so all should be fine.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 include/sound/cs42l73.h    | 19 -----------
 sound/soc/codecs/cs42l73.c | 81 +++++++++++++++++++++-------------------------
 2 files changed, 37 insertions(+), 63 deletions(-)

diff --git a/include/sound/cs42l73.h b/include/sound/cs42l73.h
deleted file mode 100644
index 5a93393b6124f746bfb7bf5076e4bd1f458019d2..0000000000000000000000000000000000000000
--- a/include/sound/cs42l73.h
+++ /dev/null
@@ -1,19 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * linux/sound/cs42l73.h -- Platform data for CS42L73
- *
- * Copyright (c) 2012 Cirrus Logic Inc.
- */
-
-#ifndef __CS42L73_H
-#define __CS42L73_H
-
-struct cs42l73_platform_data {
-	/* RST GPIO */
-	unsigned int reset_gpio;
-	unsigned int chgfreq;
-	int jack_detection;
-	unsigned int mclk_freq;
-};
-
-#endif /* __CS42L73_H */
diff --git a/sound/soc/codecs/cs42l73.c b/sound/soc/codecs/cs42l73.c
index ddf36001100eef29f74f4d99420511f620f1948d..73a980ed2cefce2eaacdce0b758be433e632019c 100644
--- a/sound/soc/codecs/cs42l73.c
+++ b/sound/soc/codecs/cs42l73.c
@@ -8,24 +8,23 @@
  *	    Brian Austin, Cirrus Logic Inc, <brian.austin@cirrus.com>
  */
 
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
-#include <linux/kernel.h>
-#include <linux/init.h>
-#include <linux/delay.h>
-#include <linux/of_gpio.h>
 #include <linux/pm.h>
-#include <linux/i2c.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
 #include <sound/core.h>
+#include <sound/initval.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
 #include <sound/soc-dapm.h>
-#include <sound/initval.h>
 #include <sound/tlv.h>
-#include <sound/cs42l73.h>
 #include "cs42l73.h"
 #include "cirrus_legacy.h"
 
@@ -33,6 +32,15 @@ struct sp_config {
 	u8 spc, mmcc, spfs;
 	u32 srate;
 };
+
+struct cs42l73_platform_data {
+	/* RST GPIO */
+	struct gpio_desc *reset_gpio;
+	unsigned int chgfreq;
+	int jack_detection;
+	unsigned int mclk_freq;
+};
+
 struct  cs42l73_private {
 	struct cs42l73_platform_data pdata;
 	struct sp_config config[3];
@@ -1276,7 +1284,7 @@ static const struct regmap_config cs42l73_regmap = {
 static int cs42l73_i2c_probe(struct i2c_client *i2c_client)
 {
 	struct cs42l73_private *cs42l73;
-	struct cs42l73_platform_data *pdata = dev_get_platdata(&i2c_client->dev);
+	struct cs42l73_platform_data *pdata;
 	int ret, devid;
 	unsigned int reg;
 	u32 val32;
@@ -1292,38 +1300,31 @@ static int cs42l73_i2c_probe(struct i2c_client *i2c_client)
 		return ret;
 	}
 
-	if (pdata) {
-		cs42l73->pdata = *pdata;
-	} else {
-		pdata = devm_kzalloc(&i2c_client->dev, sizeof(*pdata),
-				     GFP_KERNEL);
-		if (!pdata)
-			return -ENOMEM;
-
-		if (i2c_client->dev.of_node) {
-			if (of_property_read_u32(i2c_client->dev.of_node,
-				"chgfreq", &val32) >= 0)
-				pdata->chgfreq = val32;
-		}
-		pdata->reset_gpio = of_get_named_gpio(i2c_client->dev.of_node,
-						"reset-gpio", 0);
-		cs42l73->pdata = *pdata;
+	pdata = devm_kzalloc(&i2c_client->dev, sizeof(*pdata),
+			     GFP_KERNEL);
+	if (!pdata)
+		return -ENOMEM;
+
+	if (i2c_client->dev.of_node) {
+		if (of_property_read_u32(i2c_client->dev.of_node,
+			"chgfreq", &val32) >= 0)
+			pdata->chgfreq = val32;
 	}
 
+	pdata->reset_gpio = devm_gpiod_get_optional(&i2c_client->dev, "reset", GPIOD_OUT_LOW);
+
+	if (IS_ERR(pdata->reset_gpio))
+		return PTR_ERR(pdata->reset_gpio);
+
+	gpiod_set_consumer_name(pdata->reset_gpio, "CS42L73 /RST");
+
+	cs42l73->pdata = *pdata;
+
 	i2c_set_clientdata(i2c_client, cs42l73);
 
 	if (cs42l73->pdata.reset_gpio) {
-		ret = devm_gpio_request_one(&i2c_client->dev,
-					    cs42l73->pdata.reset_gpio,
-					    GPIOF_OUT_INIT_HIGH,
-					    "CS42L73 /RST");
-		if (ret < 0) {
-			dev_err(&i2c_client->dev, "Failed to request /RST %d: %d\n",
-				cs42l73->pdata.reset_gpio, ret);
-			return ret;
-		}
-		gpio_set_value_cansleep(cs42l73->pdata.reset_gpio, 0);
-		gpio_set_value_cansleep(cs42l73->pdata.reset_gpio, 1);
+		gpiod_set_value_cansleep(cs42l73->pdata.reset_gpio, 1);
+		gpiod_set_value_cansleep(cs42l73->pdata.reset_gpio, 0);
 	}
 
 	/* initialize codec */
@@ -1360,7 +1361,7 @@ static int cs42l73_i2c_probe(struct i2c_client *i2c_client)
 	return 0;
 
 err_reset:
-	gpio_set_value_cansleep(cs42l73->pdata.reset_gpio, 0);
+	gpiod_set_value_cansleep(cs42l73->pdata.reset_gpio, 1);
 
 	return ret;
 }
@@ -1371,19 +1372,11 @@ static const struct of_device_id cs42l73_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, cs42l73_of_match);
 
-static const struct i2c_device_id cs42l73_id[] = {
-	{"cs42l73"},
-	{}
-};
-
-MODULE_DEVICE_TABLE(i2c, cs42l73_id);
-
 static struct i2c_driver cs42l73_i2c_driver = {
 	.driver = {
 		   .name = "cs42l73",
 		   .of_match_table = cs42l73_of_match,
 		   },
-	.id_table = cs42l73_id,
 	.probe = cs42l73_i2c_probe,
 
 };

-- 
2.37.1


