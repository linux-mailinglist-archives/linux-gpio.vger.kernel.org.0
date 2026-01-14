Return-Path: <linux-gpio+bounces-30535-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E44D1E14B
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 11:32:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C540B3064023
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 10:31:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE9E538A9D8;
	Wed, 14 Jan 2026 10:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="PnqISoYI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67FA38E100;
	Wed, 14 Jan 2026 10:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=91.207.212.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768386691; cv=fail; b=W2vSZNwmfMHzkm9O/6pZKJDjWwNYPEMPQByXvY5NuXhAtJX7nk2jKMqZgnKpAhzpIDQIyWKb+TP7Ylu2b26zwubZUkp4WHSSqOxk7nlGAVIdIIipj3Sz7pEeJ2HQs4GV2WZv0F4ZDM5zubjrmuN43rGJNdR+Lk6dUJ44eoLU6vo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768386691; c=relaxed/simple;
	bh=tFr/7MDTYLaJq9mtReQmXI70UgvA01fMfNXvv9C+9B8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=t+Lj8G4srLtCIrKX8IflZu4g7fbGjQgoweYdl1Wq8/nWk6jAcZaonZkziJiTLH2lRJl3ExozH7lOqsFEp7uO2pl+TJWdhiAmyIIbNqn4yztq+JPmX1gV7pOOk/E7tI3n0B3DqelUnZWc/uTa6fBgvVgg7iKcPe2S26LfiGBuSrY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=PnqISoYI; arc=fail smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60EAEwa43918609;
	Wed, 14 Jan 2026 11:29:59 +0100
Received: from am0pr02cu008.outbound.protection.outlook.com (mail-westeuropeazon11013069.outbound.protection.outlook.com [52.101.72.69])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4bnssjb0bw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 14 Jan 2026 11:29:59 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oimv/3z4JCQMlC3zgmYjvY2Wav3OmaIM3rzz4G/g1ksHdmOdk0BSYKOr7l0X1cXTe1jVMaZ3GRJumJe864eeZtMO7ZfdTUkMb9a88JLMTE/nIv443jBHE4flf6Croyc6elL/GENar3I8ewZWCLaSALClREBy0gq9N1SaMLjaCRcEuTXEi+wUrg6cIxQL0ljQqFk1rH5+69MRNkbmWE0q14d1LPIdwDRtCdxhwiO/jUPi2W6wFiunwHID7uS1T0YRHNd730Cg8jdHX0U7+YuZbx4lSGmAr12rTXMRnIm+q21WAnuXh0PBFaYuA4kiqaY5Ok/Eiy0FuU7QVDX5OEcP8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NOMxOE4z2g2zI+G5rD+++z+6rggQkw8ZFkqGBtAXuLY=;
 b=hG7bqoNGwkTKVJ0hgfX+A3sE7YlcY3iVfJt1d4hxgMv+ouMMqabKfPPS4zK1lilL8u0/Q/mYGZxHvp7ZXgNJrL8cLhSohVgfzEaFVp7JgFIYIORs9ydqjJbNf4ma4P57nVR7FlfU3M1O3n+y7N7Qu5g2LSKBAs1Dfurfevgul/2bjVXQ8kECskDCIEWcg4c51YEBsCIqv5wm4370igC82tLSd8jj5/sjlOP2+KDiWTGtmzL/V47Mep7/BjR6ADS4derVVr74Gn8wG5OOO5AhgRN6yz4Hyhs6CRjxmx9dzNxzarANkPR1jiGcJ5YFquWZLvUkh4JmTz9dY8pZbzDfmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=linaro.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NOMxOE4z2g2zI+G5rD+++z+6rggQkw8ZFkqGBtAXuLY=;
 b=PnqISoYI06dxzBG5sU4iRvH6HWFbRhocS8ahmVyLRG5BRHQxYXkPOGF6IYHWJKUxS/KCZAVR4I6T/Q+N4YD2cb2xtf9CDNavzz5b1BnBav3Vno0gQcXKyUjbxSFrAqg/LtaxzqB20ap6KXjtB3jq+lWNIDKSGiYvlvx2O3PnfdM4likdh269M64fUL3L+D9X1vMwnIy2nRWdU5QnoyecMBN5dhh0teKWQpPBnlTZTU/XC+xoUBEcz45LbXlcyNqq5HbG6KRW2/8m0mHrHO2+h8q9yOfkl3Hidmh2DJlXFoAzWzBj+cCp0JabxZx9Agfamp+opZFnbUOT8WCc56AwoQ==
Received: from AS4P191CA0029.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:5d9::12)
 by DB9PR10MB7339.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:45d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Wed, 14 Jan
 2026 10:29:55 +0000
Received: from AMS1EPF00000049.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d9:cafe::46) by AS4P191CA0029.outlook.office365.com
 (2603:10a6:20b:5d9::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.5 via Frontend Transport; Wed,
 14 Jan 2026 10:29:54 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS1EPF00000049.mail.protection.outlook.com (10.167.16.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Wed, 14 Jan 2026 10:29:54 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 14 Jan
 2026 11:31:19 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 14 Jan
 2026 11:29:53 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Wed, 14 Jan 2026 11:29:15 +0100
Subject: [PATCH v2 01/11] dt-bindings: document access-controllers property
 for coresight peripherals
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260114-debug_bus-v2-1-5475c7841569@foss.st.com>
References: <20260114-debug_bus-v2-0-5475c7841569@foss.st.com>
In-Reply-To: <20260114-debug_bus-v2-0-5475c7841569@foss.st.com>
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
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000049:EE_|DB9PR10MB7339:EE_
X-MS-Office365-Filtering-Correlation-Id: 56b3e8fe-7aa4-4509-7588-08de5357db9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700013|1800799024|82310400026|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QkNyR2E2eXZGanltaE9WNE5yZlU4UGMzbC9zUnczemY2RExseWxIQ1RoQ3hr?=
 =?utf-8?B?eldrTFpDL2ZidmlhMktvdXVyRkZNdDByaWgwekNaUDJWSnJpOTFLcnJZSzEy?=
 =?utf-8?B?ZDNlQVBJR1dJdzZHTUZwTW8yUUtqcUVOR2pOWitYUFdpbHFINXJJQkQ2R25Q?=
 =?utf-8?B?dThjQ25xeW1tSXZTelRvNHJGQ1NhRHdWUUNQS3lpSWRjbzh2eEJIZ3dDRnZo?=
 =?utf-8?B?R1Eyd0h6c1BtOWdmOWhUakhnVzlweWpjOEpRTTlxVlUvWjdMUkJMNlhXVnRB?=
 =?utf-8?B?T3hiQmVUVHF3VU9FR2VMejVUb2FaWHRZYWtOcTVTQWwvS1pBbGFDY1RWS1Jv?=
 =?utf-8?B?TSt5dkpQOVp1RWdEY21oRlpoZ2JzSlYzcXBLK1NIekROOUJ5VCtJK3ltLzlw?=
 =?utf-8?B?Tm9Jd0lUMnoxYlJ3TVh1eFV6SW1kRUZ2QVVtdW52WWtPTUszZGRpV2NjNmhv?=
 =?utf-8?B?eWgzUllVOGs1TWRJZFhKZWtsNndnYnFPOWljTkc5cW1uZjF4alJObzR3M1Z2?=
 =?utf-8?B?NXFybllzK2cyanRDVjRPbWdybTBVZlE1ek0zWno1a2h2RE1hdjl5REJSS3dM?=
 =?utf-8?B?cGt2SmNzNVJIQ21XKzVqZ2d2VG1hY1FGb2lENkd2K0o2cnI1Rnl3NjFrdllN?=
 =?utf-8?B?QThDbUFlQkgycEV1cDBnT3ZtSExPU2Z1RnMvbTdQUFNqUGNMZHhjUUFROUJl?=
 =?utf-8?B?SGJzbnJtU1dFTFA3ck45aDFGYmJPSk1oQmpRek9tcVhQWXZWWEoyVGR6dGRv?=
 =?utf-8?B?bTlZTGxqalBYeHZiM2ZwcmJ2NkxLSFQ1UFNrTFpXRlZPbGJlUW9PcFNNcU9a?=
 =?utf-8?B?a0gveHpxWlR5WlV6dW05TjlSeW1hdkxROVlQVXVEVjY4alQ2NVZQNXFQWGRV?=
 =?utf-8?B?SUFLc1FHeTh4akZmSmhoTEdvNW5aMFZXL1djV0czTW9yUlRETTFkVVBZWGE4?=
 =?utf-8?B?enNrWkJHSHVIdGFzeGhvNVFDN3Z3RDZZWWU1dGFQZGlxcWo2ZUk0d1hDT3Z5?=
 =?utf-8?B?MVVEMWJ5d214L1BpYzJ5aERwMm9BRTFGdXIzSnZYcyt4T0V3dXNTRXNadlBB?=
 =?utf-8?B?V2ZZcVpXYzNETnlWbVdwTU1DRWVCS2tvWCtHNjAvNnlBSHhKWjNJM0FEUTRV?=
 =?utf-8?B?VW9Fb1R4U1ZxbzFpWlhqYVU2WlNrQ1FCanp2YmlpQjRrYmVxbVI1cU1yM2Rk?=
 =?utf-8?B?UU5XeTYwRzNqdGlaWHR1ZVcwL01yV0xkUWhKalFmd3kyQWJlcjdzd1FBK3NN?=
 =?utf-8?B?UVFzU0hCeGVuU1JNT05vUTY5M0VKVjVqR1FyMU9zZnR2RUhBWkZlek5WcHN1?=
 =?utf-8?B?RWdvN0FqNkUzOEJvS2lqWUdiSk1hOTcxZXJPNThBVkJsTEk1cE41QnNnQ0c1?=
 =?utf-8?B?Z2ZmZmNUL2RTZE5HM2dWeGZ1MzFnMnQ4b1VOQUwvYmFiMlcxWnZxeUNPVTNI?=
 =?utf-8?B?T2ozTWw4blVKdVRBdGZZNXEyUkFzY0YzcDM4OUxRbFFEeElpMVhINXh6Y0sr?=
 =?utf-8?B?bENtOGladHhwM2JoYTNOaHpYWG5mKzc4Ny8wYjV6SFNuc0JuaUpOR1FScEN0?=
 =?utf-8?B?eXFJRjRZdnd0eldaYW9ReUFBVDRRNmlMYm5jTXVZSVBrdXVGVDdJV3BVeTZ5?=
 =?utf-8?B?UVJ0ZG4wYzFUY2E2YWYxU2dnRFVkRVBqSHpQUk5JN05xQkcrd3IzRDRoOEtt?=
 =?utf-8?B?RWRhajFoTUZEMUNacFl3ZW9QMzlkL2xJTjZYbGRNTmJkbWxNZDN0N0Z3MWQy?=
 =?utf-8?B?N2lIQUtaWUx6b3VvMHlWZk53RFRjK1lsOVdnUEprZ0lxd1FpbGIyL092VkVE?=
 =?utf-8?B?ZXI5M1MxMjI1NlVDOHczNmpRV0xxSlpJNXc0SUx5TVY3bnBLUnc3WWgyUURY?=
 =?utf-8?B?TzR4Zjd6dElXRFZ6S1ZqWXBIck5kdlY4SFEweFkrb0kxZ1l3QXFhdUtPN2pH?=
 =?utf-8?B?Q1QyelBUTnV4N2J0RmhKMTZUVHhyQUFYU2ZFWTlrWE1VZzI1WldjTUFjc2tX?=
 =?utf-8?B?R3d3Ti9HcXlFQVBQVzlISE5SUmtucmprS3FNNTIzQWxQQUlWTk0zc1RMQTZs?=
 =?utf-8?B?dXJGMWs3QnI5RHY2ejJYam42Sm14NGtDYm85L29aTUFldk5hYXBvUC9aRGJw?=
 =?utf-8?B?aS9SOGd6bFNMRTZ2VG5mTE95OHZlN3lTYU0xQkRnUFh1cFU4V2lETHBneG5l?=
 =?utf-8?B?OUxDc3AxYXA3ZDY3YzJJUVdiNWtvMlo1S1hlR1JpaFBYWVdaZFRjeEhpai9T?=
 =?utf-8?Q?cpwNwOhki6G6JrgytHE276+CDTHH9nJU9Hop7EOkws=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700013)(1800799024)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 10:29:54.3962
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56b3e8fe-7aa4-4509-7588-08de5357db9b
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000049.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB7339
X-Proofpoint-ORIG-GUID: BtJw5gV_Bxy-kcDvo4xFAA95mLCC8tEW
X-Proofpoint-GUID: BtJw5gV_Bxy-kcDvo4xFAA95mLCC8tEW
X-Authority-Analysis: v=2.4 cv=YKqSCBGx c=1 sm=1 tr=0 ts=69677027 cx=c_pps
 a=dwgRFLcwxHSDGV+VcNTmBg==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=rg8MelPR9j8A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=i-tIiazvsxMoVayn3hYA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDA4NiBTYWx0ZWRfXx7DeQskx+UlJ
 rRHRcF6Pc0DWjid09j1WHZvjZ4o6MzoJDOUL0V6dWvXrc59fwpK7YvG3bTcEEzMwI2hebzwfvAw
 zZvNe0XyMcya9bbIcmTJr9WFJ+REkOmwbEDhglWrY01uyo20yIhfaqoV9Tj0hjrGTXAOcscTXJ+
 Ki0YqyLzZ21yFuIW36XTpWU+CmDQh7RZlDAcAgGkYCzQYoAgrepjDVqqlRllvGOIlCSE2ww719u
 eU56jKZJGrOETscaC0xkZ2NEJdi42B2EL5G5NXJOHxhPxchnojxCdFqN61Ulld798eTrAP0TICh
 qHjtdZ4qwJah1kC2qA+5aYZ2lGgz0E2ZEBVyp5u1MLGZvzyfzA1WJUtYhAla8RJ9wCzLeAOdBJK
 yCXU9dZ1pCpjfW/nFgM3iYe/GpMXwZAx+87cq5P8+tVA98y0Iupmr3Z6ZdYsRI6rm/+FArv3AZW
 cqqtY//9p7Ngswnj+pg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140086

Document the access-controllers for coresight peripherals in case some
access checks need to be performed to use them.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml           | 3 +++
 .../devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml          | 3 +++
 Documentation/devicetree/bindings/arm/arm,coresight-etm.yaml           | 3 +++
 Documentation/devicetree/bindings/arm/arm,coresight-stm.yaml           | 3 +++
 Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml           | 3 +++
 Documentation/devicetree/bindings/arm/arm,coresight-tpiu.yaml          | 3 +++
 6 files changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
index 2a91670ccb8c..949444aba1f8 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
@@ -128,6 +128,9 @@ properties:
   "#address-cells":
     const: 1
 
+  access-controllers:
+    maxItems: 1
+
 patternProperties:
   '^trig-conns@([0-9]+)$':
     type: object
diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml
index b74db15e5f8a..b0693cd46d27 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml
@@ -78,6 +78,9 @@ properties:
         description: Output connection to CoreSight Trace bus
         $ref: /schemas/graph.yaml#/properties/port
 
+  access-controllers:
+    maxItems: 1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-etm.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-etm.yaml
index 71f2e1ed27e5..10ebbbeadf93 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-etm.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-etm.yaml
@@ -118,6 +118,9 @@ properties:
         description: Output connection from the ETM to CoreSight Trace bus.
         $ref: /schemas/graph.yaml#/properties/port
 
+  access-controllers:
+    maxItems: 1
+
 required:
   - compatible
   - clocks
diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-stm.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-stm.yaml
index 378380c3f5aa..f243e76f597f 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-stm.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-stm.yaml
@@ -73,6 +73,9 @@ properties:
         description: Output connection to the CoreSight Trace bus.
         $ref: /schemas/graph.yaml#/properties/port
 
+  access-controllers:
+    maxItems: 1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml
index 96dd5b5f771a..9dc096698c65 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml
@@ -128,6 +128,9 @@ properties:
       - const: tracedata
       - const: metadata
 
+  access-controllers:
+    maxItems: 1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-tpiu.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-tpiu.yaml
index a207f6899e67..29bbc3961fdf 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-tpiu.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-tpiu.yaml
@@ -70,6 +70,9 @@ properties:
         description: Input connection from the CoreSight Trace bus.
         $ref: /schemas/graph.yaml#/properties/port
 
+  access-controllers:
+    maxItems: 1
+
 required:
   - compatible
   - reg

-- 
2.43.0


