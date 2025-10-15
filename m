Return-Path: <linux-gpio+bounces-27181-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D92BEBDE916
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Oct 2025 14:58:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3173019C4D28
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Oct 2025 12:58:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E226132C331;
	Wed, 15 Oct 2025 12:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="VqJshW5g"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554F232BF48;
	Wed, 15 Oct 2025 12:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.182.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760533045; cv=fail; b=ZYLjbIG5xEboz3ZQFJ6J2lL2t6EwAJTHpt8PHx4hzyTgvvrISS1SUKyQnDiF5JyLMLp+3/wvXr20iCPnDB+tLzIYzUpX45KDL1hZwnQgke4mcPA/Xgf2eKBIcM7McZHicXXcdbcUDuawc6MgrrMfjtuvmvUT75Qwl44buMk5Keg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760533045; c=relaxed/simple;
	bh=jyvMAKfRHDrWYd2PG6Nqz044dhl9YW4ZJlTAu+hst9U=;
	h=Message-ID:Subject:From:To:CC:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XFiMdk+zHCH2vcnLFscr4a5GCS18Ia/soA6h6TiNK1RzsUmILeP7SFlOAV7PArWT7N94TR6ux4nogmgS8N3APn47kMxJ9OSKRjdTg3/Y2wsRYicPrVlKauy8Z07SAGqhiSsXHL2Qv2DeIsyU3jj3rrXVGe+s9KJjr2xUo2A6nSs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=VqJshW5g; arc=fail smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59FAFqSd015399;
	Wed, 15 Oct 2025 14:57:05 +0200
Received: from am0pr02cu008.outbound.protection.outlook.com (mail-westeuropeazon11013058.outbound.protection.outlook.com [52.101.72.58])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 49r0t084v8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Oct 2025 14:57:05 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=teXMUR7NOEPGlAJdURTVPkn9dy1AmF3sKoVxXgP3BZZJqmILZHW+V0IY0o/4HjcVqsrucwhjfYRrpEt31KUVyCcz1tJoN9Y7ngjHlAgy6TyyzEueFEV7bKhYj4HZQOqj4sHeyOfkXUHo8BFEcCJCpeEg9u5bfNJL2Cd7BBoNDcYGpi9a00AV2gxjKM97psiGwG18gEZr+1jh6fufPuMmn2P8eZXAZ8pgqOXsGDDnN+VoFpHbKAKuPFaM2B+gxTLTPWu0oi/Pvzesao8ODTA5ESxYrwd+6jkj2vzmXD7CsWPR3X0PEiBEVsxh7Ivvh1Jv+QpHbl6Fk7oymDbC0GAo8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jyvMAKfRHDrWYd2PG6Nqz044dhl9YW4ZJlTAu+hst9U=;
 b=oEG+7g3940qpqTV6LXXGJr9HnRskfHogD+qV1FVpeuvsm02MO4PSGofQXLe0flDS1oqMGPSi9qICfKEl5YelAqhHvKpjTWBSaZovgCuMNVG0uAjkKurd+JaS4vJrv5N8uONUpT1XEfsvNPQowOkkqFqI2s+L3GwKG/5PbiZnKb75L2LBIRLdiWEyZ2yoHvvbp7tp7gLf1sh8nP70U4it1lbsZAPFzsz0Gwy51Vr+VQVcupbbNtroehp3CT/Fhg/RJcJwZ9PAOEU9udr5yAgd6hn3iIqgxhk+7lt8yCXbtHDAklBcnn6Gfg8aMDgVejusGS/fsczDYvrS+D9TLSk3ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.43) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jyvMAKfRHDrWYd2PG6Nqz044dhl9YW4ZJlTAu+hst9U=;
 b=VqJshW5gnIn7HwVjEu/ZX5yfbsnApZD3ujW06E1L0P3+cxLF2JZCliNqBLN0xXm/2AM65EnBAWwP3Hj3mpHYJ4MYwDSnAO9X3RtWluY/3UcUitFfOrO037XGZMUoiFSt8ISYBi8qHqs7lJvfoA/lL8nM7Ra0tJmHwRdD5fHVdP92POsm26qJjFTh24rxLA5qE5rbGViGnWdeeR5PppZn913JMWKM5Fkl6j/3Z6rYDDbQKhPdLNxADWdbj6c+PSQ9Sr9y1+V8jouoZ/vsEr1wzNoLibT4yCbOQ0H7fydmezXnQMoLXCzmgf8Elo8PmiJLPmcLfOpGxXfGc6M/mcQPYQ==
Received: from DU2PR04CA0025.eurprd04.prod.outlook.com (2603:10a6:10:3b::30)
 by DB9PR10MB5426.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:335::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Wed, 15 Oct
 2025 12:57:02 +0000
Received: from DU6PEPF0000A7DF.eurprd02.prod.outlook.com
 (2603:10a6:10:3b:cafe::3c) by DU2PR04CA0025.outlook.office365.com
 (2603:10a6:10:3b::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.12 via Frontend Transport; Wed,
 15 Oct 2025 12:57:02 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.43)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.43 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.43; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.43) by
 DU6PEPF0000A7DF.mail.protection.outlook.com (10.167.8.36) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Wed, 15 Oct 2025 12:57:01 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 15 Oct
 2025 14:54:35 +0200
Received: from [192.168.8.15] (10.48.86.11) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 15 Oct
 2025 14:56:57 +0200
Message-ID: <b4eca95eaa0e6f27fc07479d5eab2131d20eb270.camel@foss.st.com>
Subject: Re: [PATCH v3 09/10] dt-bindings: pinctrl: stm32: Support I/O
 synchronization parameters
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Conor Dooley <conor@kernel.org>
CC: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
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
Date: Wed, 15 Oct 2025 14:56:56 +0200
In-Reply-To: <20251014-affection-voltage-8b1764273a06@spud>
References: <20251014140451.1009969-1-antonio.borneo@foss.st.com>
	 <20251014140451.1009969-10-antonio.borneo@foss.st.com>
	 <20251014-affection-voltage-8b1764273a06@spud>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.48.4 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000A7DF:EE_|DB9PR10MB5426:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b3f6be1-5644-4f19-7644-08de0bea5579
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eGVhd0JmRUoxbzFFV29FVEpRTHNzRmxBQ3dDMnU4VVFnQlhEd0ZqVnR3VUF0?=
 =?utf-8?B?RFV6VERoZlVlSjNzTDA2dmRrb09KRDJHaE5GZzNEU2diK3ltU1RITExXWmJD?=
 =?utf-8?B?ekhTSGNvb3JmQ0RTVDdpL0txemVPZWo4Q1R5TUNweE1sRDdyRlZwWnAxNzAy?=
 =?utf-8?B?OTZtZy9UVGx1cW5VQ3JJSUhKTmRUZVQ0TnZPZElVT3R1QUY0OUFlbzQxcnRZ?=
 =?utf-8?B?T1hkR0NIUU1rREhKaitsa2lGb0c2V1BiSGFOMmJmb1R5QmJMV0kwWW10T3Fa?=
 =?utf-8?B?MEVKQVpPdk44Y1hEdGRHVjY1bE9mT1VkMFlxbitNUnRHdk96eXJKNTd5anpL?=
 =?utf-8?B?OUpFOTF4OEVOYWxTdkRiWlI5dVNad1V6MGxRWmwvdXc4Y1lKajNrWHBvbVBC?=
 =?utf-8?B?S0VDYVJGQ09EWHpPcWJaS3VyUjMyR1pUSTlvekFBaGc4YVk1VlM2OVFyK0FI?=
 =?utf-8?B?aHBldnpTUkIzbnBRV1kxbG42dVQvV1ppNTFBN1F1RzNhazl5Z3dPN3dQY0JY?=
 =?utf-8?B?c0ZIMU03Z2xTamZLUERObGliMFhuRnJ5ZVE0QTQxTzBFWFpKTmtWMngwRFI2?=
 =?utf-8?B?Zk4rVjNZS2tKSk5IaGo3ZkRVUm5CZmRtWmFMcHJFbHp0b0U4anpGMm42a2lG?=
 =?utf-8?B?Y2llbkZUS0c4NXk5b2J2bVVjbWRpMXlpUENhY2ZOWGFRVkxGOEZhb24wTWlQ?=
 =?utf-8?B?ajRkellYL25sRnM4WC9LZUpHcXg0SHhoeXdoWFl2NUhmdFMrVnk2K0QvRVVv?=
 =?utf-8?B?NkQ4Uk9vTU9hNkRyK1U0eHFDL0lQU2tjSTRqRzVQajlxNE9kNWo0TWVhcjNH?=
 =?utf-8?B?dStQOHlWQ1NYZFVtOGkzWXIzVW50YlVPajdzOHptSGN5MEw4UkszeThJK0Vs?=
 =?utf-8?B?U0UvWEVMR3NWQTM3czVJUUlqK0VZYmxqaFp2cTgySHVwd0toNTlkNlRPazZH?=
 =?utf-8?B?cnBtSnRzSEpla3RjazduZ2ZhNDZsd0l0amIvSzJnY0FyWXdnWDRhSXovd0lW?=
 =?utf-8?B?VndmUCtUc0xobDVLbEwrNGFzdU9XMjFxYVd1dGM1ak41UldNWUp2WCtFOE5K?=
 =?utf-8?B?YjZjbjFUak5OT2FmR1dzYmpDQ0NmN2h4eDlDZXRPWWFYNStRM01yRkI5TDBh?=
 =?utf-8?B?UTk2Wm02UHVRVTBmSnk4LzVhTnNOcCttM01idmo4endKMFBGTDQxVXd5YnRC?=
 =?utf-8?B?UDRWeGJkRlZyQmxkWHFUdnZoMFkrN0oyV0htRGt3OUsvcjZLWjBya2lNbmVa?=
 =?utf-8?B?U0V3N09uUEtxMlZJQVpFQi9UTjR4Q1RHZ2VoTVdUZDFKTGFYSzgrUXNmZlBO?=
 =?utf-8?B?cTJyMXlXZlJiaTJydk5aZ2ZNdDBUMGpRS1NGTGt6TzVwMVJYTWpaMGUwcWQ2?=
 =?utf-8?B?KzFRS2NEZkdNTWxLaGZNdHFhSTM2a3hwRisrVE9XbXk4T25GZm9YdWlJUkNy?=
 =?utf-8?B?ajhZZTA3SVJKN1REVGt3UHYxZGdnODI3NFZXcUhTY2ZJRlJQTFhwUDlTbVND?=
 =?utf-8?B?YXBVUVRnMjM3c3NHOFQvZ2FpZXRFcjNjbkdML2FqdzYrQWlFTTYyeFpnMEsz?=
 =?utf-8?B?eVVUTkNlZHdvSVh4b1N1WXA5VUJ5blRtYURCT2FlVUJ1NWtKckRNRUhkQ1JK?=
 =?utf-8?B?RjRrT1BCSDNmNXZBUlZNZnprRGdiQktHWlFpRkExRSsyeVkvU2xuSlZYRTlG?=
 =?utf-8?B?azU1TVphVGVlOE02R2xUa2poV1dWQmlKRGRHNjZRRHp5anZYT1hTTktUcWNI?=
 =?utf-8?B?YkkzRmZ4NGZaWUx1cDNwb2N2clhzNHN4Qmp1Y2g1MjNjNnBHR2xQYU1lbExC?=
 =?utf-8?B?bjRFc3FmZms4NkloanREalhWMlI5WkNuOG1vWk9ZMDZVbUpWd1JWQXBjbUxI?=
 =?utf-8?B?WHQ5SE8rZmhOWCtOSUtkd0g2UVlFZVdLSkRQUC9TZE4rUHNiZmYwaDhtRVJ3?=
 =?utf-8?B?VzNGbXFGdlBkRHdRVk1DZ3lBSkJrNGo4YVpmdTA1Qks0ekNQck9oYlJjU0xS?=
 =?utf-8?B?VzcrUk5LYk1sVW9kZ3g5OWtlTWtBUC9rSzZ5Mlo5VXpTU2hFY2ErRnRiVEVY?=
 =?utf-8?B?M0hMc3V1cDJkVGR1Q0tKeWRZMG51b2xnSW1VU21DaitoQm40eExOMld4TzQr?=
 =?utf-8?Q?LPE0=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.43;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 12:57:01.5933
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b3f6be1-5644-4f19-7644-08de0bea5579
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.43];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000A7DF.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB5426
X-Proofpoint-GUID: x9BCwQYSntDcnMC2IykdZQZSlJ7b1NYf
X-Proofpoint-ORIG-GUID: x9BCwQYSntDcnMC2IykdZQZSlJ7b1NYf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDEzMyBTYWx0ZWRfX+naVKyFL1lJU
 O64xocA6rShxU/R2qmdCqd/rIRmFvo68tw7RyE336Bq57OPD/M9KJv9pZOyIKeoiuN0Al3xZktz
 /qWGOiBBSTZ1LvmlY0tkuSqVjilCV+vTX0muMkqdLLQJtg6GBfnFHfkHu+j6FeCg/CK0IPN7MMh
 AmddHh+rRsfHyFbIgqzr/9vPwYhgpkPmx0UAvKK4mMLneUuHNwa8f1XdUoEO7scsR3zBgeTHLfK
 JeQUH5Aoh3KJTpYXR0ah/0G46KY1hAAHIgYPhImdZ05BX9L7iQ07NNO5sCC8HBiq0Uf5BB/yaF7
 quP3iMaeWvKSxDepv5forq4PyLHWJ0ekEMsoHW/b1uXJAg29Y7zZ91NImDFPMqMDWFNod25woy4
 02S8lXTbz0G/YOz3gDua7M1OyiHbqw==
X-Authority-Analysis: v=2.4 cv=dY6NHHXe c=1 sm=1 tr=0 ts=68ef9a21 cx=c_pps
 a=yfwLCzQb6LAjxR0fyU1Vyg==:117 a=peP7VJn1Wk7OJvVWh4ABVQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=y9YUpebZf6kA:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=h7Fg50VY3SLHUFNu3gEA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110133

T24gVHVlLCAyMDI1LTEwLTE0IGF0IDE5OjEwICswMTAwLCBDb25vciBEb29sZXkgd3JvdGU6Cj4g
T24gVHVlLCBPY3QgMTQsIDIwMjUgYXQgMDQ6MDQ6NTBQTSArMDIwMCwgQW50b25pbyBCb3JuZW8g
d3JvdGU6Cj4gPiBEb2N1bWVudCB0aGUgc3VwcG9ydCBvZiB0aGUgSS9PIHN5bmNocm9uaXphdGlv
biBwYXJhbWV0ZXJzOgo+ID4gLSBza2V3LWRlbGF5LWlucHV0Owo+ID4gLSBza2V3LWRlbGF5LW91
dHB1dDsKPiA+IC0gc3QsaW8tc3luYy4KPiA+IAo+ID4gRm9yYmlkICdza2V3LWRlbGF5LWlucHV0
JyBhbmQgJ3NrZXctZGVsYXktb3V0cHV0JyB0byBiZSBib3RoCj4gPiBwcmVzZW50IG9uIHRoZSBz
YW1lIHBpbi4KPiA+IEFsbG93IHRoZSBuZXcgcHJvcGVydGllcyBvbmx5IHdpdGggY29tcGF0aWJs
ZXMgdGhhdCBzdXBwb3J0IHRoZW0uCj4gPiBBZGQgYW4gZXhhbXBsZSB0aGF0IHVzZXMgdGhlIG5l
dyBwcm9wZXJ0aWVzLgo+ID4gCj4gPiBDby1kZXZlbG9wZWQtYnk6IEZhYmllbiBEZXNzZW5uZSA8
ZmFiaWVuLmRlc3Nlbm5lQGZvc3Muc3QuY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogRmFiaWVuIERl
c3Nlbm5lIDxmYWJpZW4uZGVzc2VubmVAZm9zcy5zdC5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBB
bnRvbmlvIEJvcm5lbyA8YW50b25pby5ib3JuZW9AZm9zcy5zdC5jb20+Cj4gPiAtLS0KPiA+IMKg
Li4uL2JpbmRpbmdzL3BpbmN0cmwvc3Qsc3RtMzItcGluY3RybC55YW1swqDCoMKgIHwgOTggKysr
KysrKysrKysrKysrKysrKwo+ID4gwqAxIGZpbGUgY2hhbmdlZCwgOTggaW5zZXJ0aW9ucygrKQo+
ID4gCj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Bp
bmN0cmwvc3Qsc3RtMzItcGluY3RybC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3BpbmN0cmwvc3Qsc3RtMzItcGluY3RybC55YW1sCj4gPiBpbmRleCAyZGYxNDFlZDcy
MjJkLi4wMDEwNzYyMTI3YzA1IDEwMDY0NAo+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3BpbmN0cmwvc3Qsc3RtMzItcGluY3RybC55YW1sCj4gPiArKysgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGluY3RybC9zdCxzdG0zMi1waW5jdHJsLnlh
bWwKPiA+IEBAIC0yMjAsMTIgKzIyMCw4OSBAQCBwYXR0ZXJuUHJvcGVydGllczoKPiA+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBtaW5pbXVtOiAwCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgbWF4aW11bTogMwo+ID4gwqAKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqAgc2tldy1kZWxheS1p
bnB1dDoKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRlc2NyaXB0aW9uOiB8Cj4gPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgSU8gc3luY2hyb25pemF0aW9uIHNrZXcgcmF0ZSBhcHBs
aWVkIHRvIHRoZSBpbnB1dCBwYXRoCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMDog
Tm8gZGVsYXkKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAxOiBEZWxheSAwLjMwIG5z
Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMjogRGVsYXkgMC41MCBucwo+ID4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDM6IERlbGF5IDAuNzUgbnMKPiA+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCA0OiBEZWxheSAxLjAwIG5zCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgNTogRGVsYXkgMS4yNSBucwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IDY6IERlbGF5IDEuNTAgbnMKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA3OiBEZWxh
eSAxLjc1IG5zCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgODogRGVsYXkgMi4wMCBu
cwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDk6IERlbGF5IDIuMjUgbnMKPiA+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAxMDogRGVsYXkgMi41MCBucwo+ID4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIDExOiBEZWxheSAyLjc1IG5zCj4gPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgMTI6IERlbGF5IDMuMDAgbnMKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAxMzogRGVsYXkgMy4yNSBucwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbWluaW11
bTogMAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbWF4aW11bTogMTMKPiA+ICsKPiA+ICvC
oMKgwqDCoMKgwqDCoMKgwqAgc2tldy1kZWxheS1vdXRwdXQ6Cj4gPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBkZXNjcmlwdGlvbjogfAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIElP
IHN5bmNocm9uaXphdGlvbiBsYXRjaCBkZWxheSBhcHBsaWVkIHRvIHRoZSBvdXRwdXQgcGF0aAo+
ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDA6IE5vIGRlbGF5Cj4gPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgMTogRGVsYXkgMC4zMCBucwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIDI6IERlbGF5IDAuNTAgbnMKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCAzOiBEZWxheSAwLjc1IG5zCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgNDogRGVs
YXkgMS4wMCBucwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDU6IERlbGF5IDEuMjUg
bnMKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA2OiBEZWxheSAxLjUwIG5zCj4gPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgNzogRGVsYXkgMS43NSBucwo+ID4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIDg6IERlbGF5IDIuMDAgbnMKPiA+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCA5OiBEZWxheSAyLjI1IG5zCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgMTA6IERlbGF5IDIuNTAgbnMKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAxMTog
RGVsYXkgMi43NSBucwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDEyOiBEZWxheSAz
LjAwIG5zCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMTM6IERlbGF5IDMuMjUgbnMK
PiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG1pbmltdW06IDAKPiA+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIG1heGltdW06IDEzCj4gCj4gU2FtZSBjb21tZW50cyBoZXJlIGFzIG9uIHRoZSBl
YXJsaWVyIHBhdGNoLiBJIHdvdWxkIGxpa2UgdG8gc2VlIHRpbWVzCj4gdXNlZCBuYXRpdmVseS4K
ClllcywgSSByZXBsaWVkIHRvIHRoZSBlYXJsaWVyIHBhdGNoLgoKPiBwdy1ib3Q6IGNoYW5nZXMt
cmVxdWVzdGVkCj4gCj4gPiArCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgIHN0LGlvLXN5bmM6Cj4g
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkZXNjcmlwdGlvbjogfAo+ID4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIElPIHN5bmNocm9uaXphdGlvbiB0aHJvdWdoIHJlLXNhbXBsaW5nIG9y
IGludmVyc2lvbgo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDA6IGRhdGEgb3IgY2xv
Y2sgR1BJTyBwYXNzLXRocm91Z2gKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAxOiBj
bG9jayBHUElPIGludmVydGVkCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMjogZGF0
YSBHUElPIHJlLXNhbXBsZWQgb24gY2xvY2sgcmlzaW5nIGVkZ2UKPiA+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAzOiBkYXRhIEdQSU8gcmUtc2FtcGxlZCBvbiBjbG9jayBmYWxsaW5nIGVk
Z2UKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA0OiBkYXRhIEdQSU8gcmUtc2FtcGxl
ZCBvbiBib3RoIGNsb2NrIGVkZ2VzCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAkcmVmOiAv
c2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50MzIKPiA+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGVudW06IFswLCAxLCAyLCAzLCA0XQo+IAo+IEkgcmVhbGx5IGRvbid0IGxpa2Ug
dGhpcyBraW5kcyBvZiBwcm9wZXJ0aWVzIHRoYXQgbGVhZCB0byAicmFuZG9tIgo+IG51bWJlcnMg
aW4gZGV2aWNldHJlZS4gSSdkIG11Y2ggcmF0aGVyIHNlZSBhIHN0cmluZyBsaXN0IGhlcmUuCgpB
Z3JlZSEKSSBqdXN0IG5lZWQgdG8gZmlndXJlIG91dCBzb21lIHJlYXNvbmFibHkgc2hvcnQgYnV0
IHN0aWxsIG1lYW5pbmdmdWwKc3RyaW5nIGZvciB0aGVtLgoKVGhhbmtzIGZvciB0aGUgcmV2aWV3
IQpBbnRvbmlvCgo+IAo+ID4gKwo+ID4gwqDCoMKgwqDCoMKgwqDCoCByZXF1aXJlZDoKPiA+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgIC0gcGlubXV4Cj4gPiDCoAo+ID4gK8KgwqDCoMKgwqDCoMKgICMg
Tm90IGFsbG93ZWQgYm90aCBza2V3LWRlbGF5LWlucHV0IGFuZCBza2V3LWRlbGF5LW91dHB1dAo+
ID4gK8KgwqDCoMKgwqDCoMKgIGlmOgo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoCByZXF1aXJlZDoK
PiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gc2tldy1kZWxheS1pbnB1dAo+ID4gK8KgwqDC
oMKgwqDCoMKgIHRoZW46Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgIHByb3BlcnRpZXM6Cj4gPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBza2V3LWRlbGF5LW91dHB1dDogZmFsc2UKPiA+ICsKPiA+
IMKgYWxsT2Y6Cj4gPiDCoMKgIC0gJHJlZjogcGluY3RybC55YW1sIwo+ID4gwqAKPiA+ICvCoCAt
IGlmOgo+ID4gK8KgwqDCoMKgwqAgbm90Ogo+ID4gK8KgwqDCoMKgwqDCoMKgIHByb3BlcnRpZXM6
Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgIGNvbXBhdGlibGU6Cj4gPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBjb250YWluczoKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBlbnVtOgo+
ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIHN0LHN0bTMybXAyNTctcGluY3Ry
bAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIHN0LHN0bTMybXAyNTctei1w
aW5jdHJsCj4gPiArwqDCoMKgIHRoZW46Cj4gPiArwqDCoMKgwqDCoCBwYXR0ZXJuUHJvcGVydGll
czoKPiA+ICvCoMKgwqDCoMKgwqDCoCAnLVswLTldKiQnOgo+ID4gK8KgwqDCoMKgwqDCoMKgwqDC
oCBwYXR0ZXJuUHJvcGVydGllczoKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICdecGlucyc6
Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcHJvcGVydGllczoKPiA+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc2tldy1kZWxheS1pbnB1dDogZmFsc2UKPiA+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc2tldy1kZWxheS1vdXRwdXQ6IGZhbHNlCj4gPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0LGlvLXN5bmM6IGZhbHNlCj4gPiArCj4g
PiDCoHJlcXVpcmVkOgo+ID4gwqDCoCAtIGNvbXBhdGlibGUKPiA+IMKgwqAgLSAnI2FkZHJlc3Mt
Y2VsbHMnCj4gPiBAQCAtMzA2LDQgKzM4MywyNSBAQCBleGFtcGxlczoKPiA+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7Cj4gPiDCoMKg
wqDCoCB9Owo+ID4gwqAKPiA+ICvCoCAtIHwKPiA+ICvCoMKgwqAgI2luY2x1ZGUgPGR0LWJpbmRp
bmdzL3BpbmN0cmwvc3RtMzItcGluZnVuYy5oPgo+ID4gK8KgwqDCoCAvL0V4YW1wbGUgNCBza2V3
LWRlbGF5IGFuZCBzdCxpby1zeW5jCj4gPiArwqDCoMKgwqDCoCBwaW5jdHJsOiBwaW5jdHJsQDQ0
MjQwMDAwIHsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb21wYXRpYmxlID0gInN0
LHN0bTMybXAyNTctcGluY3RybCI7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgI2Fk
ZHJlc3MtY2VsbHMgPSA8MT47Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgI3NpemUt
Y2VsbHMgPSA8MT47Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmFuZ2VzID0gPDAg
MHg0NDI0MDAwMCAweGEwNDAwPjsKPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBldGgzX3JnbWlpX3BpbnNfYTogZXRoMy1yZ21paS0wIHsKPiA+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcGluczEgewo+ID4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcGlubXV4ID0gPFNUTTMy
X1BJTk1VWCgnQScsIDYsIEFGMTQpPjsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0LGlvLXN5bmMgPSA8ND47Cj4gPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH07Cj4gPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBpbnMyIHsKPiA+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBpbm11eCA9
IDxTVE0zMl9QSU5NVVgoJ0gnLCAyLCBBRjE0KT47Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBza2V3LWRlbGF5LW91dHB1dCA9
IDwyPjsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfTsK
PiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9Owo+ID4gK8KgwqDCoMKgwqAgfTsKPiA+
ICsKPiA+IMKgLi4uCj4gPiAtLSAKPiA+IDIuMzQuMQo+ID4gCgo=


