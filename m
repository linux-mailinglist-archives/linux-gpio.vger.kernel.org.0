Return-Path: <linux-gpio+bounces-19704-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B5CAACDD6
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 21:16:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CAFEB1C23A32
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 19:16:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D9061F4717;
	Tue,  6 May 2025 19:15:59 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from WA1P291CU003.outbound.protection.outlook.com (mail-polandcentralazon11021117.outbound.protection.outlook.com [40.107.154.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ACDC4B1E45;
	Tue,  6 May 2025 19:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.154.117
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746558959; cv=fail; b=OIHT2gKGVMBXI19bz2YoSKK3Ys1amD39ElmTyezY0VQSVvkDwH1EE0mhtrYvM8KH5q1SaiWDxh3HKUrb3bo4RyDdm8RYeHrVWDWp5OgGYxxT/ukHyRGq9zjDtAXrMXyod6LGMk5nJd/cWRhBaOhNaO65gPpNYwWpzsiHY4nuPLQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746558959; c=relaxed/simple;
	bh=FNoEyIPSk3gg+9ziuBVmDiwtONvjq5yXxgq3mIhNumQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=c+uOy+vhwExlaF3hBI5K5OCnV44+Mx/v7sjRyLpGI6ST/+ona00PM8A4GpFUfPwxx2cMF42de6aoeom1x+z98FBdyBnmnHKL2QxDDJ4GeN7fmPDHfFMUQHYq6pf2ph7XHBxpR4HCRgtADpzdMZ7h11DxxyLLYN3z+YZR9iCRI/0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=videtronic.com; spf=pass smtp.mailfrom=videtronic.com; arc=fail smtp.client-ip=40.107.154.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=videtronic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=videtronic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uD0K7sigZvDe5JNMPl2b6M5K305FdQQsdXbri4D/sb7OR0V6uKSLNm7C3DLNZG5f8WgYg03vrtrXPUBDJpBh85cs6uYPe7RmO+waJ+vPDHO7UssqKJR2TKk+Ky3L3bFF9QPwph0LKvCrAFlJeOX+rygBPPDNkq0LNK0UNy3pWy8sYwYpsfJTqGPWWUMJcsxDKfPlCVVwPlPtExeb1IcDMfMaU64IfY+ZMWe2v9dSk8DGXLg0ADypSZejt71LazlHEZYsCehk427MmYUGTXNtH/QoyXKRApeR7NTcdsRmxk7AwNNDQMxu4JmdcoK37L7RASaBE05YYF4/m3fRuGARGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FNoEyIPSk3gg+9ziuBVmDiwtONvjq5yXxgq3mIhNumQ=;
 b=ZnVuMY3wEcsAK0E1YHaj3Yd8CSp+fSP6Xo2kDKaU/RXNK3v0JgY+YgJPdMdj+NKwobDdHZztCOL+uI8M44kA6WHNE4W4xuCH07LfLsxtbq3zo6MbUZ2jM5AzkdtLlxUiir5kGolKCP4vfwJ08Ej/aBXWdE7oKa8nMJMfuHFZ0Sxxh08NzjRrqWWjtYorGGygeZSM51FSP89Xt9Tna81l4SdJ1UzsY999wejJnGN9j8P+8mm+FXB3dw8hiKQvxIgKXWqG4sIsa/NA3+cS9A18VbuzVyec7xGpsUWPZP43KrgxzfgmZFTSPjdL1Sim1uQsKw3QIsdz8pLnAzZ3EC/jQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=videtronic.com; dmarc=pass action=none
 header.from=videtronic.com; dkim=pass header.d=videtronic.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=videtronic.com;
Received: from WA2P291MB0309.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:24::14)
 by WA1P291MB0012.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:11::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Tue, 6 May
 2025 19:15:52 +0000
Received: from WA2P291MB0309.POLP291.PROD.OUTLOOK.COM
 ([fe80::5b7e:db51:5934:a36f]) by WA2P291MB0309.POLP291.PROD.OUTLOOK.COM
 ([fe80::5b7e:db51:5934:a36f%3]) with mapi id 15.20.8678.028; Tue, 6 May 2025
 19:15:52 +0000
Message-ID: <d4165e96-7587-471c-a7c5-ffa26531a796@videtronic.com>
Date: Tue, 6 May 2025 21:15:51 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 12/16] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Cosmin Tanislav <cosmin.tanislav@analog.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund@ragnatech.se>, Julien Massot
 <julien.massot@collabora.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Bjorn Andersson <quic_bjorande@quicinc.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Arnd Bergmann
 <arnd@arndb.de>, Taniya Das <quic_tdas@quicinc.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
 Eric Biggers <ebiggers@google.com>,
 Javier Carrasco <javier.carrasco@wolfvision.net>,
 Ross Burton <ross.burton@arm.com>, Hans Verkuil <hverkuil@xs4all.nl>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Zhi Mao <zhi.mao@mediatek.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Dongcheng Yan <dongcheng.yan@intel.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Tommaso Merciai <tomm.merciai@gmail.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Ihor Matushchak <ihor.matushchak@foobox.net>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
 linux-gpio@vger.kernel.org
References: <20250309084814.3114794-1-demonsingur@gmail.com>
 <20250309084814.3114794-13-demonsingur@gmail.com>
 <b214bf8d-33d0-4da8-bf16-cc62bd1fbd55@videtronic.com>
 <f22f1343-9b7b-4ae6-9461-bc1b8108619f@gmail.com>
Content-Language: en-US
From: Jakub Kostiw <jakub.kostiw@videtronic.com>
In-Reply-To: <f22f1343-9b7b-4ae6-9461-bc1b8108619f@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0016.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::12) To WA2P291MB0309.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:24::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: WA2P291MB0309:EE_|WA1P291MB0012:EE_
X-MS-Office365-Filtering-Correlation-Id: 5622dd41-b440-4be9-41ba-08dd8cd26ad0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q2VnYlVOYWxISmxTWEdYSkEwSE1uMThhQmJ1TkovZm9BNzFGY2l3V0dRbHRG?=
 =?utf-8?B?dm9RalU4aitodTlJQmh4MGxYbEZYSHdOMGFHbzI4TFpCL2w4N3V3NWtqc3hB?=
 =?utf-8?B?K3d0ZlVsdXJtYkhCNzNCUGhwQlNFNGQ5K28xUWJZcVNDdWJWd1hiaFlGQlJD?=
 =?utf-8?B?VzZhTXhBOXJoSm9PWitVUUJweGVpaVk3Y0wxWWMwNWEwNnVjbXc0ejJQeHBS?=
 =?utf-8?B?YWZ1bkprRkNaOENYYTdIOSszSXVMTEJ3OUpULzBTWkxFTXpHR3hMV3RzN0NB?=
 =?utf-8?B?dUp2czJ5UXEyQ0wva2tST0F6VFZ3SXpGVDRSTUJJQzRhUkM0bHoyUWdScHMv?=
 =?utf-8?B?Q2YremI0Z0U1K1grQUlmTVVZUllxcWNDK2ZpdEdyZlBuTXVlN050aEhValJk?=
 =?utf-8?B?UHdXbXhQNE44ZHk5Mk82WU1ZWTVxaGJYWi80YytVVm9jb2dtQ2JnWGw2Ui93?=
 =?utf-8?B?MlR0UmdCNzVpby9TQ0RqL1pWR0dXOC9HeWE2MWtjRklCSStYL2o0UnErQXhF?=
 =?utf-8?B?aENYRFRNQkg1ZUpYOU9SNG1jYnU0Sm1NSTB5QmlYYW1CemtWNkYxNVpENmpD?=
 =?utf-8?B?RWZsYTlHSEJKbi9mQWJNWHZPRlBEN3hYQ1lSZnZlbXFzTVlsbTBBZjZSY25I?=
 =?utf-8?B?OXVXMUZPemhPU1NBSmxaSHQ4bklZUDdJYUJhK2owS1JRdTI5dXZWWk1jSmVs?=
 =?utf-8?B?YTc4ZmJyakhXYWhTWDZVRXZseFduV1h4ZUl3VmpZNCszaVBYQTlVeWU0NzY3?=
 =?utf-8?B?U2lkY3B1R2RxYlh3Z1VPZE10RlgvUmdTZ1FhRCtuVXl6UWJWOXh4TmVuOXRJ?=
 =?utf-8?B?YUVlSmZJaHRWTjR1Q1VWNWZBbndhc1k1cCtFOERVOHkvVFl2dmV3WlRiTEw4?=
 =?utf-8?B?b1lTZkxFNFZGWmx4eGV6K0NoN1VjWnFmS2VDTi93RDhRaEtKd082RGpMWnk3?=
 =?utf-8?B?OXdBTHVWeTU4UFVCZnJDTG9qaFlsM0J3SVR6cTd0QkwrWXpBeS95LzFndXVt?=
 =?utf-8?B?dnVVdVlGZkNZWk5PRFhtTnVzV0R4QjQzUTMrY2kvNkRiMjB5MG5rdnYyQWpQ?=
 =?utf-8?B?eE9uWi9LbjFtYlRkTVZUTktCS3ZrbTg5QkVtaGFEemk3Nnh3d1dlMmRaWmVu?=
 =?utf-8?B?SjhpaDlyVEowZU5YbHVXT0JQdFJtMHE0RjhrNkRJT2IzZzVUMXU2U05NdlZE?=
 =?utf-8?B?Y09ZWkQ4VTJUMnlHTkhwM2FJZVRCbFVwcWZNNnY4MkR3UHpOdDNtbnM2cm1n?=
 =?utf-8?B?VVIzaHlJeUplVWNNTDIwWU1XSXUxNnJ2T2tUVGpXVjBMK245akZlT0ljbTBG?=
 =?utf-8?B?Tm1vNlc1UFVjTit4YUZBdk1OdzByRE5JU1diVTVsbjZNUVpMRGxtMWQxa0Zm?=
 =?utf-8?B?NmNlNGhTL3piTkgwREh6eWpTeVJjSGFvUGlXMFdOc0pmc1VFeWRZL1lpaUk1?=
 =?utf-8?B?THZvMDdXVXFnaWkyemt0c2V4SFZnYkM5Nkg2dzQrdkNHMnVZZTJsQWhLT1di?=
 =?utf-8?B?SW9lN3FMdDZsOFNZYytaVlp5WW5PU3hvUkRsYXc2SmgrU3hvVzJ6MWwxRzM0?=
 =?utf-8?B?Nnh4SWRTOXBTTDVQbG9UbER5MVV5TVI3VG1YNHoxNkhWUkM2aEtTeTNpb2VU?=
 =?utf-8?B?eS91dHh3ZmJ0VGlxdHFmYzBoZTNIVWVaaE91aFhMNm0zMmdXSkVYK3pZRVBI?=
 =?utf-8?B?RDhMbk1FMjVkSWwxZkVuSnlWQlY0SFcrRG9MaGNXbGI5OFBja2g2OHc2UXVH?=
 =?utf-8?B?c29PczBqZGlrZWFBSlF2bU9mRUVadFdDNWg4MjNSUXVQUlVnU0xBRGxxSVdG?=
 =?utf-8?B?RVVVS0NNU2M1MzZWODkvTGVqS2dJdmNiMDQ1YTVJMUF3S0ZGM2IzbkFwYXNr?=
 =?utf-8?B?ZGVlTkVicjVnWGlMaGRkdUNJbmhTWE92UW5NMWJyQmlzOUE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:WA2P291MB0309.POLP291.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QlFjdGNNTW5Dd0EwQ1NDZklhRGdmQlBZMTJqWStIQ1JFdXh2Y05IY0JHYS9U?=
 =?utf-8?B?T2RxNkc0RlFsTUxxVXpOdTR0M0UzZ3BwSmI2cW9ESVhNYmdXVlFQYVVzZnVF?=
 =?utf-8?B?eldDRUNKYU5CMVRKeDhmVEgwaUpHUUI1MTlaQ2xQNzZobFhFNWY5VURUVjlr?=
 =?utf-8?B?N24ydjNYS0RDTWxsTEx2TnhOODUrazExYnI2enJoOWd0dkUvM1hJOW5hc2Ja?=
 =?utf-8?B?UHkzTnRBSms3WEVkczhyTThDNWp0ckc5cmZ6SHZqZEFrTXFxNlJQV1VZSTg4?=
 =?utf-8?B?RWh0TjZZZ1pBdVFrZ29wUkFtU1hUdzJaeUdpbFZ3MzM5MUpnRkhySjdjTitG?=
 =?utf-8?B?Yk5NQ0VXN1Z1ZlgzWERPRUdpVXVqTU5jaTJIV3pOc2prdUtWV2cyUWhaejMy?=
 =?utf-8?B?UHRyMGg2WHZQTkc1WUUwZXUwd3VRVXRCUkVUUTVlcjJ5YW84MERjUnQ3WWZK?=
 =?utf-8?B?WFdDcDBUMVZtVm9LUVlxdGtCZG0zK0pabUhTVy8xTXpKeDM4S0F2c0diT012?=
 =?utf-8?B?d2xIQVJCbnpNMjlzVTN3K0ttLzZ3TmtnWVRvTTAyVGY1a2NYNEtQckNHaWdo?=
 =?utf-8?B?Umx6QkRpcjJOb09NZWtnYWhZZWVPM0lmNXZ2d0xUZDZHZFVleE1HYUpualh2?=
 =?utf-8?B?TDFEODhUbTdPQjN2ckdYSzdyVmdYMU10V1FiNUFHOThsZVNlTitxK0RQZHBk?=
 =?utf-8?B?MHBNMGZIZkhDMXRwZXJrRVpUOVF2VlF1ZVJaM05rWnVGc0ZFdWhhdFhveXZ6?=
 =?utf-8?B?RDRjMm53TTlTaXREcjl1bUJSazN2WC9tZ0QySEJYMVJQdmp1dGVqS0U1bDNN?=
 =?utf-8?B?bTYxY202c2F4NndiQjNJclhFWFl4cG0yNm9pZVVGcE56K1VtbGFpYmZFdWdM?=
 =?utf-8?B?NXU3U1R1ekdicGE4aGQvT0ZjcUlid2JxM0pWeVZHb2FDUzNmVmhtMDlsTmpo?=
 =?utf-8?B?TFlLSFpVNi9Bc2lYUTZkU21CMktyVitxQVpzLy85MzR2ZjBoTjNhL1hEeEdv?=
 =?utf-8?B?bmlWaTFheGFsSW9NeG5UQWtXSEQyV2k1ZWYwbExhMXBqbmg3M0FmZXF2MkNG?=
 =?utf-8?B?d3dXVjQzeCtHNWtWVWV2QWxrTmVITk51ZDNmNVJlMHdSa1JZaldPem0zU0RR?=
 =?utf-8?B?WXVZNlZQVWlDMmlwaWorTUh0UHNaN2QrakZZSkhudWVlTnFSbjI4VkhWRFVr?=
 =?utf-8?B?MGNNOEtiZ1NWeUpPT0dXY1BaMDVOdTVVRmJwRE5DYnlkeEhycFg1NEd5WHFI?=
 =?utf-8?B?WjVBWmFUeWZUcnE2YTlhOXJiMkZaajY0OXpsd2hJMXZjcEo1UUVpYnI0Z2dU?=
 =?utf-8?B?SmZKdCsvTEFvMHV4bklqQ1U3NUVXVUNlSDdyTDF1bUdQKzV1b3hxVUMzdXEx?=
 =?utf-8?B?UEFnVTNuaHk2SnFQOGhZUUhHRThpeHVGaUVRMXZxRFZDMVVhYUJCbWZtd2xH?=
 =?utf-8?B?SjE5Z3dQVDFNNkgzV2dyYWdKUkxDYys5Tm9BT1NiREZrVExOSlE3VU9kVnJG?=
 =?utf-8?B?VkdqOHUzRTd5VjJwNllzZ3l1MXNRL1JLd0NjTzBVNHJYOFRFZ0JJSGpLUU1y?=
 =?utf-8?B?b3BxeVRaRmh1dWJmakI2MCtkZVUrOS9ZdThLQWQxYUtkNTcrZHZkSE9EVTFi?=
 =?utf-8?B?U1I4aGVjbVNvN2dmbkE0bDVuMUQyNFNXK1E0T3loTi9veWtPSTFaU2dUYmho?=
 =?utf-8?B?dTJvVmtINUpURzc5cHdmM0Q1Q1BLbHRBdFI4ME15WWNJanZ6c0JMSjBVbWNY?=
 =?utf-8?B?R292MUZDQmsyTjlGTUZJM25EOU1DaW1ML2Y5amZ3Y2xjWjRWUWdZMFVoODF5?=
 =?utf-8?B?NE5VeWxUejRUVEJIMFBORlZRYXdBa25USmgxUDQ0dkUwZ3BwNy81UlNzOElM?=
 =?utf-8?B?RTIxT0x2b1Q4czEzRzhCRmZ2Z3l1Z2Yxc2F2QXZDSlI4dzZXblNiMjZIMFpt?=
 =?utf-8?B?b3Q1cm9ZbWhlUGhOZytGMFd2bnJwSFJZL3RNY3Rvb05Pa2NLSnJkVkVpMk5N?=
 =?utf-8?B?Sk44RnVPYTB1QWNkN1JZM3duRXJuUjE5UTAvbEtLNHlrRm1vd0NsOFkwOHNr?=
 =?utf-8?B?QStCMmx6UzFUU1grOW9POHZ6ZVk1V2kzSWJlc1p0VENUNDEyaTN3S0FiMUhG?=
 =?utf-8?B?STV4cy9jZmg1cExsNUdJc1F1R083aEdGOFdNd1NjMS9lU01mTmsxaU9QekVU?=
 =?utf-8?B?ekE9PQ==?=
X-OriginatorOrg: videtronic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5622dd41-b440-4be9-41ba-08dd8cd26ad0
X-MS-Exchange-CrossTenant-AuthSource: WA2P291MB0309.POLP291.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 19:15:52.0633
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 42908bfd-23a4-4a6c-951d-1ef4d8e0c612
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WdU6A4mfzIMTfzotfxX36x6ZQk6Qi2t8F7X/KsIin+3zLnA5cVM3pjOxK6E15zoOVoUtHM6PhpsoZdDIGT0mqcPvkY/x43hh05JFI3ig+XA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: WA1P291MB0012

 > I'm aware of this issue and had it fixed locally, just haven't submitted
 > a new version yet.

Great !

 > Are you setting a specific polarity on the lanes? I've validated
 > MAX96714 (after the upstream submission) myself and it works.

Our design has all lanes inverted, so we used:
lane-polarities = <1 1 1>;

Only after mentioned change we managed to get the video stream.

 > This should already be implemented by using different numbers in
 > data-lanes property in devicetree.

Awesome, this will come in handy for sure.


