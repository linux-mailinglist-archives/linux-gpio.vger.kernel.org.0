Return-Path: <linux-gpio+bounces-30894-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6B5VOlgmcmkVdwAAu9opvQ
	(envelope-from <linux-gpio+bounces-30894-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 14:30:00 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0D5674A9
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 14:30:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 82CEE76B94A
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 12:46:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 773FA2BE04F;
	Thu, 22 Jan 2026 12:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="sRqHnnq+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011015.outbound.protection.outlook.com [52.101.70.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC9E272801;
	Thu, 22 Jan 2026 12:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769085947; cv=fail; b=healjFwxmmhGmyN2c2DEaJNzY66AET2IEMMH2P063pXiDR0uM8f++HjgTg4qwTB/UtEn6+/9+j+eNLyW+wNZLc1EsD+oN+vMDOJ0KEFHMCZUj7zxuQwly3Pv5/FfTn1e+sPQFY760B6HRAgbrrsxtCNdJU/tSnl9edxIrtnWsu4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769085947; c=relaxed/simple;
	bh=j009K5BCy3QVm29+tv+REWpwlTU7Ea7oHZEO1cnU6Dw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=sgAz9CwMV+D+9DF6wmR8HSyHJETggjqkEHrV35nMQ6T9JzBW21peYy/HNrFjE1dNqkHCC5MiQVHUxBOs5E8oVbB0/o+nDUtt7pll19JFwpXLXrwXtIN0cAps0fIx5bx/W7ANHqQmO9UA4FBe+gJtw0qneA9Ad5D9Cprrgmf6I7g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=sRqHnnq+; arc=fail smtp.client-ip=52.101.70.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CZSu/We0Yi4XoG3STzd8Ape9PTEjjvALlcY6M62Ha7JT83fVtKz7sJNc6awW4OcytpWj3AV+yMtQBkqwbU3oF7bsy9Bqryz3cyOCjzGw/qH2l4nDGfVC2X1MqTJiNsBhLNcRxAjaFj9iwEQcLq1NF6ol39xspLv3Tcr3k9OLNCqvWvGdXdbqlQEXuIzyoDNEMNAtWjOOferntlvvxuckKbzuAtF8LUAw2S+feFCwDItbDsrLcMa4XMamCusUBAYzsRO8rp5iAj/TsHXdV9pl3FaEI27GlODIp9v4JaA7fnkKiUajxddlo/yTm2j4NSNySdftXMLAphN7u2HcepYIdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iVtaUNdMAbX5PjMKyVCedlj3difoyAhpU2ZG1SNEpjM=;
 b=FTCC5SdPAjnbVKusskGIkI0nny9LJzrjkAi0B/kmJcq9DXZY7j9s3bqKiwcSxsVg3gyUqw/gIhMVcF+zUqJwMZHZXRIp+nrGEuVabjB5EAZAzh63lEau37WQUhQnH5PFMjFJdWJ5sn9eTaByrXTNmBxvJbSCa7n0nend8SPwI8r7PHwCDCV0jW4tri7vOchTq7lwOmlgTZjomZRPQnaVDSeVykjmfTuU+Fi4JCpWUNfDmbRfhIFlTFOB8zovuNY/iTyDXj/eLScqCyMXaLGWNNKWbN0WAcXNTIp3rMmCQuzZx1bEvrYx0Fdjr423dP5o7HgdszopG9SseLDQXqHw5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iVtaUNdMAbX5PjMKyVCedlj3difoyAhpU2ZG1SNEpjM=;
 b=sRqHnnq+t+YkH4xbtKtPoCxBjONpIhpPAWB4+X3KENRhGvDk3fJ8l5i1oGXBL1vIVXVOlZJrwBL/g21q5textcUjCQSbCKrKaLaE3EDRK39XhApazOVms9UewIlvU0j7FSaNbwV2jMQaxT116H1qPDukMAZ/mjU8+qKarV6yZOuTlJS+LWoPRw4V00QgSAK4ZhBsc+me7Qj/0Sj5r+Nd8qrlvz54vfTKgLRkbjNQqtmF5TvJpOqBpYG/yryVPC8h/b25w7z2SnlzWXUTLx6lQIcxwOs3/r7TQnXp+rZpU8UsfZ3aw52No9TEnGPPP6MECx5zHYN0G2SajNXlovORkQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAWPR04MB10054.eurprd04.prod.outlook.com (2603:10a6:102:38b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 22 Jan
 2026 12:45:35 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%5]) with mapi id 15.20.9542.009; Thu, 22 Jan 2026
 12:45:35 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Thu, 22 Jan 2026 20:44:57 +0800
Subject: [PATCH 1/4] ASoC: codec: Remove ak4641
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-sound-cleanup-v1-1-0a91901609b8@nxp.com>
References: <20260122-sound-cleanup-v1-0-0a91901609b8@nxp.com>
In-Reply-To: <20260122-sound-cleanup-v1-0-0a91901609b8@nxp.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI2PR01CA0043.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::12) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PAWPR04MB10054:EE_
X-MS-Office365-Filtering-Correlation-Id: 16753ae0-3b5f-432d-74b1-08de59b42318
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|19092799006|1800799024|366016|921020|38350700014|41080700001;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NlB3Qjg5WXRwNllzWVpWZnBhUWJUOWRHTW42S2dqbHo2ZGY2UTZCWDhNWmxB?=
 =?utf-8?B?VmprL3dRbFlOKytmMkcweU1jMkU4NytWdDlBZ3dGcWg5WEEzdFNnSnhUMFlj?=
 =?utf-8?B?UGc3Rm5qVzJPemk1R0wwSkxEeXpxWTF4eGorZWFrelArSVQ2ZVhNL0U3Lzda?=
 =?utf-8?B?TGRSNnpmOGlsendxZGhrRHJPUkpnenkyRTJpV0R3ZTBobDg4NWxDZWJYRnFa?=
 =?utf-8?B?RDYrVUwyR2hhY3NiNDdYZFNqRDBPSnp3Y0pKbHpSQXJmcmhLS21yNjJyanIy?=
 =?utf-8?B?ZlVtN0p0ZDBJRzRCUGhFR3NVZlhNVHJ0dllhY2k0enBueE9MUVFEWHJwaUdX?=
 =?utf-8?B?V0JNUkpEUEdQTVRJSVVPRy83Vld0NFlNTFdzckZpMWNQekdMU1Y0ZHNwcUxv?=
 =?utf-8?B?TkgxZTVYRTM2blpmaElrZ2lNRlBLS3lxR1l0TjlmMU9sU0VUTWwvd1R0WWQw?=
 =?utf-8?B?S09EcU1iOWUrS3p3REhNZFNoQk85ZGtsbHRpbG1nWU1jcDVQQ3NUemxoQzNQ?=
 =?utf-8?B?dW5sSTd2aWpaQXpRZ040MkI0OFEycjBkRmN2blhWdXVCRjJrMHlFck0ydkd4?=
 =?utf-8?B?VGtlMk93T3dVQXkxaHEvTkNkVy8xby9DTG0zYldOQTlwcWZNL0pvTXlSTEtW?=
 =?utf-8?B?NGFocWRxU1dLUnhhSGFBMGFPSFE3QmN5MlVnUEVQbjJUN20veEVHc3hTZk01?=
 =?utf-8?B?OUk3V3BLTlhFV3orTk52SnlmMWZ3YUtrUk1qYUxNK0kvcUQrUXVHdnQ2Vnd6?=
 =?utf-8?B?R3hPaVlUMFFKYkh6N09lcDBEWGVldVc3bUhtbUlxVGNMbUZFcXVxUTlsZUdG?=
 =?utf-8?B?d3JoYTRhaWs1cHJYV2ppa0tIYXZmU2hieFR2NFZTYU5uY0lNZkZhRy9sNUJn?=
 =?utf-8?B?MGMrWC9BTGpQWkJVVFBKUXpYektWSkJSZ3N2WXcyN1ZoenplamFoMk10dW1Y?=
 =?utf-8?B?SHE2RCtydW9WSExJSXlUQ25BQWZMVDUyWnFUUEV1RHk5MEFzNDBlN0tYenhv?=
 =?utf-8?B?djJYN242ZlozMi83V2p0Y3dKY1JORmtNNm1rakRNeGZQNEZFcU5hcFZNM21D?=
 =?utf-8?B?ZHEzcTlPWHhWeU1QaUVGQ0x0NmdjazJ4ZGxZbkZVU0ZOOU43ajFJdWREVFpy?=
 =?utf-8?B?UVp5NmN0YmE4Vm9VNSt6V0tXTTYxUUdad2xhN2wyWnlsYVNDdWdWOWFFRzVz?=
 =?utf-8?B?ajJSR2FNUXA5ZjNGR2RKV3FWTmwxL203UU1MbTN4S240SE9GcnYrSkw2bmV6?=
 =?utf-8?B?UGhnU1JhSGZYclY4N3JiczQ1Y1dkUzhiQXl5N25wZnJjTzRkTUZjWkpQVWRr?=
 =?utf-8?B?LzJLcGpTYUJvVVgzMTYxaEp0bjJ5b2ZCTUVTOXpRbFAvWHVpR0tSMHh6bjdU?=
 =?utf-8?B?Q3g1R25rRGR5VjM0TU1CTlNpTTFjbU16MjcwdVFpV3hWa2J1YmdaT1JoTGFU?=
 =?utf-8?B?VGVaN3piUnlQaUEybFFUWkR3bFh6N2hqWDVDT0RFTTFkK2pWOURmUDlxa1ZR?=
 =?utf-8?B?NnhHMFFrb0dsQ0oxTGVvL3R0cXhFUmdMd09BVmFxVWJKV2FFc0Jzb3o4Y1BX?=
 =?utf-8?B?TW8xU1JZR2E2VnhjVkVVMFpSOU5QaDJ4QmhrVVhWQndWZ1B3RCtlbFFpSUZU?=
 =?utf-8?B?OTVZK2pjUE0wbVlSSjE5OG1PK3FPS29maW56YXJUS1BtdTRPbTByQWtrU0pz?=
 =?utf-8?B?a01IaHRQWjVKbW5QakkyYTc2MlJjRHI3TnhtOEFLUldTN3ltOVczZnJtdWUw?=
 =?utf-8?B?cXBOTnRhdEJxeVdZaXFNN29CNk9LaDVXT25TYm9PajQxdlpGOVNzQTY0RnBK?=
 =?utf-8?B?bWcvMmhZdFZNMW51YVRaRHEwQXMyZWgxK01TcW96S3hha2UzTTVnWXMxOUxK?=
 =?utf-8?B?MHB3TlI4d1BlOEdlMWVUa09hZXg1UHZZN1k4N1drUDA0ZWFwbDV2Qllqa2lY?=
 =?utf-8?B?SlY4b1RFQll2SzdzbzNZS2hYb3R5clphNU9YLzg2UnJIR3FrZk9kVDQwRnd6?=
 =?utf-8?B?WTZYdXN5NnBxbHcyaEFsTUZMTGs5cFFYaVdSby95K3FLdUVsa0RTeXBnSFk1?=
 =?utf-8?B?VFVaellPT0RTaVo2a3h3cTRLeHpIbDZKdzRxVWFobkN2VmFXMWFvVTJTOEJV?=
 =?utf-8?B?V3VFUHNZbjFNSkVGSU9RL3Nrczl2S0dEeXFvaXJmamczSmlYbG43ZzI2MTZo?=
 =?utf-8?B?ckk4UmhlSndZL0lGc1p5WmpSSEUyZC8zS3dOZDNiRUs1RzlUT1dxMkg5Q0t6?=
 =?utf-8?B?VDlwdzhSbTFTdnEzZlZ1RkpBbmFnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(19092799006)(1800799024)(366016)(921020)(38350700014)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K0xDeUJoLzQrekdiTm9qakdqaGF5MGV4cjlaZFdJdExYS2RWcm5hUXJ1bXhW?=
 =?utf-8?B?MnpNTkJLanNOd2tQaEp6SXE4MDBWSWErbUpDYTZTS3pod3JRUjNDRUhpd2RI?=
 =?utf-8?B?Vk82V2VJblc0czRlZ1hWbnFIN2dWR25PeXlmZ0FtTVh4N09Gd0FtY0twcHZB?=
 =?utf-8?B?K2s0Z04va2Jhd0JpWUUwUzZtNS8rRXlVTDdWV0pCSkNhZFlWWG5hVFhFUjlZ?=
 =?utf-8?B?UmdGVkNMSnhrQ3NJTXFieE1PQjQ0VEViL0s0MW5UaVJPUkZia0FzcFRwNFJM?=
 =?utf-8?B?VTJFMU8xTVBRRFRMK0htZUxuUEFVRlFuYUlpQzlsTkhNQ3FZaXU2VlFYQkxS?=
 =?utf-8?B?Mi9BK1FLaW9UL3dYcEdQYlpGcm1JcEhNdWlEV2VqSTc0TFZGd0pnS056M1gr?=
 =?utf-8?B?Z0lBZTVUdXVFQW5KOWtjeSt0Z2lGSDRoV1ZxNUZkVUFVZWVMejFNS3RSUFVq?=
 =?utf-8?B?WSs2RlFZKzVOMEtzbG9WaWRGT2ZIQmw5S3Rzam43SjZCN20zUURoUzNaVkxN?=
 =?utf-8?B?QU9nWDM1MVhWSlh3eU54K0hucXdZelNPQ2g3dEJMMmZsZ2crWTdIeHBNUjlE?=
 =?utf-8?B?djJFZ1JjWWR3dCsrckRkdzY0SG14RHVyUUc1TnJZbUx0NXBsYVVmcHIxWEo2?=
 =?utf-8?B?Ym5nWFhlblZjN25BdENuUCszcUpaRjBxRXpGQk1HUDZVS3NLSVZrNnVzc3F0?=
 =?utf-8?B?QjUrUHVhaU1zUmRpNENKNnlDVHVlY1MwNVBSMWNsL2themg0aXhmajM0Z0V4?=
 =?utf-8?B?eWFjVWVkU2FBbGxQalpNajFCb014dkVibjFFVjBXSVZxNllkNExDQTVxTVFE?=
 =?utf-8?B?dlUzajgxdjhJOUpFd2JtTlBTZm5MV0tlMzR2NVprV0RNMFhSZFIxdGlOUTZt?=
 =?utf-8?B?RUVodjBqWjhCbDlhZllTeXl0b3dlWlNPaFE4T0k0OEFIb1A3bjJod0hrMWZl?=
 =?utf-8?B?NUZtVXVQMTBEcFlIdkJMM0t4M28xcHRkUlZ6cm5KL2U1RU9xeUZtZGt6TUl0?=
 =?utf-8?B?N0hybFc0TVNMbG1XdnVucDcwOTVyM2NIZEJnMG1mUFowbkpuK3BiZHhzRUkv?=
 =?utf-8?B?UXVpblFKTHZ5RFptdHdRblA4ajZCZmlJdnBKVE4xd2lCemt2UEgzM0l1N09t?=
 =?utf-8?B?VUlXWVY2eUhETWVFU3p4V1ZZU0o0RElZNmFFaDI4UlhoYkZ2bUpzd3BWcUJH?=
 =?utf-8?B?ZkVWVnYxRlNiWDhlYkxJeFJlNHBubTNWMVI2d2dlYWM3OTRkWVF5VnNySVpU?=
 =?utf-8?B?REJiTy8yVUNMcmdnZWdhdi91cGxwNjk5Ly9ZT0dmZEFzVThhRG82TWREMHVn?=
 =?utf-8?B?Q1BnTEVqcjB5NUNoeVB5cXpOUHV3WHRjZHVZVWgrQTAxUFNHWUs5STJtQWcy?=
 =?utf-8?B?SC9nNUtvNlJnTUV4Q0NiL1c2NERHOVFSREh5M2VwSWVVcVIzL01nTjg5NG53?=
 =?utf-8?B?S1hMU3FuMS8xRExpeThGNG9PckU1Z3dwV3dNclRXb0d3WTVJYWZHMU8vbTQz?=
 =?utf-8?B?Smp5TzF0ZmFzZDRjNWYrNVNxQ1M4a2FXNnhDU3lqMXM0b3JrMllHS3FVRWpC?=
 =?utf-8?B?Z21Ub2RhbVMwVWNUcEZOTnQ1QWtzSFUxWmhPSlNDb0FCMFpZWmFhOVNPdjFk?=
 =?utf-8?B?STZaRGpVTzM4R3g3TE5jUnZiMng2SU5BbytoZzJHaEIrQmV1T3dKZGNjWEZv?=
 =?utf-8?B?RnZiUDRhbTFEVExyOEFneW5VL21La1dZYkRLOWNMcWxTWHJoUTNSNFhGWGdw?=
 =?utf-8?B?U0tSWktpNnJYbm9hUnpSa3REVUZwK1BDbzh3UFExNWFwdGNSUVhPa2w0NXlr?=
 =?utf-8?B?c2ducnBHNjQ5bThhQVhBNk4xLzIvU2tmWmpEYitBckc4Z1FMZGk2NzM4Sm5x?=
 =?utf-8?B?Tkl2am9SWmRDdlp6eXNabVFUY0ZoT1JUUVdLR3dNUndMbERjQ0pIVG9zQjJp?=
 =?utf-8?B?cmNjVFE2UjZKc0hGeVIwaGtIajVXQWdvblZHYzJTMkwrREdtWCtPUkVtdzVx?=
 =?utf-8?B?di9PN0djZUhPY1VLR2RORlpxUU5XaUpKc21aUE1uS1pYZDdvc0FPbzNjNm1H?=
 =?utf-8?B?c2pNSWQxWWVlSC9GY2xrSDhmMVExeVdKckdwMkxLb3phVU9TR3Noa0tEaks2?=
 =?utf-8?B?STcrOG9BcHgwTENlcHVadEY3YTRjQUd0T09sbHdCQnN0QWJlOUtHN2xaamFu?=
 =?utf-8?B?ZUZ0eldZYTRpbnN3ZU12amhmbHhmdU1ndVZBcFordWhIbXlvWkRIb1BrSVNk?=
 =?utf-8?B?alBjMUJ5YzFLdkIzTUVhVDNqMXdxOHgxTm4xUStxQWtXOUVjdUFrSDJ1bjF5?=
 =?utf-8?B?OHJBbzN6NDJ6dkhDdG1YS2NGdFB1S1l4TDA4UG03WUtMYUFSeXdsZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16753ae0-3b5f-432d-74b1-08de59b42318
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 12:45:35.6987
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6GQEPjzA7T5TMJg2gGjaL2Oe58THZyN2sjHCTJsGnbyxs5PinFmC7JQnJHUOzZ7ul+/G6nqtmn8vGSeO/597rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB10054
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : No valid SPF, DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30894-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[perex.cz,suse.com,gmail.com,kernel.org,zonque.org,free.fr,intel.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peng.fan@oss.nxp.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 8B0D5674A9
X-Rspamd-Action: no action

From: Peng Fan <peng.fan@nxp.com>

Since commit d6df7df7ae5a0 ("ARM: pxa: remove unused board files"), there
has been no in-tree user of the AK4641 codec driver. The last user
(HP iPAQ hx4700) was a non-DT PXA board file that instantiated the device
via I2C board data; that code was removed as part of the PXA board-file
purge.

The AK4641 driver was introduced ~2011 and still probes only via the I2C
device-ID table ('.id_table'), without an 'of_match_table', so there are
no upstream Devicetree users to retain. With no in-tree users left, remove
the driver.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 include/sound/ak4641.h    |  23 --
 sound/soc/codecs/Kconfig  |   6 -
 sound/soc/codecs/Makefile |   2 -
 sound/soc/codecs/ak4641.c | 641 ----------------------------------------------
 4 files changed, 672 deletions(-)

diff --git a/include/sound/ak4641.h b/include/sound/ak4641.h
deleted file mode 100644
index 8b1941bbde5203f3f8ace779720fdb9aa8b6eafd..0000000000000000000000000000000000000000
--- a/include/sound/ak4641.h
+++ /dev/null
@@ -1,23 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * AK4641 ALSA SoC Codec driver
- *
- * Copyright 2009 Philipp Zabel
- */
-
-#ifndef __AK4641_H
-#define __AK4641_H
-
-/**
- * struct ak4641_platform_data - platform specific AK4641 configuration
- * @gpio_power:	GPIO to control external power to AK4641
- * @gpio_npdn:	GPIO connected to AK4641 nPDN pin
- *
- * Both GPIO parameters are optional.
- */
-struct ak4641_platform_data {
-	int gpio_power;
-	int gpio_npdn;
-};
-
-#endif /* __AK4641_H */
diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 90f09d4bdf8e8155f9c33e596d5e670cd1fca820..c3bcead0ade9badb1562e8a5cc63c27d90cb68eb 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -46,7 +46,6 @@ config SND_SOC_ALL_CODECS
 	imply SND_SOC_AK4554
 	imply SND_SOC_AK4613
 	imply SND_SOC_AK4619
-	imply SND_SOC_AK4641
 	imply SND_SOC_AK4642
 	imply SND_SOC_AK4671
 	imply SND_SOC_AK5386
@@ -625,11 +624,6 @@ config SND_SOC_AK4619
         tristate "AKM AK4619 CODEC"
         depends on I2C
 
-config SND_SOC_AK4641
-	tristate
-	depends on I2C
-	depends on GPIOLIB_LEGACY
-
 config SND_SOC_AK4642
 	tristate "AKM AK4642 CODEC"
 	depends on I2C
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index a6406bc907a9d27de5b5db793953c71fd82ed63b..b319f22250db38444435accf6bee663eb8ed4cdc 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -40,7 +40,6 @@ snd-soc-ak4535-y := ak4535.o
 snd-soc-ak4554-y := ak4554.o
 snd-soc-ak4613-y := ak4613.o
 snd-soc-ak4619-y := ak4619.o
-snd-soc-ak4641-y := ak4641.o
 snd-soc-ak4642-y := ak4642.o
 snd-soc-ak4671-y := ak4671.o
 snd-soc-ak5386-y := ak5386.o
@@ -474,7 +473,6 @@ obj-$(CONFIG_SND_SOC_AK4535)	+= snd-soc-ak4535.o
 obj-$(CONFIG_SND_SOC_AK4554)	+= snd-soc-ak4554.o
 obj-$(CONFIG_SND_SOC_AK4613)	+= snd-soc-ak4613.o
 obj-$(CONFIG_SND_SOC_AK4619)	+= snd-soc-ak4619.o
-obj-$(CONFIG_SND_SOC_AK4641)	+= snd-soc-ak4641.o
 obj-$(CONFIG_SND_SOC_AK4642)	+= snd-soc-ak4642.o
 obj-$(CONFIG_SND_SOC_AK4671)	+= snd-soc-ak4671.o
 obj-$(CONFIG_SND_SOC_AK5386)	+= snd-soc-ak5386.o
diff --git a/sound/soc/codecs/ak4641.c b/sound/soc/codecs/ak4641.c
deleted file mode 100644
index 9db8cdb26d33a564a9f80afdad1fbef1a5bc35b6..0000000000000000000000000000000000000000
--- a/sound/soc/codecs/ak4641.c
+++ /dev/null
@@ -1,641 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * ak4641.c  --  AK4641 ALSA Soc Audio driver
- *
- * Copyright (C) 2008 Harald Welte <laforge@gnufiish.org>
- * Copyright (C) 2011 Dmitry Artamonow <mad_soft@inbox.ru>
- *
- * Based on ak4535.c by Richard Purdie
- */
-
-#include <linux/module.h>
-#include <linux/init.h>
-#include <linux/delay.h>
-#include <linux/gpio.h>
-#include <linux/pm.h>
-#include <linux/i2c.h>
-#include <linux/regmap.h>
-#include <linux/slab.h>
-#include <sound/core.h>
-#include <sound/pcm.h>
-#include <sound/pcm_params.h>
-#include <sound/soc.h>
-#include <sound/initval.h>
-#include <sound/tlv.h>
-#include <sound/ak4641.h>
-
-/* AK4641 register space */
-#define AK4641_PM1		0x00
-#define AK4641_PM2		0x01
-#define AK4641_SIG1		0x02
-#define AK4641_SIG2		0x03
-#define AK4641_MODE1		0x04
-#define AK4641_MODE2		0x05
-#define AK4641_DAC		0x06
-#define AK4641_MIC		0x07
-#define AK4641_TIMER		0x08
-#define AK4641_ALC1		0x09
-#define AK4641_ALC2		0x0a
-#define AK4641_PGA		0x0b
-#define AK4641_LATT		0x0c
-#define AK4641_RATT		0x0d
-#define AK4641_VOL		0x0e
-#define AK4641_STATUS		0x0f
-#define AK4641_EQLO		0x10
-#define AK4641_EQMID		0x11
-#define AK4641_EQHI		0x12
-#define AK4641_BTIF		0x13
-
-/* codec private data */
-struct ak4641_priv {
-	struct regmap *regmap;
-	unsigned int sysclk;
-	int deemph;
-	int playback_fs;
-};
-
-/*
- * ak4641 register cache
- */
-static const struct reg_default ak4641_reg_defaults[] = {
-	{  0, 0x00 }, {  1, 0x80 }, {  2, 0x00 }, {  3, 0x80 },
-	{  4, 0x02 }, {  5, 0x00 }, {  6, 0x11 }, {  7, 0x05 },
-	{  8, 0x00 }, {  9, 0x00 }, { 10, 0x36 }, { 11, 0x10 },
-	{ 12, 0x00 }, { 13, 0x00 }, { 14, 0x57 }, { 15, 0x00 },
-	{ 16, 0x88 }, { 17, 0x88 }, { 18, 0x08 }, { 19, 0x08 }
-};
-
-static const int deemph_settings[] = {44100, 0, 48000, 32000};
-
-static int ak4641_set_deemph(struct snd_soc_component *component)
-{
-	struct ak4641_priv *ak4641 = snd_soc_component_get_drvdata(component);
-	int i, best = 0;
-
-	for (i = 0 ; i < ARRAY_SIZE(deemph_settings); i++) {
-		/* if deemphasis is on, select the nearest available rate */
-		if (ak4641->deemph && deemph_settings[i] != 0 &&
-		    abs(deemph_settings[i] - ak4641->playback_fs) <
-		    abs(deemph_settings[best] - ak4641->playback_fs))
-			best = i;
-
-		if (!ak4641->deemph && deemph_settings[i] == 0)
-			best = i;
-	}
-
-	dev_dbg(component->dev, "Set deemphasis %d\n", best);
-
-	return snd_soc_component_update_bits(component, AK4641_DAC, 0x3, best);
-}
-
-static int ak4641_put_deemph(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
-	struct ak4641_priv *ak4641 = snd_soc_component_get_drvdata(component);
-	int deemph = ucontrol->value.integer.value[0];
-
-	if (deemph > 1)
-		return -EINVAL;
-
-	ak4641->deemph = deemph;
-
-	return ak4641_set_deemph(component);
-}
-
-static int ak4641_get_deemph(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
-	struct ak4641_priv *ak4641 = snd_soc_component_get_drvdata(component);
-
-	ucontrol->value.integer.value[0] = ak4641->deemph;
-	return 0;
-};
-
-static const char *ak4641_mono_out[] = {"(L + R)/2", "Hi-Z"};
-static const char *ak4641_hp_out[] = {"Stereo", "Mono"};
-static const char *ak4641_mic_select[] = {"Internal", "External"};
-static const char *ak4641_mic_or_dac[] = {"Microphone", "Voice DAC"};
-
-
-static const DECLARE_TLV_DB_SCALE(mono_gain_tlv, -1700, 2300, 0);
-static const DECLARE_TLV_DB_SCALE(mic_boost_tlv, 0, 2000, 0);
-static const DECLARE_TLV_DB_SCALE(eq_tlv, -1050, 150, 0);
-static const DECLARE_TLV_DB_SCALE(master_tlv, -12750, 50, 0);
-static const DECLARE_TLV_DB_SCALE(mic_stereo_sidetone_tlv, -2700, 300, 0);
-static const DECLARE_TLV_DB_SCALE(mic_mono_sidetone_tlv, -400, 400, 0);
-static const DECLARE_TLV_DB_SCALE(capture_tlv, -800, 50, 0);
-static const DECLARE_TLV_DB_SCALE(alc_tlv, -800, 50, 0);
-static const DECLARE_TLV_DB_SCALE(aux_in_tlv, -2100, 300, 0);
-
-
-static SOC_ENUM_SINGLE_DECL(ak4641_mono_out_enum,
-			    AK4641_SIG1, 6, ak4641_mono_out);
-static SOC_ENUM_SINGLE_DECL(ak4641_hp_out_enum,
-			    AK4641_MODE2, 2, ak4641_hp_out);
-static SOC_ENUM_SINGLE_DECL(ak4641_mic_select_enum,
-			    AK4641_MIC, 1, ak4641_mic_select);
-static SOC_ENUM_SINGLE_DECL(ak4641_mic_or_dac_enum,
-			    AK4641_BTIF, 4, ak4641_mic_or_dac);
-
-static const struct snd_kcontrol_new ak4641_snd_controls[] = {
-	SOC_ENUM("Mono 1 Output", ak4641_mono_out_enum),
-	SOC_SINGLE_TLV("Mono 1 Gain Volume", AK4641_SIG1, 7, 1, 1,
-							mono_gain_tlv),
-	SOC_ENUM("Headphone Output", ak4641_hp_out_enum),
-	SOC_SINGLE_BOOL_EXT("Playback Deemphasis Switch", 0,
-					ak4641_get_deemph, ak4641_put_deemph),
-
-	SOC_SINGLE_TLV("Mic Boost Volume", AK4641_MIC, 0, 1, 0, mic_boost_tlv),
-
-	SOC_SINGLE("ALC Operation Time", AK4641_TIMER, 0, 3, 0),
-	SOC_SINGLE("ALC Recovery Time", AK4641_TIMER, 2, 3, 0),
-	SOC_SINGLE("ALC ZC Time", AK4641_TIMER, 4, 3, 0),
-
-	SOC_SINGLE("ALC 1 Switch", AK4641_ALC1, 5, 1, 0),
-
-	SOC_SINGLE_TLV("ALC Volume", AK4641_ALC2, 0, 71, 0, alc_tlv),
-	SOC_SINGLE("Left Out Enable Switch", AK4641_SIG2, 1, 1, 0),
-	SOC_SINGLE("Right Out Enable Switch", AK4641_SIG2, 0, 1, 0),
-
-	SOC_SINGLE_TLV("Capture Volume", AK4641_PGA, 0, 71, 0, capture_tlv),
-
-	SOC_DOUBLE_R_TLV("Master Playback Volume", AK4641_LATT,
-				AK4641_RATT, 0, 255, 1, master_tlv),
-
-	SOC_SINGLE_TLV("AUX In Volume", AK4641_VOL, 0, 15, 0, aux_in_tlv),
-
-	SOC_SINGLE("Equalizer Switch", AK4641_DAC, 2, 1, 0),
-	SOC_SINGLE_TLV("EQ1 100 Hz Volume", AK4641_EQLO, 0, 15, 1, eq_tlv),
-	SOC_SINGLE_TLV("EQ2 250 Hz Volume", AK4641_EQLO, 4, 15, 1, eq_tlv),
-	SOC_SINGLE_TLV("EQ3 1 kHz Volume", AK4641_EQMID, 0, 15, 1, eq_tlv),
-	SOC_SINGLE_TLV("EQ4 3.5 kHz Volume", AK4641_EQMID, 4, 15, 1, eq_tlv),
-	SOC_SINGLE_TLV("EQ5 10 kHz Volume", AK4641_EQHI, 0, 15, 1, eq_tlv),
-};
-
-/* Mono 1 Mixer */
-static const struct snd_kcontrol_new ak4641_mono1_mixer_controls[] = {
-	SOC_DAPM_SINGLE_TLV("Mic Mono Sidetone Volume", AK4641_VOL, 7, 1, 0,
-						mic_mono_sidetone_tlv),
-	SOC_DAPM_SINGLE("Mic Mono Sidetone Switch", AK4641_SIG1, 4, 1, 0),
-	SOC_DAPM_SINGLE("Mono Playback Switch", AK4641_SIG1, 5, 1, 0),
-};
-
-/* Stereo Mixer */
-static const struct snd_kcontrol_new ak4641_stereo_mixer_controls[] = {
-	SOC_DAPM_SINGLE_TLV("Mic Sidetone Volume", AK4641_VOL, 4, 7, 0,
-						mic_stereo_sidetone_tlv),
-	SOC_DAPM_SINGLE("Mic Sidetone Switch", AK4641_SIG2, 4, 1, 0),
-	SOC_DAPM_SINGLE("Playback Switch", AK4641_SIG2, 7, 1, 0),
-	SOC_DAPM_SINGLE("Aux Bypass Switch", AK4641_SIG2, 5, 1, 0),
-};
-
-/* Input Mixer */
-static const struct snd_kcontrol_new ak4641_input_mixer_controls[] = {
-	SOC_DAPM_SINGLE("Mic Capture Switch", AK4641_MIC, 2, 1, 0),
-	SOC_DAPM_SINGLE("Aux Capture Switch", AK4641_MIC, 5, 1, 0),
-};
-
-/* Mic mux */
-static const struct snd_kcontrol_new ak4641_mic_mux_control =
-	SOC_DAPM_ENUM("Mic Select", ak4641_mic_select_enum);
-
-/* Input mux */
-static const struct snd_kcontrol_new ak4641_input_mux_control =
-	SOC_DAPM_ENUM("Input Select", ak4641_mic_or_dac_enum);
-
-/* mono 2 switch */
-static const struct snd_kcontrol_new ak4641_mono2_control =
-	SOC_DAPM_SINGLE("Switch", AK4641_SIG1, 0, 1, 0);
-
-/* ak4641 dapm widgets */
-static const struct snd_soc_dapm_widget ak4641_dapm_widgets[] = {
-	SND_SOC_DAPM_MIXER("Stereo Mixer", SND_SOC_NOPM, 0, 0,
-		&ak4641_stereo_mixer_controls[0],
-		ARRAY_SIZE(ak4641_stereo_mixer_controls)),
-	SND_SOC_DAPM_MIXER("Mono1 Mixer", SND_SOC_NOPM, 0, 0,
-		&ak4641_mono1_mixer_controls[0],
-		ARRAY_SIZE(ak4641_mono1_mixer_controls)),
-	SND_SOC_DAPM_MIXER("Input Mixer", SND_SOC_NOPM, 0, 0,
-		&ak4641_input_mixer_controls[0],
-		ARRAY_SIZE(ak4641_input_mixer_controls)),
-	SND_SOC_DAPM_MUX("Mic Mux", SND_SOC_NOPM, 0, 0,
-		&ak4641_mic_mux_control),
-	SND_SOC_DAPM_MUX("Input Mux", SND_SOC_NOPM, 0, 0,
-		&ak4641_input_mux_control),
-	SND_SOC_DAPM_SWITCH("Mono 2 Enable", SND_SOC_NOPM, 0, 0,
-		&ak4641_mono2_control),
-
-	SND_SOC_DAPM_OUTPUT("LOUT"),
-	SND_SOC_DAPM_OUTPUT("ROUT"),
-	SND_SOC_DAPM_OUTPUT("MOUT1"),
-	SND_SOC_DAPM_OUTPUT("MOUT2"),
-	SND_SOC_DAPM_OUTPUT("MICOUT"),
-
-	SND_SOC_DAPM_ADC("ADC", "HiFi Capture", AK4641_PM1, 0, 0),
-	SND_SOC_DAPM_PGA("Mic", AK4641_PM1, 1, 0, NULL, 0),
-	SND_SOC_DAPM_PGA("AUX In", AK4641_PM1, 2, 0, NULL, 0),
-	SND_SOC_DAPM_PGA("Mono Out", AK4641_PM1, 3, 0, NULL, 0),
-	SND_SOC_DAPM_PGA("Line Out", AK4641_PM1, 4, 0, NULL, 0),
-
-	SND_SOC_DAPM_DAC("DAC", "HiFi Playback", AK4641_PM2, 0, 0),
-	SND_SOC_DAPM_PGA("Mono Out 2", AK4641_PM2, 3, 0, NULL, 0),
-
-	SND_SOC_DAPM_ADC("Voice ADC", "Voice Capture", AK4641_BTIF, 0, 0),
-	SND_SOC_DAPM_DAC("Voice DAC", "Voice Playback", AK4641_BTIF, 1, 0),
-
-	SND_SOC_DAPM_MICBIAS("Mic Int Bias", AK4641_MIC, 3, 0),
-	SND_SOC_DAPM_MICBIAS("Mic Ext Bias", AK4641_MIC, 4, 0),
-
-	SND_SOC_DAPM_INPUT("MICIN"),
-	SND_SOC_DAPM_INPUT("MICEXT"),
-	SND_SOC_DAPM_INPUT("AUX"),
-	SND_SOC_DAPM_INPUT("AIN"),
-};
-
-static const struct snd_soc_dapm_route ak4641_audio_map[] = {
-	/* Stereo Mixer */
-	{"Stereo Mixer", "Playback Switch", "DAC"},
-	{"Stereo Mixer", "Mic Sidetone Switch", "Input Mux"},
-	{"Stereo Mixer", "Aux Bypass Switch", "AUX In"},
-
-	/* Mono 1 Mixer */
-	{"Mono1 Mixer", "Mic Mono Sidetone Switch", "Input Mux"},
-	{"Mono1 Mixer", "Mono Playback Switch", "DAC"},
-
-	/* Mic */
-	{"Mic", NULL, "AIN"},
-	{"Mic Mux", "Internal", "Mic Int Bias"},
-	{"Mic Mux", "External", "Mic Ext Bias"},
-	{"Mic Int Bias", NULL, "MICIN"},
-	{"Mic Ext Bias", NULL, "MICEXT"},
-	{"MICOUT", NULL, "Mic Mux"},
-
-	/* Input Mux */
-	{"Input Mux", "Microphone", "Mic"},
-	{"Input Mux", "Voice DAC", "Voice DAC"},
-
-	/* Line Out */
-	{"LOUT", NULL, "Line Out"},
-	{"ROUT", NULL, "Line Out"},
-	{"Line Out", NULL, "Stereo Mixer"},
-
-	/* Mono 1 Out */
-	{"MOUT1", NULL, "Mono Out"},
-	{"Mono Out", NULL, "Mono1 Mixer"},
-
-	/* Mono 2 Out */
-	{"MOUT2", NULL, "Mono 2 Enable"},
-	{"Mono 2 Enable", "Switch", "Mono Out 2"},
-	{"Mono Out 2", NULL, "Stereo Mixer"},
-
-	{"Voice ADC", NULL, "Mono 2 Enable"},
-
-	/* Aux In */
-	{"AUX In", NULL, "AUX"},
-
-	/* ADC */
-	{"ADC", NULL, "Input Mixer"},
-	{"Input Mixer", "Mic Capture Switch", "Mic"},
-	{"Input Mixer", "Aux Capture Switch", "AUX In"},
-};
-
-static int ak4641_set_dai_sysclk(struct snd_soc_dai *codec_dai,
-	int clk_id, unsigned int freq, int dir)
-{
-	struct snd_soc_component *component = codec_dai->component;
-	struct ak4641_priv *ak4641 = snd_soc_component_get_drvdata(component);
-
-	ak4641->sysclk = freq;
-	return 0;
-}
-
-static int ak4641_i2s_hw_params(struct snd_pcm_substream *substream,
-				 struct snd_pcm_hw_params *params,
-				 struct snd_soc_dai *dai)
-{
-	struct snd_soc_component *component = dai->component;
-	struct ak4641_priv *ak4641 = snd_soc_component_get_drvdata(component);
-	int rate = params_rate(params), fs = 256;
-	u8 mode2;
-
-	if (rate)
-		fs = ak4641->sysclk / rate;
-	else
-		return -EINVAL;
-
-	/* set fs */
-	switch (fs) {
-	case 1024:
-		mode2 = (0x2 << 5);
-		break;
-	case 512:
-		mode2 = (0x1 << 5);
-		break;
-	case 256:
-		mode2 = (0x0 << 5);
-		break;
-	default:
-		dev_err(component->dev, "Error: unsupported fs=%d\n", fs);
-		return -EINVAL;
-	}
-
-	snd_soc_component_update_bits(component, AK4641_MODE2, (0x3 << 5), mode2);
-
-	/* Update de-emphasis filter for the new rate */
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
-		ak4641->playback_fs = rate;
-		ak4641_set_deemph(component);
-	}
-
-	return 0;
-}
-
-static int ak4641_pcm_set_dai_fmt(struct snd_soc_dai *codec_dai,
-				  unsigned int fmt)
-{
-	struct snd_soc_component *component = codec_dai->component;
-	u8 btif;
-	int ret;
-
-	/* interface format */
-	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
-	case SND_SOC_DAIFMT_I2S:
-		btif = (0x3 << 5);
-		break;
-	case SND_SOC_DAIFMT_LEFT_J:
-		btif = (0x2 << 5);
-		break;
-	case SND_SOC_DAIFMT_DSP_A:	/* MSB after FRM */
-		btif = (0x0 << 5);
-		break;
-	case SND_SOC_DAIFMT_DSP_B:	/* MSB during FRM */
-		btif = (0x1 << 5);
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	ret = snd_soc_component_update_bits(component, AK4641_BTIF, (0x3 << 5), btif);
-	if (ret < 0)
-		return ret;
-
-	return 0;
-}
-
-static int ak4641_i2s_set_dai_fmt(struct snd_soc_dai *codec_dai,
-		unsigned int fmt)
-{
-	struct snd_soc_component *component = codec_dai->component;
-	u8 mode1 = 0;
-
-	/* interface format */
-	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
-	case SND_SOC_DAIFMT_I2S:
-		mode1 = 0x02;
-		break;
-	case SND_SOC_DAIFMT_LEFT_J:
-		mode1 = 0x01;
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	return snd_soc_component_write(component, AK4641_MODE1, mode1);
-}
-
-static int ak4641_mute(struct snd_soc_dai *dai, int mute, int direction)
-{
-	struct snd_soc_component *component = dai->component;
-
-	return snd_soc_component_update_bits(component, AK4641_DAC, 0x20, mute ? 0x20 : 0);
-}
-
-static int ak4641_set_bias_level(struct snd_soc_component *component,
-	enum snd_soc_bias_level level)
-{
-	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
-	struct ak4641_priv *ak4641 = snd_soc_component_get_drvdata(component);
-	struct ak4641_platform_data *pdata = component->dev->platform_data;
-	int ret;
-
-	switch (level) {
-	case SND_SOC_BIAS_ON:
-		/* unmute */
-		snd_soc_component_update_bits(component, AK4641_DAC, 0x20, 0);
-		break;
-	case SND_SOC_BIAS_PREPARE:
-		/* mute */
-		snd_soc_component_update_bits(component, AK4641_DAC, 0x20, 0x20);
-		break;
-	case SND_SOC_BIAS_STANDBY:
-		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF) {
-			if (pdata && gpio_is_valid(pdata->gpio_power))
-				gpio_set_value(pdata->gpio_power, 1);
-			mdelay(1);
-			if (pdata && gpio_is_valid(pdata->gpio_npdn))
-				gpio_set_value(pdata->gpio_npdn, 1);
-			mdelay(1);
-
-			ret = regcache_sync(ak4641->regmap);
-			if (ret) {
-				dev_err(component->dev,
-					"Failed to sync cache: %d\n", ret);
-				return ret;
-			}
-		}
-		snd_soc_component_update_bits(component, AK4641_PM1, 0x80, 0x80);
-		snd_soc_component_update_bits(component, AK4641_PM2, 0x80, 0);
-		break;
-	case SND_SOC_BIAS_OFF:
-		snd_soc_component_update_bits(component, AK4641_PM1, 0x80, 0);
-		if (pdata && gpio_is_valid(pdata->gpio_npdn))
-			gpio_set_value(pdata->gpio_npdn, 0);
-		if (pdata && gpio_is_valid(pdata->gpio_power))
-			gpio_set_value(pdata->gpio_power, 0);
-		regcache_mark_dirty(ak4641->regmap);
-		break;
-	}
-	return 0;
-}
-
-#define AK4641_RATES	(SNDRV_PCM_RATE_8000_48000)
-#define AK4641_RATES_BT (SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_11025 |\
-			 SNDRV_PCM_RATE_16000)
-#define AK4641_FORMATS	(SNDRV_PCM_FMTBIT_S16_LE)
-
-static const struct snd_soc_dai_ops ak4641_i2s_dai_ops = {
-	.hw_params    = ak4641_i2s_hw_params,
-	.set_fmt      = ak4641_i2s_set_dai_fmt,
-	.mute_stream  = ak4641_mute,
-	.set_sysclk   = ak4641_set_dai_sysclk,
-	.no_capture_mute = 1,
-};
-
-static const struct snd_soc_dai_ops ak4641_pcm_dai_ops = {
-	.hw_params    = NULL, /* rates are controlled by BT chip */
-	.set_fmt      = ak4641_pcm_set_dai_fmt,
-	.mute_stream  = ak4641_mute,
-	.set_sysclk   = ak4641_set_dai_sysclk,
-	.no_capture_mute = 1,
-};
-
-static struct snd_soc_dai_driver ak4641_dai[] = {
-{
-	.name = "ak4641-hifi",
-	.id = 1,
-	.playback = {
-		.stream_name = "HiFi Playback",
-		.channels_min = 1,
-		.channels_max = 2,
-		.rates = AK4641_RATES,
-		.formats = AK4641_FORMATS,
-	},
-	.capture = {
-		.stream_name = "HiFi Capture",
-		.channels_min = 1,
-		.channels_max = 2,
-		.rates = AK4641_RATES,
-		.formats = AK4641_FORMATS,
-	},
-	.ops = &ak4641_i2s_dai_ops,
-	.symmetric_rate = 1,
-},
-{
-	.name = "ak4641-voice",
-	.id = 1,
-	.playback = {
-		.stream_name = "Voice Playback",
-		.channels_min = 1,
-		.channels_max = 1,
-		.rates = AK4641_RATES_BT,
-		.formats = AK4641_FORMATS,
-	},
-	.capture = {
-		.stream_name = "Voice Capture",
-		.channels_min = 1,
-		.channels_max = 1,
-		.rates = AK4641_RATES_BT,
-		.formats = AK4641_FORMATS,
-	},
-	.ops = &ak4641_pcm_dai_ops,
-	.symmetric_rate = 1,
-},
-};
-
-static const struct snd_soc_component_driver soc_component_dev_ak4641 = {
-	.controls		= ak4641_snd_controls,
-	.num_controls		= ARRAY_SIZE(ak4641_snd_controls),
-	.dapm_widgets		= ak4641_dapm_widgets,
-	.num_dapm_widgets	= ARRAY_SIZE(ak4641_dapm_widgets),
-	.dapm_routes		= ak4641_audio_map,
-	.num_dapm_routes	= ARRAY_SIZE(ak4641_audio_map),
-	.set_bias_level		= ak4641_set_bias_level,
-	.suspend_bias_off	= 1,
-	.idle_bias_on		= 1,
-	.use_pmdown_time	= 1,
-	.endianness		= 1,
-};
-
-static const struct regmap_config ak4641_regmap = {
-	.reg_bits = 8,
-	.val_bits = 8,
-
-	.max_register = AK4641_BTIF,
-	.reg_defaults = ak4641_reg_defaults,
-	.num_reg_defaults = ARRAY_SIZE(ak4641_reg_defaults),
-	.cache_type = REGCACHE_RBTREE,
-};
-
-static int ak4641_i2c_probe(struct i2c_client *i2c)
-{
-	struct ak4641_platform_data *pdata = i2c->dev.platform_data;
-	struct ak4641_priv *ak4641;
-	int ret;
-
-	ak4641 = devm_kzalloc(&i2c->dev, sizeof(struct ak4641_priv),
-			      GFP_KERNEL);
-	if (!ak4641)
-		return -ENOMEM;
-
-	ak4641->regmap = devm_regmap_init_i2c(i2c, &ak4641_regmap);
-	if (IS_ERR(ak4641->regmap))
-		return PTR_ERR(ak4641->regmap);
-
-	if (pdata) {
-		if (gpio_is_valid(pdata->gpio_power)) {
-			ret = gpio_request_one(pdata->gpio_power,
-					GPIOF_OUT_INIT_LOW, "ak4641 power");
-			if (ret)
-				goto err_out;
-		}
-		if (gpio_is_valid(pdata->gpio_npdn)) {
-			ret = gpio_request_one(pdata->gpio_npdn,
-					GPIOF_OUT_INIT_LOW, "ak4641 npdn");
-			if (ret)
-				goto err_gpio;
-
-			udelay(1); /* > 150 ns */
-			gpio_set_value(pdata->gpio_npdn, 1);
-		}
-	}
-
-	i2c_set_clientdata(i2c, ak4641);
-
-	ret = devm_snd_soc_register_component(&i2c->dev,
-				&soc_component_dev_ak4641,
-				ak4641_dai, ARRAY_SIZE(ak4641_dai));
-	if (ret != 0)
-		goto err_gpio2;
-
-	return 0;
-
-err_gpio2:
-	if (pdata) {
-		if (gpio_is_valid(pdata->gpio_power))
-			gpio_set_value(pdata->gpio_power, 0);
-		if (gpio_is_valid(pdata->gpio_npdn))
-			gpio_free(pdata->gpio_npdn);
-	}
-err_gpio:
-	if (pdata && gpio_is_valid(pdata->gpio_power))
-		gpio_free(pdata->gpio_power);
-err_out:
-	return ret;
-}
-
-static void ak4641_i2c_remove(struct i2c_client *i2c)
-{
-	struct ak4641_platform_data *pdata = i2c->dev.platform_data;
-
-	if (pdata) {
-		if (gpio_is_valid(pdata->gpio_power)) {
-			gpio_set_value(pdata->gpio_power, 0);
-			gpio_free(pdata->gpio_power);
-		}
-		if (gpio_is_valid(pdata->gpio_npdn))
-			gpio_free(pdata->gpio_npdn);
-	}
-}
-
-static const struct i2c_device_id ak4641_i2c_id[] = {
-	{ "ak4641" },
-	{ }
-};
-MODULE_DEVICE_TABLE(i2c, ak4641_i2c_id);
-
-static struct i2c_driver ak4641_i2c_driver = {
-	.driver = {
-		.name = "ak4641",
-	},
-	.probe =    ak4641_i2c_probe,
-	.remove =   ak4641_i2c_remove,
-	.id_table = ak4641_i2c_id,
-};
-
-module_i2c_driver(ak4641_i2c_driver);
-
-MODULE_DESCRIPTION("SoC AK4641 driver");
-MODULE_AUTHOR("Harald Welte <laforge@gnufiish.org>");
-MODULE_LICENSE("GPL");

-- 
2.37.1


