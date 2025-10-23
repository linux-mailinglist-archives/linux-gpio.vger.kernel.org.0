Return-Path: <linux-gpio+bounces-27543-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 31399C01789
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 15:39:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F35A51A6696B
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 13:35:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59BD5318139;
	Thu, 23 Oct 2025 13:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="NIcDvsui"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D0331576D;
	Thu, 23 Oct 2025 13:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=91.207.212.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761226073; cv=fail; b=F2xIqosTTmFtvy/LSuuB1033a7ZwcD1IV8TEOxr/JIV/5dUocH2Mw+wLlRqhJPv0Dx1LDxxu5s9T1LurLzHwuM+wXSI/J0pftZBMop0VhMworQU6cN5JiSJhEw9TpLZP+rpxyRq3OeeT9cGnxjemb25PmBMnmkUIOKSAw+5L1cY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761226073; c=relaxed/simple;
	bh=BzcVMmCYFk379xElWlq/VSaLkmC+mLBQ5MlK9MZ8RYs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hWireswNOxd1nEFm09c8/j1bAxdXdNt6eYSw4A4Lv/WDHxvOf/bIVxE8SYQaKgJiV7j0gs2p66bX6w48DOgEKIcICNrefzYk8/zdSY7GOPpT0aDwsbmTON4Ut5HImsvnzUnMM8K5Zin9YvdprPUVm4gkU3h/BgVd+rq8X3YxBOM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=NIcDvsui; arc=fail smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59NDHFWe015788;
	Thu, 23 Oct 2025 15:27:14 +0200
Received: from am0pr83cu005.outbound.protection.outlook.com (mail-westeuropeazon11010009.outbound.protection.outlook.com [52.101.69.9])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 49vnummyf1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Oct 2025 15:27:13 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V7DqfWZtvTCY2YCbbYQF/Eu7YIidql/dOM5ctjxrQkN8+0GwlKFJPvfyOSBuMA7FkppMsKCL1O76Bz6VnuveZNOdAM4co0MXmYlsiwOmBYfxsBTjqzmEOwz93aKXykhWvj/34DqPye16SY+Ol1Oijj2RAuDt/Sw6jYJBE0j8DyCj+nKnA8MNC19Pz3huuAUWb9/YzrItz3HJzaYQjjm9AS6gpqUa85x4+4f/90DLRCexZFEScnxEzRjR9bY9Lj7mj2/etsG6Z/Oor0ue4vzo7FFM1V/fITinc5kT6LWW6Da9GZPEg0N8A3S/NYpM0VB3WujriUOF+qD0ilVLUq+1Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mQNGgk/5TkFU1HXTSNZ3syG1wBfXQGhOodOz++qFfOc=;
 b=GeV9rqDiQi8E8D94fSYQtSUWR7RnfLGQtU3O8TVueEy3+DgwuWHbEfCq0ILp7U6+Lo4ocgelohZkD2G/lW9SqU2rmRsHwsHAjSEM0YzplxiiyR4HOXgZeUDRQIqs/7KQe6Nqih2+fpV+vJ67grgHNt90QMVvqs7xS1xA9jP5nIALiJRy/Ylf3Qj8p6xUVvCNzQxEyd3yFKZiK0uoiqwzI5sGo81Xjs9s1jkwdE/iw4hMZ+CogOLw0Z2Sago5Hqk2L4nyeR/KRGOYVOjJ15ZmhdHbdhpZOlr1LiiKXMDZ42bBBiBbVPTpXJF0cKLtO/vmG4VpRqln91gwqFn8ChIPZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.44) smtp.rcpttodomain=linaro.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mQNGgk/5TkFU1HXTSNZ3syG1wBfXQGhOodOz++qFfOc=;
 b=NIcDvsuivuYSHLf3wLlwIb2H6CiEvMoxAJ2RLEXu6gmIewDldWm9Gqi4PogHMqIwJQklQhYFBzXLi2XXXpjKlHcw+Xdvsbpt0R9AufKrFyh03mLZrfJeXpixzEI+lyKydm1o65D6njlpYlziKnZBdfTACI5HPzIJJzTmCguxqYgLzASQtBbccp4muH+qJFx/3/NM8PZANZl/p2NnxPrbj1ejy4ELq3DM59f1Mn83O3U2JC+1UfNAEy8RojIBgrXwAHnlxeLmT0rzdjRrqCfA8DqCR2qipZCr1sln/+y3k6R7BGtnSW6K5PbI9ibQJgASqZoDYqJnp4MStJKNDyEcuQ==
Received: from AS4P191CA0018.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:5d9::14)
 by AS8PR10MB7019.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5a6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Thu, 23 Oct
 2025 13:27:10 +0000
Received: from AM4PEPF00025F9A.EURPRD83.prod.outlook.com
 (2603:10a6:20b:5d9:cafe::ae) by AS4P191CA0018.outlook.office365.com
 (2603:10a6:20b:5d9::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.13 via Frontend Transport; Thu,
 23 Oct 2025 13:27:10 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.44)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.44 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.44; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.44) by
 AM4PEPF00025F9A.mail.protection.outlook.com (10.167.16.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.0 via Frontend Transport; Thu, 23 Oct 2025 13:27:10 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 23 Oct
 2025 15:20:12 +0200
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
Subject: [PATCH v4 10/12] dt-bindings: pinctrl: stm32: Use properties from pincfg-node.yaml
Date: Thu, 23 Oct 2025 15:26:58 +0200
Message-ID: <20251023132700.1199871-11-antonio.borneo@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: AM4PEPF00025F9A:EE_|AS8PR10MB7019:EE_
X-MS-Office365-Filtering-Correlation-Id: c71021b1-a2d1-40d9-96de-08de1237df09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|82310400026|36860700013|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BH/s9O7LqaWwAhBlzQuy+w7CPM42kXRyPKwVHCBYGLeq6ThJ3jdeeMpompJN?=
 =?us-ascii?Q?uQc8xgM/8f11qMXlIVFyvZXg/5oh3mM++RmWKLCMdfVqrmTLclwjYyok+Wzb?=
 =?us-ascii?Q?CK+wQYXSBRX6+e0k0Ej7Hd2IyUEdKmO5u0uTvprACKRFRWRD4rzTFpt+yU+R?=
 =?us-ascii?Q?RmCgpDIhAR2VsPvOMyPOJDqFPG4mtxcw64wp63WjvfOZnc3q3g+Q9UUzJXwr?=
 =?us-ascii?Q?/f2ebHbq23OwyDK7nnWg0f3+ZdPG04+ui+i5wu/UOagRt0WnqpNvg2OjclKx?=
 =?us-ascii?Q?6p/RlP8zjKeSF7gCKwl8eq8UUD9i5iTVFT8h8WmaAZIdUKtnOo/KSm0Gvay/?=
 =?us-ascii?Q?B7Eaq/68a7Yznbnkos+HujLV3668GmURWIbK/4rzE7FxHNT3Lh+GIXMoFqz6?=
 =?us-ascii?Q?wak245g3CAlinr6Up87BKM/SWoEkc9DYE0CFIL6/BEAzE5SdZom+ijXQnaCV?=
 =?us-ascii?Q?MPNA2ZcOhzvkev4C4LhoiFf+tx9I2bfVzdI+h97T6BWdQfSDklu8VyVFqsWo?=
 =?us-ascii?Q?Haoah9cMaXHm9REQgRFn9BaFeZzgxD4KY8f5EWWOzmP+TBGHx3djzYfzNezf?=
 =?us-ascii?Q?MNtzJJdVr55++kBxea9yaHCJZMXcGl3GorEp8AXTSRVu3L8UV0p839bbZ9Bh?=
 =?us-ascii?Q?EDfn0qaFeJ1zpockGco9TIyHKp9QeMuSmKn4fba/FPfn0fYz+C9oGn50qMTh?=
 =?us-ascii?Q?uKjBmOBB2sMeu8jxiVnDAaLpZcX3kppdk+/gPZgqBwmbAwP0jcdCe63r+axD?=
 =?us-ascii?Q?zkcpQjUi/FzuZjI7YdgHgPThvTyj5OzBAQxq/sJvQFzoIXb94p+BXz/gUn2L?=
 =?us-ascii?Q?4V2SlUnH/VDPMvpIU3sitvYuuNqpLC0O1v87suniaqwcvPHCOJ86gUW9hgGL?=
 =?us-ascii?Q?kSUuKfP2ZL9nKet6z2UQF26Q3UYKHUDdHS2p5e1Z4Psexr5bXLppM8Fn4U9Y?=
 =?us-ascii?Q?Mu2gF1jKybVnEVUPLZ3pOb/HUIArQo2RuNQHeRbatDH1PO0H8neB5Lq2pkSk?=
 =?us-ascii?Q?J1OLQwDYtRY5a8nJ/p7roy5AYay1xAtfCS6cMmfvyedd/nsrhTu7Ry/xf1ub?=
 =?us-ascii?Q?Qto4yOn43207zbd/5oz6ZZp8CU710hyxVWxFhrF2uNcqMkRqcX7c/1zVFYqX?=
 =?us-ascii?Q?MQx0IpUxlL2GTmxhC2H6VRXxksoMQpdfAkGcuNR7Y0SM8MXczc+Jlb1D+M7/?=
 =?us-ascii?Q?LU0Mry0l8YlXepytSmIXRGKKUQRN6wDzIa7SR1PUsDXDVEdNMWiI6TCEHpwo?=
 =?us-ascii?Q?AbhMqqCUQFatquM/Ci6DnlgFuQCEdu1E6qR6KVOMZ/vV86URSTzPG85nTeSx?=
 =?us-ascii?Q?lvZV8isYoQKR6zFZStIPVp3HZehH9rcXqIJX37V57ODzOzfMaQoPUaiEiBEl?=
 =?us-ascii?Q?sxZqXL3cgh+hkSpzXV2wye5tyeC522PPruCWJjjJtrcCxxLPs+MUJsky4N60?=
 =?us-ascii?Q?l9PJYMPE2En9juTwnuV1q+A3Nr/o7LQgg3HiV18Lfsmi1/Ady7Ig8/PZ3tcc?=
 =?us-ascii?Q?8Vdfy8kxhSOXbnawSMneN0UFttN6AebhJgHScyusm+bhJVapDkp4LAGcIbdQ?=
 =?us-ascii?Q?uZ0zJAh8AQ/eHH54MQupKL62YKHX6Xb7YsPX/EB1?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.44;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(82310400026)(36860700013)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 13:27:10.6434
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c71021b1-a2d1-40d9-96de-08de1237df09
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.44];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00025F9A.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7019
X-Authority-Analysis: v=2.4 cv=Wt4m8Nfv c=1 sm=1 tr=0 ts=68fa2d31 cx=c_pps
 a=NvB6RfyeAIKFc9nSm38Aig==:117 a=Tm9wYGWyy1fMlzdxM1lUeQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=y9YUpebZf6kA:10 a=x6icFKpwvdMA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=8b9GpE9nAAAA:8 a=Ppt3ZVBhjIOpqDupxAoA:9 a=T3LWEMljR5ZiDmsYVIUa:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: oMgzvlEyc3tgwXbwt1-ZW2bThzHCycTi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE5MDAwNCBTYWx0ZWRfXxNvpv12c64I8
 8LvlE1nBdM5aNyxZzWVUwwE7lvcKdm+3oOB7Sp99Dz/iL7pGWha0aAPwvzOw1aJXqAyktW1YBoU
 d5BLiil8e1w09IV9CuzaE3Siu4PNofW51sPfpFIxS6ep1kHnjJXi85J+x0ILSUQgN1fM/u0hmAU
 CNsZLEAP1EJEZW5FxX4drJfwgVy8QwAAmMLkI4Hie71ss4tTePxEZ+5YXAZczuSX1Vg5s/Wdfrh
 9apQeecjPmDnppNUgdXys2m+9AdjvD6gOzWiwZx7oVbeHsEPcJLxpzHcUhz+nMPUXJsi/zUuIpG
 +IiSzsJIN9iex7r5G4MGWPX0biJZWPdNgcaqQ928wogDHP5XTPKGkpsxve+FDix6FsbqlN5XSji
 GAD1joGkT2c6++cl0heOzh292mhXqA==
X-Proofpoint-ORIG-GUID: oMgzvlEyc3tgwXbwt1-ZW2bThzHCycTi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 impostorscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510190004

Don't re-declare the standard pincfg properties; take them from
the default schema.

Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 .../bindings/pinctrl/st,stm32-pinctrl.yaml    | 27 ++++++++-----------
 1 file changed, 11 insertions(+), 16 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
index 961161c2ab62b..27c0dd7a8df01 100644
--- a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
@@ -151,6 +151,8 @@ patternProperties:
           pinctrl group available on the machine. Each subnode will list the
           pins it needs, and how they should be configured, with regard to muxer
           configuration, pullups, drive, output high/low and output speed.
+        $ref: /schemas/pinctrl/pincfg-node.yaml
+
         properties:
           pinmux:
             $ref: /schemas/types.yaml#/definitions/uint32-array
@@ -195,26 +197,19 @@ patternProperties:
                           pinmux = <STM32_PINMUX('A', 9, RSVD)>;
                };
 
-          bias-disable:
-            type: boolean
+          bias-disable: true
 
-          bias-pull-down:
-            type: boolean
+          bias-pull-down: true
 
-          bias-pull-up:
-            type: boolean
+          bias-pull-up: true
 
-          drive-push-pull:
-            type: boolean
+          drive-push-pull: true
 
-          drive-open-drain:
-            type: boolean
+          drive-open-drain: true
 
-          output-low:
-            type: boolean
+          output-low: true
 
-          output-high:
-            type: boolean
+          output-high: true
 
           slew-rate:
             description: |
@@ -222,8 +217,8 @@ patternProperties:
               1: Medium speed
               2: Fast speed
               3: High speed
-            $ref: /schemas/types.yaml#/definitions/uint32
-            enum: [0, 1, 2, 3]
+            minimum: 0
+            maximum: 3
 
         required:
           - pinmux
-- 
2.34.1


