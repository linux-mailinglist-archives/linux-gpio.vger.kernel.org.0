Return-Path: <linux-gpio+bounces-27091-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C033BD9DF6
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 16:06:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 20EB419233F6
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 14:06:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38609314D2B;
	Tue, 14 Oct 2025 14:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="GcaBKhkU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED23314B70;
	Tue, 14 Oct 2025 14:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=91.207.212.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760450727; cv=fail; b=jK4/+d64hqFd/4rqhcrJSeLPj3AYrI+l94QX3RcQvkHkud1eybVHWbUUt2xOLRZTR2hdAjp04AmGVYoeqrwMPLktd2tlay5smNrqcjTb593Tb+q8CXGNwlUVwyFxXOJXXC569ULFPHSJIMD0cb041L9bU0ix7szelyyGl386LUI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760450727; c=relaxed/simple;
	bh=+WNz7DTJO+j73G7ze4M0PSofu6Hz8BAKupEUdBhHvjw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UgADzhGbSmXcCpc3eRxBjOLNV9/ckZWB8s8NMpmGDW+UHczBDIBmkyJoB+yPDVc06WsYmUe29PB2W1GkW1e39tffO9srTHVO5zVoWOodmuzk2HqjJLd/K9vRZrYvPENm1eamRQSRS3anCiEyNkSMfvr9rATGfwllNCVCvE4bDnI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=GcaBKhkU; arc=fail smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59EDvohG017964;
	Tue, 14 Oct 2025 16:05:01 +0200
Received: from gvxpr05cu001.outbound.protection.outlook.com (mail-swedencentralazon11013049.outbound.protection.outlook.com [52.101.83.49])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 49r26j20gb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Oct 2025 16:05:01 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s6eyDSCPb05QxoynGMgGlPZJNZVNZuApCXeskRzQ/BTYrwsbSKzxd3tMPeIkVUqc/i2iL33SKZoF97diK2SaJxV8SDxwb9pgWePUp3LO+Z3WlF2wbB1tpGNBrJ6nBZgXyRZctNvWg9jwcI6a3P1VDY52TK/7n5ZwdfxNTXy7FoqZtHXFO6cJmQFkMDWjNA12/Fl6xGqObAUXiAwChbPqhHgSH9F77op20cj2WOMOpbNsy6h/MMtMSNvt2oIYHCDmsBvuwjxOs8xEUv5IqfnI+YhOGpMR0ZYMJRd4CTkoJlys0yEd83DMkSF1KdJ2L7KHre9UfjRsKaCeXUZFrRITnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bBnLtUqV7YFtXJt9/eFTKNVYAPcaHIwfT8QrmiKRZ58=;
 b=voWXjJTnFvlYL3rLUqYzM2irmNOxBQRrBJNdLNWhYrTWLbPqrX8tcZBbfBCFEkFUrHxqyRHRmJciW1BrWDOtubq2NByw8oJIz8DWxVAdNeyfZJTAUXpf8wB63SKBlNw7UMXKZA6CIAPw76Vg20EvOmaahDeQ2eUiorHjS1V3Mz98Pad7rxEsojcApW3w20KPoPCWgqgUh8SSXIfAxdqbb6hYXJ0udsFLpZskFaRe2bcXWG8wMfLcI95lr875mIOvkZa3TZqdTFGPQsTGPb1c2a3TrPCXnkNiHMXCmjJKTQyohZE0mBZv+0wAN1QpOAK57lyV0ftuLVxW6e6VA4DTbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.43) smtp.rcpttodomain=linaro.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bBnLtUqV7YFtXJt9/eFTKNVYAPcaHIwfT8QrmiKRZ58=;
 b=GcaBKhkUPGQXPNcXeiXiFF5YKEknzzVqCjuooeTeAk/qYY+8VLwbHPy8mm+YiLiqK35UtSVdN3pWBn6lJXDpDNhvZR6baJ9T/ATMfi4JC9Le1ryxMwpNR8UgJvizHC5R/+Ux+X7/7P10peGCOWS4tDdeH5lP8kwqgYbOZts4SyXaReLhxGYndyrEpQuLBvlg59fEUW90dCNRQkSZNS8DaWDnKs1Tt8JYMqD1oluNyN5Mf/GMlC57alLPs6hRKOvaJYzsTEVmy2BajSTdOkzY+YNIp1VHvFfFFSixkhtd7SQAAg7YY5On2XEbh00bqfHIf73iq98x0TW9Wv/OhBeNaA==
Received: from AS4PR09CA0028.eurprd09.prod.outlook.com (2603:10a6:20b:5d4::16)
 by DB8PR10MB3290.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:11f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Tue, 14 Oct
 2025 14:04:58 +0000
Received: from AM4PEPF00027A5E.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d4:cafe::40) by AS4PR09CA0028.outlook.office365.com
 (2603:10a6:20b:5d4::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.13 via Frontend Transport; Tue,
 14 Oct 2025 14:04:49 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.43)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.43 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.43; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.43) by
 AM4PEPF00027A5E.mail.protection.outlook.com (10.167.16.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Tue, 14 Oct 2025 14:04:57 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Tue, 14 Oct
 2025 16:02:35 +0200
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
Subject: [PATCH v3 02/10] dt-bindings: pincfg-node: Add properties 'skew-delay-{in,out}put'
Date: Tue, 14 Oct 2025 16:04:43 +0200
Message-ID: <20251014140451.1009969-3-antonio.borneo@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A5E:EE_|DB8PR10MB3290:EE_
X-MS-Office365-Filtering-Correlation-Id: acd7b2cd-e8ef-480f-1ab5-08de0b2aa8ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|7416014|82310400026|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eLWagnN/jAgS8SSBw6MOq1gzpq/iUDRBLX7TSprvnV4gq/pw0XY5N/mHBRVw?=
 =?us-ascii?Q?adpxu45YTci3QYfFvdO0wXrZaGtR060MlnWVvYUpD51Kvj6yEIzm1UWVAGOV?=
 =?us-ascii?Q?W1z31wo1qtCHgPgmjPD4ud3N6htspHzrteG8dQK0Bz/wlu+lzB7ViUmX+Q8R?=
 =?us-ascii?Q?mwR/EwwRjsrDDqqReOwqZ4GUtBcCTBAwPA38gPLHZJr9V+F0bPdlZ1WEYLUc?=
 =?us-ascii?Q?mUz1DnlwVxviYBbYOgFIx4ZoFl8dylgvd5Ai3Q5FJu9xUbcIvsTzm7gn3SbK?=
 =?us-ascii?Q?zV2KfmE4adcLpij6ai/NCGs6R5RG9aV0aGsnd0i30Uxv9tmzMFPmHC9zRT5D?=
 =?us-ascii?Q?UGi91nOjVZ6Q0VDcCMmD+aQUu7oueA0DAy+UqM2VNJzaMH61s6rKKx+ieYlt?=
 =?us-ascii?Q?h+ZxEPfQO9iWk+ff+UheAgW05x1EMacfRYQH4DJH4flEx6CBTuLkSDPLQO2s?=
 =?us-ascii?Q?yzIepsBMe4EFrDWr+o1bjsF0niIce7OvjBRqN08ST5PgVPzqgHroJWS8sfZe?=
 =?us-ascii?Q?mDfvQG966IY3jE4rF3CaG6TdjBqTQBEHbgPQ+aIXOCxcEuYGIeeBryRPLcY/?=
 =?us-ascii?Q?5vCSlOgfeVo9nWXFI90qqrJmUB5ec+xCYjUBsFAH0jqpWofGmu2Z2CyAPrKv?=
 =?us-ascii?Q?6bpS4+vQlTnInmqUoG9Os04QrDRsnVKfb4lyhFxFxI47CMZYY4y4kxuDITrD?=
 =?us-ascii?Q?6F6rmFjW0uYwxxsPSTqMWgf+Yq4fd6Yt4Xp4O71/Dm2Q2dWapGHyp5EgVNw0?=
 =?us-ascii?Q?DvnKi2EfoKxxyvDVGQPIeYcuEH+A7mHOe+er6H8m+zpowyMSs8w7brX/0Vhs?=
 =?us-ascii?Q?mwr3umPt+jnB4cXBDvV66IWMTkNCjlRNHXFtgOfeQUoJ2BvXThVM1n1+f6VG?=
 =?us-ascii?Q?Bmf7jfGRaKMrFZ7gP+9Q0vdnNqJyZaH61k1kZWEbvNCGPnUKq4CO89PF3LRN?=
 =?us-ascii?Q?F2OFQLw7F1Ds0NJ+d2V1pcbk/bv5VuQrIB9bqD40einYl0V9dm8TusggFwMw?=
 =?us-ascii?Q?mf7BkhnTdpLN6RTQplERHQYR2VmboeQAUXKsfl3j5l0vYtGsnwF6szvqH6Gj?=
 =?us-ascii?Q?j0dJvt6E/aNIqll47uRq2/+MObiH5PnZ3AkYG6V333P1kQ/SaE+PJLi1kKUA?=
 =?us-ascii?Q?L2FgAPtm11UH6zB/YNKhS6rwEW1GxMsb1xEs605RUAvG12YFF/LfpxwrDbJ7?=
 =?us-ascii?Q?UD2S6S4HtFvTZpNFn9ttzL7HmRJXiwdfT9tqeQ1eH2oZJOoQbsFxuEkzWAn0?=
 =?us-ascii?Q?YrCvmhReOii5Cy6MUphPT6djW8bFjro9MogiNZXEnXN65clDP+qqYSJcJO+s?=
 =?us-ascii?Q?CkEDAYXYvP5ZSWG5qE2FSK0+nmzmlmGOtkh0Wbmt0B3adawtCaV1LQLFEuIP?=
 =?us-ascii?Q?/kJ2d02iGX8qat+gwalOh58/rRBbFSLlXnu40sZTzSQzaalITDU8xviQqyFk?=
 =?us-ascii?Q?8NxSROdjd7aI5jmvcxG0TZtVv4Du6gjCKoHpsPOp/RNE/cJ+YyctqrahpMwM?=
 =?us-ascii?Q?2hQ7kEnavOVWvjKfbd6Nf5cEYta3Bp20pmvbL2yMY1t02+3a5NaE+IbnSITO?=
 =?us-ascii?Q?8GRbHSGDFwjP5SWyfUFDpRR4c0c7VOPR6b06BNB3?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.43;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(7416014)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 14:04:57.9343
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: acd7b2cd-e8ef-480f-1ab5-08de0b2aa8ba
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.43];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A5E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3290
X-Proofpoint-ORIG-GUID: _nb3LrLeQLE9O-xKQOCQviFiakfuqBGS
X-Proofpoint-GUID: _nb3LrLeQLE9O-xKQOCQviFiakfuqBGS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEyMDAwMiBTYWx0ZWRfX4gWU9ctxxFV0
 6dAZrvrmFd/XAGsyNsdQF3cGH8Vuiof8GBAeo0g87t3Wr++lgBFodgimlf7ke4isSBvIfqovswd
 1h28Js+NbI/hQY/ZKYLLun88p7iQQ2OAfaUhV3hhYonvTeMDnK81kflNIEpYiL0zZO0bvw+h4OW
 F7Qjyau0Ndw6wJqVD9Z145eHzOCjZsohOjd+HkwhJiQhTxNDoNNu6IGZIg2XNSfo3stuJJwT0AD
 ReLkDADdFnPkfagbFkK0928Dbrl77zef7TkxqpmmFAuk1ntrhyS4SSYM6X9NopySrZ0a9svKpbd
 J0pKbv30HI0CYwJlDqbJUJHdvEvy7C5OGgicxZWNzYPkscHKwSMp+nEP+1gXJ4zP7xhjR69ah0z
 oF8Ig1Io0uHNqvj0iaszwHRuhkhLiQ==
X-Authority-Analysis: v=2.4 cv=X5Vf6WTe c=1 sm=1 tr=0 ts=68ee588d cx=c_pps
 a=c6obLYtgja0dDRtTJKzh7g==:117 a=peP7VJn1Wk7OJvVWh4ABVQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=y9YUpebZf6kA:10 a=x6icFKpwvdMA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=8b9GpE9nAAAA:8 a=pNr4hbwTCV-QBDTWOQ4A:9 a=T3LWEMljR5ZiDmsYVIUa:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510120002

Add the properties 'skew-delay-input' and 'skew-delay-output' to
specify independent skew delay value for the two pin's directions.
Make the new properties unavailable when the existing property
'skew-delay' is selected.

Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 .../bindings/pinctrl/pincfg-node.yaml         | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml b/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
index cbfcf215e571d..c3deb103d816b 100644
--- a/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
@@ -153,4 +153,26 @@ properties:
       pin. Typically indicates how many double-inverters are
       used to delay the signal.
 
+  skew-delay-input:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      this affects the expected clock skew on input pins.
+      Typically indicates how many double-inverters are used to
+      delay the signal.
+
+  skew-delay-output:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      this affects the expected delay before latching a value to an
+      output pins. Typically indicates how many double-inverters are
+      used to delay the signal.
+
+if:
+  required:
+    - skew-delay
+then:
+  properties:
+    skew-delay-input: false
+    skew-delay-output: false
+
 additionalProperties: true
-- 
2.34.1


