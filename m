Return-Path: <linux-gpio+bounces-30935-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4DkoO0FTcmnpfAAAu9opvQ
	(envelope-from <linux-gpio+bounces-30935-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 17:41:37 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F576A2A6
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 17:41:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 91496302A72A
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 16:39:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D2853F8681;
	Thu, 22 Jan 2026 16:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="mtwohTqk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82BF43F6FF0;
	Thu, 22 Jan 2026 16:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=91.207.212.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769098875; cv=fail; b=PL/0YsDeNVLUEPz5v8lKQ66kjQuOgEQ8kFXgRzs8O4WuulcoEK8NLGm0ky0HD6+cRaV+JwWzUiu8+0vRq9iCJcCaq6VtS088/lixKlAlwHsXGmVbRcOVk9YmDGkAIoxPebtkgd1kExbSGJdKen92+Az5F9TY1Q5Cltv1INliSgQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769098875; c=relaxed/simple;
	bh=Tn7gOdha+WfgD75zNjpXhKkc52GtzmRL1wUTHUO6IUs=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=bbqgQR4WNladCAPJG0HfXMSFdY9Vt2yIUA6evZbX6+bFZcq7L23HEF9DA9Icd+o+MrFRR8HDn8pT4M2AMGFJizFsXOgIsA2S3r/BtDePiL1tu2zw12nfc/7rxjFq0oxaGBjJ339NLFizdTXTebg/JhvTDuKGhSH7C629m7dwilo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=mtwohTqk; arc=fail smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60MG9IC0773191;
	Thu, 22 Jan 2026 17:19:32 +0100
Received: from db3pr0202cu003.outbound.protection.outlook.com (mail-northeuropeazon11010047.outbound.protection.outlook.com [52.101.84.47])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4btcn510mc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 22 Jan 2026 17:19:32 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NQpwVSp7mazQO9/12OLnE15c5IZLXA1nGZcSw9r4bvmqDnMB0BYKRQ7RDBGKdlIp+Zhfnn6vJtOrts+n73p7j24HHw5+Lc9rfB1/aE7TlCr9MgkNQFGog2WCkKbYExBkNkrc5faddOaFmFhleAmZtmCF8KZUhqB5zvqwD09v6An4GMFC02tao59Pir0y6kg9hJIM44DS2+K8X3sx8nesSP11YddgJQZqZnAkkgU4liuxSJcc1UqYLcIOFIREx4c3i19ZSWucYBHmdC/Q4CnS+wElADQsoASKf6kBx0qBq2ANIBEvePZS6N5DDPe8RKRdSHx+HuagzOJzLef1sGwmQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v8w590fjxxs5F+Ud89dwReDZIiWrOoYxmeTCiA1GVGY=;
 b=dAJdPZ2EueRdHSxScuvo48Gv3DQqi24HKgE2N1ZSDDDbNWatF2oqKp9lONv/CsaoeF46Sd9FAYcOTttmAy30PAmG/CCcRuwXjNGHNP62PBiSrLIyrCov3fhA21wXFQUYAlrKIVkhKlBcho6Lc5IOzwqsMtxWiqjnGIt0A/oo5Q1ipP2Aa1ncnGXqNI/C6cUrwwlymRmCc4zfyBshqtTsXUmS2i74gQOcA3ypATYY5PWImRXr+9+qHM+9sAYRbnaaXQk0SojmD0Ny7BbcYdhtZy3y5ymNn0z8zOvnkQ4S+ceYp3dICdRUvzMJXylJufulEqHWPoIpmOqDX7XEbJeFhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v8w590fjxxs5F+Ud89dwReDZIiWrOoYxmeTCiA1GVGY=;
 b=mtwohTqk0oAhmV4PFTi5slDYqo0rAi+nfoPtxXonqnLrsTltMlAN9ayaACONX2bw0Cdb8rJ3m1h48Gt8N3sR+0+gbgI5haNDOBKyG+qD8sT0bltH56HGWKv1OaQnLwmV4Ao/pwn+JVtlK68wfPqhQNgFc2Phfq0uIBGIZDavUrWEf71JezXoZAj/43gVE22rVA+u52j+xfckq5sxMHJoPvAwG4E9yCuxKvRGyUGEsN+i+clGzuL1X5Ogo5dLrxsM9hPbjwZw25wArwAasHL2TgvesZjG5Jw8pjSdtGXPfWHDb4ztJPGF1h8eSscButoXb/rI89ZI/Kv5kTTm9loj0w==
Received: from DUZP191CA0002.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f9::12)
 by VI1PR10MB7689.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:1c4::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Thu, 22 Jan
 2026 16:19:27 +0000
Received: from DB5PEPF00014B9D.eurprd02.prod.outlook.com
 (2603:10a6:10:4f9:cafe::66) by DUZP191CA0002.outlook.office365.com
 (2603:10a6:10:4f9::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.11 via Frontend Transport; Thu,
 22 Jan 2026 16:19:24 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB5PEPF00014B9D.mail.protection.outlook.com (10.167.8.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 22 Jan 2026 16:19:27 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 22 Jan
 2026 17:20:47 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 22 Jan
 2026 17:19:26 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: [PATCH v4 00/12] bus: add stm32 debug bus and coresight support
 for stm32mp1x platforms
Date: Thu, 22 Jan 2026 17:19:13 +0100
Message-ID: <20260122-debug_bus-v4-0-28f0f2a25f2c@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAFOcmkC/2XMTQqDMBCG4atI1o1kJj/GrnqPUkrUqFnUFKPSI
 t69USikdPkN87wrCXZ0NpBztpLRLi44P8QhThmpezN0lromboIMFQOmaWOrubtXc6C8RKVUXRh
 uDIn/z9G27nW0rre4excmP76P9AL79Vspk8oClFHdIgispCm4vrQ+hDxMee0fZO8smFgQqcVop
 ShkXWgBUpX/licWIbU8WtFwFBJAs4b92m3bPgfXhJwcAQAA
X-Change-ID: 20260108-debug_bus-392666c7a3aa
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
        Gatien Chevallier <gatien.chevallier@foss.st.com>,
        Antonio Borneo
	<antonio.borneo@foss.st.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B9D:EE_|VI1PR10MB7689:EE_
X-MS-Office365-Filtering-Correlation-Id: cd17551a-dc88-44b8-b582-08de59d203f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|7416014|36860700013|13003099007|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NFlBVndYbGxUazIyWXdWQXdBU25tcGR2UFd2eHNncTBnWUhoVktraFhVZHRG?=
 =?utf-8?B?ZHVkNEdtb1UrdnZ5elkycHc2MmRUaC9scDZzT0ZJdjBDQ0E3dG15emVEMkR2?=
 =?utf-8?B?bHNZWW15WnJDemhuMExVcFdkOFlpaFFYYUQ2UzZEK1U1blVKOWhqTm92cUNx?=
 =?utf-8?B?R0pOMGgwQ1JTem42cDk5VWxKQ1dWL0o3OWFJem80T3RmZHJVcWU0QUVua28y?=
 =?utf-8?B?VjZBeU9hNDdhRExEakxSSnNhMUVXV3k3NVdsVVFNcVRkck5odjEyQUlSYmU5?=
 =?utf-8?B?cGNzbmRoVGFocjVpeTJ6NmtGYkFIWThIWWl5MHZSb1Z0TmJoU2Jnc09zeFcr?=
 =?utf-8?B?QnRGaUkzWmxPTHF0c0tKWVhGR3pVZStuZ29TTFROVnFjc2VZU0FZTVBPTzl2?=
 =?utf-8?B?SUJNZVYzTXFnVmhCV0VWZWdLVVZYOGsrSDdDTmd4RFhRT3M3YU4yYXZNVG9Y?=
 =?utf-8?B?cHY5d0JpU3VmNGkxeGQ1dDRGY2dzT0tkaW1nQkFGOW5LQ0FTUDR2YW9NTkkx?=
 =?utf-8?B?MHVxUVhmNE5NelhYRjVLdE55ZGVsWURNUzV5bEp5YWFjYjhpQmQyaGo0MU03?=
 =?utf-8?B?N1hKb2lWTVoxUjZMK29oTDhNR0lXUlNOdm1MaFNEYjBwQUZwS2x1Yzd4c2ZH?=
 =?utf-8?B?NitFL1JtMWlVRnlaY3drNW9CdzdwanBoZUErTTdtVkl6RnhMRjlCbFpPdHdq?=
 =?utf-8?B?YzUwV2ExbmprckkyOEM0OGFIWGo4aVVPMGwvNTNKTXBvY1MzT0dCVDdGNGVT?=
 =?utf-8?B?dXFkTm8wZGhUNWVNbElPVGN5UUV6SjFxaWFmVGE4VWF3cCtuaU81cXZ1ZzNa?=
 =?utf-8?B?cFZLOGRRSzhpK251ZmFaNVY5alQ1amZGaUZYRHRNVnJOcnFLSWdObkc3Ui9D?=
 =?utf-8?B?QjVJQ1k1czQxWmt3c0xMWlAyMEtpTFhMWTQrckNSemhRbTRPREU2V2o2WUl1?=
 =?utf-8?B?QW8wc3F2dktBU09zekg3N09aNG5DVThLYmtrNDhFRlpuYzlUZmFQeTlMaTdi?=
 =?utf-8?B?dnpqdldaN3ZDaDZPdVFsdlFrelcyeDFqQ0NhRWRKclBSTWVjd1g0WjE3QVh3?=
 =?utf-8?B?QUZySkdzM3A4Z1FCdlQrUWJVQWw1TzVZaHcrcGhvVTVTRnowWmlkdXhVNjNX?=
 =?utf-8?B?Y0FDcXJmMGZFQk5QenRuZ0J0eTFFVFIzbFV1ZjRHTUFNL2FjbTZxMERucVZq?=
 =?utf-8?B?MFl6bWUwR0hlVWx4QlpWM2ExNGQ0dkNZT3dvMEg3TGE3RjNzWmRqQlYvYWsy?=
 =?utf-8?B?UWdpRlBHVkNtZlZ4bmRqK0JTWWdBMC9oM1A3VTZLUEQ1RzlHZStiWmNVUWtU?=
 =?utf-8?B?OWxlYXlpeHlVcnVhb0FxZFNBVGVMVWZCejBiMkdhZ3RkU2tCckxUSjhUNmRt?=
 =?utf-8?B?VkplNUxOSStQampXMi8yUis0U1h5c0JtejVzcU1NeUZIQ2NUcVd0b1VhNWdn?=
 =?utf-8?B?Nm5YVEVLRGJQU3hKT0h6dDJ6UHBCV1RDTWtKUG9wNXZvZUgxWkx5U01aSDBF?=
 =?utf-8?B?bjhBem1lSEpBOTdkczBrZUI5aWV4OEw4UHhIdHlUYXltNSthWFBjMjZJMjZk?=
 =?utf-8?B?OEhaazIwSjJnNjVIQXo5bVpjQnNKWEVFY1BJU3kzQ1dFdERlNHQ0ekRueWFE?=
 =?utf-8?B?ZGMxY3V0blBaRGE1dkdvbmU0Nyt1ZDlQZk9zTWJDY3daRGJoMzR2R2x4YkU2?=
 =?utf-8?B?VjlvQitkaGNYSXN0QjZ5NVlteEVDS1Z4TVREd0l0TFNPbktQMjQ3ZUxSNmw1?=
 =?utf-8?B?bktXTGUycWRUZml6K0Y0cmN6ckRqVjZveHA5Y09vQUYvOTJtOFNndTFDK0RO?=
 =?utf-8?B?MUozaEROaEl6NVgwUWVBczlOUnJ4cHBMMm1maVZQMHBib1RZUlZKTlBMQ0I3?=
 =?utf-8?B?YmpvMmdQQTFCUVZ5M0xyTXNrNUlQajdOcWc3UkxIM2kwbWt1L2VCYmtVMGNJ?=
 =?utf-8?B?RE5vTm14Wk9abUl5eHhYYzRac2RMb3NrTVYreDQ3ZXZvTlFLR3M2U0RwbU1X?=
 =?utf-8?B?cUttQzFpY3lPNVVPMGpYS3Z3R0NkbjMxem9ncmpzMTc4aU82NkgvUWIzeFJh?=
 =?utf-8?B?NkwyeXA3V01hSXZ0ZU1TMWpBeWNydTNkMUQyNFNydnBTZkhyM1RFSnNYMXlY?=
 =?utf-8?B?MHhCTHBwUkMwb0liZTNBa25KN1ZJd2RoYmlPcEdLRjhQVHJRc1ZxemZCenFS?=
 =?utf-8?B?WElXbnI3TGd0aHYvZE1RWFU3SHFDRU1HMVQzaUhlK3RLRkFScDgvdk14RkUx?=
 =?utf-8?Q?/GDZbM5O7WiR9ZpvM1Tb548JR5KtH+In3V2brGswUc=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(7416014)(36860700013)(13003099007)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 16:19:27.6630
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd17551a-dc88-44b8-b582-08de59d203f7
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B9D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB7689
X-Authority-Analysis: v=2.4 cv=Fec6BZ+6 c=1 sm=1 tr=0 ts=69724e14 cx=c_pps
 a=RmHue97ipze0icY0clRZTA==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=rg8MelPR9j8A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=8b9GpE9nAAAA:8
 a=Ca_RQAvUjDkQCxdtJiUA:9 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDEyNSBTYWx0ZWRfX7jLbV5OUK+nE
 i4mXbLyjcedkdJNXGan5OphOK+0xV6kGBETJzAjKQrJiC08pd4VmJI8ikTwaYopOkrj4EmAPRkl
 kJiSjUdU3Z1dFHSgJpZ2/dKzDyxL/pMftbQ3hbNYYl8T1nLWvJPn4XmKaNZifvnG/MfsyHNWXrp
 y9hw8EV6A2w0aZZ82L2Fn0kYZnLAFLkxQMM/1gjwlfWgiu3IlOjCX+s4/SlyCJCPrbIvgO3URET
 L/2qKZatiqFryAK4/YiwbI59IiZtDfFUngKXWxWiJnwYpDmjrzxmAl1ZGaun6uHLhgwgsbFk5wD
 fYVFgScuhx0hiE20CAqZVcf+dqt/9jm7zGG9087MptKIwj9Ivqsp+Hj9NpJDxRzwT49MLaHvElM
 ppgc/q4xWDlIh3GVaTwlkHN+9mGdse7i7vRq4jaxXugW88oLIw1cG3Ga2dwy6xjjc81BzAWT3OD
 07e9DJIrel0Aakx/7dA==
X-Proofpoint-GUID: tL5zrA-wETyn4ueVIMiLtE0GRf718qJy
X-Proofpoint-ORIG-GUID: tL5zrA-wETyn4ueVIMiLtE0GRf718qJy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0 phishscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601220125
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[foss.st.com,none];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30935-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[arm.com,linaro.org,kernel.org,linux.dev,gmail.com,foss.st.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,st.com:email,foss.st.com:mid,foss.st.com:dkim];
	DKIM_TRACE(0.00)[foss.st.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gatien.chevallier@foss.st.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 89F576A2A6
X-Rspamd-Action: no action

Stm32 SoCs embed debug peripherals such as Coresight. These peripherals
can monitor the activity of the cores. Because of that, they can be
used only if some features in the debug configuration are enabled.
Else, errors or firewall exceptions can be observed. Similarly to
the ETZPC(on stm32mp1x platforms) or the RIFSC(on stm32mp2x platforms),
debug-related peripherals access can be assessed at bus level to
prevent these issues from happening.

The debug configuration can only be accessed by the secure world.
That means that a service must be implemented in the secure world for
the kernel to check the firewall configuration. On OpenSTLinux, it is
done through a Debug access PTA in OP-TEE [1].
To represent the debug peripherals present on a dedicated debug bus,
create a debug bus node in the device tree and the associated driver
that will interact with this PTA.

[1]: https://github.com/OP-TEE/optee_os/pull/7673

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
Changes in v4:
- Remove reg property from the debug bus and use ranges.
- Link to v3: https://lore.kernel.org/r/20260121-debug_bus-v3-0-4d32451180d0@foss.st.com

Changes in v3:
- Collect Rob's review tags
- Add stm32_firewall_get_grant_all_access() API and use it in the HDP
  driver.
- Link to v2: https://lore.kernel.org/r/20260114-debug_bus-v2-0-5475c7841569@foss.st.com

Changes in v2:
- Fix kernel robot error by documenting the access-controllers property
  in the missing coresight peripheral binding files.
- List the access controller items for HDP
- Various minor fixes in the debug bus binding file.
- Remove clock documentation and its presence in the DT node and driver.
  Bus clock will be handled by the child nodes' drivers.
- stm32 debug bus driver:
	- Depopulate the bus when .remove() is called
	- Remove trace when error on devm_kzalloc() as the trace
	function does nothing in case of ENOMEM.
	- Remove use of of_match_ptr()
	- Use tee bus callbacks
- Link to v1: https://lore.kernel.org/r/20260109-debug_bus-v1-0-8f2142b5a738@foss.st.com

---
Gatien Chevallier (12):
      dt-bindings: document access-controllers property for coresight peripherals
      dt-bindings: pinctrl: document access-controllers property for stm32 HDP
      dt-bindings: bus: document the stm32 debug bus
      bus: stm32_firewall: allow check on different firewall controllers
      bus: stm32_firewall: add stm32_firewall_get_grant_all_access() API
      drivers: bus: add the stm32 debug bus driver
      arm: dts: stm32: introduce the debug bus for stm32mp1x platforms
      arm: dts: stm32: enable the debug bus on stm32mp1x boards
      arm: dts: stm32: enable CoreSight on stm32mp15xx-dkx boards
      arm: dts: stm32: enable CoreSight on the stm32mp157c-ev1 board
      arm: dts: stm32: enable CoreSight on the stm32mp135f-dk board
      pinctrl: stm32: add firewall checks before probing the HDP driver

 .../devicetree/bindings/arm/arm,coresight-cti.yaml |   3 +
 .../bindings/arm/arm,coresight-dynamic-funnel.yaml |   3 +
 .../devicetree/bindings/arm/arm,coresight-etm.yaml |   3 +
 .../devicetree/bindings/arm/arm,coresight-stm.yaml |   3 +
 .../devicetree/bindings/arm/arm,coresight-tmc.yaml |   3 +
 .../bindings/arm/arm,coresight-tpiu.yaml           |   3 +
 .../bindings/bus/st,stm32mp131-dbg-bus.yaml        |  77 +++++++
 .../devicetree/bindings/pinctrl/st,stm32-hdp.yaml  |   6 +
 MAINTAINERS                                        |   1 +
 arch/arm/boot/dts/st/stm32mp131.dtsi               | 117 ++++++++++
 arch/arm/boot/dts/st/stm32mp135f-dk.dts            |  24 +++
 arch/arm/boot/dts/st/stm32mp151.dtsi               | 172 +++++++++++++++
 arch/arm/boot/dts/st/stm32mp153.dtsi               |  68 ++++++
 arch/arm/boot/dts/st/stm32mp157c-ev1.dts           |  40 ++++
 arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi          |  40 ++++
 drivers/bus/Kconfig                                |  10 +
 drivers/bus/Makefile                               |   1 +
 drivers/bus/stm32_dbg_bus.c                        | 236 +++++++++++++++++++++
 drivers/bus/stm32_firewall.c                       |  44 +++-
 drivers/pinctrl/stm32/pinctrl-stm32-hdp.c          |  14 ++
 include/linux/bus/stm32_firewall_device.h          |  26 +++
 21 files changed, 893 insertions(+), 1 deletion(-)
---
base-commit: e82d0477fd80707221c3d110f56d05506de2698c
change-id: 20260108-debug_bus-392666c7a3aa

Best regards,
-- 
Gatien Chevallier <gatien.chevallier@foss.st.com>


