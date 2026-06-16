Return-Path: <linux-gpio+bounces-38519-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BsTWCNS4MGp9WgUAu9opvQ
	(envelope-from <linux-gpio+bounces-38519-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 04:45:40 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C4C68B88E
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 04:45:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amlogic.com header.s=selector1 header.b=rp+Y+mZY;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38519-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38519-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=amlogic.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4A20530F4E16
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 02:45:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0539F3C3439;
	Tue, 16 Jun 2026 02:45:11 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022078.outbound.protection.outlook.com [52.101.126.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A00E3C277C;
	Tue, 16 Jun 2026 02:45:08 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781577910; cv=fail; b=TOpKK91eWPnIQy4NGZTayHFLDPSoXZ40WzBig6EOj+h6FSjJH2yh8L4hn1/qtWlw7muUgQCsGsViwj9mkkr9C/ADSNCg3ImjG+9W/29esLrSDNHzKidfWxNMJyBddE4gX/Ub9fq5MiJQcWjEFfHzjcXuydcp2tE1+H49LCL+3eA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781577910; c=relaxed/simple;
	bh=tHEabbbRnt7CVBkXbdK18b0pg4411g8S/mGQNgCN/G8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Nw/sR2LWqVoi6lYPqJ81h0+U1JcPyPJp3/A68yba9Edy4xCHjk51IXQlQ1jaZ6wylJRz1U+ATHzqi8zikhReZRNffRdtvOJ1LjAHcDxllGzANVWtj8Bv6qCiZBRXaPaatutdzayZvrtq1Pqz190SyRU+Hz4ckrHQ9D9/vRoSSyo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=rp+Y+mZY; arc=fail smtp.client-ip=52.101.126.78
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hRm0RfFxh1qwjAgUqIoUS7ldOyzczndi/BpBmwnzKWaqzVAZmkUyR8UbPMdGbQquzeaSX9eE6nviLknq0+grNdnW8OnN/Wqj9cptBu+TYE8x9Dj4AEHryUXKtmaoV68vpeJO9CnS7BBGnuIakuY2jsUvSb2eK+rrdxKWnuFJcIe/l6Wyi8GjWPTtOhGzkppbfn63SW3VW5R+zN7rfuk1UK4V5D37hBbDhtYTC3Vfmb3JD1ivXNDjrplyhHRc71LLK/8VWlfK1fA4HKRsIegm9jx1cUzX9SoLFTcdCm4Cp3erywwTje4DmfKB+KENyAFSNx06Yn3pbrsZEMh4CVsong==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RJ24+PBU457m5TALk9AADR+om09WbbDN59RBSnutpFQ=;
 b=d7tEbF/4n+08muDDfCHjOBPT37I4A1WT4qgYzFe+unMGNCCVNYtopvVaFthe0/mpAOAWj0Ang/ivoziXLM2v205j5byM7M+PdhO2KZvvDKchqSWFBHUbpCs1GeddwDAP+dwnFaZtPwu21aoTFzP7RFYp/LDAGD2DRZOAWvCNA7gbpL6PVTGFDZ4nfYKA0lDJHJ79y2/qNi0bIV8anC88yzUWB7n3gUIm7+GC8H6V1nINabQ42MhK8oIDs+ReKZwkx0N+hBI/QCkjYABBUf8LpjG+8ZI2pdQSPMZt+A9zoknCLPf7YIpyEX9x4nN+Z7IUqQWhLTH8qPKSMHXZkH0puQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RJ24+PBU457m5TALk9AADR+om09WbbDN59RBSnutpFQ=;
 b=rp+Y+mZY4/0IujmBRVku5adom1h4+iSeVejE/t8afAiIN0TUzxnWeqKjEzfw3lzkTi1OkQuYaD9hWmqtqm6tyzWOjrwMqu5kWDRz7DpODENAtTQXiO+oDopKIGWN/+VaSQ0RLDiWIGscAM3UQrK+s3jK8CeQSSSAo0EF/pFXu+yBlM+s6p2LjdhX9Eshrq6+vYa7pdiZLfjW0OA7qcjnatmYNJeiboTck//X45XmLYNRuJK4mcSme5npLUBRLhyyr4WExHaewUCpl8l6r3BfdVK6mxyl9mhyjCWxpT4Z0hZZ3BrdYjP6zq3fc+Rfo819OKhf6OCIqqYLOvRcCXZ96Q==
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by KL1PR03MB7939.apcprd03.prod.outlook.com (2603:1096:820:f1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Tue, 16 Jun
 2026 02:45:05 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4%3]) with mapi id 15.21.0139.009; Tue, 16 Jun 2026
 02:45:04 +0000
Message-ID: <4a37fa94-d96f-45ac-9823-5bacfb5c44ea@amlogic.com>
Date: Tue, 16 Jun 2026 10:45:00 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/2] pinctrl: Add support gpiod_to_irq
Content-Language: en-US
To: Linus Walleij <linusw@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260611-gpio-to-irq-v1-0-12201716f23f@amlogic.com>
 <CAD++jLk3YdMUSkk71rgT=taQZnEhqgMgGP0dKBPx7_5Bsxmu+g@mail.gmail.com>
 <2bb2c0e8-29e1-444b-851b-a9932f547c6a@amlogic.com>
 <CAD++jLm9+8RSbBCi-k=8S98XvVJ7taYrK=kuBp3_RqxE_bcxbg@mail.gmail.com>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <CAD++jLm9+8RSbBCi-k=8S98XvVJ7taYrK=kuBp3_RqxE_bcxbg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SEWP216CA0094.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2bf::11) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|KL1PR03MB7939:EE_
X-MS-Office365-Filtering-Correlation-Id: 93aeee47-aa10-4a77-8818-08decb5144cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|7416014|6133799003|11063799006|4143699003|5023799004|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	pq6v2adlYmBZ5VEFASsQpoWaZBcM7KucVs8wYA7YGRn3nL7jtNW7oD8dtBD5vKaEhla9FQK64StwLglP4tk2dUab4ih9YuntwbFBsslt4hYMD0Z2kCGhqHYMFfgHsI43qGsgy5fPK5iuSmr8cA8jzZbiPrVdv/c5dd4OUUdGwpwCPdZmeuCb+ymQAnuqMDUbwrjndJ3d9CyQmJx5fHTaRnwtygEK5glYR+oCiSL7wUZLdRWhMzs8vvE5VG743N5UDolIkM2Fu1GgfbDeVuUv71vl1fzyuUdGvwYMdoxZ/EJas2Lyp6V1cVPqhUl8A+ZTOst69eL/cRE+oZ1xKU72UvIhIy8pQTFwMXqndYBkbS3yNtLyOv8L0ZIW74PwdVWUEQiSnm8zILPXNeK8WVhIMs1E9iEV1suORAC0let51+Dd5lFikP2H8L79xt9u66M4/zW0nPI/CstjqLtsIGdHY8EesuXQs4VRbXO7DCI44GCcdb01GEvgOnpHkgZjfbv0ilAKIATi1ILezZBmvAkFNfGxgOfcRX2Z2Ouv4cFnMakl8enobFLT9xGvErbop6IQfDjAWeR0WUcbwSVoKVkzzr9zLlp1Mla7LKq3ikHRM8UHc02znRVp6yygzpFFloiwCBrHQnAtYpFNVx7laKZGWX3cJCmjTiF62kctSK1K/kvBoM9wnom+F/sUHnvRxugFdkAfdH5EKf+CjtYKAIbpGw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(7416014)(6133799003)(11063799006)(4143699003)(5023799004)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M3U4QW1BYlc0QnlGVG5XU2hwV2FESzVJL3BNMDIwbFAvY3RldGtZRGNmYmx5?=
 =?utf-8?B?QTdkYm1GTUxpVlFQd1Z3eUhrcm0zVEtVbVUyNWxweDJkMm1hWW9oOU9JeVo2?=
 =?utf-8?B?QU9HVFA4ZjE1VjZwQUNFWEtXeDgyN0dHaUg2VTJWTlhPU09icmV4bVlzRGZp?=
 =?utf-8?B?cXI5RXg1NjNQY3BiQ2IwWEcrTUszVlRZc1JiTUpTVkZ5MjlDeEFnUHFxYUVV?=
 =?utf-8?B?c0NKN2JFWmdzQkphU0xUa1VRWUJLRkxqV2RkRjRNZ3dYcE5sb3lNdFpNamp0?=
 =?utf-8?B?eU1mOU8wOVhWMzRVc0NOUEMxQ3BVTGxtMTkzOXlzWjlLK1FXejFtRi9GeEpz?=
 =?utf-8?B?ZVl3SkxNZTNwTVdZQkxwcFNIZWJKQTM1dCszSkFTVWlvZmh6Y3BmWGtnVnhK?=
 =?utf-8?B?MEhEYnlFWjY2UkFwTWRzU1hIV0t6ajlxenMxd04rTTNvR2xVWXFwS0twK3dO?=
 =?utf-8?B?QXhITHVTR0NuMWJucktqWnBqYit5eFBKY09FM2RoZ3M0WHNRdC9ER0RxRFV6?=
 =?utf-8?B?WU42MHpsTk1IaHYyZUpLZlk2SmxkaVZWQmZpSGQrUGE1TDBMY3o5bEU3WHVP?=
 =?utf-8?B?MXhSM1lyMU1QS0xjSko3d3VKRmRqQTNTby9kNTUyL1lvSnUrcEp1b0tvd1Ax?=
 =?utf-8?B?QXhNbVRVVmxVOWp4amtHdG5GRmFpalNIaVpiZlN3ejRyVUR0UVgyQmZJaW9B?=
 =?utf-8?B?dk1zOERTUmwrUXNReDNkQW9vakFTV2F3eHpUdFVLdWRjZEhqMWdJaFd5S1Ey?=
 =?utf-8?B?cXZNQTdkdVNhL05lSHhVY0VEWDBUYkY1dnJpUTVKaXJPcXVUUWlBVDRaTDNT?=
 =?utf-8?B?MXp2Z1hTdkFWcVI0RE9oYTFJYVZqOHlFSnM3bTlLSXp2V0RmdVhQbHlkRlR4?=
 =?utf-8?B?MkYwNUloTE5kS2REZEtuUkdpS0dZRGNDdVRJa0pPSVNUeUJycmJCbXdkeE90?=
 =?utf-8?B?Wml6MHZZejlwQ0xaSzBvZ1BqeGk2ZFEvckhTMHZjVWhlN1V2c2EwM3piN3c4?=
 =?utf-8?B?NERRZHpHbCtpMmtjdURiUmg5bmxrVU5VUkxvcTJTSDNHWUdmdFFaUFEvdVd2?=
 =?utf-8?B?T2xEUzRRZ1pUeGM1WjVvNHFKa1RXM1lXd003ZmkzT0pCOUZaVVpMRVQxUlNm?=
 =?utf-8?B?M2FkR25KU1lYUFBMS2lpMXJJckZWMFBpemREM2NFV2h2bERkcjVnTG1hRmx5?=
 =?utf-8?B?V3BuV1BiZE84eEpRYnFOeHZEZG5JOUd4L09RcHVrR3daYXFWdjI1WGJvenJO?=
 =?utf-8?B?QmlQSytBdW93WjE0VmxmaFVINlZCclF6eHFpZjBiaU9ERytiVGpoNm50R1d6?=
 =?utf-8?B?azhFTHNUdWF0eEpiYWd3b3NuNGZ6S2Q4TDhHWnU3TElhMHdxNXBHQlI0RGxw?=
 =?utf-8?B?K0djOExKTXRMTnBoLzRQMW5tMjZ1aXgxTWtwK2lMQnBDc2Z6QnZXWTFpcjNX?=
 =?utf-8?B?RjhnYk5yMGxaM2M3OGtHRG5FWHVEb2w3elMwN0pFU3NTZHpIZ09SSVkyQ2Ew?=
 =?utf-8?B?UXNCQk5FRzJxcG9KU1NiNC9NMHBISlpSazZVc1BScDlXbi9aMDZJSEt0VkVN?=
 =?utf-8?B?YVhBQnMrMUNMRXpBWUc3eW1tTGJCR0hvckRHdU44NlFEcEF5aWk2S2dQSThF?=
 =?utf-8?B?akZmNndpa1MrUDBZbzNubXRxd0ExSzNielRwZC9DQlpmWjRMUmlTbEVtNzgw?=
 =?utf-8?B?OVllbUNwSFJZOFdoajhoMVg4OFBsY0FKNzlrM2YrWTg0aTBtZHVLaEFuQkNL?=
 =?utf-8?B?TnNmTzd1MlJGNUJ0VmxoY1pRZlpOQ012Y1o0di9iODNLMzBabnRyYjdrSzFM?=
 =?utf-8?B?dTJHbmN0aHZUWHF1Y1ZsVnpxQkhZTGI5VU9pRnpDZHN2WGRodUhGY010TTJl?=
 =?utf-8?B?Y1lib2pENG9vajF3aDNFeGhUQm4ybmZZV1ExWlR6Ry9rRjlORk9XTzBoaDRX?=
 =?utf-8?B?RDZJR1F3cmtEUEdnK3BPODhqSXdFUEc5WmhPT1ZOazROK2MwZHJ6cURVdG16?=
 =?utf-8?B?OEJxNUNDRFcxamVuNWRxSG54Ykx2aWNnUmZVSWFDQzJRN041M2djWkIwbmll?=
 =?utf-8?B?YVJHV0xtQTRzcFY5THRGQmFoTmpHZWhzYUlkdEdyaFRwRlIwL0E4SUlWL2JM?=
 =?utf-8?B?TFJYSytabG9rMjVaa3VLV2tQaVl2Y2FWcXd6emJoL1V1Qzlma05MWHUxTHNL?=
 =?utf-8?B?WnlUSERQaWs4c3hDckZzUkVLU1pybFg3Nm90TTFxdjhDTjlyZmpXYjZvem84?=
 =?utf-8?B?NGs4bVZtblUzK3RPb2VVbE9nQ1M1N29ONFFweWlrMENwQ1h6VHVPNEk1NEto?=
 =?utf-8?B?NTkyUy9oTDZZVkQzRTZLbHc3ZXd5ZitVOGJnd2UwTXkyNHVicmtSdz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93aeee47-aa10-4a77-8818-08decb5144cc
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 02:45:04.1889
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7QfUSQl0p+nPV1J0sFjvDH1gVqU+iz1ggqyr7kLsP+HcAur9U1G8rtbmtHTimj8yK69pP5JGww7+EP8UgZ/OoQs5nhGM4949oivtRSe0gew=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7939
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amlogic.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[amlogic.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38519-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:martin.blumenstingl@googlemail.com,m:linux-amlogic@lists.infradead.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:martinblumenstingl@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[xianwei.zhao@amlogic.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,baylibre.com,googlemail.com,lists.infradead.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xianwei.zhao@amlogic.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[amlogic.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 76C4C68B88E

Hi Linus,
    Understood. Thank you for your detailed explanation. I will drop 
this patch.

On 2026/6/15 20:59, Linus Walleij wrote:
>>> Hi Xianwei,
>>>
>>> thanks for your patches!
>>>
>>> On Thu, Jun 11, 2026 at 9:54 AM Xianwei Zhao via B4 Relay
>>> <devnull+xianwei.zhao.amlogic.com@kernel.org>   wrote:
>>>
>>>> Some users need to obtain an IRQ directly from a GPIO descriptor through gpiod_to_irq().
>>>> Add the required DT binding and implementation to support this use case.
>>>> Since this introduces a new DT property, the property is kept optional to
>>>> maintain compatibility with existing SoCs and DTS files.
>>> To me it looks like you have just re-implemented hierarchical
>>> irqs.
>>>
>>> Look into the section "Infrastructure helpers for GPIO irqchips"
>>> in Documentation/driver-api/gpio/driver.rst, especially towards
>>> the end.
>>>
>>> Solve this by using GPIOLIB_IRQCHIP and a custom
>>> child_to_parent_hwirq() callback to translate the GPIO into
>>> an IRQ.
>>>
>>> To just implement gpiod_to_irq() without any irqchip abstraction
>>> is also broken: you can't force all users to just use this way
>>> to get an IRQ it's excessively restricting.
>>>
>>> Add
>>>
>>>     interrupt-controller: true
>>>
>>>     "#interrupt-cells":
>>>       const: 2
>>>
>>> to the pinctrl node as well so that DT users can simply request
>>> the IRQ from the irqchip inside of the pin controller. It will
>>> be hierarchical and lightweight but an irqchip nevertheless.
>>>
>>> The GPIOLIB_IRQCHIP approach will help you to get this
>>> right.
>>>
>> I read the document (Documentation/driver-api/gpio/driver.rst) you
>> pointed me to and found that the corresponding implementation has
>> already been added in this file:
>>
>> https://github.com/torvalds/linux/blob/master/drivers/irqchip/irq-meson-gpio.c
> That is the parent interrupt controller to the pinctrl+gpio isn't it.
> 
> It will be even clearer once you use interrupts = <>; instead of
> the hwirq = <>; hack.
> 
>> However, it is implemented as a standalone irqchip and is not integrated
>> with the GPIO controller.
> Right, so it is the parent. Of course it it stand alone.
> 
>> In this patch, I implemented the GPIO-to-IRQ conversion through
>> gpiod_to_irq(). Users can still obtain the interrupt directly through
>> the interrupt property, for example:
>>
>> interrupts-extended = <&gpio_intc 16 1>;
>>
>> The purpose of this change is to make GPIO-to-IRQ conversion easier for
>> users who do not want to know the actual interrupt number. The interrupt
>> mapping is not fixed and varies between different SoCs, so users should
>> not need to handle the hardware interrupt allocation details.
> This is not why gpiod_to_irq() exists. It is not a convenience function
> that is voluntary to implement.
> 
> If you implement gpiod_to_irq() you implement an entire
> irqchip otherwise it is a bug.
> 
> If the pin control + GPIO driver should serve IRQ numbers in any
> shape or form, you need to go the whole way and provide a
> hierarchical irqchip.
> 
> It doesn't matter if you don't need to set a single bit in the
> pinctrl + GPIO hardware for these IRQs, the fact that they are
> routed internally on the SoC out through the pin control and
> GPIO block by definition makes it hierarchical.
> 
> Yours,
> Linus Walleij

