Return-Path: <linux-gpio+bounces-23159-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCECB01BEC
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jul 2025 14:26:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D77517A7B17
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jul 2025 12:24:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39DA5298CAC;
	Fri, 11 Jul 2025 12:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="wF07nwXN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012058.outbound.protection.outlook.com [52.101.66.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9050628B501;
	Fri, 11 Jul 2025 12:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752236758; cv=fail; b=n8LXw0WoDZBSB08abn/ZfascXvEzGsFOkgI4ky4lVNO1emaWKG91tjgYW1e3H9yPpTuNcTU2y75uUVap9Hi5ulmuJrVsndlbxFkLfA4ihF6uP3zlClsMPyr0fv3de6eMxJkJqqdVuH1OaEo1lZQPkhiyR5j2t8mBAoAQAROF0Ro=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752236758; c=relaxed/simple;
	bh=kWcAbmjYRdiWe0rFCasTtT3E/b+kVQyr8pYOKPHIAI8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KobFk4Eg5bkw4pg2ajiMqiWdjgv521wZjDelNoTigV1VFpHGThzlJwHpRjVDuvF2+jqqeQ/gx63GoWLvpoqJ6SsftOOKcdcwc1iW8LJEX8HpY+ZhKcZUAqvvGqTq+IItT/wSDkp2A8cU1HNlPFArzhm17lVsg+XKp+oBFks0S1Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=wF07nwXN; arc=fail smtp.client-ip=52.101.66.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NNfbgllZoZMCJ5SZIPM4WtaL4qmpW/26WwZE4BM275syf7qtw3KYqqes0iZaAqvmPZWPrg5Sl6n+Tan78qq6QSuczO0i5WP8x+OQcaWkwHMjufgOWRHrA7xrWs1UvvQBMoEQUFXIr0crl/s30+bxVF161aukswNVmTMHV7P7xjuLErRgPBo9aUvPipJzKupIGMfyVS7tZZ4S3qvX7OsjpJ++QFo6OGANiOrx54lD2+bgfEstYJSwZtoMwHJGO8O+RWIY9Vh6hOanK6H04BSzQHxkkmnQOBnC3PUqjoz+P7h8+eQWjCOFZXk+wcvVpYUjJu0xmyxzcEV/6/E2zH5d1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zkvla+eeAXr7i59Hzf2l1+ZQhhwLjfeEaAT60YIZpSo=;
 b=Ot/ceiAe9D/YVIOdLLwJREZhasMHeePFYbIxV78ghEcNAj+ROT8XCqzF1fri+HLJU3kMiLEJp+KuhGvlEI/B0K1Lh4Fyj/Oc1OTy/dYu/k0dgNENBmOFkt6hEX7X/H3nbOzJazNoeNAv5eRVIZTNBcWPKSQxwRpvRuJxxfbYSP5xLfJt+8+5//zx578VtU8qfxTO9lr96eRhWff3+fQrPGfCCeIRsbn+Y20L3+08n+Otqzi/js5HRDQSEzuyv6+LwuF4eKIJ++Tzr3JtZKCZzRMfiCUadpAIm0EYdvfdjXEvgv2X9NmzJ34xb4RFPO2Opr5Y23k9ixy/cg6fYUlrAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zkvla+eeAXr7i59Hzf2l1+ZQhhwLjfeEaAT60YIZpSo=;
 b=wF07nwXN8XomFBYsbLUAG8j4vZtTCmipH4cfgmb4uvWSoN43SyRN8EEYjv90KXT6PzW8RC0ULc18HKRhvz5qA9R6EX/Z/f1FpqhGPQRGXMac1rttS5kW5KUudgOVjb0sniNRr+7jNKYZhWx4eE847Holuu8mVN/woYw27AdGP+smUx769PoUEofHEmgXUbRuJ9grkf6XIegXYwvIx3AY6EsO6p8jQsK7QnMBgRg8P5M7WT6LdUr4FNnv8PAy94nOgO1USGyrrb7ZEkdoXBxfY4HQfVzaQywDchZEB8ootDTxSX9r2mP07wUtBAJg/h1Fzo88jeKSwU8jx8oqf7yjwQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by AS8PR04MB8039.eurprd04.prod.outlook.com (2603:10a6:20b:2a2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.29; Fri, 11 Jul
 2025 12:25:51 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%5]) with mapi id 15.20.8901.028; Fri, 11 Jul 2025
 12:25:51 +0000
Message-ID: <168a8ef3-c8db-4bda-a746-60a4a879b953@oss.nxp.com>
Date: Fri, 11 Jul 2025 15:25:47 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 01/12] dt-bindings: mfd: add support for the NXP SIUL2
 module
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, chester62515@gmail.com,
 mbrugger@suse.com, Ghennadi.Procopciuc@nxp.com, larisa.grigore@nxp.com,
 lee@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 festevam@gmail.com, aisheng.dong@nxp.com, ping.bai@nxp.com,
 gregkh@linuxfoundation.org, rafael@kernel.org, srini@kernel.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 s32@nxp.com, clizzi@redhat.com, aruizrui@redhat.com, eballetb@redhat.com,
 echanude@redhat.com, kernel@pengutronix.de, imx@lists.linux.dev,
 vincent.guittot@linaro.org
References: <20250710142038.1986052-1-andrei.stefanescu@oss.nxp.com>
 <20250710142038.1986052-2-andrei.stefanescu@oss.nxp.com>
 <20250711-enchanted-blond-manul-f8bd3d@krzk-bin>
Content-Language: en-US
From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
In-Reply-To: <20250711-enchanted-blond-manul-f8bd3d@krzk-bin>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0241.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f5::6) To AM9PR04MB8487.eurprd04.prod.outlook.com
 (2603:10a6:20b:41a::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8487:EE_|AS8PR04MB8039:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d24d875-1649-4dc0-7409-08ddc07612be
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|7416014|19092799006;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dWZyMFJMMFdleHZFY2c5SlBBQ2h6Vm5odkdXQ1Fob2RmdTEvcEEvcnJVQkxs?=
 =?utf-8?B?T1JwdmN0aUNzN3F2SkF4RGVRUEVWQkpibTgwN2luQXNuZU5YWmdYN0VMSC84?=
 =?utf-8?B?VkdlMjBQVFVHMXAzOVpzZmYwL29IWEdXQ3FJOVpXQVFrYkJ0V0U4MWQ3VnJ2?=
 =?utf-8?B?ZHRIYjhGNzBwK3ZiQVM1aG5nSzh4UnZ6YmtpQ0F5VXE3WXJTM2xLemE1L1F0?=
 =?utf-8?B?cnlkVVNOR1FCZWtCUlVkelVSSDlLZEVrWTFGekxsejNuYi9FRVJHTGcxQ1Vt?=
 =?utf-8?B?V3NFU0RWWElZeEc0eTY2QjVaV1ZPQ2NteEdhajAyVVc3cXh5TC94dVFTUVk1?=
 =?utf-8?B?ZTBkSTRFcmd4dk5rVmUyMWJTanVMRHgxRk94S0lTMWdJZHI2anBSWTgzWkZD?=
 =?utf-8?B?RDRHWW0zVzBsU3F6ZHg2WFNQZUM0WW9XejJSalBWaTJML2M5cFJaMnJwME5J?=
 =?utf-8?B?L0lFZEJwZTdGUW9seXptQ2t3RUFYYkVvYnowUU9EaWRIbjdWd2lEUEd6T0RS?=
 =?utf-8?B?RSswcG9WQ2FqZFR6NUM5THcyYlErRkErakpNRWtYYVp5U3B0T3hKamQ5NWIy?=
 =?utf-8?B?YnF5ZnpuMWxmcEZkeks0TTg1KzUyNFdCVE1RSkVFakpOeGl3aUZnMFYwU2JM?=
 =?utf-8?B?MElxb0d4bW4zSWtRR3EvajRId1BRTWJmZmdFTDJrei90NGR2d09BYmJKOG9Z?=
 =?utf-8?B?bXJLeW9STzlPNHVCamtqSVVqMHFJNWJKTWxsbWtHMXR0S1BNczMzZW1RL2h6?=
 =?utf-8?B?RGtSc2Vha1hLYmNDT0xkZ2N0RGF3SGRlTm1Ea2MzdnBHWG1rMG92VkQyak9v?=
 =?utf-8?B?SDhJMlRQd3BUYzZmVHJjb3VpNU5ZKzV4RzU5ZDBRMy81cFMxaVpja0RjZElq?=
 =?utf-8?B?Vml3NG9vS2lJMkQ4cTlJWDRZbGVLOFZRamJndjhmWCtUZnNPeE5pb3BqMGRj?=
 =?utf-8?B?U2VqTmhGaTBWSkZqSHR5RnVGbkpzSjc5bDZvc3FoSlpYV05XMkVYRll6VDUx?=
 =?utf-8?B?eDFCRU5ZRHptOSt5VnkyU0UycG1DZW44c29DR3VJNEZHdWhzbWlVaGR4NVhT?=
 =?utf-8?B?NnVhanNneXdZRTJoN0NJS21FaDZEVmpkeDVUcmxOMEtINlMvWWRsU3gvZG9M?=
 =?utf-8?B?QWJzRlhvNkRGSzFTd3BLSlRxWitWVENzRzlxRkt4citzYW5DVi9VMGt1aWpL?=
 =?utf-8?B?Z3JSZDJCWllWNUtjeERxMVFvOWN4Zmw1M2hCZDE1a3h1SitDeFd6SHBaZll0?=
 =?utf-8?B?RUtJbHNTZThqK2E3WUs2Y1NvaHdBcEx0TEtWbElIVEc1L284cTA2L1M1QVlO?=
 =?utf-8?B?K3pCZWo0dytRVDFpMkRURGREMkhWNHU0clhodU5NUDdXMldxaWhhSElrQ1Vz?=
 =?utf-8?B?OFlsS3lMREt5Wi9LK1g2QTFSeVdCbjhyQzFSbXFZWmVlQXg3YzlDREg2ZDhp?=
 =?utf-8?B?eEdTcytZZ2F0aXBrMHFXOTNVb1JoTk8wREhpU0labXQ2eWhtZmVQcis1TC9C?=
 =?utf-8?B?TGtibCtteUUzUmp2OEVJZ0VobTNwYm9WbzNqblhtYWtWTU8yOThNbnEzMERF?=
 =?utf-8?B?ZXFGVnFtMlhaVzRBYUk3WWtMRG9tQjVnMVhwc1V5cm5OcjFma0twR1NNSEwz?=
 =?utf-8?B?SmtEbUVicDA3OVA1bk5IbVlKeTZlNVZYSFVVc0YwTERTSm5iUGRNREdybWVN?=
 =?utf-8?B?aU5iL09GdGZucDA5a3ZId2R6dEMvWkx1WmlVZTU1QSttb2ZGY0RzSmYrVFE0?=
 =?utf-8?B?amZrU2tMZ2lldzVtWkltUnJSb3cvbDc3czFJTWd4c1o1NzYzbE9yZ0hadTA3?=
 =?utf-8?B?OTg4ZmFRZkdEc2ZUWGRSck5QT3daTERKUlpSQzM4RXB3Z2laSnNMK3JzbTRi?=
 =?utf-8?B?WXR1aHo2OHljOGI1bkRDMmF6RFl3bXExcVR0d3pwcXZsb1dDaXY1aEFBUnZE?=
 =?utf-8?Q?Ds/OV7i4adg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014)(19092799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q0ltMWh3YWRFTi84TTllR0RySHo2ZEdTdDVPZUtqQ2RNd3VTN1BXV3N4QnQr?=
 =?utf-8?B?R0wvY0lWVjEvWXdMUGZ3NGNkVTJNVlBpb1Q2cHhtZHlneWtMK0FOQU53YXZh?=
 =?utf-8?B?ZWs1dDJlbkFrOGJWT0RtcDMwYUwyYnZEOWlxUWZaQlFoVHhCbjZlZXBQditr?=
 =?utf-8?B?RWI0RjZlL3hpZGtPbVNJaGxPUUk1VWVzbzJOWkw1Y0ExT0V2NUF1VngrN3dC?=
 =?utf-8?B?MlRBODlwbGdSTUYrMkRFdmwwMmpkWWd6OGg1b085b2JQcVYrUGhpZiswc0lM?=
 =?utf-8?B?T3NTVmVsTS9SWEIxL2QySDNHd2Z6VG1BOVpUcU5Qd3NrYkdmTm5Ed1kyL0hM?=
 =?utf-8?B?bGJsVittNW00WTBnY2ttWjhqaFFoaVZZRGlIamxoZXNWRHJQWjVEcmxOWXNS?=
 =?utf-8?B?S3lVTURtNFZ2L3A3THdSK3VtY3ppZmxrUkp4YnQxVHdwUG16Q01PNzNxeFAz?=
 =?utf-8?B?UUdxSFIrVGRwb0FZMTRpdTFoYVZKd3hyUXhGM0FzWVZiWEM4dk5Ldkxib1Fs?=
 =?utf-8?B?eE85UkYvVVBOTHZSeDFwV0lFNXNzYXFISVlvbnNSNFhnNUVSZzcybTB0VDNF?=
 =?utf-8?B?UFBFZjc1UVlPcEw3V0RhUkFPZ251OGZvMjRVdEJhYnFyeTNHcCtoY2tPUjd2?=
 =?utf-8?B?Y29vSXlkRGZ2RzlaRkZhbVRtbTdlQVNhQ2RERi9aa3ZFQjdEMkVibmdaZmV5?=
 =?utf-8?B?YTZnNWdDU3RaL25vdGFGeUFSZzJlTGtYKzR4bSt2UDNOeDcrcXdVSFJTN0NP?=
 =?utf-8?B?ZWVRYjVXYzdEOHp4K2hIR2hDc2ZXWUJ2YzNXai9Tb3lGdTN3WHdHQ0RlUHZX?=
 =?utf-8?B?bG5mV3MySUhBMUxtZWJqUmgxUmhJVVIzZmIrUkVuUmR0bnJrVU9PaGw4bkly?=
 =?utf-8?B?aG1yaWNoU3FkU3laWitRc1JyK2ovN09oWkRkRkc1RUYrTDhOMzFIK3FnR3ZX?=
 =?utf-8?B?aGFXMXROd1RrMU9hK0psVzltWlVsU3Z2N01RMlJnczRVWEJZUFhIMEhGRGtR?=
 =?utf-8?B?RXZHNkVRUUtSNGRvR0pMd2NtS21iTzA0UjdYZ245clpUeFVINjh2enkrTURS?=
 =?utf-8?B?bERKVDNQK1JkcGRTY2JPd09WdHJRWUVuV3NrSjBUU1NrYlpWTE9BS0Nzd1RW?=
 =?utf-8?B?enJwWEFKeFFVUU45YjJQNXpYSE83M09JdnZWTUNCcjVtUUorUG42VlR1QnpB?=
 =?utf-8?B?QWNzOHpWbFhQLzdXTWNlSldCWHBNRlAybzRycjBseUQvYUN5U2ZiRmcwcXhZ?=
 =?utf-8?B?QWU4dDJhTWxBZjExRVZuTUs0OHBmUExQNTBaZGw2UWt5YlYyclJyN3Vkelhj?=
 =?utf-8?B?aHkrcFlVZkNrKzBES3B6VFdHazc5dHQ1RE9lRUNyYWYwK3BZYWlBVnhVU3BJ?=
 =?utf-8?B?Zm40V1RkaFo4d0djVWdGV0NUd2ZOdkpWR3pibWhwc1JsczNTaVY4bS9CR3Fr?=
 =?utf-8?B?eDFRZFQ2UWFUbUw2L2NBWW4rVVdxZVBrY0VCWWRScDU5ZVBJeDkvdVBaQU91?=
 =?utf-8?B?M3JNZHQrMWRGZ1R6dXVOblR5Zkk1Y252Q0ZpWWxmRHNxQTVudnNjcWo3TVFH?=
 =?utf-8?B?dWRQMnEweVBqK2JLWUtaUVgyMTM5YTVuNlFZSHZsd052S214dUhZRU4zRmVW?=
 =?utf-8?B?OVNqZldwTk1qcW1BRWNiL0xHWUNiZXlleVV0ZHZ6SjBkdXJjbC9WQ20wbC9G?=
 =?utf-8?B?Q0E5emR3MFMyeXA3QUdWektxcHkwTWViSEVRUVJsODhmWlZyZEF3aFh6NWYv?=
 =?utf-8?B?eE5TaGhyelZHMTRhdXZkald3U0JzMENzaXRBVHY0eVBwUnNteURaMWlXRUVn?=
 =?utf-8?B?ZkZ5eFdDOXJuMm9qMjlvQTJjZHNGT0x3ekh0V2RXSmp3ZXBZWjdQL2ZFT0xT?=
 =?utf-8?B?TVB1QzNVTTBWT2EzU1pHUCtoTkpXSG10VWN2OXVZNzBpbjVSd3BxMnlWaDRU?=
 =?utf-8?B?WU9KN2tTOEE4cUlyVXdQMDJ1cFJIVm5LT2Vob1NiUWJ6OVBEL1V2anJjTkF4?=
 =?utf-8?B?UkRQTkNlYUhkRHdQcENORUVxdGQzeDRtT2RHZTU4c2UvQXdwOUZkelgwQWkw?=
 =?utf-8?B?TG5OUDFFRkJiZFJpUkJVQk80bDJBU3I5N3FRMkpCNndOWGl2VnRPcW1pRUEw?=
 =?utf-8?B?SGR4RW4vYzd6SGJJZGZBWHUyYVYzaVB1MGJtaHBVZW9FUzV4b2s1WnBlMGRR?=
 =?utf-8?B?c1E9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d24d875-1649-4dc0-7409-08ddc07612be
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 12:25:51.3600
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dsJgcyPBPXbkoZgXzstvtPtqF1uUacyIWWfB44Y6f40FFtvA03IvcCmskKpEOvEKy3nhOER1NnAPCSdJV+cbq93EoJh43e0dJdORlqkoZOk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8039

Hi Krzysztof,

Thank you for your review!

>> +
>> +  reg:
>> +    minItems: 2
> 
> Eh, and after reading your deprecated patch I went back here and see
> this changed... Why? Why are you making random changes?

I changed it during internal review. Sorry for not mentioning it in the cover
patch. I will revert back to maxItems.

Best regards,
Andrei

