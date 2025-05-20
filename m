Return-Path: <linux-gpio+bounces-20326-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DB23DABCDEB
	for <lists+linux-gpio@lfdr.de>; Tue, 20 May 2025 05:45:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DD90E1899089
	for <lists+linux-gpio@lfdr.de>; Tue, 20 May 2025 03:45:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F1382586CF;
	Tue, 20 May 2025 03:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Q0pMbr6l"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2085.outbound.protection.outlook.com [40.107.249.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD36F610B;
	Tue, 20 May 2025 03:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747712694; cv=fail; b=fbIIrV3+Ug5DaBv+0LAJU7hUznSgyDIPDwj9Z1Oaz++Ksu04qXXNZ+ruQ6rSX00dZNmTV7b/zn5oYid06D1rs4mK8Z1usCYAVa9hVqmoKzNm23URxRcMczYKONPaOVKxaWNEanQLpiSmqVt6ECwO8wnNgwXwe0NZOChAp4XC4Ec=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747712694; c=relaxed/simple;
	bh=la/awCmhM3SCpECD4tyaOKdni8oJu5GooA097fAZPx4=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=ZIXq0dD+Xnj3FuaqmXdmrMOEcezW0boHr5xz8/wbCC2Yb/6xSjvBcD8276xhZ2ySRzvbYwdNOhESpRK4u5PFcRhaKR+9qSsti6YypmzS54OyGDvj1dB+U3FYc2eetjZq6Hdx6v2VZThEKW5xDLEOksRSRYolgsuVKnTP6ZePmN0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Q0pMbr6l; arc=fail smtp.client-ip=40.107.249.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SM7eLsMK61rXtT6e5jAFYtC+XEUYcJLJCeaxDklkwhqEgxZ4jo6TT0xqeKlX//veMscGLvl3TKGGJbp597p1MTK9oXyOKMxNz6+mR66/88o03tkWZqyZo23OKHXfo5yID1zcfcO151KTyjQJyoIkhWiJMHeIjnf/dJ0qNopFiKAK6RbK62WavrlriMPp3JIQCyGgDw1/oiQU6xf9FWNT5H4alxec0vLGk3vfIjySDlD4qxhsNCn8212nuxX6MBUfNNqrkqdf43vnBwxBxpEQs/wgPmhvM5M5EMPgSWR2DgJJ5VOfn5/t5Mu2SZWXXh4uSX84uN/qXg/dixnGgaBlOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OaLs70gl7f0nj0Vbgc7poQwij85iOtAGRHTnT/ZUdfw=;
 b=khx5a/xVswWVMcKqffmtL3aDJpn628E2mj9r+so/+oa2v2IUjvt1IaYjNScwgv1JBs0h9M3Sr9eQGhdLpW0KVj2ZzyN34KerLibTFcZnituejm+kmWm2hmSmwYUqwSBxp5s1kpRLZ2AMrMmbZ33q/8lPcBPBgQ7w7h1K3gP5vzpFVS+sJdzrsQ6i8+n2rxUPjrPP9GfUo+PMEeDLwghXrdsWsQqjMTi2BcT4ZhpuZJTTZnKiRacaP60yrjVow6Dei2rF+u+CJJEbVDihszTcj2zod8ui2YJBOra6wva+fxh+Cx5sa5wp8FYV5rzSZkqmS49DuDstTG+xWos1+VcoZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OaLs70gl7f0nj0Vbgc7poQwij85iOtAGRHTnT/ZUdfw=;
 b=Q0pMbr6lY9JN48XvcfVk+Fjb07pul/yZilkkzN2zmUu3bIKvARGKVHu9YyXXNZ0Ph/OzeY1KkA86LymeXEjYiCE6bT1JLiyBuu5mNgmqRMK0oX+6Gpo7bkNxZSogZz1+v7YJTICaPkIgNRTozsG12Fl+dRZ7zuH6qGSqvIu3ULRDVKQ12fWjqQcJq2XZdlOtu8WEFgdK1Vx5XpsGoDrm3EjalA3D5Fw8DjNOVpSf4R6q/1XjsGnrj6wS3829D4UuE1nW08TQbkgzSiylnWaCEl+w2bGWogxdJXz4usYy5yjiSzXh8kM+i+O2XhqRua131jv2RYYN9Lu/7SRMOGIycw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com (2603:10a6:10:32d::19)
 by PAXPR04MB8767.eurprd04.prod.outlook.com (2603:10a6:102:20e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Tue, 20 May
 2025 03:44:48 +0000
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::4fa3:7420:14ed:5334]) by DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::4fa3:7420:14ed:5334%4]) with mapi id 15.20.8722.031; Tue, 20 May 2025
 03:44:48 +0000
From: Haibo Chen <haibo.chen@nxp.com>
Subject: [PATCH v3 0/3] Add 'ngpios' and 'gpio-reserved-ranges' for
 vf610-gpio driver
Date: Tue, 20 May 2025 11:46:11 +0800
Message-Id: <20250520-gpio-dts-v3-0-04771c6cf325@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAP7K2gC/22MOw6DMBAFrxJtnY38wRCnyj2iFGAW2CIY2cgiQ
 tw9hooi5Ty9mRUiBaYIj8sKgRJH9mMGfb2AG+qxJ+Q2MyihjDCyxH5ij+0csRB3LWVTau0KyPc
 pUMfLkXq9Mw8cZx++RznJff0TSRIl1tbpvHemcOY5LtPN+Q/siaTOmj1pCgU2lqpKVprsWdu27
 QfFHdAV1QAAAA==
X-Change-ID: 20250516-gpio-dts-408311b633c4
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Haibo Chen <haibo.chen@nxp.com>, 
 peng.fan@nxp.com, wahrenst@gmx.net, conor@kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747712825; l=1831;
 i=haibo.chen@nxp.com; s=20250421; h=from:subject:message-id;
 bh=la/awCmhM3SCpECD4tyaOKdni8oJu5GooA097fAZPx4=;
 b=4E74AS8LiozrSl07oshgoYj4/u+EpIIKEcs3QKv/isouD7RICkEDJHa1NlR4SyzQnQb+m1Mce
 F4e3QXBkf0gC/JLny6kYSJsitrWKCLqwLj9gMpQwvbD5NalZG9BjfHS
X-Developer-Key: i=haibo.chen@nxp.com; a=ed25519;
 pk=HR9LLTuVOg3BUNeAf4/FNOIkMaZvuwVJdNrGpvKDKaI=
X-ClientProxiedBy: SG2PR02CA0032.apcprd02.prod.outlook.com
 (2603:1096:3:18::20) To DU0PR04MB9496.eurprd04.prod.outlook.com
 (2603:10a6:10:32d::19)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9496:EE_|PAXPR04MB8767:EE_
X-MS-Office365-Filtering-Correlation-Id: eebb4ce5-55ea-43d2-8889-08dd9750aaed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|366016|1800799024|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Smd4Qlc5UXRXYnFVUWJnZk5hWjNmSmRmZkpWVER4K2huWUt6RW9DdVp5RGV3?=
 =?utf-8?B?OWRnQ0hHWGoyaGJXclZFK2tyaDF3cEhPNjZ6aUpRblZWR0Q1UEpjUGRVNGlZ?=
 =?utf-8?B?VnNzZmpJL3VhMXU4ekRPd296dFVoTERwUTloMENFWW9vU01XSjVEWURDOEJ2?=
 =?utf-8?B?dXkxTmJPNXRVVTd6TEhjWVEvKzV3M1ZNUG1NWE1RUng0anNZN2YrNGlHSlN6?=
 =?utf-8?B?cVZZQUFqUWlwQkdGdzFqazJIS0ZDU0hGTTQrL1ZRVDlkZ1VEa0REVHAxQlhl?=
 =?utf-8?B?eE9hS1JkVVJ1cXl3VGN4cjVDQzhsVFpmWG42bmxjY0taVUptbDlTZ1hMYjk3?=
 =?utf-8?B?akZxMVFuaGhHWlVCL1RnK2RyT1BVRGJnZVRua3U3T2dLcDdaY1FSR2ZPRnBN?=
 =?utf-8?B?VEUyZVBtMjlORk96eWU2NlFoVCt5Q1JHSUpsMnFtOFV5TzRhSUtVQTZ3Tk9r?=
 =?utf-8?B?N1VBUk1GQ0ZYdnRseFRrQnpHSUc2K1ZKeGVOK1VsWHJmWDlsenZkcXM2Y3hR?=
 =?utf-8?B?OTA2NitqZnFXeWphMUtWb1YwZUJWTElTQzRzSWZyZktjcXFiYVBnREU5WTNQ?=
 =?utf-8?B?SlpLMjBTbnVsb3FWVDBjYTdZbTY1L2tCc05RMldwZ0s1ZmMxb1Y3N0pjSU1m?=
 =?utf-8?B?Rm10ckQwNjlYNDZ5UHBuZWVYZE8rWjVOelEreU1BOWlBZ05DczM2WXNFc3R0?=
 =?utf-8?B?Zmhzc24wOHBMZlBQN1FpM2hYWkp4djk2OU9QUzdiQVhEbGFtNWkvUk43ZlBL?=
 =?utf-8?B?UnhSL2hyUHo5NXRGeFZqQ2Z5d3plWkk5RGtENmdyMVdFejZVYVVjZVNBdFFJ?=
 =?utf-8?B?Sk10YjlCbGQ4M1RiK0ZXTnUxWmR5bWxUTW5TMG44SXdSbjVYcCtTanpvZUlH?=
 =?utf-8?B?d0N4cE9Hb2prRGVBVVZiWnZXbGxjL3JRV3pmL0kwamJnczlzK3lwSW1LWDZ1?=
 =?utf-8?B?TGZhWkJ6NU5PV3ArQ1ZuL04ySDl5SUJQMllSbFNScnZYVGVHN2t1UGNNS3FL?=
 =?utf-8?B?V050Q2oxMyt1TzBucGlnTHlWbVo5MzlwRmhPcjV2clZBQnFuKzY1TWhyUlpH?=
 =?utf-8?B?WHg0REE1ZTZDM1ZPbjlIOVBqNm95VFQ2d3pqdTNIODdUV1JGY1FRVktFTEhQ?=
 =?utf-8?B?d01YZk1KNnhoSDJzcWpTYXp4dWlMdUsvbmJ3OElhbHFlQVVpVm9VVE8zUjVj?=
 =?utf-8?B?eitDOGxLWkVUbmtIWllPOEN1Ly9kQUwwUEduVWhWL1I2MEd6VkJoRVl4T0J1?=
 =?utf-8?B?NzRTaDNPMkZhWTJPNi9TM2FjRFlGMzVlcEpQMWd2WWlkZHFPdERZeXFRSlM5?=
 =?utf-8?B?bXRKck1MVy9JckdtV09kZDVmbnlYRzZCOXhTc3NPVTRjSi9ETTczdThyOURH?=
 =?utf-8?B?cmtFNEdqWndVWlR3R2RIbTNmWjZDa0JXZUZHYmRuZjc0cXd2U3JOQkFEbFVR?=
 =?utf-8?B?UVlrNHlOR0M2NVU0YTFkTTNwamsvS1V0WmFnTjdzS1h5dGZzN25JR1IxMWxu?=
 =?utf-8?B?Si8vWlNNcmN4L1VPWVhjeDdTZ0VSVmYyck9zZWZLRm94Q2pTdys4cVBUYVRV?=
 =?utf-8?B?dGZkZmV1VG85UUVrSnJsTHBPZllya1p1Mnp5WVU5bE4yUlRvaG1UaytRaFhn?=
 =?utf-8?B?YTZscGpZUU1Oc1B3RWV1ZjZnYXlHdnRTVDJnOVVXMVVvWjRBRnhVK0ZwSGZy?=
 =?utf-8?B?cDFDUCtnVFNXRGZqVEFKYWtPc2hoemNGdFB2eEZNR0ZpM0xYVG4rc01TSjNw?=
 =?utf-8?B?SkpUMmJ1Y3p6ck51NE5UaVVwSUFYNVBCMmhlN0k1K05PbTA2VVVjVUJmSUJP?=
 =?utf-8?B?L3hyL296QWYwQ1lXb1lrVmFoZU4rWlhKTTRYRUlXK2RkZVVCUVozL2RQRDB5?=
 =?utf-8?B?RjEycDFJS2Uzd1NjVy9SRFFHVHN4UEpqMm5Dc01WejdWSDlVck5JNjNXb0tp?=
 =?utf-8?B?Qit3QjZISU5JV044bWpUT2VLa0pkL01MTnlVQVl1MDJtelA1bDMzNlVXR3hl?=
 =?utf-8?B?RXU0WFprdW5PbHFFZHpzdWFlQnJ3ZVlzMGdKTHY3alJpdXlLc04xMm1uaStw?=
 =?utf-8?Q?WC5+aU?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9496.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(366016)(1800799024)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ckZsbm1iaFVDcjc0YmpGd084aDdXSXJvMDNnc3dqUVVwbG1HWERLM1BDZEg1?=
 =?utf-8?B?bS84Nm5zcVRrcmhLSUh0OTEzYkt6REVITExldWcyUnF6aDlER1dKbW5WRWl4?=
 =?utf-8?B?Z1RJc2tjTVB0RXhuekxuYmZMb1l1V1dLV3YrOUhqZ0JkYTB2eGxzVmxPLzlL?=
 =?utf-8?B?aEl2NG54MlF5NXVNbzBlaG5ucWtXWENjakg3WXp6K0g5MWtnM0JNWitzNVJD?=
 =?utf-8?B?c29oa1YxYzhOL0lIZm5zdjcrRXRHWU5NZFZzN21RRTFpS0N5d203RGpZNk4w?=
 =?utf-8?B?azFPVmRDZW5Sd0R2bnoyOGZ0eTNxZWc1c0U1SHM5ZjNab1haZWgxVVV4QUlE?=
 =?utf-8?B?bHN0RFUrUzFpcVFsUUZJOEVUcEdoUzd4U3ZQU3RveTl0VDh4TWt4cUFNY1JC?=
 =?utf-8?B?dFU0dDk0ODFkTllaQjlGS2creUducllnTE5rR3VQWDczOEpKQVRQdjkwOFg5?=
 =?utf-8?B?QUNtQVIzM1dLaFE1UW9Pa2p6SXhHMjE2dWI1OGdPSGREdWp3dmV6d0tkOEly?=
 =?utf-8?B?UEJtbTEzNU1ITnFud3FUdTFXNzNFdUh2NFBieGhZUjhHMW9aSW1Fb2VWSTBw?=
 =?utf-8?B?TU5xMU45bWpGcm1kWFVla3V3bXZWZlY0UUI3YjlJSzhEdEVxNUlnOUQxS0xD?=
 =?utf-8?B?a0lES01peTc5ZGV3bERaT0M0SnZBMXVEQThPOFhpMTJpNmZTQU54TVJKWndp?=
 =?utf-8?B?Yy9YYzJHblNNQ0MvaVZ1d3o3ZHphcjBxcjhlUEcwTnYyZFAvcVlLQTUxZEVl?=
 =?utf-8?B?a1NZOXVGVHJLTEpCSlFGeWdqR3E2RVd2Y3U4eW9WTlVoTS9zSnR3b3k5R2Fh?=
 =?utf-8?B?SzN4Yk1VZUE4ZUNoM3FwY0M0YlV4REM3L1BxZUN0bXZ4eEVJMWFGZitTL0d5?=
 =?utf-8?B?MG9RcWl4QW1BcWV6bDdnSDZoMnE0UmNVWmROUFo4MjZ0TEJyNnlTd3hIblNF?=
 =?utf-8?B?Y1dWWlovS29POEZGdWN3VGpySG90bGVuZkVDaXpwKzNMcFdzRVhzdEQybFZB?=
 =?utf-8?B?bVpXTDJnRkNBY0FBT053aXdsViszMmVlREpoYm9KWWVLYVVPd01PaHFRRGRX?=
 =?utf-8?B?azFLUllEOEQ2eXZhZlF1bFFNaS9lTHZxeXk3ZGgrbWZCQnZGaUl3ZzVCcHFv?=
 =?utf-8?B?cGk1SEhPVyswdk9VbUFDdEwzTEpaQThBWGlxcFpTL1ovZW9nRUpvUnVuMTlV?=
 =?utf-8?B?MnByZTlxTEFZQVV1dTAwK1ZpSEZuRmRwMzFWSTR4YmZ6TFRtZjdDYXRrMUxP?=
 =?utf-8?B?K1hrdVFYVDd5MVVQNC9BT0NtSjdsVHFCQXZIQi9uQllQVkFDVmhtVEQvaVlU?=
 =?utf-8?B?b2kyOHZ6NW5NeVZVSWhGS3VSR25DbzU0NlRlVHJqb3V1a3poL1BodG80NDhP?=
 =?utf-8?B?RkdmcTZwZjJCaDBaY3R2WUVmbDdic2x6SWFwWk04allQU0Vqcng4cVFYZHp2?=
 =?utf-8?B?UWxOeEtOR2JJNHZKYWFNNm9vTkZURERFSCt0Qk9GcGk5TFJpY0dIa0JvRlcr?=
 =?utf-8?B?cE9PL1c3TTdpV2xuUDRTQ2NJcDRZQ1J4S20vbGZWN2hocnQ3WHM2Nlh3R2FK?=
 =?utf-8?B?TW12cC9FSDJsTnZ1WkpURGM3aUV5a2RHd0RJV2JuQXN0VTFPSEE3ZlpWMFBC?=
 =?utf-8?B?NW1RSnowUUFkdi9tMVF2S2FaeGFyZUdvTmtNcXRwQXdFWG9xMERoMFdzeXY4?=
 =?utf-8?B?SDJ5eU1lU2tlRUdQcjQzT1lBTzIycVJSUDNWQjg3RlRlNXg4dFZGMStmelc4?=
 =?utf-8?B?RGlhZVFUT2ZaUkdyRUdCcVR2MTEvemdXSE4vTmdjUndqbVk3SHJPMXlLNHp3?=
 =?utf-8?B?TG9JRXRLZmxpMlBuWEx2TVd1VkNxMnpFTndHQkN1bmZualM1MCtkbVlVQUNk?=
 =?utf-8?B?UG9leFl1clUxdnplbHJ5YzJVUGh6OEJwQW9FUmlGQnkyZ3Q3K2M4MmU4QkNK?=
 =?utf-8?B?TWVpdjRqbGNVdVlXOGFHTlB3NHFONVNaMHFxSVlEc2h6QTVLeHV3VnRCMVo2?=
 =?utf-8?B?YTBsVGhsM1o5UGdUQ0NEOGpWYlNvVTltTWFkaDdqYVRJS2NBSzRRN3ZVaERq?=
 =?utf-8?B?NmpRMEU5bGEyMCtidzFDcG02dUp0aXJGZFlBYW9uYjVacDZtdlRsSGwrN2dF?=
 =?utf-8?Q?X/PV+FergLyS6dk+/qRz9DJDz?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eebb4ce5-55ea-43d2-8889-08dd9750aaed
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9496.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2025 03:44:48.0106
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rSCN2M8Vlo/QZkdt59QFZhGRt+Yw21VowS7GwvzLlnfHVlguVekPrW7SyDaaZ/fvlB67MvdGXsJYbbQyRgCkwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8767

Not all GPIO ports have 32 pads, so add 'ngpios' property to specify
the number. This can save some memory when alloc bitmap for GPIO,
besides GPIO tools like gpioinfo will show the correct information.

Some GPIO ports even more special, e.g. GPIO7 on imx94, it only support
IO0~IO9 and IO16~IO27, so add 'gpio-reserved-ranges' property.

Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
---
Changes in v3:
- switch PATCH1 and PATCH2, move the binding changes before the DTS changes, to avoid temporary DT build warnings.
- put arm64 and arm dts changes in separated patches.
- add default value for ngpios in binding doc.
- add Frank Li's reviewed by tag
- Link to v2: https://lore.kernel.org/r/20250519-gpio-dts-v2-0-b9e77173e9c5@nxp.com

Changes in v2:
- No changes for PATCH1.
- Add PATCH2 in this verson to avoid dt-binding check.
- Link to v1: https://lore.kernel.org/r/20250516-gpio-dts-v1-1-a9c3505f54c5@nxp.com

---
Haibo Chen (3):
      dt-bindings: gpio: vf610: add ngpios and gpio-reserved-ranges
      ARM: dts: add ngpios for vf610 compatible gpio controllers
      ARM64: dts: add ngpios for vf610 compatible gpio controllers

 Documentation/devicetree/bindings/gpio/gpio-vf610.yaml | 7 +++++++
 arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi                 | 4 ++++
 arch/arm/boot/dts/nxp/vf/vfxxx.dtsi                    | 5 +++++
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi             | 3 +++
 arch/arm64/boot/dts/freescale/imx93.dtsi               | 4 ++++
 arch/arm64/boot/dts/freescale/imx94.dtsi               | 7 +++++++
 arch/arm64/boot/dts/freescale/imx95.dtsi               | 5 +++++
 7 files changed, 35 insertions(+)
---
base-commit: 484803582c77061b470ac64a634f25f89715be3f
change-id: 20250516-gpio-dts-408311b633c4

Best regards,
-- 
Haibo Chen <haibo.chen@nxp.com>


