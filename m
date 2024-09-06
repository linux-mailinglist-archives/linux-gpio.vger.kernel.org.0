Return-Path: <linux-gpio+bounces-9879-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 67DFC96F00E
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Sep 2024 11:46:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 81F641C20BBB
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Sep 2024 09:46:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A05A1C8FA6;
	Fri,  6 Sep 2024 09:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="YXgHI2Tr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012015.outbound.protection.outlook.com [52.101.66.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564BD1C7B77;
	Fri,  6 Sep 2024 09:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725615932; cv=fail; b=TEeBoSSVdUTZyoiGG2dAilvYn8ylmfSEPCiykksBcIopv5HDCNykA5l282W17sVFO2InrqXma0PHXob7Lt3zQ0Cn0FVfsja5QFzN/lGaodApmY/iM3ao4LQzK/HkcFL6D0Ryf+ctG2OYxFu7qqOHFv4L9cZOdMUfYNDXIIykx6Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725615932; c=relaxed/simple;
	bh=1ZZ4uimvhk2SwlmpuAxNv2BPqf346P8qSnOpOoDThCs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=IDxzLJW3bpxZy1Pv9ulpRboYSIbMJu2d1ny7cDkIjRJ6KJhHYbJxZW9qybx+H/57NZEKtGVWhHtlRfM1CHGieYw8ACXzWrJjf35Y8/7zEZvQG7Xv04NiUveb+hbbY3Y8vkayaKjNpiu9bNHZTLxL3r8VoFtsnNKhblKpehRF8as=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=YXgHI2Tr; arc=fail smtp.client-ip=52.101.66.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IX2CV2lzxHL1F5RedHG58xZWErb21XSvzXU34oSxYKJ1E5aXV/Rt8QZDO6cmJyBG8it9ybVbbG8OJyfN7iLj2wMZ1xNdFbiN+12ipvb6ZpdLvz1ZDzoKOFI2joTeAh4i0+ouo8tl7tPzKsSkbpyepbXbrKgnsjUif+fdRjDl5sRvW8wDm/KtxqOAiq55LY0OvTUGodLRoPqQxXp+djVXRV1v5nFHDhH1aNPnk3ZWVE1h/qlWKIAxcDEGC/MRJ4FtUUaT+EYrWYILctjhrSLm+mrdB4DNeTwsF0/3ZW2p9CGuBvKJBW4WKhP+uK2INU27Fy4mzxg4c93ZLZuBAZcPBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dP+rsWtN+5rGFLAfOlUbc0d1EJ0cTP8MirkEuOh1Q+Q=;
 b=nK4+5ALDFxG/b/DHcfGolFuoTwEM8efZ91e+semJuoCFtVS4JVzXCfISxGLWRfKTub/rK7h2BWWHUW00EiNVTXezafmKghI6IqvbtXUmOQQMXtIFkmM31Cp3DxxImx7FKzXkxl+KBiQWczTVbPI2yS/vMdTCoWtWtuSnShEAXEjYK3yw0dgn2/lzt+FObhI9S+KCTPbOdvLFVExJ2ZN4yTD4RdTMuJzF5+kBi6adftoFlxoZL4YVpirm+DK9iUQYRR+asZrcvX1fqoNbaZcD+iiZbuJAnGSHbYLhgkcek0xR8vjTdcyIGPYm22WRV5BTITUuE1Dop2LEN58Wny8VQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dP+rsWtN+5rGFLAfOlUbc0d1EJ0cTP8MirkEuOh1Q+Q=;
 b=YXgHI2TrBgBuXizGKh7HqA+hn5EC5oJ0IH7k9dshnZ6AFmaS4qofUgxqFXozp1uuTbEdzKg5KnrqpIwCoTfC7vShrVT4odum3uhJwOAfdJs/wI5ihofXyOiBn/pUKPWcEKFqFu1LWZc6srdCmTwmx4exZlCV3aT+Gjn2bbQrjmOXP7ImZ04JoEZhQ3DJeNbwac8hXxl2l10oXtNg4HUJBihfIn/Xtuco2sZksxeTRsl6NONQom7BWfflRYbXxNhOsWbPcijO6pYv7WjwSSM/6dLWBJByHWgqqqphRuzmAisKWEtPNMiU5PL/t2QUEf936jcL5vERKXjduoG4fhGi5A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by AS5PR04MB9856.eurprd04.prod.outlook.com (2603:10a6:20b:678::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.28; Fri, 6 Sep
 2024 09:45:26 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%4]) with mapi id 15.20.7918.024; Fri, 6 Sep 2024
 09:45:26 +0000
Message-ID: <0ba90fcf-60b8-478c-bd9d-487acacdc988@oss.nxp.com>
Date: Fri, 6 Sep 2024 12:45:23 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drivers: gpio: siul2-s32g2: add NXP S32G2/S32G3 SoCs
 support
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chester Lin <chester62515@gmail.com>,
 Matthias Brugger <mbrugger@suse.com>,
 Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>,
 Larisa Grigore <larisa.grigore@nxp.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 NXP S32 Linux Team <s32@nxp.com>
References: <20240826084214.2368673-1-andrei.stefanescu@oss.nxp.com>
 <20240826084214.2368673-3-andrei.stefanescu@oss.nxp.com>
 <fd18295c-6544-4da6-aab0-6d6b9c12581a@kernel.org>
 <6a65f608-7ca4-44f1-865c-6a1b9891b275@oss.nxp.com>
 <3ab4c235-c513-4dce-8061-b8831ea548a3@kernel.org>
Content-Language: en-US
From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
In-Reply-To: <3ab4c235-c513-4dce-8061-b8831ea548a3@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4PR09CA0023.eurprd09.prod.outlook.com
 (2603:10a6:20b:5d4::13) To AM9PR04MB8487.eurprd04.prod.outlook.com
 (2603:10a6:20b:41a::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8487:EE_|AS5PR04MB9856:EE_
X-MS-Office365-Filtering-Correlation-Id: 9122a238-a8aa-47b7-20fa-08dcce58a2b8
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SjNvUi9pSWM3UFI3WFNaNndBeHpGN29DdjZONmJVUlBsUFVXekpNVE4yblR1?=
 =?utf-8?B?M1htSEl5bktWN2x1dlhtU0VCNkNzWUVUMm4yT3J0RzU5NmNsb0NSRXNRQzBo?=
 =?utf-8?B?YTVwRi9HWDNXbm0zZzBQZER6eTFCcnJlM0pwclBnUXorT2hOSHZ2NHA0V2JK?=
 =?utf-8?B?TnNOVGJ6dFpkM1FNeVdoNFJtZVY1bXdJMkhnSXJuY0szOGF6VFpVV1IrOGdC?=
 =?utf-8?B?cjFHVnNaNlhHMG9nOHZQZHVKUTd5b1ZqbGhpUzAwTy9OSnY5bGpHQkFxbDFQ?=
 =?utf-8?B?MGRQMXg5OFlOTCtLM0pOTDZDcUQ5RXhra2pGZjRmYU1vbWtzcFl1azdpbHB2?=
 =?utf-8?B?SWg1RVh3eUhrWE9QZndleFl2d0NSdWRaN3JEVVJkU09RUituZFpRUkhXVTl0?=
 =?utf-8?B?N2U4amtLV25GOUdsQzhXOXdLbkwwdUhJcXF6TVdVTXkvZm1wQzV3cTk5U3Nv?=
 =?utf-8?B?TlUzaVBTTHhxcDhPWDJtWldmbHpTNXFmYnhBMk94K1RkeExtUnl2bEtVZjcy?=
 =?utf-8?B?eXZ0YlVKdWdZWkpxRHRRQXNzOW92QVRNK1N1YWhKQWJiQVVaK2t4UCthdExW?=
 =?utf-8?B?akVuUDFKRWdhalFlSVozanZJUTd3YWpneHdFejNkQmV6d0hiUWh2c3M1cjlu?=
 =?utf-8?B?SmlTT0dyYjFpQlI2S2U3T0RKVVJrd1NWZUV6cG90YUNVeEZJRmtCZWhoeTZv?=
 =?utf-8?B?TWc2SG05YnFrR0pxZ0pqU1grNkVyZTlnQzdsODFZc0RoOUJXNUtFT2ttbHQ3?=
 =?utf-8?B?UmVSWUZqQVZoWWd1UEZhWVRHQnVONllhdTl1ZHhCa1l3bDdna2YzdUFvbHkv?=
 =?utf-8?B?NWFQSHM3K2hGWDRqVXhPaGYrMHlxSzlGT1NRQnRaZWhDdXJyWEdXM0VMbE4x?=
 =?utf-8?B?WVVLSWJQUmtHOTJDd0pPV2VZVi82c2NkakRDSmdyWXVjNERmNUdLOFNRRk5X?=
 =?utf-8?B?ZzNhSXAxb0tlci9OeE0xaTRWTXhyU0tHL0NLd3U2d1lsZVZsL244RERBSGJ4?=
 =?utf-8?B?Y3d3VmRzYzc3M2lweG9XM05SWCtUVlNOVXNZVnhMNFAzNmlGYWlKc2NlWFRt?=
 =?utf-8?B?bEtoQW42VFRib2s5a0hMM1YrQzJsb0RpUnRZRUY2R2ZuOFRqQjdUN3JDN2Ew?=
 =?utf-8?B?bFkrV2JjaFBKWWp3OE8vc2srT051VXhSVnVQRW1zNmp2ODVNZzlhQXFDRjlC?=
 =?utf-8?B?TUUvUVhiTjhCc09YSHVuVkZRMXNWOThRQm9TRHBuR0Mxdng4dVJiMXV3YW1C?=
 =?utf-8?B?bXlZbGltbnBYSXQzbmJ6L01id3EwbzZOdmRMb2JMSUl6UlVsb05NQWgyZ1Vh?=
 =?utf-8?B?OVk0TCtYQ0ZzVlFkNFZEL1NMWE5qeUVNVEpZYXY5SllUMHpVUmkybzF4U2RT?=
 =?utf-8?B?STFKejU5WTBuNEthNktMWFl1ektSMytFdG9CVVpiWldPSEcyT1Z2OVc0SDZt?=
 =?utf-8?B?UnRwdVUxcElOeE8yemFSbXptbXFwRGRDdzhDVlV0N0tIbGlMckZBK01rdG9T?=
 =?utf-8?B?MTBNYVpjZEs3TDcvaXNnTnRZMmhvUlQ2MVlQTTBneEkzRllaNGhScVF1U3VD?=
 =?utf-8?B?ajdSaEtiY1A3NUFmYlBVNUxjUWFMdEpKc0QvU21kRDZMU0NLclJZQXpRRDFQ?=
 =?utf-8?B?aW0wV3hXUk9VTVMzU0RUVGEzMGNteXJQU1ZHUGVSVEVJbkpNTWQxM3g4UVA5?=
 =?utf-8?B?dkY3SXBzeDlFbVBPUmF3d2dXdk9INGNNcnpUYjdkWXZJUXpTbTN0SUd0WGg1?=
 =?utf-8?B?SHZPU3ZXUnJqd3M4K294d0RxYWRrelM4d3Q0SzJqcE1sVXhJcnBWb3h4eHFE?=
 =?utf-8?B?akZscnlYdDFDUGhLNkJ3QVNGTXpaNURkVCtjanp2UVNHM0xLeGJwdytTQjRW?=
 =?utf-8?Q?9RfMtxQgOqzdI?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VFhOYzkrWUVmY2huMndQV1lWM1lhbEw1a2VoaENZT2dQN3BCazJZdkpmNE5T?=
 =?utf-8?B?MllJWHJkNFIvV1RmbmZ0VnE3L2tzaW9QdEVCY0RMUTlETlBLVHcwOEZCcEM5?=
 =?utf-8?B?S3lncDljRWlpVW10WmRZR015dHdLbC90NnVoNzNIcUt5RVVaR2ZqS1RrUCts?=
 =?utf-8?B?cE9LdmhrRG52SmNoSFpEZU01c25xdEZYcDd2eSsvZWpGcyswdjAyRmlDa3Vm?=
 =?utf-8?B?UFArcnlydWpaZE4veklNSVlpTkxucElCV2FtemZtNlUyblJlMGVJRW15d0Fx?=
 =?utf-8?B?aGtSVW5mTTVRT3pRWUo0YkkzUjAwbUZRMm1iaUkvSFluMUhMMVRObUFENjBC?=
 =?utf-8?B?NzJxVTh1K0wrS0E1bHJ6d3FFZmFsNTBaWkdKZjVUSlprMVhCZnIyem0rZEVX?=
 =?utf-8?B?NWlRaGkxZ2d3Q1FRd1BGbUkycUUxcDlXRE13VmFtVzlqNHY1d21paXF2MTRO?=
 =?utf-8?B?U0FObDlqcHVhU2hQZytONGtTVTh6U0p2MUEyM2NVdFNCWmd1b293YlRHQ2ZS?=
 =?utf-8?B?WHBxL3M2UGE0RUhpQ3MwL2NPS1JyNnFVUUJuclBYb0pXakRpc1BPQmtWZmhV?=
 =?utf-8?B?TmphOEpPcnpOdnI0ZVlHOS9NNHRrTXRxOUYrdStIdXhUd0Mxc1BmNFBVWDVC?=
 =?utf-8?B?T2FLVWp5Y29sZFpMYy9GMkZMajlJdVA3Ti9UbUEvWGJtUXQ2aU1mbEpnR1Yy?=
 =?utf-8?B?RnQxTWRlTXZxVDJRMkdkSHBSaFlBMWhpUmI4QlhiV2RQYlNkT040a1pDcjJs?=
 =?utf-8?B?QW1nL2tKL1podlYzb25STjdvQzVnSVNDYjI1ZDVzdklqUEFMVkNHNHh2c3d5?=
 =?utf-8?B?VXlpR252M0hiSGk2OHJOdVpYS0I3NjFua04xeWdpWEY3cW9KeFd5cFQxWHJm?=
 =?utf-8?B?SzRPVmZJRzRVSkFvbzNDMHU1dHhGUW5aUkpvOWNCNVZybW93UktPK2N1U2hD?=
 =?utf-8?B?enoybFlhdUxubXJxbWhPdktQMlZEZ1Q3eXFuOTMxMUpOWkNWU1hsL3VnTnY1?=
 =?utf-8?B?b3FwTGZpWFNGZUJoc1VoaXFaa3Q1UlpPcVlhakdScWZTWWNNQmE3cWN4SXM3?=
 =?utf-8?B?YXF4cExxaDhQWGNyZ1JNdzR6TlE2VHdmWWZCdVA4MFhiamhCcE41Z3hhVlor?=
 =?utf-8?B?QzdpMDl6STVsaFF2VkJTTUUyU3JOL3ZVRE5uemZiNjFDRXpjM29EMitDUTBD?=
 =?utf-8?B?emJqZVlubnYyeEZVaEhFNFlrTi92QXhiei9rdGs5R1VoY0VkSlJMRG11bG42?=
 =?utf-8?B?eVRmeTR4L2hnS3lTTDFhUXRSV2piMHlNQ3daY0pOdTFUNHIyZFAxMVlyL09z?=
 =?utf-8?B?ekFLRC81blNKcUV4eDFkd0w5MU4wVmtHd1Q3YzV6R1pGR1lmNU9sVm5LcE5j?=
 =?utf-8?B?bDg4MTZlWUs0aVpjY0JmQTBwZDM0T01vbDFFMytReHpnNEgzQWFJZjdIaXhW?=
 =?utf-8?B?cmd4WjhiS2k3NGpVK2NDV0h1YUM4Z3o1MDJic2MzOFV4ZjRYbEY5SkFDOWpW?=
 =?utf-8?B?anpFSGt0a3RQU0RRbUxmQm5udmhYdnUwUmpNNFNuK1hrRXUyVGloMmNnOSs1?=
 =?utf-8?B?ckt4eEFIU01nK3RmelliUmtGd3FvbmQ3SFRUd3dEczEyU2F5QzFkcGNDQUZt?=
 =?utf-8?B?VjNKTUpNSFlzejROamR6ajVqU2VUZjh3d3o2ZkNsVlFjblRmS3YvN0E1NjJ6?=
 =?utf-8?B?Mlh2Vk9lMlZpZzNZL1psL3JucHhBc0RwdzBjWWJ4OU5kS091SGJxcXRZZzNN?=
 =?utf-8?B?N0htNS9CQjJtTEdrcmMrdlFMaGhuakJEOXBxQzNPcFVWcXphN0xDRWxzRUR0?=
 =?utf-8?B?cDhwYjlpZGFncGRqU2Voa1RCUDllemNTYzBVTjU0SUg2VFArRWJrd1NIeVFy?=
 =?utf-8?B?emVIUXI2VFFYMkkvcmVqdkFqU3MwbDR0cVNlTHNaaFVmZ0FqQzMxeFhqWFlC?=
 =?utf-8?B?ZWlRb1VMaDRuTjBaa1RLY05wWDN2ai9SWXJyMndhMWNiWnV0ZWU2UVoyRXNy?=
 =?utf-8?B?eVZvUlI1NjVJZGNmT2RiUmJRMGhMeFdrbEZOMDZFbXZQV3JEdm5KSXhDdy9x?=
 =?utf-8?B?MUJCUEsxZHBQWk9pekpaL01UR3ZkVCtUeEt0SVdHMm9oVGtqMm9zM085dkhy?=
 =?utf-8?B?ZE5xbkFMQXhzR2dKQVlNVVFxa29TM3JQd0x0cmt6ampPVnhMWWVHOEg2MWli?=
 =?utf-8?B?MXc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9122a238-a8aa-47b7-20fa-08dcce58a2b8
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 09:45:26.3622
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fSb2gczkDJBkk862KC9WOktjfofNFET5fjUppKFOpAJ7LyTnTbbmKRd7f5gbFkY+XMkBswYLNx4PFxDs33Uz04TtP1T96scVDezYwXBzD3w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9856

On 06/09/2024 12:39, Krzysztof Kozlowski wrote:
> On 06/09/2024 10:43, Andrei Stefanescu wrote:
>> Hi Krzysztof,
>>
>>
>>>> +static struct regmap *common_regmap_init(struct platform_device *pdev,
>>>> +					 struct regmap_config *conf,
>>>> +					 const char *name)
>>>> +{
>>>> +	struct device *dev = &pdev->dev;
>>>> +	struct resource *res;
>>>> +	resource_size_t size;
>>>> +	void __iomem *base;
>>>> +
>>>> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, name);
>>>> +	if (!res) {
>>>> +		dev_err(&pdev->dev, "Failed to get MEM resource: %s\n", name);
>>>> +		return ERR_PTR(-EINVAL);
>>>> +	}
>>>> +
>>>> +	base = devm_ioremap_resource(dev, res);
>>>
>>> There is a wrapper for both calls above, so use it.
>>
>> I am not sure I can change this because I also use the `resource_size`
>> call below in order to initialize the regmap_config. 
>> Unfortunately, `devm_platform_ioremap_resource_byname` doesn't also retrieve
>> the resource via a pointer.
>>
>> I saw the `devm_platform_get_and_ioremap_resource` function but that one
>> retrieves the resource based on the index. I would like to keep identifying
>> the resource by its name instead of its index.
> 
> So add the wrapper. Or explain what's wrong with indices?

There's nothing wrong but I prefer to not force an order. I will
add a wrapper then.

Best regards,
Andrei

