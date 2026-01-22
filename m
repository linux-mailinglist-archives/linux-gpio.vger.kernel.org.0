Return-Path: <linux-gpio+bounces-30897-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MB9VEI0scmmadwAAu9opvQ
	(envelope-from <linux-gpio+bounces-30897-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 14:56:29 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4986798D
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 14:56:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0AFE450A9D3
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 12:46:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD2CD2DEA8C;
	Thu, 22 Jan 2026 12:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="NI1GTBAq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011051.outbound.protection.outlook.com [52.101.70.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093B02D7805;
	Thu, 22 Jan 2026 12:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769085955; cv=fail; b=gJmqW8ffwcLvzT8DOEy4TkCWEm5bKs+20MC+kN4BeODc25tDrq+njEtP55r72a+44e/N0K9tFgc/qDe386If+yYHRsL0TKDTbGGBqAq5FpKxid+ntLagXJYH54Cwb8WD8LP9wrahXi2gzGK+lUGq+/scFMrc96nlxM1f29WQsHY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769085955; c=relaxed/simple;
	bh=wbE++HdTqwLqJPrrnpZ7f7DTQRw6gr56MZS2yhERHq4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=OoxZm6MaGMOFC3OgiOn4b04Rsvro9Uumu3Gelemgso3L1piS7CJl8oIesvX7hextVD8YC/fjJnVQv/Fejq9Ct9ES6sp9RrvyRPeIo7NZwRwgCOgda5xTmaRpF8AxPurnhFF+otkSfuZYQhP6z6PP0iPz2UdghMhcdK+hROulVnk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=NI1GTBAq; arc=fail smtp.client-ip=52.101.70.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MvXmsPu4uRXRU0AlafjBNGXBAfG9nKl8/oV0qWnGg9HxThVAf4l5ySmp5zF/aoQoPPWftEHTzos7C1f9kRsP0KdJFAK6/iaXDqpA0H5qJoKFgVb69kedEY4t2rtNzAlaAg59BedVdiqraJpQWYs5Jscb8abM+r006HEGsC+l5YJgF3cbGj0diQZH9bJkoGzl9+NTpHFAQyhrhDj68xDyZUVlB5EMxUXNC4SLTxDIwhIJ9uWEdSjhpROdbg35X+rFCN+5r1W+a2aF0U6UuWChb0iaPO5KsEgtO7SGaXFKtWMotxpYMwXQ1o9c+WrQCmn+UPJZUtfLOi6bYt4BQC2LOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AeVXcwm9321vMb7MptCgLp2a4wE+KajG9H3tEwupL9k=;
 b=Hk5giOI8ahUel80NWsyC3t+49oeSi88wBgOYGxNj03QMU6bJLFowYIfo5BuLSel1CjrE+BteOlwg6gwbbblA6QycCQJI3C4ZrN+2dmn4oFKwFdCKw1oYjwN+33Hjc8d7re25fe5VP6LSRpF7qW8LoKm6jkdITQ1mOeQEMGmHscw+8uUX8naXdOqC8e+esW2QhCLCEP7zPTnpJ59GKeLl7vlXLtMdHXs/D3An4my3C2rb0R9KHoEbEdlUeTVn4huhkZ+GncNJB6vmvrFcyiL34U6FwZ8hr+thSzGrn+Wgs9+pfZZrUgpeliXZ/iqwpVbaVjJXoDgrAKZPXyA/yvnHJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AeVXcwm9321vMb7MptCgLp2a4wE+KajG9H3tEwupL9k=;
 b=NI1GTBAqZmeKTWIoUvYAWY122FR1UGWY6M6kdh3FXFuahxlgQ+uPKgoE7NdJpBSZSg/NLcqyUVDbcApFZ5p7UFueu1zMLXnPXMVrbjn9nDEq3bT7c329Gles56ZMqo7WbIgLFslu4w1QdWDKMDaU7fCSSqAanSNvuXlEtVPwQujUk8BxQ3yLNFZUU/WyLbOweOGRApNBD7gEGMDbRPJWV17Xghk87umSx4Np1arEYb/dfngdFNrpTNMiz+K9RytkFb7jzsY9g0siPVHdSPEMAWWAS8IluVd6ukNLJPkn+H8eHqpsazvJQXZT5ejqyUeUhzJFhPoTM42zHxh7MZoMCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAXPR04MB9008.eurprd04.prod.outlook.com (2603:10a6:102:20d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Thu, 22 Jan
 2026 12:45:49 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%5]) with mapi id 15.20.9542.009; Thu, 22 Jan 2026
 12:45:49 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Thu, 22 Jan 2026 20:45:00 +0800
Subject: [PATCH 4/4] ASoC: ac97: Convert to GPIO descriptors
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-sound-cleanup-v1-4-0a91901609b8@nxp.com>
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PAXPR04MB9008:EE_
X-MS-Office365-Filtering-Correlation-Id: fad77929-f4cf-431c-15be-08de59b42b93
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|7416014|52116014|376014|366016|38350700014|921020|41080700001;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VUxFTVRsVlRNRlphTHlKTmlIajd3S1pWOWdveU9HNkw3eGhORWliU056aWhF?=
 =?utf-8?B?amtkVU9ab2pwVmQ0VTFtc0twY0Q3ekIwYTFwY05KZGo0aUZ2MG9NVkVYbllt?=
 =?utf-8?B?TEtkY3Bib1FqVXBaK0VHTVQydCs2eTFXbkFIM056bXZOb1pwcHJkbVlkTk1R?=
 =?utf-8?B?UXVleklwNEh4c0tuQkVlSGwwU3p0NHVZcXgxMkxQSkJKaEhMZExGTUlaenVK?=
 =?utf-8?B?Nm16V1BUSkYreVpSNzFxbXlsOEtiZmxRRmlEblRONDh2dUhTeWJxV2RvZXlw?=
 =?utf-8?B?czRJSS8wSXgxMUFWMGU5a2Q2ZnoxbWJ5ekpVb1VuNWxNYlpub1orVkR6SkRj?=
 =?utf-8?B?bE1aOFJWempyaVZnR25ZelV4NUI3dmZSZTVPczZ6STFRdHg3SVE3Q2c1emFB?=
 =?utf-8?B?RTUvWWJrbGZ3SDdNRjNDTDN2MlhqbWFrcTNQaTkxV3ZEK0tYUk9KaXg2dUly?=
 =?utf-8?B?QmsvWVBIV2EwOTByQmhxa2k4S2FIaUV2T2t0UW5zMFFNb3RJenV5Q2FPdUth?=
 =?utf-8?B?cTBMZWJna2FuTGF4d3d6ZWpJUlpuUmFMc3NRYi8vb0xnQVl1UkFnUEtFS01w?=
 =?utf-8?B?aEJpMVR3MGlFMnlwUXQzMEErODg0YVQwOG95bjRCbUtseTVrVTF0TkIrd0NK?=
 =?utf-8?B?ckpQWXdzTUsxWDRnWFZwVzl6SlRDc1N0ZWZSZHk2bndUZFgxQU94Y1QvaW1L?=
 =?utf-8?B?T0pBQ3lGQWljVWpNc2FObmFNSGpUQ2t2WXkwZGFJTFhoWGNtRGdueS9QZHNh?=
 =?utf-8?B?R1V5aTRJbnlTbnVIWis3NzgybkJWUENRdnUxZk5zV1lkang0UjQvTGFxYXBX?=
 =?utf-8?B?ZDNuc0ppSUY0YWdGZytZN0hka2J1eWpCL2JjV1ZVbm9RRlNyb01EaER2TXlT?=
 =?utf-8?B?NktvV3RnUmNGR3VXOVE4ZVlIRFJUWGVVdUUwc0ljWE96U0lhcnpoNDVTQ3Bq?=
 =?utf-8?B?TFY5Njl2amJFamNQYWxLUGRYSjlJc2tGVFEvR25Dbm55OTZ3T1ZJVFk3aTRs?=
 =?utf-8?B?Vy95MEh4WnI0RXN0THRWQUlVZGo1bDNIelpLdVlJWEFkanJuT2FEbGNOUHpF?=
 =?utf-8?B?a0VQTm5kMHpaMVlNbnZDQzI1a055ckMwMXlia1hXY3dKL1RLSWkxNFowY3li?=
 =?utf-8?B?RENJZzFlSnhXUkY4b0VJNUNvY29iNnJQZDlwNnhIMk5LSTMyZ3hlMkhUcFB6?=
 =?utf-8?B?WnE5YzZCaktrV2JPWWNOdFNSaTFOUGNUREoxUDBLbEY2Ui9mOG5jalBpbWF1?=
 =?utf-8?B?WlNyT1kwYWdWVUlpTkU3NkpoVkRTN3dyTWdaNWZoY09CR0xKOVRDYVJBb2hs?=
 =?utf-8?B?SDUzL0xHeXRFUlFlQ05MK1paRWp5RVgvN0Q1bWJCaElBY3F2Y1hiYlhDOFlk?=
 =?utf-8?B?ZGNSQ3J6Q3hzd1Uyc3QyT3NMS2pncTQ3OTYyWEIxUVRMb3pRa3ZFMzZYb1RC?=
 =?utf-8?B?MnNWYnFDUlQ3NHFRdXRPUzVTWXhTS1NTUDlCdnNSaW5od21wcVoyVTFNdVFo?=
 =?utf-8?B?L09nS3B0LzJ3WnBYUUNLZ1ljUkxMSi9qSjFBRkN5MmkyUW82aXFhU05IZ01Y?=
 =?utf-8?B?ZUJIcENKb2grQUw3eXA5cEVZaUNjQStQNStmZkdXRTMxNWsxWkF5VjVLclEx?=
 =?utf-8?B?cGY1bzdCM3V6RGk2OEw0UW5BS2x6UHgyaDNwSWdHVFVBUmFiU3hKT01tVm85?=
 =?utf-8?B?RURzMFE0dzhxMVdEZ0k1MWs1bjRPd1lTT3cxa2lIWThYa0JtM3F2M2lQRDI2?=
 =?utf-8?B?RU84UWFQY2QxazZWdm1YRHBMbnFiOTJyVDByRzk2aktpRXV4MC9wejVBNzVn?=
 =?utf-8?B?SWIwT0V3Tm9PT3BPeERqMVVpc2R6QzU4TzZXZVNKZmJ4dVZMSzJxcFlQNXY2?=
 =?utf-8?B?dWpiTFlXa1VyNStmQ01UUlEyanlwV21aTEJRb3RoL2I4YWJxY2c1MG81WGdx?=
 =?utf-8?B?L3EvbnoxWXpvakNlMnhUWU13UG1BM28ySjN6OEU5WVlUSHVxaHhUYldlem13?=
 =?utf-8?B?bXVZVkFhUjhtSVVCaUFGMWM5NU5xcWxSa2NxU2w1d3JFYnVCZGFuYkgwWlND?=
 =?utf-8?B?bCsvQ0tHMmJua2Zvc1hZU0VWNkZTdmhodUh5bGNVQU1kNWRGNklMZUdhTGhs?=
 =?utf-8?B?TlhEWWtVNHVGL3grK0ZIUGIweFZoVlhxSnVub0J1UXF0VlBCTjVMblVUOGdO?=
 =?utf-8?B?bXNMQmZuZGVTaHhCaDhKNE5EU2Z2VSs3NjkzZERYSGxaWlpQclpZeHVZN29F?=
 =?utf-8?B?aFh3TDNwREhOYlVNWUU4K2VhbVlBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(7416014)(52116014)(376014)(366016)(38350700014)(921020)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bzlpQ3BXejlIM3p5WEtUdFFqQjJFVHNyR1pibjVWKzdaQlVYNy9zNUYvUk55?=
 =?utf-8?B?OW1kZng4dnJqaTBLeTkwOFR1VHpMT0RtZnJJOGJnUU5VTVorUzk1QkpnMFE1?=
 =?utf-8?B?WERPbEltOER4Zy80L0RleEZyNzIyVFdHUkwrMmxXNVoyYi94RG9jYStPL3JC?=
 =?utf-8?B?SGJPckRGQ2c5QWZJLzMzVnRnYnVlT0p4cEZPbHJIUXJtVXhuOG44ZjdCcVVL?=
 =?utf-8?B?em05OTZrNTl1L21CNDJ6RU1KV1RWRHhWWEh0SkpWQm5KL2YyTjBOS0d5cWN0?=
 =?utf-8?B?TVVKRG5tV0Ztc21abVJrQU5HejZST2ZUKzVNM1NWVHNvZU5PaUIzWEdHZ056?=
 =?utf-8?B?SDFROE1OYmE5NmowN1VjNzlIKzgxajQ5Sk1VbGhUNGd0NHdxd0VVZ0hMSEdh?=
 =?utf-8?B?Zy9EK0dxZE5KY2xONGljaCtEOUh0NVlNREVhTEtTWWJxTjMzam5NS1M3ZFNL?=
 =?utf-8?B?WXdGRGJyQzR1Zk9vL2VpbkVpS08zaXVxQVFacCtiN3A5K0N6YXZFVmErbHAz?=
 =?utf-8?B?ZkZvNUVlL2o0K0dGSVJyT1BNY3BGd0N5QVZ3ZlRsV1VsSElabmtPV3VRVVdX?=
 =?utf-8?B?Z0lUaVBhemloczdkb3pseUhEWDdJOVBKVzJ1dzFuazhyb04rVnNOa2dBYXZw?=
 =?utf-8?B?cHlWaG42azFCUGlaZzRVL1czVHdnUDFQcW9Rckxhbm4wVGU5cnF4L1l0bjZG?=
 =?utf-8?B?WmI1amlhMEY5VW9HdzVlK2VKOU8vd3VleU9sNUJGK3FNT2RsVm50azJjVXFn?=
 =?utf-8?B?UmtoWVJrK0FFSjJJaWtiZ09VTkVuWi9ROGZ0OUphYTMwbGtxYndURkEwUmNZ?=
 =?utf-8?B?UURMcDFUMzBxR3hOVGtIVm1BM29JaWZnUm9VOFdRQThCRVgwMllNTlpPazNy?=
 =?utf-8?B?OUEzTXNZMTBkVzN5QnNvY2t1RG1qczFzWWxIYTBlVDdOakZKOUw1ZEo1dUlt?=
 =?utf-8?B?dTlMZXZUNnhuNWwySlYza3VaM1k3NTUzYmN2d1oyZVpROE5yMDc5SXZKb3JE?=
 =?utf-8?B?V3A4YWVCM1FNSGN3THNQNzFWVnJKUEt4ZXlHak9pY09acFRGUVBRdEZvZk5L?=
 =?utf-8?B?dGZJMTBXT2hPRyttd0pQYXkvTXFZRGo0MndtM3RIVGYwRjVxN0lEU2hyUCtz?=
 =?utf-8?B?YS9hYWlTbUZheXRWeTdrYTVNTG1NT0tJeDdXZnRMYmlvd3cvWW9vYVVrUSt2?=
 =?utf-8?B?aXlEdlFwWStGNCtXZG9LcnliekZESmhsV1VRb3kxZ08xbXFYV0RzRXpFQ29S?=
 =?utf-8?B?YTREdi9LZHNZVjcrOUVqVFliUSs4R0QxK1UvRWFRVEs4NDBmejROOTZXWnpu?=
 =?utf-8?B?a252Q2MrQnZUWElNaEJLZTN1Q2VwdjlNR285VVRZaVFRaEJlekFjRzhzMlZG?=
 =?utf-8?B?cEM5a2RCV0pYNjRCVmlYRjhzcXd5dzN5Z3RnWXdOc1kyeUgzOGZRWmdxT2lu?=
 =?utf-8?B?Sko5WjZDRndrVHpxUUVqeUdDVU9UaHNZSUdkd0ZKSGZRb1cwUnVEaElxajdC?=
 =?utf-8?B?RGRJc1E2UEVBb2ZKc1FOYXhFcmhlb1QwQXJDdVJJeHhzdHNhd2FRbi8yd21r?=
 =?utf-8?B?S2pMa2U0Q0Z6b1h1eXlCaStFWWV3cnVsTDFSaUVsN0hoQXpiMlh6WFRKMmEw?=
 =?utf-8?B?eWdoTExJenVudEhlaFp6eXBDeTZXOW5tNWFiREpubmRUSGZEZlpraTQwbjVs?=
 =?utf-8?B?THk5RGJ3NVdJTDZYT0dyWi9EU21WSlBROGcrVkRKeUE3TVZ5RUZtcDZsek9X?=
 =?utf-8?B?V0dKSDdtTnhLT3ZFK3RTaTBhcEF6SjAxbVNXc2tRYTNSMTZ5LzcrbGJaSGMx?=
 =?utf-8?B?ZjZyaVN4MVZIR200dm9wcTZuWTJiZk56WTRYU3NYRVRMUzNTT3ZuR0wzSFdB?=
 =?utf-8?B?cHd5b3JqMlhKcTNlc2pqZXRpdm9zSnUzeUIvYVNnVU95VnMrWHV4ZDJCLzdM?=
 =?utf-8?B?b0NTUmMzY3ZxblF3YlljZ0kva0hUUGVhNDdjVngzL3dLWWVLRnJTdVpNR1BS?=
 =?utf-8?B?NUJOTzZiV0dRZkZ4SFhQbU15UlJvWi9GSGxPYS82RW5Rb2ozSFVxMWxzSUZS?=
 =?utf-8?B?dSsvTWtYNklSUGRBbDFyQ0plWVVpSWJkQVB5YkxJMkM4dG1JVTFEUXowbFJZ?=
 =?utf-8?B?ajBWbjZtL1JQd1NCdXp2QVRGRjU5TE9GTGM5RGV0SzIyTVdMRWxVT2RsaTZ6?=
 =?utf-8?B?NUlOWHVWNmRYQmpHR2h0VVd4aXIyenJSelQzcnV0Y2hjeFJSb2EvQjhQb1c0?=
 =?utf-8?B?SWFuZzBLUkwvWnhHTjNtdTRJc3l3eHh2UlpIZDZ0OThMNXhDd2d0dXA2Rmls?=
 =?utf-8?B?N1pyTWMxN2dwRVB6WXRydU5VL0pXeUQ0Tk5EOVBFa25HSmFySjdBdz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fad77929-f4cf-431c-15be-08de59b42b93
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 12:45:49.5822
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SF5UKxJLNILDRxmH0fNyo3zz2dM50IAcMUs09auW88lZEFsy3tOQMt3cwcwsJb6GPwiP1DjAMEcsXVnCZYAf+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9008
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : No valid SPF, DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30897-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: BF4986798D
X-Rspamd-Action: no action

From: Peng Fan <peng.fan@nxp.com>

of_gpio.h is deprecated, update the driver to use GPIO descriptors.
 - Use devm_gpiod_get to get GPIO descriptor, and set consumer
   name.

Since the driver still pass the reset_gpio to pxa27x_configure_ac97reset,
so use desc_to_gpio() to get it gpio id.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 sound/arm/pxa2xx-ac97-lib.c | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/sound/arm/pxa2xx-ac97-lib.c b/sound/arm/pxa2xx-ac97-lib.c
index 0a28e44118c5253054370b6d8117d8b61fa257fd..1e114dbcf93c94ef30b7b81c40ef9aa30d1271ff 100644
--- a/sound/arm/pxa2xx-ac97-lib.c
+++ b/sound/arm/pxa2xx-ac97-lib.c
@@ -13,10 +13,9 @@
 #include <linux/interrupt.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
+#include <linux/gpio/consumer.h>
 #include <linux/module.h>
 #include <linux/io.h>
-#include <linux/gpio.h>
-#include <linux/of_gpio.h>
 #include <linux/soc/pxa/cpu.h>
 
 #include <sound/pxa2xx-lib.h>
@@ -31,6 +30,7 @@ static volatile long gsr_bits;
 static struct clk *ac97_clk;
 static struct clk *ac97conf_clk;
 static int reset_gpio;
+struct gpio_desc *rst_gpio;
 static void __iomem *ac97_reg_base;
 
 /*
@@ -329,11 +329,14 @@ int pxa2xx_ac97_hw_probe(struct platform_device *dev)
 	}
 
 	if (dev->dev.of_node) {
-		reset_gpio = of_get_named_gpio(dev->dev.of_node, "reset-gpios", 0);
-		if (reset_gpio == -ENOENT)
+		/* Assert reset using GPIOD_OUT_HIGH, because reset is GPIO_ACTIVE_LOW */
+		rst_gpio = devm_gpiod_get(&dev->dev, "reset", GPIOD_OUT_HIGH);
+		ret = PTR_ERR(rst_gpio);
+		if (ret == -ENOENT)
 			reset_gpio = -1;
-		else if (reset_gpio < 0)
-			return reset_gpio;
+		else if (ret)
+			return ret;
+		reset_gpio = desc_to_gpio(rst_gpio);
 	} else {
 		if (cpu_is_pxa27x())
 			reset_gpio = 113;
@@ -346,13 +349,7 @@ int pxa2xx_ac97_hw_probe(struct platform_device *dev)
 		 * here so that it is an output driven high when switching from
 		 * AC97_nRESET alt function to generic gpio.
 		 */
-		ret = gpio_request_one(reset_gpio, GPIOF_OUT_INIT_HIGH,
-				       "pxa27x ac97 reset");
-		if (ret < 0) {
-			pr_err("%s: gpio_request_one() failed: %d\n",
-			       __func__, ret);
-			goto err_conf;
-		}
+		gpiod_set_consumer_name(rst_gpio, "pxa27x ac97 reset");
 		pxa27x_configure_ac97reset(reset_gpio, false);
 
 		ac97conf_clk = clk_get(&dev->dev, "AC97CONFCLK");
@@ -403,8 +400,6 @@ EXPORT_SYMBOL_GPL(pxa2xx_ac97_hw_probe);
 
 void pxa2xx_ac97_hw_remove(struct platform_device *dev)
 {
-	if (cpu_is_pxa27x())
-		gpio_free(reset_gpio);
 	writel(readl(ac97_reg_base + GCR) | (GCR_ACLINK_OFF), ac97_reg_base + GCR);
 	free_irq(platform_get_irq(dev, 0), NULL);
 	if (ac97conf_clk) {

-- 
2.37.1


