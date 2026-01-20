Return-Path: <linux-gpio+bounces-30807-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8GRSJvy1b2nHMAAAu9opvQ
	(envelope-from <linux-gpio+bounces-30807-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jan 2026 18:06:04 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C50648401
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jan 2026 18:06:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2F3258CDDF0
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jan 2026 14:16:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D29444BCAE;
	Tue, 20 Jan 2026 14:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="OqcmWN9G"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88CCD44B693;
	Tue, 20 Jan 2026 14:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=91.207.212.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768918065; cv=fail; b=dfatWrZC04WrxAxmC+RX1SMlkNWIAk4MLnJaTE89alJVvqhELDyCuKriXqStCdII7p7VJ+c/IuMksCuY3XokuazHQXzmSjscz0w03cyhdPnwb0IdPUk5EuAqdbGJn0N0xa5kJQFGAKHTu8qvk09fHDqpUrefbhJrBzLsv+5H/rw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768918065; c=relaxed/simple;
	bh=Ue/MmTrgPcnk+jE7ATUy6zSjWznxtEuPXbsQWaInzIY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=X5HpYBAa5LBK0lLch+J6eqfp5TKvOkKMzpZDtyyu20Rprb72AGgohggYNHQ9YVqDdT1NJWTdIaVDxqQXNOVmCnK1W4QoWNWWbR/pW1LF3VuarRsfkVuidI/lk3yg2ke+bOahcupGf/GgTivwWZ2eTgBa8joVXvh4BMqCfh/mtXU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=OqcmWN9G; arc=fail smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60KE4cfL3801853;
	Tue, 20 Jan 2026 15:05:32 +0100
Received: from duzpr83cu001.outbound.protection.outlook.com (mail-northeuropeazon11012014.outbound.protection.outlook.com [52.101.66.14])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4br0e99u2j-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 20 Jan 2026 15:05:32 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kz/JLsM2dy+eFECq3SQgPThhUc0acb6sUEVEl/3v52AW/Yij+hoqdsL1YZ2hMk9rXsCf5ZWvYzTeMBNF/1DLXxeZysJpzc+e+IZ8nSShMwu02Btnk0E0sgBZBDlUROAH3X8q+rl+GW4HJmFuG3GZdeSATZoszgm2PDkFhG0xEWlVXB16CPnHejH+FrWYLVE+Uy8jONUjdbRSEGFynTcWnT64ir2xDNv4MGMrwyhixR5NRvUnwRnWpPwQ/pVVA+Gqmqot1dqr7hEAbRy7S1swryweHGqoRKhCccLReAveJ29M4W+932X9REYgapN1jUjLXYLQtKlIU0loSd/JaaEa3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uK1rkJgbz9vrKgHFg7PMymhJ7f4ARW3zGyiDqMDQpmk=;
 b=zDIf/kSb2mbV2gf8nQjyhE2tdImBhRDChoN/LvAKmxEGEbLZ5F2KmSUJaZoKl25sIZlb9C+eATRCAZQpt62+cIC8oRfK2F/eLZjU5c8WTHZ31xTgKHDZoAg0KJRuj7OQR9Sc0i0p/d3eSEkc8byXTpBipsVTNvFdTdEwKw77tRf5oEiE+Ai5rpQ0oZUn8XjRDvkb00Dqxe4yvcmYJ0QTo5l1qiciAPKMz2uOE7FdUHsFO+qpJsGN1eLrw2l48N46mls9zR2V3fCZqHmEmaV5+/pH4+yr9ifxZd85Xapz18MSH91+S6Bd+T2CpvTyEL+Hqa5ctELlCko93I8U5WJUgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uK1rkJgbz9vrKgHFg7PMymhJ7f4ARW3zGyiDqMDQpmk=;
 b=OqcmWN9GLDwNoXfeDgZOvNRJ6T8dHw3W/MfBJc6hNVFw0qB3dUMARUSpTjQ25XctYu/8V8T1t23bYbemxRncz+7rlud6FTTPayH2B26mhLqld6jnhkDV1KysX2u4233UmmLTBPEK57W0DIZoMyC71SCzz964OyjO7A/E+n1tCi7a2cY7GJRPqtNv1zr1TB9/tkMTb/9rAs1nnn0qO9wKLAQQhNR4YE30JSkLmJ6tey+21kswOlBWrWa2IBpZQgF+7c9B8oWrfoEjGjTJ/K6TgjkgZiXTrfGn6jXeZPo9s9bZntBkdr7ct8oaBM8OSmFJKSxlRgZjEFqaSoJhZ9jvUA==
Received: from AS4P189CA0016.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5db::8)
 by DB8PR10MB3925.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:149::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.9; Tue, 20 Jan
 2026 14:05:29 +0000
Received: from AMS0EPF000001A4.eurprd05.prod.outlook.com
 (2603:10a6:20b:5db:cafe::13) by AS4P189CA0016.outlook.office365.com
 (2603:10a6:20b:5db::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.13 via Frontend Transport; Tue,
 20 Jan 2026 14:05:22 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS0EPF000001A4.mail.protection.outlook.com (10.167.16.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Tue, 20 Jan 2026 14:05:28 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 20 Jan
 2026 15:06:57 +0100
Received: from [10.48.86.212] (10.48.86.212) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 20 Jan
 2026 15:05:27 +0100
Message-ID: <310ab5ef-bd29-44a6-927a-f82239499e60@foss.st.com>
Date: Tue, 20 Jan 2026 15:05:22 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/11] pinctrl: stm32: add firewall checks before
 probing the HDP driver
To: Linus Walleij <linusw@kernel.org>
CC: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan
	<leo.yan@linux.dev>,
        =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?=
	<legoffic.clement@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        <jens.wiklander@linaro.org>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
References: <20260114-debug_bus-v2-0-5475c7841569@foss.st.com>
 <20260114-debug_bus-v2-11-5475c7841569@foss.st.com>
 <CAD++jLmW5_xDnA9UtKynaSzdM8aC439sB_n6suFmLY1TJ0cYbg@mail.gmail.com>
Content-Language: en-US
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <CAD++jLmW5_xDnA9UtKynaSzdM8aC439sB_n6suFmLY1TJ0cYbg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A4:EE_|DB8PR10MB3925:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cdbe002-c766-4de1-84ba-08de582cf799
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TVB5NTFsTitiMVpEWXhpTU9GRTJ0WEpib0E5bURHZ0laTzBPaXlGQVA0Vy9w?=
 =?utf-8?B?Z3FPNkhuV0Nnam9VWG13NElMNDJxdld6bVFjQTliVUVkeXZiS3gxWkxDZFFk?=
 =?utf-8?B?aGF5azBQelN4R0RmaFhIRmRiK1JyQ21ocUVhS2VnY3pOdFRPQzdURHgvUlh2?=
 =?utf-8?B?cnR4ZFJObXh0TllSUHZoQjRTVmVrcFhXMWhDMDBvWFBWZG9VK1ZPVHVzc1NB?=
 =?utf-8?B?MFZTcG5kd2Vsa21FTW1nRlgxN3Z5RS8xZVRHZ3BmeXRPNVR0cXNHL2h1dWpK?=
 =?utf-8?B?ZWdCa0VLVlZCaFlQUDRrQ0ZVZDRxY1QwQlZWdU5nazcrL3pYZWNLRUVkR1V4?=
 =?utf-8?B?N0NZMTQ2S1Urc0toSmhKMHBSM2U5RTJQeFBXVFdLeWZEWjFVWm9ib2Z6WnBQ?=
 =?utf-8?B?VUdiTXFqc2ZaNm1lekZQaXAwUjRMTUtHYjFhRUNaUHFpSmFNNzhGSGN6OUhJ?=
 =?utf-8?B?ekhzMDRNNUlnWG5NRTFBbDZ4aWlkTStUNnJnZlliZ3V0akY1YlljcXV2YjRF?=
 =?utf-8?B?c2NmanU2VVZiNExQL21qUjFkTDJtWU4vSUVkNWZERGw5YlYrOGJ0WmRjZ3ZT?=
 =?utf-8?B?ZS9BazZTSGNVZWNOdnB1MUsxTkMxVGd3d21Cb0VDWnl3Qndxdm5ZQnh4cjUz?=
 =?utf-8?B?N2JKalhsUGJHWElhN1RhS2xGTFkzbkplQ0lsUUEvMEo2NHNvTks4Q2JDM1Rx?=
 =?utf-8?B?SFBhSkNTMkxldWk5VlptVUplUDlZY0F3c0xQZTY4Wkk5dmdDcGtwcHZIa3NI?=
 =?utf-8?B?ak10UmxtQjR1YmYyTThFNkNsUDNEcnhQVUU2L0ZMMFhKaHlRSVljZnZxOGFz?=
 =?utf-8?B?YUN2bU9tOFVRMVR3VkhTZ1pWL0V2RDFEQUZHZ0VnVFFkdHlyUFF1Ky9YNDlz?=
 =?utf-8?B?NHM1aTR4SVFCTW5qTE5wTE9qd3pDVDNrNXBtdDlrM25vSzBRcVFzTGN6WUhx?=
 =?utf-8?B?aTRXT0Y0VFVzL2x2OWhEcWNwY09ab2lIbE1zRHRnY0c2bHBuQmFBU3ZZdWhM?=
 =?utf-8?B?TDBUYTF0K3ZiNlRqbnFUR2pUUXNmTWJBaEtmVTdLVWZuOW1DWHBrVGNTVWpJ?=
 =?utf-8?B?QU5SUW9sRTBRaXZyRURESlgrQVRuUzdCa3JqeUtOS0YwVXU4RzZ4cUJKcHY1?=
 =?utf-8?B?aDJEMlBUTlZqQWd2SU43RDBxbEZmMUE0dGh6dCt1WEFOa0oza1J1c0liMFBw?=
 =?utf-8?B?WDVRRkh4dUlRQzdIRnlwRDJZRytUSEJFeDBvYTU1c0pvcTAxai9xMm1QcTVF?=
 =?utf-8?B?UEgvRnlBcVoybS9MdUdnN3hMQXVlbllGRThXdjN1TUg5YnlYVnR4ejI2N3F6?=
 =?utf-8?B?cFllKzQvUHdvZlZSaU9DWnpXNkk5bnR0bHYvV2Y4RTZoNXNQekFXT1M5NlZT?=
 =?utf-8?B?K2h4Q3ZJeXNGMk1MbXl5V3dySHoyY3RMbjRKeWRUcElMMFJpb2ZkQjhORDhm?=
 =?utf-8?B?WnBPT2Z5bHBKSXFRRi9kdEQvMVlQWDRpR0p4Zkgram5MR2lRQm9TcW1jckwz?=
 =?utf-8?B?TUdvQW5uSk1Ra0NDYlBNTWZuNEkvdnFxSkV0MWxnUnpmKzFvNE03UTBqZDJp?=
 =?utf-8?B?RkEzZkVWVHFHTVZpOU9ySFR1ak4yZ25DMFBlczFqV0NTZTdmenpDYzdjM2JO?=
 =?utf-8?B?L2Frck1kYlFWaVVTeWh5alZJcTJ6bG9yazJDL29tdHZmcEROUmJnNk40Rm5i?=
 =?utf-8?B?emNIdXd3N3RpUHVzVXFMejZVNzZPeTI2NkloamJQMU9mTTJVVEpkbVF3Z1dC?=
 =?utf-8?B?dVB1Q0Y5SGpwSXAxT1NHM29FMllLOTMzSG5kVnh1ZXNXNkozektlOTQvR0FC?=
 =?utf-8?B?VUJqMjdXbXM5QTRhTDE4dTdUb1JQUk04K2FIU3VUSUJOMG95ZlQxME9qc3Bt?=
 =?utf-8?B?aUZqQnB1SGlVV0tGOFVKQnlwQmdoR2ZnRUNLQVNnbWNUM2ZsRnAzb1dSKzZD?=
 =?utf-8?B?K3RWNm1QUHYyMjVqTDY4d0VBVU9ZeGsxYjlsMWxWK21pQ1V6UFJOYTY0dWpq?=
 =?utf-8?B?QzcrU0JHTHJRVmErMGpBVFR3N0I1RG9ZNXdTUUV4aFVFTjg1OFFxM3VuREZh?=
 =?utf-8?B?VE40ODd5aDlUZWs2V3dEN1lFT3NCUE9DSm5DanE0OEd3dGlmejZXUUNyMjZN?=
 =?utf-8?B?Y3ZKQXZJM3pxZWhkV1NmTjRHUGNWNitWS01oS05STldYcWw3Rnk1ZlJKdWZu?=
 =?utf-8?B?bVJ2dHVjVHFDSG9PL1VsRnhNWGc4MjJLNHNFVkYxL3BzaFN6WUZSRkFTL1Vt?=
 =?utf-8?B?MW5tQ1VLVml4bEtJdnU1S2c0aTNRPT0=?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 14:05:28.8151
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cdbe002-c766-4de1-84ba-08de582cf799
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A4.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3925
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDExNiBTYWx0ZWRfXxm+6pC7CxBVP
 OYk8lW8t/HHboamN9aOICkBvQ7rEpl95w3P8lzt5NzYIzfyGOO5s5DiAbYIbHXv0+ryzZ9w24Dy
 Ld4J1grBA5jtIFmmWC+5zQUSyRZ7K5/50TZHxawOnc7MVLphieZCz/xVLUHpLEwz2JSp+2OccIA
 VxZaXJY40VhT75sdQhb1rXmSGuV4iq9kA5AX9lUlCTNSRQofHag1XZstg4BKk/OlBrQDtkQ5pBU
 H2/my5YLYbG15JEQnzSVh2b4ItoFxT1GpETGgUp/IlC96l8Ye/HSngfenujqS7rVtFRU5/lpw3J
 qZlJpV8FA/1OqJDDjLQWc7GwPRYcSyzbbJr/dGin2YKhhDxSRDn1gqch7svt3McDbdSL1TT7Rrd
 CovEor1lHYZfRnfuAzpDpKYbUeq5dtLqX7lGLWpg2GaUrbG+0oXao55iN9b2sd5shkVj3/5duZC
 u5j1K/ZxXzB2BWTrx7g==
X-Authority-Analysis: v=2.4 cv=ZOPaWH7b c=1 sm=1 tr=0 ts=696f8bac cx=c_pps
 a=eFpRzQyoWvhnAo4uHDxzFA==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=rg8MelPR9j8A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=3jc1UR8r757g_BjvJPwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: U9eIyakqq-U99iqUUeShNabjPYAAcFY_
X-Proofpoint-GUID: U9eIyakqq-U99iqUUeShNabjPYAAcFY_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_03,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200116
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30807-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,st.com:email,foss.st.com:mid,foss.st.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[arm.com,linaro.org,kernel.org,linux.dev,gmail.com,foss.st.com,lists.linaro.org,lists.infradead.org,vger.kernel.org,st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[foss.st.com,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gatien.chevallier@foss.st.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:+];
	R_SPF_SOFTFAIL(0.00)[~all];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 0C50648401
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 1/18/26 23:19, Linus Walleij wrote:
> Hi Gatien,
> 
> thanks for your patch!
> 
> On Wed, Jan 14, 2026 at 11:31 AM Gatien Chevallier
> <gatien.chevallier@foss.st.com> wrote:
> 
>> Because the HDP peripheral both depends on debug and firewall
>> configuration, when CONFIG_STM32_FIREWALL is present, use the
>> stm32 firewall framework to be able to check these configuration against
>> the relevant controllers.
>>
>> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> (...)
>> +#include <linux/bus/stm32_firewall_device.h>
>>   #include <linux/clk.h>
>>   #include <linux/gpio/driver.h>
>>   #include <linux/gpio/generic.h>
>> @@ -605,10 +606,50 @@ MODULE_DEVICE_TABLE(of, stm32_hdp_of_match);
>>   static int stm32_hdp_probe(struct platform_device *pdev)
>>   {
>>          struct gpio_generic_chip_config config;
>> +       struct stm32_firewall *firewall = NULL;
>>          struct device *dev = &pdev->dev;
>>          struct stm32_hdp *hdp;
>> +       int nb_firewall;
>>          u8 version;
>>          int err;
>> +       int i;
>> +
>> +       nb_firewall = of_count_phandle_with_args(pdev->dev.of_node, "access-controllers",
>> +                                                "#access-controller-cells");
>> +       if (IS_ENABLED(CONFIG_STM32_FIREWALL) && nb_firewall != -ENOENT) {
>> +               if (nb_firewall <= 0)
>> +                       return -EINVAL;
>> +
>> +               firewall = devm_kcalloc(dev, nb_firewall, sizeof(*firewall), GFP_KERNEL);
>> +               if (!firewall)
>> +                       return -ENOMEM;
>> +
>> +               /* Get stm32 firewall information */
>> +               err = stm32_firewall_get_firewall(dev->of_node, firewall, nb_firewall);
>> +               if (err)
>> +                       return dev_err_probe(dev, err, "Failed to get firewall controller\n");
>> +
>> +               for (i = 0; i < nb_firewall; i++) {
>> +                       err = stm32_firewall_grant_access_by_id(firewall + i,
>> +                                                               firewall[i].firewall_id);
>> +                       if (err) {
>> +                               while (i) {
>> +                                       u32 id;
>> +
>> +                                       i--;
>> +                                       id = firewall[i].firewall_id;
>> +                                       stm32_firewall_release_access_by_id(firewall + i, id);
>> +                               }
>> +                               if (err == -EACCES) {
>> +                                       dev_info(dev, "No firewall access\n");
>> +                                       return -ENODEV;
>> +                               }
>> +
>> +                               return dev_err_probe(dev, err, "Error checking firewall access\n");
>> +                       }
>> +               }
>> +       }
> 
> Doesn't this whole piece of code look very generic?
> 
> Point out to me if something is pin control-specific about it?
> 
> Can't we just add a helper function such as
> 
> stm32_firewall_of_check_access(struct device *dev)
> {
>      struct stm32_firewall *firewall = NULL;
>      int nb_firewall;
> 
>      nb_firewall = of_count_phandle_with_args(pdev->dev.of_node,
> "access-controllers",
>                                          "#access-controller-cells");
> (...)
> }
> 
> Then place the prototype for this in <linux/bus/stm32_firewall_device.h>.
> 
> I think this will be helpful for the next driver that needs to check
> firewall access
> before continuing.
> 
> Yours,
> Linus Walleij

Hello Linus,

Thanks for your feedback. There is already a function to check the
firewall access that is stm32_firewall_grant_access().

However, a helper could clearly implemented to wrap it with the
get when all elements should be assessed, as you're suggesting.
I'll submit V3 with a proposition, let's see.

Best regards,
Gatien

