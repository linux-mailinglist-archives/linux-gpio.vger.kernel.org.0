Return-Path: <linux-gpio+bounces-25047-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 67711B3979A
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Aug 2025 10:58:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 407F01C27C7D
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Aug 2025 08:58:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 102302ED871;
	Thu, 28 Aug 2025 08:58:12 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022118.outbound.protection.outlook.com [52.101.126.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1460B2EB840;
	Thu, 28 Aug 2025 08:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.118
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756371491; cv=fail; b=CK1cmcjoDwF+lNLxgdUrY7xvwO5W2fn820vAAqo4to0MAyKlI4WOe4z58+qA7lVifc2Yg7XWJjm0CCgMfF6PT5jakpRE+NlxJSI6AQ4jWksSlnSceQn1blwf0ETHoiw+4B1cBbjCHILyNCtahIYYVFIDGuqO7e5aRw7u+KxUpZw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756371491; c=relaxed/simple;
	bh=Qg7HF9dyQCZe6HLst+i2LokrqfS+NDELxaMbjVgdKDI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DNC2KpgFGO97qCubW16VbKmls2e8H1UbATbJPKMcN38kx41zfihCAAAZZT8sHy5Eo1PGvrIW8+8En54HDZyFEq3zPP60JmTIdfcBykljI+wynpkq7sm1dBYAIqNCPtY7VThyKoskp/t/GlHsbkowppHyQ9Hrt0EOzwvMXMZSq4g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.126.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Erev14Jha1sO1w9jOjwA9xZXBu7FYSvO6Cicq21wRuLZQbigHSFaYeYsY73Xz5rNtG0EcQzZc67bDJ3201EOxDXioZmSHk02yhh9xDYJ2nWWYRa3mrPV+P7syzMCnlT9QwvYgWASoWvjmSMf7Gx0kHK6lbpdwvDK7j9ov/AkoNolU4WNsQJFDrlpmofdsFEyhcuH14SJWHbGq/Z4hgwhekyPARNkJP/EF+BIb5QSpMbeyH8KCpucoH4+Xx796+tautH3vQeJB+8/QTsjL7ZRkVM/jDlI3uAAFoMoZuk53bDcorEmITNqrO1w7N4qphkxiF3G7xYs9m4oRgrx1V/LBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qg7HF9dyQCZe6HLst+i2LokrqfS+NDELxaMbjVgdKDI=;
 b=vECmxJmene/bxQ2LVeWdtzA03rd4UW+ub7BhwCrci5M9JnU8Culh4MW9u7wkGP26DMO3wiFmYNW9Cefaibhsmi5ljre/xRNPguHlxy6OPwYag7Kwk0ti+QOSfXqDiwyFcqDRTX3kJb0e+5fRyFC7J+vRFPBJxOSgFF3pIPqNDjDnyWnEaYBoXI5uRn4XqlIs2iJNlSaAg5KUx+CuUAcYJ56TxXUNotm7E0oHlnfHaPmDwtgZ/VolasanXX1/p5d3fXleOuoPvxrdvDz+k0GWihTNjk18GeAGiA5za3vpAh3IXgP70f57PX89gySGktZGdkAF6j0qfdqgZN8EQ5+JRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from PUZPR06MB5887.apcprd06.prod.outlook.com (2603:1096:301:117::13)
 by SEZPR06MB5165.apcprd06.prod.outlook.com (2603:1096:101:4c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.16; Thu, 28 Aug
 2025 08:58:04 +0000
Received: from PUZPR06MB5887.apcprd06.prod.outlook.com
 ([fe80::611c:7f38:af2e:22d]) by PUZPR06MB5887.apcprd06.prod.outlook.com
 ([fe80::611c:7f38:af2e:22d%4]) with mapi id 15.20.9073.016; Thu, 28 Aug 2025
 08:58:04 +0000
From: Gary Yang <gary.yang@cixtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "linus.walleij@linaro.org"
	<linus.walleij@linaro.org>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>
CC: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	cix-kernel-upstream <cix-kernel-upstream@cixtech.com>
Subject:
 =?gb2312?B?u9i4tDogu9i4tDogW1BBVENIIDIvM10gZHQtYmluZGluZ3M6IHBpbmN0cmw6?=
 =?gb2312?Q?_Add_cix,sky1-pinctrl?=
Thread-Topic:
 =?gb2312?B?u9i4tDogW1BBVENIIDIvM10gZHQtYmluZGluZ3M6IHBpbmN0cmw6IEFkZCBj?=
 =?gb2312?Q?ix,sky1-pinctrl?=
Thread-Index: AQHcFvw6Jst8WcIA+kKHV/WtkB0Of7R2KYOAgAEr/qCAAE0NgIAADDUw
Date: Thu, 28 Aug 2025 08:58:04 +0000
Message-ID:
 <PUZPR06MB5887887C93BFF42BC8417D96EF3BA@PUZPR06MB5887.apcprd06.prod.outlook.com>
References: <20250827024222.588082-1-gary.yang@cixtech.com>
 <20250827024222.588082-3-gary.yang@cixtech.com>
 <0fa7e2cb-fa0b-4f9e-84d6-a4b2b3d8a4cf@kernel.org>
 <PUZPR06MB5887D9A879D16DC6A8C8ED58EF3BA@PUZPR06MB5887.apcprd06.prod.outlook.com>
 <25283b66-4cbb-4db9-9b1e-7a4e6e3db2a1@kernel.org>
In-Reply-To: <25283b66-4cbb-4db9-9b1e-7a4e6e3db2a1@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR06MB5887:EE_|SEZPR06MB5165:EE_
x-ms-office365-filtering-correlation-id: a6c0e073-40aa-4143-5aff-08dde610ffd0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?gb2312?B?TlQrTnNHVTVpdTQxaHpOc3lmbzlQUFdaUkYvd0NKSmY4VmtlUVoybWpPREor?=
 =?gb2312?B?dHZwV1N4ZzFNQUhMdENSWUQ4Qk5VVDVxdXd6QzFjYUc1ZmFkaHVTL2NyRmlX?=
 =?gb2312?B?R1FOWExGSTc2ZUZvcjZBTkEvaUVMYTZqTjJBV3g3NG1MSGUwVEs2VVdabFBx?=
 =?gb2312?B?MGhNd2doKzY0TVZyZXBudEhWRnZGWWJmdGZRZkx0Y0drQTZoVnlHcnRnUWFW?=
 =?gb2312?B?SUExQWtuc2JkK1MveTA0NVdKSG93RGJRb1RwVVFkSjF1VXU4ZE5yZ0lPMWJG?=
 =?gb2312?B?M0RvU3RvbXpZQWJhWUkxR1ZEQVc4Vnp5aU9kS2VpOHRLSlVaU0JoWEtKNWxz?=
 =?gb2312?B?ZC9tcjJlYXdwaExJamFsZlpxYzFHbGJKOWdsMmxBdnZEZ013V1pvdWJUZXlI?=
 =?gb2312?B?SU91SFNKcWR0dFZOSVo5SFU4MHBYWk91S3FnaitiQTFxNkVRVHpzNkpMQ2dF?=
 =?gb2312?B?VXJEeTBpKy8vNmVId3ZHZTJRbHRXeFRwRmZHNHA1MkViMDVqdUdWa0kvS0tL?=
 =?gb2312?B?Q0R5SWZXbkFXNFhTaXNyK0tnSUtMMkJqZWJidzRTZE14RERZTGxCdklsMXdS?=
 =?gb2312?B?UktQQ252bjVuaUlCWjdJZ0xGQ0pNclV2djN3MUJzcU5jcGFJOVhnVmxqUEkw?=
 =?gb2312?B?bkxtT0lWeThQZjNOSFZFakIyMnpQdFlVTy9kTlJFUldzM3d5M1pLbnd4OXZU?=
 =?gb2312?B?bVdTM3BQdGYvNHNjdGJ4Y0xaeGFkTDJvcVFCODlTc2MxV3NPWVVpTjU1OVJJ?=
 =?gb2312?B?d2NQdlFHd1gwN3RFQWFuYlo1eWhnZ1E4eXBwWWE2OXNYODVXaExVSDU3VjFU?=
 =?gb2312?B?cERLRU9pOHdHcHZVUTZJWW1tWEhCaWpQZnFjMlNIc3JGRG51TGhNWGJCN1F2?=
 =?gb2312?B?c2YyaE42TjNlaGtPU3B2QXIzdlBEVjZodThGcnlnbG9OdmxRaWdBai9ZODR3?=
 =?gb2312?B?VkM1ckM5TFBhd0J3K0hqUWJNRnFsRVpGL2VZOGdQQWQzN0I4b3p5VVU1cU5F?=
 =?gb2312?B?Tlg0WjYyQ2Q4c0pubTBRWXhWYm8vd0R6WGRCMjFpUEh5TlNhR0pVeXVtS0xF?=
 =?gb2312?B?bkV6T3c4M3lpckx4Q1VZZzZadzUrYUpzZzlHR2tGK2NpQzh0aGlVVmZZbFIz?=
 =?gb2312?B?SnFVdGl4TmxxZTdLVjYvNjJHUWJ3bXc0MVlNVU5iWDREUGIrS3N2TFpvcnFZ?=
 =?gb2312?B?ajlaQytZMGYraVRXYlJaTGtaaXVRbnk0Q1NSQVNHMVU1VkhmL3l6MFZoN0Jl?=
 =?gb2312?B?SFlreWR6RFdvU1JBM09OU1dOOEdsZmhhTTBPMi9RRTNFbmdZS256clNPc1Fv?=
 =?gb2312?B?cXB3MUxaaU9CcHU5YUM5azEwaFlSRVVUWE5lMk9iaHhBZ2VzSlEzaGhaK2tC?=
 =?gb2312?B?OExETUtuTnJvbDBqWmRkaDhFaXJnUzZSdTFvb0VrQjgxRGwzT1pydGJjZk1M?=
 =?gb2312?B?Y3pOUi9la0ZDYko3ZkRYSTZnUGJEM0pGbFI0dnl6eHR1TXk2cSttcnhETncz?=
 =?gb2312?B?SHFqc1l5UnpMQmxxMVd2NE1DTnlWdi9VQU1TcTc1TmxtSkU5RmZVS2pXVHdJ?=
 =?gb2312?B?b01pYlVEY3VWYWc0ZDZ1RTFFaFRjK3lrNnFKSC8wSUJaenFERG8yZWFBd3VU?=
 =?gb2312?B?VTlIdk45TTJIbEZtRDNqV1JkaWg4cW5Bb0FRN3VBT1Y2VEhvc0hTcys4V1o5?=
 =?gb2312?B?OWJOYTVnaHFaNHpha3ZaZE1QeG43UVJxK1JldFJxYUUzc1NtNG40eEFaNWZu?=
 =?gb2312?B?NjhJRlRzZnZzNFNVdmlCVVlVQkx5dTl4NytMVG5FYmhhSHovOFpROHYvVkd3?=
 =?gb2312?B?eHVPSjk3MzdybmJjVVptcnBXcm9HQVZoMVl3NEpMd1BQWk5MU1FwN280QUdW?=
 =?gb2312?B?MlVGVHlwbE50ejNnZ1p3YzJSc092RGQrY285SHNMVnpHVXV2S2NXOG1yREF5?=
 =?gb2312?Q?I2DfIUdRwfY=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR06MB5887.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?TWpxQTN5U2dpYnN2ZHR5bWwvVjVqdFJqWFhOZG5xOFRnZm9KbHVDVm5KZDZJ?=
 =?gb2312?B?U2lLbWhMYWpmMjVHSWg3dmhPV2lMMUtpYzNtWVFlOTU2a0hrWXRDd1phd0JB?=
 =?gb2312?B?NEVndnBCVlpDem4xcUNiRUhjNXcwYWE0RE1GZlZXakZGbVVsa1pXNlVJelRR?=
 =?gb2312?B?MDgwdk5UcVNBcHV1N1ppUjRzdGRzaDZwaXBsYk5kZEVsU3YydFlQSFEvcVEw?=
 =?gb2312?B?UVVKemxsTE5Rd0xqRlBSek9qV0VsNEFpaG9GOFJRNFhNNHhFMnA5Mm9EcEdy?=
 =?gb2312?B?dEFIZ3NRNzVwUnI5eGJiY29KcWJjSEJ2d1JwVzhkdFR6c0N3Y3p3WTZIeE1K?=
 =?gb2312?B?SlRKb1pvbVBQa1NObWVrZXZabkdQbyttcm9sNFc2NS9xWFJRMFJHMjc2Yldk?=
 =?gb2312?B?TGt6SktDKzNBdnhsQlNueEZBSEs1Wmkwc21tWW02WWFBbXhOejhKa0xQc3Z3?=
 =?gb2312?B?SmtRL0M4YXZXOTJtdU9IbmFKaDZhRlFaT2Q1ZjZBTzJHbnpYdnRpUnloMGtl?=
 =?gb2312?B?VWR0ZnY2bkdoOXRlN2tENGxvV1hBVkUrRlpwQ0tPbkY4cWVPYzkzZFo4dWZN?=
 =?gb2312?B?Z01vSUY4VDhzMVhsMDZzaDZtZlN5SUxEQzBBbEhYS3Z5YTVMSjE3OU5JT1hz?=
 =?gb2312?B?UjZpR2F4Q3NiSUJXc1Y1WXJJL2hhenFja3YrbEkzSnMxSENNUWhNT3hMRlFp?=
 =?gb2312?B?b0hJL3pOWll0Y2tiVVlDS1h6Z0pZNU5EcUpIODBrekhhYTBRSjNzSllOakhP?=
 =?gb2312?B?V3dhRHgvRGtESFp0OUs2TkcvamhydnNRMXZJSmlwNjNaUzFNRGNRVG51WWdm?=
 =?gb2312?B?L0hTR1hDQ0JYclFMZFk1R0psU0JMZDlxazZhdHFqTS9CYU8vSUVVbjhyaVAv?=
 =?gb2312?B?cjNTMEp0VzdTS2E3eVRyMHhjcU9ONFM3VFAvS2p5aUt5TWJ4UEFpb21PeXdT?=
 =?gb2312?B?d3ZHNlVFek9Fd3BDZmE5ZFBxVHo5eVNNNXlkL0dLSWFXTDRKNWx4Zlkrc0NG?=
 =?gb2312?B?Y01DeUlzdGU4d0JnMTA5eVVmSjlqV3E4Y2ZUVEdNOFNZYkRmRWFoRVJ6d1NS?=
 =?gb2312?B?YkRId3QrMVR6TVJ5cFh4YlJHNGpjaUl6K1MwbG5YSTJXWldKeEp0cTVDeTVP?=
 =?gb2312?B?Nk1EZ3N1V0hjbENRMExVOVRoSEVPTit4dlJXMjE5MUkzcVFMcWFtNjJud2Zx?=
 =?gb2312?B?Q3NvVlY2czVrdGhSdGdlOExNb2FEWks2ak94bEdTZ00xaG43VytHNm1PY25P?=
 =?gb2312?B?WEl0OUVVL2FhZ2JoQjRpTGowZVhDK3VkaE1NMVNGTUM2S1FMNWhmYytSamVD?=
 =?gb2312?B?dkpxOFYzYWFFNVh3RnBzWjd6aVg5Y2lJeTlKZGkwT3VaU1VaY2RaTzgrNWkx?=
 =?gb2312?B?MmEzMXc3RHBrNXFEbEZFdFc4Z0RwZUQyaXp1alVuT3JVaU94Z2lXbmhQTnRz?=
 =?gb2312?B?ZlV3Wmw2VSttbVN5Smd4ZEtlbHJxUjFBd29BVFVBWldKMDQ5YjU2VUIvcEhU?=
 =?gb2312?B?NnlzV0ZxdWZMT2lQQjV4UXkvcjcwNytoenVFYmlYb0VKK21Id2hZN2pQYzNv?=
 =?gb2312?B?emlmd3dWeTRsV3JIbE5PUmtZZkIxZmhFRmpCdG5MbkQ1eno0MnlCMGhDTEU2?=
 =?gb2312?B?YjRjR1FhVDFLb1BoKzhydjRjTnR1dWdxMVBLVStKV253elI1dEZCd3dIdjk0?=
 =?gb2312?B?QjZzT3JlMU5CTmdHclpQQ3REU2ZuTkhueEhVTjZZVTNvYWVWU0ppaTNBVEJP?=
 =?gb2312?B?eVduaGhXSDdsOTZHV29JdXdEL0J3eXZmMFZEdldtU201MkEzOVE1em5uQm5x?=
 =?gb2312?B?c0FlVnFuOXBHcVJ2NUM2eTVldFhxNmdXMnZiL0pFNjR3MnZlQVEzdWxiK0Jo?=
 =?gb2312?B?MWpPTmRYaUpjbjlyWGE1alQ3NlF2UUhJd2MvRVQwOVV3N3ovT1hleWtmM0FW?=
 =?gb2312?B?aTBjcGdDSkVvbHJNdmxmVmxMMTVPVUdzS0pHU292T0ppRlJONGUrYkZQOHNv?=
 =?gb2312?B?UGVxenZsK011dHBPdFUyQ0t3blZnZFdvUnRxRnJXWmpKQjlVZE5lanQxQXFh?=
 =?gb2312?B?UFRnUmlxRVRrTXZkMVlXM284bE1FZWxGOHZ3NXBzMWM5UFpqK3ZDRFB4L0Jl?=
 =?gb2312?Q?bXau2LmnORRVu+IWTKSXd4FZU?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5887.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6c0e073-40aa-4143-5aff-08dde610ffd0
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2025 08:58:04.1694
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: txy6qesNlK+/bLwHh94gJPlGDpaIhwnXg+CTK2ma2cslURVGi3lsjgZpA7B3FqPqijDj1poL0+X+MbI/Dn5TiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5165

SGkgS3J6eXN6dG9mLA0KDQo+IE9uIDI4LzA4LzIwMjUgMDc6MzcsIEdhcnkgWWFuZyB3cm90ZToN
Cj4gPiBIaSBLcnp5c3p0b2YsDQo+ID4NCj4gPiBUaGFua3MgZm9yIHlvdXIgY29tbWVudHMNCj4g
Pg0KPiA+Pg0KPiA+PiBPbiAyNy8wOC8yMDI1IDA0OjQyLCBHYXJ5IFlhbmcgd3JvdGU6DQo+ID4+
PiBBZGQgZHQtYmluZGluZ3MgZG9jcw0KPiA+Pg0KPiA+PiBGb3Igd2hhdD8gRGVzY3JpYmUgdGhl
IGhhcmR3YXJlIGhlcmUgaW4gb25lLCB0d28gc2VudGVuY2VzLg0KPiA+Pg0KPiA+DQo+ID4gT0ss
IHdlIHdpbGwgYWRkIHNvbWUgZGVzY3JpcHRpb24gZm9yIGl0IG5leHQgdmVyc2lvbg0KPiA+DQo+
ID4+Pg0KPiA+Pj4gU2lnbmVkLW9mZi1ieTogR2FyeSBZYW5nIDxnYXJ5LnlhbmdAY2l4dGVjaC5j
b20+DQo+ID4+PiAtLS0NCj4gPj4+ICAuLi4vYmluZGluZ3MvcGluY3RybC9jaXgsc2t5MS1waW5j
dHJsLnlhbWwgICAgfCAgNzcgKysrDQo+ID4+PiAgaW5jbHVkZS9kdC1iaW5kaW5ncy9waW5jdHJs
L3BhZHMtc2t5MS5oICAgICAgIHwgNTkyDQo+ID4+ICsrKysrKysrKysrKysrKysrKw0KPiA+Pj4g
IDIgZmlsZXMgY2hhbmdlZCwgNjY5IGluc2VydGlvbnMoKykNCj4gPj4+ICBjcmVhdGUgbW9kZSAx
MDA2NDQNCj4gPj4+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL2Np
eCxza3kxLXBpbmN0cmwueWFtbA0KPiA+Pj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2R0
LWJpbmRpbmdzL3BpbmN0cmwvcGFkcy1za3kxLmgNCj4gPj4+DQo+ID4+PiBkaWZmIC0tZ2l0DQo+
ID4+PiBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL2NpeCxza3kx
LXBpbmN0cmwueWFtbA0KPiA+Pj4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
cGluY3RybC9jaXgsc2t5MS1waW5jdHJsLnlhbWwNCj4gPj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0
DQo+ID4+PiBpbmRleCAwMDAwMDAwMDAwMDAuLjEwYTRhMjkyMTg4ZQ0KPiA+Pj4gLS0tIC9kZXYv
bnVsbA0KPiA+Pj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0
cmwvY2l4LHNreTEtcGluY3RybC55YW0NCj4gPj4+ICsrKyBsDQo+ID4+PiBAQCAtMCwwICsxLDc3
IEBADQo+ID4+PiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBC
U0QtMi1DbGF1c2UpICVZQU1MIDEuMg0KPiA+Pj4gKy0tLQ0KPiA+Pj4gKyRpZDogaHR0cDovL2Rl
dmljZXRyZWUub3JnL3NjaGVtYXMvcGluY3RybC9jaXgsc2t5MS1waW5jdHJsLnlhbWwjDQo+ID4+
PiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwj
DQo+ID4+PiArDQo+ID4+PiArdGl0bGU6IENpeCBTa3kxIFBpbiBDb250cm9sbGVyDQo+ID4+PiAr
DQo+ID4+PiArbWFpbnRhaW5lcnM6DQo+ID4+PiArICAtIEdhcnkgWWFuZyA8Z2FyeS55YW5nQGNp
eHRlY2guY29tPg0KPiA+Pj4gKw0KPiA+Pj4gK2Rlc2NyaXB0aW9uOg0KPiA+Pj4gKyAgUGxlYXNl
IHJlZmVyIHRvIHBpbmN0cmwtYmluZGluZ3MudHh0IGluIHRoaXMgZGlyZWN0b3J5IGZvciBjb21t
b24NCj4gPj4+ICsgIGJpbmRpbmcgcGFydCBhbmQgdXNhZ2UuDQo+ID4+DQo+ID4+IERyb3AgZGVz
Y3JpcHRpb24sIG5vdCBkZXNpcmVkIHJlYWxseS4NCj4gPj4NCj4gPg0KPiA+IE9rLCB0aGlzIHlh
bWwgZmlsZSBjb21lcyBmcm9tIG90aGVyIHlhbWwgZmlsZS4gSWYgbm90IG5lZWRlZCwgd2UNCj4g
PiByZW1vdmUgaXQgbmV4dCB2ZXJzaW9uDQo+ID4NCj4gPj4+ICsNCj4gPj4+ICtwcm9wZXJ0aWVz
Og0KPiA+Pj4gKyAgY29tcGF0aWJsZToNCj4gPj4+ICsgICAgZW51bToNCj4gPj4+ICsgICAgICAt
IGNpeCxza3kxLWlvbXV4Yw0KPiA+Pj4gKyAgICAgIC0gY2l4LHNreTEtaW9tdXhjLXM1DQo+ID4+
DQo+ID4+IFdoYXRzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4/IFlvdSBoYXZlIGVudGlyZSBkZXNj
cmlwdGlvbiBmaWVsZCB0bw0KPiA+PiBleHBsYWluIHRoaXMgYnV0IGluc3RlYWQgeW91IHNhaWQg
c29tZXRoaW5nIG9idmlvdXMgdGhlcmUuDQo+ID4+DQo+ID4gQ2l4IHNreTEgaGFzIHRocmVlIHBv
d2VyIHN0YXRlcy4gUzAgbWVhbnMgd29yayBzdGF0ZS4gUzMgbWVhbnMgU1RSIHN0YXRlLg0KPiBT
NSBtZWFucyBTRCBzdGF0ZS4NCj4gPg0KPiA+IFRoZSBwaW4tY29udHJvbGxlciBvbiBza3kxIGhh
cyB0d28gcG93ZXIgc3RhdGVzLiBUaGV5IGFyZSBTMCBhbmQgUzUuDQo+IA0KPiANCj4gU3RhdGUg
IT0gZGV2aWNlLiBQbGVhc2UgY3JlYXRlIGJpbmRpbmdzIGZvciBkZXZpY2VzLCBub3Qgc3RhdGVz
Lg0KPiANCg0KU29ycnksIG1heWJlIEkgZGlkbid0IGV4cGxhaW4gaXQgY29ycmVjdGx5IGJlZm9y
ZSwgYW5kIHRoZW4gbWFrZSB5b3UgbWlzdW5kZXJzdGFuZA0KDQpUaGVyZSBhcmUgdHdvIHBpbi1j
b250cm9sbGVyIG9uIHNreTEuIE9uZSBpcyB1c2VkIHVuZGVyIHMwIHN0YXRlLCBvdGhlciBpcyB1
c2VkIHVuZGVyIHM1IHN0YXRlLg0KDQpUaGV5IGFyZSB0d28gZGV2aWNlcw0KDQo+ID4NCj4gPj4+
ICsNCj4gPj4+ICsgIHJlZzoNCj4gPj4+ICsgICAgbWF4SXRlbXM6IDENCj4gPj4+ICsNCj4gPj4+
ICsjIENsaWVudCBkZXZpY2Ugc3Vibm9kZSdzIHByb3BlcnRpZXMNCj4gPj4+ICtwYXR0ZXJuUHJv
cGVydGllczoNCj4gPj4+ICsgICctcGlucyQnOg0KPiA+Pj4gKyAgICB0eXBlOiBvYmplY3QNCj4g
Pj4+ICsgICAgZGVzY3JpcHRpb246DQo+ID4+PiArICAgICAgUGluY3RybCBub2RlJ3MgY2xpZW50
IGRldmljZXMgdXNlIHN1Ym5vZGVzIGZvciBkZXNpcmVkIHBpbg0KPiA+PiBjb25maWd1cmF0aW9u
Lg0KPiA+Pj4gKyAgICAgIENsaWVudCBkZXZpY2Ugc3Vibm9kZXMgdXNlIGJlbG93IHN0YW5kYXJk
IHByb3BlcnRpZXMuDQo+ID4+PiArDQo+ID4+PiArICAgIHByb3BlcnRpZXM6DQo+ID4+PiArICAg
ICAgY2l4LHBpbnM6DQo+ID4+DQo+ID4+IE5vLCB1c2UgZ2VuZXJpYyBwcm9wZXJ0aWVzIGZyb20g
cGlubXV4IHNjaGVtYS4NCj4gPj4NCj4gPj4gWW91IHNob3VsZCBhbHNvIHJlZmVyZW5jZSBpdC4N
Cj4gPg0KPiA+IERpZCB5b3Ugc3VnZ2VzdCB1cyB0byByZWZlciB0bw0KPiBEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvcGluY3RybC9waW5jZmctbm9kZS55YW1sPw0KPiA+DQo+ID4g
TWFrZSB1cyBzdXBwb3J0IGRyaXZlLXN0cmVuZ3RoLCBiaWFzLXB1bGwtZG93biBwcm9wZXJ0aWVz
Pw0KPiANCj4gYW5kIHBpbm11eC4gVGhlcmUgaXMgYSBzdGFuZGFyZCBwaW5zIHByb3BlcnR5Lg0K
PiANCg0KT2ssIEkgc2VlLCB0cnkgb3VyIGJlc3QgdG8gc3VwcG9ydCBzdGFuZGFyZA0KDQo+IA0K
PiAuLi4NCj4gDQo+ID4+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kdC1iaW5kaW5ncy9waW5jdHJs
L3BhZHMtc2t5MS5oDQo+ID4+PiBiL2luY2x1ZGUvZHQtYmluZGluZ3MvcGluY3RybC9wYWRzLXNr
eTEuaA0KPiA+Pj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPj4+IGluZGV4IDAwMDAwMDAwMDAw
MC4uNDQ1NTBlNDEwNWIzDQo+ID4+PiAtLS0gL2Rldi9udWxsDQo+ID4+PiArKysgYi9pbmNsdWRl
L2R0LWJpbmRpbmdzL3BpbmN0cmwvcGFkcy1za3kxLmgNCj4gPj4NCj4gPj4gQmluZGluZ3MgZm9s
bG93IGNvbXBhdGlibGUgbmFtaW5nLiBTZWUgd3JpdGluZyBiaW5kaW5ncy4NCj4gPj4NCj4gPg0K
PiA+IERpZCB5b3Ugc3VnZ2VzdCByZW5hbWUgaXQgdG8gcGluY3RybC1za3kxLmggPw0KPiANCj4g
Tm8uIEkgc3VnZ2VzdCB0byBiZSBuYW1lZCBFWEFDVExZIGxpa2UgY29tcGF0aWJsZS4NCj4gDQoN
Ck9LLCBJIHNlZQ0KDQo+ID4NCj4gPj4+IEBAIC0wLDAgKzEsNTkyIEBADQo+ID4+PiArLyogU1BE
WC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlKSAqLw0K
PiA+Pj4gKy8qDQo+ID4+PiArICogQ29weXJpZ2h0IDIwMjQtMjAyNSBDaXggVGVjaG5vbG9neSBH
cm91cCBDby4sIEx0ZC4NCj4gPj4+ICsgKi8NCj4gPj4+ICsNCj4gPj4+ICsjaWZuZGVmIF9fU0tZ
MV9QQURTX0gNCj4gPj4+ICsjZGVmaW5lIF9fU0tZMV9QQURTX0gNCj4gPj4+ICsNCj4gPj4+ICsj
ZGVmaW5lIENJWF9QQURfR1BJTzAwMV9PRkZTRVQgICAgICAgICAgICAgICAgICAgICAgIDB4MA0K
PiA+Pj4gKyNkZWZpbmUgQ0lYX1BBRF9HUElPMDAyX09GRlNFVCAgICAgICAgICAgICAgICAgICAg
ICAgMHg0DQo+ID4+DQo+ID4+IE5vdCBiaW5kaW5ncy4gRHJvcCBhbGwgdGhpcy4NCj4gPj4NCj4g
Pg0KPiA+IERvIHlvdSBtZWFuIHRob3NlIG1hY3JvcyBub3QgdXNlZCBuZWVkIHRvIGRlbGV0ZT8N
Cj4gDQo+IFJlYWxseSwgd2hhdCBpcyB1bmxjZWFyIGluICJkcm9wIGFsbCB0aGlzIj8gRHJvcCBt
ZWFucyB0byByZW1vdmUuDQo+IA0KPiBZb3UgYXNrIGZvciBjb25maXJtYXRpb24gZm9yIHNvbWUg
cmVhbGx5IG9idmlvdXMgY29tbWVudHMuDQo+IA0KPiBCVFcsIGlmIHlvdSBkaXNhZ3JlZSBwcm92
aWRlIGFyZ3VtZW50cyAoaW4gdGVybXMgb2YgYmluZGluZ3MpIHdoeSB0aGVzZSBhcmUNCj4gYmlu
ZGluZ3MuDQoNClNvcnJ5LCBtYWtlIHlvdSBtaXN1bmRlcnN0YW5kIGFnYWluLiBJIGtub3cgZHJv
cCBtZWFucyByZW1vdmUuIEkgd2FudCB0byBrbm93IHdoZXRoZXIgImFsbCB0aGlzIiBtZWFuIGFs
bCBtYWNyb3MgaW4gdGhlIGZpbGUgb3Igbm90Lg0KVGhlc2UgbWFjcm9zIHdpbGwgYmUgdXNlZCBi
eSBjbGllbnQgaW4gdGhlIGR0c2kgYW5kIGR0cyBmaWxlLiBJZiByZW1vdmUgdGhlbSwgbWF5YmUg
YWRkIHRoZW0gYWdhaW4gd2hlbiB0aGV5IGFyZSB1c2VkIGluIHRoZSBmdXJ0aGVyLg0KSXQgbG9v
a3MgbGlrZSB0aGUgZmlsZSB3aGljaCBsb2NhdGUgaW5jbHVkZS9kdC1iaW5kaW5ncy9waW5jdHJs
L3BhZHMtaW14OHFtLmgNCg0KQmVzdCB3aXNoZXMNCkdhcnkNCg0K

