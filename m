Return-Path: <linux-gpio+bounces-19367-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 170DFA9E615
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Apr 2025 04:10:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F1C4E3BA3F9
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Apr 2025 02:10:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C323C18CC15;
	Mon, 28 Apr 2025 02:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="oSc2oJU2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2049.outbound.protection.outlook.com [40.107.22.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72BE0187554;
	Mon, 28 Apr 2025 02:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745806240; cv=fail; b=SW9R4++wdDq+nJlt54MLk5TIVK3plK8dQw91z3hjszNcdutq7ctZgRbMBwtua1yuM+lyQfDNo4xL2NLDgfU6IEZGeKsedEpgi/sqy22R/K0tkNgWrbvHzdS97pVxoBvlnewbwmoYtCBJjiwxYeVmYzIQ/98VTuqFfSKppARUuv8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745806240; c=relaxed/simple;
	bh=WmWEMGpAr060NPHpA9vEq/IDhPt9ii3h7KK+2DjM7u8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=F14olIVhwsvQPdg7JQbigeoKVNY95+fqkqcfhWMmb+IlKcYCdIxzeNauP2chOURx1EpjMge65LB1p4emgVk+0AP0CX0z+PvRCyEossY8THtM6QDWWPDwcTMGyglrqx2+6p50m0k3nKuAReX6FxELcngMutds9by31XNp1BM3Bzg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=oSc2oJU2; arc=fail smtp.client-ip=40.107.22.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JVQ3oDAxAG9AtX6MvJNwLPz6sHrsYwLlF0on5hYPY9XEjd2FOdxuonBBNQZ184APzBu3JeDp/efsUVzqWPwcpbip3kAkuAj2JGj1YP2D+0iB1TQtHZGpOO7VsySTFlaqdez3x3RGoScXYo0wD1iTTvJjVjfjXjalkYZ+se6XpGkxpfYos4bILZpzJtEioZAD8GR6aHSMWdbJOZwMvNQk8I2yuIPEkd9Rds0IibDZhs/UuTBJLsZP4vsu7KZwt2yf+96PMWp+fQCLwya5OQ85MdINL/zWWFKdfZVOjBreKi1jR13OrKdH3FOmc6JnnDTm+rXoABDhOs1oeaFRxbUroQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PHicfbkTkSCC16+zTSNyn7Wqg1lXjkBSUC0y/yl5ixU=;
 b=QBsAFbzc++FOtri4mrEdZUIfYXGLKsAp4p+nqH/DU21wBgiyFwYmzv2kswqyMWimgceMsUBvOZdFuWafISpg9AXHtgayr2ZcuPejJnJteuYapaqwsnOqVz2i+ppmwfF72nI95WSy0mIJYvLpM51L81JZhGhLelWOFY3CagTkymWnZ2Po8dcn8zhUN3J6q0U8ospD1v7e6Ltxx/xnQ5kiJDPrNqT1R6ddfTQTJki4acKIh4zJRgnywKo1+3VEn5XYbcEiM1Z81en64TAEz1TX8V7u5Ol/djRPiZHRbJRDKTuSEr1+PiXqhOw+7uh2TyJDcwb8iB9HQVwlRQCLQC2Dyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PHicfbkTkSCC16+zTSNyn7Wqg1lXjkBSUC0y/yl5ixU=;
 b=oSc2oJU2MrG3culf2DvEadIblmBV+6pIJ+G5/y6tQu5LL0j18p0+XTlWFqhM0pS+d66j0sxWnKXoztVJfTlYZn0rCNF7sv3DYNwEf7KsmYGzfzwEwMI44fdeDYMnVjYXWh0U8hNCINEhrHedC5a6scguaSwnlZwsEwsIreZHd6JNzdFjTu3Z2deggTYHl5sMxvkQgrPZedkixTpkxkxc0gfcV5jInIR0Zc5Um6yHlCXkJPvAoWs9jauoHGenf1PI9qJj3b4YsIHhOG3zq56B+er9ZcxJAM/kzYj4s7YQPfH5iRPx9XbVYTATKUvb0NNxvrRCZBHBoIOOdjaPF8EAJA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GVXPR04MB9901.eurprd04.prod.outlook.com (2603:10a6:150:113::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.28; Mon, 28 Apr
 2025 02:10:35 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 02:10:35 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 28 Apr 2025 10:09:03 +0800
Subject: [PATCH v2 2/9] ASoC: codec: cs42l56: Drop cs42l56.h
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250428-csl42x-v2-2-e8056313968f@nxp.com>
References: <20250428-csl42x-v2-0-e8056313968f@nxp.com>
In-Reply-To: <20250428-csl42x-v2-0-e8056313968f@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745806152; l=4198;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=lKYKdfXJt5CqpMiGHd0lAjX1uKA75ahivOnL6OvYvEA=;
 b=s6ByKCTOybyav36cpld8oHpnfa59XmvVtGbSIdEJ1A80LhXxSMXs5bXSBof0XDMldpxrGaqT/
 Nsd8pxzqYtlDf1lpuCtdgg6E2Rt8uz21pUaiV+oofVbbAmodkf++YoA
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI2PR01CA0027.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::7) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GVXPR04MB9901:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c1ff546-3ebe-4df3-b04c-08dd85f9dcf9
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V0tpalJPekI4cHRtM01CL3ZUYWt5VzNuU1o4SmZRZmExZkZ4dXEyVElYV2dh?=
 =?utf-8?B?Z3N2NHVnbzQyUjhXdEROanNNL1NXMENtTlZuRHlKSDh6Z2UzUnN0TzJ6M1JT?=
 =?utf-8?B?S3gwaGovTXNmSjI4aXpYUVczbWlPdEoxN1A4WUJpVDRHTEptUDcvd28xT3Ux?=
 =?utf-8?B?SFJkUHp3VlVvR3RRbXJmR0hLV0lNQnN3SzhmZGFrYk4zeVZFQU5ab3dqNW9i?=
 =?utf-8?B?VlplVkdkdHI3RjNxWVhtRG5ZN1A5SmUzYUVsZyttekVtTlZnajZjMTcyUHg3?=
 =?utf-8?B?djlrbTRVbmg4WlAwZGJJNGpWMGxxMXpPeDM0Y3BLVGNoQ1A2M1d3WDd3Yksr?=
 =?utf-8?B?YXZ1NTlGQ0pva09SUi9tL0FOZjl4bXpjMzhPOWpOSVJoRG1zckFuYTgwcjZG?=
 =?utf-8?B?MDdVenU5TTFWbFpQd1ZwZXVac1hFMzZ4bU1IM1I1clNYa0hWWEJqOEk3L2FN?=
 =?utf-8?B?MmN4OHhwY1c5QkczSERPL0l5bmY2c2dlL2doekJabVlqQ3QzMHE3MFRzRTdB?=
 =?utf-8?B?VEpBUlpKS3RCbVNpQzJuVFRZVExrWEI2UGRRZVR4cVRMdytNVWg0TXY5WnhQ?=
 =?utf-8?B?U2UzcW1SMmt5bkNmTEtYZkpXclNxT3lDbmpxQlhtM0E4TG9oZGpDVml3czc1?=
 =?utf-8?B?U00rekt0RDFnanNUMCtuQVUwMUk4UHZReWtEVjNENVBSZWw0YVpIVWhoY01y?=
 =?utf-8?B?bTcrMFE0U1ppZjU4VCtkQVhqWnFnMVFNTFBnWG1jYzZFVjZlbnkwYjNqclA5?=
 =?utf-8?B?TzNGMGVzVEoweGM5MjVpYml4RVBuajNqOVlXSm5qNGNpTHJ3ajhpVmwzVVho?=
 =?utf-8?B?bmJpQ1Z2elNuN09PV1dqV3VybldvZTI5Q2ZiM1ZZMkc2bURrUGtmMTlXU3J5?=
 =?utf-8?B?VnFPTmFoOHRPdXVxbnp2YUt0SnRKand1enVydHgwU1JwczdTN0VtMFBQMGxy?=
 =?utf-8?B?ZDJtK0V5ZUIwUndSeDZPVWVpU2tTS216ZHljTEVaRDRMMHNoVnovT0NneVFn?=
 =?utf-8?B?cktsS25POHRUUG0zNitFclBFMkRYZ0wvY1hWOFE4VFdweTl2cWxOK1pjUkFw?=
 =?utf-8?B?dkYzTXBPWEgzUkdBdjYyU25TeHpzYW4wZkExSlJaeDViUzlzak15UUEzN29C?=
 =?utf-8?B?ejZWS0pWOEJHcWxyOUttdjMwUEJ3RWFxMVpvRGZMQi94ZEdTcUpsT3M0VGly?=
 =?utf-8?B?N0s4YXpHK215UFQ2Y1RCWG53SDNmbi9tM3BVY2I1dk1KTjBCOUVUZFlRNzhx?=
 =?utf-8?B?Z3ZpbGFKYXVyQXZTSURlM1RJVE92Mk9hL0lnZXdwWTgvU3Z5UWVBSFNrdUFY?=
 =?utf-8?B?aklmZWpMcGFPSDBzWDNncFVNRFZDa0VOYTZvQnUrV3k4bHo0MTdsck1Wb3Zr?=
 =?utf-8?B?VUNmcnV6RkttS3RITHBIZERSWXNCQUZUY2t2UkxzNnNMNEtIamd3L3E0cGVF?=
 =?utf-8?B?U3JjYXRoUDVncXVET3J1UlltQnlnVVEvVGp5dTc0OGJEbHY1SS91TzBxVGZt?=
 =?utf-8?B?cGp3Mkw4ZDZPNytKZU9pdXFValZ5b2oyOXZYc1hvdWVPUkk5eldwTG5aMHEx?=
 =?utf-8?B?UEE0Y1Qvbkt4b08xdTZCOHJ1OGJiMjc0akl5OFpHR2JKd2swVEVqb0JXdWsv?=
 =?utf-8?B?RWhNcjVCZEYvRnNZamZHeW1ncmh5M3BSMFVGcE9mU3dGSnhtczY1Q0JVSTRt?=
 =?utf-8?B?WGllZWlTQmlFNWhTZDF0cG5NdGpaWFV2WjBEWmJaU2NpMTMxK3JkMzFXRjQ4?=
 =?utf-8?B?YUUwdHhCRkxwMlU2T2IreFIyRDVJWk1PSDd1MENqeERjQktZUTRIejk2b3Q1?=
 =?utf-8?B?Qm9xWW45eVJBQmoxTDdlSHhMNHNpL2hqYjBNRTZUMVBXTDFTZXd1cXo0RGxL?=
 =?utf-8?B?ZGhaenplR1RXTVlHSDB5SldOdXdBcEtwNktjZmFHQlFiZlJ3MW53V0R2dTcz?=
 =?utf-8?B?N0doSGpORk9wUWp5MDlPQlhibXluM0EvM0QzTjkvQlVnN3BLRXluZ1FVYkk0?=
 =?utf-8?B?QUd1RlhoaEpBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eE1xRG5kN2pNRnB6eG8rZEZLQTh6MUxNV1Q0azliZCtIUDhmNVVreXlVSm1S?=
 =?utf-8?B?aHZRSzJXa0xmeDJFczg0UlZoYjdlbkFRZ2l4d3ZmMGZsc1hrNmtqSzZjQXph?=
 =?utf-8?B?SjhuVEJpS040SEhZWWtQVzZ4dnRCanhqOUVYY2s4a0QwZm1YWHNKQ0VhekVy?=
 =?utf-8?B?cFBOVExieGN5WUozc1ZDaVRDc2pmdXhNOUhrWmlEKzd3WGFCRDhVK3ZFTTVl?=
 =?utf-8?B?UDlXRm9zSGVVaUtpMlZKaENCSjZ6NVhlK1ZSRXRrdVBOc3JuYjkxMTluWWpl?=
 =?utf-8?B?M2c3YlNTbjBOOWJqbi9LenlpS0dpc0VwbFZYcEo5VzI2dU5LMkc1N21CbGsy?=
 =?utf-8?B?T3FlT0JwR3puUmd1MUVRb3c1WWE2SW45ZW0xS2s0M0ZReTU2dXJRVHQreUFT?=
 =?utf-8?B?Y0dxekZBaEl6OXRQVWRUY3NSZXZIS1VjYzdheXhsaDM5cEJHWnVQR0t3a1Qr?=
 =?utf-8?B?aXlEL0d0bG1iM3hUMTM0U3N0L3U3N0J5Tk14djl5ZVRYbjFEeWRSVHJXWmVk?=
 =?utf-8?B?YUdkQTRoczgrNVYwc1ZrY0tZR1BUSWFwRDBPL3ZzWkFoZnV1NnpIU1hXTmdu?=
 =?utf-8?B?RGo3a0NSeGcyR2lNdlpmZWFWU1hLdUx1R0VITUZoY2cveHJBcVZrcWcwMFZh?=
 =?utf-8?B?WW1ybnExQVplWkxreGlVQ0dLSXFWcTgzbFlQR1pBY1pHcmJ5R3hzWUJ6eGhR?=
 =?utf-8?B?TldtK1VyUlI0Y2hMaUZDeUhueW9zVDdzREZYQjlVY3czVisyTlEwWXpIWkF1?=
 =?utf-8?B?QjN6QjBIVWR3Qm1FSmd6R3FXZk9oR1prU1pmdlFVTDRodkFwV1YxNUpZWCsr?=
 =?utf-8?B?a2J1L2FCWjZMdmpLbEJNNG9vU0ppYk9Fazk4T3pRcGNoVDhtaXo5NlBQYUdl?=
 =?utf-8?B?dnp4VXlnZkVHQlFVWVlxUDdyeTlGUk1sQTZ3MVB3dlFZQjJSTkhqMlVSUWF2?=
 =?utf-8?B?dHBCRWM4eEVUcW1jVVI1V2lka29YUXJrZ2FCdEdHVkpaOWIxZ2FHenZYNkg3?=
 =?utf-8?B?SkVvTm9FN0cvWW9OMUg5WEp3L1lMZk9iTDloc2dWdVpiZEdNTGFrdzNqbUtl?=
 =?utf-8?B?d3d5TG1LVElqZG95S0FUS0hGNWR6ZGhlY0VLU3BvYXRjREE0VHpnWW02OU9o?=
 =?utf-8?B?SHNaQW5XWUczWUhwdllXUzJFaHBhWFhYY2FWb1NOOU9YOUxUZDAvSUY3SkhK?=
 =?utf-8?B?ZzBlaU93LzhNTXhaM1NPbk9RWDNqa0xSQXczNVREYXl1K2Rtd1JIb2trZU1w?=
 =?utf-8?B?V2QvaWtMdm9FSHo1QzJaY3Nla1Vic2w1aUlOV0xpaUlvMXplOEFnYkwrZ2Ra?=
 =?utf-8?B?QzNPYU9yRER4aDZRbC9ESEpRRXRZSy9vZFNUYnZzbmxEeWJGOWVCSm5NeGRi?=
 =?utf-8?B?OXo1UEZzS1A3SHBNaHBkMTZiT2w5YTdhcHByNkVqdHNORHdmWWxEL243Mkt0?=
 =?utf-8?B?QzBCOTdyWHdOMU1Wb2RxdzdVYXg4R2V4OEdOQXZPVXpZNEwrWTVVMmZBbjhV?=
 =?utf-8?B?QVFyRlFPOU56UWJPOUxuaFpPVXhoNDZ6S1czd20ydFgwdFVRNXBMdnh0dEdW?=
 =?utf-8?B?d3NrbzkrSXFadS8xR3djMnJqUk1QUitsRmlEa1R1dzVVaE5DKyttMmdKd1ZG?=
 =?utf-8?B?cnhOOHBneURJWkVHOTlMSGtnUFdpQzNENlZra2E2QnRNRVNlRy92Mzl2OTFE?=
 =?utf-8?B?K2picFZLNGExTVJjeUxDamw5d2RzWU5UdHZrMG82TEwrdmlaTWhXOEI1cGQ1?=
 =?utf-8?B?Z1ZQcjhxRHZCQS9uSFk4TytUTzRNdmN3UWVmbDRlTEVFeXhoMDdQWmtBSWpa?=
 =?utf-8?B?VEwwdWN2UE5OUGJicXlESDIvVEp1aGlIM2k3SWNkaUJVaGJPSk1DU0dlQzVT?=
 =?utf-8?B?eFo0TGRYTjVTUlpuSVVLTU5CbFphWXYwNnYwZ2RrZTFpbTY3QmRGc1lsaDds?=
 =?utf-8?B?TTZHa0hjaHU4bnI4QkQ0eVhGbTJmRUxFTXJJVERON3c2d1Z1U0NZaWlTR1Fo?=
 =?utf-8?B?dDFYRVMzcVlBakJBNVZvd2h5aEljMlcraGppZjdNdVpCVHdyczhpaFo1WjFl?=
 =?utf-8?B?OEtPZG1YbWgybExlSk1JU0drVFM1ZDVYSmFLYW5LeTU5SzlPVGVPOEIzMC90?=
 =?utf-8?Q?cgq4Xm3K/aYNGdaCPL/0ZcBKw?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c1ff546-3ebe-4df3-b04c-08dd85f9dcf9
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 02:10:35.8295
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ne/U8The+LVyDXt4YEEVZIih/7S5PlOWc7xVq7NV3c+VJyL+iZKz+phPD6WFQ5nNozBsEO2UbD64bblKhVkD5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9901

From: Peng Fan <peng.fan@nxp.com>

There is no in-tree user of "include/sound/cs42l56.h", so move
'struct cs42l56_platform_data' to cs42l56.c and remove the header file.
And platform data is mostly for platforms that create
devices non using device tree. CS42L56 is a discontinued product,
there is less possibility that new users will use legacy method
to create devices. So drop cs42l56.h to prepare using GPIOD API.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 include/sound/cs42l56.h    | 45 -------------------------------------------
 sound/soc/codecs/cs42l56.c | 48 +++++++++++++++++++++++++++++++++++-----------
 2 files changed, 37 insertions(+), 56 deletions(-)

diff --git a/include/sound/cs42l56.h b/include/sound/cs42l56.h
deleted file mode 100644
index 62e9f7a3b414f6d1bcb651b22f7f8bd1f29b0eb3..0000000000000000000000000000000000000000
--- a/include/sound/cs42l56.h
+++ /dev/null
@@ -1,45 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * linux/sound/cs42l56.h -- Platform data for CS42L56
- *
- * Copyright (c) 2014 Cirrus Logic Inc.
- */
-
-#ifndef __CS42L56_H
-#define __CS42L56_H
-
-struct cs42l56_platform_data {
-
-	/* GPIO for Reset */
-	unsigned int gpio_nreset;
-
-	/* MICBIAS Level. Check datasheet Pg48 */
-	unsigned int micbias_lvl;
-
-	/* Analog Input 1A Reference 0=Single 1=Pseudo-Differential */
-	unsigned int ain1a_ref_cfg;
-
-	/* Analog Input 2A Reference 0=Single 1=Pseudo-Differential */
-	unsigned int ain2a_ref_cfg;
-
-	/* Analog Input 1B Reference 0=Single 1=Pseudo-Differential */
-	unsigned int ain1b_ref_cfg;
-
-	/* Analog Input 2B Reference 0=Single 1=Pseudo-Differential */
-	unsigned int ain2b_ref_cfg;
-
-	/* Charge Pump Freq. Check datasheet Pg62 */
-	unsigned int chgfreq;
-
-	/* HighPass Filter Right Channel Corner Frequency */
-	unsigned int hpfb_freq;
-
-	/* HighPass Filter Left Channel Corner Frequency */
-	unsigned int hpfa_freq;
-
-	/* Adaptive Power Control for LO/HP */
-	unsigned int adaptive_pwr;
-
-};
-
-#endif /* __CS42L56_H */
diff --git a/sound/soc/codecs/cs42l56.c b/sound/soc/codecs/cs42l56.c
index 0201206518cd9ea8ecfb823a96fb59cae37c36f4..559476f767b0fb628bae6ec2728226af315b05fb 100644
--- a/sound/soc/codecs/cs42l56.c
+++ b/sound/soc/codecs/cs42l56.c
@@ -33,6 +33,39 @@
 #include "cs42l56.h"
 
 #define CS42L56_NUM_SUPPLIES 3
+
+struct cs42l56_platform_data {
+	/* GPIO for Reset */
+	unsigned int gpio_nreset;
+
+	/* MICBIAS Level. Check datasheet Pg48 */
+	unsigned int micbias_lvl;
+
+	/* Analog Input 1A Reference 0=Single 1=Pseudo-Differential */
+	unsigned int ain1a_ref_cfg;
+
+	/* Analog Input 2A Reference 0=Single 1=Pseudo-Differential */
+	unsigned int ain2a_ref_cfg;
+
+	/* Analog Input 1B Reference 0=Single 1=Pseudo-Differential */
+	unsigned int ain1b_ref_cfg;
+
+	/* Analog Input 2B Reference 0=Single 1=Pseudo-Differential */
+	unsigned int ain2b_ref_cfg;
+
+	/* Charge Pump Freq. Check datasheet Pg62 */
+	unsigned int chgfreq;
+
+	/* HighPass Filter Right Channel Corner Frequency */
+	unsigned int hpfb_freq;
+
+	/* HighPass Filter Left Channel Corner Frequency */
+	unsigned int hpfa_freq;
+
+	/* Adaptive Power Control for LO/HP */
+	unsigned int adaptive_pwr;
+};
+
 static const char *const cs42l56_supply_names[CS42L56_NUM_SUPPLIES] = {
 	"VA",
 	"VCP",
@@ -1169,8 +1202,6 @@ static int cs42l56_handle_of_data(struct i2c_client *i2c_client,
 static int cs42l56_i2c_probe(struct i2c_client *i2c_client)
 {
 	struct cs42l56_private *cs42l56;
-	struct cs42l56_platform_data *pdata =
-		dev_get_platdata(&i2c_client->dev);
 	int ret, i;
 	unsigned int devid;
 	unsigned int alpha_rev, metal_rev;
@@ -1188,15 +1219,10 @@ static int cs42l56_i2c_probe(struct i2c_client *i2c_client)
 		return ret;
 	}
 
-	if (pdata) {
-		cs42l56->pdata = *pdata;
-	} else {
-		if (i2c_client->dev.of_node) {
-			ret = cs42l56_handle_of_data(i2c_client,
-						     &cs42l56->pdata);
-			if (ret != 0)
-				return ret;
-		}
+	if (i2c_client->dev.of_node) {
+		ret = cs42l56_handle_of_data(i2c_client, &cs42l56->pdata);
+		if (ret != 0)
+			return ret;
 	}
 
 	if (cs42l56->pdata.gpio_nreset) {

-- 
2.37.1


