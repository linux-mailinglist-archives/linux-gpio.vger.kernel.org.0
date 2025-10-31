Return-Path: <linux-gpio+bounces-27890-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 526F0C245AE
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Oct 2025 11:08:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C7C3334CD77
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Oct 2025 10:08:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23BD533469C;
	Fri, 31 Oct 2025 10:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=duagon.com header.i=@duagon.com header.b="HoDdGSKJ";
	dkim=temperror (0-bit key) header.d=duagon.com header.i=@duagon.com header.b="HoDdGSKJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from ZR1P278CU001.outbound.protection.outlook.com (mail-switzerlandnorthazon11022100.outbound.protection.outlook.com [40.107.168.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 457C533436C;
	Fri, 31 Oct 2025 10:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.168.100
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761905290; cv=fail; b=pqc20mEzUM1RAq8MPzEfXrdYc8XMCNo1ZB7p+doJglkBUbmOBeGzIEY1egu+JZNuZim4HUSE09wIPGPyZyLZ4FQFSVsPGBgz4BiCOfmidKD5b25tADR9LsqbZi4xv135RDMlkPLvMld6wU9h0oWFfzsmHgFvbjHB2eKkiWfseno=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761905290; c=relaxed/simple;
	bh=VoRCnk3+uuzc46kK8bWpBDzHoEY0qzN8pvNH0RRIM6M=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:MIME-Version; b=stkzcQt/8/OcTn/5hjx8w8JEeqeOexVZzyCEW7bKQDGFPvgf+W7A0BO47fj+E3CQKl5SGshANtEu1wyEFfv6pzRT68HgdAkEYxs5cqjLdGJbKFPMWs8dFNw1+214azH3eer8Pfw+Io01pnniXfefSTwgxIKG9jUufMohEePIqjc=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=duagon.com; spf=pass smtp.mailfrom=duagon.com; dkim=temperror (0-bit key) header.d=duagon.com header.i=@duagon.com header.b=HoDdGSKJ; dkim=temperror (0-bit key) header.d=duagon.com header.i=@duagon.com header.b=HoDdGSKJ; arc=fail smtp.client-ip=40.107.168.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=duagon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=duagon.com
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=hXaZdLXGUdz5ap8C2YCFaCY0knIoMIQ5P+lpDShk1Et8VCMyAQX22PA7WTv00abOyyo1CeeVoUV8HGNWa4w9PfltGKhwGDlhH4ofAbrlDyE6wlqthIKflVx8LDyWnXeR7kVubMaN74N/IaWFBzxSMu52b9Mc7jItoLE/aUmJ9R05UYKIk26LfHMGP9jdEHnjIpigZgD1r/wsE4mKsv+mhcs/7l/3Ez1hmFntPOh2C6kJKqPTFl3RHnW/zaghjyc4t1B21/KfaT/snsOaEsglhSjjsdVCjz7mYQk6zyZRyMS4F0aiK8PypejkhiOb4mekEa3ouPfOoisr1XvvCZk/gQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H8R+TLmb0fiesm42h/u2Q+n3Wx/EFd2Bft12zOuGYTw=;
 b=Dtz8Q6Wv9sJmLSvorhAgA0xZ/pbKuLKJFkqcVlR06hm+auXAeubfocOCL4bVoa5fJCUtbZJkeyq9KN6tBBwi0pUGbtRmEUKpjSJdXlKI7cWqanAbbgWcdsphset/lfQNAsktgHhGxgwuvJNouQA0YjLCNBttPbG6mXrQ7xwpHLMu7x6vZ0bqyOo73ZqLIbjrgE4wV9NCA6nxfbrId2Cwt8OSviKrkMZGsfNLfXypqBAsMEG8wbzIyUDG2jOssbwgdnivxtLHGe1LR0/LjeOiPJBl6S3UhP6MSuAbCxN1WmrnOEkYlDFas6ieRPoVH3Usvf8n3a4RbRUr2mtlhf38/g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 194.38.86.34) smtp.rcpttodomain=bgdev.pl smtp.mailfrom=duagon.com; dmarc=pass
 (p=reject sp=reject pct=100) action=none header.from=duagon.com; dkim=fail
 (no key for signature) header.d=duagon.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=duagon.com] dmarc=[1,1,header.from=duagon.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=duagon.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H8R+TLmb0fiesm42h/u2Q+n3Wx/EFd2Bft12zOuGYTw=;
 b=HoDdGSKJw05oeJMEdz1jlTtGX56Hpi2hRbsrvPq7h8PJBCSrwiM6hrFo36vUaRCEHjja4ApkuoL+OtkKy20qq4+xjvuPHXgAJHjjnETvAO1AIYhIOd2FoRIwUICEItaqueIUUwfhJqqQe3SgrKPhRh1G1bN1KKr5rGECUDMm3w4=
Received: from PAYP264CA0002.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:11e::7)
 by ZR1P278MB1609.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:99::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Fri, 31 Oct
 2025 10:08:02 +0000
Received: from AM1PEPF000252DE.eurprd07.prod.outlook.com
 (2603:10a6:102:11e:cafe::8b) by PAYP264CA0002.outlook.office365.com
 (2603:10a6:102:11e::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.14 via Frontend Transport; Fri,
 31 Oct 2025 10:08:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.38.86.34)
 smtp.mailfrom=duagon.com; dkim=fail (no key for signature)
 header.d=duagon.com;dmarc=pass action=none header.from=duagon.com;
Received-SPF: Pass (protection.outlook.com: domain of duagon.com designates
 194.38.86.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.38.86.34; helo=securemail.duagon.com; pr=C
Received: from securemail.duagon.com (194.38.86.34) by
 AM1PEPF000252DE.mail.protection.outlook.com (10.167.16.56) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.10
 via Frontend Transport; Fri, 31 Oct 2025 10:08:02 +0000
Received: from securemail (localhost [127.0.0.1])
	by securemail.duagon.com (Postfix) with SMTP id 4cyc7z2YQ3zxpB;
	Fri, 31 Oct 2025 11:06:23 +0100 (CET)
Received: from GVAP278CU002.outbound.protection.outlook.com (mail-switzerlandwestazlp17010004.outbound.protection.outlook.com [40.93.86.4])
	(using TLSv1.3 with cipher AEAD-AES256-GCM-SHA384 (256/256 bits)
	 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by securemail.duagon.com (Postfix) with ESMTPS;
	Fri, 31 Oct 2025 11:06:23 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KvLgCah+9Ua/qTFXLUyDtPTHt/nsqe/ZMDr3Y8ByeAhSz6+98kfw3WW3f/33nQsGcDgRAIGpJiZJuv2DBATF+0AOhc9o/hFVjzLAPtZv8T3TRsY/CzO2ITk3pYjYH6Z5R0LBrHXiW+DccxgGt3XoSWqiUnkqeG/yvITZyEE5BWoB9ACLs01rUPYNxkqlJu1yRGKvrL70w1q7ZWpYjdb1/Z7yUCfjJuWn0VlUbynLOaC35zhi9QOiwUbhBqj0PUW7RSUavoO8ErXErpTOiiK2nQTRHgElG64ILjPMrzyJbxY5q5xUYBWb2jnzcZ2ohFAI4UFo6k8SKEyPY+JyFU07Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H8R+TLmb0fiesm42h/u2Q+n3Wx/EFd2Bft12zOuGYTw=;
 b=obz5LGuNOAAgkdr8HsN+oNg3VVQKnPwGxN/2XSF6gKr6DzUh1CtlGi7Plo0E8YPBHO2VqdRKKiq6D05DIhWOwBGNxBan9+wG4t/+DM4Fuaaks27Qnd/+dorLoomGGlVDTxmRakJiRIin11zgf5DoB0mhc46lGO38NiHFH3Of/pYaKdGjQ02slwAHBtEg7rfym2R3WZULBEQKq81uaHVKYSFeCmFJXIc1tSuToqGHIv5HPgwK3y37Tv2Yk61LnR6iYtsyEEvDWx2JowHRldZQbTL2ZJQgOOr3GLz6/B2UaBJ/erlETD/UGocmffkhby5H5rX2BgVcQpVPHkzef7Zqmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 20.79.222.204) smtp.rcpttodomain=linaro.org smtp.mailfrom=duagon.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=duagon.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=duagon.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H8R+TLmb0fiesm42h/u2Q+n3Wx/EFd2Bft12zOuGYTw=;
 b=HoDdGSKJw05oeJMEdz1jlTtGX56Hpi2hRbsrvPq7h8PJBCSrwiM6hrFo36vUaRCEHjja4ApkuoL+OtkKy20qq4+xjvuPHXgAJHjjnETvAO1AIYhIOd2FoRIwUICEItaqueIUUwfhJqqQe3SgrKPhRh1G1bN1KKr5rGECUDMm3w4=
Received: from DU7PR01CA0001.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50f::16) by GV0P278MB1606.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:710:69::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Fri, 31 Oct
 2025 10:08:00 +0000
Received: from DB1PEPF00039232.eurprd03.prod.outlook.com
 (2603:10a6:10:50f:cafe::81) by DU7PR01CA0001.outlook.office365.com
 (2603:10a6:10:50f::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.15 via Frontend Transport; Fri,
 31 Oct 2025 10:08:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.79.222.204)
 smtp.mailfrom=duagon.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=duagon.com;
Received-SPF: Pass (protection.outlook.com: domain of duagon.com designates
 20.79.222.204 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.79.222.204; helo=de2-emailsignatures-cloud.codetwo.com; pr=C
Received: from de2-emailsignatures-cloud.codetwo.com (20.79.222.204) by
 DB1PEPF00039232.mail.protection.outlook.com (10.167.8.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Fri, 31 Oct 2025 10:07:58 +0000
Received: from ZRZP278CU001.outbound.protection.outlook.com (40.93.85.31) by de2-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Fri, 31 Oct 2025 10:07:57 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=duagon.com;
Received: from ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:34::6) by
 ZR0P278MB1556.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:a3::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.15; Fri, 31 Oct 2025 10:07:54 +0000
Received: from ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM
 ([fe80::39da:49d1:7c23:953e]) by ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM
 ([fe80::39da:49d1:7c23:953e%7]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 10:07:54 +0000
Date: Fri, 31 Oct 2025 11:07:53 +0100
From: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>
Reply-To: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>
To: linus.walleij@linaro.org, brgl@bgdev.pl
CC: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] gpio: menz127: add support for 16Z034 and 16Z037 GPIO
 controllers
Message-ID: <e6107389-ce76-66c9-b390-4ce79a19c0d1@duagon.com>
Content-Type: text/plain; charset="US-ASCII"
X-ClientProxiedBy: MA4P292CA0001.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2d::20) To ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:34::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	ZR0P278MB0523:EE_|ZR0P278MB1556:EE_|DB1PEPF00039232:EE_|GV0P278MB1606:EE_|AM1PEPF000252DE:EE_|ZR1P278MB1609:EE_
X-MS-Office365-Filtering-Correlation-Id: ce5457d1-0c75-4e04-5872-08de186560c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?4c1CsFA20xe8OEPHVPCzsAmkkV6UrY79Fgl0uxEnedcmjD+Xh+yFQGvv9Hqu?=
 =?us-ascii?Q?f2DbD6a+DJSn1uF5rKF0W5hrVSYe/l33OkhbhMUncmXXLbIx7GWcsT56SpHf?=
 =?us-ascii?Q?iQ795nsZuD3+AlxnbsUW3q9YSTJ6g8pjztcxsndjqjCBbAFS2vvo95ab5GbT?=
 =?us-ascii?Q?xXW0xLTA4EhJ18U9rN8JBuRQCjVx7Xb2GJtw9xiTe2TUtrMeoCI7ufUvoYjJ?=
 =?us-ascii?Q?zs7xD3y6cwhRj1VRP6pVyR7OFIAwQuXWfe+3zcBShbm/rSG+vakb/sGziyNn?=
 =?us-ascii?Q?hKHhaurl6lsAGufG+HucS4hptANowlUKIqZLBK90MMxa3nstzii84Yltv8YW?=
 =?us-ascii?Q?r7l2HtgwdFmnCjMZd8DVZPd8ouq+FjqFPh5So8gRfBv3JoOimTA9m73O86UP?=
 =?us-ascii?Q?BfW0IWBNSj35ia6tsdopFIb7u3m3dG1sYDrjrTddlgxmchPlTdMXCZUJp7NZ?=
 =?us-ascii?Q?Z+QaU8I8T7ISuOqs1PQvFxaHOxmd8V5GbuqQb+Xhx4erK6VHJVRtmSMHjjqU?=
 =?us-ascii?Q?PLfJjKH4bjirqDyee+6qxET4p6tek1yIViUASlCnzwWnXxbh7YMKpC4/dMEo?=
 =?us-ascii?Q?i4XOwkuLAfPKhWIpfeYeNAlViS91BiHBWuPJ0hQABkG/KmuQdTOQkeJaX8i/?=
 =?us-ascii?Q?lfV9JP9ooGZ03LytFv3+NH8JoTW6uHM8eAzG33Pkt5leUJe06MxeRCXcjuV9?=
 =?us-ascii?Q?cNyqsl7r4/xL5JIscHT+cylQmAMWmQCsVkMwZ2ug8cnR0ZBnRqL4qR0bV5S/?=
 =?us-ascii?Q?NaA3PvEJDs9T3VDRG3EOoV+fP8NO08trKn3Rgw8xcoYE44/JAJZgRaKfWpUi?=
 =?us-ascii?Q?KMXgrtpqu0SfKzDqZenMc6ho+537XVH3Q0254As7Ypuc3gWBMUEBUeindxnB?=
 =?us-ascii?Q?xJt8vAXnHBfdTYHbiLmUPWjvHA9dDYTrFOaMRPHf3FRXAvwtUOGTJN8Q0Hjf?=
 =?us-ascii?Q?tAsCDdrZd2i/lBcZPZAwP1kNzLdyvk06fHIRaRu0M1+jGaIVP20ga31Zu61l?=
 =?us-ascii?Q?PrY/U0t0ifWF9gvgKygCONBmmQavixMA47jTuG0BLo4D4RBKDMq0uYpoGKlM?=
 =?us-ascii?Q?25bw5ukH2PDSkZzc9Hao3BQgv1hR0MBkTdzlcaMs2JfBcqHQKA1LYtFdLLf9?=
 =?us-ascii?Q?3sPN0hmS93jxNUbXNZfA4MWkO5ptLYUsrOeYmF+j90AT5jqi1Ip5xZIxmHiu?=
 =?us-ascii?Q?yi4eZj6TqfKlgOix4DYZwdMazyFQ9TD8Mgf1S+8tbMPrxcqCkSeff13WCNzJ?=
 =?us-ascii?Q?eLOj61eJAsLMPvd7jkrLKq9DKAID5Nz557Kmel8eFBigXqdEGesXOOpi6uu6?=
 =?us-ascii?Q?z1eKEHP7tkWquvkOnui8lfsL4N577RKeJgXS/zsp+FEVLKd08E8POdFtLrwZ?=
 =?us-ascii?Q?jS7hnN3Aj6yEYFG4tGOqpBAkTcDO/3zn4kPZHJ5ZxX3JB4f+I1hgKYMtLmyR?=
 =?us-ascii?Q?mSzgRN3FFqUYkk4TLMEm3OobaMk/dwpR?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR0P278MB1556
X-CodeTwo-MessageID: b57d3558-3080-4fcf-85ba-d6bc06ccf691.20251031100757@de2-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 1
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF00039232.eurprd03.prod.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
 cf11e8bd-42dd-4d79-9840-08de18655bc1
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|14060799003|35042699022|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?9AVPQTJgp5pB6JjlA/JeBu30yyNUDlK8KYRF8/Vyt/ipOqLd2977cojm+5LP?=
 =?us-ascii?Q?417Lw5I0AlUH1uT5Id6Pq0EEnAKz9uOKEdGYBRU5Xyhi/SkJU+eZODIN29jp?=
 =?us-ascii?Q?5JugAgmPskQsYFE7vznpE6agukZvXetsd2IaaAqwpkB5tadHIQJMo8NU73Pl?=
 =?us-ascii?Q?eiCdIi5AyVFGfVBSRUMJil9Q68z3EQHqoKWcEbXdT2sQPVP+qZyf6VLHXIkT?=
 =?us-ascii?Q?lc3PJtb5zGzPxgcSWupuS9ereSjCfSkSX8w4hpoPytfmfUE4+bB1/wInAY/9?=
 =?us-ascii?Q?XPbTN1PoTl81krNhgXaMcY2SNsGVQpWw70DfXJLYlBbEh+zuspdVuZ48DSts?=
 =?us-ascii?Q?0VnWeJ+Ctzs7q9aW0I9SEjSua3hkAcVfHYBq5S1x5fzg/DEGVe6M0iNk1aAV?=
 =?us-ascii?Q?CFubtMch43puokVaMFu6KuXdeuj7Lc+Z9f6EoZFNMhZb4x7W4S5Nvk9PM1zY?=
 =?us-ascii?Q?40rGNByyIa6tQXRTIxWIwNuEtJAsDTwcw2nCmgPunAPA4fPrzTUgje72Gssa?=
 =?us-ascii?Q?ZFicnT7wtkQg/51FQW2S1cRqdo0UvYJa9iAxyBk3EtG1ijSc67NBvvvGJJdk?=
 =?us-ascii?Q?d9Q0HFhoR9RuYPvxVVAAWVikpMpq9ogUxyImYNqOB2TvZQ25qp2g+yldrtBQ?=
 =?us-ascii?Q?JcMSidDohDLfpJToD4IbSqQF1CT3W8aXrgjdPqXGJfjjSrB45yH3kz3VHnjN?=
 =?us-ascii?Q?AhwU1TUylMzvzoAxr0mOaeL0zB0eATs6zxX98bol3aAKVkcWZwlQfLD+hNXW?=
 =?us-ascii?Q?ittCuhbVgc0TIZUmon3eF45Q+yoRRPl29qLKLSOBbB6esJtDbi5c3VTYRf2C?=
 =?us-ascii?Q?i7+LGxn6eK6VOhw/+Ca/6t2abMZt0ckakqSsZUxZ7gJHIU9+RZeulCDWGT7k?=
 =?us-ascii?Q?eXmGpfKeG+BNJrxscMMNCyLpnWcCrUDxA5hE/9Fh4SJqTOgKpgEFnjHNk65/?=
 =?us-ascii?Q?gq6AJO3fVBPjChu60kt+S1wN3KKpCmFZT3Pka+wYxwpXg3WZcf1alQVjafC2?=
 =?us-ascii?Q?Tj30CF6TRnNMteRgU0BeMW/eFPqdUZW2lLw/B+5J/+feVSvycCrpxkGtsZLj?=
 =?us-ascii?Q?SyRiDotgVZE/KM+AK9xB4uCR12JN1yGe2UPS6sos3NAUipAGfuN6/oHvas/r?=
 =?us-ascii?Q?KXMsc4IJV+Al21kn8t+gs1BbJEKHy9ftk+6BIUtAHMpgocS2BpmJxm3vrrZF?=
 =?us-ascii?Q?2SMA8TifrlrqLo0ZOlKSzYtanilOwOO18f722Bw8PbMafp7I7uMauSIZsntb?=
 =?us-ascii?Q?vsEPiWQgxoLJg7JYVh9ZN2uGSEajeR5XjE4jv0HtOpnxYkoSDPD/lgou9L+p?=
 =?us-ascii?Q?3PpPSEaFfkjOPZhcr+3UtNRKudyWluKMleP+JDZ1Wbp5XCZlTHPeDQHjNPo9?=
 =?us-ascii?Q?IY7Osa6AaFqBotsPgqdCFByf0zsGYMZgwQOPsf2ZXyWWKIYQI+wcdpDTplAg?=
 =?us-ascii?Q?kPtzTg7+5/p6Al2OpYSm9N4gBqhNiQVu5RYd9K/S64ptuVaoAm2igQtali32?=
 =?us-ascii?Q?NtGRi3C1TfhdyDwno0TcjrEdcjtmddqnQw82SixPxE7zLNonr8G9kqJDUupj?=
 =?us-ascii?Q?hw4j63nlWROocHiVkwo=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:20.79.222.204;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:de2-emailsignatures-cloud.codetwo.com;PTR:de2-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230040)(14060799003)(35042699022)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV0P278MB1606
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM1PEPF000252DE.eurprd07.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d65e8b8b-b9d5-42ad-ba18-08de18655e77
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?l5bd/Ccfz+3BppZoAzcWEL5s/0Tz8GVbddnyz6bX3Rrlio57JFY6ZFFIDXpv?=
 =?us-ascii?Q?NUGKeJ1IxsJIsdzKaogx+zGnQY8lZk3x0sZPdkETm+xEFsmtaWwdPrwdryKJ?=
 =?us-ascii?Q?n8aQnbJPndCVYsjaLzC3sb0n5iTKa5tJdbXVKlXYNlp+gADf17/HeH5BeK4l?=
 =?us-ascii?Q?ScVtw7cE7mP6i4Cx1KRu1mDBXeJXOvwY9GKTyl/NFQppGi7o13xy8ZeM6PMB?=
 =?us-ascii?Q?8Gff40zjsmnw0C1lOSOKTAkqGP4boXKaVCLL2mLx6ISGi9N0kxlpNWG1qcvw?=
 =?us-ascii?Q?ZAsrJcBhYf2qF6EKyn0m/XizKmu0k+u+SVCDLM+CafT3jIR0zfSECd4sr/p7?=
 =?us-ascii?Q?n+UmqQwu6RUGU3gHD9UV+J1OrD8wVESdqbouAwaHg7h4GenHZzQZdhzz0acA?=
 =?us-ascii?Q?Ot4qtfuRZZ30atNcpqoibLGEy4HuraL+hXZLT5b5s89B48fwEuSToyifJ379?=
 =?us-ascii?Q?uoNmA21EuP16vZUvZ0XCncGcFgRRaBDX1fUVJmCtxxk0JE3JMP1XE+DqFHOG?=
 =?us-ascii?Q?90HJ1AEl8ee9j7+gtEf5ahdY4ZN4LKgk04asjPfwEC2C6rX4OPkHBEYWNcE3?=
 =?us-ascii?Q?LAtnqtic+/D2+AJsnJ98LTKjE4pQKFUdmuOPlHw09YcJJkIlFvqctsWx+mUn?=
 =?us-ascii?Q?cMikG4T4SegSVjX2vhiUjJAvAPX/tKokKfSvIyapwgulAh8stkv55ENtOO3s?=
 =?us-ascii?Q?gaEN9intMaXrcscwU1UGZ0v68VLdfjw1sjtxyQEPbCGlREXzsB4CF7ykMk++?=
 =?us-ascii?Q?6QlK864klV4T6LIMuIEyyWLbgytKPn9XVirGgBSZkrCooytZSEctmUhwPLMF?=
 =?us-ascii?Q?deHIOX4r3tQPGwRlM3V8YbJFtn+quIvVIRrVOoOhHIzC2GgjjQQ4pWqoL172?=
 =?us-ascii?Q?2UXvZXsTfUNQbs3W3vS5Rg6teoestRKmWGNGZ0+mHstWbuxH1ETdDn60SuKQ?=
 =?us-ascii?Q?Ho0t2AVn/rcCBDrkzeggAskJMKU3ugEHtkD1/DLsI7QGyBS+lMXcCKzfk0Ai?=
 =?us-ascii?Q?92/cwjHPkskiwrfvREmR48InlnQouL3shiqnKlZJt0WfSg8AdpPwDIUGEIRH?=
 =?us-ascii?Q?TI/reMzZ5axdB/t6GkITf4Dk/4CYGxIDgNNZUhsUpy0FK5PuwH+lKPg8NhTf?=
 =?us-ascii?Q?t4HLy+JItzJmOx9kqFrilfW9VhWjGjd0KwGsDm8/tZTZ+VBcT5KeNpljB/OI?=
 =?us-ascii?Q?oRSom9bSOhlHHgvzZkQzAtPGLg680FTopV7cUxW5I7nb9sZ/eapocKHDX3Q9?=
 =?us-ascii?Q?FH8spr1jq5Gf9qyOvDjDPMugixHIBX+edWYEP4fxwncXgkW4KyNJWJGVqSwR?=
 =?us-ascii?Q?qkTLuwmjywnNLaZWl9k+9CRUvwCfYaT7pchHk48DmJotvVqmkcUskxKbJF7G?=
 =?us-ascii?Q?c+lFN4seZK7Q1qGDaHYsfbm1Iy7EJJNp3D1GFoJ7Q/kiBuOwRAO2bhmezg4d?=
 =?us-ascii?Q?mM5UQZGXf0hXyGPPiAHR6V6Zj0Sj/HfAJ9I7pZaPu5K5DkidBYJ9QE3kwPLQ?=
 =?us-ascii?Q?9uvV4yHlpBFnXZhjXvhfDyyTJiwjF+nw6XA4cyDzidzqdJbpMIgquZ7fvX6r?=
 =?us-ascii?Q?ZmDtLF0OcDnr6qMvUMY=3D?=
X-Forefront-Antispam-Report:
	CIP:194.38.86.34;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:securemail.duagon.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: duagon.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 10:08:02.5073
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce5457d1-0c75-4e04-5872-08de186560c5
X-MS-Exchange-CrossTenant-Id: e5e7e96e-8a28-45d6-9093-a40dd5b51a57
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5e7e96e-8a28-45d6-9093-a40dd5b51a57;Ip=[194.38.86.34];Helo=[securemail.duagon.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM1PEPF000252DE.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR1P278MB1609

From 7655a73f3888a5d164d1f287ba1f2989bb2aadd2 Mon Sep 17 00:00:00 2001
From: Javier Rodriguez <josejavier.rodriguez@duagon.com>
Date: Tue, 28 Oct 2025 17:40:14 +0100
Subject: [PATCH] gpio: menz127: add support for 16Z034 and 16Z037 GPIO
 controllers

The 16Z034 and 16Z037 are 8 bits GPIO controllers that share the
same registers and features of the 16Z127 GPIO controller.

Reviewed-by: Felipe Fensen Casado <felipe.jensen@duagon.com>
Signed-off-by: Javier Rodriguez <josejavier.rodriguez@duagon.com>
---
 drivers/gpio/gpio-menz127.c | 36 ++++++++++++++++++++++++++++++++++--
 1 file changed, 34 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-menz127.c b/drivers/gpio/gpio-menz127.c
index da2bf9381cc4..ec9228f1e631 100644
--- a/drivers/gpio/gpio-menz127.c
+++ b/drivers/gpio/gpio-menz127.c
@@ -24,6 +24,12 @@
 #define MEN_Z127_ODER	0x1C
 #define GPIO_TO_DBCNT_REG(gpio)	((gpio * 4) + 0x80)
 
+
+/* MEN Z127 supported model ids*/
+#define MEN_Z127_ID	0x7f
+#define MEN_Z034_ID	0x22
+#define MEN_Z037_ID	0x25
+
 #define MEN_Z127_DB_MIN_US	50
 /* 16 bit compare register. Each bit represents 50us */
 #define MEN_Z127_DB_MAX_US	(0xffff * MEN_Z127_DB_MIN_US)
@@ -36,6 +42,25 @@ struct men_z127_gpio {
 	struct resource *mem;
 };
 
+static int men_z127_lookup_gpio_size(struct mcb_device *mdev,
+				     unsigned long *sz)
+{
+	switch (mdev->id) {
+	case MEN_Z127_ID:
+		*sz = 4;
+		break;
+	case MEN_Z034_ID:
+	case MEN_Z037_ID:
+		*sz = 1;
+		break;
+	default:
+		dev_err(&mdev->dev, "no size found for id %d", mdev->id);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int men_z127_debounce(struct gpio_chip *gc, unsigned gpio,
 			     unsigned debounce)
 {
@@ -140,6 +165,7 @@ static int men_z127_probe(struct mcb_device *mdev,
 	struct men_z127_gpio *men_z127_gpio;
 	struct device *dev = &mdev->dev;
 	int ret;
+	unsigned long sz;
 
 	men_z127_gpio = devm_kzalloc(dev, sizeof(struct men_z127_gpio),
 				     GFP_KERNEL);
@@ -163,9 +189,13 @@ static int men_z127_probe(struct mcb_device *mdev,
 
 	mcb_set_drvdata(mdev, men_z127_gpio);
 
+	ret = men_z127_lookup_gpio_size(mdev, &sz);
+	if (ret)
+		return ret;
+
 	config = (struct gpio_generic_chip_config) {
 		.dev = &mdev->dev,
-		.sz = 4,
+		.sz = sz,
 		.dat = men_z127_gpio->reg_base + MEN_Z127_PSR,
 		.set = men_z127_gpio->reg_base + MEN_Z127_CTRL,
 		.dirout = men_z127_gpio->reg_base + MEN_Z127_GPIODR,
@@ -186,7 +216,9 @@ static int men_z127_probe(struct mcb_device *mdev,
 }
 
 static const struct mcb_device_id men_z127_ids[] = {
-	{ .device = 0x7f },
+	{ .device = MEN_Z127_ID },
+	{ .device = MEN_Z034_ID },
+	{ .device = MEN_Z037_ID },
 	{ }
 };
 MODULE_DEVICE_TABLE(mcb, men_z127_ids);
-- 
2.51.0

