Return-Path: <linux-gpio+bounces-30858-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OOtYGlnKcGkNZwAAu9opvQ
	(envelope-from <linux-gpio+bounces-30858-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 13:45:13 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E814956FEB
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 13:45:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9D5D39CCFA2
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 12:39:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4DC648B37C;
	Wed, 21 Jan 2026 12:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="nz2Wchg1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F1E48B36A;
	Wed, 21 Jan 2026 12:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.182.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768998992; cv=fail; b=XVpQXRskl19mdtaCr1HfauWqCn7jfDIIuWrdVYHFO9frRiVmBt4teVIwVHDjk6zEI3ANLUXqCuQl745II8GIunfzRB+ms52m+6ErR6MLtL2CXI7Jck+rTXCpYIeK0x+DM2dNL7wmKWDV1880jLArim4goy4lIVvIQVSVMuNs1EI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768998992; c=relaxed/simple;
	bh=xbgh1CCIgcEFj9WeothPqUmM2N2sWTN9TRalHeX1drc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=BoiQHlqVmYSunx4AedylAwSXPMrcFNWBQMAp8wBPeuneiAtWYdk+eE6YXtrQ7aAsho+flEnILPpMowUt6C0rfGakLWsTwGcGZewsd9EJPd/tC/7E31M8uxchll90wdjAx15wu7k12o82wi+jSho+S4u7/bngAbxz9jq+E/sSLBU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=nz2Wchg1; arc=fail smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60LCWPrp2318352;
	Wed, 21 Jan 2026 13:36:09 +0100
Received: from gvxpr05cu001.outbound.protection.outlook.com (mail-swedencentralazon11013002.outbound.protection.outlook.com [52.101.83.2])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4btca6bt9s-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 21 Jan 2026 13:36:09 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y+3tAVr0SsSpaGe5IkhfdedoyTy1OyKe0XX2Xu8Jj5MzKTtAXBipU8Cs4nQ8tphYpkTiDSPmoMvsrzOkvCz712ITkgpdhCGbGpyVkZMZBc9TSRCJOtQkZdF9BESNGCG8GOR28dDLJ9yyumdURrbuyn0k5XNPsv+hcEzCqsvP/rm8RXxzq6Tc3DdfTzskQQvka5VfyeXVGPBr/gqc9TcrIVCmigoUWAVpp23sxc3bQdql4K1TVEBrFEAST/O6605kWD9dR+nYLDSArm4UIunn4f4vjs5ED/4jEXL/NorauXSinh06MXLBkqzNf1qs5Yn6wigY5HC2qk/r4Fll1P18Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bwxk81WusWTFK/a9r7vinmm1wcowOubfgfecTr4+eB4=;
 b=wid0SO/c6fQVVhhGgGCg9wxo89xt1DYJ/BHZhkB2Bm2Y6aEJSG5DJVTJmzF2FGHka+lgxm3CySOOFEa3Vm6gcXPwr4Zcm9g6uGtk3UVmaLsK//w7GQPwUap7bif8JyK9AsixIe+BwaKtgoDc9gCfIJwyD7HMzs01lf0rojxQfzUkpoWpzBr9lUN5L3QO/kG5ECiUs3TwGm5wC5bXj9BTE2MfzAFqh0hJ2F5/hUQstUyBFA49NsBAClS1H8OJ/Fpm9V5LIOke6cXOF0YVbzAtew6EXOp63XFpipUEu9T2cuPCU//L50Qp53X+jv2Ys5VpZ8+63O3wvlFwiufT/ZsKnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bwxk81WusWTFK/a9r7vinmm1wcowOubfgfecTr4+eB4=;
 b=nz2Wchg1CXAJcTK10tskj+/u9EAWHVtdvv/cPZatH66ead1xanc3bPBZvfIjq/newEdMxWiR7bd+fgZL/lGgPvAncE3C5DVDsukrf8t9OS9fjNIkRPRh4uRoAogNvWlz82nhGzmtnN72tp4eHVZQsg/02wqkT8KFGX7ovXEMqrJ435sszlGCB7ms0VnDyqDnOLqJVjOFA/6NwnMP8gvRZ3skqbIZvsH1Vqdiz35hyp2OVrM5nIDj1zGjuRVrgGie/gf6bMXT2g67L8l+IYLGWoq0FeFBJxhRN9VkR0EO+BHtIAPnGzCmVpfnW2eIm+abdPBEb1bQbbFJFBmaerJ9vQ==
Received: from DUZP191CA0043.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f8::26)
 by DB4PR10MB7061.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3f3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 12:36:05 +0000
Received: from DU6PEPF00009523.eurprd02.prod.outlook.com
 (2603:10a6:10:4f8:cafe::1c) by DUZP191CA0043.outlook.office365.com
 (2603:10a6:10:4f8::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Wed,
 21 Jan 2026 12:36:04 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU6PEPF00009523.mail.protection.outlook.com (10.167.8.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Wed, 21 Jan 2026 12:36:05 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 21 Jan
 2026 13:37:25 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 21 Jan
 2026 13:36:04 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Wed, 21 Jan 2026 13:34:42 +0100
Subject: [PATCH v3 08/12] arm: dts: stm32: enable the debug bus on
 stm32mp1x boards
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260121-debug_bus-v3-8-4d32451180d0@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DU6PEPF00009523:EE_|DB4PR10MB7061:EE_
X-MS-Office365-Filtering-Correlation-Id: 783c4bb1-3bac-4cc7-7adf-08de58e9a51d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WEx6VWhvTm9HTm0xUGcwQmUwR0VNYWYwd3o3WVF2MjcvQitua2gwR3YwYU8r?=
 =?utf-8?B?aldQTGltd0NlQmtaZlRNN1JTek55UmNDK25GelVPYmNBdGxyWlpyN052Q0kx?=
 =?utf-8?B?bWtBMmpsV0pJOGp1RG01WllVVTZqRlNvK2VWVjZudjRqemRMTSt6SW1FV1lt?=
 =?utf-8?B?RkIzVi81TkduSElMaFpza1ZlZXNXTGRSRmhuZG42VG43bzBHRVNlQm8wSGJK?=
 =?utf-8?B?VE9IR2xUZ2tndVNtWXpjbklzaFdFbEsycy9CSFRiNVlvYmxLdmFOeGdxRXdI?=
 =?utf-8?B?Qmd5Z1daYmgyd2ErNEpVMk0xQTR0SUNMZGRpRm9YOGxpQ1g4RTk3cWlrUWdx?=
 =?utf-8?B?c3dvV0VCUUpicE5LeWhIT1k5blcrUGJ1SHc5WTg2ZkhyS25QM2NtQ0xyVzVs?=
 =?utf-8?B?bGZEZVZuSUZuWkJEcjlzakRveHQ0cEF1d1JmbGRwTndPdlczMzAvYkp0dWJR?=
 =?utf-8?B?S1pBclpvYlg1aGc0RVI1a1lucGlGSEV2aFVrRVc1Mys2Z1oxL3FoNUFkWkFP?=
 =?utf-8?B?UDRuNmoyQlI0blBiR3oyWklSQ2VBdEhxSWhNSE92Y0JXNWlVbDA3V3VBNkVX?=
 =?utf-8?B?NWV1VTdQSHFoOTQ4RWg3MGlFUmFaMi9saFlUa1hEWlgrb3Y0TUpqL0JzNTVu?=
 =?utf-8?B?eFhnTTRBZnJmTVlVQVZBREZFSVRNUDNjN3RWMEhEdXFJZVlWT1R4RGtjWWpL?=
 =?utf-8?B?TDU3am5YeGRxVGswblhxTkpjcUdBUm0raTJueSt5eW9NL1pPQWhoR3Z3ZHZW?=
 =?utf-8?B?dmh3MXZQYU5lQm5vN2psNDdqaEltUmJEaVRsQTJ2aHhCY2JCR2hvNk5lV0dX?=
 =?utf-8?B?N1dOZ1dJV2hDbjM1K0Z1MGJYNHo0dTkrN1Q1ZmVJVWlrUkY3Wkw0MU5wWTdv?=
 =?utf-8?B?Z2NwdEFqbFRuWTd3d0pqRWh4S2FOMy9vZHV1QWFWNENFQjc1SFEwaW52eE55?=
 =?utf-8?B?eVZFaEI3ME5QRGVtYU03YTV0d3h4aHNQSEdhT0huZGFZOFhxQzFMSUo2TWs0?=
 =?utf-8?B?VzE1N09wVzYrQ016U0xoNTZ0U1V1RGRUdTcrSitJZnZLNmJoQ0NmUUF6R1pI?=
 =?utf-8?B?NlBkb0xVWTFObERtR2lESzltbjgrVmVhU1BXQlFMQUtWMkJwMTFNVHptQkxy?=
 =?utf-8?B?V0xHd1dPRklQWlV3N2ptaklEejNkSEJCZkJtQ1ZXYUtCZDZGdUIwMndNdVZ0?=
 =?utf-8?B?OXhVclpRRXYwUkxTUFNQa003eEVicDZCRU5VOUNwNU1QY2tjQ05BanQ0OUEw?=
 =?utf-8?B?enMxYnREYXdMdWZhVmlUVmtGbFhXSTF1QmNTdE1pK0dqTjlwQmpheEh0ZDZt?=
 =?utf-8?B?YjI1WTY3eGRlWllyQ2RsOUlxbmZhUmRzNzZqQkpJMzREaGpaeEUrOE82enNP?=
 =?utf-8?B?MHFvN3N3TFJYT0lDYksvdTB4OWZhOU1uTnZYVjZ2TzhhTXl2WVRiSU94TE9M?=
 =?utf-8?B?OTRIMTAyUGpIQUZNb1Q2aWJiVHl4dkY3YzF4bzZQbzgrMGlMVnVGQ3ZRZytS?=
 =?utf-8?B?R2t0YlR4aWV0c0orWmxWRkRYeVlLZm4yNjkwTmd6cmgwVWJ2SEUzeFk1bGYv?=
 =?utf-8?B?RWFmRG1CdGlsRUZyY3RnZzB2TUNzMXlUeFNreXJPc1lML1l1WFRXaDFjTzBY?=
 =?utf-8?B?QmUxemZBU0RPQmRwZlJUemxwUHl2azVpN2VXTHZuWXJIMXh6eHk2NEpZOUZT?=
 =?utf-8?B?LzhlOHhwb1I4cWI0ZHV6cGg4S1ZmQWlpNlRpbURTNGFGck1wZzhuWVFoeEor?=
 =?utf-8?B?WTV0bmlPckxQZ0FxVXVnTm9abDFmOHFiOUxMZnJ3QXYvelFySDNHdHp2OGJ2?=
 =?utf-8?B?bXpGZHBZUHJUckc2OXpRVjJXTHM1YXFUbmgrQVFqZEdEd1VIRmxBcjU4OU1i?=
 =?utf-8?B?Y04xbjJ5NlFoaWd2MXBIaXhKcnZhaS9RUDgxNmZxeFUyclF0MzhYUnZHRFl2?=
 =?utf-8?B?TFB5dCtzN0t0dTFkTnVWbXFDdFZ2SEdwSG5mMldadXhrVUtqd0ZyUEVoVnZG?=
 =?utf-8?B?ZVAydC80YjdWcCtvd2d5NFFNQThVM3lKTzE3aWJtS2V5VTVNZmRTUTEwVi9S?=
 =?utf-8?B?NC8zMGJlQW1YS0l5SXE2TXZPTE1NTDd0ZkVOWndyTDNLWE9TVXorQWNReDhu?=
 =?utf-8?B?eEVkazJKYUdBUzgvRFRuT2F6ODY5bCt4NThZMUQ3a1FXT0liK2lDNEJHTUJG?=
 =?utf-8?B?QWluSzhUZFMrSmgvOUxtYTJEVFpaU2I4N0xmZitJemZBV0x4Yjh1dytjczdD?=
 =?utf-8?Q?4lHYgcpur6mHFBtZ2kMHbntNFs6dzk9OikpE95Qbj8=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(7416014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 12:36:05.2879
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 783c4bb1-3bac-4cc7-7adf-08de58e9a51d
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF00009523.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR10MB7061
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDEwNSBTYWx0ZWRfXy3pQJl+T3RQb
 i8UJpkyD/Wyekm/UcS02imXmUs9hjy4s4dwhfscp4dz2ankJTTMDFAsTQTecYJfcwTnlN3YGkom
 lniFnNLQg1dyH9DLhLGexkTVkviWVy9qT2g9SYVLILiJ+w3sHGeICZYVkGRieDyoW635/NStxXb
 EGpch5dV7Sao+FfDrF5L/SkLe4fh2TDkJyVL9zy3bezZLR1X1sT8UHBLLR5tn9S/bMh1FMSlBFg
 L0FmOkqroUWj7ddEk6YQHNo0hIbA3LUjrbhx3rwHONLekvbboQX3xwdGJICTIpy2jO3ZxDSkUC9
 5nXHb6JXqot0VlLhVSXr7Enekr+C8TgmWryzwn4QhoxnilCrDjOXX4yw4jOIL7ToqQ2Do6x/lVK
 Wp5rspUZeub+n5DdDbNkUjaACINBAGl+GHH9TN+pELqtPyTXcVRwZYZj8FtsTY5sp72lsZG4NBQ
 JEVObp4IUIsuWMHPRAw==
X-Proofpoint-GUID: TSA38Ktn06swYowTthsnRqapwVnesYod
X-Authority-Analysis: v=2.4 cv=dZqNHHXe c=1 sm=1 tr=0 ts=6970c839 cx=c_pps
 a=mqCKFYWqC4Jv+say6eUmRg==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=rg8MelPR9j8A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=mOgyZ-Q4tP4zXMNofoEA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: TSA38Ktn06swYowTthsnRqapwVnesYod
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0
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
	TAGGED_FROM(0.00)[bounces-30858-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[arm.com,linaro.org,kernel.org,linux.dev,gmail.com,foss.st.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,st.com:email,foss.st.com:mid,foss.st.com:dkim];
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
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: E814956FEB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On stm32mp1x boards, enable the debug bus so we always try to probe
the debug peripherals, if their status and the debug configuration
allow it.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp135f-dk.dts   | 4 ++++
 arch/arm/boot/dts/st/stm32mp157c-ev1.dts  | 4 ++++
 arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi | 4 ++++
 3 files changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp135f-dk.dts b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
index f894ee35b3db..ebc719797271 100644
--- a/arch/arm/boot/dts/st/stm32mp135f-dk.dts
+++ b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
@@ -174,6 +174,10 @@ &cryp {
 	status = "okay";
 };
 
+&dbg_bus {
+	status = "okay";
+};
+
 &dcmipp {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&dcmipp_pins_a>;
diff --git a/arch/arm/boot/dts/st/stm32mp157c-ev1.dts b/arch/arm/boot/dts/st/stm32mp157c-ev1.dts
index 8f99c30f1af1..e69c8e282c8b 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-ev1.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-ev1.dts
@@ -81,6 +81,10 @@ &cec {
 	status = "okay";
 };
 
+&dbg_bus {
+	status = "okay";
+};
+
 &dcmi {
 	status = "okay";
 	pinctrl-names = "default", "sleep";
diff --git a/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
index 8cea6facd27b..fe2ab07ea4a8 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
@@ -140,6 +140,10 @@ &crc1 {
 	status = "okay";
 };
 
+&dbg_bus {
+	status = "okay";
+};
+
 &dts {
 	status = "okay";
 };

-- 
2.43.0


