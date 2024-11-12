Return-Path: <linux-gpio+bounces-12848-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BBC69C514B
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Nov 2024 09:58:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 33E2C282A10
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Nov 2024 08:58:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32B2320C00C;
	Tue, 12 Nov 2024 08:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="vAw5cr0c"
X-Original-To: linux-gpio@vger.kernel.org
Received: from HK2PR02CU002.outbound.protection.outlook.com (mail-eastasiaazon11020122.outbound.protection.outlook.com [52.101.128.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A4E20BB48;
	Tue, 12 Nov 2024 08:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.128.122
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731401891; cv=fail; b=HuAZlyCjplN9h4qO0zBARwZxChHBSAQ1BNKomeMNG2KDeO6hYqldguPdKMCUM9vXCu3lPCNJg5wW3bwTN4T6UhsZS3Whj1JPxW+GqknyJL2gh1UZze6Yfux0fk9dKIcW3kfZEJ71kLihU0r/cxnncFM8xNYg2yPCVpnBpNkosK4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731401891; c=relaxed/simple;
	bh=fddGPi3hdZkWYvvB8qG3Wdg56twuTRVZtAsP08cf2mY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Ari6ZNFid/ldRdmy3m+oUxnCp0Y5GN/wAFgX28xxLD1ztHQ0CrsH7E9edkAzJcxISqhtFTqU8Qukm+Ji5RBth5IH9RP32g08xKV4EXz33IXU4S/alM3bmS2rc1QMTYyq+LNxJBYTaItTovhcDtHZ1nMM7wM4HVwosA7qKOUD2H4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=vAw5cr0c; arc=fail smtp.client-ip=52.101.128.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zP3cadDrW53JG1A317vJupJnbo9awHC21+V+KXB4R7leZh6f3vlVR3CYsM8By5jkjourpbwNTG0krV5A4t+w23G3IXVwWhIxWnLZR3QYACHZ2K4xWvbTJ3f4kZXieEfCGx/lVnqZOqywkLMfsuA+3uQp2RJf7qDcLijde9fhJqbVSAJfe8tQgBBnmfYti5+DaAknDtrc/WxS6n54uNX3w0AMi+NEVqkqS/28fvAihK3UkW3cFf00VfosLwZNr4vB3kF+k8CehimWSEvlQpWcAj3+jcYzY0W/Z7I6MM/9XTTaMrcLvUSf9w3pPixUQ/9uCNO9lhhVZnrd/JrpJaR2iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4mab5Ghv6pURrAfMcFp9Tq0aBoxqStyoSgNbVv47clw=;
 b=RQz3EASoWL2EncgU6pB6OrhMa+T/0Q1mdzIb5y9WtImwb2DgGc2DiAi9pd+IcEjIGVyYyoXP31xOazn3H3fz45kr4FRJi9T9SG3DLwrD7hKVoCwVBhsGtk/RaXVezpiX/L8agQXy9Hvn7iEUxMRWm9u9nYXj6yMXp6+vQXMGKGVhkF7ZZ/LNfPQcg47bDO93iG/Y5kv2/aIIGboQh3vH6ca1Ju+OaIk+ouTOgrKjLjILqEjbvSlgOq/4HDzHPHbd7udCs6aUhbrAsaZWwttnnkbNHyZ3EpGyhHi7jXv+JB4x7Nx2MAT73xuqHzoTz55HFbjyYtd+V2miazYvV9PgpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4mab5Ghv6pURrAfMcFp9Tq0aBoxqStyoSgNbVv47clw=;
 b=vAw5cr0cnrI0/6HnCMhfH2SVFdOmUUoM7grFDNpvWVex+oa1/McXVkuBqE9UItWHXFEFzChk6Gin134k3zvVRch8qe+8NG972ricS8KlaO/QGzYW3OzTCVdvrlEXgvx0ekM+EK/lilJ4mxcq9GfoBc+mT8lfq8IuvMB3ySOoyn2c1cU5a8ldiW3yJddrO5eEqTx2mF+puWOsttr+berHIlm2d6zqQDqkX0R+AHb4wkhLyb9e7ntiP2LWVlTQAH3cQy1kXjRtS/w8rH7QTPc0Rte7+Dc0FcA82RCRZ+QetmmGuQD8cldN2rGsxu/bJ3tlBobTVNPe+vaemhsOwu7Vsg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by TYZPR03MB8534.apcprd03.prod.outlook.com (2603:1096:405:6a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.26; Tue, 12 Nov
 2024 08:58:06 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123%5]) with mapi id 15.20.8137.027; Tue, 12 Nov 2024
 08:58:06 +0000
Message-ID: <00e16b73-ddbe-4d9c-b485-9ed2a1e10087@amlogic.com>
Date: Tue, 12 Nov 2024 16:58:00 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v4 0/4] Pinctrl: A4: Add pinctrl driver
Content-Language: en-US
To: neil.armstrong@linaro.org, Linus Walleij <linus.walleij@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20241101-a4_pinctrl-v4-0-efd98edc3ad4@amlogic.com>
 <27aa3716-1d28-4da8-80e6-212d7f94d193@linaro.org>
 <84bbb8b3-d638-47e5-a0e9-371e9e56c89f@amlogic.com>
 <97e2b1e4-1763-42c4-a3f0-986492ecfd97@linaro.org>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <97e2b1e4-1763-42c4-a3f0-986492ecfd97@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR01CA0004.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::22) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|TYZPR03MB8534:EE_
X-MS-Office365-Filtering-Correlation-Id: 59548d11-6247-4420-a849-08dd02f81f7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZFJyTU8zTDFiY3NEK1JDVEFnVFBnNE9tRVRMUzQxUXpGNm5IK3I1TFVGbzVW?=
 =?utf-8?B?MHp3TVQxM1VMQmtNVDhBaWx4SFFwTDlrZXkyL3FqYkt4M3hjcjhnZ3ZQdEZp?=
 =?utf-8?B?YkhCRk5mTzZLbDRLcHAvRytNekozRmJXaDl6bERVUWNvK2J1WWtDUzQ3Zk84?=
 =?utf-8?B?Wi9mZlRLdUo1UmFYQ3VoTGdwN2VlTGhGWndiaFJMa0k2NzNOYjMveWFUcGtP?=
 =?utf-8?B?bUl0WnphdTN0cjhIcUYwbTlRckZDOUZicnh2ZUhrRUNSWUNoM2hjd05lYjNR?=
 =?utf-8?B?SzVQOVBaNnIvMk1hOE1aVHZwQmx5YU04WlBjMkxHdkFXS1E5bHV3enVjN25z?=
 =?utf-8?B?aE9vUDZneTJMRC9iOTBKSTBBNWxLK3ZQMzh6c3llZWoza1N0TWpRaXJyYVdp?=
 =?utf-8?B?Zmt1V1pya0hlTEQxa0xqVnJ6alNrQWdSZkJlR0tzNHRlQ2FSczcxSDBQY1R2?=
 =?utf-8?B?b2RJbVJmT1dyWUF5MUtFOVIxT1d4ZTh6eGhaZFg5SmRmWkFLMlJRRmZmRWRW?=
 =?utf-8?B?THVnMFdmdWJBdFgweHJxSWpBQWRtVDZJS3dIRENxbFp3b2FMUjJvR2x1OEgy?=
 =?utf-8?B?NHVkaDVXd1BlMkVTMURtOFIwa3hBUUdqbkRCczAvWlNIVzB3c2dUOTlPdkNs?=
 =?utf-8?B?Z0EyQ0wwUHhzSUtxWmwrY0k5Q1pEMHlDQTRBczdnN2JaVzFxbERWY2t3YVA4?=
 =?utf-8?B?dHkyZWFiNk1nM2oySTB2ZXh2Q3N5b0FyM0hWSUZBSzR6clJ2UGxVM2ZsY2V0?=
 =?utf-8?B?M2F5MnNtUExEQTdpZWJ0Ty9IY2Q3b3hVbFlhMjUyUnA2QU12YjJONmJXWUJN?=
 =?utf-8?B?bVgrVEE1eUF0TUN4MWdQK1FScVdSKzZkSjBDUWtQK0dKa3FKOW1EdWlDb2Vv?=
 =?utf-8?B?em1ERFdkdDlaTzdyc1pXVXIvZVQ3bURwcENxZ2pLTGtYRGJYK0VQN1dXR1Vh?=
 =?utf-8?B?aTRQcWRySk11c0x6ekxVeEdqcHVycTRsSWVVaWo5NURHV2NnRTZ5NGlFYmZD?=
 =?utf-8?B?dm1GR2VTY1pvNmhkeE1QampmcUdqVnpJTjY0MVlhZXJCT0RuZ2NYZkhzakJ0?=
 =?utf-8?B?dmFjcWg5V0xISjNNOVc4bHVOVUZCWVo0cDgzb2xablZLeFVlb1pGb1VjanRl?=
 =?utf-8?B?bHlzUGd5a3NMUTg4QU83OXQxclNFZlNLUFZTZnVZaXBvY21kclF5bmp6QTZm?=
 =?utf-8?B?STBPT0c1MWMvTFJQRE9SK3VwamRGOWxwQ0J1YVNCN0svWFZ4MEV1ckorSGQ1?=
 =?utf-8?B?Umo2UlZaZnlZbnRCZ2RUYkxrdUROc1VNZVFlYi9GWk5uMXVMa3cvWHNHRkx1?=
 =?utf-8?B?MDFiTnZwQmkyM2ZKWTdOeHdHdFVIRDd1bDhTMUNSeTRyZVh1VDhJU2ZSbmR2?=
 =?utf-8?B?OHkzUHZIZmdmTzFmelkreUNHbW9yZjY3TGEwZ28wZXh6bTZVRVlCaGUwTlkv?=
 =?utf-8?B?YllaUmJMcURGYnFBUDJPNm1kTTVCb1FwRFU5d3U0eWtlZkRGTGxPQnRieFRl?=
 =?utf-8?B?SCt2Yks3NW5WQ1hEcnR6Q0s4VE1keWp3Yyt4bHVYT0kvZ2N6TllUaEtZMXVW?=
 =?utf-8?B?aUhUdU1iQUFmNlI4OFJ3bStSaSt3ZG4vbkhMZ2MwenNZY1JQS1VFcjJrcERF?=
 =?utf-8?B?QzFrMlhyYWlLVUIzQitkUStpajJ2cmdEUjVPOG9oNkhwMEF5YUZsWDhKTFNC?=
 =?utf-8?B?OG4vZ0tWM1I3bUFEakd2eXRNZVBNSkwxcU04S0oyck5YczhacUE5TFhmYk1p?=
 =?utf-8?Q?kjfKdapHF/JDc/59MnfSTdYRjgORSCdNFLgh/cW?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bHpINk9DbHA4M0tkUWdtcXVpSk41WFZ0RFBBSGg4ZCsyTjUzMlJSdU05UTlY?=
 =?utf-8?B?RnZ6ZThlaG5kVEpWQzdwY2pBeUlreXpvNUVPZWNVN1o1ejRCR0kwb1VUYVMv?=
 =?utf-8?B?RGR0alg0YytVVWdudlVYUzNZYVhPTVBKTHJyTENMSmxBV0wvTVdyN3FlWkNs?=
 =?utf-8?B?WDVCNE1TT1pVZm80bmpUdkpkWkx0TzJRWGxLVTJWTk1JaHdJVFVxZG1udTY3?=
 =?utf-8?B?Vk80cmNkNlR2aHZjTkFwQ0tOcHU5NnJiNnE2VW9hajdrTHNXcHhJOGlNRXlP?=
 =?utf-8?B?YjZ3cVpTZzFyTDJ4MjFSSE1pVWJrV0xSNnNGY3lTSzk5K3hKcys4b0txL0dh?=
 =?utf-8?B?cG1NclJHTTN1SjVkV1JmRm04NlJCdW1xd2dwT2hIVTZibFgvVWFMYnlZY0tz?=
 =?utf-8?B?NGs4Qm0rc0pkYlVUUlZjbkVydUUraTluNU5PQTJ2cjQ2MXNlZXlkektZRjhX?=
 =?utf-8?B?bXRNeXFuQTZLeTkwZnBaREpNMDdJMGl6MmcrY1lFSTg1T09uamhsR0dJREhO?=
 =?utf-8?B?ZzBqMUhsWjVFb3E2SDVUbUU4bzRuYlh1enRFcGF3T1pvTVE5TmF1Rnc4SzFC?=
 =?utf-8?B?dERRRzRVTlMwZHY3NEQvM3dScUJlNVF0MHVxcUVZRU5yWTNFaUhYelo3OWJV?=
 =?utf-8?B?TWxGN01meUJPcFpDRjdWR1FacFBpdWE4UWZrYVQ0bjJpZVZsZUljcGlJVW1T?=
 =?utf-8?B?WWlKVDJEbEZWdHMrUm9IWUowL2hyTmpsckVIbURURDE1c1craE5ISkRnMlRr?=
 =?utf-8?B?Q243UjIxekFmRnFxczkyVnZlaVBrT3RPdUQzSWVQdk1hSDNxYUdWUDRuRlQ3?=
 =?utf-8?B?Vlp1R3NRb29SZmVvdks5ZEQvSFFaWUh6MFh5QnJYUWRoMjUxYUNSNEYyK1BZ?=
 =?utf-8?B?andiby9ZUWhNc2s0LzgwR3dmcnZFOU5mMTUzZlRnUFdBeWZreVN5UERJdmVV?=
 =?utf-8?B?YTgyaVZrcmkxVVhPRlQ1Y0ViYm5IT1YwTGRUZDBWaUVSbXZZaXJha0tPSWNW?=
 =?utf-8?B?SEZ4VXMxbW5EZ2JGM2FhUld0cnhoUC9vVEZETDROQ0gwaU5LK1dGcnpLK0Zk?=
 =?utf-8?B?ZWw5cmdKQ3d0OW9Id1FaZU9HU2g4WWFmQ2tidkNOajFBam1oa1FqaFdMdmVq?=
 =?utf-8?B?NHp4UHBDeW1FM0huRStiVzZFRVU1S3B0VXRiWmZ6bkVwQVRXMnR5ZTRVZjZB?=
 =?utf-8?B?c2ZrVXMrSzFzVU9BeVYwWkZWTHp4RW9ZTFF1ODg4dDMzR3ZySlp2TTE2aTlP?=
 =?utf-8?B?ZGxHanJsWjlJK21vVDdyZFJiUmZhRnU5alg3VUIrUWMrM0RNOGl2RmdUTzFW?=
 =?utf-8?B?bG02MGdQdGJ3RzhTenFxRzQ5L2pXTXFXOVUyQzlhMW9ha2xuN05FeFJDLzB1?=
 =?utf-8?B?UTBVNGVnVVBsQ2tDTklVd0xRdkpHamV1UEhQbGtFVlloaFhJNmwrK0YwZThX?=
 =?utf-8?B?ZE54TWY1ZU1ERUF3ZlpFTlhjbTBYbzl1NnFxazFLRC9RVTlyRU9adHh5Smg1?=
 =?utf-8?B?N0lXR0FiajJVcWZMcWVJaU1wSWNhaUVma2RVLzVpVlIzdi9YRjFEc2tudHVy?=
 =?utf-8?B?TVFFM2hxZDhZaVNUM1FKL3U1L1RROXJGWlNpenhsbTFiN0ZTZ2I0TWZDOW9I?=
 =?utf-8?B?eDlCQUgwNTlGbFJHbkUwQm1BQy9GVWM5cUR6TVBpMjZvS0pmL1BTUjkvQXll?=
 =?utf-8?B?RWJ4NG54UDFieGxaWWxlbVNhQ1IxaWpCNFUxSnRucDFIam5LWHRTTGp5VTBE?=
 =?utf-8?B?Rk1YWDlvcDFYTGxETzlFYWxWbGp5RmNQNm1TKzRKVWlxMzJQUFBhaWhtaWp0?=
 =?utf-8?B?dnJHWTFjQi8zODE5TWV2ejhzb0JaOFQ0ZjV6MGUxN25aOE9UMCtsS2lRdTB1?=
 =?utf-8?B?RE43TzZ1aDF4UHVveEhJdVFvOU5vQVI0TjhjQitCZ1N1dVZtMEhPMlRiSmxO?=
 =?utf-8?B?OEJGRTBYWTFpc0NIZ205SkxaM2VyeHA1NllnaU1VZkdxbUJWYktsSlNHbzgw?=
 =?utf-8?B?TXlSQXVOU2JkNnl0ZW5ZaXJwSWJhQmNUVm05UVZSVlprQXF0M2tQR3Z4bEw2?=
 =?utf-8?B?dTJNcmNXWHNhemlGckRneU9vSnVrTkp4WVJrU2xhUUdFblFSd3phUXRaeWZy?=
 =?utf-8?B?TzZldGxtY2N0L29vY1pmazJYSGsyZTQxQ3lHckpkT2tXaUJSOStZMGlWdU03?=
 =?utf-8?B?Ymc9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59548d11-6247-4420-a849-08dd02f81f7e
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2024 08:58:06.2037
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rYpBBgnkIhX8hnaUHAtXb/8jOMDmYCdDFHUXT2WP7RZXUWKVjQXOO8ojiK52ZD8ku11QNGfLzR/5DH/uFH7URBb3ZVVxG63Ah3HXGAMO6SI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB8534

Hi Neil,
    Thanks for your reply.

On 2024/11/12 16:24, Neil Armstrong wrote:
> [ EXTERNAL EMAIL ]
> 
> On 11/11/2024 04:26, Xianwei Zhao wrote:
>> Hi Neil,
>>     Thanks for your reply.
>>
>> On 2024/11/10 20:24, Neil Armstrong wrote:
>>> [ EXTERNAL EMAIL ]
>>>
>>> Hi,
>>>
>>> Le 01/11/2024 à 09:27, Xianwei Zhao via B4 Relay a écrit :
>>>> Add pinctrl driver support for Amloigc A4 SoC
>>>>
>>>> I want to find out what kind of solution is feasible to
>>>> meet the needs of all parties. This RFC verion is one of them.
>>>>
>>>> All of Amogic SoCs GPIO device requirement is met here by
>>>> adding GPIO bank definition instead of the pin definition.
>>>> Binding header files will no longer be added to future
>>>> SoCs's pin devices.
>>>>
>>>> The pinctrl software only adds insterface of of_xlate to support
>>>> for transformation without affecting the overall framework and
>>>> is compatible with previous drivers.
>>>>
>>>> The code in DTS file is also readable when using GPIO, as below:
>>>>
>>>> reset-gpios = <&gpio AMLOGIC_GPIO(AMLOGIC_GPIO_X, 6) GPIO_ACTIVE_LOW>;
>>>
>>> Fine, but why not use 3 cells instead of this macro ? Since you 
>>> introduced the
>>> custom xlate, parsing the 3 cells would be easier that using a macro:
>>>
>>> reset-gpios = <&gpio AMLOGIC_GPIO_X 6 GPIO_ACTIVE_LOW>;
>>>
>>> Neil
>>
>> I was prepared to do this before, mainly later considering 
>> incompatible binding, using the original two parameter passing
>>
>> If use three parameters, I  need to modify the corresponding binding 
>> property. in file:
>> Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml
>>
>>        "#gpio-cells":
>>          const: 2
>> It must be compatible with the current number of parameters(3)
> 
> Yes, you may move the #gpio-cells definition out of the common yaml
> and define them in the soc spefic yaml and set it to 3 for a4.
> 

I can modify 
Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml 
file
change
         "#gpio-cells":
           const: 2
to
         "#gpio-cells":
           enum: [2, 3]

  and make it to compatible with subsequent ones. Do you feel OK?

> Neil
> 
>>
>>>
>>>>
>>>> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
>>>> ---
>>>> Changes in v4:
>>>> - Add interface of of_xlate support.
>>>> - Add const for some variable.
>>>> - Link to v3: 
>>>> https://lore.kernel.org/r/20241018-a4_pinctrl-v3-0-e76fd1cf01d7@amlogic.com
>>>>
>>>> Changes in v3:
>>>> - Remove head file from binding.
>>>> - Move GPIO define to file *.c.
>>>> - Link to v2: 
>>>> https://lore.kernel.org/r/20241014-a4_pinctrl-v2-0-3e74a65c285e@amlogic.com
>>>>
>>>> Changes in v2:
>>>> - Use one marco instead of all pin define.
>>>> - Add unit name for dts node.
>>>> - Link to v1: 
>>>> https://lore.kernel.org/all/20240611-a4_pinctrl-v1-0-dc487b1977b3@amlogic.com/
>>>>
>>>> ---
>>>> Xianwei Zhao (4):
>>>>        dt-bindings: pinctrl: Add support for Amlogic A4 SoCs
>>>>        pinctrl: meson: add interface of of_xlate
>>>>        pinctrl: meson: Add driver support for Amlogic A4 SoCs
>>>>        arm64: dts: amlogic: a4: add pinctrl node
>>>>
>>>>   .../bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml |    2 +
>>>>   arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi        |   36 +
>>>>   drivers/pinctrl/meson/Kconfig                      |    6 +
>>>>   drivers/pinctrl/meson/Makefile                     |    1 +
>>>>   drivers/pinctrl/meson/pinctrl-amlogic-a4.c         | 1321 
>>>> ++++++++++++++++++++
>>>>   drivers/pinctrl/meson/pinctrl-meson.c              |    4 +
>>>>   drivers/pinctrl/meson/pinctrl-meson.h              |    4 +
>>>>   include/dt-bindings/gpio/amlogic-gpio.h            |   50 +
>>>>   8 files changed, 1424 insertions(+)
>>>> ---
>>>> base-commit: 58e2d28ed28e5bc8836f8c14df1f94c27c1f9e2f
>>>> change-id: 20241012-a4_pinctrl-09d1b2a17e47
>>>>
>>>> Best regards,
>>>
> 

