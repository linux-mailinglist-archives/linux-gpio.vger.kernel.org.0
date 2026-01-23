Return-Path: <linux-gpio+bounces-31001-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CBHQL+ZQc2kDuwAAu9opvQ
	(envelope-from <linux-gpio+bounces-31001-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 11:43:50 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC63747C8
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 11:43:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4F3B530705BD
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 10:41:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A802A36D516;
	Fri, 23 Jan 2026 10:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="bEukiRcW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E7B369962;
	Fri, 23 Jan 2026 10:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=91.207.212.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769164886; cv=fail; b=vAYsup1A24mYXY0TplWk9RrOI2yIQB9/A4pCp+Be7yKOfUzizPiB0Js9glWs2KFkFfywiQv+YalFiLy+Y6J83qD1MTZB0+ae81uDsUiityFemkQE/wr7b3ohe+hClghe6OXlz7/R8mIajBmDoE+TYJyxQF9XsoMDyplGDac3cH0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769164886; c=relaxed/simple;
	bh=U8lUaJaGWlAAs2TETk4kOJCGhjfzcuZGqGmxGnfDeIg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=tDbTjDeiO962wE2rIiZbnUDiYWG3Kj9Qr/yuwAfqHrpqyMX3scpXohIsjsRbgZni1Gf+SjZp8gPl9u95106tvEOi2fCQPenjhLPmenKEpjKQA+l+c+aMMoIw+7lVlUAk+yVtUxhpIqRYF8YAtre9P1/su7AxWNus8oVnIjco9Dg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=bEukiRcW; arc=fail smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60NAXSBO2175289;
	Fri, 23 Jan 2026 11:40:10 +0100
Received: from am0pr83cu005.outbound.protection.outlook.com (mail-westeuropeazon11010051.outbound.protection.outlook.com [52.101.69.51])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4bumsf3nec-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 23 Jan 2026 11:40:10 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K0ARa39dLGbLLHu5EaDVIOMU+/b3aGa3lIeIOH8xen1GGsEiLZwKeUI++Gp483AFckg61yQJqX3SLW+i69jn8Tj6GZLbyoHMXQDQNRlxkSiqFaTU/tlYrC6n2qAuMRj4qjd3hLgnBmICZu4m9U+KCEEVkLEHW6imQt3Pr33jxeDoRlZmfFKO/OukUIIQad5BqkCpqJYReBsiNw0JXNzviAs7fSaUCmcbAVEp3YC9MQ2MPUjfHSxWNxkzDh68jsMfKxIXsEa++z4d7LbKklDD84yzZdfO8ceqwzYbhxvX7U5ytiis/I/s/RNzp+toT9CQe9aoyGQ8A9EQ6GO2sMqgdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jvKaTpku3+VOMwDHNkY8LHOf5sEYrcrhx0Ez3oSw4QA=;
 b=M2ONj7GeZA0h+pDvcVA0pfY6On+CbRriYc0rnD4mMqmoP0JdoqVTNKUavsWr3GRPLKF5Hdcnd8X/EEptNwxVD79sIFrROfzXGU5TsSEl2qQHgWzC/vyaVXtM3HarYH2RCkc/Gb0ypgzC+O9Go+GurNuQlwQvbv5KuvIbs8HPiNA18wSKdO1A9Anfig+wUD69Dct8I8Lh4+hWF4pJVmrCH+sW2dlW+9SY76IJA/fUuC3SyXv2hwuq3JqmK2ZSJpKwiqp+QNX3rOX8q/K8gyq5sQk4H8SqNATpIAKsQHuK5oHp4ngZgLfHqwgwhjx8rxk20zerieqWGDfdI5sCjcD3Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jvKaTpku3+VOMwDHNkY8LHOf5sEYrcrhx0Ez3oSw4QA=;
 b=bEukiRcWr7fsm83+5RN3XIfgBg/Tug7VQCu9WI1heo8vUua6hO5RLKyLvDDscmXHyMckSE0y1JyZUYMHP2zppsuPF+8E/TFtEs7RhwPPgKW+K1JHJAAzNMN4ujbNSdBw/XcRTPQieTG5OqavyMkDtQEpyTkril9BnCr/mEvzxWEtfg3huUXoqSOjGyyozk0ZKY7YH73xLgSBZP672tr8avSUAooFpb9jEf/ibYIMHeovAgImYhDdwSzVVSE8l5mZbgiltqsKo161LhoVHnFqgyTu8ZtnY+j+DW/FvSCHGQvZX6It0dzpMZGWu3XpWvZ3b2xVS5Q/R3nrrKF78lxGsw==
Received: from DUZPR01CA0170.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b3::28) by AS1PR10MB5553.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:474::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 10:40:07 +0000
Received: from DB5PEPF00014B8B.eurprd02.prod.outlook.com
 (2603:10a6:10:4b3:cafe::38) by DUZPR01CA0170.outlook.office365.com
 (2603:10a6:10:4b3::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.12 via Frontend Transport; Fri,
 23 Jan 2026 10:40:30 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB5PEPF00014B8B.mail.protection.outlook.com (10.167.8.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 23 Jan 2026 10:40:07 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 23 Jan
 2026 11:41:38 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 23 Jan
 2026 11:40:06 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Fri, 23 Jan 2026 11:38:59 +0100
Subject: [PATCH v5 02/12] dt-bindings: pinctrl: document access-controllers
 property for stm32 HDP
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260123-debug_bus-v5-2-90b670844241@foss.st.com>
References: <20260123-debug_bus-v5-0-90b670844241@foss.st.com>
In-Reply-To: <20260123-debug_bus-v5-0-90b670844241@foss.st.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
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
        =?utf-8?q?Cl=C3=A9ment_Le_Goffic?=
	<legoffic.clement@gmail.com>,
        Linus Walleij <linusw@kernel.org>,
        "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        <jens.wiklander@linaro.org>
CC: <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Gatien Chevallier <gatien.chevallier@foss.st.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B8B:EE_|AS1PR10MB5553:EE_
X-MS-Office365-Filtering-Correlation-Id: 72095338-2145-4b45-94e2-08de5a6bc6dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|7416014|36860700013|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T2pBMEM5bmJqZWY5ZmlRRG5qYjh4akk2cks1VTRnbDZHUGtwTnQ5ZG9aUFMx?=
 =?utf-8?B?TDduVjZhMFhDU0RzVjNaWlNoSUp3ZFhpeW1lU1M5QzhOZFIrbG9GOHVoRGwv?=
 =?utf-8?B?aEdTS3U5TTUzRExzTk5FTE1JaEZTSEZFRDh4TUdxdjBTNjk4d3J2aVJDakx4?=
 =?utf-8?B?K1JYUXhNbm5xb3NKNXZoUnhiQVdBRFNUY3N3SlNmYXFUand0Vm1WUWg5ZERp?=
 =?utf-8?B?UlhIY2d1Wk5sTEp5WGswaVZNb0ljcTZrbVdxQzZrb2FSak9mZzBnNHFEc3Vo?=
 =?utf-8?B?QXJpWENveCtzNjBIL1ZuLzI4czVNekRKTlh4NTlSUU1HdFN0djVKOXBLbFhH?=
 =?utf-8?B?dUhMcXE5ZWJiWk93Z0QrY0p3UnNoWkZhUHFpZSt1NWN0c2xSRWN0eFNUbjVO?=
 =?utf-8?B?MWNRTVZFUzlnOTVJZE1hdlpoRGhwN2IraTJTMjR2TUZxK0s3Q3JlMWUweDVS?=
 =?utf-8?B?MGxlOXlJbjlnZ1d2Y3ZDTnNjNnh1bWV1eHlYdXhyZ3dRbWpSVk4wb0I0MGdt?=
 =?utf-8?B?VG45TDR6anpPeUFYZWhwUXFId2JkczZPQ3ZOTnFuYm5aTUhLK0RHNjdYWDRU?=
 =?utf-8?B?SVJadWJzRGhuV1NiVGozYnV6dHpybEhDSVlGTUFNc3JhSmhpekFmYmZzYXRU?=
 =?utf-8?B?bSsybHdzZmVXemtNVHFxMGZPK0pSRmFlcFY4UzdoMVJLNVd3NnJremxjME5U?=
 =?utf-8?B?N3A2QXhtU2pkZi81VGdkL3Y1cTh6dC9yUHZ1SjZ3dVpFSklkSFk5WkZxMDVl?=
 =?utf-8?B?alNVVlNySUhjc3pnaVlpTnZyTlpTL2Y5eWVJS1VQZG5YWXdUQjEwbUwrK1Ux?=
 =?utf-8?B?VzJsbDRJZkpZV3JJYlRRTzZTZ0tHaDk4Q01HVmY1UHRTK25KRnc3UHMvd0xH?=
 =?utf-8?B?YXFWTmZxRVAwbU5seGE3ZEEva2FET1Jlazc0V1A1cUNBbXBvVzdHdEhBTE5J?=
 =?utf-8?B?RGd3ZDBBbGwxSTQ4R1NxekFSSUxqZklyaC9aRDVtNHQzWUUrOEtnV3JDQjZP?=
 =?utf-8?B?SEN3eHlNVzUzckY4WU00VGxHeTJ6RGxZQnp4TG1QcENFNzU3aGtodWJ4Mi9D?=
 =?utf-8?B?NGZQQkc3VFcvdlZ5ZTM5T3QvOEVmY0pnZm96M0FpMkYzYkd0Q0ZjTkVlQjRz?=
 =?utf-8?B?TkMwRHFUVE9yMVhQUExYTzF0UXY4em5MamNTemFaM0w2MEZMS2szRUliU3pX?=
 =?utf-8?B?N1FTQ1piZmN0bncyVEI2b0RmbnE5d3hUQlBRUHV6WEI1SWRwMkNwTEg1YjVa?=
 =?utf-8?B?SDV6RUdPMk5zVW1RZ1J3cXhUQUtKWjdaYmlXREwwVVU2VFdLbnNaUTFsVnpO?=
 =?utf-8?B?RmZaSEJRd2t0b0JoWTBiK0wwck1CUjQwb3VPRnZHc3NIUVUwTC93ZmdqWE5u?=
 =?utf-8?B?TVVwTzZHbVo4dEpxUTd1QTZkQ3RiZXZkQitMcFBSNWxHaWRSQUlpK0hwRHFQ?=
 =?utf-8?B?N0FSVlJLOWtmcUNkbnQ1anN4LzZIVlR0ZWlEMk1ZS1RTWm1sRkZCRHJ0SHY5?=
 =?utf-8?B?M2FVRHI1MFZaR3B2enFmKzZsTnBwa0F3UGFxRXphVkYreThjajV4N3dLTWxi?=
 =?utf-8?B?UXcyRWhEVTByN3hKV1FXYTVGNnIvWnZIS1E0cm5zVlpsNTBBUm5TVjJoVjhn?=
 =?utf-8?B?ZjA5UVBhYVNkOElVNDNRZTVmaEtDYzlwa2dwTXJnc0xWWDFsYXpuSkwyUTR1?=
 =?utf-8?B?NGZkVm9vYThCZTVmYWdDMnJ4bDU5RzdmNHN0ZCtmWWhIa0RQRTU3MHlEb1Q1?=
 =?utf-8?B?WHNteDdMdDhOWGNiQW5nZE9pdU9VM29hNzBUQjVUWjBrdHpkTVhKd3F6Tzl0?=
 =?utf-8?B?R0lvYVpuNkdqMDVneDg3ZHNqZFVRZVNTbVhUcCtDZG1pcEl2c2YrTVlZd0Y0?=
 =?utf-8?B?Z1J1cmtXK3FpZVVxbWFmODNJdlQvK1daQVhrcjNENTRSN25wdUFTc0dmODNo?=
 =?utf-8?B?azFpbWZ3ZTI1RDFoMnZ0VXUwc3NyZ2lGNTUzY2RoSWYrM3Z5UGw1TCtlWjNW?=
 =?utf-8?B?U0hPYjNQV1I2WEZyZUx2bDVjcWsyMEJHUE5lWWtieThiY29ra0N2bGlOTzZt?=
 =?utf-8?B?Y0M3K2Jmc09BVHRyTmhYVkVRY0dSSk04b3l4OGtKbzhzaU1yRmF4N2lOODJx?=
 =?utf-8?B?QkN6UHIwQjlIQ0tlcVJvWmQ3ZnZ6NEZmM2pMNEJRNjdjczMzSWltdE9oSGxQ?=
 =?utf-8?B?eTJnZ1hYbkoxN3dpOGh3ZWpyZkVwOW5NRU5iUXJOTXdtQm5vb2Rham1JVWtm?=
 =?utf-8?Q?v0He+mpmczkKEpZr+aHCGLoxsZwIrpU6A5J+wnxFvI=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(7416014)(36860700013)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 10:40:07.5926
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72095338-2145-4b45-94e2-08de5a6bc6dc
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B8B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR10MB5553
X-Proofpoint-ORIG-GUID: mPQzZgbslGn_HtF6Puvx--86rtGq-gUo
X-Proofpoint-GUID: mPQzZgbslGn_HtF6Puvx--86rtGq-gUo
X-Authority-Analysis: v=2.4 cv=HbUZjyE8 c=1 sm=1 tr=0 ts=6973500a cx=c_pps
 a=QfNz7WxyfdFdmo+E+Fz36w==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=rg8MelPR9j8A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=VwQbUJbxAAAA:8
 a=LS5lh7VHtsIGWKReRLIA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDA4NSBTYWx0ZWRfX2a3Z0c2jwaQn
 VmpiNBJoKZG/SJLixZr7XRBe49OpPcq+QIm7Ken2Vv8AUq8wkpPCJDHaopOAMdj2KFEZ1KtCmYy
 DX1SHHqPBqpRZ54UW2q61M4TJpx6otRBCvSWiDw2TTXSXaXy1ZwiU9YLje1KDjpbe9eOjDUbz5y
 VdSsyHppKxmHyNOgQy+PIhdWemhdIW1DgnvIluNtpJXxw8QA02aQfCUMCIv/mpYrOQeUlNRllsy
 ER6XgU9ShR3JuCz/C8bkGgSxt0rBq7aD8IbXfTcfr5oBQp1hE7ZFwUv3RuJvZ3W+GJNhu4R7TUC
 cdBKaOVKr85B1CzTSHK1E5P5qZuNV/5u4o9tG6VIJHDJD98xjMor5b/qclsMx5aMhZFnEIO34VX
 feHTEBiHGgLryZ/VIwBQ6aG9WL5iDktoRtlnqREPjMDDiYsdlUIEW+HWmoxv/gVB+nMjGqytWwe
 Tb7OVYMuEC1h1B2B65g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_01,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601230085
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[foss.st.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31001-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[arm.com,linaro.org,kernel.org,linux.dev,gmail.com,foss.st.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,foss.st.com:mid,foss.st.com:dkim];
	DKIM_TRACE(0.00)[foss.st.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gatien.chevallier@foss.st.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 2CC63747C8
X-Rspamd-Action: no action

HDP being functional depends on the debug configuration on the platform
that can be checked using the access-controllers property, document it.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/pinctrl/st,stm32-hdp.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/st,stm32-hdp.yaml b/Documentation/devicetree/bindings/pinctrl/st,stm32-hdp.yaml
index 845b6b7b7552..8f8b4b68aaa3 100644
--- a/Documentation/devicetree/bindings/pinctrl/st,stm32-hdp.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/st,stm32-hdp.yaml
@@ -27,6 +27,12 @@ properties:
   clocks:
     maxItems: 1
 
+  access-controllers:
+    minItems: 1
+    items:
+      - description: debug configuration access controller
+      - description: access controller that manages the HDP as a peripheral
+
 patternProperties:
   "^hdp[0-7]-pins$":
     type: object

-- 
2.43.0


