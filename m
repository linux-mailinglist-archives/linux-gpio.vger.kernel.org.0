Return-Path: <linux-gpio+bounces-25039-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D84B39416
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Aug 2025 08:47:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 17EDD7C4562
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Aug 2025 06:46:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21307292B2E;
	Thu, 28 Aug 2025 06:44:24 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023090.outbound.protection.outlook.com [40.107.44.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42ED82874F6;
	Thu, 28 Aug 2025 06:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.90
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756363463; cv=fail; b=FZ2XrTlhRKiPCZEeMvERNWIVNbyJoMkhyQV4k3CJkPmlU1fSAwtL1FQm09GlZ5Nct91qnfFF1ScpjI5b+TOkYl4B3hmlusd249KGgEQd/GPjPBzQ5cdTXxBGjrmwyzzgEDxNpXGE6xdZN4oI2oEOYohPrOYB5AUTYIuSOOFsIeY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756363463; c=relaxed/simple;
	bh=CwYCLOEGwcI18SvHoOqRa1uimOMteIUv6xbGv7g5pOY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nF0kB3+UFly4THsBSNFFJW/o2kV6+OI/lqDqvMbIoUUuxFldxjR8kDLu7usN0C9IE+4P2AruFigNp2Dz7bKkfQ1A5eQWc63wKdBKbr4SmWnZ6BAPoUeuADY/fnOmaMYlOeax65+goLRlh6vBS/lvLNE2A82N6HGyTjFz6DDINOE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.44.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wGjV8FbkBmrKNfXrmeWoxmjaGLSpF1V+kaJ88HX1rErPwWuBYWDII3wCXt5N7YOYh3E4BiSOZ+NVm7V1oeNVldn6RxZXqYvm1weCUwJ2RQNvQBPCgHaQ0bJE/2+iF+sak/eXsw6pS8JEmJ6LmSJ2In7od0Da6AVMRe/4y53Kfg+PskdUJvV/no01Qn4hb8IGM0yvyrhWp4tI6S6eymCixD7/gF6NVdGOliZ5Vxg2pwiYnFbMjTtjq9M2Y7jvfy7Noa0ldJCptPgzZ0Zy7gNk2k3E3NMbjzqYsKFj0n47Tl7Xl0E8yrA5HIf73OxxS/vygMSbVehUicAsT6CVBkltPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CwYCLOEGwcI18SvHoOqRa1uimOMteIUv6xbGv7g5pOY=;
 b=iJjpQRqaWWrr173MR4lg/+IV07QaAg/MRB7smRk679fowVEBZQj4ZQBHiQYsfgMS17Qh4kWslzQ4uXlkPGwA9vWJu4AYDFqqcbUEToyfpbsr0CC0b8x3PTKi94ZviNdxxcwfYN0cZJxmm0705JOqxtkId1sCYS3hbci4VL0x7DgXzEKjtZiBtZSaPwF7LvoWwEWHorvdgDdJiXDCfq12ROvZxDXgmAjFiwc6X2Vvq8cmomkSatfN19/HGkTU1MTbYbW7jXOsMx0L7qouh9PP+iSxuLE52kSpjOH5FddGNff3463LTzqEbfc2+0X3EQ+lh5JvJSi5QecREgTYFlJCeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from PUZPR06MB5887.apcprd06.prod.outlook.com (2603:1096:301:117::13)
 by SI2PR06MB5412.apcprd06.prod.outlook.com (2603:1096:4:1ef::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Thu, 28 Aug
 2025 06:44:16 +0000
Received: from PUZPR06MB5887.apcprd06.prod.outlook.com
 ([fe80::611c:7f38:af2e:22d]) by PUZPR06MB5887.apcprd06.prod.outlook.com
 ([fe80::611c:7f38:af2e:22d%4]) with mapi id 15.20.9073.016; Thu, 28 Aug 2025
 06:44:16 +0000
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
 =?utf-8?B?5Zue5aSNOiBbUEFUQ0ggMS8zXSBwaW5jdHJsOiBjaXg6IEFkZCBwaW4tY29u?=
 =?utf-8?Q?troller_support_for_sky1?=
Thread-Topic: [PATCH 1/3] pinctrl: cix: Add pin-controller support for sky1
Thread-Index: AQHcFvw6qghsaPXOZ0esSR04j9LnwLR2NgmAgAFjVFA=
Date: Thu, 28 Aug 2025 06:44:16 +0000
Message-ID:
 <PUZPR06MB5887BFF27AAD64ACA625126BEF3BA@PUZPR06MB5887.apcprd06.prod.outlook.com>
References: <20250827024222.588082-1-gary.yang@cixtech.com>
 <20250827024222.588082-2-gary.yang@cixtech.com>
 <d5c85ba7-77ec-47f4-8ba1-39199e96da11@kernel.org>
In-Reply-To: <d5c85ba7-77ec-47f4-8ba1-39199e96da11@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR06MB5887:EE_|SI2PR06MB5412:EE_
x-ms-office365-filtering-correlation-id: 1166fe2b-4990-4270-8220-08dde5fe4ebe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Skc5U2QrSWp6bUlXR3pJMnlkdjRnN004aGZFblVTemtsTlJjY203Z0VGVzhH?=
 =?utf-8?B?cmhvNUNBS3N0aEZGUFgwNXdLaGN5Z3hJZG5DeElMcjJHUzZoY1NrZVVnd09q?=
 =?utf-8?B?eUpGS0k2VkQwM3h3QWF6cERVOWIrWE1adjg5U1NZdjVCQXo2TCtGWlVGSVhP?=
 =?utf-8?B?aTVNUDZ6Y25rRFJhS0lTcm9Xc1ltYkRZemJtUnNTN04xeXpwVUdnbVd1VHpH?=
 =?utf-8?B?SkdvTzJQaENkVW95WGdJTjN2MG1nMGhTR21tNC9ZbEVib1NHYzdacm1WdUlt?=
 =?utf-8?B?UWNieWFKM1AwRnkxd1I3dWFaY0FlTkdKOHBpOXBLR2lkc1Vua095dUR2U0My?=
 =?utf-8?B?SEJkV1RYR0YyQUhyZEEvUit5Q0RnTFNGUnVvTXVhVnRFNWR4eDFzOXg3eC9Y?=
 =?utf-8?B?dE9wQ2x4dTd5UWhZdkpJVk1QSXpjTDZLcWdrN1pRWk9KbTM1TUErMk1TZjlC?=
 =?utf-8?B?dGJEM0lXNDlRMExDVjkxWmhFb1NKdEFpNDdlTG9STDBNU1ArNFRMWTRSNkZs?=
 =?utf-8?B?QVF1dlNUVElXNnpCK251R2U3K0VjUHRNdmt1ZjZZc3pWMDFXYWdzVkx5REZj?=
 =?utf-8?B?bUJXemttZncycUFmZHBCWHJzaEgzSG9YeE9xSzJKVFlscHBkMXA4UERQRkwr?=
 =?utf-8?B?Z1BPVWRoMVgzM1pKYW9HbThMS0l6MGt1TFNoV05IWUxxNkNLRWZubFZGVzZJ?=
 =?utf-8?B?WVQxY2RueE03YmcwNWhrQjhHNGZkNlRBdzVCVmxSR0l6a01JUGdUWjhxMFVx?=
 =?utf-8?B?MmhTSFpIM3gzYXJzNUs0MCttNHVFRzBEa0ZkbWtrdzlwL3BUU2J6SHZTWENM?=
 =?utf-8?B?NWlZSlhJbHZrNHp2c1o3eDMyb29EYnQwcitFck1RTDM2MDZxUU5yMWxrTFdF?=
 =?utf-8?B?ekZWamNjMFBHWS9lY3RWVVRaOE8zZzk4ci8yMndCTHpOaGhuRlgrWnllSmYv?=
 =?utf-8?B?RG1wRmhWVWpLV1hxeFZhaThuaEMwQS9ZMUF4K0hpYlJQeFJWaU01NkNxa0t5?=
 =?utf-8?B?MXhSS3h0WGVXcVE0Qkd6ckpZRlVRSWYrZlE5Nis4RkZUM0J5Y280WmtldmtM?=
 =?utf-8?B?VTlScFN3MVZWRHJBSEhOUG0rUGRFeW14ZlBSVEFYbTBEdzNhQjlhZWNFdllm?=
 =?utf-8?B?Y3BzUCtOVGNpcFZnbVJwQm5MWFpyTTJLQjBoTzhrWkR1ZGU4RkdyQVg4Q0lt?=
 =?utf-8?B?NkMwZ0ZrUXBqWjgrMjMwaXplS0RTN3JjMzliZWdobDlHU1ZUdUxyQ2FhM3Vl?=
 =?utf-8?B?RWlIK1FYbDg4cnNUQ1dVMGNaUjBtc0hIek9ERUI0dUg1Qm9RUGI0SVZHVnRD?=
 =?utf-8?B?RVpHN2xlZU0vaGYvQ3NQVjVNdTFsMThGQ3VPU2hVbEF0MFNEenNDU3NUdXlV?=
 =?utf-8?B?dm1sbVZGT1ZFZFhHa2FnbUZFK1hTQXRNVU9iSHo2V1RFREFweWxTMi9pNVZt?=
 =?utf-8?B?cnV5Tnc4alFiL09jam1CeWhhT21aVVpPQzhiaVZwN3VnOU9aVWhyM2hYU3Vu?=
 =?utf-8?B?S2syTUc4WDNNVHd6VmpMYjR3ZitjSndBb294TnljaTFHdnpueFg2anpDUDdn?=
 =?utf-8?B?U2dINlhxTm84Y2VNVjNBa1NjSi96V01nWmZyNXdYQ3BBQy9lL0lubWJ2MFNj?=
 =?utf-8?B?SldmQlZidnVRNFlOQ243ZWlMZjh6b0ExUFZiNkVYWTdMKysyZURhNmFmQWJJ?=
 =?utf-8?B?bm5KNXZuWUlvSjFiTTNlbmY4ZVpNNWgraUxjQTNoS0Q0eGFQSDVXSzEwUm9y?=
 =?utf-8?B?VGJRSFFRSEhoamo1Q3VaQ3RsaUdSTVMwcWpoS01NeXlpT1lJQnh1MWVSQmdG?=
 =?utf-8?B?Wjd3cmxWb2o1YUlkTVBiTUNwQjUzYWgzd2VmTmd0SDBlOUpBMjJLNmZEMmEy?=
 =?utf-8?B?QWVxM3FDT3hWSUp4QkEwRCtCUWNEZWdvdUxLN25XMk1GTzRVaUZKVFJuRGFY?=
 =?utf-8?B?YkhpdkpaOThwOU0zWGhXVDAyQi9ZUzdRaGFQL2hRcmNwT3g4bTRaMksybSt2?=
 =?utf-8?B?OWFLNmxRMnFBPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR06MB5887.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eUtOdENsWEJ5cHdVdEdzZVVkTzRnNnAxUEM4dU16U3AwMUlwd2xUZHN5c3R1?=
 =?utf-8?B?cnpxSjluOTBNcFl3QVUraXRwWVZNTGxyMDYvWnBoUUxRLzhLQmJFbmlPcFhm?=
 =?utf-8?B?VlBoWThwL0d5MjkyNGVwb2ErNHdKajFFNENKWnlncll6RjJHYmRoZUVlaDQz?=
 =?utf-8?B?eEtpbVFjRVZ4VlZvNkVCQlB5Z2NKR09PYzZUaDF5WlJYcW5Ea1BtRHNGOG9S?=
 =?utf-8?B?bG5uUXZyUEMvTUVyNEVTRlIvR2V1S0x5Z3A1V2krSzVoRE9XR3Y5Uzk1UHBm?=
 =?utf-8?B?Tmhic1IzY2VDWHpRMHJXMnFFY2dFQVBkekZUVld1anFDK294aXZ1Ry8wcThR?=
 =?utf-8?B?YlpLUENnMjRNQmdjNVA4VGZ1eEFickszbmlsT2JqdWFoTEJQR2VXWE9OMkdF?=
 =?utf-8?B?LzhRSVl4dU5UTHIwS05heVZzWDduVVVIa3Q4OEZyQThHWk1sQXZyMjBmdDU1?=
 =?utf-8?B?WEtWMENlbElrdnNUZXVLVUlXam5ERkxXV1U0eXZFcW1yRmJxMllJMkFYYktO?=
 =?utf-8?B?TklEbVNrV3pHSzA1UWxYNXZzWXF6Q3JEN2g0MGNiMnV5Z0xocUNTNHVNbUhN?=
 =?utf-8?B?U2IybDhpUWJSOVRnbVVkWUNadTFCYVBzZWdXVlFYU0VrY1BwdE1KUk9WUVpp?=
 =?utf-8?B?WXp4ZnFhRXlVelJ3ZEl0YkhCYWNVdmdPYm9YZXB2OHA1eHREcUxwMHNzbjlh?=
 =?utf-8?B?bHR1YVQ5ZUpaYjluSFdNMTJDUmkycHp4WGdBSFBadmVodkg0Rk5uWG9xNHFn?=
 =?utf-8?B?WG54ZFBSbkpYcU1RUHdFV1lHUjUvMWJxRlY0NVo2TmJ3Ym55NTEvRmZUNWF2?=
 =?utf-8?B?UElRQUgrNmljR2lSaFQ2TkxUcnpoaEtRV2p3VGFnYSs2NzNnUFZwUVBZNnZD?=
 =?utf-8?B?TWFITnJtd0cxTndWSldlV1BIYXlDT0U2RDNhZVlxTG5lT2V5cDltLzFwTTlp?=
 =?utf-8?B?YzhuWVJMVWFWZmExWXFKZVVRY0IzbGprME5MaWlDY29tdS9Hd0JhM3VZRGt6?=
 =?utf-8?B?SlUvOUpFVitudXBXNUdQK1VlMFpVYVJQYnJ5dG85OFRjbE9aaFg3bUFFOGpI?=
 =?utf-8?B?WDk2ajdvVTZrQ0hIcU5XcURRVmVnR3N0VU9VS0c0QXZHQm5zenJzajNlVE9k?=
 =?utf-8?B?Ym1TT3AvVTIwWkVNMmhKUjRIRFlJZkkrcEk1NkYyOFFnT2xqTHEvOUcxa3FG?=
 =?utf-8?B?V1NnMTg1cnpWSlRUZGFWOUJWZURvdHRKK0tHK0xaclM1Q0tpSHZTSzFuRUM2?=
 =?utf-8?B?U2JqZVZOYXpNQlljYVZTZkZMdUNLeDAyYmtOQ1JSVXI2cm9IYTJXenRmUStk?=
 =?utf-8?B?WDVLNHNKS2hXeGREdVp1Yzlvcy9BR2E3KzVTUm9LeW53WUFmalhaNDN6N0Zt?=
 =?utf-8?B?MHZMeEVuR25RVjF3S2JxWDFJc0lnYUVXTG1GcTdGL0VyUFB4ZlUraENPYzBG?=
 =?utf-8?B?OXU3NWRWU0ovRlZ6eGhTYjNYRDZ3d0JvV1Bzdjlwa0JjVVdGSnN3TjNZa1VY?=
 =?utf-8?B?RTZtYzYyM0xXU1VWejZTMGd3ZjExY09lYUduSTUwMXpCcWJsYURTcFZtWENq?=
 =?utf-8?B?OVFaODJSazl4RFlWamJhK1lOakpNNkhVd3JjdGF2dDlTdm1TYUpzMEJzdUw1?=
 =?utf-8?B?OXJJVGlzM3BuUjcxdnB1NmJkaTBhd21JZjc5dGVGVjFQVGxmNXJKT1pNWktj?=
 =?utf-8?B?N010WFVxcXZrUzZhSlJmY1RTd3c4K2o4YlF6ZU1vbFhXOWF1bEJxS21Fa1Vx?=
 =?utf-8?B?cE9CeVE2RnloK3F1NTFNWjlXb0pWMG5NYnNTOElGTm9NT3k4MTRIMWJ4NEtY?=
 =?utf-8?B?Q3V1bXorb1dYL2RET2dNQm1XMTdwT091QTBsVGlaYzFDcmhCYVl3RldwVitD?=
 =?utf-8?B?aXdHM2xjUWk5VGdQNWhBUGNURUhnUTMxOTAzbldOcmJSd2dtSmJYYU9hQUND?=
 =?utf-8?B?N2xQZHpoV0pQK0xsalFlYmtWZmowdTdzblFkZUd4NVFrMlRNZXJDbDNXc2ZH?=
 =?utf-8?B?bXhNK0UvZnY4SW9nS1lMMWNCVnVucStMZjJrd2Q0Ry9YRVQxN3FqOEJXL2pm?=
 =?utf-8?B?V3NSNkh3dWxsOEtBQUlxaFlFYmJpNDBBUkZaQ2VTaG5zTEJ6UWlZci91WjFx?=
 =?utf-8?Q?zImUCdvfplpFSHhkTwJEQqmTx?=
Content-Type: text/plain; charset="utf-8"
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 1166fe2b-4990-4270-8220-08dde5fe4ebe
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2025 06:44:16.1737
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1lCbO6+HwKf2+yw2aqc6HdA457QuztNlvVzizYDLuwQB2a0zBZNbFUGx513Y0wstZxe2+ft5z/eGQ+FMAlze1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB5412

SGkgS3J6eXN6dG9mLA0KPiANCj4gT24gMjcvMDgvMjAyNSAwNDo0MiwgR2FyeSBZYW5nIHdyb3Rl
Og0KPiA+ICsNCj4gPiArc3RhdGljIGludCBza3kxX3BpbmN0cmxfcHJvYmVfZHQoc3RydWN0IHBs
YXRmb3JtX2RldmljZSAqcGRldiwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBz
dHJ1Y3Qgc2t5MV9waW5jdHJsICpzcGN0bCkgew0KPiA+ICsgICAgIHN0cnVjdCBkZXZpY2Vfbm9k
ZSAqbnAgPSBwZGV2LT5kZXYub2Zfbm9kZTsNCj4gPiArICAgICBzdHJ1Y3QgZGV2aWNlX25vZGUg
KmNoaWxkOw0KPiA+ICsgICAgIHN0cnVjdCBwaW5jdHJsX2RldiAqcGN0bCA9IHNwY3RsLT5wY3Rs
Ow0KPiA+ICsgICAgIHUzMiBuZnVuY3MgPSAwOw0KPiA+ICsgICAgIHUzMiBpID0gMDsNCj4gPiAr
ICAgICBib29sIGZsYXRfZnVuY3M7DQo+ID4gKw0KPiA+ICsgICAgIGlmICghbnApDQo+ID4gKyAg
ICAgICAgICAgICByZXR1cm4gLUVOT0RFVjsNCj4gPiArDQo+ID4gKyAgICAgZmxhdF9mdW5jcyA9
IHNreTFfcGluY3RybF9kdF9pc19mbGF0X2Z1bmN0aW9ucyhucCk7DQo+ID4gKyAgICAgaWYgKGZs
YXRfZnVuY3MpIHsNCj4gPiArICAgICAgICAgICAgIG5mdW5jcyA9IDE7DQo+ID4gKyAgICAgfSBl
bHNlIHsNCj4gPiArICAgICAgICAgICAgIG5mdW5jcyA9IG9mX2dldF9jaGlsZF9jb3VudChucCk7
DQo+ID4gKyAgICAgICAgICAgICBpZiAobmZ1bmNzID09IDApIHsNCj4gPiArICAgICAgICAgICAg
ICAgICAgICAgZGV2X2VycigmcGRldi0+ZGV2LCAibm8gZnVuY3Rpb25zIGRlZmluZWRcbiIpOw0K
PiA+ICsgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4gPiArICAgICAgICAg
ICAgIH0NCj4gPiArICAgICB9DQo+ID4gKw0KPiA+ICsgICAgIGZvciAoaSA9IDA7IGkgPCBuZnVu
Y3M7IGkrKykgew0KPiA+ICsgICAgICAgICAgICAgc3RydWN0IGZ1bmN0aW9uX2Rlc2MgKmZ1bmN0
aW9uOw0KPiA+ICsNCj4gPiArICAgICAgICAgICAgIGZ1bmN0aW9uID0gZGV2bV9remFsbG9jKCZw
ZGV2LT5kZXYsIHNpemVvZigqZnVuY3Rpb24pLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgR0ZQX0tFUk5FTCk7DQo+ID4gKyAgICAgICAgICAgICBpZiAoIWZ1bmN0
aW9uKQ0KPiA+ICsgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVOT01FTTsNCj4gPiArDQo+
ID4gKyAgICAgICAgICAgICBtdXRleF9sb2NrKCZzcGN0bC0+bXV0ZXgpOw0KPiA+ICsgICAgICAg
ICAgICAgcmFkaXhfdHJlZV9pbnNlcnQoJnBjdGwtPnBpbl9mdW5jdGlvbl90cmVlLCBpLCBmdW5j
dGlvbik7DQo+ID4gKyAgICAgICAgICAgICBtdXRleF91bmxvY2soJnNwY3RsLT5tdXRleCk7DQo+
ID4gKyAgICAgfQ0KPiA+ICsgICAgIHBjdGwtPm51bV9mdW5jdGlvbnMgPSBuZnVuY3M7DQo+ID4g
Kw0KPiA+ICsgICAgIHNwY3RsLT5ncm91cF9pbmRleCA9IDA7DQo+ID4gKyAgICAgaWYgKGZsYXRf
ZnVuY3MpIHsNCj4gPiArICAgICAgICAgICAgIHBjdGwtPm51bV9ncm91cHMgPSBvZl9nZXRfY2hp
bGRfY291bnQobnApOw0KPiA+ICsgICAgIH0gZWxzZSB7DQo+ID4gKyAgICAgICAgICAgICBwY3Rs
LT5udW1fZ3JvdXBzID0gMDsNCj4gPiArICAgICAgICAgICAgIGZvcl9lYWNoX2NoaWxkX29mX25v
ZGUobnAsIGNoaWxkKQ0KPiA+ICsgICAgICAgICAgICAgICAgICAgICBwY3RsLT5udW1fZ3JvdXBz
ICs9IG9mX2dldF9jaGlsZF9jb3VudChjaGlsZCk7DQo+ID4gKyAgICAgfQ0KPiA+ICsNCj4gPiAr
ICAgICBpZiAoZmxhdF9mdW5jcykgew0KPiA+ICsgICAgICAgICAgICAgc2t5MV9waW5jdHJsX3Bh
cnNlX2Z1bmN0aW9ucyhucCwgc3BjdGwsIDApOw0KPiA+ICsgICAgIH0gZWxzZSB7DQo+ID4gKyAg
ICAgICAgICAgICBpID0gMDsNCj4gPiArICAgICAgICAgICAgIGZvcl9lYWNoX2NoaWxkX29mX25v
ZGUobnAsIGNoaWxkKQ0KPiA+ICsgICAgICAgICAgICAgICAgICAgICBza3kxX3BpbmN0cmxfcGFy
c2VfZnVuY3Rpb25zKGNoaWxkLCBzcGN0bCwgaSsrKTsNCj4gPiArICAgICB9DQo+ID4gKw0KPiA+
ICsgICAgIHJldHVybiAwOw0KPiA+ICt9DQo+ID4gKw0KPiA+ICtpbnQgc2t5MV9iYXNlX3BpbmN0
cmxfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldiwNCj4gPiArICAgICAgICAgICAg
ICAgICAgIGNvbnN0IHN0cnVjdCBza3kxX3BpbmN0cmxfc29jX2luZm8gKmluZm8pIHsNCj4gPiAr
ICAgICBzdHJ1Y3QgcGluY3RybF9kZXNjICpza3kxX3BpbmN0cmxfZGVzYzsNCj4gPiArICAgICBz
dHJ1Y3Qgc2t5MV9waW5jdHJsICpzcGN0bDsNCj4gPiArICAgICBpbnQgcmV0LCBpOw0KPiA+ICsN
Cj4gPiArICAgICBpZiAoIWluZm8gfHwgIWluZm8tPnBpbnMgfHwgIWluZm8tPm5waW5zKSB7DQo+
ID4gKyAgICAgICAgICAgICBkZXZfZXJyKCZwZGV2LT5kZXYsICJ3cm9uZyBwaW5jdHJsIGluZm9c
biIpOw0KPiA+ICsgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+ID4gKyAgICAgfQ0KPiA+
ICsNCj4gPiArICAgICAvKiBDcmVhdGUgc3RhdGUgaG9sZGVycyBldGMgZm9yIHRoaXMgZHJpdmVy
ICovDQo+ID4gKyAgICAgc3BjdGwgPSBkZXZtX2t6YWxsb2MoJnBkZXYtPmRldiwgc2l6ZW9mKCpz
cGN0bCksIEdGUF9LRVJORUwpOw0KPiA+ICsgICAgIGlmICghc3BjdGwpDQo+ID4gKyAgICAgICAg
ICAgICByZXR1cm4gLUVOT01FTTsNCj4gPiArDQo+ID4gKyAgICAgc3BjdGwtPnBpbl9yZWdzID0g
ZGV2bV9rbWFsbG9jX2FycmF5KCZwZGV2LT5kZXYsIGluZm8tPm5waW5zLA0KPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNpemVvZigqc3BjdGwtPnBpbl9yZWdz
KSwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBHRlBfS0VS
TkVMKTsNCj4gPiArICAgICBpZiAoIXNwY3RsLT5waW5fcmVncykNCj4gPiArICAgICAgICAgICAg
IHJldHVybiAtRU5PTUVNOw0KPiA+ICsNCj4gPiArICAgICBmb3IgKGkgPSAwOyBpIDwgaW5mby0+
bnBpbnM7IGkrKykNCj4gPiArICAgICAgICAgICAgIHNwY3RsLT5waW5fcmVnc1tpXSA9IC0xOw0K
PiA+ICsNCj4gPiArICAgICBzcGN0bC0+YmFzZSA9IGRldm1fcGxhdGZvcm1faW9yZW1hcF9yZXNv
dXJjZShwZGV2LCAwKTsNCj4gPiArICAgICBpZiAoSVNfRVJSKHNwY3RsLT5iYXNlKSkNCj4gPiAr
ICAgICAgICAgICAgIHJldHVybiBQVFJfRVJSKHNwY3RsLT5iYXNlKTsNCj4gPiArDQo+ID4gKyAg
ICAgc2t5MV9waW5jdHJsX2Rlc2MgPSBkZXZtX2t6YWxsb2MoJnBkZXYtPmRldiwNCj4gc2l6ZW9m
KCpza3kxX3BpbmN0cmxfZGVzYyksDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBHRlBfS0VSTkVMKTsNCj4gPiArICAgICBpZiAoIXNreTFfcGluY3RybF9kZXNjKQ0K
PiA+ICsgICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07DQo+ID4gKw0KPiA+ICsgICAgIHNreTFf
cGluY3RybF9kZXNjLT5uYW1lID0gZGV2X25hbWUoJnBkZXYtPmRldik7DQo+ID4gKyAgICAgc2t5
MV9waW5jdHJsX2Rlc2MtPnBpbnMgPSBpbmZvLT5waW5zOw0KPiA+ICsgICAgIHNreTFfcGluY3Ry
bF9kZXNjLT5ucGlucyA9IGluZm8tPm5waW5zOw0KPiA+ICsgICAgIHNreTFfcGluY3RybF9kZXNj
LT5wY3Rsb3BzID0gJnNreTFfcGN0cmxfb3BzOw0KPiA+ICsgICAgIHNreTFfcGluY3RybF9kZXNj
LT5wbXhvcHMgPSAmc2t5MV9wbXhfb3BzOw0KPiA+ICsgICAgIHNreTFfcGluY3RybF9kZXNjLT5j
b25mb3BzID0gJnNreTFfcGluY29uZl9vcHM7DQo+ID4gKyAgICAgc2t5MV9waW5jdHJsX2Rlc2Mt
Pm93bmVyID0gVEhJU19NT0RVTEU7DQo+ID4gKw0KPiA+ICsgICAgIG11dGV4X2luaXQoJnNwY3Rs
LT5tdXRleCk7DQo+ID4gKw0KPiA+ICsgICAgIHNwY3RsLT5pbmZvID0gaW5mbzsNCj4gPiArICAg
ICBzcGN0bC0+ZGV2ID0gJnBkZXYtPmRldjsNCj4gPiArICAgICBwbGF0Zm9ybV9zZXRfZHJ2ZGF0
YShwZGV2LCBzcGN0bCk7DQo+ID4gKyAgICAgcmV0ID0gZGV2bV9waW5jdHJsX3JlZ2lzdGVyX2Fu
ZF9pbml0KCZwZGV2LT5kZXYsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHNreTFfcGluY3RybF9kZXNjLCBzcGN0bCwNCj4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgJnNwY3RsLT5wY3RsKTsNCj4gPiArICAgICBpZiAo
cmV0KSB7DQo+ID4gKyAgICAgICAgICAgICBkZXZfZXJyKCZwZGV2LT5kZXYsICJjb3VsZCBub3Qg
cmVnaXN0ZXIgU0tZMSBwaW5jdHJsDQo+IGRyaXZlclxuIik7DQo+ID4gKyAgICAgICAgICAgICBy
ZXR1cm4gcmV0Ow0KPiA+ICsgICAgIH0NCj4gPiArDQo+ID4gKyAgICAgcmV0ID0gc2t5MV9waW5j
dHJsX3Byb2JlX2R0KHBkZXYsIHNwY3RsKTsNCj4gPiArDQo+IA0KPiBObyBibGFuayBsaW5lIGhl
cmUuDQoNCk9LLCB3ZSB3aWxsIGRlbGV0ZSB0aGlzIGJsYW5rIGxpbmUgbmV4dCB2ZXJzaW9uDQoN
Cj4gDQo+ID4gKyAgICAgaWYgKHJldCkgew0KPiA+ICsgICAgICAgICAgICAgZGV2X2VycigmcGRl
di0+ZGV2LCAiZmFpbCB0byBwcm9iZSBkdCBwcm9wZXJ0aWVzXG4iKTsNCj4gDQo+IFlvdSBhcmUg
cHJpbnRpbmcgc2FtZSBlcnJvciB0d2ljZS4gRHJvcCB0aGlzIGFuZCBqdXN0IGhhbmRsZSBlcnJv
ciBwcmludGluZyBpbg0KPiBza3kxX3BpbmN0cmxfcHJvYmVfZHQoKS4NCj4gRXNwZWNpYWxseSB0
aGF0IHlvdSBub3cgcHJpbnQgZXJyb3JzIG9uIEVOT01FTS4NCj4gDQoNClNvcnJ5LCB0aGlzIHBy
aW50IG1lc3NhZ2UgaXMgb25seSBvbmNlLCBub3QgdHdpY2UsIHBsZWFzZSBnaXZlIG1vcmUgaW5m
b3JtYXRpb24NCg0KPiA+ICsgICAgICAgICAgICAgcmV0dXJuIHJldDsNCj4gPiArICAgICB9DQo+
ID4gKw0KPiA+ICsgICAgIHBpbmN0cmxfcHJvdmlkZV9kdW1taWVzKCk7DQo+ID4gKyAgICAgZGV2
X2luZm8oJnBkZXYtPmRldiwgImluaXRpYWxpemVkIFNLWTEgcGluY3RybCBkcml2ZXJcbiIpOw0K
PiANCj4gDQo+IE5vLCBwbGVhc2UgZHJvcC4gRHJpdmVycyBzaG91bGQgYmUgc2lsZW50IG9uIHN1
Y2Nlc3MuDQo+IA0KDQpPaywgcmVwbGFjZSBkZXZfaW5mbyB3aXRoIGRldl9kYmcgbmV4dCB2ZXJz
aW9uDQoNCj4gPiArDQo+ID4gKyAgICAgcmV0dXJuIHBpbmN0cmxfZW5hYmxlKHNwY3RsLT5wY3Rs
KTsgfQ0KPiA+ICtFWFBPUlRfU1lNQk9MX0dQTChza3kxX2Jhc2VfcGluY3RybF9wcm9iZSk7DQo+
ID4gKw0KPiANCj4gDQo+IA0KPiAuLg0KPiANCj4gPiArDQo+ID4gK3N0YXRpYyBzdHJ1Y3QgcGxh
dGZvcm1fZHJpdmVyIHNreTFfcGluY3RybF9kcml2ZXIgPSB7DQo+ID4gKyAgICAgLmRyaXZlciA9
IHsNCj4gPiArICAgICAgICAgICAgIC5uYW1lID0gInNreTEtcGluY3RybCIsDQo+ID4gKyAgICAg
ICAgICAgICAub2ZfbWF0Y2hfdGFibGUgPSBvZl9tYXRjaF9wdHIoc2t5MV9waW5jdHJsX29mX21h
dGNoKSwNCj4gDQo+IA0KPiBZb3UgaGF2ZSBhIHdhcm5pbmcgaGVyZSAtIHBsZWFzZSBkcm9wIG9m
X21hdGNoX3B0ci4NCj4gDQoNCldlIHdpbGwgZGVsZXRlIGl0IG9uIG5leHQgdmVyc2lvbg0KDQo+
ID4gKyAgICAgICAgICAgICAucG0gPSAmc2t5MV9waW5jdHJsX3BtX29wcywNCj4gPiArICAgICB9
LA0KPiA+ICsgICAgIC5wcm9iZSA9IHNreTFfcGluY3RybF9wcm9iZSwNCj4gPiArfTsNCj4gPiAr
DQo+ID4gK3N0YXRpYyBpbnQgX19pbml0IHNreTFfcGluY3RybF9pbml0KHZvaWQpIHsNCj4gPiAr
ICAgICByZXR1cm4gcGxhdGZvcm1fZHJpdmVyX3JlZ2lzdGVyKCZza3kxX3BpbmN0cmxfZHJpdmVy
KTsNCj4gPiArfQ0KPiA+ICthcmNoX2luaXRjYWxsKHNreTFfcGluY3RybF9pbml0KTsNCj4gPiAr
DQo+ID4gK01PRFVMRV9BVVRIT1IoIkplcnJ5IFpodSA8SmVycnkuWmh1QGNpeHRlY2guY29tPiIp
Ow0KPiA+ICtNT0RVTEVfREVTQ1JJUFRJT04oIkNpeCBTa3kxIHBpbmN0cmwgZHJpdmVyIik7IE1P
RFVMRV9MSUNFTlNFKCJHUEwiKTsNCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9waW5jdHJsL2Np
eC9waW5jdHJsLXNreTEuaA0KPiA+IGIvZHJpdmVycy9waW5jdHJsL2NpeC9waW5jdHJsLXNreTEu
aA0KPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi4wOWIy
NWRiYjZkYjMNCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIvZHJpdmVycy9waW5jdHJsL2Np
eC9waW5jdHJsLXNreTEuaA0KPiA+IEBAIC0wLDAgKzEsNTUgQEANCj4gPiArLyogU1BEWC1MaWNl
bnNlLUlkZW50aWZpZXI6IEdQTC0yLjArICovDQo+ID4gKy8qDQo+ID4gKyAqIEF1dGhvcjogSmVy
cnkgWmh1IDxKZXJyeS5aaHVAY2l4dGVjaC5jb20+ICAqLw0KPiA+ICsNCj4gPiArI2lmbmRlZiBf
X0RSSVZFUlNfUElOQ1RSTF9TS1kxX0gNCj4gPiArI2RlZmluZSBfX0RSSVZFUlNfUElOQ1RSTF9T
S1kxX0gNCj4gPiArDQo+ID4gKyNpbmNsdWRlIDxsaW51eC9waW5jdHJsL3BpbmNvbmYtZ2VuZXJp
Yy5oPiAjaW5jbHVkZQ0KPiA+ICs8bGludXgvcGluY3RybC9waW5tdXguaD4NCj4gDQo+IEFyZSB5
b3Ugc3VyZSB5b3UgdXNlIGJvdGggaGVhZGVycyBpbiB0aGlzIGhlYWRlcj8NCj4gDQoNCldlIHdp
bGwgZGVsZXRlIHRoZW0gb24gbmV4dCB2ZXJzaW9uDQoNCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5
c3p0b2YNCg0KQmVzdCB3aXNoZXMNCkdhcnkNCg0K

