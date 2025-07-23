Return-Path: <linux-gpio+bounces-23700-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43FA9B0F99B
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Jul 2025 19:53:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 575AE160B0C
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Jul 2025 17:53:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5FFCC2E0;
	Wed, 23 Jul 2025 17:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="e+qxJmve"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2103.outbound.protection.outlook.com [40.107.237.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E1D1EE03B;
	Wed, 23 Jul 2025 17:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.103
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753293193; cv=fail; b=hOG4n8YI93dpiPFfaT7ByMXW7Ziu0KnP0czUZYYbmDi6+OGLGn6wwi85CJUqkHKsCt6SejvMYEsCf4b7oFRTDD2yNNqirUXLKWWvKWDCS1YlsIgO99yk7x1gbriQzSeuodfFgJbiOjqSDpfXdZ6aAOge7lz3VyVPc3ZjjgplIdE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753293193; c=relaxed/simple;
	bh=GIMQ/ob6b3+PCABWMbhh4szXOxD/irQLhk8f2jbuolc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CNtn0S8UvHEXsPlEbAsiBq5+/zsAdPBtnuhQzEyJbMHy4d+oxOTO9ODIGwv0ENzc6W00/YncEsz267ml1wjEisYXrOwXCrZa/W2xAAZTontEHRLsqaRpEPlfpWrfFU9aF5Mq5CcZC8zu2v/LCmkqb+v7p7XpkhQel3PVXuo667E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=e+qxJmve; arc=fail smtp.client-ip=40.107.237.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vOwUWSIx3XgfXdUqubDXl+brQkdtRZZxs3azYMvSRL7i7FngP/ENZ7K7XjWA+umjtIXM3H3aSvGRvsKUA43/pWCBX+Ry6ioJiW71Ct27LzzXHGc6fNWDim9WakwLLvyr6pnhyNathZZnV/nSW4VKIoVJ/tZ31q7FQm96DcudUkL5kXUUQUHh+2Tf7IZkdI+9aFINzmJIEUg2czpOn5yBZOhnyv3aFV+HF/3u88rRAt7UwN4x2Tky2x0kWINFS2wkYqI3FUPKvmDFW4eAqX3HVT6gRWahvDzZxBELnEsFvq0Iixk0dqCVOOg3PJTZTR9oAQ54H3GLKeAVrMouD1n2rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GIMQ/ob6b3+PCABWMbhh4szXOxD/irQLhk8f2jbuolc=;
 b=VpTMIQlt2qFgCmjkXpf1B4WjG0x4XLIHbIA3udkvszxPnel+1QCxp1C2X6BuPosUH9BFaYwxKGMgDDTT85L9KMwGOsX+UlU2t86twz0WHi4Pf+QIIHnYGRHjlqxmpYtbIPUoGWusPQexNY0PdMbjTOPXGp1OeImSYUSSH/RFvsgB2lD/zfUpYcFKv0nGnfg9RNF6qqRrhroCi5/VydjKp3weRsLqJexnExc+wPmEsRsswavF37wg71DmEouMVDfMjv2IBWsKa4bhxgEaefoVQ3XfR6y0/veETQ3tQOb94xYTXOVEqGhoh1btIOEszzIUkrnC6ePK66u08NLgxhM2ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axiado.com; dmarc=pass action=none header.from=axiado.com;
 dkim=pass header.d=axiado.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GIMQ/ob6b3+PCABWMbhh4szXOxD/irQLhk8f2jbuolc=;
 b=e+qxJmveBtyAMlTKKv40DHZuOm69rTci8inoRDJS8ki9CM1TpC3W1INPuz7iS+U3WmySGrwukGJEkM65R2eFKA+p4apOHpxi1bvXqgmN7+VWM0oWe5/p06+k/YdP8lRrY1ZglkY63nwsjJpe6SUByiL0GVi4B2wEQ/RDFAhreKjYu7ZlFhTrB/52of85cyZ4YGhTBwvUDylfGfOnFnSCTA2lmK01LDk0xjM0UtV/fvgbPNIe2ExdfTx0cy3+XF1UpXsDurd+AkAw61ql8Zz2I82hRY+0s1UCB/oZFNU9E1odomJugStkrxXKD/lcM2mhTQ7yfknCZ4M+lm0x8Ft99g==
Received: from PH3PPFA7616390B.namprd18.prod.outlook.com
 (2603:10b6:518:1::cbe) by PH8PR18MB5333.namprd18.prod.outlook.com
 (2603:10b6:510:239::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Wed, 23 Jul
 2025 17:53:06 +0000
Received: from PH3PPFA7616390B.namprd18.prod.outlook.com
 ([fe80::ef78:600f:5ed4:5050]) by PH3PPFA7616390B.namprd18.prod.outlook.com
 ([fe80::ef78:600f:5ed4:5050%4]) with mapi id 15.20.8943.028; Wed, 23 Jul 2025
 17:53:05 +0000
From: Harshit Shah <hshah@axiado.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
	<jirislaby@kernel.org>, Michal Simek <michal.simek@amd.com>,
	=?utf-8?B?UHJ6ZW15c8WCYXcgR2Fq?= <pgaj@cadence.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, Boris Brezillon
	<bbrezillon@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Linus Walleij
	<linus.walleij@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
	"soc@lists.linux.dev" <soc@lists.linux.dev>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, Jan Kotas <jank@cadence.com>,
	"linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski@linaro.org>, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v6 00/10] Axiado AX3000 SoC and Evaluation Board Support
Thread-Topic: [PATCH v6 00/10] Axiado AX3000 SoC and Evaluation Board Support
Thread-Index: AQHb+0V4WKrv45Liu0SL5MKKIbzLFrQ/YDeAgACehAA=
Date: Wed, 23 Jul 2025 17:53:05 +0000
Message-ID: <279d816c-8eba-49b4-a93c-d06cacc6b019@axiado.com>
References:
 <20250722-axiado-ax3000-soc-and-evaluation-board-support-v6-0-543979a60ccf@axiado.com>
 <CAMRc=MdFoAa2omJgL__4mRqX5CYyhZ3VU_Uy-Tf1oPSuZdV93g@mail.gmail.com>
In-Reply-To:
 <CAMRc=MdFoAa2omJgL__4mRqX5CYyhZ3VU_Uy-Tf1oPSuZdV93g@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH3PPFA7616390B:EE_|PH8PR18MB5333:EE_
x-ms-office365-filtering-correlation-id: e5ed06f1-5d40-4cab-3ed2-08ddca11c6a0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?MGNOUklWR0NaS3Z3ZFlVWmVZVXRRWE1nWGpxVlpPaTZRVGx2RzBWd3lVSEta?=
 =?utf-8?B?Uk11SDBhaXhIWjVQQjYrc2FGWEZvY1VDUmptRlJSUEozWWFBdS9RNnpMbkJB?=
 =?utf-8?B?dkgycGkvWGhIVTdTUjJadXQyUkJ1YmQxSWtIOUZZYy9wZFdTRk9FaU5XN0Er?=
 =?utf-8?B?Z2VvS1ZjcjV0RUZjaHk3ZUpwUmJaOE9iT1hrS2JJV081aU5TUGJPY1NUT1Fi?=
 =?utf-8?B?VExZWTkrNkpvbmRNVllNaXdXNDJaQkFEOHhWc1NCQkhRQlV5SXdUeUhnUmt5?=
 =?utf-8?B?V1pwS2R4Y3FCQXgyUHhOcEdrOHRYaDRVVFJ1QTVJK2MwWlhDY2U4ZFBmMlJ2?=
 =?utf-8?B?MTBuTm1PUHNrWnROblhIRHkyU0hESWlCNk5QNy8xZ0tpdnFHZjhlZHVVZWIy?=
 =?utf-8?B?T0tuejV4SGwxQ3VFdlFTeG1GV3FNdS9qZitYK3BlMDVjN05nTzhhL1doWFZB?=
 =?utf-8?B?aHZFa1RsN0JtQ0VRdENxSVNmMFd3cjFtMmhacnliY1RqRGE1em1pS1FzOUdj?=
 =?utf-8?B?WEZqVk9DaWgwZ1ZQVHVEUEdldkVzU25HaWdXZXlwd3k5akxsN0RtWkJVZWNK?=
 =?utf-8?B?K0VaTUlJL3gvRDd1OFhjODFmZTY4Z2dzaEd0eUZHMlRESFRRS0pFZWhScEVy?=
 =?utf-8?B?d0xJaWErblVhOXBHRFk0T0NBY2FZejRaN3p4V2EyMDRjcm01R2JKWlc5anJ0?=
 =?utf-8?B?SldHT0FjVnA2Y0l6M01UWTAwTHIrYnlOT2pJUms4UjZja0p4by95VjQyVkt5?=
 =?utf-8?B?QnFQb0RWTWxSY3piSXhTc0dhMW1wVUQ1U2VVeDgrYmN2dzhHczlwdUNvN1Fi?=
 =?utf-8?B?ZWFTMG9FV2dDdVYwc0VjMGFSZ2RRMkorczlyUm5wbTJHS3NocGxaTnJMeTc3?=
 =?utf-8?B?dnlYQjJnbVRwM0VzZkxNc1h4QUNNWnlKYStTbSttWlJVcHZSRGRnUEtsVmds?=
 =?utf-8?B?bFpqZmhnYkU3YVNlbEhXT3pSZFpNektkV2MvcmpWVXZ3dGJiUEVhU21VQkxj?=
 =?utf-8?B?elBsWTBlRzJ1QlMzS21pSks3VzZRZElVQjcxVm5kN2xrM21kQzVnVmZ6NStY?=
 =?utf-8?B?RnRtdXZNNnJHazg4Q3hXdUozcmZLSHJ5VXdqVkhNZTFINytnbDd1ZlIxTXZn?=
 =?utf-8?B?OTdqb08yV3E2UEkxR2tOL0RqVjYwallMVEJPL2NxNlNPQktRaEs1YTFSRmhp?=
 =?utf-8?B?a3FoRk9NVlV5bHkzNytuNEMvckM3NTZMSkNvN09iTUhkSWloTzFOZzFLQ2dh?=
 =?utf-8?B?Mk5wbG41eWtiRmdPUmxOOGJQcnVjbitTc0J4cDFxbUxvTUJSTWRjV1l5eFp2?=
 =?utf-8?B?SmFUdXNKZFJVWTdheWtTSDZDeG9tZThxbmpsSHp1ZklvSEovSERoUUs1Q0Ru?=
 =?utf-8?B?UW9WU0k1MGdTeWt3VmxTUC81STBlam85NUVQY1c1UW42ZVBxKzE1cHpSSStK?=
 =?utf-8?B?UkE0ZzhDY25LWVN5NWt5ak9ySEZFVlpZWjNtNnhzZ25nbTZCSy9xUExnTjk5?=
 =?utf-8?B?bzFiM1o3dkpMWndpL2xabHJKYlRweUdTNXEvamNxM2plM2loSnY0Z1NDYit2?=
 =?utf-8?B?R05tREtRK1VRajlaOW4yZjN0QVBYRkVtR0ZTZElTZXpLQW9sbnJTeDkxMHh1?=
 =?utf-8?B?eGtjSkRKS0g5L3RVdkRBRkpKdnNkRDR5cDZYMndNRVJzeUVFalhXbCtSdDZm?=
 =?utf-8?B?SW5RcXJPYzl1YzRjRTE4TkFhUHJpMERsMWw5RWtPR3huRTRqZk05RlRJZE0y?=
 =?utf-8?B?MHlnNUlHTU93eVhtTm9CMzRHektMbjcyUDk4ZEdaYUpRRzNLdHFHTm1CR090?=
 =?utf-8?B?NWJSMmU2UXJyd3RLcngwaDJIWEppdmNObmdKU3ZVdHJlTnQ4OTFxWHcyb1Yr?=
 =?utf-8?B?a0R2cFZ4SXJwblJFejlVa25rYU5ZbEs3d1lDb1YyZ2tjR3FzNHZINWI5T2cr?=
 =?utf-8?B?dHUva1BPVm1aMUVtTkRlS3ZlOTdxMWMzNk5PajZBdHdTMlU4cDMwLzduSmNl?=
 =?utf-8?B?R3F4TXFDNGhnPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPFA7616390B.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZFFPNHQrNUhUU1EzOVljL1RUbytSZ1hMdUtxaEdhRlRlYVJGdXg5dDFaVnB5?=
 =?utf-8?B?eG1mTlI3bzFVQVN4Zk5TTG95aXdGKytXSEJmZjRlYXZvZEptTjQ5bm1NdDVt?=
 =?utf-8?B?dGVwd3VjL3g2WjhrMnEyMGpYeElOZFhmT1Axb1BBcW5KWU9vMEpoa0hrMDlt?=
 =?utf-8?B?Z2N5czhpcFhRdWFpcEtlYXl5T3pqVFNuY2djeCtjNHlBS2d4Zm00TTFhQmx4?=
 =?utf-8?B?dXBTb3ZzL2dJMVY3OHVBT3hZcHg1UHJQSUFDODB3cTgzOHdDOWFqSU9pL0Vk?=
 =?utf-8?B?UXJXRVk3MGFXZDhzVmdQYUtaV1JpOGJTK1pZTzRHK1JSUUg4NkdkTmVGU0k5?=
 =?utf-8?B?Wm9MQ1hqenJTS3MxcVA3TXpCbW0wYXJOUng5dHNYMnpZSFBBVHM0dHpBSWJj?=
 =?utf-8?B?M0tMVGxRNnd4NGk2Uy9UeGMzOG9Makc5UHUwR3NXNG1VL1N0YndLNVQ2b2lD?=
 =?utf-8?B?bzZIb1YwWEQrdDdvMEJIYmpvbE1XTDFleTI2Wnk0WGxXWXhpODR0L2FWaXlU?=
 =?utf-8?B?Z2MvZ1dGckkybHpmWUNJK2FMbUh2aCtPV3k3VVVGNVlCeFRjM1I2Mm52NkpG?=
 =?utf-8?B?NVBER1V0aHg4WWZ6M2FNMldvUVBJamhoVGZ0ZEVRMFJiL3BPSSt4THg1Qkto?=
 =?utf-8?B?eERyOVIrUUd3MUpJdlNIL2lnZWlCRGVvQysxNklsNStIZWNTMHJ1L0tvVk0v?=
 =?utf-8?B?UXdadGlBS0tSTEg3ZDVOZncvcTYxOXhMSWxSdmJlNnc0UkNQdjRXeGlWdFYy?=
 =?utf-8?B?dTdFUTlyeVFHTW5xOG9YNUE5a1NGUytIQURXK2oweXdWbFdpRTJzcTEwL1c1?=
 =?utf-8?B?MWNqK09wbnNFTWR0NS8xUzVEdnMzOUNFSVpoQXA3Y0d4UkF6bHZQOTFlbGxL?=
 =?utf-8?B?WThsWDdnNHl6L1FUc0I0YkxtSFNDdklqeWRoUXZDVDIwVzFmUVhBbXhkUVM3?=
 =?utf-8?B?VFMrWE1FdEJzcldvdlZqNlJobkViTEw0Wk1KTkVJVm5NeGoxQUFCREdMMmN2?=
 =?utf-8?B?UTRPNXVnSm5xRzNTRHRFOGl6Y05yUStSVnUrSC8vaGJnRnVDTjZuajE4bTND?=
 =?utf-8?B?c2sxY3VJS010dTEwMDhQVVlrSVphWUM4MVlsMjZoVnpOQVN5Z01IMFBEcDc4?=
 =?utf-8?B?U3gzNm4xR0hIOThkVmliL1dPUCtPMG4wOUJ3THNWRXFaenFZQ3RrN0VFeEFp?=
 =?utf-8?B?WFVUQlZwbmltQ3NRQmlMM2hPL3o3UHpSS0pGUWVxTjNxRm1yYkRmTmQzZjNW?=
 =?utf-8?B?R2tFTG9lWmg0Z0hRcWs0dm50VmxsMWh2aVpwM3g0U1FVWnNzbW9FWmhxV0Fn?=
 =?utf-8?B?N3FhUGk2WVdpQzRTczJ5ZjNBejE2cnJuWXpkWndMSHkxaTlOSkFnUitOVS9z?=
 =?utf-8?B?TFV5S01yTjV2dTdrQkJkL3JaNWtKV3BXV2VJUFBFbDR2djkyK2xrQ2VvYkE2?=
 =?utf-8?B?R0tkdGozZUF5Y1Z4SGkwaXRwT1lqNTFZSHJRYzNoWmlONHZicURKdFZFMkxU?=
 =?utf-8?B?dnJpS05NWThTUXE3M3ljUnlQOFRzM3dQWkRPeTFJM2dxQzFqazh5S0k2OGNr?=
 =?utf-8?B?VVpvVG9RUndtQjBLMytaT25xajVjVXZrenBsTjdTbWpxY051ZjFTWkFxczBh?=
 =?utf-8?B?ZVpBaXMrQ1BVbXlvYXF6ZjZQcEtHa2Q3NDhEenZvVFBqWDNydlRsU1Jtcng3?=
 =?utf-8?B?NFcwMEZRV3F0eXJ4eEh6aW1hMStKZG1CVGZHS0o0UGNOM0orNklQN3VSc0Iz?=
 =?utf-8?B?Y1hZOHJ5Z01Cb0xHZ2NmdmUwK3dmUzBPSkJyVHB0bWVkeWMvU1Z0TkFONWxY?=
 =?utf-8?B?TU0zc2xYdFFFTDc1THhYMlRZMkNzSGdXenRLajU1eDNLVFA2MmJDNElxN3FN?=
 =?utf-8?B?RzVhNlNMY09ReFhOemhUY2RMQ0JlTnBTMFVlKzJVL0tXL25vV0tySDh6MzBX?=
 =?utf-8?B?cXpUSE40OW9xUzJEZU1tdkQwa2M2Qy85Yk12cm5kbGQ2cGU4USt1K0JEOHpw?=
 =?utf-8?B?ZkZoQi9sbk5tN0Jib2NoNjlINDIzOFcvNUpVSWI2Y2FVdENvV0ZDYmRWdmll?=
 =?utf-8?B?cisza3R4WE9KRnRGTk8yaWkwSTFEeUdyMHNjV2tidnFCL1M4cE93eGFZYW9T?=
 =?utf-8?Q?IiE4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CCE836ECC85DC94EB2B2F0595B228EF0@namprd18.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH3PPFA7616390B.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5ed06f1-5d40-4cab-3ed2-08ddca11c6a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2025 17:53:05.1730
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5QbrnYKdtFNIVIFSUP+sz6P/BCIiTCMCoMVZ1D05GZDFuhNWYgBlR5Et6HrR3EpTPoL8QE/6mgUrExHF0rfl0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR18MB5333

T24gNy8yMy8yMDI1IDE6MjUgQU0sIEJhcnRvc3ogR29sYXN6ZXdza2kgd3JvdGU6DQo+IENBVVRJ
T046IFRoaXMgZW1haWwgb3JpZ2luYXRlZCBmcm9tIG91dHNpZGUgb2YgdGhlIG9yZ2FuaXphdGlv
bi4gRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSByZWNv
Z25pemUgdGhlIHNlbmRlciBhbmQga25vdyB0aGUgY29udGVudCBpcyBzYWZlLg0KPg0KPg0KPiBP
biBUdWUsIEp1bCAyMiwgMjAyNSBhdCAxMDoxNuKAr1BNIEhhcnNoaXQgU2hhaCA8aHNoYWhAYXhp
YWRvLmNvbT4gd3JvdGU6DQo+PiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+PiBI
ZWxsbyBTb0MgbWFpbnRhaW5lcnMsDQo+Pg0KPj4gVGhpcyBwYXRjaCBzZXJpZXMgYWRkcyBpbml0
aWFsIHN1cHBvcnQgZm9yIHRoZSBBeGlhZG8gQVgzMDAwIFNvQyBhbmQgaXRzDQo+PiBldmFsdWF0
aW9uIGJvYXJkLg0KPj4NCj4+IENoYW5nZSBmcm9tIHY2DQo+PiAtIFJhbiAiYjQgdHJhaWxlciAt
dSIgYW5kIGFkZCByZXZpZXdlZCBieSBLcnp5c3p0b2YNCj4+DQo+PiBBZGQgc29jQGxpc3RzLmxp
bnV4LmRldiBpbiB0aGUgdG8gbGlzdCBhbmQgc2VuZCB0aGlzIHNlcmllcyBhZ2FpbiBhcyBwZXIN
Cj4+IHN1Z2dlc3Rpb24gYnkgS3J6eXN6dG9mIGFuZCBBcm5kLiBUaGFuayB5b3UuDQo+Pg0KPj4g
Q2hlY2tlZCBsb2NhbGx5IGFuZCBhYmxlIHRvIGFwcGx5IHRoZXNlIHBhdGNoc2V0IHRvIHNvYyBn
aXQuDQo+PiAoZ2l0L3NvYy9zb2MuZ2l0LCBmb3ItbmV4dCwgY2hlY2tlZCBjb21taXQ6IDdkZmJm
MzE3NmQ4ODZmZjlhMGM3Nzg2OTQyZDNhODk4MDlkMDY0MWUpDQo+Pg0KPj4gU29ycnkgZm9yIGxh
dGUgcmVxdWVzdCwgcGxlYXNlIGNvbnNpZGVyIHRoaXMgc2VyaWVzIGZvciB0aGUgNi4xNy4NCj4+
DQo+IEkgY2FuJ3Qgc3BlYWsgZm9yIHRoZSByZXN0IGJ1dCBkbyB5b3Ugd2FudCBtZSB0byB0YWtl
IHRoZSBHUElPDQo+IGR0LWJpbmRpbmdzIHBhdGNoZXMgdGhyb3VnaCB0aGUgR1BJTyB0cmVlIGZv
ciB2Ni4xNyBzZXBhcmF0ZWx5Pw0KDQoNCkFybmQgaGFzIGFscmVhZHkgYXBwbGllZCB0aGlzIHNl
cmllcyB0byBzb2MgdHJlZS4NCg0KVGhhbmsgeW91IEJhcnRvc3ouDQoNCg0KUmVnYXJkcywNCg0K
SGFyc2hpdC4NCg0K

