Return-Path: <linux-gpio+bounces-25676-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B9AB459C7
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Sep 2025 15:56:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 610453A944B
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Sep 2025 13:56:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBD3235E4DF;
	Fri,  5 Sep 2025 13:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="TbIvjkDv";
	dkim=pass (1024-bit key) header.d=stmicroelectronics.onmicrosoft.com header.i=@stmicroelectronics.onmicrosoft.com header.b="lRZOIJZl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28BB35CEDA;
	Fri,  5 Sep 2025 13:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.182.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757080585; cv=fail; b=f9DntYhwZ8V7imn0AJzSVoJlQ21KSZBjgyu0TvaNhWULeb9dJyi2rV7HrAeWGZA0o3dDgoyOz07YOblX141EOlsb2foCUv9wmj5jcivEm1h6EwF13/n4T2v1mqQYelOGwz7sQPxbc1Uhy7RGkgt79+s1VZJSdLWgtjFQVpp8xrA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757080585; c=relaxed/simple;
	bh=h7wSPJkoiAiY38/HUu2CjY9DCH5yRYiOZdOIuGZzsM0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jyeiomVqwooWafyAmVIpKRtXWK4YKVk1rxaKj04mUHYH7JUcE+hcTrHD1qWfjlJInVHuY8Ws6wAllAk4rQJJn2AmLu31kUTwZOgHB1Jblt8MA5Qq10ugMM4tHGcRT4rNFC6X0mW5cMZn5PfTXaiXIPD13i13pQMd/+DTnAoCwtw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=TbIvjkDv; dkim=pass (1024-bit key) header.d=stmicroelectronics.onmicrosoft.com header.i=@stmicroelectronics.onmicrosoft.com header.b=lRZOIJZl; arc=fail smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 585CSwMk004022;
	Fri, 5 Sep 2025 15:56:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	YeTxVzoNaNTy9ZAbg2DypZhDk4XwjDcDqYsdX7zy7uY=; b=TbIvjkDv48tbzxlU
	kO9tZ6Bsr6km1joMDYWs9xT1Hkt8Sryvpdw+hjm7fYJlqFRCFQddx18pVbqRxRDz
	HmPuV+s4cnUGmvWfV6X+dmHE2JBgeDpMlV1m64cOtHumWK6nJRWYArs62Cr31GPN
	XAh+6F1zc5N/NDmkMkasIFTcAuZCBOpy754RP917syK4U12k5obYOeCzIiQrRUHP
	5boo5Mb3rBtqmdH9iDaxzOBF7wgIUcmDbSLG/0FJFLtCOs3qM4v1dE4voTbz3aNb
	BleTTb5c6Zdn2p+HY/ZnXQ7qiPfzT9sU/ErDw4erdOC9dKx4lHmNi67h3GEvn6nP
	Oyc7/A==
Received: from as8pr04cu009.outbound.protection.outlook.com (mail-westeuropeazon11011016.outbound.protection.outlook.com [52.101.70.16])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48urmxubt4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Sep 2025 15:56:05 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r10oH9Ye3dpC7nOuBWCPssQhw1NdnLiA5G+cnPofoh6SlHEqmdQgdT4p+god5tjslcsi36S+6tqoVnM5j5V2QhwaAe/MvCANc7J1cXf+9qdVbQvApTQyUZ9mCTd3zlihfZ5SN69toUZ9uyHcFRFPYHEKKPRSYuJzjXNdOLK8MHE7SVQEBC5y/DLR5lmAyrQOKyiP4tOCuHklkk1nEoNffL+yttwh7B4e7T6KzH5HGVe+CysyzwCe67zC9Hvskwkk2cY6T20PgYiG3S2MOENPytqrJYyCS6yuvaNcFkQ/9bEdOoP0edI9yewNXIUPmU0V6fbdQkQcWMpkRIrOFi045A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YeTxVzoNaNTy9ZAbg2DypZhDk4XwjDcDqYsdX7zy7uY=;
 b=bJiyOiEJTlU0HLv9paLObWj06WXOznmlcHJ+9ntB6xcNWKWeaFsmOpfJwLBZ/pgtT3ROH1hH8JAvqQiUEgVfd6PHuL/4zkh6NAB1n8TQnxHx7tsSKSerRqxQnZH5AVpcSenq2IuCXIeWs6hL1Jty5bkfnlnNaX52X2Bd/BCJ/PEclZX89FS8IaVFkCWmpzgUdKDjMF1FrdWLeRUo9qzUjly6zIIxBnHj6DQ9QihuvL6+KXAs2ye10pNKCJ5EpGazuGuNVnc1TKojODihycxsek0IQXgEv7xv6Jwv8EYB/qjAK0NaMGReOmNj9FdHh01SyZrOcL1JHo0ppntJsNeOEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.44) smtp.rcpttodomain=linaro.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stmicroelectronics.onmicrosoft.com;
 s=selector2-stmicroelectronics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YeTxVzoNaNTy9ZAbg2DypZhDk4XwjDcDqYsdX7zy7uY=;
 b=lRZOIJZlhWFDPVIrd4uAYc5XaRtFFA+hyoHeDMOdLu0lNB+BrxuCqtv09F08Wf+EL/9BecWOfkZ8dWYhP/uNtiIpGXWAcNcDUeY8MWlgFO3QNAWuhB2WRT0Xl+7pPzVipu3/zwqabsGWQtJ1c4fQR+Z7WLspSNQ8AKU3PKbvVKg=
Received: from DU7P194CA0008.EURP194.PROD.OUTLOOK.COM (2603:10a6:10:553::25)
 by AS1PR10MB5191.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4a7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Fri, 5 Sep
 2025 13:56:02 +0000
Received: from DB1PEPF000509FC.eurprd03.prod.outlook.com
 (2603:10a6:10:553:cafe::61) by DU7P194CA0008.outlook.office365.com
 (2603:10a6:10:553::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.17 via Frontend Transport; Fri,
 5 Sep 2025 13:56:02 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.44)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.44 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.44; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.44) by
 DB1PEPF000509FC.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.14 via Frontend Transport; Fri, 5 Sep 2025 13:56:02 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Fri, 5 Sep
 2025 15:48:48 +0200
Received: from localhost (10.48.86.11) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Fri, 5 Sep
 2025 15:56:00 +0200
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
Subject: [PATCH v2 2/9] dt-bindings: pincfg-node: Add property "skew-delay-direction"
Date: Fri, 5 Sep 2025 15:55:40 +0200
Message-ID: <20250905135547.934729-3-antonio.borneo@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FC:EE_|AS1PR10MB5191:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fa761a5-773c-4cca-aafc-08ddec83f348
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|7416014|376014|36860700013|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?h41RWsTqn3hU+Lifjpz/x5eQWewfC2uRsEzlrVKCxAdy9kWYCLxngYqAYIZV?=
 =?us-ascii?Q?XR87ikRlbkSnqiQlGlMW7O9DM1576DBJrjJCA14RgpLf28U4IzYBRV9jkGMF?=
 =?us-ascii?Q?3GRRG8ObulgFJFoIYrwTPCyMq86e94ZGXwzPulEkH7q/X7j14rOGzdFA6grA?=
 =?us-ascii?Q?A8GxlkNDZXf4i0Cz4qrPn5HCXwoYqtBtn23SL8UjT0st7X0Z1aTcY74FdhZm?=
 =?us-ascii?Q?hPnz82cwYP+ceAAJKoOvzEqMCrx0sx1pJ0Vbbpe8m+DT7Xrc6d32Ttu9xGml?=
 =?us-ascii?Q?RkM3e9j7dFpBbrwWHh49mwHHAE0QDKzWsLffJg9paHs7dtjRzLxKX7OMoH7a?=
 =?us-ascii?Q?3aE3V/Upf5jmIruAAnjhxZvkoX/lO6k/43cS/oDGx/K9oxKf6nMM5uzvVXZs?=
 =?us-ascii?Q?LvubbsExK9BlbqaCZth87fQQY6YGsS07On4ynTBsCza/BcERXFrfCgRckzX8?=
 =?us-ascii?Q?XDrsKhC77rhIyt0OMMrJHHqcUTeQtiKYRVB1N05u9qJrR2EJz7guGXuNankR?=
 =?us-ascii?Q?ipMe3gCmhIZ17sR3QG8R8OiT8SKEOLD506xyqJ3yH6FP/KFyMHkCZEjEqWkx?=
 =?us-ascii?Q?jtz6sS0ypTcB3JXrFEJaJEUHhzbtwGIqHVAQpRnXIr3aBx7VSLhbLXOlt7qt?=
 =?us-ascii?Q?JJ6ek3gMuL3UV+bSg1J9UHR86cOKK985a6bvV5BvkJqIpVTih5Q4zFLda5xy?=
 =?us-ascii?Q?SxqwKWG3/cJI3XVGhJeeKH+SV01dtzX+D9yoeH2Ik1baUVOhnRzZirj+F+Gs?=
 =?us-ascii?Q?VnuerSkhxS2/rKA5wNYbqB0rECIXkv6GtmYLCttFy9FQeRbzWQHRgZV19dHO?=
 =?us-ascii?Q?zO2TpwVmp5ehIhBXvInQR1wYLS41dxgGD+KzOSve5S/+baXPN1KceeSR7xbS?=
 =?us-ascii?Q?IyR4uw5FbjqB7DU0YDqKl01ApDfCkBgpHMM7Rn56cLDQXYhjFkRUn8adAYs0?=
 =?us-ascii?Q?R2L2mdSmiHFaq9qsN23uOA3jPBBcgqBF7zwfMhEtsxmNJfpyVSDeGvvW2LkJ?=
 =?us-ascii?Q?bJmUFfO8nsGguYexyjKkOyMGOjJUcSUCXZgwwa+wUhiHPLWCb/+tUOPMTYBc?=
 =?us-ascii?Q?A7i5WMBR+XLkRyUD0xMJe2NjLDYu942AOIZuIJwSH4gblpL2c5av5S8HdPnB?=
 =?us-ascii?Q?2q7AZF4Jtev2XBzRtXYAa/galilkNA8HS0S5jmkSducdq3KqkfBpw0ry+KNC?=
 =?us-ascii?Q?2HVlLbG9qb85LoH/+bLv0Ti3FVMoEzs8IBJpyWFCbE3kPNb7atDiCcw32zpq?=
 =?us-ascii?Q?S4yUppyeA6eeIesTs42hSEYFpUmh8tMK9wjnpKUdS9XBFyvZG1O6ZPrBP2GO?=
 =?us-ascii?Q?7k/WvRBr1SR9+BaINAGD3OFcEIQaqjAKFKj44c1o1HGvqDmuCt94Phs9jYgv?=
 =?us-ascii?Q?IriytO2r3ul1+dgo43Ozph6jnONBxABsZK9D/+Aqjsp4J+xkr8P6HClZQip4?=
 =?us-ascii?Q?3wT7Pb/vHgfKAQ5KDqo/6+hlAg+tks5dAHrDQOARebn1MamQ4iaI2Jz/Gzg1?=
 =?us-ascii?Q?0AchHM7yJgW7SywOQm3/zBhJNR7NHd82mfvOI75r/yb4OcGYoM8db3OlaA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.44;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(7416014)(376014)(36860700013)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 13:56:02.1816
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fa761a5-773c-4cca-aafc-08ddec83f348
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.44];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509FC.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR10MB5191
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNSBTYWx0ZWRfXyVU1IAToWXuU +A4BkVW54urshJUvPVna/0lXYSNtVkj6SXV6Do2F4jUyyOCBYVejwSXzTk+02Z8OgZcyE09YM3R aTEn8oAa3DTHAebaaa7x3WJ/wPPKk8STx0DRYE3dvxcsOD6Itzauwrxflzyb2NxUFp9f4G4a6T8
 Xu8zBY2io4gHxuDKNxwnVPCkDK1uIWpzvmvK09EG3Ndfe4allASD2yZf4uXYfZ27HGsspwS/FwV 7Lf0yiMy3H0yrFoRscSH2lG1SYAdzFl+3Svo/U/Mg1lkvIpVuubSL/JqD+XcIDnTN9uN9LCTn+I Pq73mh9ShMUC1+AGrPIjlLFDcntYF92TuOsi3xwiTjZ9vnox9TuV9YiPaqz5qem7kobfBmlBdkn eXdIH398
X-Authority-Analysis: v=2.4 cv=dqLbC0g4 c=1 sm=1 tr=0 ts=68baebf5 cx=c_pps a=iq85x/BZ4SD4RfUJjxhObA==:117 a=Tm9wYGWyy1fMlzdxM1lUeQ==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=y9YUpebZf6kA:10 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=FUbXzq8tPBIA:10 a=8b9GpE9nAAAA:8 a=LOI9lZ3Pcah-rYGfsz8A:9 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: -ZpykxzM4JZYs8qW1wP_8vPwWIsP57J3
X-Proofpoint-GUID: -ZpykxzM4JZYs8qW1wP_8vPwWIsP57J3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_04,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0 suspectscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 spamscore=0 clxscore=1011 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300025

Add the property "skew-delay-direction" to specify on which pin's
direction (either input, output or both) the value of the generic
property 'skew-delay' applies.
For backward compatibility, 'skew-delay' applies on both input and
output directions when the new property is not present or has
value '0'.

Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 .../devicetree/bindings/pinctrl/pincfg-node.yaml    | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml b/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
index cbfcf215e571d..dd3b8cb817ff7 100644
--- a/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
@@ -151,6 +151,17 @@ properties:
       this affects the expected clock skew on input pins
       and the delay before latching a value to an output
       pin. Typically indicates how many double-inverters are
-      used to delay the signal.
+      used to delay the signal. The delay is assumed as present
+      on both input and output directions of the pins, unless
+      otherwise specified by the property "skew-delay-direction"
+
+  skew-delay-direction:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1, 2]
+    default: 0
+    description: |
+      0: skew-delay applies to both input and output directions
+      1: skew-delay applies only to the output direction
+      2: skew-delay applies only to the input direction
 
 additionalProperties: true
-- 
2.34.1


