Return-Path: <linux-gpio+bounces-19915-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A3EAB2D7C
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 04:26:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 778E717211A
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 02:26:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4022253929;
	Mon, 12 May 2025 02:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="u3L6GhY8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022129.outbound.protection.outlook.com [52.101.126.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C6CE1D86D6;
	Mon, 12 May 2025 02:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.129
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747016810; cv=fail; b=mDw3BA2ByShtKm0dH3Q8EAIeOQePCxcxc2DMj8wZHV7JdE3jCGAcR8uqRESxyczQQ/t9DLbLhpQ+95/v71rMQkPWiyzMKT1OtuVDVkKfxps5b7OKz5KbuU4tndPSkcCv7Ie9Bi4vW2ywc1Jj5ffIvLOxl4Vtv/iA4CDgrVNy4EU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747016810; c=relaxed/simple;
	bh=GSWCh+03uFzKBpW9MoayQrjOL3yGHPdfM5J8QWh0c4U=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dyWJvOhDEFQioEzpikZ0uaCaXbuAwaUC22OtisVHNpbfDFDNfXJFeUJGQp4JaFrJoAZtC3Dk0805tP9dHs6sba5DEDiI80XSvUsiObTC7eYV9XgrjHylxUFXT//ovtAD2S38hy6vW/qyWu4Tgxc452qXBgyn6mEvKobXIM2j5M4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=u3L6GhY8; arc=fail smtp.client-ip=52.101.126.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wRy/07v40muCCd6OxWQNSPUnUj7yFUu13AtESmkRL5PJ36NBOWWXuPV0Tqs7GkTqEIvWJ8OFPocZ3cLcD5/OVReiNZJvc1E9XtF1JeIBm12szjsocKptLe4WVGxItiOMrw3W+UmIatk66QfuQvihOiUJe2DA6gd8pn78J3N2Ws23RP7lFpI+1DpyCml+FHbEEjw7AYw8q1Mv1c+YykDtqB3vXrbs0K2sjZyTHZ147SwKPLpOsktd7fY2fmvsVrh5uTX89YVXo9M3xlTQVfvklqPSDPKe9GSkWl1PTnGpTZdQoW5a/daWYGMRFoKvA2irfIplHoLgUBxP7HQpahC5dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ku3lQWYAW5g101nLFlk86r++DVAn7v6/qh9jfwsRDPQ=;
 b=w+vfebR+rUxqa/Ra2mN/aArcBEfWYWlNLxwaP6K0nnwD0UcETirBLmqEbCfrFcdEgNBojAKuQSd8yPQuIuf8TvwQVQCN1rp06ZpPSwXSpTRhK7U+TQh6n3Axy+6a5sGKqr58ZeOJY/jC89O5CcA8/vvExGnKkl//bDm0ibxytJSLm2lJ+g7fWxwUYYwoLMW8/g9Jk3LTUmJmLVKlfM47dL3tvbLGW+bZgL4KsLoY+R4DMJW6BMuiTVHIToa1CMBr8kvCOMMb4Y0vsLqNEZrHcXrBmI0+QZ7xFs8vVPofnYFGhnoH/yCFgGV4YHuP3uUInEJdhqmOHOko1gYNT3Awcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ku3lQWYAW5g101nLFlk86r++DVAn7v6/qh9jfwsRDPQ=;
 b=u3L6GhY88cogv9t1fR7JSZncqQSrVj8E5pWl0kOXFUQPqE638SbzqqmQ9ycaGrOhkrLIds+WswAUdzYtp1rEVvqrKQe4xZqV9ZIRUKxqS8Knw3FN18NTK3DiXEU7ZyJbAI8MkGxQ6f4cBY0tmIPzD7rAk6244iUoHt9yK122yUwas3NL2+H94I7qXnzqnK67JqUv3DXiit0SsuqOO8B2U9PnkFS5+NqO7xHKIuZ+BYhb7xKEFOloqrMgUZg6TDrUmjpFmelLSBQsblDR16l+MvAzTjYPR29Fj/h7C8CGeyDUXl/lPknK8hBVv0P+X5uHZow6npaRu3JkfD72L6UhFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by SEYPR03MB6771.apcprd03.prod.outlook.com (2603:1096:101:8e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.26; Mon, 12 May
 2025 02:26:43 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123%7]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 02:26:43 +0000
Message-ID: <12c262c0-07a8-4266-899f-45cd42dc7cd0@amlogic.com>
Date: Mon, 12 May 2025 10:26:37 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: meson: Drop unused aml_pctl_find_group_by_name()
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
References: <20250509150114.299962-2-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <20250509150114.299962-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TY2PR04CA0024.apcprd04.prod.outlook.com
 (2603:1096:404:f6::36) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|SEYPR03MB6771:EE_
X-MS-Office365-Filtering-Correlation-Id: bbaaa2be-84a0-4570-af21-08dd90fc6f18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WGpXdTNCMmM5NWRtRGE0K21yeGNDY3NEbTBuKzkyYnR3a0VPRDdINmFzbG41?=
 =?utf-8?B?T091RFVSalJWREIyVXFNUGNRRGcwamNFeTZsTXNKWVlicHYwSUhhcXVlUGJi?=
 =?utf-8?B?YWhHK0IvUTJ0TDk0UjBVV2NvdENGTWUwTDkyeFBPQXRTTWtnVDFFQU5KTlJC?=
 =?utf-8?B?dTJRUTFuOVE4SzJaUTJFcExGeGZ0eU5FZkd5WUI0WUcxaE9DYnF0RTAxdFA5?=
 =?utf-8?B?TVJZaWRqRDcrVjRsS3I2WmpvNDFMYXozQWt4M2hIYnB0U20xdnJJQTZXcFNi?=
 =?utf-8?B?RWloQVJkRWJXcDZsR2FrMXd6eUlWN3M5YUd0S0JuWEs5UUphdCthZFJvSXMw?=
 =?utf-8?B?MTNhTURmRXdHMWFrc1lobXhkUEYxS1p5aWdSeHBkdFRxWW9WK3hKWnR4L0RJ?=
 =?utf-8?B?TUtYZUxVQ1lhZENtN05QTjRJdVdRNTg1VU9PTE84N3dGUzJmZUhHQVVRY2x3?=
 =?utf-8?B?cXY4aExPeC84QVZUMVd5bk1ReXR1cllYdlErWFpCK3hieWd4bzU2RlZqbDJR?=
 =?utf-8?B?SHpkamlES2V1VGQ1Vmx3RS9MQm91TURaNG5vWUlVQmJ3TTJFZUxPbk5EOXJt?=
 =?utf-8?B?UFUrcVI4bXhnZ0hJd2JtRTQ4Vm13YTBZZTN1WnlEUG1Na0xZTGp0L2FmMlY5?=
 =?utf-8?B?Tm1sbVpNb09qb0d0SlRsR2tvTHBLb0orSU1KTXFkQWViUFYvT1NkVEZYeU9R?=
 =?utf-8?B?Tm5UMjdHUzRCbHNMS2x6dzI3OGpJcjlJRlMzRGtIZU9DSVJLTnN5Ri90M2lK?=
 =?utf-8?B?MkdieDNuRFZXVnNKNzZpN1pKRm9aUnlpWVpWTXlaeU1Qb1NGa1RvMWxhVGJ0?=
 =?utf-8?B?WlJ4ZnhwekdaeSt0QlYvUVFRaFpFS2ludFp0VVliWU8yTGdodStZa2Z5WlFu?=
 =?utf-8?B?aUx1S3RUem1uQkU2RTZOR1RoVlhOQyt3UlREY25pYlV1cVFva3dnMjhhNDds?=
 =?utf-8?B?QnhPSytBMHJ3UExGaGx2LzBjbUloS3VNUlpURm8wY0JZN3pTSXVTVk9yejlV?=
 =?utf-8?B?WmEwemhBZkw5MnZkOW1hYkN6aSt5MnNlbTB0enZPalUyOFBBeHNNa28wTXVY?=
 =?utf-8?B?Q2kyd2dOTGM1UUI1dFlMOXE0RnYxb3J6OHRFbTI4QTBIVkgxd3Z4MGwzRXVH?=
 =?utf-8?B?VnZCQkRDcmozYk9JaVUrbkttRklnd2hFMUtGTlAyRHVuYlMvOENiSFFSaExr?=
 =?utf-8?B?aGlrTU4zWXY1YmhMT0w4b3ZvdVVQQVphOVZSZnlvcUNiVkxDY0RwNUpYSEpu?=
 =?utf-8?B?Rkc2ZjNDWXhMQnp4a0t0ZmZDSWZYL1gwQnAxWUhJdUZqeWdlSWozMDFWYzFi?=
 =?utf-8?B?Mi9nNTdEb3I3UGdDZVk4QUs3STlld1UyT055ajIrRlhxV1lCc1FXQ3M3TXBB?=
 =?utf-8?B?U0xtOGxUbVVZTEZ3RHBRNHJ0K2hQbCthcUNnZ2U5WURlbDhJdHphNlozTTdq?=
 =?utf-8?B?TCtRWFYrK2JiTG4zVDhjZFM1UlRyeS9VMDNrd3VuSCs4Q0k0Z0p2NHJJUkEw?=
 =?utf-8?B?aXNoV1pMNWFRUm1lOUFtOXA2alhTcnROZEtLWmN4bTF3ekFITjdJckRudlht?=
 =?utf-8?B?U1V4dEJoRDhkbnRFVEpIWHhRc3B4QXQzVmlFWGFzZnJ6cjZGeXg2eVdYT2x6?=
 =?utf-8?B?UE9JeXhkZGY3MTJkbGNiTWVuY0lTYXpqU0p2ejR3cFp0bHZmMzFGbDhnZ1Vh?=
 =?utf-8?B?VGFYMnVUMnpHRmd3UVI1Zmk4UXZYb2RLNmxuRGdwT01RWUlXUHNFUWZJSDZy?=
 =?utf-8?B?dkl4NjltMVpYZjZsMEJ3bzJWUWR2NHp2SkFjMHZHRENxSWxSMXU1YVFSTHNW?=
 =?utf-8?B?QnVoZTN2LzJVYnV1Uko3OHJFOUhWM1p0Zmxhc0dITHVwRU9KMTVSNE1tbjA1?=
 =?utf-8?B?a1VDOGpJRUFna0VtNERKWVZGNm1ERDYrZzdFdFQ1RnhBVFRRdk1IZUdBODdq?=
 =?utf-8?B?REY4OUlxemxKRUdpdXlreGQ1SUVWMzZ0RitXYytFemZaQmtMekI0M0pud3BW?=
 =?utf-8?B?MmVOSFB6RHpRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TElKa09ubzdWMzdwQ0VHMlhwVTJNRHk3R1ZGQXM2c29OWnRLZkxVUFo4d2VR?=
 =?utf-8?B?S1BxRU5WbTd0c1FjUnd1K3RMOVloVENQWDFFVGxMWCtCbXZOQVVubWVvSTNt?=
 =?utf-8?B?QUkvd0VYb0hRYmoxdUJOWk8rWWVjRU1wVHZ3M1NLVDcxYmJmb2huWkFKQXp0?=
 =?utf-8?B?S3g1RDZkd1k2a0NNN3dzUGhPMjVOSTZMRjFqcWhZc1FSNFA2ZDZYU3NtWFdv?=
 =?utf-8?B?aFBSMy9ibmZicDBjT2pyNXh2NFoxU2RTaTRQOHNSbnBjSHRSTE0vdFExMXNK?=
 =?utf-8?B?Z00xaXBXZ2xuSDFFNk55Y0tqWGt2cGVzWFJhaThWT2c4d3grNTU1amQwWFJF?=
 =?utf-8?B?aDF1MGhweS85cGxWdWFCa295NHplbGlGdVZzdE9Ydm1Ub3B3Uk40Uko2NUI4?=
 =?utf-8?B?UXJYWVFhN1pMMDlhRGxXajQwci9MbTRoUEw0K3RrL2puNzZITnhpd3RzcndN?=
 =?utf-8?B?UGFaV3Q3NlkzYURLb1hJMllTbzhTeXdhZ1MzRXpta0xsd2NJZW1PVEhISUVV?=
 =?utf-8?B?NHZubGNoa05rUDVZTDVMcXF1c3U3VXo1RWhRcHNveEVuRm93eG9DcVlSSU9a?=
 =?utf-8?B?VnRzQW42Y2lWMUtqSStGam1qRVF4LzczUzZMWjgwS0J4RWF6VlhqVkNJYzFT?=
 =?utf-8?B?RVRaa3g2R3lqZVNQNFFCN2dwR3FteHdkMEk5WWJjblpFTjYrV0J0VUdoOUYz?=
 =?utf-8?B?WUt6S2hPd2ZUSGlrNlJMdTN3Yk52cXZDUmlZRGRINS81bEpjM2hrMDUxLzdR?=
 =?utf-8?B?aEQzdWJWdVdiVkN0M2lpNkJOZFYvcUlhdldsT0ZOS3luc0IzWGxpWUhCZXVY?=
 =?utf-8?B?WWNmU3Z1TFJYV3B1dER1UWhKeWczZmZTcHE3bXIrQ3JsWVFuQ2RudFh2TGNv?=
 =?utf-8?B?Q0FsbkdhdUR2NzVkZXNvMWZiS1VNOVY0N0JKUWxYeWZtWHpLWHg3dk5ndTNG?=
 =?utf-8?B?TExXb0dwSUh3S1ozanpSRlFOKzNwUzF0aFRSQmJiRWMxV2FFb1BqT1pzMWZa?=
 =?utf-8?B?K1Q2ZjkwamFEcEdwUm1TVWVCbE96UE1UMVBObTNMNjJCOW5VQ1ZKaUpyNVo4?=
 =?utf-8?B?ZlhyY0FZSWNHQUxxeDRRQU1SbFJ3dWFqajUyUDExUytzbXc0SXlMcVJLU1pi?=
 =?utf-8?B?V3dtYnQrbDlZRGE1c0MrWC9BK3NRb3BTNkNrZjdFQVdJcVA3SGk0b08vWjJS?=
 =?utf-8?B?cDNyZGhvU2lpKzR5RTF1QWcxa25OMXZkRXNNc1ZzZkhSSmhuSGI4S3ZKbHZS?=
 =?utf-8?B?clFqVFNobHRNeitwdE0ybDBVdU9udTJFNnJnTGJPaWd2RXhqOFFid1E5d3Fn?=
 =?utf-8?B?cHI4c29BdHUyTk40VVFCTVVWUWhTaHhRRGdqSUl4aE0vSGNXaC9NZ0RuQXlj?=
 =?utf-8?B?bHErUG9qSlZ6Vjc5OWkzQnZZYUhjdjBVN2RLK1Q4RitZS0l5MDIxWWtDTGNG?=
 =?utf-8?B?bTN2Nmp3WDVFWG5ESXhHd0ZEbFhnQmdWSE1RcHZtWVJIQm05ek5sK0FRY1FK?=
 =?utf-8?B?UHhxS2oxQUg1c1BUZVNXQVFaRm9qOW9jSUFOTVY5NC9OZTNNLzFrWjYvOVYr?=
 =?utf-8?B?c2t6M3VNeVdlTWpqKzViQ1lGQWllSFl0OU5rSmVac1lBc3VSTWRlNTB5dlN6?=
 =?utf-8?B?MTZ3NXJpLzA5QUpJelEzallYc1NwZnN1Zm5rZ09mS2VNc0JYREtaMGplMFgw?=
 =?utf-8?B?MG1QRVh1N0puR29mTTFEUHdqQkxpazZ2MDNKNjlrRW82NUdUK2poS0FPY3ow?=
 =?utf-8?B?NmU3ZHFUWld1YkM4ZjRRelNiVEtrLzBOWDN6cHpPbU1Ob0RRcFJnTXFEMVRL?=
 =?utf-8?B?cjBTSlNyWE5MMTcrcjh6MHhQVEVoYkZyNmtLSjZmdWdTOUNyeU1PUmVoTGxp?=
 =?utf-8?B?R0Yxc0xWMXAzeXNCQ3dqcTcrL3FROXJKREJtRWozR0JrczFtTURmNXpGdTVY?=
 =?utf-8?B?d2VCRUxjd0pBQ2ZueDMxSm9wak5oVWJkUjh0U2pDUHdzVXNwS0lUMXNTTW1Y?=
 =?utf-8?B?dTZpNHRXR1h4dEhFRHpzZDFaMjlFVnp2VURMQjlUUnc1TWFpVCt3SGEwd2VE?=
 =?utf-8?B?bnZlcTJmR1IrZGw0QktIK0pmbUxKK0xsaGt2eTBLTkgxQTY1MXJZS3c3TkJ0?=
 =?utf-8?B?bkxIeVBGSFR2SzVLSmtXdmRwdXlNcDdCSjdBbTdVUVdPSXVKU0Q2bWhzRlRB?=
 =?utf-8?B?RVE9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbaaa2be-84a0-4570-af21-08dd90fc6f18
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 02:26:43.0395
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VRxm10YBOCQrlRf1iQQa/ZAknj2pNSm0a/hPzdt/Ytczq63JrxZnvERp98hPvJt7OzhGcyRzaJ2Zu+7m1jrTi9P1fhLI7Ee9L4iF6XAj+cw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB6771

Reviewed-by: Xianwei Zhao <xianwei.zhao@amlogic.com>

On 2025/5/9 23:01, Krzysztof Kozlowski wrote:
> [ EXTERNAL EMAIL ]
> 
> aml_pctl_find_group_by_name() is not used anywhere, as reported by W=1
> clang build:
> 
>    pinctrl-amlogic-a4.c:600:2: error: unused function 'aml_pctl_find_group_by_name' [-Werror,-Wunused-function]
> 
> Fixes: 6e9be3abb78c ("pinctrl: Add driver support for Amlogic SoCs")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   drivers/pinctrl/meson/pinctrl-amlogic-a4.c | 14 --------------
>   1 file changed, 14 deletions(-)
> 
> diff --git a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
> index a76f266b4b94..385cc619df13 100644
> --- a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
> +++ b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
> @@ -596,20 +596,6 @@ static int aml_get_group_pins(struct pinctrl_dev *pctldev,
>          return 0;
>   }
> 
> -static inline const struct aml_pctl_group *
> -       aml_pctl_find_group_by_name(const struct aml_pinctrl *info,
> -                                   const char *name)
> -{
> -       int i;
> -
> -       for (i = 0; i < info->ngroups; i++) {
> -               if (!strcmp(info->groups[i].name, name))
> -                       return &info->groups[i];
> -       }
> -
> -       return NULL;
> -}
> -
>   static void aml_pin_dbg_show(struct pinctrl_dev *pcdev, struct seq_file *s,
>                               unsigned int offset)
>   {
> --
> 2.45.2
> 

