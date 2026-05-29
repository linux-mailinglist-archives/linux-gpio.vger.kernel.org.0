Return-Path: <linux-gpio+bounces-37654-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJXMOc0BGWqYpggAu9opvQ
	(envelope-from <linux-gpio+bounces-37654-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 05:02:37 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 475415FC950
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 05:02:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C8FA43024962
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 03:02:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F143B367B97;
	Fri, 29 May 2026 03:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="gGztoYDm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022125.outbound.protection.outlook.com [52.101.126.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E5936494F;
	Fri, 29 May 2026 03:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.125
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780023742; cv=fail; b=UgFP0Ob4s6TaJSz8kgwC8OTh+guvZDVwMvARXL8hr8TjYraWFaac7BFwgKjKxwUtwirwZ1y/gzxg/00eGm5g2f/HtGMy3NKgp8nJ2jPUWRK53TTIHSgzxzsH9dtDGFM6dkiUtNgH9RGoU1QxvJWQaUKDPBMqxLtsJZzo02XpYac=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780023742; c=relaxed/simple;
	bh=1aOZSGsA0Pa5DCBFdjar8Fc23/8vVgq/j7u8W7Hv9rE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=F745hMOTOWtv3i+eWv3yJDADtkudLMf1ooQUlbZyErNe+7YEYFA2g+c4KRgbfTUZawDsEmvSAyJC28xJP/6Rt27MiKjHxdXjS6gm0PJKa3bcif6g3UHItXbURQkEbN1o9bl5vO1nBQ+HfR5KNKrWEs92d+IAAC136efg+hdmXAI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=gGztoYDm; arc=fail smtp.client-ip=52.101.126.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FiFdyt9Ao5zjjJ9lHO/2F+QQAVdff9j1vq52dqfN4JDTIR+UHE4zleKSeUdOdWHP6HJbb9bksblDzp851YG8Gml0t5UjtQuSD51qbMrjN7oJYYLPNZQujFtwRAMKmbrH3HiVTY9GTLB94Nq1SnClKGnxnlWaNfs77lkkaEopMa7d4NLbIFnS9DTJkdoCM9ACTX2KQIxdfv7I1KBL9Mb+A6VGBBQ1sr3ToCerZ+VrFRWoOVWJa96qRCvyqHhVbuEbK7LB4/cy3ZRC/WJy5DryVxQpAgprQ0+yot8rducm97m2WkjacNj8goyHsg4q+JLs3LEF49VeyvwAkuwkKMmTnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sldZIpeQK00g+w01RVFor397fxQTt/wMRVgrioKiDjs=;
 b=iTOiQrYmEvlB/zyiY28VYAVralvN/skIlA9TXfLO+iyoDGy59BT3iODkFrGJ7ZMkHE61p+wqWMn+p9Oerw/t+5X7QTEsN4j93F5Cmw4L2ravQZTQagNfJ4o/OZZ6peQ+eqUJVgdVBCCEL3IjZZnWbvXnpuK5Ql4XMar8GFrIAd1TdYeqJcsihul72ZZIXdqqfoTqpBe4iVNiZu05UUS1vjFhm4/wtYKxmPhzVECdmhGUt+y9d78IbGGpv+m0IUeFeXLOU3xMsRT4cQ4/bvtxkXZmkls+Vu5fRJfhiAdPv0XAVK+z3seqVgLWEcybErTgFcJ8UBC+eHT+MseTKP3kWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sldZIpeQK00g+w01RVFor397fxQTt/wMRVgrioKiDjs=;
 b=gGztoYDm9AZfEANsen0djzI+t1M9mtNSDmYziDO6l6/UHMqUHKyX69beXAYPL56HsYOEn+nM47M9Eqo2/VPz/MCZp17GA9EjXdoLCveuHATVxBe2tBirg3cXWxpNDHXZnxzfRa3OEBPzkVV45W9dVYFquxlv+ToktFMWIHWecmnXQwSIIK7ruaaFXJd6uEFdmqIt6TI8wH5rQ1osKVHPfZ1/bWUMEV/Bjnf4wYBnL8oeLbPQavtMHipbu5pf2PF+OfYvUIt8OjbO65UMgLHqLTq1MrOu0gzNTCn9dfKj57HEO4E10kOPLbEAHv7Nth+d7FDLoramjEiWOr7HWihw6g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by KL1PR03MB8514.apcprd03.prod.outlook.com (2603:1096:820:135::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.4; Fri, 29 May 2026
 03:02:17 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4%3]) with mapi id 15.21.0092.004; Fri, 29 May 2026
 03:02:17 +0000
Message-ID: <36cdfa84-1e83-4a44-a529-653d476778fd@amlogic.com>
Date: Fri, 29 May 2026 11:02:11 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] pinctrl: add support amlogic a9
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
References: <20260507-a9-pinctrl-v2-0-49774feff2ef@amlogic.com>
 <CAD++jLmGr_UOja2yHjCHv7xRcGqit_TxKk7A5YzSoviicJrJUA@mail.gmail.com>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <CAD++jLmGr_UOja2yHjCHv7xRcGqit_TxKk7A5YzSoviicJrJUA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TPYP295CA0043.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:7::11) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|KL1PR03MB8514:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d27a221-2e55-471e-3821-08debd2eb13c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|1800799024|376014|18002099003|22082099003|11063799006|4143699003|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info:
	iX+Ws63s6CKYChKl5iM7SBhimYXfEn+9pq6zAPYCYI+/Miy7hkzrk07IfTXp3kf7c3kDDmpiBUXxmD4N4zi2EuJshSj5cnFZtfknsqVOB9XPGyfi+MuiOtBIGYmHsB3qrR8b1+Uzi7/MjngDbqbmxaYSz/DdMw/b1ZfQg/F0Em3IWRog566m/FoCCBICfgjGOkPi0FFQ3xdyutNYfDofGKxeN2ZeCvqfRyDS9HVhe3HsBV3D44NKOfr+QREf8XhPbM4CA+o3sFhjrrmIxu4NWWsVO10jzkhABeatveM2qMSMGWBA+Q/rSL7JnUtfwF04SqKYG+L2Mfb73z1V7b7R3iVJkifS8EOTwQjC+SkYBqEgEWen5QR3U6aPLFJa3sBgCGYUes54Mt0RZm7NjNQ7ftGesDmsGUJK7vbqDu0oyaCYjzyV4hOn/D58dkROMe1kCB0tGdEFHbb4wl9HiIyQzMELRHjXZsjzDFV1LoQOs0Lc0lPlTYBSWMxsoWQk5fOhXDPBlm5I95GVz2pCFMAPiLkpMeJ0ngDOg36leIgi1Hu2aivEZ24uzHI9f6sD2IGtFcA0G5noTDvVj+U4k6+8irbNBj++8bwPxYYpApzrtFKB3LJ74/tmduNAiw3uysmS5R+13rq3gWjaimr/OdRnUpfl3uUqbeYUYGRx9Qsx1Wd1PEX9FAR7W745K8Tvjopv
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(18002099003)(22082099003)(11063799006)(4143699003)(6133799003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VURwT2pOVlhZbXJJTmhqRC9DK1JVR0xRakRra0xjd0lEenNnYWRPR2w0aFdH?=
 =?utf-8?B?MlpWUXBrOCtjb0UwOFZxRGxZeFFKaDJ1cmZJelladHZ6S1N3SmpKOGNITUta?=
 =?utf-8?B?OUhuWm9HdUR4NHp1N1NydmNVZnFJTWErUVlTeE5RU2taMHcxMTNoeGlpZDBC?=
 =?utf-8?B?S0srbG9QNHlpWUFEMDZiOHR5WEU3WmF1NklRTDRCN2hHcXlCdlJHenZuOEFN?=
 =?utf-8?B?S2QyTzJ1cUJPQlZHcXRGajEzcmpEZFVGRklsU2IyN1NoakFXMkVaU2NyeUJG?=
 =?utf-8?B?azlWNjN0NnQ5WHRoYUc0Mm1KeUlXOTJzZEdlMzFRYkF3UkxZOG5semwvZTVh?=
 =?utf-8?B?UFNRMnpjcUVHdERaQzNEWENUN3V2dmUwa1kxY2JUKy9ySjZlVHVHMkRWelNa?=
 =?utf-8?B?UDI2NS9lN3k4cDRHK3lwUTBhS292RmRoL2ZKSjYxYk9saXlBOWlaN3ZEa3Fo?=
 =?utf-8?B?Z3ZtYUFISUN0U0YyN0l1MXZoalJZNWpVYnc2cmRUZmNFa29zY1JQUXREV0gv?=
 =?utf-8?B?SFJwVnI2V0R1TCtVSVExeEFQMzZSMG0rRitFaDBEcTZaUWQ1aGpqSTc0eUE1?=
 =?utf-8?B?SkExWWRIRXB4UXpRNDNLdmV6cjJVZG1vZkYzQjJ4Y0lINkNRcmFTSEgrd1lq?=
 =?utf-8?B?VFh5RjVCajRad1dQbnVuVE5pRStPdnBoOXU5NHY3L1YyMTlLTG9rNEk1Sk9m?=
 =?utf-8?B?dDY3bSthbzR2ei84c1VOY3NFekx2eUZNcU1zQmdDd3orQVN6by9JT0Nyd0t6?=
 =?utf-8?B?aCt6T3BCUzRGQXIyWERyNS9xLzc4OXNLYUw5SXJDOGlmK3lCd2VDWVU5VnZQ?=
 =?utf-8?B?RTlqVjBMalFjUlVlMHoxc1krSzcvYms0bkVCZTJqbnRtTjBZZHdUM2c5SEI2?=
 =?utf-8?B?VWtDVzlsdXlML1l5Um5TbTBwVDhXVEI4bCsvWXVXSmpndks0ak16a1A5aWJ5?=
 =?utf-8?B?NmJIbDBZQzR3eFlQZnZ6MkdqeGQ5TFIzdDNILzFkSThkZUQrOTd5cDU2a29i?=
 =?utf-8?B?SUNwcmZrSHpkSk1jS1o0WU9MeEs2a3dPSGxEd2tqeE5wWmpYakRXWCt3RDVz?=
 =?utf-8?B?ckdZTjlJWWZiTzQ1b0M2bS9JK0szZS9YMW02YzlOOTVBbE9rckE5YWZlUVFM?=
 =?utf-8?B?WUg0V1hMNTVCNWx2bityMVBKaWNkN2NMZWN5UW9YdVpUMFFwYjEyMGE4MkpY?=
 =?utf-8?B?T1BVVDZSRjR4N2NITG9RSG5QNHNTbHVtRHpHMEI5MUdib3k4QmNoRm04aTNX?=
 =?utf-8?B?LzFuME5heDF2am5vdTc4SWxLaEtESzliOFdyZGJRUW9DZTh4ckFTOHFwOS9o?=
 =?utf-8?B?WGlkOHJUMXp2VmkzZWVVcys3UUplQlBZNTBSOEhadGRSeTg2UjVIbUZqSWgr?=
 =?utf-8?B?TjJDZmhSeDkzYXpHUjlPSGVxQkE0bVRoMUFSWkxJbjhudW9KRndtYUtOUVNF?=
 =?utf-8?B?aXRpMUljMnN2Y3pkSDRWUHpOUFQrb1d6UjQ1N29oc1Q0Ujd0K25wWEwwbWxL?=
 =?utf-8?B?STNqa2tnVmFncFdwL000Tml6bXdJNUJENWplZCtHeDRLU2s1Z3IyajFUZ0JU?=
 =?utf-8?B?UG9VTStsVmlaeWhMWGM0WmlHb2F3cmh6d1hQNm4rQzNKcytESUhvcHE4c2VB?=
 =?utf-8?B?Q3FHK3ZCZ2ZPREtZc09tOEVhODJtbzNJSnBublVjV3ZnZmo0WG1xM3NPSy90?=
 =?utf-8?B?TTk4K3E3VUd5bG9OTndzVHg2b3hjZW1Iamc5VDkvQ1NBM0c3MUh5YXhqZkta?=
 =?utf-8?B?M0dudnVvd2VtVVpTR2c3Q3pqSDFpckpUNHgzYVhmdUFhZ1hTUGwwQXFqQkt3?=
 =?utf-8?B?ekNYNS9kdmtoMjRMUGJSd042YmQwSjVta1F3WlAzd2lUZEZvNVNkdDlVZGtS?=
 =?utf-8?B?WTdFdFYwUlg3RDRkMXRaa2xYNUNnR3VJYjFlZXRVQXFYWUVhZVlPSkFGMnMr?=
 =?utf-8?B?V2NFOFNlWlBKWHFjaDZIeHFJTm55Ry9CTkZVWXZmenhwNlRHeFlzajhlYkVF?=
 =?utf-8?B?TE9uLys0RXZWZzVLaGE5ZDdzbkpUQlZKcXA0RDlLZjg1TSswbkNHVmZvcloy?=
 =?utf-8?B?M2RPUG8xaDNkaENXMnZRcWFYV3dZWjFYeEdUU210MGhEZWtCT3BqanpMeWhq?=
 =?utf-8?B?V1NIWTRSTGtQa1hPbUN4aGxyaDIvWE4zR1N1T2JhUmE4WjVBK3BxT0NYTGxq?=
 =?utf-8?B?ZEpwNEcvTElDVzZHa2pySTROMGZrMUgybG1RNHNaTDVPakxzOFRGdHlaVzRt?=
 =?utf-8?B?cDA2aWo4a0VPemdZaEZnK09tUFoxdU83bEo2ZCt3SFFzYlNQa0tVMHZqdVVX?=
 =?utf-8?B?amwvcDIySXFlWWpJaEk2LzRCR2QrSE12NzBuOFpSQlZLZGRpWnJDdz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d27a221-2e55-471e-3821-08debd2eb13c
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 03:02:17.5149
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mbkFFaR5+Q2ALcULuGSZ2wIi8muHD/jEjUt781E7nL5NlSTdbDJCiwSDa5oenbZ4sUqUE4j3CcfzkK3xQt6BmXDb/93ITn98Vxq07zYF0a4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB8514
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amlogic.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[amlogic.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-37654-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amlogic.com:email,amlogic.com:mid,amlogic.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 475415FC950
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Linus,
    I don't see these patches in the for-next branch yet. Were they 
intentionally left out?

On 2026/5/12 04:26, Linus Walleij wrote:
> On Thu, May 7, 2026 at 10:21 AM Xianwei Zhao via B4 Relay
> <devnull+xianwei.zhao.amlogic.com@kernel.org>  wrote:
> 
>> Add pinctrl bindings and driver about for amlogic a9.
>>
>> Signed-off-by: Xianwei Zhao<xianwei.zhao@amlogic.com>
> Patches applied!
> 
> Yours,
> Linus Walleij

