Return-Path: <linux-gpio+bounces-31611-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6LBiGGqBjGkYqAAAu9opvQ
	(envelope-from <linux-gpio+bounces-31611-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 14:17:30 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B5024124B08
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 14:17:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A08EB301650C
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 13:17:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C849D22156A;
	Wed, 11 Feb 2026 13:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="QJGrTXyN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012068.outbound.protection.outlook.com [52.101.66.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2AB6146588;
	Wed, 11 Feb 2026 13:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770815843; cv=fail; b=kDU3Ou93se+V4Vtl2759igeYof/t95SB8Z1bJgKsQlVDjM19r5YP7acqbdVNsum1sdzSJeycOW85jIx6iCW5naeecTt/m7+7b1AYMiPJAcu8P1QSq9JGJo0y54jbqYoB/VT9fkwA4EvLOISrUAit5pYzuOB1uoHK6sMDFm9uo4w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770815843; c=relaxed/simple;
	bh=rGD6WHWHZFHeveGHBXks+9UxTJ6uBqa4brYu1ZJK/NI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=mtUXDl5gdl0siHoWPwlNsx+ksUzkSZUlTwD5AJ8xNvLEihDR5GlL9FYRZpG5rRfxCodNUjfQIqbPaN2GKzLLl5nFN+YVlxa13L9eAUwAJl/IhomKpgLjV2xMsVDX5cQM5Zatz5m9tBFXaB9xDHYszHboBStOTiPuTk7tXT4BjA4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=QJGrTXyN; arc=fail smtp.client-ip=52.101.66.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RxdywMpoaLy/9RuPeY+FMnQbNK1gmiNsRiGoQNg6iOs9cNr8s6MFYOgwBHuola4hMlWNFfzXWeqwQ4x9C5WnHJaITFMQNeXnWLwPlnQ89n9EYhX0eOk3oZgMgO/h8DeDS9sppGKDL5lSqb++Z2puLFx/cFd5ULDagAD5m4KLK5RM1VOU3XmOhPUVNDhqf/aW58+Sl/psAt1TRQw8gMUao+8M6x8ra28hvVzi8CXT1yjg2yfdzKuPwQyw9oPEyRQtzBHpDnXEsqJBmtSv+B0gDHZ/cXKPRgJTLNUEgNMDm9pw6pC0cq+CDA0/V+VWdLpsjHRvlBARi7xIoOU8FaL2xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E5v4h71xc4M5gl6tLEXGb0An5ZFryfzBXhiGvugsqvs=;
 b=ADg3HwqLqb72T8TB9YA7jetFGnJFZZKIa8JVjiIRW73T6ZlzBtNhW9LQ85HPN44I9Qbd/6zPQB/wty0EzDHH5BHkRl15gt9JAVkmW+ZRLVKtYiDAEsM/tV4uxbQE5hyCKLDR2nuXZXouAt4L6S4i8V0etIIWmScHIAFw1s0sz4tpcP3l4zaR2mPI0h0SQfBmtsN/pUMCUplgLRaJvR4bTM7iKwmScjF24BgzmTIUKDsxLnCmH/TCRHSsTJMzzZuUFG40k+DVrjKsgqEVpW46Pz+qMeywBWG0LTbrU2JRGgD6GqkLrFfR2rJmXlR96rSMP7BT7PM105rk6gC7RfcRtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=linaro.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E5v4h71xc4M5gl6tLEXGb0An5ZFryfzBXhiGvugsqvs=;
 b=QJGrTXyNPcKuOCmoPIQM7fq97wmd8M6/4FgSZ6v1xmjAUUibckZ/dzNLvoO5jhsSIvUc5eUXPKRDc0Lp8JJm5n50NnvjrrGUynnNjz71oZe7+Yq9OM+7GTFuOXwJfzA3ye2c3IwS4gblLPJpgT1vk+hOeTfiKrk0lqZL9HrqhxBukzbSEp/4Ro60LJ+33xPhZQckiknQfJJny+QMrYeLknLdudQGPizDxU+2mDSXv6oF8bjOOTPJyB7A0pYv02iYg+9sn/B0T8I5ze0QTqoYvHWSOGZWHZTNgF25Pa0PFFlUHRvPFn5wNu9rGlUM5pPAOv6WAq3cwWLVa6c+extaFw==
Received: from AM0PR02CA0160.eurprd02.prod.outlook.com (2603:10a6:20b:28d::27)
 by DU4PR10MB8484.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:568::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Wed, 11 Feb
 2026 13:17:15 +0000
Received: from AMS1EPF00000091.eurprd05.prod.outlook.com
 (2603:10a6:20b:28d:cafe::af) by AM0PR02CA0160.outlook.office365.com
 (2603:10a6:20b:28d::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8 via Frontend Transport; Wed,
 11 Feb 2026 13:17:13 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS1EPF00000091.mail.protection.outlook.com (10.167.242.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Wed, 11 Feb 2026 13:17:15 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 11 Feb
 2026 14:18:57 +0100
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 11 Feb
 2026 14:17:13 +0100
Message-ID: <81065373-6e58-4b4e-8304-40d15d1d9b43@foss.st.com>
Date: Wed, 11 Feb 2026 14:17:14 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Linux-stm32] [PATCH v2 13/15] arm64: dts: st: add pinctrl nodes
 on stm32mp21
To: Antonio Borneo <antonio.borneo@foss.st.com>, Linus Walleij
	<linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Pascal Paillet <p.paillet@foss.st.com>, =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?=
	<legoffic.clement@gmail.com>
References: <20251118161936.1085477-1-antonio.borneo@foss.st.com>
 <20251118161936.1085477-14-antonio.borneo@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20251118161936.1085477-14-antonio.borneo@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000091:EE_|DU4PR10MB8484:EE_
X-MS-Office365-Filtering-Correlation-Id: 85f1d529-ec4b-4f06-417f-08de696fdff8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MUNUYmh2MFhOV0gvMlFLMFpxSzZzeVA2SkswZU1RMzVEUTZoRlQ2OWpvNUpY?=
 =?utf-8?B?RTJFUjZud3QvQ2pMUVMrUW9UUjJCWmp3NjVyd29WbzJkeC93Z3F6RCt5bWp1?=
 =?utf-8?B?MFllMkpVZHZRRjBpeTJvTjJ5cWRzU1VTcGoyT0JBSXpwNFdCNTNDQW42RHNw?=
 =?utf-8?B?N1p6d3JTSmlCTHJoaU90b1lyaVJxRG8xeWVqb3JKMlZQMk5wQStxYnZ5RWlR?=
 =?utf-8?B?RDMzWEl6azRYZW4zRjI1OEFQSnQ0czlDdFFaeWN5WkdWbS9DdkJORERlS0p2?=
 =?utf-8?B?dzVtYXJhU3NYT3hzcDRSUEkwbGhIR0VLUGJTckNWWHFTS3BiOTBOM0M0MXQy?=
 =?utf-8?B?UmtuV3RNd3RIam02eTFMMmZPQ2Noc0UwczZBaUJyOFZZUkpQVzkvKzZVZzZN?=
 =?utf-8?B?T0p0OGNwWHpZN1d3WmlTU3JjRHZnaGIzK3ZPVkVWeTZob1ZBcmN2MzNnZVhM?=
 =?utf-8?B?ZFhOSUpDV2o0UW9VVkpHaUdjWVVDc2FsYTIzbzZrdW1xOC90WDM4V2ZyYlh3?=
 =?utf-8?B?bzdEWDRMVEx0Z0pVVlljejdmNHFXdm1vN2dEQmhORllueUdwSjBVblEyTTBM?=
 =?utf-8?B?ZFFiUDVVZkRLSnRJSDNlV21ENnA4Wm96a1phbXBkb3A3c0pLYzYyOHR4UmJ6?=
 =?utf-8?B?dE5OYkIyTjFQbkpPV2dIYVpubFhpVlhkanc2cWU2MlIxMGFKODB2MmVzaEtu?=
 =?utf-8?B?d3RIOWlQT2p3bTkrZUk4bkR3Zm1tYjZGWVYvSjFuK2pOQTJNa1B1eVRFNkE1?=
 =?utf-8?B?bTRsN0F5WXBHWWVHTHc1QjE5Z3g3Zk1ldEhxS0NDNjl3eUFjS3RUMi9ONHFo?=
 =?utf-8?B?MUlRdytsTXZvMUpkUEQ4NkdORmhXMkdSMmZZZTNia0duQ083UDZVS1cxcm1M?=
 =?utf-8?B?WmJkOHQ1Skc5eW51bC9IMnIwSFRWVU5ROXFoaGtSbGh0RTlYS29QdkF6Ymhu?=
 =?utf-8?B?TkoxS25wNVp3Yy9RTE9QUlFhb1JlbkZJSWREWEtWaGtqREROMW1WMFdqVEpM?=
 =?utf-8?B?N1FNblRjanE3cStVRmE3TWRmNUtQeWpldWZiNnE0djVsdml2L0gzcWE0NFMz?=
 =?utf-8?B?MU1NOUtBaGtjV2FNcGlFRkE2KzlQVjlNOUFjSnFEWkRobFhzOGlGdWxWTkhY?=
 =?utf-8?B?RE5iQ21rbFFFd050M2Nka2ZDYXFscGF4bkVQdmQ1QkNTZkxyOW14L28xenFr?=
 =?utf-8?B?ODdvdEd1UGdvRFFvS2RhLzI1TjlaaDBxRVlkT3BFVGpFVG5DRktDME8xV3dV?=
 =?utf-8?B?SlRvaGRpRmV1bkRsZndkVlRWQldHc0RuWVk5MmRHakxIMGlhRXVTZ1RYNFZX?=
 =?utf-8?B?VXhvQWFsZTZmZ1RPdjF3L0w5YjZFaGlacnNIbllaYWd2dE5LcWFUMkNLNnZD?=
 =?utf-8?B?cERoS2JOR0FyMnl6d05mQ1VBRGJrSjQ4aFdEdTBQMDBqN0pxVFZTN2liT2Fk?=
 =?utf-8?B?a3ViTmRTVDR6ZUVVVllBNzByTVVXdDdDMVJpS2syOFg3Y1BWVXJBemtCRWZM?=
 =?utf-8?B?T2xnMlRacnAvY0hISFZLNGREbExQWmRWRHZRN1hsa2hocVNWNFVoM3M3VWNW?=
 =?utf-8?B?WkM2UWlKNGRYRStkdm9FUHhqcWZ6TytvcjhidWpuemdQWk5nWUdyQlRaR0Nt?=
 =?utf-8?B?dzJtbEpjbDZVYVF0SmZtUm53MzRXUDdFZktXdnJUTUZuWWt2Ni95amtBN2VX?=
 =?utf-8?B?WjBUaktTVWFHUFN4VGJNcm9KMEkxbDl6Y0gxUlFGT0tKeURCMW9zTjRQTnM3?=
 =?utf-8?B?RXJNNHFhUU56dk9OSnNEcm5vSTh4N2Q3a0ZCQm9sRk1oMkZZcVdQdmRPd0Y0?=
 =?utf-8?B?cnF1UjlVcDA2bkJ5YWtiaWh5OTFRQjMwNDN0UDlRVklNMTRzdUFNd1JZZ2FG?=
 =?utf-8?B?Wk1aWkVrREs4R2psYy9CUk9JQkJJaTFMQUJoN0dGeXhlRkU3amFIcHlOM2Rq?=
 =?utf-8?B?T2JFdDdhaUd3Kyt5RGd4ZWVyRGpDYkcvZDIvMVBxS05Nc2FpLzhaR3B5SjF3?=
 =?utf-8?B?Qit5RTQ5OHdHWlF1dXd2MHpTSmt4Y2VTR2xoTXZUMEgvNDQwaHlQRVRFd2lP?=
 =?utf-8?B?WWV3eHVpZEgvMWd3WUZGZDNnRjRid0kxVmpuMkhkRG5YdVpkYTVtYzZXWGxm?=
 =?utf-8?B?bDR5UmhqeDNaV0V4VU1EdDE4TUN5clhrYWlRVUdZdFAxdGxOR2pXSW81Ulg4?=
 =?utf-8?Q?WfaiEQRiOvk3JqGwgQigKggQGxbjaAKgvPB5ZCP29UB9?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7416014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	JYW4cUSWgXk1fnh4d1k6UPyZcDELrdNvX2b4IpeBoEJq4CrEQqYVzBEiQsjtNP8AAc78HJAQcAnFb+Wr8QoWLLqsopHI+hE+1SnajEW2RXMB7R5RXhKrv3PMV24mW1VwK0/wdqxdWRfkqy7jTsxtRp0gzHv5Nsmiw8tZYsW5dV97IghOQk5C7lqCdsLjT7GT26VpM6qXr8okEn0V9ng3GXwTanVIDgeZTstmSK0R8/C4BUh4VnIXzS68wk8TRIfqVZ1qUZIFg4L+5gIYvqgXoSScM7RAuCohH7KLF3FDqNhg5vuJua2AUWQnBrR8sgFGR457yzNVy0wQZZyW2Ws3p/fjSP4r+Dt5DivUs8rL9XTCj9WbeRUyC3giVHAcpbwWID95H9Ge7LLnwZXc68PecFaytGERrXRJbHjrNg1EtuIX1ww29UM8BRnFxSvupB4P
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 13:17:15.2147
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85f1d529-ec4b-4f06-417f-08de696fdff8
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000091.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR10MB8484
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[foss.st.com,none];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31611-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[foss.st.com,linaro.org,kernel.org,gmail.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[foss.st.com:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patrice.chotard@foss.st.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[foss.st.com,gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: B5024124B08
X-Rspamd-Action: no action



On 11/18/25 17:19, Antonio Borneo wrote:
> Update the device-tree stm32mp211.dtsi to add the nodes for pinctrl.
> 
> Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
> ---
>  arch/arm64/boot/dts/st/stm32mp211.dtsi | 142 +++++++++++++++++++++++++
>  1 file changed, 142 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/st/stm32mp211.dtsi b/arch/arm64/boot/dts/st/stm32mp211.dtsi
> index 4bdf4b3a39829..fd561a85027c3 100644
> --- a/arch/arm64/boot/dts/st/stm32mp211.dtsi
> +++ b/arch/arm64/boot/dts/st/stm32mp211.dtsi
> @@ -3,6 +3,7 @@
>   * Copyright (C) STMicroelectronics 2025 - All Rights Reserved
>   * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
>   */
> +#include <dt-bindings/clock/st,stm32mp21-rcc.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  
>  / {
> @@ -205,6 +206,124 @@ syscfg: syscon@44230000 {
>  			reg = <0x44230000 0x0 0x10000>;
>  		};
>  
> +		pinctrl: pinctrl@44240000 {
> +			bootph-all;

After a discussion with Alex, it's preferable to add bootph-* properties in board file instead of SoC files.
as done in this series :
https://lore.kernel.org/linux-arm-kernel/20260203-upstream_uboot_properties-v6-0-0a2280e84d31@foss.st.com/

Thanks
Patrice


> +			compatible = "st,stm32mp215-pinctrl";
> +			ranges = <0 0x44240000 0x80400>;
> +			interrupt-parent = <&exti1>;
> +			st,syscfg = <&exti1 0x60 0xff>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			gpioa: gpio@44240000 {
> +				bootph-all;
> +				reg = <0x0 0x400>;
> +				clocks = <&scmi_clk CK_SCMI_GPIOA>;
> +				gpio-controller;
> +				#gpio-cells = <2>;
> +				interrupt-controller;
> +				#interrupt-cells = <2>;
> +				st,bank-name = "GPIOA";
> +				status = "disabled";
> +			};
> +
> +			gpiob: gpio@44250000 {
> +				bootph-all;
> +				reg = <0x10000 0x400>;
> +				clocks = <&scmi_clk CK_SCMI_GPIOB>;
> +				gpio-controller;
> +				#gpio-cells = <2>;
> +				interrupt-controller;
> +				#interrupt-cells = <2>;
> +				st,bank-name = "GPIOB";
> +				status = "disabled";
> +			};
> +
> +			gpioc: gpio@44260000 {
> +				bootph-all;
> +				reg = <0x20000 0x400>;
> +				clocks = <&scmi_clk CK_SCMI_GPIOC>;
> +				gpio-controller;
> +				#gpio-cells = <2>;
> +				interrupt-controller;
> +				#interrupt-cells = <2>;
> +				st,bank-name = "GPIOC";
> +				status = "disabled";
> +			};
> +
> +			gpiod: gpio@44270000 {
> +				bootph-all;
> +				reg = <0x30000 0x400>;
> +				clocks = <&scmi_clk CK_SCMI_GPIOD>;
> +				gpio-controller;
> +				#gpio-cells = <2>;
> +				interrupt-controller;
> +				#interrupt-cells = <2>;
> +				st,bank-name = "GPIOD";
> +				status = "disabled";
> +			};
> +
> +			gpioe: gpio@44280000 {
> +				bootph-all;
> +				reg = <0x40000 0x400>;
> +				clocks = <&scmi_clk CK_SCMI_GPIOE>;
> +				gpio-controller;
> +				#gpio-cells = <2>;
> +				interrupt-controller;
> +				#interrupt-cells = <2>;
> +				st,bank-name = "GPIOE";
> +				status = "disabled";
> +			};
> +
> +			gpiof: gpio@44290000 {
> +				bootph-all;
> +				reg = <0x50000 0x400>;
> +				clocks = <&scmi_clk CK_SCMI_GPIOF>;
> +				gpio-controller;
> +				#gpio-cells = <2>;
> +				interrupt-controller;
> +				#interrupt-cells = <2>;
> +				st,bank-name = "GPIOF";
> +				status = "disabled";
> +			};
> +
> +			gpiog: gpio@442a0000 {
> +				bootph-all;
> +				reg = <0x60000 0x400>;
> +				clocks = <&scmi_clk CK_SCMI_GPIOG>;
> +				gpio-controller;
> +				#gpio-cells = <2>;
> +				interrupt-controller;
> +				#interrupt-cells = <2>;
> +				st,bank-name = "GPIOG";
> +				status = "disabled";
> +			};
> +
> +			gpioh: gpio@442b0000 {
> +				bootph-all;
> +				reg = <0x70000 0x400>;
> +				clocks = <&scmi_clk CK_SCMI_GPIOH>;
> +				gpio-controller;
> +				#gpio-cells = <2>;
> +				interrupt-controller;
> +				#interrupt-cells = <2>;
> +				st,bank-name = "GPIOH";
> +				status = "disabled";
> +			};
> +
> +			gpioi: gpio@442c0000 {
> +				bootph-all;
> +				reg = <0x80000 0x400>;
> +				clocks = <&scmi_clk CK_SCMI_GPIOI>;
> +				gpio-controller;
> +				#gpio-cells = <2>;
> +				interrupt-controller;
> +				#interrupt-cells = <2>;
> +				st,bank-name = "GPIOI";
> +				status = "disabled";
> +			};
> +		};
> +
>  		exti2: interrupt-controller@442d0000 {
>  			compatible = "st,stm32mp1-exti", "syscon";
>  			reg = <0x442d0000 0x0 0x400>;
> @@ -267,6 +386,29 @@ exti2: interrupt-controller@442d0000 {
>  				<&intc GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH>;
>  		};
>  
> +		pinctrl_z: pinctrl@46200000 {
> +			bootph-all;
> +			compatible = "st,stm32mp215-z-pinctrl";
> +			ranges = <0 0x46200000 0x400>;
> +			interrupt-parent = <&exti1>;
> +			st,syscfg = <&exti1 0x60 0xff>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			gpioz: gpio@46200000 {
> +				bootph-all;
> +				reg = <0 0x400>;
> +				clocks = <&scmi_clk CK_SCMI_GPIOZ>;
> +				gpio-controller;
> +				#gpio-cells = <2>;
> +				interrupt-controller;
> +				#interrupt-cells = <2>;
> +				st,bank-name = "GPIOZ";
> +				st,bank-ioport = <11>;
> +				status = "disabled";
> +			};
> +		};
> +
>  		intc: interrupt-controller@4ac10000 {
>  			compatible = "arm,gic-400";
>  			reg = <0x4ac10000 0x0 0x1000>,


