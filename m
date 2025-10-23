Return-Path: <linux-gpio+bounces-27541-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EA33CC01716
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 15:35:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 11E96501782
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 13:35:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 951BC342151;
	Thu, 23 Oct 2025 13:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="UMGNsWFr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 309F8328601;
	Thu, 23 Oct 2025 13:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.182.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761226057; cv=fail; b=WNABOqXRsOgrLpCHCSVSzAgBaHSMlK28DWjQxzZSkHFPuclRJ7eq7DkwQpSWyKg+46jMDJ0QqATFShZMa3d8Yfx9Y9HwCm6X/9yu1OXdWD/665Un0uhbQqErPNjAEHHF7QBRbU+Qxl2TLHCsvUhOCs/72yNJ8ez9mcAyq6SA6QA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761226057; c=relaxed/simple;
	bh=3luwvpiPAqLpslsgpqS3iT8Dbn9GNdjGH/HoCyzVtjg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=urFV4PDZofDWPqaqwTei/s/J+4fbiJdTizuhLNl1wfuL8pONJA00G13FzyCGD29d4yccjW0k4VIzfRiBXAYvixqcoMucxlyelQb+GGAD41TAj2/CJeEn9GCbwbWtWJlyH1CIAUKRInUezcAcsijG+qzVSwONM3grtW4cUGRNo7M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=UMGNsWFr; arc=fail smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59NBS6XT009732;
	Thu, 23 Oct 2025 15:27:14 +0200
Received: from gvxpr05cu001.outbound.protection.outlook.com (mail-swedencentralazon11013068.outbound.protection.outlook.com [52.101.83.68])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 49yhdk13de-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Oct 2025 15:27:14 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eqncG4BHDImMKXRVEWx6s6qO2Gb9TWr4cc/OF+2YiLSw3wojnDp6cj4kz2/qK6l1Htoj5VeH/PJWrpAUlZQAjTIYax+XkbPnlUxzXTtoIs4etP5BtT9pgCmVPlbxmsatxzUsJ1OiTj1chRUZWrAIUgKGJfuR/Jrm7ZmBO2oKpCQFBwMEMRS9ZM83+HQOQem+rHYwd4lC54sXnjNk9WClIYmAgBavT9BHP1/oRmr8O0ZhEeuQpBwSF1hi4ObQHQbu5AhWv9+E3wk2x5XU9tUMadbI4Vnk896aH1xgYmlYh5MfqYF205zf2ERcweBNDu4jcnX60hTXNXKdZEMK8YLhAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=phc0ackv4OQDAPyCA4U06Sq0HNlaLEgGWxLOgTh8VeI=;
 b=sFA9annER0MJR4L4AI5bqjRYDk759wDOUm+cfVDvYM26QMzvseJOre4z+yByMclXK5+oyJ7GdlZusa67cxJRxOdG/EFcapHAbxpjZtspAScD9dhJVS4BaWJook8uGexgMln6VDAYRLyupBhgMWEGcAp7xi82r1IFyFcFlbL9ayhESqPO+x0ylZYmgbBUU4nUJcYwHhz0wBtzH9uSq6g0ykmBxBHrRISccMfLb3beGNVk5en/Z1keWQouZVYXoNvLwZKCg/bjzhaMNnGg3agHOuioZuaJ2DbH3vvSAP2x/LdfpFz4sYyPBqNWZmpuTcPtcuSM+jWQWnoLhpm+t/pXMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.43) smtp.rcpttodomain=linaro.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=phc0ackv4OQDAPyCA4U06Sq0HNlaLEgGWxLOgTh8VeI=;
 b=UMGNsWFrjPzf/t9k1aTPx+96KpPUcUJarTenvxrM4xP6/6okG4jtojyzqVeANrw8Vg5dkRjhTHtiFrTdtZVU+2la48XwOzO/PxYARDge3DTnadvs6UmhNheYbgTv1BGj2oZ/US4WvqlHMTshxs31RHewu1sgljd4OP3BVtwNkJVDJvqmvD5v6BOGjaSx3Y+C8LaHaF8wVtSWk6apfqGiMd4klB9T21LXjh0mjS8ygUVYJRxP6q//uD2lpYKCPPZ8YrsbYxBobUthfhXQy+LkQXlRfy9uu5Hw+YB0lgyoRte7hgKJjwGCaNuTlgjSJE1uMG3NYFo12m/7N/3prgDu9A==
Received: from DB9PR05CA0020.eurprd05.prod.outlook.com (2603:10a6:10:1da::25)
 by GVXPR10MB8155.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:112::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Thu, 23 Oct
 2025 13:27:11 +0000
Received: from DU2PEPF00028D13.eurprd03.prod.outlook.com
 (2603:10a6:10:1da:cafe::94) by DB9PR05CA0020.outlook.office365.com
 (2603:10a6:10:1da::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.12 via Frontend Transport; Thu,
 23 Oct 2025 13:27:01 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.43)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.43 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.43; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.43) by
 DU2PEPF00028D13.mail.protection.outlook.com (10.167.242.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Thu, 23 Oct 2025 13:27:11 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 23 Oct
 2025 15:24:45 +0200
Received: from localhost (10.48.86.11) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 23 Oct
 2025 15:27:09 +0200
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
Subject: [PATCH v4 09/12] pinctrl: stm32: Support I/O synchronization parameters
Date: Thu, 23 Oct 2025 15:26:57 +0200
Message-ID: <20251023132700.1199871-10-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251023132700.1199871-1-antonio.borneo@foss.st.com>
References: <20251023132700.1199871-1-antonio.borneo@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D13:EE_|GVXPR10MB8155:EE_
X-MS-Office365-Filtering-Correlation-Id: a587ab5a-8219-4bd9-966f-08de1237df9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|7416014|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?y7vO3XuODHwVR+RcrAhCWeVvE0FRcRJV7lpHQhUcM92kxKxFBI+cNgGAJOHj?=
 =?us-ascii?Q?98l9Oxkazokqubfa0grDXeeK0uWM1lkGXS6J2LV+6DtmDt6JRY78uqgJputj?=
 =?us-ascii?Q?7haJAHZGiGxkwsHHUs3jAjKZ3kPAJvhEioxbFxZLlaMW8/Ois40wENvC4biX?=
 =?us-ascii?Q?rzzwVV2FUVOEOtERPBwjsmfp0/t2XdzojxbhGuLnvzl/V9mkiaxCTq1WqhOX?=
 =?us-ascii?Q?vr3+Cubt1DiJtoVcDKg6+FCUgQvqWHdP5xRvDjkW6NncBUmGAB3MEhjKU49L?=
 =?us-ascii?Q?kHyIvAJwqvtfw9ngwwsBFJkrL0IOjPGP5MicEyxW4figg0mzTcmCQtLLsyUV?=
 =?us-ascii?Q?aMxuiDnnsNO+r4bSZsjrQzQ2kY+nbx4FnS06xBVOQ3J+88JXuG/X+9qSF4f8?=
 =?us-ascii?Q?B08jWzRp08WEXdowbzbT19pMjbq7A9buMKDDxwGx4FUPzfkFQVmAws4Q8Ila?=
 =?us-ascii?Q?K0WgGf0C/UpmL7QI5nel9uYakKsvg1vZzQRI4wXL8LFt9mT3SmAViPFqd51/?=
 =?us-ascii?Q?4iy4aS53lSuN5DR1ciE4kOpFYlmJPvus7kgBd3h2noglCSVrvQoxXYxGnQXA?=
 =?us-ascii?Q?VA3XEjdDmQHGhdV89Rl0odft+j4OcyxLLl5aNEIXoC9S0AzVABPav0p/q3a0?=
 =?us-ascii?Q?WVU60G0tBQ5+aTQJKqo0sHQPM0S5/6JmF+v+ytgrymziDPF+48VxvoskWeo5?=
 =?us-ascii?Q?C9R+VaYgqqRifLNZ+bAi9c7OmPJGn+eLeB6klRkcKlWPhJr/o9xSxlLUvQ+c?=
 =?us-ascii?Q?J9NyWKAOySoNvaI0JhziRdbtxqASIz6hQeuOQm88vfPy05ZuzGbjPzofFM21?=
 =?us-ascii?Q?j5D7uXf3MKtSIGD1V8n/T1q4huHr1CxOPx7qPePn4w8rv0UiwndWDPvCnsr4?=
 =?us-ascii?Q?Jy0ZGdrZlzEgSsFuNC3Jw0qEg/D6mXk+JUnhzrtu7CwzFvDmF2hRWGnHBBVh?=
 =?us-ascii?Q?i+Oh18/SJNrM7sIJMllO21uIwLgOJWAyGeaT0EdCZObS2laJRfhbaAXJvRw+?=
 =?us-ascii?Q?Fjc2ZMLAkgqt8f3JxtQaQTgLQXoz3URmfvBSF4xgZSreFep2OPrjdnehz7/l?=
 =?us-ascii?Q?rcJYw5PG2i80NR1XpiY4XWxhX/U8e8rki513U/r2+rYJ9UfU3bwxqTjBh17E?=
 =?us-ascii?Q?c1hbMLDcZuuQCWsWzR9VIbpj4XeX19adoERyVR9VXDZBSdNhT68gEvzMo0xk?=
 =?us-ascii?Q?RhcHFV2a2BukT3kpRSsJNjwtjVmKwqH1NmHkhv1l+6HT4yWzpiy0t6h7pBlD?=
 =?us-ascii?Q?Sco0l3x6uWHTvzfFZVK9pGNMKGgEOVFjwgnGFUwtshmunGPCSgyZrEimkMnF?=
 =?us-ascii?Q?SeBNuV+mR1z7YmRUnblSYgQG3Zm4g/jDep/YiKYfUvFjAy5Ni637OWbQWYzK?=
 =?us-ascii?Q?u0D4JHjP50pYrZyjQVc++Z+s9wxD/NMidzUfKOPuUEOEMez+MNJLbKi+BBcq?=
 =?us-ascii?Q?xjxJCI7NmqS+NeGQbvJgZ0IFEij8ig818ui0pQMyb5uTM49NV34GYtsuaNXo?=
 =?us-ascii?Q?A/kPpU41Xz8yDm8HXWwhsrQ6Km9fo/SHvDW+jnSeOkoNm/ZinaYrOcOudxcn?=
 =?us-ascii?Q?KALPx/oUAKd/osnuKRZmsKpywHXF2d+y8GV2pWQn?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.43;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(7416014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 13:27:11.6189
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a587ab5a-8219-4bd9-966f-08de1237df9d
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.43];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D13.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB8155
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIzMDA4MSBTYWx0ZWRfX1ZMEi4YZSx79
 Zzv1ZtlT6z2qZe73+V1jX6S5kn8nnc6MEdjX624d/ZFRDbWY0xrRxfGGbhWWXPCKlmwIVPiGohl
 oHQ//YUMimvDq4tI+pDgssQCamdtge6m814MpM9upK381QvQGtcPeGgnFpOweYVRmT8YXGiAxEY
 0Zgi3p/zesrZb6UBGUpZ78LKLO8kDinMuAJVjWD512v4Ig47+MqT2jfjwExAlRQhY1+ZIdSdPis
 UoqAVwVWeK2YatO5dw5wcNc9j49tprgnTnp8SgWLNMPNb3tEJPkgCDL2X2AH3YciazLLY45Kjxw
 zxzMe4ZSiNlGwZSkwN3muwze0fdlvOXR8upOrzOnsiIufqdMuqEfd0eQKw+XH5b50hHNzbE0H2t
 gcZjRDzskecDJneMy18adgxqCh581Q==
X-Proofpoint-ORIG-GUID: 9s3V7IuumebWdfJQf0qDKXjl_Vb5dn1u
X-Authority-Analysis: v=2.4 cv=dbaNHHXe c=1 sm=1 tr=0 ts=68fa2d32 cx=c_pps
 a=4OV8p1Ulk/08eHc07QrKIg==:117 a=peP7VJn1Wk7OJvVWh4ABVQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=y9YUpebZf6kA:10 a=x6icFKpwvdMA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=8b9GpE9nAAAA:8 a=GcfiOUnl-Qwgb4vcQAQA:9 a=T3LWEMljR5ZiDmsYVIUa:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: 9s3V7IuumebWdfJQf0qDKXjl_Vb5dn1u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 adultscore=0 bulkscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510230081

Devices in the stm32mp2xx family include an I/O synchronization
block on each pin that is used to fine tune and improve the I/O
timing margins of high speed synchronous interfaces.
It can be configured to provide independently for each pin:
- skew rate on input direction or latch delay on output direction;
- inversion of clock signals or re-sampling of data signals.

Add support for the generic properties:
- skew-delay-input-ps;
- skew-delay-output-ps.

Add support for the property 'st,io-sync' to configure clock
inversion or data re-sampling mode.

Show the new parameters on debugfs pinconf-pins.

Enable it for the stm32mp257 pinctrl driver.

Co-developed-by: Valentin Caron <valentin.caron@foss.st.com>
Signed-off-by: Valentin Caron <valentin.caron@foss.st.com>
Co-developed-by: Fabien Dessenne <fabien.dessenne@foss.st.com>
Signed-off-by: Fabien Dessenne <fabien.dessenne@foss.st.com>
Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 drivers/pinctrl/stm32/pinctrl-stm32.c      | 255 +++++++++++++++++++++
 drivers/pinctrl/stm32/pinctrl-stm32.h      |   1 +
 drivers/pinctrl/stm32/pinctrl-stm32mp257.c |   2 +
 3 files changed, 258 insertions(+)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index ac64cb7f86d74..5f8829fdd9851 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -51,9 +51,23 @@
 #define STM32_GPIO_AFRL		0x20
 #define STM32_GPIO_AFRH		0x24
 #define STM32_GPIO_SECCFGR	0x30
+#define STM32_GPIO_DELAYRL	0x40
+#define STM32_GPIO_ADVCFGRL	0x48
 #define STM32_GPIO_CIDCFGR(x)	(0x50 + (0x8 * (x)))
 #define STM32_GPIO_SEMCR(x)	(0x54 + (0x8 * (x)))
 
+/* Unitary delay for STM32_GPIO_DELAYRL */
+#define STM32_GPIO_DELAYRL_PS	250
+
+#define STM32_GPIO_ADVCFGR_DLYPATH_MASK		BIT(0)
+#define STM32_GPIO_ADVCFGR_DE_MASK		BIT(1)
+#define STM32_GPIO_ADVCFGR_INVCLK_MASK		BIT(2)
+#define STM32_GPIO_ADVCFGR_RET_MASK		BIT(3)
+#define STM32_GPIO_ADVCFGR_IO_SYNC_MASK		\
+	(STM32_GPIO_ADVCFGR_DE_MASK		\
+	 | STM32_GPIO_ADVCFGR_INVCLK_MASK	\
+	 | STM32_GPIO_ADVCFGR_RET_MASK)
+
 #define STM32_GPIO_CIDCFGR_CFEN		BIT(0)
 #define STM32_GPIO_CIDCFGR_SEMEN	BIT(1)
 #define STM32_GPIO_CIDCFGR_SCID_MASK	GENMASK(5, 4)
@@ -67,6 +81,9 @@
 
 #define SYSCFG_IRQMUX_MASK GENMASK(3, 0)
 
+/* Vendor specific pin configuration */
+#define STM32_GPIO_PIN_CONFIG_IO_SYNC	(PIN_CONFIG_END + 1)
+
 #define gpio_range_to_bank(chip) \
 		container_of(chip, struct stm32_gpio_bank, range)
 
@@ -82,6 +99,32 @@ static const char * const stm32_gpio_functions[] = {
 	"reserved",
 };
 
+static const char * const stm32_gpio_io_sync[] = {
+	"pass-through",
+	"clock inverted",
+	"data on rising edge",
+	"data on falling edge",
+	"data on both edges",
+};
+
+static u8 io_sync_2_advcfgr[] = {
+	/* data or clock GPIO pass-through */
+	[0] = 0,
+	/* clock GPIO inverted */
+	[1] = STM32_GPIO_ADVCFGR_INVCLK_MASK,
+	/* data GPIO re-sampled on clock rising edge */
+	[2] = STM32_GPIO_ADVCFGR_RET_MASK,
+	/* data GPIO re-sampled on clock falling edge */
+	[3] = STM32_GPIO_ADVCFGR_RET_MASK | STM32_GPIO_ADVCFGR_INVCLK_MASK,
+	/* data GPIO re-sampled on both clock edges */
+	[4] = STM32_GPIO_ADVCFGR_RET_MASK | STM32_GPIO_ADVCFGR_DE_MASK,
+};
+
+static const struct pinconf_generic_params stm32_gpio_bindings[] = {
+	{"st,io-sync", STM32_GPIO_PIN_CONFIG_IO_SYNC, 0,
+	 stm32_gpio_io_sync, ARRAY_SIZE(stm32_gpio_io_sync)},
+};
+
 struct stm32_pinctrl_group {
 	const char *name;
 	unsigned long config;
@@ -95,6 +138,8 @@ struct stm32_pin_backup {
 	unsigned int speed:2;
 	unsigned int drive:1;
 	unsigned int value:1;
+	unsigned int advcfg:4;
+	unsigned int skew_delay:4;
 };
 
 struct stm32_gpio_bank {
@@ -110,6 +155,7 @@ struct stm32_gpio_bank {
 	struct stm32_pin_backup pin_backup[STM32_GPIO_PINS_PER_BANK];
 	u8 irq_type[STM32_GPIO_PINS_PER_BANK];
 	bool secure_control;
+	bool io_sync_control;
 	bool rif_control;
 };
 
@@ -201,6 +247,21 @@ static void stm32_gpio_backup_bias(struct stm32_gpio_bank *bank, u32 offset,
 	bank->pin_backup[offset].bias = bias;
 }
 
+static void stm32_gpio_backup_advcfg(struct stm32_gpio_bank *bank, u32 offset, u32 mask, u32 value)
+{
+	u32 val;
+
+	val = bank->pin_backup[offset].advcfg;
+	val &= ~mask;
+	val |= value & mask;
+	bank->pin_backup[offset].advcfg = val;
+}
+
+static void stm32_gpio_backup_skew_delay(struct stm32_gpio_bank *bank, u32 offset, u32 delay)
+{
+	bank->pin_backup[offset].skew_delay = delay;
+}
+
 /* RIF functions */
 
 static bool stm32_gpio_rif_valid(struct stm32_gpio_bank *bank, unsigned int gpio_nr)
@@ -1145,6 +1206,155 @@ static u32 stm32_pconf_get_bias(struct stm32_gpio_bank *bank,
 	return (val >> (offset * 2));
 }
 
+static void
+stm32_pconf_set_advcfgr_nolock(struct stm32_gpio_bank *bank, int offset, u32 mask, u32 value)
+{
+	int advcfgr_offset = STM32_GPIO_ADVCFGRL + (offset / 8) * 4;
+	int advcfgr_shift = (offset % 8) * 4;
+	u32 val;
+
+	val = readl_relaxed(bank->base + advcfgr_offset);
+	val &= ~(mask << advcfgr_shift);
+	val |= (value & mask) << advcfgr_shift;
+	writel_relaxed(val, bank->base + advcfgr_offset);
+
+	stm32_gpio_backup_advcfg(bank, offset, mask, value);
+}
+
+static int stm32_pconf_set_advcfgr(struct stm32_gpio_bank *bank, int offset, u32 mask, u32 value)
+{
+	struct stm32_pinctrl *pctl = dev_get_drvdata(bank->gpio_chip.parent);
+	unsigned long flags;
+	int err = 0;
+
+	if (!bank->io_sync_control)
+		return -ENOTSUPP;
+
+	spin_lock_irqsave(&bank->lock, flags);
+
+	if (pctl->hwlock) {
+		err = hwspin_lock_timeout_in_atomic(pctl->hwlock, HWSPNLCK_TIMEOUT);
+		if (err) {
+			dev_err(pctl->dev, "Can't get hwspinlock\n");
+			goto unlock;
+		}
+	}
+
+	stm32_pconf_set_advcfgr_nolock(bank, offset, mask, value);
+
+	if (pctl->hwlock)
+		hwspin_unlock_in_atomic(pctl->hwlock);
+
+unlock:
+	spin_unlock_irqrestore(&bank->lock, flags);
+
+	return err;
+}
+
+static u32 stm32_pconf_get_advcfgr(struct stm32_gpio_bank *bank, int offset, u32 mask)
+{
+	int advcfgr_offset = STM32_GPIO_ADVCFGRL + (offset / 8) * 4;
+	int advcfgr_shift = (offset % 8) * 4;
+	u32 val;
+
+	if (!bank->io_sync_control)
+		return 0;
+
+	val = readl_relaxed(bank->base + advcfgr_offset);
+	val >>= advcfgr_shift;
+
+	return val & mask;
+}
+
+static int stm32_pconf_set_io_sync(struct stm32_gpio_bank *bank, int offset, u32 io_sync)
+{
+	if (io_sync >= ARRAY_SIZE(io_sync_2_advcfgr))
+		return -EINVAL;
+
+	return stm32_pconf_set_advcfgr(bank, offset, STM32_GPIO_ADVCFGR_IO_SYNC_MASK,
+		io_sync_2_advcfgr[io_sync]);
+}
+
+static const char *stm32_pconf_get_io_sync_str(struct stm32_gpio_bank *bank, int offset)
+{
+	u32 io_sync = stm32_pconf_get_advcfgr(bank, offset, STM32_GPIO_ADVCFGR_IO_SYNC_MASK);
+
+	if (io_sync & STM32_GPIO_ADVCFGR_RET_MASK) {
+		if (io_sync & STM32_GPIO_ADVCFGR_DE_MASK)
+			return "data GPIO re-sampled on both clock edges";
+
+		if (io_sync & STM32_GPIO_ADVCFGR_INVCLK_MASK)
+			return "data GPIO re-sampled on clock falling edge";
+
+		return "data GPIO re-sampled on clock rising edge";
+	}
+
+	if (io_sync & STM32_GPIO_ADVCFGR_INVCLK_MASK)
+		return "clock GPIO inverted";
+
+	return NULL;
+}
+
+static int
+stm32_pconf_set_skew_delay(struct stm32_gpio_bank *bank, int offset, u32 delay, bool is_dir_input)
+{
+	struct stm32_pinctrl *pctl = dev_get_drvdata(bank->gpio_chip.parent);
+	int delay_offset = STM32_GPIO_DELAYRL + (offset / 8) * 4;
+	int delay_shift = (offset % 8) * 4;
+	unsigned long flags;
+	int err = 0;
+	u32 val;
+
+	if (!bank->io_sync_control)
+		return -ENOTSUPP;
+
+	spin_lock_irqsave(&bank->lock, flags);
+
+	if (pctl->hwlock) {
+		err = hwspin_lock_timeout_in_atomic(pctl->hwlock, HWSPNLCK_TIMEOUT);
+		if (err) {
+			dev_err(pctl->dev, "Can't get hwspinlock\n");
+			goto unlock;
+		}
+	}
+
+	val = readl_relaxed(bank->base + delay_offset);
+	val &= ~GENMASK(delay_shift + 3, delay_shift);
+	val |= (delay << delay_shift);
+	writel_relaxed(val, bank->base + delay_offset);
+
+	stm32_gpio_backup_skew_delay(bank, offset, delay);
+
+	stm32_pconf_set_advcfgr_nolock(bank, offset, STM32_GPIO_ADVCFGR_DLYPATH_MASK,
+				       is_dir_input ? STM32_GPIO_ADVCFGR_DLYPATH_MASK : 0);
+
+	if (pctl->hwlock)
+		hwspin_unlock_in_atomic(pctl->hwlock);
+
+unlock:
+	spin_unlock_irqrestore(&bank->lock, flags);
+
+	return err;
+}
+
+static u32 stm32_pconf_get_skew_delay_val(struct stm32_gpio_bank *bank, int offset)
+{
+	int delay_offset = STM32_GPIO_DELAYRL + (offset / 8) * 4;
+	int delay_shift = (offset % 8) * 4;
+	u32 val;
+
+	val = readl_relaxed(bank->base + delay_offset);
+	val &= GENMASK(delay_shift + 3, delay_shift);
+
+	return val >> delay_shift;
+}
+
+static const char *stm32_pconf_get_skew_dir_str(struct stm32_gpio_bank *bank, int offset)
+{
+	return stm32_pconf_get_advcfgr(bank, offset, STM32_GPIO_ADVCFGR_DLYPATH_MASK) ?
+		"input" : "output";
+}
+
 static bool stm32_pconf_get(struct stm32_gpio_bank *bank,
 	unsigned int offset, bool dir)
 {
@@ -1207,6 +1417,17 @@ static int stm32_pconf_parse_conf(struct pinctrl_dev *pctldev,
 		__stm32_gpio_set(bank, offset, arg);
 		ret = stm32_pmx_gpio_set_direction(pctldev, range, pin, false);
 		break;
+	case PIN_CONFIG_SKEW_DELAY_INPUT_PS:
+		arg /= STM32_GPIO_DELAYRL_PS;
+		ret = stm32_pconf_set_skew_delay(bank, offset, arg, true);
+		break;
+	case PIN_CONFIG_SKEW_DELAY_OUTPUT_PS:
+		arg /= STM32_GPIO_DELAYRL_PS;
+		ret = stm32_pconf_set_skew_delay(bank, offset, arg, false);
+		break;
+	case STM32_GPIO_PIN_CONFIG_IO_SYNC:
+		ret = stm32_pconf_set_io_sync(bank, offset, arg);
+		break;
 	default:
 		ret = -ENOTSUPP;
 	}
@@ -1349,6 +1570,22 @@ static void stm32_pconf_dbg_show(struct pinctrl_dev *pctldev,
 	case 3:
 		break;
 	}
+
+	if (bank->io_sync_control) {
+		const char *io_sync_str, *skew_dir_str;
+		u32 skew_delay;
+
+		io_sync_str = stm32_pconf_get_io_sync_str(bank, offset);
+		skew_dir_str = stm32_pconf_get_skew_dir_str(bank, offset);
+		skew_delay = stm32_pconf_get_skew_delay_val(bank, offset);
+
+		if (io_sync_str)
+			seq_printf(s, " - IO-sync: %s", io_sync_str);
+
+		if (skew_delay)
+			seq_printf(s, " - Skew-delay: %u (%u ps) %s", skew_delay,
+				   skew_delay * STM32_GPIO_DELAYRL_PS, skew_dir_str);
+	}
 }
 
 static const struct pinconf_ops stm32_pconf_ops = {
@@ -1441,6 +1678,7 @@ static int stm32_gpiolib_register_bank(struct stm32_pinctrl *pctl, struct fwnode
 	bank->bank_nr = bank_nr;
 	bank->bank_ioport_nr = bank_ioport_nr;
 	bank->secure_control = pctl->match_data->secure_control;
+	bank->io_sync_control = pctl->match_data->io_sync_control;
 	bank->rif_control = pctl->match_data->rif_control;
 	spin_lock_init(&bank->lock);
 
@@ -1683,6 +1921,8 @@ int stm32_pctl_probe(struct platform_device *pdev)
 	pctl->pctl_desc.confops = &stm32_pconf_ops;
 	pctl->pctl_desc.pctlops = &stm32_pctrl_ops;
 	pctl->pctl_desc.pmxops = &stm32_pmx_ops;
+	pctl->pctl_desc.num_custom_params = ARRAY_SIZE(stm32_gpio_bindings);
+	pctl->pctl_desc.custom_params = stm32_gpio_bindings;
 	pctl->dev = &pdev->dev;
 
 	pctl->pctl_dev = devm_pinctrl_register(&pdev->dev, &pctl->pctl_desc,
@@ -1804,6 +2044,21 @@ static int __maybe_unused stm32_pinctrl_restore_gpio_regs(
 	if (ret)
 		return ret;
 
+	if (bank->io_sync_control) {
+		bool is_input = bank->pin_backup[offset].advcfg & STM32_GPIO_ADVCFGR_DLYPATH_MASK;
+
+		ret = stm32_pconf_set_skew_delay(bank, offset,
+						 bank->pin_backup[offset].skew_delay,
+						 is_input);
+		if (ret)
+			return ret;
+
+		ret = stm32_pconf_set_advcfgr(bank, offset, STM32_GPIO_ADVCFGR_IO_SYNC_MASK,
+					      bank->pin_backup[offset].advcfg);
+		if (ret)
+			return ret;
+	}
+
 	if (pin_is_irq)
 		regmap_field_write(pctl->irqmux[offset], bank->bank_ioport_nr);
 
diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.h b/drivers/pinctrl/stm32/pinctrl-stm32.h
index b98a4141bf2c0..d17cbdbba4482 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.h
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.h
@@ -64,6 +64,7 @@ struct stm32_pinctrl_match_data {
 	const struct stm32_desc_pin *pins;
 	const unsigned int npins;
 	bool secure_control;
+	bool io_sync_control;
 	bool rif_control;
 };
 
diff --git a/drivers/pinctrl/stm32/pinctrl-stm32mp257.c b/drivers/pinctrl/stm32/pinctrl-stm32mp257.c
index d226de524bfc1..6709bddd97186 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32mp257.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32mp257.c
@@ -2543,6 +2543,7 @@ static const struct stm32_desc_pin stm32mp257_z_pins[] = {
 static struct stm32_pinctrl_match_data stm32mp257_match_data = {
 	.pins = stm32mp257_pins,
 	.npins = ARRAY_SIZE(stm32mp257_pins),
+	.io_sync_control = true,
 	.secure_control = true,
 	.rif_control = true,
 };
@@ -2550,6 +2551,7 @@ static struct stm32_pinctrl_match_data stm32mp257_match_data = {
 static struct stm32_pinctrl_match_data stm32mp257_z_match_data = {
 	.pins = stm32mp257_z_pins,
 	.npins = ARRAY_SIZE(stm32mp257_z_pins),
+	.io_sync_control = true,
 	.secure_control = true,
 	.rif_control = true,
 };
-- 
2.34.1


