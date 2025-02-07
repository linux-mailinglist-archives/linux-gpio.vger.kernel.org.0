Return-Path: <linux-gpio+bounces-15504-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40807A2BC07
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 08:07:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1221B3A4EE1
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 07:07:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12FD918E02A;
	Fri,  7 Feb 2025 07:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="G6mteD0G"
X-Original-To: linux-gpio@vger.kernel.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sg2apc01on2132.outbound.protection.outlook.com [40.107.215.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F0D188736;
	Fri,  7 Feb 2025 07:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.215.132
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738912058; cv=fail; b=nc4VDT3mDTgN4AJR7vEzPRAAFy3ltNfGCrNYIFKxgGa/qLvJrNn+LqUDg2qh6Sgx8Z5KnTwljmGGHQ45ECubvS0qTHIa33ZDIKI2TkkLNt1T5Kzick9cyIhtR/qE8O2/UyaS6yozNkIOf94Wvl53zkg0WzAEBQ+5uOxOFBvqmV0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738912058; c=relaxed/simple;
	bh=ibgwDWkcb34Xt46hmiXpa/BjFUAcGjUG+mqEO+w5wxU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=eW3CfQodxaypuXGEypsTDHJf+msEJHawKtxmZ5WE1my4WA+8unC19/thDp2U3Y58Q8GNkGZvdjBbZy0Uy3RpAX3bCx67pcMx0295dbqPM8Ys6EcDeBgPu4fZIfL+F0OBEHwMxaqEnF1vkvoCkzfeGuIMrBvIGL8vDXPIBbcF3Yo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=G6mteD0G; arc=fail smtp.client-ip=40.107.215.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZrgRVPCrU1YZo4naKlZDxOtyx9i4h6CsEFhfLzn3RdPeok/rr24mHWjU2uxtlg+mC8myPoi92r7Knt3PudFQKMC5cpZoEd3ggmS9h5S0lMaxmlolNFG2s9UM3ISnD20Z2Kgk50h1t5PWzVOuDPBEcWy78lM+evo5qnVgQ63JM82U4i3QXs4o76KML4u5aG68Y/YqbElJPSkLBSiAxjY2VTak++xoJF2DaksZb3+C+bThKCda+x2bJ7OVJD4D6P5p8DWEdpjdHbKq633oA8+Ih0MSI1GZkyH1otNPjz5f0I8o4RkcNcnkCm6ijbRrQy2h7+b6RYgfqk7tHhlgeSxn+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=puu2+/4Po2GvPaRCKnnJMrHGieggJ+nvt3cw3+y3yDM=;
 b=MkNOeYFVODT3NtpkbI17VlR3AZ492iNH1jRKUMg5+trNA8VDiAd4X5vLf3xcEQSSwtTxKyV3S6/116NeP4ji6NP8nf3Uo9hsoE6lQH8yYhEB6bqaqLdO3CmSIYgvJZkHrtcROuFuttMEXX45Mbv3VEvpmBNZOht3wtOUvq9aw1YTVGSbcKVMaVbErls/lnYN6dB74szDdYPE7qFkmIssSgaloqmJuJ7OTk+0btsIXsmpvAUp6EtvlMqS6I8XP7oPHyrXwM+XR0VpKgMankAjLKebQp08Vioy3AY102FzsXfamtcGGdcLY9ltVcnW79zq1OM3+12LdMFoAZEB8esiiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=puu2+/4Po2GvPaRCKnnJMrHGieggJ+nvt3cw3+y3yDM=;
 b=G6mteD0GvYR6gO/nwmn0VSkKCC0c2NvLlFgnPFGM6oxZBBjMlQD9HouXXWrqCQ5d0ehKWctsWJWTskr9gv/yYPbzZ/7BuU2KjUB3OgVCaJa56CYaneuuBs1o6cx4LOeAzjQnUOktfNoH32655dTV7ctcFEmeZRPbW6qhGcfYUo27NtAWBoizuEjDgugkN8qqbYquJijSC9p/0nh3/fRxS4w8DXXT4/BGC+YW02XmpQFAGTzr6eU8PmQcbIVOvZ4acZrADRGSJdS/5OfLM5AnfBU2+HF9uUvCavCBv9xeHgNV7GG3aLK7SRx8uMqatio1+Ms7H+4rUHBZHjKlNAnAjA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by SEYPR03MB6579.apcprd03.prod.outlook.com (2603:1096:101:86::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.12; Fri, 7 Feb
 2025 07:07:32 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123%7]) with mapi id 15.20.8398.021; Fri, 7 Feb 2025
 07:07:32 +0000
Message-ID: <fc2ee33d-db32-425f-ae5b-e56a15bc27e4@amlogic.com>
Date: Fri, 7 Feb 2025 15:07:27 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] pinctrl: Add driver support for Amlogic SoCs
Content-Language: en-US
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
References: <20250122-amlogic-pinctrl-v4-0-4677b2e18ff1@amlogic.com>
 <20250122-amlogic-pinctrl-v4-3-4677b2e18ff1@amlogic.com>
 <CACRpkdZRbpd0Kw9V=aYX5P0vJLtErNR+aBzPagSwf=AZh6QERA@mail.gmail.com>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <CACRpkdZRbpd0Kw9V=aYX5P0vJLtErNR+aBzPagSwf=AZh6QERA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2P153CA0010.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::13) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|SEYPR03MB6579:EE_
X-MS-Office365-Filtering-Correlation-Id: da074f16-ec6b-46ba-8c32-08dd4746171f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RE95Ly9VbHhyR3pSU1ErdUxxQStja0crZnVpUGpHZ0tYRzRnL1VFakNZOTVE?=
 =?utf-8?B?YVFFcFJldUZRSkFSRVMwd2MxRnV5S2JYdlJGdmEyaHpRNWFyZ3B4L0tZVWxC?=
 =?utf-8?B?UkVnRUs0T1pBaE1haEZ4OHVjMGxmT29UeG4vWFcxWFlQNUVKMzVCL1dEUExL?=
 =?utf-8?B?L0Y3UmhBakFyaSsvY2o3djMzSXFTZm1oSGtUWmdMTXZvRFJDWFpPZzA3WVBi?=
 =?utf-8?B?RmZDT2JmU0MzYVhtVjN1aVlOazgxaDNaaTlQMDYwYTlTWng4RDVLTGZ4dy9o?=
 =?utf-8?B?ZExsditsVHlGc1hxUFp6OXN2YlNSeUZoYnpkd09FUjJJczVISElHVndOdm92?=
 =?utf-8?B?VHdMUDU0ZExxMWRPZDB4eW9iMTZFWlpZNmlzVmtIenpVNzl0eTRad1ViM0VV?=
 =?utf-8?B?SCsyb1l4VGN0NVl3MG8wRFNwY1JBZlRPV2tJUHZqMGFiN3pibWxaTmlDcGZo?=
 =?utf-8?B?VEwvYWp3aHk3WFJkQVFPaS9TSTdtZGlkMU9KUW8wbkNBUEFlbWp4dVdaSC9C?=
 =?utf-8?B?N0ZCMTY4Rnd0Q3hHQXRqNldCRHpkSzJFenhuUXNGQkFGSEwwc2V6czBXK3lL?=
 =?utf-8?B?MEd6U0FwQ3J6TjVTWVhJTmNVY2p0T09XYlhiVExJR21kcGdTbEVYeUdwak4z?=
 =?utf-8?B?ZGkzNUdjK29SdlJpRTlUUVhiVS96Tm9lcDl5T1RXM2ltS3dSa3FHc0VvQUJk?=
 =?utf-8?B?emNvd2Jpb3J4RzhYL0RwNjJaeUcxay9nWkN1TnZ5cXpmWDMwNExCUlBSUzV3?=
 =?utf-8?B?enVwVVpvNUxqeEpKWDk1Rzg5MVpDL2xuVExqTzY5Vno1SngrTTc1ZEZ1OHdV?=
 =?utf-8?B?T3hUYlF5SEhEeFRCelQzUTVYS2JmZitodHRmbTJ3NFRuNnVSYldib1NSaHdl?=
 =?utf-8?B?OHNpbFJneWgyK0FlMUtCdDk1VXVuRnhub3JFV0Uxd3ZHZzRsOHpQR1k5cm1H?=
 =?utf-8?B?L1JvdkNRbVhHbk1WZE9LdEovVnRNT0hEVStNMFcyZlZwVTdFQXVXWDJJZkR4?=
 =?utf-8?B?S3dSaUlpdVJJUDZjaTUrSDZUYnVyYkhmeXhKZmNldll3RlpKbVcxZ0l0eDF6?=
 =?utf-8?B?Y3BHci9ycWpSQ3M2WEJoZmxiaEtwL3U3Rjc1TEtOaWRmNWVwNHNGdXRVbGxi?=
 =?utf-8?B?YXM5NWt4OEpqa3hhUEUyS0QvczVvOEhtN1lyN0o0ekNhdzlML1NOSnhtYm1I?=
 =?utf-8?B?cXEveVVvbnhpY05tUEpmRENjTkNoT0RkbEhwL3I4VjZNa3dmUWtSeGNBcFB6?=
 =?utf-8?B?OG9BdE9LeDBOMmV2eGFaNGpQZDFNZWpaNjVPMXR0QTlpeFJHbGNLcHA4VGFH?=
 =?utf-8?B?VHR1cDg2VFRuN09LMlprS0ZoRjFlcW55MC9KQXhWOW5lbWUwL2pjRk02b296?=
 =?utf-8?B?WWw1cm92ZUxUenVvOFkrSW0rS0pvMzhyV3hDc3AwWUM5UTNUczRwc1hhRm9Y?=
 =?utf-8?B?S0lOS0h0blFnMC9neTNJcnlkK3FXeituOXFvaVNCOTd5ZlNaNXZmVW9vR2Nv?=
 =?utf-8?B?aVFRd2JyZUxlNTR0dFpCOUpKVWFWNXhaeUlCbmRZU3NiSzRqa2hOQm5EWW9u?=
 =?utf-8?B?OFY5VFhTTVhQeWpJVWlFcFR0V1Q5RjE3MDg4T2JIZ1NJUzduSFBkNFhuQmtZ?=
 =?utf-8?B?SVh1SFRLM3ZkZ0h1anJRRzVwT2wrYTRHcXFCcEd6SnJvSmJyNCtNL1hjZlZt?=
 =?utf-8?B?THNEWDdXUnRzbmFQc3JsTmRGenQ4bkgyOHRjYkVnUWFqWEhzeG03UHhIcUlB?=
 =?utf-8?B?ek1GMFh3N1lLejN5L2dKSjFDSFh4SkFqOGc5U1YraXU3bUU5dWJJbzBCeGE0?=
 =?utf-8?B?NjhzeGgwMy9ES1QwU0xiem1SUjJUUjNoWW9TR2VuYTlIeTc3dTBjWjl2amJN?=
 =?utf-8?Q?+nDLBOdgrifyi?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MlUvckN2WHhNRldaN1o5UVlMT016VUt0dTQ2cEZrbjdhK2RMWm1hK0tnUEIv?=
 =?utf-8?B?OFl5b0x6Z2NFdnBKUEVDVmF6TFA2N2xXTGRCRWVEelk3M2poYnV1UGVlRDM4?=
 =?utf-8?B?SklaVE5pM2FwUGRkbVZZcWo0c2dxVmVUa0tDNXFqSktXc2FBWWU3SThzRFNz?=
 =?utf-8?B?Y0dDdHZaQVNxUzZFZHBUNkM3MzdORmdTaWJzUXdZaWdZVWNvbXE1L2lzSUVv?=
 =?utf-8?B?NFpKN3crdi9rQ2g4b1ZiZVB0RTBBUE5yTHI2TkJEOFBRQ0x3dGtTRlVDUnNO?=
 =?utf-8?B?QkVJam83RkovbUdYSHh1TzZXVVA3WUkwd3BOS1AybnFXSjMzQmx1ZGV3OW9M?=
 =?utf-8?B?NlhPZGI1RllENTE5RHd1bExIM1ZaQStxdTh2dFdsVlFmZXZiTU0rT0dSOWov?=
 =?utf-8?B?TVFYTnVDNmE0ZjJZRnE3dW5oVzhneWd1WExueHduR3VWU01weS81MHMvcmxZ?=
 =?utf-8?B?OTNEdmc5TmYxYThpOTBUSndOYmQvT3MvcE91d0Yxa29YS0dGUHNpelZWVldn?=
 =?utf-8?B?R0gyeU4yUHk0cjZ0MnBPYnBudDlHSW13WlVkTitZNDFKU3RqSTExYmZmeGt1?=
 =?utf-8?B?bVpIWGhTLzhFcFh0SjVra2V4T05MY1Q4NThXUEFDYjNGaDRpNjBCa0RJUkw3?=
 =?utf-8?B?cGxtc0pJejZaTXBqTDdxakU4WTlNTy9xVDR4ZmJIcDl1ZjFXblhLRE1TZDN5?=
 =?utf-8?B?SWRuL2NKWkVoU2Q1MkJXZS9lTHhQajVSOTc5RGRMSkxSdXlPNUFydWNzUVRQ?=
 =?utf-8?B?WnNWT2l3SWhUNDNkcHc5L0g1eko1TFpSa3c1M3R4OTNZZFIvSWlkM1dta1py?=
 =?utf-8?B?cFlvUk92QTluMTErOVdEUFMreU1lbXIzb1RycGNFTVYzRllkV2dLUDgzbVJi?=
 =?utf-8?B?K0JmaFBaMW84U0tZT2JuSFhGWUtvQTBlRVh4Q0JZd05CVm5WVDNFU0t4SklI?=
 =?utf-8?B?Y3lHR3lZaExZTHZRK3pHVE01Y01RVC8vUWkxTng0NUdpcmQxZEVwS3JHS3Bi?=
 =?utf-8?B?VHdCUmE5aFArc1RIV0krVnFHVkVmL2U2ZDJyWEJzUVBkdEc3TVMwdllHTzVC?=
 =?utf-8?B?UjhIZHNrVW9SdHR3TWtiL1VOVlR3eW5nSlIyTGt6R2lSaDBtZ3g0NHhCbFQ1?=
 =?utf-8?B?TlY2dG1LdE0rV0NVZ0dNbHBhb3dnTFpqdTZnYTJOMG9vbklmV1ZJSjRPV0RX?=
 =?utf-8?B?RUgxUHhOTGpLTHM0b3NKc0hQSVZUVWJLQ1p6ZjAyQnltTHVSNTEyNFVJMEcv?=
 =?utf-8?B?V1BSS3JIYTVYMjZxY3g5c0lGZGphdW00TlVDMm9aZlBGZUgyUTVHcHlLT2xh?=
 =?utf-8?B?V3VxYmFRTzVWbXIvejc4WUlpMVZmUktydEhNempTcmtodnI1ZjBSL3BITytH?=
 =?utf-8?B?WGdDcWVSOCs5NW9kOFpycklRR0UyajA4dEpJdTVmSThYTzNZb3EvbG5xR3Bo?=
 =?utf-8?B?MEorT2JnRWRPUzhlMzQ0aVFJemdRcmpYVmIxbmNiQTk2S0ZZNnU0YkpEQmhH?=
 =?utf-8?B?T3U1MzVDcUxpQ1RjTWtEQ01kaklqVjBPWFpVU3JpYUlYK3A3NnkvQ09rVHZX?=
 =?utf-8?B?dVFUTjJVVjJxR3Nqem9BeHpIOFlERlVmcFVyM1N0aUt0SkJ3N0tFYmttaER4?=
 =?utf-8?B?dWFqVllwOCs1TVM5SVBWS2dQV2dqUGMzeEpsWHAxQWxzR0FEOTVrL2NIdHJ3?=
 =?utf-8?B?MDZXeWdDbXpuQWR5REJhUXRuTDh2SHpydkZtcUhqR3B2WHFFVGxNQ0FheTJE?=
 =?utf-8?B?MU4xQkNrTWljUnc4Yzk2TENLdHRNYSsxL0lHa2pRbHVGd28wYUNhMU1ydnEr?=
 =?utf-8?B?L2oySU5YbWhOTVY1dEVUeXErWjdxQVBNMVpMRGZhQjRQQWE1V3FFTkZ4T1M2?=
 =?utf-8?B?ZU85eHZoaHZHUW1sZmJvSFNES3NVTzhvU1J3SlJYT1NFYVBSL2l1L3hmMHk2?=
 =?utf-8?B?TlhYUnl6VG80ekNvZWNTT3NhWS8rWWFqcWE3ZFZPZEdYcnNCdGtCNis5K1pl?=
 =?utf-8?B?dTQ5TkJHZmJNQ2h0dlQyY3FycGdXbkpkVng0eko1OENjR0QxOHJodW1aTnpk?=
 =?utf-8?B?QzBLLytwQVpYOFROajVXNnprUm5zeUF1eDFHMm9HbURXOU9ndHFVZkRieTgr?=
 =?utf-8?B?VDBKTFpyV2E5UDhpbERCek5qRHl3TWxNNmk1WTRvMjBzL0VJMXRwaHUzNzhp?=
 =?utf-8?B?R0E9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da074f16-ec6b-46ba-8c32-08dd4746171f
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 07:07:31.9622
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K4j2BLDmefGPbXvdO1NK9qtM6jyivye0q5wdjyakxY9Dt9t6Ww7WULnGw5qLsPA5OSOGMOKO9Zl/qr8x73wGRwndfzmwpu/FGRbXaNBf2C8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB6579

Hi Linus,
    Thanks for your reply.

On 2025/1/27 17:59, Linus Walleij wrote:
> [ EXTERNAL EMAIL ]
> 
> Hi Xianwei,
> 
> thanks for your patch!
> 
> On Wed, Jan 22, 2025 at 4:26 AM Xianwei Zhao via B4 Relay
> <devnull+xianwei.zhao.amlogic.com@kernel.org> wrote:
> 
>> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>>
>> Add a new pinctrl driver for Amlogic SoCs. All future Amlogic
>> SoCs pinctrl drives use this, such A4, A5, S6, S7 etc. To support
>> new Amlogic SoCs, only need to add the corresponding dts file.
>>
>> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
>> ---
>>   drivers/pinctrl/Kconfig           |   18 +
>>   drivers/pinctrl/Makefile          |    1 +
>>   drivers/pinctrl/pinctrl-amlogic.c | 1053 +++++++++++++++++++++++++++++++++++++
> 
> Please move this file into drivers/pinctrl/meson as I requested
> earlier. We can rename "meson" to "amlogic" later if that placement
> is confusing.
> 

Will Move this file into drivers/pinctrl/meson in next version.

>> +config PINCTRL_AMLOGIC
> 
> There is already PINCTRL_AMLOGIC_C3 and PINCTRL_AMLOGIC_T7
> as will be very apparent when you move this driver.
> 
> What is a *proper* name for this family of SoCs?
> 

This is for A4, Will use PINCTRL_AMLOGIC_A4 instead.

>> +MODULE_LICENSE("Dual BSD/GPL");
> 
> On the top of the file you have:
>> +// SPDX-License-Identifier: GPL-2.0-only
> 
> So this does not add up. Fix one or the other.
> 

Will drop "MODULE_LICENSE("Dual BSD/GPL");".

> Yours,
> Linus Walleij

