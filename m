Return-Path: <linux-gpio+bounces-30931-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KK0oNPpUcmnpfAAAu9opvQ
	(envelope-from <linux-gpio+bounces-30931-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 17:48:58 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E516A489
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 17:48:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 68637309EF73
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 16:38:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC4A63F6AA9;
	Thu, 22 Jan 2026 16:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="XwUtQDyP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3823F5DBE;
	Thu, 22 Jan 2026 16:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.182.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769098830; cv=fail; b=Kufk0ISdW7zYwaXposWeKONm+V3NJqkPXDmyoOPptzz0chc8t1QhWSm4ZamYQt0DqfST0c12i5QJ8dvC0xN804pWReTOo/SsOQvnEhM8dAsWGEerfkf+AXhUI/g33gDzSCDFHSGbpmcYg6lRUWoXEklmuTymvFLERLW1zkI7ft8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769098830; c=relaxed/simple;
	bh=kWxnJDYO9AftrrNNS1t08lSBPaz4Xh10odqD9/Zoyuc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=KIhIESVBMgzkziG7kLzPNO8qbdLuAYLUFL23vtFM+SPpTZH7UScx/GXsvQJ/hwuA8rMawwFoCyeVKs7drgAN+dB7shp9dvexCLFKPmfwdcChE/rhvuD4jz+onnjpL3MOPSqjHbgUoOV5cIWUbAu4wtMX3x/DS30ti+mkB54QctY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=XwUtQDyP; arc=fail smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60MGIYsp1516258;
	Thu, 22 Jan 2026 17:19:45 +0100
Received: from osppr02cu001.outbound.protection.outlook.com (mail-norwayeastazon11013000.outbound.protection.outlook.com [40.107.159.0])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4buh90ssm7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 22 Jan 2026 17:19:44 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I2uuWBcnwIULUesQR/JjDJW+LzFGPcbE4Ij3MwoS52aM4TTy13sRZTVO1BbMfOPuunF0dgSd9ibXFqyEtGAR8MMB7TOrqKkb89Q6j933bExOqf6EnYnLp14gI8xoOtSpMBgOyUVJphv4tG+AJw2wR7nV4yWLcPXJQluixYJprGqMsrUXXqmSmeDkKWGftG3vJ5caSS06IHm4EDcR5v5aGLs3X9J0C8s92HzP+fZpqGsv4Vw771sXPrrHn6Bl8iF3SWAkonfewz/DUXkWGYAvUT3atu06ihMAfh22yRg7xB2U/abPWivduGseHXm9Qq4uovnRfmMCSqjiUmYbLeZi5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=srWL9bt58H8X54p4YAG4fjaV9EEKOcR5MTMc7HXPiu0=;
 b=oNMVlZzQ/5oxZz3ys6eCKR6kUf9asutm+nPvQPEiA+2aKbUDdJJPuPSqf2JOk1882R3w11MbyS2Seyn6K3JO83oMDc64gpX65IOUeFaAocHnBB8EAG0h+N2e8GTCkgduUZPt/j6zw8WnKqUz+G6zQAcbo9kNBmQ1F8OoCOymKNZLWeLusdyMflYIEDdBDPHdOysShS7r0jGdmZvA+hltdtAU0mIGSpEC4UhrNwknWLjd5YImN9n1IhSokDAhEUHSN0etgybPYeNk+cLQZyozzd6cbFogkzDg1/zadnNyiB488xi5QEPdyy2kJB4cmBGWXFCg5woE92jiOx9P3yb5hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=srWL9bt58H8X54p4YAG4fjaV9EEKOcR5MTMc7HXPiu0=;
 b=XwUtQDyPpzK3MZ/HB+1VActGMzp58mi/pvkFzI7iFbY0Zs0ZM4WJgcO+WYhHaKraXR0O1sGXsks0F8RC6h605MMLxIaln2ogdQ10GgsSVOxyL7rJEl8p/1znfBC/ycQFde5gQMifcxhkndg/R05g736NANMxexvjlmEt7ULkVPuxhvoLCNgecti0q/aF1Dc/C+6uybapsKyLuTn47igFma9TlI/UeUYCe9AXurCjbWCzGT69+Mrfx9DpznFV83cpN/mR4quMBowQdZVGsnXSqeYKd09sHIbkw+hgiU+I/O061YGGLaVkZ+8RNQsdE83WoOaygsytXG3zkhrJI91DBw==
Received: from DU7P194CA0008.EURP194.PROD.OUTLOOK.COM (2603:10a6:10:553::25)
 by VI1PR10MB3503.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:13e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 22 Jan
 2026 16:19:38 +0000
Received: from DB5PEPF00014B9C.eurprd02.prod.outlook.com
 (2603:10a6:10:553:cafe::be) by DU7P194CA0008.outlook.office365.com
 (2603:10a6:10:553::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Thu,
 22 Jan 2026 16:19:37 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB5PEPF00014B9C.mail.protection.outlook.com (10.167.8.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 22 Jan 2026 16:19:38 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 22 Jan
 2026 17:20:58 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 22 Jan
 2026 17:19:37 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Thu, 22 Jan 2026 17:19:14 +0100
Subject: [PATCH v4 01/12] dt-bindings: document access-controllers property
 for coresight peripherals
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260122-debug_bus-v4-1-28f0f2a25f2c@foss.st.com>
References: <20260122-debug_bus-v4-0-28f0f2a25f2c@foss.st.com>
In-Reply-To: <20260122-debug_bus-v4-0-28f0f2a25f2c@foss.st.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan
	<leo.yan@linux.dev>,
        =?utf-8?q?Cl=C3=A9ment_Le_Goffic?=
	<legoffic.clement@gmail.com>,
        Linus Walleij <linusw@kernel.org>,
        "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        <jens.wiklander@linaro.org>
CC: <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Gatien Chevallier <gatien.chevallier@foss.st.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B9C:EE_|VI1PR10MB3503:EE_
X-MS-Office365-Filtering-Correlation-Id: 96256049-793e-403d-baaf-08de59d20a62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aXcxWDVHNFZGa1JaUXVoYkZxZ1Z1c1I3VWRaWXlTNGFJc3dKeGFlZHk5NUpz?=
 =?utf-8?B?WG5JYktmc2REYWxDZUkxdVk2WExUWlIyTnNjRkZ0WThsMEJrVy9mMS8ybUE2?=
 =?utf-8?B?OTlGMkNJVWZEeFFjNUI0ZnUyM3BxenBWaktOeFRJSWg5VjhwclJERXhZS3A5?=
 =?utf-8?B?eVNiNXI3ek5keUZ2anBEQmNvZ2NBKzlDSzZkVndIZEE4SE9SZHNpWjhGRVdt?=
 =?utf-8?B?RW5hNEdUbXBJV0lkSHJmZGVCZEFDSi91c1UvaTJtVTdQMlA4eXdkZGFoMXZG?=
 =?utf-8?B?VmdmSCtRZ3QxUmdDVzR0WlVCdUJVNjZoanluN3A0N1BydDNRZTI4VWFBdFV0?=
 =?utf-8?B?ekRsZXg4Mk5pQnArU0E5TmNwQXJkVmJQTnR0YXJrRzNRbjRoMUFoSmhDY1px?=
 =?utf-8?B?b3hobGNMeTUxbjdsdW9CSUNqdnBVaFdjRGV0dllZaEg4cjV5ZnI3amc4M1VD?=
 =?utf-8?B?RG9lVEl1M3RGU0ZaRStWZXJ4MTJpOXBqNlFvTjFDWDc0V1dob2pybDQrRnBq?=
 =?utf-8?B?Tjhob05OV3kyNVV5MWJ5OVhMaGVzaldjOEJTT2dGMjBGRkczUVY3bEorVTFJ?=
 =?utf-8?B?elJQMDJkUEJHV3NlMlRrRXlJaUpiZnlnQTVYMmNnUHBWVnhJdndqNTNEOHJC?=
 =?utf-8?B?bjdQcUx0MkRENUllT2NubjVUL0RzMHBqTEJVTVQ4THo4dklKQ2xieGtxY0di?=
 =?utf-8?B?VDlWcnd3cVo1dXN5Z3ZUZzRrek5KMU5tVThpcyt0OFJHVnJYSDdmTHVtc0Z4?=
 =?utf-8?B?NVp0L1NDTGxDTW9ZeFl6UEVmckJVZDZ4V29qSlpUOFM4UEczSXpYKzJnZmtX?=
 =?utf-8?B?alBMTGhNU2hUQzhZMERqV1hrUEJlVDFnUW9LckErcjJpK0VOYkhDNEptWjNz?=
 =?utf-8?B?TGZsZ2J0K011Lzl6SDZlcVpGem1qd2ZsVHRMNHdTTnV0Rm1KYnVIeksvTVE3?=
 =?utf-8?B?Vzd4M1grQ2VPdXFnR1R4UGxTckVtN1lhb2NtOUVMakZOZFV6dUlnaSt2NGdk?=
 =?utf-8?B?OHhIU280MTNMLzFjdHJvUHNFSFVOWW5uek9RaGZwdzVBQ3BsSXFMOW9uT1ls?=
 =?utf-8?B?ajZZaS9XTHhNQm1pYXdvK281K1ZOMWQ4ZXY3ckEvRFdYc0w2cXRnYURVWThl?=
 =?utf-8?B?NVVkcTZmRTBmdnNuMjdYalh3akxrOGpybGNzM1FBekpIdUV0QklMaEhONUJF?=
 =?utf-8?B?REFMenQybDk3VWU5OVlUQlErVmVyR0thQ2MyRDJBVHUzdVBjM2kwbE9ocmRs?=
 =?utf-8?B?UjVHSE83QmZ3NFZwR2M5cWpKUlF6Szh6SmFZb3lpRm5pVFA0VWxzN3BxbmNT?=
 =?utf-8?B?MkpYcUo5SWxzNyszYzdQTWlKWHVpMUV6SHZ6QVVOeHBINXFmWERTT3NZQjc5?=
 =?utf-8?B?Nzdnd2VYcXovWXNaUTBiUHhMMGp4NFdDdTFmN3BQL3dPZXIwN2F5QTZZZDVk?=
 =?utf-8?B?Qnprb0RUOVlDSHBCamM1bmRpOFFpQ0wvK0hBWXZJbENNYjQyNzFsNTZqdXdQ?=
 =?utf-8?B?RHBUU1NjSWU3RmlnK3ZJSm5neFlUalVDSS9Sc2VMSGlseVBDM1lNMDhBN21B?=
 =?utf-8?B?ZFl5MUdYY3dyb2RYRTRaZS9CdmtVNStXRzR2OGdpVWw2ajhSa1dUcWlsaWNp?=
 =?utf-8?B?TWdzdTNib3VBd2R5YkZ4dU1XUnhHZnBTMFY1elM2MzBlM0p4YS9sOGs1VjZO?=
 =?utf-8?B?QTc5amtwTmRRKzYwUEladWpjcVBrMGl2VXZQbVRxcFF6YjMvNXhLdHcvbjRG?=
 =?utf-8?B?NWZ1akxTOUhxTUdWY0lOOXNmN0hIYUtTcEZGYmpzbVZzWGMzV1I4TjFvTjAw?=
 =?utf-8?B?b1l6UjA0RmVxRldBT3JuWi9nVVRSNTFlU29NTHJtNmM3ZStJR3RYcUhUYWRw?=
 =?utf-8?B?YmJuN0tIVERoRUJtNWZ5MVVWQTFKVGcxTVJzQS8wSjNnTXVYUVphZ0haUG9v?=
 =?utf-8?B?STE4eDY0Q1QyWWV6aGYrZ1NUdXpXS0dJVGNKeFFFVXVsZmlITCtaYVdzK0tt?=
 =?utf-8?B?bzVzK3JwTytCL2VEU0FENnE0dXlPd2VzSUpzckpJSnZQRE9zN2hEWDFXRDNl?=
 =?utf-8?B?bUg1UHZYeUhHWGpRaitsU0ZpNnlicUpIMGs3c1J6bGlleXBhUEg1YlJYSmRK?=
 =?utf-8?B?eE51M0dkYTgyM0t0OVBCQlA5QzFMTVFCNTJsU2dCVWtCT1Z0bU9lU0p3NWZY?=
 =?utf-8?B?Y3BIS1ZiS0o3aVF2RzAzakdqZHpvTFppUXJjbk4rQ0w2ZDZRWVVKU1hOZldE?=
 =?utf-8?Q?VxGU3HIDD1BNCVRMeO9OFTwq7Pp1el9259PwEw8us4=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 16:19:38.4295
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 96256049-793e-403d-baaf-08de59d20a62
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B9C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3503
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDEyNSBTYWx0ZWRfX0ZzPedDpnt1q
 69IOwlX880CLwOuL1Nb4qU8/YyAUz2/ihJlrwf8JoFte7CZH/zXZKlx0r/8rZicedACF2sPDBy7
 S+QWBpKOlDhLAwo7cuiU6y3GcE0nB9yeI6bU7RGR4KkBZ5lJN41L8bgZEi9CLygkSfqp8h4Cz9S
 GGHj3PVDqNrgxIUpK48myaF+GRQ/8xO6P4TO2qvDEhCaw56fqSK1kOn2Twv7H0NyDF/ZxScASGc
 0L1GBi4CQhj2ibO/zfGXlCdNKL14LlDt32F7WJNdPMlfBVw+EOMZJe3OQ4gTKX0v7x3Ry0+yH2B
 CjLFPUKYV90pM4VUu7bKjtoZiwP47m76forA1e9KX7H1RlXv4SV/NmJGJHXIWr9gcCCfWN2kbXp
 XwQjQm3QnIUVWdHTb9JBPCwqoCfazcAb3xvdlOJAjA6ZwPz92hPoXaS7WfvRZ/aaw0Mglis1joD
 kkZStqyv7Qr4Iqq/DXQ==
X-Proofpoint-ORIG-GUID: LGTEZainu_V0ObD7Xs37UOkzbmCWPAb3
X-Authority-Analysis: v=2.4 cv=GbEaXAXL c=1 sm=1 tr=0 ts=69724e20 cx=c_pps
 a=896zWVB3lkap0gFnCg6oog==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=rg8MelPR9j8A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=VwQbUJbxAAAA:8
 a=zA8jFupHd_524mN9yHMA:9 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-GUID: LGTEZainu_V0ObD7Xs37UOkzbmCWPAb3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 phishscore=0 malwarescore=0 suspectscore=0 spamscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601220125
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[foss.st.com,none];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30931-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[arm.com,linaro.org,kernel.org,linux.dev,gmail.com,foss.st.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[foss.st.com:mid,foss.st.com:dkim,st.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[foss.st.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gatien.chevallier@foss.st.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 37E516A489
X-Rspamd-Action: no action

Document the access-controllers for coresight peripherals in case some
access checks need to be performed to use them.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml           | 3 +++
 .../devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml          | 3 +++
 Documentation/devicetree/bindings/arm/arm,coresight-etm.yaml           | 3 +++
 Documentation/devicetree/bindings/arm/arm,coresight-stm.yaml           | 3 +++
 Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml           | 3 +++
 Documentation/devicetree/bindings/arm/arm,coresight-tpiu.yaml          | 3 +++
 6 files changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
index 2a91670ccb8c..949444aba1f8 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
@@ -128,6 +128,9 @@ properties:
   "#address-cells":
     const: 1
 
+  access-controllers:
+    maxItems: 1
+
 patternProperties:
   '^trig-conns@([0-9]+)$':
     type: object
diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml
index b74db15e5f8a..b0693cd46d27 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml
@@ -78,6 +78,9 @@ properties:
         description: Output connection to CoreSight Trace bus
         $ref: /schemas/graph.yaml#/properties/port
 
+  access-controllers:
+    maxItems: 1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-etm.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-etm.yaml
index 71f2e1ed27e5..10ebbbeadf93 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-etm.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-etm.yaml
@@ -118,6 +118,9 @@ properties:
         description: Output connection from the ETM to CoreSight Trace bus.
         $ref: /schemas/graph.yaml#/properties/port
 
+  access-controllers:
+    maxItems: 1
+
 required:
   - compatible
   - clocks
diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-stm.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-stm.yaml
index 378380c3f5aa..f243e76f597f 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-stm.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-stm.yaml
@@ -73,6 +73,9 @@ properties:
         description: Output connection to the CoreSight Trace bus.
         $ref: /schemas/graph.yaml#/properties/port
 
+  access-controllers:
+    maxItems: 1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml
index 96dd5b5f771a..9dc096698c65 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml
@@ -128,6 +128,9 @@ properties:
       - const: tracedata
       - const: metadata
 
+  access-controllers:
+    maxItems: 1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-tpiu.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-tpiu.yaml
index a207f6899e67..29bbc3961fdf 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-tpiu.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-tpiu.yaml
@@ -70,6 +70,9 @@ properties:
         description: Input connection from the CoreSight Trace bus.
         $ref: /schemas/graph.yaml#/properties/port
 
+  access-controllers:
+    maxItems: 1
+
 required:
   - compatible
   - reg

-- 
2.43.0


