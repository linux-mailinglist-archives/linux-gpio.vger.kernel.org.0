Return-Path: <linux-gpio+bounces-9007-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E1595BFF1
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Aug 2024 22:51:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E567A1F248AB
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Aug 2024 20:51:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFD8517965E;
	Thu, 22 Aug 2024 20:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=genexis.eu header.i=@genexis.eu header.b="b/6WWldQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2131.outbound.protection.outlook.com [40.107.22.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E413313AA2E;
	Thu, 22 Aug 2024 20:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724359863; cv=fail; b=EmQ1DbA5sf236lV/QAk+9nUyTa+yPl3eTA9TQwn75VBOLYZ1nXXvEfTaoEYaIbUULJYjE73ehVUElhjjvcRoABaDqfxyDDR4qrwWRmdEYIxSm5wnJQ034ZFTSe7ijU840VkZC6PJgsgyPK+xcsO1cnBhmIdjb9pmbXs6K2HBDYA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724359863; c=relaxed/simple;
	bh=UetVMItMPXu+G/RB30NmyOad/KKXY9Dl92BpoZmZSRc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=s2W0W36VPVoNZ5KaQh8cbBXkFYSPIoblWAWnsOdMCW+XR0pbPyVJz1Ka/ZapmtICQBXBXYp9GINj7UMFLWhH99KlkNHNftPT87tID6nc9mLqwOMJyqK1eAc9xfj7bXiKenuo3U0NNkxJ0IlOQ//JcFCcJBZ+a+yfcURsaCX+abY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=genexis.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (1024-bit key) header.d=genexis.eu header.i=@genexis.eu header.b=b/6WWldQ; arc=fail smtp.client-ip=40.107.22.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=genexis.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bSN4xGqDEi6YrATydorlM1W2z3XUYTvsD1UWOseEIsbfzGSveZwhVRBYQS3Y9P9f5vK3dIn5EI24FaH61mrD3c32C5kzuT6j2r2yAm+sFbP37T6xCatlFXwetiK1eeNV4bEtBCtx5K+pDz1dSbo1k8WTrghE+N9LMQzpan4f05Mp6KJE2GSnhD3Aurk/stkK7G89JgDO+U8bJWMsLi5gCACUasXSzG0cJetuuIKaqBvk9AIOqjkhpHc/VeRNXRlBYXn4erak5hq8hvAUT9zeNobu71XtRhbVuQhWNhPTRpCTRcSlr63/QDsEJYuOMIMVQcfdqInVrVsFq5Jy4QBe9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gnimm2Orc5XqI8G0JhmSVw8O8mx1XbIDYsg7nPt6/44=;
 b=ZkS2H23wx/+3AmyJmTnyXmMbTXcfy6SgdGSyJJY0X9o6lzEXqSs+OjDBWZZkwrf1f2jnOWbMSJ0qvpzIs69tOW16++yvOoYWgiFyr2q0PPnSHAyvj7kgVLdV2IpcLryWCx2WHfhuDVbZD1knW+U/ba+T8YEjMtRNkDDKyw4xg56WVAMy66NnqLzlL9COWfFqHLbJBOC+EhZBynZZTfHE+Ibqgm6W0cBdgKzxO8yJ9KBVMhSc6sxCvBgnfDFbUj1pqHOXnbGaLJbZmL0XZQtyqbGxUD5w4xCa4hWoSyT8SljXZEo/WxAJqT84U6c4001bMFUVVh6rEc1xxO8qrx7ABA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=genexis.eu;
 dkim=pass header.d=genexis.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=genexis.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gnimm2Orc5XqI8G0JhmSVw8O8mx1XbIDYsg7nPt6/44=;
 b=b/6WWldQ3sG0UBOltLcqx41bihCVcL6A6KHPBIHHXW1FcMYTh/sf/ZABAqmMBtSBqNahc3B3gMN6VAxN0czZmfkpRdhPNRejtCoid/oX5eZ03m3SBEhpwcr5Zjerac0D4CWD/jKLnh96E/zt4nhFqsrqnMpgftaINJdl5oDwyP4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=genexis.eu;
Received: from AM9PR08MB6034.eurprd08.prod.outlook.com (2603:10a6:20b:2db::18)
 by AS1PR08MB7610.eurprd08.prod.outlook.com (2603:10a6:20b:475::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.16; Thu, 22 Aug
 2024 20:50:55 +0000
Received: from AM9PR08MB6034.eurprd08.prod.outlook.com
 ([fe80::9ead:b6bc:10eb:ef35]) by AM9PR08MB6034.eurprd08.prod.outlook.com
 ([fe80::9ead:b6bc:10eb:ef35%4]) with mapi id 15.20.7897.014; Thu, 22 Aug 2024
 20:50:55 +0000
Message-ID: <aef3188d-5aaf-4f6d-addf-60066065ef9b@genexis.eu>
Date: Thu, 22 Aug 2024 22:50:52 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: airoha: Add EN7581 pinctrl
 controller
To: Conor Dooley <conor@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sean Wang <sean.wang@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 upstream@airoha.com, ansuelsmth@gmail.com
References: <20240822-en7581-pinctrl-v2-0-ba1559173a7f@kernel.org>
 <20240822-en7581-pinctrl-v2-1-ba1559173a7f@kernel.org>
 <20240822-taste-deceptive-03d0ad56ae2e@spud>
Content-Language: en-US
From: Benjamin Larsson <benjamin.larsson@genexis.eu>
In-Reply-To: <20240822-taste-deceptive-03d0ad56ae2e@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GVX0EPF00014AFD.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::312) To AM9PR08MB6034.eurprd08.prod.outlook.com
 (2603:10a6:20b:2db::18)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR08MB6034:EE_|AS1PR08MB7610:EE_
X-MS-Office365-Filtering-Correlation-Id: c91f7fb2-01b9-41a6-0ee0-08dcc2ec1ddc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cjB5dmh0Z2psRUo2d0xuaHN6MnF3K3lEdmtLYy9KK200RkZYNE9oclNGK0lK?=
 =?utf-8?B?a2pYRnVxdjlMdnJRamRBWklybVRzcUJNaG05SmJzU3k3VTlnbjhzbkQ0MkZv?=
 =?utf-8?B?K3BIWllTaFFaVU04djdOTzl6UC83bHNwVjAwOVBib0hxUlhQVDZhSEUyQjM0?=
 =?utf-8?B?aUZadXpCWjVjY2dHVEpSeStEYjlVTXp3TTVXTXNEZXQ5aXB6R2VKVkY3Mmkr?=
 =?utf-8?B?cUM2NzVXUTV1dThpY0N2aS9HTFZPMEJzNmticzd3aWZyNkgvbDNSRFZid25F?=
 =?utf-8?B?ZTk0RFJON2V3VkM4Q0Q0QlVRa0RDVmx4bE9QbWJjNUlHb2xkWEtyVHNRY092?=
 =?utf-8?B?NzZhYWRPOWJtT2N1dDZYeXFpMXJWRkJpQzlRMWJoc2E3RmxMSGZ4UTVkckVj?=
 =?utf-8?B?Sit4ck5NNVZIM0dzU0tmUnVkck1BY3J1V24zS2dtK3l5SW5NRlVYWE96Z0hw?=
 =?utf-8?B?QjVtV3FGZjJDZFRJK3ZoWmw5bnJBRzFvVC9sWHdZUTBLbWwvYlA0MDBVVXQ0?=
 =?utf-8?B?L0VpbGRYdGJoakRWajlUemw3RjlCeXRldmNBK2VCV3VWWXNLcThIVFc4cDBw?=
 =?utf-8?B?VjgzenRMaUR5cHNBamMwcUo2WGZ0djFZL0dtajhkby80Q2cwd0h4Y0dweGtJ?=
 =?utf-8?B?TFIwY3ZmdGx2SHBNamg5ckFkYnBpeUhFdVZKWDNDWWZvYW5EWWN6TktmeEt0?=
 =?utf-8?B?N1BzeUxaUFlCLzQ1UTJJQ0JOcXlTWTB5N2pEZTJIRm4raGNrQUE3TzJQWnR5?=
 =?utf-8?B?a3lXT05COGVBYkZMV2g1YjVyaTFJMGlvbkNMMmZFeXR1TWtQK1BMWnVYVUE1?=
 =?utf-8?B?TVRrWDlCcC9qUElVcG4zM1E1ZFBYSXRYNHB6cHJUdlRibTEvbDV1a3QzMHB5?=
 =?utf-8?B?VDVmY0xMSVovMS9PR1QxTFRpRSszL0ZTS1VsOUhoQ2FSMVczTDFFcTZRSWQ2?=
 =?utf-8?B?UUFhOGRzMTVwY1hxbjV6MklHU2ZENURPWXFWbHlEb09oRGJLMCtDYWtpUitK?=
 =?utf-8?B?RFEwb1lUSzVIRVp4QkhOVTdWUjFJS1VmOXI0THNNTnVDREc3N212TU44QnF5?=
 =?utf-8?B?M01ndkZZdTQ2TTBUMlFzcnhYU2V3dkVNODI3a0JiUjkraXlKNFRnY1FpekNP?=
 =?utf-8?B?Ylp3MnJ1Wk5nRWdPeXcrd0hXeHcyZWhpSlI3ZFd6MWlzZkpGS0N1RDZ5TUJx?=
 =?utf-8?B?MEU3WVJkaGZXNGFRWXd5eGVSTVlEVzgyVTBuQjlrdmMvVmFEejZaVS9tQjJL?=
 =?utf-8?B?MXdqaUo1V1pTTy9LOWZsZDdFSFF1MHBaYU1oQk05OGdDMFc4NFM0SitLN05z?=
 =?utf-8?B?VGdXdnVBMzZhamxsRStidTZTQ09pMGMva2gxRHEwaEUwd2lCYitqN1pkZzVC?=
 =?utf-8?B?UXpBOHVhZWtzWFFoOE9Jd05aOU41VEtrN1RqSW1lUlFEa3FRTEpsWTVQM3hF?=
 =?utf-8?B?anVVL1djQjVkejZSU1FRS3FRM1kzM0tIcmtkVU4yOEtvc25nWWZiWWhTNEZ4?=
 =?utf-8?B?aEkxL21aMldraGlheFZicmd1QUwvdWRKVW1WVElXb0pwMlRWVnFsMFhxenN2?=
 =?utf-8?B?Z0VSWjRpWUhMVHJTd0dFVTNZL0ZhVHJyL2tGc2gxNGhQOVRUelduTW4wSVZI?=
 =?utf-8?B?MzdONXh5eWJNc2dCSjNENTJqUzhLYlhsU3ViMXVSLzU1YjlUL3ZkZWFnYnpQ?=
 =?utf-8?B?ZkpNbzl6OWcvTHY0Ny9iUUQwcjhVWkhzMEhiZDY2ZUJyWGJjUkNkTUVQWkl0?=
 =?utf-8?B?UDRRVDl5VmpKcEZQUnhWbER0bFlORHk5TnFpczBwZVpOb1dFNTFDN1VvYzhK?=
 =?utf-8?B?aDJBdnpxZXB5YlltK2V5QT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6034.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MmhZMndCRCsyeENFZCs1bEJSdnF5dENEeGEydjA1WnZwbVNyT1FKbXJwU3lG?=
 =?utf-8?B?YmY5UUlhZmU4L21GdUt4NStSYTlkQTdxZlRSQXY4ajBwYStsR2VXTWo5MnN0?=
 =?utf-8?B?NStlVU9GVm5FTzBtWUgvbHZYWEt6T1QvdUxpRHR6cStsUW0vb2VtakFxdENS?=
 =?utf-8?B?bHVJZE5RN1ZYMTA2SDhFUVpNSEZWekVRem1IWTJCYXNKOEV2aFIyaWZ0WDFk?=
 =?utf-8?B?dEZmUWdqMDY5T0RKSnVaN3IzVXFwaXFWdDdyZEtyOEJmQ051U2dYWGI4UTJC?=
 =?utf-8?B?Z3JyOW10MENZTG04Z0FKZDlhRHZaekdORGhPQ1pJeDQ1RE42QzNSTnkyVHFz?=
 =?utf-8?B?cHRTbXBxRFl6Nm05U2tta0VXdUpYZ1F1RjhhRURaVURuMExuKzloc0tHZ3Ns?=
 =?utf-8?B?cUROVk1ZZ2owTUU5RGV5QzdJUk5LV0JtY1ZwYTJCTEFlZGFVZUlTZXFyQjZ5?=
 =?utf-8?B?TW5ZNXg2cUpwNnY5Y0RYZlRGanFEZTlKd2x6dmNYNkxJNXphbGl3Q0Z2K2NV?=
 =?utf-8?B?bHBaaUpSbnJYRUt4Y1ZFMXBiZFlUY0x2SHR2ZnJNUjZwWG9sSnpIY29vOHVs?=
 =?utf-8?B?MjdnZ2FrWTFVcWs4SklSTmRHLy9OZTMzN3NTZDBVMXJNb3JKdHJtSXhrOWM5?=
 =?utf-8?B?TE9yRVZUbEhJVHlzZm9nWlZnY2FiMGtsOEtNMzI2QmY2cmhDYzZDQXh5RVdi?=
 =?utf-8?B?V1RyR0t2Z0VDcjBELzhNZ1h3RVdTWHlkY0tHZldsNUdHbDZBaEpKZ25DN2hN?=
 =?utf-8?B?cHVINkZGdmFyZFUrVnF6UXViYTNQd3QvRXFBbktXcHo4Qm4xS1Vwd3VESG84?=
 =?utf-8?B?UHZMSlYxamdtZUpzRHRGQXM4UGFydS9YdlRuSzY2QmV2YkdOakQ2ZlF1K2JI?=
 =?utf-8?B?L2lkalNqYVZmeG05dzY1THl4cXdBbmkwYTdsakliZVE0eFVsUnd2M2hWK1FE?=
 =?utf-8?B?cDJYc3p1RUU0R21xa0wwL25uRVBoN3VVZzV6YWErVUtIQW84RnFUc1dPcmxS?=
 =?utf-8?B?eGdKZkY0UGpaWDI3aXFkRC82UGpwT2NwOUZYK3A4ZkhLNVQ5Z3NrYXJqWkRn?=
 =?utf-8?B?Q1JTelF6b3NlTmhvSndtTisvcS81YnEwMlpSaGNZdXU0cm1uT2JrWGtCNE1C?=
 =?utf-8?B?a2pGb1NMdkRDWFNpY2ZRYTk1VndIeHptTkt2cFFmVk81U0FjUjFmYlRWYjd5?=
 =?utf-8?B?WW5vcVNhUEZBNUg2LzFxMUpWaHgyeU1LRHpjR0kvK2RQOVJHQVo4N3B0dkZl?=
 =?utf-8?B?aC9FM0RzRkJDZ1B0Njh5VWVuQVkyVTdpZU05WnZkdk1kZnRQYUJ0MWVWRVlu?=
 =?utf-8?B?L2gycGRuZUo0UG50c3hTNy9kU2Y0cDNLOGdRc0NmRzVlZlQ3UFZIWkdoQnky?=
 =?utf-8?B?cmVVNlVEQ0FwRlJ3TTl3cDBTcUlMQWlqSDB4N2xDV2tYaFN2OUMrZ2NKZk1N?=
 =?utf-8?B?dnROR0U1bEtrd0ZqUkZaVjJDTHp5dUo4MjE3OU1EWkg0TEdYVEVCQWRsTFUy?=
 =?utf-8?B?S0F1cFVQVit5RXRJK0dvMy9JN0VQUndwWkowbmgyUWJaQ0FjUzRCNnB5ck1k?=
 =?utf-8?B?Q1U0OFNoeEVvcGhlcW5zayt0Z05jUHh2T1Y4ZFBMSXlraFBPMEM1QktnMG5k?=
 =?utf-8?B?NVIrTGROZ1dXTHJNU0xNbFIwaU82bndDY3BjZDlwSHNyUy9OaFFVeC9kSHU2?=
 =?utf-8?B?VDZvNzZzd1dlZ2cvcGJmc2RkcFlTdG03VFlSTmxZUERMK2Via25ab05JS0tk?=
 =?utf-8?B?Y2IyeTgybHoweW91dmpZRjI4dUEvQUM0cVA4MTFpTWZ3bFhMWlFjQ0s5T0Zy?=
 =?utf-8?B?SXRFWWF2L0cxS3J4UTh6VkF3ZzFHc3lldmRPZ1NGKzFUdmhER3M0WHdML1VT?=
 =?utf-8?B?T0hxSXFLL2JRZUFiQkNITC9KN2NSWElTZHdRNHBGZStlT05PNkVKdWhJKzFO?=
 =?utf-8?B?WUJydlUrdGYveUdKZnNVWFpHaXplTm9NNDROYkMvOWp6WGp4ZnF1Z0U1bnlX?=
 =?utf-8?B?aGtydTV3NVljWGx0Vlp6MWtlaWZ3OUxBWlZzOEVTTTBmcGpaUkJEc1FqUzZF?=
 =?utf-8?B?MzlDRVpZMVJLVGJZbWEvOFZSQUFmcll5TlR0L0EyZm5VdHJOemJ6emxyV2pp?=
 =?utf-8?B?dG0rOG9pQ2J2SjA1cE1ORW04V1p3elhYajZPVlpETHNjUFhGOStFbkQ4UC9t?=
 =?utf-8?B?RVE9PQ==?=
X-OriginatorOrg: genexis.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: c91f7fb2-01b9-41a6-0ee0-08dcc2ec1ddc
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6034.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 20:50:55.0530
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jrQk4+0XewCch1HKxaZOFxRupL5kEsvPP+QVohsfCjsq+1Qfitt4EffOzJ6FF6pdZ1jzpUmvyvlA7iiciISa2eKJ62gBPiZO0Ks4fsJLtqg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7610

On 22/08/2024 18:06, Conor Dooley wrote:


Hi.

> before looking at v1:
> I would really like to see an explanation for why this is a correct
> model of the hardware as part of the commit message. To me this screams
> syscon/MFD and instead of describing this as a child of a syscon and
> using regmap to access it you're doing whatever this is...

Can you post a link to a good example dts that uses syscon/MFD ?

It is not only pinctrl, pwm and gpio that are entangled in each other. A 
good example would help with developing a proper implementation.

MvH

Benjamin Larsson


