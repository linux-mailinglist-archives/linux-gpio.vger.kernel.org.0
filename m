Return-Path: <linux-gpio+bounces-23523-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B556CB0B555
	for <lists+linux-gpio@lfdr.de>; Sun, 20 Jul 2025 13:03:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 22CA57AEB95
	for <lists+linux-gpio@lfdr.de>; Sun, 20 Jul 2025 11:01:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDF1F20FA81;
	Sun, 20 Jul 2025 10:59:09 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from WA0P291CU002.outbound.protection.outlook.com (mail-polandcentralazon11023087.outbound.protection.outlook.com [40.107.156.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E57D4A0A;
	Sun, 20 Jul 2025 10:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.156.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753009149; cv=fail; b=BLd8e8O9W1cx6HY2MIylrt2eHrEc9WlrO+0YFGarUJU3Qgt9se8/GZgxqgPECwZZPH4fS0nMPmiULfvKGhQlie+rvWWrLVGR3JC5cdyFwvsS1Ap0uruFrLeadJFlZn++c8aqobkditgFz39TQi1JSh6ZFcTs3dec78RJH+mQLzs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753009149; c=relaxed/simple;
	bh=xjX3MQNu68G3igy5cAPlWU85mA0u9DWTJZKyuJGTG4s=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=B9XzIfFhM/5H19ns8h2tJljVxt/Tg0LXOAxnU9s+qKWce0fAMcLZ//cKgUP1ISk6JOHM9ey7NCmwjZeLZ0o7XbIq1bajUNAVQi3OYhx535rRWyo6fZitT4wzDY+f74c8LcJo7addNePDcqaIAlieYIpNcp/VDyYCcPdZxay6th8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=videtronic.com; spf=pass smtp.mailfrom=videtronic.com; arc=fail smtp.client-ip=40.107.156.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=videtronic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=videtronic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XvOpaqIq4ts2War8JNsMEQYJT6RxTJXLqM3Bpu/IiE65xRXSDC4Tow5WkV3XAXfF6cMReROwOnuJq+3+S73tqH9F60cbyWIP2ZBVUe5Adn4Vd5RprwXLn3GjnjEDqvRUyAL23gBviy4OTdFtTZeTSIANe2OcTB0uLOVEoctfWemBDuJFCDMqPSA0L6HjWDdRvJ5ECkEnx9Tb+Uq6RY64Ldgo/z1/ViMS7se8XmDv8IOhpDsVw6ddFaPtmp6AHJJVKcGZXOWTWiUiKH4pqO77qtoA62bLeVC66BbVUZoVNxhJksNnrmViYehCAJm4Qcv/Py2uIRj5QLaoVpMUQ61cig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sK1TNJ9FogxM8jNr6ad1nY5Jr47WjojlCAhYtylk56w=;
 b=Ro45ZLub8tosR66rnbMKfXTlyB+lm8mx1Dzztm2gqdvzO2L5TsYitFvwEgJsDtraMy19G/WQSE6798VU/tFfoitVK30WOtqS3M00MCOgHo3EK0s5rDhsd/3c6cWuy4A/W3mohbk8OF0dOMJ15n9CzT4D5PRGuGShMIduy2FEy0IyxUpEJVRBLGwO4SvZUn4yvwANycJBC3DcZQ0Yk9hB190mA2V7Ffo/y5aIo+nnUpq7KgSRileRJUGUUE0pVRrP/N+ITM1L6u6LFVJaU6jQyJPyPX4KkylAY6+vQiBcnYj4bC0degQNDMpds4WJYcU/MV6vmvFYhUzsKhU+69jdsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=videtronic.com; dmarc=pass action=none
 header.from=videtronic.com; dkim=pass header.d=videtronic.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=videtronic.com;
Received: from WA2P291MB0309.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:24::14)
 by WA2P291MB0094.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:23::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.29; Sun, 20 Jul
 2025 10:58:59 +0000
Received: from WA2P291MB0309.POLP291.PROD.OUTLOOK.COM
 ([fe80::5b7e:db51:5934:a36f]) by WA2P291MB0309.POLP291.PROD.OUTLOOK.COM
 ([fe80::5b7e:db51:5934:a36f%6]) with mapi id 15.20.8943.028; Sun, 20 Jul 2025
 10:58:59 +0000
Message-ID: <6bafe402-29c4-4041-bb72-c8bf2a0ed356@videtronic.com>
Date: Sun, 20 Jul 2025 12:58:57 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 15/24] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer framework
To: Cosmin Tanislav <demonsingur@gmail.com>,
 Cosmin Tanislav <cosmin.tanislav@analog.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Julien Massot <julien.massot@collabora.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org
References: <20250718152500.2656391-1-demonsingur@gmail.com>
 <20250718152500.2656391-16-demonsingur@gmail.com>
Content-Language: fr
From: Jakub Kostiw <jakub.kostiw@videtronic.com>
In-Reply-To: <20250718152500.2656391-16-demonsingur@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0039.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::25) To WA2P291MB0309.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:24::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: WA2P291MB0309:EE_|WA2P291MB0094:EE_
X-MS-Office365-Filtering-Correlation-Id: 944c0479-8112-4a38-66d7-08ddc77c6de5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZmFLWXQvcGNkMUVrMFNSalQrd3AyVFNRV05NQlJTeUk2Z1g1L05jVEo3Qjdu?=
 =?utf-8?B?WU5DOFUrZzZKM1R2Y2I2UDVVMklwVkZsbHFpaEFNNERuQmh4VE5pYWFlQTFn?=
 =?utf-8?B?ZUxuRlRoTHdpdjlFczBTZU5YWlBlcW45NHRhZHBBQlpiZTlFdUlCQXFlOFNS?=
 =?utf-8?B?ak1iU0pRVzV6VmJrZVZGLzAxWEdMeWxMMThjU0c1bER4b202blJveTZzTjhp?=
 =?utf-8?B?cElhb0EzMXFHYWtSSXp0cW5nV0RnRVBjV0NvdkR0TVBCUjk1VTEzRjNyeDVk?=
 =?utf-8?B?MzgyeUtGcFczQmg0YnQ5b1l6a3I2MnBTQ1d4QW9GZWlSd3hpSS9aNVM4Tm1Y?=
 =?utf-8?B?TmRUczZIVmNhdFNSSXF1ZnBLVWJrQXYyKzgvSmZRREdlbDA5YnNON2t5Zkpj?=
 =?utf-8?B?Zjk3Skd4YW1QVUx5azVUcDVXUXhEVTNKbFhvbmZwYW5uNnVmQTZ5UHlyRzNW?=
 =?utf-8?B?UFdYTWsyZnhqZFpESUxqMWhMOUJ3NDJSZkhpRFJnYlVVRjlqcDhqUGdHL1JB?=
 =?utf-8?B?VllvMkVjeURVT3lBM1gxSUk5c1F1bkh0aUhValFsYVpHMGFMbEJxYlpkZVNp?=
 =?utf-8?B?VzFmVDBWanFEdEV2Q3BLY1VnNmRFR2JxRG0xRndSWFAyOEZBU2RPaDBDOUZH?=
 =?utf-8?B?TXpIUWd1Y3RWSGYwMGZCLzJib3owazVBUEFySmFwZ0Q1dlFiZzA3Q0FoUTY3?=
 =?utf-8?B?My8vVUNSSEI5Mi84b0daZWpWRTRiV3M3b1JCdDBjOVdTaitSTWE3Z002dDht?=
 =?utf-8?B?V2M2dExSM0ppLzlBd3A3VnQyWjVUV1NuT1FhUnhMWEovN3dtNzBXOUNBdlRB?=
 =?utf-8?B?VGN3ZHJ4OTNremR3bzZJUU5sWjRhMmowMWQ2WmgxbDVmVkpocVE3S3Z5U3A0?=
 =?utf-8?B?cWh1aXB5QjRXYjBTcmZWbEpvVGpRY3huMWh3ZW5EZDJyNEVOZGZxVG1mdzRw?=
 =?utf-8?B?d2dvUWFFMHRUSUgvUDg1dFRSL2xKQkRMOGFpaUlsNEtocTVTMmNGQjZpMkwz?=
 =?utf-8?B?MGIvN011Y1lITTBoL2I0SThVNGdYemZHdTA3R3dxc3RhdkpxeUpVU3dFTjN3?=
 =?utf-8?B?UU1uVnUrZVNmMkxDcElsZFUwQzBIelo0QmVRQ213a0szeFV1dWowWkpEbU5S?=
 =?utf-8?B?SW5semtLek1lNDNOV29YQTE3QlREL0VtaUdEOCtTNm96QmpBUWcyTE1vMEJ0?=
 =?utf-8?B?Wm9aQ1AzbEFnMFJFc2FXZlJkWXVDVWR1NVcwOVJobDRkN0IzZ3NmMWNzWEdH?=
 =?utf-8?B?YjVCN3ZiNlZMRHE4TnVLZEVVa2QwWUhiN1V1QVJGU1pCYjNWaWt3bTJBS0Nx?=
 =?utf-8?B?V0Rqd3VpYnNpYVRweHBBZUVUSFpsQldmVnkvOHRGZW5pdGczQXljZW5hNVI2?=
 =?utf-8?B?OHo2UldxOTA3dlZLbThpcjZlT2w4SUIxaUQ4Z1lUWjhtSG5Ceit2SEdoQXZs?=
 =?utf-8?B?N25GREtkaXVUNWp5OTBrRmV6V3JsMElhUGhIQmRNUnUvY3BDMSthYlhTbDFm?=
 =?utf-8?B?SkdSVTd1Qk1mbFIrT3l6SE90eFp1aGJQekpEYStxWGF0dmJOdDNwTThlRTUw?=
 =?utf-8?B?S1dqTU1OTTNYeGFRdkFwWXN3ZzRnSHhwc1RxZVBUR1phNTlobzNLb3A1cWVT?=
 =?utf-8?B?dUt2RkZxWnhVMlJQL1NlYnFBeWc1OVpJZktEZDBSdVRkSzd1N1lVNlNUN0tQ?=
 =?utf-8?B?Q2NaS2hjZmk3aVVVRTBEaGZ6RG4zYVpUUXlDMUg5RkpLL2svdkdjVTRlYjg3?=
 =?utf-8?B?T2VNYUtMTmw2ckExTVp2QnZ0a0twSDk4eWQvVk5GY3c3QTJua0VIZGdnUjBk?=
 =?utf-8?B?a24wZFg0UnVjdVRnN0phSnkwZkNSRGVGMUJMWGdSN1hVZUhwWjREUE1PVDJS?=
 =?utf-8?B?dmc2T0E3UDBMcjRxR1p2YndXeHh2Q2VDQjRQdC9XNHhyMXdDZ2N1eGM4SlJZ?=
 =?utf-8?B?MlJ1VGdHRHZoVWpaUDVGeE5aWjFCaXdrcnY5SjRRL244YjBvUm05T3FHQ0ZJ?=
 =?utf-8?B?M05sU3V3bUJBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:WA2P291MB0309.POLP291.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eUpJVGVvVzdFVXo0b05VSW1vVDFLN1g1N1Y0K3haQXYyK0M2WG9aNkFmelJ3?=
 =?utf-8?B?TTN2Y2dOSGk4SnArV09JbnpXWUc3VEs0dXRaM1NFeVRFMFlodDc3b0o2S0or?=
 =?utf-8?B?ZW0vQ3JMbXlEbHlpYVdmZC92dWZxaldpMi8vZndVOGE0RTBNQVdzejllbktP?=
 =?utf-8?B?anNxSHk0b0I2eHdvTnpIcUR1eWhtS1B4SDVzeDdsMGVuRGU3R2p1ZStWSjRq?=
 =?utf-8?B?bWVkQlZUZkdGRXRQMDBVZERocXN2ZzYwQUdpRTRWRktDQ1d3OXFDRXlDVVcz?=
 =?utf-8?B?TEtTU0V0cTE1MnRMQUZqYTRXVXpRcFNJZlpKOVM1ZTdxbzRaUnM1Q2VtUUZS?=
 =?utf-8?B?UGcyQmQvSGZyN1NnTEtJMjlBN2pFcVVsTFBxU1R6ZzlhYnlFUXhWSnZwcFor?=
 =?utf-8?B?cTQyNlgyR3B1ellJRUxEQzBiUWN4Tlhzdk5yUU5mOS9wZzI1Wjd1ZTVSd1A0?=
 =?utf-8?B?QW5wdGpXcjdYRGpzYkdMT0o0eHpXN1dJY3ZaMFV1U3FzQXJUYzUzWEw3MWth?=
 =?utf-8?B?VDhnQVN5V0dYQlhNZ2FHWWl2QzdicWY2c045NXVud3RxYUxHTXZKNGFHQ0FZ?=
 =?utf-8?B?UE41UURUQ2JKb3BwcXNxYyt5VjhTbFViaDlLTUl1NGJDZTFkd1JOSlExYUls?=
 =?utf-8?B?OWdZQ2dYZG1ISG14QXUxYlNKRmZJVUhFQVU1SEpOd3FiL0lNSnR5V1R2Ulh5?=
 =?utf-8?B?NlpPRVovVkJ2VXBLSmxiRG1sWHgvbTFaSG5IM3V3b0ZMRm5XWGRvV1UwVmpr?=
 =?utf-8?B?a1BqYVYvdjEvb2JlMSt1NThZVUk4RHZybDI4TEFrMERCampiaXFsVC9SK2Y4?=
 =?utf-8?B?WEhPdTJzVzBra0V5cFN0dnRIeURSWENQalEvNHgyUDQ0blF3eU12NVlzQUk5?=
 =?utf-8?B?cTBRYThHbHYyYUdXOGpBanNtaHNyemZLZ0o0VGoyV1BRV3U1N2xtYW9NSVJm?=
 =?utf-8?B?WXUrcThjdmxtcUQvemJEQTJRVCs5ZVg2Tm42QUpJdXdqSzIwZTRuQzNqMFZM?=
 =?utf-8?B?bnl5eEZGaWVhaFdsVEZUN2llcTRwdjdzajRNUUswWm41S3NYNXJiczhuaHFv?=
 =?utf-8?B?QUgyUTdJaERyTjFKMGdoL1IzU3NKRGN2NlRQNW5yYlcxUjYyNnlsQUZuNHFH?=
 =?utf-8?B?dk5RRGRUK3QvblRGOUFPRzFSTW1rWnIrOHlsWXdHK25saS9kaFFEQ0g5amhu?=
 =?utf-8?B?SjdmTU5ZaFQ2Mm9VYjJmazgyeWo2cWdWZ1JDa0x1QmlnNmRnWWg4bVFNb0Fv?=
 =?utf-8?B?L0I3a1V3elpXOEVkVmhxdnFFWWZYTk1INFQzVkZ2VHVwSnF2WFlOTnZQYjJG?=
 =?utf-8?B?WHBTbHAwejZRd2V1d1JzUkpyMXlleHlVcjNnVTllRjR1NmlxNG9BS1F0WFFm?=
 =?utf-8?B?anE1dDN6a1AvZkVQZ2dmck1CUER6N3h1YUE1bmhoQlVVWGpDSnNKUy9ncGtX?=
 =?utf-8?B?Y2syOU5leTlqMVBhNXhwUDFCN2RTeElnZjlubnR6eDcrSFdzaHMrVTh2TC9t?=
 =?utf-8?B?YUNLNGI1M2xPYVBGUDNBWEpuQlF3Tm05NTM1OStwUnpPZS9laGM4bEhSelZv?=
 =?utf-8?B?elhaQ0NNZC9zRHU0aC9kSXluVm1xTkk1OG9ySktXZmFicklVc2JSRUcvUDd0?=
 =?utf-8?B?WTB6N0wvT1M5Q0hUNEhrRkFwZ2EyQUtaUU9wVGQxWUF1bFRpbTRaWTJKcGxM?=
 =?utf-8?B?SVA1Mk1JNHE0Q3QwTkVKbzF3ZnBTa3JZK0RLRHhoeGJnOU1td0t0ZWdCWDRZ?=
 =?utf-8?B?MnQyNWpUWUJVSTNkYnF0VFlHUVlWT0FnSmc1cmVXODMrRUtWNTA1VkJWTUVK?=
 =?utf-8?B?MHc1ZlhKSlRXdVM2aGV5WGhOdE5DVWtUVUhzMUJzc3prWmE0YmNHWFhKODFB?=
 =?utf-8?B?MTBoREp4MUs3OGdKUTZNNUdkNDl3YmtUcmFyODVLV3dCaFBsS0JLb1dBVC90?=
 =?utf-8?B?VnR0YzRPdnNDZmtheVcvbUxTNUZwdGZpemhZeVdaSHJTWnRlU3lhQmYyNzU2?=
 =?utf-8?B?TG5kb3RhL2tGRVRJaEdrYUcxNFduMnVUSDBYV1hDbFhVYzVIUGsxanBNVmJP?=
 =?utf-8?B?RWJFNGI5ZGlZNCs4ajJVMGlEQTdkbUNNaUtyVXB6V3VSZTRwS0JEZklBdnJR?=
 =?utf-8?B?M3dRSTA5cWxMeFkvTkJnRjB2OHNmaHpFZXp5VjhmSi9CemVPaVdFVmJuMjhM?=
 =?utf-8?B?VkE9PQ==?=
X-OriginatorOrg: videtronic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 944c0479-8112-4a38-66d7-08ddc77c6de5
X-MS-Exchange-CrossTenant-AuthSource: WA2P291MB0309.POLP291.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2025 10:58:59.1292
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 42908bfd-23a4-4a6c-951d-1ef4d8e0c612
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oyPthR+QSZLuszuyAtiXRjaKHVye4XAQ1/RIj7aRg+eNRSSzmJ1nrjqLRTcfY8opp5aOPcIDba9XhQJIkbC0ikE9FIdZqoNebsMnNjZzmdA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: WA2P291MB0094

Hi Cosmin,

Thanks for the patch - great work.

I have tested serializer and deserializer framework using the following 
configurations:
1. MAX96724 + 2x MAX96717 + 2x IMX219
2. MAX96714 + MAX96717 + IMX219

This enabled me to test the following functionalities:
1. Video streaming using serdes framework
2. Lane polarity changing on both serializer and deserializer
3. Lane swapping on MAX96724
4. Usage of different PHY combinations on MAX96724

Everything is working as expected.

-- 
Regards
Jakub

