Return-Path: <linux-gpio+bounces-38426-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id flOsKsBnL2pC/wQAu9opvQ
	(envelope-from <linux-gpio+bounces-38426-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 04:47:28 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D61F682EEA
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 04:47:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amlogic.com header.s=selector1 header.b=p2L3glSt;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38426-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38426-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=amlogic.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2726830073DA
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 02:47:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21B0F24E4C4;
	Mon, 15 Jun 2026 02:47:24 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023137.outbound.protection.outlook.com [40.107.44.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317881339B1;
	Mon, 15 Jun 2026 02:47:21 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781491643; cv=fail; b=g0XrLIPfhN2WLMC7TJZtcEBR05UtjzSlmdaR6vbUFc/raXjxfC+RXasBSkaNOgRDJuH09VAEb0v45B8HVcf4rij+t5i6YFK5rFHzgDAJQeLj3DFEJb6Wby1vPdFy1WfjbNfy0BJ9acxVvOuC0/iCYQrm+UPycmFBOKq5RYEc3dM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781491643; c=relaxed/simple;
	bh=JxDHocdnIp1Vzfj2xe7Us1Nv6LR18u55LFh1cb8eAQ8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=fpkLE33o7V+B2jvtIN0ECCZUya4/DQiFN/MUns47d0gfL5dGysFE4v1eWzzuoUtkoEXme9lXCXPqLnVH/472H3s7II6BOJ+KXn0gqfKKgW3cGXRBdiBwPzRiq1FHg3sozilBnwdUP0zCB74k0SDAcZuQG3/7pAIIfh/PdiIyp+Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=p2L3glSt; arc=fail smtp.client-ip=40.107.44.137
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QQl58d4hdChqHe3JIRyB2lnK/h0hD+E/H3t0jzAwHHMyCAzdrXRVvwxCorWajHVB33eSsk8iui664zgDLuWdQEjh/gwn6jcuHR34F2X+aLjW3i3QHCDYqKD29D2OrpbaDmaffiAw8/e7770FIRD/YlAUTVkJtohPfVOVtjqpnVjM9SarLEHGBsb8JXE/B0XwmHq1uJ7Bw42lL6wjgpMw1zJnCaXC3b7CuHr4VJ9pzXdHsde8zoP5xUHgUmUzTsgTObdmhRj5P07wDUiX9KXxsdL6xpa3o4NIFFwuAiT2JkUywK5YUf/IOJ4Qqu4qMXt/Cu7ZQObAOEKZCH39DO6eDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xKz+fEQXy5AR+daBX5bEguEk2Znl7BH+JvY1VqX4VGw=;
 b=ffgcx+uBIaC5f1K8iNddKSKXjAeygiUGG3UFZrES4KY3k1ABFFccsu5SmE50ajHX5rYQiJDM2B40mBHJCZ4AB7xzpSTvHuvNJ7Lr4A1id9r6HZfxvxUO7AS3Cx5dChrPptjq559Zavu7Xzk/xFGhpMfm6r5DyOTQzGYRNFY+G5iEr7PbkEpt+03KIdcKLGui4o7v/maf26ihiFkJBiDHFoFH3t+t1L3rNczS+CW6GLvh4yQD5dYuB2VhuZfQeC6QC5W1+UbhFGmVO9hoc06cP6KqUCaCvLi8anw2zkQklv4Q8oHiUx3vVIeCfVrcK9XdRJykAyGGMO15qWdJpTYD/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xKz+fEQXy5AR+daBX5bEguEk2Znl7BH+JvY1VqX4VGw=;
 b=p2L3glStNdgmmcdtoGWxGq8ephNWNKOJBHT9q3F7iTR2Fb1Fn5w2TsNSTbpcxCy1LUQg6mTRbzhxo4bg48jpMRuzs8MC/E+p8SRcU2jQRQnkRFyNYaFyqMD9D2jAk41vbwBdcyNF9ehpiXZPGGDcoh/68co4B2b+Cj/NUbeKYzpoPsf65MWBaoSet5cKoZKMwDnwxfPq1SAGB2YIw5cg2U50NEo3fpTy1cCUbzaaH7RN0JTIugCcFlx/t+5P5Fb4LFuOCYogF42Genp/dw0b6U4z7W1Sh86umCCQXzE9wUAHLhOtY00UVnkyaT64AAwt2GctO5CPwss7I/mmrTNUmA==
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by KL1PR03MB8217.apcprd03.prod.outlook.com (2603:1096:820:10b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Mon, 15 Jun
 2026 02:47:17 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4%3]) with mapi id 15.21.0139.009; Mon, 15 Jun 2026
 02:47:17 +0000
Message-ID: <a79e58b5-3a11-4593-847d-ba92527549bf@amlogic.com>
Date: Mon, 15 Jun 2026 10:47:12 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/2] dt-bindings: pinctl: amlogic,pinctrl-a4: Add gpio
 irq property
To: Conor Dooley <conor@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260611-gpio-to-irq-v1-0-12201716f23f@amlogic.com>
 <20260611-gpio-to-irq-v1-1-12201716f23f@amlogic.com>
 <20260611-ungloved-snowplow-522e7c0b7a51@spud>
Content-Language: en-US
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <20260611-ungloved-snowplow-522e7c0b7a51@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TPYP295CA0035.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:7::7)
 To TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|KL1PR03MB8217:EE_
X-MS-Office365-Filtering-Correlation-Id: ebf27357-d1a6-4cd7-07d8-08deca8869d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|366016|56012099006|11063799006|22082099003|18002099003|4143699003|3023799007|6133799003;
X-Microsoft-Antispam-Message-Info:
	ZM2cAWM6XnxqO8iBSR1/UEmpbbK2vbtW70sM+P8K/Lykk21Rr0cWzUBs1bQJcs4nF+VroZNuzVE3cC6qCu/sHTdoFwJK+43nGdSiVlSbQaC3k0qXHNcdbl/f1N7+AIwcthq7DZtoFx2V7AKM3W6UAZP3ivltewDdYiJcgXvWdmEC8yGDvcReqDTFVssDB4D5VJy/WGrz9j4wDoRI7Z6Kucc1Q3Wx0HaDOciddSF3qlMn4ZLP0eR0b6gnMGmJ1ZJMYlu6C4JAeGP7ia1jDNYhfgtKPAKrmH8YDW38IqP9veumm3fSe9+ZS0zMaqI9HpnN3ttVfPjF0xpdtvtBaUB+4am9UR8ftlnIJpPGkAKF0FYdSBoEJ9QUG417Q4G8RSil2PWkMHvls+GW8K09je40003+T2arUW2WZUZEe8QTuLnaVJu9L0ktbyesO9KmQfrzkHgI8TPwh3mThLYbSfaU6WhzrBX+87Vx560DsQfRTAOCHZCIBz7NPfQGfVV6NvunKeUeRlFbMvuhLDtHt9ZqUDd5U1r2NtZSZ9fjmbG1FgMZnsTKGzyoGnO8RxQ9LFViM8aY7lY+XGprp2VMjZrjIPeopHXERGFtmSsnoJ1LU4hk7g3672FdtG2txrp1/X4eaM5jSES6/AzO3hHV5ojiUyPlP8+PInYMXiduFVtidfHCNeFxng7UITFrm6hZfkZNtFKT/e4qU5ldy0xi14C7QA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(366016)(56012099006)(11063799006)(22082099003)(18002099003)(4143699003)(3023799007)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dnhlSFpDYTlBbXErVUEyT1Q5eGh5Vzk2cnR3M0E0cU5NV3dabFJudFdXdC91?=
 =?utf-8?B?QUsvVytaaFoxMnNvcEZMRkJsNUdybkIwMUxKdmgwVm96SSt5RzcraWRxZDhs?=
 =?utf-8?B?a29uK2lENXFsL3pkcWNlQ2QwR2lZRDR3V2V2bWJWTi9iTnZPazkvSHRVbTVF?=
 =?utf-8?B?T00xWkV0d1BkQmRKR2RUOGdZK0N0bHhHMDlXMWZMSkFEWFpMQWZZOUJlMVE4?=
 =?utf-8?B?S1UwWDFMbWR4YlJjaU5GU25xY0dPTXV0YU9HeVNHLzVsZUFKS2FnVGM3N2tj?=
 =?utf-8?B?Vi8yZU1hb1hvWU5DQ1ZKWGRPRWJlME5aTXNHeG5FQytuRnNySmhTWndqRFJ6?=
 =?utf-8?B?cDU5a3J0ZkhjTkd3SlFSRW80YTlrQ3Y5YTdqTmhJSVJ4ZzVkV0pJeEdUNVNm?=
 =?utf-8?B?QSs4bnZ0SkJCekFwUjVOMDlZTXZmNFp5SGZ6L3V6OW93VzBMcEVPdDJVTHlT?=
 =?utf-8?B?cGRLcUJqaHphSzRHcFQ1aTNNQXRnV1dmWEwyemFpMCtmd05YREluRk1mRlhh?=
 =?utf-8?B?SmdONjljVnV0UGRBaGFNMGNBNW5lQzZXVVVyYmcwbkgreWhuS003MC9zc08w?=
 =?utf-8?B?bDkwTlVtTVhIQTNzWjVDMzdzMHZxdk5GNkZ6WkZ0eXdpQm9ENHVkbVU3SzJK?=
 =?utf-8?B?cEpmd2p0U1BId1cyUnNkNkQxNkVCeWE3cHpqeDAwTzhJdXZCK0NKSkc4Yk5y?=
 =?utf-8?B?N2lPZlJvNjQwUUIrTDhJZkNmenpmdGRUeS8zRVZhR1A0ZWVGdm4ybWVpaHpX?=
 =?utf-8?B?czdyYjdnSlJlb0puOWVMRUhBK0dvc1BpTXVNUktHb2p6aWpnQjgwVXFObnVm?=
 =?utf-8?B?cmo3dTkzUitoaldSaTZBYkFjSVB1VWRuaE5UejNJaVRpV0JEeS9YMlE5U3hp?=
 =?utf-8?B?bFM5TkQvaTVkRkltdVRhWi9sMnU5cytqWTJFaHM2UWxwZlhQYVIrNGhJWXF1?=
 =?utf-8?B?MnJYT0JzZ1BObkdnaGRQbUFxSFBQaUJTWmE2MXBLNVVBRFdYSjJDSG1DVXBh?=
 =?utf-8?B?L2lmcDNqWGhzOWZEZDFmMnJmSnhSNlB2cmRsNnRySHQweTZnU2tNSFV3WDVm?=
 =?utf-8?B?T01RclFXWGc1bnFYWUwrb1d1K2pWVEdNOUJCL2h1cVlWTHFUR0I3R1M4Qzg1?=
 =?utf-8?B?cGptaFozOGd0Q25UemIyWmtNaThhK2VIdnYwYTg3NmZNZzJjZ0djYnZQOUk1?=
 =?utf-8?B?dHFmdVdLWlZ6aWloZmVaTUxEdFNXVUNuREtuNThjUWZ4RFNodlN4cENOa3Q5?=
 =?utf-8?B?WWtSRm1NblgxWG9yUG83YTgxd1VMamVibG9VREF3cDZ2SE5KeHZIeDE3dlR0?=
 =?utf-8?B?MzVKM1ZUUE1BbnZtSjZLVlh4WWc0Q3p5OEN4OUZjT1JMRDUwSXhmcjlOazZQ?=
 =?utf-8?B?Q1ZNVDV2R1EydVlwUzlIMmRMYy9zZkU4NGw3MUFpR2poS1AwL3pQZWpqYldh?=
 =?utf-8?B?em5kK3JBUVFKZnNsanV5YnZNMEZlN01sNzY4K2JhTjVpN3Y5L3NteWdJdHRt?=
 =?utf-8?B?QmgzK2VHNGM1eVp2NXh1cW8wSHFFNXhERkVBcmtGMHQxRktJbkMwL3oxRlg0?=
 =?utf-8?B?OVpFZEhXQkVWNUJ4NXFsNWxxcmFNM1MyVEJ2aWRmcWhvdEFqNmdNNjlpVXRP?=
 =?utf-8?B?NURSQkY1UlYwNlZhYk1iK0RWWmNEbjNxL2NEM3ZQUm5LNlYrWnFXTHhaejlT?=
 =?utf-8?B?UDZpVkJHejlqb1dlVUI2Q3c0d251L2ZoRUJ0VUl6Qm9SOVAxUmthZXlLdTJK?=
 =?utf-8?B?eitQTlY5NHhBeGNvOXczNmZGS1RYV3lIUzdOMEI2VmVQYnpIaXd1U1liaGRE?=
 =?utf-8?B?MnV2b0s3bzJuT0JZbmNuUEpwbmhxR1I0anA4dUtmQ1BlN1ZtWURXS2E3eUVS?=
 =?utf-8?B?dVpnQWppbHNaZ2k0TEgvV0NFV1lPYUluWk9MMDhHdXE2Y3NML2xvZDhTTkVG?=
 =?utf-8?B?akJ1NC9jRVJmYm0wWWEzNGZiaHc4eHlWRVIycW5EZW1xRWJ0ZEp5OFhHRUQw?=
 =?utf-8?B?MzlaazB4ckkvaFdaVFRkK3d2aXk3VVhYZFFyeDJBUjQwY1lTTVNPclZkZG1r?=
 =?utf-8?B?aGZ0V01mNXNDQzZpU3NHS1NmR1ArOXZRZGhFUTlTTVRnK0RXbVlTcHJSYkFL?=
 =?utf-8?B?MWp3UWNxTDdPYWlsSEs0Uk1HaDB2Ync5T1J3RXZsKzh4NG9Mazh3M1VCZWpa?=
 =?utf-8?B?VXBKeEZJUHd3M3BLVDJ3eU9wa1ArWTErZGd1ZnFUbS9PVGp2b2tTSVFSblAr?=
 =?utf-8?B?T3RUQ2l2cGJYdGdwK3c0a0xnRGtEbHYxSy8yd3RnbVVVOUlodTFBbHFsUk41?=
 =?utf-8?B?T1RZcXRueTJVcDgzY1hJWG0wWUNYV2xSVHJvWUtEam9wWWFGTy9rZz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebf27357-d1a6-4cd7-07d8-08deca8869d1
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 02:47:17.5716
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mgrVLgytZs1aLsWEXIwodusZC5ocNUC9xvsKx6/ncXGhPH6JmualO4NQT4/Ys/e2q0kGsAckq1ea9fd7j0CdMBiX7AvNKB4TDrkoGCIxvNI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB8217
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amlogic.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[amlogic.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38426-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:conor@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:martin.blumenstingl@googlemail.com,m:linux-amlogic@lists.infradead.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:martinblumenstingl@gmail.com,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1D61F682EEA

Hi Conor,
    Thanks for your review.

On 2026/6/12 01:39, Conor Dooley wrote:
> Subject:
> Re: [PATCH RFC 1/2] dt-bindings: pinctl: amlogic,pinctrl-a4: Add gpio 
> irq property
> From:
> Conor Dooley <conor@kernel.org>
> Date:
> 2026/6/12 01:39
> 
> To:
> xianwei.zhao@amlogic.com
> CC:
> Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
> Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley 
> <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin 
> Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
> Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
> linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, 
> devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
> linux-arm-kernel@lists.infradead.org
> 
> 
> 
> On Thu, Jun 11, 2026 at 07:54:33AM +0000, Xianwei Zhao via B4 Relay wrote:
>> From: Xianwei Zhao<xianwei.zhao@amlogic.com>
>>
>> Add the hw-irq property for each GPIO bank and enable interrupt-parent
>> for pinctrl so that gpiod_to_irq() can translate GPIO lines to IRQs.
> Uhhhhh, what? Why can't you just use the normal interrupts property?
> 

The interrupt cannot be used directly because the GPIO bank only 
provides an IRQ base, which does not have a one-to-one mapping with the 
actual hardware interrupts.

On Amlogic SoCs, GPIO interrupts are handled through a mux. Multiple 
GPIO pins are mapped to a limited number of real interrupt sources. The 
implementation can be found here:

https://github.com/torvalds/linux/blob/master/drivers/irqchip/irq-meson-gpio.c

To use a GPIO interrupt, an unused hardware interrupt must first be 
allocated, and then the corresponding mux register must be configured. 
This allocation and mapping are already implemented in the existing driver.

In that driver, the mapping is performed dynamically rather than simply 
calculating:

irq = irq_start + gpio_offset

If the interrupt is used directly, only the GPIO index can be obtained. 
The real interrupt number cannot be derived by simply adding an offset, 
because the hardware interrupt must be allocated first. Pre-allocating 
all interrupts during initialization would prevent later GPIOs from 
obtaining available interrupt sources.

Perhaps other names would be more appropriate here, such as "irq_start".

>> Signed-off-by: Xianwei Zhao<xianwei.zhao@amlogic.com>
>> ---
>>   Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
>> index b69db1b95345..65ec9121300e 100644
>> --- a/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
>> +++ b/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
>> @@ -37,6 +37,8 @@ properties:
>>   
>>     ranges: true
>>   
>> +  interrupt-parent: true
>> +
>>   patternProperties:
>>     "^gpio@[0-9a-f]+$":
>>       type: object
>> @@ -65,6 +67,9 @@ patternProperties:
>>         gpio-ranges:
>>           maxItems: 1
>>   
>> +      hw-irq:
>> +        $ref: /schemas/types.yaml#/definitions/uint32
>> +
>>       required:
>>         - reg
>>         - reg-names
>>
>> -- 
>> 2.52.0

