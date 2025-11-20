Return-Path: <linux-gpio+bounces-28889-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A28EC734E3
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Nov 2025 10:51:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 372E82FEF3
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Nov 2025 09:51:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A03EB27FD48;
	Thu, 20 Nov 2025 09:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="N8dZ/G7I"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CBD013777E;
	Thu, 20 Nov 2025 09:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.182.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763632288; cv=fail; b=G6afgdxqHL/IH/Mg9ArbDd7EDSMlwxYFJmm/iZ6hbryaw8wGGQOIEb35rTeEm8PjPuus5V4JKrABXIhEzEgcWgv8ANjbaKFKHoXQHX2jfzO94RuzTrzu2F9/+1T3SD8CVv7gdZzDfpCtzUzOwEXDeJU7fNIfYmXe/ixBJBt2aRQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763632288; c=relaxed/simple;
	bh=p7SmfZkcjmdrpyEQ/FmWhe4bphf22SR0VFIWNMupeIg=;
	h=Message-ID:Subject:From:To:CC:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ckblcYw4io6oL8M9pBoYKDs9psfLejPxPOMW7PF/tFC+SRkaO4gEJ9vAYzi3oG8MCUtuxM1ZEdxW648/m+IRKttBcsvD0o2A6ES+z6CWxPX2cS/hTRNN2JDWpqEZjNsjTg5ELjJ0G0ocX+AbXXNXQe8wBhEG3KXBJjz+mzb/dBc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=N8dZ/G7I; arc=fail smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AK9Qc9h499919;
	Thu, 20 Nov 2025 10:50:58 +0100
Received: from du2pr03cu002.outbound.protection.outlook.com (mail-northeuropeazon11011031.outbound.protection.outlook.com [52.101.65.31])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4ahfcpurfy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 20 Nov 2025 10:50:57 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cpmsH5583NTkp02pTZLi7CemJtgA2zEW1yI/cOGRpckbHovxAMT+G+MhTQDPW82mp6H9YRP5B43dbslEh2jkWheyyp6oGFm6egX3UIfaUB0R37aAvs5i3EDE61sEcmVvGi2oOkYjr247olEFkh9npe/pN58fcObOim9vj3Alp0xwWfN/KWl34c+obXYjrw7YszrLlh9xhSaH3jjDcgoQFYf+kmzrZVNIiXkx1x5+E4wuW11XBsQYbQsq4TJpzb7H8SRwxGLLtS3plYLa9dYTcG1jNiZLiUd7Khf2X+V8HrtkBh1CNFIExeZy258inK9DaQ9765h6hPpUs/cP/e/UQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p7SmfZkcjmdrpyEQ/FmWhe4bphf22SR0VFIWNMupeIg=;
 b=Xdj+2kx1YfmKzwGT6HFnrseFp/k1d2dlW6SefYsP6Hu2es5ZWJxHiRFmFWvg5gDYgj3Q8B0t6t35FW5sxC0Mi/mxsJa254dQjvQe/zkm1xQAEIFWXEfqKCZwH69mINLzlpqBOmbV90zFirdc7vAO4d+KEtPq/ceJJrlriacndLI94tpR9aNRK3YVVOMG043/7w8cm4N3DFl41+QjtGMcx+uwDn8zmQNmzZAXna30B2nuh1prJbOaFNkV5T7685wVeT+TwVDTSoukChgsaY38hki6NMnEhWQzkI5w/sdmkxnlkyOwlHC1LGgXZLYvg6wL+DO3jqZaqhDIuvow7Ocppw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=linaro.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p7SmfZkcjmdrpyEQ/FmWhe4bphf22SR0VFIWNMupeIg=;
 b=N8dZ/G7IUXTjE44YvGzSBMHRFiZAFQNncufAvZc3ZaN8yxWpUdh+SsLLtMuYEsWyjPv+UDj2myZAFEtcn+OWirZqVzI5W5zAEXLcm2DMPrEx1O4aEwuAvz6GSmoSvFK3taJUntg15oEAX9+T1qjXgiI/TGQJezdGXjI8rPZQkltPd1FnRlMiNGulKHPTwFc7yJk40vigejNseZ1rqRGCce2aRJ2I56ZVjz75KeNMqUzlFURFfrassK7MC8SySZ2NFPzRarPufSqrBU2juBe8FuZJVavO6IC9UPrTzoz1EAfzbxq7gRAP7lQT2WqcAE1vOKoDg8zwmk0W1yyVHxDITQ==
Received: from DU7P250CA0024.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:54f::17)
 by DU0PR10MB7335.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:445::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 09:50:55 +0000
Received: from DB5PEPF00014B9D.eurprd02.prod.outlook.com
 (2603:10a6:10:54f:cafe::fe) by DU7P250CA0024.outlook.office365.com
 (2603:10a6:10:54f::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Thu,
 20 Nov 2025 09:50:55 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB5PEPF00014B9D.mail.protection.outlook.com (10.167.8.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Thu, 20 Nov 2025 09:50:55 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 20 Nov
 2025 10:51:20 +0100
Received: from [192.168.8.15] (10.48.86.11) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 20 Nov
 2025 10:50:54 +0100
Message-ID: <c74339727ef2d9c106129cba2de58cc20645ce9a.camel@foss.st.com>
Subject: Re: [PATCH v2 02/15] dt-bindings: pinctrl: stm32: use strings for
 enum property 'st,package'
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Linus Walleij <linus.walleij@linaro.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>
CC: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        =?ISO-8859-1?Q?Cl=E9ment?= Le Goffic <legoffic.clement@gmail.com>,
        "Amelie
 Delaunay" <amelie.delaunay@foss.st.com>,
        Pascal Paillet
	<p.paillet@foss.st.com>
Date: Thu, 20 Nov 2025 10:50:49 +0100
In-Reply-To: <CACRpkdYuRas_jgi5K9hbxtJLrxxQ+wS-dJcunT5m48qS0tKXAA@mail.gmail.com>
References: <20251118161936.1085477-1-antonio.borneo@foss.st.com>
	 <20251118161936.1085477-3-antonio.borneo@foss.st.com>
	 <CACRpkdYuRas_jgi5K9hbxtJLrxxQ+wS-dJcunT5m48qS0tKXAA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B9D:EE_|DU0PR10MB7335:EE_
X-MS-Office365-Filtering-Correlation-Id: 78cb3202-fdfc-47a7-0c55-08de281a4ccf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YWdoNHZQU2h0UUNpTVQ0L0VleHZOVlNHdExtQ0ZWM1c2Vy9RMmpuMHV6VExR?=
 =?utf-8?B?TEtkSURVMDQrUUhqZ1J2NUxwMGdHQVZrUjZxVHVwRDVGbEhKWGFHZ1JsQ21Y?=
 =?utf-8?B?QlNSNTBycCsvVW9UeVYweVhnOG9uMWZTbFVMdzhLOHFjanlWd3RLbkc0NGVG?=
 =?utf-8?B?QXRHS2tzdVBZUXp3dGYveDhPT3IxRU91UjBMZUtZcmlzcmNzcVN0Q3k0dDlx?=
 =?utf-8?B?MmQ3OFlmQm11VzZaSVdYbW5TS3FEYnJDcHpqWUUwZWZLanVZUEo3OXl6WFJJ?=
 =?utf-8?B?REZRNHZjby9tdlhJenF1WnIrSER0a05oVTJMQlkxbWEzRjlmNHJFS0JlV2lk?=
 =?utf-8?B?VkFadWZGdXQ1ZnF5cWVqSHVTUmxCQThzMVZqUERwNDVVdVZlYjZUT2pFN1RO?=
 =?utf-8?B?ejlLc1N3cHRsbEdoSVhJbHYyQmg1WEdnUTg1Mi8wV2VSdlNDR3J2L2NKMjhG?=
 =?utf-8?B?b0Y3UlRnZUxTSWpFc1FhUkJ4a1QwcXFYTTU5MlJZRVFXNWNmWlhrak1XV3RL?=
 =?utf-8?B?bVV2d2FaY3pTT2JUN1dVWFE0Yll1R0RaQTl0TWMzUWJSVW9xSlpNdUg3TDBo?=
 =?utf-8?B?RGo4R2lYbEx0b3JXUi9DSXM3aWRrR3JRcTdjTzlubzdsYnNqRUlEV2owVXJ5?=
 =?utf-8?B?WFVIdVF6R3NwUW8rU1VPOGlYSUVNM2hOWElORG1tS1JQS2x5d216ckhFb2ZW?=
 =?utf-8?B?MWVOWEFCMFBybUhydmFwMVhNUG9YRkRWaGJWRHlzZ2txekNyKzFqU0hDZmxn?=
 =?utf-8?B?VGtlR216dXhWZ2NESGpuaFRWbC9LWkVrM29SL1I3M2s5MWdhUnc3OExyMUtW?=
 =?utf-8?B?djFRWWNPeG1sdWlVMkJ2NElMSWN6L280Mk1PYU4zZHBEZHN1ekZvdSthcGlO?=
 =?utf-8?B?V0RCTFlGT3RkdnBNeVk2SU1sd2dtY1ErNzF2UlJPYXdRYVNpSmg4K0dNYjZK?=
 =?utf-8?B?MEZZcEpHdUV6U2hUYlMrY0tCS1Z3UnJGUFg4bVlRbC9Idi80YTRqNDgveC92?=
 =?utf-8?B?SVkzNFJJN2ozUGtpSVlVL09nTUJ5MWlmQjdMQkV5eDVRd2FLODc4NjNRVnVO?=
 =?utf-8?B?TlJGNGxkY1FRbmZoWTlJTlp6T0U4Slhud3QxbzZXVFFJUEpzckVuOGJkcVND?=
 =?utf-8?B?SGdqVzRuWmowc2t4RCtLbVdoK05rRlRmTXpMZytSdDkwLzY1a0F6dVB0R3JV?=
 =?utf-8?B?aUJaY3o4UHgveThyQjhNSElTbTY0THE4Vk9tM2pnRUNlYTQwek4vay9ZQ0Vy?=
 =?utf-8?B?L2FzKytCZThKS01Gd0FWdWhOZ3JoNmoydDRpeHRlOSsyWEtHVXJBRFdueXN2?=
 =?utf-8?B?UDNyWUNld2JHVjBrUDJRNkRuSWpzUWd6VEpaMHIzcWkvOWNVeW1vRXRlRmRT?=
 =?utf-8?B?c2dWMkUzQVYvd1ZrTWhGT3RRRmZlc0c1TE5zOEtFYTk2eDQyd3MybGhaQ1ZQ?=
 =?utf-8?B?SEN5VXR4Z290NFQrZTUyaUpudnJnbVh2TVdwTTVRNGw4OWtJaGM5b3phTVh4?=
 =?utf-8?B?ZVVtMDBhZjNKc3ZZR2JxQnFGZUlzdGdWODNuRHNxaWl1amRIall0SG5uM2c1?=
 =?utf-8?B?TXBVOE0wY2NnUkJJRitsQVF2QW5ObytaT1Zwd2Vkallqa1ByU3ZjR0hDMG5X?=
 =?utf-8?B?S1NyTTJkbHFrajluZExtRXRwMHBnY0lzVjNHejNlbWVvZWUwbW9TRDNHOUxO?=
 =?utf-8?B?YW4xR0x6aXRBdUlHVHJiaUkwY3JqNTlGenNORUtDdHZ6R24vYndtV2UxQ25D?=
 =?utf-8?B?VCtXMk4wM3FIc1Q3U2kvRW82VG9xZEFLUHdXclRRVCtKQlJ5a1NPSDVyb3dB?=
 =?utf-8?B?S1ZZbS9oSk0rd0pSdXoyK2VvMFJZY3BFOXRCRkZ4KytsbHVhenBodnV2c3Vi?=
 =?utf-8?B?RkJKdVg2Q3Mvb0VielVBb0F0TDBucThnSEo4d2lVWnVub1lhM0JiUlFVdlZr?=
 =?utf-8?B?UTJxdElqRnFzNEdqdGFZaWRXOWRNRWhoUEM1L1B5MGdSYU5udHlEOWhOamJr?=
 =?utf-8?B?QkdJTnh0T1ZlaU4vbTJ0WDZJUkJYaDhxTGp2QkVIRk9SaVQzRDlJYWk3NHA4?=
 =?utf-8?B?b3V5dDZJYzZtbkRUSmROME5NVnFDVlNESlFzVjVVZ3J6UDB3YjU1SVhoSHlY?=
 =?utf-8?Q?nhqY=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 09:50:55.4894
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78cb3202-fdfc-47a7-0c55-08de281a4ccf
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B9D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB7335
X-Authority-Analysis: v=2.4 cv=DNSCIiNb c=1 sm=1 tr=0 ts=691ee481 cx=c_pps
 a=t9CpubVtJ9uU5023Vq68aQ==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=y9YUpebZf6kA:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=szXwMIDPImWbuXKxhPgA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-GUID: rYHtgTwcp6zhNpdM-qnxLBKl1NMjJ9i3
X-Proofpoint-ORIG-GUID: rYHtgTwcp6zhNpdM-qnxLBKl1NMjJ9i3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDA1OSBTYWx0ZWRfX2db6/XlOaafW
 5LG2AN1cTB7Jrr+ZN+m6+x0QwI/A3A+IzMGaW2AxMzVpfn6+mx+6/QawZyWD9nydChXGZtq4bgB
 uu6QLLp9vKHsQa8VbMg2IbUTnhAgTh4kKojjom9MCLssBPtb/P9o7Si1oiZC/RiU1jyC17nq8BH
 +6IefJdvbu6ZeNQR5hj+U9i+YZ+Huh8dHpUOtnFzqPRIC34IuAG4p8RVALuD22VuJFS29ckqSp1
 P5ZW/XLy0sI5nwFmp0CqOv0xvcEat9Sc8RAYiUo0AOtqvRSWG6rcME3gcyJg1NQMpN/eHdLkj48
 I2hEVXGd10tG/1hNA/xj0qMhiJlLMPv+2qVxJwbunNmXh2pP4u7+3mxHGYANU7OIAqiICibqC00
 Lb6TTbIy88uV/bTEwJ38JWWFC5SKpg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-20_03,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511200059

On Wed, 2025-11-19 at 15:16 +0100, Linus Walleij wrote:
> On Tue, Nov 18, 2025 at 5:20=E2=80=AFPM Antonio Borneo
> <antonio.borneo@foss.st.com> wrote:
>=20
> > The property 'st,package' reports the SoC package used in the
> > board DT and is used to inform the driver about which pins are
> > available for use by the pinctrl driver.
> > It has historically been declared as an uint32 enum, where each
> > value is a power of 2.
> >=20
> > Deprecate the use of the numeric value and replace it with more
> > readable string values.
> >=20
> > Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
>=20
> I think Krzysztof is right about this, deprecate the property and
> (re-)introduce it on the top level in:
> Documentation/devicetree/bindings/arm/stm32/stm32.yaml
>=20

Yes, I agree with Krzysztof comment. This is not a property that belongs to=
 pinctrl.
I will deprecate it in the existing bindings.


> It may be a bit quirky to get to this property from the pin control
> Linux driver, but it is the right thing to do.
>=20
> The Vexpress has some inspirational top-level custom properties:
> Documentation/devicetree/bindings/arm/arm,vexpress-juno.yaml

I was looking for some top-level custom property, but I've missed this. Tha=
nks for the hint.

Best Regards,
Antonio

