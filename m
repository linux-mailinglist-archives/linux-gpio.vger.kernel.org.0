Return-Path: <linux-gpio+bounces-27365-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E210ABF656D
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 14:10:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E1FBE3A5D05
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 12:05:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 891D4331A77;
	Tue, 21 Oct 2025 11:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="DeC5j07g"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F1B355037;
	Tue, 21 Oct 2025 11:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=91.207.212.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761047407; cv=fail; b=u7BxrsrlZmDRMMwWGFcWhOqRv+CVi9JYOmZnL4dlCeyXvXE16ZFWOgolLH8RZ0/wi+HrbKVdGjkCSIg03wXhQLPgzhIOf4nsVkQDx7kiA6Q94szdeWVjyMjVgRCxoxYDbWC1fbDwX1mvNZaEWcy5qLp/cZHQvmvoW7C5yfxuPB0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761047407; c=relaxed/simple;
	bh=VnQNvLJwRwg17ohc1A/bKz0hXqJ23TJymLF5dvi4ow4=;
	h=Message-ID:Subject:From:To:CC:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lzXtxjUMMb9d3FszTINdc3pGKtTuDA9nChJ9dj20JaIGRUY/iCCraSlqZMWt4elhb0i/BuugsWXdJF0CQCONriiUoMXxWOqIGvj9FdS0RszSw4GOJsv9TIzlPBovcOLnuq9RiI6hkPFpEm98uGzlWEF1D3P6M3dAHHvmCvWltBU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=DeC5j07g; arc=fail smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59LBVNF3001081;
	Tue, 21 Oct 2025 13:49:41 +0200
Received: from am0pr02cu008.outbound.protection.outlook.com (mail-westeuropeazon11013008.outbound.protection.outlook.com [52.101.72.8])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 49v1seumqe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Oct 2025 13:49:41 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rcC+0fvRJ+GSQ2KQbJmpoTGBBflmfzPtjeDiekYpdP6BB7wZwBVQI0PVQ/aYS82F8EMB2zonF1R2WEXg4gJhEWImToibuszn9wu1xkGfhdihAz9hk11KqVnQNgaP7aMNihnhJqSi9K+Ece1iFUTWlAYgmv+1RYTLgzHZ06L+dQ5RjzkbCwFiNswN9jBnSJRrsv3UnshT0kFxTIpHNCdAtm4qHlio2831fd3AtQTr/9OunhpXmmGAlaf3vFucYEwsT602uce0t3ISkteoQA1HGVnkpkcOIQJo68+vyryzJaQXRvyL5SWtDbavHGz9ACX+KEREyTLNDm9op66kvbCBkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VnQNvLJwRwg17ohc1A/bKz0hXqJ23TJymLF5dvi4ow4=;
 b=N/K5SNm7z7M13qA52MnIdWIZwzsdWb9WtESwM3LK38IXF1NHs194b4AW2L0LkEzS1v0Q8BNyprBbEOjAJy8oVr5U6ARVeCuS5zb4pwzI/1anG+6XqihBBPAXh1qnub2WpM65U8tKrGt5pOqdVd+B/q7gD97c2ArvVfjBzVIvrNv9JUxhrL49yrPb+xz5QkHD3KSBFVLoR1xkmaHx0CuT1vCpA4yZ/rhURS0XxiHqXfUWo6gS4APoQJ2mGYx8umV+RrCH3j1PGS/v9Ue+JlSCZ8CTlwbc+TZWjAK52arhHIvNH6mVPlaGZ2qIOykh51mGa/Rua+WLhwqRZf1Ynu7QZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.43) smtp.rcpttodomain=linaro.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VnQNvLJwRwg17ohc1A/bKz0hXqJ23TJymLF5dvi4ow4=;
 b=DeC5j07gV1aOGWl41WeKtDGnNuxeYU9nv4Q1wFKk1tu9mQZ4OIZrhpVGvCHvIR+4vEz8MjYnV7RI8U5e0UIPWNNRt8qXiuIA40nJ0NRHg3ZW9CUXyNycaLkiVBvuO5C4Su52J3Wad5mzOHB1vXzI6jNpPnL/bZcPTj7e3ACw192zncz/TaJrSmBuPRUhdPEg5ECYyTRGkWNg5MfxXVStHMUlx7qMTyWPSf8nGJf90aB0iXcuctzUKdGs5e7N580JT7IVzv/bVRkZ429F4/z9I9fjqg+0wVd5HSmX3SFeNgFkQRZQH+WZpBBRlHoMpKS8oSB0Wmp8f+KnrjBaISub7w==
Received: from DU2PR04CA0036.eurprd04.prod.outlook.com (2603:10a6:10:234::11)
 by PAVPR10MB7164.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:312::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Tue, 21 Oct
 2025 11:49:38 +0000
Received: from DB1PEPF000509EC.eurprd03.prod.outlook.com
 (2603:10a6:10:234:cafe::20) by DU2PR04CA0036.outlook.office365.com
 (2603:10a6:10:234::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.12 via Frontend Transport; Tue,
 21 Oct 2025 11:49:38 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.43)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.43 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.43; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.43) by
 DB1PEPF000509EC.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Tue, 21 Oct 2025 11:49:37 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Tue, 21 Oct
 2025 13:47:13 +0200
Received: from [192.168.8.15] (10.48.86.11) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Tue, 21 Oct
 2025 13:49:36 +0200
Message-ID: <9dfdf02b7e5a99c515aff3c6528e2d5f70517201.camel@foss.st.com>
Subject: Re: [PATCH v3 09/10] dt-bindings: pinctrl: stm32: Support I/O
 synchronization parameters
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Linus Walleij <linus.walleij@linaro.org>
CC: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        Christophe Roullier
	<christophe.roullier@foss.st.com>,
        Fabien Dessenne
	<fabien.dessenne@foss.st.com>,
        Valentin Caron <valentin.caron@foss.st.com>
Date: Tue, 21 Oct 2025 13:49:35 +0200
In-Reply-To: <CACRpkdbeaiNGfOFfVfDNZ=u=4yhCykcdSdHUv-td_DVyr3aWaQ@mail.gmail.com>
References: <20251014140451.1009969-1-antonio.borneo@foss.st.com>
	 <20251014140451.1009969-10-antonio.borneo@foss.st.com>
	 <20251014-affection-voltage-8b1764273a06@spud>
	 <b4eca95eaa0e6f27fc07479d5eab2131d20eb270.camel@foss.st.com>
	 <20251015-headstand-impulse-95aa736e7633@spud>
	 <0826a055f6b2e3e6b50a5961e60d1b57d1d596c6.camel@foss.st.com>
	 <CACRpkdbeaiNGfOFfVfDNZ=u=4yhCykcdSdHUv-td_DVyr3aWaQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509EC:EE_|PAVPR10MB7164:EE_
X-MS-Office365-Filtering-Correlation-Id: 36a0ed8d-b0aa-4d57-666f-08de1097e9a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eEdKcmxPVlArdWpHY1RXNFZYRkpVZUw2OG5qOXN0VG1md3VuWi9JUUdHRDgw?=
 =?utf-8?B?Q0k3MFdER0x5czhYWjZRSjhSOWhtcE9wcWFCVEppMmtUajRXZWlXRHJoMmNY?=
 =?utf-8?B?VHBtMXg0cnF1SkpXUW9BZTJSUmJYNjI0S21iOW1wdUhPVk44NXZhTGk1ZlVu?=
 =?utf-8?B?VGhHaU5PWWhOZG5WRG1qL3RtYklDcktZTERaRHpiMU5KWUswb08wVTVRUDFk?=
 =?utf-8?B?NGt6TG9YajBGdjJqVXFyUVFLS2NLdW9OOEowMlVxZnN5SUVPdzBSODlHbG04?=
 =?utf-8?B?eWlqS1RTTDZ3ejlrUDdNeXFlcjBEUHlWbUNobGNSaHZkZVJPMlB3RXREOC81?=
 =?utf-8?B?NEI3bGozQk0xcnE2UTNDZWE4bk90RnF3Zy81ZTAvSjJ3SXdELy82WFlPNHNt?=
 =?utf-8?B?SDVudmhCVTd5L2x2T1BWekZwYjZ1OHFpbmEzZU1LckliMU5MWlg0Z1Q3dERj?=
 =?utf-8?B?c2JKTVorRmtuWkw1QzFLd0xiSU5YYkhsM0RoQXhRMW1XTkZwenhIdnpGb1I5?=
 =?utf-8?B?UEtuM1RWWlBEYnNBbUNHeThTeCtweFZFcWpsTjdlVjQxUit3Q3V5cXVRMnZO?=
 =?utf-8?B?alpBY0NOOUQyb0tHSEFPdENzQ1JKMk9wZFp5MTZaeUFyTlBnUHBUa3dPd3ph?=
 =?utf-8?B?a1c0Q0Z3eDBkcUxGT2x4RWR3bE5MRURDU25nSkhVTmFGOHNHMVRLS0lyMVRh?=
 =?utf-8?B?SjJ1cGZFOCtTeFllV0dDNmJCWkttZDk0WGdaWVlTSFZ0L0htVnhFdEJEUnZv?=
 =?utf-8?B?QWVOc2YxdzNwNXZNZGF6MzcxM2FqdERNSWEwNEtnU2luUnlaK201M0NrODF0?=
 =?utf-8?B?b3ZCRlZBWTAxUjNSa2x2M1VVQUtjZy9lRWl5d3BWL2gyVm9rakhMTkxFYm42?=
 =?utf-8?B?TmpSOWF6c1c3ODhubThRSHJXZzhWYjNGOEpqbDVBdHBXR1l3Z3Y0T1QrQXFZ?=
 =?utf-8?B?WEtURWtaa2loY3U2eWljcGl2TVRhNE51UW9nRndRNy9EUWRiR29XZ3NtdVU4?=
 =?utf-8?B?b1dWQ240Ym9tSEE5cEFTVUkxTk0yY3NvN3dXcWI2RTFQM1FNZDNlLzBneUR6?=
 =?utf-8?B?RFFsTGwzWU9TRWZReU0rY2xhMGFXcDFNeUF3cDdLb3JzYXJLYUkrT0t0K1Fx?=
 =?utf-8?B?eHVvYmUxQklGVldQU0IzSWFiNlExNVJ0alZMUXAwemkxMEt0bkZVL3VZYUVx?=
 =?utf-8?B?eUxva0loUmIzTTFPWkRWWnZFWGtXeUxSQ1BsTGlFcUNBUmV6US9DVVdKNXZl?=
 =?utf-8?B?VjlZTkdYdEd6andQL1pEU0Vwc0FtdzhzZGxua0FqVlZoSE52b1dwdmo0dE90?=
 =?utf-8?B?REdoUTMrbUZsN1d0N2hyemN5UkhMQytPMGJlRkZDa1JaZGhaRENrNThqOFI2?=
 =?utf-8?B?NzZEaFNKTnlPNmxrRVRCQ1JiSHBsYVF3VTY1Y2VIWjJWaDJUNXJya1hMemxk?=
 =?utf-8?B?bzVxSUZYL1VWcGk1TWVlMU1UdnovdFZ2YXl5TGR5NVhmMkdMR1VKZnl4QVBt?=
 =?utf-8?B?Y3c1NTdiUXo1enNwQVlPZndreTlHSmgzTlJvOHVRNDVPQ21HRnRvNmtrT2dN?=
 =?utf-8?B?ZXRZZnpOOTR6Rk1BYkFZaXdlWmIxWldwRUsrQlI1MmZEeTgyMXJmNkJDbUVS?=
 =?utf-8?B?R1FZeWdUY1lXa3dZSG8vbm94cmNZUzBSdUFUUlI0L0MvRHhQcG9BWGdjYVQz?=
 =?utf-8?B?SUc3Njd6c2tzcFIxMEZGb1U1WnZnSDU5VUNNTlZ5RDViWFpTbUdXTVZDbG9C?=
 =?utf-8?B?bmtvZlRyUVFsZXkvYkI2RVRLVnk1aWFnR2tHeklrdDlKSlVDeDVpU0JwWVJB?=
 =?utf-8?B?anBUV3dvVDVwTEFUNkpkNDk0Zm8vSVhmcHdFQUwrdnN0MWZWaVdaMVpDbzBZ?=
 =?utf-8?B?TWdPTXF4Z0lKdTZNZ1hkOCtQcmxybGJlZnpXZkxnNVV1dTNIQ3Zna0xuMFlr?=
 =?utf-8?B?L3FrK3BvanhzZFBjckUzV0lGNTU4QTlCYmZ5YUFLRVF6NURWdWZIdnFpVUQw?=
 =?utf-8?B?cGtiWmVNRkZaTEUrZEdKRXZvNDFYMzNWOXR5RWlldDJuc3BoZFRQalRFbnZS?=
 =?utf-8?B?eGllN0tQNlhNZWxTQnMrZzN0RmhJc0F3ZVErV1FPV3RIOEZJcVdtaE8vS2JK?=
 =?utf-8?Q?cqlI=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.43;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 11:49:37.7775
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 36a0ed8d-b0aa-4d57-666f-08de1097e9a5
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.43];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509EC.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB7164
X-Proofpoint-GUID: SLkINDrbIRH9ZK9mXS3d-41MqtyBMDrD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxNCBTYWx0ZWRfXxmr52QH5eMlS
 hIbVovuieNZclascfu0NYUE8F43zXCwSa4UhkS47UcXtJ6Uqc78zGlV1onRJCbvHzlz1d2EsPZb
 zvitrBkIFkdXVn+81DbewBrt7j0etR2viNPXlqyype4B1YgIf1RHFMuECTuuoqSC87zoyVYx5ae
 Ic/ihh6OS6sWjTtBUOiuMwgy97HtPxk7hV6wvTfL5+XwUI9yxH+bJrBIzY/74SmqmkFBfsM3V/I
 V09eRA8sKqAWQYg8wvkBHFGfgC8l3m9zoGu8TZ/KkFxa9j7bOFaqX+xYxYMqEhbtGEI0S310z4y
 GSWUDZkXroJ0w7rJ0RqNT9udQ+nRKzyb3WgY9xLWG0Aa/gg03anXN0PSBCAJM2JBCbRcowrLTHX
 3YBF0J9bsHKP7DQMWk++iBBE+t/4Mw==
X-Authority-Analysis: v=2.4 cv=GPoF0+NK c=1 sm=1 tr=0 ts=68f77355 cx=c_pps
 a=6Kf4RVHJovTFG9veQ3L6kA==:117 a=peP7VJn1Wk7OJvVWh4ABVQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=y9YUpebZf6kA:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=RD6kGg7K_GLYrIKZGgUA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: SLkINDrbIRH9ZK9mXS3d-41MqtyBMDrD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-21_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2510020000 definitions=main-2510180014

On Tue, 2025-10-21 at 00:08 +0200, Linus Walleij wrote:
> On Mon, Oct 20, 2025 at 5:09=E2=80=AFPM Antonio Borneo
> <antonio.borneo@foss.st.com> wrote:
>=20
> > pinconf-generic only accepts positive numeric values for
> > both generic and custom properties in struct pinconf_generic_params.
>=20
> Do you need it to support negative values?

No, the point is not the sign, but the value that has to be numeric. More d=
etails below.

> Patches welcome!
>=20
> > Plus, I haven't found any existing driver that mixes pinconf-generic wi=
th
> > custom string values.
>=20
> Maybe I misunderstand, but pinconf_generic_parse_dt_config()
> looks at=C2=A0 pctldev->desc->custom_params and
> pctldev->desc->num_custom_params found in
> struct pinctrl_desc in
> include/linux/pinctrl/pinctrl.h

The issue is that parse_dt_cfg(), called by the above mentioned pinconf_gen=
eric_parse_dt_config(), only uses of_property_read_u32() to get the value o=
f the property.
Conor's proposal for replacing my
st,io-sync =3D <0>;
with
st,io-sync =3D "pass-through";
doesn't fit in!

For my use case I'm going to extend parse_dt_cfg() with fwnode_property_mat=
ch_property_string() to extract the index from an array of strings.
Then such index would be used for pinconf_to_config_packed().
Does this approach look reasonable?

I will send out the series shortly, after some test.

Regards,
Antonio


