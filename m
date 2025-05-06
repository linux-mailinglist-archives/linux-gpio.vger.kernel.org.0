Return-Path: <linux-gpio+bounces-19658-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F64AABCAD
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 10:10:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B1713B1E21
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 07:53:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F33EC23F40E;
	Tue,  6 May 2025 07:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="cmUpukZz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2056.outbound.protection.outlook.com [40.107.241.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1EB823ED75;
	Tue,  6 May 2025 07:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746516702; cv=fail; b=RSA04A1Xma8ZtoJLVHx/D0gCBX+3HuFZU7874WmzfGWh6fgQgINmy9cmkSlSDvcJzmlpBlR21GIZ1EK6rizuHbDNc2B+Xoi7W5NyYsMmEdmvcZNuLlMun0ZAu/l8jgnWdP0jIbtBYy3GUEN15HGjVTM7l4fw5UoyE/D7GGGRCM0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746516702; c=relaxed/simple;
	bh=5nyC0HpBCpJxerFRaGt2W8pQIN+4nUL6P3ojYdbc/2o=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=YXJu0rnpRFQe0Eu0jRpYZJCcPE6QocpZr2ovmigB3CGc/yVAJR5OhiECA3ucqJsDqCl/CnpK7jiBf9TjzYP6UCdqrUIgCeDtsu6gUNb2jLLp8whDw9WU5JsoGK3WQxn8IEegiZCfMlz5yMZuWhBXfiD2rBjVJ4lzPT6X3vjJFUE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=cmUpukZz; arc=fail smtp.client-ip=40.107.241.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iBTQWGNUJ6U1nlFa9UuMQ3qrg27qEmDnf6sKuPLbMs1lJnz1Pxh3iuRtNK70ptVUHv94gp2lL05pVpxh2NvkVuy7nTAAdrKX/PQih9SirBHFKfOn1jYyBz9+P5mFttp0+/LxNwiYCKIDF5LK7e+vB5PzCr2aM1KIW2kXG6Dnvduu4Le5i5nyIuAQ3ZwyaLeWPehqdOqZ7obDXQmt8bCgvoekpCWtw+VbB1QCOGZ64anZT0toYLXMX9PqjCLI9yXRmRWDYrgXAi/x6EWQRj6E/IIFf4j82dutqabGwtTEnCVDheVIdYswrj12kXKQADMuGyaT5UHFQcGIi8c58lX96w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CYdjuhwvsfxVUEvKeKODcrk1U2kmXEfmBE/qUmzTBBA=;
 b=la4S2BOegYwlroV37+pL0M76Xb/WsOWhLHsG5KGCE8Avd/tVll2WK9vg2sh2xYXRaV4UF8d/E8as/K8OdEFePLGwKQfkZhP/XV4vek5WQAREfhB21F+ORN6lPaYeWVVcbu19KW2kyjoQDU+3zu3bjKyNk+jZmXaA9mDg6gRq/eWckB3pHfAYWCI0t+he9kAwRW+SVF/+UMctpMTZ4vk0wP4KFVXbuBwPge1pKUlwSVx/0dfhs0pT81uGEfuuyYSTxnDojd26X5lz/qAyH1ABbBZRjOoWtdA5QCAUETiB1zYdYsE3cKfQ3U7hOruqbDWJMzpHZFJTP/zog18L7sPxRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CYdjuhwvsfxVUEvKeKODcrk1U2kmXEfmBE/qUmzTBBA=;
 b=cmUpukZzD3O3+0c6Qtu0/SwqNA4Mhs7uawd/LxJpR6cfAzPm5tqERSki0Q9eg3+e508RdREFgKUjZhhJcyOC1rSEmz1SsmiPN3HaWOe/xJKHJVox9Qv0IVhZiM9dC10CU01K2afRpaQzM6/Sln91K+j2segVY22gEIRbbl4DgjhVqAfRnOa8UE2KHjQ0ZxjuwvSElfqcfEVy7iQW4t7QeU4pffPeJlIuqkSu89nZboiU370VPEDt7r6mbpai28/14P2dfUKEDflTjHekAim03tzEM1qrAeFxygM46A1Cg/nP7jO6DC5YoI9XH71ttsSLEUNzpwvHTI0Nya6eo9b5Zw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM0PR04MB6881.eurprd04.prod.outlook.com (2603:10a6:208:18b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Tue, 6 May
 2025 07:31:38 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8699.026; Tue, 6 May 2025
 07:31:38 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 06 May 2025 15:29:39 +0800
Subject: [PATCH v3 9/9] ASoC: codec: cs42l52: Convert to GPIO descriptors
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-csl42x-v3-9-e9496db544c4@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746516585; l=3098;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=Meie2Ur8+olGUDMVKFIdjW59K4DPyviqRjxk8qxOcTQ=;
 b=611DabAmrYbdYNQOf1UblJW/76YPXQkbN8IWnt3uuWXTC3pRcpnh2Jem1ZdV36k4Pb4LCg8V2
 0CK5kmDLWAeAInh4qi5DFa5t5hZ+zEy4qbe6g4NHBmeUbYnIWwxW6zh
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM0PR04MB6881:EE_
X-MS-Office365-Filtering-Correlation-Id: 24bb3cf8-bd49-4fec-4422-08dd8c700992
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dW9iSERlVVRWUm45WENyc2FhY2FLT3N1SlEwYUNDd01WTFpURTBOdzBvRmda?=
 =?utf-8?B?YjFJdzQ0TW5tc1ZhMzVIUjF4SlptNTRsT3hROWdzZHY3UDFDSUoyMk5TcjZv?=
 =?utf-8?B?b09xSnNidU5UTnpBVnYvL0xlQXJPUHVoS3g3TkRQbnUyby8wV1FZZ0d5aVV5?=
 =?utf-8?B?Y3JWYzRPZEI4S1NYODdPWUtkL0FVaXplTFRQSFM4NklHcFA0MVZSalF5L2U0?=
 =?utf-8?B?b21rY0xHV2NXRm02T2NWbHE4Q2ltbTd1eU5LY0V4VUN6dWdhZUJ2ZW9RSjVX?=
 =?utf-8?B?U0k2dWkraXBqVHhoOTU0RzJER3F0MldqNDg3WkNKWmIzYjI1a1daTEF3MFBD?=
 =?utf-8?B?ZnZJTTM2eW9PNzhjUVdQMG9Vd2dLZVB5RDRmRm1vdWs3THI1M0M0L2I5U0tT?=
 =?utf-8?B?dnVRMVZGaU91dEpFY0hpS3FlMm1JcTdxMXVRcGVFQWc0My9iUEREK2dHanFm?=
 =?utf-8?B?ZmNpVWpVaDdtSi9ENlJqWE4rNDVHbzBveUVKdDNHSElWeHpBYUYwVHEwYnlW?=
 =?utf-8?B?NU1raHF0czZoZW9GcWlvRVczSjBld3BOYVNuaGpMMWtJaHo1RUJsS2d3alJj?=
 =?utf-8?B?N2ZhOVJJaDZNOEgzaXg0UGNzZ3l3eWZJQTVCek9PSU1aUHhVdWtpbXBMUUdI?=
 =?utf-8?B?WVg0MjF5ZkV0WFZTVTcxbDBCWmt0aHpTK2R2eU42RzJiNVV0dG1HcUV0MFNS?=
 =?utf-8?B?c3BKQnM3aS9Xd2IrUTFOM0tVYXBON2RkYllWYXBEMy9KSm5RN0hPZy9xNTdx?=
 =?utf-8?B?L1U5a2pocll2TWRrZ0hSTW5JTHVkdVRQd3RldmRBQW12cGkwN3czaEtCRmpp?=
 =?utf-8?B?R2NwbmRnQWE1S3E2QkdHWC9ROTBFTDdoSlVzejNWWVRGM0lIUXZvS1ZSU0l4?=
 =?utf-8?B?Qzd5c2hPbVJseS9RQTJUMTZMeUt5QmtTdk03N3Y3bmlLSXhLbGJmenVtM0RN?=
 =?utf-8?B?eG83Uyt6bHhoSXdLdnBRWnB5TGtjRjBvK1VNdmtTUEpNTklSdDFMaGtMc0cz?=
 =?utf-8?B?SzJ3elJqTVdvSjhZaVNtLzJ6ZGd0R0h2ZHVKb0dLTzRpc0RMQXpUU2NDbFhO?=
 =?utf-8?B?WE50WDJpOUZ6QzlORGRrcGhQSkphdGE0dnMzNXgxR2NWTDN0VzBGM0VaNU9K?=
 =?utf-8?B?cHRic005di9IeTJBOFpYeDhIWkY2b0dnMnpaYlhsT0ltc3VlMDA3NXZkVzVi?=
 =?utf-8?B?MVljN3pxT016SktEK2lEWGVhUFExWXcvaVBjSFZ6bFp1eU1Yc1dXdmNEY2J5?=
 =?utf-8?B?S2NLcnhZRkFMaXkyUW1xdURCUGpWV2tCOElaS2tzcXFTMDkvdjZIWnRSa1dS?=
 =?utf-8?B?LzRxUDFFYTZUdjBkTkpzM1dsZmZDOG92WlhYcWJadzdvTjI5c1VydVlqbWlR?=
 =?utf-8?B?eGFBNldLRWx2VDExRWhTajNvWGRJSDVrVDQzblk4NDJJalRGVmxzeVN1N3Bq?=
 =?utf-8?B?QTRZWVlOQVM3MndONHAwVW9qWDdpZXF4UzM1SHZtdTd2L1RCQ1BzdU0rb1lV?=
 =?utf-8?B?RXlrNzlrRHk5Y2ZPejhFcjNXL3k1djBTVlBsYTR4b1lWMU0ycVdIamg1bUJo?=
 =?utf-8?B?dlNoZHhPZ080cXk2VXFnQm1zUGdvM0J0d2hPNXpaM1VsZ2JCYzFCdHYwbitK?=
 =?utf-8?B?SXRodlBnY0NhZzA4MmZSSkVNMlpsMVYwNDl1b2VMdkFzZHdzTnZLVk00dHZ3?=
 =?utf-8?B?cGdTZUtscmZZcHpUYTZqQm0yR2J3cUxCZkM3MGhLdlJDYzB6eXhWWWt1NmdW?=
 =?utf-8?B?bFNmS3VjU1Y0TnRpUTBCRVA4clU2YWhDZWc3V3A2V3VtakxJVE92VUl1aFRy?=
 =?utf-8?B?VmdsTWRxUmlFOEZmY2dHNjV4YThoOG96b1REbFA1MXR6aURvTmNYcEpnT0th?=
 =?utf-8?B?a2NsMjYvcjh4aVJ0TmlOdlRHR1hFa29nVTYvcmhTYVFXc0FkUVJVYWVGQVIv?=
 =?utf-8?B?MjAxY0hNUmZGVXhNR2pDVnBDaWVmME1jTjM1TS8yK2pHVEZndjg2QWd4NkNN?=
 =?utf-8?B?TXdNU2t4WnB3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SGlLS0YvLys0RGhKaVVCa0FSMVJ5alBBR1JZQ0o3QW8yZGRONm5zbEpIR0Z2?=
 =?utf-8?B?TzFhekJXdzFIRURKalpBRjVzVnhMbmFKcWpvTW9YWS9td05TN1dVLzlTRFIy?=
 =?utf-8?B?anBKMHpWcnlubnd6Uk1mNXkxUWZvZzRKQ25OelRkYzNoYk9zOExGb0E2RVJz?=
 =?utf-8?B?VmhDSUU4NWtHUzJkOE50a0NTVmJIVHFPWDBRSXVBb09ZUS9ja2h6eEk2WlNo?=
 =?utf-8?B?Q1Vva0lMNDF6OFhXWm1qMlpuL285UVpoQzNjTk83K1IxWmROSC84bFRuKzk2?=
 =?utf-8?B?TzZSK0d5eG9PUXYwVXpzdUx4ekFneUFlZEdIcXRUK2cwV1ZmSDVFWXRqbWhB?=
 =?utf-8?B?N244YW1CdU1xaEJrRlo1RmVlTE14QVRReFV2amV5R0JlamwveGJyOEhMTjJi?=
 =?utf-8?B?NGNXUUdGVnZDWVlERGFuQ0U3ckY0Q0F4V3JsMnFEZmRUMDZUWWFTRGtaalVF?=
 =?utf-8?B?ZXloZDNDT3FmZXVzNEZibTFEbGw5a3JGZUpocUhUK2drY09JSDAwaVBkajhM?=
 =?utf-8?B?dWZvUHA5ZFhyNEY2R2VYTkdJT1ZWUVE5VXRYelpsTEFGdGlaUFJCeW5YRklt?=
 =?utf-8?B?d1FOYjZiVzN6VVpxbHR1S09XS0VVaksrQVBrQmZsT0VCaklhNStiODlOWThz?=
 =?utf-8?B?TU5qUDNkZDliTjFDM09yeU5BNHREN3g1VUVwT1ZrQWVEMUdxSU1hamNjNmUx?=
 =?utf-8?B?d0sxYVMvVFZqUlpvSEVjdHdHOEVuVHQ2cmY4Q2JDcGFIWWZGaG5oNHQveHQw?=
 =?utf-8?B?SlNxbXdSWEozWDlSd3hvUUx6V2krY2tLNlZ3a0ZHK3ducmZ0dE9jc25Kbmha?=
 =?utf-8?B?RlpodGw3VkJsb3hNbXFBNUozS21YOVU1ZTdHZU5PZWN1eXZsSUloTGJMZGRp?=
 =?utf-8?B?RXNVc0lrUHNocFlqZ0UrOFdNS1JobUs0T3FXSERNUzAreDZlZVNGSzhBOFZF?=
 =?utf-8?B?WmtWQ1RWV01kbG1udGFibWdSVXZRRTZEZ1JYdDVtNURIRnZDSWVsNHpSaG04?=
 =?utf-8?B?dWp4ZnFiWTl4V2xadjZHV09Wajl0bXR1NktCR3EzdUJnb3RUZGhheUgxZGFn?=
 =?utf-8?B?THhYL216amlvdG1KV2YwazZDUngwVXEzN0tOcko5ZXFjL21KQkNhdU04Skpo?=
 =?utf-8?B?UGxWMjhtQ1YrR25KNFAxeUpKTGtxdVJCcE9ZSzF6MkV5WmpKTEFiVExsWGJy?=
 =?utf-8?B?YTdpa2E2SWFtckVFVFN6NE11YWVxMHhpcjcyZmxOTUQwRTlsb3YrcTl4YWRp?=
 =?utf-8?B?bzZteUwvcU1vN1pXcVZPVGZZMytabkd1TjdTUzRhZkZZMTh3ZnpNU1c1WGh4?=
 =?utf-8?B?SW5BVm1LU1dmSFYyK2lrc0ZqeXZsZUZLRk1RZE16RVBDcXR5WEdmLzFWdCth?=
 =?utf-8?B?M0wzS3dLRXlwYW85UXJPcHRjSU5HVUJsL3gwZ1RsYWtBMElRMldGZEh2N0Iv?=
 =?utf-8?B?dGVEOVRkekwrVUtmM082bGE3ZmhabE4wTGFPb0FqYkZtY3FxSjZEU04zM3Js?=
 =?utf-8?B?WmE3aVpBZ01BYkpiZUVIWTlGMlZtVnBOOXEyTWdlRVF2NEZUdEJ1OUZvSVhH?=
 =?utf-8?B?T3R4U2NCVHVOL1o0NUdZS1h0L1ZmbzJzRWJ1WCtGRE42M1hRS01IMExza3JI?=
 =?utf-8?B?aXgzSGpZWkppcnhNZUNyR2V5RFl1RlcxRENtZFRKWEZldnBqOFQ4b0tTSTVr?=
 =?utf-8?B?Y0hhYksvd3k0VVhoRmxXK2dycEVGK3hGVGNrcHZ5TStlSlVISlZNU3ZBTnRT?=
 =?utf-8?B?TVVMVGx4ajdKRWlxRkdEYy83M2lobjNmNVVhSVZSeGUwL3FodUtnNFF1L280?=
 =?utf-8?B?cVo2dGZJTmZEeEhOZUpqLy9rUldGL1RPRG00dEpHOWNtWDVjMkwwS2FqTTc1?=
 =?utf-8?B?ZlVJN2taNjJnOUl4elRPMGhiQks5bWQxYzVsdDBaa3JCUHBvd1Z5c2Y2c1R5?=
 =?utf-8?B?ZFQ1a1Bielp3VlVVTzhWR2kwUys5NlNWK2tldEVsSWJoaFlkU0tVOHlERlhI?=
 =?utf-8?B?NFdlTnplRmJvWDYySkxQTUFON1RxRXBveW9ManlRQWNUMjZmRVRYN2xIa1Uw?=
 =?utf-8?B?czVoVnlOSW0wS05WNWZQSFdOSkczQi83b055ZklzVm9GeURKQWdTZUdRdm84?=
 =?utf-8?Q?QOfRC6TjmsJssOG9Q6fu/c103?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24bb3cf8-bd49-4fec-4422-08dd8c700992
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 07:31:38.3316
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /78shIC/Xgy1c1rIasRALR1KzP8v27zJfn6/ecpAh4BPZAepEAytBSc60ks4KzRD1CJKGeJ6KrWyvZ7O6n25ZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6881

From: Peng Fan <peng.fan@nxp.com>

of_gpio.h is deprecated, update the driver to use GPIO descriptors.
 - Use devm_gpiod_get_optional to get GPIO descriptor with default
   polarity GPIOD_OUT_LOW, set consumer name.
 - Use gpiod_set_value_cansleep to configure output value.

Checking the current driver using legacy GPIO API, the
reset value is first output HIGH, then LOW, then HIGH.

Checking the datasheet, the device remains in Power-down state until
RESET pin is brought high.

Since the driver has been here for quite long time and no complain on
the reset flow, still follow original flow when using GPIOD
descriptors.

Per datasheet, the DTS polarity should be GPIOD_ACTIVE_LOW. The binding
example use value 0(GPIOD_ACTIVE_HIGH) which seems wrong.
And the binding use reset-gpio as example, not same as driver using
"cirrus,reset-gpio", and there is no in-tree DTS has the device,
so all should be fine with this patch.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 sound/soc/codecs/cs42l52.c | 28 ++++++++++++----------------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/sound/soc/codecs/cs42l52.c b/sound/soc/codecs/cs42l52.c
index aa8c001cce099e3c1dfc979678fe8000caed097f..a9ffba62aaf88c55a715d83609382d6fc5cfaa8d 100644
--- a/sound/soc/codecs/cs42l52.c
+++ b/sound/soc/codecs/cs42l52.c
@@ -9,13 +9,13 @@
  */
 
 #include <linux/delay.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/init.h>
 #include <linux/input.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
-#include <linux/of_gpio.h>
 #include <linux/pm.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
@@ -50,7 +50,7 @@ struct cs42l52_platform_data {
 	unsigned int chgfreq;
 
 	/* Reset GPIO */
-	unsigned int reset_gpio;
+	struct gpio_desc *reset_gpio;
 };
 
 struct  cs42l52_private {
@@ -1146,25 +1146,21 @@ static int cs42l52_i2c_probe(struct i2c_client *i2c_client)
 			"cirrus,chgfreq-divisor", &val32) >= 0)
 			pdata->chgfreq = val32;
 
-		pdata->reset_gpio =
-			of_get_named_gpio(i2c_client->dev.of_node,
-					"cirrus,reset-gpio", 0);
+		pdata->reset_gpio = devm_gpiod_get_optional(&i2c_client->dev,
+							    "cirrus,reset",
+							    GPIOD_OUT_LOW);
+
+		if (IS_ERR(pdata->reset_gpio))
+			return PTR_ERR(pdata->reset_gpio);
+
+		gpiod_set_consumer_name(pdata->reset_gpio, "CS42L52 /RST");
 	}
 
 	cs42l52->pdata = *pdata;
 
 	if (cs42l52->pdata.reset_gpio) {
-		ret = devm_gpio_request_one(&i2c_client->dev,
-					    cs42l52->pdata.reset_gpio,
-					    GPIOF_OUT_INIT_HIGH,
-					    "CS42L52 /RST");
-		if (ret < 0) {
-			dev_err(&i2c_client->dev, "Failed to request /RST %d: %d\n",
-				cs42l52->pdata.reset_gpio, ret);
-			return ret;
-		}
-		gpio_set_value_cansleep(cs42l52->pdata.reset_gpio, 0);
-		gpio_set_value_cansleep(cs42l52->pdata.reset_gpio, 1);
+		gpiod_set_value_cansleep(cs42l52->pdata.reset_gpio, 1);
+		gpiod_set_value_cansleep(cs42l52->pdata.reset_gpio, 0);
 	}
 
 	i2c_set_clientdata(i2c_client, cs42l52);

-- 
2.37.1


