Return-Path: <linux-gpio+bounces-30852-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ALUHIM/JcGkNZwAAu9opvQ
	(envelope-from <linux-gpio+bounces-30852-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 13:42:55 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E90E656F56
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 13:42:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9BD519C2864
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 12:36:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 500B4481FAB;
	Wed, 21 Jan 2026 12:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="D4pC51TH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22208481AAF;
	Wed, 21 Jan 2026 12:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=91.207.212.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768998934; cv=fail; b=bb07OkLGKU9Tn+KWro6MTg5i6G9c2fA3djW1x3TT4zEIXKXsaGGLSahpGHOMfoeZKj+E13PA9K6PooXPZrL+3Ma6VYgasEo3cjOySqyjT2QfCZDT2bm/b2TdAExD2rVNmre6ROk6FZV72PEfvb+vPByOLeL0mOfqC475U5ppjGw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768998934; c=relaxed/simple;
	bh=ZaT2AuuGI/tW+bs/3INAx++P3p/pTbyh99z2D+oNgDA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=bGQMCChmoXwvPIgqNhzJjgpJYJeoe6p0Etj6hEodak/wGRc52p1prjQVsjhlcPnJIFYLkeN2aTTUmgYOuhVZYGUJc6KgUr06aWK2KhZ/AkK2mTbDXsdwB1loY2x7iQoEB0rR4jkYkURwvOsG7P3dEpfYC9VVZGIWIQNm7LrUHFE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=D4pC51TH; arc=fail smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60LCRhSS1991221;
	Wed, 21 Jan 2026 13:35:15 +0100
Received: from duzpr83cu001.outbound.protection.outlook.com (mail-northeuropeazon11012020.outbound.protection.outlook.com [52.101.66.20])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4btcn4uknt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 21 Jan 2026 13:35:15 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=klGgRPW8pxtzqqz5ghNzUAweg/BTXBFwyoZi8P+lP1fKWKEd7k5CgAyK8JJ0TCzrmPArUunPYGctiCru2pM0c2yZNYltlsQJ1Rhls4e7/KVyEkFN4QF0Q73x8dCPKdxOQwGZHh8Ju9B2PKbN+joSPRJZeDO273OaQjZt+mAdEJVnkjgW2+xS128E7HYuvLiqTbPM2JVOt8uwDov9KbaSDQmnm20KIRPuvVwJO7i+VPJQ5PhJg388NlqA/r29qkmSw8xsY32QAIFtrw3t6GKDxz1oqWnrBfBtIFAh2qWi2IFPgAdgQpMDmE+uNlIrpIMav0lVc2P0aya2xDluLeC6Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=97StyA7s2V+FwBdy7a0SiKzK3pkvy3JTCjITsQJc73Q=;
 b=pdBfTXeYT7bB0YCVubw2uA1VDrdrSAP3K2Cpt8iIZxEQvqrDsQh3bG538wbJifzA0igS9fAOi3bGAqIFfpiaYpg84+QSOee2Y6sl4lOUuaK0bN9l2uvjK1lAfza8p8EfjkhvXHgG9m54angjeDCI6p8lk4g3Fc6iiwu92DLj5G9W0/IH5frkMlEX6RmmByTegqzRN2fzQSJzKjMBsy5sGGtmpl7uJ9phFaLq0qbXMNGbx01o6RgT9ATrYW6i/fzOqzU1cV3xGJ6yirNUdXqo99gohlzkWtWc2rMsBU5yIeGyi4aH+5RD/OYJmLHs6qf4+Zi69/xMsFzRY3Uaf/TYhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=97StyA7s2V+FwBdy7a0SiKzK3pkvy3JTCjITsQJc73Q=;
 b=D4pC51THnpYTqL5yDZnPzBjpEBMVaWH6OffaY7UMUevbG0kLfFWPt8TFE3m0AjGQTV7phA8qRlC8b1ZKH0OLTN5vvqwkUUr0fqmkRZg3BqyG4bEwmHdYlnHDkGN3pQ4qZe3WMk5gqQioRuI3hIarL4XVEAxRq/v9FvrZOpxDGVAgQpLeRsVk8cJK4D0r2iybMp+DmB0uN4CryAeq4BKfIDAoLWr3/trhcd1UJ5CgfHr4OWHIAnkYXRUcBdUNCB0vMM4wbvuu//TSFfvx71xZDQNW3i/9YpIW7Q1+fzriDpF+60gl+hJP7ByBIJSS6RzaryOHR1XyX65I6ZxF81GKzg==
Received: from CWXP123CA0023.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:73::35)
 by AS8PR10MB7020.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5a7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 12:35:12 +0000
Received: from AMS1EPF0000004B.eurprd04.prod.outlook.com
 (2603:10a6:401:73:cafe::fa) by CWXP123CA0023.outlook.office365.com
 (2603:10a6:401:73::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.9 via Frontend Transport; Wed,
 21 Jan 2026 12:35:10 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS1EPF0000004B.mail.protection.outlook.com (10.167.16.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Wed, 21 Jan 2026 12:35:11 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 21 Jan
 2026 13:36:41 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 21 Jan
 2026 13:35:10 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Wed, 21 Jan 2026 13:34:37 +0100
Subject: [PATCH v3 03/12] dt-bindings: bus: document the stm32 debug bus
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260121-debug_bus-v3-3-4d32451180d0@foss.st.com>
References: <20260121-debug_bus-v3-0-4d32451180d0@foss.st.com>
In-Reply-To: <20260121-debug_bus-v3-0-4d32451180d0@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: AMS1EPF0000004B:EE_|AS8PR10MB7020:EE_
X-MS-Office365-Filtering-Correlation-Id: acbdbbad-7d7a-4adc-fff6-08de58e98516
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|36860700013|1800799024|13003099007|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Rm5ESit5UHE4cTI4S0xIa0dIZ05KdDcrYklQWC84cGJaM2EzWHB6MHJFMGIy?=
 =?utf-8?B?dzhKSC9TQzU0NmpIZXhlUHhubmtsd2ZaajVFVGdyWGk2amEzZnlvRWNKQ3Zo?=
 =?utf-8?B?WU5OWStmaE5VSlZXRlRPUFZVR2hnRk1zYVByYnNveVZCYTNpbkRiK2hOUGpj?=
 =?utf-8?B?ODFJZ0xlUEU5d1ZLWlF1TkFNTWszS0ZMNXl3VkFwU29VS1I5L0tRMGszTFl6?=
 =?utf-8?B?NWZrQnlEK05Ja1lUc29ITGlkVWtvRXE0Y0JQQjhhT2FYbEhuS3F4QUlHMTcx?=
 =?utf-8?B?WU9jaVloVkNNaTArV2VMSUxYbkJMOUpETW1FQmRHS2xmbFh0R3lqQUlFRWNl?=
 =?utf-8?B?Q3p6ZXQ2T2g2UElXUEFoaTRYL2pjRCtvTE4vcHBYaGdSMmNvdGdvYnZJWjlo?=
 =?utf-8?B?YjBCUG02QmZvUWhUSjJWR2RPcldRdEw3M1laWWRvTXBLSi9USURqNnJaTXNY?=
 =?utf-8?B?NEVtZnMxdXNwcjEwaTQ5TjFxYWlaWWtxSmZubU5kMENvRXd4cGlyK01jdFZq?=
 =?utf-8?B?V1k1dzl3dTJVS0tHcllIUHhXOU5nWEI3SktTc0pKSVNzNG1obHlkZ1VneWQx?=
 =?utf-8?B?U1V2aG9vSCs1aVV2T0FURmh4emNUWlRtVUpZSGUzazNmZ2srN2svMGY4TDhw?=
 =?utf-8?B?SGR1d1Y5ZTBySm5ZNEdwYmRvWkg3R3kwRDVTelZjWVBYcWRHMXpHYXQrbzdL?=
 =?utf-8?B?QUpuOWVGcHNraWMvMGYySHhSNm5Dei9ZcHRIdUVacktPR3AzdVMxYmxnTExH?=
 =?utf-8?B?M0lPR0FBb3V0b2hsYXJwS3dzdjVHK05tUStSTzZhMldublRGcDdncDhMR202?=
 =?utf-8?B?dTBxanpmTVo4WGlMTWV0VllKc1dXQVFtU3JBaFA1QmcyZnJ4cElic1hxL1dh?=
 =?utf-8?B?aTk5S3dHbS9LYlJ3eTN6UVptQzQzSE9BTkpSYnY1UEdDME1vUGdGdnJBNW5U?=
 =?utf-8?B?VUhNcFpEcHVCaG9PNVJ0OFR2Z29WRFVRbDZzSjVSYnlUc0xwTnpabGdzM0JP?=
 =?utf-8?B?YmpEV3ljN3BTcml6NktmN3U4VWcwdmRVaHQ2OXB1UDBFeGVPS1pZK3pkQUhp?=
 =?utf-8?B?WnE2QkZoWit2OTZkT0Rpbng5V2pFd1huREV1R1daU1c2OGxKTExXbytkbFpD?=
 =?utf-8?B?UXUxTlZnWHNqVjN2Z1pJMEo2bHpid3pFRWVGWXJpUjIwOEppNGx2UFpFTnR1?=
 =?utf-8?B?blJzUWQ0TnJicWN5c2xCRGYza3BtU01YVTBUQXFhSVJmNUIrYzBlWmovM3lR?=
 =?utf-8?B?ZldKMDV5a1lhNFVCNVZhbVZ2NktQOTBYcmZybktOM3VNOE43b2orYjRmY2xo?=
 =?utf-8?B?QlozRFVraXFFdEFZTUw2VEw0VEVFNFFUZ0RSTHB6bkwxS05wTzJNNmQ3L0pF?=
 =?utf-8?B?a3Z2Smh5VW9qK0hJaVFoelAyVzdQQW1UUlB3ZTViaEJHNFJpaHFMSW53V3Qw?=
 =?utf-8?B?TmNjU0tZTmExS2VCZ1hUSzZIL00rTFhaeVZ1TUFXSWlhYWNab1pCc050cWl6?=
 =?utf-8?B?TXRCRlp3MUliTUg2SzB4Ly9sbDVsNlZHMktsZCsrc1lGQWVpYXNoNzFrcTRk?=
 =?utf-8?B?MmpVSzR5cGw0MWMwTjkvN09RanJzRXdodTloek0xNGo2U1JkZ2YwK3E5NUg5?=
 =?utf-8?B?M0I3QkE3QlRPTE56emEvWTVkZ2dOY3RDNGFuVGt1ckxHN2ZJa21jNTVMUXAz?=
 =?utf-8?B?VWF2TnB2c0drZDVTVVFJcGlTMUZEQVA5WlR2T0ZmS3ZuRlRJM2lYMGhhNVVp?=
 =?utf-8?B?VnFFMEovTERTZ3ZqeGZjVEt4QXhEWXpOSW16bmdmQ3NlRWhwbzVKZ29aaEcv?=
 =?utf-8?B?YWJXTkxkNHNYS0c0bldpbVIzYUF4SjhidEJUT284NFBQUWpQS2pKMy9mamZm?=
 =?utf-8?B?M0Q1cE0xNklOYlJsdFRvY2g4dGlrcXJTVGZncGxqbFREc2R1Qk5uSEFkU1dQ?=
 =?utf-8?B?bm0wOWI0ZEVVM3hva3o4MzJnVzFUM0lBV0c1REdNUU9xS2RmT0ZrSEJoNzM5?=
 =?utf-8?B?Rm9uWWE3eFdpT1hPVUxIQzVuLzIvb2dVZWtjKzNtR1hUeUJpT2JMcDFMZzRJ?=
 =?utf-8?B?NDgvUHQ4Qi9NMjFaYm1WR2FoQnJEU2lnUWNaOG9jS24rcGFySVVKYzJ6bEk0?=
 =?utf-8?B?cTI5UVpYL2VlczlNTzYwSzVPN21pTlQ2Nk5qMENIWEswSTNSSyt0b09xSjIx?=
 =?utf-8?Q?2WgMl+UpRwwPI8VgIiHQnwDrlJuS4JC5ch7gU1INxdNM?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(36860700013)(1800799024)(13003099007)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 12:35:11.5790
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: acbdbbad-7d7a-4adc-fff6-08de58e98516
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF0000004B.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7020
X-Authority-Analysis: v=2.4 cv=Fec6BZ+6 c=1 sm=1 tr=0 ts=6970c803 cx=c_pps
 a=zBo0Hn18DklVKBP/19+Pqg==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=rg8MelPR9j8A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=8b9GpE9nAAAA:8
 a=nQXd0E9VhXsRxXXh0-wA:9 a=QEXdDO2ut3YA:10 a=sptkURWiP4Gy88Gu7hUp:22
 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDEwNSBTYWx0ZWRfX0yqTaA5xHEmC
 Qh3D6rbG867tbBIKJTnfNE4VcTc7Gam8Q5sBKUc20Zc7DdFxLGqA7rqQUnQxPpt2f8Bvt5UgN1O
 eGUdP5KSz5IeZ1z6V3NSClIRSZ70YVudhN/0NB0cndcFv0BVDGRCrypRy7CsN5pfPNJOusAAVqa
 /DH6nTfjdT9CElJEo8/XK+1jovWo5i86HYsol/UkPpJKg40qFkW7KxK+a8Gt+aud9J20Zw57lS0
 3s5HArCMdpm/ThOsmPwiABK88SOGXyIca0IO3sMcE0ANLruaElB1P7focbKzaM3iZORsntSNSXB
 b9XWZ/rMWSNkuozQGe3RvT/PJsveboT/FLppyP9bFDo+CP/Gny5+bkh1eXqzHOcuQ5P8gvVH8rU
 d78456U1FI6+tu+v1ENL367Y/Le1TKDwPmIPhX3gx3+55AaDKfeFmOgpaItQat+SckE1dPhe7N3
 njTlyyHNdN0nPkPLrJg==
X-Proofpoint-GUID: B9ZgHhk_V9sVZRiascUhuej21HuIryrN
X-Proofpoint-ORIG-GUID: B9ZgHhk_V9sVZRiascUhuej21HuIryrN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0 phishscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210105
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-30852-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[arm.com,linaro.org,kernel.org,linux.dev,gmail.com,foss.st.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[2.252.41.0:email,foss.st.com:mid,foss.st.com:dkim,st.com:email,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,2.252.95.176:email,devicetree.org:url];
	DKIM_TRACE(0.00)[foss.st.com:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gatien.chevallier@foss.st.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[foss.st.com,none];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: E90E656F56
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document the stm32 debug bus. The debug bus is responsible for
checking the debug sub-system accessibility before probing any related
drivers.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 .../bindings/bus/st,stm32mp131-dbg-bus.yaml        | 79 ++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/Documentation/devicetree/bindings/bus/st,stm32mp131-dbg-bus.yaml b/Documentation/devicetree/bindings/bus/st,stm32mp131-dbg-bus.yaml
new file mode 100644
index 000000000000..2db35e41e76c
--- /dev/null
+++ b/Documentation/devicetree/bindings/bus/st,stm32mp131-dbg-bus.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/bus/st,stm32mp131-dbg-bus.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STM32 Coresight bus
+
+maintainers:
+  - Gatien Chevallier <gatien.chevallier@foss.st.com>
+
+description:
+  The STM32 debug bus is in charge of checking the debug configuration
+  of the platform before probing the peripheral drivers that rely on the debug
+  domain.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - st,stm32mp131-dbg-bus
+          - st,stm32mp151-dbg-bus
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+  ranges: true
+
+  reg:
+    maxItems: 1
+
+  "#access-controller-cells":
+    const: 1
+    description:
+      Contains the debug profile necessary to access the peripheral.
+
+patternProperties:
+  "^.*@[0-9a-f]+$":
+    description: Debug related peripherals
+    type: object
+
+    additionalProperties: true
+
+    required:
+      - access-controllers
+
+required:
+  - "#access-controller-cells"
+  - "#address-cells"
+  - "#size-cells"
+  - compatible
+  - ranges
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/stm32mp1-clks.h>
+
+    dbg_bus: bus@50080000 {
+      compatible = "st,stm32mp131-dbg-bus";
+      reg = <0x50080000 0x3f80000>;
+      #address-cells = <1>;
+      #size-cells = <1>;
+      #access-controller-cells = <1>;
+      ranges;
+
+      cs_cti_trace: cti@50094000 {
+        compatible = "arm,coresight-cti", "arm,primecell";
+        reg = <0x50094000 0x1000>;
+        clocks = <&rcc CK_DBG>;
+        clock-names = "apb_pclk";
+        access-controllers = <&dbg_bus 0>;
+      };
+    };

-- 
2.43.0


