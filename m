Return-Path: <linux-gpio+bounces-8725-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E077494FF58
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Aug 2024 10:07:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 980B1285E41
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Aug 2024 08:07:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7479C13B7AE;
	Tue, 13 Aug 2024 08:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=genexis.eu header.i=@genexis.eu header.b="eOtGX7y4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2090.outbound.protection.outlook.com [40.107.249.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83F8524B0;
	Tue, 13 Aug 2024 08:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.90
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723536414; cv=fail; b=MSfHB3DKeDSSWWeK8M0ikaJ4R056t6jVFyFGp6098usV6YFYYdbLb9DCETI1hrjD5sLB5zOT0mxxtyOC99lYsMBf9Bo4LH0V8xninuG3wNWh2hY+3LXMsI/FwqGOGX5VjCyyWbAlickidj7ijRHMwxFqntS30S8VnAEOTKBwx7I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723536414; c=relaxed/simple;
	bh=X4+ZVOMqbQCoMF9RzDwzITjKlg6xRk7KrtxKVFvVq4Q=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=P8U/5gL1T/0N139MCds8rW9OOL8JASdCM1tddM9S1SskvkbpmyZKedQ060M7wCHoQiGCntfzsF3OUtnhu3QoxAeptpdTWfaBymjDluaohblAD9eOhO9TRmBK9RoAFfxS/jzMj5Q5mI4L2YX5rbFwOJy+ftm68BOi9WdkF9pXmAI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=genexis.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (1024-bit key) header.d=genexis.eu header.i=@genexis.eu header.b=eOtGX7y4; arc=fail smtp.client-ip=40.107.249.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=genexis.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cNzCT8ka8eX5KiPLey0zQIp9O3ly6XxTY6D7iu0C7J3x9khxbp85LQIZI7oztfYq3BnlwoILMxc5ewUwTB6W3/JXxMymVu+tj+8BkjKyVvXjpsyh2+ePUanRwMsq6wE8aaIdvU/cUATlZNdNdUoRoMXuzxFnQGggjNJ7sJ6scThGly1Uhe628B6/W/8KMVP1qdebchu+l5yc/UPN06V0ScPB8YtLOeye0MJe8TQhEXPQTdACGS+iz6u0qPnuUZWRKrYMY/yusKLAsOPIcCaksj85GeFKChVIh8R36KgRifsI3oRAZ743qwwe7riScWtCoTnbBKHlqJTBiQ4eFGf/dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pp0hdT/9GuuEHR56jEsS+pIhouOODL2XFGTsMqMyOGA=;
 b=Sc/3ARaQNKMM9LvzP8cjLzsCv2q8zKgNBYhkz/I6Gh549MP9ySeJvceT8U7dnlklgkX/tUH0JGjf1KG/Wx1Dhma3aYPTl9hM3KF5HkufwQcaVKGeD858x4BQuSNI4GOJCppXO/BcXSkE9c8+oN4uG/MqcW8kLmmfwOh0aFbBQ/ETPN0huntk4DgCARW2d3vwyeLvDYfJWUM69W9fPiNrWsrWx+0Hr5l7zQebn95ep4BfeTKkyetVacZWoyMcHXxCLVFv5q2gzwTn3Gf6JtxvZsAfghFEl9CMLp/PwsKzgWmlrQM13wMP1G7UAir8YOENqHfBgU7nWFf4OGWxxkwRZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=genexis.eu;
 dkim=pass header.d=genexis.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=genexis.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pp0hdT/9GuuEHR56jEsS+pIhouOODL2XFGTsMqMyOGA=;
 b=eOtGX7y43bWpyrMokqlphUtgkrnxGMAUEezb2ug5JXaEK5zncSxKDBplncbZyKkSJyjm2w3DqvcDiqHmrPPcsFTP6obUs6NXGR2P71qtcfLJ2mBFsgTRA5N9bUu1nq5zYXKO8QNe+BMi0tJ94HKdKgOg2XaFIM7NkpXwl+EGjcg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=genexis.eu;
Received: from AM9PR08MB6034.eurprd08.prod.outlook.com (2603:10a6:20b:2db::18)
 by GVXPR08MB10913.eurprd08.prod.outlook.com (2603:10a6:150:1f9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.15; Tue, 13 Aug
 2024 08:06:43 +0000
Received: from AM9PR08MB6034.eurprd08.prod.outlook.com
 ([fe80::9ead:b6bc:10eb:ef35]) by AM9PR08MB6034.eurprd08.prod.outlook.com
 ([fe80::9ead:b6bc:10eb:ef35%4]) with mapi id 15.20.7875.015; Tue, 13 Aug 2024
 08:06:43 +0000
Message-ID: <c8a74be4-be63-477d-9460-1d5ef5e3d84a@genexis.eu>
Date: Tue, 13 Aug 2024 10:06:41 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: airoha: Add EN7581 pinctrl
 controller
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Lorenzo Bianconi <lorenzo@kernel.org>, linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org, sean.wang@kernel.org,
 linux-mediatek@lists.infradead.org, lorenzo.bianconi83@gmail.com,
 krzk+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, upstream@airoha.com,
 angelogioacchino.delregno@collabora.com, conor+dt@kernel.org,
 ansuelsmth@gmail.com
References: <cover.1723392444.git.lorenzo@kernel.org>
 <0d537e88b64847bc4e49756b249b2efdcf489b92.1723392444.git.lorenzo@kernel.org>
 <22144671-fc7c-4cb2-8bb6-ee7d3fbfcb0e@kernel.org>
Content-Language: en-US
From: Benjamin Larsson <benjamin.larsson@genexis.eu>
In-Reply-To: <22144671-fc7c-4cb2-8bb6-ee7d3fbfcb0e@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GVX0EPF00014AF9.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::321) To AM9PR08MB6034.eurprd08.prod.outlook.com
 (2603:10a6:20b:2db::18)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR08MB6034:EE_|GVXPR08MB10913:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bf4ed46-038e-4a76-a82d-08dcbb6ede96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NTFTYnJnNHJDRXlhVGREcDFWRUpmSmhzejg5eEdFcGRCTUUyMnFEcklzeDNk?=
 =?utf-8?B?RzVPM2w3VHk0THR0UUxqbXhPMHhvRmRlSXIxU2tTY3JDKzB5cjRPbVZnTEp3?=
 =?utf-8?B?K2ZGTXFzelUrL3Rjc3ZzeDROOEVmMUVrQVFDTjdrZlZIMWRIbmlWQ2UxUC9v?=
 =?utf-8?B?WC9iZ0RrY3dWbWVyNVZxUXdxWktadVVteW03RlFDMmZXMk5DTXpQL0FqV09n?=
 =?utf-8?B?bnFCczFra3pReUdYVkJGeU84OTZNaGkrdklreEdRa0ducGVzQUMzS0RyQ2tw?=
 =?utf-8?B?dk5hc3RRUjBOSER4UGkxc0ZXVjc1YWxNY3BNUHlYbmZsRWUwK0NzK1hIVTBI?=
 =?utf-8?B?YU16WGhNUjF3L210RkpOWEplYmFpSEFZdFpRTWRzV0YxTytxOGMrZkc1cHND?=
 =?utf-8?B?UlBHQXFoZnJyTkZ4NkhRc1JKaTNNa0tqZ1VSZVRUNkdYWlE2TEU0MXROU1Y5?=
 =?utf-8?B?SlJ6L3NIR0ljMkNqY0JQV1huK054LzU3bExJZngzNUpnaXJhMTdxaFJkaUI0?=
 =?utf-8?B?a3N3eU9kV2RzKzR1Z0FvRlNTVTI4K3dvWTA4aWIyT3cwWjhTQlNXWU9yK09J?=
 =?utf-8?B?VTREYjZYNXRuOVNJc3FwMU1BU1hoV3VUeG5scktHNzNxbUI1N0lCdmdUd3pk?=
 =?utf-8?B?VkF6N3NyYll3RVNXc1NwajNra0NZejhzQTQyc1pnOHFuNFRJcmh4ZzFsV3ZS?=
 =?utf-8?B?ZCtYVmpnNC9IditwaDRMSFQwVWZIek1Oc2tMS1RIdkd2bFlDU0tmSlI3Ynk1?=
 =?utf-8?B?MmxGSnE5UjFQTStHS3NLWm5rYkVPcDBZSEVFZXlVN216eTlaS2dnUHYyM2Mz?=
 =?utf-8?B?d1o3bWYwYXRYdEZkWmZOdzgwa2ZLRUpxSXNBWmp2VzlLaEZHSDErNE9maGlX?=
 =?utf-8?B?V2lMam9ZRWRtTjNCdTZMdVNPYUZ2SjlJNU9qRUJMSGZ0dmY0UWxzRVNySXIz?=
 =?utf-8?B?MUZBQzBxa0kxcjY4dTdmTXN0RjBxNFJhRjNLRlVjNUU0RllmUUQ4NW1hSkJK?=
 =?utf-8?B?N0xZdTV3bkRDZnd3M0pRdm5TN1Ftalo3MGZDT0RiczZHWHlpUWJMVUlwY0wr?=
 =?utf-8?B?cXFORmhGdlFEMGVsZkl2ekVka1hBNXBMZ08zcEFzV3JoR0FSR3JrUHpUdzJN?=
 =?utf-8?B?d1grUVVIRWlzUUlZcDRrMndiY29EUzdaOGNPZFgzbzVKMi9SNm1UU2JUdCti?=
 =?utf-8?B?ZzFGNTU5a2J6T252bVVZUVNMZTFGT0NmNHBuUXpkNWhPd0V6TGw5M3NEOWo1?=
 =?utf-8?B?UUZ0SDgvMnFLdk0xZFk5a0loQnpjNHFhS0h2L2d3OVdoWXJoMVZXbVI3NDBs?=
 =?utf-8?B?UUUzNlBuVGVSRUxyVzVjZ1pJK3hqRDJWYTJ1REF5V3l2TzJ0TUZQVVJVcm5D?=
 =?utf-8?B?WlhXeU1GRS9KUXI5ZXQ5Q3dIajhJempoZmJFY1BvWHh4K3pIRHhUWjVpK3hm?=
 =?utf-8?B?WmM3cU42RXhDM2Y4WHFITXlGZGN4Wk9pZHR5VjVxTS9kSHJJV0lQaEdqeUt4?=
 =?utf-8?B?NEJSZFFVQjk0dG15QkswaGUxQ2F0RVUwSmV4TnZCa1RDZ1JwTEh4YURCdUJq?=
 =?utf-8?B?cjBHMEpsN0RUc3MrYU0zS2FVRkFmRDV2T0xHQmJkMVhsckdHb3ZIdUtRem5l?=
 =?utf-8?B?QmxqWEpwcW5kV3NqZlkwUU92T2k3cUxHbFA3dER3OU5lUCs5NUZFNUtVdDhy?=
 =?utf-8?B?Ukd1RjdBeUFXUHpZRzEwOWQxQzhnUVpBK1RkNzZHalprQ21lZDJQS2c4dVRz?=
 =?utf-8?B?bk9MR2w3ZUlvNkVDL09kZ3FqZWNLN1BSNlFOb0tkcU1SMmcwbjJBUUYwS1I5?=
 =?utf-8?B?TXVpb2xBN2pVVFZZSkFYdz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6034.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZWFtaEN3ajUwd3ZUcHI5Zjd4TitBU1ltUThpYTlIWWdmUVVYRW1UTjdZYXV0?=
 =?utf-8?B?YXpPdHUzR2hMbFRZMWh1bWpGUUg4RXN0RlRZNXoxRHZSS1JWdEtGTG9Eejdx?=
 =?utf-8?B?dnAzOFIxOEdLbjZHeFhqRWpYNGVCUnkwQTh6bzl3NXhacklnVFdJVnh4MTgv?=
 =?utf-8?B?ZG5Od1NZbWtMUGF1S3pGQnpZWWFOelBLcnBiMmRET0EzQVFxdHpQcENDMTVJ?=
 =?utf-8?B?OHFPN3pPTTY3SE5aR3pML2haZGpJd1BnSkFaTDRFY1lOZE9ucEdJb3pZNDVY?=
 =?utf-8?B?Q25KaVNzWFgyUVFRTFJvK3cvRE5GYmFQQTZVVzdIRW5zMm5uMXc2aGVnU0I1?=
 =?utf-8?B?Q0o0RUNpT0hDZ0x1MXNZRUFUVmY5dGRuWDVlM0YrNkhwSDBXMVB6aWVrd3h1?=
 =?utf-8?B?VXNlcEd2MkNGVVlRbktFZUUzc3FwcG5tY09jUTNjSjF0Z3NyUDRXck5oZlds?=
 =?utf-8?B?ai85VFdORXE3bC9ZRFFMOXlTNW94M29zOVhLM3U4NnJ6MTJqVk9XNTBIeEhp?=
 =?utf-8?B?ZXRoRzRSQ05YbWNRODE4R0FkUytqN2crbXFmL2ZGRHdsWksvaHh0ZGNJY1hT?=
 =?utf-8?B?VUI5VlBBVHRrTWw3K2x5RlJvYjJEZ0R4aFRCQmZKdWRPbnRUTkptOXF5Y093?=
 =?utf-8?B?LzRpNjU0Y2xKVGFYSUVSMHc2M0hlTm1HazBKQkh1bm5RMk5QV25CcVN6dnBi?=
 =?utf-8?B?eVJMWTF3Y09JcFpIZ2VUM3RLM1picnYrTllnQW5VZWNheHV4WFpTaHFzaWZ2?=
 =?utf-8?B?ODlXbkk1UkZENWFOUDFJODFwcmgxYjJUMjZOczRXRHpoejFQRXFYbUFMSTZN?=
 =?utf-8?B?N3dWOElRS0E5QWZuUmNGdkU0WTE0bEdKNGMzVzFHd1lYMWhTM25PR1gzSkox?=
 =?utf-8?B?U3R4UjFKbDI0SVlIejlNN20vZmt0dzlpWnZYQ0tpQjJSa0RsZHFLT3M5TTRO?=
 =?utf-8?B?UmZpdm1EeW1lZEJlVXpMdzI5SmJBU1V3azZlNE9QZklublhxb3l1dEM5NVpJ?=
 =?utf-8?B?S09LcGtuL2Nra3pSNmduU1YyRE44aXprOURVU3lERy9PUitHU0ZrOVJQOUls?=
 =?utf-8?B?MGN2cWF0L0xCVWFVaXFnSGF2dWJMVWpENHlKYlk2TmsrWjNmTXRIU2tQQkls?=
 =?utf-8?B?c1dBQTd0NCswWlYyaDUya1M3RXVBcnZRbGloRFlWcHNLVldNVVU5aFBpM1dU?=
 =?utf-8?B?NTVqK0FpTVhSMUxoWndMeFRlN2JZZE0zRVZhMGVpTUNxU0UyTEVIUlpWTXEz?=
 =?utf-8?B?bVBVWG9vaUhTNkxTN0dLZFAwUXFHMmdFcnhJbXhNYUFsVUd2OERxR1VQSVNv?=
 =?utf-8?B?OUd5ckZnSzI3WVhlSGtNejZ3ZmJkdkowOWp1SnRaNW52eXFkV3BWTkJVRmls?=
 =?utf-8?B?TXk3MHBGTHBCQk9Cdm5ZZlF0Rkc0VFRyQWk1NlFVbkRhV2N4d2UyNXZTY0do?=
 =?utf-8?B?dmZKSXVPVkgvL2s3RUY3bzZXd0RhRnp5MnN0T3R4TlprZTVrRlpXWFRKaGQz?=
 =?utf-8?B?WDhlZnJCeEp0UkFTV05rTFY1MzJ0WmhxZU8rcUhhdWljMzlYTklxeUlYVUdy?=
 =?utf-8?B?aUM4NGhFYkVFaE5rU2phUzNMNWdlQ3ZYZFpNY0tHVDhTNzVHeW9PakZzQWlC?=
 =?utf-8?B?dXVQcTBuYzRoTE81TlY1YUhBcWNXMm9FVk5DZkgrWUVEb1BwVDk5MWVERE12?=
 =?utf-8?B?bmNBV280M1ZLWi90NGtYTnZCemxBaXI1dVFUUXZMam1PbEFnK1c1UWp3TEVW?=
 =?utf-8?B?alpnWmxQK0FJdDhnVHVRQThQcXZESzFGaXkzK09RczRVbHhRcEdjaTFjM3o5?=
 =?utf-8?B?alVJL0twUnFqeXFxUkNRVWVHZm5SaG9VakpWdTBTYk45cG9pUTFnRUNnRFhS?=
 =?utf-8?B?aWJSNEVFVG1na2h1aGNsblh2RXYyTFp1MDNnRC9CZVB0V1dOV3JYVGwvZzF6?=
 =?utf-8?B?dlhzelh2eHdMa01yOUhJaFo4OUVqazBLU2FXRjZWTytYZ3FScFBTb1RsdmlW?=
 =?utf-8?B?TWc5eFJBRUJ6ek10cGg1ZzJLVUV5TG9NS2tLZ1V5c21ZQ2tSN1hJVUloV2l2?=
 =?utf-8?B?M2I1NzVwamJzUXdPcGhNaXFoempzU1VpTUswVXFPZHpQMHZkc1hYSVRjaDZM?=
 =?utf-8?B?akZsR2tWUXYyUy81bkZaQnptTjVrcnVOYmUzcXNjVG1mNXppMFErZG1hSGJK?=
 =?utf-8?B?MWtsM09ua2RDdmNraVp6RUxidU5kb2FJZGUvVmVXWElWejhoNDVidld1bFd0?=
 =?utf-8?B?UXlQWGVCakM1RlpkTzltdVcrSkVRPT0=?=
X-OriginatorOrg: genexis.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bf4ed46-038e-4a76-a82d-08dcbb6ede96
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6034.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2024 08:06:43.6900
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /fq80EIW/9Pnrr1zl8epn6d8hfTAdjqV41oI6amGoWsv/FCK/+5yV7sI5c9rUTbLxGmaH2C7XAgjNS4vzve2Qr7HD3S6O+uUU2mUKlJIGek=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10913

On 2024-08-12 08:48, Krzysztof Kozlowski wrote:
>> +      pio: pinctrl@1fa20214 {
>> +        compatible = "airoha,en7581-pinctrl";
>> +        reg = <0x0 0x1fa20214 0x0 0x30>,
>> +              <0x0 0x1fa2027c 0x0 0x8>,
>> +              <0x0 0x1fbf0234 0x0 0x4>,
>> +              <0x0 0x1fbf0268 0x0 0x4>,
>> +              <0x0 0x1fa2001c 0x0 0x50>,
>> +              <0x0 0x1fa2018c 0x0 0x4>,
>> +              <0x0 0x1fbf0204 0x0 0x4>,
>> +              <0x0 0x1fbf0270 0x0 0x4>,
>> +              <0x0 0x1fbf0200 0x0 0x4>,
>> +              <0x0 0x1fbf0220 0x0 0x4>,
>> +              <0x0 0x1fbf0260 0x0 0x4>,
>> +              <0x0 0x1fbf0264 0x0 0x4>,
>> +              <0x0 0x1fbf0214 0x0 0x4>,
>> +              <0x0 0x1fbf0278 0x0 0x4>,
>> +              <0x0 0x1fbf0208 0x0 0x4>,
>> +              <0x0 0x1fbf027c 0x0 0x4>,
>> +              <0x0 0x1fbf0210 0x0 0x4>,
>> +              <0x0 0x1fbf028c 0x0 0x4>,
>> +              <0x0 0x1fbf0290 0x0 0x4>,
>> +              <0x0 0x1fbf0294 0x0 0x4>,
>> +              <0x0 0x1fbf020c 0x0 0x4>,
>> +              <0x0 0x1fbf0280 0x0 0x4>,
>> +              <0x0 0x1fbf0284 0x0 0x4>,
>> +              <0x0 0x1fbf0288 0x0 0x4>;
> Why are you mapping individual registers? At least half of these are
> continuous.

Hi, this is by design because of the register placement in the gpio 
block and the fact that the pwm functionality is intermixed in there 
also. As example the following registers are all GPIOCTRL:

<0x0 0x1fbf0200 0x0 0x4>,
<0x0 0x1fbf0220 0x0 0x4>,
<0x0 0x1fbf0260 0x0 0x4>,
<0x0 0x1fbf0264 0x0 0x4>,

To simplify the driver code logic the complexity is moved to the dts 
because of that.

MvH

Benjamin Larsson


