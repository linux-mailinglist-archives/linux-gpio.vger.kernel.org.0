Return-Path: <linux-gpio+bounces-15503-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A150A2BBF2
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 08:00:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ADFA03A7AA8
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 07:00:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F0AA235358;
	Fri,  7 Feb 2025 06:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="pf056tLm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023090.outbound.protection.outlook.com [40.107.44.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB0823497B;
	Fri,  7 Feb 2025 06:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.90
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738911567; cv=fail; b=RiEzwTUmRiguqdXgDwWmww9jTPYYHB7efGH7PEZtL7KM7C4bgsA/nN31RVjQVN05cHKpdla8Se6td08i9Oab9QCrt3sN0kcwBvAHJiLSEKh6wXmXn1mz/wJrnY/nwgrBzLs5ab9BX6ftbIGlB1Q2VfLcQMbu1gB+DLF1WcxzZ5I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738911567; c=relaxed/simple;
	bh=muJgnlfKvREpdtP/Xa93EYvZXUzuOKgkY8QdYYUU/MQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=lEZviMBneMkRIC1xaNpiEoc7GLJlfdnSWfASLRuibhDT4q36g7iNRk/W/d92m/+4LGsQzoJfcTcaQ4n1TYHzUXdkdB2d1ps3CQ9E4QRIGWE+0qgfNWoldYzPtXEdYSsNc1ifj+sMssduSj5xfNisvNYWg+QYaqLjrYJwLAbNqZ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=pf056tLm; arc=fail smtp.client-ip=40.107.44.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PWjTk2I8vwJPR+xO7VOE41QSgx7GNIjAce1ZOja1G94oxXQzRlpWAPJESbVYKc7CKRzmNQqBPsnJnbU8MbWY0qy+FkC+ynJ3mCjs+Xny9nLRfx3GRag+1vUQoK223t0FYFSqOrKlE9IR0WayAkcSDlHDPKZ8pG6v0/UZ1hKfUyM+N1olUtzAMqGkOFE0ZKcvzCZ9QPVpyBa5vIGqLGoq5lLCW4gwD1RF2rk3gYWIgqgMjEyyNltdexLpNUzDgZBlfcebVBfAovKUjg8bCPoOXB3xnsWcEJxRALKvgvWCsze2/IQ6Bgopxa4il/udS2yOUksX8Dup+UzZhgiEEG1PkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PJi0q22ErnVh69NftfZYlL1/SvdFNAtQbqlfFhTW3ss=;
 b=giCrcgRVma1qzFJsZQ5D8QCLvNSsh/y1mxhyjJIjlGi39x6OG1lKIFrJFXf4DVOQH9aCTPk/HUYCMdfA0OGHd1Y4p5/MjXJxydHUQ1RD2FbAHCh+yRLtczpzfighZYgL0vaM0R4TmUiw9Hhxbxwa2fO51jodUDjGEBGEg2apBMELmvv1aXJzyCHzBfm2dRJLzBLrh9TS5Xc+uUcCxu95ItwcFOJeUWmgcKrSbrcxD0tdxR91qqsyrfJDlqyL5QWBQsj8Jzd8/kDMLAHUd0ZFWL1OQJx5dLukBYYTstee2Ba+62vBEy6bjLWLxJDvI5JyVaAjsiFUSufBArF2U3QDrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PJi0q22ErnVh69NftfZYlL1/SvdFNAtQbqlfFhTW3ss=;
 b=pf056tLmiyNvt8Z9XS4nY2WJtc4OSY0NKCYCxAzsc+Gph5wRlOUlcqBFh1wUXCP08n6wkxIeOsz+OmNIVfiO8+u3U2zzlEd+ThOr5cPMaJDwlyWGXvNlbhdrGDi2DGPbIonWBahJlQeS489ZZi+kxvctLHkn1KJ25eUWnIn5Oc67P38jxZzLa7JQ1wyZE+Sj81linSTc4KXAz7i2p89rkyhHsavFiGnACAIfqT+NLdiqRdSZ23mdNcW7FlCpHnRd4JzXGjQNJGL6QNNwbyqJb0a0j8m1PG5iF6w00Y6rkrUnWDWkOwfOgPj+NvuoGNPMQFNhotFQ0NXAcw6ColAu6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by KL1PR03MB7647.apcprd03.prod.outlook.com (2603:1096:820:e7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.14; Fri, 7 Feb
 2025 06:59:20 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123%7]) with mapi id 15.20.8398.021; Fri, 7 Feb 2025
 06:59:19 +0000
Message-ID: <b12d31b3-9d0d-480c-9adb-baa3aa7aa437@amlogic.com>
Date: Fri, 7 Feb 2025 14:59:15 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] dt-bindings: pinctrl: Add support for Amlogic SoCs
To: Rob Herring <robh@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
References: <20250122-amlogic-pinctrl-v4-0-4677b2e18ff1@amlogic.com>
 <20250122-amlogic-pinctrl-v4-1-4677b2e18ff1@amlogic.com>
 <20250127185939.GA612868-robh@kernel.org>
Content-Language: en-US
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <20250127185939.GA612868-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0024.apcprd02.prod.outlook.com
 (2603:1096:3:17::36) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|KL1PR03MB7647:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e55f1a6-f81e-4c7d-1ea1-08dd4744f18d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aTVLc1p3U0hDSHNiMUQvOUdxMVVIWmNmRDN4aUxFWmtVL0gveDFTNG1oWEg0?=
 =?utf-8?B?cHQ1RHVuS2JZSnFoLzl6TGZmaXllSjJkbmwwb09oS3o5SWZqeTlmMGc3Z0JP?=
 =?utf-8?B?TENmWWwrS1ZZZ2h5YUhJRlpuUEVBRGVmbk02WS9XcUwwRkpXQTFPSVI2eWh1?=
 =?utf-8?B?NDdiZXRxcWQ1UU5XeEgzdm9KVDFSRDladURObEVJc080aFMwZVNJYm4zbGdn?=
 =?utf-8?B?ZVlHenU1RDhEaGxOSnU2NVliODNxNFBuTkROekl1WmwvSjNvQ0VpZW9qa2R6?=
 =?utf-8?B?VXlDM0NXajV6L1RiVjRrbW44OFhLb0VkZTBiMTBIQ082YitHYkN3VkZ4em5T?=
 =?utf-8?B?eXVuRUtIakJoNVZsQ09OTGVkYTBrc05JVndEYXMwbWdFcFIzQk9tYnhOZjEz?=
 =?utf-8?B?dGtIUHFiZU5iQWRpMFlUSkdqTzg2OElhVGJJOGl1eTlZSk9SbjdPSi9iZGEx?=
 =?utf-8?B?dFhrdFIzOGxkSERJclFHWGlHT1VsQXZydktzdytpMGo1eUtSazZ5WlNHZXhS?=
 =?utf-8?B?Z096Nm1MTWpOTy9PanppTnppYnNIYnl0QjhLUU5zZWUwcCtVWU1JdDZUNVRm?=
 =?utf-8?B?bFhjdFZrK1pidUgwMXpiSEMxSStoRGN3WTFmTnJrd05KUXJHOEZWMElycGM2?=
 =?utf-8?B?YWUreHBzTEJpRDdiRnZyYlNJSy8rL1c4OVBIWEpCSXRWakU3WGc4Q0FxQzN4?=
 =?utf-8?B?S2hEQTVwS3RWdjNNMExMekErajdjUDNNa2xGUXBPamtyV1h2OXVsd2dUVEUr?=
 =?utf-8?B?VFZTVTNCTVczc013TjRET2p1N1NxWGErdUV2YkVjeWo1L0JyWEduMEsxZ3Zv?=
 =?utf-8?B?eGEzcFVrNXVwUnl0eit2eUZrdzlHaDhZZDdkVHp1WWs3emFlL2czV2RJTTlV?=
 =?utf-8?B?MWFLeWhONGxqV0VMTWo0VzVtbTN1clQ5NXFZQkNYeThwdHFqdFVRWFdad3VU?=
 =?utf-8?B?WkI2UEFTOERYdFNxTXJ4QkwwOGtzMnpYT3ZFbUtJTUhQanpaNDE4V25ZYzd1?=
 =?utf-8?B?aE1TTnp1K3F4MXVuUC8rUURIcUpHbHEzaklMK3R4R29Kdmg1NTNPMlpSK1g4?=
 =?utf-8?B?Y3krdU9tWFZMbDN5ZHpQbHgxY25OVlo3MG1FTFFoSmtPMnNUMERpdVpxeGFj?=
 =?utf-8?B?WkRCUnBkbFNqcFYrQk9Za3FVb0JoK0s0THhkZUo3MDUxOFlhdWxwZS9UWnJz?=
 =?utf-8?B?NDNhU3pVZzh2NU9IVmlvVmhibk9vSjlSakpyYTN6T1Q0ZGozalRkY2QyR2xP?=
 =?utf-8?B?MzBoUjNkaTloNXVMRkYzSXN2RUpjU3ZDa0xEVnZLLzM1NklFSkJCWTdrNkx4?=
 =?utf-8?B?dkxPcDNzT25DSFZmem5CdlZOS1lWa29QWWtHYVE1WFRaOVRHSW9jWlREcDY4?=
 =?utf-8?B?NGRVd0FYWFZPaWtQZ0M5OGkxdHd1MC9GemI1cUNDNkhwTm9VTEJUOG80NWx0?=
 =?utf-8?B?Ky8vcnRLbEtwRzlqa1NNa09GcjFyMXFPOEIyR3pMaUZvc3lUa0FJMnVRK05y?=
 =?utf-8?B?cXZNL1U1SG1Oc29PcTAvUFdwbnIxSDYySS9ZcExwRU5Vdm4wOG53UlorZzJ0?=
 =?utf-8?B?YlRhcGYzSWQ1WXVrWHlPUjhNRHlOK3pXM0ZoL2w2dnM3aWtOWDYwYWFqNk92?=
 =?utf-8?B?akQ5aEJHQnliUnpvYnNkb3JNanIrNWJqdHo4dUt4aFlmT3l2bzlkOTZldzI0?=
 =?utf-8?B?OGRYZlppQ1JmTVE1SGZjcXdyNHJwTVlQcEdNaEc4TC8yOTVuWTFJVFArVjFL?=
 =?utf-8?B?RmtOQVNSZEw3UjNlSUJhQWYxbno0MytjQ2ZKVVA3QlJZemwxbGo3eWFiNEx5?=
 =?utf-8?B?WUpmeVBGMHZuQ0YySTh5Zz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c1g3K003MFcrVFFUNmx3RDQzZ0ZHN0I0RzIzVXlYVDdaZnh1VG9UT2pCT1k5?=
 =?utf-8?B?ZUt6VnZ4ZWNSZUZkSXpneXJ4bWVsK3owanpCWm9MbUt1WUhQTmsxZzZ6TlhJ?=
 =?utf-8?B?SXQ0TXBML3RyclN1VDluUmhGM05vOFF3eVRpakpOK010dmJtaGhyclBYZFBy?=
 =?utf-8?B?MURtNHYxZzBzLzBNRXZHMFIwZUNyQVFMaXVLczdqWkxFZHZoZGxPM0pEd0tl?=
 =?utf-8?B?b3FIMVpac25tQkNObCtYejgwVTl3RUkwblhBdU1uV1dHNjBSZlBjNkd1V2tw?=
 =?utf-8?B?ZTVSWVhYSjBaMGFNQ055Skg4RGZaaFNDMjh2ZWw2ZHh6L2FXNHN5cGJ5UHNF?=
 =?utf-8?B?VzY4RE5RQTZCTGloRm1pUFVtQVN0Zm91emMwak05M2xORThSY29acEV0dXpt?=
 =?utf-8?B?empWY0tOMjY0bjYvOXRzZDlQeG9FUWZETE5TUEV4ejdxNWhISVBBYlBFMW91?=
 =?utf-8?B?Wm9DNCtBV1hVZktjeTUyWHVUOG1PamVFcjU1VS9NbWhiUkZaMlRIQWpSQUdC?=
 =?utf-8?B?aGFBTVNVN0pxSmhmUUlQcithR2ZOakpJa3hBUkZoWUVzQUV2QVNDdHRSNi8x?=
 =?utf-8?B?WUZJZjJ3bGt2WDhsOE1oQWtsbnhCYjFUNSsxa0NvWkdRNWllN3hGQy8yT0Fn?=
 =?utf-8?B?a1F4dzZEczRnN3FZVktPbU5MR1kzRkxNK1Yrb0R3VWI1Sy9rL0loR2JMYS96?=
 =?utf-8?B?aU1mNFlpdGtCeXZDbkptdHNlZVRObTVuQlhNaWl1UTlWL0F4cGJLU3FuUWtQ?=
 =?utf-8?B?ZnBjVks5a0hlSHYyQkVGNTAzUTFMSzc5UnBqMkswMlZkd291VFdLRXdQOEZU?=
 =?utf-8?B?NlQ4dTVyQ0pYa0JrTHZxSUxEL2ltbnFpdmJ2QVRoSkQ4L2RQSnRvaSszVjZ3?=
 =?utf-8?B?VGJHN2lPWENVbjBhSzNLd203czk1azhxY2dWQ0t4ZWpQayt4VC94OHpIa1N1?=
 =?utf-8?B?Vk1uRU9DR1c0R2RvWHZjSEQ5NC9kakFSb0ZEYXFJMDFzbSt4YVdvay8ya090?=
 =?utf-8?B?QUNVWk5BT3NXeTNaaWRkd2wrM2h1bFZDNlB1bkd0MFhiSmFWWEtqL2Vjcmxo?=
 =?utf-8?B?em5Nc3ZlUGo2azcvN1ZocngyVmNpRUVvcS9Cb2laTkhTNjVxNWZFNGVkaHBs?=
 =?utf-8?B?LzdsblgycVpiUXliVHZiSndjcktzdVdHd3hSWCtwRlFNTjc1MU41QTZkTkda?=
 =?utf-8?B?dG5OREtXVnhDUERqMGxWU3lVczBOZExjb2F4REZWSWRDQThHakEyOTZVYjNx?=
 =?utf-8?B?RGlCMlZ4M1BpSllNU0RYNVVQTmpRVVZaSzhzZG4zMUMrTmMwejdzbDB1a0kr?=
 =?utf-8?B?K2V4VGszZlhFTjNqdXd4eUF4SHNIT0s2ckpjeXRtVzNkOXArVW53K201ZlJV?=
 =?utf-8?B?cjc2ZEFYM0EwQjZSVVNRWTV1RmJlSG8wakFCVUttUmR0ejNScmVJRE9PV05a?=
 =?utf-8?B?SkQ1RDJPY3NJZThoSGhUK3RYV1RTZWxVb0ZRUFh5M1dwVGplU0xxQWRFbnBy?=
 =?utf-8?B?ZEpGR2EzaUVxWGxmbWlHUUlKVktEc1FDZ215c2hsQlZCVm9WQ2dzcll2N2E2?=
 =?utf-8?B?WEk5a0x5VDBrSGw5T29Zb0FONU8ra2t5WVJjdGh3N0FKTEN1RU1GVXBNSzE4?=
 =?utf-8?B?bGQ3OW1Gd0NoMk1UZENKMVFraUhoUVBpQjBXcTVNdEVVbkZ5RTN4cVhMQjJS?=
 =?utf-8?B?aGI5eFVBeFY4c2YzYTdscExYNmczUFBscmlzeXUzZklOZkg0RnZvclU2K0Fo?=
 =?utf-8?B?WlNweG84VVJEa21tU2xrVVZZMnE1U200blBiZDBtTE91N3RwUjBMbzV2bjVJ?=
 =?utf-8?B?bWUvQWJqTjhaOWxtQTQ3am1LdHFBRjJLMjFyLzc3K20zOWJRcWNlNnFCc281?=
 =?utf-8?B?NjM3eDN5b1VZaXVHNm43eHdheDB5Q1A5UjVEdndvQ3RSUXUrUUUxSGlTV1Rr?=
 =?utf-8?B?czZmWmFjUGpEcFJNRlNoLy83bWJpbHNuQkhxd0hVMyttaWxSVVBPQytjSVoy?=
 =?utf-8?B?ZFAxY2FrNHRFb1hYY2lmMWdjRFlIK2t1UzVsejJiTzZ4U2dCNTBMbk85cmtw?=
 =?utf-8?B?WVAwN08yUlJYVmRYUTNqejZBNWw2RDVOS1l4ejNGa0pCVzBLT1dBU0NFYVhS?=
 =?utf-8?B?cUllOFpRM052MnMvNGRUOTJpY2J4MDk5aDRqaGhtdEFJcGVQWGdGKzgxOHRO?=
 =?utf-8?B?NXc9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e55f1a6-f81e-4c7d-1ea1-08dd4744f18d
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 06:59:19.4660
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tv8a/vB/spiVngwCooGhLzugyxwcNu3io0s0NuRl/4NdPHRvLJXT06srCispZReDt5AvL1TtJaADpHRMw9cnG1SbQ67UaCp/frBfUt505RU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7647

Hi Rob,
    Thanks for your reply.

On 2025/1/28 02:59, Rob Herring wrote:
> [ EXTERNAL EMAIL ]
> 
> On Wed, Jan 22, 2025 at 11:25:59AM +0800, Xianwei Zhao wrote:
>> Add the dt-bindings for Amlogic pin controller, and add a new
>> dt-binding header file which document the GPIO bank names of
>> all Amlogic subsequent SoCs.
> 
> Did you mean 'all subsequent Amlogic SoCs'? How can you know that?
> Future SoCs may be different.
> > Update the subject to say this is for A4 SoC.
> 

Will do.

>>
>> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
>> ---
>>   .../bindings/pinctrl/amlogic,pinctrl-a4.yaml       | 127 +++++++++++++++++++++
>>   include/dt-bindings/pinctrl/amlogic,pinctrl.h      |  46 ++++++++
>>   2 files changed, 173 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
>> new file mode 100644
>> index 000000000000..c4fdcd69bbf5
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
>> @@ -0,0 +1,127 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/pinctrl/amlogic,pinctrl-a4.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Amlogic pinmux controller
>> +
>> +maintainers:
>> +  - Xianwei Zhao <xianwei.zhao@amlogic.com>
>> +
>> +allOf:
>> +  - $ref: pinctrl.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    const: amlogic,pinctrl-a4
>> +
>> +  "#address-cells":
>> +    const: 2
>> +
>> +  "#size-cells":
>> +    const: 2
> 
> Do you really need 2^64 address space to define the GPIO nodes?
> 

I discussed it with Krzysztof earlier in the V3.
32-bit is enough, but since APB bus is defined as 64-bit, here is following.

https://lore.kernel.org/all/d08136ac-e08f-4e5d-b562-78529f34d86f@kernel.org/

>> +
>> +  ranges: true
>> +
>> +patternProperties:
>> +  "^gpio@[0-9a-f]+$":
>> +    type: object
>> +
>> +    properties:
>> +      reg:
>> +        minItems: 1
>> +        items:
>> +          - description: pin config register
>> +          - description: pin mux setting register (some special pin fixed function)
>> +          - description: pin drive strength register (optional)
>> +
>> +      reg-names:
>> +        minItems: 1
>> +        items:
>> +          - const: gpio
>> +          - const: mux
>> +          - const: ds
>> +
>> +      gpio-controller: true
>> +
>> +      "#gpio-cells":
>> +        const: 2
>> +
>> +      gpio-ranges:
>> +        maxItems: 1
>> +
>> +    required:
>> +      - reg
>> +      - reg-names
>> +      - gpio-controller
>> +      - "#gpio-cells"
>> +      - gpio-ranges
>> +
>> +    additionalProperties: false
> 
> Move this above 'properties'
>

Will do.

>> +
>> +  "^func-[0-9a-z-]+$":
>> +    type: object
>> +    patternProperties:
>> +      "^group-[0-9a-z-]+$":
>> +        type: object
>> +        allOf:
>> +          - $ref: /schemas/pinctrl/pincfg-node.yaml
>> +          - $ref: /schemas/pinctrl/pinmux-node.yaml
>> +
>> +        required:
>> +          - pinmux
>> +    additionalProperties: false
> 
> Move this above 'patternProperties'
> 

Will do.

>> +
>> +required:
>> +  - compatible
>> +  - "#address-cells"
>> +  - "#size-cells"
>> +  - ranges
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/pinctrl/amlogic,pinctrl.h>
>> +    apb {
>> +      #address-cells = <2>;
>> +      #size-cells = <2>;
>> +      periphs_pinctrl: pinctrl {
>> +        compatible = "amlogic,pinctrl-a4";
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +        ranges;
>> +
>> +        gpio@14 {
>> +          reg = <0 0x14 0 0x10>, <0 0x14 0 0x10>;
> 
> Both registers at the same address? I hope that's a typo.
> 

Will fix it.

>> +          reg-names = "gpio", "mux";
>> +          gpio-controller;
>> +          #gpio-cells = <2>;
>> +          gpio-ranges = <&periphs_pinctrl 0 8 10>;
>> +        };
>> +
>> +        func-uart-b {
>> +          group-default {
>> +            pinmux = <AML_PINMUX(AMLOGIC_GPIO_B, 1, 4)>;
>> +            bias-pull-up;
>> +            drive-strength-microamp = <4000>;
>> +          };
>> +
>> +          group-pins1 {
>> +            pinmux = <AML_PINMUX(AMLOGIC_GPIO_B, 5, 2)>;
>> +            bias-pull-up;
>> +            drive-strength-microamp = <4000>;
>> +          };
>> +        };
>> +
>> +        func-uart-c {
>> +          group-default {
>> +            pinmux = <AML_PINMUX(AMLOGIC_GPIO_B, 3, 1)>,
>> +                     <AML_PINMUX(AMLOGIC_GPIO_B, 2, 1)>;
>> +            bias-pull-up;
>> +            drive-strength-microamp = <4000>;
>> +          };
>> +        };
>> +      };
>> +    };
>> diff --git a/include/dt-bindings/pinctrl/amlogic,pinctrl.h b/include/dt-bindings/pinctrl/amlogic,pinctrl.h
>> new file mode 100644
>> index 000000000000..7d40aecc7147
>> --- /dev/null
>> +++ b/include/dt-bindings/pinctrl/amlogic,pinctrl.h
>> @@ -0,0 +1,46 @@
>> +/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
>> +/*
>> + * Copyright (c) 2024 Amlogic, Inc. All rights reserved.
>> + * Author: Xianwei Zhao <xianwei.zhao@amlogic.com>
>> + */
>> +
>> +#ifndef _DT_BINDINGS_AMLOGIC_PINCTRL_H
>> +#define _DT_BINDINGS_AMLOGIC_PINCTRL_H
>> +/* Normal PIN bank */
>> +#define AMLOGIC_GPIO_A               0
>> +#define AMLOGIC_GPIO_B               1
>> +#define AMLOGIC_GPIO_C               2
>> +#define AMLOGIC_GPIO_D               3
>> +#define AMLOGIC_GPIO_E               4
>> +#define AMLOGIC_GPIO_F               5
>> +#define AMLOGIC_GPIO_G               6
>> +#define AMLOGIC_GPIO_H               7
>> +#define AMLOGIC_GPIO_I               8
>> +#define AMLOGIC_GPIO_J               9
>> +#define AMLOGIC_GPIO_K               10
>> +#define AMLOGIC_GPIO_L               11
>> +#define AMLOGIC_GPIO_M               12
>> +#define AMLOGIC_GPIO_N               13
>> +#define AMLOGIC_GPIO_O               14
>> +#define AMLOGIC_GPIO_P               15
>> +#define AMLOGIC_GPIO_Q               16
>> +#define AMLOGIC_GPIO_R               17
>> +#define AMLOGIC_GPIO_S               18
>> +#define AMLOGIC_GPIO_T               19
>> +#define AMLOGIC_GPIO_U               20
>> +#define AMLOGIC_GPIO_V               21
>> +#define AMLOGIC_GPIO_W               22
>> +#define AMLOGIC_GPIO_X               23
>> +#define AMLOGIC_GPIO_Y               24
>> +#define AMLOGIC_GPIO_Z               25
>> +
>> +/* Special PIN bank */
>> +#define AMLOGIC_GPIO_DV              26
>> +#define AMLOGIC_GPIO_AO              27
>> +#define AMLOGIC_GPIO_CC              28
>> +#define AMLOGIC_GPIO_TEST_N  29
>> +#define AMLOGIC_GPIO_ANALOG  30
>> +
>> +#define AML_PINMUX(bank, offset, mode)       (((((bank) << 8) + (offset)) << 8) | (mode))
>> +
>> +#endif /* _DT_BINDINGS_AMLOGIC_PINCTRL_H */
>>
>> --
>> 2.37.1
>>

