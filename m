Return-Path: <linux-gpio+bounces-25684-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF54BB459E3
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Sep 2025 15:58:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AE7A5B622A5
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Sep 2025 13:56:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BE0B3680BC;
	Fri,  5 Sep 2025 13:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="ra9RI6ci";
	dkim=pass (1024-bit key) header.d=stmicroelectronics.onmicrosoft.com header.i=@stmicroelectronics.onmicrosoft.com header.b="ekOsL0ks"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 579523629B0;
	Fri,  5 Sep 2025 13:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=91.207.212.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757080593; cv=fail; b=hngn5Hnl8spPhRh64jPW1J+9rAXUibfT1I/5vvPSgvg5dxwgMmWWyLGmtAm2FFMgMANrTEl78qm2hQtFE3ZcxeEDKSNfddKiJSFiu9JrPY5cXoYaVgzv3Z3HbfBnklwQ5RalyfIT21NMcpUShbF6yEcODuxCmrZ7JSF/nsZYmAc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757080593; c=relaxed/simple;
	bh=m1XGJW08pLXqRjtKqVDB4meQJmYrcPFigbwVBadyocU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NAbdhyTuT8JgQgNHmHD3x1cvePkcHcGKSNNZaeCwG3tR9zaR3f3XLNI1bk/OYUbA2JnfqKaUPyLymxS5v9ILB0fksVI0Z17JpScwoTQREyCfAiN/d9G3lOw86CttPuESMfu47qjnjVnihbDSQPxu1/wxqwk6T3/G0W9XAJN73i4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=ra9RI6ci; dkim=pass (1024-bit key) header.d=stmicroelectronics.onmicrosoft.com header.i=@stmicroelectronics.onmicrosoft.com header.b=ekOsL0ks; arc=fail smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 585DrYmL011871;
	Fri, 5 Sep 2025 15:56:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	H9SwUoMHP/ENEYqYH0chUOPmixJDsZAQ8bQRBGK7m3E=; b=ra9RI6ciWI0PxFZN
	DAYnVC6YZHjE4umvXouparPzddakfaW5Ceh9R0mqTqLb9mjDYWYY5U6QktxCoJgF
	OIKM30P3sblTM8yI+JaklGcjImO0Qn/nWCD4lMjK3COB6H2L7gGkpFrbMpxX3Que
	hVGTPcVej2LFTevR5ukZxelBDr/uMCUbnNIULHfTjsF6kYupo4Fsxf8yJJNdYzRP
	A8nG2NBZB5GaYKn8BKqtdAaVbggJlIDildmjXF2vQp0/UchEWqfErIDVeAjj8aYu
	eaBI14qMNgjNn0SVecv5CU1C6PaXP8gd8MRshZG1YcoSEbTRhp2RyMdwknV4Ipuh
	huMsPQ==
Received: from osppr02cu001.outbound.protection.outlook.com (mail-norwayeastazon11013071.outbound.protection.outlook.com [40.107.159.71])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48upe7ts1x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Sep 2025 15:56:07 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AxclgzUnyyVhU5N6miE2qVD6VsZL5ToCBT2b72cazYfSAlvo8kA/OAcc3XE9YZ7ZoRMf0/9cm9lRAJ8k8Rpfy80V0LdiQT3v0NSWVB29DGFxnNLWv3CLLWvqmvHeGerkK4dApD2Lecuvt5DFWvYAQzk22xbi9RffAI1cczaUwqjYvrOc1pe1+sh8UP7RUg/vvn4Zld7WKEV1V9Y6oyS6PE9z2XN9qZ6SGyZgCWVUu2lWMXtpSs5+V524QP9EBoPfP624aYztw69+mUdcgcNNNZUfMeCuPCUkRVbpkkLBc+GNyMX7B+hi74aNDqYUjAod/AFCGxBBMu/Zb8WwJP/xsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H9SwUoMHP/ENEYqYH0chUOPmixJDsZAQ8bQRBGK7m3E=;
 b=rfu4XA/aDzLh6KVUZxyBfLnj3IWlQEL4NgGOhAFhVlKnJmf+C9/d/C7Qfa1MBLJOqZ+nROD2Pv76agYeV2Lt0IVH4voHCP0ncsWWlJBKqLrFZ2AB0i1ecxuLEApRpCBQO4H5vrV9WgKqLh7kT6EEp+88Z5fPG7D5xsa+y2b41+2M0DVnBTH3vkmHwX9HCG+jAOcikq+1MTqFsGsnRgSXTsOlhlWfvjWIfGOILUQRooz0ySwNo+fN3rQZxUh4/30KlFwLlHGuKojIIagtNjqn46yE6ukxlRVPDVAHXzDrgNafAZYNfYx+SBiHgU20z3KLaFVNpxTyV+d1hodjFDuH+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.44) smtp.rcpttodomain=linaro.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stmicroelectronics.onmicrosoft.com;
 s=selector2-stmicroelectronics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H9SwUoMHP/ENEYqYH0chUOPmixJDsZAQ8bQRBGK7m3E=;
 b=ekOsL0ksG5hxbk6krLdQsWZAg4Hd+CHSg2dlTo6gjUx+g39kvtzF57ZgUqyA8XvkzpTS9bEgs7FY02v9rRHXqPTNYA+KhQsJVkNvk119bsd1iv92sltwSw/12rKlwNPukevaI2GAGnjiYdxe9jPtQB/s8itev5g9dErgJRo4pys=
Received: from DU7P194CA0030.EURP194.PROD.OUTLOOK.COM (2603:10a6:10:553::21)
 by PAVPR10MB7401.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:31d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Fri, 5 Sep
 2025 13:56:03 +0000
Received: from DB1PEPF000509FC.eurprd03.prod.outlook.com
 (2603:10a6:10:553:cafe::3a) by DU7P194CA0030.outlook.office365.com
 (2603:10a6:10:553::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.19 via Frontend Transport; Fri,
 5 Sep 2025 13:56:03 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.44)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.44 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.44; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.44) by
 DB1PEPF000509FC.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.14 via Frontend Transport; Fri, 5 Sep 2025 13:56:03 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Fri, 5 Sep
 2025 15:48:49 +0200
Received: from localhost (10.48.86.11) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Fri, 5 Sep
 2025 15:56:01 +0200
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
Subject: [PATCH v2 4/9] pinctrl: stm32: Simplify handling of backup pin status
Date: Fri, 5 Sep 2025 15:55:42 +0200
Message-ID: <20250905135547.934729-5-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250905135547.934729-1-antonio.borneo@foss.st.com>
References: <20250905135547.934729-1-antonio.borneo@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FC:EE_|PAVPR10MB7401:EE_
X-MS-Office365-Filtering-Correlation-Id: d4a8417a-74bc-4190-5c2d-08ddec83f41f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|36860700013|82310400026|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UhY1TdS/BuekZPeXa714Sk/VmKQcaVjKMirwHCmCqjvevm2pSeCYoYKxFkUo?=
 =?us-ascii?Q?LUpX3tig5nMv9kEA7t4DQfsv5Sjd1Kyyer0VjkinOxSUnpSQvXangwEZUQVL?=
 =?us-ascii?Q?ZcthAhrcBsMQzSa4kYCYSG6QijT+Z+vrMDKQj8hxH89F7clVYv5Tp4JZPTIM?=
 =?us-ascii?Q?LRie/+q6o1Y8ddl+yG7zRyshv8da3USfLlJ4/JDD5lnaldS+wuw636oNtkiZ?=
 =?us-ascii?Q?xlIvFPBy3nTMTLOY3/nnfepa9/vZckyGQByHJHpS0qU+MOaOd3VulKVydmTJ?=
 =?us-ascii?Q?+dgzwnsVd+lwnIJJDymUR7PjND5p4tF+jmSBpt7BPpnqtp0C2BFC6LiDq2c1?=
 =?us-ascii?Q?ztX8QMW0cyzAixTaeoZZ/JdnnU414uPJ/WWYyUri/auF7rkblvUPUG1akTNv?=
 =?us-ascii?Q?ESmhX3q0Mk9LzBGK398N65rpI55xqhCdZ5S79dAr3clmaqrppLKPtD+9YVfv?=
 =?us-ascii?Q?j+6IVjDy16J47PxUGFXTDEypyjfHTjqboFJEUdcY9OGNTEtO5aXY1LkYMj2h?=
 =?us-ascii?Q?3yfWEP1AMSXW9TIGgSlb62AahlLwPxaB7znc3CuC3Ld1fex6rULRJ+RC6ph4?=
 =?us-ascii?Q?jTpZOx2xaMVnT3Lj2gro057mUkhJ6BIesM+5VZHyQy7/HzLqPt5X5wKudUPp?=
 =?us-ascii?Q?48rIaELIkgCZbKGXwHWDPGdkMCmHJ1tLaFTjoZEQHs8CA2ir0wzzDj8HkZLl?=
 =?us-ascii?Q?OB9a/heye3fo6CkLFzV/YiTmxjwSzwuzGey5AOOHzrX3dYUHGILycZFOvY67?=
 =?us-ascii?Q?U+8KS+a/L4e5t7bS9xLAfKH3SfD0rfehVeais8HszMfmsltxY3DVo5knzKvm?=
 =?us-ascii?Q?TgGU6ehfG2evITAHdXtuoVvUE0v5UYdkN1lagQekyBEEMf26VDs9R3ajStN4?=
 =?us-ascii?Q?1LB2ybbgH9Sl0rmnvX+pWbupt9UxGI0Uj2x53F0OvQH4g/6TLUDahYje84kK?=
 =?us-ascii?Q?f/SgVNsflY8S0t5p8Ffu7DBjx/gNij8AMBf5SXNZVrUaek/85CMiWjeWyopA?=
 =?us-ascii?Q?Kot685EUGnzfgxM1l7nI/nfoHJaRZ0WAWbroCIIMrzR7c29cd1Uepa3wpY87?=
 =?us-ascii?Q?dA97Ie3zIyz9vEDr2pEn94iR3IJ7cL1lvZa7GftnYU5g7G8O/X799cWIE77p?=
 =?us-ascii?Q?2FY0yeyIQaruF+sVITOxBN61UfYQOsZGweIkmsTgT1/zCsWDjWA8uxoqeGRq?=
 =?us-ascii?Q?fBlwHI4Vbq4GrJx13L0bpFoeFD5mjgt3Nc1jTT1oEkXWQtFMQLGkVMD1n6Jh?=
 =?us-ascii?Q?k4mdEqQEBSMtAUmOkIPYHiLaXWPKUZpY9Aabq4WovoUtOzxmykLDTO3km6SG?=
 =?us-ascii?Q?SmjZH/Pdos1EfZW1A6UMGvTfP5nfpeJWCZvT+M3Bg8dgtoNlQs3uWyHUjawa?=
 =?us-ascii?Q?oPx9zOPt/S2vUfVg4p1lbSwtgQ2lNIR3qoz5QoZM7KI+tQGSSeZmSPzbXV/6?=
 =?us-ascii?Q?tOT7qHwZN3+XNxnB/v3I00OVDT7MkjbZMQWBU6vGcT43XFlFTZmc/N9X5ZAi?=
 =?us-ascii?Q?ngpmz4q81Tq4Ws4okp47HAl1wgVdCZBhl2Np+0sOFxExRwPMXengJyp/RQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.44;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(36860700013)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 13:56:03.5891
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d4a8417a-74bc-4190-5c2d-08ddec83f41f
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.44];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509FC.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB7401
X-Proofpoint-GUID: PlxCp-owqfiza67wDV_i7FMZytYsBVDT
X-Proofpoint-ORIG-GUID: PlxCp-owqfiza67wDV_i7FMZytYsBVDT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI5MDIyMCBTYWx0ZWRfX0peU9EyInZsi mBy1T/B1LFPiLM3ALC8KlRF/5o77ooKV9eUZ/n7RVV0rcpfIDkbeTKjHo6ZG3lfsYgF0LK2nQul wh3ny9FZ/dMvSGmmDxPg0fKjcLJLxK5ylzPcw9DlE4swVZQSDywMxZIvng11dxPK6joVlVqY94o
 VA6UB4/Gb1qX8qJuKVkNDqRtp73PXAFA7mHvDPu+6ps6hV3tkuy72bbFrrey8uJdKsIoHrW1oPU 4NEmbpqdhcA5Fu5Ghp+cb/YLyac3pcaKNZYR1TH57IxLLAnrTo4IjNte6K+ytEvJaZm77GWG8c+ 6nS/SuoQclyMOFploTcQuby3zSrnLMly7tUSGZTHEX9oLPyYt+KLGVvypEU92TH542NVukj1uDx MLAIdr6B
X-Authority-Analysis: v=2.4 cv=Vq0jA/2n c=1 sm=1 tr=0 ts=68baebf7 cx=c_pps a=nsoQvsRrYYDhZEvY/HQASg==:117 a=Tm9wYGWyy1fMlzdxM1lUeQ==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=y9YUpebZf6kA:10 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=FUbXzq8tPBIA:10 a=8b9GpE9nAAAA:8 a=WsDl9yZTujSQv8eLU2MA:9 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_04,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 impostorscore=0 spamscore=0 suspectscore=0 adultscore=0 clxscore=1011
 bulkscore=0 phishscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508290220

Use C bit-field to keep the backup of the pin status, instead of
explicitly handling the bit-field through shift and mask of a u32
container.

Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 drivers/pinctrl/stm32/pinctrl-stm32.c | 70 +++++++++------------------
 1 file changed, 24 insertions(+), 46 deletions(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index baf160a71c11c..741f503b6c44c 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -54,18 +54,6 @@
 #define STM32_GPIO_CIDCFGR(x)	(0x50 + (0x8 * (x)))
 #define STM32_GPIO_SEMCR(x)	(0x54 + (0x8 * (x)))
 
-/* custom bitfield to backup pin status */
-#define STM32_GPIO_BKP_MODE_SHIFT	0
-#define STM32_GPIO_BKP_MODE_MASK	GENMASK(1, 0)
-#define STM32_GPIO_BKP_ALT_SHIFT	2
-#define STM32_GPIO_BKP_ALT_MASK		GENMASK(5, 2)
-#define STM32_GPIO_BKP_SPEED_SHIFT	6
-#define STM32_GPIO_BKP_SPEED_MASK	GENMASK(7, 6)
-#define STM32_GPIO_BKP_PUPD_SHIFT	8
-#define STM32_GPIO_BKP_PUPD_MASK	GENMASK(9, 8)
-#define STM32_GPIO_BKP_TYPE		10
-#define STM32_GPIO_BKP_VAL		11
-
 #define STM32_GPIO_CIDCFGR_CFEN		BIT(0)
 #define STM32_GPIO_CIDCFGR_SEMEN	BIT(1)
 #define STM32_GPIO_CIDCFGR_SCID_MASK	GENMASK(5, 4)
@@ -100,6 +88,15 @@ struct stm32_pinctrl_group {
 	unsigned pin;
 };
 
+struct stm32_pin_backup {
+	unsigned int alt:4;
+	unsigned int mode:2;
+	unsigned int bias:2;
+	unsigned int speed:2;
+	unsigned int drive:1;
+	unsigned int value:1;
+};
+
 struct stm32_gpio_bank {
 	void __iomem *base;
 	struct reset_control *rstc;
@@ -110,7 +107,7 @@ struct stm32_gpio_bank {
 	struct irq_domain *domain;
 	u32 bank_nr;
 	u32 bank_ioport_nr;
-	u32 pin_backup[STM32_GPIO_PINS_PER_BANK];
+	struct stm32_pin_backup pin_backup[STM32_GPIO_PINS_PER_BANK];
 	u8 irq_type[STM32_GPIO_PINS_PER_BANK];
 	bool secure_control;
 	bool rif_control;
@@ -176,38 +173,32 @@ static inline u32 stm32_gpio_get_alt(u32 function)
 static void stm32_gpio_backup_value(struct stm32_gpio_bank *bank,
 				    u32 offset, u32 value)
 {
-	bank->pin_backup[offset] &= ~BIT(STM32_GPIO_BKP_VAL);
-	bank->pin_backup[offset] |= value << STM32_GPIO_BKP_VAL;
+	bank->pin_backup[offset].value = value;
 }
 
 static void stm32_gpio_backup_mode(struct stm32_gpio_bank *bank, u32 offset,
 				   u32 mode, u32 alt)
 {
-	bank->pin_backup[offset] &= ~(STM32_GPIO_BKP_MODE_MASK |
-				      STM32_GPIO_BKP_ALT_MASK);
-	bank->pin_backup[offset] |= mode << STM32_GPIO_BKP_MODE_SHIFT;
-	bank->pin_backup[offset] |= alt << STM32_GPIO_BKP_ALT_SHIFT;
+	bank->pin_backup[offset].mode = mode;
+	bank->pin_backup[offset].alt = alt;
 }
 
 static void stm32_gpio_backup_driving(struct stm32_gpio_bank *bank, u32 offset,
 				      u32 drive)
 {
-	bank->pin_backup[offset] &= ~BIT(STM32_GPIO_BKP_TYPE);
-	bank->pin_backup[offset] |= drive << STM32_GPIO_BKP_TYPE;
+	bank->pin_backup[offset].drive = drive;
 }
 
 static void stm32_gpio_backup_speed(struct stm32_gpio_bank *bank, u32 offset,
 				    u32 speed)
 {
-	bank->pin_backup[offset] &= ~STM32_GPIO_BKP_SPEED_MASK;
-	bank->pin_backup[offset] |= speed << STM32_GPIO_BKP_SPEED_SHIFT;
+	bank->pin_backup[offset].speed = speed;
 }
 
 static void stm32_gpio_backup_bias(struct stm32_gpio_bank *bank, u32 offset,
 				   u32 bias)
 {
-	bank->pin_backup[offset] &= ~STM32_GPIO_BKP_PUPD_MASK;
-	bank->pin_backup[offset] |= bias << STM32_GPIO_BKP_PUPD_SHIFT;
+	bank->pin_backup[offset].bias = bias;
 }
 
 /* RIF functions */
@@ -1798,7 +1789,7 @@ static int __maybe_unused stm32_pinctrl_restore_gpio_regs(
 					struct stm32_pinctrl *pctl, u32 pin)
 {
 	const struct pin_desc *desc = pin_desc_get(pctl->pctl_dev, pin);
-	u32 val, alt, mode, offset = stm32_gpio_pin(pin);
+	u32 mode, offset = stm32_gpio_pin(pin);
 	struct pinctrl_gpio_range *range;
 	struct stm32_gpio_bank *bank;
 	bool pin_is_irq;
@@ -1818,36 +1809,23 @@ static int __maybe_unused stm32_pinctrl_restore_gpio_regs(
 
 	bank = gpiochip_get_data(range->gc);
 
-	alt = bank->pin_backup[offset] & STM32_GPIO_BKP_ALT_MASK;
-	alt >>= STM32_GPIO_BKP_ALT_SHIFT;
-	mode = bank->pin_backup[offset] & STM32_GPIO_BKP_MODE_MASK;
-	mode >>= STM32_GPIO_BKP_MODE_SHIFT;
-
-	ret = stm32_pmx_set_mode(bank, offset, mode, alt);
+	mode = bank->pin_backup[offset].mode;
+	ret = stm32_pmx_set_mode(bank, offset, mode, bank->pin_backup[offset].alt);
 	if (ret)
 		return ret;
 
-	if (mode == 1) {
-		val = bank->pin_backup[offset] & BIT(STM32_GPIO_BKP_VAL);
-		val = val >> STM32_GPIO_BKP_VAL;
-		__stm32_gpio_set(bank, offset, val);
-	}
+	if (mode == 1)
+		__stm32_gpio_set(bank, offset, bank->pin_backup[offset].value);
 
-	val = bank->pin_backup[offset] & BIT(STM32_GPIO_BKP_TYPE);
-	val >>= STM32_GPIO_BKP_TYPE;
-	ret = stm32_pconf_set_driving(bank, offset, val);
+	ret = stm32_pconf_set_driving(bank, offset, bank->pin_backup[offset].drive);
 	if (ret)
 		return ret;
 
-	val = bank->pin_backup[offset] & STM32_GPIO_BKP_SPEED_MASK;
-	val >>= STM32_GPIO_BKP_SPEED_SHIFT;
-	ret = stm32_pconf_set_speed(bank, offset, val);
+	ret = stm32_pconf_set_speed(bank, offset, bank->pin_backup[offset].speed);
 	if (ret)
 		return ret;
 
-	val = bank->pin_backup[offset] & STM32_GPIO_BKP_PUPD_MASK;
-	val >>= STM32_GPIO_BKP_PUPD_SHIFT;
-	ret = stm32_pconf_set_bias(bank, offset, val);
+	ret = stm32_pconf_set_bias(bank, offset, bank->pin_backup[offset].bias);
 	if (ret)
 		return ret;
 
-- 
2.34.1


