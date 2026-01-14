Return-Path: <linux-gpio+bounces-30533-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 70587D1E10C
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 11:31:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BD4273018388
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 10:31:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A9FE38B7C3;
	Wed, 14 Jan 2026 10:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="iFzPBeZU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8142738A9D1;
	Wed, 14 Jan 2026 10:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.182.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768386680; cv=fail; b=hj8aK1YYPJqynf8P40LcTUMMuOmKXoKjqS+irpNxWqvuhHPG9VfjPmJDXrdT+Owi/80+492VdcPOFm6ibQsgWDikkv66PNM6hB2S623MBOkT74VYv1DfmqHc9sX3EViaRaa0Npwr7p3mRBb5i8RtQHuKBxYg+Ts70UPhadOaZ3g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768386680; c=relaxed/simple;
	bh=xbgh1CCIgcEFj9WeothPqUmM2N2sWTN9TRalHeX1drc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=o2yCife/m+OjU6J21yT5RlwS2xybaAJZsj38NzDb61v2qMZxo3MtfU4DNrH7xzjOuy7yzbehOD2Moe7eoQs3EQjz8oARZy7vMv+cY/RvNdqOk2Jhp+YPX1k0tV0DwXyV0mCUdC/4luKxBqFZ0fLG9SWik2xMzcUz9znJIOqvYlY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=iFzPBeZU; arc=fail smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60EAGZu53425662;
	Wed, 14 Jan 2026 11:31:02 +0100
Received: from du2pr03cu002.outbound.protection.outlook.com (mail-northeuropeazon11011063.outbound.protection.outlook.com [52.101.65.63])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4bnsudk1wf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 14 Jan 2026 11:31:02 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BG5WsSlbT7wl9j8rteV170s5LD/mvDVbIBSL63C7D7Os5xYgNBPuHt2+OenZklfxK4GAOXFB+9s+0fgASCg9SqZEDMfQhN1Sf4szseKOyrxMkcaD2HdrLcejeZTNHjPLEbFNT9bU3k7Ljp+6t0+Pr7WNcimhbMoqrOpIyAZmcT0QGm1E9JaD+KS6SRuci+SPtvP4JmUKVhZHTqXDhdkmmi2nhrNP0fda5gqJCDWgESma55nO4iu0jjsUoICL6RnfuHx3Le4aaksuutklGqY4/OQ3Fjpi40bi+RwRgBeVPEZnF/meRKt3+3Pc1l063xBjlzbrF6Hc5xsNiit9SRgDVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bwxk81WusWTFK/a9r7vinmm1wcowOubfgfecTr4+eB4=;
 b=cRka3bNwArlu5F+TWNeuDBCqRVs69TeHXDM/p0yyakyAbU1ciCXBjXpU/cHFJULOnkHqc34dyGCwMRYstEuV3zbdIRGFpWbRcVR3o4KX+7ti3YyuOghJDPD/8q4MqBE0nlDBAjLvXRSfxpNnwnsgpw1ja8BV6Y8as247w+WAPN61ub30KF1Bz2PNYrConp97H7oR0LEuIyZgkajYrn1UdmacrmXFn3Y+tQyYQLC70AGvhAEBMeF0qvY7QoLXpoGeYhB/qV5g+N9Z6grtuTuRoMgHbqLk+0b/CSrOFWDD9yG7f+LXyPXPjXRXP9oks64mt0vrxPcSDPGqbhSL0fBfrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=linaro.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bwxk81WusWTFK/a9r7vinmm1wcowOubfgfecTr4+eB4=;
 b=iFzPBeZUBpUmvFSZPuznHEpXgO+HwxfI9fk/81xlSgmiGtRhnTc3D7fscRCGtsyWnyhpj2YpRwW7JEg6tmfcK4ISAb6wO4G06QsnjCITR1NevZy2EQuIW6JYJ/LJstUCOguNxnj6JeNphTwBrefuxD6IoiMVjp9eY5+Tgd8fMjcez53CQNEqBg91+PgaAfjcw7jwNvp5dmtC6lnBQMwdL5+OBK3mf/LdiTsXuInOvusAD1zTVF51zwNVn0COSE2UzPiTF+/dCdckwRXXFBt+/4rahbeX959iUPLd8WrGD4Cggk2eosIuqJp4N5Cj8LPzeswiRup/MVkZoUaN4/ypdA==
Received: from AS9PR06CA0058.eurprd06.prod.outlook.com (2603:10a6:20b:463::32)
 by AM0PR10MB3297.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:182::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Wed, 14 Jan
 2026 10:30:58 +0000
Received: from AMS1EPF00000047.eurprd04.prod.outlook.com
 (2603:10a6:20b:463:cafe::eb) by AS9PR06CA0058.outlook.office365.com
 (2603:10a6:20b:463::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.5 via Frontend Transport; Wed,
 14 Jan 2026 10:30:57 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS1EPF00000047.mail.protection.outlook.com (10.167.16.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Wed, 14 Jan 2026 10:30:58 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 14 Jan
 2026 11:32:23 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 14 Jan
 2026 11:30:58 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Wed, 14 Jan 2026 11:29:21 +0100
Subject: [PATCH v2 07/11] arm: dts: stm32: enable the debug bus on
 stm32mp1x boards
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260114-debug_bus-v2-7-5475c7841569@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: AMS1EPF00000047:EE_|AM0PR10MB3297:EE_
X-MS-Office365-Filtering-Correlation-Id: 63e3367b-4da2-4f83-b3ce-08de535801f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700013|82310400026|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SlNrUXNwQUNQZFBKT0ZTMXNWMTFPSlRYUGNJR2I0ekxjN2V4aWt0NzdDYkpY?=
 =?utf-8?B?SW1FTlY2aXgxQ2FWMnI5YXNCcjJYQm5uSTEweVlvNUI3ZWdsTGhaUElJLzFK?=
 =?utf-8?B?ZHlJWnFGL2FoU0xTNGQ2bDEzMCttLzNuOW8yR04zbXZML01CVEYrU0d3ajBG?=
 =?utf-8?B?OExWam1ua0FwbERmeUNoR0I1WEo2OUZMdEg4Q3ROVklCTUtMalZLRXR3aHp0?=
 =?utf-8?B?V1BVQVNBVVFURUNOeHpVRTk3SFdtM1R1bVVSQnFuYlJPMTV4TmtpMWxxMVMv?=
 =?utf-8?B?eU5rUm1LK0R3bEkxZlFtVmtUU210RUZZRy9tVVY3R1U1Q1MxdFVkR0ZrenJY?=
 =?utf-8?B?cURIWHptYmZSN3hkdWNaYzZYa1FROEkycjVnRUx0YVVxczFNdFFUTlV1US80?=
 =?utf-8?B?UG1PK1VDWGJRKzk1UGRNdTA4bUM3dVZVaXpUWm1DMUMydWVSZ0cwOVVRSDVW?=
 =?utf-8?B?cENkVXlFRUJrWVAzMWJ5SFRPaVp0MUV3UWRBdE9rNlo4aHBFUVgrUUlKWjcz?=
 =?utf-8?B?MXUyQjFKaWtzY1Qvd1A5SWNNV0g1MVlVTHFUZXc4a0tFNjVISlozVmhBZERK?=
 =?utf-8?B?NDdKbW9DTGd5WHp1RjNVQ0cxbTRHYlQ5RWU0MzVUZUk2Y1VIRjF2MEJ0RDI3?=
 =?utf-8?B?bEFVQWcxdlBjR1NRYURyKzlidzEwRDlGZ3ZkY2xXeWs0d3plWEdBS0FKM3pT?=
 =?utf-8?B?VnBJSVZMQ1o0RDRQYVo1NmZCL2NRVXkxdkY3TFk5VTQ0elVXZGZkTVErQmYz?=
 =?utf-8?B?M2IwWGNNYVFudVhWcHpZNVBGay9xL2JqYVpvcjNsSU1KWGpyYXNaV2M3VUhS?=
 =?utf-8?B?UEQrZGtvdVpIa2ZBeDl0ZWhYak8xTVZqQzRmNFkvdUlOR0NXTlBlclVjalQ0?=
 =?utf-8?B?dnAxdVhJMmtORjFDOXJubTZyVm9ZOVVKS3Bya012TUJObkF0NjFHTk1lYlJa?=
 =?utf-8?B?MUxpNG1pc0tWOEI4SEZxVnNHK2ZGMk1HTFFncmNMakdDa0FoZTZXWkRFKzBH?=
 =?utf-8?B?bU5DcXpEOHd3andjWFFra095b2NNTGc4SzM4TE16MDB1U2tLUUpTRDByTU1H?=
 =?utf-8?B?Q21JNTVxUzN5Z0NuRWpWa3A1ZklFdjJvWlhVbTZnVUJSUkkvWWxnSy9JY0dG?=
 =?utf-8?B?NTlobDA1VkdFUlRQZjZTdlFxUnV5MzhzVmdQNnNpVjJJL3FEYkFTbERZQ1Zu?=
 =?utf-8?B?UGNIb1dSVFdaN1U1Z1RIUGN0UE9iTktyMmdMQzlBak00VzNwMkJCeVpSU0Vs?=
 =?utf-8?B?TTFYcE9LNzhZNklZZm9iQndpTGg2dFZSNm9UZE9Xd3F6OThaS2EyOEVPbmV4?=
 =?utf-8?B?ZEgzUmZST0lCWVE3aUJrQU81OW8wVHRHTy9CcEt4RWlUOUdCamNHZzJyeTdt?=
 =?utf-8?B?WEJNc0d5cW5Od2ZOT2dMWGZQWVFEdjZ1Ymx1NnZHbS9iUWNZWjhrU1BFVmht?=
 =?utf-8?B?M3o1OVNkTmM1QVVTOE91UHV4QUVYd2NrWWZhaWFNU1U5Uy90Z0JYT3piL1pP?=
 =?utf-8?B?VU82V3JoMktWQ1NYcGM3K0ZwR2tlcUhkYkwweGRsVnppdEpSa0Q2QU1RbnVP?=
 =?utf-8?B?Ny9MVU0rVkFieE1Hc2FxanMxczN4aFU3NUVTY1JKVHN4RC9mK1R2VW1YTnRu?=
 =?utf-8?B?Z3UrTHlHYkphOUJlN0RoZFp2VXV6NUxNNHJLWElDY0xYZGJRSzlGN0QvSXE2?=
 =?utf-8?B?dWFDdjY3cUQ3MlYwaEd3eG5pb3VGWkx3cmgvOTdKd3NNUnllSWpDNlJKZWJk?=
 =?utf-8?B?ZXBLWWg5b0hkU3ZlK21MUzNqdWovSFQ2cm9KeDNwdXpoZkl6SE1Vd01QYW15?=
 =?utf-8?B?eWVMdnVLYmVYNGJNZllURTd2cHpTTStpbHB4UmoxMitET2g2WmIwaVVKODZU?=
 =?utf-8?B?L1hKNktvNDF4dG9GbHNIbG8zZzRXYzFncUgvdG1RRW13aXFIcHczNGQyZTFj?=
 =?utf-8?B?TnRKR0ZsK3EwNHhVVnVMZUFqVjJaUFN5ZzhrSWdaSTRoaTczN3BTNytnTXVC?=
 =?utf-8?B?WGRkK1RnbDJ0MGppaUtvWXlOQXhSSHkzbXhIaTdGY1pCa0VPZU83Sm02M09L?=
 =?utf-8?B?YTFVVlNnTEJyWU8yRjExLzM1eWkwN1V1K3pLaUxReXlDWU1tVGRzVmJOQmo3?=
 =?utf-8?B?Wjd6end2WDhyYVZMd1djOGpOSDBRSXBtTDU5ckpFRmlYelBMeDlNMmhLemZv?=
 =?utf-8?B?MGpZQmcvUnQ4K0p6UE1RbGZDd2traTlXYnZLYlYyV1p2a3NHUnpPbWlTZ2Zt?=
 =?utf-8?Q?9Z9c3mFBPux8+EnrM5b8NzGVgPWPQeqmvsCECVYwLM=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700013)(82310400026)(1800799024)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 10:30:58.7284
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 63e3367b-4da2-4f83-b3ce-08de535801f2
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000047.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3297
X-Proofpoint-ORIG-GUID: tEvDsheBoQtjy1GYKEGEvWjqnGj0Iw8z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDA4NiBTYWx0ZWRfX3hpFD/At9VbT
 /jP5MumkP+aHr/lM2yF6P8NCQPrPeGNSBOtyLzZhykCB/zbMyU+dgnXF4Ga3KAKTgz81umc9cYD
 RytCbJvXW6UEwOVcGngnaI2QeAHlOetzRnveQTBEUgN14k8U27PqfScSbr920y+50+L0WJ5sOVI
 F11DgNODKAaJoMaROxdpm+I+NGwAb1APA2LiqwO2qfQxJU21I1aYMGLV6Bm4x4LAZOaATeZeB5k
 cZlYH+9RdITnpMiu1YbdTpZOjatbEEfcJrIGXG4SbdBZs5XBF9XhDzpg7ubKXZ8otxK5wAtKxA6
 W7fOG5fPPHicWOHZHxutA1HmIxQfKqH5yfmvb6o0V3Dz0prTmk4anq0QZzfSrsNo5KLi98T0IgF
 Gsi2FjUVUlNh8eOVI9cUF2x7aj9g9zy2cl2dqj0iCLZLdBuSmw0sHJnR1MZUnCki7z4j/e/LLOy
 gGzLe+hKvqNCqIc4qEw==
X-Authority-Analysis: v=2.4 cv=S+3UAYsP c=1 sm=1 tr=0 ts=69677066 cx=c_pps
 a=pFRPcDjQwgjs8gOseP4dhQ==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=rg8MelPR9j8A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=mOgyZ-Q4tP4zXMNofoEA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-GUID: tEvDsheBoQtjy1GYKEGEvWjqnGj0Iw8z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140086

On stm32mp1x boards, enable the debug bus so we always try to probe
the debug peripherals, if their status and the debug configuration
allow it.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp135f-dk.dts   | 4 ++++
 arch/arm/boot/dts/st/stm32mp157c-ev1.dts  | 4 ++++
 arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi | 4 ++++
 3 files changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp135f-dk.dts b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
index f894ee35b3db..ebc719797271 100644
--- a/arch/arm/boot/dts/st/stm32mp135f-dk.dts
+++ b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
@@ -174,6 +174,10 @@ &cryp {
 	status = "okay";
 };
 
+&dbg_bus {
+	status = "okay";
+};
+
 &dcmipp {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&dcmipp_pins_a>;
diff --git a/arch/arm/boot/dts/st/stm32mp157c-ev1.dts b/arch/arm/boot/dts/st/stm32mp157c-ev1.dts
index 8f99c30f1af1..e69c8e282c8b 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-ev1.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-ev1.dts
@@ -81,6 +81,10 @@ &cec {
 	status = "okay";
 };
 
+&dbg_bus {
+	status = "okay";
+};
+
 &dcmi {
 	status = "okay";
 	pinctrl-names = "default", "sleep";
diff --git a/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
index 8cea6facd27b..fe2ab07ea4a8 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
@@ -140,6 +140,10 @@ &crc1 {
 	status = "okay";
 };
 
+&dbg_bus {
+	status = "okay";
+};
+
 &dts {
 	status = "okay";
 };

-- 
2.43.0


