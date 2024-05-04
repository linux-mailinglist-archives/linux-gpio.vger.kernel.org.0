Return-Path: <linux-gpio+bounces-6089-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 069938BBBCC
	for <lists+linux-gpio@lfdr.de>; Sat,  4 May 2024 15:13:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2511CB2135C
	for <lists+linux-gpio@lfdr.de>; Sat,  4 May 2024 13:13:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68EF82D61B;
	Sat,  4 May 2024 13:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="gw5ShpcH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2088.outbound.protection.outlook.com [40.107.249.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF084A1C;
	Sat,  4 May 2024 13:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714828394; cv=fail; b=UcULIoxD5YwMTqQt+Eju6lQpD3vgU/zGXUW0LPqE66mP6PusIev1JDdKbgsF0kuLGGQPxsEyrNB3xFDuFnz7iNjJuO75YDwmicpS0NX5/ygPWiDxatOizViHUmW/bUQ7DG7RGrKKoVr6wF+QPuu0fxFc2npC4TGYDXN5OtSsB6k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714828394; c=relaxed/simple;
	bh=4kFV9K5wvGejwy+SJ2LKcCyxaJGa0mPSeiJjq47A74s=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=UJvRtmQtx+y61Kyhm2mj080YJFytnnb1lx6j54mPlAKk/KT16ywNeuB2B4AGpGzjHb2pYbUZyS057qpWLFQTrQr/Sn5mtTJQcdAWls9b7U6QiXYfXrk27LV3Yma2ixZvFSvpMSlWry4yfoO4G9hf78vVxL47j6A6CwiTV5VoGJM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=gw5ShpcH; arc=fail smtp.client-ip=40.107.249.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QcaVkUmsYsgy3hGwoc4viGWghmbmJckIyjk3VfgZyd0q9zykcuOT2r/Up0JHjRRSlaNiUuC+67e9b7cyrDO5Sz2n+Zq9fHPBwbDbbPjabh2l6lKIwGkgM8aOXyDbHdc+Mfi2osWQ3Rpvvl24REF5xLx2BB0BOW0q33p7alKyB1Rfxnf3s81JlFUP6NXETKywKjeLMO+InMLyLc7dnpetL+WqtcibgKLV8U3Yl/3IvsxbPEicFPN3udN1LbmkWnBMmEJv9pIxIT2Lee78Vnqd2W88RdVhcXjLJDphxU6nHBPxjil4fejb7CFw6k7VoxTt1jzzIGK5PZzt6Mo4uQMGYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TTUcWyDbCSVNKuwyH5CGkMM0CICuYlw4uOmY5Ln1Lww=;
 b=IzcjEHg3B++1mx9qN0aqRQmWrjGkJy1+oWQceAgzG+WmADqth92ecZ5z3vswxH5oEG+evbmIaZB6Y7z7HYBjdgChGEhQ5z6GJBGKt2Ad2BUtkbRr6CU9MCCs6s2VNUks/OZt4VUthFV/LMA7v/XlJRAl8SeIqd3saEd2Lzi+0ih1KJcw5wYLvxyCLaseo1sjcU2Us2OQLamOE6YOKy/ahK2+0silk14y1Vi97kfueW1MpJ1/iLQ4RuD8Uw6MXM6KIhVnBa54n7isYNvCVsDBOPZl6y++n3X9iiGDHqz1mzoxMxhysYITeUhO7n1c7NLB4LjKz2S2DyC2A6hTvmqrWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TTUcWyDbCSVNKuwyH5CGkMM0CICuYlw4uOmY5Ln1Lww=;
 b=gw5ShpcHbxX+/Xgfdkl6TAsvFPiMvIEC+Wi+Ae6nDPBN80+wYr5eN5N4wCs9HQdsZHVPCfURXlozR7QE89G8wt/kwGfWscEVp50pt1vIB1+dt1JzONplO4EaBHo6DN6kyJXhHSOlNQq/3TaVftMeT7o9rKj08S11oECy3aSVXqo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by PAXPR04MB8174.eurprd04.prod.outlook.com (2603:10a6:102:1c4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.39; Sat, 4 May
 2024 13:13:09 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d%4]) with mapi id 15.20.7544.036; Sat, 4 May 2024
 13:13:09 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Sat, 04 May 2024 21:20:01 +0800
Subject: [PATCH v2 03/20] pinctrl: stm32: Use scope based of_node_put()
 cleanups
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240504-pinctrl-cleanup-v2-3-26c5f2dc1181@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714828815; l=1139;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=ghhx4F825SMq6fS1o6/f7VxGij7/D0TVS3p3q5rW72o=;
 b=W1ebSmJCvWCOZPu9H9k2jOBBLmE4aP3UkbMAeH4VFsI8NvpmJKE1fTQkEzyogXFOCywZ9HGuZ
 t/i1shR6m/HAeYvAKPCXfhOd309a+7YyiU7qE5UF2EXObsv2UvI//bP
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
X-MS-Office365-Filtering-Correlation-Id: a58bc258-71c9-40e7-3d3b-08dc6c3bf1bc
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|376005|7416005|52116005|1800799015|366007|921011|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TmJmdjB3Q1FybWtGWi9IMkNxRmRQZ214UFhKY3FVdjI1NzhoOE4ySWZkUmps?=
 =?utf-8?B?NTZGTjkzNm9WVFVHOHdsVjM4Wlo4Zy9pbkhJZ0dFQS8vMHQ5SndJK0hwV0xM?=
 =?utf-8?B?Q1BMZVVQNTErVkV1R3Q1bXpxWTFlcXNUZHZqMkVFRGh1TEtuSzROcTdlVlR4?=
 =?utf-8?B?UHpQelFxampLYldBa2FESTd3NHRML0RRQUZtd1UwSkd0Uko1K2NTQXhyN0xG?=
 =?utf-8?B?V3ZOWFV1YlVRTjM3eXMxdjVkdWFnY3ZxRHZkQ1kzcmdndmI4Q3NYREhyTCtx?=
 =?utf-8?B?b3NmcnpuOUlkZDM4bDlmTXhWZkFzU3FsczN2cm5ueTZ3aGh1SHNKVWFXeXBp?=
 =?utf-8?B?cVc0dTVSZkFZNEtGcy9TaGpCazhGejk1eE8zNmRML21TZEZQZXhEK0xNSGVP?=
 =?utf-8?B?OHE0QVo4NFI5TmlvenI0UkVJbjdESElUMndka2NJU1IwbXcxSzZuWS8rRTUx?=
 =?utf-8?B?VmVPLzJsdFFENHhEL3hPK0J6K1FDbjBSTCsvZDN3U0dmL0dURDFRaG1mU0g0?=
 =?utf-8?B?bUVTZ0IzY1ZwOUNtSVNBZlNaczNuM0gyQmIvOSt1YmExd1p6YlRFMlBUS0Zs?=
 =?utf-8?B?UTFFS3ZyVm9KMUNPL293cGhRK2pQZHRMVjBkQ3BuZWlnVnQ0SFd3U0NKVHBM?=
 =?utf-8?B?Zm1nZWNjSkJmWGdzZ2NEZXdMQm5TNjlVMUYvMVJQdTYwQ1dBWlhWK2ZKV1Nq?=
 =?utf-8?B?ZG1XMVpRNWRDU2V4Si80SmhvV2Q2UlNmWjhCL2Rjcml0U0pmdVM2SE4yVTkr?=
 =?utf-8?B?c2traS9ubEozVWFNNHN6MWFIL29NZFlMcXFCaHhyTGRmbkhOc0NNRk5CRmJR?=
 =?utf-8?B?UUpWR1RYditIcFh4djFuK2J6SURDSy9LL3Z0bTNOOFArdmxuNjN6amlFQ2R0?=
 =?utf-8?B?cnM0L085TDZFL1BjQnFiRW14MVNOOFVDU3l1cTl2QkFRNHROT1hCbzhwRWhV?=
 =?utf-8?B?SjdLRjRwRHhnSEhsSnlVY3c4dUV5SFpwUkw5SS9LNXVmTVhNSTErS0pRUkMr?=
 =?utf-8?B?VW9Mdmh5clRmdU91M3Mwbko0RU4xa0x6OFpUV1RUTXdLYUorUlhURFpWd0ht?=
 =?utf-8?B?RmY0VU1BVGpwcCt1SER5Mnk2b1ZxRWhWb1V3elo4MmNadEJ4bG5IMHQrVjBx?=
 =?utf-8?B?T3FZNTIyZlFKd1Y3eHlUUnNXak54Y2NjbTdRWG9Rb3FyYVBHeVBsMmFYdE5H?=
 =?utf-8?B?eUZhTklwT3VxZE56R29oM1ZnaTU3U2JRLzAvbTlPa0pGVDhlQmhxRDZwZjRW?=
 =?utf-8?B?NXFTblpxNW1YVXpCNS9VZU5GZHl6dG9PeXE1SmtWbkU2MS9TT3Y2Q0xTUjdU?=
 =?utf-8?B?a3FNRHlDVGJsZ05tSHIwc21SblhESmxOOUVmRnNyMnV1NFhDVjl3bkpBY2s2?=
 =?utf-8?B?cXpRdHExa05HNGhUNFBiT3J2VThmUGNrcloxSDdoUERrQ240eUxKVC9wMUVI?=
 =?utf-8?B?TEJDV2h5bUZIN3ZrbFJVbStKV2tiaG1WRHcwKzVoWUFuNnBJdzV2RnJubWtK?=
 =?utf-8?B?dDA0N2tHTGp0dm56SkEycDZiZDk4RlVxQlhRZ01GM0VyMFhKV2tvM3J5eWZz?=
 =?utf-8?B?V3E2VkhqaE5BS3FKNG91WlpYUjgreW56akZ5a2F6SnFSWmFHaUYzQUhSZ21L?=
 =?utf-8?B?emZVbDJURkthTlVNeGZwckJSV1ZnN3Ixd3FaZmdYZ3pIRjUxeUFKVXBxZ2dR?=
 =?utf-8?B?MEh1MS9sQnRGczY1RXdTeVpwbkRGQjY0bzZxa2hSbXNJdUo0WmkyMmJxZzlq?=
 =?utf-8?B?RjFUWnZ4OWFFZU9LangzVnFNT2ZqL29UdjI3a0EreGMrUUVFcDdvQkF4RGFr?=
 =?utf-8?Q?K3rMim1vC7hFCSdyb2D8OiDcKzl0UYYCqO7Lg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(7416005)(52116005)(1800799015)(366007)(921011)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YW9IQ2oyRWt2ODBUZlZyam43aEpYZ0dmeFFqQ0FGTTYwQWxtUmhjVlU3OTVv?=
 =?utf-8?B?bUZNZHkyOUtBa1l4VEVsTzlEMWI0b3hzelhPaUhSbDZPTzRQaXJzSkdseGs0?=
 =?utf-8?B?WklwNnZkSm9jMTFvTkpud2plQytWL2wrTlhjbGUwNWc5SnFqUjVuWVdtNDRT?=
 =?utf-8?B?ak5ON0pzcnlQK25xZktwVjZjRlBSc3FzVUQ0aWVCY0QwelVPZ3gvWXV4MjRG?=
 =?utf-8?B?eE8xUGt3cE9iaHphaHBvRGJUYk9sSHRHQ1Ird2trTytQQUpYOUVCQkxrOHBR?=
 =?utf-8?B?WkNWcWtlNFRReGNHWWR6Ymp6bkhNRHBmUDlrRkY3dkYrdjJ3VHJIZWVFb1pJ?=
 =?utf-8?B?ZUs2dmIzMEY0ejk2NmdXWGthLzBtdVYwaFNWZnJ5bzk3UTRuVm54ZHdhQ0pQ?=
 =?utf-8?B?c3EwZHRhMTFJYjB0RTZXbllxOHEyeU5BblJiKzRZMWgzbG1HUWozb3pPdm53?=
 =?utf-8?B?ZFArNk5BZnExS21wd21rMkgweVova3JUck5zVTBJVnlaTFJlMDJjMFRaN2lL?=
 =?utf-8?B?d0lrbUpIOE1vemNjaVQ5MmhWWXFWYVEyOWd4QUY1TXZqTnh6bEppZlVIOFRY?=
 =?utf-8?B?dUtoM1owOE5XWHZwYkRLSEV6dHh3TFVKa1pXYTUxTHk3cGtxUW1KVlFvbTl4?=
 =?utf-8?B?T0NkOU50VFZ0SzBBcnNZTXBocDN3aVRGeUJVUTZCT1dNZktxSVVpdmY5a2R3?=
 =?utf-8?B?ZFFZcDFuVDhDcFZpOGh1cCs4QWFvZGNQQWp6WmMxekNEUkpUVXVOS2RoaTZ5?=
 =?utf-8?B?cXdudFJsRDYzRGRScFdvcGpMSHM2RFo1TFJ6VEZFbXhJMDhqMFQ2M050S2Ew?=
 =?utf-8?B?RlUzekdSRjFvcjhDVGJ1Z0dYelBRUEZ2YjhDaVJCYWV3N1ZBUkZBZkJMUmQv?=
 =?utf-8?B?bnBWNnd6WGpTOVIyWm0rWG1CdXBHUDJqQWpKZXhxcVVuUlJIeWx1WlRsc0hM?=
 =?utf-8?B?STk4bU80SXpPL0w5SnNqV281RU1HTVR4QVV4UXZMeWNLdnpqYmFka29kclhP?=
 =?utf-8?B?cHFBaGU2NjFuUDlkYU15UlZkbTlUM0FlcXI0eHVXRUkzSXlEcHJxMEdVUytJ?=
 =?utf-8?B?RTd0SzFDbXpZcVJUQUh0ZkpjaWtENkdMMEw4WS9TL3hrTHNicnJZUUlhWmtK?=
 =?utf-8?B?TzBLb1QrMlZlbVA0YXROTnlNRmhqSEIxWkhGcFEyeDUwMUZUdkNoeDBrK2xL?=
 =?utf-8?B?WjFsbmJzTEYyWkRZT3dlUmR4OUw2WWQ0SXNhUk8rNmczSFJwajZjcXlSWXNm?=
 =?utf-8?B?b1VvQURpZ0h2R2JkRFlIaStkWUR4Yms5RFRwaEFYMndMZ2tOVHB5WmQ2YVA4?=
 =?utf-8?B?TGxEMmpDcFFMSkd3Y3NHOEJVeFFUaFRQNVVCY0tZQTRKR2ZTYS90VW4ydkMz?=
 =?utf-8?B?SU5rTWo1THUrRmhXSmNSZFByekllbU9tVnBwRHp2WXltaWMwSlRPd2UxaURk?=
 =?utf-8?B?cTN0SlgvTUhreVlMZWMrQWM1WkpsU0IrL0UzelNqT3hNUjRmMHVSK2NreHhY?=
 =?utf-8?B?T0Q3aVg0QzNHYklBdXBOckN4SXNVeU5LYzRBZExjZGlrL2k5cTFxV3ZPdmE4?=
 =?utf-8?B?ZlZWaTUyTXpRSXdTWlZ3RHYwRlJFQ2RiWHkrbjcwdnRwdmZjNmRNd1RPUEFq?=
 =?utf-8?B?KzF3S2I4cWtzUHM1ZFhnRTFWQ0xrRnRKNWYzU2twN3JyRWxCeDM2VGJyTitI?=
 =?utf-8?B?amx1TzE0UFZYUjVJZ2kvVHRQN2s3UWh1VU51YzBaZ1diR1BQRXNUbEFGdU1u?=
 =?utf-8?B?UHNtaW1SMFFYeEhsRjFDUHVzdWRhOHFoVWtqajBoa3Z3M0hpMEw5MzlZZUtn?=
 =?utf-8?B?Q01Da0NjMUlwY080TmkxUjYyL3JybVhHc2hGbk51R0FqaVhsdnpoWFM0Z3Jq?=
 =?utf-8?B?WmpoWmRHQjMvV1N4S1pnczlaWlVEamJSNW91bjNxYzdhajB0aWFkSlRZSEx2?=
 =?utf-8?B?OUd3cnhnYzBTUjN5TUt6QXliWVFyK2FPVWZSemRrRk5aZGtOc2IxWjBscFk0?=
 =?utf-8?B?YWlMMlFjeHJaZURNRFBGc3FRcmNmUVhPT1g2OUZJQThveDJZU0w5TVFnZTBm?=
 =?utf-8?B?MW0zeGQxV3FHTFI4RDBGTE9vRmMyNXFLYUN4YmJhWkhpSGxEZVhrMWtJakRj?=
 =?utf-8?Q?7I8k0iQt/fuoDXWeOlrrSOcjX?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a58bc258-71c9-40e7-3d3b-08dc6c3bf1bc
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2024 13:13:09.5321
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J1GjQsq3v29c4m3/YXAs6Ektsn5bDk3jJgwDKomPp3mvw04yndm2r8RYRPJ3nySNDMLJSkoCImINANayGJ8DNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8174

From: Peng Fan <peng.fan@nxp.com>

Use scope based of_node_put() cleanup to simplify code.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/pinctrl/stm32/pinctrl-stm32.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index 978ccdbaf3d3..a8673739871d 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -670,7 +670,6 @@ static int stm32_pctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 				 struct device_node *np_config,
 				 struct pinctrl_map **map, unsigned *num_maps)
 {
-	struct device_node *np;
 	unsigned reserved_maps;
 	int ret;
 
@@ -678,12 +677,11 @@ static int stm32_pctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 	*num_maps = 0;
 	reserved_maps = 0;
 
-	for_each_child_of_node(np_config, np) {
+	for_each_child_of_node_scoped(np_config, np) {
 		ret = stm32_pctrl_dt_subnode_to_map(pctldev, np, map,
 				&reserved_maps, num_maps);
 		if (ret < 0) {
 			pinctrl_utils_free_map(pctldev, *map, *num_maps);
-			of_node_put(np);
 			return ret;
 		}
 	}

-- 
2.37.1


