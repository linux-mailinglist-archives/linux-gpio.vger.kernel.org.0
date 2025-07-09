Return-Path: <linux-gpio+bounces-22975-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E987AFE476
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 11:43:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B2264E5086
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 09:43:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A86E4286D4B;
	Wed,  9 Jul 2025 09:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Kh15Nf9L";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="KjDQXB9F"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA9F2857E9;
	Wed,  9 Jul 2025 09:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752054217; cv=fail; b=NFDDNElWLZ93raq7k26T3iTwTn2IA0oNS7IC6QnCP4JkY5SUODZD5erC50yNPvp3zWfAJ2qpDch6OE9aGLobWgbPQARDnEGM2w4X3qkPV1uNwsga5V7ZB91iG+GCiB5zsYoFWE2xgy3GLQD9lrhclxg10pH4rhqMW1MZW4yaWak=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752054217; c=relaxed/simple;
	bh=YNjlaRgWWAxD73dQMMsggyPqrklhH4s9GE5ev7casKc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NcnbWQJY4h+SkdzbJexLuvwh1plabhsqmjsebCP89kEvrkctnpH2J6XZ7EXDuWGEX/18Ydzy+r0lJ2C57BTzNWIu209WlptDwZSe1+aXeWYBAMcAKZNx24IeDjkTciMGgy8fTsPDlckhkHGlY9wIl8aR7cj9xerEJaLmhogmZ18=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Kh15Nf9L; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=KjDQXB9F; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5696MA6r021821;
	Wed, 9 Jul 2025 04:43:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=SoNDHzLXIf3Wqd8eXB
	y4c6cMc4vNXQsjO/N5QaIpUk0=; b=Kh15Nf9LGMpp07+X/s4QCFOFtrxUWZeSeK
	UPGNsx6EGpNUK1My2AD/QDGlzZWnrL2Uo8dfawksxO2D81LH48o13Nqeo68t7JJK
	b1yMWvST2Jay0ZYgwMPJzugN+JmYDxUL/m+3xhN8wYvqmXih6vHDyuthp6LgRJ3d
	nQDT+ZuH5AsD5tdMAqwZ/XyccqQCDQ3Ok5UOErQtgPSQLd2pY2a7AlqjzbOzlz1x
	L0+HpspHKTJP5Knw4IozqAdj7BLDDh1jvr10SGyYgrZNOy+/ugxhETq1s+jT1gFK
	0GiqfdfgAS2QVSNGiJ4Q53CHdATikR4Nf9AEGu507nYiIq3CiW5w==
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02on2095.outbound.protection.outlook.com [40.107.95.95])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 47sev68hpq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Jul 2025 04:43:27 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FWV0J6MtXBAMU1BQafiK2EsJ6bkiLZPKs5RBfDRpA1+aVAa9UxlatZ5IVrpuiiGvyIU7jJIsnIbNfZYdnBsMoY/qtVF7ya8yC1tSG9pLOvVuVjsrvlOOED9Nkt1afBRrCYwd3dqRtBcCo0UmOOdeBrl0tOzK30dXF1e9r4sd1u3tUtpOvL0b6tLDsNuYK5gmGJMXv5IAEHEVzm/uatcbdo+k34m6xa1XlUOcGU2FqsHUlpvJqTgm5NF+2L5Sod1nM7OrXBUci4lO/qhKHX4JZfffVsKBhB2dXMCOLhem+IxXUfX2Tp/CtMNYBjn45NqdTFTqhvNgdQyhdDdnMiOnpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SoNDHzLXIf3Wqd8eXBy4c6cMc4vNXQsjO/N5QaIpUk0=;
 b=ZfGo0XzsnBZqCeUrNc5SDpDq4/Wl82J9I8d7rX4mHRubzz01H1u8vkDvPe9oEgR7fUhn9KR/JYjvRW42pc45cWwl6SCzdRg2UNJIKdNBuoo3628v0Nfs0PqG+XM+D8OeXen+BMuD7Ze67DqjuliIqohGly/FY5UB5zAFSSAiRniLFVaTr/AatkRJWwKxVYr0EMcWkm8DL6DaAnCbHwTU+eDpCLJARS50bIA3yqEVIotkFj6Pd4ZhyKOg3p3kbUHFHBGJuCkW806OgdXRn9KrpAHgxG67Fcmx+lO/J58RN7HmleDs3C/V3lITmoyLRoOtw2sCLwqpeShLQSDXgacQRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=amd.com smtp.mailfrom=opensource.cirrus.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject
 header.from=opensource.cirrus.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SoNDHzLXIf3Wqd8eXBy4c6cMc4vNXQsjO/N5QaIpUk0=;
 b=KjDQXB9FHjwSs6AxX3mqW13RM8lzF2TIbeG5+RK2WCH//djX2H8D6KrqyyAHaMV/H1S9EmQX9hVw6VGI8noTSI0rq8jE8gv8nzTtnfl7dDhMS1MPTT5LDq11vDTOBSjQa8qEi8lqkJaNb3PYOXw4e1ZZLl54/Hj5OTqn43dtBIc=
Received: from CY5PR13CA0002.namprd13.prod.outlook.com (2603:10b6:930::10) by
 PH7PR19MB8172.namprd19.prod.outlook.com (2603:10b6:510:2f7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Wed, 9 Jul
 2025 09:43:23 +0000
Received: from CY4PEPF0000EE32.namprd05.prod.outlook.com
 (2603:10b6:930:0:cafe::e4) by CY5PR13CA0002.outlook.office365.com
 (2603:10b6:930::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.21 via Frontend Transport; Wed,
 9 Jul 2025 09:43:23 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000EE32.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.22
 via Frontend Transport; Wed, 9 Jul 2025 09:43:22 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 6564C406545;
	Wed,  9 Jul 2025 09:43:21 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 5393482024B;
	Wed,  9 Jul 2025 09:43:21 +0000 (UTC)
Date: Wed, 9 Jul 2025 10:43:20 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
        Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
        Srinivas Neeli <srinivas.neeli@amd.com>,
        Michal Simek <michal.simek@amd.com>, Nandor Han <nandor.han@ge.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com, linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 08/19] gpio: wm8994: use new GPIO line value setter
 callbacks
Message-ID: <aG45uJccLEd42TF1@opensource.cirrus.com>
References: <20250709-gpiochip-set-rv-gpio-remaining-v1-0-b8950f69618d@linaro.org>
 <20250709-gpiochip-set-rv-gpio-remaining-v1-8-b8950f69618d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250709-gpiochip-set-rv-gpio-remaining-v1-8-b8950f69618d@linaro.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE32:EE_|PH7PR19MB8172:EE_
X-MS-Office365-Filtering-Correlation-Id: b88676f7-f940-4929-a6d0-08ddbecd0ba5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|61400799027|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kLlVLdiM5WyATJ7SmCe+sUcfVlc7i8hSSWACQTBHpTJ78uL3Y78uxi+de0l3?=
 =?us-ascii?Q?aOb4O2y2Z4dwav/YMUz5+xqjrJ/LsKx5pc61XFJIBoECfLJ6ePzb/KDwHUMy?=
 =?us-ascii?Q?NF4nlYqXeUbzlFoDMFOj7hlBcdU6ZXvhJSgDcdrpo59tH1XVBdFuQquCLP8X?=
 =?us-ascii?Q?7m0YKPAmyXXkenSIvwzI5yFKt4LKANltvRYIeKkFAc4av4Y3Bs6LKwVdXFPO?=
 =?us-ascii?Q?bu028rAHKAPFdA6pzQDQV/dEtqCLr8teIc5oF2Ul4b+0rnWnRxtvKRkLsZXD?=
 =?us-ascii?Q?qNnxC0WDnsCwYZ1LVr0clU8i2jj+SiYnufa+cE7Y5bl52Y71VF8A0rJn2+U9?=
 =?us-ascii?Q?tTZURwWppCyqFzuGbOFfb0Wxvtb0czUl+1kJEqx+P2qIzwukIPoqXZF7/S0V?=
 =?us-ascii?Q?TGaOQHnJ3vgIXf10ArkAsR/ZVTB79Xh8xXRoI1RtDri6ft4jIC4jaOaovf7x?=
 =?us-ascii?Q?Ee1ZQiavelRIDmewOKA3+m+dBtKLkx2bG2TMH1kbP9QVF0a41CwS1Jk0rBym?=
 =?us-ascii?Q?p1zPmL6rL6SmV77CWcVp2XG7TUQYlCeCi+i6NhntJ3SYVG50P313XXNtJmhB?=
 =?us-ascii?Q?5nBtPkeKriYWa9Z6Vnw2LOKZDXzrpguwwWB29k/dxE46162AbaQQYg7gfjVI?=
 =?us-ascii?Q?SPHIg3J4LfKWbct/+5YfI8Io0RqPf1It2NGpDgtVE0b9qSWmMY3derjdUeDP?=
 =?us-ascii?Q?lHQHF1+1TeHXntQrF/9Mils4Lvd+ENQeWsZ+5vHpJxIeoZ7MeQhiKR1Ul1mk?=
 =?us-ascii?Q?mzuIn5xkqUsZCSa6eaygJSlhKPE5c0OWOzX/32J0A7Drb8Li77s7mrEnn8Zx?=
 =?us-ascii?Q?L4PQ5jZ1bOvfvYJgJZ8f4k8Rkhh9iS0YNhBbSPpfmqzTTYO1Ch2dLqzUV73w?=
 =?us-ascii?Q?imrlBg0/nQpj7xUnpZJ+PKVhgrsYsxDpmYKx8eiPUNLj/1uFXYTEiiErQmM5?=
 =?us-ascii?Q?RonyzCmOzk5V28e/D3SmZTgAbNaC5bOtWN4Wi7+D4ZifcUgDBrNmXXgTOzij?=
 =?us-ascii?Q?EvsueE1+uW+RDyJDe85+SjLtX28DjNdIfoqtWzwap3h2Xa3qVt5ZbTzJ2ur2?=
 =?us-ascii?Q?X1qH3KVbeL4980z4GNTvCHOzn2mQtpIt1hJasEl6Dv6sPBez2xj1qQ35U3Pi?=
 =?us-ascii?Q?RAdZis+iZAk7hOyG4I5nEK2wPK5QH0sOVjMA3QE46M1vhMFXgLOjK1sIhvRj?=
 =?us-ascii?Q?Expc83M9bkzvV2Q7Kj3Al7G3ZH2ApmMG6nMYdmsDYimeQsIkivMrpSE8RfIF?=
 =?us-ascii?Q?CInQr4m9o7KPogbne5hXuTOCtFJHPo0zIv2nRufbj9jCyAORUFYyANXCys8W?=
 =?us-ascii?Q?OKydl2BV61jj10t/ey2oMyCVBYUnbX8bddtaGKuuOafOKm/QD42zBkH8q5cI?=
 =?us-ascii?Q?ecivQLs/aViBRIAq1WoeGwNYcZ9+TrhU6BjG5AYd7v3lzxS/zZp/6BfJsiNU?=
 =?us-ascii?Q?Kz+O5FOUN9wnNww3xA+3dD4UReHDqqqZMLFvTXUs4/PQkY06KnzYjRtVUCVi?=
 =?us-ascii?Q?yAiubJBhVrqC3FuFc956hgG0xivMHD3hFX4a?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(61400799027)(82310400026)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 09:43:22.6492
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b88676f7-f940-4929-a6d0-08ddbecd0ba5
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE32.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB8172
X-Authority-Analysis: v=2.4 cv=Zb8dNtVA c=1 sm=1 tr=0 ts=686e39bf cx=c_pps a=v5VeckDjgl4NZUV0hzZxDw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=KKAkSRfTAAAA:8 a=w1d2syhTAAAA:8 a=th__69AfSmJl4DDT63sA:9 a=CjuIK1q_8ugA:10 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA5MDA4NiBTYWx0ZWRfX2sX7vaRG1E+r +/ytZMa+6382ji57jFrnVPonm9nBaDoA7JVPOXeklOGUTKieYJV8i2c0kK2aB2g4CzyU8RjgmYH XcxpYEDwrLEfDk5/VV79+xrQWmXzrFJn/2kodVmZXOErs9pOSt0AGysMq2eEUHODwV7FMW9VBW8
 0ppR+gSv3GAc5lIzNi/XZIrT8qVtBPnsyY9t+khro6Xlk4B62EDSI5NB9cUZWn5Y2d2iH96FeVo WfqCLN+wtLfneN4vkmml//VfH2zfBQ7Wx4/BszSC1DQmDRredUJ9T76xKcE5VS0p0gC8/hkdX2b 6MwgSUsss6WL9Zh4ZysmW7mgr8RLPJ5FQAgOLl9sIv7FUmcKzUhMB87uYvQFGV5+dxXUCVt1xY4
 p33klUWBMjLQq0qYVPfrZWRMLGaty3FOEWqs/keE2+xELsyThorjqdFxAPQwfqeWD+K0Q2I1
X-Proofpoint-ORIG-GUID: UdmvUz-lECkL9MeOE-jA8E4Q-9pAClNW
X-Proofpoint-GUID: UdmvUz-lECkL9MeOE-jA8E4Q-9pAClNW
X-Proofpoint-Spam-Reason: safe

On Wed, Jul 09, 2025 at 08:41:45AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles

