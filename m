Return-Path: <linux-gpio+bounces-30536-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F27D1E1BF
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 11:35:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 646B23020845
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 10:32:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94E2E38BDAF;
	Wed, 14 Jan 2026 10:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="I/Iq3yQA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3EE438B991;
	Wed, 14 Jan 2026 10:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=91.207.212.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768386726; cv=fail; b=aAjjnSYfdps9MK08bY4N3aE5ZGbVQ5WTZFnf1a3xgOdlTQ/EDrDPHOEVIFgXqBZWKAE0WeGrl+gR+AjXU/Pq0aYMFrLh+vaYuuquKnLymb9ZiNeLoxJSVJhAvG+sw0rmxNASbEiaVyCJURbli2XBSji4Jyp2H7f1Yzm6jAHdx+w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768386726; c=relaxed/simple;
	bh=YwuY3eV77TPcKFSrVhZROmKvyyKkyyvGJoV68rm43H8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=a+e55ZSeAaQh4echBHyYcvSINHzk+VuXY6TRT3bwneQyWlMqLLm5nfSvQTfovXpCFwMdsCTvbKK34hp6GauO7YP3003+OrKU9QWdwjc9SFPH0Zlii0BylwtHlhcMDlrfFjwCM4tbsrDarD3v/mGQ8VbgbFYlt/Um7C7nU4FAPqk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=I/Iq3yQA; arc=fail smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60EAPrum667054;
	Wed, 14 Jan 2026 11:30:42 +0100
Received: from pa4pr04cu001.outbound.protection.outlook.com (mail-francecentralazon11013071.outbound.protection.outlook.com [40.107.162.71])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4bnrw7369f-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 14 Jan 2026 11:30:42 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V7vS3EYG06HKQKf4qUgxfbhu4+jsWOCORgzak3B2QlChriUaZd7rMR+mAEX0/484E0Mi+S5I7FSM6T7n7Bub4dc4dBCCkD7ZmrqGHaoXaQRamUEONE3BQRjFHPM/KA/BY8eNS3AZ5bLP3sLoj0RFpkNqFz6p+RXLRmbusgNEAmEVKdsOxKC1wr64R1DPzXCoFb7odcoq6/RxPwZSeMtTHoeX8lhVuDvs/XNp0TNrNzBwnKnp/u4z8Iqe6cCxYoN3hjjn1FDoSy3/beHCHMLzg9VW3Og5c+bQxMMWkABY9EYdEeXx9lCKhyW3Mghw/JmlT/7y/yttKuMUlPOdSjOM+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q/jJ3nT9dPqpx2WOyU8sSZGS5YZ6LQrAiKlXrEYWtbc=;
 b=qrUPeaztjnJiLpPhYhUvODgLjsqFQCEB9IXcZC1DRL+0GNf+RD5FOFGjpXOOqL08kgbwwhUpEoFa6FRb4VFvwLBB9oeE8RcG9jZqkHuYmM2D0jlv6qzQWvqnnAM4VzdpCtK0SpoII4HBfJ7QTdelf2RPrIJfatHuuVjkcj6OxOtJxjtWP7iOTgPqBwVKQU8XGGTG67NZt7e+K+4/8SQj9cdmGkSiEeXKzVjg5Hv709IYqhPb6uve/ndMs80d/ktjJ5zRZFrxNHP2JCCztS+ybH5QzGJwhB/IaSEELC6ojScNgannaJufv01ozq1WyAO6E0GMgoGGMgwOkxrtq9d7HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=linaro.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q/jJ3nT9dPqpx2WOyU8sSZGS5YZ6LQrAiKlXrEYWtbc=;
 b=I/Iq3yQARyJC3W+mnlGV2cbtFTPDflw9mPXZ35oKOtzuegi5SsM+NddsmvSVQdSO1DZrJe60ZyKZqCm1kLV8GDU2YhJ/EziTXD9ab+KM5Lnmllqbka3bfwSgBfgrEAxJBvx39seq08OglMDBe+m0xIJaXskV/VAS5S9GKTwfet8JBfpR2R95TxMK+YEniS1tV0B1JiN2gmy6wCO1NSmAgh31xa9SFqV39XWMdiNrzzrQoRj4od1/lkvOpRkI8kP/j2OyPyhtdWPzO+A0HVGEwANdlFL9afiyKNdkpqsPOWi8F+7ZBum36ouAYyE/9xmKHKMQ+i0X02RNRn9yfQFxXw==
Received: from DU2PR04CA0352.eurprd04.prod.outlook.com (2603:10a6:10:2b4::23)
 by AS8PR10MB6674.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:564::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Wed, 14 Jan
 2026 10:30:37 +0000
Received: from DB5PEPF00014B89.eurprd02.prod.outlook.com
 (2603:10a6:10:2b4:cafe::a7) by DU2PR04CA0352.outlook.office365.com
 (2603:10a6:10:2b4::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.5 via Frontend Transport; Wed,
 14 Jan 2026 10:30:35 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB5PEPF00014B89.mail.protection.outlook.com (10.167.8.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Wed, 14 Jan 2026 10:30:37 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 14 Jan
 2026 11:31:54 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 14 Jan
 2026 11:30:36 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Wed, 14 Jan 2026 11:29:19 +0100
Subject: [PATCH v2 05/11] drivers: bus: add the stm32 debug bus driver
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260114-debug_bus-v2-5-5475c7841569@foss.st.com>
References: <20260114-debug_bus-v2-0-5475c7841569@foss.st.com>
In-Reply-To: <20260114-debug_bus-v2-0-5475c7841569@foss.st.com>
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
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B89:EE_|AS8PR10MB6674:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a548a80-1321-4583-4840-08de5357f53f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|7416014|36860700013|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MVBQTDNjUUZ6QktXTkExbjRUWTllalQzb3RFaGI4L3VnZ3VzU2VhY1hvNXJn?=
 =?utf-8?B?K3I2NTdpc3hkYnNMdFVvRm5YNlRNMm10SnJQeDg1R0JWUzRWbHZxeGZFZFdP?=
 =?utf-8?B?QkJTdFkxWVQ0MG9lSDlpQVhtYUdiSktUYjVpU3Q4Y3ZtN1h3VE1TbHp5YnE4?=
 =?utf-8?B?TkpoQnI3d1M4eUI0RVc1cjRjZEF4SG9NMjlONDBLckc5OGxYMWVZcnpCOU1X?=
 =?utf-8?B?VDRoSjVEV1VkVzdoWmxveDlHeFpQSlo0aUVtNVVUdVJpNmhITDFZaU5sS0du?=
 =?utf-8?B?L0lub2RUbmhPeEJtS3lpSzBUMjVsdGN0aXJRRXdwVkhPdVludTBienZaaTB1?=
 =?utf-8?B?UmRBR0M2WTUvekpwVElqMWxjWkRmU0x4Q0ppZnhZUWovaFZqUTZSK1RpK3Ev?=
 =?utf-8?B?YXdmbzhUL3JsS1pLbEN1N3BMZ1BaWFFpTCttS0VhVmVCZ1R6eGs1VUFjaHJw?=
 =?utf-8?B?RG9Fd2tXcU5yUk10NlNHSlZTa2RZVVB5VnMvcFhUZnFrWjVrdEZHMTZRcDAy?=
 =?utf-8?B?b0hhZkdNTGVkVU13WlBtWHpnNEllNmRETkFvbGYyYkdCRW5JWHpqN0JqdFR2?=
 =?utf-8?B?WlJUeTRwYVpzSVhYdzExUEl1NWFOT3B0dC9QT2pwbThqcXZpWjZDSks5UjBk?=
 =?utf-8?B?a2xjMmY4NDBVeDN0N1M2ZXlsRmpIMjBCeFM3V0ZuNVhIa0ZOaC9UL01jMW5w?=
 =?utf-8?B?NVIwbC9EaU9yTVZ3QVo0TTlXUGVRMU41K1JyUzN0Q0hOY0txcUYrV3UrbGg4?=
 =?utf-8?B?Q3lwS3pmaTZrM2lJbW0zRm5OQ1lOaFlUWkYxV3RlQ1Z5dmx3V1BwM1NBaVhp?=
 =?utf-8?B?NFA5KzRMQzBiZmQ3b1dJUDJPTkVlUFNXK2RENWJFK0Z1OFNxTTZ2RDJrZVNl?=
 =?utf-8?B?K1VkNk04NlFaNWxsOHk3Tm00QnM1dWVncE9BdkVFSVg5eWQzc0xLVlRaSkly?=
 =?utf-8?B?cTg3UzZBVlMybXREc2RZTzA0UU5rbU11WXpIKzBEL1gxaUQ3ZkEzZjVCeUlo?=
 =?utf-8?B?eHRHdzFiWEV4ejF4eC9Odjl3RjRxMHBJcHJpLzQ4ZmNGYU80YWZwKzZlTkJG?=
 =?utf-8?B?YUFRU0NucndUVVFQZ202OHE0c0FUQzBMTmlMeGZQRlIyM2R1MTRLejY0WmE5?=
 =?utf-8?B?R3FMazhIYVFuaEhjUThobEFmMENOK1NCb294L1ZlMFlGWlJCWWpnQnJieGtW?=
 =?utf-8?B?eEt2Q2Y3Z3hPcWE0WDJ3cHhpZlZnTTZZWDAxVkJ5Zmt6ak40NnNyR1J1K280?=
 =?utf-8?B?OW5UejlWMER3TEZRdDJOcXdWSUN6RmtFWisxTUtacFpYQTdVTi93VXlCUXZT?=
 =?utf-8?B?bXVKallDQ3ZEc3FKY3hCV29RZWthZ0k0VnJuRHptK05CdjhzNDdiaGk4T1pE?=
 =?utf-8?B?Skl6cmZOQXlidk1la0x0OVkxUUZ0cVlEaW9sNkdtRFhOaitiRm4xNTNOcElp?=
 =?utf-8?B?SWc5cGMxVHBBcTF6eDQvU0tUTU9aRXhZWHcyMTkzVlZBSHU2NW4zbVlYY3Q3?=
 =?utf-8?B?bTJFZmcvcTE2a3gzb2QwMyswU0R0ekFtWUNhdWY4YUVSaUxjc1hQcGduNTZp?=
 =?utf-8?B?VW02UVU0ZWltYkx2SzlLQ01tUFdZeUphS1RiWkI1Mk1iTjVucDhvU1FKOG9u?=
 =?utf-8?B?MTVEZXRtRFlnQWNhakFQVVdXQkdMS1F4aXBWVmZBQ1I2dzlwYTM5RExEK2xN?=
 =?utf-8?B?OGVJYTEza3dpenQ5cjdxUlJGMzczbEJ3UjBiVWwrWmFMcDl4MmtnUnVxZ2xX?=
 =?utf-8?B?Um9GcWdYeFdKRHZjUlJ0a0RpSG9MVlNOVHNJT0JSYWtMTUJNNUJFRXQrV3cy?=
 =?utf-8?B?a0tPZ0xxTURUZUNuYjFCcnFCZG9MNC9XUk9wTXBSZFk5bTB6Tkcya1BHbVFU?=
 =?utf-8?B?dmtCdXhYWTRmOXRrM3pyMlUwYnY5L0RLSkN3S0pyaGdsaHJJT3NZQ05UeVZQ?=
 =?utf-8?B?YkNPNmZQb21uSXJvL0cwdGw5SVE5eWpoWCtwaEZaaUJnb25mY3lRQXRIV3Nk?=
 =?utf-8?B?VGNNQkZ4Qm1wMHVYTVdPT1RsREVXcWNNOHJMKzV6TUVlcHlUV2JiaDdpTWY3?=
 =?utf-8?B?Q0wxNmZmeWw0NUJ2Rk1OMUlGTzQvcUtjQURMUjZnV1FTL1NHTTJqZ2N4emh0?=
 =?utf-8?B?R1NrLzQwQW1NQm9uNjVDODlTbm1zcmxzeGhVWmg1aTlyTDNpSmNPczVxU0U5?=
 =?utf-8?B?VFFpQWpBUFVNT3htNFhwUVB0ZmF1RnRCYlVBaDJRTmUrL2JrS1NFVUs3cUZs?=
 =?utf-8?Q?WCKQXcOERe/cvZekxG5CcQT/sykV64fueFVF/4bd0E=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(7416014)(36860700013)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 10:30:37.3829
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a548a80-1321-4583-4840-08de5357f53f
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B89.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6674
X-Proofpoint-GUID: 7VcXGfuOF9RGWiaGwjNZuC7MybE9mP38
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDA4NiBTYWx0ZWRfX1yfDu9VrMaQd
 w+x1zo+gHmAAzTQy7DbVOpi0E6+6EO+sZDCh3Lk0H1o8THH+R+32+RscoxNImfidIatmtOwX6IK
 n5cs2P5OqAEsHvmR+tDzheM5Lb4N8Jl7SBKbWotaWgNO9s474AwWqZ7oycNvSm9dgezLp/3BMKx
 oJoI0S962gsyTDdLZAM8dMBJ0QvEuPmOJWyiYV32aLi8MW5Za79+G9AD7Z6g15AmnrOU1GuofGr
 /Bx43T5XdQSE6ZQiOm8fSdqfQlVGW5a713KHV8uTcqABSAccTOEwVJvIlLV5O9fmoeXr1snP1A9
 4yJZA3AcyMtvLsZxoNAz1VHS3zNmjPgzJYG4P/n9hotHdZSGNUVcVoBR4lM50MCnqXBFcreoQXP
 oG756TKNFIMSOMMBFc+wGqS8Zb8zx1ed1PqwirOo1vJYbOoHrsYCSdXSpBf8o83TjcpeAi95wK1
 /AOCxKqDjf4S+SNrReg==
X-Authority-Analysis: v=2.4 cv=Sbj6t/Ru c=1 sm=1 tr=0 ts=69677052 cx=c_pps
 a=8CSg+QZuHuA1Ocjp6LTkAQ==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=rg8MelPR9j8A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=3L3Zm1D9LUX1ZMezbK0A:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: 7VcXGfuOF9RGWiaGwjNZuC7MybE9mP38
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140086

Add the stm32 debug bus driver that is responsible of checking the
debug subsystem accessibility before probing the related peripheral
drivers.

This driver is OP-TEE dependent and relies on the STM32 debug access
PTA.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 MAINTAINERS                 |   1 +
 drivers/bus/Kconfig         |  10 ++
 drivers/bus/Makefile        |   1 +
 drivers/bus/stm32_dbg_bus.c | 236 ++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 248 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5b11839cba9d..fd8390e02070 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24698,6 +24698,7 @@ F:	drivers/power/supply/stc3117_fuel_gauge.c
 ST STM32 FIREWALL
 M:	Gatien Chevallier <gatien.chevallier@foss.st.com>
 S:	Maintained
+F:	drivers/bus/stm32_dbg_bus.c
 F:	drivers/bus/stm32_etzpc.c
 F:	drivers/bus/stm32_firewall.c
 F:	drivers/bus/stm32_rifsc.c
diff --git a/drivers/bus/Kconfig b/drivers/bus/Kconfig
index fe7600283e70..c9be21d5dfda 100644
--- a/drivers/bus/Kconfig
+++ b/drivers/bus/Kconfig
@@ -169,6 +169,16 @@ config QCOM_SSC_BLOCK_BUS
 	  i2c/spi/uart controllers, a hexagon core, and a clock controller
 	  which provides clocks for the above.
 
+config STM32_DBG_BUS
+	tristate "OP-TEE based debug access bus"
+	depends on OPTEE && STM32_FIREWALL
+	depends on ARCH_STM32 || COMPILE_TEST
+	help
+	  Select this to get the support for the OP-TEE based STM32 debug bus
+	  driver that is used to handle debug-related peripherals on STM32
+	  platforms when the debug configuration is not accessible by the
+	  normal world.
+
 config STM32_FIREWALL
 	bool "STM32 Firewall framework"
 	depends on (ARCH_STM32 || COMPILE_TEST) && OF
diff --git a/drivers/bus/Makefile b/drivers/bus/Makefile
index 8e693fe8a03a..799724cfc2df 100644
--- a/drivers/bus/Makefile
+++ b/drivers/bus/Makefile
@@ -27,6 +27,7 @@ obj-$(CONFIG_OMAP_INTERCONNECT)	+= omap_l3_smx.o omap_l3_noc.o
 obj-$(CONFIG_OMAP_OCP2SCP)	+= omap-ocp2scp.o
 obj-$(CONFIG_QCOM_EBI2)		+= qcom-ebi2.o
 obj-$(CONFIG_QCOM_SSC_BLOCK_BUS)	+= qcom-ssc-block-bus.o
+obj-$(CONFIG_STM32_DBG_BUS)	+= stm32_dbg_bus.o
 obj-$(CONFIG_STM32_FIREWALL)	+= stm32_firewall.o stm32_rifsc.o stm32_etzpc.o
 obj-$(CONFIG_SUN50I_DE2_BUS)	+= sun50i-de2.o
 obj-$(CONFIG_SUNXI_RSB)		+= sunxi-rsb.o
diff --git a/drivers/bus/stm32_dbg_bus.c b/drivers/bus/stm32_dbg_bus.c
new file mode 100644
index 000000000000..9427d4da0da7
--- /dev/null
+++ b/drivers/bus/stm32_dbg_bus.c
@@ -0,0 +1,236 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026, STMicroelectronics - All Rights Reserved
+ */
+
+#include <linux/bus/stm32_firewall_device.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/tee_drv.h>
+#include <linux/types.h>
+
+#include "stm32_firewall.h"
+
+enum stm32_dbg_profile {
+	PERIPHERAL_DBG_PROFILE	= 0,
+	HDP_DBG_PROFILE		= 1,
+};
+
+enum stm32_dbg_pta_command {
+	/*
+	 * PTA_CMD_GRANT_DBG_ACCESS - Verify the debug configuration against the given debug profile
+	 * and grant access or not
+	 *
+	 * [in]     value[0].a  Debug profile to grant access to.
+	 */
+	PTA_CMD_GRANT_DBG_ACCESS,
+};
+
+/**
+ * struct stm32_dbg_bus - OP-TEE based STM32 debug bus private data
+ * @dev: STM32 debug bus device.
+ * @ctx: OP-TEE context handler.
+ */
+struct stm32_dbg_bus {
+	struct device *dev;
+	struct tee_context *ctx;
+};
+
+/* Expect at most 1 instance of this driver */
+static struct stm32_dbg_bus *stm32_dbg_bus_priv;
+
+static int stm32_dbg_pta_open_session(u32 *id)
+{
+	struct tee_client_device *dbg_bus_dev = to_tee_client_device(stm32_dbg_bus_priv->dev);
+	struct tee_ioctl_open_session_arg sess_arg;
+	int ret;
+
+	memset(&sess_arg, 0, sizeof(sess_arg));
+	export_uuid(sess_arg.uuid, &dbg_bus_dev->id.uuid);
+	sess_arg.clnt_login = TEE_IOCTL_LOGIN_REE_KERNEL;
+
+	ret = tee_client_open_session(stm32_dbg_bus_priv->ctx, &sess_arg, NULL);
+	if (ret < 0 || sess_arg.ret) {
+		dev_err(stm32_dbg_bus_priv->dev, "Failed opening tee session, err: %#x\n",
+			sess_arg.ret);
+		return -EOPNOTSUPP;
+	}
+
+	*id = sess_arg.session;
+
+	return 0;
+}
+
+static void stm32_dbg_pta_close_session(u32 id)
+{
+	tee_client_close_session(stm32_dbg_bus_priv->ctx, id);
+}
+
+static int stm32_dbg_bus_grant_access(struct stm32_firewall_controller *ctrl, u32 dbg_profile)
+{
+	struct tee_ioctl_invoke_arg inv_arg = {0};
+	struct tee_param param[1] = {0};
+	u32 session_id;
+	int ret;
+
+	if (dbg_profile != PERIPHERAL_DBG_PROFILE && dbg_profile != HDP_DBG_PROFILE)
+		return -EOPNOTSUPP;
+
+	ret = stm32_dbg_pta_open_session(&session_id);
+	if (ret)
+		return ret;
+
+	inv_arg.func = PTA_CMD_GRANT_DBG_ACCESS;
+	inv_arg.session = session_id;
+	inv_arg.num_params = 1;
+	param[0].attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT;
+	param[0].u.value.a = dbg_profile;
+
+	ret = tee_client_invoke_func(stm32_dbg_bus_priv->ctx, &inv_arg, param);
+	if (ret < 0 || inv_arg.ret != 0) {
+		dev_dbg(stm32_dbg_bus_priv->dev,
+			"When invoking function, err %x, TEE returns: %x\n", ret, inv_arg.ret);
+		if (!ret)
+			ret = -EACCES;
+	}
+
+	stm32_dbg_pta_close_session(session_id);
+
+	return ret;
+}
+
+/* Implement mandatory release_access ops even if it does nothing*/
+static void stm32_dbg_bus_release_access(struct stm32_firewall_controller *ctrl, u32 dbg_profile)
+{
+}
+
+static int stm32_dbg_bus_plat_probe(struct platform_device *pdev)
+{
+	struct stm32_firewall_controller *dbg_controller;
+	int ret;
+
+	if (!stm32_dbg_bus_priv)
+		return dev_err_probe(&pdev->dev, -EPROBE_DEFER,
+				     "OP-TEE debug services not yet available\n");
+
+	dbg_controller = devm_kzalloc(&pdev->dev, sizeof(*dbg_controller), GFP_KERNEL);
+	if (!dbg_controller)
+		return dev_err_probe(&pdev->dev, -ENOMEM, "Couldn't allocate debug controller\n");
+
+	dbg_controller->dev = &pdev->dev;
+	dbg_controller->mmio = NULL;
+	dbg_controller->name = dev_driver_string(dbg_controller->dev);
+	dbg_controller->type = STM32_PERIPHERAL_FIREWALL;
+	dbg_controller->grant_access = stm32_dbg_bus_grant_access;
+	dbg_controller->release_access = stm32_dbg_bus_release_access;
+
+	ret = stm32_firewall_controller_register(dbg_controller);
+	if (ret) {
+		dev_err(dbg_controller->dev, "Couldn't register as a firewall controller: %d", ret);
+		return ret;
+	}
+
+	ret = stm32_firewall_populate_bus(dbg_controller);
+	if (ret) {
+		dev_err(dbg_controller->dev, "Couldn't populate debug bus: %d", ret);
+		stm32_firewall_controller_unregister(dbg_controller);
+		return ret;
+	}
+
+	pm_runtime_enable(&pdev->dev);
+
+	ret = of_platform_populate(pdev->dev.of_node, NULL, NULL, &pdev->dev);
+	if (ret) {
+		dev_err(dbg_controller->dev, "Couldn't populate the node: %d", ret);
+		stm32_firewall_controller_unregister(dbg_controller);
+		return ret;
+	}
+
+	return 0;
+}
+
+static const struct of_device_id stm32_dbg_bus_of_match[] = {
+	{ .compatible = "st,stm32mp131-dbg-bus", },
+	{ .compatible = "st,stm32mp151-dbg-bus", },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, stm32_dbg_bus_of_match);
+
+static struct platform_driver stm32_dbg_bus_driver = {
+	.probe = stm32_dbg_bus_plat_probe,
+	.driver = {
+		.name = "stm32-dbg-bus",
+		.of_match_table = stm32_dbg_bus_of_match,
+	},
+};
+
+static int optee_ctx_match(struct tee_ioctl_version_data *ver, const void *data)
+{
+	return (ver->impl_id == TEE_IMPL_ID_OPTEE);
+}
+
+static void stm32_dbg_bus_remove(struct tee_client_device *tee_dev)
+{
+	tee_client_close_context(stm32_dbg_bus_priv->ctx);
+	stm32_dbg_bus_priv = NULL;
+
+	of_platform_depopulate(&tee_dev->dev);
+}
+
+static int stm32_dbg_bus_probe(struct tee_client_device *tee_dev)
+{
+	struct device *dev = &tee_dev->dev;
+	struct stm32_dbg_bus *priv;
+	int ret = 0;
+
+	if (stm32_dbg_bus_priv)
+		return dev_err_probe(dev, -EBUSY,
+				     "A STM32 debug bus device is already initialized\n");
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	/* Open context with TEE driver */
+	priv->ctx = tee_client_open_context(NULL, optee_ctx_match, NULL, NULL);
+	if (IS_ERR_OR_NULL(priv->ctx))
+		return dev_err_probe(dev, PTR_ERR_OR_ZERO(priv->ctx), "Cannot open TEE context\n");
+
+	stm32_dbg_bus_priv = priv;
+	stm32_dbg_bus_priv->dev = dev;
+
+	ret = platform_driver_register(&stm32_dbg_bus_driver);
+	if (ret) {
+		stm32_dbg_bus_remove(tee_dev);
+		return ret;
+	}
+
+	return ret;
+}
+
+static const struct tee_client_device_id optee_dbg_bus_id_table[] = {
+	{UUID_INIT(0xdd05bc8b, 0x9f3b, 0x49f0,
+		   0xb6, 0x49, 0x01, 0xaa, 0x10, 0xc1, 0xc2, 0x10)},
+	{}
+};
+
+static struct tee_client_driver stm32_optee_dbg_bus_driver = {
+	.id_table = optee_dbg_bus_id_table,
+	.probe = stm32_dbg_bus_probe,
+	.remove = stm32_dbg_bus_remove,
+	.driver = {
+		.name = "optee_dbg_bus",
+	},
+};
+
+module_tee_client_driver(stm32_optee_dbg_bus_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Gatien Chevallier <gatien.chevallier@foss.st.com>");
+MODULE_DESCRIPTION("OP-TEE based STM32 debug access bus driver");

-- 
2.43.0


