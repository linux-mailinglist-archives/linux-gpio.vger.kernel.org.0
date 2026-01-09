Return-Path: <linux-gpio+bounces-30333-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 49388D08C51
	for <lists+linux-gpio@lfdr.de>; Fri, 09 Jan 2026 11:59:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9BC5C30094B2
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jan 2026 10:57:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80A2E33B6EA;
	Fri,  9 Jan 2026 10:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="dYEp0AL/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D951233B6C6;
	Fri,  9 Jan 2026 10:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=91.207.212.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767956252; cv=fail; b=Lgc79oN7KAzrDERGrcCpldwe0I59FLTd3sRexNyLDncQMqw2secMtdBi5TNGC63mziHGHuGn4WxIuZyoXXpqboqyX+fxWkWvoZzpFAYrwmL8exaHrtqM4Yq8mEtL3EyyQdbVBSE2VQ/y/5yOeWbSu24u01YYB/YOgluzjd8Sp0Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767956252; c=relaxed/simple;
	bh=l6ZVfoWz5u4T3ZRCM94AGwRm1ba+4HRmvB4JiLZGWDo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=h78DhFQninzHiAnh0Hmt7e8sdjJscd8D50c1Xgx3cgN9q9pQFh5u57KZ8e+d0J07kFezI7frurvlU9neWKPwh4x1fC26UChD0Xz1SCN8bRgC02atN+O0UX0Yr7UzyaTJyrV/IeQAxcmwMMN1tgf9s5MvXHxdi7iQImR8I9zrYAw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=dYEp0AL/; arc=fail smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 609ArgRP010172;
	Fri, 9 Jan 2026 11:57:20 +0100
Received: from duzpr83cu001.outbound.protection.outlook.com (mail-northeuropeazon11012043.outbound.protection.outlook.com [52.101.66.43])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4bjv22130c-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 09 Jan 2026 11:57:20 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CPNm08efXutNGhL6Koqdh+TsxAEf4qqnbrtoagZbMDVzb5Ml2bfUySvU1irpP5nFy/1SemLSfNGcPGS3qUmJejQN+d8E7NTT27CSgGhYnPTn/OxLVWFzgjffCRsPrp1p52GHoImUHW1fwr2mUFIs0HyE7bdN6/CQRhXwDt7ZawL9bW2FnYRtjzcFl6Hl5Edr9fh9FOdl0Va5wI02sQzYDqco+7k45X2+CVlnQDDhR5Eb6qCwoGpsHIbeXpL27cuBgWi8vrOv72Jpl4eLm6gHV6FEot5yeN9FoTzxuptR9OE1uGuX3K9reD4W+Xq063UFynF4J7tKzkZyF2uXSS44Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qHqeqowr6oP0AigY5SnPMenINrDk1GkoRAg0SCMO7jA=;
 b=fdHG82bp3/bVtj4G2zmbrFlhxIyXJKVmN3tNrNKVbqmNIyIoAAzaX8Wa0cPamikc9a/iVvYsuZulqHwXQ1o7D56RCEdD2ZO4yeetuKXjy8A30AYYgSf5lSf94H4wVcam7+1wf6psxWK9BN9StUZaUe6H9CQppuYE6c25za0QY0dKZnyHAYM3tQfdXJcMt68HP51dOEztRz4cQBsyACctrRQphoFuKEpAHIB3j3AbEfgqzzgBCoBQh7he5zVw7VHMSPEH7dFuUkZjgbcLqzjjHtK9mAv0WMaJYjBvbemaXpDP7nj9r6yPRM8Dy3nxmWfgWCs/nqtoV5ykFG59e/SqsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=linaro.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qHqeqowr6oP0AigY5SnPMenINrDk1GkoRAg0SCMO7jA=;
 b=dYEp0AL/bQKuEn2C/tDzlcPr0xpTEtJB2H9PxGILYaykQBLOdUOoMPBB0m5opQ218JDgQfl1I7Q6VZ9vVwbCuKuTgkGjFx0KUOvn0RBbRQr08hPH+obpH2oxVRg7G/d5be5fyutIXMZMnZ+Wp6Hv9aWo6CyDTDkkVkMptaxp7YHkTjBTi2L8U8XgBM8lavYfTdyFrLOT+G2Q3CMfK2Q1QkokYsJBbIb/eQVDxa27BG/UcueFpSZor5qr5A3kd2eLIDN4VO9qAfkL1vyF5imtoT96zEefVBj4smmxSMNv++ZDTz4n+6lu5h6elzWPfsT8mwtc+EaVNR3hlTlrAJM0wg==
Received: from DU2PR04CA0192.eurprd04.prod.outlook.com (2603:10a6:10:28d::17)
 by AS2PR10MB7551.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:591::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.5; Fri, 9 Jan
 2026 10:57:17 +0000
Received: from DU6PEPF0000A7E1.eurprd02.prod.outlook.com
 (2603:10a6:10:28d:cafe::49) by DU2PR04CA0192.outlook.office365.com
 (2603:10a6:10:28d::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.4 via Frontend Transport; Fri, 9
 Jan 2026 10:57:00 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU6PEPF0000A7E1.mail.protection.outlook.com (10.167.8.40) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Fri, 9 Jan 2026 10:57:17 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 9 Jan
 2026 11:58:34 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 9 Jan
 2026 11:57:16 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Fri, 9 Jan 2026 11:55:08 +0100
Subject: [PATCH 08/11] arm: dts: stm32: enable CoreSight on stm32mp15xx-dkx
 boards
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260109-debug_bus-v1-8-8f2142b5a738@foss.st.com>
References: <20260109-debug_bus-v1-0-8f2142b5a738@foss.st.com>
In-Reply-To: <20260109-debug_bus-v1-0-8f2142b5a738@foss.st.com>
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
	<alexandre.torgue@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DU6PEPF0000A7E1:EE_|AS2PR10MB7551:EE_
X-MS-Office365-Filtering-Correlation-Id: a2d894f7-dd94-447a-770b-08de4f6ddac9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700013|82310400026|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TEx4WDQzTnpHRTZkQlJrYk4xbERnYnRRZS9HdnBRR096K2JkQWZwL01ZY1NP?=
 =?utf-8?B?dDVOc05LK2x0RUJ4UnkvQU5VTVJJalJaeUNNR1MwTi9IL2RGbFFQYUdBWjh4?=
 =?utf-8?B?WFZVUk4wVHBJMmIvcWhpaXpvMmg1Q1RiY1FmSFZyNU1OYjVRN1JYTHZ2cFd6?=
 =?utf-8?B?SFlCQlRXaXBsWEU5WGhjSFR0N2xiUExvU3hGUlRmcmF0WmZDTHQwenRtUk9y?=
 =?utf-8?B?RC9jeE1GQitNM0YxbUx0SkJOelBDaEkvNUNYU0lYK3I0a0VWY3UvKzNtNGdL?=
 =?utf-8?B?K2pWd01SNnZUNjVhZ2V0Z2plTS93S3JoT1IzNzNuQ0JxK09Oa0wxb0lOTFNo?=
 =?utf-8?B?OHN2ZjVqNmNQcFdGbDB0aEM5dktwR2x1ZGVHc2c0WVJCVE9Lb1IzOVM1VW1S?=
 =?utf-8?B?VnpFb1BaVUkzTmgxSjBkNUFzRHZoY0gzMUJHY2Q1QlROUGRIUTNsZTNQRGhk?=
 =?utf-8?B?QWtRYzZvVE5xVFVYOEtRSkxocERoOUpoYXVNV0NqOXpXL2VNOW1pY2hOcWxS?=
 =?utf-8?B?N1hhMWpJNDhLaWEzVEpabWVjZmplUmVMVnppeTYyQW5SRFIyU2xEOWowYlFp?=
 =?utf-8?B?NHBBeHpqSGVlQnZLeWxRRDBkaEhTTktSR1pLckhLUlI4bVNPQlVoTjdLNmV5?=
 =?utf-8?B?cXlBYnNSQVpKdTJ1Ymk5eUxDamJRY2t2azFYQWhtaFM2dldEaW5LRkZmdHRh?=
 =?utf-8?B?RWJSYnJZRnROWmljaHVUL2lEcStOdGNUcVFHRytHaFpDd2RVZjM2ZWpZMzRT?=
 =?utf-8?B?MmlxRmZpQ042SnZZRlRsODlkYStRc2l4R01hWVVkc3NlbmdwUTlGeFBPcGlL?=
 =?utf-8?B?VjNSODJIdm1BSzRKU25UY2RmV0lXclQxdE1VUlVDUXNPblhQVk9lMlpxZVRj?=
 =?utf-8?B?a1hhOTFidUhtdDNNYVV4Y0pwMnBmY3FOMHJ3ZzVuSkxXUlBQZy9Wb2J4S1dB?=
 =?utf-8?B?NjducWpEekZQZzlxSDVkaTZ2bGRHeVVCL0pLTHYxdHFpOElWNHo0anIyblBK?=
 =?utf-8?B?MmVZKzlBY1pBQ21XS29wTlNwTmJRK0FncjJuU2VzV1gyVWpjNDJRVU1oRkk0?=
 =?utf-8?B?ais3bVpLS2k5eGU4S3B5N3o1UmVJWUdYMzNCRmt6em5tWGs4dGhnMG5saEVM?=
 =?utf-8?B?WE1kbGI1MmRnY2JlMUlhcnhTR3ZVU2lMLzFnNHhZL0hzV3Mrb3p4T3BNVUtR?=
 =?utf-8?B?T3FPVUFEcHVOeCtTWFJ6bjRNQkUvblRBczRVZE1iR1BlbWtsejhBMXo2Z3ZD?=
 =?utf-8?B?WklYY293VmF2MUUrbUVZQVQ2cHhjOVFhdlMzR251ZnA1OTlVSHpQV3VqUTEw?=
 =?utf-8?B?UkU2anlDdmRES2VOd0lTM0kzZ3pHZVlndTE5TEpySndONi9HcWNwYm9adzNH?=
 =?utf-8?B?RzZrQzRHOE9GRjZsYXkyL2tLNktic0JGbm5VOEtYMlJLWjNBWXZ6WEdjeWV4?=
 =?utf-8?B?bVh0NWsyM2JLeVVhNVRJWmhmZzNRNUNoOWVobDhMMzJneWNqNTlCSG9sVzhi?=
 =?utf-8?B?T1dQdlZrSjh6OW94NkN4Q29rQ3dHNkkvZC84VEorYmVlcyt5bWZ4RDJhK1Jv?=
 =?utf-8?B?KzBKc2cwSk1tZ05VZDhoYm1sbks1ZlZYU0JSNEQrbjhMK1RrcUwzQ2JxbUxC?=
 =?utf-8?B?TUhxMm93cGRnWjlsTXFPbXZIc0c3SldYbjdsZVZ0Q090UVk0cUxXYVNQT0hj?=
 =?utf-8?B?WTU2QXAxOGR2aWhIUnBMMTYrV0pxK09kc1JRZ3d3c1dpQnhYYk5kYUNOTTFT?=
 =?utf-8?B?YUVlam53UndMeTJ5N2lUbi9kOWU1akNHdlg1ejc2L3Q3YmZyK2xkekR6VWp4?=
 =?utf-8?B?T2hZSUZ2MW1XR2J1YktuQVFlWEZzaHhXaU1uQVFLNW43aHZFdEllMzh2dXZM?=
 =?utf-8?B?aE1ZR2N3VWFheEkrb2hwMnZ4VmM3RjlvOENpRGJNTzhOdXo4bXJGbkw3eDRJ?=
 =?utf-8?B?T1BWa1JVMllsT1laR0JTYmZJUE5LbzdyMUNxd3ZBcFZWYWJPKzZMMldvd3Zq?=
 =?utf-8?B?Q3JHNmd1L2ErbDkwR3FnV0xwMFBJaFhDZkZIVlZhVkFPdWlQSVdyVHRDRVZM?=
 =?utf-8?B?RXUvdWh4REZNM056MnJ0SnZIZG5pRytHTmZEOVVIREcvS3VOb3loY2dndm1T?=
 =?utf-8?Q?QEGhBfnO1FJmRUFhIkBhSNNpE?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700013)(82310400026)(1800799024)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 10:57:17.2763
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a2d894f7-dd94-447a-770b-08de4f6ddac9
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000A7E1.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7551
X-Proofpoint-ORIG-GUID: EMn38HkgB-0O3DqqPwAWp57RUsAmRznL
X-Authority-Analysis: v=2.4 cv=d4f4CBjE c=1 sm=1 tr=0 ts=6960df10 cx=c_pps
 a=UF7r5SVx1dPEhrSNKrAGtw==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=rg8MelPR9j8A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=6OkPYWvNmkp-oGry5mkA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-GUID: EMn38HkgB-0O3DqqPwAWp57RUsAmRznL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA4MCBTYWx0ZWRfX0H/RCZ3xW8K9
 +Fyc4pHxXKfgskxLDKsGBnh99x7U+yJKzDnDBBU0wKL+ov6LbYIKDXiF3FwmFISbs+7ZHTpe6/4
 PaoDROSgLa2rRdJrqD3gwy7dd0riJcz+ayqGwxvWH6qRhUbj/Ap8plepqmpNPxpQ5xP9YDkgQLu
 QvOaE9wLc7q8sBfg7nhQ/SxSMvZ6g95nItBIU6sGuDyawuq8F9dcpNymLkRDsKGwPCGHvAwAN0E
 CSPc29yTjJ11QXkpeKDZNhsEkk0+R59mowt7ZvNrywdpiGDUP+R+kFIL2w6VmpR4k3YPGWiyG2F
 CUVswRtiRMz2NnwpmBxiShUWKcKp06Kbx8UtLPPh/QR7nrhNDgvW3XEwUtSHrd4G097IG+UqP4d
 lGOdRketZjec1A/SW/iZfmwy4IiZKWZ3nmhPJhsr6Whm5u8pvoYYHAjllz93dwXp4ZPeDSCatAs
 0rLFMy90M0duBiSjFqA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_03,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090080

Enable CoreSight peripherals on the stm32mp15xx-dkx boards. All boards
including this file are embedding a dual core SoC so this change is
applicable.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi | 36 +++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
index fe2ab07ea4a8..c91204476161 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
@@ -140,6 +140,42 @@ &crc1 {
 	status = "okay";
 };
 
+&cs_cti_trace {
+	status = "okay";
+};
+
+&cs_cti_cpu0 {
+	status = "okay";
+};
+
+&cs_cti_cpu1 {
+	status = "okay";
+};
+
+&cs_etf {
+	status = "okay";
+};
+
+&cs_etm0 {
+	status = "okay";
+};
+
+&cs_etm1 {
+	status = "okay";
+};
+
+&cs_funnel {
+	status = "okay";
+};
+
+&cs_stm {
+	status = "okay";
+};
+
+&cs_tpiu {
+	status = "okay";
+};
+
 &dbg_bus {
 	status = "okay";
 };

-- 
2.43.0


