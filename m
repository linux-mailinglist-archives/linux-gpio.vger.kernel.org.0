Return-Path: <linux-gpio+bounces-27116-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CBF7BDA3DB
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 17:11:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8D60619A54B0
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 15:09:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D453D2C11E5;
	Tue, 14 Oct 2025 15:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="YhOBcLd8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC352BDC13;
	Tue, 14 Oct 2025 15:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.182.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760454567; cv=fail; b=iAnq4nfv1IwVGFok/BNe9sNCtCLpRGQ48Fm3Xo6WqrLPhQhL9RbGZgsj0uLui7HwnfsEv3hDVasS6nXQqhzCqT9I7ZR1G8PVcyYYR7D9BkNByrd/1LXXO5K3M4r1r6+mrdpkjo5slCbdYY//2OW9pcsvO9v8P3kZfDafHZk8cpA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760454567; c=relaxed/simple;
	bh=Y6ubsqFtWQoK092wq40h4LBLrr/NoAmU6++3VFy5c8E=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Pa+SjXuwy7C8aNff2LOhPU5zk/9uv9UcyqJbmTMe9GjhN66xmUmjU4qZaiWuXB664lxsvOSGi6Ou3KsZx4Jc+czQLDgL4uQI62NfmYwSxujkCjAO0mAAhTJesv+JhR2LWUJsVELOxmDKrhTXBA4Md7KFl4nz1a+XF/cYHNzDoHI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=YhOBcLd8; arc=fail smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59EDKENJ016140;
	Tue, 14 Oct 2025 16:05:01 +0200
Received: from osppr02cu001.outbound.protection.outlook.com (mail-norwayeastazon11013058.outbound.protection.outlook.com [40.107.159.58])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 49qfe64nh7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Oct 2025 16:05:00 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=njFtLWwrq1S4Y7087YtkjcCNFOGZhrffvP3jfSjECgTyKdoupXKR0mOKcvlfr8KK9mtljA1aIjBzhIyMDwBCJW1uH9jr3Dzc93q6DPnBUAnRUWSZkXF0TK8vfSmf0/Xm+Gid8tcbB+oChez+KqSIlxsMQd/vd/6nguf64UdHs8uwHpKmdGVAI/fUuSHTax3iTIFp7Esa3re2xqfAgTZG3lXFBPfvJSpPumoiFoerij5enPfWBs8t/op67Ws8wxmWqujsB1y7N5sVLht8ZfuOuJAasPf39RJvFwMjnfmC1uUOF8BFwT01zBQgM47t+ToRqe5HN9CBeygpLrjYMW1Rfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=398Y5SDqwbUvV/z6j1yFd3Atar0VC/TtR3NNR6Zb8co=;
 b=w1dkx+KZVozgwouOr/USQcB49U4/mtWKnf0uCFEKzzbrDNC+YRk0H3tubImChF0kdvDcbqD5I5tjbozvR2q55aGjqq4lPuBEkC+bnUsWkpZ+ehAe1NRi2pE1ooZVpRfTHUggEKy2kngvGKBj61LFGBeMEvs31KIsVe2ywzaPUKIl+XyaZ9AF5hDMbAkZW0T722noqtIrcpP0ikwBmQralV7mfPsL1G91kviPgagYf95OOBWmXD8DS20F2xhblUQcV0tWserylXLLIfIzFNN8rCZbQyBChx0CItLM2+zxCggRCEvAEFuloiX+HXhO8F2kbhI44n179NoPvVcIoM7jaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.44) smtp.rcpttodomain=linaro.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=398Y5SDqwbUvV/z6j1yFd3Atar0VC/TtR3NNR6Zb8co=;
 b=YhOBcLd82ic15UoIOdPOVj7OYdqaV43SXjHgDL5k0SDYiLCjX3sYDtbSZQAu49QdWlQtZ9fC0LS+Q369T44Tw8FdxfJZdGzidJ7pKSgVl40QW4Ib/VgqmZFLI9HtCN5CSwmoeeVvlBsLKNlmQwBHr/6qQSRvNSsyDmrDRn9k9/+4fuwBvJEpL9r5lj4/HuxSo2Nq2n7I5H4X7Km8GxjAUImkQuEL0UlPIfIbGsyRnKmbmtfnqRhsUd3a7x96rJQO+iXsgBjcLRkSwmE5sf8qpB3iXzM3Cs5QxxXmElzPrMMNlpwHaLZbi/NuD+PIHr5ByJv+wr66jM+qq4l+WrBQdw==
Received: from AS4P250CA0027.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:5e3::18)
 by AS4PR10MB5521.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4ff::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Tue, 14 Oct
 2025 14:04:58 +0000
Received: from AM4PEPF00027A67.eurprd04.prod.outlook.com
 (2603:10a6:20b:5e3:cafe::2a) by AS4P250CA0027.outlook.office365.com
 (2603:10a6:20b:5e3::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.10 via Frontend Transport; Tue,
 14 Oct 2025 14:04:58 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.44)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.44 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.44; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.44) by
 AM4PEPF00027A67.mail.protection.outlook.com (10.167.16.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Tue, 14 Oct 2025 14:04:58 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Tue, 14 Oct
 2025 15:57:53 +0200
Received: from localhost (10.48.86.11) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Tue, 14 Oct
 2025 16:04:57 +0200
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
CC: Antonio Borneo <antonio.borneo@foss.st.com>,
        Christophe Roullier
	<christophe.roullier@foss.st.com>,
        Fabien Dessenne
	<fabien.dessenne@foss.st.com>,
        Valentin Caron <valentin.caron@foss.st.com>
Subject: [PATCH v3 03/10] pinctrl: stm32: Rework stm32_pconf_parse_conf()
Date: Tue, 14 Oct 2025 16:04:44 +0200
Message-ID: <20251014140451.1009969-4-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251014140451.1009969-1-antonio.borneo@foss.st.com>
References: <20251014140451.1009969-1-antonio.borneo@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SAFCAS1NODE1.st.com (10.75.90.11) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A67:EE_|AS4PR10MB5521:EE_
X-MS-Office365-Filtering-Correlation-Id: 191f02e8-0ffc-4e05-4acb-08de0b2aa8f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2kJWEsNjt12zfU0d6W4X9hFEcv7zlcGoS/gW4KGQ1Iq+DZIET0AvywNErMvS?=
 =?us-ascii?Q?4Ql8ts9u5h1sfYu7eJM0J6KaYzzU0COngb4YEyghW9M6zDaQvDCXX4Nss5z9?=
 =?us-ascii?Q?bPA53JlyBGhBtljD+THWBAU5JX16Y2VJIXLMeFcnGYtMEJZqU9lkJFvFnvoM?=
 =?us-ascii?Q?lOqB7sQAWRh8cew56PohI3aKPatzsK9gl5737kuSYBr2CF18e3giSSWX9JCe?=
 =?us-ascii?Q?wmzXnYWfQuUkypN/VTMVu/GPGN+n73sUTiU29SlPFKkMGKFQQFRVgeREjioL?=
 =?us-ascii?Q?UtoSwGqxAbQofnVu66DRbs3a6bA1KDdryhRBHP783GMhkOLhmjJNhsz9oGdB?=
 =?us-ascii?Q?spDll85k0DMF82rz7XKf0/vNOraSLoVGAF4LRQpwma3jmkG+rQMZjldIBB13?=
 =?us-ascii?Q?0I7qK3PFEHViaeJ2wD2MXW9ARtMAdwdBpIJKbQkZ4vzfxQ5GG9vT3g15Na2o?=
 =?us-ascii?Q?wrgDH0aw3IvVBaIYE1L4704E4Tyiv+IigQ8Pa3FfKX/VUXbl6RwdkdoXSYWR?=
 =?us-ascii?Q?tUaz+a5PAqvtu1N6T+OC/togxhOWKgmciOjHwnoSYVL5i/vEKA6JQ02Uz0zF?=
 =?us-ascii?Q?cfZV7wNoisCUfj8gjpLU4t16ggNCrQINqDXS8wSqjtUkJDrRpzpTFu6OIrCj?=
 =?us-ascii?Q?43+MmsorJG+YScDc1zPZccvfiwQGoMNu7/qBV5v/57ht/Lxab3/gD26iltGP?=
 =?us-ascii?Q?VekZM9s7gqd15F8FoPKsKV9L8gyCseBAJuuop4bghTXiJb8OOWJ59E3yhTgv?=
 =?us-ascii?Q?MDYpBW81e3VrkdinfsO5bDVh5H2vU8ilXe53jI5E8/w8Q3U100rt+f+SMmaC?=
 =?us-ascii?Q?37s5dKUige76qHLcx2RpHCv9b4a4aNDvlTYS8IANQw4SWZpifw6FT9yuKaMz?=
 =?us-ascii?Q?KkW0+jyoiw56lJVMctWQ7SKdAxthLcGly0XO4NWFs7ceVRJe43foixBSRNfP?=
 =?us-ascii?Q?RTt4ogXGXruzjATolPZyUgxCrUvjPSMccZEn39/ZHrvapXFtkytl4AgdW51t?=
 =?us-ascii?Q?BQcydLNC/dC6/68OueDNSq66cgGfJ22qyrHPbmHdyAsU8OYNs89+NVv2xWO0?=
 =?us-ascii?Q?NSXhZ9izmbh4F26dTswyB1f6uSTdWhOqBoFVQpGcotEVRPhntB+NJDtYyyfS?=
 =?us-ascii?Q?G8ENVym0eXq/luoQVavY1w7o62YTq0x2Y+f+3TvetI3F2bsVGXmPPWKi3gDp?=
 =?us-ascii?Q?hK2OD4410Y1M+RBGOmIyGRGfeBpVzoc4UMojR8IjBNw5SHLvH6eYQ0oxtFSU?=
 =?us-ascii?Q?5kERLACJnO3PJhH9IZPyQehwcqqRpf+z3jyjDAWIGxiVc/PeyJc1+r3umgKa?=
 =?us-ascii?Q?OCxOgu9OLAEDTyZzaIIjc1yZRpn3tgqtBzazXmqRg96tKTELiBvrdX/oKYtT?=
 =?us-ascii?Q?tM43mi81Uc/u7cD+hZYGB/fMWdS1fo8Rkw4yNbKXOeTzrGRz0pm0O7YMxKHd?=
 =?us-ascii?Q?5ZVTevHFKi9zX3ecRDs2Favrlq/8jPm0q+eGMwuWH1AxL1eR9MQGhNfSO/Ww?=
 =?us-ascii?Q?Lw6NdWSL/PCwLXkQvN58Crdde4e4buh/o05ZLolUxKystxJ60LWbGfLOflzu?=
 =?us-ascii?Q?5u8fIqhcU3fVbVng4d+rIYaVdte2bsZlI/DOCV/k?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.44;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7416014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 14:04:58.2816
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 191f02e8-0ffc-4e05-4acb-08de0b2aa8f0
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.44];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A67.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB5521
X-Proofpoint-GUID: wRk4egke0ByK_OhYV03yiBUSTkeO7U3O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX8FhK+/5EO8PX
 jFbFktWeyqzBzInOmsVvry5gF4cyaDfLQkNFWiyFhpsMyji2XP2elSnMUnZxgqeuWv1tArbIfdK
 lprhYKX3jZxZctfeZdpKDkEMZH4hljkGQ5VvBXCIKlsaQHee+GughUsyQ0YlDuL3ZskmuGroYeH
 H03OdpZKv+WmwqpQ3Q8zaYzm+vBiOOa3aQuaq/IcQftxzKFlRdW3Ips+gmrYqn4P5hRCCP/2UGQ
 OBik40+JDCJLapIOVIMkO0Mg3bmLhEUtwwQhP3FKI5Jn023PkoQ1f8s7qIz14MGxioLuTg97D/I
 ss88eRqGuwk3Ai5OdtAKrfG6rFu2sCXzz1JbtrpbJVJaC3ifcn2CDejK1izu+4Rrj8PY2z2futD
 CM5TesOkdfxtt0cXiGHtXtM989KXQg==
X-Authority-Analysis: v=2.4 cv=NfvrFmD4 c=1 sm=1 tr=0 ts=68ee588c cx=c_pps
 a=EPyYIxXEWdv0MJe+YDDwbA==:117 a=Tm9wYGWyy1fMlzdxM1lUeQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=y9YUpebZf6kA:10 a=x6icFKpwvdMA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=8b9GpE9nAAAA:8 a=JfSwdrTX8Euj0BBcFicA:9 a=T3LWEMljR5ZiDmsYVIUa:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: wRk4egke0ByK_OhYV03yiBUSTkeO7U3O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110018

Reduce the number of parameters of the function by moving inside
the decoding of the field 'config'.

While there:
- change the type of 'param' to 'unsigned int' to handle the extra
  values not in 'enum pin_config_param';
- change the type of 'arg' to 'u32' to avoid additional conversions
  and align to 'u32' the corresponding param of __stm32_gpio_set().

Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 drivers/pinctrl/stm32/pinctrl-stm32.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index 3ebb468de830d..6c5f9e015e8e1 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -287,7 +287,7 @@ static void stm32_gpio_rif_release_semaphore(struct stm32_gpio_bank *bank, unsig
 /* GPIO functions */
 
 static inline void __stm32_gpio_set(struct stm32_gpio_bank *bank,
-	unsigned offset, int value)
+	unsigned int offset, u32 value)
 {
 	stm32_gpio_backup_value(bank, offset, value);
 
@@ -1195,10 +1195,11 @@ static bool stm32_pconf_get(struct stm32_gpio_bank *bank,
 }
 
 static int stm32_pconf_parse_conf(struct pinctrl_dev *pctldev,
-		unsigned int pin, enum pin_config_param param,
-		enum pin_config_param arg)
+		unsigned int pin, unsigned long config)
 {
 	struct stm32_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
+	unsigned int param = pinconf_to_config_param(config);
+	u32 arg = pinconf_to_config_argument(config);
 	struct pinctrl_gpio_range *range;
 	struct stm32_gpio_bank *bank;
 	int offset, ret = 0;
@@ -1267,9 +1268,7 @@ static int stm32_pconf_group_set(struct pinctrl_dev *pctldev, unsigned group,
 
 	for (i = 0; i < num_configs; i++) {
 		mutex_lock(&pctldev->mutex);
-		ret = stm32_pconf_parse_conf(pctldev, g->pin,
-			pinconf_to_config_param(configs[i]),
-			pinconf_to_config_argument(configs[i]));
+		ret = stm32_pconf_parse_conf(pctldev, g->pin, configs[i]);
 		mutex_unlock(&pctldev->mutex);
 		if (ret < 0)
 			return ret;
@@ -1286,9 +1285,7 @@ static int stm32_pconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 	int i, ret;
 
 	for (i = 0; i < num_configs; i++) {
-		ret = stm32_pconf_parse_conf(pctldev, pin,
-				pinconf_to_config_param(configs[i]),
-				pinconf_to_config_argument(configs[i]));
+		ret = stm32_pconf_parse_conf(pctldev, pin, configs[i]);
 		if (ret < 0)
 			return ret;
 	}
-- 
2.34.1


