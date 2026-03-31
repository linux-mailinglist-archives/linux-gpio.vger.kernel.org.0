Return-Path: <linux-gpio+bounces-34458-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uByHK8F+y2mLIQYAu9opvQ
	(envelope-from <linux-gpio+bounces-34458-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 09:58:57 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD053659ED
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 09:58:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5561D303D7FB
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 07:48:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75ACD3D4120;
	Tue, 31 Mar 2026 07:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="V4mB7t57"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012021.outbound.protection.outlook.com [52.101.66.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF29F370D4F;
	Tue, 31 Mar 2026 07:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774943300; cv=fail; b=AhvTL0mU8W5GFhrJmNz9rVn6Z7iQsJWKAFza+b2C9KuoIDFkiDhTbuhHcpQnNOZZ5tOwYRkPhj7MrcW40LbNH3fvB9XVKKOMT6cMllUQhSAJxJnM0veGnXjgH5U8lTjSsY+8+L77lSEnOxL341p3GqReiNkaVZjWBPonMx7QkAc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774943300; c=relaxed/simple;
	bh=FMxHfnFOl4LSg5sS/JbbaMJRCGIssB9iae/OCROMtN8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=VfhDXOJVAeHuKWZz2xQ/MSvdDqlkeDUnFo2TMU4PWLEoh75IJTooIHCuxZal18gk/WErRfhxqz/HXb47hBujQAhhjdILLt0KvWxv7iA0ysSKyPinN7HVLDYbs1rL0ACXf7Hx799vUFoUQscPXnn9EiA1h0DwSlcupXG+S6pSujg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=V4mB7t57; arc=fail smtp.client-ip=52.101.66.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C/hNpRyzCfnwYuJJqgG6+rI5RIyLBbEuP9EUAGUAMXEwFcKd9b7Hwj15wukyDtxPXIIbsM7rcYQBatTDVP2gAb72d4NIel5k08bVlzWgyKp9DzKXe9Tyjgg3gP9KzxNhC4l+gNwiCGAIybDrFpGV8OOV0xV8srEwFqn9P/kkSkkaN5DEx+4ehoEG/NVxd5poGlVlYLh+naI7+xHkbwvT4/2ENAidoFe7DSZwUsLZng5mjon71UeBuOFn/A63qdtjVZU4QGdsGfgHhVuPdUvKTzT9kt1VdNaXLbf8gbYQOpPHzdLRuIEpPgbou1H4ySHCPsLRVznod7TFE1VgW88TsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U8M+2h0PCSrkXRN0tmSN9Vsb6TVfBfSQUQY2kI+53eE=;
 b=yzrwAeWCQYRwYmj97SVbzvig4bSJl/N+73EAJdn3kTxOF1bMaYIzhxa2dnSGGWIb3+iCCczTLMOyX1MUiCS24kiOU780U482KkIBrRxmvboMKjZw/wnMkPkznry7fu5yT68Lg0yiXjHeJMNE9efVfu/VfYPsKHjt1XzZNoI2ub+ZqPTTJs66ePQf1Tk55PqFNdZhlS/yzEy8C1XN7+Y9rBOhpuBWAEurjTpUO1XNXOmTmlb0PyIKVcP8LbrSxuA+a2Bw1mlB5dq4LT/co6w2gtUB5xalIl74iAQWC3swMxJK7jjKu4ETAL7zoGwUThlCzaxlMUJaFGsXyg/5fRyGjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U8M+2h0PCSrkXRN0tmSN9Vsb6TVfBfSQUQY2kI+53eE=;
 b=V4mB7t57LUObHl+j+dQMzeuvncjdYUKWibZHAA0bcf0b/hpMuXLUHwpx7M35/k6esv0/uhne+2tWgbPwq4XsNHwJwFKfmclhwJaYeXAHJzWeY/t0GTKsBMZmvFC+/QiD/7QiZgyZtS+cF31Q9k5CRRIN4JcjdeV9hG/5lUeT4O0Oyyf2mdVniXI5+K/s+EmE2d/qFx6eBOtqu1nM6Iq8APQo2/kA9e5AwYPkspXPti0YeYL0YENDUkaHEi1LnqNuV88WvXfAngsuMZ5MKPSCNzZOiiJkXOxOHMc6vt5+UJE1fvbcsDU0LJXTBt1FavgtmaxCR5XdsWgeEOT428B4oQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::20)
 by AS8PR04MB8039.eurprd04.prod.outlook.com (2603:10a6:20b:2a2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Tue, 31 Mar
 2026 07:48:13 +0000
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85]) by AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85%6]) with mapi id 15.20.9745.027; Tue, 31 Mar 2026
 07:48:12 +0000
Message-ID: <4c46909d-641b-4389-bc4a-29394cb1d46d@oss.nxp.com>
Date: Tue, 31 Mar 2026 10:48:01 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 01/10] dt-bindings: mfd: add support for the NXP SIUL2
 module
To: Krzysztof Kozlowski <krzk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
 Larisa Grigore <larisa.grigore@nxp.com>, Lee Jones <lee@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Aisheng Dong <aisheng.dong@nxp.com>,
 Jacky Bai <ping.bai@nxp.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Alberto Ruiz <aruizrui@redhat.com>, Christophe Lizzi <clizzi@redhat.com>,
 devicetree@vger.kernel.org, Enric Balletbo <eballetb@redhat.com>,
 Eric Chanudet <echanude@redhat.com>, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-kernel@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Vincent Guittot <vincent.guittot@linaro.org>, Rob Herring <robh@kernel.org>
References: <20260120115923.3463866-1-khristineandreea.barbulescu@oss.nxp.com>
 <20260120115923.3463866-2-khristineandreea.barbulescu@oss.nxp.com>
 <20260121021913.GA1704619-robh@kernel.org>
 <e956750b-0333-4465-b37e-5f460b5e092f@oss.nxp.com>
 <edc3a63a-8117-476f-9582-97ae31fefa96@kernel.org>
 <7d200097-51bc-4404-be8b-f536d0ecfc25@oss.nxp.com>
 <21531cdd-5ab9-493e-a722-61b98117e2c4@kernel.org>
 <22a5a072-847e-4cfd-8abd-e37163f73265@oss.nxp.com>
 <fe755e85-1558-4272-bdd4-af7a2038ab1f@kernel.org>
 <ba6140bf-237e-4099-af0c-ee404c1719cd@oss.nxp.com>
 <c7a59716-3d53-4787-b4ef-9674c2a4a9b5@kernel.org>
 <3c454da1-d949-4258-87ce-8b545000bf01@app.fastmail.com>
 <5f1b651b-1064-4280-a7e0-b7d66c396cde@oss.nxp.com>
 <f3ff461b-edd7-423a-ac99-e70145aaaaea@kernel.org>
Content-Language: en-US
From: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
In-Reply-To: <f3ff461b-edd7-423a-ac99-e70145aaaaea@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0298.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e7::7) To AM9PR04MB8179.eurprd04.prod.outlook.com
 (2603:10a6:20b:3b5::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8179:EE_|AS8PR04MB8039:EE_
X-MS-Office365-Filtering-Correlation-Id: 4be0100f-cde2-47e0-85e1-08de8ef9dc18
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|19092799006|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	p7hhkacEoSngtcylaQjdCsgb81uBi6U+LIVYYZTF+adH8nXy96SKln4VAr2/PCC3Yn3mQBkiIZDEJ86jC5nUjPQKprp/Gzu+sBMOKy2qQDl8Kxa03H39M/ciZqWEt6UdnKFLWLQISS602MJR1Wk8pXSdERzmKFYDc7LU68tc2Ax804Pr57fm8viRMh7Q1U+oRDAVYQsKKW+mPBpONxTamll6qNwUaLlWPxrrWZHVzNLAbvquR/h4+e5lXyyKeeEzCWCMTDEhtxtuqYSAj/sBzQzyhql4N3A2Q+PTR/EizDXb2meMEptGqYFOifNNkrnw4McX9lXqxHr2YM8FMQg+TEz0U4Ddy3+hKglUATQxTYoP3S7uwK2ConDSH51qDwoSgzg/Jw3Sk+HvW429s3PTEOZAnQKPUbylPtp3xrDLYN8Dihq6/BDl+DI/2xYeMSjEK8wAaJplUhE+zfJhVhjYnd7GfR7/hviY9SSiM6QKuU1XS/TVZOrDJ/1yvaCwpYwHf5rV8tywVJF/Ar8gcgHepBJU0duyAw2FDsfXsywa7q+Q0/Lk1vfzLsSWnZrkksa5XAsMkrkHXVyWDEA9CS02DaC1puGjA2zZzcaX9RnepYr+lQAsgrowLv3R0mubxNqw+Zj9KhsINO3zle8wPsc7p8L/v1oP1NR5KFAcXSAakJK8Mw4nNPkJRjnPN7tTIpLVzQXplLNjs5MF4sj/DKzjjdjoZUaGVWc86HnSZ4pap60=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8179.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(19092799006)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cVpnNnpEVUVLTURsQjNDYWQ4cWNTQi82akpyU3kzazlXYTIyS2hrMWcrYmhI?=
 =?utf-8?B?NE9nbHFleGh6dmtxMmw4NmRKdG9tbmljNGFmYWpBdUt5MVJCTERLUXpRUXgz?=
 =?utf-8?B?VEJ0dUNiR2hUWmM0dityaFZxVk1qQVF0V1NETVJrTXFJd2pnTGZBVFhtNXQ4?=
 =?utf-8?B?RHJJR3R2akFxV2NyQytmdVNrbmtCeU9ZYUQrZERBRTFhQlhLY1VlaHc3OU5J?=
 =?utf-8?B?QUJ0UEFPMUowNFFpZ09yNkUxbUZockhWL08vTEUwdUY2eTlHKzdTWWFjL2x3?=
 =?utf-8?B?SG0razFkYjVaUkZ4M0ZhckJvNFltd3NxZDRkWVR0dU40RFk0UDBBRUkzRDhQ?=
 =?utf-8?B?anpHV3ZXalNlOHpJRkdSSjU1UHJGU3BXdHlGUXNSUFlCd1Z0L2FMUDhQMU02?=
 =?utf-8?B?VjBJWGxLaUJGQmtEcTZINVUyZld0STVvdTNrdjlTZURMZTBxemFnNmVDaFJD?=
 =?utf-8?B?TUhJU0hvb1FaTnVrYnVKWUVIdndONDBWSGVYWW9seEZLdC9idjBpMUpwUzFk?=
 =?utf-8?B?dUhCZW5rRUNNVlc0b0gvMXVCK2VXOVZQeldpQWFkRklqNDUyNXN4ZlA2UmNB?=
 =?utf-8?B?OGdLTXlTUjR5MEM2TUZNajVONjZJQ2V3SDdQWitTTVNXMGVVdlJJcDJYUnEv?=
 =?utf-8?B?Z0Q3RGFPKzBNMFJBaEl5T0F2ak90anRSVmkxaDJmbDRYcmtCMlV3MlVWYkVt?=
 =?utf-8?B?TnR4YzBQb0VMeHhkc1NEZGd3bmxWY2ZPaUhndFcyNTdYNFJFWFE3WDB1NXp2?=
 =?utf-8?B?T1VjVUVoLytoem4yeVkwNWxFSEdtak1YamNSUnprRUVDeS84NVl1bHErTEZx?=
 =?utf-8?B?bXZaOTVIdjRzNzNBT3I4UTBOTHc5aUFCYmpCMWxEU1hRM1NJSDVCMzN2aHVS?=
 =?utf-8?B?V0xkUnl0NjB1RkpRd0s0anpsd3kvQnVud01sc2d3bzVCeUdmbDBuZWhFWVF3?=
 =?utf-8?B?NjE1UGFSNTltV045bitYYkRHVjBGWEJOUC9iRWQ4c1NWNnBseTRaK2g4ZlBX?=
 =?utf-8?B?V1VpSGVMUU4xN09sNmNaZGdMWDZxMWl6cXBNYnovbmlUVm5JMyt5WlJSMEpG?=
 =?utf-8?B?YVJGZm9oeFh2QTIzc1RZTnRUSThsbkl1WUlHeGxXL05zZ3ducDQrN1Z3djdU?=
 =?utf-8?B?Nm41UDUyVmtPaXZxVEphZTNlRU14Nm9VZVowd1ErTXdWQzJTN0l5bXhUdnkx?=
 =?utf-8?B?c2F5SkMzNkgzZmJqd01oOEpkdE1DNGNLc1d0Y2pHNDc2RklOUkpVaEFMcE5I?=
 =?utf-8?B?aUd0STBrZmN5a1dPTlplQmJCN1lPbi9MVzZsRFlHQlAyQms4aHlDdlNBblV2?=
 =?utf-8?B?c1lveHVIUXpkQmhOTXNXQmNZdC9DNEliUzFqdk5LVGkvZ0w1cTRyekRNbjFj?=
 =?utf-8?B?LzRnNDVuUmQ4dGZQQ0Z2K0l2clJ1WldPQlFXZFNaanJWMFUycXFUZ2hSbjJL?=
 =?utf-8?B?UVhaeW8xL0hyR3h0Q1oyRXNyRm5EbmtrbktFTFVIaGt3MEVrS2s1SzNTQzlp?=
 =?utf-8?B?VWs4c3hBRnRLQzJ5cVQ5TEQ0bWhGMmJOZ3hPdGMwaGxGeTJ0NG9NbC9BYVNs?=
 =?utf-8?B?TWt5NTBaQ01iSlFEaXp3NUdlYlJnajhrdjcxM0REcjVpN0FCVjJWcWFMeFd2?=
 =?utf-8?B?U0dBZGphS0hzVU4vMDJ4Y0pieFcyaXRKYTRIVUFiKzVtbkI1dS93OU43eCs3?=
 =?utf-8?B?RnZYd2ZQNFFkUFJReFI4SWsxZDI1Skw2WVFDVEhPU2NSNFJzOEFONGJLdGNt?=
 =?utf-8?B?TTBBNFgyeFRiRHczdG56YmM4R0g0QnhyVXhVMFJqQjlFMkNBdU9rZGxuTmkx?=
 =?utf-8?B?NlRVb01uTXZOUkFoNTBXSEVmT3oxUXpOZFg4aVNyZExGRkdlZWlma2NNc21S?=
 =?utf-8?B?WDhjYTlUVllIMjdVRHUwWDljVndrYlRGeXdER2xCT1ZiOFdJWVdCUTlFald3?=
 =?utf-8?B?dTM5K2lXbFBqUDNLTHg4MXpQblB5WGN2YXNPTjczR0syWjdvVmJXVndYc0VD?=
 =?utf-8?B?UURRWlhPLzJPUnV5dHBnNnhnZGtrK3g5RWV4QitNbFVnVFA2OFlHT3llc2p2?=
 =?utf-8?B?dk5xSmRyc0JZdWY0R3Rua2JsMC9hOXN4dTRsMmlaYng2eGZLUWpGQjE0R3E2?=
 =?utf-8?B?WjFSYXVEUzZ4ekN4b0pWclg3TGgrOVR3MC9taTFRb1R1RUZXLzUwaGM0dE8z?=
 =?utf-8?B?WFgwaDA4Tlp6UlI2RGl5czBFMmRWb0N5WGJOY2I0T3lsR1ltNGYzUWtHdXhC?=
 =?utf-8?B?dTU2TUt3MHEwa3VRTStvbm1rRXliRDdzRDBmQ0VneWVrUUxwMzlkbit4L1VO?=
 =?utf-8?B?L0xuaENNdWdsUXMrQ3g4d2txMkNOb0p1RVpqK2RIL2JJbFhBeUtrcGNDZStX?=
 =?utf-8?Q?4I3dDnY9kC2b52MMk6ZJX+VQEgDhoI6ymrrSj?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4be0100f-cde2-47e0-85e1-08de8ef9dc18
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8179.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 07:48:12.7203
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2gNtD6foV2bGa58hfsPHjyVODfcNia2lglJdmJPIt/SLaFfYNYUjzvR2r/pVFmihnkHtP47vf5i7ovYnOXbCwANPw+/AHUb2nOkb0oz4Ux8EFZBFk9fiVnqvu2wLw4ZH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8039
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34458-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[32];
	FREEMAIL_CC(0.00)[linaro.org,bgdev.pl,kernel.org,gmail.com,suse.com,nxp.com,pengutronix.de,linuxfoundation.org,redhat.com,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[khristineandreea.barbulescu@oss.nxp.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,NXP1.onmicrosoft.com:dkim,oss.nxp.com:mid]
X-Rspamd-Queue-Id: ABD053659ED
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/23/2026 10:07 AM, Krzysztof Kozlowski wrote:
> On 23/03/2026 08:57, Khristine Andreea Barbulescu wrote:
>> On 3/14/2026 9:31 AM, Arnd Bergmann wrote:
>>> On Fri, Mar 13, 2026, at 18:10, Krzysztof Kozlowski wrote:
>>>> On 25/02/2026 10:40, Ghennadi Procopciuc wrote:
>>>>> On 2/23/2026 3:14 PM, Krzysztof Kozlowski wrote:
>>>>>>> there are no resources allocated specifically for nodes like
>>>>>>> "nxp,s32g-siul2-syscfg". Their consumers are the pinctrl/gpio
>>>>>>> driver and other drivers that read SoC‑specific information from
>>>>>>> those shared registers.
>>>>>>>  
>>>>>>> My alternative is to keep two separate syscon providers for the
>>>>>>
>>>>>> You got review already.
>>>>>>
>>>>> I still believe that nvmem is a suitable and accurate mechanism for
>>>>> describing SoC‑specific identification information, as originally
>>>>> proposed in [0], assuming the necessary adjustments are made.
>>>>>
>>>>> More specifically, instead of modeling software-defined cells, the nvmem
>>>>> layout would describe the actual hardware registers backing this
>>>>> information. One advantage of this approach is that consumer nodes (for
>>>>> example PCIe, Ethernet, or other IPs that need SoC identification data)
>>>>> can reference these registers using the standard nvmem-cells /
>>>>> nvmem-cell-names mechanism, without introducing custom, per-subsystem
>>>>> bindings.
>>>>
>>>> nvmem is applicable only if this is NVMEM. Information about the soc is
>>>> not NVMEM, unless this are blow out fuses / efuse. Does not look like,
>>>> because SoC information is set probably during design phase, not board
>>>> assembly.
>>>
>>> Agreed, nvmem clearly makes no sense here, the patch description
>>> appears to accurately describe the MMIO area as hardware registers
>>> with a fixed meaning rather than a convention for how the
>>> memory is being used.
>>>
>>> That said, there is probably room for improvement, since some of
>>> the register contents are read-only and could just be accessed
>>> by the boot firmware in order to move the information into more
>>> regular DT properties instead of defining bindings for drivers
>>> to access the information in raw form.
>>>
>>>     Arnd
>>
>> Hi Krzysztof & Arnd,
>>
>> Assuming we drop the syscon approach entirely, for the SerDes
>> presence information we could follow Arnd’s suggestion and have
>> it provided by the boot firmware instead of exposing it through SIUL2.
> 
> I think there is misunderstanding. By dropping syscon nodes, I meant to
> drop the nodes. Remove them. It implies that whatever their contain must
> go somewhere, right? Because your hardware is fixed and you cannot drop
> it from the hardware, right?
> 
> So their parent node is the syscon.
> 
> Best regards,
> Krzysztof


Hi Krzysztof & Arnd,

Following your suggestions, I reworked the DT so that the SIUL2
register regions are now described directly on the parent node, and
the separate syscon child nodes are removed.
 
The node would look like this:
    siul2: siul2@4009c000 {
        compatible = "nxp,s32g2-siul2";
        reg = <0x4009c000 0x179c>,
              <0x44010000 0x17b0>;
        reg-names = "siul20", "siul21";
 
        pinctrl: pinctrl {
            compatible = "nxp,s32g-siul2-pinctrl";
            gpio-controller;
            #gpio-cells = <2>;
            gpio-ranges = <&pinctrl 0 0 102>, <&pinctrl 112 112 79>;
            interrupt-controller;
            #interrupt-cells = <2>;
            interrupts = <GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>;
 
            jtag_pins: jtag-pins {
                ...
            };
        };
    };
 
With the current layout, the SIUL2 node itself now contains the two
MMIO ranges directly, while the remaining child node is only the
pinctrl/GPIO function.
 
I am wondering whether it still makes sense to keep the MFD approach
at all. In the current form, the node no longer models multiple
separate child providers such as the previous syscon children, but
rather a single parent node containing the whole register space
together with the pinctrl/GPIO.
 
Would you recommend dropping the MFD layer entirely and having
the pinctrl/GPIO driver bind directly to the parent `siul2@...`
node instead?
 
Please let me know whether this is the direction you would prefer,
or if you still see value in keeping the current MFD based approach.

Best regards,
Khristine

