Return-Path: <linux-gpio+bounces-30530-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF37D1E0D5
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 11:30:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E6F9F30223C9
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 10:30:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1135138A9D1;
	Wed, 14 Jan 2026 10:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="mmcs1H3L"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A953570D6;
	Wed, 14 Jan 2026 10:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.182.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768386641; cv=fail; b=NEcF5QQyDL0MJ0ZtVcmDGwVgHHHdyj5JOiH6HMRSLb9lWrUQvkJkn1xpWTRo9DQiQDdG0/lN6zQ0Tj0RrUZnlCRwV+jKBPwSgOK6dF5K8ltCJnd8dU2RoyRBcGCpawHP0ATUu/7y4zpVvwA7rRsM4VJfmORqvb64ht2gU3Zs69c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768386641; c=relaxed/simple;
	bh=iNrk3ocXIuw9OV7btZ+lERjn+urvcmvsHCO0TPFLXlw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=ZdirXb5XtyoodCLGvDwMIAErC97XZZ43YAHcj9YBCt3lfuayn0oxqWVdfw13zngzTajoeoOH1eSFRHC7UMuhbqPlNxawYzz4SL5bnnaxQlYneh1YTdlPPyFQXaxB1DzcJV4mscRckKHOkhppb1bD1Bz9pnqT3V4lrmLFIGzp36k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=mmcs1H3L; arc=fail smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60EARXKi3445279;
	Wed, 14 Jan 2026 11:30:11 +0100
Received: from du2pr03cu002.outbound.protection.outlook.com (mail-northeuropeazon11011024.outbound.protection.outlook.com [52.101.65.24])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4bnsudk1t6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 14 Jan 2026 11:30:11 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YGgiNuDZY1001KPVbfPsrO7loZY4AIljFtrNeRY/dbdG8Dtwlpx5w1eJ+IFBbFr8DLoOB5Xa6QMnCghzNGWuiNXyI0e7/ljOumxQs0ojMdQSF/U14/vcOrlaA30oz8WN1GnTm1mjXA/0sSYvzaC8O7MGgi5QX8BmgKQD6fDGDXtAjZBunOz9/5X06w4i34HeO5c5gWSt5/wZ87lHrBQIK8y7tWCnWXPSgZ/CRD/9ahV/6jd5siTeuV67oOnBKqkZJ8cUI9P+7QsLrxSS+lkb/Ii0pFhECeVqth+AroVucUovabjCuYKEPz6PsWlCtH2ozXC/5quGPkSAGsJVRBi7pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bGQcXs6Aj5EKkozER8z1+wLu4NFFsWgq1C9iMc7G0UY=;
 b=UJ+vkUlJDfF1K3/p4RfTyXjMMq1EjhkyP4MLt0rtD0C4bgWCAw8ol/74DT/FT32IyAABmvWea1+LoS/lh0OuXQx6kJ3alL39XmUFWRbx770N3Pphr82a6NwVrZegwdAnIT0vfOWrQC/ICWK+OnyIJZx+YiBoPuEqZY11fBUp6kHtnrhk9xoy7ZxIT4Xw9lW56HTwFAd10iCbKMcuOzIeQZkcDVqQDse5Fv6PK4LWbRdXe/nRoh7e1bYacPyj7Ht+vvgxuNLJ9+UV59enxUlf8DQx0CGluzIFM2/3dUhyaDT7jYi5bPZXiK0ArjDe9u+fqHGt2UF5z+Z4++VVC7O/2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=linaro.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bGQcXs6Aj5EKkozER8z1+wLu4NFFsWgq1C9iMc7G0UY=;
 b=mmcs1H3LyTnRwbVEbpzOj1E5f1duFYQ3r/LphIyxgeuy05dOerNa+U71QYf8IUhZzNecb72bWOW8IN1AYj2/aFfuVcyqFrUDnEfFxpQfJXA7Q+f2dsXAgGORVEVGGKT19A7SpSqSN3zzruzOpDXc2T7NZdSNuO6BNnwx1NYAhrwyJ4ZFqlHPmbjH0dN+Yca4iVDW/VqjdMrFmjCFj81Bp4TxyHR8IQ3o6xu0CA/GShNgRtH9OvGdot6U8ysSprlESnVSF8PVijTxqWQONy/KmBDtIxV+kV9udaNtoTPylleLzZ1tdVkOysDKoaXBoHv99R4GBcYb0pMRmLmfmVntgQ==
Received: from DU2PR04CA0337.eurprd04.prod.outlook.com (2603:10a6:10:2b4::35)
 by DB9PR10MB5713.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:2ec::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Wed, 14 Jan
 2026 10:30:05 +0000
Received: from DB5PEPF00014B89.eurprd02.prod.outlook.com
 (2603:10a6:10:2b4:cafe::a9) by DU2PR04CA0337.outlook.office365.com
 (2603:10a6:10:2b4::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.5 via Frontend Transport; Wed,
 14 Jan 2026 10:30:04 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB5PEPF00014B89.mail.protection.outlook.com (10.167.8.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Wed, 14 Jan 2026 10:30:05 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 14 Jan
 2026 11:31:21 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 14 Jan
 2026 11:30:04 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Wed, 14 Jan 2026 11:29:16 +0100
Subject: [PATCH v2 02/11] dt-bindings: pinctrl: document access-controllers
 property for stm32 HDP
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260114-debug_bus-v2-2-5475c7841569@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B89:EE_|DB9PR10MB5713:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ceb6e16-2b21-40af-1c07-08de5357e213
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|7416014|376014|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TzhXc2wrUU40V0RSbXV2czlVOTZNb0tzSGVxQzI1VE1uN20vTjQyaDNicWpp?=
 =?utf-8?B?a0xFeTl1Mld3RnVCSTRXdXc0L0toUmpON3luSFVBZXVObVZNMWFlZHdQSnJk?=
 =?utf-8?B?aUZXQzd6cXJBWFdjUTNHQ1l3OXRadFYrbHRiME5Fd1pBOUxtNFlLSnR6bUJ4?=
 =?utf-8?B?SHNvUDI5TE9keGNQWFpGWmk4RC9YN0J3R1k3TFg5K1p6eHVZUm5DTW1xUU1p?=
 =?utf-8?B?eXRZMHJ1NkhQMGVQOWEwUjhKa1BjMjAzNUJPbzlYZ3pTVngrSDN2Tmp6WWVh?=
 =?utf-8?B?U1l3algxN3Bsa0tCOUt2L2kxT3FZOWpORVpSZWdvcHVpeTBQU0craURtZVFY?=
 =?utf-8?B?SXVUVFdWQmFyL3EyZEV5Q3ZzS2xOMVhXa3JpZVlXK2JrSkdqTzlTUzUvOTRT?=
 =?utf-8?B?RUU0YjJMRm8yVzk5VnU5OENOdFJDd3FWWThtSjV2YlR6NHJVTi9UMThFcGl5?=
 =?utf-8?B?T2xmdHUrVTdlQWZmaEJQN3JFak5CbVpYTzlVVE9sMDgzT1lVQlRRdnd2K0tV?=
 =?utf-8?B?WEZlNSs3TVJIeXFNU05OOCszV0ZDREs4VElLTE9MZ2thd3FpMlRXR2JPVjY3?=
 =?utf-8?B?UG1kYkNBL3kxSU9zdS8wczVBWmx5Rnh3dTl2eFZoWmVwMWFQNzVQVGx6MGlU?=
 =?utf-8?B?M0lNOEExMzdaY0pVSklreVZDVVkyK293TjZDT3JNTXBwZ3pqUk91bFN3TXJX?=
 =?utf-8?B?Vkxva3BiOUFnZmloYjloVjlyV1M4ZUdYTDBuSWFDamlNYXJQMXFaMjV1Zjcy?=
 =?utf-8?B?MzYvbU9neWVpTFNGVUZYNzIraVFKeDJzQ3dseDNjSVhUYzRIWU9oSVdRdFhx?=
 =?utf-8?B?cW5BWDRXTloraTVzbWN5dFNhbFJtWGZNcW5VLzNkaHppcFlBZ1E0a0ZFeHZX?=
 =?utf-8?B?cjY3VmlKeG1qMjFLWmNOSGI4S05hcS9wK0x0QjFYdzFFWG5HaTE3bERCNmN2?=
 =?utf-8?B?RWtjekpUdThyWVp0S3hjN1BMWWVJYkp3UmV4cWhTVzRHbm1MQ09qR3ZISDY0?=
 =?utf-8?B?akxnRTlMdGNNaklZbkRKdzBlWHpWWVVtaWU0R2g4VjNsTFR6UlV6ZnJaS3VC?=
 =?utf-8?B?bVdpcnY0QlhMelVyUjJnZSs2Y2xVaUJBbGlUb1ptNzdrbFBWOWRDZndHTEhG?=
 =?utf-8?B?MVF4bnAyVEtYWjkrQyt3eTlTQThndkJFQmIrRGhkeFhRbFUvTGRUa2hjM3lY?=
 =?utf-8?B?MEtBQ25sYVA2YTJwUEc0OXArMy9hOGtmUWRzWWwvc0ZBcWwvY3Z2dFhjMW5Q?=
 =?utf-8?B?Rm5xcWptY0FWWHBMNFgzMEVua3l6ZWtsaDIrOS9IWFpzVWViRUdXSEhvRytV?=
 =?utf-8?B?VW03Nk5rNU52OWN0cFhKKzNPVTNET2NQS0k0b0FCeGFBYlYrSGVVam5oMmk0?=
 =?utf-8?B?MWo2eEdER2lrYzZ2cXQrNEQraUhON1ZNWGJEZUxHRncrbVV5eWphK1E1aUdJ?=
 =?utf-8?B?Q1lBMGFpcmIyTnFnakkzdHY4MW5QU1BURlJiQlJ4cTBvTm81K1AveEVHM1ZR?=
 =?utf-8?B?Rmdzb25YNG5GUzR4NmZwWGhsdHU3WnhYTmdsZ3doYnhiZFJPWmR1NlFuelJ3?=
 =?utf-8?B?WWU4cEkxdVRmRXFIT0czM0o2UlNDUDlaaHRXYU9UZHFVWkFsRUo3dklOV3hr?=
 =?utf-8?B?Y0lJQzhqY1VXYWxDQ2tEcXhtWEh2Ty96MkozdTFkTWtLUXY4ZHg0azc3MEFk?=
 =?utf-8?B?cDVmbFU3WUV0NWw3eElDWnhSV29GOVZCTDZWamlocXc1L05ieVdiSVRTK1VE?=
 =?utf-8?B?NERzNEZoK3dIckFVeDlvdXFTZnBBRzBiY2hSbE1hM1hZZFhyUjc2ZFU4QUMw?=
 =?utf-8?B?RXVJMmRCUERGTC9iSkZBUTdqc1RESUNGKy81NGhYbFk2L1VicE41azIwVkRD?=
 =?utf-8?B?Y3BCOEhqNWNtTldoek4vM1hCb3FUbkVZUTI2SkttMS9kUnR0SUFUSUNLV0x4?=
 =?utf-8?B?WnVvZzk3SUtuelpQZDA1VXVFbmxuTUg0MXlWTnBrbnB5emRHZ0YxS3hHdUx4?=
 =?utf-8?B?RGJmTElldTBIWHlZMXFyblcrTWlWVlV4QkxrNUxBTUdrdEdyZjAxQ3pBSkUw?=
 =?utf-8?B?bEJSbjFyQmg2VC9MbVE4bG1HR2ZQNk1qWllsMmpkV2JwdVI1K0x6Wi9wT3Zu?=
 =?utf-8?B?UDRSRitUeFVySXVvQlRhWUNUK1BKNVREbFJOL2xKam1vUGdiNkZqRWdRZDJa?=
 =?utf-8?B?TjY2NVllTERPUDFXRVpHbHc1TVcwck1GeUNzay9DaU80MFRnd1d0UDgvZkwx?=
 =?utf-8?Q?HJIobADV9oOwT0XgXCSV5oy5sX/LsSVSwl449hMfTE=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(7416014)(376014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 10:30:05.2205
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ceb6e16-2b21-40af-1c07-08de5357e213
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B89.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB5713
X-Proofpoint-ORIG-GUID: Sdl39KxlifRaJwu7q_ZHW1wQ9NQVVgjV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDA4NiBTYWx0ZWRfX3cxCl1brmj+g
 /fboEIqiq3e914dHBsvPsHWgToPzuNN6YKI3WqjL8dfKACL7O8YwftDsHlI/y8aqTroRKKpgikg
 sfYkTZOkGBvCfkNvAuf5xQm6J0CctAo5CL4ONizGKccpV0OOj+S9prEro9ec2MVFCsmPxLs9Ez7
 T8wsXsEaM+prSX4koCtOrBFVcEMsyMsDhfZLUV86skJ0rjRfH5LoYBWCMy7ddiJ0ba8Pz7vSmO+
 GSt6l+YUoDlfr+3Wum0QQKpNZet2LeJNxhJttbGfci4hCIDv7kzw/HX6tfN3o5/Z4fxrjtyNpdH
 BVQfd2PBT3G//EsDqIhmPlRMw95c+DIT1//mdb4mPX6zjlIFAI5CR1IwSSE1Z5aiX4LaWAzwf5w
 PsQmr4BR4QXqNaYJ2vm+f7ETJa/UmxmTO34WcdM6ip94aTBPCAHLXy5JaW5Ng5o7LKJiXGK0QqC
 r3h7yB32ZeuttwXlMYw==
X-Authority-Analysis: v=2.4 cv=S+3UAYsP c=1 sm=1 tr=0 ts=69677033 cx=c_pps
 a=jAp52Qr6e1vdGvI99yDuOQ==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=rg8MelPR9j8A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=LS5lh7VHtsIGWKReRLIA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-GUID: Sdl39KxlifRaJwu7q_ZHW1wQ9NQVVgjV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140086

HDP being functional depends on the debug configuration on the platform
that can be checked using the access-controllers property, document it.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
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


