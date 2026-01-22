Return-Path: <linux-gpio+bounces-30898-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mEI+LXo9cmnpfAAAu9opvQ
	(envelope-from <linux-gpio+bounces-30898-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 16:08:42 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E68C68660
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 16:08:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5F3347C36FB
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 14:15:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CEE234B1A6;
	Thu, 22 Jan 2026 14:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="CQvleRN7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68997315760;
	Thu, 22 Jan 2026 14:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=91.207.212.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769091309; cv=fail; b=p7t6WdX3SUCOjbwA3rnz/BlhhzdXoQIBwf2AzJW39nuG5A315HiDvnFjf0j1ex7/YzW6M4ArrsBGjDYIsgOwEAVUpXanOjjye19WilqUJgWDQSCv/jUR2r/GclIpiTFUdFbR0XaT4IavE026JT56Q3egjng1THPMykYbs0BQKmw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769091309; c=relaxed/simple;
	bh=QKtH0+b6yWHZ+5aYHDFJjYqr5yPopTypg3FyQn1miFM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=HkIKdrbgwKMxLKzFbAyr5CayzvBXNas/NEVg5n6Qx625q4uU1D9PetZPp574I0V7FDvCQ7kTxVe9ljUCcQI5dCUcC9hweCj83cV6Qe78V+fvW3pHUmwKe8iEfy79pDhViAJoxQggFseodCz7Nsd36pu3drrtaFRs1R7mnB8IFCI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=CQvleRN7; arc=fail smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60MEDW54023147;
	Thu, 22 Jan 2026 15:13:32 +0100
Received: from mrwpr03cu001.outbound.protection.outlook.com (mail-francesouthazon11011022.outbound.protection.outlook.com [40.107.130.22])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4bumsf05p7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 22 Jan 2026 15:13:32 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C3Xlhd0tS0EtAu5TWGPrzv7ep13Hj7xNDwatHzhzaE0HqpbZV4w1GX+TmkrFi7gQmNDElqpE7yUSCB8VBRNZTRFmPkIA6ufjYjMz03d6okuJcsnD+2HarKjLVbTCXSd65jsWzJz5cNw0YA+d7B5keAMQdJYpP0Kxh0CSRJA/cae7XDu+Lm/qqMgpopY59TD+w1poj3TntaevQxCF2MP+ade8gEh3BjncTKtS4MkA7A1Ul78lhvA/IMXdErEHw3e0qH6gu1dwCFNNJm+lkOfQ3kcZU2hRVr4gA772aILdS4TQNWFQfZ88Ur/sGRpBUARCLOP33hs1nG/vwCR40iQK3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f2FPB5evfT4KLIC3AF8ZnI6/hB3gahy5vMpkKNmFUQo=;
 b=p9e0wLSEFqawe2upYUKI3XkiGzFyMNq0XeiimSeN3vIGDbO9Gfg/HUJQ9kQw+1gxl0Wn+ih0waKAF0JQs/M3CUQtzLvYVFaeccOn0jOTxRniw4hR9ZSrKiDCerZ05vAquj4TtSNNKfQgozs3LBZVZ5TyeB6FptjTbFNe8ACk0sTxGbQmpA7GqF8XySvY/hmVHcaVRusvRnbCCGdgQKcLxw8xOeKhJg8a0ilDWDgIfzseqRWkYgycjuxeFD2Vcg9/uc7CBaVn0zYvwm0EknDX7i8Yka27/1suZZpq/cD2kn1LKO4n0gXCIUvscpH84lM5PRsDdy3pVImp7zDlvDOUGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f2FPB5evfT4KLIC3AF8ZnI6/hB3gahy5vMpkKNmFUQo=;
 b=CQvleRN7yHexzCzvPnN97jl1raZdYKsPQAoC3Ti/FxtuP0lewmluAivO5S/BmA+TTQB1tl1rzvxBYUv6c2XO9fpyrUtLLBnMx1ALRieDYBIX2D1vAthecwaO9B47awRSt+V5dorWkEB14eAHPcB88I2JnSJl8l9NOOgYuEqLgJCy/vPjQsxg+CYRDntYb4fHSBaovAAStRq9nQTIjowd6PWJUZG4/PH6jYuQnfJSaNx1J4LG5aLfq3ImX8Gg2d/ZyuZdqNb2oa5Pt9OlNbNUbw/jlG2rH/m1smINQ9TIN1GtxG9w425yA6PrM2xNw5Ijdz02suTJ1wo6RNfhHb/bKQ==
Received: from AS4P251CA0029.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:5d3::19)
 by VI1PR10MB3615.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:139::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Thu, 22 Jan
 2026 14:13:27 +0000
Received: from AM2PEPF0001C717.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d3:cafe::ee) by AS4P251CA0029.outlook.office365.com
 (2603:10a6:20b:5d3::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Thu,
 22 Jan 2026 14:13:24 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM2PEPF0001C717.mail.protection.outlook.com (10.167.16.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 22 Jan 2026 14:13:26 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 22 Jan
 2026 15:14:47 +0100
Received: from [10.48.86.212] (10.48.86.212) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 22 Jan
 2026 15:13:25 +0100
Message-ID: <f3250e5e-5fa0-4730-8e0c-14d35bcc0705@foss.st.com>
Date: Thu, 22 Jan 2026 15:13:15 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/12] dt-bindings: bus: document the stm32 debug bus
To: Rob Herring <robh@kernel.org>
CC: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Mathieu
 Poirier" <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>,
        =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>,
        "Linus
 Walleij" <linusw@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        <jens.wiklander@linaro.org>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
References: <20260121-debug_bus-v3-0-4d32451180d0@foss.st.com>
 <20260121-debug_bus-v3-3-4d32451180d0@foss.st.com>
 <20260121152124.GA3179930-robh@kernel.org>
Content-Language: en-US
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <20260121152124.GA3179930-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C717:EE_|VI1PR10MB3615:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b8071ce-e120-4049-bdb1-08de59c06965
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700013|82310400026|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M1RDL0wwaXNpaTI0c3BFL21KVjdDeUUzQndFbU9IRy9BaGl4Z2hrRzNYVkVV?=
 =?utf-8?B?UWtDaUNGM2hWVFdsb2FTRDR5Y256N3VtOVRlbXgrcEltSFRDcUEvVmdPb3N6?=
 =?utf-8?B?Vnlta1pNZEVjWGpMcjVSdjNrTERDZGZlTVUvNDJicW5NU3RoQjhiRnIwcTdX?=
 =?utf-8?B?cmxzQTg2Y1BJTzdIMVdmcTBndnJ3d0tobmJ3V0xrY0JCZ3NYYXJTdk4rY0po?=
 =?utf-8?B?WHZyb2JWdzVBSHZUb0daNnBLakw4MjF1OWt2b21KSkJDOE9UWHM5emNLRmN6?=
 =?utf-8?B?VG9zMXVnelUwNVgyUnNsL0lCaHIzRG9BSWorWkdYM1dCb0g3QlJkUGNDUWFO?=
 =?utf-8?B?K3IydzFyVXh1U1lJVHBMbndUZHpNTkRPS1NySlQ4SWtPeXgvK0Urc1E4QndN?=
 =?utf-8?B?WEFtd0ZqTzlNeGZCQUttcGZWa1dsTXRwb01UcUY4VFZtWW1SdzNtbEJDYUY1?=
 =?utf-8?B?aUFtWWNVckRjSkdRVnIxRTcwaFRycHpmVkpCbUtUd3lqZmpSRFhQTUI2bGRk?=
 =?utf-8?B?YUoyMXJ0QVlVcnVLa2NUb3kwL3BMWjI3aEpvdUh1dTNiS0JSakFZUWpFTzFu?=
 =?utf-8?B?WGQyMDAvREVTRjd1cjNpVEs5Q2p2cGF4ay9DUlR0czVsb3hGbG43OWE1TGhr?=
 =?utf-8?B?aHNUUDRaSjVIMEFsTmxaWjZHRk0yd1RiN1dRL3NFNnd2N2E5Szg0OHlLdnhr?=
 =?utf-8?B?RWlaUG1hK1loRExRUU9icWJXTXlHUTFIS05PVFJ4YTZ0RGY3bWs3anEwbDZO?=
 =?utf-8?B?RzNEV2RZOUNqbUxtcll1MDhPVVRUYmVsR3A2Vnd2ekorbkhuNUk3czRTb1Z3?=
 =?utf-8?B?OGRiWHRNcFR1MlBjc2ZHY2ZuWEhuS2V2bnJtQmdXM0JMUlpLQzA3Ly9HaVNQ?=
 =?utf-8?B?YkE2WHAxWi9Md3JjekVjdE1PaVV2SFAxbHk3bno0eWs3WVJWTUxGRHVyNzFZ?=
 =?utf-8?B?WXg2Wnc0T1g2d1JmcW1uZEgyVWNzTklncG9EaXlQbVpWLzV1SENVYWpyY2Mr?=
 =?utf-8?B?Z0FHUHl6VllKSlZwNm1rM3BrRGkxZDltQ0dRL1MxUysvaUpOZjczWGtkcUdo?=
 =?utf-8?B?dDdjVmFLZGRQYlVtZjI0NG9mT2VJWnlDcmtOTWhVdEtEcXdKRmt2cnUxOEEy?=
 =?utf-8?B?ckNQYm4rNGd5c0tHT1JOMmUxUlhjcldTa1ZqNy9lWDVSUHl6NnBBZWZqdkYx?=
 =?utf-8?B?SGV2RjgrZGthakZzZFhFaWFQaC9DRkJOMGlTYkpKQXhPb1JialZXN1BhSjlY?=
 =?utf-8?B?UE84Z0xBWUNPbVZUK0c2dkZUdmFZSkZjSnB6cnAyZk1xSjdFNDE1TFh2a2sy?=
 =?utf-8?B?cnhQbm1kMkQ5VDdNMVNoYVNlNmpYLzJTZ1ZtQngwRDFSRWZQRyt5RmllUWpV?=
 =?utf-8?B?WEIxTXNUUGpMc0lvUjhocmNidVA2dERJbC9pUUpSQkxzL2gvdnpoUE93b1Zj?=
 =?utf-8?B?aG9FK05TVjlSVFpKVzArL1pDSjRrUEZDVDRoR1pqVTNDVFQyVE9BWFdMbi96?=
 =?utf-8?B?S01mZFRwcDlkNkQ2MVhxN3dERDNBOTVkQUtucjBsRTRrMFlKSWowYk1PZllL?=
 =?utf-8?B?eUtsbVkzRjN5aDJGYXVIYTRBRUN1SWhaM3Jya0dZblF0MTVTR2h6dGI3SXJi?=
 =?utf-8?B?Qi9HN1VQeGNhVnNsT1ZMNWJ3Rmh6QTR2dkUvSUtpZE5vYUkzbWJHcURUWHdD?=
 =?utf-8?B?S21aMEdqbG9MWTNvQ3l3K2RwNDcyeEdSQWh1SUZvYXhvU01zTEkwRTBkaURT?=
 =?utf-8?B?K2NlcjVSaWRvZ0JOODZ0eUYyN2hRUGJySlRUTUJTWlh6cjhCNHVzSnMrQ0VW?=
 =?utf-8?B?RUFaTUhMaUFtQ21sZ2g3STdDcVY1VTYrQ3JPSlpyOEJkMnk1VFJ2VDdYS2to?=
 =?utf-8?B?bG9qNVVCajdGeWN5UEVKTTRLZStoaExPYXZ4Q2F6Yk91dFJDUVhxN2R4NHk3?=
 =?utf-8?B?NlkrWkVMU3luZzNvWC9lQXpjK3hVMmZFZnk0N3dtWGlQYTQvM3dOVlptMzBG?=
 =?utf-8?B?WE1qRlRqOWJocU9DaGpxQm5jOGw3L3pTbksrZFEyMHhqUmxJM0IwaldhNmlJ?=
 =?utf-8?B?c2NYM1hMd0gvMmpXTWFLbUxxcXNQRjQwZ09KUFJWejUyc1NQWFlDVjh4cGZY?=
 =?utf-8?B?UHYwd0RYeFllM2FwbjVKK29iclBMZytkS0h3RnNPYVVSVDZlYTZJTmZva2Rm?=
 =?utf-8?Q?5e0i3Xg7Q+L26mzlst+dT4g=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700013)(82310400026)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 14:13:26.9171
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b8071ce-e120-4049-bdb1-08de59c06965
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C717.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3615
X-Proofpoint-ORIG-GUID: l2doOy_TilBDbXkdaYl7n3W4DWq-Ay-f
X-Proofpoint-GUID: l2doOy_TilBDbXkdaYl7n3W4DWq-Ay-f
X-Authority-Analysis: v=2.4 cv=HbUZjyE8 c=1 sm=1 tr=0 ts=6972308c cx=c_pps
 a=wstiicNh2/SfyO08CDRWbg==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=rg8MelPR9j8A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=8b9GpE9nAAAA:8
 a=Uy8sdeCgRwOuE3k0pAgA:9 a=QEXdDO2ut3YA:10 a=sptkURWiP4Gy88Gu7hUp:22
 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDEwNyBTYWx0ZWRfX4VlssI3bAhZ/
 bQtpT1djEn5dCpJxuYajERi76o/ndWmx9CtCPjBNzEbzZ+SaosfJFRtczDMG+AWw/MaT4d4ZVWC
 2F7F9tGvHqKWmHPpAQQIWi9bHSWxDIfurhAJKOBmSUWWhzEymG4E3yxUKS/e9d7lvFIR6SbYqzZ
 +wxr+OjQSGF1WAUn4pVL1jOGiUnQS4bMo+MiD84XKxMNK10W7J10Fv1YqZ1L7V/BU9/lXpWwrRC
 GvicBq8AY7fY6U1OQscb8v7VYtfvL+UUKvl+J3IHQUeuVEhChpgf98Rju+Y9NxrxNJny0w/kadH
 2wmblg5kDgyllV3uy1xvgHdfsl2KD7L8AI7GaGoi53aUowbHFjXOdkUPnOyLka6VWJ4Jxp3uMbe
 JSrWjvCnAiWExN0RJnaLexGllPu5QrLbAhHEa26cs7yCsv7zikFGJBAxyLBNLFKcIvYVoz8Dpoq
 TxVcwWC9RN+OrZabd1w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_01,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601220107
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30898-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[2.252.41.0:email,devicetree.org:url,2.252.95.176:email,st.com:email,ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns,foss.st.com:mid,foss.st.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[arm.com,linaro.org,kernel.org,linux.dev,gmail.com,foss.st.com,lists.linaro.org,lists.infradead.org,vger.kernel.org,st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[foss.st.com,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gatien.chevallier@foss.st.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:+];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 4E68C68660
X-Rspamd-Action: no action



On 1/21/26 16:21, Rob Herring wrote:
> On Wed, Jan 21, 2026 at 01:34:37PM +0100, Gatien Chevallier wrote:
>> Document the stm32 debug bus. The debug bus is responsible for
>> checking the debug sub-system accessibility before probing any related
>> drivers.
>>
>> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
>> ---
>>   .../bindings/bus/st,stm32mp131-dbg-bus.yaml        | 79 ++++++++++++++++++++++
>>   1 file changed, 79 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/bus/st,stm32mp131-dbg-bus.yaml b/Documentation/devicetree/bindings/bus/st,stm32mp131-dbg-bus.yaml
>> new file mode 100644
>> index 000000000000..2db35e41e76c
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/bus/st,stm32mp131-dbg-bus.yaml
>> @@ -0,0 +1,79 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/bus/st,stm32mp131-dbg-bus.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: STM32 Coresight bus
>> +
>> +maintainers:
>> +  - Gatien Chevallier <gatien.chevallier@foss.st.com>
>> +
>> +description:
>> +  The STM32 debug bus is in charge of checking the debug configuration
>> +  of the platform before probing the peripheral drivers that rely on the debug
>> +  domain.
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - enum:
>> +          - st,stm32mp131-dbg-bus
>> +          - st,stm32mp151-dbg-bus
>> +
>> +  "#address-cells":
>> +    const: 1
>> +
>> +  "#size-cells":
>> +    const: 1
>> +
>> +  ranges: true
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  "#access-controller-cells":
>> +    const: 1
>> +    description:
>> +      Contains the debug profile necessary to access the peripheral.
>> +
>> +patternProperties:
>> +  "^.*@[0-9a-f]+$":
>> +    description: Debug related peripherals
>> +    type: object
>> +
>> +    additionalProperties: true
>> +
>> +    required:
>> +      - access-controllers
>> +
>> +required:
>> +  - "#access-controller-cells"
>> +  - "#address-cells"
>> +  - "#size-cells"
>> +  - compatible
>> +  - ranges
>> +  - reg
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/stm32mp1-clks.h>
>> +
>> +    dbg_bus: bus@50080000 {
>> +      compatible = "st,stm32mp131-dbg-bus";
>> +      reg = <0x50080000 0x3f80000>;
> 
> That's a lot of registers... Yet the bus driver doesn't access any.
> Looks to me like this belongs in ranges instead if there aren't any bus
> registers. Or its size should be just the registers and then the whole
> region size goes in ranges.
> 

Hello Rob,

Understandable comment. I'll switch to defining the range in the
ranges property in the V3.

Thank you,
Gatien

>> +      #address-cells = <1>;
>> +      #size-cells = <1>;
>> +      #access-controller-cells = <1>;
>> +      ranges;
>> +
>> +      cs_cti_trace: cti@50094000 {
>> +        compatible = "arm,coresight-cti", "arm,primecell";
>> +        reg = <0x50094000 0x1000>;
>> +        clocks = <&rcc CK_DBG>;
>> +        clock-names = "apb_pclk";
>> +        access-controllers = <&dbg_bus 0>;
>> +      };
>> +    };
>>
>> -- 
>> 2.43.0
>>


