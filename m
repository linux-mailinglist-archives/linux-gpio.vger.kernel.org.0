Return-Path: <linux-gpio+bounces-21896-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 679B7AE0FE6
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Jun 2025 01:10:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C19681BC4665
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jun 2025 23:10:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5E1728D837;
	Thu, 19 Jun 2025 23:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="WsVBk5/l"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2121.outbound.protection.outlook.com [40.107.101.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA312111;
	Thu, 19 Jun 2025 23:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.121
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750374597; cv=fail; b=EJxnGzn3nox6dYmC49WV/nfwwCQp9HWqqTXA0QNh20tmTmrvEz7eAnLVDQX5ZC8z8ki99qYmenk/uluIJQged3KsEP0la7o4AV7qhjdM2eWDH0q3Frp5PrsBAyD9Oqcg9Nhpoi+ZF63CNQaynDSlxoAZA3SBV+bc8YRuxOpA64U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750374597; c=relaxed/simple;
	bh=zAdLxwkJrnkknc9HhbH6tq1/trcO6AbPOUtHAiWPiCo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=eKbXKuNixf2xmhsLnGqOXOsU86RmD1KQFv6G+ZzAaNZ+3UBm57njDTwR8zDYSW+Km/YRsZJtsnEeT2Y28a0ckVrsqNX+m5ggvLAbr7RFxF31J3t2idWfsyxSJZrgMxwdGskpoCiKgsMC/fMyvdekQf52Oq6DJsoDEFURs35IY/w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=WsVBk5/l; arc=fail smtp.client-ip=40.107.101.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s3kgjSfxomf5X/17p/MCPuwQXytSdu9EdW8VzrCy8eyLcs9fzl76M7QyN1Z8WfD99z4pQ12WV1swpTI9LQwk6F1hprWyU6XHCWYQ2gpwBhF7JJwiS/XU2UQg0JIms2xVy+sWN9bRfug0m1PmOFOI9W0FPNQTZ3PcLofPj6wC4MPmYRUW35JYjAw8cIVKuVGtferVqF0GoNEr8BhUdF+iRBI+Re+drTnP7BJ4HrvVvQ2bdYB/MDIHE5ahPJVDmwW3A02mh8vGWrEy8ZH3I5AHoBA6u0Rlja0RiLC7FTLPYF03NxqH1Mffel5F7qLA1E2P3EDN7KS7lLeijzMS3fd61w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zAdLxwkJrnkknc9HhbH6tq1/trcO6AbPOUtHAiWPiCo=;
 b=mKc/Upud/RMdY4pND5DFJA+9qINwq5mb42OeJfMDmAZBTF8mxZTnDlNNbyrghaUveoyYnay6Vtodk9kQqMDTB903m/d+s1UiqYWkkyz/Ij2ZaiTCe6ZlQvjQHSClLieMZ6HnRrM7fAw5M9Ona1XC7GT+wv0udhkIW6Dt55FJJkYDjExo0QTQPQA4sgJCe7/XeQ9z1qPu+uA2lwRE9s8wphuFIhxTcRmK+GLfgyUdYziXRGaH0WyAX1WQitv8xrVVY0Wt4Dytm88ji860X/AiwIQrjrJDAQ+TJraL1ix2cB0tMciGjBoJ/gD1WkCUUHt+SAU3kSZGKRftkELKgEHhkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axiado.com; dmarc=pass action=none header.from=axiado.com;
 dkim=pass header.d=axiado.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zAdLxwkJrnkknc9HhbH6tq1/trcO6AbPOUtHAiWPiCo=;
 b=WsVBk5/lR/gO7mu/e1rBQQCxa7Hhj4scEFg8rRD7JjkjskjGAdZOERRhyMrPyD5weL3TK1vysICU993u/6BgJ6pvdR2Bm3kiaFk1zTlYeN4V1xoght91N+jJ1PZ1phcDBuMmudR1ZDB+kiS9G1nhmW8X0/pJ6F5m1laNhTSfGHbL8mSmMy4YGTyhyh5nLPCYOxUA95Gdt97KJRqpRxtt60YFndMxMTLwAprnCPl2W2bXpdEbCpfVcXLUJ3rCyIiBrxABVFZp6vFinjGLaqgJphrcq4vmhAm6h4BvF5cpaBL4Ri7dWcYNA+V3kxmrN0aAwnmwDHfDX1uJNtsj+i7adQ==
Received: from IA0PPFBEC4B1F8E.namprd18.prod.outlook.com
 (2603:10b6:20f:fc04::c3d) by SA1PR18MB4615.namprd18.prod.outlook.com
 (2603:10b6:806:1d2::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.23; Thu, 19 Jun
 2025 23:09:53 +0000
Received: from IA0PPFBEC4B1F8E.namprd18.prod.outlook.com
 ([fe80::ca34:e235:13d9:3f5d]) by IA0PPFBEC4B1F8E.namprd18.prod.outlook.com
 ([fe80::ca34:e235:13d9:3f5d%5]) with mapi id 15.20.8769.031; Thu, 19 Jun 2025
 23:09:53 +0000
From: Harshit Shah <hshah@axiado.com>
To: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Bartosz
 Golaszewski <brgl@bgdev.pl>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "soc@lists.linux.dev" <soc@lists.linux.dev>
Subject: Re: [PATCH v2 4/6] arm64: dts: axiado: Add initial support for AX3000
 SoC and eval board
Thread-Topic: [PATCH v2 4/6] arm64: dts: axiado: Add initial support for
 AX3000 SoC and eval board
Thread-Index: AQHb3neXHHei+il700ibF96CIekp1rQF0D8AgAVRVwA=
Date: Thu, 19 Jun 2025 23:09:52 +0000
Message-ID: <114f03bc-4a3a-40eb-a58b-cc1c5017538b@axiado.com>
References:
 <20250615-axiado-ax3000-soc-and-evaluation-board-support-v2-0-341502d38618@axiado.com>
 <20250615-axiado-ax3000-soc-and-evaluation-board-support-v2-4-341502d38618@axiado.com>
 <CAL_JsqJpb7wFw3DqX504LyS2PGbQxQfbBKh9VfCY8j7G9YKXiw@mail.gmail.com>
In-Reply-To:
 <CAL_JsqJpb7wFw3DqX504LyS2PGbQxQfbBKh9VfCY8j7G9YKXiw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PPFBEC4B1F8E:EE_|SA1PR18MB4615:EE_
x-ms-office365-filtering-correlation-id: 71dc004e-50d3-494d-65cf-08ddaf866623
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?TDBZQUpzcTk0cnlGbklYdmtFdlo4Y3BDbFhWTXp1c1lWeGVGYXJKYTFKTlNH?=
 =?utf-8?B?eGN2QVRvZytCcE5KZ1hUaEtDOUhyYS9QQlovcWttRmhSSUtrR0lvY0pOK0tG?=
 =?utf-8?B?cGFlaWdWVGwyQkdRRTEwMkJaYkpQbkNQMWgvaUtsczNLM2FkZG5RQjhGOXlm?=
 =?utf-8?B?SGNkUmE2UERlcFpQTDZZUVZhUGx0VjJaRTlCMlVldmxIR3IwNFl5NVRsclN3?=
 =?utf-8?B?b28vMm5heUN4OWFBMndCeWZCcHo5QjBwb015YnZ1cTc2Qjl2cG4wSUFSR0NE?=
 =?utf-8?B?elp1cUlwMVZoc2xHL0xqY2ZZSGNXY1RqbmFBYXgyVi9RdEM4cGNYVFM1VXkr?=
 =?utf-8?B?cTNpOHhMcXV2c1UyU01pYXdiRnpERU1jV3BKcThkNEFzUEYwbmxlaEorVmsv?=
 =?utf-8?B?UlVYVE81QzJzZmlnSFh5UjRuYml5ODdScHFGaFVuL1o3S1FhZzlPNW5sZFpG?=
 =?utf-8?B?QXBhbG5Fd3N1MzVQVDdpbU9UYVBTSVdkckR5enltdFNjcjdKWW1BbVVxd2lN?=
 =?utf-8?B?MGRXdEIwY2V3TmFzdHFyYUdjTTlYSnZBdUcvd3RITFpXVjV3aGdTSHhUZ1BB?=
 =?utf-8?B?bXc4SlpWemVvdVZzNzRXdnZRSFRXcnV2Q2lncFFucW9PSU1wRWNRWlBjYk1S?=
 =?utf-8?B?Mmo4Z21tR2gzL0pWeVNoejhybUszZnk5SXlqZk9yaWtiODNjZmkyREFxQVRT?=
 =?utf-8?B?b2Zmcm1BdzFTcDNIZjJyL24vN2FXS1BocmJhNkJmZXJjTW1aWkJ0Qm9CVjkv?=
 =?utf-8?B?TkVMQjBKTlZjNCtyNHhRV3ZkMzdaT2p4SHlZdVI0Y1N0SExrNUNhRzFlZHJP?=
 =?utf-8?B?cVZsemp1cXhSQURHMWg4NFJVSmNUTU4yYTc1ZjBZbWQ5VWEwVWlrcHVWeUhN?=
 =?utf-8?B?N2VHNjFUK2l0dDdXMWgvOVh3YnRjK1crRVRuazNPaG5IOUlvaDJoYUt2SEZM?=
 =?utf-8?B?MVlQdGdOb3p5Z3hSVDI4dGRvUUx6MXVCcjZ4c2dTZDl3QVlXWGpCb0JDNXF2?=
 =?utf-8?B?eEZycUxRUzdvVTlYOWFvckpZUEpQM3d2cU9NTTRzWW5LV1pmS0VVMXJCcGlm?=
 =?utf-8?B?YVNxWVdzLzVxeUdkb29HMjRCN1hQb0E3d3pFWmVTc2lMSmxGWmxlOFBBSFJB?=
 =?utf-8?B?MXQ0emhUbC92am5wU01GZ2U3anAyL3A0NGNibmRFQzhocWp4L29NdU85Q2I3?=
 =?utf-8?B?S1U1YldYTUVXYnMrWGkvaXdMbnN0bFFLMzdYUzB4ZnBsZ3J4KzJGNllYVUwv?=
 =?utf-8?B?RTJDc2hoeFRGREJrZ0Nzd3duakdmckJHVnVaQ3ppbUp3MVdMN1FsNkJqRUor?=
 =?utf-8?B?OUlsZmI0MGcvSTV3ODRncWM2VUxBMHJlUWQ3bUwrSVpCN2tBOXVOeDkvMnRF?=
 =?utf-8?B?eDNGUWhNcUtrZTZwSGNneFk0UjFYTndVV2FHa0RhVi95SGltWHc0SjRWQkUr?=
 =?utf-8?B?Wk1SUjlpQ0FCNlRLaXh6VWtidzQ2Ym1XOUY1QllUckROUUlnbEVoRE9ZcUli?=
 =?utf-8?B?bU43SVg1YTdCYU9LRmJQU2sxeGx6Z3VlMlJtTTlOVGhWa29FNERkN3MrK2Vv?=
 =?utf-8?B?ck9DNUtteHB6b0haTTRRU1l2MlhRSkt1L2tTK09oUnNKQ2t3YkZNOGJXUUR4?=
 =?utf-8?B?OWp6d0N1M3Zmc0J1S2tFV2luZTBIZWcvTHI2dWZSM0orNHVPS2lUQUdvbzNF?=
 =?utf-8?B?OUJkOU5hQW5GNmFMWUtpQ2I4dU9nWVlBbWo4STluV2JMWnJzNUtCaFFkMHZk?=
 =?utf-8?B?eXVWUmtZWTVWMjRsWHl4SE5RK1g1UUg2NmY1aHZ0bnlHc2d0TEI1NkIxUml6?=
 =?utf-8?B?MDVwKzR1WXM4UnhDY3RDL2xWRU1mVEpCUldoZFdxMmZhMitNT1FERktWd3Nr?=
 =?utf-8?B?VUpFRi8rZDBkK3lBK1luc3d4TnBlTVNCbHZOU0pyQmJ6WEZFaU82aEtuR1Rv?=
 =?utf-8?B?U1lFL3ArMzQ5MXdGNGN4T1pOYzVHa1JMZU1MUTJMY0EvUElqNndZZ2pkclJ0?=
 =?utf-8?Q?LEiz6dQOTxjttYp16+cXuoysdWD0x0=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PPFBEC4B1F8E.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?L3Bkc0VFbjZxL0FwSm9USVc1enpoU1VXU2h4UzBabmNFRy96eFRyUmc2Yi9V?=
 =?utf-8?B?bjFxeXAyQTNRNmlsSmpJTDBUeFkyMGdBTFlDS2VlNWkzZy95K3Y5ek1HUmZG?=
 =?utf-8?B?d1NPTU9OTmFyMFROM1dTTHVDQlJwd3BLVTB4OG1jY2pqY1EwWms0c0N3eHBs?=
 =?utf-8?B?Mm0rVjBmS2dFV3dTNHN0VkpEMjU2SXN4L2RvaHNGU3NrcmRnUW1qZ3RocWJn?=
 =?utf-8?B?SVlUU3NtdEhsNHF3U0VhdjFmTGlNanFPbEhYUWdRWlY4NGYrRUJFQXVTbTBs?=
 =?utf-8?B?eUxZUUI2Qnozc2RyYm9oSndBOXgzSWdUcjhKYVZQc0lLTzRvWjk2NmpmVWxE?=
 =?utf-8?B?aE9QNEprWDlSem9MRDl5Y1BEYVlPKys5WGgzR1VqK252U3AzRTByRlc4VlAy?=
 =?utf-8?B?WFc5bWFPbTFUbldWM0dqa1U5MlBJdnJRSjBFUkhRVVduWG11QVZab0RkbEE1?=
 =?utf-8?B?ejUrakZOcXdVRVRMeDRBRHd5M3NBcG00eHpxVHhKc21uaDRwVmkxTTZiUGpK?=
 =?utf-8?B?Wlh3cE80VXhzUWRWQ1JzdGJKSVY0OGw3R1o3TlZvRU1VY0RsNVVVTnVmbGNR?=
 =?utf-8?B?ZW5GK3dhVVlRVlRZelUvaTNpQ2UxTHA4N2NoQzI2WkdURVc3dlZQN0c0b1Y0?=
 =?utf-8?B?aEwrWjZhY2VwdnRJVVIvdEZueTN4aTlQNDZPL09OZDNBK3c5V1MvZmFiZUM2?=
 =?utf-8?B?b1ViQVJjUzYxSjRpcWFHRlhOOTRoeHVpRlArMEowV010V0xXODkrNjk1cFRu?=
 =?utf-8?B?SFZGOXpuVE1xNnA0K1UrUlk5SXF2VXU1ZE5neWNES3M4eG5NbWMxWEgrc3da?=
 =?utf-8?B?c1o0NTNnQjF6L044OGRHRUd4YXArYk4zMEVaVTJaeGlrZ3ZsZVRIR05hL2sz?=
 =?utf-8?B?NWJuVytVaWZyeTZVZTc2dnlhbHZUVkZOYS93T0NsY2pzWEZGZ001ekpHMmtX?=
 =?utf-8?B?RFh5N01JQWIvZVViN2pPSmNoSElhRU43NkVUUDlJWXZrcXE2bHVFaEl0akpt?=
 =?utf-8?B?MUlheE1EZzhvS1U4MXVZSzFQT1Z2MStOL0t1VXRGb28weVNkWGdKd21iZlZE?=
 =?utf-8?B?cStFWjFDWTNEc2hSeDE1dnBHK0hqc2VibHQ4N2RHd29FRDJGZVphbFlxeExi?=
 =?utf-8?B?T1FPOE1BMEh1RmxrY0JGT3dRdXZmLzU2b1NleUhtSzBVdXhKTjZkR1EwWnZL?=
 =?utf-8?B?SWJmemx3V1BwTnppOWtXc2wrMWdSMVZtNDB5L0Q4Skc2bHgyeDRvN2V3SWVh?=
 =?utf-8?B?bWZBd3JPT3BUcEVhdjdmYmtqY1NYSERWeUtmaXVUejVWSHR2S3dpcnIwdWpK?=
 =?utf-8?B?QUk3VWJzeGduWkNVSFVieEdHRVYvSTFMdENaK3paajZFNmVYQ3lKd2JVSE9K?=
 =?utf-8?B?eG1JWDlQaVhQclYxSEhJUktYQ2JKam9SWlNRbDFETnpKZXpoaGpMTnlEN0U2?=
 =?utf-8?B?Nk5QOEovNVowYlNNUDdHZnBIa3dHQ3RSUHBhT0R0VXdpbjRObnJBOGQ2R3Y1?=
 =?utf-8?B?R242VjY0eTZjSENpSE1LQ3RWOUY1ZWRRQlE1SjhCUWg0R3JQN3lHS3hzQWpp?=
 =?utf-8?B?L0V0SFpiZXlVNFZsVW1VelBQeWt1bE9VdUhtdlhveWhLcG9mQ0wvNmRodEds?=
 =?utf-8?B?Vm5BYW0wSW56OFkzQ0VmbUZ5bDFDM0Vkd2xYSVJUWU1Jd0o0RXI0bFNjOFJL?=
 =?utf-8?B?cDQ4UStvbWZ1Ymo3K1pBdEtRMWY3MURwelJzZU9CR2ZrWkJ2V0JWS25LTnlY?=
 =?utf-8?B?TTZPVDB6cnd1ZHNJcllXWGdUUDdPeXBzQjB1blpDUFJRUzRjSGRZNnBsSk1v?=
 =?utf-8?B?SjdseWx4V2VyNjA0Ym12V2d3NEJiUGVjY0pDbnRhSm9qUlhWT2JLYjROaS83?=
 =?utf-8?B?cjc5OStBS25HK3hUeDM4ZlJ1eHdYalFNQkNUa1dEZlhIOW9ZUThlc3BpQ29X?=
 =?utf-8?B?bWdDZmVOT2cyS1M0RW80Z0p6Mm93TzV4WkN1ZE9Ta2piL1ozUUpOMXIycHNX?=
 =?utf-8?B?SDh1Q3Q5MytDQXhFSUdLK1RkYlBZbVlUT2k2SERNTm9Yelc2WWlQSlJjZnVJ?=
 =?utf-8?B?WElodEZSdEJONk05eVU4RzYrL0dmdy9iUDdpSk8zVE9oaDgzTlNkc3ZFNzFI?=
 =?utf-8?Q?iOXw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9358CD09CDAB2A4E8C87C09F86ECA62F@namprd18.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PPFBEC4B1F8E.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71dc004e-50d3-494d-65cf-08ddaf866623
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2025 23:09:53.0090
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bjlkVj6D7HKBFy3I8bTC/Nycq3KKvZioyF5CCMlHqaF9Oqag9ir95QCzTlxhaGty/iYc1UPb+py52minl7/W6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR18MB4615

VGhhbmsgeW91IFJvYiBmb3IgdGhlIHJldmlldy4NCg0KT24gNi8xNi8yMDI1IDY6NTcgQU0sIFJv
YiBIZXJyaW5nIHdyb3RlOg0KPiBDQVVUSU9OOiBUaGlzIGVtYWlsIG9yaWdpbmF0ZWQgZnJvbSBv
dXRzaWRlIG9mIHRoZSBvcmdhbml6YXRpb24uIERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0
dGFjaG1lbnRzIHVubGVzcyB5b3UgcmVjb2duaXplIHRoZSBzZW5kZXIgYW5kIGtub3cgdGhlIGNv
bnRlbnQgaXMgc2FmZS4NCj4NCj4NCj4gT24gU3VuLCBKdW4gMTUsIDIwMjUgYXQgMTE6MzLigK9Q
TSBIYXJzaGl0IFNoYWggPGhzaGFoQGF4aWFkby5jb20+IHdyb3RlOg0KPj4gKy8gew0KPj4gKyAg
ICAgICBjb21wYXRpYmxlID0gImF4aWFkbyxheDMwMDAiOw0KPiBEcm9wLiBBcyB0aGlzIGlzIG5v
dCB2YWxpZCBhbmQgb3ZlcnJpZGRlbiBhbnl3YXlzLg0KDQoNCk5vdGVkLCB3aWxsIHJlbW92ZSB0
aGUgc2FtZS4NCg0KDQo+DQo+PiArDQo+PiArICAgICAgIHRpbWVyOnRpbWVyIHsNCj4+ICsgICAg
ICAgICAgICAgICBjb21wYXRpYmxlID0gImFybSxhcm12OC10aW1lciI7DQo+PiArICAgICAgICAg
ICAgICAgaW50ZXJydXB0LXBhcmVudCA9IDwmZ2ljNTAwPjsNCj4+ICsgICAgICAgICAgICAgICBp
bnRlcnJ1cHRzID0gPEdJQ19QUEkgMTMgSVJRX1RZUEVfTEVWRUxfSElHSD4sDQo+PiArICAgICAg
ICAgICAgICAgICAgICAgICAgICA8R0lDX1BQSSAxNCBJUlFfVFlQRV9MRVZFTF9ISUdIPiwNCj4+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgIDxHSUNfUFBJIDExIElSUV9UWVBFX0xFVkVMX0hJ
R0g+LA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgPEdJQ19QUEkgMTAgSVJRX1RZUEVf
TEVWRUxfSElHSD47DQo+PiArICAgICAgICAgICAgICAgYXJtLGNwdS1yZWdpc3RlcnMtbm90LWZ3
LWNvbmZpZ3VyZWQ7DQo+IERyb3AuIE5vdCB2YWxpZCBmb3IgYXJtNjQuIEFuZCBuZXcgcGxhdGZv
cm1zIHNob3VsZCBmaXggdGhlIGZpcm13YXJlIGFueXdheXMuDQoNCg0KTm90ZWQsIHdpbGwgcmVt
b3ZlIHRoZSBzYW1lLg0KDQoNCj4NCj4gUm9iDQoNClJlZ2FyZHMsDQoNCkhhcnNoaXQuDQoNCg==

