Return-Path: <linux-gpio+bounces-22825-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CA253AFA275
	for <lists+linux-gpio@lfdr.de>; Sun,  6 Jul 2025 03:06:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F05917D5E4
	for <lists+linux-gpio@lfdr.de>; Sun,  6 Jul 2025 01:06:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FAEE7261D;
	Sun,  6 Jul 2025 01:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ettyQPLW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012026.outbound.protection.outlook.com [52.101.71.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56A2125DF;
	Sun,  6 Jul 2025 01:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751763994; cv=fail; b=JSCe+NXQZinaaL/IvZEjOZ5emYJV9l/AWdqfyYuPalNB3/IcL3pS8Vfu1uZJYlCYdsPVsSru1o6VnR/I/qflej6CLJGTTDxPFhR5Dl2MDzay910hA63HEfGz4QuOwkj2pHPLTZN/kt5r/Od0aohJK+AHWqv+t+GGBwr9m7Rld9I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751763994; c=relaxed/simple;
	bh=aHh4938lDXld/p5mYvBs0q2m1LYcJ9BFTYE98lGcRys=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=XjL7wdw5LT7AWf9nT6HG4V2F2IiBB/zjNGMy9ovbsqlrIBUd2n4iTbAQM6wL5Hlo+Y2EQHyVTMMGTL4ib92Ay0iwNg19nbySOjLvOBnTyxzT14rTVI1aFGQBn7ZBOZu3zegmXu0XSjaL28oueK0kVl3MAhbTosV0jOqQKkgx24U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ettyQPLW; arc=fail smtp.client-ip=52.101.71.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eysop33GyiS/Rfl4zOB9jcCuZkti5clbtlatQJ86qXgAlJSk147GC/xJIaRYHpBJ01GMjWFLEyRMdMCc3RNxGRfsJDhz3fRI3Ksu2BHeK4m/fHjVpfmNEBUn53sEAuj4xPldxckTk51UMzAc4FchngpG4MpbLYMjnyOEv/WETEHomoZephw6Azg5gu6fv2v61Y29/KHsvw6Ul+jl+ZLvacSTFusOgRICES5zfXTfx0IKCCad1ooFEN/iBP8hATk0qdyhvvEwsmYkTkunyqd07icgqS0IhNu54lJOEVmM3BDhtppRk0poJBeUFe6JaRY37wHt5CuUkUixyjH6lJ3ruw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lBAgpjfQsvaQB9LcOvt0+IqS9IuJrZxOYKdogKbnU9w=;
 b=HZY53GJI6ESwqDWB3BHW7vHhW9KMRqExqkbIpBFvzWoDKWyR+EB4P+5snwoASusGpKTn4JLXsH8fwvg0VU5Gcs7kfLT0MagwFQu4g+IpRSDvKUtWRXFCzv6ls6lp02IZsMoOB2NzsZNT7qGfOMNJbD4rR7PqZPNVYUHbPGyvd49M+x5cJUh0QF3DNEjabc/JKMv1Fc1SA7rTrHBkYdAjciaTY/O45MVy+K/YnQ3hSsGQ78QmOAnHLFuu7eEA5c+5Um2Z/3UICEQTYa+efIXdZUcDwpacZDbfxLB6nPrIsfTEW/CA1jUGSxcI1Y/TH0kJVopyiavyWJ3+WT3ICsIG4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lBAgpjfQsvaQB9LcOvt0+IqS9IuJrZxOYKdogKbnU9w=;
 b=ettyQPLWUnG+oE+x23R4DUF+mhcdiBsLLlnlft1Pg6w/y5E33480o/vEysDBNorBBa+17oqKCBxG9z2JGlx5ld2RVoZsWSPz/AkZBzES+E7kZIxD9nFSHLlOydF5gBu6CCiZw91lNeuDqyLukAh6hiGk69mcf3mmGMR19DgN+e+z6aCp/d+oh8TfaLWKxjMQMw+WenxxehmlOnrSo+CdDtTuHIn4uIZTTwo6fj1PTuMJ0OHq1ae/gubBjwcAqTVeJSKtlXmgT59JvfLn4GMvvSNRZv4eX+ySR/fkwRYSLZkC5gCdUz/3ftk+exP8cKsF5D3r6D+DVytTKfO0coH0PA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS5PR04MB9894.eurprd04.prod.outlook.com (2603:10a6:20b:655::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.22; Sun, 6 Jul
 2025 01:06:28 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%7]) with mapi id 15.20.8901.021; Sun, 6 Jul 2025
 01:06:28 +0000
From: Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 0/2] ASoC: codec: Convert to GPIO descriptors for
 tlv320aic32x4
Date: Sun, 06 Jul 2025 09:04:22 +0800
Message-Id: <20250706-asoc-gpio-1-v1-0-f0912095e923@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJfLaWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDcwMz3cTi/GTd9ILMfF1D3aQUA3MzoxQjS2NTQyWgjoKi1LTMCrBp0bG
 1tQCEYviDXQAAAA==
X-Change-ID: 20250706-asoc-gpio-1-bd0762d29351
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Peng Fan <peng.fan@nxp.com>, 
 Markus Niebel <Markus.Niebel@ew.tq-group.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751763884; l=1140;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=aHh4938lDXld/p5mYvBs0q2m1LYcJ9BFTYE98lGcRys=;
 b=jgf0AwzlgcYIhsxdpysX6aAOhg9RFRnswd3TIpVnF9m9DIcFAN4BCXENq2uMS8fg/X2euF5Bl
 yKUGIIAlxXCDy0OvIwEM4WsHeQbQQdEoh96gF/muHC5vnR3WsSN7kQg
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: MA0PR01CA0112.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::15) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS5PR04MB9894:EE_
X-MS-Office365-Filtering-Correlation-Id: 9451f3cc-7303-4bbb-a2c9-08ddbc295614
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|1800799024|376014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SDJHdzN2U3B6dlJaaFhUWkl2M0pXaCtpM0h1UDRZOVJxYUJMcE1yT0J0YzlQ?=
 =?utf-8?B?aUFiTlBlbm1PWnpxbkxHYXZtNm5LaWZla01rbWhoNTJwMHpVcHBxVUpiR1pM?=
 =?utf-8?B?OHJuU2ZPU0RBM2RuaDdWdDhtS241b3hoWWxSaUh0bnQzZVlCZE9zTFhIdDVP?=
 =?utf-8?B?d2RZTDVzZGtHT0hqUUJFeXh6bmJVUjJPN0g2TUV3TjZwcUgzQVhUNElrb2ZD?=
 =?utf-8?B?N3Avcm9UdUtxUkdQdzROOVBiRU41UDN5cGlGbDF0WDMxOG1peFpLazlMTmNH?=
 =?utf-8?B?U3JlZ080elVTaXV0U2dIRlc3UDdtUUNBK1lkb2ZZV1U1dXk4Ymh2aWRSR1dy?=
 =?utf-8?B?V2xFQjh0WGVDbmh1QWJ2bU5OdWhkRDVjNk1vNDZaS0FpOUsxZzRjcXlyRElu?=
 =?utf-8?B?MGhDYi84eE5oaVFhT0hXMnBITXhqVENLcWdHMlBHQ3hmbWptcmVBVlVlc3Aw?=
 =?utf-8?B?a3hvODZsWjYrOHRSQTI2eGNMZGhLVXNLWE54SGYzbHNBekhNbyszZllmZkpt?=
 =?utf-8?B?V041VjRVU0JhZVNXazBEa2YzZlp6ZjA1YmFEMk1HN0FhMXFYTXNNanMyaDBT?=
 =?utf-8?B?Lzc3N1RhMnZBOEEwc05sTmxTVk9Nc3ViZ0x5WVFnMzBTckhaTzlMb1pMODBT?=
 =?utf-8?B?c3pOMmJQOW1QeURXbWV4LzQ5dEZDOUJWVkFQUWhJeFo0VlhRSWVRMkFlS2Rw?=
 =?utf-8?B?NG4wbVVwUCtmRGRBQ1ZMeGtQQ1piN2NhQVlIcUdQbkVUWDlFRFJQK0VpR3dz?=
 =?utf-8?B?ajZqMG1pc0FSeDdIMVEzb09jTlE0bmVpT0ljb3JtWmlqOWRLMTNOUjMzWHlk?=
 =?utf-8?B?VXFmT2N3aHdya1JiRndScjRCMzJ4SnVpVTFzVCszK2NRMkxHWXJBS2tpaGVy?=
 =?utf-8?B?TG10WnRwSnBaQW90d29FZXFZTkhMVEhCRU5IZGF1Sk5NNUlGZ215Y3lLK1Ez?=
 =?utf-8?B?NFFlWlNKNFM4V1RFaE4xY0U4Y1ZWcVAydVdOUGN1TlhVVHQ4dnVKVFlZTzR2?=
 =?utf-8?B?NXQ2dEpDbCthQm9CSjZoRVVaQWxLN3paQllFZy9XdHZZZVJha1V6Q0xVVm1h?=
 =?utf-8?B?cDdUbzZNVUJVdTdHSkpDRlYrQmlmWStETmhTMHhHdG9wOEtxdzVpYS9jb0xC?=
 =?utf-8?B?ckxYM1ZiRXdJc1VRczJjdnNNb3JXeHpDQmlqZzgvZXFGVDZ1dFBWQ3JBTEZF?=
 =?utf-8?B?VXFxbytnVm9YSkhNRVo0aVkzZzZGNDM4dUV1anZQQ0NqbGtNZEkzNWRucERv?=
 =?utf-8?B?QURjQ0w2U1RjVnV0elRVYVRHUUgwR2lyQzF1K2xrRjFjUnhra2J1R3dwN3Fn?=
 =?utf-8?B?bk5PeDZkVTZud2V6MldZdlJHdkhqZ01JV2N4dTFmMVVmcEtJczVoKzRtSk1H?=
 =?utf-8?B?VDVCOUQ5MnJSdjhHL3QvcUZ1eHRwK2lPZlBwQkpOUG9OSVVzeU0zRkZOOWVZ?=
 =?utf-8?B?K1B0TnY3aWplRGRFRWtWNFdtZTdUdk81TER3ZkFuZDhiUmYrdndzbXB3VVMr?=
 =?utf-8?B?V1VZUk5EK1hXWHhmRmVFSjZMRVlNekVhZUorcEsxOGRiU3BTSTE4VVQySTg3?=
 =?utf-8?B?NFZvaGlHaUJraTVIU0ZtbTJ6MUZMQUZ3dGR6OGlESldtSGZ0Um5Yc1IrSGRo?=
 =?utf-8?B?VndSdnBSZndabTJqcUwvZWg0OUtNNnNZeGZ3Tmg4UTBqU2dGYllSTHNMQko0?=
 =?utf-8?B?NlFLUWlPMzEwYTZUOGkrUmNmNFBtWDc0clpVTkIxWHZHRXNOcnVNVElJZDVi?=
 =?utf-8?B?QWJsMENEZWdRcEpjallYNy9BWDhXelE5YlA4R1NJV1AvQzJ0QnVaeEtrYjB6?=
 =?utf-8?B?S3MrTm5xZU1nUUliQitqMFpMQnlBWWJkUE5SejlWZDNDejJ3VldsbFhhTUpE?=
 =?utf-8?B?cHJod0RROHlrcDlyVUgzM1NwWFdIVWZJVk80OERRVjNFY09JTFFCcU5ibWV4?=
 =?utf-8?B?RmZBWi9tTytrdUd4YndQaWdXU0RhT29NV0FKQVl5R0xlSDg3L2RpRWdhd1FE?=
 =?utf-8?Q?owdXvLAga2df7RwQuIeqLY76xPawc8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(1800799024)(376014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OXdzS0tCSFJmMzJwb0xuUjJmaU1qUTU2R2FsQTVhWFJGb3U0TkZIOERhQlZY?=
 =?utf-8?B?TXBsTXZNbjJvR2JLc243QW5XK0JRSDk1aGF0RWozbGE5UmExcHRIckZiVGhW?=
 =?utf-8?B?YVIzdE5pMGtoWWltaTMzVmdkUTRVZFJMSzF6QldTOTFNQ1ZwV0x2WjJLZXo2?=
 =?utf-8?B?Ulk4Q0lZd3NJbmFPSHAvNEE3b0hrN3BJWU9SbTRMM0JsQjJWN0hGWG54eENh?=
 =?utf-8?B?S3NGMHBscTNOK1BDTHV6c3o5UDdFL0gvZWtUcjgzaVR1U055WjhMYWtkWWFp?=
 =?utf-8?B?UWlQN3YxYjJSc0xnalFHVjJrTGx0VHFQN0drdGJWMjc0azlTcE1tcE9oUjdK?=
 =?utf-8?B?VTdsRTNERHpiM0ZDVjFzd2pLU2VIcWhqV3hscnB0QnY1ZThrWXpwdmppcUNy?=
 =?utf-8?B?YW9CRE5XR2tMRHBhQ29tWjlNTGswaW1IQzB1enNhTTZrVWRaMWtucXIrdW9Z?=
 =?utf-8?B?b3ZkcjlaRS9zc0xxeEpidVc0OHRiQWxheWtVUUcrR2xleUl6ZWtEMXV4cVRW?=
 =?utf-8?B?WUVNbktnY1FHNkF6eGc2VDU2RGVVYWFybUh5b0J5dzdzb3FpVnhSNkoxa3Fv?=
 =?utf-8?B?WnB3RDBEcUovaWFCL0pwZ2JDeitXakdBSjdTdFlVQ1hPK1M2UlRmUmpFMXZN?=
 =?utf-8?B?eWUxUXhaQWdFVnlzZkl4Ykk3QWU5eGZiMWZLSnJQNkljZXBHaFo1Zmg0ZkVr?=
 =?utf-8?B?VWhJM3J4TWNRSHF5NnlwNmppWFlxaUZrazE1eFlYOWJIb2dtaG0rOWNKSmpu?=
 =?utf-8?B?L05Md1RwWXBDLzV2TXdPc0t5ckhwWnM2T0t6QlFLdkgzdFlBQ2FmeHBGbDVN?=
 =?utf-8?B?UThIdzNSUDVYV1VQWXNkRnBQTG5YZVE2ZmRGWmNMR0QyOUFkaWNiaGpuQXdE?=
 =?utf-8?B?VWxZb0NxcGVOK0JGLzB4bmFRQmhhNVlJYnhVUW54LzUzWWg5cjJjWjhJMTNI?=
 =?utf-8?B?eHI3MS8yb1VFUXFHbmVsMnFtRDlyUUlkeFVxQ1lWUnhjbzlWaENHSXZzWXBk?=
 =?utf-8?B?UVZHb0xjU2hTRzJ6LzBxWkRnUTVwTHBRclZ0b0wvbm1LN01LQWZhMUdrVU9F?=
 =?utf-8?B?V1EzRTJLVm5jeXB3M0doZzdEMzZXOXRaWWRqWHVOWmVCWFNNQzN2eHE5eHVD?=
 =?utf-8?B?OUhLSnRleGFPTlZSYzJPSDVSNithWWpSS0o0WDVXSUQ0UUszMEpTNkJ1dTZF?=
 =?utf-8?B?aW5NZGdScHNtdjkzazRFbzJyWHhGUTZ6dGdhSVRyNkx0TGk1V2VYcHVsVWd4?=
 =?utf-8?B?aXptbWJ5bTdUWVVYRUdZU2oza3c2TUhJYmpxU3dHd1pZNVQvR2hKWXZWbzZW?=
 =?utf-8?B?QXVOcTVXMTd3aWt0a2RYaEpIWUpVd20zMThnbTVCU2VOcUpaNFkwZ29zVDdF?=
 =?utf-8?B?Z3FsQ2huVFYySng1YS9ReURIN0gwWFdFNUY1Vkk1MnhSeFJzc2lHdytLMEdI?=
 =?utf-8?B?djFycURMMmc0Z2lWeTk4QzZSS1dEMjJTRW9vOGtLVEVNbmZsbFRiaW92MWpI?=
 =?utf-8?B?WlVHbExMWXBQdkhYczVoWjBNcGxrMFh3aXBaQUNqWVBJQUwyM2hNaGF3ZGtG?=
 =?utf-8?B?dnQzQXBzWHpwRUxoVUxVc1d2RHJOMkgzZEovTmNaTEVXMThycjdLWW9wTDhF?=
 =?utf-8?B?a2t0QmtheFVqaEVnWFlGZVQ2UHdvQkpyb2xCSE1DWFhSSk0vbGRqRlFpYW5U?=
 =?utf-8?B?SUlVRDhxVTFEYkFDcjI0Z1h1NTBZeFAvME9LR3NIYzhvQ1FCZ0QxcGpPYmg1?=
 =?utf-8?B?b3dTSWp2UDRXMWVWaTRFOGNKcXJSOVN1QjZPVk9OaGMxZlNQVG5LbjlOOFoz?=
 =?utf-8?B?SmY4UEVNMnMvcXh3eVptc3ZqOFlWblFIT2h6SWlmM1JVeC9wYXZZdExCUk5U?=
 =?utf-8?B?K242R3k0MHRZN3FGZERuRFJrUTJXNDFGbG9uM1dZVEE1RVpKUEpNYXZUbU5m?=
 =?utf-8?B?NUNnM1c5V251aWxNQ2tEcG05K3NWZDIxMVRvU3Y2MkY4eVk4M0l6Wm8vZ0Rk?=
 =?utf-8?B?WlhRa1RKOSs2SXVDb2tQSUQ5bllNV1MzM3NJd1c2Vks2clhQamtwcWdEbjNr?=
 =?utf-8?B?OVowWUtLSitBMnhVeWpjb1ZEYkJXeUpHYmp1dFpJblpSMER6WWdLMDZUN0tr?=
 =?utf-8?Q?eU/tbwNHCHEgI8OLy7VwDQKCl?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9451f3cc-7303-4bbb-a2c9-08ddbc295614
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2025 01:06:28.2160
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /E5oNS+B/CY/QtisUMLcBBhqqvIfd5NL08Nl197QVsF8WpGSh5BJ+5LfzS9UCl6oudUwY9s63jS6PQqNHuDUlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9894

This patchset is a pick up of patch 1,2 from [1]. And I also collect
Linus's R-b for patch 2. After this patchset, there is only one user of
of_gpio.h left in sound driver(pxa2xx-ac97).

of_gpio.h is deprecated, update the driver to use GPIO descriptors.

Patch 1 is to drop legacy platform data which in-tree no users are using it
Patch 2 is to convert to GPIO descriptors

Checking the DTS that use the device, all are using GPIOD_ACTIVE_LOW
polarity for reset-gpios, so all should work as expected with this patch.

[1] https://lore.kernel.org/all/20250408-asoc-gpio-v1-0-c0db9d3fd6e9@nxp.com/

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Peng Fan (2):
      ASoC: codec: tlv320aic32x4: Drop aic32x4_pdata usage
      ASoC: codec: tlv320aic32x4: Convert to GPIO descriptors

 include/sound/tlv320aic32x4.h    |  9 -------
 sound/soc/codecs/tlv320aic32x4.c | 53 +++++++++++++++++-----------------------
 2 files changed, 23 insertions(+), 39 deletions(-)
---
base-commit: 26ffb3d6f02cd0935fb9fa3db897767beee1cb2a
change-id: 20250706-asoc-gpio-1-bd0762d29351

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>


