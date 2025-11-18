Return-Path: <linux-gpio+bounces-28680-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AC732C6A97D
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 17:23:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 946262C8F2
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 16:23:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2371377E9A;
	Tue, 18 Nov 2025 16:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="EWR7al+v"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 973D82C032C;
	Tue, 18 Nov 2025 16:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.182.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763482908; cv=fail; b=VCBn+61veEx4U1ey6qH3NKh5TQJJyTQHEXcrtiqG5+jaIiBk9bCCktCTbcUNSah5wiQ4IkMW6jlgTbjv6+YAWpw00Wa8W/Nk37aEc1pp2spRbD5FKk4uAZuzIZvQDbXHXkLIdBahzGEVpvXPvV5FEoGK6c47R4umsRP0Hh+b+gw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763482908; c=relaxed/simple;
	bh=FSn8UmYpyGFaZLCxehZ8EEYuti+HSnY42FJoZ5Hr1XE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PsLEmZ+ivcPhbDm9+GEFB4At3G2bZr3htUqSQ+0BKuoN3Rh0epHp1o5a/e7yYS+/aqrbJA+iOvDcK9XfP1K6GpYYU0RF5D39YdEe7esUn7ueVVX1a69gcA8256IV6tr0DlILnjAYgnC7gaIFgB1i2Xe+pAJyqwxVJS1QiOyY/38=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=EWR7al+v; arc=fail smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AIGFaRZ099945;
	Tue, 18 Nov 2025 17:20:06 +0100
Received: from du2pr03cu002.outbound.protection.outlook.com (mail-northeuropeazon11011065.outbound.protection.outlook.com [52.101.65.65])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4agrub8vg3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 18 Nov 2025 17:20:06 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UNgyK2nBIchns1K3y1kqRg8+M70CnRYpPrpKzpmsbkCPNa+ihsQyc1s+38B4frDtFEMs0p/65ZTe6rsc9M5WY8gjrkD4v33yb281iRBlg+KQ+U1x1Om1+a3jMAbOHn4al9/tR7I4OJ8U87kjj1l9amEtg06qMMI+skmba3i3GCdQ2wvugqBLlirzfZezjL2OeGqRezX2XmVXG2xzpjNvqxmkodEEMhEigTQhLIsj+JdP8dpPLY/Uv+CivgdGe0C7MoGRjLhV7vt3I9zumWOhvm5pJW1vTGtOOVNr7AWxcIno/RyMYsJNHDXurbC8Pea5bwYWXh0cO+vLGYu+09Udsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hk/VwA+m2c178ThVMbEz+BRa3Dmb8sN7t2YPFFVrRaI=;
 b=mG+tuYj5WY1DQrvk/Cc7axnHwGYOCwSabufVFBmT5xrKsuk03QBdjZE6+uzC/CJwQ8yUCVSjnrXI1N1Z/JVRQNY2kEDe7VGSvdFIoma7bZftxWE9kd/OUgmxWIjh7QNsZl3/IRAWoS9iBtpkdUQ61OqZw4zV3Y+aqxWNJDg7BvisaK1nfTYdR+wRcU6MB4ImvUdQThputvg8Vd5ClK59MrSVg7zvczqKK6paoLzIBl5JDnRFTTjDrZRRMvVnc5WdxONMFnaUtT6z2nr8CZe4SPO4sBz4PD3eu1mQckCPj0ql/Ro8FqNaK3u3qOmxIQQ5ZF6fdMmKmtzG8mgrjweY9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=linaro.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hk/VwA+m2c178ThVMbEz+BRa3Dmb8sN7t2YPFFVrRaI=;
 b=EWR7al+va1Y1uCWIrh/tkspnaPqc1yIeYKNOtwbuBsUnU/fU8OBxxMVSYQNa7lONAyDce8T3Kt5cqGXqlOAUydhKZlHEwMuA4r9Fng8kDjv/UJn/SyoRO1IED5JLpfzp+7Hn7ZtnNz0YH5B+Rr63Il2qH1TvpoRqGpY2dI4S78G0n8brUq987tdTJ8y2+lTmaIwunlteAUaiNhtlzuviQbvrneNt9kmEdf8z+6LhbqomMY1RgVhmpGknhEcFrfoqIImLlodztBWgW/iC9UpHJDuBnfY0bhysP6Z7BADRH3Em/mi9qM3Kexq4Oap6sA3nnXIvr/tR7SgyFZu3CDkDsA==
Received: from DU2PR04CA0076.eurprd04.prod.outlook.com (2603:10a6:10:232::21)
 by DB8PR10MB3751.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:161::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Tue, 18 Nov
 2025 16:19:58 +0000
Received: from DB1PEPF0003922E.eurprd03.prod.outlook.com
 (2603:10a6:10:232:cafe::c3) by DU2PR04CA0076.outlook.office365.com
 (2603:10a6:10:232::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.22 via Frontend Transport; Tue,
 18 Nov 2025 16:19:58 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF0003922E.mail.protection.outlook.com (10.167.8.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Tue, 18 Nov 2025 16:19:58 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 18 Nov
 2025 17:20:01 +0100
Received: from localhost (10.48.86.11) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Tue, 18 Nov
 2025 17:19:46 +0100
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Antonio Borneo <antonio.borneo@foss.st.com>,
        =?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?= <legoffic.clement@gmail.com>,
        "Amelie
 Delaunay" <amelie.delaunay@foss.st.com>,
        Pascal Paillet
	<p.paillet@foss.st.com>,
        =?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?=
	<clement.legoffic@foss.st.com>
Subject: [PATCH v2 05/15] pinctrl: stm32: add new package to stm32mp257 pinctrl support
Date: Tue, 18 Nov 2025 17:19:26 +0100
Message-ID: <20251118161936.1085477-6-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251118161936.1085477-1-antonio.borneo@foss.st.com>
References: <20251118161936.1085477-1-antonio.borneo@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF0003922E:EE_|DB8PR10MB3751:EE_
X-MS-Office365-Filtering-Correlation-Id: ec34a7a4-cb90-4e4f-9403-08de26be5142
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T2Exd0Erai9qZFZOUUNDQkFadDhLYnQ4VjNWeHgxUUwwZUhzaW5XeFQ4QzZr?=
 =?utf-8?B?SmNpcTgzTEk2ZG80cnZWUkR4WDh5Wk9DREoxeDExVnVHRi9tWTJuMHpva2p5?=
 =?utf-8?B?Nk5sNmNyRlNmUkhRM3dMY1pZQUcyMEVhaVZ2elBFcEorMzJxZG9YUGhlR0wx?=
 =?utf-8?B?aHo5a3dKWE85VnV6ZjVnOFQ1aHYvTUo2YnBvaFR6a3NlRFVhVElWZFV4WWhy?=
 =?utf-8?B?ODVxOE1SOThHdXAzekw2V2Mwa3kybldWQnYyYXRSWGY1c01ocVVQcjVpdWxj?=
 =?utf-8?B?cVZ5SGhmWDF5Z3RvcThwOWx3bkcxWVpwcDlZMjh0SWsrK252WjAxTmtaN2Fq?=
 =?utf-8?B?SzB1RE9ITG5MMFVGTklQdHdJVlB2d0ZPcTJtdEprRmd6TzlRWUEzcno0UXZ4?=
 =?utf-8?B?T21zQmFLUmxyRmlobHZLSFh3c3dDdTYvdk9IMzY4QUJjVENiZWw2cU1QN0sr?=
 =?utf-8?B?dHcyTVN4SXRkUk8wOGcwaVdHaUI4VTNjTWtyWjBpUy9oMmUvN2RqbVJxWkxY?=
 =?utf-8?B?bFpIaG5kTFgyeTdLUkhGVGprOCtTRVR0TndkMlZhNUo3ckNldTFPSkVwY2V6?=
 =?utf-8?B?bFYrQzAyRXhOV0Y0ZVZuRWJKMWphVjkzOVRDT1Blc09TMUZaaGpSOTVScm9y?=
 =?utf-8?B?L21MZ0h5Z1E0a3Joc3QxNE5Ec1RsNzZnTG95Z1F6Q2duejFlQmZha0ZBSlJQ?=
 =?utf-8?B?akpzYm10N2RzQXFyRVcwNnpKdTk3Rit6VmhDZHNaUzJpaXY5Q29RZVFJNUdi?=
 =?utf-8?B?dER0QjRLaFNvdXdkeVRJOUNIOFFwNHVXVGQ3b01ueS9WaExMUXJzdGd2d0Ni?=
 =?utf-8?B?UnhaWDh4QllVSyt6Q1VpemhhN1NNcEVVaDFFY250ZU51bDc2QUxneVlIZXMr?=
 =?utf-8?B?Sm85Q2lwVHplVmxmMEpQU3VQR1BTQVd2Qjd1OXg2MnJhTjB1M1pFeXRKWGFB?=
 =?utf-8?B?bTdGUXZBODA4ak5UdERHVG9rcEVvbk9uYU5QcUZNbTNyT3Mycnp3VTRIR2Jv?=
 =?utf-8?B?bGwwNG1scnhGZ2lxRCszSElMblVlZkdFSyttZHlKRmVOM2QwUlIrRE0zYVov?=
 =?utf-8?B?eSs4ckJ4UDdJSEc4VDZIRnBiSVNtZ21CZHA2NUNDa1Z6WlNMTUpFNjVTQkFF?=
 =?utf-8?B?c0RvS0xuUENWNmg5OWplVXQ0V2VvMjI4WHMwSG9nQWlJVnhjejViVjUzekds?=
 =?utf-8?B?OFJFVVNRSW92WXlRdFEvVGhmNWZrdzMwYzd0OHRtRlEyN0hPNnd1ZDZMSEty?=
 =?utf-8?B?bnVvUFEwWlBXb1kxNDJzZEhrbUU5U29pVitVWkpSbTdVMDMwRUQxNFFrMDFO?=
 =?utf-8?B?UnpYMmZOWThqQTN2Mkp2WkNIRURMN2R1NVBPQ2QxL3A3QXd3RjFheVpaUzYr?=
 =?utf-8?B?bVRaeE00b0o4WS9RcVNicjNLamZQRGRpZ3ZEYUhnRnUzTHZWN1ROT0pFUUhY?=
 =?utf-8?B?dmc1Vk9qZmtsVlJ1U2JpWkhubndJNW5NNTQ1YUZER2VHTllsVWs2SjdCYUVw?=
 =?utf-8?B?VWpRU0NJNVpFSzhRYWFubzhsUW8rVzZxRG5lRVBtcWIxNkRaYkREOWpXcEtL?=
 =?utf-8?B?QTNZbEJWODZJMmlmcURKYVBsaW5hbVlKVjdmWUl3clBla01TdWdrM3R5VHhM?=
 =?utf-8?B?UEhvTVZ5Nk5JdzNYdXVVTDJTaWdIV3pIRldFamFxa2lGbUFEU1k3VW9oaHh6?=
 =?utf-8?B?L1FKb29WbjQ4ZkhlSlhFeTJEY2ZGdWQzejRuT3BzUTBLM3YyMFE4SVRvdG1l?=
 =?utf-8?B?anc0OTg0RktzcC9yUUEzOHBPY1VSTllodjViejhXN2laelh6NjBnMGR3NFk5?=
 =?utf-8?B?WmRvaDRRc2Qzb3ZhRFl3Nkk5Yk5KVmdocUtuQzhjcG1La2kxRTVhZGVmUFJo?=
 =?utf-8?B?OUIzemRhM0FzOHJzd1NXeHkyMkJKNklpcDFFZFdnQnoxQ2cxSWxseXpkTStm?=
 =?utf-8?B?UjFuMEhzOGR6ZWo3RE9EeDMwOENtdllaL2dleE52R1EyMlZmaFFXTndSZis1?=
 =?utf-8?B?SGJ6QlEyZjZrbjFhUFFWNWJtZUwyQXZocU5SbnNFTTVWOFpyd052eUlPWWRX?=
 =?utf-8?B?cG52ZElEWnBGOG8yL3dQR1o4RlE5d0U5cEVDRlpmaFNaZjhsVm5FaFhxa042?=
 =?utf-8?Q?D87QOiJ08NMBmpezBdx8iosPg?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7416014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 16:19:58.1006
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec34a7a4-cb90-4e4f-9403-08de26be5142
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF0003922E.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3751
X-Authority-Analysis: v=2.4 cv=LKBrgZW9 c=1 sm=1 tr=0 ts=691c9cb6 cx=c_pps
 a=KGNGHRCrBgxyWJT5PB+uzg==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=y9YUpebZf6kA:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=mcapIeYrMYwP5J6XJbAA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: gh-OTLrnyq-_T1tUNRcgex3M3wtg8LTN
X-Proofpoint-GUID: gh-OTLrnyq-_T1tUNRcgex3M3wtg8LTN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDEzMSBTYWx0ZWRfX87g76EzCALmD
 0qcc07TzCu2C9gyQghB0ReI6MFQpQbQ5Qq0yfLxPjhYnuQMQERl/ZAD4RneJKOY/68YGb3QW7MV
 OfA+pmPZUPZTPIV1bPAw1KnSz1PSO6qnsDEjzp/sL40IAhs6eFLr8QQ5Ru/3p6aj6L2LcxHvpSn
 hbZvacNGzwjLJfrHfwHwAyoRhx67XxG42roMlwfxbGB30++rESSpLMk6RVos/s2t3ueGhvP3Skl
 eZJVF+Bll5z+SUexs8ihtxx8oPqyR9rmthCLRtwTibuv42abaatM4N6pV2c1KM3WEQNDz4+kjSI
 tRtUgukpZsln4SgTdByY+zwhDacuerXf4U7gJj8ReIqGVkOPX7vWfu0We0BBV8JOSDowFPQme3Z
 utC15cu3s0tQ4PARRAXTbVj/y8S8Kw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_02,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180131

From: Clément Le Goffic <clement.legoffic@foss.st.com>

Add the package 'AJ' to the list of supported SoC packages for
stm32mp257 pinctrl.
It corresponds to the package type TFBGA361.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 drivers/pinctrl/stm32/pinctrl-stm32.c      |   1 +
 drivers/pinctrl/stm32/pinctrl-stm32.h      |   1 +
 drivers/pinctrl/stm32/pinctrl-stm32mp257.c | 288 ++++++++++-----------
 3 files changed, 146 insertions(+), 144 deletions(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index 0f5ab585e4bbb..97995ac505786 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -141,6 +141,7 @@ static const char * const stm32_pkgs[] = {
 	[STM32_PKG_AC] = "AC",
 	[STM32_PKG_AD] = "AD",
 	[STM32_PKG_AI] = "AI",
+	[STM32_PKG_AI] = "AJ",
 	[STM32_PKG_AK] = "AK",
 	[STM32_PKG_AL] = "AL",
 };
diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.h b/drivers/pinctrl/stm32/pinctrl-stm32.h
index 6761024ce691a..051597b00f1f5 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.h
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.h
@@ -31,6 +31,7 @@ enum stm32_pkg {
 	STM32_PKG_AC = 2,  /* do not change */
 	STM32_PKG_AD = 3,  /* do not change */
 	STM32_PKG_AI = 8,  /* do not change */
+	STM32_PKG_AJ,
 	STM32_PKG_AK = 10, /* do not change */
 	STM32_PKG_AL = 11, /* do not change */
 
diff --git a/drivers/pinctrl/stm32/pinctrl-stm32mp257.c b/drivers/pinctrl/stm32/pinctrl-stm32mp257.c
index 346d5a10c6c8a..4808eea93f1bd 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32mp257.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32mp257.c
@@ -13,7 +13,7 @@
 static const struct stm32_desc_pin stm32mp257_pins[] = {
 	STM32_PIN_PKG(
 		PINCTRL_PIN(0, "PA0"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOA0"),
 		STM32_FUNCTION(2, "LPTIM1_CH2"),
 		STM32_FUNCTION(3, "SPI5_RDY"),
@@ -31,7 +31,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(1, "PA1"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOA1"),
 		STM32_FUNCTION(3, "SPI6_MISO"),
 		STM32_FUNCTION(5, "SAI3_SD_A"),
@@ -48,7 +48,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(2, "PA2"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOA2"),
 		STM32_FUNCTION(2, "LPTIM2_IN1"),
 		STM32_FUNCTION(3, "SPI7_MISO"),
@@ -64,7 +64,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(3, "PA3"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOA3"),
 		STM32_FUNCTION(2, "LPTIM2_ETR"),
 		STM32_FUNCTION(3, "SPI7_MOSI"),
@@ -81,7 +81,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(4, "PA4"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOA4"),
 		STM32_FUNCTION(7, "USART2_TX"),
 		STM32_FUNCTION(8, "FDCAN2_TX"),
@@ -94,7 +94,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(5, "PA5"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOA5"),
 		STM32_FUNCTION(4, "SPI4_MOSI"),
 		STM32_FUNCTION(5, "SAI2_MCLK_B"),
@@ -111,7 +111,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(6, "PA6"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOA6"),
 		STM32_FUNCTION(4, "SPI4_SCK"),
 		STM32_FUNCTION(5, "SAI2_FS_B"),
@@ -128,7 +128,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(7, "PA7"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOA7"),
 		STM32_FUNCTION(3, "AUDIOCLK"),
 		STM32_FUNCTION(4, "SPI6_RDY"),
@@ -148,7 +148,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(8, "PA8"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOA8"),
 		STM32_FUNCTION(2, "LPTIM2_CH2"),
 		STM32_FUNCTION(3, "SPI7_NSS"),
@@ -163,7 +163,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(9, "PA9"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOA9"),
 		STM32_FUNCTION(4, "SPI4_NSS"),
 		STM32_FUNCTION(5, "SAI2_SCK_B"),
@@ -179,7 +179,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(10, "PA10"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOA10"),
 		STM32_FUNCTION(4, "SPI4_MISO"),
 		STM32_FUNCTION(5, "SAI2_SD_B"),
@@ -195,7 +195,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(11, "PA11"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOA11"),
 		STM32_FUNCTION(2, "SPI8_SCK"),
 		STM32_FUNCTION(3, "LPTIM2_CH1"),
@@ -207,7 +207,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(12, "PA12"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOA12"),
 		STM32_FUNCTION(3, "SPI6_MOSI"),
 		STM32_FUNCTION(5, "SAI3_FS_A"),
@@ -220,7 +220,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(13, "PA13"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOA13"),
 		STM32_FUNCTION(2, "SPI8_RDY"),
 		STM32_FUNCTION(3, "I2S3_MCK"),
@@ -234,7 +234,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(14, "PA14"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOA14"),
 		STM32_FUNCTION(2, "SPI8_NSS"),
 		STM32_FUNCTION(3, "LPTIM2_CH2"),
@@ -246,7 +246,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(15, "PA15"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOA15"),
 		STM32_FUNCTION(3, "SPI3_MISO I2S3_SDI"),
 		STM32_FUNCTION(7, "USART2_RX"),
@@ -257,7 +257,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(16, "PB0"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOB0"),
 		STM32_FUNCTION(3, "SPI2_SCK I2S2_CK"),
 		STM32_FUNCTION(7, "USART1_CK"),
@@ -269,7 +269,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(17, "PB1"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOB1"),
 		STM32_FUNCTION(2, "SPI3_NSS I2S3_WS"),
 		STM32_FUNCTION(8, "TIM16_CH1N"),
@@ -281,7 +281,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(18, "PB2"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOB2"),
 		STM32_FUNCTION(3, "SPI2_MOSI I2S2_SDO"),
 		STM32_FUNCTION(6, "MDF1_CKI3"),
@@ -294,7 +294,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(19, "PB3"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOB3"),
 		STM32_FUNCTION(3, "SPI2_NSS I2S2_WS"),
 		STM32_FUNCTION(6, "MDF1_SDI3"),
@@ -306,7 +306,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(20, "PB4"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOB4"),
 		STM32_FUNCTION(3, "SPI2_RDY"),
 		STM32_FUNCTION(4, "UART4_CTS"),
@@ -322,7 +322,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(21, "PB5"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOB5"),
 		STM32_FUNCTION(3, "I2S2_MCK"),
 		STM32_FUNCTION(4, "UART4_RTS"),
@@ -339,7 +339,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(22, "PB6"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOB6"),
 		STM32_FUNCTION(3, "SPI2_MISO I2S2_SDI"),
 		STM32_FUNCTION(4, "UART4_RX"),
@@ -353,7 +353,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(23, "PB7"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOB7"),
 		STM32_FUNCTION(2, "SPI3_SCK I2S3_CK"),
 		STM32_FUNCTION(4, "UART4_TX"),
@@ -368,7 +368,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(24, "PB8"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOB8"),
 		STM32_FUNCTION(2, "SPI3_MOSI I2S3_SDO"),
 		STM32_FUNCTION(5, "PCIE_CLKREQN"),
@@ -382,7 +382,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(25, "PB9"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOB9"),
 		STM32_FUNCTION(2, "SPI3_RDY"),
 		STM32_FUNCTION(7, "USART1_RTS"),
@@ -397,7 +397,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(26, "PB10"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOB10"),
 		STM32_FUNCTION(2, "SPI3_MISO I2S3_SDI"),
 		STM32_FUNCTION(7, "USART1_RX"),
@@ -409,7 +409,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(27, "PB11"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOB11"),
 		STM32_FUNCTION(2, "I2S3_MCK"),
 		STM32_FUNCTION(7, "USART1_CTS"),
@@ -425,7 +425,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(28, "PB12"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOB12"),
 		STM32_FUNCTION(6, "UART8_CTS"),
 		STM32_FUNCTION(8, "TIM13_CH1"),
@@ -438,7 +438,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(29, "PB13"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOB13"),
 		STM32_FUNCTION(3, "SPI7_SCK"),
 		STM32_FUNCTION(5, "SAI1_SD_B"),
@@ -451,7 +451,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(30, "PB14"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOB14"),
 		STM32_FUNCTION(3, "SPI2_SCK I2S2_CK"),
 		STM32_FUNCTION(6, "MDF1_CKI7"),
@@ -465,7 +465,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(31, "PB15"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOB15"),
 		STM32_FUNCTION(2, "LPTIM1_IN2"),
 		STM32_FUNCTION(3, "SPI5_SCK"),
@@ -483,7 +483,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(32, "PC0"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOC0"),
 		STM32_FUNCTION(2, "LPTIM1_CH1"),
 		STM32_FUNCTION(4, "SPI6_SCK"),
@@ -499,7 +499,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(33, "PC1"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOC1"),
 		STM32_FUNCTION(3, "SPI3_MOSI I2S3_SDO"),
 		STM32_FUNCTION(7, "USART2_TX"),
@@ -510,7 +510,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(34, "PC2"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOC2"),
 		STM32_FUNCTION(2, "SPI8_MOSI"),
 		STM32_FUNCTION(3, "LPTIM2_IN1"),
@@ -523,7 +523,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(35, "PC3"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOC3"),
 		STM32_FUNCTION(2, "LPTIM1_IN2"),
 		STM32_FUNCTION(3, "SPI3_NSS I2S3_WS"),
@@ -539,7 +539,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(36, "PC4"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOC4"),
 		STM32_FUNCTION(4, "SPI6_MISO"),
 		STM32_FUNCTION(5, "SAI3_FS_B"),
@@ -551,7 +551,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(37, "PC5"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOC5"),
 		STM32_FUNCTION(3, "SPDIFRX1_IN1"),
 		STM32_FUNCTION(6, "MDF1_SDI1"),
@@ -567,7 +567,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(38, "PC6"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOC6"),
 		STM32_FUNCTION(2, "RTC_REFIN"),
 		STM32_FUNCTION(3, "SPDIFRX1_IN0"),
@@ -584,7 +584,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(39, "PC7"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOC7"),
 		STM32_FUNCTION(4, "SPI6_MOSI"),
 		STM32_FUNCTION(5, "SAI3_SD_B"),
@@ -598,7 +598,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(40, "PC8"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOC8"),
 		STM32_FUNCTION(2, "LPTIM1_ETR"),
 		STM32_FUNCTION(4, "SPI6_NSS"),
@@ -614,7 +614,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(41, "PC9"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOC9"),
 		STM32_FUNCTION(2, "MCO1"),
 		STM32_FUNCTION(3, "SPI3_MISO I2S3_SDI"),
@@ -632,7 +632,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(42, "PC10"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOC10"),
 		STM32_FUNCTION(3, "SPI3_MOSI I2S3_SDO"),
 		STM32_FUNCTION(8, "LPTIM4_ETR"),
@@ -648,7 +648,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(43, "PC11"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOC11"),
 		STM32_FUNCTION(2, "LPTIM1_CH1"),
 		STM32_FUNCTION(3, "SPI5_NSS"),
@@ -666,7 +666,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(44, "PC12"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOC12"),
 		STM32_FUNCTION(2, "LPTIM1_CH2"),
 		STM32_FUNCTION(4, "I3C3_SCL"),
@@ -682,14 +682,14 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(45, "PC13"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOC13"),
 		STM32_FUNCTION(16, "EVENTOUT"),
 		STM32_FUNCTION(17, "ANALOG")
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(48, "PD0"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOD0"),
 		STM32_FUNCTION(1, "TRACECLK"),
 		STM32_FUNCTION(2, "HDP0"),
@@ -706,7 +706,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(49, "PD1"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOD1"),
 		STM32_FUNCTION(2, "HDP1"),
 		STM32_FUNCTION(3, "SPI1_MISO I2S1_SDI"),
@@ -725,7 +725,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(50, "PD2"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOD2"),
 		STM32_FUNCTION(2, "HDP2"),
 		STM32_FUNCTION(3, "SPI1_NSS I2S1_WS"),
@@ -743,7 +743,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(51, "PD3"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOD3"),
 		STM32_FUNCTION(2, "SAI1_MCLK_A"),
 		STM32_FUNCTION(3, "SPI2_SCK I2S2_CK"),
@@ -760,7 +760,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(52, "PD4"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOD4"),
 		STM32_FUNCTION(1, "TRACED0"),
 		STM32_FUNCTION(2, "SPI4_MISO"),
@@ -776,7 +776,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(53, "PD5"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOD5"),
 		STM32_FUNCTION(1, "TRACED1"),
 		STM32_FUNCTION(2, "SPI4_NSS"),
@@ -792,7 +792,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(54, "PD6"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOD6"),
 		STM32_FUNCTION(1, "TRACED2"),
 		STM32_FUNCTION(2, "SPI4_MOSI"),
@@ -808,7 +808,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(55, "PD7"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOD7"),
 		STM32_FUNCTION(1, "TRACED3"),
 		STM32_FUNCTION(2, "SPI4_SCK"),
@@ -824,7 +824,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(56, "PD8"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOD8"),
 		STM32_FUNCTION(1, "TRACED4"),
 		STM32_FUNCTION(2, "SPI4_RDY"),
@@ -843,7 +843,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(57, "PD9"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOD9"),
 		STM32_FUNCTION(1, "TRACED5"),
 		STM32_FUNCTION(2, "HDP6"),
@@ -861,7 +861,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(58, "PD10"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOD10"),
 		STM32_FUNCTION(1, "TRACED6"),
 		STM32_FUNCTION(2, "HDP7"),
@@ -880,7 +880,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(59, "PD11"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOD11"),
 		STM32_FUNCTION(1, "TRACED7"),
 		STM32_FUNCTION(3, "SPI1_SCK I2S1_CK"),
@@ -899,7 +899,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(60, "PD12"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOD12"),
 		STM32_FUNCTION(2, "SPI7_MISO"),
 		STM32_FUNCTION(3, "SPI2_MISO I2S2_SDI"),
@@ -914,7 +914,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(61, "PD13"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOD13"),
 		STM32_FUNCTION(3, "SPI2_NSS I2S2_WS"),
 		STM32_FUNCTION(6, "MDF1_SDI7"),
@@ -928,7 +928,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(62, "PD14"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOD14"),
 		STM32_FUNCTION(3, "I2S1_MCK"),
 		STM32_FUNCTION(8, "FDCAN1_RX"),
@@ -942,7 +942,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(63, "PD15"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOD15"),
 		STM32_FUNCTION(2, "SPI1_RDY"),
 		STM32_FUNCTION(6, "DSI_TE"),
@@ -959,7 +959,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(64, "PE0"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOE0"),
 		STM32_FUNCTION(1, "TRACED2"),
 		STM32_FUNCTION(2, "LPTIM2_CH1"),
@@ -972,7 +972,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(65, "PE1"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOE1"),
 		STM32_FUNCTION(1, "TRACED3"),
 		STM32_FUNCTION(2, "LPTIM2_CH2"),
@@ -985,7 +985,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(66, "PE2"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOE2"),
 		STM32_FUNCTION(2, "LPTIM2_ETR"),
 		STM32_FUNCTION(3, "SPI1_MISO I2S1_SDI"),
@@ -998,7 +998,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(67, "PE3"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOE3"),
 		STM32_FUNCTION(1, "TRACECLK"),
 		STM32_FUNCTION(3, "SPI1_RDY"),
@@ -1012,7 +1012,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(68, "PE4"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOE4"),
 		STM32_FUNCTION(1, "TRACED0"),
 		STM32_FUNCTION(2, "LPTIM2_IN1"),
@@ -1027,7 +1027,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(69, "PE5"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOE5"),
 		STM32_FUNCTION(1, "TRACED1"),
 		STM32_FUNCTION(2, "LPTIM2_IN2"),
@@ -1042,7 +1042,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(70, "PE6"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOE6"),
 		STM32_FUNCTION(2, "SPI4_RDY"),
 		STM32_FUNCTION(5, "SPDIFRX1_IN2"),
@@ -1056,7 +1056,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(71, "PE7"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOE7"),
 		STM32_FUNCTION(4, "SAI4_D4"),
 		STM32_FUNCTION(5, "SPDIFRX1_IN3"),
@@ -1071,7 +1071,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(72, "PE8"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOE8"),
 		STM32_FUNCTION(2, "SPI4_MOSI"),
 		STM32_FUNCTION(4, "SAI4_CK1"),
@@ -1085,7 +1085,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(73, "PE9"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOE9"),
 		STM32_FUNCTION(2, "SPI4_MISO"),
 		STM32_FUNCTION(4, "SAI4_D2"),
@@ -1100,7 +1100,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(74, "PE10"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOE10"),
 		STM32_FUNCTION(2, "SPI4_SCK"),
 		STM32_FUNCTION(4, "SAI4_D1"),
@@ -1116,7 +1116,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(75, "PE11"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOE11"),
 		STM32_FUNCTION(3, "SPI7_SCK"),
 		STM32_FUNCTION(4, "SAI4_D3"),
@@ -1130,7 +1130,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(76, "PE12"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOE12"),
 		STM32_FUNCTION(2, "SPI4_NSS"),
 		STM32_FUNCTION(4, "SAI4_CK2"),
@@ -1146,7 +1146,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(77, "PE13"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOE13"),
 		STM32_FUNCTION(3, "SPI7_MISO"),
 		STM32_FUNCTION(5, "SAI1_SD_A"),
@@ -1159,7 +1159,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(78, "PE14"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOE14"),
 		STM32_FUNCTION(3, "SPI7_NSS"),
 		STM32_FUNCTION(5, "SAI1_MCLK_A"),
@@ -1173,7 +1173,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(79, "PE15"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOE15"),
 		STM32_FUNCTION(3, "SPI7_MOSI"),
 		STM32_FUNCTION(5, "SAI1_SCK_A"),
@@ -1187,7 +1187,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(80, "PF0"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOF0"),
 		STM32_FUNCTION(3, "SPI3_SCK I2S3_CK"),
 		STM32_FUNCTION(8, "FDCAN2_RX"),
@@ -1201,7 +1201,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(81, "PF1"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOF1"),
 		STM32_FUNCTION(2, "SPI8_MISO"),
 		STM32_FUNCTION(3, "LPTIM2_IN2"),
@@ -1214,7 +1214,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(82, "PF2"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOF2"),
 		STM32_FUNCTION(3, "SPI3_RDY"),
 		STM32_FUNCTION(7, "I2C4_SMBA"),
@@ -1229,7 +1229,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(83, "PF3"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOF3"),
 		STM32_FUNCTION(4, "UART8_RX"),
 		STM32_FUNCTION(5, "SAI2_SCK_B"),
@@ -1246,7 +1246,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(84, "PF4"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOF4"),
 		STM32_FUNCTION(2, "RTC_OUT2"),
 		STM32_FUNCTION(3, "SPI6_NSS"),
@@ -1263,7 +1263,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(85, "PF5"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOF5"),
 		STM32_FUNCTION(3, "SPI6_SCK"),
 		STM32_FUNCTION(5, "SAI3_MCLK_A"),
@@ -1279,7 +1279,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(86, "PF6"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOF6"),
 		STM32_FUNCTION(2, "RTC_OUT2"),
 		STM32_FUNCTION(4, "SAI3_MCLK_B"),
@@ -1293,7 +1293,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(87, "PF7"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOF7"),
 		STM32_FUNCTION(3, "SPDIFRX1_IN1"),
 		STM32_FUNCTION(4, "SPI6_SCK"),
@@ -1307,7 +1307,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(88, "PF8"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOF8"),
 		STM32_FUNCTION(2, "RTC_REFIN"),
 		STM32_FUNCTION(4, "SAI3_SCK_B"),
@@ -1323,7 +1323,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(89, "PF9"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOF9"),
 		STM32_FUNCTION(4, "SAI3_SD_B"),
 		STM32_FUNCTION(5, "SAI2_SD_A"),
@@ -1337,7 +1337,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(90, "PF10"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOF10"),
 		STM32_FUNCTION(2, "MCO2"),
 		STM32_FUNCTION(3, "SPI3_RDY"),
@@ -1351,7 +1351,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(91, "PF11"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOF11"),
 		STM32_FUNCTION(2, "MCO1"),
 		STM32_FUNCTION(3, "SPDIFRX1_IN0"),
@@ -1366,7 +1366,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(92, "PF12"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOF12"),
 		STM32_FUNCTION(1, "TRACECLK"),
 		STM32_FUNCTION(3, "SPI5_MISO"),
@@ -1380,7 +1380,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(93, "PF13"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOF13"),
 		STM32_FUNCTION(1, "TRACED0"),
 		STM32_FUNCTION(2, "HDP0"),
@@ -1397,7 +1397,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(94, "PF14"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOF14"),
 		STM32_FUNCTION(1, "TRACED1"),
 		STM32_FUNCTION(2, "HDP1"),
@@ -1412,7 +1412,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(95, "PF15"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOF15"),
 		STM32_FUNCTION(1, "TRACED2"),
 		STM32_FUNCTION(2, "HDP2"),
@@ -1429,7 +1429,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(96, "PG0"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOG0"),
 		STM32_FUNCTION(2, "LPTIM1_IN1"),
 		STM32_FUNCTION(4, "I3C3_SDA"),
@@ -1445,7 +1445,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(97, "PG1"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOG1"),
 		STM32_FUNCTION(2, "LPTIM1_IN1"),
 		STM32_FUNCTION(3, "I2S3_MCK"),
@@ -1465,7 +1465,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(98, "PG2"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOG2"),
 		STM32_FUNCTION(2, "RTC_REFIN"),
 		STM32_FUNCTION(3, "I2S3_MCK"),
@@ -1483,7 +1483,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(99, "PG3"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOG3"),
 		STM32_FUNCTION(2, "LPTIM1_ETR"),
 		STM32_FUNCTION(3, "SPI5_MOSI"),
@@ -1501,7 +1501,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(100, "PG4"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOG4"),
 		STM32_FUNCTION(3, "SPI5_MISO"),
 		STM32_FUNCTION(4, "SAI3_FS_B"),
@@ -1517,7 +1517,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(101, "PG5"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOG5"),
 		STM32_FUNCTION(1, "TRACED3"),
 		STM32_FUNCTION(2, "HDP3"),
@@ -1531,7 +1531,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(102, "PG6"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOG6"),
 		STM32_FUNCTION(1, "TRACED4"),
 		STM32_FUNCTION(2, "HDP4"),
@@ -1546,7 +1546,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(103, "PG7"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOG7"),
 		STM32_FUNCTION(1, "TRACED5"),
 		STM32_FUNCTION(2, "HDP5"),
@@ -1561,7 +1561,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(104, "PG8"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOG8"),
 		STM32_FUNCTION(1, "TRACED6"),
 		STM32_FUNCTION(2, "HDP6"),
@@ -1578,7 +1578,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(105, "PG9"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOG9"),
 		STM32_FUNCTION(1, "TRACED7"),
 		STM32_FUNCTION(6, "UART5_TX"),
@@ -1590,7 +1590,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(106, "PG10"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOG10"),
 		STM32_FUNCTION(1, "TRACED8"),
 		STM32_FUNCTION(2, "HDP0"),
@@ -1603,7 +1603,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(107, "PG11"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOG11"),
 		STM32_FUNCTION(1, "TRACED9"),
 		STM32_FUNCTION(2, "HDP1"),
@@ -1617,7 +1617,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(108, "PG12"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOG12"),
 		STM32_FUNCTION(1, "TRACED10"),
 		STM32_FUNCTION(2, "HDP2"),
@@ -1631,7 +1631,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(109, "PG13"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOG13"),
 		STM32_FUNCTION(1, "TRACED11"),
 		STM32_FUNCTION(2, "HDP3"),
@@ -1647,7 +1647,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(110, "PG14"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOG14"),
 		STM32_FUNCTION(1, "TRACED12"),
 		STM32_FUNCTION(2, "HDP4"),
@@ -1662,7 +1662,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(111, "PG15"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOG15"),
 		STM32_FUNCTION(1, "TRACED13"),
 		STM32_FUNCTION(2, "HDP5"),
@@ -1677,7 +1677,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(114, "PH2"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOH2"),
 		STM32_FUNCTION(2, "LPTIM2_CH1"),
 		STM32_FUNCTION(3, "SPI7_RDY"),
@@ -1693,7 +1693,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(115, "PH3"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOH3"),
 		STM32_FUNCTION(3, "SPI1_NSS I2S1_WS"),
 		STM32_FUNCTION(7, "UART7_RX"),
@@ -1706,7 +1706,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(116, "PH4"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOH4"),
 		STM32_FUNCTION(7, "UART7_TX"),
 		STM32_FUNCTION(8, "TIM17_BKIN"),
@@ -1721,7 +1721,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(117, "PH5"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOH5"),
 		STM32_FUNCTION(5, "SAI2_FS_A"),
 		STM32_FUNCTION(7, "UART8_CTS"),
@@ -1736,7 +1736,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(118, "PH6"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOH6"),
 		STM32_FUNCTION(2, "LPTIM2_IN2"),
 		STM32_FUNCTION(5, "SAI1_MCLK_B"),
@@ -1751,7 +1751,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(119, "PH7"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOH7"),
 		STM32_FUNCTION(3, "SPI1_MOSI I2S1_SDO"),
 		STM32_FUNCTION(5, "UART4_TX"),
@@ -1765,7 +1765,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(120, "PH8"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOH8"),
 		STM32_FUNCTION(3, "SPI1_MISO I2S1_SDI"),
 		STM32_FUNCTION(4, "SPDIFRX1_IN3"),
@@ -1780,7 +1780,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(121, "PH9"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOH9"),
 		STM32_FUNCTION(4, "SPI6_NSS"),
 		STM32_FUNCTION(5, "SAI3_MCLK_A"),
@@ -1793,7 +1793,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(122, "PH10"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOH10"),
 		STM32_FUNCTION(3, "SPI1_SCK I2S1_CK"),
 		STM32_FUNCTION(4, "SPI6_MOSI"),
@@ -1806,7 +1806,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(123, "PH11"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOH11"),
 		STM32_FUNCTION(4, "SPI6_MISO"),
 		STM32_FUNCTION(5, "SAI3_FS_A"),
@@ -1818,7 +1818,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(124, "PH12"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOH12"),
 		STM32_FUNCTION(3, "SPI3_NSS I2S3_WS"),
 		STM32_FUNCTION(4, "SPI6_MISO"),
@@ -1829,7 +1829,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(125, "PH13"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOH13"),
 		STM32_FUNCTION(3, "SPI3_SCK I2S3_CK"),
 		STM32_FUNCTION(4, "SPI6_MOSI"),
@@ -1841,7 +1841,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(128, "PI0"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOI0"),
 		STM32_FUNCTION(1, "TRACED14"),
 		STM32_FUNCTION(2, "HDP6"),
@@ -1856,7 +1856,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(129, "PI1"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOI1"),
 		STM32_FUNCTION(1, "TRACED15"),
 		STM32_FUNCTION(2, "HDP7"),
@@ -1872,7 +1872,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(130, "PI2"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOI2"),
 		STM32_FUNCTION(4, "LPTIM1_ETR"),
 		STM32_FUNCTION(5, "SAI4_SCK_B"),
@@ -1885,7 +1885,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(131, "PI3"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOI3"),
 		STM32_FUNCTION(4, "LPTIM1_IN2"),
 		STM32_FUNCTION(5, "SAI4_SD_B"),
@@ -1898,7 +1898,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(132, "PI4"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOI4"),
 		STM32_FUNCTION(4, "LPTIM1_CH1"),
 		STM32_FUNCTION(5, "SAI4_FS_B"),
@@ -1910,7 +1910,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(133, "PI5"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOI5"),
 		STM32_FUNCTION(3, "SPI5_MOSI"),
 		STM32_FUNCTION(4, "SPI1_MOSI I2S1_SDO"),
@@ -1924,7 +1924,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(134, "PI6"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOI6"),
 		STM32_FUNCTION(2, "MCO1"),
 		STM32_FUNCTION(7, "USART3_TX"),
@@ -1936,7 +1936,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(135, "PI7"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOI7"),
 		STM32_FUNCTION(7, "USART3_RX"),
 		STM32_FUNCTION(8, "TIM2_CH1"),
@@ -1947,14 +1947,14 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(136, "PI8"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOI8"),
 		STM32_FUNCTION(16, "EVENTOUT"),
 		STM32_FUNCTION(17, "ANALOG")
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(137, "PI9"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOI9"),
 		STM32_FUNCTION(2, "SPI7_MOSI"),
 		STM32_FUNCTION(3, "SPI2_MOSI I2S2_SDO"),
@@ -1970,7 +1970,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(138, "PI10"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOI10"),
 		STM32_FUNCTION(2, "SAI1_SCK_A"),
 		STM32_FUNCTION(3, "SPI1_SCK I2S1_CK"),
@@ -1986,7 +1986,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(139, "PI11"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOI11"),
 		STM32_FUNCTION(3, "I2S2_MCK"),
 		STM32_FUNCTION(6, "UART8_TX"),
@@ -2389,7 +2389,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 static const struct stm32_desc_pin stm32mp257_z_pins[] = {
 	STM32_PIN_PKG(
 		PINCTRL_PIN(400, "PZ0"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOZ0"),
 		STM32_FUNCTION(3, "LPTIM3_IN1"),
 		STM32_FUNCTION(4, "SPI8_MOSI"),
@@ -2404,7 +2404,7 @@ static const struct stm32_desc_pin stm32mp257_z_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(401, "PZ1"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOZ1"),
 		STM32_FUNCTION(3, "LPTIM3_CH1"),
 		STM32_FUNCTION(4, "SPI8_MISO"),
@@ -2419,7 +2419,7 @@ static const struct stm32_desc_pin stm32mp257_z_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(402, "PZ2"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOZ2"),
 		STM32_FUNCTION(3, "LPTIM3_CH1"),
 		STM32_FUNCTION(4, "SPI8_SCK"),
@@ -2433,7 +2433,7 @@ static const struct stm32_desc_pin stm32mp257_z_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(403, "PZ3"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOZ3"),
 		STM32_FUNCTION(1, "DBTRGI"),
 		STM32_FUNCTION(2, "DBTRGO"),
@@ -2451,7 +2451,7 @@ static const struct stm32_desc_pin stm32mp257_z_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(404, "PZ4"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOZ4"),
 		STM32_FUNCTION(1, "DBTRGI"),
 		STM32_FUNCTION(2, "DBTRGO"),
@@ -2468,7 +2468,7 @@ static const struct stm32_desc_pin stm32mp257_z_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(405, "PZ5"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOZ5"),
 		STM32_FUNCTION(2, "MCO1"),
 		STM32_FUNCTION(3, "LPTIM3_ETR"),
@@ -2482,7 +2482,7 @@ static const struct stm32_desc_pin stm32mp257_z_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(406, "PZ6"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOZ6"),
 		STM32_FUNCTION(1, "DBTRGI"),
 		STM32_FUNCTION(2, "DBTRGO"),
@@ -2497,7 +2497,7 @@ static const struct stm32_desc_pin stm32mp257_z_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(407, "PZ7"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOZ7"),
 		STM32_FUNCTION(4, "SPI8_MOSI"),
 		STM32_FUNCTION(5, "MDF1_CCK1"),
@@ -2510,7 +2510,7 @@ static const struct stm32_desc_pin stm32mp257_z_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(408, "PZ8"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOZ8"),
 		STM32_FUNCTION(3, "LPTIM3_IN1"),
 		STM32_FUNCTION(4, "SPI8_MISO"),
@@ -2525,7 +2525,7 @@ static const struct stm32_desc_pin stm32mp257_z_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(409, "PZ9"),
-		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AJ) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOZ9"),
 		STM32_FUNCTION(2, "MCO2"),
 		STM32_FUNCTION(4, "SPI8_RDY"),
-- 
2.34.1


