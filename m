Return-Path: <linux-gpio+bounces-31004-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yPVXNWJRc2kDuwAAu9opvQ
	(envelope-from <linux-gpio+bounces-31004-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 11:45:54 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E107487E
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 11:45:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9421F3043D15
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 10:41:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5996E35CBD0;
	Fri, 23 Jan 2026 10:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="URwe0Cro"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C6532571D;
	Fri, 23 Jan 2026 10:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=91.207.212.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769164915; cv=fail; b=l7mKns4wDIKrTL1A3PoQm29/AWjFHwE/xhQyqtV6tzJdbm5YAx3drbqQ75QX75J4uoh70S3xqXBftkK8ALvePpSJqOs+/SlMDQ/gC9KUexDcfq8mQdGQnoKIwBcbk/oapo+YW6yrehSO7rAck8L7CfaK4QimTnzX/ZNgk3D4YFI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769164915; c=relaxed/simple;
	bh=RexvO5DkCQ92It1JC++XDhWogf8nt1bXdmLF2reP5+g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=bdTyjFzx5u/VLw5v+3Ic1ECkyw2P7Vq6z/i2C0/W2QKhoVZmFUw5jfyBKHH/zSvmkFYsng421ibyv/FyM1U38s3kG+nh0SqNjs6vZHHaaXf90rlQsw0KawaNUiezr5/QHwTLWOMTJc4P5nZBtAzlXyhmFavwguaGdjZIz3Wah+8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=URwe0Cro; arc=fail smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60NAZhb72293480;
	Fri, 23 Jan 2026 11:41:38 +0100
Received: from mrwpr03cu001.outbound.protection.outlook.com (mail-francesouthazon11011029.outbound.protection.outlook.com [40.107.130.29])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4but7btd7d-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 23 Jan 2026 11:41:38 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tuNRIzdiEuNAWtmj2wOJ7Rpuhyv7APi8rmiuAGPgZobks+jmFZ8N23LDGQrcJibtQoIeRBk64lGEQ6b52CaVDxMwDE4dAXObP2PK/CU525H/b0qCdjfIWy16DjWNhaYSYZ/SCO1kDeIVvMaFs3nJu+mgaeK2jv3Vcg9DYwS+HAfel5JO6Q+O/9e3iMbhh1rO34puuI5TNhETd0KcuIcvkLUv5vLoLJCct074YVRd3qPUzq9PydqyqS4JnGvdkMqH+urGOktaRTjUaL0a7yv0xiXi/PJPERd0qZ+gaF9HTGP9AhTZXj2/WWwiE5Zz6OWteJyY9pketoAnCFlHb9JNYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p9l9OD5UtJ51yyhOAdrv6McKpN/7vVd0EQ1KH39HGq0=;
 b=InKKmrCEmGCDBQmM4BkM/Qsrmqe4roKuyNWvy7jZikYu00oHMcjDOImhTOQSG87lxsGOIkineOwuDDajaSIwOECv06VioiTcEwkYe1Rvb1n6Z37rzIOYwPjJ6h6RTWhq4KyyNAPMV7W5aerW8EPHYT09HTWLHQlB4jlIPKAuUlUIyiC+ZQw5yn8SKr62n2N6+5RFRt8IOYRAuVP/x1C0AOI9hmwAALkPavP/bIeZqdjiTfRdaxFbQ4rZtjIOW+WdJgbxb65mWFjHpWRpQzSKJpv2OU58R3eGSYjr03rRzuZiqtcSH38c3Oj14lh+NYuaJB11Qmp2+ih9kz9EE/CPHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p9l9OD5UtJ51yyhOAdrv6McKpN/7vVd0EQ1KH39HGq0=;
 b=URwe0CroUkg6Ic40Xu3rcdPJnPn/63W1u8I98xUoay9MESR5qbLftSf1diDWw0bKazDCOJ6Mx/lSXkAE0guNtBI9nQnNe4HrK6qD/vkeTJgRyMK3LYH0/m5rbwVfGaDW2sd5XEr8hulk+P9fax6ZSnRY6vFIxgdKQ2SM3gb2tIz+E2wMQ/1c1LcIFHOj8nfX2HoL/acE/fkS8C+N87p9ohFz4d9x3tzzMKJPpZv+RRowDyJwUglIfWFk9gUDTBDHdHnFXxlTG/u7L8yA/ws+Tgmni3dh8DOD044P5wiZjaxJHipXDv4O4QGlQDJV+fJxRIJiflfch9ajQC+A43chjQ==
Received: from DB8P191CA0015.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::25)
 by DU0PR10MB6955.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:416::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 10:41:33 +0000
Received: from DB5PEPF00014B89.eurprd02.prod.outlook.com
 (2603:10a6:10:130:cafe::c7) by DB8P191CA0015.outlook.office365.com
 (2603:10a6:10:130::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.11 via Frontend Transport; Fri,
 23 Jan 2026 10:41:32 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB5PEPF00014B89.mail.protection.outlook.com (10.167.8.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 23 Jan 2026 10:41:33 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 23 Jan
 2026 11:43:04 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 23 Jan
 2026 11:41:32 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Fri, 23 Jan 2026 11:39:07 +0100
Subject: [PATCH v5 10/12] arm: dts: stm32: enable CoreSight on the
 stm32mp157c-ev1 board
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260123-debug_bus-v5-10-90b670844241@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B89:EE_|DU0PR10MB6955:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d460513-0529-45b1-86b4-08de5a6bfa2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MUh1ZkxUb2pBcWpDZzQ1TjVnQXdRVENMS2d5c0N0WWE2VE92L1VqQ0xKamRQ?=
 =?utf-8?B?eFQ0Q0VYSit4YVl4UFJleHZpblNEN3ZZUTVsN1VTQ2ZkUDNFaGMzanVvenlH?=
 =?utf-8?B?OVFEQm1nZWVacW5wTkh6WUV6NWYwalFvbFI2blRYRlhxVXJiTFRPVDdwRHBJ?=
 =?utf-8?B?M0dVMWg4cnZBNWRSVHhtM2gva1RzSTRIY0dTc1E3OWxOTDJvQTV2SHNIWWRR?=
 =?utf-8?B?VEJDRno5N0lUY3FUbEhjWDVzWEhjTmQyK09NN3YrK0NyUmJRS3lzMmxONXBC?=
 =?utf-8?B?WGJpdy9KUzFOZmxoUDFvd3NKQ002NGtwTGcyNG1leGlqU25qTFZLQWdSZmZW?=
 =?utf-8?B?azN2N2xjTWp3TzdZS1MwWkthKzhwTkxRR09wSzdrT0I4alJyS3lvVEN0UGhN?=
 =?utf-8?B?YStuU1ZYRlVadTA0Y3d1YWd1MUpIZDhsQStSR3hQZmVoSGQ5ZCtOamo1Z3VX?=
 =?utf-8?B?M0FoWUdEcTJIdGlVT2FiMW5uS0lWNmt1dUhlS3RySnR4YWtFSjlEc3dvRldZ?=
 =?utf-8?B?dHBxaDZ6Wk0zUHQxNXVHTlpyOEFaYStnSGJ1SGlCUW5jaEVjOFBkSVNocFly?=
 =?utf-8?B?emRINHIyMURFOWhwQU8vREZOZVN5NVF6R0NXVTNhbE4xK3FRWTQ2dCtocm1X?=
 =?utf-8?B?UVkvQyt5ejhKanRGb0tveG53VTN3NFozVFllRUF2eEVQaG01UWtIWXBkazdO?=
 =?utf-8?B?cC9tL0NwUWtGb2FZcXh0K3Uvb0xGbFhncGNhMnZIQ3czL1NjenRJVlArdlM1?=
 =?utf-8?B?cGgraFlmWG9zN3hRUDgxSGF5bTF5aS9ITGZtMHNNRERXTDZJYVdEQXcweE5T?=
 =?utf-8?B?RkhzWG5vRzBBelNQVXdXRWg3alNJc1NEZTNOQy9wam8xc0tCRm9ja3pPZ1lQ?=
 =?utf-8?B?M3d2ZnFxNVlqbGpXU0xVZWx5bEpGOGRFYlFVcmM1aGsweTVOTmU5VmJKS0hN?=
 =?utf-8?B?cVlHOStRZWJpdzdRVCt4U2M1UG9kZlZqMzRIbDloaFdMdUhWYXdnK05HdXNS?=
 =?utf-8?B?VUNCZnJIVTd4Y2o3NmJ4alVHV1hhSE5zR1liWWRjOWZZMERqUktJR3RHam0x?=
 =?utf-8?B?azJNd292dzFOdVY5ditNdUxlTHlSdGhmTW82dHd1SXkrei82TkJxaUZaZ1VF?=
 =?utf-8?B?MkVuOXFkS1Z5Y3BHNkNMUDlEYXlmUW43MzVWTTQ5WHQ2NnpzZ2JXSzlZeW94?=
 =?utf-8?B?Vzh1SEk2WjV5cUJzRHZ4eGc4QThqbmNFeGFPMGgwaERtOVR3enkzWkFWeVdI?=
 =?utf-8?B?eDJxa2hxQ0ZVckpqZ1krVUVUcEUxcVJrbFlMUXlMWmFWNW05b2VkckFKQXF1?=
 =?utf-8?B?eFpIYm5vN2RkMFdsV1A1MDJ2VldhSC92T0ZMb0c2WjFJaTkwL0tPc2d1b1l2?=
 =?utf-8?B?WjZTN0hHTUhLc1ovYzMzd2ZuTGhYOTJ3c3IraHZYOVdvLzY3QmErRWY2azZo?=
 =?utf-8?B?ei9jN3FReGdOK0ZjSDVxY0tFUzlqMkpqMERNcjErRnJhbGlrbUNHeWRkMjJn?=
 =?utf-8?B?dHZYL3pBNUNxd2x3T0dyK3U4NHJOMkNSUGVwMGpTS1pGZ2ZFUnlYYjdCbmVx?=
 =?utf-8?B?anhHUVVOUjJoWVYwSFlOckdYU3Y1NWpPb2ZHNE5BYytUOC9oSDBuVUZzYXR5?=
 =?utf-8?B?M3VVSERUUHhnc2k1Vi80cXNNQ1diSytOQXlFRHF3UEFsSldUbHEwNW9jMm9M?=
 =?utf-8?B?OEsxUUJ6b1lQQU9yZzNhTlN2QWdRYWkyY2NQQXhLamtIQkYzMDNxOW03aGNR?=
 =?utf-8?B?cDloZDhobzRUV0c3YTI1NHhIcWFKV002Y3JKNk82LzJoay9WeUZjajJkSjI0?=
 =?utf-8?B?ZUFMYUpXSU0zM0h4bDZWWVhHYVJEeHQwVXEvYWpxTUtVUjFxbGRxUmJHM2Fw?=
 =?utf-8?B?cTkrRXNrV3NKTXFVUzIwV0x3QktYam1ucnNRbkxuWWh3cFhHZUZLV0R5WEJ3?=
 =?utf-8?B?alEzVVpnKzhkMmZMa2NOR2NUQ2NnNmo1U2lpV0FKVjNGcnQxeTE4Z1pWRzJ3?=
 =?utf-8?B?bVVUMEg2bUZBVDdNQXlVMU84YTJaKzE3Q2xnRWVjU0s0V2VXNG1SRlVpbmZU?=
 =?utf-8?B?azZucTRWTTBxakdZeVM1ajk4U1NQV2xOS0R3ZERLRVBOZGtBNkxTR1dYWERr?=
 =?utf-8?B?bVc3TXdwSHVvVmh6QzlOS3FLU3hoQWRJVUs2ODBtRDlSODk3NzFxSkVrUWsx?=
 =?utf-8?B?eWhtaTBvbzhrdHZpRUNadkY1bysyKzNadDU0Z0pVS3FwVEp2OTV4UHFPeVRw?=
 =?utf-8?Q?HPcmaEVt+CY8hNLbA7xUMBaHpPMtcsJ+SMN3z0bcH0=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(7416014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 10:41:33.6132
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d460513-0529-45b1-86b4-08de5a6bfa2f
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B89.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB6955
X-Proofpoint-GUID: Ki7H6dZGDI80wSX3FeTwxvmY8mfgpPQY
X-Authority-Analysis: v=2.4 cv=Fas6BZ+6 c=1 sm=1 tr=0 ts=69735062 cx=c_pps
 a=FCXGMy8pXViI/SoB7+PbHw==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=rg8MelPR9j8A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=WyXvt1svF0yAhq5Ft7oA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: Ki7H6dZGDI80wSX3FeTwxvmY8mfgpPQY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDA4NSBTYWx0ZWRfX+Du46mFc4y7U
 vnQEUzVNu52UO68tBubNGxWMRMm+kIuX0k+uQjTm4FNctEZWRy7MXQruPM/0roD940tgWAF4Tfp
 b/k05RltDJDfEgiWX4bZxoYOL7gubx4dvwTt8+x8IJKpkccmlo+X938mggPRwWrBSToQ85pqJdm
 SgzuZ6xu9SJVQJMsd1pUutY89bm0sg/Pv7yVsDdj00IL+3PzUuJIkFIC0SNBMqC/Hl9Aed6VP5P
 +k3RHaEMpl1AUY2Vc+Zi36pgfhe3EZPGB4znbC2RTYNYTgOwHwYV7vmUYpMp5WG+WCJXbPXKqab
 pFFzqbHYkv2FV4lu1JxZml3wl7WaSIY6cNchGpfIYlc00tfFtjeNqm3R74dpwawp/Wvz+BluDvS
 emMqSe1bVkMuoa7f0Wp6gUPTPb67eol1IFLZpLWsXNa3PLrtKsN5inUJs1SkhPUoYxmV0+PcCUu
 ObPO7wWwUYtaq/tGhqQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_01,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 spamscore=0
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
	TAGGED_FROM(0.00)[bounces-31004-lists,linux-gpio=lfdr.de];
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
X-Rspamd-Queue-Id: 39E107487E
X-Rspamd-Action: no action

Enable CoreSight peripherals on the stm32mp157c-ev1 board.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp157c-ev1.dts | 36 ++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp157c-ev1.dts b/arch/arm/boot/dts/st/stm32mp157c-ev1.dts
index e69c8e282c8b..913c20e31196 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-ev1.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-ev1.dts
@@ -81,6 +81,42 @@ &cec {
 	status = "okay";
 };
 
+&cs_cti_trace {
+	status = "okay";
+};
+
+&cs_cti_cpu0 {
+	status = "okay";
+};
+
+&cs_cti_cpu1 {
+	status = "okay";
+};
+
+&cs_etf {
+	status = "okay";
+};
+
+&cs_etm0 {
+	status = "okay";
+};
+
+&cs_etm1 {
+	status = "okay";
+};
+
+&cs_funnel {
+	status = "okay";
+};
+
+&cs_stm {
+	status = "okay";
+};
+
+&cs_tpiu {
+	status = "okay";
+};
+
 &dbg_bus {
 	status = "okay";
 };

-- 
2.43.0


