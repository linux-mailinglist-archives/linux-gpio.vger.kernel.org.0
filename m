Return-Path: <linux-gpio+bounces-36251-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wKbeFL6u+mniRgMAu9opvQ
	(envelope-from <linux-gpio+bounces-36251-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 05:00:14 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0030D4D5C88
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 05:00:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 116723027134
	for <lists+linux-gpio@lfdr.de>; Wed,  6 May 2026 03:00:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3146323AB87;
	Wed,  6 May 2026 03:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="gL7jkrvA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023094.outbound.protection.outlook.com [52.101.127.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5A72DCF67;
	Wed,  6 May 2026 03:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778036408; cv=fail; b=hgBkLuxbNNCFoeovDRpWK9b4g3WvYnnGVFUaQdGgdf6CP9ir0LwsNVvoy2lfw2Q7NGxTwP3UPz3j2vE32kH2jdoOGHBE6mjy4pbd/g8D4IImj/DarWb39BYG7F+UVRrXWq/mDKmrCyUDVChX5fwzfZQt96digm+6YY1SPHfQeHU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778036408; c=relaxed/simple;
	bh=bwsFwtFRr7+RCyn3lv0+UXMp/cT48GCQmqBixp2jYhE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ejLWJ8w3liWnAqDC2o+JJvDZecAeM4oAhFgtrZKhVfADJECMIQl68PKFnZCHzoZIkAxGwwwAM3Mvs0ygSkDbgmiyuHHjdoMKYOe/knXDBvB/jiT8o2f3auXWlO5B3AeI+21qkaL5R0fX6XM52ZSVacfwkhxkmpI7m0lXtS+ZV9Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=gL7jkrvA; arc=fail smtp.client-ip=52.101.127.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VSDvaa0gEQw4Jwamh0/358n7K2+PTs118QkexC9NgPyes8S6bDTh1eq0PlohdoTCJmpK/S/BnH0BlcQ370izdo2gXp24o62oegHeCQabewIPbfG+HPGqgN2aD9u3Aiy+1WjFwdUyHB3Qz6V60Gh6+p3eQmHPcTQLWanFAKiyQ4fXWmsL28h2Q56Kgu1KIziIacV6eex7imBzQb/iUIlbks2lVheJdlYNG6CmOjWDLevb9DJ35oKuVcWVnnHGiyiP+OF29dOTn+SsixnKGtSGMG43KtHOD4l7FhCLENo85IxO+7WgZgBxPRtIsZ5NIMyoEmnsVcArH3l+J2UiqDVOYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dxPRS4Ci/VlOJYrV9W8AOwAzbKcHcyph1XDoOS4jmsE=;
 b=Vf57Yn1WGJZQE6G0kn0yKU8iyn3AIQNQJ1X+P0FPh7O5EVtFOzp4+yB0dgv3sGMxJhNKUD5vyHhdBEzYn8JQ0eV5V8UbDB65tGEZiu/8eZP9H0UbT5F5iAGuP8uye71xVPGjXwZzy1YCcd7sAOTkvP0Rk9GWwSIFXmZ8+XKB/ftTFKEXbKyaAlQ+KeJqDKLyK3AsGe6qn1+nEfWE+GvkshvO7QkVY1H/jAF1kdgsWjWI+WUBkvOjTCFUKrfHvQz4QS6JPIpR2OkXsqk8vPHvA2qgMTyfs9pcEk7Uao8uzwhqiZ4ArxK1zYBxJZ4PKX+EVMmvdorYeus0gtzO2zBImg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dxPRS4Ci/VlOJYrV9W8AOwAzbKcHcyph1XDoOS4jmsE=;
 b=gL7jkrvAeBDitt8ILu/H54VwBX45NKRgGMgw/NrorPSJtabuuTaIikyxsW8W5ddJN3bGivUmiKrGZLO1A+/1YwOPjrTnrWvSnOqj+7fmq5mZbJ3h5UfDQ8nvEHx3fUr6d5vTXtKuO2XXitoJ/gNReukB9X+iQEU9RplOsoB76j7k0u2gXBIJPXTWS+4wINd260Qh0PXFNshxl08odeFacdRmwwcJrnI6Vbh69R0MrdlAEGXZaXP50OqELnIlRfmmFP1DInlMUmQ5oV/Z3s5IjI/da09R8+VQNzh8XmCQV7gR5j+W/ggQHXyiYmFnyTXPC7qdJ7QQGB/G7Uful/115A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by SEZPR03MB8156.apcprd03.prod.outlook.com (2603:1096:101:18c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 03:00:01 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4%3]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 03:00:00 +0000
Message-ID: <659fea60-6b65-4f70-96b3-780b53740e22@amlogic.com>
Date: Wed, 6 May 2026 10:59:56 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: pinctl: amlogic,pinctrl-a4: Add
 compatible string for A9
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260428-a9-pinctrl-v1-0-cd611bb5f52d@amlogic.com>
 <20260428-a9-pinctrl-v1-1-cd611bb5f52d@amlogic.com>
 <20260430-notorious-cat-of-wonder-a6dacf@quoll>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <20260430-notorious-cat-of-wonder-a6dacf@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TP0P295CA0046.TWNP295.PROD.OUTLOOK.COM (2603:1096:910:3::9)
 To TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|SEZPR03MB8156:EE_
X-MS-Office365-Filtering-Correlation-Id: 2907ecd2-d8af-4abb-a6fa-08deab1b9040
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|7416014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	t+2/J2IlIN65Jyep3mGBlzbgIa2PYqkQ7NzglLl39u8mRBxw0JdGI/IjSbAtHxaJyG29ruxEiu21fsTgYSlu+GTkYi8995EoGqulNnAUVXKRpa225eKCSdLNrlz/oHGDajZs+AWu2XfG03hSomVwjndoYVqibB9Ez9PZAfy2AzGDd2FhijYM6SJ2u2uFZbcwPu33jlJWrCvX1xT4ugOzkaNB9jBhIoMdv3HLACINKv+cAKS2hFhMnMOD5M6ufzOvVp8d4aB5A+9UaRAHRIB+xDp0jEocTSy5wo/K4lk58aJPIccAmnOStDzttSaFZjunJnG3Dy4wRCo78LzvlKbSlgQaRjSSAryPZ8ZQUJShSRJdRNT6PzbZoT7ABQG6x1LwZ4U5F+wE014uC1iDEYqj5qes5OkSe1/Chdpl9Tj4YQ6b0NIQ1jArPEmWzW77imRAO1OSV3V/0F8zR0V0FZr31+us1FhQnNrQxcAzFz+I+BdmFs18e70LffWImu6OkHATEu5JCXqQsOUERdDDlmR581s7LdXRdxtRAZxCCJVByne+h3P0wAl1z3r5T1LoWRz74oVMXNs96K131tK0YYQfcs/MjhEAY9kN7yPHbXmYELWUALcnzMuSLOJFxNIvMyzdyDqrrzOXNW+96mWf1gJbLPOWdQjHo2K7xmptNx1mJtyrYshI0ILNPx1KWtYKEdNa
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UmpwZWkvYUtlaHJabTF1OTBWWXdodkpnWkxWWHM1WC9LQktPQ0gyc3FocGtn?=
 =?utf-8?B?ME9BaXgvMnpJall2dXRiMy82MDNIWTZxK2ROb0xtSjdPWWZSN2lEU3FuK1Yx?=
 =?utf-8?B?UWg4eXpsR0QwMHpUdkRCNGk4M1VsNjdJdHNoRXFDeUYzdFp0QTdBdkFuT3Zi?=
 =?utf-8?B?MnBqZ1ZZcDdzajArVnVUVy9HWlhoNXpnWm9mTFdPUkRiVWprWkdjYzc1dG95?=
 =?utf-8?B?YTVhT1FTdlErK2Z1dWdTWUFaaVB1OHAwWGUvSDNmWjNBVER1WHhFQlMxUnpQ?=
 =?utf-8?B?cmE1ZCtrZEswTTMvcHA5cS9Xd01OakpzUGxtQ0FpYnN3WmFwd3ZoZXhxVG5i?=
 =?utf-8?B?bXY2eFpqYmw5R0JiSkdVaWdDWnhOMWdEd1o2QmtVUXlaUWxlN0VKcTRlaDZh?=
 =?utf-8?B?SkdWQmZ6amsrR1VnckdhZjhBWHg3L0dnS202V0t0b2NwTTJRODkvNGIvbE5I?=
 =?utf-8?B?bmE4cFB4TTgwWXV2c2Y2Q05nYTFFSFFLZWJneE0vekhuVUNDdEdhL2VSRmt5?=
 =?utf-8?B?MUxuaUpsdklGTGU2TTZLSWNZUnhJMFBJa0FPVDBEd0ZBVUZlZ1FkQVlJVzhh?=
 =?utf-8?B?dDF5aGZjVzBhYWZxajYxeWF5dmJpMDNhTGFWc0ZHVElaN0xSdUdWNi9MUFMx?=
 =?utf-8?B?eTRWSjJWWEp6Z08yMXd1cTU2WjZrdXhUNncyeU1QbTA5UW5LUURhUVRlU1Qw?=
 =?utf-8?B?VHVtanozanJjOHhtMDFZaTI3NFBzS2s1elBUNGNxblo5Mk96aHFKV1ZHbkpx?=
 =?utf-8?B?VVdUYWhIV3daakFyY05WZzNmZXZ0QUlKV2djU3B6SWFjRjExWmZqQzI3Rm81?=
 =?utf-8?B?c0dOZkMvZWhrUm5QcjJPZFQ3aVBQK0x1bEhzS3JBNFJGRVRzazF6S04ya3Mx?=
 =?utf-8?B?ZnZVV3lqQUY1dUhza3gvTXdQRE9VS0pWcEphS2ROMlN6S09zdTZNeUhzN3do?=
 =?utf-8?B?VEJCcjA1djZOenljNXFTUG1WcHJaUlpNK3ZZVVdxYUVabzQ3SG15aTdYUlV6?=
 =?utf-8?B?cEdhVVpnSUFDdzZGYkRoZVBSdUR2NWc5VC9aTFhDTnovdjZneTRQWlE0K3Yr?=
 =?utf-8?B?c3JJeTFWMFRHZXpKcFQwMzFFcXZGS0xSU0wwQWN5VFZuLzhGNTN0dlU4QUtC?=
 =?utf-8?B?MUN3VURmMTJvRUxOME5HTk80Qmt4QlBDZHViaWtpajJhdzVJSndXTlB6OHZV?=
 =?utf-8?B?OUtjK2wvVThZTVRDNlBDY3ZUSjQwa09KSEV3dUZPOUZvT1hEbUFJMUpoM1FY?=
 =?utf-8?B?OFowN2dyRjVVRWxxZlA1YTBVUWRPOHpWamJvWnZGRzFodDlYL0QwZU5XWldG?=
 =?utf-8?B?cHgzU3lDQzdwYXZTMFljRVFiRVNFUUFEckh3SzNzayt0cDg4UmNZU1dERGI4?=
 =?utf-8?B?cnVodDhhZFRYcHhaeEtPWU5HMUo5djcvVW5vVEhuL25MNnovK1d4MlhIQ1hz?=
 =?utf-8?B?alk3ZW82UEJhQUk5TWY1cUY5UlBVeVhCWEdXSDVjK2hUZGJkNHBMYVpjamtC?=
 =?utf-8?B?WlQ5ZGs5anhMVk5idmM0cHdoZTZ4TjVKVDd0dnhhVlJwWUdkRDVkYjdDdEgw?=
 =?utf-8?B?T05aS2FTdldodDJoUUVpMXB3eDY2NmhHZndUZkQ4NzRLYVgxd3ZQVzdxbEtH?=
 =?utf-8?B?MlNxUkI1NGlHWVNoQXdnTWpVQUpDbXpQNVhJeWo1OTN4WGg5M3ZGdllGYTJC?=
 =?utf-8?B?U2dTWmovVVFrc2FaNHJoWTJneHllemJDek9LdDRLWm1IZ0wrMkllMmRpK3NB?=
 =?utf-8?B?NHZaRXZ0SUoxVDVoTFVQdm42b0E3Ty93UlNCWW5ZbEZvVW51MWpKbXJzYnc2?=
 =?utf-8?B?cVZCVk8xL1paTGpBTWVsczdZSHIxOW11alhMVi9UUVY5M05LUGx1bkVCSnBv?=
 =?utf-8?B?NjNnZmNYWEJBM1NkcnhTdWo3aEhQZjRrRFRUNE5KeGhvMURzMkYxb3d1MEZG?=
 =?utf-8?B?azlJM1lkZVFaaGZHQ05HVEY1aWk5ekgzcmVvWHM0VXdXUlBZRHpWNGpkTjZ3?=
 =?utf-8?B?N1VLZnQ2SGZxYlU3b3p2bi9aYVVSajFwSzJkNDJVVWZ4TXZqOUgxbEg3MnZO?=
 =?utf-8?B?UmZjNjhKOHBlZkszdUFFTUo3b3d6ZDZBaysxb0Vja2JWTUlNOXRQKy9UWHZQ?=
 =?utf-8?B?a0RiVmpWN2NacGIxTHNIbk5OVEo2WDAxcmZnSVFLZGhEeTRoT2daR215TFZ0?=
 =?utf-8?B?Skh4VHg3eEwrNkdJejcxN0ZzWjBmazBmRlh4ZjJ6LzZzT3creUlkRDIrTDBo?=
 =?utf-8?B?UkE3MGZ3WmNwZlZTck9ZQzM3NzI1VUlEZ0xZSm1xRmdyWk1oMkRVK1pzbkZX?=
 =?utf-8?B?YS9KWnhSNjBoR3FmZTlZRXR4L2swbEhzcW8zaStrRW80RitGZEpvdz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2907ecd2-d8af-4abb-a6fa-08deab1b9040
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 03:00:00.7393
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Aa2Tkj46uEb6LAVrqMKgMo1g24efr6ROrx8LmRrHnnWXopaqnUTJG6rOULq5RXNrAqmnZ/VFwgj6aym6/MAWd903BE5Ks+SwEYvmd7aMn8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB8156
X-Rspamd-Queue-Id: 0030D4D5C88
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amlogic.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[amlogic.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-36251-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,baylibre.com,googlemail.com,lists.infradead.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xianwei.zhao@amlogic.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[amlogic.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Hi Krzysztof,
    Thanks for your advice.

On 2026/4/30 17:36, Krzysztof Kozlowski wrote:
> On Tue, Apr 28, 2026 at 08:22:48AM +0000, Xianwei Zhao wrote:
>> Update dt-binding document for pinctrl of Amlogic A9.
> And why it is not compatible with a4 or a5? You have entire commit msg
> for this.
> 

Will add a commit message explaining why it is not compatible with 
previous SoCs.

>> Signed-off-by: Xianwei Zhao<xianwei.zhao@amlogic.com>
>> ---
>>   Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml | 1 +
>>   1 file changed, 1 insertion(+)
> Best regards,
> Krzysztof

