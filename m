Return-Path: <linux-gpio+bounces-27545-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 33DECC01792
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 15:39:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BC8B5188439B
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 13:35:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD8C034403A;
	Thu, 23 Oct 2025 13:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="dbl6z9py"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10B3328B4B;
	Thu, 23 Oct 2025 13:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.182.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761226073; cv=fail; b=I42LfFm1OcFa7oSSSSIhBcGb9IdGc4qcsVrl52Or9ULqSHAOmIa9wpge0c2vlPnrVvOv3Tv6kmMo/zJH/qtMSoi1LQ0yH20q+/7HlrhAk0Jatn8qhIv+MoLWPIEZUpiJ7G9ZBEr1ONSz/Lzsyp1N2Ro64x+FRVMOD/GQ29BrXDc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761226073; c=relaxed/simple;
	bh=NhygrzLOrWQ3LXcp5+7f4Px83CUKqlxQ9xgCpNZ4pdY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lcOR1rxAaYBysnM0V7Fdjq0i4yuNnyLkdbZ+8yTOaQouRh5KcxfU5/LMnrOgvsCE2tai5rz3QqQGZETiXmZlp2YdAB0GzsHY+sND/mQVhZd7ReWfIzgkV9YR9iPqfxLnZ2ctCMYXnSOFWKfVVluQEZEDiZ709GW1bJdIx6Uao0E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=dbl6z9py; arc=fail smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N9glaA004068;
	Thu, 23 Oct 2025 15:27:13 +0200
Received: from osppr02cu001.outbound.protection.outlook.com (mail-norwayeastazon11013021.outbound.protection.outlook.com [40.107.159.21])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 49xvcxp5vw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Oct 2025 15:27:13 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H/mrP7T3a3PX/EeUMcyw0WiLRaf7SrxrU8pE1Dq776t91uEyVZd1z3sc2MEKIXqbKY0U/ObQt/Yq4Bdud3NcKAr0uwViGsmy2t1GsUD0pk10Mpe7du06f4/yF4p5h871Mf7JVu/H+udblF0+BEZ2c5LnoWKthEuxjkWrNhTY4Bo1NQYcH/hkBPyKNqk4Pg0ZLQzjVVkRHx9zQXAE+b4TMudyFeEFQW96q5Y+/ejipT/ck37cmSBwf38xJkdSWralkhnB1tNAu6wzhItp2vkY3O+mM7MO12WZv0Jp/zhQo1+Owej83fIaszk2WQ8myXITFZEGT4Y2pas92Wp+DnipFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dCjAeXptzJXdXlXSPmLgqUAdOdGWKy13cjYzi3YEodc=;
 b=SVAnNJsHaajVVZifp6oNvq8se8A++lLVW7oXlrK/+cghC/Xz8r+ky22EyOd14yT8XlWt1GjVd3d8MgP6lbQF+jzULJS0Geac4GG/bhBsMtpgFN5soLyNs/Z1BGlrzgvH3KXv1PSdyAE9HmMOnXYbAxp989pTmOH/OGK33DkGCgB7C70OuGdCWrFJFBgrhOLaey9IqSdj+mJomm9B8ezAGau71V7rzF9WVmc/ZGnIlhQF2rF4k7y+idmsqkH4Mkt8HVZINWDEOK4z9KZ8DB/bXSs01xbtWDc1wrpiVke1j+pvM9MpYzhlPzM4QIp29lhPnmZlIARnnpqL7FQsF8iRgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.44) smtp.rcpttodomain=linaro.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dCjAeXptzJXdXlXSPmLgqUAdOdGWKy13cjYzi3YEodc=;
 b=dbl6z9pyV/pTpBIS9Comi9BDoM7jGtdELys9+WzrGS5PuaYYRdm8aVk/43hSUSQY7M1srlIsMEaqD2mUrXGvK1Z67bPjCWPguq2T5ZerETx71QzZngl2ECHmXZSvru+q6kg1kwmdFMDLuSqfSnqQKyPNHQd8VEFRcUzQIL9rGujuKpm7al0IWLgnVCd9vx7RujW0Dg3TZQbBr13ju7z3U+ELL4ULqD3cMTNwP460ungUoM0zpxrKlsjKcFMbhe8QA3JQrWnghadJCGj9WpRpxxuiQEe93UA9/FLHtM7S2sUXlTzuHIcHaoCCz6Vnmruka683M8nHHc2CAKHsKZmogw==
Received: from AS4P191CA0025.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:5d9::15)
 by DB9PR10MB7268.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:45c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Thu, 23 Oct
 2025 13:27:09 +0000
Received: from AM4PEPF00025F9A.EURPRD83.prod.outlook.com
 (2603:10a6:20b:5d9:cafe::65) by AS4P191CA0025.outlook.office365.com
 (2603:10a6:20b:5d9::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.13 via Frontend Transport; Thu,
 23 Oct 2025 13:27:07 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.44)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.44 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.44; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.44) by
 AM4PEPF00025F9A.mail.protection.outlook.com (10.167.16.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.0 via Frontend Transport; Thu, 23 Oct 2025 13:27:09 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 23 Oct
 2025 15:20:11 +0200
Received: from localhost (10.48.86.11) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 23 Oct
 2025 15:27:08 +0200
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
Subject: [PATCH v4 08/12] pinctrl: stm32: Avoid keeping a bool value in a u32 variable
Date: Thu, 23 Oct 2025 15:26:56 +0200
Message-ID: <20251023132700.1199871-9-antonio.borneo@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: AM4PEPF00025F9A:EE_|DB9PR10MB7268:EE_
X-MS-Office365-Filtering-Correlation-Id: 5db0f292-6e01-4caa-da3f-08de1237de88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|82310400026|376014|36860700013|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?i0DzfR9C++iNgS2WXUgW16sfF7mxZkmCkBU9+/1CLN6oCSCR/ZecyxpgjfNe?=
 =?us-ascii?Q?W3q2l2JUfilF74JskkZAtfnEsw9toX3WSkklkhrnO5EoI4sBuASI3Mrd4qz2?=
 =?us-ascii?Q?YLYl0wMi1FA6PqUlFkmcoXDaZHxKkdfI9QsOrXkV8YomoUe+Gnup3jw4qmjI?=
 =?us-ascii?Q?HVbYYDpUpwTRgZu/67rtrYMinzMrWalWPwkXTuzqmR8BoJfmd++LOS9tqKpY?=
 =?us-ascii?Q?fzh+KDAbNZPOGi1ke6vth2Pb2XfY0duYrI/QQuTLM8vYN+FtvAqJSnZltOQT?=
 =?us-ascii?Q?wTB811lMb1LyuNcYonQDIvaq1Hn85dBQYe7bsl4DA25NOpymndR3md2OuvtA?=
 =?us-ascii?Q?FgsibYPympdmR8qoXaUMYnfvmEseS0oFugK+9E1VTDkJttx3Lryr91JsxZtV?=
 =?us-ascii?Q?Gxi6fXsoUfIP3IWpp3v83pZUxsrT14kj0PMDXd+hc31qOlYcFvAF0sdsIZ1g?=
 =?us-ascii?Q?PPZjTWToA1ZuH44IkOFOzipHMaBXwz/83a6HS2vd8kcTwrDG34eXg124bjp5?=
 =?us-ascii?Q?dur7Sr+e5tI2SdbJDtYik08s5CYgIqekWb7H/571FkRosEPU2o6qBRbrHw+q?=
 =?us-ascii?Q?LjtSWxHJmSrCQpevZNYYj6QNKry/b4U9LrFo9f7ukxT8NU0+9fK1zNtVW3hc?=
 =?us-ascii?Q?la48efROVyM60xqSASjjIgZDaUOHlLfQ1AMkr3I2lXsepOBHg0wZU12aQ5BZ?=
 =?us-ascii?Q?mwzaDJpaxxoaIifwF7AwU7I7Hw31V46yDdjnIeB+T8CaJURnOjnNbg8kMDPY?=
 =?us-ascii?Q?kiVW7ia2I7giL9ViFzpkKJqn3BtJH7M9fWQPnhqJmaGHU+URtQKFwVdo0PTx?=
 =?us-ascii?Q?2NyyiW8OnTK/vQf+bCuSud/jUa8n5OmnWVnUKV9Ho/USWoTm+aYi1OXNSSCa?=
 =?us-ascii?Q?dI1TlX5TKf1IeD3ChRGg+X68VdlwRBd5USCPh7bek5BLR4v2ILir1Ja3Vrqc?=
 =?us-ascii?Q?cOT7oDRxc2+UnQ37ADpFjMdRic7NbH+9nxmdKyxICTVQXh/TkfgHny3uXmTt?=
 =?us-ascii?Q?FdTS3JsWP64PSnJZzGoQbwJW1lN745vxBhIMox//fc/BaEZjtOgvnDUaSz4i?=
 =?us-ascii?Q?Z12KZb6H5L8P5BLYjM0iox5ri9l7bQ2IGXs7/6IE+MQnOj8Zlkq1P9fOkcaj?=
 =?us-ascii?Q?guInbHYZ3uGDgBrcCON+9wLh6u/DzFHmrdbLo2RA0y2aPNbb+eHMHAGYUU3W?=
 =?us-ascii?Q?+RIMZVJzOEElGtWKvoMX64qZGBvvQ118HoC2YM4n7bIKxza2HBKkm53B0XXx?=
 =?us-ascii?Q?FyYXYkIrgLphwW+1XQVaUTTQWKgvXmHLlMrpM0/a3ox0wgAG3VuQUpz9wjX0?=
 =?us-ascii?Q?DYxSxkiJlB228ddnMBfBD/3Ehj3lGNJ/jbWw9bWRsGCBI92avY3YvkyPKvNi?=
 =?us-ascii?Q?sSaiCTCUUCBcDlC3AXOwWM3gBm0Nslu0Gw1VW4minm15Hn0oZwYpp41WiiB2?=
 =?us-ascii?Q?GAWPYn+w0vW5jyTvPsJAJmCc6Zs1zG3LFOC/R/8xKi63VDSFMPNOcTi+0hX6?=
 =?us-ascii?Q?K7K4f/WK+ionVd/TAkr0Dvza1WsxHP2XfFxxSokqflC/8hJun9KIp/jwCcKI?=
 =?us-ascii?Q?dUDUgFc4e0+QehfO3pVGbDHk4ErMnI9vEOU1GTE3?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.44;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(82310400026)(376014)(36860700013)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 13:27:09.8088
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5db0f292-6e01-4caa-da3f-08de1237de88
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.44];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00025F9A.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB7268
X-Proofpoint-GUID: GLjOVgvzhBZMV84BeJGSOEPYagT5QtQ_
X-Proofpoint-ORIG-GUID: GLjOVgvzhBZMV84BeJGSOEPYagT5QtQ_
X-Authority-Analysis: v=2.4 cv=RoTI7SmK c=1 sm=1 tr=0 ts=68fa2d31 cx=c_pps
 a=s9ZJRRhBFcqeuRvbWCwVPA==:117 a=Tm9wYGWyy1fMlzdxM1lUeQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=7Z6HTxmNocq6VBzl:21 a=y9YUpebZf6kA:10
 a=x6icFKpwvdMA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=Nw7eZBQmKDrzE-cWAosA:9
 a=zZCYzV9kfG8A:10 a=T3LWEMljR5ZiDmsYVIUa:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDA3MyBTYWx0ZWRfX9/Nni1Gl+ogU
 tUi3J8UFMIa3GujnS4BMqeUoi7aR0uwp59ooHCfiB4SEag7ZgK7ny8O81BBy+x4Z1L2+lF0bQ62
 540zUpPtuvpQP2au//4lRuZ+TEP0M+i8ojRJfvV3wGLV5Hw1hKn55QaH7xgDcs0Ar0QGqIufAoq
 mMlcQIq99MwCisRtz5wm6sDz026al8xqj6NTRAHbcqcPiLsOTJe5In8e9hclC74t3+vO/SGbWcp
 1LgTkWBMAGh2iyF4+HzzHJFJao8eAw3ko4TM680gBNZPDo+ALsRJLtX60+uQwy7mzCgRW6fpdwg
 /KKJztmUXhjhcCcuQJoZ3vqvamxxcnyPkvbiEkzc6DAAhS7pZhVMorwo1yPXtVQnVmzBbfs9O9l
 7p2o4KRZain6oWzpk6e/4joyhAXYPg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220073

Change type of variable to avoid keeping the bool return value in
a variable of u32 type.

Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 drivers/pinctrl/stm32/pinctrl-stm32.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index 7175328d0df0c..ac64cb7f86d74 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -1148,7 +1148,7 @@ static u32 stm32_pconf_get_bias(struct stm32_gpio_bank *bank,
 static bool stm32_pconf_get(struct stm32_gpio_bank *bank,
 	unsigned int offset, bool dir)
 {
-	u32 val;
+	bool val;
 
 	if (dir)
 		val = !!(readl_relaxed(bank->base + STM32_GPIO_IDR) &
-- 
2.34.1


