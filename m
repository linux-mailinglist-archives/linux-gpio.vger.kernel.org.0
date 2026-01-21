Return-Path: <linux-gpio+bounces-30855-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8KP9JwPKcGkNZwAAu9opvQ
	(envelope-from <linux-gpio+bounces-30855-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 13:43:47 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CCBD56F93
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 13:43:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D844F5C0F95
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 12:38:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0E5F48AE03;
	Wed, 21 Jan 2026 12:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="HO290Xvz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5734148A2D4;
	Wed, 21 Jan 2026 12:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.182.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768998969; cv=fail; b=PMjH88b/of4QgS2bZiy9rN4Q4I/CfKOj4dmmTNj1o07ddjjZIL8gGk9VVozf0v250yOXKHaPMRZZD7LtQTjtaK0HHNnCSrqfFkjQRTLqr7UVgG9K45zKf/642EYzL6QNNQ70Yx62jUvqmwCe40BfZaU+xtUzuQqRfaBaYO7b08s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768998969; c=relaxed/simple;
	bh=YwuY3eV77TPcKFSrVhZROmKvyyKkyyvGJoV68rm43H8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=ejs3vZnedxo6oscR+Ylz0E6oXBDJ8U2Q0sUhRghzsvW7/RkEfiHJSzp4lwOmkFyH+gyrdHRIw2r8r4sc4T2gm7hQ3Qk57rBmI267zJd8ZAB5aThUk1G4X36XD71zDLP8nxjp4w7IYyesQxDyGFDXEZCvpCX32GkkUbBWNXIJpuU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=HO290Xvz; arc=fail smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60LCTfGt517073;
	Wed, 21 Jan 2026 13:35:51 +0100
Received: from as8pr04cu009.outbound.protection.outlook.com (mail-westeuropeazon11011013.outbound.protection.outlook.com [52.101.70.13])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4btkkxtfef-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 21 Jan 2026 13:35:51 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N9YqKjmTNU9F31a4dgwKMgjKHc/RMBY0BMfCRF7wTliLI2REYOMw6Sc2wemS+9d4r9AAcCgbLfP2oAKc8y1W4KmjYA6Wj3Ye4ycc4h37+e6sqxBDPVaGItjQXKYgm2IhjX8OuoEJH+takv/rIChfEo4S2qDkJbXX6XaDFJVMbQ1oTsoV8K+r9F95J60vllOIF5ZbbnzKkqWX2mhwOL9oFJ8hqrFnrxm6g1+hlnNzbKBY30yb1Joono1P2zqgdJxmp+WDV1OFg4zAsEm8DQ0EjVQTxtxLPeAx7MckRpFRk+RUj0J1TWzXogjS1kfKDHcJGSmYgVXcnsqTCQKO4H/iUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q/jJ3nT9dPqpx2WOyU8sSZGS5YZ6LQrAiKlXrEYWtbc=;
 b=fGW/Py+r+fRXBbHYttx5f3cAkLDp1creDe0FkoTPXgoajoSlaw9ufQTa90lckOU0C4937IK92y/xIuywTOPLsx2+ETWomYxnLpsaF8G3jm4PbkKCfgQnK0i9p4hu92NRG+VwWl+vNao5UbJI3z8fyeU90QjD78vfcnwBoYSeeiOSkyudl1KytHJwKmPHxQxPhmUAgbA0fSnXrcJiHs0FSAFt+15XL34cZ4hY4Re6zUfOeBNn2Gn8FXdQCHRg2GxqPWUloyVzMSkjvQRlwDPCgs1Iy4f0MjueTdbeI8U/k/zelDGOLtuJUYxJKO42UyU9HLEr4q2qAx5uVDT9u1EUAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q/jJ3nT9dPqpx2WOyU8sSZGS5YZ6LQrAiKlXrEYWtbc=;
 b=HO290XvzLK4BBroyaMhmrinxTtyT/UfDJTf0ZySoP6KWPT8cPCHdAD6b8Mf5uu7T1CTMbqsiifUQo5mIfX6JbNvxUFSB5wfw6axrsanIOalHLJw79vVk9QSFQQb8MCM7xw9i06gYLtBlRmGp/iZoINcUQ7oXtcPV1Z79QkWQuNIyr3UrWERDAUYrKKCamdF+JLuPrLqm38O+klLmEErCEY71GkFmcrHON7JXec4CHQX8z5QngoBGjmyybh26nRQlN7WjkARsC/1BlNFIPAIpJqwrwPKMsLNs3fPl3vB+UOx22JCnUrHfnzbRQ6V0G9+dki/+vwa80A+Qd8DW/1bV6Q==
Received: from DU2PR04CA0322.eurprd04.prod.outlook.com (2603:10a6:10:2b5::27)
 by DB9PR10MB7147.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:453::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.13; Wed, 21 Jan
 2026 12:35:47 +0000
Received: from DU6PEPF00009525.eurprd02.prod.outlook.com
 (2603:10a6:10:2b5:cafe::4d) by DU2PR04CA0322.outlook.office365.com
 (2603:10a6:10:2b5::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.9 via Frontend Transport; Wed,
 21 Jan 2026 12:35:37 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU6PEPF00009525.mail.protection.outlook.com (10.167.8.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Wed, 21 Jan 2026 12:35:46 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 21 Jan
 2026 13:37:03 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 21 Jan
 2026 13:35:43 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Wed, 21 Jan 2026 13:34:40 +0100
Subject: [PATCH v3 06/12] drivers: bus: add the stm32 debug bus driver
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260121-debug_bus-v3-6-4d32451180d0@foss.st.com>
References: <20260121-debug_bus-v3-0-4d32451180d0@foss.st.com>
In-Reply-To: <20260121-debug_bus-v3-0-4d32451180d0@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DU6PEPF00009525:EE_|DB9PR10MB7147:EE_
X-MS-Office365-Filtering-Correlation-Id: 2267de97-04f0-43cb-8285-08de58e99a0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|7416014|36860700013|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ejdERW11MWJ4U1dsWkdlZVB4UTNGTFBjQzNkY2dsb0ZuYXFZUk9LQ1ZFa1B2?=
 =?utf-8?B?Q3ZDR3RubGN0c1pMOEdRSzlGQkNhMExvYVcveGRBR004RWJnd2dnblhJUGNN?=
 =?utf-8?B?QnNqTE1Nck9jYWhQQjBGaHlPc1JCS296ZkFXUEpHRmdoRk01dExvMEVCZHdp?=
 =?utf-8?B?cG5LTlk1TVRhU2I5MllTNFdkOStNY3djQ29QaG1OZDJSMUU4Z0VjYTFNZ1lL?=
 =?utf-8?B?dUpqdGFtUjFPZFZoTk5tMGxiSlM0ZTB6ekd3T2t6WndKTm5qTUhQM1pCNmFh?=
 =?utf-8?B?WEMxRFJUOEl5NnVINEp2V3pFU0thaC8vSUhmZ21UUlZOQ2tON09abVRPeDBx?=
 =?utf-8?B?RnQ5aXRCTXVsbis1M0JVV2VINHQzK2hLVlpkQjRvdUl5Tm4wUTBNVmNIZ3N6?=
 =?utf-8?B?NC8zSDY1TW03Qk5ROTNMczJCMWM5RGNEZlgrclcxZlAvZzl0ZnVKS1FwYi9h?=
 =?utf-8?B?eUxEeVZGSTlHUk95aU40SnF3SHZHZGZET0hhL3Nnbk5Ic05TbFZJNlZGUSs2?=
 =?utf-8?B?eWhYYTJGT1Q3UUpFY2hTZVNOcnpER1hiS1hlbURIK3pXNENZR2cwaXRQZWpj?=
 =?utf-8?B?Z0RWOGQrMVpHT00vRjdFbDBJeHFIblQrMW9jYUM5VVI4Y2E5bHo2TU54OElJ?=
 =?utf-8?B?SFJQRmQ1K1RBMmV6SEZmcWtBSnhseW1rV2pnVFF1TUhPOVJhd1VZMFJUeHpW?=
 =?utf-8?B?Mmo4NFBkZ3FjZnlISGFhZ2tkeUUxT0RvUU5wUk1mQ3huL3hnSDRHUmFKZTU0?=
 =?utf-8?B?eVRHVnBMVkRsaEhYeHR1ck9GaHNRazFMYkNaRXlyNHRFdktNUTBzbjIxS2sv?=
 =?utf-8?B?Q1BkQWIyQjdGaUNQb01DY1dacUtiOVUyMngrRTNOdGpvQk9ib2l0SkNZc0Fz?=
 =?utf-8?B?VmcrTEdZc1NrTUxmS043bWJVdUk1SWM1RFpWWXdRTzBCMGdTeFpZVHNTNWdL?=
 =?utf-8?B?VUJmNjRhOVhuYUNaNzlMUTJnTjJXUG1IL21pbzM3dnlqaU1GWXllNXVVZ1d2?=
 =?utf-8?B?dkhSYXg1RUhuYXFTc2xhOFVjc0FEQVR1dGRkdGhuK2VRWGdxc1lXc2cwaXNP?=
 =?utf-8?B?QW85VGdxMk54ZG5FcVIwRG1NbktIc0QvSzBEU0tPUEhKY3ZzaTZaeCtNSEJS?=
 =?utf-8?B?elBmbzNUZkdlcG9YNlFabm5YeEJIL1VyNmk4dmh1YzFKTVo1bmwyV2tnMDFt?=
 =?utf-8?B?dXFpQUx6cnFxcEZPbm04U2k3Rm5EUTBtd29uUDkvSm5CYnN1Vzdzbk1EbnRq?=
 =?utf-8?B?VkhWTzJYdXZKREkwVDFjRGNjU0FELzlCM2FFdmhsMktCeDM3UlUyMVlndGhC?=
 =?utf-8?B?SFhwNWZzOU9oajdPV0xyUlk1OGpUbVJtSUt5cTgwd04yYUYvSXg3Tk1YeUps?=
 =?utf-8?B?SGhSZmdOTkdqQjE4UkNuVEhxMnlGYU9KSXVwNHJ0Rm5rbTJ6ZUJhOVBiN3lo?=
 =?utf-8?B?UUlrNThmOUpld2tOZ3J4RkxCOVJobTUxY3B3MU95dFdHd0VMWmdWRnVaNUZO?=
 =?utf-8?B?TXNacEM1Z0F4STRLYWpUUkJOSWhtem1RRlhob09ndlp0bU01OFFlRjNOZWFP?=
 =?utf-8?B?bEl0Y3AzUmFwQzVJUDFIU1o5cUJKejZvbGt2aXdnNzE1ZGZrRHQ2VDB3Y2I5?=
 =?utf-8?B?Q3dCNTI2Mks4Q2wzS2QrRWRuaER3Ri9HK1NFcVZkMkgzd2hNQVIwSTVHQnVk?=
 =?utf-8?B?ZkEvM3VpWC9tYjNNZ0dqTEhPNmhWZVkxSkRhQXBsc1U1WFU2dUxCMGRqUE0x?=
 =?utf-8?B?cXJPUVQ3YnVaNjRoS0xZUm1NU0dWNzR1VlZFTHVOOTB1a0pSbFYya20xOFRE?=
 =?utf-8?B?VkttRWZNam5sM0RBZlhuVS9HMzQ2UzViZHNSYzY1U1prZFgvNTF5bS9tRU93?=
 =?utf-8?B?ZGxHM251MDcrSmJkbFQxckY4S3JLczhBVVNCQm5HaEYzekp0MGtJWFNMaWph?=
 =?utf-8?B?b0RWelhqeXN4V200Q1JuVVR4dHQ2aTNMREp2QnNpa205ejlaMmh3NFh2bXhq?=
 =?utf-8?B?SHdkc3pJaU15eXVraFJndTFScldodS92S2l2clVNMmduMll1aFRGcWtyRDQz?=
 =?utf-8?B?M2FhbVFWVW5vRE9URW02RDBuazRVZGM1MXhDTlkwamE5WlVTYzh4eEZTOTEv?=
 =?utf-8?B?d3d3VjB4TG9TSjc4bFRNM0J6QkxaUktwMnZhN1Y3ZHhwZUs0NVhLbDhaY01U?=
 =?utf-8?B?YUNGcENpeWJ4VERqQ0d6VkFjOSswbmN1N3g4dm5NWXViNHpJTUZmbFh5V2lq?=
 =?utf-8?Q?x2itTOpowgFQqiSb0wj8/Z1CR/v0NV1nNByvM90uSI=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(7416014)(36860700013)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 12:35:46.7243
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2267de97-04f0-43cb-8285-08de58e99a0c
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF00009525.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB7147
X-Proofpoint-GUID: wubvbn2Mv2NET8wiVKDE5QiCVp3qjSNA
X-Proofpoint-ORIG-GUID: wubvbn2Mv2NET8wiVKDE5QiCVp3qjSNA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDEwNSBTYWx0ZWRfX+Iv129q9uEwv
 iOrxlFX3sJHbgfFwUiiEgAV8pBZZDNx9c0bbvQl7fgq3RRho5ozeQMN/PvaByCRKkrb6GsicJlM
 zgIFKPTPjVnhAnW1qzuxAqMHo6ILCPke7sKFf3rbA/e3A09VLhv8LtQngqCDd8fRz5eutU/JVCe
 pY0OGoNh2/W43AKLAYIJwAmiyJEwilCKxSTBuqC0vrjr5LlP/wvc6ibplOT+k8ieaF3+Iwcdx8n
 otAfIzfyxhg/t79POdID3SnHqNpDKzcqXt1LIyIhm0sNPeJgITCTmr0Oi/h4MOHMlif3899Zb/m
 sy676ccUppYxNHU8FpsD64wNzwEpVeFVD0U4DxYcSI2sIjR/UjDBxcUXSu1Nev57VqJv8xs/P4B
 66Cyj+HhoZxDdWH7F/7x8saN/NL+CfmqzQziBSwCZnpvZ58VapXIoOiOWfgIes1HWSXUrP5kU/e
 sm5gBFKf59Nl77ZwHgg==
X-Authority-Analysis: v=2.4 cv=F/Rat6hN c=1 sm=1 tr=0 ts=6970c827 cx=c_pps
 a=ix9ji6b11k/yGntXX/BQ1w==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=rg8MelPR9j8A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=3L3Zm1D9LUX1ZMezbK0A:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210105
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-30855-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[arm.com,linaro.org,kernel.org,linux.dev,gmail.com,foss.st.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st.com:email,foss.st.com:mid,foss.st.com:dkim,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo];
	DKIM_TRACE(0.00)[foss.st.com:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gatien.chevallier@foss.st.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[foss.st.com,none];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 3CCBD56F93
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the stm32 debug bus driver that is responsible of checking the
debug subsystem accessibility before probing the related peripheral
drivers.

This driver is OP-TEE dependent and relies on the STM32 debug access
PTA.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 MAINTAINERS                 |   1 +
 drivers/bus/Kconfig         |  10 ++
 drivers/bus/Makefile        |   1 +
 drivers/bus/stm32_dbg_bus.c | 236 ++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 248 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5b11839cba9d..fd8390e02070 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24698,6 +24698,7 @@ F:	drivers/power/supply/stc3117_fuel_gauge.c
 ST STM32 FIREWALL
 M:	Gatien Chevallier <gatien.chevallier@foss.st.com>
 S:	Maintained
+F:	drivers/bus/stm32_dbg_bus.c
 F:	drivers/bus/stm32_etzpc.c
 F:	drivers/bus/stm32_firewall.c
 F:	drivers/bus/stm32_rifsc.c
diff --git a/drivers/bus/Kconfig b/drivers/bus/Kconfig
index fe7600283e70..c9be21d5dfda 100644
--- a/drivers/bus/Kconfig
+++ b/drivers/bus/Kconfig
@@ -169,6 +169,16 @@ config QCOM_SSC_BLOCK_BUS
 	  i2c/spi/uart controllers, a hexagon core, and a clock controller
 	  which provides clocks for the above.
 
+config STM32_DBG_BUS
+	tristate "OP-TEE based debug access bus"
+	depends on OPTEE && STM32_FIREWALL
+	depends on ARCH_STM32 || COMPILE_TEST
+	help
+	  Select this to get the support for the OP-TEE based STM32 debug bus
+	  driver that is used to handle debug-related peripherals on STM32
+	  platforms when the debug configuration is not accessible by the
+	  normal world.
+
 config STM32_FIREWALL
 	bool "STM32 Firewall framework"
 	depends on (ARCH_STM32 || COMPILE_TEST) && OF
diff --git a/drivers/bus/Makefile b/drivers/bus/Makefile
index 8e693fe8a03a..799724cfc2df 100644
--- a/drivers/bus/Makefile
+++ b/drivers/bus/Makefile
@@ -27,6 +27,7 @@ obj-$(CONFIG_OMAP_INTERCONNECT)	+= omap_l3_smx.o omap_l3_noc.o
 obj-$(CONFIG_OMAP_OCP2SCP)	+= omap-ocp2scp.o
 obj-$(CONFIG_QCOM_EBI2)		+= qcom-ebi2.o
 obj-$(CONFIG_QCOM_SSC_BLOCK_BUS)	+= qcom-ssc-block-bus.o
+obj-$(CONFIG_STM32_DBG_BUS)	+= stm32_dbg_bus.o
 obj-$(CONFIG_STM32_FIREWALL)	+= stm32_firewall.o stm32_rifsc.o stm32_etzpc.o
 obj-$(CONFIG_SUN50I_DE2_BUS)	+= sun50i-de2.o
 obj-$(CONFIG_SUNXI_RSB)		+= sunxi-rsb.o
diff --git a/drivers/bus/stm32_dbg_bus.c b/drivers/bus/stm32_dbg_bus.c
new file mode 100644
index 000000000000..9427d4da0da7
--- /dev/null
+++ b/drivers/bus/stm32_dbg_bus.c
@@ -0,0 +1,236 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026, STMicroelectronics - All Rights Reserved
+ */
+
+#include <linux/bus/stm32_firewall_device.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/tee_drv.h>
+#include <linux/types.h>
+
+#include "stm32_firewall.h"
+
+enum stm32_dbg_profile {
+	PERIPHERAL_DBG_PROFILE	= 0,
+	HDP_DBG_PROFILE		= 1,
+};
+
+enum stm32_dbg_pta_command {
+	/*
+	 * PTA_CMD_GRANT_DBG_ACCESS - Verify the debug configuration against the given debug profile
+	 * and grant access or not
+	 *
+	 * [in]     value[0].a  Debug profile to grant access to.
+	 */
+	PTA_CMD_GRANT_DBG_ACCESS,
+};
+
+/**
+ * struct stm32_dbg_bus - OP-TEE based STM32 debug bus private data
+ * @dev: STM32 debug bus device.
+ * @ctx: OP-TEE context handler.
+ */
+struct stm32_dbg_bus {
+	struct device *dev;
+	struct tee_context *ctx;
+};
+
+/* Expect at most 1 instance of this driver */
+static struct stm32_dbg_bus *stm32_dbg_bus_priv;
+
+static int stm32_dbg_pta_open_session(u32 *id)
+{
+	struct tee_client_device *dbg_bus_dev = to_tee_client_device(stm32_dbg_bus_priv->dev);
+	struct tee_ioctl_open_session_arg sess_arg;
+	int ret;
+
+	memset(&sess_arg, 0, sizeof(sess_arg));
+	export_uuid(sess_arg.uuid, &dbg_bus_dev->id.uuid);
+	sess_arg.clnt_login = TEE_IOCTL_LOGIN_REE_KERNEL;
+
+	ret = tee_client_open_session(stm32_dbg_bus_priv->ctx, &sess_arg, NULL);
+	if (ret < 0 || sess_arg.ret) {
+		dev_err(stm32_dbg_bus_priv->dev, "Failed opening tee session, err: %#x\n",
+			sess_arg.ret);
+		return -EOPNOTSUPP;
+	}
+
+	*id = sess_arg.session;
+
+	return 0;
+}
+
+static void stm32_dbg_pta_close_session(u32 id)
+{
+	tee_client_close_session(stm32_dbg_bus_priv->ctx, id);
+}
+
+static int stm32_dbg_bus_grant_access(struct stm32_firewall_controller *ctrl, u32 dbg_profile)
+{
+	struct tee_ioctl_invoke_arg inv_arg = {0};
+	struct tee_param param[1] = {0};
+	u32 session_id;
+	int ret;
+
+	if (dbg_profile != PERIPHERAL_DBG_PROFILE && dbg_profile != HDP_DBG_PROFILE)
+		return -EOPNOTSUPP;
+
+	ret = stm32_dbg_pta_open_session(&session_id);
+	if (ret)
+		return ret;
+
+	inv_arg.func = PTA_CMD_GRANT_DBG_ACCESS;
+	inv_arg.session = session_id;
+	inv_arg.num_params = 1;
+	param[0].attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT;
+	param[0].u.value.a = dbg_profile;
+
+	ret = tee_client_invoke_func(stm32_dbg_bus_priv->ctx, &inv_arg, param);
+	if (ret < 0 || inv_arg.ret != 0) {
+		dev_dbg(stm32_dbg_bus_priv->dev,
+			"When invoking function, err %x, TEE returns: %x\n", ret, inv_arg.ret);
+		if (!ret)
+			ret = -EACCES;
+	}
+
+	stm32_dbg_pta_close_session(session_id);
+
+	return ret;
+}
+
+/* Implement mandatory release_access ops even if it does nothing*/
+static void stm32_dbg_bus_release_access(struct stm32_firewall_controller *ctrl, u32 dbg_profile)
+{
+}
+
+static int stm32_dbg_bus_plat_probe(struct platform_device *pdev)
+{
+	struct stm32_firewall_controller *dbg_controller;
+	int ret;
+
+	if (!stm32_dbg_bus_priv)
+		return dev_err_probe(&pdev->dev, -EPROBE_DEFER,
+				     "OP-TEE debug services not yet available\n");
+
+	dbg_controller = devm_kzalloc(&pdev->dev, sizeof(*dbg_controller), GFP_KERNEL);
+	if (!dbg_controller)
+		return dev_err_probe(&pdev->dev, -ENOMEM, "Couldn't allocate debug controller\n");
+
+	dbg_controller->dev = &pdev->dev;
+	dbg_controller->mmio = NULL;
+	dbg_controller->name = dev_driver_string(dbg_controller->dev);
+	dbg_controller->type = STM32_PERIPHERAL_FIREWALL;
+	dbg_controller->grant_access = stm32_dbg_bus_grant_access;
+	dbg_controller->release_access = stm32_dbg_bus_release_access;
+
+	ret = stm32_firewall_controller_register(dbg_controller);
+	if (ret) {
+		dev_err(dbg_controller->dev, "Couldn't register as a firewall controller: %d", ret);
+		return ret;
+	}
+
+	ret = stm32_firewall_populate_bus(dbg_controller);
+	if (ret) {
+		dev_err(dbg_controller->dev, "Couldn't populate debug bus: %d", ret);
+		stm32_firewall_controller_unregister(dbg_controller);
+		return ret;
+	}
+
+	pm_runtime_enable(&pdev->dev);
+
+	ret = of_platform_populate(pdev->dev.of_node, NULL, NULL, &pdev->dev);
+	if (ret) {
+		dev_err(dbg_controller->dev, "Couldn't populate the node: %d", ret);
+		stm32_firewall_controller_unregister(dbg_controller);
+		return ret;
+	}
+
+	return 0;
+}
+
+static const struct of_device_id stm32_dbg_bus_of_match[] = {
+	{ .compatible = "st,stm32mp131-dbg-bus", },
+	{ .compatible = "st,stm32mp151-dbg-bus", },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, stm32_dbg_bus_of_match);
+
+static struct platform_driver stm32_dbg_bus_driver = {
+	.probe = stm32_dbg_bus_plat_probe,
+	.driver = {
+		.name = "stm32-dbg-bus",
+		.of_match_table = stm32_dbg_bus_of_match,
+	},
+};
+
+static int optee_ctx_match(struct tee_ioctl_version_data *ver, const void *data)
+{
+	return (ver->impl_id == TEE_IMPL_ID_OPTEE);
+}
+
+static void stm32_dbg_bus_remove(struct tee_client_device *tee_dev)
+{
+	tee_client_close_context(stm32_dbg_bus_priv->ctx);
+	stm32_dbg_bus_priv = NULL;
+
+	of_platform_depopulate(&tee_dev->dev);
+}
+
+static int stm32_dbg_bus_probe(struct tee_client_device *tee_dev)
+{
+	struct device *dev = &tee_dev->dev;
+	struct stm32_dbg_bus *priv;
+	int ret = 0;
+
+	if (stm32_dbg_bus_priv)
+		return dev_err_probe(dev, -EBUSY,
+				     "A STM32 debug bus device is already initialized\n");
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	/* Open context with TEE driver */
+	priv->ctx = tee_client_open_context(NULL, optee_ctx_match, NULL, NULL);
+	if (IS_ERR_OR_NULL(priv->ctx))
+		return dev_err_probe(dev, PTR_ERR_OR_ZERO(priv->ctx), "Cannot open TEE context\n");
+
+	stm32_dbg_bus_priv = priv;
+	stm32_dbg_bus_priv->dev = dev;
+
+	ret = platform_driver_register(&stm32_dbg_bus_driver);
+	if (ret) {
+		stm32_dbg_bus_remove(tee_dev);
+		return ret;
+	}
+
+	return ret;
+}
+
+static const struct tee_client_device_id optee_dbg_bus_id_table[] = {
+	{UUID_INIT(0xdd05bc8b, 0x9f3b, 0x49f0,
+		   0xb6, 0x49, 0x01, 0xaa, 0x10, 0xc1, 0xc2, 0x10)},
+	{}
+};
+
+static struct tee_client_driver stm32_optee_dbg_bus_driver = {
+	.id_table = optee_dbg_bus_id_table,
+	.probe = stm32_dbg_bus_probe,
+	.remove = stm32_dbg_bus_remove,
+	.driver = {
+		.name = "optee_dbg_bus",
+	},
+};
+
+module_tee_client_driver(stm32_optee_dbg_bus_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Gatien Chevallier <gatien.chevallier@foss.st.com>");
+MODULE_DESCRIPTION("OP-TEE based STM32 debug access bus driver");

-- 
2.43.0


