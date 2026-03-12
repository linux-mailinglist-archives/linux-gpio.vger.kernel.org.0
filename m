Return-Path: <linux-gpio+bounces-33250-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6MUzAJutsmlGOwAAu9opvQ
	(envelope-from <linux-gpio+bounces-33250-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 13:12:11 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 95FE72717CC
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 13:12:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C47A5307B7CA
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 12:11:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3721B3BF68F;
	Thu, 12 Mar 2026 12:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="g4JdTgZL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011033.outbound.protection.outlook.com [40.107.130.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8D531F997;
	Thu, 12 Mar 2026 12:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773317441; cv=fail; b=r2UdgRtzOXqzTH0ybYJKIDiLwK5H26GuCkHFrYV11fvxTc8+jxXOeaagvvMHBTm6CEcLLzaH/qBdDSxanDkNYLQauOMiApSl7DMpp8BMJcmqm/srllJTpTv80/S0Ajz0GRfPLPMOY98Te/fTa2Z4w0GYPHC6conE3a9QvjbDM04=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773317441; c=relaxed/simple;
	bh=HrmUt4H5be2vlehkJZbfPwcBvjH+ghG7zw8wUgQAAdg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=mc/0M634To6W2/U/bQ9Hq7uXcDrITX5pAEm4YdvW3cnYoqnN/ntPTrr0PMAulq9cSLRdAUrZslKZrq6pDNEDn9Ruvq0rsHyT0ZAEI1MIxOSrfa91HdryMdvjOck+HhhrNvzYp1qHKp/ebCtCsOzoEgB+GyAnKkyOor/YdYp9edI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=g4JdTgZL; arc=fail smtp.client-ip=40.107.130.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LwwFk3gdZtFI7OS0im0EDFH2MDB7imvgANGxl2VCv6DFKPjZlQtTxzx5pLVcCVf3MFbp5tQ6d+MKez58Gfd4m3H2qK0QShZtWMXGP9S1BPUS/Ko28lVBk3mN6KeFh8swP403KeNJ6eiwrwwe9/Tk25iS6qXJ3aSzGIv2mzEVVhC4fq1FZ+60lTLypk02pDjzClE/5KicuvV14TtlGfq3q3SFq+j1XCDm+CAFd0uYROrK72zkczVJRCVNypeIT+oI2HWA0272EU7zzwJpdisMcWOcHMowThq2cZQ3HEr7VnvJyfezVsbw5TLjtzvafOLq1CBYJisvFH6hwOI+ib/3Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5SP9tbqSAbZOTl7IkJ5Lu7yLKFV+r3s9kSp5RAVzkYE=;
 b=iTwqvqbz5XzTl3mMwWK6bIli4PIsn7zs4WEjUVGyEDEWKuiPUjWrXx9qGYPgvfohTyPbpdEMGeqga8KrLLpXoaheoAqfj2N7cMQ20tws5gcAQlx6tq9R6ndsA/LY1+3znuP65vDv4zbMSt0KyO76iiO+uo2UkJ+WpJ4q1DvarQ8azRsCJXcQ5BXKBAzT0bFrHuADhvg6+70h7OJGVGevV9cUkNO0VbqeLrBsc2xCYEx5fSAc94YKfhiHJFilFUxG8ZLtjM5OF7K2gQlDB+TmfQGz3LM/nESxb82Fj2bCkdVXM0VG3Q/3Z4lGiWkVN+GA6nZ9mNtP7zNdPYwwEDeA8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5SP9tbqSAbZOTl7IkJ5Lu7yLKFV+r3s9kSp5RAVzkYE=;
 b=g4JdTgZLNxOsxB+KaT5/N2LHq3shbx3MFQn0Jcmr4Ovi8DhtJcpseoNVASPRoAXkR4u09xjEm119rc95zTdtVeLtWiKCDmml6OPFghVDKX9DklXSh4jhfl7V13hxKnhGu4ZTuYuElXZ2SJ4ixnCKmTjEHjIfutJ5I9xJLQLVWOxmvDU12v1nvDk2EhFa5w07lsdq1LBFxTZoxa1cKjTdGd3PXwE0QoZSx5MeRtvmqa2af6arH8L6KHvA5v8MaRRol4v0F5/2Uya51IUEjBrf7GR9h/G7T/tKGh1ApWFAGWutOn7duuEn/CAjFan7BECoDTKdO4oLxX/4au9ad4x7Jw==
Received: from DUZPR01CA0149.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bd::25) by AM0PR10MB9583.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:6fd::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Thu, 12 Mar
 2026 12:10:32 +0000
Received: from DB5PEPF00014B8F.eurprd02.prod.outlook.com
 (2603:10a6:10:4bd:cafe::9a) by DUZPR01CA0149.outlook.office365.com
 (2603:10a6:10:4bd::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.27 via Frontend Transport; Thu,
 12 Mar 2026 12:10:26 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB5PEPF00014B8F.mail.protection.outlook.com (10.167.8.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 12 Mar 2026 12:10:31 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 12 Mar
 2026 13:12:46 +0100
Received: from [10.48.86.79] (10.48.86.79) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 12 Mar
 2026 13:10:30 +0100
Message-ID: <521dc906-e26c-4a47-af07-137ce00b176d@foss.st.com>
Date: Thu, 12 Mar 2026 13:10:29 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/12] bus: add stm32 debug bus and coresight support
 for stm32mp1x platforms
To: Linus Walleij <linusw@kernel.org>
CC: Gatien Chevallier <gatien.chevallier@foss.st.com>, Suzuki K Poulose
	<suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>, James Clark
	<james.clark@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Leo Yan <leo.yan@linux.dev>,
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, <cristian.marussi@arm.com>,
	<jens.wiklander@linaro.org>, <etienne.carriere@foss.st.com>, Sudeep Holla
	<sudeep.holla@kernel.org>, <coresight@lists.linaro.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>, Antonio Borneo
	<antonio.borneo@foss.st.com>
References: <20260226-debug_bus-v6-0-5d794697798d@foss.st.com>
 <ed019efc-d1e0-4e77-bf9c-79da40f0c707@foss.st.com>
 <CAD++jLkkVcRrT=NRyFD6s9=MYaOQSWun0v4z3z01BZoQ2tTvDA@mail.gmail.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <CAD++jLkkVcRrT=NRyFD6s9=MYaOQSWun0v4z3z01BZoQ2tTvDA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B8F:EE_|AM0PR10MB9583:EE_
X-MS-Office365-Filtering-Correlation-Id: 19df66d8-90b8-48fa-7fe6-08de80305bb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|7416014|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	e7DwyLvanSAM7Z3lixpfV/146yNRKTbcaqUPYCoE9fEoMtuyWMsDldRhuKDqBLJqnS8MGEZFZMZ1rXmLsckcxKu0QGPHHQ6DzCsAK521x+qiQgDhveRE0q1LOoqMLVaeh7E7FOFD9zTMvKu5KQJv+5ktaWWB6rfqF6kDaiMLInS0ArQTTQmxGvMqun4P0a/C3EgRKbRQpmExEOagXanE5tZo/ZXBOVq79JaJEYD8FdJX+6ZK0p6UFDoBoM73LkMD1Z4w73a7ppy9qlG+axjYlkVq101NWZT6+H1S7wtCl55DTTXXoe6Wzc/Eim3Z3pRK2ZYqwlpPVEHFkMOPB24koIUK+vwamI+z7yOVA8LVIPoRMOOE9uTSus2x38ekqOL2kUUcFshoWGrE5e9PXka4RW9iZL4A454XiSqILb/GrRK/BWkap96nOMxFGKpzTgENXiahRCDTrMHJ4xEyMPMXBr6WreByVpOLDASZ16Zcbhzhqdy1f0qOJ6Sh9YEm/34wd536T57l0xeFKNx4cRKWPTy4exCcPVLhLb9XHcEFT252n7xh+8tgE/ZrPPAkDpG9au564aZskQckdq6gsUx07YIqq3+PfkhcckVMVWVvRmKxeY3BIC5RiRnOYHV1HJzcPMhMjUEy89TKeM0m1doYTeiUuCiCqCj6GDijgYd6Z0w7Y5zQYQ/QCZPCPFMeSBeI/NT2vN3JZkLbKKoNplFZPo4sBBVro5WvY4394APYN6s5v5I6oFZp8DBK6nEz00mrFgQ7fzz1jN03Wi1rZoXa8Q==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(7416014)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	o/8/wizWjvk21fAFxvva3W00B+MtIYhrhlHDjwLkdw1j1RWKebVOfOo8uAztDtNWUrCvyOLHpCeBZuVn6YaVmyLJPTOXHZT+lSUBO5VAC6kj/sOs0TjHsFLcz+dv/F+mNKZXv9esY5Q7NeZDIbRbj7/YqAY6h580XnbQvPC4uTOwRoDdcIUPLi/FXpfrU6hAltdoULsKtOBgsTII4Pp67B29XP8FVw2sCZzV+OCCaqdJ2xN1pR+Ps+MI8JsIW/2tuj1t8D6FLjjPRc+XmXM9pNYfXZJK9z/MZXyA2xJ2xW0k/WnSrGGM4DzaZ1qsZ8HQ/FBda2pjwJrEd8dCMGkpDYZecdCibH2HjGMumb89BMMQ7ZCeoApBKvC5kMlcsptLjO1IPLlqW0m7MjNAddyEaZAU+j6TnjpuCzD+H41igvYCy/ZhHbz+JPGzL/nfayuI
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 12:10:31.7411
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 19df66d8-90b8-48fa-7fe6-08de80305bb4
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B8F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB9583
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[foss.st.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33250-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[foss.st.com,arm.com,linaro.org,kernel.org,linux.dev,gmail.com,lists.linaro.org,lists.infradead.org,vger.kernel.org,st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[foss.st.com:dkim,foss.st.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,st.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexandre.torgue@foss.st.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 95FE72717CC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/11/26 10:28, Linus Walleij wrote:
> On Tue, Mar 10, 2026 at 10:07 AM Alexandre TORGUE
> <alexandre.torgue@foss.st.com> wrote:
> 
>> Patch 1 to 11 applied on stm32-next. Linus, let me know if I take the
>> pinctrl one or you prefer to take it.
> 
> AFAIU you *have* to take it because there are compile-time dependencies?
> 
> I provided my Reviewed-by so go ahead and apply it!

Ok done.

Thanks Linus.

alex

> 
> Yours,
> Linus Walleij


