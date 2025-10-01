Return-Path: <linux-gpio+bounces-26723-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B8FACBB0BC3
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Oct 2025 16:37:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BE6BE7ABD8A
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Oct 2025 14:35:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CB04259CA5;
	Wed,  1 Oct 2025 14:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="S2qTgDK1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525AF1B21BF;
	Wed,  1 Oct 2025 14:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=91.207.212.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759329411; cv=fail; b=V/W2N7CGYeiEj1LJg+pAuL+3AzGJzm+erutoVA1XdJbZE2WNo9dd2koubmp7DYcjg4PRGAkfCpuyIp6V3wJ62srtqj6wU4jdEbhN59rCiD97Mr7oiPQQOSm5cQnLeiK39xyqecglOE+pOZPOwRkIgq+QXnTx+o00nny+jG53Fdw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759329411; c=relaxed/simple;
	bh=uxNDHWI8EtKOnLxTbDP0hDXAvrPsTnRC88/A9UjlzP4=;
	h=Message-ID:Subject:From:To:CC:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZvC3FMlBO0uLZ8ovOfS5vOdXX+EzS7UieMyOata8hzWK/gVMmg/HNJSqA0l1SzXecmYWNQRAvb5e/zoD0HrkZO+yLPj7bkdWfHgGic5dmoZA9HNALgQa6vEr/g/dQixRIpbenr8H8vZDoj9QoJA16YLwmnOX0OUw0Wh4fR5DJ3k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=S2qTgDK1; arc=fail smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 591DrQcZ021441;
	Wed, 1 Oct 2025 16:36:25 +0200
Received: from du2pr03cu002.outbound.protection.outlook.com (mail-northeuropeazon11011063.outbound.protection.outlook.com [52.101.65.63])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 49e524h2j1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Oct 2025 16:36:24 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GAwIfZin+2Esd7X3hoHCymuUP71cVYefrmmYjSHl2BHzeadB/vsvGl13kseSbAyh9wlqYB7ylSbJXeB3cOpEUBDDV/jLzVSizUhytpdrWZnjLvxzxlZmlQxssBp/JfKSsVVNXFqiRMfsRsswpoetrW4UGcgBdat9OoL6BMwo8W6cWffPa9AqehIwBmUgWDkZSUWUIXeQdRPB5AOJfOtc5ZPGZcC428QIf8Cqm2mhexIDHGMwwIP+9MoFsb7HyJPEs+FCujvpmf6TYMpWNbZdTyb2ZS78oGE5z3lvu9pCN4d3LvVMLAB//Mcd5ZW84icooKYnlOjNvEnXNHRsZZaSjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uxNDHWI8EtKOnLxTbDP0hDXAvrPsTnRC88/A9UjlzP4=;
 b=gEQemhmIDamliEjg2V4WhsMVieewY5++gBan6a091bZlw3YsBBVMVGvXnbosm/ca2X/abROmMtHTCHVNfiIMWCVxZqlLh15r/FJSJ5AXSJ9fkPSCMxgXhIORP7a9gXWykUHzFVyoYpvxlpuE2yphYrdgRHmnPMtHfE1n5/hyhTaypkaXfFZCcc/6H52cgrhcnI/O/XPTen3wVhN12NW88v6GArdYO+gczhq4U2vpNJs+aNVApoy6tiizPj4DG1curoI/EJvbK5twfaAh4cTePeE2DW8OX9bd3veo32lBe7o51dJv4+d4DO3dS/g9f6xhMZssq0yS+KmHLWbvBdVU2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.43) smtp.rcpttodomain=linaro.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uxNDHWI8EtKOnLxTbDP0hDXAvrPsTnRC88/A9UjlzP4=;
 b=S2qTgDK1wfwiuAiiIujiwMFIh8PzFIw88xmbUJN3Luw/kX84Qq+olwjX7ELCrjBjIuVWfzosYfRu7JdwoQpIcoaxavHFvXVfa5I8jz4qiclKg+fZR2kBc+somR2plUDQ0C/ufEKFpLqw1tE/rtQae6m6tGqX1O9eP5qURKxXbufp4XqHWOKr5j1Eos426+ORLqYJx8L/6g2ebB0HCddRzZp8dAk4MlBTUbHS+9gTaRDDVsAAgDPMZlhPhqFR9XDfsu4QtnB9FWt1ePGBtYDVQvyHcR64FHL8jq8DtXXlurDz9xkOIXLAPcSj67YRh/vQwZ786LG7HSbsOkiLlrT8/g==
Received: from AS4P189CA0067.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:659::25)
 by AS8PR10MB6889.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Wed, 1 Oct
 2025 14:36:21 +0000
Received: from AM3PEPF0000A79B.eurprd04.prod.outlook.com
 (2603:10a6:20b:659:cafe::d0) by AS4P189CA0067.outlook.office365.com
 (2603:10a6:20b:659::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.14 via Frontend Transport; Wed,
 1 Oct 2025 14:36:21 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.43)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.43 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.43; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.43) by
 AM3PEPF0000A79B.mail.protection.outlook.com (10.167.16.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9182.15 via Frontend Transport; Wed, 1 Oct 2025 14:36:21 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 1 Oct
 2025 16:34:02 +0200
Received: from [192.168.8.15] (10.48.86.11) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 1 Oct
 2025 16:36:18 +0200
Message-ID: <4de485fc717a1b469979c32852f58fa3c4b20607.camel@foss.st.com>
Subject: Re: [PATCH v2 2/9] dt-bindings: pincfg-node: Add property
 "skew-delay-direction"
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Linus Walleij <linus.walleij@linaro.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        Christophe Roullier
	<christophe.roullier@foss.st.com>,
        Fabien Dessenne
	<fabien.dessenne@foss.st.com>,
        Valentin Caron <valentin.caron@foss.st.com>
Date: Wed, 1 Oct 2025 16:36:17 +0200
In-Reply-To: <CACRpkdZCKXYEegV1cK6X9A9k8ORLWweBQs40PWYuTof3JgcC2w@mail.gmail.com>
References: <20250905135547.934729-1-antonio.borneo@foss.st.com>
	 <20250905135547.934729-3-antonio.borneo@foss.st.com>
	 <CACRpkdZCKXYEegV1cK6X9A9k8ORLWweBQs40PWYuTof3JgcC2w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A79B:EE_|AS8PR10MB6889:EE_
X-MS-Office365-Filtering-Correlation-Id: a77cbd00-4a7e-4992-a7c2-08de00f7e419
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OWJCbzNqdHlTenkxbHdoZktFd3pCaHlpdFJYclR6N2hTSmFpODREYlNPZnZ3?=
 =?utf-8?B?MUJGN2RoU2l3ZGJUSDhHU0o4ejhxT3J1Tlc4ZkxYNDVkWDlxQk9hVmdYUGN3?=
 =?utf-8?B?YWRNRStjSERBV1lMaGtvSy9kNEdTYjZER1BSeUs0TUhHNHFZb3FUSlNvd25t?=
 =?utf-8?B?ZUF1bUJUUzFhR05MQkYzeElmNGEwK1hWOHRNSnR2djA4T0cyMXpDV3NWNTBJ?=
 =?utf-8?B?Y01WU25zcFlmMmhYZUZzSkFPT25GU1hWOUt5RFFMUVZHbTdSd29vbFpDVFlF?=
 =?utf-8?B?YWxTT2xSNkFZcDJmL1BQQmFRU28vVHZpWFowRGk3QlQrbTc5aFdua2NxMXhn?=
 =?utf-8?B?VnVEV1FTcEkrNVNuMmY1aDMyNzRZS1QzQ01hR0EyNzIxd3ZTYlAxV1kzUTVw?=
 =?utf-8?B?bTFNYjlYa2wvL1kveXBTK3pOVWFKRGxLK1JXZUxHL01ldzZ1OUVwcUIySXFa?=
 =?utf-8?B?ejNEZ2Z1M1FXa0FLSWFxbTM2WXIybFFiRmZacTBTNEJxdzU5b2t0MWcvbzUr?=
 =?utf-8?B?aTFtem9JaVpVTmFiajhnQ0ZaNVU4cEp6V2t0UWVGRHpieTZqaE5xVTJ5cHN5?=
 =?utf-8?B?eEhkeC9vbHdTSnozb2NlWFhZbWhJSE03aDZvMWZCY1RyVjRpT0FYdUN5SzVL?=
 =?utf-8?B?VGR5ay9jK1dzM1ZYWDVORHdRczVEMW84N1FLcFVPRlViQU9VanJkQmRLUnV1?=
 =?utf-8?B?SDJIOGhkWk16TDRqWGUzc2FtcDhxYzRXbGFtZGxpZ0VVRVFGdUFIVWlaSUhk?=
 =?utf-8?B?blRTczBZa3VEMEpHQ1FpMXM2aUd1VHRJWkxXTlI2WHZTKzY2ekNQN3k3T1FI?=
 =?utf-8?B?aVFLcWM0L3V4eWxIUGI4c3hkZzd5VUY0RnRGY0hqaFdEN3FtSjR6Z0ZLbGxT?=
 =?utf-8?B?cmpIdmFWL0w3MllXTWI4djI2OFJJUmV1d3dVTmRtN1FaTVRZUDVPd1ZKV3o1?=
 =?utf-8?B?Y2hxZHpmOUY5WnlBOVFGdGw1enEwQlRNQ2FDR01GVk1MZzJWRTd1NTF6T2tq?=
 =?utf-8?B?WWw1TS91RjlMSWxqRk01eDdEWU1kMURoRTJ2UE5TNkRENzhEUFRUa1hCNXdQ?=
 =?utf-8?B?SEM5OXRzbHZBZUtKU05SNENFbzdnRFdGVVFHcEhWdmNnSkRlbmpIcllOSlpa?=
 =?utf-8?B?empTVEMrbnRDVHQraUZabUh5QmRueE5YZ1YxLy9nN3hRMnAxT092TjU1Nml6?=
 =?utf-8?B?MEJkQjR2bWdJdUxkblBRZW1OQXJVc3F3NkZjaDJocGxzY213T3V3NWRSS0R4?=
 =?utf-8?B?blhGOUdNdjdUbHhPTHVwZUVaVnhJY2VXS0ZMQWw2UEhHUTVzRXAxcmNLaXRa?=
 =?utf-8?B?YitBdkVYd0kzTlYreHdzMmtvQU5rQjN0cXRqZWxTbkZlUURGNU9OcjhZNG01?=
 =?utf-8?B?TWNqbFg4MGZZUm9PQmJjOGUrNUV2K2s1UVN1M2lTcWEzVzlQc3oxY21ZTjFZ?=
 =?utf-8?B?L2t5STI5OUp0RFEyZG9SMnNPYzE1QlhyNlNldUlLRkRqeXZQK3pBdjJzdFl6?=
 =?utf-8?B?dHM1YStwMW11Qk9qNVR3R3FjbC9ZZ3lvVnVYSm5UT3EreXBuSGlzYWU1VEVV?=
 =?utf-8?B?ZGJja09adCthdXRvRUtxSjU3cHFVUi9BOGVpTjlFTXFNRDFvWkh6MFhMbjVO?=
 =?utf-8?B?ODNqMy94K2x3WE1KejJRbjJSYnloaEhoQTJsQWtVUHhQejIrQjRBSkxPTStC?=
 =?utf-8?B?VndmL1h2OWpjZUwvbDZqcHhMamFxKysxdjEyR3J3RXJDeVdEYk9mMjBiR1ps?=
 =?utf-8?B?d3JJNW5VbkJHQkFXQm1VLzZHTGc2S0crUHRvYXRjOVhDdjhjdWJkbnlNeXRC?=
 =?utf-8?B?bmlQNktJaEw4akgvckt1UGMxQmRTeTFkMmNJMThZUndJV0x6eldGTVFmbnJy?=
 =?utf-8?B?dTFIUUdGT0FYelpwNzdvQzNtN09lZDc2eVpXV3BGZHlXd3hWK1pNRjFqL1gv?=
 =?utf-8?B?TDhpZ3BjUkQxY0tTSVJVUDVya3RaUXd0Ly9lV0N0M3pEbjFrdnlSeGgxTEF6?=
 =?utf-8?B?cGZPazBHbkVJK05QajdGL1BiakhJQU5IcUNzTjBYRWxCQXV2YlpGYndzMG94?=
 =?utf-8?B?SFpuckdSM0h0SFhMMjFVM05NeXBKS3I3V1NSQ0VCVlZKeHlOQzZ2SWJES1Qv?=
 =?utf-8?Q?POiM=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.43;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 14:36:21.6070
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a77cbd00-4a7e-4992-a7c2-08de00f7e419
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.43];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A79B.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6889
X-Authority-Analysis: v=2.4 cv=HqN72kTS c=1 sm=1 tr=0 ts=68dd3c68 cx=c_pps a=pFRPcDjQwgjs8gOseP4dhQ==:117 a=peP7VJn1Wk7OJvVWh4ABVQ==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=y9YUpebZf6kA:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s63m1ICgrNkA:10
 a=KrXZwBdWH7kA:10 a=8b9GpE9nAAAA:8 a=jL_698374_RyKRYFt48A:9 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: e3VXBdg0JwODfQInJKe2BnH28_VwXHgE
X-Proofpoint-ORIG-GUID: e3VXBdg0JwODfQInJKe2BnH28_VwXHgE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI2MDIxNiBTYWx0ZWRfXwOg2jvkyBECh rFy21pF2OcVednRGhxkVrrqO82qwaaoTR4XMd6XbbgFmnIvhbk4sgqzGqRmNwtvSVG4Fydsf9XU vohGNBgmNDbZu4l/fT0//K4CNZYchesU+v7NCNl/sNFGpyeu87VTo92UP/Ut4LmphryiQ+5ij48
 6iGio4iMBeCKXMXbkfPOMS4zXvMmP99qr9zPJRF5WefomHhrI1otm3KKO5OUqOopQeFc1IwZzM8 +4AQxaO4bLcIjCygHENi2RYsotfL901cLj0d4nj5+DE+jYK2YCW6QLDibJ0z1zLH6tpCYuPAzQf pzHuAdflkyjHk+eXGSg2/OcIi8MUhU3VCNZhzuOSZxJXMzP5NduwizNTxJqb/gqlnFEH9awg0nQ
 YdtWbFyQT/ke8nhxAxdns+5cLzPvnw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_04,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509260216

On Tue, 2025-09-30 at 14:23 +0200, Linus Walleij wrote:
> Hi Antonio,
>=20
> thanks for your patch!
>=20
> And sorry that it takes so long for me to review it! :(

Hi Linus,

no problem, thanks for your review!

>=20
> On Fri, Sep 5, 2025 at 3:56=E2=80=AFPM Antonio Borneo
> <antonio.borneo@foss.st.com> wrote:
>=20
> > Add the property "skew-delay-direction" to specify on which pin's
> > direction (either input, output or both) the value of the generic
> > property 'skew-delay' applies.
> > For backward compatibility, 'skew-delay' applies on both input and
> > output directions when the new property is not present or has
> > value '0'.
> >=20
> > Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
> (...)
> > +=C2=A0 skew-delay-direction:
> > +=C2=A0=C2=A0=C2=A0 $ref: /schemas/types.yaml#/definitions/uint32
> > +=C2=A0=C2=A0=C2=A0 enum: [0, 1, 2]
> > +=C2=A0=C2=A0=C2=A0 default: 0
> > +=C2=A0=C2=A0=C2=A0 description: |
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0: skew-delay applies to both input and=
 output directions
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1: skew-delay applies only to the outpu=
t direction
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2: skew-delay applies only to the input=
 direction
>=20
> Unfortunately I don't think this will work, because skew-delay
> has a value, and with this scheme we can only specify that we
> want this value to affect both in/out, only in or only out.
>=20
> What happens when someone want to configure different
> skew delay for input and output?

It makes sense!

I will address it in V3.

> I think it is better to add:
>=20
> skew-delay-input =3D <u32>;
> skew-delay-output =3D <u32>;
>=20
> So the drivers that need this explicitly specified will need
> to just define one of these instead.
>=20
> If you want to be very determined, make the schema
> not accept skew-delay if either skew-delay-input
> or skew-delay-output is specified.

Sure, I will add the proper test.

Regards,
Antonio


