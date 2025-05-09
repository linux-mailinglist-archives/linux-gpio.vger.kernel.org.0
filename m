Return-Path: <linux-gpio+bounces-19816-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 33836AB0961
	for <lists+linux-gpio@lfdr.de>; Fri,  9 May 2025 06:48:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B4504C78A5
	for <lists+linux-gpio@lfdr.de>; Fri,  9 May 2025 04:48:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1127A2676E3;
	Fri,  9 May 2025 04:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="CyApR5rN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2088.outbound.protection.outlook.com [40.107.249.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8262673AF;
	Fri,  9 May 2025 04:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746766057; cv=fail; b=DH2N0aZLg0J9GzbUdbC6ym79FUr+8ik1YDsRYvsP6WIPK8munMm6eYdNLIOOLJVtXtmDhnvrwGwCTzMNNGDps7JkUFfydtYgOrt7rhHHYNfNXKeNFHIXY5d8f2v+OXAShEt/bfo8WkQSpCnBpcUpH1O1e5QFIXI8MTCd7gs1L7g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746766057; c=relaxed/simple;
	bh=cvgd7D7tQOTthN0qvSyk6yQE3jR+tgJd6tJgbd2rDyM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=o+OEqSpiKE9kfFTdEXFSd+hj5fAREgtomYrikkqtEEiq5nPq3cC8+G1VfW1dgX2rC/rP9L+j23Jdjpoc1Kr0yp7Tq1V2mpTZJLCaMjIUm3cjAZ4r78bN43I8BXVx5sGl+iS3gSMxejZJyrTMHUh02uMi+gMkFsW1q4/Hw7PgPiI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=CyApR5rN; arc=fail smtp.client-ip=40.107.249.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SEKRDhYrQ4HwjA/7nEjzRvEkPqrgsewTTqrd8sZb3cCyWk2T1LtB4h85xN3Ihlw2ulIWM0myOyJMe/suoWUXZ31rgWO4VIlkZjWltkJbhFukwfz6QrGB+pR8QWGxgGw7RcSu4tqvoSlE9mhikYV4zlvclRLVttAPYuBHMWC87/pj2ItBgfSy3AvQ0Fsx0hHe2ZZgiMTZriPOj5AmKXxmUJja6rM/xkVSFzrJST2oWoXi0KOxaJrSidDgb4wPhcpdYOcLzdIL/bQVvzt0io9/x6+XajVC81QnfkQRu3Kwf9A+jl+Uad6wD81bi8/7ZRPbxpNRQuTb70zEtcUdVUCYIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r2GSVyEBcbdVJZ2GRg3F5MDQlL2r1kimCOW8vEgQfXQ=;
 b=OszbGZtzSSahaQno8SG23itiVBrt/VCVqmW8ZXSaiaCFfVxK/YHm1MPBWxVD00YVfT1jnsrjZiw5MYVb7Mn3KB/MFbhGjyxSwYH5A0nAGhxkt0IVGoXP5wrOQ+dWb6FlqPAGd6ADtKz6Ls3l1wCXfpebAcWMOnAVrrYZKoWPLI7rUnGDfTG8+ZZlmxVh+VW3y2xzBQGKbCHVAq8jBt6kZB4Y2sghB4jhX57IqcpqOdaRyPpIlWSeLRBkUpHOhnA08V8XL18iLR0AWawwfVuhdAtRconi431JuBDzKJQZYei2u6tQ3KalJ8kOS/Z8rUm3DgNFJRHPKBnBVc65moXo5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r2GSVyEBcbdVJZ2GRg3F5MDQlL2r1kimCOW8vEgQfXQ=;
 b=CyApR5rNajUoSjJYS4IfMxnJ5susd1yTeO1ONSECA1KBAAyyqX+4Bul5UtqDLrZ69EHeE+kwratQTmh6Fy0GE/3lxCN2sUbycVNxrLKB6rhuZx8FSBVbJbn9UOYq4Z1vpY5B5s/U6iysj4Ofbov10/ejJgtrafxeMV3lRAxHLvaR+hBDg+vROuLOcZ83T0MEgE4TwBqLsFr4g+5pdk27UHGVa0YfU0IuC+B/jXPdyiAHl52VnTcIILGsXuVPjsUn6EZm4gO8JRox0Q5A68969juBTlKfG71rpug3zlcQJOcl7m30tTEBkNMNhrPJK+JUnKZYD5cvK2iazRT7Nwr4DA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAXPR04MB8736.eurprd04.prod.outlook.com (2603:10a6:102:20c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.23; Fri, 9 May
 2025 04:47:34 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8722.020; Fri, 9 May 2025
 04:47:34 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 09 May 2025 12:45:39 +0800
Subject: [PATCH RFC 8/9] gpio: timberdale: Make irq_chip immutable
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250509-gpio-v1-8-639377c98288@nxp.com>
References: <20250509-gpio-v1-0-639377c98288@nxp.com>
In-Reply-To: <20250509-gpio-v1-0-639377c98288@nxp.com>
To: Ray Jui <rjui@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, Vladimir Zapolskiy <vz@mleia.com>, 
 Keerthy <j-keerthy@ti.com>, Robert Jarzmik <robert.jarzmik@free.fr>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746765944; l=2070;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=ZRY2NdpPEc9pEcyygw9SV/DHF/Gf2/XIk1rC6/QV+Tw=;
 b=odDPSfWt6Oe1LPfmqg/nBbEX1w5sS/MPZP6Vv5DrRYp5Uq3Cf+rL+Ztv1rjjtrSxWPDviyUnC
 R4bmXNd+IR0BhS+3H1+zfOdYRYTHfkfZUA79iCI/ofNozMcmI+C5YLt
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI1PR02CA0011.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::19) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PAXPR04MB8736:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f91cc4d-63b2-4889-02ab-08dd8eb49d7e
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|1800799024|366016|38350700014|41080700001;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OFVjQ0dzS0lkZStiTEVaQWRieFVyOXJVMUNrYXY2c2ozaHpYQkdpcTYycWM5?=
 =?utf-8?B?eHBvMCtTOTAvYXhldEhyYnFlZ3hyYnk0WjlSWkVSK1cxU2ZxT1NpU084aUZn?=
 =?utf-8?B?anZYU1RvdVhrMWZEMTVhcmdhQVRENFJBbU9EUWVhM0dZdXVGTWJDU3kxK004?=
 =?utf-8?B?QVpsc2g1UmhXSUl4YTdhUjhCejB5V2RHc2toTEkyd1AvczFucU9uZVJxaGd2?=
 =?utf-8?B?WUFXVFhyUU12ZXhGdGY4NWUzamJnTUNiejJIck1ROEVlWndMNW5pRmY0VXFZ?=
 =?utf-8?B?b016Sm5tWkpCaTQ3WElCVmdta2tWTGhPSjFTNGprYmI5c2I4MlU5Y1dPeTA2?=
 =?utf-8?B?eXZKWUxaSjV2bFVHTHJaWjhBa1ZqVVNnb2tRcHNYZ29UZVNoaHZHeGJYSUlu?=
 =?utf-8?B?TWRnaWM0dFJSR2JSM1h6WGNnVHkvV1ZXbWhGSjlURkVRVUxxOTF2d0s4Q1g0?=
 =?utf-8?B?SWlZS3pOS3B5NzlKS1lUQ29HZGVMcnJIRjkwL01Ka2lpelhCTTI0aXQxWVlF?=
 =?utf-8?B?eHVrZDlDbDZsRXBPWXdGWXZlVzRwcGI4eDIxbW9tSGZlS0JkKzNhTUx3N1Zt?=
 =?utf-8?B?RDQwUEg2RS9ZYlRhTjJqeTF5WGJaeldzNUk4RSt5VktqWmUybGo1aVk1QmxI?=
 =?utf-8?B?ekFsTFNPUk5mSmF0ckxjUEFQS1Y1SXBDdTYybVJFQlY5TDkxWU9ZVlI1cDl3?=
 =?utf-8?B?b2xDcld2UThQSWtKUDI3a1pRNmJoS2gzZVhHaERRMk56R2N3VnpMNDVqenZO?=
 =?utf-8?B?ekJWTUxyTVNDZFFTYVgxV05XQUFSazY5bnV6U1Y2MEl1WlRxTDFaV0RETlNT?=
 =?utf-8?B?VXVRWkFsZUpFemd0NU1qOG05b0M3YXg2LzNNaEdWR2Y4NUpRc2RDekVVSHdw?=
 =?utf-8?B?QmRTSWxQQlZiL1VkVm9wZW9qaUw1Q253OXgyUkl3dTYvTW1aTG9EVmVNbGo5?=
 =?utf-8?B?dllyVmFSYkVoVDJ5UU9GMEtaWmpvUHB2YlQwd1NTc1BZc1FKUnhBbFFTdG4y?=
 =?utf-8?B?ZFBPczRhR3JhNEV1aHRmdGQvYlU3MzFXbGYyNjlrVnJEaXFMNEtOUC9iSVRE?=
 =?utf-8?B?enBWcXVOOWpYMTRRL093TWJuaWZBcnN2Sng5WGFPUUk4ZzlKYnJKaDArR2R1?=
 =?utf-8?B?ZzZNR3d3bjMzaW9Pak1xRlBYdUNPVHovYW4yMnBDaUtMaXFDS25mUTRvS2hr?=
 =?utf-8?B?VUlUaHR5QjNzUVlvenBXalBDSTh2dWJjZUdONjFUOFlFMlp3aUdKdDVBbnB1?=
 =?utf-8?B?d28zTUtYSUQxdHdEOVMvc3Nray9vRitHNVdSTWcrSEQ2RGJab2ZPTXhXSTJ5?=
 =?utf-8?B?OGJIdk54SmlYZEhvZVpudDZQTDVCVjZsbzJGMUVQUUdZWWJNTklyTGFNMDUy?=
 =?utf-8?B?SzZWK0ZtWWovNnBwN2hqc1BZN0RCOWlDVHdlQnhLdDQxdHBTbG4xSWNrTWNz?=
 =?utf-8?B?Ym9jWUIzQXMyMGg0UVlCdnVselZKamladWg1OVNEY0V5OHJZU054Z3FMZFVY?=
 =?utf-8?B?cEFPMmlqMlhlYkZEbEdKV1A0K1BxZXc2Z2ZIclgxQ0p3UlYzN3hoSWdpZHE2?=
 =?utf-8?B?OXBQWHNOKzhKVENMa2tYRWR6bDNDK2tRV0xOZlB2RXREcjAzQnpkL0FJV0VG?=
 =?utf-8?B?cUNtOG53RDJJV0VkemxYOU13Q1lXSDVsdDU4dTNTRlcrWlNMWHdkVDJsMGhM?=
 =?utf-8?B?dFRXRmJRaEl3cWhQSTRmanB1U09kTEVUVGxiZWdicHdZbjg3V3dPdWsrOWpj?=
 =?utf-8?B?M0MvbTlTSklkM2l0QXB5ZnZ4YTRBVHRBYmtjNkVVS2FuQnNEY2lMbWZwa0k2?=
 =?utf-8?B?aEs0eTR2Tk42VFV2aXN2WFIvblFkUHUvSE10eU84dGhTU05sUVQ0dlIxSGdL?=
 =?utf-8?B?S2VKYlNSY0szZXdLMjY5cGtycHdBOFNlcjZHUU5GS1hoYlhubENKNUlVTzkx?=
 =?utf-8?B?aExJbUw0NFhVMVRFWkpEUWVaUDdZeUJCdXlYNFJNeUpOdXMzbGlzU0NvM0dQ?=
 =?utf-8?B?cDg1RVRHeTNMNXFZbnpmc0NGb0RvejEzMXpOWjlYMENyUDZsSXBQci8wVytM?=
 =?utf-8?Q?+PPRVz?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(366016)(38350700014)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VDhMTkt5STNkZlhjN28yY1Z4ZUNIRjlRWnVWOVRadTN2cVBzSFVuYXB4UXY1?=
 =?utf-8?B?cXNyc056eE5YWUZGUnlBK2RyQ3Z4MzZBZzJYR1JNWWlXSTZmdGwwUzNRZkw2?=
 =?utf-8?B?czVPV1doVUVMOTBUOFpUWXFTUDRGYkZrWk9kSGtxOFJxL2IyeDhoN1NxeXVo?=
 =?utf-8?B?d2lhTmNxQ0tMVThHN0lxSk5NUjFHU0VCYUtQejZVczdZaE9ZSW9lZXRaVFJF?=
 =?utf-8?B?SUpQZzY4L1craTdtbHI3YjMrK3hUOXhhSTlDUHlGSjE1MjZFaXo3M1IxbzFi?=
 =?utf-8?B?MldvbURWN2tFdTRtRndXbWp4RGp6dWFLbVltOTAraDE4WXZ2RDZ2QzRvWHJM?=
 =?utf-8?B?VDVsYU1ReXdrdHNES3J5ZTl3UVFYV0hHSjBIWmR0VjRDOGlNbUQxYTYvK21Y?=
 =?utf-8?B?NTVsMitLYWEwZTJZcUhOdUdKWm1ETzF5LzdOTVk0SmZuR1VhSUgzTWs4T2pN?=
 =?utf-8?B?TUwwYktZQ2Ixd1k0UE9TWFJ5eEp0dFFuZksvblI5a0U2YThXdzB0VlhibDVo?=
 =?utf-8?B?U2JBdmwrS2FROWcyWDlUTlhMQXdCWWhaVzIxaitidEN0c1dIVUVJa01qbEtP?=
 =?utf-8?B?ME9kUExwcTE5TjdUb0FzbE5vamJtRW9iYS8vUVJRTnovR1N4aVltNld6OHlW?=
 =?utf-8?B?NG9MZXVuRGVTYlBEMGpLak9BYVFtRjVuQjdmVmdDSUpWaUJkb0lacC9Xb1U5?=
 =?utf-8?B?TGhZbnBBLzUxTHpEOTh5OENOd3hhL3A5bW1pdnhCSzViNEhmaS9GWG5Wb2hJ?=
 =?utf-8?B?ZWMxcnRPSHJXeWhJZU1TaVAzRjh0OXNCall1TmxreHo1ZnJzMW9aZkVmay81?=
 =?utf-8?B?YktncURSbEVnTkNCUlNVOWgxbnFIVk9MZ3dzdVo0M3JuemhoYXowT0FZaHM5?=
 =?utf-8?B?Z29LK3JNMXNvMTFWVVEzck0vcWl2YlgrYkxHNGp2MXBJcXV6TzRkVGdLS3Y2?=
 =?utf-8?B?Y3FiU0NOZThnblVxS3MySU42dTRjcTdHUURVUE5tek9janFBQXZiQ1VwZ3NG?=
 =?utf-8?B?OXd1OUN2RVpDbmpRUFlxRE80K0FHMU9lbDlyOFlBcUFpRWZyYURKSTlnSjF2?=
 =?utf-8?B?bnRGUlBURVVRNFM3cnVLb3FYcWFzVVpQNzF0amRXUHFvNGRwcVNpcExmaXg2?=
 =?utf-8?B?Y2E0eUpPVk1nenFoRzhuZktlNlpZWGJ3Y3NRQVVoU2x1M3lzL3dTUmwzS1h3?=
 =?utf-8?B?MWRPVGNTOUNxbFRCa2Z4SlMxSC83NEh1NVVpb2hXRWFDYXY5bTVRUFlIZTht?=
 =?utf-8?B?QytqNEE5T0xVOE9jVlJEZGFYenIzdUhzajQ0ZHd1eWFENEMyWmJEczRTTXhD?=
 =?utf-8?B?aHk5WVVYQVNWaStXZCtsZkVydXBBNTF6SmdpMUdNSGsxb1NGREdtZmdmUi9Q?=
 =?utf-8?B?MGptQVRxdUVVSjFJc0I2R0R0QTNNODExdE9HN1V5aG1tcmVFclQ5TkY4c3hR?=
 =?utf-8?B?K1QxMTFJMXB3d0xGdFlWSCtOUlFCSGlGQ0lDbThFSWpSbWJoN3lIRCtrOTE5?=
 =?utf-8?B?TFdaVzdRTkVrQ3dMaG1aOUd6WFdKRDZyMGZic3FCeWowdkZXZGxPNm16Mkho?=
 =?utf-8?B?OUlLOStLYUJWYktHSHFKa0VPQ2tWOURodjFIam0yQ2prSE1EVEY0VkhOTUVa?=
 =?utf-8?B?WVorQXZEeXk2aUxkK0FMWEdjbGFXMUl3T1IwWm02U2N2dTduM09YdWtOZ21F?=
 =?utf-8?B?SFJJenVpVzFwWXJQMGY5WmdMcUNRWDhZVG1XSEd0V1dNUVdhY1lqWm0rdk5T?=
 =?utf-8?B?OXJBc3FlREpmbnRkSFNXc3B5M0pDODdQT0pQck1PNEhrYXdOMDk5NlZFK1ZD?=
 =?utf-8?B?VFAzekdqTmM5VGxUdzhtUzJybERIaTU4cDU1YjFBY3dYeFF0TVZqL3cyM0cv?=
 =?utf-8?B?ZFFoMDRvc24xTytROEtCSUJQb3FDV3lDTGswb2p6cEd1L2hCV0N1aGFhYzZK?=
 =?utf-8?B?dmM2V1o0azB1WUlaQ1Vjd05xaTUzMlIyMTArSU1yQmdTdEZrM3F1eWRRNGNQ?=
 =?utf-8?B?OERjb1ZsQk9OTG5odGRzaU9GVU9QS2hkYk96N2pwWGhLSmdhOUszZGpSMnN6?=
 =?utf-8?B?a1QwUmZ6bGlKdUg4QXgxQytpK0xJTnJjVW9rV3Zlc2NsV2RFeldrVyt0NU53?=
 =?utf-8?Q?Q/oIHF72dUDLtbqn3EX7DlGdR?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f91cc4d-63b2-4889-02ab-08dd8eb49d7e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 04:47:34.5178
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0rp006NUFXtzgLcDScuBhvRhxXNBoJdNTHIzbXnFdMuAppsrkBlNcOr6sK+Za9EZO+QjjGk+jlpyFDxOSLTSmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8736

From: Peng Fan <peng.fan@nxp.com>

Kernel warns about mutable irq_chips:
"not an immutable chip, please consider fixing!"

Constify timbgpio_irqchip, flag the irq_chip as IRQCHIP_IMMUTABLE,
add the new helper functions, and call the appropriate gpiolib functions.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/gpio/gpio-timberdale.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-timberdale.c b/drivers/gpio/gpio-timberdale.c
index fad979797486534d3cc6a1437fdca765baeb7b47..cb303a26f4d3cd77368b5bdac42aa42821b39345 100644
--- a/drivers/gpio/gpio-timberdale.c
+++ b/drivers/gpio/gpio-timberdale.c
@@ -103,20 +103,26 @@ static void timbgpio_irq_disable(struct irq_data *d)
 {
 	struct timbgpio *tgpio = irq_data_get_irq_chip_data(d);
 	int offset = d->irq - tgpio->irq_base;
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
 	unsigned long flags;
 
 	spin_lock_irqsave(&tgpio->lock, flags);
 	tgpio->last_ier &= ~(1UL << offset);
 	iowrite32(tgpio->last_ier, tgpio->membase + TGPIO_IER);
 	spin_unlock_irqrestore(&tgpio->lock, flags);
+
+	gpiochip_disable_irq(&tgpio->gpio, hwirq);
 }
 
 static void timbgpio_irq_enable(struct irq_data *d)
 {
 	struct timbgpio *tgpio = irq_data_get_irq_chip_data(d);
 	int offset = d->irq - tgpio->irq_base;
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
 	unsigned long flags;
 
+	gpiochip_enable_irq(&tgpio->gpio, hwirq);
+
 	spin_lock_irqsave(&tgpio->lock, flags);
 	tgpio->last_ier |= 1UL << offset;
 	iowrite32(tgpio->last_ier, tgpio->membase + TGPIO_IER);
@@ -205,11 +211,13 @@ static void timbgpio_irq(struct irq_desc *desc)
 	iowrite32(tgpio->last_ier, tgpio->membase + TGPIO_IER);
 }
 
-static struct irq_chip timbgpio_irqchip = {
+static const struct irq_chip timbgpio_irqchip = {
 	.name		= "GPIO",
 	.irq_enable	= timbgpio_irq_enable,
 	.irq_disable	= timbgpio_irq_disable,
 	.irq_set_type	= timbgpio_irq_type,
+	.flags = IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
 };
 
 static int timbgpio_probe(struct platform_device *pdev)

-- 
2.37.1


