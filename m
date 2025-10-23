Return-Path: <linux-gpio+bounces-27548-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B2DC0C01757
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 15:37:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C737A50765D
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 13:36:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E748346767;
	Thu, 23 Oct 2025 13:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="j6cwUV9T"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49134328B5C;
	Thu, 23 Oct 2025 13:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.182.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761226085; cv=fail; b=H/ML8hL7s95penMayrK6JNSRVrMnQOzCdRuwsnARtiQQvWIyU3HG4keslc7n0RdPiwrwItWm1x2I1XKp91u0JwTU3mqv7y8e5YWnjuKSnjpZrcCj5C9BOLoSZSORSeK7HqdDcdR1CT7xwRZHxWLZ2clWNDR5PukmEEudshx4xd0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761226085; c=relaxed/simple;
	bh=hEUZAWZUV5EuBbvaxER25IuFEc0n6b+1lrRdIYtNWqY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EUFEAkPdRZbvk1dZOrSz9sK2iG+Pf2IwUcOpcuC+kUKwRFf47qVsMLRpbFS7w1inB+53oWkiY3UzkAZMo0PRLeqPApDqRWgCMOFwoNVLk97NQ5gAjgcbmBvH0BIqS1yuhqKkhVIMipR/Uq/GfeqYjdziHHYrIlhu+dnE0ZzfKGU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=j6cwUV9T; arc=fail smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N9glaB004068;
	Thu, 23 Oct 2025 15:27:14 +0200
Received: from du2pr03cu002.outbound.protection.outlook.com (mail-northeuropeazon11011042.outbound.protection.outlook.com [52.101.65.42])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 49xvcxp5w0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Oct 2025 15:27:14 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pnRI/4R6CYtuYzf314Epx9cMclob0lLc2KU1YZawE6lDki5MUuNmIHemrVANODDVUtbJOrPvaJrlrDY+Kv0uPCPejSM8wmY9+bm8p6vmswNWFKb7t4F8U/ErGwl8IBCqQreKhSvAGu7iFzvIWCZ0w7o2Xu2fupHp7gqVdZhDkBOeuLFYFcKBG9zNB+WZijWeBfH3qux9SkNOXhHkpEREM41VVX+KvVF0tE18+0tuzQn/cFssi1bx28UY0CuBq1ZdC9OxmlDh8qCmyvR2Opt0fRlMQC+wtF6ZoUdtoTNULScWvjfP4DHnfj+EGt1dteNPQCyDLF8qLBVERBFYvFvbmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kHfHEas3E9c7XrfQqFZm9ylQYedK4gYt+qALJaRRUEM=;
 b=yEll5SQvCz3azamlHQi3DMx+2zgUCqpl0IZXgLufhEuxHI6ctY3Z7OG4ONYzlxrqiyeUmRPuz3yDEpwqPmKDjN4k0KQd1yBL0He+dd1Vk0hJsb41UYaMrfPC9N2MZV/eLjsb9yXFKV/dW2syDc/vQk7w0m8/DBQczHbJ4l80AjruHupnYHaxWeNUg3nG9IZdG8F9VmeVcKHKqJp+u2ltKeTixjiCz7RUsNwsWdLaQCDdEOCtasOKCMUqE2iRXCEfQKvpgdmyKKbuEq8iGRHvHBC9L8UgA36pQXkxhYBGznaYWA7fbw1k+oDpEpPWxwL91ZqTMRX39RIHn8uEidA+Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.43) smtp.rcpttodomain=linaro.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kHfHEas3E9c7XrfQqFZm9ylQYedK4gYt+qALJaRRUEM=;
 b=j6cwUV9TE0sT/Fg6Ihhw5bWJ2Mr0WCedrzp4ooUn6OoTpX721H1jFcyv12OyYkHwqj2B7+DxEKOQJ1cOKjBgkg6oqSaCzta2KMQWct2O+rk0B1Yfj2Qt+DwEeCicLv5nbVAcND7Mj5PrFNaSg7ffb5udgzKgT+LYIuvp7PfAjtC27buMVl16s2+xvf+hqIDFpK5cqMlQZ2aFFFC8CxraJaeIrTaz9aHpG0sVSvdQX2wPEw+BT20yR55+zq7cyxbqod+i+/2tMOGJA6Pv/aNLIjMUXgp1RYgPofxxHEZm4l1wUlir4E+IcElKsoiBcXOmN+FYKCrsbFWdk70umL89GA==
Received: from DB9PR05CA0011.eurprd05.prod.outlook.com (2603:10a6:10:1da::16)
 by DU0PR10MB6780.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:47b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Thu, 23 Oct
 2025 13:27:10 +0000
Received: from DU2PEPF00028D13.eurprd03.prod.outlook.com
 (2603:10a6:10:1da:cafe::f2) by DB9PR05CA0011.outlook.office365.com
 (2603:10a6:10:1da::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.12 via Frontend Transport; Thu,
 23 Oct 2025 13:27:04 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.43)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.43 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.43; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.43) by
 DU2PEPF00028D13.mail.protection.outlook.com (10.167.242.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Thu, 23 Oct 2025 13:27:10 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 23 Oct
 2025 15:24:42 +0200
Received: from localhost (10.48.86.11) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 23 Oct
 2025 15:27:06 +0200
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
Subject: [PATCH v4 05/12] pinctrl: stm32: Rework stm32_pconf_parse_conf()
Date: Thu, 23 Oct 2025 15:26:53 +0200
Message-ID: <20251023132700.1199871-6-antonio.borneo@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D13:EE_|DU0PR10MB6780:EE_
X-MS-Office365-Filtering-Correlation-Id: fcc4be82-8131-4674-3389-08de1237dece
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|7416014|82310400026|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ky+7FkAygvhoHwBFFqID85BI2zEQ5CQ1x0AdWY8+rvkcX7UDGTJSYXvNrVn/?=
 =?us-ascii?Q?0rWllfxhqK9tzk87FTgpPJYDcW9TgE6OvCujz9Va9yd/wWS6sxwiR84vabJO?=
 =?us-ascii?Q?Q1yqPDTISi11Ek9OczgBvTax8+kIccY62dYUC2EVbzpXLyJFXfPfarFi7yso?=
 =?us-ascii?Q?YHCInVwVlAQQZIKi+UPsqQzr6QAMstp0G9pOJVjFYUzY+pY93Fcl9I6eLXx8?=
 =?us-ascii?Q?Aw0wcBC104WOF3kUck5ovn+hErdR1oM37mYPJaXag+tcarl9xW5hizhXKlOU?=
 =?us-ascii?Q?fyfUQuL2fi7CNun15exYkFjv63GATZJeqebyiL9BodLILdccyE/X8aqKCFJW?=
 =?us-ascii?Q?Sx9fE4dZLtbJoB+yUbput1EHqbCtI8fwhP3EMrJmdilKWv7tZL1uhJk5kA4L?=
 =?us-ascii?Q?I6Wl+r6cugy/iqU2lfBqXoiel7G0ApWKQ5Iqrr9b/wqYdxKrLVSN3hfQFvum?=
 =?us-ascii?Q?bJ84UFAc64wMbr75endX3CBQzgzpK4yJ1YuhRlnagyJnmDOa99nuW4wHx8GW?=
 =?us-ascii?Q?1kR5QlcH6l5ebgBq+GF0AjCkHaBdXYxBNomdl0DIPBeX/yDx9Upx23w3Sss+?=
 =?us-ascii?Q?nCLsvSAtFCK3Uewbx/DlDMzomsfwmYA2rbQ4nFyCN2glS/MsAG1nvYBe1v31?=
 =?us-ascii?Q?IGA6n8EJhc6YGsk46mWvYqn6YkW8YtzmZDe5iSusq3VJVgcM1nw+uLGukgW+?=
 =?us-ascii?Q?MgpeWT2zUsgpYpt2fGUN42Vxjxf3aybwYtLaq1QXDhmMhkNMg0khIR3tpVPx?=
 =?us-ascii?Q?uZKw+BalRfh672xEJQwPdd2FcCQKTac1lMa5DAR/AHTJNYHokB+HQTeGqvlA?=
 =?us-ascii?Q?2/jN19xu2y0mKqoeVYkLUcYMJMjnIjc5CRqXrv21fq8yvj8yVKqwGNflhVva?=
 =?us-ascii?Q?ktgCfacin+k0a0WrPZtdbK9OeW6sb5aYjbVG07o3v4HxTH3eOzfBd24itB4a?=
 =?us-ascii?Q?1v2hwxiVcoBb28zXuNVTl6rYdecIKumUvK6/yYpg3fi1U+QibVHziEk5T1Y1?=
 =?us-ascii?Q?XpEHZDoxGdMrCpQwGDayQ8AzqVKma35dSqxW5GeeC0PvhN5r7wg5DLAy2XrT?=
 =?us-ascii?Q?Tr9QAMmE7GRqI+iU1zv1PMVCVWkydNKnv30au4v3oKp2C+tBpeNESYj4NDsQ?=
 =?us-ascii?Q?/0Vqjp/OK/go6nAynEJag7sln4ntbjD1nJq5zwGt8hChz2AJNtaYJw44zSbj?=
 =?us-ascii?Q?NFRBvOZJzAje+3aV/tgF0wSHuG/4Eid1FI0rsT3Lp/1WxncAws7zPqsTHT5S?=
 =?us-ascii?Q?IQqJ0pt+54GD/mZ5P6uv8bTJpOf/4dYuEXDSnRPh2b2SQNxkt6ag2gKcTegj?=
 =?us-ascii?Q?hYtdUSXcAw9mNMeY0Ss67LhL5ZvjgCnL7EftTPi0aZnGqpgwO3V+t92W7h3j?=
 =?us-ascii?Q?RQOVhqcOt1oRmPToK8apV5MQz+m/LF1bzY7CaQ7dC/r3dekJ3QT/IVaQfAa5?=
 =?us-ascii?Q?rohvw9H+h48ovW0BCP1VjcPiiCfVJsTkv876RUeY9CrE5GoxID5j3VTtUrgP?=
 =?us-ascii?Q?arfJPF4oFMhtQAReOD1uMBHNzliU+UNBLBYD59Dpac2ZZ21RGWPOwh81aMK0?=
 =?us-ascii?Q?tx9ydzk9YnlVManFhmt9bkMTuLwtP745QDh0SzgM?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.43;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(7416014)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 13:27:10.2631
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fcc4be82-8131-4674-3389-08de1237dece
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.43];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D13.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB6780
X-Proofpoint-GUID: Quh4KAxeUSdOwplFGQwPl5uaF-XlJclk
X-Proofpoint-ORIG-GUID: Quh4KAxeUSdOwplFGQwPl5uaF-XlJclk
X-Authority-Analysis: v=2.4 cv=RoTI7SmK c=1 sm=1 tr=0 ts=68fa2d32 cx=c_pps
 a=cwYse42MPh9TKVl5XOYfLA==:117 a=peP7VJn1Wk7OJvVWh4ABVQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=y9YUpebZf6kA:10 a=x6icFKpwvdMA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=8b9GpE9nAAAA:8 a=8R9V_xASrUP2vJ6y-48A:9 a=T3LWEMljR5ZiDmsYVIUa:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDA3MyBTYWx0ZWRfX8csyI978+Kk+
 Sqxl8TxzKA6bJs24VBHcXb/8t4A1gpppOmPFBQdnT/3utcPPn+Z8Y/cibpaoyBfph0qYC7qOLjv
 5QoQrXzG+/DoxJJivZd549yXSWIAY84C9xVF/cnwkRW7O00gyevuex19iGI9wkXHVIJkW/jCdO/
 DwdFBU2bsxT3sWq8yJbiKVzEUBJib81/E/56dcXnAXwWfm6UMpJvfXjqagTDXvZpB3T1im3waP/
 zNFvH1ycfAwaHKzzSyxIKNjAVQ9z4z1j/mgda+921aTIxuEAxYsm6swma9pjx7fPW5+hJwHqcb6
 lEGPFD6CT4vTF/0v98XDLzKP2YOdrWwSRrf49sLwfnvN/1m+Q3zf5065ENiOV5o3S75EkM6f7gR
 TIGwnX3Aem23hEs5QpPeQJ7XAHUwvQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220073

Reduce the number of parameters of the function by moving inside
the function the decoding of the field 'config'.

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


