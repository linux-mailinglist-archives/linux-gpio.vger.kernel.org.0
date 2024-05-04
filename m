Return-Path: <linux-gpio+bounces-6088-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D53CF8BBBC4
	for <lists+linux-gpio@lfdr.de>; Sat,  4 May 2024 15:13:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4D7F01F21E13
	for <lists+linux-gpio@lfdr.de>; Sat,  4 May 2024 13:13:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92BD42D058;
	Sat,  4 May 2024 13:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="V349u3hI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2083.outbound.protection.outlook.com [40.107.249.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE2B4A1C;
	Sat,  4 May 2024 13:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714828377; cv=fail; b=Kg6++inJDR5ulm8dMxW4kBW1az63A864OB8IPbH66Iokt+oOnKS3RrQMYgqpmEkQMxyOJq+SnEycY9K8fHqJJpuZ6fPiHGhpn8FwwALXMlgjtuyk7S6s9bmAXFpybSVAXzJb4Ny1Pdpe4rKzrjbO+IlvqOOJrrnMh2uz7TFNk/I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714828377; c=relaxed/simple;
	bh=O584+LvuF4pyN3SkcooP3Ifi0UGy7KBPUUWirXlIAaY=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=R/dx8IkvkYAlMaHqmWB9omBNWhl/QC37Ta6rgLKap/R3IM2MR67r21shHESFNlIbgzdBgsYp+4hP/bbLEtSi41Oyw4i8EbQ9/a3VE3FO/pahW+Bo/VrOXwu9Aa9UZLlNosRJK5CsyYbJ3CDDP4nMteno1LzglHpTLvX5JsDSBPU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=V349u3hI; arc=fail smtp.client-ip=40.107.249.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PsBZCp9Q2DoZaI+7hZlpN4AV3qyDi6yk7j7xxI7aGPT+2QAuqBU8BWUZRtyjv5ta58Tjp0X17Pj4FUsFIUhwx6616LxpbEML5R1Ge0fKCdWbw8EiidXONIprB2Xp01fjzqw20PD/0PwOIvndEJM96+EMEmTohkJ1lWum4EBeydMmKGozTV4yYBXpD5+8N9JKmqqkt7bbmuA0ZA5si/2/imZivs5R8QM/eyZf5o/7FJahC7Ymfg5h8X6hAcOHR7+YWkS0MBYx2zi0C9eorle4yqBpsSs8nmrYHAVjEjwPJmNjk5roVvDrL6UfzL/+YfLoASCQ4gI7MUA8tV55yPaq8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9XH/O68wWJ/FfHgYL+Kkys96wwEpB5Ik6VZZUTwb4Mw=;
 b=TWncYo9doring7vInD062OrPa8mLEYYPnQHCKdGMbQ4nwgay/lYItCeIzbuggHKlNeECzTvi9foYcxGeNknjR9IKymosX2iGWN8xXy73U3+Vu9K3QAQiGswibNii9Q+Nl4hSw08IndO6k0s9Op6HkrTJGjGDRKJQ+kZyhkic4EtI1aecDrvzQqv0Fb4bjZNBMkaGuyfL7i+MInmsqksnhJ3OvHNDCCSWhMVtfLv0/T5HM7BX5LNVZ+2yeTLknS21cBk39N0cqWvodUUDth9uBOxs+94yeIjQDuL8vdtdoGxjSDbkekeqyB4bs6/uNcq6ToVOHx3LjaWqiIvORVZd3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9XH/O68wWJ/FfHgYL+Kkys96wwEpB5Ik6VZZUTwb4Mw=;
 b=V349u3hIj3jx8cbwqgkcfFeYcAviXPW4lFmxDNc1jpRnCj3N2UqV3+1FNPMZisxIMljtshFftZvf9/CqPZF/gwdakXv3n++Lu4Sy9MydaP1a/VvfeQHrAQFT2+jWoV4WSZYvwvdlm+9h7N/D5atkTpy3EcMi0t+yX1XnvLDWNo8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by PAXPR04MB8174.eurprd04.prod.outlook.com (2603:10a6:102:1c4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.39; Sat, 4 May
 2024 13:12:52 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d%4]) with mapi id 15.20.7544.036; Sat, 4 May 2024
 13:12:52 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Sat, 04 May 2024 21:20:00 +0800
Subject: [PATCH v2 02/20] pinctrl: tegra: Use scope based of_node_put()
 cleanups
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240504-pinctrl-cleanup-v2-2-26c5f2dc1181@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714828815; l=1919;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=dgr9gEpDJDvikxHa9ZakH2O4ug/ULsl0qx1MCE8QJXg=;
 b=c29ur0xozBQHWw4UNa1DPvMPB/3nv84hzDNq2CwMxaS5GG6IYyoT0/JK1IrVkkQRteonbSNKJ
 JhK2UeiCgPTAeUzI40ur2LqqsCNKyNGdObHFdFgxDDw3tA05J72cW0s
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
X-MS-TrafficTypeDiagnostic: DU0PR04MB9417:EE_|PAXPR04MB8174:EE_
X-MS-Office365-Filtering-Correlation-Id: 567fafd5-b163-4390-58c8-08dc6c3be7cc
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|376005|7416005|52116005|1800799015|366007|921011|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eWFCYUFwMG4vWGFpQ0xWbU5MS1R6STQ3V0xVSWhuSDgyUUZ2WTRUd09zajhl?=
 =?utf-8?B?anNJa2wydXY4SWxKamxLMzdBemQ4a3UrZG4rWVZiYktRZmNDNENBNzdwQTRZ?=
 =?utf-8?B?aGdkeFdPdHEvaGRPdWVrNGhCeTB5dXBiSi81cm9ueTh1QjNoYnBIVVZMZ1NN?=
 =?utf-8?B?R09EamtuYmZCUVlyTVFIZE92VUlGSEtBalBvaTBmdU05TTNJdUpEd1JuRGZH?=
 =?utf-8?B?cFVXVlprQS9kdDR6RndjZ2RGWlpPYlo1bWtJbS9UeHpIbzU1aXV1c29DeE5V?=
 =?utf-8?B?NUI3YzhPSVVWb3QvU1BqV0t6RFB1T2pnMVZ5KyswajlJK3paYjFHR2dFMlVa?=
 =?utf-8?B?dUxhaitxMXU1T252OTRWN1p0K2txVllhYU9ZY01rcG5MbUZxQ3pyTjg1UjhL?=
 =?utf-8?B?RzVoMFJDalhmMHdYbFNZb2Q5d2pNMVZ2RFdVdS80MHZyQmFxN2hwS3J6Z0NM?=
 =?utf-8?B?K0owaFAyMURyL2tScEdJWDZ6RldPZzdIcnF6VHpXcU1nNE9WbzFiWFlIcG5l?=
 =?utf-8?B?WldOV3cvWmowQTNaMVlhVnJ3b09MWC9XVGJtK2tCTkcxUDRHTTBpMEZVdzY0?=
 =?utf-8?B?dDFrNU9GczFRTE5FZ3JjTms5ek5NbVhVVG52SWY0cEJtNWoxSmZlUDBMeURI?=
 =?utf-8?B?UDgyOFNSckJITmo2MzNRd1hjSHFDVWZLb2l2Ly9zeVZXeFJxU1JIK24wcXd0?=
 =?utf-8?B?eUNhbEZuN3RIaC8xRTFnZ1hwc05mVk1oQ0JnUGdaMUpMd2xNU3NqcFk5Q0J4?=
 =?utf-8?B?YUJVWVJXa0wrVDdoNFhhQXIwa1dPUFNPNVJOUVB5MDhoclRjTkNyY0RvcnZP?=
 =?utf-8?B?TXU5ZnhsZjNjZVpqUi9JNzNtL0pFcFhYWnNqVW1GNUZQbEhxR092WU1DWUto?=
 =?utf-8?B?dUoxcnEvNzN2RU9oNXd3R0NVekYxZVNEU0NPZ3cra1RQY1hSSkVmREl3MGU4?=
 =?utf-8?B?ZTNvZzFraUJRVUlIU1lxanYwcWJ2Rjh6WHcydDI2MU4xQkYwc3FoVTU1OGdp?=
 =?utf-8?B?SXlhdHY3cndoMGgvM1NxYmlDZUdTYjZyN3FtMVdIYjhzanVZZjgwU1dLRjU5?=
 =?utf-8?B?KzJYVm5BRkxacG4yTjBkRXh0SHJra0p0M01GZ0pWMnFtZ0YxakUvNlZnTkNT?=
 =?utf-8?B?TStBVk1QbTQ2bE5sa052VS8yUVNQQzhRdE8vMlppVHFyZGFKRkNoR1BQWTAv?=
 =?utf-8?B?TzFpOXJqRysxOGVlY2NLTG1FQVZuVi9lZGFjbGNlWVppVk5OdTZRUmJNZTN5?=
 =?utf-8?B?KzVibk8xL3V5bVdqbjVYV2ZMbnlvc0Q3NjJGWVpYQUg5UHV2S2phZENMVnM0?=
 =?utf-8?B?UEJoZkJreTJvY1dkSkQwV2pMeU9LbHc4TXkrcGJKdXF4dHFCbU92bVJ4ZFN5?=
 =?utf-8?B?N2xSSmkwWEdRMWEyb29qbUF5YkxrZk04RG9YcEVhOTN4NU5rY2tzTCszOXY1?=
 =?utf-8?B?Tlk0N0VaS1FLd0hYczZ6b3NadEJ1OCsrWVN6V05HOFNxa0tPWld1OElndjho?=
 =?utf-8?B?azV6cmtWVktMUzY5R21QU3RTTzQxQWRVNVBnM0MyLzRpZXRzSWV5VGVobDlZ?=
 =?utf-8?B?SnVqUWJKN1RYK2Vza2ZGWCtnL3ZIQjk0UytFNThSRWVpc3FlTCt4WnNvSlhY?=
 =?utf-8?B?RldlOTBJQm5ERVVab0xndjllTEFMbjgrclkxVkU2VEN3ajAzU25lOGJTbytN?=
 =?utf-8?B?cmt1MzdtYVdUNUhVdkIzN1lPZDM3VXptemdMdGJVd1RXait2Q2N4MmgrWW95?=
 =?utf-8?B?ZWV0R1FGMG96UDBibThoSnl2ZUJTdnVwVnI0QzNjOE8wanBPaHFLM3lpSFN3?=
 =?utf-8?Q?Jz9zlJ2KTyW+xF7/VV/sgvG4n/64eu/1Yot4I=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(7416005)(52116005)(1800799015)(366007)(921011)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a1h1TDRUL28wRGlVYXFUME9qaGRPcjg3NjdJZ01IUzREK2M2TWxiKzVRM0lC?=
 =?utf-8?B?YjBDUnpQTEo3NjJHZGZtVU9YbklNQkFHMjk3bjZXV0tBMnZPcEMzY2pIcTEz?=
 =?utf-8?B?Q0lnN2ZsMG1OcXNLZjRyZTllaTllUmZVUVBUYnNHN3BQN2RCZzJmaG9nWGVl?=
 =?utf-8?B?NzJPdmNrY2Fid0N3SzRQWUxLSGVmTEJCU2F5NmtlUVRQUnF3MG9BMWFwOEd3?=
 =?utf-8?B?TTZkamdWYW5KMlpOejBTaWVIRktiWFd0dnpCQVgxZ2hGQW9nYmVJb3NQbTNo?=
 =?utf-8?B?SlJ5dlJJRlJrUlJ1UksvWHdJbmlIeUtwSGg0MnltSVRaSWwvZUtlOXJBSjJU?=
 =?utf-8?B?Tk9nek9NUnpVMHhwR3l2Y0ZzTWdUdWo3c0V3bnZZWmZnUVp6MlpRbzBMM2Q1?=
 =?utf-8?B?bmc4akdQbW1RR3BMTWNOQ0N2WW13aVJCdXkrVEE4alE2NTJhc0s2KzZCR3ZR?=
 =?utf-8?B?WU1scXovSk94ejZDT2h2bDdMbVA1Z1F2RElVR2JQQVk3S0pER2lzdmhjY1ZJ?=
 =?utf-8?B?YnZLdXJJdE5EQmQzaXhmNWlEWkp1MjlRV0I1NkJWcGpaMERsRllvUG1qS0Fx?=
 =?utf-8?B?elQxa0w1bE1xZ2RveHQ1aUhLRVNjYTFHOHdLUnR2Zm9MbDhxeEtUVVRrVnU5?=
 =?utf-8?B?bnZVRUVNeENsbU80MWlUdVZoZ2Y0OHFwRXlZVHdpRUtOajFtcG1HV2tRUXBR?=
 =?utf-8?B?YVpGRWJhV0Q4NmJvQUxIT214ckpGVkpsL294RnVMRkNBcy9EOVlaNUxFQk5l?=
 =?utf-8?B?ejlNLzVSWEZSUkJnUGEwRHFMd1pOTCsvZlJlVUhobklxNkFRaUp6Y3pWcTRL?=
 =?utf-8?B?T0J3Y1docDU2Wm5lcVZoQml2OFgvazR0cWd0NU9lempwd1RIYmtYK0dUVWtw?=
 =?utf-8?B?V2hIMk53UUt1S0srT085TDJDVmYzNFdzWmVCbjc3cFhTalRjQnFCc2tnUEl1?=
 =?utf-8?B?TlVLeGo3NllGQk8wV29oRXNzZ1dnWGpTKzFnN3lCU25ZeWNXMnIxelVUVkNl?=
 =?utf-8?B?TzA5NHp4c3ltNHNPYjA5YWMyempzM0VMQmxhamtHMHRma3JOQm54QzBzeHho?=
 =?utf-8?B?L1pBRzR5YXpFNmQ2S2dtVW5HMlBnVkFkbEZBUG5zSDBzV1JXKzhYd2NoL1hG?=
 =?utf-8?B?SElXMUhtRmd3YmN6Yy9HQ0xUMFNKNkgxbFBuVFIzSG5kYkNkdDZDM0lBRWth?=
 =?utf-8?B?UWdzRjl4NHNxS3U3dFVIRFVpQUZ5RVNYeGNUNlNyTG9UcE4xdERpU0V4Um83?=
 =?utf-8?B?VXduSW94ZXFBQVNrazZuVUdGZDVZOEpNbjRYcndESCsyVk9iSGhTeXl6VDBU?=
 =?utf-8?B?cGJlQTZvb2ZSREovc0J1ZWFTMEpSSk10dHZKSmF0VzVJVlFFekpLMVRWajVa?=
 =?utf-8?B?YkphdHhOOWU2MXNBaE1PL3dwdGdHQVBKd1VTTEpMN0ZFcWVRWEgrWEJ6M1JQ?=
 =?utf-8?B?blVDdlY1N29xKzgyelFuWXhlK2NKdE8wandRSy9VdDZZVG9MS1BVWXRORlRy?=
 =?utf-8?B?OE5mMURvU2gwWmVKSHJjY3EvUkdBMDhCQWNvdTJnUVV3RkdyTmxKdDlSTWpx?=
 =?utf-8?B?ckszbGZ4WmlXOGxkQnhHaGlVVzJvVGxja25TYUVDKy83VkhxOUh4T0xWQUlU?=
 =?utf-8?B?NC9xdStKMWhzUmw5K3lreWVuc1h4YmRpREtzYUdrYU1lbWJiWmFlcjE2a3lU?=
 =?utf-8?B?ellOUUVIREZndjg3K2RWblpDTUJIWWhMQjlMbUtYWUdIUE11dmtJM2Y5SlVr?=
 =?utf-8?B?S1FISkYxZjF0YlV3UUQyQ2U1czRUSDdCZzhCdjE3TkN2UXN6M21DMmhCY1Zj?=
 =?utf-8?B?N2tTc3pTL284a0tTR0RwYmZmY0tlUmdiRTc3WXBCVnB1MXcxQXlhaHprc3Jk?=
 =?utf-8?B?ZGF5N3FPU3BqdTU1blhsSHdiMkdudTZhcW1IVVMyUnVtQitIenM4bmZLZzZF?=
 =?utf-8?B?MDJueGJTRjRxbGNqVUVsblZ2enI0UjJBSmxvZ2lNR0dFYlFJZTI0dzZsVlZv?=
 =?utf-8?B?VTFPNUFWRXJoYUVlQ1NSRmJzSERVNnFINS83OURvZ2JyWTdzS1lLdlZoSCti?=
 =?utf-8?B?QU03ZE5xYXNGeWNaeG1LN0pLQTB2ZndVSHZFK0JZNFN4ZWRFYnpDYmlpUTE4?=
 =?utf-8?Q?yHAQlzlKBuX+yVMuGIUrVeoC+?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 567fafd5-b163-4390-58c8-08dc6c3be7cc
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2024 13:12:52.8610
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4sy0/+akhGM1b/xMzo7AidLZmxf7iqXZJ2mOFSl12FWS2ISjCqiAQ+I1mwlX0irAQsix20v/1FTiNUyCDxWpQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8174

From: Peng Fan <peng.fan@nxp.com>

Use scope based of_node_put() cleanup to simplify code.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/pinctrl/tegra/pinctrl-tegra-xusb.c | 7 ++-----
 drivers/pinctrl/tegra/pinctrl-tegra.c      | 4 +---
 2 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c b/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
index 96ef57a7d385..49c5edeba87f 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
@@ -238,20 +238,17 @@ static int tegra_xusb_padctl_dt_node_to_map(struct pinctrl_dev *pinctrl,
 {
 	struct tegra_xusb_padctl *padctl = pinctrl_dev_get_drvdata(pinctrl);
 	unsigned int reserved_maps = 0;
-	struct device_node *np;
 	int err;
 
 	*num_maps = 0;
 	*maps = NULL;
 
-	for_each_child_of_node(parent, np) {
+	for_each_child_of_node_scoped(parent, np) {
 		err = tegra_xusb_padctl_parse_subnode(padctl, np, maps,
 						      &reserved_maps,
 						      num_maps);
-		if (err < 0) {
-			of_node_put(np);
+		if (err < 0)
 			return err;
-		}
 	}
 
 	return 0;
diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c b/drivers/pinctrl/tegra/pinctrl-tegra.c
index ccfa3870a67d..c83e5a65e680 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
@@ -188,20 +188,18 @@ static int tegra_pinctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 					unsigned *num_maps)
 {
 	unsigned reserved_maps;
-	struct device_node *np;
 	int ret;
 
 	reserved_maps = 0;
 	*map = NULL;
 	*num_maps = 0;
 
-	for_each_child_of_node(np_config, np) {
+	for_each_child_of_node_scoped(np_config, np) {
 		ret = tegra_pinctrl_dt_subnode_to_map(pctldev, np, map,
 						      &reserved_maps, num_maps);
 		if (ret < 0) {
 			pinctrl_utils_free_map(pctldev, *map,
 				*num_maps);
-			of_node_put(np);
 			return ret;
 		}
 	}

-- 
2.37.1


