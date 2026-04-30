Return-Path: <linux-gpio+bounces-35944-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EGDMI9KG82l04wEAu9opvQ
	(envelope-from <linux-gpio+bounces-35944-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 18:44:02 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C324A5EA8
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 18:44:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E9AEF30682CA
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 16:40:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16EAF337BAC;
	Thu, 30 Apr 2026 16:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="Dhl/V2R8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013051.outbound.protection.outlook.com [52.101.83.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1A1478861;
	Thu, 30 Apr 2026 16:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777567237; cv=fail; b=h8xQbvuMIQBPlSwDiKp+PZDJJj3TByGfpxhZMWNaE1VZcOgUbPb6dUjgJ9NM5zR3L40QSeoNzFwHheC2We5oKkS6KmwzS3icMVMwalTvI0u7y6na8Ar0bPum041wEhjLu1LN70fvwdnW7vowagOJ4zb2uUXLHuOGPu1NhMt2ejw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777567237; c=relaxed/simple;
	bh=FTd94LHjIwbVHPG7qJQLJOsh/dEqYi6fZx9NntaioXM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Rr5EdzxR26HT6t4xkydOIY7tCcALuHUPg+HmIdx6+XnkHWieXJ4tyK2MSAqXQM/bYIVU6Eqcxl7mcrN21NwdSPNyF+yj+TPBBDln5aGbPBslqX0H0FA710AOqOVZP3Vo611k2PqCgQ12yMuHg4wjEX5SdFeqF0Eiw7gbhsT6zFo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=Dhl/V2R8; arc=fail smtp.client-ip=52.101.83.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YdnWNO+BPSoDIyNJoGRGbTCI6SZXQzWZmvIct2QNj/V2C+3eeIX7KqrbXN63MNgRC7fAr9e6gHP0pO2hTN/1z7fm9FhgKcjCKuklepyJVJNWCrnS6LGvyHkKdReqeOqXjXMucydCXoTO1l2Lpox04zM3UDcGLo8m5kNzpYusxnoZ3Kc9JOPy0X9AHnpFwVQSepF60bJdxCwayi8JpiIem63QEgW9Ief73Wh1gwqezhN0WYXFuCWs5nM6ITNSAeO8IzCikCaQiygsx3K9AM4yntFcwWORF9kXtwA/fbFP1ihLHX8NTCELR0t8TdL/JISAQ6V1CNNGOhSZZuxPFje/iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O5A9f9O3WvGSqetyu2u0V9bJqhxWK+Svf6RMw4BPDf4=;
 b=VnDWOOcVnHIMWlfvE7U6Oi9zlxCeH12ODWw614cttzIrRuoLUIYzcadZo1FngkTYUnAoXzgAtRj91ukmuQTfxwgw8FEJCKulDr/oXM+4AOrAiCYr0XgTWAIoHSRo8pBpLaV50vzLSurR0ZUdvI6CxMACElJ0g5CRy0QMJXHVLPPjzSpSC1p9+Vcs1lgXOVQB0EMG2lXHoVUY0PQsnx30C3SceVCIDkHoXn9v6udTlF4jAosifsRJx2Crk9RRWNQxKAUP4ahZTsCEaJNPnjOy2gC/QparaGSJTDEeJ/iAKh+faUdwrPQ4T831bIG2mB7eBbgETuDag3ApfjPqU20CXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=ti.com smtp.mailfrom=foss.st.com; dmarc=fail
 (p=none sp=none pct=100) action=none header.from=foss.st.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O5A9f9O3WvGSqetyu2u0V9bJqhxWK+Svf6RMw4BPDf4=;
 b=Dhl/V2R8UaO8M6KCAqbwlPFz5QD8qkJFfP50V7YlEnzc+YJwIGV+cWL4y7jg6vJ+MKPOgtJPwzY6XuAH+Ik/1JAiTxhhCd03tV0Eg7niR6p4P+uaRv0GjW3eLmMUcI7Oe6p0aKPdU4rn0eFgXez94DQspbGd+RSNhRqmGe41wpX8WWpYjy1lIS7UmFITzmb/6e6cvabP1iEbjalyuiGPGdAn0B+viXPA8bmAiVhl23l8uwAlbDzMWXIqOnNBDiIvnf0qkJElMkNV24eYYc05NBQR6fsXbjo7NXjfpv8yDy7wx/+S7s+akiot/bNhemo1fvp5R8KilOxhgMkgd8OF0A==
Received: from CWLP265CA0509.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:18b::8)
 by DU0PR10MB7093.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:42f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.19; Thu, 30 Apr
 2026 16:40:25 +0000
Received: from AMS0EPF0000019B.eurprd05.prod.outlook.com
 (2603:10a6:400:18b:cafe::da) by CWLP265CA0509.outlook.office365.com
 (2603:10a6:400:18b::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.30 via Frontend Transport; Thu,
 30 Apr 2026 16:40:25 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS0EPF0000019B.mail.protection.outlook.com (10.167.16.247) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9870.22 via Frontend Transport; Thu, 30 Apr 2026 16:40:24 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 30 Apr
 2026 18:43:37 +0200
Received: from [10.252.1.69] (10.252.1.69) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 30 Apr
 2026 18:40:22 +0200
Message-ID: <4c526816-b127-43e7-86e9-eee4dc1152bc@foss.st.com>
Date: Thu, 30 Apr 2026 18:40:21 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
To: Beleswar Prasad Padhi <b-padhi@ti.com>, Mathieu Poirier
	<mathieu.poirier@linaro.org>
CC: Shenwei Wang <shenwei.wang@nxp.com>, Andrew Lunn <andrew@lunn.ch>, "Linus
 Walleij" <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	"Jonathan Corbet" <corbet@lwn.net>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn
 Andersson <andersson@kernel.org>, Frank Li <frank.li@nxp.com>, Sascha Hauer
	<s.hauer@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	"Peng Fan" <peng.fan@nxp.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
References: <20260422212849.1240591-1-shenwei.wang@nxp.com>
 <20260422212849.1240591-4-shenwei.wang@nxp.com>
 <22fb5fac-2568-42be-a7e3-7e89d0017eb3@ti.com>
 <PAXPR04MB91850A11C58419C03909145F89362@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <6412a758-4560-4cf1-a0d0-5b24d1a715f1@lunn.ch>
 <PAXPR04MB9185009A17DFDF3D6C8B44E789362@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <6e01e114-e336-4744-b6b4-563ec42e321b@lunn.ch>
 <PAXPR04MB9185A098D894B6A6EBCC13F889372@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <afImuoeHolxGgw3H@p14s>
 <PAXPR04MB9185F2F6DDB55AC56C92D63B89342@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <CANLsYkwvL0Z3+12MD=J+Dc2yAU2T8ypizyG=6AhYoWOh55odHA@mail.gmail.com>
 <472f85bd-42c2-40c6-abfd-b76924797069@ti.com>
 <CANLsYkzt9xUczxSU28u-TfZAAjr0ufZKXAj8Eqfq=45gufXW3w@mail.gmail.com>
 <f7ef3417-eb84-4467-ac72-a9bc8b0c81e8@foss.st.com>
 <21de8440-adf7-454b-acfc-06e50882e075@ti.com>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
In-Reply-To: <21de8440-adf7-454b-acfc-06e50882e075@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF0000019B:EE_|DU0PR10MB7093:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fa9bd02-6a39-411d-7261-08dea6d72d8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|82310400026|36860700016|13003099007|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	58SRUWgayTTxSN+K440MRz5BIQh1G9LVzs9YnMdIblmHPSVrcTSgJiOk4Xu6hq/SFsyoR9+1i+p58yP8s7Zup4FMrvVezBYIlebpSlrPzv581LOCSD/yQL8VemIY2aVMtgxQodJa3wrT/yugRQEeGIGmNT0gQxa+wuwwCo+QNdNpChEqtqlwK32VbEKJzia2bglGZ0xbN1ZrzP0MIRZrgrQz4ukGv6ONa9WQu/NW7SWAr5/J/LUCMxsfnrHubiYnZZqzEmbbmO+Sa1n1FO/w+pT4wzwttJp1Ws9byXFaYlnjRf9HHVbvBpdVSnVUKtcuD1wgkyFFUt0e2bAST05TwVIR3VajA+LypedB3zpeNtTq8gdt+BkjC9sK+BFgaUaV6NXh3lBE0YeoXH12emQcKiFxssMGIp7aSVsi9KwIqeI3KL0mMbTQ7RY10sfTukDrhkUt+0SzntE1ifp+4D4Hin2cUZWG/47DHrilDEJrvOYpUXRaQGmWG2QEyrmoHxC/niqvCTRvwTMaURo8vAwQ4Ag58qKREYPw9mmKtSCT1QN9ZFH6nsYadL5tAy7Tw8SgZJFPdgpfEUUCrC7yHEUl+zmAnUzCBW4RqvZH/RuSGF+IbhCJhHHBBfcs6Jt8J5O28GOmDoqHNt/6Cz8/q+8hv+14mTKc6UG6qNtZR8uSgLMjoBbBMr8Et1pJ1dP7l+DwKNs/yPSJnNzYJ/tGrVGcgqLZTcw6Q3TM0iqiF6Q7p7E=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(82310400026)(36860700016)(13003099007)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/HFH5SNp21P67oj3jgS9VxLOoZTT79GwVQGfmSbEPHWNACZ+zsTXs7daT7VzOAKaBpiJMpUBTSgQJzHL5q/4pFtYVdBMbQfPXixwoOwNZwaaNOIpTxTXgN1QWC/t5cvlmq73yXM0bXnzw/5Q3t9/gJvpMktMiwmpjQzsLOhCN+GuW5Pax/0q1M6vsHiaclTnW3y0Qch9gEIq4whLn7OAwsF1WJxYvE2MfHrhxQjAaGgp2RAyJQHGS7KFLtr8mI7w6+vjjdkGNwuPNn+2TzuIxSIndaFIHXokDa+jLIVkcfxoY7fbyQLxgBbRVHsWA7dnD111eDuM1Z/v32SMPtlfGf5joXsWyqV/if1nimUl6ck4O2pEcfXJZ1nJRXf9j7zyondnOGy65c8dulSvMDozwDIqO9Abv36L++3M9K3tmbxn6rmOAl41qGgCgl/Xi+gO
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 16:40:24.4804
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fa9bd02-6a39-411d-7261-08dea6d72d8f
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF0000019B.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB7093
X-Rspamd-Queue-Id: D2C324A5EA8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[foss.st.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[26];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35944-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[nxp.com,lunn.ch,kernel.org,lwn.net,pengutronix.de,linuxfoundation.org,vger.kernel.org,gmail.com,lists.linux.dev,lists.infradead.org,bgdev.pl];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnaud.pouliquen@foss.st.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[8]



On 4/30/26 14:56, Beleswar Prasad Padhi wrote:
> Hello Arnaud,
> 
> On 30/04/26 13:05, Arnaud POULIQUEN wrote:
>> Hello,
>>
>> On 4/29/26 21:20, Mathieu Poirier wrote:
>>> On Wed, 29 Apr 2026 at 12:07, Padhi, Beleswar <b-padhi@ti.com> wrote:
>>>>
>>>> Hi Mathieu,
>>>>
>>>> On 4/29/2026 11:03 PM, Mathieu Poirier wrote:
>>>>> On Wed, 29 Apr 2026 at 10:53, Shenwei Wang <shenwei.wang@nxp.com> wrote:
>>>>>>
>>>>>>
>>>>>>> -----Original Message-----
>>>>>>> From: Mathieu Poirier <mathieu.poirier@linaro.org>
>>>>>>> Sent: Wednesday, April 29, 2026 10:42 AM
>>>>>>> To: Shenwei Wang <shenwei.wang@nxp.com>
>>>>>>> Cc: Andrew Lunn <andrew@lunn.ch>; Padhi, Beleswar <b-padhi@ti.com>; Linus
>>>>>>> Walleij <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.org>; Jonathan
>>>>>>> Corbet <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysztof Kozlowski
>>>>>>> <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Bjorn Andersson
>>>>>>> <andersson@kernel.org>; Frank Li <frank.li@nxp.com>; Sascha Hauer
>>>>>>> <s.hauer@pengutronix.de>; Shuah Khan <skhan@linuxfoundation.org>; linux-
>>>>>>> gpio@vger.kernel.org; linux-doc@vger.kernel.org; linux-kernel@vger.kernel.org;
>>>>>>> Pengutronix Kernel Team <kernel@pengutronix.de>; Fabio Estevam
>>>>>>> <festevam@gmail.com>; Peng Fan <peng.fan@nxp.com>;
>>>>>>> devicetree@vger.kernel.org; linux-remoteproc@vger.kernel.org;
>>>>>>> imx@lists.linux.dev; linux-arm-kernel@lists.infradead.org; dl-linux-imx <linux-
>>>>>>> imx@nxp.com>; Bartosz Golaszewski <brgl@bgdev.pl>
>>>>>>> Subject: [EXT] Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
>>>>>>> On Tue, Apr 28, 2026 at 03:24:59PM +0000, Shenwei Wang wrote:
>>>>>>>>
>>>>>>>>> -----Original Message-----
>>>>>>>>> From: Andrew Lunn <andrew@lunn.ch>
>>>>>>>>> Sent: Monday, April 27, 2026 3:49 PM
>>>>>>>>> To: Shenwei Wang <shenwei.wang@nxp.com>
>>>>>>>>> Cc: Padhi, Beleswar <b-padhi@ti.com>; Linus Walleij
>>>>>>>>> <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.org>; Jonathan
>>>>>>>>> Corbet <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysztof
>>>>>>>>> Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>;
>>>>>>>>> Bjorn Andersson <andersson@kernel.org>; Mathieu Poirier
>>>>>>>>> <mathieu.poirier@linaro.org>; Frank Li <frank.li@nxp.com>; Sascha
>>>>>>>>> Hauer <s.hauer@pengutronix.de>; Shuah Khan
>>>>>>>>> <skhan@linuxfoundation.org>; linux-gpio@vger.kernel.org; linux-
>>>>>>>>> doc@vger.kernel.org; linux-kernel@vger.kernel.org; Pengutronix
>>>>>>>>> Kernel Team <kernel@pengutronix.de>; Fabio Estevam
>>>>>>>>> <festevam@gmail.com>; Peng Fan <peng.fan@nxp.com>;
>>>>>>>>> devicetree@vger.kernel.org; linux- remoteproc@vger.kernel.org;
>>>>>>>>> imx@lists.linux.dev; linux-arm- kernel@lists.infradead.org;
>>>>>>>>> dl-linux-imx <linux-imx@nxp.com>; Bartosz Golaszewski
>>>>>>>>> <brgl@bgdev.pl>
>>>>>>>>> Subject: [EXT] Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg
>>>>>>>>> GPIO driver
>>>>>>>>>>> struct virtio_gpio_response {
>>>>>>>>>>>            __u8 status;
>>>>>>>>>>>            __u8 value;
>>>>>>>>>>> };
>>>>>>>>>> It is the same message format. Please see the message definition
>>>>>>>>> (GET_DIRECTION) below:
>>>>>>>>>
>>>>>>>>>> +   +-----+-----+-----+-----+-----+----+
>>>>>>>>>> +   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
>>>>>>>>>> +   | 1   | 2   |port |line | err | dir|
>>>>>>>>>> +   +-----+-----+-----+-----+-----+----+
>>>>>>>>> Sorry, but i don't see how two u8 vs six u8 are the same message format.
>>>>>>>>>
>>>>>>>> Some changes to the message format are necessary.
>>>>>>>>
>>>>>>>> Virtio uses two communication channels (virtqueues): one for requests and
>>>>>>> replies, and a second one for events.
>>>>>>>> In contrast, rpmsg provides only a single communication channel, so a
>>>>>>>> type field is required to distinguish between different kinds of messages.
>>>>>>>>
>>>>>>>> Since rpmsg replies and events share the same message format, an additional
>>>>>>> line is introduced to handle both cases.
>>>>>>>> Finally, rpmsg supports multiple GPIO controllers, so a port field is added to
>>>>>>> uniquely identify the target controller.
>>>>>>>
>>>>>>> I have commented on this before - RPMSG is already providing multiplexing
>>>>>>> capability by way of endpoints.  There is no need for a port field.  One endpoint,
>>>>>>> one GPIO controller.
>>>>>>>
>>>>>> You still need a way to let the remote side know which port the endpoint maps to, either
>>>>>> by embedding the port information in the message (the current way), or by sending it
>>>>>> separately.
>>>>>>
>>>>> An endpoint is created with every namespace request.  There should be
>>>>> one namespace request for every GPIO controller, which yields a unique
>>>>> endpoint for each controller and eliminates the need for an extra
>>>>> field to identify them.
>>>>
>>>>
>>>> Right, but this can still be done by just having one namespace request.
>>>> We can create new endpoints bound to an existing namespace/channel by
>>>> invoking rpmsg_create_ept(). This is what I suggested here too:
>>>> https://lore.kernel.org/all/29485742-6e49-482e-b73d-228295daaeec@ti.com/
>>>>
>>>
>>> I will look at your suggestion (i.e link above) later this week or next week.
>>>
>>>> My mental model looks like this for the complete picture:
>>>>
>>>> 1. namespace/channel#1 = rpmsg-io
>>>>       a. ept1 -> gpio-controller@1
>>>>       b. ept2 -> gpio-controller@2
>>>>
>>>
>>> I've asked for one endpoint per GPIO controller since the very
>>> beginning.  I don't yet have a strong opinion on whether to use one
>>> namespace request per GPIO controller or a single request that spins
>>> off multiple endpoints.  I'll have to look at your link and reflect on
>>> that.  Regardless of how we proceed on that front, multiplexing needs
>>> to happen at the endpoint level rather than the packet level.  This is
>>> the only way this work can move forward.
>>>
>>
>> I would be more in favor of Mathieu’s proposal: “An endpoint is created with every namespace request.”
>>
>> If the endpoint is created only on the Linux side, how do we match the Linux endpoint address with the local port field on the remote side?
> 
> 
> Simply by sending a message to the remote containing the newly created
> endpoint and the port idx. Note that is this done just one time, after this
> Linux need not have the port field in the message everytime its sending
> a message.
> 
>>
>> With a multi-namespace approach, the namespace could be rpmsg-io-[addr], where [addr] corresponds to the GPIO controller address in the DT. This would:
> 
> 
> You will face the same problem in this case also that you asked above:
> "how do we match the Linux endpoint address with the local port field
> on the remote side?"

Sorry I probably introduced confusion here
my sentence should be;
  With a multi-namespace approach, the namespace could be rpmsg-io-[port],
  where [port] corresponds to the GPIO controller port in the DT.


For instance:

       rpmsg {
         rpmsg-io {
           #address-cells = <1>;
           #size-cells = <0>;

           gpio@25 {
             compatible = "rpmsg-gpio";
             reg = <25>;
             gpio-controller;
             #gpio-cells = <2>;
             #interrupt-cells = <2>;
             interrupt-controller;
           };

           gpio@32 {
             compatible = "rpmsg-gpio";
             reg = <32>;
             gpio-controller;
             #gpio-cells = <2>;
             #interrupt-cells = <2>;
             interrupt-controller;
           };
         };
       };

  rpmsg-io-25  would match with gpio@25
  rpmsg-io-32  would match with gpio@32


> 
> Because the endpoint that is created on a namespace request is also
> dynamic in nature. How will the remote know which endpoint addr
> Linux allocated for a namespace that it announced?
> 
> As an example/PoC, I created a firmware example which announces
> 2 name services to Linux, one is the standard "rpmsg_chrdev" and
> the other is a TI specific name service "ti.ipc4.ping-pong". You can
> see it created 2 different addresses (0x400 and 0x401) for each of
> the name service request from the same firmware:
> 
> root@j784s4-evm:~# dmesg | grep virtio0 | grep -i channel
> [    9.290275] virtio_rpmsg_bus virtio0: creating channel ti.ipc4.ping-pong addr 0xd
> [    9.311230] virtio_rpmsg_bus virtio0: creating channel rpmsg_chrdev addr 0xe
> [    9.496645] rpmsg_chrdev virtio0.rpmsg_chrdev.-1.14: DEBUG: Channel formed from src = 0x400 to dst = 0xe
> [    9.707255] rpmsg_client_sample virtio0.ti.ipc4.ping-pong.-1.13: new channel: 0x401 -> 0xd!
> 
> So in this case, rpmsg-io-1 can have different ept addr than rpmsg-io-2
> Back to same problem. Simple solution is to reply to remote with the
> created ept addr and the index.

That why I would like to suggest to use the name service field to 
identify the port/controller, instead of the endpoint address.
>   
> 
>>
>> - match the RPMsg probe with the DT,
> 
> 
> We can probe from all controllers with a single name service
> announcement too.
> 
>> - provide a simple mapping between the port and the endpoint on both sides,
> 
> 
> We are trying to get rid of this mapping from Linux side to adapt
> the gpio-virtio design.
> 
>> - allow multiple endpoints on the remote side,
> 
> 
> We can support this as well with single nameservice model.
> There is no limitation. Remote has to send a message with
> its newly created ept that's all.
> 
>> - provide a simple discovery mechanism for remote capabilities.
> 
> 
> A single announcement: "rpmsg-io" is also discovery mechanism.
> 
> Feel free to let me know if you have concerns with any of the
> suggestions!

My only concern, whatever the solution, is that we find a smart
solution to associate the correct endpoint with the correct GPIO
port/controller defined in the DT.

I may have misunderstood your solution. Could you please help me
understand your proposal by explaining how you would handle three
GPIO ports defined in the DT, considering that the endpoint
addresses on the Linux side can be random?
If I assume there is a unique endpoint on the remote side,
I do not understand how you can match, on the firmware side,
the Linux endpoint address to the GPIO port.

Thanks and Regards,Arnaud

> 
> Thanks,
> Beleswar
> 
>>
>> Regards,
>> Arnaud
>>
>>>> 2. namespace/channel#2 = rpmsg-i2c
>>>>       a. ept1 -> i2c@1
>>>>       b. ept2 -> i2c@2
>>>>       c. ept3 -> i2c@3
>>>>
>>>> etc...
>>>>
>>>> This way device groups are isolated with each channel/namespace, and
>>>> instances within each device groups are also respected with specific
>>>> endpoints.
>>>>
>>>> Thanks,
>>>> Beleswar
>>>>
>>>
>>


