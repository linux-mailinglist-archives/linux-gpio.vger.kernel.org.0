Return-Path: <linux-gpio+bounces-10833-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 264B89901D7
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2024 13:10:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C8F71F23077
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2024 11:10:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E293C1553A3;
	Fri,  4 Oct 2024 11:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="cB1bNuZr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013003.outbound.protection.outlook.com [52.101.67.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549BD13DDD3;
	Fri,  4 Oct 2024 11:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728040218; cv=fail; b=cZeW/0Aa0aaj/am0LonZ74SGPJ45XNfewdHgA5ByGOVQxIShzm8GiJzPUzp/S1PBGZ9kMPXv70QkwYBonV3TO67NFIovd524t9LGIPqtIT/5W2m9n8/PnCtl774G+Pg6vpZKB5nxLQl8ilwRdqjCbOwwl1ATgoFH6W7TPT4P3vs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728040218; c=relaxed/simple;
	bh=aEbF8TmB/S0QHzuNWAiT18Mpctl64U3cmfZX9E7OS9E=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=CfxxvcFiN+7UdxrS/YiKOpE2759Ae8RVyJTVOlYD7d4atir4do+Y1WAo00UlwuGltsbvqe17V53ij7PsfvuJU8bKgZDL2nWtC9Tna5HhdB8uThhTujI3/my73R4JhFbVdSeBJNHF64CoZdu8uYt0cFwpchvcIH8rlAXaSKv0jog=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=cB1bNuZr; arc=fail smtp.client-ip=52.101.67.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C8kI72iL5DHbMVBt0FxtWAu+7K8GFQyDJd9nmX03CGlmWJZ0C16g47uJk7xAWBn3acBpx0Y6ixgTUfonF1KuW5gxIlnkhzijcYkrBKI9c+FeGzjOTV+9+hPvWPWI4l86TcJ7SDXbB51H4c8skI8ceEzny3bT6prwBnf1Nyv2hZYaiP5t5RyIxjE165PZeyF2c7+T05SmqZx9EjoxwCkOA9PWmK0glwelvtNXtAFdVT4DYSAHouK/LGTkmgAxA1z18pN1gH9zCjN2Ank9Zm5OeW6rFeu4roiq/e+XYWxi8GYGHZkjCWsxLQyh5eog4MjWQ9OIBGfDTto8kAV8I90/+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q6CTIUrKLnekq7Jq7y6cSqGN/Wtzso2XjvUjy94pppM=;
 b=DwpzXAeVRTMUxljM+ffOjLCE0tGzK6WxgF/6oSJsTZySY871LJvrYA6IZCDvA+TOr0tV1oGuPMhfDCWEfpJkvFPJWMxvad7kJb5iLUo3I3awnZf9o/KcUc+0CXeL3zbXIY6nI1prhIGILfAHQNLt9yppwkFOzfZhquAyJJj97fYGZ27P93aGADi4rNTzTDsSWtV+d/wEHhOGkoOCM1G1rO7/7/zFsloOThqjJNqWaZjmGaYktJqqTaH29DsjkNNxk68LMoV9EpeMf6+4qqB1IH+bHZH4kCvKwcrDRgTcGMQInd8f1poMSqo+Mz5Q4XO6yFmZpDvVz9B4BhlN1gk7hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q6CTIUrKLnekq7Jq7y6cSqGN/Wtzso2XjvUjy94pppM=;
 b=cB1bNuZrAyt6yuG5WKnf6+HWHFhcXvc9RA5OgMHaREcHQrlJQWX+8TS2rLL25i8Opns2z3B084k9gTUA+2jaHl/2Sp0BZul9/SzDAoeKqd8gmMn7Gb37ii0rU3OjtxVWZ0FYhi05pMBurE28jZ3u0zwOqw1Ce882vRoCFB0K4An2hqHRCTw0WwmwG/lI5bjztiKwBOZ2lNznr3/VK926nNFTXhMyh1OX8/6SGHqgiw7uoCl4GBQPZtGKZND1uu89ZinZdh91et1jgeIRgik/cjseAOGTEDvOawi/sKgU/rQG3s0Nqz9W+F3H5Os50ckrKzhAtKwijSG1roffBW5yeg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by VI1PR04MB9835.eurprd04.prod.outlook.com (2603:10a6:800:1e1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Fri, 4 Oct
 2024 11:10:11 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%5]) with mapi id 15.20.7962.022; Fri, 4 Oct 2024
 11:10:11 +0000
Message-ID: <36215390-77ec-4959-9bbc-65af32734d31@oss.nxp.com>
Date: Fri, 4 Oct 2024 14:10:07 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] dt-bindings: gpio: add support for NXP S32G2/S32G3
 SoCs
To: Conor Dooley <conor@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chester Lin <chester62515@gmail.com>,
 Matthias Brugger <mbrugger@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, NXP S32 Linux Team <s32@nxp.com>,
 Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>,
 Enric Balletbo <eballetb@redhat.com>
References: <20240926143122.1385658-1-andrei.stefanescu@oss.nxp.com>
 <20240926143122.1385658-3-andrei.stefanescu@oss.nxp.com>
 <20240926-apricot-unfasten-5577c54a3e2f@spud>
 <c2d8f121-903d-4722-825f-c00604ef3991@oss.nxp.com>
 <20240930-shortness-unedited-650f7996e912@spud>
 <20240930-bamboo-curliness-eb4787b81ea3@spud>
 <20d46ef0-8c58-407d-9130-3c961dd1656f@oss.nxp.com>
 <230e575e-b8b6-4671-a37a-085fef761240@oss.nxp.com>
 <20241003-overall-unblended-7139b17eae23@spud>
Content-Language: en-US
From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
In-Reply-To: <20241003-overall-unblended-7139b17eae23@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0387.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f7::12) To AM9PR04MB8487.eurprd04.prod.outlook.com
 (2603:10a6:20b:41a::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8487:EE_|VI1PR04MB9835:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b57d8fd-72ad-4f07-fe9a-08dce4651cee
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RTFzc0xKSlg5ZGVobEF3L21hUDNydGRQZG1YNGlKUnVFZ3ZQd1ZZOEtsSVM4?=
 =?utf-8?B?cmhFV0VrTlNQSitUZ3dCQ2FvanluQ21zMGY1SkRQN3BzSjB6TXBwYVg5UE1R?=
 =?utf-8?B?Z3VzZmJqS1cwblcxaHlBVlpBaTJqR2lBTld0cm1HcDcweVVOWEM2d01mS0xJ?=
 =?utf-8?B?bUVibm5RZStaV0RtVUlQTUh5TWlQZTFST2w1ME92aE1pTytkY2hSSFZHdURX?=
 =?utf-8?B?LzJQdEZyRVNZUlBvZHAwMVhZRWNTbitvaTZvMDhMcWNFb2VwM0ZpZXlOcjlU?=
 =?utf-8?B?bW0wejRnRi94RjVoUVREL2NNajlRNlg3Z2FwbDlXOXNxS0NyNUdsOC9MNTk5?=
 =?utf-8?B?MzcxZUI1Zy9ITldtTWdOQ3F2UTFuYS9FeERFNDI5Ty80RUY5ekVjbERWNnI3?=
 =?utf-8?B?NVpQOVlPWFpFb0xRRDE1UStJQTdtci9CekdpRWViYit1NHRkS0RUcmFiMXlJ?=
 =?utf-8?B?UWNCUlhNT2g1M254bm1BNmlmOW9VSFJ4a2lYWkpyWkhvSEJJbEZOWEhOa1hr?=
 =?utf-8?B?TDFMMXNQa2cvZW1PZnp1Y0gwYm5mdzVHSGh6cFNVU3VKSlpscC9KN0FtZ0hx?=
 =?utf-8?B?ejVuSGtHdUhpZXV6QmNzRko3UnhSMUJkV3IyTkRySERtV2l0bVVyTWVwL21m?=
 =?utf-8?B?RVRTOWZrQ0trNmRXSWxOWUJNMDhZUHRFRmZrdUxpbHNHZ0I3eHBjTGhkdHBw?=
 =?utf-8?B?MUFsQVZscVRsdkRlc1Q4Vmx4VDFHU3lPbVA3ZnZUTVl3OU9CMjZPL2F0ZWhz?=
 =?utf-8?B?TkNHYndaU0VBM3VNcFF2aFdmWFRnRE5hamo0UXRmSlI2K0pMaEtQb0hnQ1hv?=
 =?utf-8?B?azBhZnUwT2Q1aXZUQVNnNkErT3V0WE0vQ1Z4RXNGazJCVE9iMXA2YWZzZVF5?=
 =?utf-8?B?SHVEaEthZ3ZJcktSUktEanlkVXI0TjVKeXJxQUZZaWZPOE13UEdJeUFScDRK?=
 =?utf-8?B?cjBhM0JEb3dGTEcwbW12WVhHSkdDTDZYblJEYTU3a29ORkx5SmVYMXVwek8v?=
 =?utf-8?B?cVBBNExNNUx2bHA3bmxySmp4VWhZUkxwNU95N2pKcGpFRjc5eGl3cjAycDhU?=
 =?utf-8?B?SCsvaUZhL2ozd3VGVUY5aHJkUzViWVF6SE1HOXgvejlIWjJZSHBEamNERlBo?=
 =?utf-8?B?UXVhalhyME1wNjRoSjNJSmtPUWIrMXAzZjdoSEN6aTVIQ2dZeloxUjVzd3pl?=
 =?utf-8?B?TkVtOUVmeEdpcDBmR2tEd3JvdmpQeVpUbVQrMUMwbkdNcWMrcmdXbzF5SHhV?=
 =?utf-8?B?cUNSSVlNVGkycDFaeTU5V0c1NXJBUGtKNFEvei9XQ2dRTzJPMkQ5TnQvZGtI?=
 =?utf-8?B?YzBsaThWeCtjd0d1UXZuejQ3TVkwTStkd0haL0wyRjBpYXBTVDVFSjJNNnQz?=
 =?utf-8?B?TDNZcndmOFZnbHM0UFZSWVZlRVk2Zm9oWVdDaTNhVTNZTXp2NDR1Wmg4SkM3?=
 =?utf-8?B?VVhYRVpocjZ1RFNrQjNjaGduUy9JdmR0eitwY3FleVVVWFMrM3BDTDMybzB5?=
 =?utf-8?B?TW1WWmJnSFlTUkhUUVBPSG9xcnVYU3RsNExYcCt2TVNxVW1FQXJnSldPamMv?=
 =?utf-8?B?U0JzenZHT1hHaTg1VjZxNDR1MjZJM0hDaXhwakFmSlhyOTltdDRLMm92dXdX?=
 =?utf-8?B?R3B4WjNwWGc3S2hOcjUvMk5BLzBWb1RTQzU4Qkt4Y0FyKzN2M3Z2b2JBS2Rj?=
 =?utf-8?B?bnZ6ekdHeFJKaDZFY3A3YUlmVm9VYUpDWUo2OTdxbGtkQm9WUkg2bkt3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a013aE9mWWpIL1dqUU0yTkV2NGplbm9zbVRPeHp5ZUZRZHZkSVAyS3J3bjNO?=
 =?utf-8?B?bDZLcFIrYjVyZ2tFMjJXdWNSaDZjTDVSL2RKc0JoMVdhSHgvQ1A4T0hlMzYw?=
 =?utf-8?B?S2JlMGkwbzJ0TUtVaG80Q1JEWVlIV2tEbHl5RmllRVJaZTRRWmFYRmFvL2VL?=
 =?utf-8?B?S0h1UEtDOWdrMTJoSGJwV0ZLQWRycmI5UlNWUnVaeTR1ZEZwRHZzekNrd2tX?=
 =?utf-8?B?U3pQWnhPdmhNWHBjd2xrbU1xVmVFSVdQR3NFdTdHY1lQUHdzdnlBQTAwcUpa?=
 =?utf-8?B?cGVTcEZwNWFHYUcwR05wZm03NDdNN1hHRWp5MThEak9PQ1lCRkRGRVhqZ2lF?=
 =?utf-8?B?djZBaUFROGpNRWwzWTJVcXlzdzdzT2o2MlRvakJ0Z2JhakFTOEs4RmIxSzJT?=
 =?utf-8?B?aFRYUi9LZXVHUFNkTjFpMlo0d25qVVcwbForU3hUS1NEcVNpQ293dTVZZnU3?=
 =?utf-8?B?aFlyVGRZaHp6RkNWaEo0UkJrTjM5TDBIVURNRmpGeTJZWDJ5dC9XQUttT3ZQ?=
 =?utf-8?B?QTl4dnJESG9ZSzdySStGQXE0MDFaMFVqNnhrdndJNGw0YXNuSE1KRlJFRHhy?=
 =?utf-8?B?c1I0b3lMVjRXTHNYd0F0MEp2Z1IwclRJU3VyTVcrWW5CdzVCSkZoMUYxRUQ0?=
 =?utf-8?B?M01DSjFxQVhWeXZ4VkttRE9qZ1BSSEN1VjlnUFJmNUdsYk9Va2lZWTJoVWtC?=
 =?utf-8?B?RkJ0WG55OXgxdUU0U3RvdEpBS2VhR05GYVI5NTJLNk8wbmJjV1l3MDdmZytm?=
 =?utf-8?B?UVNVT1l0bHlySnArdUNwWUd5WWFnZG1sWjc2b2tMeWFlb3d5WjlaemdubUtS?=
 =?utf-8?B?ZkFnVjQ0bnVyMjFJQkVWN2QwMm5Vc3FNWmdZWXFHRnpjWnBEWHpnZmRpZ2h5?=
 =?utf-8?B?eVZBRDd3QmZCY1g5QWd3dW4rbU1YbEFic25zVXA2Tmtwc01vbVhFTi9QMTJx?=
 =?utf-8?B?UWJibHdLN1ZrbGsrVkIyR3ZWMmJJNmNSdGlmbW5vTXZpblpLZ3o5S3RhOWRX?=
 =?utf-8?B?UTFHbmVQaGxqTGpJMzUvRDlRdlQyNkE3aXNvU0FDa2UzY3Rrejd2aFV6Zkxp?=
 =?utf-8?B?Y0EzZG44VExkY3BXRlg4TzRCN3pMNkgrVkZ5d2dMOWd3eDh1bGZ0YUc0ZE1z?=
 =?utf-8?B?YnRFbFFicllVWXhNSXIwQkVTcGhyZHpCMjJGRWVrcDBvMWo0bFVRNCtYVVBN?=
 =?utf-8?B?QkdWeVhsQjAxRmltTmxzSjNlNkhqSjlYc2E5MDUyZ1krLzRkblRsVmpMQUt1?=
 =?utf-8?B?SnpTckF2bEJDcyt6Y2t6elQ2QzA0QkFVa2dBMlQzczhJYURxOTRrS2N1T3hI?=
 =?utf-8?B?YmxOU0FrMjBWZEZZV3ZpL2NsOFNMMkNRYldEMVVCRGNPMW9rdkN0Y09hajho?=
 =?utf-8?B?TjdzMVRMY2RXUS9ZdUt2MmRZOTFsM1JCRjkydlBQSm10NnhEUExmbXcvY2U3?=
 =?utf-8?B?UytEUWFOTWVNdW1qcDhRNEhFR3VjSUR3YlplenpjNDhRZnZqdG5SQXNRQk5G?=
 =?utf-8?B?blR3OVdZemMvYjVNenptT0RTUFpuSjRNbGFNMWVjdlJFWjNXT1hnRnRaZFpJ?=
 =?utf-8?B?M2FZM3dzS1VXTjdFZVhiNm5FalkxMk9SalBNanRnMW5QZkczS094TFJCMGhj?=
 =?utf-8?B?anplb3h4VVQ3MC9IN0szb3BoR2ZPMDI5VjdUd3g2TUtlZitlSzZHdXBHaUNQ?=
 =?utf-8?B?WE1CQjNseVZHQ3o0bGdKMmVtYzNNVDZlOHVtSDR5ZXlFMjlKQnBJbzM3c1d0?=
 =?utf-8?B?UjQwZjlWM2FMUU4rTGRuNk5qVTFiZFZRaWJ1S0tmNXljNWd0cUFMUUljRUlt?=
 =?utf-8?B?RGJnYmdiWFBwelVDdDdjdis1Zzh4eW1sOFhPOHNWOXROZ3piZWRNRkJJdU9S?=
 =?utf-8?B?TVpWQmpoSkxuWk16dkc1dS82b2FNemNtbnQrVWhxcysvTzF3RmFLNTFabWo4?=
 =?utf-8?B?MEVBck1lQnN4UVBRQzRJT2pWdFE3S2VSYjNnVlltd29HTTdaaDh1Sjl0bnFn?=
 =?utf-8?B?cUpVZTFrYjVyMG1kVmRTVWVCOVNkZXY4eitGNEphYXJmVHZpcDhGeVBUYi9x?=
 =?utf-8?B?SkJvVnNKQVZiMlVJWUROSUk2d3h0VEd2TG1MUmo5alRaSG1qSWtiSkp4UmlL?=
 =?utf-8?B?UktoZEVxZ1RzblBJU2pWZFpDNVRQUFJFV0Uwa3kxMWhrbVpxSDFvdllGZERU?=
 =?utf-8?B?b2c9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b57d8fd-72ad-4f07-fe9a-08dce4651cee
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2024 11:10:10.9979
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pAC5WDoGAN3bfQJOkFETxJzf0rVPjdd9DprZro04yJG7BUu5aOBMYy8n0yon9e0oezMayPBSWC51gHPVQ763i5YcGDUGXtlhjHdd89IKIq0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9835

Hi Conor,

On 04/10/2024 00:01, Conor Dooley wrote:
> On Thu, Oct 03, 2024 at 01:22:35PM +0300, Andrei Stefanescu wrote:
>> Hi Conor,
>>
>>>>>>>
>>>>>>> Huh, I only noticed this now. Are you sure that this is a correct
>>>>>>> representation of this device, and it is not really part of some syscon?
>>>>>>> The "random" nature of the addresses  and the tiny sizes of the
>>>>>>> reservations make it seem that way. What other devices are in these
>>>>>>> regions?
>>>>>
>>>>> Thanks for your answer to my second question, but I think you missed this
>>>>> part here ^^^
>>>>
>>>> Reading it again, I think you might have answered my first question,
>>>> though not explicitly. The regions in question do both pinctrl and gpio,
>>>> but you have chosen to represent it has lots of mini register regions,
>>>> rather than as a simple-mfd type device - which I think would be the
>>>> correct representation. .
>>>
>>> Yes, SIUL2 is mostly used for pinctrl and GPIO. The only other uses case is
>>> to register a nvmem device for the first two registers in the SIUL2 MIDR1/MIDR2
>>> (MCU ID Register) which tell us information about the SoC (revision,
>>> SRAM size and so on).
>>>
>>> I will convert the SIUL2 node into a simple-mfd device and switch the
>>> GPIO and pinctrl drivers to use the syscon regmap in v5.
>>
>> I replied in the other patch series
>> https://lore.kernel.org/all/a924bbb6-96ec-40be-9d82-a76b2ab73afd@oss.nxp.com/
>> that I actually decided to unify the pinctrl&GPIO drivers instead of making
>> them mfd_cells.
> 
> Yeah, I'm sorry I didn't reply to that sooner. I was being a lazy shit,
> and read a book instead of replying yesterday. Almost did it again today
> too...
> 
> To answer the question there, about simple-mfd/syscon not being quite
> right:
> I guess you aren't a simple-mfd, but this region does seem to be an mfd
> to me, given it has 3 features. I wouldn't object to this being a single
> node/device with two reg regions, given you're saying that the SIUL2_0
> and SIUL2_1 registers both are required for the SIUL2 device to work but
> are in different regions of the memory map.
> 
>> I have a question regarding the NVMEM driver that I mentioned earlier. I haven't
>> yet created a patch series to upstream it but I wanted to discuss about it
>> here since it relates to SIUL2 and, in the future, we would like to upstream it
>> as well.
>>
>> We register a NVMEM driver for the first two registers of SIUL2 which can
>> then be read by other drivers to get information about the SoC. I think
>> there are two options for integrating it:
>>
>> - Separate it from the pinctrl&GPIO driver as if it were part of a different
>> IP. This would look something like this in the device tree
>>
>> /* SIUL2_0 base address is 0x4009c000 */
>> /* SIUL2_1 base address is 0x44010000 */
>>
>> nvmem1@4009c000 {
>> 	/* The registers are 32bit wide but start at offset 0x4 */
>> 	reg = <0x4009c000 0xc>;
>> 	[..]
>> };
>>
>> pinctrl-gpio@4009c010 {
>> 	reg = <0x4009c010 0xb84>,  /* SIUL2_0 32bit registers */
>> 	      <0x4009d700 0x50>,   /* SIUL2_0 16bit registers */
>> 	      <0x44010010 0x11f0>, /* SIUL2_1 32bit registers */
>> 	      <0x4401170c 0x4c>,   /* SIUL2_1 16bit registers */  
>> 	[..]
>> };
>>
>> nvmem2@0x44010000 {
>> 	reg = <0x44010000 0xc>;
>> 	[..]
>> }
>>
>> - have the nvmem as an mfd cell and the pinctrl&GPIO as another mfd cell
>>
>> The first option keeps the nvmem completely separated from pinctrl&GPIO
>> but it makes the pinctrl&GPIO node start at an "odd" address. The second one
>> more accurately represents the hardware (since the functionality is part of
>> the same hardware block) but I am not sure if adding the mfd layer would add
>> any benefit since the two functionalities don't have any shared resources in
>> common.
> 
> That's kinda what mfd is for innit, multiple (disparate) functions. I'm
> not sure that you need an nvmem child node though, you may be able to
> "just" ref nvmem.yaml, but I am not 100% sure how that interacts with
> the pinctrl child node you will probably want to house pinctrl
> properties in. The mfd driver would be capable of registering drivers
> for each of the functions, you don't need to have a child node and a
> compatible to register them. Cos of that, you shouldn't really require
> a child node for GPIO, the gpio controller properties could go in the
> mfd node itself.

Just to confirm that I got it right, SIUL2 would end up being a single node,
looking something like:


siul2: siul2@4009c000 {
	compatible = "nxp,s32g2-siul2";
	reg = <0x4009C000 SIUL2_0_SIZE>,
	      <0x44010000 SIUL2_1_SIZE>;
	gpio-controller;
	#gpio-cells = <2>;
	gpio-ranges = <&siul2 0 0 102>, <&siul2 112 112 79>;
	gpio-reserved-ranges = <102 10>, <123 21>;
	interrupt-controller;
	#interrupt-cells = <2>;
	interrupts = <GIC_SPI ..>;

	/* for nvmem */
	#address-cells = <1>;
	#size-cells = <1>;

	*-nvmem-*@index {
		reg = <index 0x4>;
		[..]	
	};

	*-pins-* {
		pinmux = <...>
		[..]
	};
};

The siul2 node is for a mfd driver which will have two mfd_cells:
- one for the combined pinctrl&GPIO
- one for the nvmem driver

I think I can distinguish between nvmem cells and pinctrl functions
based on the presence of the pinmux property. Otherwise, I could
create two subnodes in the siul2 node for them:

siul2 {
	[..]
	nvmem-cells {
		*-nvmem-*@index {
			reg = <index 0x4>;
			[..]	
		};
	};

	pinctrl-functions {
		*-pins-* {
			pinmux = <...>
			[..]
		};
	};
	[..]
};


The siul2 driver will pass to the mfd_cells:
- access to the multiple regmaps(2 * SIUL2 each with 32bit and 16bit registers)
- the interrupt resource
- nvmem cells

This also implies that I should add a new separate binding for the siul2 node and
deprecate the existing pinctrl one(nxp,s32g2-siul2-pinctrl.yaml).

Would that be right?


Best regards,
Andrei

