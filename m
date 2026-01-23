Return-Path: <linux-gpio+bounces-30996-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MPfqBmpQc2kDuwAAu9opvQ
	(envelope-from <linux-gpio+bounces-30996-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 11:41:46 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B65EA7471D
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 11:41:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9401430432F9
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 10:40:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C5EA37106B;
	Fri, 23 Jan 2026 10:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="iCbRez4g"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3EF306B08;
	Fri, 23 Jan 2026 10:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=91.207.212.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769164857; cv=fail; b=p7cDZMcjUza/dCQc4IUdRu7TIGj6zCRXGIot3Y1bhqVAH6ZowDB7VLbgy8wlOQYk843EeHek2U7F0YT42DfnNe9JjNtw1Ngs/ClBN1MejIJcuELQGocyOXely7Rsx3oJBXXBTMg411KUV8AfaMetkzm0d0gg+mcaR6EaPjcCWSY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769164857; c=relaxed/simple;
	bh=UlLrXNSH8ZJadOFSyb2YztK1HJH8sf/AyIw4YGQ5y+U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=WRL7v+3LXTPodLB7EWtRU2S4l7GyREvZyNNqn4tD8k7zWNNVQuEd+AzUYMa6r8hRVPbDSIknnSsBSxHz08a0KyXhGNmwTbcIo0hJDcUtF3L47XhlqtGAJfOi6gMJNeXQS/80fI+NLT34pLUxg2xyV52knCTiQt72x+fa5IfaeO4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=iCbRez4g; arc=fail smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60NALevG2678373;
	Fri, 23 Jan 2026 11:40:42 +0100
Received: from gvxpr05cu001.outbound.protection.outlook.com (mail-swedencentralazon11013024.outbound.protection.outlook.com [52.101.83.24])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4bv3yp10ms-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 23 Jan 2026 11:40:42 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dKRt+3G5/qJNVWrUNr8pM5fVkDPRz2Ezqkr9t7LbC0gyl5yQ7/1JE/jCo8I/BNokbeG/kLlOSpJT1sS44wO33znq3ZpWqzwHfqkDyHzOQbeU2YozNKMs8lVdqiz6sNnEO/kJ3EqSjocM418JV8ufSg2d2BhrzHR776lzNWTZ+H6Jej1lj2ttfPfij9TvsixwMcPLinssQAyH8vF9pcjG0GslJNgEKoYZ0hCoabLe0ULcZNLwQikdqETf2CdfXQk95cJaF8tInibkR17wNrPOX9kylTy7uR2n5k7FjdkVUq45f8wW4Vt7AQ06a2iPCXN+JhTgjZqt2TDkXTL5LTTrbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c+qQruqp/r8Hzekq2l/RZFNMp6cVsCEBVM5HG63tx6Y=;
 b=yQFsBnpLxK+SmgXNPz5noUDbYAeEHI2cWllsKNi9DMvlUdjLNaV5q3BPmYAx1kyHwzZJqKNnJo4R72H2q9BVTunvDWOWiOVIriIm0mYEDpaIa1AgWDKnZKMbkdwQ9OimydU4mic0aMss7jwG+XFp6lgy4rnHPaycjhnK3idXB10ogPb8h9QZxkWGoeZpO6mS1Hm8fAHX/iK7H4sYbLOYv9ckH8vOz9FDNLDN6G3ujyoymjyPwv4eZ+fTNqaIgzPAISFe6ot3LwFmjQG8jVvbEbVRRVEAsYDKAnuRSse1oPGW4i6ygS7Yh19z1GLetOBwCjdWotexNBhvtiAQl4ZQbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c+qQruqp/r8Hzekq2l/RZFNMp6cVsCEBVM5HG63tx6Y=;
 b=iCbRez4gfvVO84C+vx4AzReRI4InIho4lMSCkRCafmjKTmEtTZDqK+LsnpWmF02LSGo5ZYa3O64lRkTm23Nfkhaxr0J/ayyX45WF7sZPM4skQNF/eAGC3tmpSZ+YjOCSCUv9eEIwscLDRmwKUEFU+LWXvqIcfydID9vFLLeU3QEQWCWenTH+tcII6fQrlZBBoXsE7vL/ImZW44ry4mQWU2xl1+zrGJTDTMxaVTbMRr+FkJm1mDNgH9DrtlgX1WCMcBidOjSO1L52tnfId63/UgHMBb9OcSyUscEiMb4wWO5BeR61RPe4uFwXE874kJkE+f5HGMAPCbaIP/GX6QmIsA==
Received: from DB8P191CA0015.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::25)
 by DB8PR10MB3658.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:132::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 10:40:40 +0000
Received: from DB5PEPF00014B89.eurprd02.prod.outlook.com
 (2603:10a6:10:130:cafe::ac) by DB8P191CA0015.outlook.office365.com
 (2603:10a6:10:130::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.11 via Frontend Transport; Fri,
 23 Jan 2026 10:40:38 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB5PEPF00014B89.mail.protection.outlook.com (10.167.8.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 23 Jan 2026 10:40:39 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 23 Jan
 2026 11:42:10 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 23 Jan
 2026 11:40:39 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Fri, 23 Jan 2026 11:39:02 +0100
Subject: [PATCH v5 05/12] bus: stm32_firewall: add
 stm32_firewall_get_grant_all_access() API
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260123-debug_bus-v5-5-90b670844241@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B89:EE_|DB8PR10MB3658:EE_
X-MS-Office365-Filtering-Correlation-Id: 2816190a-7850-4689-d1ca-08de5a6bda0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|1800799024|36860700013|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TWVVc2pEVUxHT3Mxa2lhU0IvVUNkNlp1S25qRzdRVE1tVCsxNFFPZUpEWXo3?=
 =?utf-8?B?UXlPcjNXdUtNTGd1Uk9zSlFFMlQ3bHpPenFMMWh5ZnhTUUF6YjJXWDl5NkJJ?=
 =?utf-8?B?UUdlN3RoWXdmTitqc0FabFUxOVorSXMzVUxUMHVleEd3UkxZWmZzQW4rVEZY?=
 =?utf-8?B?b05pUDFXWTlvazYzVjRtRVZ0MU5qV0EyOGx4VGdkZmdXY3ZoTjV2WU1hTCtF?=
 =?utf-8?B?QklrSldNaHg1RTlRdUFxa2ZQZ2Zabzc3eTRidjdHWTdrWTVoNWR5V2tJV0tW?=
 =?utf-8?B?MzdxcEpEdVU4VTZHZEZ3UVQ5K1BuRWQ4dUJzbDdkQkthZzlkRGUwcmZ1UXJ0?=
 =?utf-8?B?YVFRWGhwOTErSVVLZEs3cGVyK2Y1NUo0dStaNElTWUsweDg3Z3BCb1dTcERV?=
 =?utf-8?B?YkMwWHFhWjdPNjlFQjZKOGk5ekxlTWxrNzdGMm5lcWNGUFhPUWlWL3p4eEJK?=
 =?utf-8?B?eE1QTU5UQzM1cnE0bWVwTUp5SFpnRk02Ni92UTZqbkxXVXdOVnl1WXg3NHlN?=
 =?utf-8?B?SG1LQ2lkTDJCckt4YngwQWlscGNYcmRsYjliU1dTY3hacE1tbnJzOXg0Ympk?=
 =?utf-8?B?ZWgrZDVPeHlZbEJzcER0aGU1akpWK1FMa1p3U2RxSEorQ2xFdEVJQ3o3b3Fs?=
 =?utf-8?B?UHhySmkxMnNaVGlJcUZkTzR4ZFhpT21xcVpOSndjQStLd3lIa1dqQlczb2Yr?=
 =?utf-8?B?Z2NKNW12QlkzNC82alVHRXNzRFoybUlSUE4zR2lHN3gwc3FUQlZ2VnEzeGI3?=
 =?utf-8?B?THBEd05tOTdWdHIwc0dXZjhESnVkdDU1bFZUZk9FMUxvbDIybVNNd21JcU11?=
 =?utf-8?B?SGc1Z2VMVi80UjIrcW1SamgrM3VKcldYNmpKaHA1WlpxSVNHTERISnB6Y1FS?=
 =?utf-8?B?aGF0LzJPamZidXcxS1JFSVBBbDJDWTZRNiszbEhpNFVUOFVnazN4RzBvczY5?=
 =?utf-8?B?QjhzVXI0UFdlYndSeUFNdWRPNGg2bUJ0V3NtOU9GWTNZT05IUHdJRE1lZU9v?=
 =?utf-8?B?YlB0N2dRZHcyNjVyZ2w1MW1xaU5ZcFB6b2VsNjhlOE01cGxWQzF5YzBTaXd1?=
 =?utf-8?B?b3BVYnhmanAwclNNdHpDODVwcXBVWnROcjQ0TXI4aEFySVR3OEJXWEo4a3pF?=
 =?utf-8?B?bUhjbE1ZSUtoY2VKbkZBK1BIUG5uS2VFRDBZOHZjOENSUXNhUWtCR0hWZTc0?=
 =?utf-8?B?dEtTK2ViQVRSV1JhVkFrTlpSNy85MEN4YTMrMDROejdEZUM2RDhoM0k2T1NC?=
 =?utf-8?B?aG9tcEUvSktsZUhGaVJKcDlVckpDd29YM3daN3FsMlBIakR6QVZGU1FCMXhR?=
 =?utf-8?B?cHU1WWJaa3NkL3VSR05EUDdGSUlVekJnMEt2Y2M4TTRzWjNQSy9iTFZ2U2RI?=
 =?utf-8?B?dGZId1Mwb0lJRnZvd2tReTNNS1NjVVZPbDVCTFZ6M21vbnhDQVJEbUltNnRS?=
 =?utf-8?B?ZHp1dWxXWE02VHBTSnZVOVVrZzI3WVRvMnUvRU4zM2tTSmdqMWhnUW4zTHJ5?=
 =?utf-8?B?MElWZmdnMUJNZklnQm5pcWI2QzZxZTQwUHhzcG85UC9iME1YRkFjcmZ3QzE5?=
 =?utf-8?B?cEh3RGhDMHBxZHdCNnhQL1RDM0p6TTJrbWd0eVNrT1MxVE53VW1kQU1sRFhQ?=
 =?utf-8?B?OGs3dnFma2FKUnVVSlFQTTlOTG8yWFoyTm5FVjEwVmkrNGFpUm91WnFxbHhn?=
 =?utf-8?B?VEJabWM3OEduR0htOXlVVWNybGVjY1VBQWZLZkxyeXdQRXY0SUFzczQxUmMx?=
 =?utf-8?B?ZFNRVFFXOE1SWFdwNFRNL2Yvb3dmdFE2UVhtWWhKMTVBMUpIZ0lzbE55bkN3?=
 =?utf-8?B?NDVjdzd2T1A5ZnNCRUp6c0dsdGJBZFJtZDZGTjFKT3oxV0lQK0thd3BtZ0ZL?=
 =?utf-8?B?dnhYSVVJMy8xeFpLcTNuRXRhY1YwbGwwUFpBSnR4OU15bWIvSldQTTJpa0FI?=
 =?utf-8?B?K3pkMnU0MnVnUkhFVW1pbEZRSlJ4alhJNjVIMlBaTjFEbVJVRXpLSHZTejdr?=
 =?utf-8?B?Z2pBbzVIbVhXMklISTFpbytMVWtySnNkZUhwMnc0ZHRqMzFzT3JYK1ZWRmNu?=
 =?utf-8?B?aUlkQ01JY3V1T1JSamF2Y1FzZ3MrQnNQZGZmdkxXRkZkRWQyczhMbnNmNzZs?=
 =?utf-8?B?eHhtUVl0ZWp0VFRubUhlaTVuekRFRlJuRXplaW8ySmRXSVNDOEQ5ZFQ0WTBv?=
 =?utf-8?B?Q1VoQVJUVmhvblR5Y0FTT3NwdUFNRElRZHZyTzZucHdYNjQrNjFIWmNGTjFD?=
 =?utf-8?Q?bqIvSZR4oQrh1mBWELGauVxmkMx9EnDSgnem0m3+dI=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(1800799024)(36860700013)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 10:40:39.8579
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2816190a-7850-4689-d1ca-08de5a6bda0f
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B89.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3658
X-Authority-Analysis: v=2.4 cv=DLiCIiNb c=1 sm=1 tr=0 ts=6973502a cx=c_pps
 a=G5msVhhPor7R0xQYCCUq2A==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=rg8MelPR9j8A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=7cbN4eHG_OvaAO0uNUwA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-GUID: 6O2zV3L2RMs_lemWOL2GahHUoNkkPOXM
X-Proofpoint-ORIG-GUID: 6O2zV3L2RMs_lemWOL2GahHUoNkkPOXM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDA4NSBTYWx0ZWRfX09aAj3525vBy
 O16ry5ePn3s9PuWrJpdnqfFXY1fnniH9tm6PJgmo8+KArs0FWTVSpxqDrKQyAzCyxNeyqGj4vNq
 zSkGwTs+1ZquvuWuGIw4vHAFrAgdTHwGAswDXCPGS6+UYilYf/Lmdip0Rc0+C8xP1SKJd4dxfsn
 iLTd7t7auHOsepGR9A88egxFVlq5R1Kzapy0tq9FqGbFux60HLIAgAYgNwxVzY9Y3gzobkg121Q
 dJIsqWaBbnUbZAb317fIPFRQs9mA1P5XtwhKLHPVGvM4VwN3xCQ9KT5OB44aW8nEZmlmLnnWxtW
 B8gtAXNVhNvRNiFM0fiwD425TfJjx1FD4PFocIA4Wqd4KxFYJ/X27v14HW9WrlU2nVlURAKzSAJ
 VXWCT20Zxuj7AD6MhIODjLn4PIlbfTOizY+5VYMPcMyukEzHq+tZUPfiLBx5X2lWJoiLALTz+i9
 uyg5fQwuAeJTH155PAA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_01,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 impostorscore=0 suspectscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601230085
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[foss.st.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30996-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[arm.com,linaro.org,kernel.org,linux.dev,gmail.com,foss.st.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[foss.st.com:mid,foss.st.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,st.com:email];
	DKIM_TRACE(0.00)[foss.st.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gatien.chevallier@foss.st.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: B65EA7471D
X-Rspamd-Action: no action

Add the stm32_firewall_get_grant_all_access() API to be able to fetch
all firewall references in an access-controllers property and try to grant
access to all of them.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 drivers/bus/stm32_firewall.c              | 42 +++++++++++++++++++++++++++++++
 include/linux/bus/stm32_firewall_device.h | 26 +++++++++++++++++++
 2 files changed, 68 insertions(+)

diff --git a/drivers/bus/stm32_firewall.c b/drivers/bus/stm32_firewall.c
index 2717754d811d..c9e6299197c3 100644
--- a/drivers/bus/stm32_firewall.c
+++ b/drivers/bus/stm32_firewall.c
@@ -185,6 +185,48 @@ void stm32_firewall_release_access_by_id(struct stm32_firewall *firewall, u32 su
 }
 EXPORT_SYMBOL_GPL(stm32_firewall_release_access_by_id);
 
+int stm32_firewall_get_grant_all_access(struct device *dev, struct stm32_firewall **firewall,
+					int *nb_firewall)
+{
+	struct stm32_firewall *loc_firewall;
+	int err;
+	int i;
+
+	*nb_firewall = of_count_phandle_with_args(dev->of_node, "access-controllers",
+						  "#access-controller-cells");
+	if (*nb_firewall < 0)
+		return *nb_firewall;
+
+	if (!*nb_firewall) {
+		*firewall = NULL;
+		return 0;
+	}
+
+	loc_firewall = devm_kcalloc(dev, *nb_firewall, sizeof(*loc_firewall), GFP_KERNEL);
+	if (!loc_firewall)
+		return -ENOMEM;
+
+	/* Get stm32 firewall information */
+	err = stm32_firewall_get_firewall(dev->of_node, loc_firewall, *nb_firewall);
+	if (err)
+		return err;
+
+	for (i = 0; i < *nb_firewall; i++) {
+		err = stm32_firewall_grant_access(&loc_firewall[i]);
+		if (err) {
+			while (i--)
+				stm32_firewall_release_access(&loc_firewall[i]);
+
+			return err;
+		}
+	}
+
+	*firewall = loc_firewall;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(stm32_firewall_get_grant_all_access);
+
 /* Firewall controller API */
 
 int stm32_firewall_controller_register(struct stm32_firewall_controller *firewall_controller)
diff --git a/include/linux/bus/stm32_firewall_device.h b/include/linux/bus/stm32_firewall_device.h
index eaa7a3f54450..6c878f3ca86f 100644
--- a/include/linux/bus/stm32_firewall_device.h
+++ b/include/linux/bus/stm32_firewall_device.h
@@ -112,6 +112,25 @@ int stm32_firewall_grant_access_by_id(struct stm32_firewall *firewall, u32 subsy
  */
 void stm32_firewall_release_access_by_id(struct stm32_firewall *firewall, u32 subsystem_id);
 
+/**
+ * stm32_firewall_get_grant_all_access - Allocate and get all the firewall(s) associated to given
+ *					 device. Then, try to grant access rights for each element.
+ *					 This function is basically a helper function that wraps
+ *					 both stm32_firewall_get_firewall() and
+ *					 stm32_firewall_grant_access() on all firewall references of
+ *					 a device along with the allocation of the array.
+ *					 Realease access using stm32_firewall_release_access* APIs
+ *					 when done.
+ *
+ * @dev:			Device performing the checks
+ * @firewall:			Pointer to the array of firewall references to be allocated
+ * @nb_firewall:		Number of allocated elements in @firewall
+ *
+ * Returns 0 on success, or appropriate errno code if error occurred.
+ */
+int stm32_firewall_get_grant_all_access(struct device *dev, struct stm32_firewall **firewall,
+					int *nb_firewall);
+
 #else /* CONFIG_STM32_FIREWALL */
 
 static inline int stm32_firewall_get_firewall(struct device_node *np,
@@ -141,5 +160,12 @@ static inline void stm32_firewall_release_access_by_id(struct stm32_firewall *fi
 {
 }
 
+static inline int stm32_firewall_get_grant_all_access(struct device *dev,
+						      struct stm32_firewall **firewall,
+						      int *nb_firewall)
+{
+	return -ENODEV;
+}
+
 #endif /* CONFIG_STM32_FIREWALL */
 #endif /* STM32_FIREWALL_DEVICE_H */

-- 
2.43.0


