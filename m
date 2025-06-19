Return-Path: <linux-gpio+bounces-21897-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 971B0AE1022
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Jun 2025 01:52:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F299F189AFA1
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jun 2025 23:52:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4245A28DF2B;
	Thu, 19 Jun 2025 23:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="c1ukMyQF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2103.outbound.protection.outlook.com [40.107.223.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 443D528B7EC;
	Thu, 19 Jun 2025 23:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.103
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750377154; cv=fail; b=iGJwty2eIC4kM27NfU1JpY/Imtz6AYjODbYnid2wUaUtNQNRPvYk1+g+bnuIcYilhzRmwIiAWLTlucB13yFG2EU1z51oGiFeLVEh5b6sXwWXuHZIkgb1UTLwzGZhE8UAPy9X4sfhga4NTqLr3Pd9AqTbbKgAgqLKrCHqb2spgjU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750377154; c=relaxed/simple;
	bh=XBagNtp5xWzway38TMx/oGe5aiIIrQ6iHfmdxiW/WV8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hX2HB2WwAXiYGbKzXcf1gfVcNnLSY5d4n28s5aRyGf5FkobmazUZdJJnsjx+xFAEyRPP58sGxCXR5tpizEo2uvdZA5O2Ja4iH6euygN7c9bGwYIeDqljPkGkC0c78i0pJDkWGEQLD/yDJJcpkSbEtf1h/BP8kygPzNBZqsK49EM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=c1ukMyQF; arc=fail smtp.client-ip=40.107.223.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=swCzyakyJvBMnNnWQ15U2fhyLwxD+jmaoKPCn7zCV9JXmIjv3//nOMDrupA2aS8daQBQA9o3VBbrfXpKSiYQxHfBcPXt8qlXYvTU0jTCLkM8GXC7ZkL2Rxk9oQ3JSDjGJ/MNmyzsTSvC3tg3sB3IqEOB1SHkxyhCyeONKkFEBgTvFA5+ahoAMGLnLe4YmQDTiMKy016gsMss1v6MhZ9dW+ASvi/UsPQLkJtjHOhY7xDacMz9y0XFm4C1mTcJabkQIeCz0lF8Q9pBvLvyhSqmhrWmmCapVd0vDfeMIKyoxZJAzyOE5ABkefI4xwKrCWF1B16IjFsgliEFhA32g/q5CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XBagNtp5xWzway38TMx/oGe5aiIIrQ6iHfmdxiW/WV8=;
 b=QOmkvwXedU420s6zF0YXYxNJXErsCHfWsEh6CTALufBqLVtRdyp3ohoHE84iPy1w8JegYG0t8Fro7P4ixqdXWl1IQkkSzAfo3NtmJfUEaKiAXOWIvmh7uR/GaAs225H+P2Hpoy3Az01ZIikWdeQSK3UJ5FkDlCaD7bbleU74Fd34VYd+WGoYJV/OWqIrSEYttXd5wLer1AV3pO8Gac9RzxU0Oht4uzGb9iHW+tB/eOQFeF3JGvXiVphQUwm7i/E9JzsP7VTHG665bIFNJJ+nXL5qaEUHmJee+rDBb2KSE3Iz92QmkSXXhcgDGOxQ5SZyvZuG7HX+MC2++k4q1ScBWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axiado.com; dmarc=pass action=none header.from=axiado.com;
 dkim=pass header.d=axiado.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XBagNtp5xWzway38TMx/oGe5aiIIrQ6iHfmdxiW/WV8=;
 b=c1ukMyQFaJmSUe4sObkpeZ96CQVofbp83k7IqAK260cwbqpWtXXCZOeYl00tc93L5irGf/42EHhkJE0bzNuJpU7KPG0hFn0nUAqrPvxyBDz0QrUXCfye8YHUNlx77dALHT5h941FgW4Kb6GTxVwHUVviAZYYxS4OVRd1unSzbnNkYgSXDw+MS4Y2tXmkBW8VMCXKEabg7L5isndybU7NP9iyNl/SuzIOG10ZTHFbWVMH7lQXV5jMGUj7rr5d6xeC7K4pIyIC6QONULvGi6vdhjCQBx5awZhNWgq696/X21SfxrMFsUvDQOikBs9duq8x1nQWZg8S0va8bP36IxIoug==
Received: from IA0PPFBEC4B1F8E.namprd18.prod.outlook.com
 (2603:10b6:20f:fc04::c3d) by SJ0PR18MB4512.namprd18.prod.outlook.com
 (2603:10b6:a03:3ba::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.22; Thu, 19 Jun
 2025 23:52:29 +0000
Received: from IA0PPFBEC4B1F8E.namprd18.prod.outlook.com
 ([fe80::ca34:e235:13d9:3f5d]) by IA0PPFBEC4B1F8E.namprd18.prod.outlook.com
 ([fe80::ca34:e235:13d9:3f5d%5]) with mapi id 15.20.8769.031; Thu, 19 Jun 2025
 23:52:29 +0000
From: Harshit Shah <hshah@axiado.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
	<brgl@bgdev.pl>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "soc@lists.linux.dev" <soc@lists.linux.dev>
Subject: Re: [PATCH v2 4/6] arm64: dts: axiado: Add initial support for AX3000
 SoC and eval board
Thread-Topic: [PATCH v2 4/6] arm64: dts: axiado: Add initial support for
 AX3000 SoC and eval board
Thread-Index: AQHb3neXHHei+il700ibF96CIekp1rQFTbYAgAXfxwA=
Date: Thu, 19 Jun 2025 23:52:29 +0000
Message-ID: <7972cdb1-9d2e-4433-a0ef-e8f333cf9cb4@axiado.com>
References:
 <20250615-axiado-ax3000-soc-and-evaluation-board-support-v2-0-341502d38618@axiado.com>
 <20250615-axiado-ax3000-soc-and-evaluation-board-support-v2-4-341502d38618@axiado.com>
 <bf91eaf1-4b70-4acd-bd1d-2246a12eb269@kernel.org>
In-Reply-To: <bf91eaf1-4b70-4acd-bd1d-2246a12eb269@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PPFBEC4B1F8E:EE_|SJ0PR18MB4512:EE_
x-ms-office365-filtering-correlation-id: b9e1beff-0894-4efd-b3a9-08ddaf8c59b9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?b01YcWpiUTNGeFloeG9iR1RzUVFiS0pTSmdBR0M5MDNxV3NLWFluQ2w1S3RO?=
 =?utf-8?B?d2RMZHlCamFrRUxGVnhOR25zOVBBcW9hQTlrMmduV2c0ZlV1dE9XN3FXYWt2?=
 =?utf-8?B?Yjh6R09DNFhCRHhCU3lSa3E2aU9QRG5mem1VOUQ3Mk5sQ01waVlteE5RTUVF?=
 =?utf-8?B?dTk3L2VPRWVhQjlKQUxDdWhSS2FhbS9Semlodk8vYWdTN3BEN1N3UHpqVnhZ?=
 =?utf-8?B?YnRPWDlndW1YMTFXU0dldDVtbUI1a3RsanR3OFViOE1Cb0JRa0pCMXptQlN4?=
 =?utf-8?B?OHBQQy9NQW16QW9zS2dWWnNqRkxzWVNjdlFlc1MxNkVwR2g0VXM0VDduTDh0?=
 =?utf-8?B?RkhKRjRydjd6c0FIT2FyU3E1ZVlvT0tNUzZKblRjaTZ3KzMySzc2SzduaEhC?=
 =?utf-8?B?RG8zWlJ0cVJUV3dDaDJxS01tN3Exd3ZQQUw4dEhMMTRQQlRVaGNKeVJyVXI3?=
 =?utf-8?B?djkra0JsbVJjRmdLckJSbEQ0Z0tNTE5PWk1UL2t4S3k0Zjh4YkJaYlNaMWxz?=
 =?utf-8?B?NlhrRFQ2bldzbWV6YjJSODFjcnR1cUJuTDVlV290MXNrQU9QUTlZT0xmU2xv?=
 =?utf-8?B?bEFkRGpLRlYraCttS0RtSFVxQWp1Z0dtRzFsa213Q01LcEFjK1l0d21Dd2lZ?=
 =?utf-8?B?bGp2b0p4M0ZQOWdTYnZObmVFNXJuS2JkNTd2aHRLbGp1YTZRaEtOTzJMVUhk?=
 =?utf-8?B?YWpiYmsvbGZUd3A1TWlDSDZEdlliQVVuU29kNzlnR3VONVE0V1ZleHpxRGFY?=
 =?utf-8?B?a2U2Q2ZMbzB2SUl1eHB3cmY1L2FKL01ZUS9lNzZtd0IxRUpuVmdtY0M1ZGZQ?=
 =?utf-8?B?TXhvZnhHNHZQc1BGNFN1b0g3REpBNVBRSzZsZGxlSFRnMDMvQVY5R3N1OG9z?=
 =?utf-8?B?RXVSaWUrNG15YWIrSVRRSnZ4eWQxMlZNWldtSGs2d0ZyZWdYU3dNa2QvNUtn?=
 =?utf-8?B?TGswNkpCWGpObkw3dmdsYmFSL0M3aDlmcElqY0ZpMlg5T0NIVUNvaGZDWTE4?=
 =?utf-8?B?QkRLRHZocW9ydXZRNlR2bWFFV2RWOXpkbkswSXRMcmhBd2xuUC9Ga2JlRGlk?=
 =?utf-8?B?eTN3cnA2eWU2TXpNNmgyQjJtelNQWEtOa0YrMnc2dE5MOUpGdDVPa0I4ckNt?=
 =?utf-8?B?MnVSY2xEZ3ZqWDNWYVVkRERmUysxUWRjZ1ppVHNuanQwOTRQRUZrZGo5cEUr?=
 =?utf-8?B?TUJCMTZZOTk5NWM0cUlWeWRsNVlyUmlKNnJpM3c5ejlyUEdIUmk5ZDJuVmhG?=
 =?utf-8?B?TUZpOUtKdkdhMTBGSytBZHNkcGxVQStBMTBSaEE1dHpoMERUSGU0SE9iTFFq?=
 =?utf-8?B?enRraCtxMjdKY01vTmFRdnRtS0hZQVZ6TFJISk1MVHpBb09xR081dHc2YVhJ?=
 =?utf-8?B?eHpELzRCWU14REx0bEJhMEsrclh0VXNKRUUrdUV6UTg1S0IvSVBKcU5tZDhR?=
 =?utf-8?B?Wm1kMGo3Mk04YmZIblk3U00rdVdVMHNkcWs5T050eXpzSG9FZ21Mb2VTdGpS?=
 =?utf-8?B?THNkV2ZTOHBRVEhQRXk1WXFMcHMxR3VpOVJUR0VxNHV1NWpZZFluNWdjMW5V?=
 =?utf-8?B?YmdlRzhCYjRJaDBIYWJCdnNHN3lIamRoNW1DN0VuKytIV1EvdkM2cnc1Qmhh?=
 =?utf-8?B?dDBIcXExbGV0RVB2T096aERxSDFuc3NhZ2NYS1plR0FrTEtHUG1xUTlmWkZL?=
 =?utf-8?B?bGExSDI4VitzcWc5OGI3d09jYkE5L3U3aGIxenVrdjh3a0xoL3VqT0VRMGN4?=
 =?utf-8?B?UC9lSTdKQndYeTVEZFlaVTZrcGNFSExXcGRUZ1Y0cU03WFd2YVZNVXR6K0Z1?=
 =?utf-8?B?ZnMvakdib3NtR2RXZUF5bW9RU2R4VTMySHE2WmhxZXQ0VjVEYTZCeXEvbUVP?=
 =?utf-8?B?S1ZiRHdlN0tXRnVBZkg3ZHpvVG16ZlNlRURjVW5aeTY2VWxXMXdaQlJYaUd1?=
 =?utf-8?B?RDZSSmh5a1Z0YmovRm1UL0NGRFV6TmN4U2V1OTAxQjh3Ukc0Q2pCSlgvZS9D?=
 =?utf-8?Q?PGb9qciqFYzM0TgkKKQ2Z2vok62VV8=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PPFBEC4B1F8E.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?R293aDNVeEUzM2J0SEFMY2VDcHR2LzJNanZGbWo4Rm10VktEU1BOUkZtb21p?=
 =?utf-8?B?V1hUY3BuYU5OYjU3UEErTzBMbDJ4bjRXamRPMXVucWtEQmZaZ2JEUitlT3lS?=
 =?utf-8?B?QUxOTmNLcEpDQW00TkU1QnRsV0hhTEtvTkNuYkZNc0VNN1VwZEVjOG9Wd0ZY?=
 =?utf-8?B?T3lIN3R3bGdSQ0J3LzFJTTBzVGxBM2dxS0M0WkRxNzRoVmRORlFsUUVrRlpY?=
 =?utf-8?B?TGJiSGhjS3ppenBDSjExc241REtyUkV0YkJ3bHpHaTFwV2FGNzkwYWFlTVpT?=
 =?utf-8?B?R2RKcHY2ZmdCdXlvU1QwT3lKL3o2aEJzYTU0S1dUN2xWUjZrSkFiTmJSQnp6?=
 =?utf-8?B?dTE4UXR6Wk5JMXl1SFVqUjQ3M1I3UU53enRIWXRwVklueEVFUzNLZk40MlVV?=
 =?utf-8?B?Nm1jNGRrZDg4RU5vU2tDZTd1MHkxanhXQkNONHlkeXZpVk9OUTNzWitCdVF2?=
 =?utf-8?B?TzV2U1JnZVF4UVBCYkY5TnpmYTlaZ3dzNjB0Wk92cXUrQm1YUXVSWkJVcW1G?=
 =?utf-8?B?SjlXU1pROHRFcnYrZW81WDc5MjR3OThwZk1kSEVSQnJkbVp1bDhlVXlzYSsz?=
 =?utf-8?B?cFIvK1RtQlgvbVo1c09LWEJsZ09CVkt3M3ZEUUllUEZSejlCbHg5VVlFL1hF?=
 =?utf-8?B?cFQwTUxPcWJteENhVUY1djZMaFBGbWJDUk5XRmdzbFVWZWhkYkFhRWJ3dEx0?=
 =?utf-8?B?aGxYV09GTDRxcHNyVkpuekVXdW15cWluNFZBODVkODNEbGJKdlc3bktVMnJ5?=
 =?utf-8?B?NXptN3RFRlFEd2NYRjFyZFIyZW1ZSkc5cnR3WE5BckhPNWFIWXdwNXppT1B0?=
 =?utf-8?B?Z1VVMTc5alJhQjF1d3hWRlJ5d0JFY2RodmVIb1ByRzdVWXdUV3BSVkJjdXlx?=
 =?utf-8?B?ZEVPOXA2U0RFRDN1UGNHcmpkYTI4WXdTcktmYVFESEtSL3l5SkdxNXUwVkhT?=
 =?utf-8?B?WXhrbjQ1YmExSksrek05SnVpbzRtalo4eXVVZStvOFUvMmgwU3lobVh4Z3Az?=
 =?utf-8?B?eVhrKzlJb1hGOHhYNDFUZFhGVXdtRFBGVXRKenREc0JRKzk5a0Fpa3g0TXh3?=
 =?utf-8?B?eWtDbSt0UDc3ZHYvZjJldWxNaHV6NmxCT2kyQlIrMWI1TWtidDJSTDlRUExN?=
 =?utf-8?B?MWptUGxlN0FONlBSM2NxanU0QlliTjVwNWRRTlVNSUlpZmtsZHdQZlJKR3ha?=
 =?utf-8?B?NHRJcWdGalBjN2hRSnQ1TXRHYVBhbitrTDY3YlZodFI3dW40QTFqS0dMZklo?=
 =?utf-8?B?ZitOTXkzOW5RdHZOS3kzWHZDMjhCNkwzM2didUwrUWdyVTU1M21SdGQreG1F?=
 =?utf-8?B?d2w1bEZFeTJWcjRaOTBkT1NzU1NlMHN2ZEFRUkxiQlRSQVFjOUJSdkdqUytt?=
 =?utf-8?B?MFlYSGE4TjJyejEwODN5RW9qNnRrYU5pdkQyN0ZXQUY5RWlYTy85bUh3dy83?=
 =?utf-8?B?L29aeTB4SE5Ya2EzdHcyYktHTXROYmhzVGpraG43dmFiWHlDQ3BueElGTFVG?=
 =?utf-8?B?YjJRK2pULzFqUWdTcno5ejFZeHlrZ1RyVzc1SHZNeUE3RXRIekRLem9wNEdH?=
 =?utf-8?B?aUJIRTlzWTZLNFZtaVNaejBUWkR3cEFXK3d6UEdmYy9Sekl2MnNGelRLZGVG?=
 =?utf-8?B?RjA3OXlxQkdDaGtmNG5MWGhORWsvNFFUMTJvUm0xbVltZ1pKMDFXbjJUQW1R?=
 =?utf-8?B?aTZZMExVUzI2TnM1eUFRSzRoOS9uSFZSMzFiYnQ2MWt4eHBHbkNvM0s3czYr?=
 =?utf-8?B?clovaGFhaE1vZnJyc01MQURjaUxkNUY5Y01vcnNlZ2F6c2xKc3FDUmw4R1Fw?=
 =?utf-8?B?QmV5SURVWm95M3l4Y0pzemR2OExicUkrbUhoVFBaeHpHZ1MwdXo3d1Y3ZXBJ?=
 =?utf-8?B?WXpaRWUyRjBiQUV4QTh1dmU3Z0pVTlZMellxS0hZUDdtMkdVRDVzaXJ4eTB3?=
 =?utf-8?B?Vzl3MkprZ1JaaGNnNDJJQ1ltTUQ3NTlVQUlrcmJOSjN2RDhaWUlSYitiRW1x?=
 =?utf-8?B?RnNsR1ZEZWlyeVZxaHo3WFFkYk9Ba3ZkWkIxVGYxUjNjbmFQMFNNdzdOZ21Z?=
 =?utf-8?B?a0hrM0p3Y2dNNk4zVHgwSmpwci9TSWRHTDNJeUthSGJ0K0Z2NlVtQ2llN3BJ?=
 =?utf-8?Q?xBdE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C244463E1658FD48B00A8434CF719A5F@namprd18.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b9e1beff-0894-4efd-b3a9-08ddaf8c59b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2025 23:52:29.1585
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B0+vKhJyx5QHXJynS0GXPFWaUqYUIO/hpy6WLT5NQITXj986NboSD8eEyqEIhDc2VW1ip+cAeZz6gRdp6PAd5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR18MB4512

VGhhbmsgeW91wqBLcnp5c3p0b2YgZm9yIHJldmlldy4NCg0KT24gNi8xNS8yMDI1IDExOjEwIFBN
LCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOg0KPiBPbiAxNi8wNi8yMDI1IDA2OjMxLCBIYXJz
aGl0IFNoYWggd3JvdGU6DQo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9NYWtl
ZmlsZSBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvTWFrZWZpbGUNCj4+DQo+PiArZHRiLSQoQ09ORklH
X0FSQ0hfQVhJQURPKSArPSBheDMwMDBfZXZrLmR0Yg0KPiBUaGVyZSBpcyBubyBzdWNoIENPTkZJ
RyBzeW1ib2wuDQoNCg0KQWdyZWUuIEkgd2lsbCBrZWVwIEtjb25maWcgb2YgdGhlIEFSQ0hfQVhJ
QURPIGJlZm9yZSB0aGlzIHBhdGNoIChhbmQgDQplbmFibGUgaW4gZGVmY29uZmlnIGluIHNlcGFy
YXRlIHBhdGNoKQ0KDQo+DQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6dG9mDQoNClJlZ2FyZHMs
DQoNCkhhcnNoaXQuDQoNCg==

