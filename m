Return-Path: <linux-gpio+bounces-30895-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2LlyFLUgcmmPdQAAu9opvQ
	(envelope-from <linux-gpio+bounces-30895-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 14:05:57 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8B56705B
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 14:05:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3F7049088E6
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 12:46:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 188702BEC5A;
	Thu, 22 Jan 2026 12:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="P29eL1Fx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011015.outbound.protection.outlook.com [52.101.70.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903352BE034;
	Thu, 22 Jan 2026 12:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769085949; cv=fail; b=lYCriQ9oNl/w3YuRKu0vOLksS655jvJB3XCm9E41R9bfCqOu/GdwFTSOE0q79op2aLuNo0/HSubJYZiEp9JgxmU0GBlLhkNvdZk1MFs4q+mGdZdQK+yexyJ7lQ3ozSIsyxGaidTfugBBiOKl+i1tCiGxVpNGOY2TLl/WplZ5qBc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769085949; c=relaxed/simple;
	bh=4LL72j6VamehvIwrbH4IFB/9dX65BRGDLrMQqVmTTvg=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=S5iC8lhbtEG6kPoWC/jCl5Pbxk6xYFVd2e2qX+oQ7aRFE3AFa9I5zROQIQjSisEfL29OS6wUFHuiyT74ky0N9VeOOAzST1iqNNXWXe08gnQx7o3OQ5eGhR/FpI7u12ynmjLENdWTKeWmRFz2yr8fux1T+Z3dlmWRUc1u3GdX06w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=P29eL1Fx; arc=fail smtp.client-ip=52.101.70.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J3KAbHsjxtiYK+wL53KFabfaF27sckuKMOHVkBwxaBbAEW05opUU3mxiT62lhPq/XDX+KSbeIpnFDNiZ7M1w3EzQN5jAZXvueamqpPsojZXSaYVOIOyI11B6Y/Eqdv7aK0TZg88IJJkxxh1FFj3j4sdEfso4WnD8sqQ6vVf+UiqBbOCkAWKjxSQs+Iwx2G+T3Avd/5cCFszCqfiBxb6sn4dIwgFWaPfMGMKFxm5HhtEkCK+avmU99wXb5n0arebX0ZOUmU41RTeL/E+iKGsswnRK81rI5AjlqQWTj1kmoWJp3D+Pze8EG5eM5NCBsygG0IvtCksEDd9PgUTz6MuXeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gvuPN3wNUBWi1jP7oof5pEycn03Qkpk22kTeime3GW0=;
 b=kKTxyySp218PIGKm3IW2nHG7Ljvz2ReYSI7xZKQFmSppH44u+mrjHmPWfuG2loICMId03Fv9O2ZOqzAER59PuO92NPxFrMDbZI7OT826jZSbHQWAdQFCB4mdwX21pvuTkLrket94Bnh7vIADmIvaqEQQEcXs2OXXbSp9HChac8g/SMQzSmry1r21amjVxYDTl9lsKTQgtjEmquuYvLaeFlw3+MwGZpTRIlId7t62dRQoh0YGK/h6eBsfvgFsPtlArdoBMY4sX8VgTKjLzVEJBmihQLpgf3STn6Ge0sjjFjhuMZD4rBAJ2/z6cB5XpFnC7ty8HHiipOZsbmlYMVcB1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gvuPN3wNUBWi1jP7oof5pEycn03Qkpk22kTeime3GW0=;
 b=P29eL1FxgPlRU0K3dvjgPDgA9iv/yCRA67seqlobF4E6Be65mu06vPxGnbYXSH4Iy7m1geBA0k+DxNwXIfOV5wQGHP7i5O4e9cO9kI6EEtc9YBomJD/FInB5AhhsZ4miwtKKuvcBl0IJvOYjPIBxJ8XFzMNVpugIKBO4MTQSHK86izzzCb6ZnpZZO0HWFnmMoa7KJnd74XIbVirDhf87Yzu7ozQ7XkuJ1XMeYTs6+Hhgm70aEbQ8cjhLc0oiwUddEk6OtrrNFu08kfNVvwVNaRI4LRhcmiXFUMd4jUZpsZtP/R0de+Mn6jrpQ/gdzxw+2meKFM6B2bVkwL4gj+2fPw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAWPR04MB10054.eurprd04.prod.outlook.com (2603:10a6:102:38b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 22 Jan
 2026 12:45:40 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%5]) with mapi id 15.20.9542.009; Thu, 22 Jan 2026
 12:45:40 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Thu, 22 Jan 2026 20:44:58 +0800
Subject: [PATCH 2/4] ASoC: codec: Remove pxa2xx-ac97.c
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-sound-cleanup-v1-2-0a91901609b8@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: bb20245b-d444-43a5-f553-08de59b42626
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|19092799006|1800799024|366016|921020|38350700014|41080700001;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cEoyRHpmTzBkZThmUUpWdjFKRVNNUng0cGR1a2QxT1NoS1hmVDNCNGVTSm9U?=
 =?utf-8?B?NTB1NC93cUZ2NGM4V2trUFRib3JrYUROc0JDVCtlTWxOWDRwQTcxRmE2Z1Bv?=
 =?utf-8?B?MHU4VkRENnJGS3lzb2RBVVI0Vkg0MmdIMWVSTHRpN3VlSEMvVFFYYWh5TGhw?=
 =?utf-8?B?UlU1VVNSVkFjVjVQQ0FtMnRkbWkzYzAyRHB5YTIyeHZ4cldFZ2liVnlTZHFx?=
 =?utf-8?B?S0FzYVVZNDEvNktzVjVRd0M4V2NrWlBMbHZJak5haWhseDcvUzlCU0pjdStx?=
 =?utf-8?B?OERxdU1FYlpLM001eWZCaTBGZXZHWXoxNTljUVBhR3RrVlNJK3c4V0tqWkdU?=
 =?utf-8?B?M0NEZWdxL1RBQ2lsWWh6c1JBbjFIemsxdHhFMnc2eW9yTEc0dmdieHNhQVo1?=
 =?utf-8?B?MEtucS96UjNzRVI2VlJybEJYakdRNmtsd0k4bmxpYWIrNURHdVhTbDVRM2Rs?=
 =?utf-8?B?N3RzMzFBOEpiVmoyUU9GK2VGSUhCNzRuejZBbDlUTURXamk4cFBobitDN1pJ?=
 =?utf-8?B?ODc0Sk8vQzhTTURhN1JHNnpqenBDaktJeStwcm90NXZDd3Uxd1MvaHpwTjUz?=
 =?utf-8?B?NHdZYXVmdXdCOFY2cHF3UWRvcWZsNS9iMERQK0xjYzc3UHRJNG1uQWVtZFdO?=
 =?utf-8?B?NjdzY05YQ05aWndISW9QRG9CcXZEMnZYN3RqTEozTHhBTGN6d1JpWTNUUWQw?=
 =?utf-8?B?RUZZd1ZMb2ptUWpVSzZNOTBhQXMvYUJRa09UTDFlTnBMVFFyUnd5Z290cEJi?=
 =?utf-8?B?a2Nhd09MWlZvVmkwR1NLYlJrT0xtRzV5dlV6THBkSDlnMlNDMjEyMTR2NTdM?=
 =?utf-8?B?dVd5R2NjSHZCdHk3VFNMV09mdGY4ZDNjL0ZOcFFxb2lMVWFlb0dEOEIzNEJL?=
 =?utf-8?B?RWJKNXRPeUhiMFBBWFZRdTJ3czlsdXlFZjhCK3JTcDA3N04xOFhQaGY1NU44?=
 =?utf-8?B?ZnlTR2l1alZWL2NzMjR4TERkekF3VmlVbzZ5UnUwUlIzUGRsdTVmaHB4MkFT?=
 =?utf-8?B?MnRFYm9USDhSL1BQQ1ZKR3R0VUlSejhhay9qYVdwclVjdTNNZHVZajFTZGEx?=
 =?utf-8?B?RDVlazdBVmFYbmdaL2VMYnM0QVdJZWVwdUVsd2t3ekNUYXo0K1hXNU5YN3FH?=
 =?utf-8?B?S21xNzVSSFZKMW55NTFaQnNuRklUZEpic2ZqTFRLUW9jQUlqNnpvTlc3WnpU?=
 =?utf-8?B?ME5tMGl2aDdjWGkxVEczSDQwT1dPNTRwRDZ3dC9NTVA2YXM0a1BDM0x2alow?=
 =?utf-8?B?dzFTalhFRktoWTl1YmJoN2hXcjJnY1VMVmN4c0ZGaEFYSUR5WWVKam5MdllD?=
 =?utf-8?B?MzNqVFM5UTJKcTRURmhyMFZpTGVGb3ZKUDVrOFdhUVFCYXdXUjJGTkd2QWor?=
 =?utf-8?B?MzloQjRxL1BEUUE2Rmx3MHpWakdKL1JXMUliVDA0S0htelNDNDdXbEZEZjB4?=
 =?utf-8?B?dUhDa0hLRTNYZWYwOGJEQ1FLZVVockxiblBjZ01lU1kvR0hBTnRmMnlUZkYy?=
 =?utf-8?B?T2M4ck12NjdIL2c3ZVA5cDNJMHFRcWlhZGVCZHI5NmxDeWlqVzc4NkQ5QmF5?=
 =?utf-8?B?TUdSOFNObFlQWWVjaHRwTVNxOUZwTXZDdVdnRE91eFhlYXBlWG1YKzZ6dkE5?=
 =?utf-8?B?bXpROXBMNC8xaFhpNE5aWTVlaDhXamNqenJWL0o1QnQyY2IrM28zYS9Oajd1?=
 =?utf-8?B?TUpyR256RXlSN1hoeERrK2ZmQkhRN3ErKzR2SWwrOVVHTWt4amRaVUg5SFVk?=
 =?utf-8?B?bm02WXcraE03M2NZekxtODNuS01JclBpU00vck8zM0RCWmtxTE5XazBndFJD?=
 =?utf-8?B?Yk9Gbk95YlFWYUUzZ0ZiQUJ3Q0o3NG5JSGhKYkhxTU9CcmJzVnZYVGlVbFFy?=
 =?utf-8?B?amgwMk9zYS9IK1Q0cmdnMmZtVnAyMzFVNS81Q1JLMUk3Z3Btd1VXbi9ncUI1?=
 =?utf-8?B?TW5XdmdHOVdmZEt2QllCeWtDV0JuNmdqRTg3VEc5cHNuS1BOVFMwRXdPMW5R?=
 =?utf-8?B?Tk83T25mUGNMdmNLMVFZcllhK3pFOGFjYnZha3RFVU11Q0VuVWVTdnVUUUN2?=
 =?utf-8?B?dXl6N2hicGxYTTB4ZjJ4Y2U2RDJkVjRFOUhDVGpjL0p1R3pkd3hNekxyWHR2?=
 =?utf-8?B?VkVVZFpMTHJRVmMrSmUwbXJzVTQxaHhjS21veU5KMW5OcHlxekU2VTZmNWM5?=
 =?utf-8?B?bmVoUFZycmgwbkhsQ1Ftc3B6ZmN5T3BxQjZhR2lzYUEvODF2d1NiYlZkVm9S?=
 =?utf-8?B?QjFzcmszVnNmWlFiYjhnR2NGOVFnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(19092799006)(1800799024)(366016)(921020)(38350700014)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U0k2TzVJRGp2L2kwaEx1WndWREgweDdRTVdwb1p5b01pZitrTGErSUp1djRv?=
 =?utf-8?B?ekpGcWlyakVJMEJNWWhvYlNMWG52YUMwS2puQURXa0FMYVh6U250SHZSNE9n?=
 =?utf-8?B?L1JnOFpqOCtabmlLWHVlWWJCbmNNSUpxbExsSzFBTGNPZWJLbjBSOGVVM3RG?=
 =?utf-8?B?UnRyRFUzcjE0elo1bitsOTYwbENRblZVam1kL2JPWkMydzY3VExUOHRNSVJQ?=
 =?utf-8?B?KzNGUmNpWU1Eb3ZPYlFvcGhhRGUzaFVnZ3RqZHo5a3g3Y2hRYVdLbWg2a3Jv?=
 =?utf-8?B?YnFQbWh4bDBiUXAyT05NUnVDNWZwNDY0bkFBbysyUU5oRk00aHByeW55MmpI?=
 =?utf-8?B?UExGbnRKcUNEQmZFZzNTTEZaQ3ZaV0Z6TTV4T2xndDN5T2pqVnNFSlZhVXJv?=
 =?utf-8?B?Q0FwUnIwc0Vxb25LZE5xR3VXWE1SQXc3Q0Yya0QxY2JnMGE4Y25tRG5ScTA0?=
 =?utf-8?B?ZjQ3U2pmQ1pvUU5HTUhiZTRFQlZ2aU1YWUZTZFBkNnVVVlZCTVpUT28xZEhy?=
 =?utf-8?B?ZXdKWnYwTmpjcTFCZExsWWIzOEh4cGxNZWxzdUVVbmR1WGdWTjhoM204OUFU?=
 =?utf-8?B?V1NoZ01vdkxYUmg2WE03RzZMRlFxZ3VHbGFwOWJ4czlZa0Y0N0ZrUUxmNjBX?=
 =?utf-8?B?ckxMbWx6Qkpva2djSWtxQ3VFa2NYMXpQUEU1NWZDbUR4THprcDNuV09MdVZR?=
 =?utf-8?B?eFpyV2ZkTFJPQURKMVU2T2ZsRnp3Qmg4b3N5cWprelowRGFEK3dScS8zZGZm?=
 =?utf-8?B?YTNFK01pb3FiYk4vUHJvMXpseEhhUlFiSTA1alNrNCtQSHpudWk4MTdJOWMx?=
 =?utf-8?B?MkxEbUJra0pVSEVqYlc5UVI3S0dEdlpRTys1dGxuQ2IwYmtYRS9oeU9Nelhq?=
 =?utf-8?B?Y3VXVU9NanphNEdTSU9uSUxkNjNSMHZTK3BweHh0akxNOEV3WGVoVm14anZH?=
 =?utf-8?B?ZEtSNUJxUDZLYlFHUk1rMmY1UDBFWGJ2Q05RaGNxa0ljR2dUdm41anBCYjVC?=
 =?utf-8?B?Z0VPUTFMY0RNaWEyMjllbmZjczl5QkZmSFBzaFQwYU1OZ09RdVRLUmxVYnlh?=
 =?utf-8?B?cVI4TWNWRjlLYnBHVm84YlliMGFKL2VDZTBwcXRWemNOT2l1bkJ1RSt2ZlZX?=
 =?utf-8?B?YmR6MERDRVp1QWNLRENvOHA0YUZRMngrS04rTEluZDA3OVQyQ3owRUI4Z3Jz?=
 =?utf-8?B?d3Z4blhvdGErRjliUUFsYk9BcTkrN3E3NzJVczRZRzBYckh0b1k5RmdQKzhH?=
 =?utf-8?B?UEVROEZ0aUYyTWgxemhqdWx1akRLTEcvNDd2TWlkR0ZtRmxNcDBHZ3BRRXVH?=
 =?utf-8?B?czFTUFdiR0xPWWpralVubFQ2VVpmbVNYMzcxbHN4QWpMbzdnTkQzSmZMS3Iz?=
 =?utf-8?B?SEJPMzdEVkRXOGREeU1NVC94UTVUeWlMK0ZFRlZCeVA5eGdPYjc0U0FlZ2lF?=
 =?utf-8?B?VitKMlIvZU92QktJVFd1WTFwaXA2aUNEQnVMZzFJVHE4NE1Za0lmYjB6QUc0?=
 =?utf-8?B?VTlIR1BYYlZzYUlwM2xoRXlWS1ZxYjc5MG1MNWdTQmVGSjJnTUpTVWpPNWFX?=
 =?utf-8?B?TjZEcFpqcnJ5bTlpM2pVaTZlMFdRUld3YStEU0RPUFNRQjBtb09TdllQV1FT?=
 =?utf-8?B?Tmc5aW4wMFB3MXVoN28wMUwvU3RwalBiNUsvcWM0MHc5ZG1vcXVYWHpQU2xu?=
 =?utf-8?B?VmhpVzVLNTFmR2hhb2liTURORG0zTWVsaG1iOHNpUDYwa1FuS09YRXlpdll1?=
 =?utf-8?B?MVBjRXBOdGRCWmJKR1E1cXRpYzBROXRCd29DVVNxMEp4QkxWZjdxUjlKQThk?=
 =?utf-8?B?Zm44M2M3LzgxWXNaYndaYXRjVXZRd2pPTmR6dmZRSjNjczhPQ0VJNDUzUGVl?=
 =?utf-8?B?YnB4cU5hTHBIQVR6RDdvQ2NOZytTRHY0QUdZb3I4V3ZsL0tTZ2RJdTY5aXlq?=
 =?utf-8?B?aVVVaDB1TVFzc0RUc2xVcjFCSVRkanZraVVhVVkvakw0eE9uN09LaFNQZUdF?=
 =?utf-8?B?N0xQbmZDU3dOQ0V6NCsxL2lLTURHZ1ROaEZHODZablJzbU9pQUpBZFNUZEtH?=
 =?utf-8?B?L2M0c0JBQk5vVllWVHVZaGIwR0d2dHUzNlZjc2p5RzNNb3pPY1Y3bWJPQmdS?=
 =?utf-8?B?ZEhxdnBiZ3ZlR3hpNXNIcjVSZmV6Ni9VeGwxS1YrUlRwQTBCV2NzMlNSclp2?=
 =?utf-8?B?eXlJb0p3UHRaRm53cno4VWNvRis3cW9Jb0gvYjdHaE9GR3l3bTZnNkJQT2NZ?=
 =?utf-8?B?TEw4WHlkTlF2RE45MFhmTnQyN2N4bTYxLzFoR1dvcUNkV1czZm9uRGtGbEll?=
 =?utf-8?B?NVVHYm51NUJzVFFQN3lpZzV1K1Y1MlU2dzAyckx1bjBYMG9hekpsUT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb20245b-d444-43a5-f553-08de59b42626
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 12:45:40.4048
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QUk1SLSDkTi0PgW7eLRP2owLvlvrUImYnpXR/mufjBkYbbDK9L+3MnLG1gnEhHEUZjlL+Qdh0j2DNG/3D/E1bw==
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30895-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[perex.cz,suse.com,gmail.com,kernel.org,zonque.org,free.fr,intel.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peng.fan@oss.nxp.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[NXP1.onmicrosoft.com:dkim,dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns,nxp.com:mid,nxp.com:email]
X-Rspamd-Queue-Id: CB8B56705B
X-Rspamd-Action: no action

From: Peng Fan <peng.fan@nxp.com>

With commit ce79f3a1ad5f ("ARM: pxa: prune unused device support") and
commit 2548e6c76ebf ("ARM: pxa: pxa2xx-ac97-lib: use IRQ resource"), there
is no 'pxa2xx-ac97' platform device created by machine level code, so this
driver could be removed.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 sound/arm/Kconfig       |  10 --
 sound/arm/Makefile      |   3 -
 sound/arm/pxa2xx-ac97.c | 286 ------------------------------------------------
 3 files changed, 299 deletions(-)

diff --git a/sound/arm/Kconfig b/sound/arm/Kconfig
index dea2c661b3537309d8ba0ab044640f15205bf29c..e4d7288d1e1e3e7c5d081a7bf474319693d5bff6 100644
--- a/sound/arm/Kconfig
+++ b/sound/arm/Kconfig
@@ -18,16 +18,6 @@ config SND_ARMAACI
 	select SND_PCM
 	select SND_AC97_CODEC
 
-config SND_PXA2XX_AC97
-	tristate "AC97 driver for the Intel PXA2xx chip"
-	depends on ARCH_PXA
-	select SND_AC97_CODEC
-	select SND_PXA2XX_LIB
-	select SND_PXA2XX_LIB_AC97
-	help
-	  Say Y or M if you want to support any AC97 codec attached to
-	  the PXA2xx AC97 interface.
-
 endif	# SND_ARM
 
 config SND_PXA2XX_LIB
diff --git a/sound/arm/Makefile b/sound/arm/Makefile
index 899edb4bb278dad0e7dd90fd11703f4dca6c3cb1..99325a66cf771ad7a22df18b340221fa13e69a2d 100644
--- a/sound/arm/Makefile
+++ b/sound/arm/Makefile
@@ -9,6 +9,3 @@ snd-aaci-y			:= aaci.o
 obj-$(CONFIG_SND_PXA2XX_LIB)	+= snd-pxa2xx-lib.o
 snd-pxa2xx-lib-y		:= pxa2xx-pcm-lib.o
 snd-pxa2xx-lib-$(CONFIG_SND_PXA2XX_LIB_AC97)	+= pxa2xx-ac97-lib.o
-
-obj-$(CONFIG_SND_PXA2XX_AC97)	+= snd-pxa2xx-ac97.o
-snd-pxa2xx-ac97-y		:= pxa2xx-ac97.o
diff --git a/sound/arm/pxa2xx-ac97.c b/sound/arm/pxa2xx-ac97.c
deleted file mode 100644
index 77b11616a7ee05a45573d1b643f3192f35c0c38a..0000000000000000000000000000000000000000
--- a/sound/arm/pxa2xx-ac97.c
+++ /dev/null
@@ -1,286 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * linux/sound/pxa2xx-ac97.c -- AC97 support for the Intel PXA2xx chip.
- *
- * Author:	Nicolas Pitre
- * Created:	Dec 02, 2004
- * Copyright:	MontaVista Software Inc.
- */
-
-#include <linux/init.h>
-#include <linux/io.h>
-#include <linux/module.h>
-#include <linux/platform_device.h>
-#include <linux/dmaengine.h>
-#include <linux/dma-mapping.h>
-
-#include <sound/core.h>
-#include <sound/pcm.h>
-#include <sound/ac97_codec.h>
-#include <sound/initval.h>
-#include <sound/pxa2xx-lib.h>
-#include <sound/dmaengine_pcm.h>
-
-#include <linux/platform_data/asoc-pxa.h>
-
-static void pxa2xx_ac97_legacy_reset(struct snd_ac97 *ac97)
-{
-	if (!pxa2xx_ac97_try_cold_reset())
-		pxa2xx_ac97_try_warm_reset();
-
-	pxa2xx_ac97_finish_reset();
-}
-
-static unsigned short pxa2xx_ac97_legacy_read(struct snd_ac97 *ac97,
-					      unsigned short reg)
-{
-	int ret;
-
-	ret = pxa2xx_ac97_read(ac97->num, reg);
-	if (ret < 0)
-		return 0;
-	else
-		return (unsigned short)(ret & 0xffff);
-}
-
-static void pxa2xx_ac97_legacy_write(struct snd_ac97 *ac97,
-				     unsigned short reg, unsigned short val)
-{
-	pxa2xx_ac97_write(ac97->num, reg, val);
-}
-
-static const struct snd_ac97_bus_ops pxa2xx_ac97_ops = {
-	.read	= pxa2xx_ac97_legacy_read,
-	.write	= pxa2xx_ac97_legacy_write,
-	.reset	= pxa2xx_ac97_legacy_reset,
-};
-
-static struct snd_pcm *pxa2xx_ac97_pcm;
-static struct snd_ac97 *pxa2xx_ac97_ac97;
-
-static int pxa2xx_ac97_pcm_open(struct snd_pcm_substream *substream)
-{
-	struct snd_pcm_runtime *runtime = substream->runtime;
-	pxa2xx_audio_ops_t *platform_ops;
-	int ret, i;
-
-	ret = pxa2xx_pcm_open(substream);
-	if (ret)
-		return ret;
-
-	runtime->hw.channels_min = 2;
-	runtime->hw.channels_max = 2;
-
-	i = (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) ?
-		AC97_RATES_FRONT_DAC : AC97_RATES_ADC;
-	runtime->hw.rates = pxa2xx_ac97_ac97->rates[i];
-	snd_pcm_limit_hw_rates(runtime);
-
-	platform_ops = substream->pcm->card->dev->platform_data;
-	if (platform_ops && platform_ops->startup) {
-		ret = platform_ops->startup(substream, platform_ops->priv);
-		if (ret < 0)
-			pxa2xx_pcm_close(substream);
-	}
-
-	return ret;
-}
-
-static int pxa2xx_ac97_pcm_close(struct snd_pcm_substream *substream)
-{
-	pxa2xx_audio_ops_t *platform_ops;
-
-	platform_ops = substream->pcm->card->dev->platform_data;
-	if (platform_ops && platform_ops->shutdown)
-		platform_ops->shutdown(substream, platform_ops->priv);
-
-	return 0;
-}
-
-static int pxa2xx_ac97_pcm_prepare(struct snd_pcm_substream *substream)
-{
-	struct snd_pcm_runtime *runtime = substream->runtime;
-	int reg = (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) ?
-		  AC97_PCM_FRONT_DAC_RATE : AC97_PCM_LR_ADC_RATE;
-	int ret;
-
-	ret = pxa2xx_pcm_prepare(substream);
-	if (ret < 0)
-		return ret;
-
-	return snd_ac97_set_rate(pxa2xx_ac97_ac97, reg, runtime->rate);
-}
-
-static int pxa2xx_ac97_do_suspend(struct snd_card *card)
-{
-	pxa2xx_audio_ops_t *platform_ops = card->dev->platform_data;
-
-	snd_power_change_state(card, SNDRV_CTL_POWER_D3cold);
-	snd_ac97_suspend(pxa2xx_ac97_ac97);
-	if (platform_ops && platform_ops->suspend)
-		platform_ops->suspend(platform_ops->priv);
-
-	return pxa2xx_ac97_hw_suspend();
-}
-
-static int pxa2xx_ac97_do_resume(struct snd_card *card)
-{
-	pxa2xx_audio_ops_t *platform_ops = card->dev->platform_data;
-	int rc;
-
-	rc = pxa2xx_ac97_hw_resume();
-	if (rc)
-		return rc;
-
-	if (platform_ops && platform_ops->resume)
-		platform_ops->resume(platform_ops->priv);
-	snd_ac97_resume(pxa2xx_ac97_ac97);
-	snd_power_change_state(card, SNDRV_CTL_POWER_D0);
-
-	return 0;
-}
-
-static int pxa2xx_ac97_suspend(struct device *dev)
-{
-	struct snd_card *card = dev_get_drvdata(dev);
-	int ret = 0;
-
-	if (card)
-		ret = pxa2xx_ac97_do_suspend(card);
-
-	return ret;
-}
-
-static int pxa2xx_ac97_resume(struct device *dev)
-{
-	struct snd_card *card = dev_get_drvdata(dev);
-	int ret = 0;
-
-	if (card)
-		ret = pxa2xx_ac97_do_resume(card);
-
-	return ret;
-}
-
-static DEFINE_SIMPLE_DEV_PM_OPS(pxa2xx_ac97_pm_ops, pxa2xx_ac97_suspend, pxa2xx_ac97_resume);
-
-static const struct snd_pcm_ops pxa2xx_ac97_pcm_ops = {
-	.open		= pxa2xx_ac97_pcm_open,
-	.close		= pxa2xx_ac97_pcm_close,
-	.hw_params	= pxa2xx_pcm_hw_params,
-	.prepare	= pxa2xx_ac97_pcm_prepare,
-	.trigger	= pxa2xx_pcm_trigger,
-	.pointer	= pxa2xx_pcm_pointer,
-};
-
-
-static int pxa2xx_ac97_pcm_new(struct snd_card *card)
-{
-	struct snd_pcm *pcm;
-	int ret;
-
-	ret = snd_pcm_new(card, "PXA2xx-PCM", 0, 1, 1, &pcm);
-	if (ret)
-		goto out;
-
-	ret = dma_coerce_mask_and_coherent(card->dev, DMA_BIT_MASK(32));
-	if (ret)
-		goto out;
-
-	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_PLAYBACK, &pxa2xx_ac97_pcm_ops);
-	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_CAPTURE, &pxa2xx_ac97_pcm_ops);
-	ret = pxa2xx_pcm_preallocate_dma_buffer(pcm);
-	if (ret)
-		goto out;
-
-	pxa2xx_ac97_pcm = pcm;
-	ret = 0;
-
- out:
-	return ret;
-}
-
-static int pxa2xx_ac97_probe(struct platform_device *dev)
-{
-	struct snd_card *card;
-	struct snd_ac97_bus *ac97_bus;
-	struct snd_ac97_template ac97_template;
-	int ret;
-	pxa2xx_audio_ops_t *pdata = dev->dev.platform_data;
-
-	if (dev->id >= 0) {
-		dev_err(&dev->dev, "PXA2xx has only one AC97 port.\n");
-		ret = -ENXIO;
-		goto err_dev;
-	}
-
-	ret = snd_card_new(&dev->dev, SNDRV_DEFAULT_IDX1, SNDRV_DEFAULT_STR1,
-			   THIS_MODULE, 0, &card);
-	if (ret < 0)
-		goto err;
-
-	strscpy(card->driver, dev->dev.driver->name, sizeof(card->driver));
-
-	ret = pxa2xx_ac97_pcm_new(card);
-	if (ret)
-		goto err;
-
-	ret = pxa2xx_ac97_hw_probe(dev);
-	if (ret)
-		goto err;
-
-	ret = snd_ac97_bus(card, 0, &pxa2xx_ac97_ops, NULL, &ac97_bus);
-	if (ret)
-		goto err_remove;
-	memset(&ac97_template, 0, sizeof(ac97_template));
-	ret = snd_ac97_mixer(ac97_bus, &ac97_template, &pxa2xx_ac97_ac97);
-	if (ret)
-		goto err_remove;
-
-	snprintf(card->shortname, sizeof(card->shortname),
-		 "%s", snd_ac97_get_short_name(pxa2xx_ac97_ac97));
-	snprintf(card->longname, sizeof(card->longname),
-		 "%s (%s)", dev->dev.driver->name, card->mixername);
-
-	if (pdata && pdata->codec_pdata[0])
-		snd_ac97_dev_add_pdata(ac97_bus->codec[0], pdata->codec_pdata[0]);
-	ret = snd_card_register(card);
-	if (ret == 0) {
-		platform_set_drvdata(dev, card);
-		return 0;
-	}
-
-err_remove:
-	pxa2xx_ac97_hw_remove(dev);
-err:
-	if (card)
-		snd_card_free(card);
-err_dev:
-	return ret;
-}
-
-static void pxa2xx_ac97_remove(struct platform_device *dev)
-{
-	struct snd_card *card = platform_get_drvdata(dev);
-
-	if (card) {
-		snd_card_free(card);
-		pxa2xx_ac97_hw_remove(dev);
-	}
-}
-
-static struct platform_driver pxa2xx_ac97_driver = {
-	.probe		= pxa2xx_ac97_probe,
-	.remove		= pxa2xx_ac97_remove,
-	.driver		= {
-		.name	= "pxa2xx-ac97",
-		.pm	= &pxa2xx_ac97_pm_ops,
-	},
-};
-
-module_platform_driver(pxa2xx_ac97_driver);
-
-MODULE_AUTHOR("Nicolas Pitre");
-MODULE_DESCRIPTION("AC97 driver for the Intel PXA2xx chip");
-MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:pxa2xx-ac97");

-- 
2.37.1


