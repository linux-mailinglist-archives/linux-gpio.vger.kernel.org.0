Return-Path: <linux-gpio+bounces-25678-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B764CB459CF
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Sep 2025 15:56:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 50B5A583089
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Sep 2025 13:56:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 374BA35E4F3;
	Fri,  5 Sep 2025 13:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="raDQCBVl";
	dkim=pass (1024-bit key) header.d=stmicroelectronics.onmicrosoft.com header.i=@stmicroelectronics.onmicrosoft.com header.b="mwwNjHtu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05D935E4C3;
	Fri,  5 Sep 2025 13:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.182.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757080586; cv=fail; b=iQQMt/Jmumft5ndeiKYpk3Fg2PWQgKqJscZ79OqDPcVEYsZXacMJl4s5cEvFBb04UzgRcYzNyA2nNrhozLM4ZYu4S+qF4JwMPeip/DNA1LJuv11MZS+uhiNF/8EnVzwAyxq7PVTsHBKh+F40B4PtCEROKA66EFGUh6+8Z5Rkwsc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757080586; c=relaxed/simple;
	bh=pZq0ytwhr41A2SnPH/3/gGi38tAXYKRdrMcjfAuTq+8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JYSuHbY2kG8Kau6Qm+OaAJVS870zFOFyHUU1qtr7+BOTLwYXvAFOXSKr6hW9jTsJewPW2nHZAPCX557wIL6WbB/1+0/Q/nZzA5CArXVUL8UTncwzIxCbqmjk+MSQQZyrnrzfjNmqk82u4VaUTejvdemOs5DlgfxT4AF0dkffNzw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=raDQCBVl; dkim=pass (1024-bit key) header.d=stmicroelectronics.onmicrosoft.com header.i=@stmicroelectronics.onmicrosoft.com header.b=mwwNjHtu; arc=fail smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 585Da4R1007153;
	Fri, 5 Sep 2025 15:56:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	ZTECwehX5+VQwh6B8vXrIaa3RFHhlJbDNM8OsThkTbY=; b=raDQCBVlV6RqdcJ7
	qA1hS935dktwzYPU3xStDcst4A98cyMODdsFJ4yc+eed5jvhwGRKbPbEKYoTJILf
	scJEOPJdqbLdzE37TuSSmcvzgy1MeyxXfyFSE2TGAksqURx+M8uoGJ1r+qA4Azr7
	xMC/k2Vnv/smOgRZ2n8UFEAatO8/dvG1GNSUz+CUDG1ZADx0bMZbyYv+O/zR8+Jp
	WfmBN1fYidWLSXah9vfuOJitaRSNhg1dTDM33/Lt9Ot0yaiBXTUmQF1Oi7e6Q7YP
	3vb0iYL7vNpVG3sjGyCVDZuiCQd7KSqjDmZeiM8s8YJQ2GDzle5PRguBX8PI69hD
	b1LuWg==
Received: from mrwpr03cu001.outbound.protection.outlook.com (mail-francesouthazon11011050.outbound.protection.outlook.com [40.107.130.50])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48vav3118w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Sep 2025 15:56:09 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vknBXrrhknrGvlRGjAmCx+rbBGIrma+bCNKOpqpPnqwj81YPXJ9quevl7FoJPDgfOzqi68WYlWBSslog5lnUnlw7K7m7ZsuTcTo3IBL9af8f5BCOcfQqhTSThnxUYVIv3emPOYfUG4c7rvsSEYoCjNb6w0dekdCCQ+hUKgpbHgMzhFvPK09RdEr/ulPXUjxYxkmmzLakvaC9x2cHlsvvAfRQAOu0Q4Kba/aMj3udyO766dZmQyWjvuDLaNpXBFM/28bb1RTRl9XbYsbjkTkUXak5yRyXryEvLSyQYCNTouJvrq8a/M2NM3pBzGZ9X56vUNsp6yuKMl6DOY5TcWk5sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZTECwehX5+VQwh6B8vXrIaa3RFHhlJbDNM8OsThkTbY=;
 b=hMEo/7TbKnXdq9H0u9Cw86teJrsTSpXjZZHGtzrzlyqVwWsysZeXXpF6MZmoBIEuyQ32YtNuuaGbrAUq9GtlJhog1cOEGu06G0YH94HRsORoqwx5DcGKFbX10aXo1YqipFSs9snO7PwICEDBhvIvJpge7kc/l6D0LQjvhAMUSsrOeOo30N5UrPq3RVEuoj3U4d4xVHLbA3m1UAmaKWERc/9xbsLUuoDm+RNDD7BAtrIjj8ZPHxVbqKqoOepaV5g+U5b/Quptrq6cuyNgWqSC+1an5YTIqe8pJ3Ye0Yhs6Fjn/pIUlwC0EX4hGrgDLg/Pbo84w7k50ea2jr5RJJVE2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.43) smtp.rcpttodomain=linaro.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stmicroelectronics.onmicrosoft.com;
 s=selector2-stmicroelectronics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZTECwehX5+VQwh6B8vXrIaa3RFHhlJbDNM8OsThkTbY=;
 b=mwwNjHtuuoogbQvtiSeN3cBaJ/OYi9V6ThhSwaxFXsmwOdMP7ba+bMGCbqzNg0GiySn1h8RcXtsyi5BSWsYKScqjwj4ZA9jQ6e0uuAdM8pzfRWXw2IEB/NHOgFLuuZpTofU64l3/E37zfY/DSDP0vFcYIPp4cp+k5g9hv9cRaYQ=
Received: from AM0PR10CA0127.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e6::44)
 by DB8PR10MB3944.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:16e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Fri, 5 Sep
 2025 13:56:06 +0000
Received: from AM3PEPF0000A78D.eurprd04.prod.outlook.com
 (2603:10a6:208:e6:cafe::7f) by AM0PR10CA0127.outlook.office365.com
 (2603:10a6:208:e6::44) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.19 via Frontend Transport; Fri,
 5 Sep 2025 13:56:06 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.43)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.43 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.43; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.43) by
 AM3PEPF0000A78D.mail.protection.outlook.com (10.167.16.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.14 via Frontend Transport; Fri, 5 Sep 2025 13:56:05 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Fri, 5 Sep
 2025 15:53:45 +0200
Received: from localhost (10.48.86.11) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Fri, 5 Sep
 2025 15:56:04 +0200
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
Subject: [PATCH v2 9/9] arm64: dts: st: Add I/O sync to eth2 pinctrl in stm32mp25-pinctrl.dtsi
Date: Fri, 5 Sep 2025 15:55:47 +0200
Message-ID: <20250905135547.934729-10-antonio.borneo@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A78D:EE_|DB8PR10MB3944:EE_
X-MS-Office365-Filtering-Correlation-Id: 68d48981-399f-405e-dc42-08ddec83f585
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Wzaab3bWvvzhxM4KA8FpYBDSpw+ciRz4avzHP3ql8XJJHzxqle2IX6HPl0ed?=
 =?us-ascii?Q?hNEdE1pOBSvVph+3xOl6LtCgBEI+udpdfCvWIoqjSqyOCM/sDIBIlw069DBT?=
 =?us-ascii?Q?Z8TiEsg5d9fNGrc4B9bZtwciJuGyAnKnkqzHUFyYkwXyiLDiXj8NwoBGfZUj?=
 =?us-ascii?Q?jyoLFRTEAP1xm5QnfQ2JayYUK/iS1Lf03LH5qgjcbpsCAj7so7meoKOtJnxL?=
 =?us-ascii?Q?H29X5dc/H80+V/xxNC+YJtzLEo+ot7aNjps1rymZ6Dvig0M1JzJBVuD2z1u5?=
 =?us-ascii?Q?Cdbw8lTOgbKS12GM6QDUL1ZTEidcOZMASg5TMFHKvZjG1QUFrcYLBN8tq0Am?=
 =?us-ascii?Q?RNOmSUABSkwj5NlYrNVrt/ybgoJGtwAGUqXuwjNUPC8fAGt8VYqbBenlZXzh?=
 =?us-ascii?Q?kyWcGjCnCRGnneN2y8iog6uj5/KQt8dXkqzFktJsATpfjgoObKcvezT9zIBv?=
 =?us-ascii?Q?A0gxjnS3s2qbUbw9+DiJApNdPwZkKp3CrwWIkDylatP2yLmmgvmiwdqOKTtD?=
 =?us-ascii?Q?FuV0R0SY01sBdja1ILCblFtiHmjjBQzfq4cp/zUU56BlGm8es2vb8tZxsMDp?=
 =?us-ascii?Q?XP+9aycqAmsEIBPrrmvBB7jiBbshmiHLK3kDTjesmGvN2FgKTokrYUHxQJ4U?=
 =?us-ascii?Q?ROImqU4C6f3oTJH/LtJaTToBWAPVpbSkfdnG5LClhDu/+Lc68JPdzdlJZ8Lb?=
 =?us-ascii?Q?bSb4xbAnk89Fb3z4eCqwBQUblkYOYRSGWHWKxlv885xX6d4hupUHZ+CdLOUz?=
 =?us-ascii?Q?gjzNggKSR/HhbApAzSY604pYmr9RbqC/Wcd9I1R3EwMsDOqVIj35YfqRYNfJ?=
 =?us-ascii?Q?OVy2BDwyQPdyhC391Zmk25iDbai0yrMRNk4n6OqUu0cxOhB1fkhYIqz3rmKY?=
 =?us-ascii?Q?Vnn2uCHui+keXqZhBz/QEoTtFHV+kdNpD5GL+dhCIqVuW54dJyofEbFCRJsx?=
 =?us-ascii?Q?ds9q+54O0yZO033EIlwCVK6I/aPwNgMYf9wlzqLGlTSvmnaltP5hYM2haQs1?=
 =?us-ascii?Q?88QGBnhPkPtf/aGSSsREPRm0md9AjpuCfqjawWfwE9m2ftQb5oSEDFwL72ci?=
 =?us-ascii?Q?tCyJoikkYfdR77ep6VK8N/5WPMl0o41/x7lGUdTk5MSG6ggzPxi5FBJ2Fh5g?=
 =?us-ascii?Q?CtohK1LpuQW3SPfdQOfxtF4NgJlWpPJtCH+0fH0gm0fYo3wxANN7nPVVdht3?=
 =?us-ascii?Q?pZ5chYEgKNUfI7VSE2O2AIkkhPu9u8XQlaUToit4MZm2qyDojg/xitOA7QQL?=
 =?us-ascii?Q?AlWUYfQ+8FLdg9utkTyqkT23hFQZ9zeXilBCSagAmJL1Cz8uPA0eIKn3YSnT?=
 =?us-ascii?Q?lH+f1IMwick3HKwA65MX9KAyXD9px0yDZKUVAAJDmcXX02OWPqPSwi2m7FMB?=
 =?us-ascii?Q?4Rm60pf2/FtwCehGcEUArgLd56jRAvz9bNL7aABwkUBI/LBUvlKlaxoYhWs7?=
 =?us-ascii?Q?Nlr5T4aZEJjuDAnXEtdCHT5UYRdNf8yqpBj2QeXV4MCCkrzcstuk+Y7y1C2s?=
 =?us-ascii?Q?kdAXjTJkR8ScTG2dH2ufe4Q4KqfpmRvIagyOSzZupk5ewRZbswUWPoLdMQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.43;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 13:56:05.9644
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 68d48981-399f-405e-dc42-08ddec83f585
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.43];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A78D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3944
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDI1MCBTYWx0ZWRfX5V9c7FP8rdeh ISf+KaHn/X96EIcrXYp++eIbQkP5q7zIM6HRs98pvscgTmkU/sgyB++BturZ+yIIQrxeNlVb+5K NagiNLrRb1mSehlWH4aRKvd44E7gYK7GOshVc7+tbSgkaDKSvwT+uVR5Lan0vbah/HA6ZwvGBFl
 /UJGpyzoOzmTHQJVhL17siCG8P3S38wIzr5fL0IjsfJXGfboUMFlefa8jeEsLhZQs/0X/wMT/JX jQoECyHX/+7xfPs76VV5Mhoycmu7LySbkCgPZ0hCq2L+izquCbLpNVHJr4wGlrjUh5qUQj3yk5f h2Dq/q1TTca+Ko7bI0kDKpYeeqlEl77GB9EJr8OB2qE1rXxNrLJz+uj4AO3CAf2Az4cnUTS9RUP FlU72Vlz
X-Proofpoint-GUID: e4zbjq3sPPPXd8-Gv_uNnBMuimgbrRFg
X-Proofpoint-ORIG-GUID: e4zbjq3sPPPXd8-Gv_uNnBMuimgbrRFg
X-Authority-Analysis: v=2.4 cv=bchrUPPB c=1 sm=1 tr=0 ts=68baebf9 cx=c_pps a=ONFZitE3lwABM3c1Gptufw==:117 a=peP7VJn1Wk7OJvVWh4ABVQ==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=y9YUpebZf6kA:10 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=FUbXzq8tPBIA:10 a=8b9GpE9nAAAA:8 a=51rfkhjShckfMbWNDjAA:9 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_04,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 clxscore=1015
 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0 malwarescore=0
 spamscore=0 suspectscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300250

On board stm32mp257f-ev1, the propagation delay between eth2 and
the external PHY requires a compensation to guarantee that no
packet get lost in all the working conditions.

Add I/O synchronization properties in pinctrl on all the RGMII
data pins, activating re-sampling on both edges of the clock.

Co-developed-by: Christophe Roullier <christophe.roullier@foss.st.com>
Signed-off-by: Christophe Roullier <christophe.roullier@foss.st.com>
Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index 5ac9e72478ddd..4b4347241e30a 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -16,6 +16,7 @@ pins1 {
 			bias-disable;
 			drive-push-pull;
 			slew-rate = <3>;
+			st,io-sync = <4>;
 		};
 		pins2 {
 			pinmux = <STM32_PINMUX('F', 8, AF10)>, /* ETH_RGMII_CLK125 */
@@ -38,6 +39,7 @@ pins4 {
 				 <STM32_PINMUX('C', 11, AF10)>, /* ETH_RGMII_RXD3 */
 				 <STM32_PINMUX('C', 3, AF10)>; /* ETH_RGMII_RX_CTL */
 			bias-disable;
+			st,io-sync = <4>;
 		};
 		pins5 {
 			pinmux = <STM32_PINMUX('F', 6, AF10)>; /* ETH_RGMII_RX_CLK */
-- 
2.34.1


