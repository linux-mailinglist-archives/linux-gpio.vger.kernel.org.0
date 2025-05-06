Return-Path: <linux-gpio+bounces-19656-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF2FAABBD3
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 09:49:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 28BD34C4385
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 07:49:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08A3D23D2B2;
	Tue,  6 May 2025 07:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="KxNWvjOt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012061.outbound.protection.outlook.com [52.101.71.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A1823D2AB;
	Tue,  6 May 2025 07:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746516697; cv=fail; b=I4oMJJ9doLrcwa8Wgp79CPXMbnhKOU8DXFgV3ZNyel48JD7Pah8cIDm7Rnx5HE4x2sZFVzID9YR6QZV869mDpjylwpKsaQeWZnNQKe7d2I+JSZb5WOwWPx4D2tvXgoFyCwaMtpc8/S4+VGQ6y9f3s7DWfNZ3CCJWHv3KQxKTFD0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746516697; c=relaxed/simple;
	bh=8n74JpaJd8SEiBdM5D64PuEs8zkPjwC+sVMiQCsHB6s=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=sIB3QaYwIF/dJzw+EeMM7Y2qYLDk44CzH6buueHq/BlviZ3WNISx5+yUV34BpKcSoUaDHnZp9gVO/O2f+JeDW1+4AXuPudkdCfyDaPnj90mNQvYodDUYcpZi4UwFZc9L97JbWwMfYUANgdkUdHnsAt7o0vGoIjkCwYkLzP7m7k8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=KxNWvjOt; arc=fail smtp.client-ip=52.101.71.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cmauMd0TLIGIvXUBMy0q0YH8ClZDmcOW3U/go0j2wyR86T9TEfZF14yK49UuwTjtEmiZWeqlfE7muc9/sEYXOMaEe785Kl8Ng5Z2nyk654mUKE7Zh1nd83xQyDO88vcPcRfSJITFW53tifmdItbD+LuS2E+IF7UNPWJM7HSKHGmMOL3o6F11iObhbkbM7EoGG4+2JUCBXFHwR6LY1mNmzz21B7Gi55UtCNyLSGRFhFThPKnnBGm02HS9dhq8155Jr88E7MnT5Upmu7mbxIPAtXQnZDD7H/BA6Lp5AATwwTXy12f2Vk9f58LX3ygvwlEMfrjQhLi45wXgzyZzskc2SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JuSDkgF1rArvMyxQXpJysk3JPN72vmz9Br3JUxiPA2s=;
 b=PQVFWDASs2Ka+S+KTqxCw/3hRZYwnpQIq2qKy6ai//1t+hg9dp8oUsXDHL3iz2jg8rCmNsz/ll3/htUFubcoFgMa3HOaP4YsG/T9IL2Ti0PlPCRJP3qMxyByYw4wUCrERW2lh1q18pi4f18GsKeH9Bcj3RgOo1MEQWoVKU0cWsWudxOf30lfG5t7vPXmC19yK6irScpj8ymDr/llLOf48i0Unf1BRxSdQO687ex3XN66NtHOfYhVz/+22fKpO2v+05oduCSh1pcDduThqgwK83Z0rxLdTjXLkjwnOvu8v6sAkN7QBuyMBrt2Qj+lhPz7Byd1F43sewAGlLuJoojyfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JuSDkgF1rArvMyxQXpJysk3JPN72vmz9Br3JUxiPA2s=;
 b=KxNWvjOtIvzBiEaqt3kXjSVTH/kqa9hm7G1iU9Sx+2nO3a/et7PvzIsjCJjVvyrRKtPTE0ER3ifO0WaUYo4rh0YWMcfgPElML8fFBbPMke5H94qyNgZLciesA3wEkVXM5mq5ecQMqcOxTeYoWLV+a2E2+zwhhR+dKaQFXezs8VkHR3rPpZc8yzL0XilSRe6WgthBF/jstc4FYONOz+pPv6loOjXHFDrmNvMlTDU0f2YFzM7Jno1sLunqSNULAOohqu66aE46qH6tUmwQuJv4Z/IqE1xHY3tpyXeIbicyzlN5o/42d1FtkzU5LvpGGMRdOYLZdnV86LwQUWdJX6w3Cg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB8PR04MB7196.eurprd04.prod.outlook.com (2603:10a6:10:123::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Tue, 6 May
 2025 07:31:30 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8699.026; Tue, 6 May 2025
 07:31:30 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 06 May 2025 15:29:37 +0800
Subject: [PATCH v3 7/9] ASoC: codec: cs42l52: Sort headers alphabetically
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-csl42x-v3-7-e9496db544c4@nxp.com>
References: <20250506-csl42x-v3-0-e9496db544c4@nxp.com>
In-Reply-To: <20250506-csl42x-v3-0-e9496db544c4@nxp.com>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746516585; l=1427;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=PMZRjDpt688WDjiwQ+z2E0Ozl5KXy1gAZEh02jgL4rk=;
 b=eGCaO0eXqW1VSYi6FgE15Iz0MeWE9R+iAmr3Y36fVtRaNpA/ATadNmeeEB2HBgIgPEtDhf+Ed
 y7nVxxPgMAZDWeLty5/z+KqFWCFW2H5OgAgdptJvRtmYCBr5ZPorHMM
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR01CA0176.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::32) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DB8PR04MB7196:EE_
X-MS-Office365-Filtering-Correlation-Id: 3da82a44-5c84-43f1-8882-08dd8c7004c9
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a3JkL2EvSE1UT0JPU1BjaldYeGVWQlBUOHhWMVA1ZnAxNGNnUklISENiVWVE?=
 =?utf-8?B?Q2FTU3Y1cTV3NFdmQWNzb25Va2VtZTZ0L3JBc0RYczhQUG5hRlRLSUNTN28r?=
 =?utf-8?B?UE83dzU3RWhJK2xTV0ZnbUtjSzdzYjVpdWJycDVKckcvRFFGUzEyckk5OFFx?=
 =?utf-8?B?ZmE2ZGVVSXNIMHBqQ0t2eHZvVWZPaEZ6NFpvb1FpZ0JBcGZ0NnU3S3Z3UGpB?=
 =?utf-8?B?dk9MWmlVUUlKSDh2aG9OcXZuUmc5RHQ3b1NLM0JXTDJoMUNiVlYrNTlwRjF6?=
 =?utf-8?B?Sm1xK0NvRTRKNDhHSCtTM3ZwWTQzSzJsY1oyVVJHZ25tWUxhTlhldWFCbWZ1?=
 =?utf-8?B?UHV4U25BUU1ia1FSbVU4OGpiMHJEblNjaXAzTlgxUHdPMDV1WTNKWlhFWVJT?=
 =?utf-8?B?cWc3V2VoQUxhcmtxZ3dOZ1hIdVZyYWRRV2t3OFF6VG42SkxQV3dicENidjNE?=
 =?utf-8?B?MHZHSVU1bENYMGJoTUdUT2E0NW14aHpDM0FIWGl1OGJ3U3pDZmIrVEdxWE5U?=
 =?utf-8?B?SzE0Rmk3UmdBV2lkVk1kSUpGYUhSalBMVTdRRkl0OEVxVHEzaWRzMnE2Vjgv?=
 =?utf-8?B?NDQxZW9QenpCTERQZzJVU0xYMHZ5TzdmZzRyblNOLzVSVVEwa0xLOUxUS05Y?=
 =?utf-8?B?UkgzeTNGTHdaVE4yblRGVlZiWHRVM1hpTVpJTzR3MmhoWDJRNVppU1gxeVUx?=
 =?utf-8?B?SnhiWnVMYW9BalJibERiT0dtbjhFZmlNWlJ6NkRRT01JdzFJQWk3djAyRDA4?=
 =?utf-8?B?NDlzaVU0aWpKb0xqd2J4d2Q0OWplcVd1V3gvOEpBRTQvelc4aVhTTG1zcnZi?=
 =?utf-8?B?UktmUGxNWFY1UjR1YUt6NmhzQU9HSk1jbUkyeTQrdEhYb1FnSHdjZzR1cFBs?=
 =?utf-8?B?RnJSQjZ0N3BRdy85My9xN0FlRWlrb1NzRktyRnJDOWJaMWEvQmtvUnlkSlFR?=
 =?utf-8?B?eEVPS2FQbWJMdlJCWnJTd2w2UzBoYjZHd0tEdFFQL2ZMWU5pOE0wMFdiSGZQ?=
 =?utf-8?B?WXJQbytLSHRDakZ3Qko1bnN3Q2NrZlVlVUNNMjlPYWlYdmt3a09qN3lEcGRu?=
 =?utf-8?B?dmpyZjAzdmNnSEtodnptZHJHUWZLTGV1YXVqc3dJTnRhOStRRzNmNi9pTVlG?=
 =?utf-8?B?MUYrWEJEd3JhVndZS09ERTBIeEgxTzEyWHdINElGNFBYbDdkYldkSkhveGVU?=
 =?utf-8?B?VU1xT2tzS1ZCVGdNQTdEWHRaWlZITXN3dDR1bjd6NXNoSW5zSXhJdCtpdGdW?=
 =?utf-8?B?QTYyUlpiRmljVFVSbmVSeXNZNnl2TjcrY0xuRnRDc1JINWR6SEc1cDVCRy9T?=
 =?utf-8?B?RXNMdy9PU2RwUVdJN1krS3hCck0yY09sOVRDcWNlUkZ3R213WktKT3dlYjQw?=
 =?utf-8?B?Q0g1K3lJaUxxbHNtLzF0VHlmMUV2eEJZNXZ6RHFVQThPc1NpZ21oZGp0eFJH?=
 =?utf-8?B?M1VXcmpidzlUeXlMTE9Bdks4YnU2ZDQ1Z1NNY3JzTGxEcVpmQUYzaHE1QjNF?=
 =?utf-8?B?Mzd3b3dOUDRVOTBid3QxRkw4N3ZyT0o2OVhrM0hFbWNPNTFrUEpLMGlFejJi?=
 =?utf-8?B?WS9ybUQ0R05XZ2VGaTVCNDZQRjVqT1VNeDJMWnoya0lPbnhCdDNqRWRjYUFG?=
 =?utf-8?B?Q3lndUVjTUhUaFdLVHgvRmsrMmpFWGpBZVFzOVhKMGU4UzVzTUF1dlhyMWl6?=
 =?utf-8?B?QlIvK0VpU0JRVEtRdWRmUGM2SVFOS0h1TXUzSnNQQm92TE54TW9HYWFIWTBM?=
 =?utf-8?B?ajdlbTY3dXR1aEQyTEZMSkFmY1pFVEhGWXlqR2kramZLYWlKNCtRTkhCTzIy?=
 =?utf-8?B?aDY1WEZRNnBLUnI5TDN3ZGJhekFlekU3enpaVjBnbDkrOUU1aVR2d3djenlH?=
 =?utf-8?B?eWh3R1ZxMUFIM0t5aytJOS9KSEJjTnZoNzFuOWpwaU5uMkk3STBNcW5zNFNz?=
 =?utf-8?B?Y1dNYVVPcDBrTjZJZXNOaWxaNks3Yjk2VFZBQ1hWZEp5M0cxR3BsZ0hPYita?=
 =?utf-8?B?emwrY2VIWmFBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NVppUW0xNldSNmhOT2xkSVpqN2c2aGp2R0VkQVQxejVQclhCQlpVUkd0Szhy?=
 =?utf-8?B?YWN1Ynd5bjBoaDB3c1JqOFFEM25XUGVWODRuWG9yWlFydStDQmVEVWV6OUZE?=
 =?utf-8?B?MWFhTG5vdmIxeEcwcVJYR1g1VUw2NDRlcjhadnhPUUdsdFlkM3VrMFlMblZX?=
 =?utf-8?B?enhRcC9uUmMraTZ3ZU4wc2lsdlFNcTVHVlBTR25vaTcxdFZ0UERMcCttRWVF?=
 =?utf-8?B?TUhES0dZYnBSeXF1Z3FycDhLOG5XSUtoVGRVQUZKd1h6MlpFUC9UT1VKMTBI?=
 =?utf-8?B?NHcwbTJ0cHhmeEQzY3A2UjRWL2NCWEt2YWR6SkUzOVpoYVdIVVpxTlp0N2VT?=
 =?utf-8?B?SUhGbU10TVpzMHhhTFpvL0tKMC9hemhxdFVGblgzRGVYVnRmdnFsZTBqK05C?=
 =?utf-8?B?a3ZWNjB4ZGFraXFTVmtXcTZ4TlBpU3d4M0N0NW9CV1g3bGRNMUozeExoOXFu?=
 =?utf-8?B?eU5zY050b3JWcE1aYWhrL1I5TWlJYVpjUXIwU2w2ajFCa0Y2bEE3b1Uwbm9a?=
 =?utf-8?B?N3F4aU9UeFhDR2ZUS1pQUHIzMVNtSWxhOCtTdVc3aE5RYWhXOFhqQmxDTmx4?=
 =?utf-8?B?cm1kQlVhb21tRWtvcjk5dDA1VDc5dEdnbGx1RHMyU1d5dWgvS05OV3FVUHRr?=
 =?utf-8?B?ZkxqeDkvclpLUUtPQ043SThIclk3dWpSWkFra1Q1OVdaR3A5OXdzYUNyVkNK?=
 =?utf-8?B?dUw5UW1qcjRJTVk1ZjlQcFhYdFBPa0xTeC82djZOOWRsMEVuWmdFbzJRa0xC?=
 =?utf-8?B?NWFseGVONHY2MWsyRmhmWXpBd0lGTlU3Q2FUQ3NsMFhOVGQ1dFBHUUhKa3Vl?=
 =?utf-8?B?cjNGZ0c4L2hjb3Rzb1dDbjJRYlZ0Z2xUZm5Lb0kraFkvWXpaYlpid1ZjWVJT?=
 =?utf-8?B?TWNGL1BNdmNUNXpFQUhpRVlIUzhjTkQ4N2RsMGpPbWNteVpKSWZBTFgvd2Yw?=
 =?utf-8?B?cGhiaEQ0ZDhLMWtsVDFpb0cybkJHQTFVSExlNExUbStpTmZTajFYdXhWdFg3?=
 =?utf-8?B?WDJVMXZGaTllMlRQNTFYYStVQ3hjUUVIcmNqelArak1XMTlBWFdqYVlwT0hY?=
 =?utf-8?B?ZEZTUFBHQXk0Y1ZWaHRnQTNBRWhYOTB3eVpwck1xUERTa3FjQStFbllFT0do?=
 =?utf-8?B?NlREYURuNDAxZ0xkbnBQZlZzaVNFK0JMa3F0czFhZW5HMTczOUU4SU84S2VI?=
 =?utf-8?B?ZkVmNkJBc1RjUWpvSTRqR3E1ak9mYUdxQ09yQ3BhaFFYQVM1UktDQ1l2bW1V?=
 =?utf-8?B?Z3VwMGR6OWFkNjNhWStHa2RyZjNYbEVTUzhVNlo3WGZETFZxZjJ2dkZnWkdC?=
 =?utf-8?B?eXJjV3N3Tk5KaVJTUDRjdkhQbG1PbnlBQ0FrRlhKMHpVV0JJMUZjM25DbWJJ?=
 =?utf-8?B?TVRsaWZrbmIrMVpGUkUydHlVVXlBa0hXUGhVQTQ4b0t2N2dWVHlRUGxzSFNP?=
 =?utf-8?B?NG9sRE9ZU2p1Z003RXVDUTc4dnppYnQ2bGlkR0JBeGk0K0VtYVVOTjQvaFFV?=
 =?utf-8?B?OVp5NnQ0dVBPbWlvcHNaNWRENy9VcjVOc3RkMUU3dnBkVnpQb2JYaHFuUEsx?=
 =?utf-8?B?S0did3ZuMnZhODd0TWROZEJWcW5wYmt1MWxERzlXcm9hSGg0SDE2MktVd2Fp?=
 =?utf-8?B?SjBUYkFTQm96bXlzdE42RmtETERLaWdDYUlPWGt2ZDhSVHNYNTBld0kyd29i?=
 =?utf-8?B?Zi9zenJVa0dzdmk4alJ4YkVvM3JIZThZVHgyWGRVblFCVTJvZ1FmZVM4RjFv?=
 =?utf-8?B?VW9meDJ0d1ZHa0tVbDY5SUJCVy9LdnRRWm9BN3J3eTNiS0o1azNlYXBudFZN?=
 =?utf-8?B?ZWtDYkVPemxuQ0xCSnU0emVyYWNQSGlLa0RMTElPQjBVZnR2ajhsUmxlcUJY?=
 =?utf-8?B?dW9VVWRQd3lBSEtzQkw0Vk9wYUtMMUhUazhjVzdPKzdSQ1NheE9tUWNYWWdV?=
 =?utf-8?B?VllzSVNseHRQUjdVTE5ZMFBocmcycUl2L2R0Zk5XMG92Q2QvRGNOWkV3cWVX?=
 =?utf-8?B?aHpMZzF0K1hRT3FESEYrampjQ0JxNTBmajFLa3BsczdnZFlJTDJCQ0pSUW9I?=
 =?utf-8?B?UHZIUzNRZWhMbEdwYkdiVDdiSmFpdW9MVEJTZWVxbU43Rnl3Qmp5WXd3U08z?=
 =?utf-8?Q?SIS3o0im7fDT0GeXhD5suKFYZ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3da82a44-5c84-43f1-8882-08dd8c7004c9
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 07:31:30.2876
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oTDoEwtW0olmVpMMVu0e4kaDelanRYbPJoq3xug+7yMRya2xWae75GetFoZTDd9xI3xSecb1YSafkmelhbX1jA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7196

From: Peng Fan <peng.fan@nxp.com>

Sort headers alphabetically to easily insert new ones
and drop unused ones.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 sound/soc/codecs/cs42l52.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/cs42l52.c b/sound/soc/codecs/cs42l52.c
index cd3f92c19045ad32f1f0f0f1764390640d68eb10..ba2ccc818ba6cc1b5fbcfb38e07e9bc8f68c4a6e 100644
--- a/sound/soc/codecs/cs42l52.c
+++ b/sound/soc/codecs/cs42l52.c
@@ -8,27 +8,27 @@
  * Author: Brian Austin <brian.austin@cirrus.com>
  */
 
+#include <linux/delay.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/input.h>
+#include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
-#include <linux/kernel.h>
-#include <linux/init.h>
-#include <linux/delay.h>
 #include <linux/of_gpio.h>
 #include <linux/pm.h>
-#include <linux/i2c.h>
-#include <linux/input.h>
+#include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
 #include <linux/workqueue.h>
-#include <linux/platform_device.h>
 #include <sound/core.h>
+#include <sound/cs42l52.h>
+#include <sound/initval.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
 #include <sound/soc-dapm.h>
-#include <sound/initval.h>
 #include <sound/tlv.h>
-#include <sound/cs42l52.h>
 #include "cs42l52.h"
 
 struct sp_config {

-- 
2.37.1


