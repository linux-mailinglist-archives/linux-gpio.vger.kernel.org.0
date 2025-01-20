Return-Path: <linux-gpio+bounces-14933-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1958CA1667F
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Jan 2025 07:00:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 12F5D3AA7B7
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Jan 2025 06:00:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E04D217BB35;
	Mon, 20 Jan 2025 06:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="jFIdq4Cn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2138.outbound.protection.outlook.com [40.107.255.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A48130A7D;
	Mon, 20 Jan 2025 06:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.255.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737352820; cv=fail; b=i/kgle1HUWwet1tBMhKZ8AQW1L/j30px01HE9+QupKTGZ8Ittcx0wUXaTDpjTl6BKIFXOs1C9uAEnEXnt1uwFhnhsfUSlEpJaVTng3SLa7kzIkvKj41Tso+DWJdfKd0vPBvdOcrGyejI/kZguBm/qm8ykLythwLruc9H0LwyWSE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737352820; c=relaxed/simple;
	bh=qR4WlSY46W3JzfN0oldNPFKl8ujtS2bJk/169wzmARw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=iHfnPlLJP10F7/3loAfdP2KUDIbCYrVmSMrrpK5SKsuIdmRBpa/2qsM3IP6WK02x9CbZr6sFzSuqjtdjogq8NUGl4Fq6/vnWK8w89YXcqOpWDNTm1WjBnBVp2NEcVYVIXrblPNVPErgmv6OrFzSFos1KGiymTYYNJf+bioLK2RA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=jFIdq4Cn; arc=fail smtp.client-ip=40.107.255.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x9r14Y4GpKAclxdbwTFQQ92oALfVdDEIM2kvjhO3Q5Ir+BioB3K4gyMsyi9L6RtQ6+CAIOf6iFiliYin9ZYbZx7M/AoAyl8s1PhFCsWQBGU4VxmcBb6sO9gAQmJlumqlchbqd3tUxQATN6ugpemK4TfyEaLBtPChP6p2IQ1UcXspFMeT4KREF8RrbJeHfE5XF+V+wx7XniJMuMDtzF6vjKplraN3p+0hPDcp39gN1SNLttJAWK+8MzI0aybbNIQXDVh1cvmdc7JzmjS87m1w+U5ZaSqpP4HsiIeOa8NJ3u7oJDdG4OQ0cdRhb7T0zZywV3hdepKpivRkTGc4gHbQsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pkvFTzShSg/0j0y+wwn+KqgUulb9iViyaJu9DvW3gxc=;
 b=STeOBWz2W91vxxCyyhXV9tUUjnnZAWJd+1wfsbaOFJcHYynXvoEwQU0iuh+n/znCYwLoqaYMyNgJzuOWratqZLfBGfL+YoJtme0yCYKRj/uVq4wnGr4u40xcFEQPpmcEAuA0OgJMkG0gFEc9qYgmuWRrKpeRV6/O3U8lh8aJM8nnQpOCGwIxpt5FCFgSCEk362QdJsNSsLudWt18zaXTh3L6WB9J5wmyaDXyXzOKZPF2iE0gg/R56Mvwu+5KYhtL/dFX3f/2YHPirf0jD6Yq/tL1a+2GRh7sQstJynRA0HlvPkxxIPFRA4XcysBNpVziVQnGtbV44ZbHA3apPtxrmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pkvFTzShSg/0j0y+wwn+KqgUulb9iViyaJu9DvW3gxc=;
 b=jFIdq4CnSeH63jK9cWGcyezYwCxlnVRPY3kn+haNrP4l74cIzrnvSeGz0MxBSoNMNIEpuaPsfbg7VdEh5fB9HsIfJ+Oirh7Gi0Jydi5PmMjmIP5BcKrgsbPeW0MKNCZB3KHuRASryR+UTAgFIXKMQ6WHKME3NpIlEcUhBF/HeoPGq3AwWcrAFJ+HlEwgFHZea96+jn6JQ7IiVXPbNSkY7GmsQ4GDYD/37eA/voojBX9UW8tbXSOtJNR86P8rcPgdZzvtvVb7KAQ7J0IH5SR9yh3TC9P0k0g98CevtnjYvRUFVaW8Oi9CIKr3cBC8CpaPrmhWnyXTa6nnYUosfG63gw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by TYZPR03MB7275.apcprd03.prod.outlook.com (2603:1096:400:1f9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.17; Mon, 20 Jan
 2025 06:00:12 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123%4]) with mapi id 15.20.8356.014; Mon, 20 Jan 2025
 06:00:12 +0000
Message-ID: <fa2fae63-cc0b-40a8-ab7e-82358532279c@amlogic.com>
Date: Mon, 20 Jan 2025 14:00:07 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] arm64: dts: amlogic: a4: add pinctrl node
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
References: <20250115-amlogic-pinctrl-v3-0-2b8536457aba@amlogic.com>
 <20250115-amlogic-pinctrl-v3-4-2b8536457aba@amlogic.com>
 <20250117-fascinating-ape-of-upgrade-0c298b@krzk-bin>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <20250117-fascinating-ape-of-upgrade-0c298b@krzk-bin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0051.apcprd02.prod.outlook.com
 (2603:1096:4:196::10) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|TYZPR03MB7275:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bda7f21-1aea-4fcb-7a02-08dd3917b3cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MEVrQVZUUXlnZ2xUQjNzRGp2blFvTS9QcXlyS0FTeWpCSG5ONlUyb1ZNRksr?=
 =?utf-8?B?MW9ZTmNkUi9uakhpTFNSaDNzaHpBSVExK25kMUVBM0h0SDhGbWpqTWgwRkZW?=
 =?utf-8?B?OE1nQndlYStSYmwxa0ZFVjRSaW5ybC9jTEpIc3BkZEl0MWhRYmZYZkVLNlVZ?=
 =?utf-8?B?OFlHaEh3b2FkOVR3VmtIN2x5alp1Y1k5N3dka3ViRklWMG5Nb3ZWSmdWNjJD?=
 =?utf-8?B?Q2xWRXhOL3FTdG9XR3o3QlpSdjdtSGlWcGdBcXA2NTlybVEvZ0lEQS9ZZ28y?=
 =?utf-8?B?R1o3Y2UwdFFRZlFKN3JwMlRaOXlVUmJTcXduMlFxWVIzemtIVEFlQ2R4UjlL?=
 =?utf-8?B?dnRYNTA3alFPWjhYSzliQjM4K2NGd1V2OTh6VlRVMkJPUFV3NEpZQnNJRkcx?=
 =?utf-8?B?S1YySG5Fc3JJd2loWjYrZVQ2T0h1bzVxNm40ZC84RmlScXRFMFc1QWVqS1d1?=
 =?utf-8?B?Rms2YzZTRnhaRHlLSDBLdW1GNDBIekFNYXh5QmJQc01ZSjZNU255dGFEZjBp?=
 =?utf-8?B?SzIrL1lRVEVTbHpUQlNRUXJ4ZERKM3Q5UFIrMlRZMmdNWlJRdm5rU05pZjJC?=
 =?utf-8?B?ME5TRENVM1VhMnZqTlRVcXdFRUhwM0cxbmlsa0xodng2cHQ4YjNXUVV5cmwz?=
 =?utf-8?B?REcrWElMOFkzS04xTnZRZXBRM2IwbHVYMVNrK0hpZ0c1TTU2TEJSVFRzRGZE?=
 =?utf-8?B?Y3UwR0VUbm9TdkJDNUhVVXJiSWh4OWJvOWtWZytQM1ViSUNWQUwreWdSNEJv?=
 =?utf-8?B?dkZIM1VhalBwVUxGQzdjc3JjRjJvVE1HcVJaOEVqN055V1FNc1hUTW5zeXh3?=
 =?utf-8?B?d0RNREc2WDdMZHg4ZXRVL3ZBbWZjNXBSdFFBMHFoUjdhUUpRenNMKzdNNFQz?=
 =?utf-8?B?akpSV05OOWZZbXFLSGpNb2dEblAvNVE0SW9lc1NJTFdwUDVkaUVnc2ZyZE56?=
 =?utf-8?B?by93YjJCZnpUUE5CSlZJUGQ5ZVA4SmZZZ3dmRDh5Y2s5QUN3UUhOdWlDTUMv?=
 =?utf-8?B?V24vV2JjdDJkQTFXci9FdXp2diswUEFyZW9wVDZveXYzQTZueE5aYzNBL0tM?=
 =?utf-8?B?MWVRTy9aUWF2R2ZhN3pVWXh5Mml0YStjbitERElYZ0xuVXNIVGVGcXBhWG9K?=
 =?utf-8?B?dFFncDYwZ0ZGZ1dNQ0RzNW5zRk8rNXkrMUtCYUk5S3N2N0w0SGp3bkNWbVpi?=
 =?utf-8?B?Rmp6YkJFM0phdk5XTUxrMG50UmtXb0s5a05zeTBIdTZQZWduOEhEZzNFWTF0?=
 =?utf-8?B?OW43R1UzTEc3S1NYdnBmTEdQQUYwZmRhOUV4KzU1bDU5bnI1eGhnaldRMGZ2?=
 =?utf-8?B?NnBNeDl0aXA2bDFscmxOSWZ0c253VFVXNFlGcHg0K21md3ZlOXlYOUxNYVds?=
 =?utf-8?B?RDhkZmdMWEY2aTlYVGJOTUxyNGNPSkhmTVo2cmE3TWYxNTd1RUlYdVFUbjNh?=
 =?utf-8?B?SytvSy9LejJxelpINTFmbndidHU3L0VseGpDSEd6MHNZN3kxZTZDZnJMY2ll?=
 =?utf-8?B?VEZRUC9SL1FNOFJDRVg5OUpyU1VPRk1KRW81UWZwQkU1ZFNoRUVNNWxlVGdl?=
 =?utf-8?B?aTBPdEYwZ0Y1K0VITXlSNXlQRE5MSUMyME56ZTNlb2FCaEVBaGpFaVc5cmZ4?=
 =?utf-8?B?S3pycFRwRVBwWHJ0SDNIS2ltMy95YkhDbTl3NW9NYjhGYVByQUhaWVB1SVBp?=
 =?utf-8?B?bnRPUlRnWTJ2eG9PRGtVbXdUMzE4RzUxRURPcU1BYlBJQmMxd0ZLUEhoNDlr?=
 =?utf-8?B?eVZQRFJuQ1FuQ2lCTTFGV0kvOEZXT296N2ExeXRUVVlyVGJOeUdFRmd4V2la?=
 =?utf-8?B?dUV6a3Z1VzBnclhxa1hsaXphVDA0Z1lEcy9HZmp6elpOQTdyOXRiVkhSb0pV?=
 =?utf-8?Q?DPC3YFw/ozpb7?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NFVyTzQ1c1JITkRUdS96SHVjUUFqaVpCN2x5NHRvdTZUOUZWd3NvSnBtYUsr?=
 =?utf-8?B?aFBBUUZaWGVlUGFPVW1iWUJCWUNwSUNORHVLZDQ2WHRXc3JyU251Q2NRbmg1?=
 =?utf-8?B?Y2lEOUdDemtxTlhOc3ZUbmJoakp5TStOWTY2citTSXJSWGNZTkM5eTIwTDVL?=
 =?utf-8?B?cEJMdXFadVNiM2dHUHppRmhWcm4rOFN6azZOQmZ4RmZYY3Blb0hzK2wxakMz?=
 =?utf-8?B?TXk4VWgzUW1tamo4SVFLSERSYjVzTFBKQXQxQzRrZ0RoemRwaVZKRC9SeGs1?=
 =?utf-8?B?ZDRRaTI4WDV0NTNJZE9WS0p0WXhXNGdLTjd5bXRnZnJqUU0xeXJ1SkZPOUR2?=
 =?utf-8?B?dnkxQkZOcFhVclZkeW13VGl0V0VGVVNDdTkwbWkzVEIvZmVIVjgwSlR6ZjF5?=
 =?utf-8?B?N2ZsKy9aUjVkMXdvTXBITkFldHNrbWJyeVAxdWQ5d0l2SjNOM0ZyOUZDaEZz?=
 =?utf-8?B?dTBnNis1eUxaNnlwRTRZa2pSZGNlc0J6TXQ3T1FXSlVGSnhmTE1VVzl2MmtR?=
 =?utf-8?B?Nnk3RDJHWEtCazdVSUxLcEJQeTZLSitaL001d3pyOXRqQW5wQVNQRTlVQng3?=
 =?utf-8?B?RUdDSzF6Y0NWQk1Qai8zdUNEVjFjSnJ3dFFZNTVMc1o5c0ppRnFmeHpIN21M?=
 =?utf-8?B?a0gyUzFuamRzNUV3M3RldGRyWE40eFB4MWZvZmVKSktFOWZRejY4WGd5anhW?=
 =?utf-8?B?aU9JdlZHTTZrUkZaVXJGSTEvNWxUVDlEMmVXWC9TZzI4T1czL1k3TVVtRkl4?=
 =?utf-8?B?blltL3FsT0h4ZU9MV0lVbmYvakowOXdtT2FScTdNdEtuNlA5Q3pKWDg4T0dw?=
 =?utf-8?B?eHBMckg2ZDZka0lNSTBTUExTVFphRHoreDJrMmY5K2wyN2EycjZZNVliQXdz?=
 =?utf-8?B?NHA4a0NrbjN4dXZKNjV6eXBMMytNZ21lZFRId1JTVEpubEFqTkVpbkVBT0Vm?=
 =?utf-8?B?RGxESndvY2tsY20xR3BaenpCS0VjTWJVa0QrYkwyd1A5KzdPakx6d1FKVGxD?=
 =?utf-8?B?OFV2UXp1elJVdU5wSDJ3RTlOSmgxUG1iVDg0aDNmUC83RXRSUjVDaEFNckt1?=
 =?utf-8?B?NHdSakpvelk1RGM3NnZ1Z20yb0prVnZ5bDhHMjNjKzY0NnF5MWt0L3B6QzNs?=
 =?utf-8?B?OU9wL2l1M2pWWldod2tKdURnVzB1bVgzV1hGUGRUL2VPM2hnR0VXTkExekUr?=
 =?utf-8?B?MU5Bd0xHdm9qN0RLanY3Qm5XMklEckFkTGJ4c1RoeEJHckFNaEZDM1QzWUFo?=
 =?utf-8?B?elZHVHArQlJEdTh1WUU4WTJOUUEyMHRWUlZRck50dit3eitFdUlFNUgxWkJI?=
 =?utf-8?B?Y2hvNnQ3NmxMVVRJVXFJZEVOQ1JxSU5reGR6OTJocUl6VG4xVnZ6a2lhb3Yr?=
 =?utf-8?B?cFRza2ZEejNna2FLUm1OZW9rOUtqbk0rdnUrSE1kTFVBdzdPc1QzSVk1b2Uz?=
 =?utf-8?B?Sk5oSkVlOUpNakxxcjRPV0xlRk5wTTd4RXNYZnh3eWRlR2hxa21kRnA5RGVC?=
 =?utf-8?B?NFFsU3R6bHVsNWxKYllYWERxcTZSTHM0ejdocnhQRFlZaWxjS1VsdnJWVXBt?=
 =?utf-8?B?MExoeFNadDBCM25wVkE0WWd5VVdGU0pLM3BobkowM2lBVnM4WjdtUXZpT2ty?=
 =?utf-8?B?QlJIRWUwNWNrOEJjd05kclZrR3p4WEgvUGxqNEtKYW5HUjFmYWY1N1BlbzMv?=
 =?utf-8?B?b3E5azJhZ0l2ZlN0S0ZVaTZQbzRUTmNsbDRjUGZtNUc0RzUxMXpVaC8xQ0Y2?=
 =?utf-8?B?WXd6NTVieU9DNjI0SDBQaE40WWQwU2VXRWUzbzRabG92L2o4bVpyZTN3SEpP?=
 =?utf-8?B?clErY3RPOHF6WFpGS0g3aUVLWWZDaW8wNTZidVc4TlVxdjg0diswN0FGa3JO?=
 =?utf-8?B?MExseGNLL2V4R0FHNGREaXdva0U1Y3pwS0pVdkFmVHpnMXFuc2lTRHRiNFpF?=
 =?utf-8?B?YTNYMVlBQytGU0pXYzhqdzRFckNoNFFWa1hKSmI5U1A4M1E0UFAvaE1qYzNI?=
 =?utf-8?B?UWNvcTJyN0kxSTBXL0JOZzF4Vm5ZNlYzaVFlSVg4RVAwc0crZWVMMzF1QUJx?=
 =?utf-8?B?ckYyYjlybWphdTVSbzF4bVNraFJtVGdRbHRoejN1bFhQOG1VT1llbHFaK2ta?=
 =?utf-8?B?Sk1Fd0RzVjE3bVBvVXd3Ylp6ZjlnWGRBcm8rRmRFTGlnQXlONjFTOVJISnU2?=
 =?utf-8?B?REE9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bda7f21-1aea-4fcb-7a02-08dd3917b3cf
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 06:00:12.1933
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RyWWuVr083TKaC6ONjzRLsyeXIflGI8ZlWbIticB1/zh5Q5/wc1lcVbBKuYs1+nhhJOtcj8b4qduZ1Yn8TkqEAxcui2kLwq1TFj0lQqA4Mo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7275

Hi Krzysztof,
    Thanks for your reply.

On 2025/1/17 16:41, Krzysztof Kozlowski wrote:
> [ EXTERNAL EMAIL ]
> 
> On Wed, Jan 15, 2025 at 02:42:02PM +0800, Xianwei Zhao wrote:
>> Add pinctrl device to support Amlogic A4 and add uart pinconf.
>>
>> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
>> ---
>>   arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi | 133 ++++++++++++++++++++++++++++
>>   1 file changed, 133 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
>> index de10e7aebf21..8eb95580d64a 100644
>> --- a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
>> +++ b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
>> @@ -5,6 +5,7 @@
>>
>>   #include "amlogic-a4-common.dtsi"
>>   #include <dt-bindings/power/amlogic,a4-pwrc.h>
>> +#include <dt-bindings/pinctrl/amlogic,pinctrl.h>
>>   / {
>>        cpus {
>>                #address-cells = <2>;
>> @@ -48,3 +49,135 @@ pwrc: power-controller {
>>                };
>>        };
>>   };
>> +
>> +&apb {
>> +     periphs_pinctrl: pinctrl {
>> +             compatible = "amlogic,pinctrl-a4";
>> +             #address-cells = <2>;
>> +             #size-cells = <2>;
>> +             ranges;
>> +
>> +             gpiox: gpio@4100 {
>> +                     reg = <0 0x4100 0 0x40>,
>> +                           <0 0x400c 0 0xc>;
> 
> One line
> 

Will do.

>> +                     reg-names = "gpio", "mux";
>> +                     gpio-controller;
>> +                     #gpio-cells = <2>;
>> +                     bank-number = <AMLOGIC_GPIO_X>;
>> +                     gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_X<<8) 18>;
>> +             };
>> +
>> +             gpiot: gpio@4140 {
>> +                     reg = <0 0x4140 0 0x40>,
>> +                           <0 0x402c 0 0xc>;
>> +                     reg-names = "gpio", "mux";
>> +                     gpio-controller;
>> +                     #gpio-cells = <2>;
>> +                     bank-number = <AMLOGIC_GPIO_T>;
>> +                     gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_T<<8) 23>;
>> +             };
>> +
>> +             gpiod: gpio@4180 {
>> +                     reg = <0 0x4180 0 0x40>,
>> +                           <0 0x4040 0 0x8>;
>> +                     reg-names = "gpio", "mux";
>> +                     gpio-controller;
>> +                     #gpio-cells = <2>;
>> +                     bank-number = <AMLOGIC_GPIO_D>;
>> +                     gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_D<<8) 16>;
>> +             };
>> +
>> +             gpioe: gpio@41c0 {
>> +                     reg = <0 0x41c0 0 0x40>,
>> +                           <0 0x4048 0 0x4>;
>> +                     reg-names = "gpio", "mux";
>> +                     gpio-controller;
>> +                     #gpio-cells = <2>;
>> +                     bank-number = <AMLOGIC_GPIO_E>;
>> +                     gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_E<<8) 2>;
>> +             };
>> +
>> +             gpiob: gpio@4240 {
>> +                     reg = <0 0x4240 0 0x40>,
>> +                           <0 0x4000 0 0x8>;
>> +                     reg-names = "gpio", "mux";
>> +                     gpio-controller;
>> +                     #gpio-cells = <2>;
>> +                     bank-number = <AMLOGIC_GPIO_B>;
>> +                     gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_B<<8) 14>;
>> +             };
>> +
>> +             gpioao: gpio@8e704 {
>> +                     reg = <0 0x8e704 0 0x16>,
>> +                           <0 0x8e700 0 0x4>;
>> +                     reg-names = "gpio", "mux";
>> +                     gpio-controller;
>> +                     #gpio-cells = <2>;
>> +                     bank-number = <AMLOGIC_GPIO_AO>;
>> +                     gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_AO<<8) 7>;
>> +             };
>> +
>> +             test_n: gpio@8e744 {
>> +                     reg = <0 0x8e744 0 0x20>;
>> +                     reg-names = "gpio";
>> +                     gpio-controller;
>> +                     #gpio-cells = <2>;
>> +                     bank-number = <AMLOGIC_GPIO_TEST_N>;
>> +                     gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_TEST_N<<8) 1>;
>> +             };
>> +
>> +             func-uart-a {
>> +                     uart_a_default: group-uart-a-pins1 {
>> +                             pinmux= <AML_PINMUX(AMLOGIC_GPIO_X, 11, 1)>,
> 
> Missing space before '='. Follow DTS coding style.
> 

Will fix.

> Best regards,
> Krzysztof
> 

