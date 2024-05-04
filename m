Return-Path: <linux-gpio+bounces-6087-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD528BBBBE
	for <lists+linux-gpio@lfdr.de>; Sat,  4 May 2024 15:12:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A9D781F22055
	for <lists+linux-gpio@lfdr.de>; Sat,  4 May 2024 13:12:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76DC32C190;
	Sat,  4 May 2024 13:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="RfoqmVxx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2053.outbound.protection.outlook.com [40.107.249.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 200DF37152;
	Sat,  4 May 2024 13:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714828362; cv=fail; b=ue1H/68hQN7nZMcBhOYDv8soRpYjUQODBA0M8XXO010cmMJH7t3Pqt0g4b6OsXZXcTZ5ZS5JgxrJjyUakkJ3rolXUNA266WU3YT8Ilkk6JrtB23FKO5tQofnXkiXBjcNtIRkbXQLDHvT6/o+ttsSiNl9F+JenlM9ehX62XmJfK4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714828362; c=relaxed/simple;
	bh=Ou336TSEbTPCZ/WIqf3NpyjX9m5zSkYnk3ABqYz5TbQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Gq+EE5qRY9MfEawTXmHlDXYoWFvtPaeheyXgGzf82ctNzPYIgpZizoY0LfVj11r6IHggwjhjKgAmGswgyrnG+KLH8G3txDj9Q6y6EFVukeDbvRBxRaXR3vn1pCPyDSbuVtSc0gJrKFRB3LEhbdNbT2Vahh4dcSv8HVVWURElFEw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=RfoqmVxx; arc=fail smtp.client-ip=40.107.249.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UY7zlqxIQP4a0lCG19cd/h/eNk91MNW0MPe2ZEXbWeyKbOaQb3KGvf+59/GdrNKFsxHVxzxCb8V/Uf8FFYwBhH72xdJt3sChpofEmxkvAU0N9nkKXFTAiYKdKRFY/lDnzSv8apboekGYxPCa+idf62VEcif6Q6Sv40hsseNFLIsv6rz1I9ThFq/VLbo3jRCPyvocKVoVML/vKG8qI16hjeMHZi37KTC5SnTUsm8CUKCaVK21GYukGewBH3fWeKOxwrYaupy8yeZfm8Y4UQgxqB/Io5T2DLEk7APtUhnhlBi4ZeMMIkcTGwiBBZmVA7OLS/bhiHOELARH0HLvUgMqTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xnIztDwVNRck+xwGiauHd7SjHMFdl2QwKvaMCCPUiQU=;
 b=Cu6szOifWb8hjTpJcCl9o60zOxpU4DqihhS1IgLtrb8MeKVL61qmqkcltBXvJkxymIqirKaLM2HrK/740AOdGsNFKcxym0ykdWiuWjmz1HkRP1TeXAc8qdMsU+HYz2b7aKeNv1enyUAi2O5qXAir+uqujEdjcCqtC3eo7W4+PhvptLogY5BPAo3FuHHW/HXhSLlx9g6ZPcD9rYCqnS0W+g/7I3iTmAGj3648emQmGGz6xJ509iWd8qNkVCE7pQIskG35c1YYkLcEu5tgkz5BqNQzGbCU2QjKMkzDbM7yam4yc+fAvykWNg67LsrpXIbJr7EDf6+K0Lf+Tr299b2ieA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xnIztDwVNRck+xwGiauHd7SjHMFdl2QwKvaMCCPUiQU=;
 b=RfoqmVxxKBchWsVMFsNGvdIgaX2urC6JZngbr5PBYllS2QiW+z2o7qS27p7FAN5YMpeaCiCi3gULtNf/zGv2vLc0YleCQvEoYO/xVFSZ3yKQb10r5mTJTEcprkBnZNntcov4lTcYOcRk6MmNLjbsHz86gh7c2WQZYn+bTsX1Qlg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by PAXPR04MB8174.eurprd04.prod.outlook.com (2603:10a6:102:1c4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.39; Sat, 4 May
 2024 13:12:36 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d%4]) with mapi id 15.20.7544.036; Sat, 4 May 2024
 13:12:36 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Sat, 04 May 2024 21:19:59 +0800
Subject: [PATCH v2 01/20] pinctrl: ti: iodelay: Use scope based
 of_node_put() cleanups
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240504-pinctrl-cleanup-v2-1-26c5f2dc1181@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714828815; l=2712;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=+OvVNjQ9hEJHGX2TTZXWfIPqFH/ASaiGPFRoyyD86ck=;
 b=wBwz78+ulysi78J8qrvqUz4DHAoNLDZSQ8dx1MUycl0AKWDH3Hh6flSWohonDhSJYkPD4nSLU
 q4z3mqBYnq9AJZKYQSF9Qw0Mfn/LYZD8v5fhhR/sN5iLqcismO0zG9m
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
X-MS-Office365-Filtering-Correlation-Id: 3a386a51-db17-41ce-fd86-08dc6c3bddc0
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|376005|7416005|52116005|1800799015|366007|921011|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eWxyR2p1SUpQcWxrc3l1bXVsWVRrdjc0bHpzQjJDMzNTNFZSRGRLTDljcjlL?=
 =?utf-8?B?QnJ0bVVzWUlRdmtad3ZzWUlCN3EwWk90Ni9VUkp2QXdNN3E3T0NDY1dESUEv?=
 =?utf-8?B?TFdsTFlRaVVFTHBZS0xQa1h1MFpBMFZHK1VxWGNYRURLanR4YkNseUpxZjM0?=
 =?utf-8?B?cXhyczFDdW05YjM0QmI3cTR6NGsvQ3RQcmZpMi9nZXVNbTRBZGQwZmpHQ0lZ?=
 =?utf-8?B?U0lwS25GNXQ4RzZIQ3BPWFBvMk1iZk56ejdDb1pHYS9lUEZhYVFFdjBlWUFO?=
 =?utf-8?B?a1FPTk1UT29mWDdFaVdHU3k0REZDdmpxTS9jRkNGdkNUa1puMFlNdkVtUk1Q?=
 =?utf-8?B?SDVwSE5pTTBqRGNmMk5xQXhVNFd1UkFrUE1hUTEzR3NZZEcyZFlXa2lMSk82?=
 =?utf-8?B?UW5UWmNuTy9sNHp3MDBVYzVJdjF5ZDBXN0NFMDQyOHBUWkxFR2RaQUZrYVJy?=
 =?utf-8?B?OUJnSjM2SnpCSkgvTHc4dTFqM3ZRazhHbzNSeG50UnlWeFJKUVFNRTJ6eWlz?=
 =?utf-8?B?bXBHckFKSGdWWUhRbEtHcGQwelM1MTFLWHA2NVlJaTJ1NkYxeTRKeUg4Vmdi?=
 =?utf-8?B?bmwyNUFXUjhXY0h4ZEpsWThTZkgxeCs1N0ZFZ2FTRDBucW5OUjZZYkY3eVZz?=
 =?utf-8?B?WlJ6Rk5wVkUwSGlacTZqTkQrQVptUThoQlhlSzB6dUtud2xvUktSdW05eVhy?=
 =?utf-8?B?dTN0TkRBdzJyK2YvbnlxUjBFNnJ1Nk9WTzV5bDBISWZNRUl2dDhUOVBqWldP?=
 =?utf-8?B?aTVRUW5vT0FBekhMcjBJN09EME5TaVhCb1htUzJhNUNvY1B4QjZKSmJZS0Vq?=
 =?utf-8?B?WXN3QjhYY3pGN3owcGp0SzZVbXB1SFo5NXdFMzVxem1oVzVNNHNWaTFiSko4?=
 =?utf-8?B?MEFPUklBRzYwajhkdG9RakVWYUQzRUNuWUhPRGtyUXpSZUUrb0s3QUN1MmZs?=
 =?utf-8?B?QnhWbzBSbFhDTTM3Q2tyUWJuMm5CN0NaZDZNMXRVelV5dy82Qmd3ZTBCdTVw?=
 =?utf-8?B?WWJJdWtzd01WRWhTeFVFNWw1eHFEMSthQ1FReTdMU2pacWExME1oYlNDdXZ6?=
 =?utf-8?B?R0JsMTJ2OEgrbG9IbWJjWW5xazNpUjRKV3VnL0VKc2tLY0VOVFlnUTI4b2hz?=
 =?utf-8?B?MVhNN2ZWdlR2UTc5Z1JVbUsrd3FBZlh1SG1CVXA3SFpNVmhabGJVa0F0Smlu?=
 =?utf-8?B?ZzFDTzNKVUFSc3UzMDVFRSs5Y3VUK3VKaUlhc1V2Q3RrVU1pTlpUZ3JUOFFq?=
 =?utf-8?B?alN5L3hMSFU5aE1OeW1OblFMSHBJWWRmNHp0Qk9FME5NRzZVWE9aQnQvUnRy?=
 =?utf-8?B?Mml6dE5zeTV2WVhxWjNsNTVad1l3MDl0aWZuMm02NEtuazA1KzhmcURKWFdr?=
 =?utf-8?B?U1RzRlNBR0I1a0EzT0lSdnBQNktqU3pPRGdtQW05UGs4aGZwRHpmcXhPYitN?=
 =?utf-8?B?cWllVTFqTisyT0hvSUJWNjlkOGw3c095Nkgra04yT3RqYWx2RmtUZFJFb2Nh?=
 =?utf-8?B?U1FTaWpOZXMza25iNkY2U2p4QW8rZHFpeEgwNk1ER1VvR0hsT2JmRzhucmJG?=
 =?utf-8?B?RmdmdmhQcmFYUzZ6azBOTXZGWFR2M2t1RWpHMy9vNXFjbFM4ckZyQVJjNm1z?=
 =?utf-8?B?TENWU3FnUFRHL2RWQkRYRGhyZlZQcGdUYzcrb25HY2hRSEJIWjRoMzdaRjl2?=
 =?utf-8?B?RXA1N3l6OElaamdRcHY3cFN1SkdVZ2FCanVqS0d6Q0c1Rlg3YU5PSllyYTRV?=
 =?utf-8?B?djZESnBCSkxXcnpVU3JPeFJVUENXU2tVSzJUdEwvd0tHc2Z6OUlwNVh3aEtD?=
 =?utf-8?Q?owyvDiiu3/CsM72YdsgQa0QXYlwoOsbU5Prd0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(7416005)(52116005)(1800799015)(366007)(921011)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cVVuNmRweFgwTUJMMTl5SmdVbEhxZWZDQWsxT2tkTTBmY25va0dKZlppTEM2?=
 =?utf-8?B?Q0F0VSsvMkRRL2p0RDk5T2hwcWxQNTU4ck02N3ArdTk5ZEJZSlEvdHZQbW1Q?=
 =?utf-8?B?Ry94dGdDTXJLd2prYXY3dnJ5WTZyVnNybE9qZWxJcWVzclhTYVFHNHR0eFpv?=
 =?utf-8?B?azV3akEzdmF0YlFEcUJ5dmNZREMyTzluRmhzclo4RjJMalFKTEVVQTFGWm5j?=
 =?utf-8?B?ZHhJNy9TNkZQT0VNbzE0b1plWWlPWjNDaTlXOVhSYStzSE1GU0FsRzk3czQr?=
 =?utf-8?B?YmxObTJKRnl3VnkrYUQvRDdObGFvMUE4SCtxUUFMYldmNVhOTW1uZS9FOTFp?=
 =?utf-8?B?ZUdtQ1BjUWpuczhhY0ZuSGtDZnU3MFpVdWRwRnFOSzNFV2xDSCt5dEg3Q2dp?=
 =?utf-8?B?Ny8rS0UyOW5OckxtSTFWTjI4UVhiMVhRdzVONmUzNWxOSWtBTGVpYnRIQ04v?=
 =?utf-8?B?ZWE2N2JXeWNlTG9FTGlBYUFRZENtazJuQ3NoV21HN2tGa3NuNUZnTWtleFJm?=
 =?utf-8?B?MVI4SGtPT0hOZ1NkdUt5VzhQS3d2UFVoOUZvbGxvZFBlYjZtYXdwaVN0Y1dy?=
 =?utf-8?B?Sm5xRHQ5dlZlNzVPMzh3UysvV1dpMC81c3lubTFBYS8wRGR6QkFnc2JKdVVD?=
 =?utf-8?B?bnpUTEdSeXVqTmh0YjBqdXc0eVdpb2JKc2Rod1l2RmIvbHpUOTFqd29YM081?=
 =?utf-8?B?VUozVWJ1SWlFcjBmUVR1dWluVDEwVWRlMXBWeFlNMFNPbkN2UHVBR2xiSG9m?=
 =?utf-8?B?VG0yM3RVNVVZUFFTV0FHZ3hZTVhRWEc5ZTVzYXlQZ3R0a3hGVjJwSDJseTRB?=
 =?utf-8?B?Wm5xMi9PeUl1elpLNFJFWHdKOHh2bU0vdk55R2kzaGtZRUpaREdub240RUlN?=
 =?utf-8?B?OHluUmNJMjZwaG84NU9saVI3WGxqSnpRREN6MXhEangvbXVLK1JaU3VJaXZJ?=
 =?utf-8?B?NUxzc0dKWlRnRzRPeFJBSDhOT2F3RUJhL25MSlQrWStpbEdGbVNwNldtQmwz?=
 =?utf-8?B?NGJsRmlyQjJIMCtlT3N4Kys1ZC96NTA5OE92SHdPaU5MK2dBRmdtUGxMREhS?=
 =?utf-8?B?akxHMDBKRjJkZFdyY2dxR0tNVUxFMGFxb2JkWVpETzlmRkRIa0NuM2lOOVNs?=
 =?utf-8?B?czV1RzhuUW9NdFRxaDdxS05HWmJBWnV1YzVTVlRyWlhjZzBSMktQTTFsWUNC?=
 =?utf-8?B?UUUwalozOGg3RWlvYlhzQWF5SENCdGN3Q0oxRUhiTUhaSXphamp6WmYxMUc1?=
 =?utf-8?B?UVNsZ2pSbitqWTFicVVpMktwcjR5dS9uMk4xM2JvNk1ZNlR6QTUxU2hFNkxa?=
 =?utf-8?B?c2dtUVhkQVdxVTkxdDU0S2d0ZG5xV09Ub3lLRmdpQTFKZEVsdTNqUE1uK2hR?=
 =?utf-8?B?Y3k1dHh3eFlyaW9CV0oyanRlMTNocVRzSmdvQkdGaS9PVSt4eWg1WVJBakZs?=
 =?utf-8?B?dE5Vam9pcnk1V3dDZlExWTVnVFlpZnZ3ZFBDNUJNUkVPRVpkTWMyQWY1Qk8z?=
 =?utf-8?B?eFdrbjhTVGRydlFsT29tc2VQdG81YkNIeGVxVEZKcnFzejZ5MlNPZ01Vb2dt?=
 =?utf-8?B?VUZCb0lWWmxRQmNTUUh6aVUyZW5qTTRTVjArZ3VLMnBFUGlZVGRrZ0U1TktE?=
 =?utf-8?B?bTdzSlcyNkQ1NHlEMXJHdGtxcXNmSHp5MncrRTR0SW1SeEgzMUlJSkZKRUpS?=
 =?utf-8?B?ZTVFNUo3ZFE1aXMvdEJCcG45T2JtOGNhNE9QSlpEeHJnRG02N1JobHppek5U?=
 =?utf-8?B?NWdUejRiTmRSYVZNOU0xVkFjaHVQU24zb0RKcmJXVUs1M1pza0NhMmVod3Ro?=
 =?utf-8?B?TnZlS2VPbW9GeW5PSUdaOTBiY09QaHBvOWZVbzlZai9IQ1JCRG1OQzBzTFJM?=
 =?utf-8?B?ZVZzNGN2Mi9hSmlXUVZDQmtpTUlIcHhiN1FNSU85blVnYytZZ0lML2JuRkZa?=
 =?utf-8?B?VDlIYjZLUkpzRmpYU1RNY3hDS3BnN3pONmVkREJuSkJPT29idlVscTIvc2JK?=
 =?utf-8?B?N0ZoOUZNUXNMTDAwTTgxSVA1R0kreXZ6SDVGTW0wN0xSOWNKWTJOUERUaWl6?=
 =?utf-8?B?ZGlpR3JLVDdFd3VFSm5VbFEyU2VWdlpaYjMxcndIV29CdGFiNXF6bENYTmpP?=
 =?utf-8?Q?wZQCRd70hvzt7jdJ8+uLghO/Y?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a386a51-db17-41ce-fd86-08dc6c3bddc0
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2024 13:12:35.9937
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xkL1NGtmjTHzgUEOEpGYD3XConoiQLgB8vnYFjSMgVN5FoD8qaklgWrmfeCEQ+h1dWwFnYe/mlK+tvyurvqy8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8174

From: Peng Fan <peng.fan@nxp.com>

Use scope based of_node_put() cleanup to simplify code.

Fixes: 6118714275f0 ("pinctrl: core: Fix pinctrl_register_and_init() with pinctrl_enable()")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/pinctrl/ti/pinctrl-ti-iodelay.c | 37 +++++++++++++--------------------
 1 file changed, 14 insertions(+), 23 deletions(-)

diff --git a/drivers/pinctrl/ti/pinctrl-ti-iodelay.c b/drivers/pinctrl/ti/pinctrl-ti-iodelay.c
index 040f2c46a868..1032bc9c36aa 100644
--- a/drivers/pinctrl/ti/pinctrl-ti-iodelay.c
+++ b/drivers/pinctrl/ti/pinctrl-ti-iodelay.c
@@ -822,53 +822,48 @@ MODULE_DEVICE_TABLE(of, ti_iodelay_of_match);
 static int ti_iodelay_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *np = of_node_get(dev->of_node);
+	struct device_node *np __free(device_node) = of_node_get(dev->of_node);
 	struct resource *res;
 	struct ti_iodelay_device *iod;
-	int ret = 0;
+	int ret;
 
 	if (!np) {
-		ret = -EINVAL;
 		dev_err(dev, "No OF node\n");
-		goto exit_out;
+		return -EINVAL;
 	}
 
 	iod = devm_kzalloc(dev, sizeof(*iod), GFP_KERNEL);
-	if (!iod) {
-		ret = -ENOMEM;
-		goto exit_out;
-	}
+	if (!iod)
+		return -ENOMEM;
+
 	iod->dev = dev;
 	iod->reg_data = device_get_match_data(dev);
 	if (!iod->reg_data) {
-		ret = -EINVAL;
 		dev_err(dev, "No DATA match\n");
-		goto exit_out;
+		return -EINVAL;
 	}
 
 	/* So far We can assume there is only 1 bank of registers */
 	iod->reg_base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
-	if (IS_ERR(iod->reg_base)) {
-		ret = PTR_ERR(iod->reg_base);
-		goto exit_out;
-	}
+	if (IS_ERR(iod->reg_base))
+		return PTR_ERR(iod->reg_base);
+
 	iod->phys_base = res->start;
 
 	iod->regmap = devm_regmap_init_mmio(dev, iod->reg_base,
 					    iod->reg_data->regmap_config);
 	if (IS_ERR(iod->regmap)) {
 		dev_err(dev, "Regmap MMIO init failed.\n");
-		ret = PTR_ERR(iod->regmap);
-		goto exit_out;
+		return PTR_ERR(iod->regmap);
 	}
 
 	ret = ti_iodelay_pinconf_init_dev(iod);
 	if (ret)
-		goto exit_out;
+		return ret;
 
 	ret = ti_iodelay_alloc_pins(dev, iod, res->start);
 	if (ret)
-		goto exit_out;
+		return ret;
 
 	iod->desc.pctlops = &ti_iodelay_pinctrl_ops;
 	/* no pinmux ops - we are pinconf */
@@ -879,16 +874,12 @@ static int ti_iodelay_probe(struct platform_device *pdev)
 	ret = pinctrl_register_and_init(&iod->desc, dev, iod, &iod->pctl);
 	if (ret) {
 		dev_err(dev, "Failed to register pinctrl\n");
-		goto exit_out;
+		return ret;
 	}
 
 	platform_set_drvdata(pdev, iod);
 
 	return pinctrl_enable(iod->pctl);
-
-exit_out:
-	of_node_put(np);
-	return ret;
 }
 
 /**

-- 
2.37.1


