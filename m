Return-Path: <linux-gpio+bounces-6101-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E98CB8BBC1F
	for <lists+linux-gpio@lfdr.de>; Sat,  4 May 2024 15:17:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C6F11F210AF
	for <lists+linux-gpio@lfdr.de>; Sat,  4 May 2024 13:17:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FC903C08F;
	Sat,  4 May 2024 13:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="JwGL8Zs6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2058.outbound.protection.outlook.com [40.107.22.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D886A39FD7;
	Sat,  4 May 2024 13:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714828595; cv=fail; b=AaTH6O6L9AHh7l6mo980Lpwnbde0XBjPgw0VCysAOqqJdgbFLfBRfi/ThHCNXNh8R7AdiE4Gy8g0jjfyqjfkZNWEM1dtzqfwgjfBB0l/7lhPCt44n5d/7It3zCbUUBLKOIg2T3nuMsWLFcEmJLwxvAOA1sJqhC2IRjwc+o71ozI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714828595; c=relaxed/simple;
	bh=7oLy/VNXv8mod/yO9pa5qybVbR+daZZ1X7hIX56xPZk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ljsrVEScI7pvf0iAnssomqYaC8TZdcJPfbhF1BGOvNaboObH2lAX6xq5LPk+JvZvj6KvMSqnHcOirIucFBPY8rPcowbOtXKXSXFilCDc+eCmExKmm0+nVxNyd8pOUh0dk6bxTOTGpZIesgarw1bfAXY7mqNw/Q7ThykGMaI2xQc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=JwGL8Zs6; arc=fail smtp.client-ip=40.107.22.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LIMM1EBcMpsAfoIajRF8lWxzqD5W5hV8CGR9eAQIs2T1oAhTOaKF0HCpJcnlc8sroJw018a5EyhoY5IExC3qqM/iF61FMdZnyHLMLCHhq+o3yrexo0iu9Xr6TXSyls9xJcIV9CfYgZ+X/aCnw1tL8enOeJjt4t93iHXGazwvHkTRL9iCy39v8F84rGNy+ty1x9SjkVGouTe9sqS0rH8auDRgN7zXZLuVBTATTG/Q+EUh8bsjNjHp+HpDHsA7LAmZVOH2dIy2QjpI/oaqPgOrLmimERTvp+7q6Ez3IYJqHLdlc4/GhQ5pFdeXTBNPcjCVidkv+cXMKY7URRnZ/9XmTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G6JJzIlsATPz+eeVRC+tmQRXVLBCszxKxTWLO7z/7Rw=;
 b=iIBs6qs50gXDdVnot+R0Tt18PMfLYan0y5eX4WWZBZ6Rmn1OplAcASf2Ui7+GWnY0XYgH1qEIPRphOElHqDmFQ0Zwp6kIoZEpOkkA+jGHrU5kIwPxWj4a7Qfp9QyPyfzFcR/YpluMQWUoDneKgvXgDhQd5yzbpvUzSm9pGJU/ZhPNAtVfq9FVVodtKKzBKFkmrN+CHcjg6/6ldPW3ecglLQ6llosWZ/4FQCY0rikWyE9gVaYAfal2h9nPcS6PsLMFvNrT7JYHLWHqWyNYPCV/oFruvx2k2GN5W83t6C/Kc8qRswy4wIevZm6SgryLF3MhM/fbgDlE6Q6nM9FCbfr1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G6JJzIlsATPz+eeVRC+tmQRXVLBCszxKxTWLO7z/7Rw=;
 b=JwGL8Zs6PoyHk+U+trsx6DmiL7Uh7CdB7QXcgZ7fwYsKtjlQTGUndTL/ynWE1SI9AmOVt8aHUAITzcJGJjBmYWjzAdmi/zHzu3mXgciACNlrVtknBQWSZS3t4z9FZHrkV8M2dvU6mytpNprf/CaijdDfxEEPyGCXAiuTQK0BNhs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by AM9PR04MB8633.eurprd04.prod.outlook.com (2603:10a6:20b:43c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Sat, 4 May
 2024 13:16:30 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d%4]) with mapi id 15.20.7544.036; Sat, 4 May 2024
 13:16:30 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Sat, 04 May 2024 21:20:13 +0800
Subject: [PATCH v2 15/20] pinctrl: freescale: Use scope based of_node_put()
 cleanups
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240504-pinctrl-cleanup-v2-15-26c5f2dc1181@nxp.com>
References: <20240504-pinctrl-cleanup-v2-0-26c5f2dc1181@nxp.com>
In-Reply-To: <20240504-pinctrl-cleanup-v2-0-26c5f2dc1181@nxp.com>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Dvorkin Dmitry <dvorkin@tibbo.com>, 
 Wells Lu <wellslutw@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Emil Renner Berthing <kernel@esmil.dk>, 
 Jianlong Huang <jianlong.huang@starfivetech.com>, 
 Hal Feng <hal.feng@starfivetech.com>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, Viresh Kumar <vireshk@kernel.org>, 
 Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Heiko Stuebner <heiko@sntech.de>, Damien Le Moal <dlemoal@kernel.org>, 
 Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
 Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 Dan Carpenter <dan.carpenter@linaro.org>, Tony Lindgren <tony@atomide.com>, 
 Stephen Warren <swarren@wwwdotorg.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-samsung-soc@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 imx@lists.linux.dev, linux-aspeed@lists.ozlabs.org, 
 openbmc@lists.ozlabs.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714828815; l=5535;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=CgYPpbd8zRZLHMaSBUod3MJSkUGYYuTkn7XHxXWmDfQ=;
 b=QThPNXw7bxO4a7RWVR+x8/it3yFCdDCIJhct6pJk1X4WfCzb33CCZ6xXajsk5epDPQ/hH1F0c
 spUFq/qYsKOCFwSsFFp6AnQ0TVEi4pJVnIpdLi/K9c5op0pxw0uris8
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR06CA0230.apcprd06.prod.outlook.com
 (2603:1096:4:ac::14) To DU0PR04MB9417.eurprd04.prod.outlook.com
 (2603:10a6:10:358::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9417:EE_|AM9PR04MB8633:EE_
X-MS-Office365-Filtering-Correlation-Id: 826172fc-8f7a-47ae-4b44-08dc6c3c6988
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|52116005|7416005|376005|1800799015|366007|38350700005|921011;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b0NFTThrOXRSN3EwQjAvZkc3RXhFUUNRUTVsMUhGQ3NrTEszcU1Gdjk4MkZS?=
 =?utf-8?B?MDRMZ3Ira2ZrdGpkazdCTE5Hd1Vsa1hmbzFSYkVYblhWTmp0Q0gvWWlac2pI?=
 =?utf-8?B?T2dub0FwVUJ4dTBVY2hSVWpvZGJjTzFrbDlLVHhqaFdtaTYxdk9UZElYZE81?=
 =?utf-8?B?ckRzZ1loQTE4aGtucm9Cc08zK29iWWVUUjhIZmR3MFVlMGlzc2ZvV1dsNlpa?=
 =?utf-8?B?UDZQN0VxOElMRkZydGU5ZkNDRFFkc3lJNVBoSjhjdldUTUorOFpKNzdwNzRI?=
 =?utf-8?B?aC9YM0phWlNwVmVEZkc1UElrM2t5L25IZ3I0eE5Yc2x3ZnpENS9KYVBaQnpo?=
 =?utf-8?B?ZXUvNTIrSmUvNGh1QTZBbWN5dkhZS0FvQVFEd20yN3VmQmdodzAreWQvZjdy?=
 =?utf-8?B?TlFPa0lQb0NxS2ltZ2JiOVlhZHczbEJLL2NWbTBjMWZ1UlVwVVcxcGk1NThX?=
 =?utf-8?B?M0VVc043RnZXMjh1NjlCSVRGd1BMVTZBekIwcEkzbkRWaE9BZUpxZHI1NDM4?=
 =?utf-8?B?dDRNRUY2dkpUSXZTRnJwRDZLV1NXWVZWeEFnSDBqSnlXUnlZQmxnZEd3VS9m?=
 =?utf-8?B?Qnl3NkhObEZweWd2eEM0TDhCMzNXVE9XZUJVR3duYVkranpQWDFMSTVERGhI?=
 =?utf-8?B?TlVRWjl3WDArNkhJczlGZ0xSeXZoQjdCYVBEeG5PeUI4T3gwTGxIdTVqbDdT?=
 =?utf-8?B?cUNKN2pTRzEzK0hLcVFrVkU4Mk1hZ1ZxNzNKN2dBOWYrWFJNRlZBTzJLWTJN?=
 =?utf-8?B?LytNbTZYakdFemxuck5DZ2pQa2pQRk95aDNCVEt5Z2hWK1NCWGcra1VDZU9k?=
 =?utf-8?B?bkV0ZC8zZHdyMFlHVFY4N0RwaFlrdzViSEZFZ3BwTGxqRDdTcE9SYlFoeU5L?=
 =?utf-8?B?L1BDb0x5ZTRNQWkzZlFqK1RvRllXR29uVkk4eG96SDRpWGFLbnUyc2F3Vzdk?=
 =?utf-8?B?ZkgzVkRIcDRvZjhXbVYvSE5sV3J5RUxrWlZJYlNLSzdVMWg4cUdrYmlxbVRE?=
 =?utf-8?B?Y2N6TjZXTTNESjNSN2s2UFE1eGtmSTN1cStXcWgvNlpDbWwvZkJ4a3QxUWkx?=
 =?utf-8?B?WHZFamcyb0JLME9sN0RUUE5vWFpOMno5ZEx2M0tXYzc2L3FuRHBNbUtpQUNx?=
 =?utf-8?B?SGtlYnVSd0NDWVRENGlaVXh5eVgvK2ZlS25CU09PTmRDZzY0TWV4b2FxeEtw?=
 =?utf-8?B?QUJpbTBvVURiUzduRjlOOWNpZEk5VG12cmVoY3U5THFhYUovMGZ0UHZLSy9T?=
 =?utf-8?B?M1ZPbldCU0lCL1l0dGtJNVhacjgzd2hRaW9wZnVtK0wxNmhyNnJZY1BJS2Vu?=
 =?utf-8?B?c0wxS2hxV3NDZ0R5aEJDNWNqMVBCQ1hnNzg3VUhVUDVCa2tLWVhzMmNUYTJB?=
 =?utf-8?B?WHVHa0kvWHFhTEI3WVdINUtsbnY3SkJSYW9XalhaOVFLdkVxc3FRN1lDSUxz?=
 =?utf-8?B?VnFUUlRTQWhDbXNHRXB4MlRXSjhBc3VtQkpqWjlKRHRTZ0gxUzBuQTNrUEJi?=
 =?utf-8?B?THRnNEE4VVZNZ3ZQS3FsNXUwcytGRXE2bDVyYlBpa29TKzJwSnVoNlFMcUlw?=
 =?utf-8?B?dndXTVl3VkI3NDlmSWxUVjlnM3FsQ1FaY3dnVGY2V2dOUzhoZ3RoYXBhalFr?=
 =?utf-8?B?WVJ1UDNJU3Zzdm1GSXR6TVppRGNtZVlHUWhzYWxWMTB0VzZYaGhTL3J1TGYz?=
 =?utf-8?B?ZTNNQy9XYmIwQnZ6NmY1Q092MUZERzhad2hZK1Q2QXdERFFRQlNXWXNKUWlG?=
 =?utf-8?B?Ym5UVEVIUEJRT3FXemp1UVowalhzN3ZDSnFOdGFvU0RhVjg5VURTY0Jqb1lm?=
 =?utf-8?B?M3VwY2hrQkFiOG9wU1ZPUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(52116005)(7416005)(376005)(1800799015)(366007)(38350700005)(921011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OFJXV2MvS3RwbEJTMlVDc1hadk1mYUZJUm9kMlN6MWxpbUtGelN5U0pWYmhJ?=
 =?utf-8?B?bVpJbzE0SGNBWnQ4VkY0bzBIZEtXQjd2T3o2MUF1dkkvM25JdnlhWjF4cXNU?=
 =?utf-8?B?ekFucjlwc2ZxYVRGaWJ1TVFYR0FsSnR5L1grTjRYSy9ieExkYjM4VVJ2cnhU?=
 =?utf-8?B?b2xlOU9xQ2pjMFVxZ0JGdmZ1MzkraDYvbkV4YVB4ODU4aCtLSUhGTm9tNTM1?=
 =?utf-8?B?b2NyRmtvb3VwMm5BLzY0YXlhWnlTM3NpY3Zyb3lWaDkvcUpnRGdEaytYRENt?=
 =?utf-8?B?YklGZGdkdDBPczIvWGY4RGdEUzB6ZUF2aWZPaDZ0dm9oK3pOamgwcGNScnM3?=
 =?utf-8?B?UGcyRE9SZUhoNHhmY2tJR2huc0ljKzMyTFUyU3hIcHQvQWkrRnpCWVhGZGZ5?=
 =?utf-8?B?SDlOaThKNjYydlRIdGZZKzE4bEZFbnBUV1RObFU2R3MvQWluVHlQMG9ONDY2?=
 =?utf-8?B?SWhHQzhtY08vcDUrZXpqeXZoNEwydllUSFdTRG1xa0RlWVEzMUk4cFNmTFla?=
 =?utf-8?B?NDQ1dkNiZmdxSmN0bGlzK0hSYUZPWit4bElka01uTGFlQ3VPbEpLRlFxYllB?=
 =?utf-8?B?b2lIdkFGbC9LZGNJdUhpT1NIMkt5UmJmRGNQc0dyMWZMcmFHc2dQeFhuMFBr?=
 =?utf-8?B?TCszNXBaZXczTHNXb3RhYjQ5eHZPT1l1WnNXVWpybGdKYmNEdW9oak52OWo5?=
 =?utf-8?B?c2toM2E1Z0tpMXZpTXNkYWFlQmlXd0pYRW1ldzcvRXAwR2pRa2FocmdVaGsr?=
 =?utf-8?B?b3paVml0N00rL2dFN09FeTNqbHdEQlB4WDh3citjMEgxTDc4dUJ0Ykt4VmY4?=
 =?utf-8?B?RUgyd0lSUXk1K2xSWHBGemRCQUxiVFRqYVhVQkZHWTBQcWJZU21oYUdwMzk4?=
 =?utf-8?B?cy9sS1c0dFRxMmUrZ0N3dWpyYVFNVjlHRlRwWWxTbFNPZDE4M1VsR3I5bWVs?=
 =?utf-8?B?TVZlcmtMaWhpU2NHZ0IrKzIwcVZ4TDVDSzIxZ21pN1VBbTV4N1QyRnpkdTYz?=
 =?utf-8?B?VDIwLzZzSkJYSmtqUFJRZXd3QXU5WFIrMEtUSDRhQ2RmcTVhcDh0ODRFVmZT?=
 =?utf-8?B?bno5aDBtRlNJc0xJL2NEdkY1NkUrZ3RoVGN4SW55S3ZhRTZFV0NsOGhNTHRN?=
 =?utf-8?B?YS9CamIwalVQSXZWY25ENko2MndxZzQ5dmJRWnRFNFhCOUt4dmZiM2hUV1RF?=
 =?utf-8?B?K0NhSkJpaW45OWNGdVhtQWZCM1YxZFVDSHA1MzZTanBBU1k4RC9qQ3V4UGQx?=
 =?utf-8?B?UzRwNlBsaW1tbzExa0gwN2N6TCswcWZScWsrR3laQnZTejhZNG54YU1VMXl4?=
 =?utf-8?B?NjRFeERaQmF2bE4vTUh2ZCtZdE5BSnlZelhVem56dEx6SlJaeWljWG8rTy93?=
 =?utf-8?B?Q2U0NXBsU1JTMHBhSFZnSWtQYmlHYWl4cTlNVmVSbnd1cG9EeTNlYloxbmV6?=
 =?utf-8?B?WDRHMDJGeFV0Kyt5cW5zeHppRS9lUC9BZ3Q1aENvYjZLWHdBajFrdDViclpj?=
 =?utf-8?B?M21xcU5MOHFwNjM2RjA5VGpkTS9sc21DelN0N2F2V200Uzl3UFBMbXNoYzZB?=
 =?utf-8?B?TTUvSmluZDJ3ZVkzM1RidXk5c3AvNEFBUXdYVWdnVE9Md08wTWZIa1cxcXJ3?=
 =?utf-8?B?Q3pocHFYOUwrT24wMTRwQVFGemgxaGN3MXFDT2dja3pVU2JOOWdEc0dERXNJ?=
 =?utf-8?B?ZTJlb1JXR3VHNHBkcWNBWU0rSmF5Yi8vdDhVbmp1WnA0UXlqa293MXBDckt2?=
 =?utf-8?B?Mkw5M1h4RndsM3BTbEwyWVc2RzBGbmFsSUJya3UrRlU3ZEx2ZWdPM2MrMXZQ?=
 =?utf-8?B?cGFrQjlhMWJzUDhCenN6QnhzWGV3cGNZdVloTmQyOTZubzd5ZWErMkd5dGFW?=
 =?utf-8?B?RnlGcHdkR0pPN2h0UlNSQ3Vsdms4QWhqRE9BUCs1cThTWGhRNHdpV0p4MlFv?=
 =?utf-8?B?SXNvMU5Kdms0MkZiL2xER1E5TkRKaEVmWDhENWNUb005MFYxdDFHRU1vQkZP?=
 =?utf-8?B?ZEJiODB0ZG0zbW1FWVgxc2xRaFkrS05PaUxCc2VCWW5HNEJPbkVpUE4veUll?=
 =?utf-8?B?ODBUTUZicW8zSmxNcVhwZ210SEtKdnFUUm1DcjEzbnNPZEczN2JHQVRQUEJm?=
 =?utf-8?Q?flGCiE1iMzSEktcOEaBrvJCgZ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 826172fc-8f7a-47ae-4b44-08dc6c3c6988
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2024 13:16:30.5045
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vZZ7kr3dkSjhuW6rezuQjtYbweUoIm8juzVfBE1tlEK9WX76tRZQ7SkDKVhXwIHJQ/qGFmQ99JQhT5X1sU2CgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8633

From: Peng Fan <peng.fan@nxp.com>

Use scope based of_node_put() cleanup to simplify code.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/pinctrl/freescale/pinctrl-imx.c       | 25 +++++++------------------
 drivers/pinctrl/freescale/pinctrl-imx1-core.c | 16 +++++-----------
 drivers/pinctrl/freescale/pinctrl-mxs.c       | 14 ++++----------
 3 files changed, 16 insertions(+), 39 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
index 2d3d80921c0d..2b7448e3cd65 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx.c
@@ -580,7 +580,6 @@ static int imx_pinctrl_parse_functions(struct device_node *np,
 				       u32 index)
 {
 	struct pinctrl_dev *pctl = ipctl->pctl;
-	struct device_node *child;
 	struct function_desc *func;
 	struct group_desc *grp;
 	const char **group_names;
@@ -605,17 +604,15 @@ static int imx_pinctrl_parse_functions(struct device_node *np,
 	if (!group_names)
 		return -ENOMEM;
 	i = 0;
-	for_each_child_of_node(np, child)
+	for_each_child_of_node_scoped(np, child)
 		group_names[i++] = child->name;
 	func->group_names = group_names;
 
 	i = 0;
-	for_each_child_of_node(np, child) {
+	for_each_child_of_node_scoped(np, child) {
 		grp = devm_kzalloc(ipctl->dev, sizeof(*grp), GFP_KERNEL);
-		if (!grp) {
-			of_node_put(child);
+		if (!grp)
 			return -ENOMEM;
-		}
 
 		mutex_lock(&ipctl->mutex);
 		radix_tree_insert(&pctl->pin_group_tree,
@@ -635,21 +632,13 @@ static int imx_pinctrl_parse_functions(struct device_node *np,
  */
 static bool imx_pinctrl_dt_is_flat_functions(struct device_node *np)
 {
-	struct device_node *function_np;
-	struct device_node *pinctrl_np;
-
-	for_each_child_of_node(np, function_np) {
-		if (of_property_read_bool(function_np, "fsl,pins")) {
-			of_node_put(function_np);
+	for_each_child_of_node_scoped(np, function_np) {
+		if (of_property_read_bool(function_np, "fsl,pins"))
 			return true;
-		}
 
-		for_each_child_of_node(function_np, pinctrl_np) {
-			if (of_property_read_bool(pinctrl_np, "fsl,pins")) {
-				of_node_put(pinctrl_np);
-				of_node_put(function_np);
+		for_each_child_of_node_scoped(function_np, pinctrl_np) {
+			if (of_property_read_bool(pinctrl_np, "fsl,pins"))
 				return false;
-			}
 		}
 	}
 
diff --git a/drivers/pinctrl/freescale/pinctrl-imx1-core.c b/drivers/pinctrl/freescale/pinctrl-imx1-core.c
index 90c696046b38..af1ccfc90bff 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx1-core.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx1-core.c
@@ -508,7 +508,6 @@ static int imx1_pinctrl_parse_functions(struct device_node *np,
 				       struct imx1_pinctrl_soc_info *info,
 				       u32 index)
 {
-	struct device_node *child;
 	struct imx1_pmx_func *func;
 	struct imx1_pin_group *grp;
 	int ret;
@@ -531,14 +530,12 @@ static int imx1_pinctrl_parse_functions(struct device_node *np,
 	if (!func->groups)
 		return -ENOMEM;
 
-	for_each_child_of_node(np, child) {
+	for_each_child_of_node_scoped(np, child) {
 		func->groups[i] = child->name;
 		grp = &info->groups[grp_index++];
 		ret = imx1_pinctrl_parse_groups(child, grp, info, i++);
-		if (ret == -ENOMEM) {
-			of_node_put(child);
+		if (ret == -ENOMEM)
 			return ret;
-		}
 	}
 
 	return 0;
@@ -548,7 +545,6 @@ static int imx1_pinctrl_parse_dt(struct platform_device *pdev,
 		struct imx1_pinctrl *pctl, struct imx1_pinctrl_soc_info *info)
 {
 	struct device_node *np = pdev->dev.of_node;
-	struct device_node *child;
 	int ret;
 	u32 nfuncs = 0;
 	u32 ngroups = 0;
@@ -557,7 +553,7 @@ static int imx1_pinctrl_parse_dt(struct platform_device *pdev,
 	if (!np)
 		return -ENODEV;
 
-	for_each_child_of_node(np, child) {
+	for_each_child_of_node_scoped(np, child) {
 		++nfuncs;
 		ngroups += of_get_child_count(child);
 	}
@@ -579,12 +575,10 @@ static int imx1_pinctrl_parse_dt(struct platform_device *pdev,
 	if (!info->functions || !info->groups)
 		return -ENOMEM;
 
-	for_each_child_of_node(np, child) {
+	for_each_child_of_node_scoped(np, child) {
 		ret = imx1_pinctrl_parse_functions(child, info, ifunc++);
-		if (ret == -ENOMEM) {
-			of_node_put(child);
+		if (ret == -ENOMEM)
 			return -ENOMEM;
-		}
 	}
 
 	return 0;
diff --git a/drivers/pinctrl/freescale/pinctrl-mxs.c b/drivers/pinctrl/freescale/pinctrl-mxs.c
index e77311f26262..aee70fa55bec 100644
--- a/drivers/pinctrl/freescale/pinctrl-mxs.c
+++ b/drivers/pinctrl/freescale/pinctrl-mxs.c
@@ -490,16 +490,14 @@ static int mxs_pinctrl_probe_dt(struct platform_device *pdev,
 	/* Get groups for each function */
 	idxf = 0;
 	fn = fnull;
-	for_each_child_of_node(np, child) {
+	for_each_child_of_node_scoped(np, child) {
 		if (is_mxs_gpio(child))
 			continue;
 		if (of_property_read_u32(child, "reg", &val)) {
 			ret = mxs_pinctrl_parse_group(pdev, child,
 						      idxg++, NULL);
-			if (ret) {
-				of_node_put(child);
+			if (ret)
 				return ret;
-			}
 			continue;
 		}
 
@@ -509,19 +507,15 @@ static int mxs_pinctrl_probe_dt(struct platform_device *pdev,
 						 f->ngroups,
 						 sizeof(*f->groups),
 						 GFP_KERNEL);
-			if (!f->groups) {
-				of_node_put(child);
+			if (!f->groups)
 				return -ENOMEM;
-			}
 			fn = child->name;
 			i = 0;
 		}
 		ret = mxs_pinctrl_parse_group(pdev, child, idxg++,
 					      &f->groups[i++]);
-		if (ret) {
-			of_node_put(child);
+		if (ret)
 			return ret;
-		}
 	}
 
 	return 0;

-- 
2.37.1


