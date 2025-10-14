Return-Path: <linux-gpio+bounces-27104-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 576F5BD9FBB
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 16:25:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B148541F7E
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 14:25:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86AF8273809;
	Tue, 14 Oct 2025 14:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="AR+k1h/c"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F27321FF49;
	Tue, 14 Oct 2025 14:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.182.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760451948; cv=fail; b=JUd3v0TUmjod++aFLahjeqQv60HaYy9JwryogzkuvYwoo3dlprX9W64fPK11yB7uVmipzC9gIhhmrjzM6Y7KCtCBpO0V9cRxoGdXp8GRrT+gbxbK/wWeJ9FS66gYFhQrvBSFxAc79G5GvGVpWZqn/jRbV3YPjwF8AM7K8zNY7fE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760451948; c=relaxed/simple;
	bh=r3vVHbvmkai5a0cX0OYBNy1xJWJs5mik76H8YRgaUBo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LyKYKQnqPj8wuC5FKmpDsk5v7WICaM9kwHWwr3MjOfBbZJJlm15b/I1otWWysQQN06zhz1TYZgvM4ZTuie61wQvXW7ugDfghneDavgMunFWk7PxnjeAU53x6+GgSZhvkhILWqmQFf+O/K1dDymifWoPH2W9xhc6iEx+426Gcq7U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=AR+k1h/c; arc=fail smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59EDIudu005757;
	Tue, 14 Oct 2025 16:05:07 +0200
Received: from du2pr03cu002.outbound.protection.outlook.com (mail-northeuropeazon11011008.outbound.protection.outlook.com [52.101.65.8])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 49rynhdr9g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Oct 2025 16:05:07 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WtntsN/kEZSBCFMAswMCOBI2VBo7UXchKMOpLSN70Rh+KdtxyuPpHlCx5sG2UTXHcUo+kF7v4jRB+r9O4SJ69cVcqw3x5gpLPMWobt0SXM1CSWC6NJLwZl1agFqMkKFasfA47rulHNVKNRj8w4q3NQ1DV+KmdBl/lUkIxnMHU/lQmtQ2EKJWdizUrNPNa7pKyH3IlfCm73n8u4zX11GqJaofjFD9rinGVrZs4/GnCuR5kJfvjUw0jLlOSec7tcob7OnXuUxHxa0sKN447BNGX3RzYJnxTsG7tNVBQx5ABEge+NzSzBuri+NT3jedt4ZqyHqv2CiwBxf6BWxirh2o7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AAYcgQYNbbDmvz8bN2QzLJ+JysyoW5LOY2/FsKfJiGw=;
 b=i1d3SQ6I/RiRxyvWSirlpQB23+QzLMKF1VTiLWqVGQHeOx9mDzAEkk+nR+4sI9cIzIo6FbksTPlX09vog8ZxsFmr7wone26LkEkbmCDAVxyE2wlmEX7O3xFYPpKmv+Dte8/kd0tjdllMS1ATnCr2yjbbBO/+dEg8J/byvo/5/KzR5EbmjICGC4iBdRt+phKnm6ghl+5KcvgW8GVxBY/b2zmaTDBk1TI+TZyhPVwGpl47tj69VKIlabbW3gvP56J49oSdZK7GpOzCv86cXuFAOvjEGAKHlNxnbVl82i0vUM3Za0liy4cHZPfiFAs+vGcTmk0LnpRKXbk/UDLshPffOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.44) smtp.rcpttodomain=linaro.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AAYcgQYNbbDmvz8bN2QzLJ+JysyoW5LOY2/FsKfJiGw=;
 b=AR+k1h/cnrc7fi8QKmKtQtiqYtrwtDEXodfqzj7Nt20wqiHtJPZg+581GwmEXFVzL7rkUGSSH753O84VSjkHy4sF2vLk7RcBsVwm6IDeLVLFp3rP/64leJxIbGiblEtQDxTgzbTR6eN4B6J3KaMhkpdaNy9XaSI4xwm2qBGAlr1xg+3DRcWJdAK/hmUNZ/nEiOwHTWHAJ4HKJkwyfAG/3trdliADqtG4+4iB+6IMv4jQm0TbD3FaDqnq25gy9DL29iLNd1YZFYuKZzs3lZ5UHfCWu8Dt2ahiWOJMmOzdjEhihG51qBewbwy+kOJcqisZIsnrPPUKezkRP+WuooR6yw==
Received: from AS9PR0301CA0050.eurprd03.prod.outlook.com
 (2603:10a6:20b:469::19) by AM0PR10MB3123.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:18b::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Tue, 14 Oct
 2025 14:05:01 +0000
Received: from AM4PEPF00027A6A.eurprd04.prod.outlook.com
 (2603:10a6:20b:469:cafe::bd) by AS9PR0301CA0050.outlook.office365.com
 (2603:10a6:20b:469::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.13 via Frontend Transport; Tue,
 14 Oct 2025 14:05:01 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.44)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.44 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.44; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.44) by
 AM4PEPF00027A6A.mail.protection.outlook.com (10.167.16.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Tue, 14 Oct 2025 14:05:00 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Tue, 14 Oct
 2025 15:57:55 +0200
Received: from localhost (10.48.86.11) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Tue, 14 Oct
 2025 16:05:00 +0200
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
Subject: [PATCH v3 07/10] pinctrl: stm32: Support I/O synchronization parameters
Date: Tue, 14 Oct 2025 16:04:48 +0200
Message-ID: <20251014140451.1009969-8-antonio.borneo@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A6A:EE_|AM0PR10MB3123:EE_
X-MS-Office365-Filtering-Correlation-Id: d30fb084-c5ec-44e9-9dac-08de0b2aaa5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|1800799024|36860700013|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qNLG++mEgDPMi7XLd5pHe2Qe3hoOYjvU/z65GaCF3wxBJZWyI4bpjFRZ0Qyf?=
 =?us-ascii?Q?GIxbB+snu3Q62o4NIbpioDWfwHBRlkkmj051cTrZDWq5NVhsYx0fU4EXJERI?=
 =?us-ascii?Q?MaQcm9iv6n6FysndJRhf0RuDc9yZ/k/gOlM8dKm1O7p29x6Io27M7cehgrjf?=
 =?us-ascii?Q?pQqsZK3hvNUdAQSYVqzmkIUAFBgJ5ljIaAQKulfqRWlavEeCr0Q5ENccTnLR?=
 =?us-ascii?Q?0sj0Lp0tDwRa+vD3SM3Ig5yHTbWWdGGdhUGtq2XOGMF/85f8nE5ujZzYCu9q?=
 =?us-ascii?Q?Ke57pQj7SbRMkhudEdnmsuYIgelWIAzmh7AfpDn8/dF4jYfrZIAzwDQnTsE3?=
 =?us-ascii?Q?UbuEs0TUlvjp86qejRu64omiEuUy6aVOm7BK/zAmD+OvMQeAqgYbeeb9LBpe?=
 =?us-ascii?Q?9mUjE4eqOYZnr75un69f8cRMN+t2LFi3CnJAZg8k6ob+BC9OyDyK9t+f1g9X?=
 =?us-ascii?Q?8HrmwBiPOqFozR5hgicn+1p0h/yKsugmSpjpVKa2kak0g7pQg1BqKQoVDcUT?=
 =?us-ascii?Q?lT/2NAg1MVsjLwunrgV3GzzxrVTY0qQKi1u+qfneXXuCBuosTUxxjue0hkAj?=
 =?us-ascii?Q?GzFnKS1tGYPzhibfLL2MU9DDuvqmF/AMV9fBt/7XciGeScgNAb0CQUHcLmNz?=
 =?us-ascii?Q?IPe1xSv2ExIR1d6YFilJekRBXVmafO8m+yJaQwwzvR6Lu2Jx9VrwN2jGj7/4?=
 =?us-ascii?Q?Sctd9Aa5yxSymPnskt/rj94npdUc7kDZZq+A93VqwqCSld6WKRQWrV6W1iBq?=
 =?us-ascii?Q?Cv1S/bxtXuCmhDdVnEf0NXW1yzTID59XEpnASDX6bFKNB6InD0dWHkxmLEDJ?=
 =?us-ascii?Q?DVJGs5aJZ7eHA9e5QDZerB7k/y3RxSlfmGEzthY6Ylgx1Lq3BXqimffrHBi/?=
 =?us-ascii?Q?MkAXLJPXvF6QtuF7rXQAwqOFcbaWDIMM9iYHJtf1YvZGKUVUhz78eenicm4W?=
 =?us-ascii?Q?MCDNmu9E1KIV3Q4gaXqID7GjVF53geDLFL48a2JFqXFIGHS7jWJp5E6CZink?=
 =?us-ascii?Q?9S/fW4j7PGwKqN8UngRgGz4TyTe4YK4rmym+F50v6D9WPOjxfBNTn5KxKAgS?=
 =?us-ascii?Q?bOhL4fyo7kk4CNrgAIYjO0ewQfmdaZ2dJu9EyYK/L2dVUctAtLiJenf/c1mT?=
 =?us-ascii?Q?kljxipy00E7iYbbRVdCuh71zN8JO7gTpU0Tyod7AcJesZcsP8u+NRzTTe7x2?=
 =?us-ascii?Q?mxcRXqsxHiCtqUVJKxXEvHdOoLZm48UBldzfAyZRG05LqLJVCeTxhyHj1EgV?=
 =?us-ascii?Q?sx2KRWxzCAcvudhug4JD2NVFbn6GI0FwPV8shggqGWy9w/rzvutxQxOgmLNE?=
 =?us-ascii?Q?DnDU06NYtTuk2BATA0YZXH75TLuwCKgaWKL/hFh7eul1RcuDPtwVNWenil9V?=
 =?us-ascii?Q?2TfE07o3tUrkn6HBmYPJOtxrEDogAxAPZ18SNOWR9U7UhF/NvCaj/giwwsov?=
 =?us-ascii?Q?pWRYdV6T2RLmndk+Zv1IVIXWcVV4i/gYYxTIyvWydjeurFpLd4u+jAF86xB9?=
 =?us-ascii?Q?t7L1oxlUvER6EAt2zVA59nQx3uSN6sYPu6o5NcJxJ91T3L/1UGfp4dLAdsvW?=
 =?us-ascii?Q?o2562i+Jt/GHpw6S3o0lzDQZhi9cwh+rVswPoFq+?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.44;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(1800799024)(36860700013)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 14:05:00.7134
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d30fb084-c5ec-44e9-9dac-08de0b2aaa5d
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.44];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A6A.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3123
X-Proofpoint-GUID: yMikEBZEjow67USuVd6TRxfy7op-Vk2n
X-Proofpoint-ORIG-GUID: yMikEBZEjow67USuVd6TRxfy7op-Vk2n
X-Authority-Analysis: v=2.4 cv=TtPrRTXh c=1 sm=1 tr=0 ts=68ee5893 cx=c_pps
 a=sfN2xSSYXAWEoTbWCh/xAg==:117 a=Tm9wYGWyy1fMlzdxM1lUeQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=y9YUpebZf6kA:10 a=x6icFKpwvdMA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=8b9GpE9nAAAA:8 a=GcfiOUnl-Qwgb4vcQAQA:9 a=T3LWEMljR5ZiDmsYVIUa:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDA0OCBTYWx0ZWRfXyxae++E8wzfu
 i4+i7RpKF/lh34YWTW1dcq7xzYaRbEucUZOkVwq0h2QyYCy8L+o6lB/Rh+DkmVQ/jGx12ZvGf9P
 wwzH9rRFJUP/D9h8+MJ3IW+q19HqVs5VLguIFCAk3guDYFweh2FdgBc3g139OZPQCcxFmAchPHq
 xZWaDZXYuEZgMGvu/XEJZzuWo1yR1+wHJcSsa8Z7G6g+Vk9tH6/Fg5dsK/6mm+UbGoLg+4WCsPw
 fHJ2JkCKnKs1scE7+arWvdg+l9WKbM9aEmB1OUfyig8u+iQpPgFgQi/YZvaNobmc/0/vUraLOHZ
 8cL/BryxPWAHgdiROojnB72EYQop707FBmH9oCRAS81JXU921CFPkhQUO1t8xVwd9+OlTvzXEjB
 3Qxc8Mi/QDW25pM8JO9jKk4j1HB1jw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510130048

Devices in the stm32mp2xx family include an I/O synchronization
block on each pin that is used to fine tune and improve the I/O
timing margins of high speed synchronous interfaces.
It can be configured to provide independently for each pin:
- skew rate on input direction or latch delay on output direction;
- inversion of clock signals or re-sampling of data signals.

Add support for the generic properties:
- skew-delay-input;
- skew-delay-output.

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
 drivers/pinctrl/stm32/pinctrl-stm32.c      | 241 +++++++++++++++++++++
 drivers/pinctrl/stm32/pinctrl-stm32.h      |   1 +
 drivers/pinctrl/stm32/pinctrl-stm32mp257.c |   2 +
 3 files changed, 244 insertions(+)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index ac64cb7f86d74..1f024390e0c2f 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -51,9 +51,20 @@
 #define STM32_GPIO_AFRL		0x20
 #define STM32_GPIO_AFRH		0x24
 #define STM32_GPIO_SECCFGR	0x30
+#define STM32_GPIO_DELAYRL	0x40
+#define STM32_GPIO_ADVCFGRL	0x48
 #define STM32_GPIO_CIDCFGR(x)	(0x50 + (0x8 * (x)))
 #define STM32_GPIO_SEMCR(x)	(0x54 + (0x8 * (x)))
 
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
@@ -67,6 +78,9 @@
 
 #define SYSCFG_IRQMUX_MASK GENMASK(3, 0)
 
+/* Vendor specific pin configurations */
+#define STM32_GPIO_PIN_CONFIG_IO_SYNC	(PIN_CONFIG_END + 1)
+
 #define gpio_range_to_bank(chip) \
 		container_of(chip, struct stm32_gpio_bank, range)
 
@@ -82,6 +96,23 @@ static const char * const stm32_gpio_functions[] = {
 	"reserved",
 };
 
+static const struct pinconf_generic_params stm32_gpio_bindings[] = {
+	{"st,io-sync", STM32_GPIO_PIN_CONFIG_IO_SYNC, 0},
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
 struct stm32_pinctrl_group {
 	const char *name;
 	unsigned long config;
@@ -95,6 +126,8 @@ struct stm32_pin_backup {
 	unsigned int speed:2;
 	unsigned int drive:1;
 	unsigned int value:1;
+	unsigned int advcfg:4;
+	unsigned int skew_delay:4;
 };
 
 struct stm32_gpio_bank {
@@ -110,6 +143,7 @@ struct stm32_gpio_bank {
 	struct stm32_pin_backup pin_backup[STM32_GPIO_PINS_PER_BANK];
 	u8 irq_type[STM32_GPIO_PINS_PER_BANK];
 	bool secure_control;
+	bool io_sync_control;
 	bool rif_control;
 };
 
@@ -201,6 +235,21 @@ static void stm32_gpio_backup_bias(struct stm32_gpio_bank *bank, u32 offset,
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
@@ -1145,6 +1194,155 @@ static u32 stm32_pconf_get_bias(struct stm32_gpio_bank *bank,
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
@@ -1207,6 +1405,15 @@ static int stm32_pconf_parse_conf(struct pinctrl_dev *pctldev,
 		__stm32_gpio_set(bank, offset, arg);
 		ret = stm32_pmx_gpio_set_direction(pctldev, range, pin, false);
 		break;
+	case PIN_CONFIG_SKEW_DELAY_INPUT:
+		ret = stm32_pconf_set_skew_delay(bank, offset, arg, true);
+		break;
+	case PIN_CONFIG_SKEW_DELAY_OUTPUT:
+		ret = stm32_pconf_set_skew_delay(bank, offset, arg, false);
+		break;
+	case STM32_GPIO_PIN_CONFIG_IO_SYNC:
+		ret = stm32_pconf_set_io_sync(bank, offset, arg);
+		break;
 	default:
 		ret = -ENOTSUPP;
 	}
@@ -1349,6 +1556,22 @@ static void stm32_pconf_dbg_show(struct pinctrl_dev *pctldev,
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
+			seq_printf(s, " - Skew-delay: %u (%u ps) %s", skew_delay, skew_delay * 250,
+				   skew_dir_str);
+	}
 }
 
 static const struct pinconf_ops stm32_pconf_ops = {
@@ -1441,6 +1664,7 @@ static int stm32_gpiolib_register_bank(struct stm32_pinctrl *pctl, struct fwnode
 	bank->bank_nr = bank_nr;
 	bank->bank_ioport_nr = bank_ioport_nr;
 	bank->secure_control = pctl->match_data->secure_control;
+	bank->io_sync_control = pctl->match_data->io_sync_control;
 	bank->rif_control = pctl->match_data->rif_control;
 	spin_lock_init(&bank->lock);
 
@@ -1683,6 +1907,8 @@ int stm32_pctl_probe(struct platform_device *pdev)
 	pctl->pctl_desc.confops = &stm32_pconf_ops;
 	pctl->pctl_desc.pctlops = &stm32_pctrl_ops;
 	pctl->pctl_desc.pmxops = &stm32_pmx_ops;
+	pctl->pctl_desc.num_custom_params = ARRAY_SIZE(stm32_gpio_bindings);
+	pctl->pctl_desc.custom_params = stm32_gpio_bindings;
 	pctl->dev = &pdev->dev;
 
 	pctl->pctl_dev = devm_pinctrl_register(&pdev->dev, &pctl->pctl_desc,
@@ -1804,6 +2030,21 @@ static int __maybe_unused stm32_pinctrl_restore_gpio_regs(
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


