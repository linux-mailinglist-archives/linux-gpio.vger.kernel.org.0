Return-Path: <linux-gpio+bounces-30339-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A6855D08F18
	for <lists+linux-gpio@lfdr.de>; Fri, 09 Jan 2026 12:36:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2D0AB3129EB6
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jan 2026 11:31:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADF113191D7;
	Fri,  9 Jan 2026 11:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=duagon.com header.i=@duagon.com header.b="Kvffnz8m"
X-Original-To: linux-gpio@vger.kernel.org
Received: from ZR1P278CU001.outbound.protection.outlook.com (mail-switzerlandnorthazon11022082.outbound.protection.outlook.com [40.107.168.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9942227EA8;
	Fri,  9 Jan 2026 11:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.168.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767958267; cv=fail; b=px0wgIic0p/NZONsc7jUV1/mwUmELSqv/UJC3ZqRd1z6xZTzjB1MRu/gx0G3s3IPWE3S+AdwCDBfEzBUzS05iQfjoN4yFjs4A8PqcpKsnIzcdPhe2xD/MdD/4R6pCztV4vyNgfCvecOFydW+rB5ngemUy8hyH7NMRenQjckchjE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767958267; c=relaxed/simple;
	bh=vP7Icn01o8ZsueCO7TrEvHCldWHgWU9VW0vO0vm7UGQ=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=EvqNSdz3Wx848zrTMDQuuc97a0QToTcmusAR4zPnIUlq/tK8BbBq3pzAUOTb8BZvuDbEdv57cVKGjeyH8w/pi8yrE+fgzFYs851x3+vZANOx5WYGKiRNhUWJNrZY7zKpFUJmTCDuB44sua+WlRzU9zz68/vBWqbiYDBoeL2sf8g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=duagon.com; spf=pass smtp.mailfrom=duagon.com; dkim=pass (1024-bit key) header.d=duagon.com header.i=@duagon.com header.b=Kvffnz8m; arc=fail smtp.client-ip=40.107.168.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=duagon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=duagon.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SoftjK4VP8wPZ9Oj855fNJgTBPGnnp0mIi2kiz5M2D8OwBKk/KISPUUTyrogDdxwPlUpLuErp1WtA0iC6Q6mmxBZHe48k3TWSHvgAg2+EnoY0IFLK6/Fqm44GLJdca1rwRscplM8cPKxh1Y/lRrIct+rXvxRJ+PiigIRg9f4LxeDKg0P7WeI69tAWRk/gKApRRnTZnnGnb4r6zw3cGDZ6qOiNR53P7ZC2JwHJPn1ermP8NEmHFspxar8ipCT1nKUOe8b7f1quQ8/XuNdns+KSo0xOsBDquP7on5ymPIMK/RNrJYblj2mr8PFQL1tlLfr5U05qIpVjDjjQiq7IqsIew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yig5AVO0vchig0tw8hDCxtdYJuFN3D7K45tO5zx/nTw=;
 b=pYo0FoAseSmo5MF+Atam2JV7nq5HuSAxr4eLz/mf+/hfXLjxkXfK0fKZM8TP+5aXtTk8X1tj5Hk2SLHvyPTRlaepJjebI/LKlJVPvH+KSuuz9Wojd/5IxBMKmzPuGjj+yxVZyOyumQmWtz6EbhCLoOuRt3vmvLW0gYADY4wEbVvdMhoQOg6q8mIehSxvotZh/ZIR0fd0PCpi3x6VXIHMfWRH++npOYVatfcZKby84g4bXjFD6Ub59BbLAIGGBWKNyBIAMHCeYROVW3iA6gqJ0eFlVIk0afHh2XLk4YFf0yWpAnKc404GAXt6+Py5pjEHoxSMXEb0bcVcFU1ewu2eDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.85.51) smtp.rcpttodomain=intel.com smtp.mailfrom=duagon.com; dmarc=pass
 (p=reject sp=reject pct=100) action=none header.from=duagon.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=duagon.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yig5AVO0vchig0tw8hDCxtdYJuFN3D7K45tO5zx/nTw=;
 b=Kvffnz8mZzAVeUtvWeVwuyTjXEqjR4KbSyB/tkZ0R0+0ATlT6HHs5/YW+LaO+UPffjONUvnq5la4aE9hWhxqZSOn5+QW5pLAm12666Hr/g+oo2cb3X98Qb3U57tdf63YcTu1VztaOZ3E9db4iB90ji2lzj+eqDbXS0M2DtVkEU8=
Received: from DU7P251CA0025.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:551::20)
 by ZR0P278MB0869.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:42::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Fri, 9 Jan
 2026 11:31:00 +0000
Received: from DU6PEPF00009523.eurprd02.prod.outlook.com
 (2603:10a6:10:551:cafe::5c) by DU7P251CA0025.outlook.office365.com
 (2603:10a6:10:551::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.4 via Frontend Transport; Fri, 9
 Jan 2026 11:30:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.85.51)
 smtp.mailfrom=duagon.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=duagon.com;
Received-SPF: Pass (protection.outlook.com: domain of duagon.com designates
 40.93.85.51 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.85.51; helo=ZR1P278CU001.outbound.protection.outlook.com;
 pr=C
Received: from hz-deliver02.de.seppmail.cloud (162.55.72.218) by
 DU6PEPF00009523.mail.protection.outlook.com (10.167.8.4) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.1 via
 Frontend Transport; Fri, 9 Jan 2026 11:30:59 +0000
Received: from hz-glue02.de.seppmail.cloud (unknown [10.11.0.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hz-deliver02.de.seppmail.cloud (Postfix) with ESMTPS id 4dnfjH05WSz114Q;
	Fri,  9 Jan 2026 12:30:59 +0100 (CET)
Received: from hz-glue02.de.seppmail.cloud (unknown [172.18.0.7])
	by hz-glue02.de.seppmail.cloud (Postfix) with SMTP id 4dnfjG6vygz1wpC;
	Fri,  9 Jan 2026 12:30:58 +0100 (CET)
X-SEPP-Suspect: 09df2f1e55fb4ad7a44cd2e292ac9811
Received: from hz-scan10.de.seppmail.cloud (unknown [10.11.0.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by hz-glue04.de.seppmail.cloud (Postfix) with ESMTPS id 4dnfjG6GVrz237D;
	Fri,  9 Jan 2026 12:30:58 +0100 (CET)
Received: from hz-scan10 (localhost [127.0.0.1])
	by hz-scan10.de.seppmail.cloud (Postfix) with SMTP id 4dnfjG5pc8z4gqh;
	Fri, 09 Jan 2026 12:30:58 +0100 (CET)
Received: from hz-m365gate02.de.seppmail.cloud (unknown [10.11.0.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hz-scan10.de.seppmail.cloud (Postfix) with ESMTPS;
	Fri, 09 Jan 2026 12:30:57 +0100 (CET)
Received: from ZR1P278CU001.outbound.protection.outlook.com (mail-switzerlandnorthazlp17012051.outbound.protection.outlook.com [40.93.85.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (not verified))
	by hz-m365gate02.de.seppmail.cloud (Postfix) with ESMTPS id 4dnfjF0G0cz2wQy;
	Fri,  9 Jan 2026 12:30:56 +0100 (CET)
Received: from AM0PR02CA0182.eurprd02.prod.outlook.com (2603:10a6:20b:28e::19)
 by ZR3P278MB1405.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:9f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Fri, 9 Jan
 2026 11:30:54 +0000
Received: from AM4PEPF00027A66.eurprd04.prod.outlook.com
 (2603:10a6:20b:28e:cafe::7f) by AM0PR02CA0182.outlook.office365.com
 (2603:10a6:20b:28e::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.2 via Frontend Transport; Fri, 9
 Jan 2026 11:30:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.79.222.204)
 smtp.mailfrom=duagon.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=duagon.com;
Received-SPF: Pass (protection.outlook.com: domain of duagon.com designates
 20.79.222.204 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.79.222.204; helo=de2-emailsignatures-cloud.codetwo.com; pr=C
Received: from de2-emailsignatures-cloud.codetwo.com (20.79.222.204) by
 AM4PEPF00027A66.mail.protection.outlook.com (10.167.16.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Fri, 9 Jan 2026 11:30:54 +0000
Received: from ZRAP278CU002.outbound.protection.outlook.com (40.93.85.0) by de2-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Fri, 09 Jan 2026 11:30:53 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=duagon.com;
Received: from ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:34::6) by
 ZR0P278MB1533.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:a5::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.4; Fri, 9 Jan 2026 11:30:51 +0000
Received: from ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM
 ([fe80::39da:49d1:7c23:953e]) by ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM
 ([fe80::39da:49d1:7c23:953e%7]) with mapi id 15.20.9499.004; Fri, 9 Jan 2026
 11:30:51 +0000
Date: Fri, 9 Jan 2026 12:30:42 +0100
From: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>
To: Bartosz Golaszewski <brgl@kernel.org>
CC: linusw@kernel.org, andriy.shevchenko@intel.com,
	dev-jorge.sanjuangarcia@duagon.com, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] gpio: gpio-menz127: drop unneeded MODULE_ALIAS
Message-ID: <aWDm4pjW83yta2Mx@MNI-190>
References: <20260108134843.25903-1-dev-josejavier.rodriguez@duagon.com>
 <20260108134843.25903-2-dev-josejavier.rodriguez@duagon.com>
 <CAMRc=McFDfVjpEBGzRpWiyH0D4q2eOApKZrJLFgh_UXQ=tDNMA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAMRc=McFDfVjpEBGzRpWiyH0D4q2eOApKZrJLFgh_UXQ=tDNMA@mail.gmail.com>
X-ClientProxiedBy: MA4P292CA0015.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2d::8) To ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:34::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	ZR0P278MB0523:EE_|ZR0P278MB1533:EE_|AM4PEPF00027A66:EE_|ZR3P278MB1405:EE_|DU6PEPF00009523:EE_|ZR0P278MB0869:EE_
X-MS-Office365-Filtering-Correlation-Id: de4d5258-7d31-4425-8a8c-08de4f729015
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?VUl2eGR1cXVOL3VIN24yT2pyYTAvNHhiclY0NHNkUjBEWGVGRDM2OHFqV0c1?=
 =?utf-8?B?UUo0dmk5S2RlVGJEb0Z6bS8xMFVGeEVNM1hpcU9wdnpzQkdBKy9wOThzN0ov?=
 =?utf-8?B?dzVMeUIzdUlPb21FazdoY2NGRVRua1FvdjFhT2dzWklXcTJXMm1mNFFRVWFU?=
 =?utf-8?B?U0hzZHlJSXFuUFVUUlhSQmlGSGprQlZvYWprNFlSMkNNeklGMzJhQkVTWWNW?=
 =?utf-8?B?K1JSS2hWTXhFRnZtemQ2VUZXSENiNkk2YlBoRjBxcXlUTld5WHh4ajJnbzBB?=
 =?utf-8?B?b3Y4aGVENUtEL08rTDcyZHcwZU5LZlkvZVVSOHFSQmtoNUh4Z0lsQ0x1dmp2?=
 =?utf-8?B?OHhqY1hhQnRHK29qMXRsU3Fwd2FyL09waktYYVdaOSt3emMwUTRtdll0V1NH?=
 =?utf-8?B?NHZTUTFCeXJ2djIwaWk2QitCaE92cGlVUjRLWDhrbnZPTDcrcUtkeTVpVW9F?=
 =?utf-8?B?aHVVVGxrTzNSWjhkOUZqL3g2TStMYkMwTitpWlV4M2xhRUs4Z0Q4Mk41RXd2?=
 =?utf-8?B?eTFPUGp3bkZDMTk5NXIwaUhQWGI5VEdrWEM4V0MzZUdObDRWWkljQ3JiMGt0?=
 =?utf-8?B?Z1pmQ2hCVlB6RnRJMjF4NmVnZ2ZDZElYVG1PdndhWVdqUC8rUUtTcXZqNGNk?=
 =?utf-8?B?S2x0aWlWWHVYUGdSazlycUh0bVZNeFlWTnBpaExZbWtaUGtlZSs4c2xUTlRl?=
 =?utf-8?B?eE1IbUZJNVplUW12Vi9rUHlVeDVST3FyNDBYdUdXZ3lwK3VodUtwM3kzRS80?=
 =?utf-8?B?VzUzTTkyQ2Z3bDhPdXFCUTUxTThZck1CSCt3dlhOSXR2b1VaamRyajcvVWZO?=
 =?utf-8?B?Zk9DTkZRcGhRNUdiNzZpZnU1TE5Dd2w3eExMcDFRaHBFUytaRHFMMisyT2xm?=
 =?utf-8?B?Q21RNFBxa0xiQmc5cUM2cVpLK3dtakZOaHpSQXk1SUtQTUVmWThmUDBVNjVl?=
 =?utf-8?B?OE5qVTVzU1RpNlpnZ2xYRklpeWI5ZjJZSVl5U2NRWnE0bmkwSTFjQnRxWVE3?=
 =?utf-8?B?VzZIem1aUTk4Ukp6eXlpd1JzVThpQ3ZleG92ZUJtc25RS2MwQmtFWmZjZHlt?=
 =?utf-8?B?ejFnNG1GMDhjaWltRHAwVENwc3JCaXVEUG9aM0RTcWxkcUw5aHQ4ZlU2UWlq?=
 =?utf-8?B?aXFEREt6bUh6NXY3QmhJT1F4NDhPQlJZbkhsL096enU4dHFWaENsYVZTdzNz?=
 =?utf-8?B?L1R6RTVvZlRNSWhRUFowNjk3cWxPTkJpa21QaUxFQkNxc1hxS0lNVXVTNlA4?=
 =?utf-8?B?eHRZVGJmMkx0T1dzWUlTLzc4Y0lETzZmWXdsZ2lPdUkwLzhoKzVXZytsOG9D?=
 =?utf-8?B?TWUzWkJvRlJtMWRsbHBvMi85N2dUa2FwcklwWlZyb1A4SjhhTjN6Mmx3SWty?=
 =?utf-8?B?UkJRVWpUaWRmSmRJTjc4cDl1cERWU0FnMDl0NUxKbWhJQ1htU1BQY3lVOFNy?=
 =?utf-8?B?MURSME9aS3RmU3RqSUtQN0FmT1JPN3NmK2cxcFZMV29rUzFlZWxpZ3RlNTFO?=
 =?utf-8?B?Ymh1M3pPejdzOFV5WDJpUUxQUnZFZks1YnlsSFRCUnNQN3I2bStDNGFueC9q?=
 =?utf-8?B?RzZKbkk4ajJUWXdVdVZYSExvMk13bkxuYUUwclMxcEZtRU1mTEVaNGszWnAx?=
 =?utf-8?B?LzR6Zm16WXJmRC8vTGNvZXUyajVZcVAyODFZSXRGaGhjdUFZaFRERWp6a1V1?=
 =?utf-8?B?MC9vZ1RpSWFwYjFWa2Ura3hEMjZUd3hOZXNkd09MSTlwclFaNCtvaFpOMk5n?=
 =?utf-8?B?U2JFbXRCZEdkUk4wTTFWQjNIdkxPTW8vUGhXRmRoRWJhVTVWN0srRkZWNVpr?=
 =?utf-8?B?dEdUWWs1ckpzZ2VERTI4bEFYUlBpeFVPekFDOVhmYTladEhyeEFGVytWRUpP?=
 =?utf-8?B?U3RKUVBGTnducC82cnA1L2g0RU1VMDdhSkhveG84UlduR2o1Yy9aVnlWT3dW?=
 =?utf-8?B?QlV3MUVrWlphT0g3UzBPRHA3Q2laQ2pCa1Q3SHUwbDF0YmhUeGZDOVBwQjhj?=
 =?utf-8?B?cTNHMkozWVpHaVV4emxFRFpGRWt0RG0wcjR1b01pT2U4K0RSNkRqZ000SFlE?=
 =?utf-8?Q?UO9F7D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR0P278MB1533
X-CodeTwo-MessageID: 67a91eac-1e08-4a81-8649-b412e00c7dda.20260109113053@de2-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 1
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00027A66.eurprd04.prod.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
 a12e55eb-1755-4032-976e-08de4f728a5d
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|82310400026|14060799003|1800799024|35042699022|36860700013|376014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?aG50d1lrV0RvR1NPV0gxSG5VYnJaOXBZZzl0VXRMMmdvWEpldWo1VXJ4L2ho?=
 =?utf-8?B?SFBzQ1hVdFRzeTcweHVSRUJNMEo0ZGNjWkUwUkgyUW50blo5aXZ6MjI5dkx6?=
 =?utf-8?B?QmxjRFoxd1RkeGZQa3ZQTUJIN2NTaTREVHk1MllseTVSVW1BZUFXTHZjQlZv?=
 =?utf-8?B?dmF2NkNQNVNuaWl5V3JGZDA4UWUybUVacnNwZ3hqMWkwdDA3M0lJKzZleHJi?=
 =?utf-8?B?aVBQOEF2Mmhhb0hBUGNQRVdSbWtiUGRLRzdUOG41SWhMRUo2UTR6SWsvNVgw?=
 =?utf-8?B?TVluS29nUGdmU2xxaHlUNE5SOXpLZlpKNEova0liei9FSFB3NHBPQ3hUWnQx?=
 =?utf-8?B?MEF0dnVpRDRCZTFyUGRIbXR2bktrSUZqc0hIK09lMGNCdUxadGtXREVBUDJX?=
 =?utf-8?B?Mm9PUDRxN0QyOTVIbUpwWlpIYTBvd3VKaHE3ZEhVQVVkUzFXYXF0K3ZpZFFp?=
 =?utf-8?B?bXp1bnpiYm0vMUJBZGZkWnFTTEEwYmczaVV0cHJjNHMyWDhjbFg0TjNxaGVq?=
 =?utf-8?B?WHNySTlIMFRnYTNUMzk5Z2IxbStjMDdSb0RsdGpZU0RoTW1UakkyQkhrZDAr?=
 =?utf-8?B?QXliTjVXbjlzZUU2S0l5NjJTMWFub1BQNkIyZ21jVk5FS05iME5tdXNZclpt?=
 =?utf-8?B?SXBqc2QwZWNBMWI2Zm1saVNEamhTcFlnUUhPRGl2dUtpeUV4OWVwdU5HUXRR?=
 =?utf-8?B?ck5HVGlWVjFwYmVFc052Q1BNYTJsS0pubWhyUDY4TVdnMnpZQlVmcTFvUkd3?=
 =?utf-8?B?aFJmMU1lV1JjbGxZOURNNEZOMCtMOEkvTTFvRElXYXhERFd4MEtmSWRYWUV4?=
 =?utf-8?B?cE5nQmc3RW1pd3RpcHliUTZhalg5SHpweWZGRDBBajVSdThGVTlXZC9xYWpD?=
 =?utf-8?B?dWVwUHRaTGlkckxKbG96bmRtMmtCRHJXWmM1RnJLbUN1YWNCRUJMSkxFMGZk?=
 =?utf-8?B?YWgzTG05TUR0bUVYakREQ1lZa1VLTmQvVDRoSUhXWU5uRk9BVER6TmNiY3d2?=
 =?utf-8?B?MU5NNVFoMjZNeldXN2E4bmJKZTc5a245WDZ5aXA0dzdmWlp6NG1IdFJKMi9u?=
 =?utf-8?B?dHRlN0ttd2NGOWhVcENPSGZIb0Jybm9XK0JQV04yZUpaN0RVc3V3NTlydzdG?=
 =?utf-8?B?NzBjdGhHTDgxUG5Na1Z6bmp2MDQzWVNoSzVSc21XRjA5MENoY3lOUUdpblRV?=
 =?utf-8?B?VHJxRHk0dW9GVk9JSzJZWjhaZnpWMFgzRHpKSmw4MGlmN2Fyd1BVR0l3YnZr?=
 =?utf-8?B?MEZFd0gxZ0N3eExJTXBOUGJLQi9yQk1VZWR4cVhQdGtYejFKakUwOUtna28y?=
 =?utf-8?B?ck4ya2w1M1RvUDZjM0pJODRDT2c1UkxSU0dXRGRTVzVMbEFESk9mQ0JQRjJW?=
 =?utf-8?B?aEg5bDF5LzR3RHErZ0VPSW1qeTJ5YXFvUkZjWTBJZ1g0cWFIRW0vS2hMS0dT?=
 =?utf-8?B?WDljRi9BWEJzcVRrV2drUzZMWjIrSC9IUE1TYjVuQkxwdDRERXNHUzlXWlJm?=
 =?utf-8?B?aEozYW1aejlDUlFGcXBpOUJDalkxL1QvQkg5SkVIdlJQcGFIVTFVLzg0RmN2?=
 =?utf-8?B?ZGtuTFRjVlo3WUhSNmpjYTJhMElKNjZIeDh3QU94QWVaaEZ6ckJLTkx1dXBD?=
 =?utf-8?B?M0lWYjkrUGJsbk4ybTA4S01Pc0ZwSWZJTlJ0cS9CYzZadU1tQjdCN0g5WmRD?=
 =?utf-8?B?Vkl1SU03blJlMDVCajFQaVVkUUdPS0tpRXAvdWpUeEEzbVhxVmkwR0F6anJO?=
 =?utf-8?B?SDA5citBTEV4bllVRWxhZTNlVS9PVWdKenNtYXpidCtNbDhVVmtUTDZnREZZ?=
 =?utf-8?B?OThXWFV6cldEd1Axd08wenZlcno0SEJidlpteVpUWDlwV01ZcnpwMTd6MFJp?=
 =?utf-8?B?VUlGRUNFenJFV29DVEZiandYRy9jZWVGcFdzbVdkRS9GaE9kaXFBeTNON0VO?=
 =?utf-8?B?MVNVNDlxaytvSXN3WUZqRmRWMkZ6K2FxWDdmdU0zVnJkbkZ0dXBCMnpxNUVF?=
 =?utf-8?B?YjBLaXlKdE0rRldSUGtsZkNCUzI1SUtrU2dnejVXQTlhQzN6UkduYnZYdnlp?=
 =?utf-8?B?NGRCOHZybjNnY0crTFlpSUNhSWJZWlFlR2ZMbWphRDR2UmNDZ3N6TmFkeHIr?=
 =?utf-8?Q?dh4E=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:20.79.222.204;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:de2-emailsignatures-cloud.codetwo.com;PTR:de2-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230040)(82310400026)(14060799003)(1800799024)(35042699022)(36860700013)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR3P278MB1405
X-SEPP-CCCVersion: 2025-12-11T08:12:51+01:00 9ed91da2
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.85.51];domain=ZR1P278CU001.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.85.51];domain=ZR1P278CU001.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF00009523.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8c352a6d-c786-4b11-df46-08de4f728d1b
X-SM-ruleversion: 2.1.0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|156008|35042699022|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UjlNYWNNdFhQblBxRzZBUHA1RXZRTjBwa1FSWnBBMjc0U2NhRGdEMFpVVGJj?=
 =?utf-8?B?bXhsUFFTNnExVjBBendvaWxTblViVEh3RGJGWkpibXBCTzlxTWhDOEpaaFE0?=
 =?utf-8?B?b1FvMkFrYk1KU2FIUnN6d0RNMUpUeWdhQ3Z2NXdCYlhuMDFwR0lrRWs3cGkr?=
 =?utf-8?B?MTJJZFpscEhLMXQ5K3R0cVJMek5OYlRSUWpjQmgzc1Q2eTZGOFVRYTRKbFhK?=
 =?utf-8?B?UHhhT1BNOEFxUEQ1NUhUN0R3ekRNc2t1UnNicXp3aHJveXBMSHJ2cFAzUlQ0?=
 =?utf-8?B?RlZzcFpnT3FsbmFLVUdsMGlHd1NaVG9tMnE0SWtJcjFtVFZrZUQwYktSeXZP?=
 =?utf-8?B?MGsvTnR6d3lYdnMzZEVmazZ5bXpJUi9ScXNFTllCNVNnSWNkN0pQYUx1VzFk?=
 =?utf-8?B?T1ZaemRRNDFpa0tuMGtXSExDanoyYjcvbmtYQzhWOUVZdGl0YWxvQTBDNDc4?=
 =?utf-8?B?cGZHZ1RESTBTcjZCTTVzV0hnOEZoeTArOHNPSVhPdTk5eHM5NUlJMW9ZdUI3?=
 =?utf-8?B?Q01WTmZKNC9SMVM3OS9sS3A1VGxURDJuU1ZZeFZoWjVOZTJnVWt6R29LZmhv?=
 =?utf-8?B?YTI1QmkweDZqSnBFdlQ2WnJMZzM1M01ldVJuNFhYbnVSWkZKVWdib2ZZa1Ux?=
 =?utf-8?B?VUF3NGxrYzF5OFFmWGM0eHZYbU5zalJST1BxZmVqUmUzRHlRbkh5TFNab2Nm?=
 =?utf-8?B?dlhjeVBEMHNsK3BmSzM3eXMvSU9KdTZ6UXNoYi9OcFBPSmVySXhqOUVQSXFu?=
 =?utf-8?B?bXhJUnQ5UGxjZXdyR2wrSUxkK0srYzZ3QWhFSlJLenJtYlAxajNXbG1BdVlE?=
 =?utf-8?B?aGs3Y0Exd3YrT0Jma09QZjZnRG1nNitxNXpvVXI4SjVmNm11UjJSdXJaM2NG?=
 =?utf-8?B?UEhPTHdEWmxvS1hWNUY1VUxsRlZBUUVsNVpUK1J6clVMZTNOTk53Z1ZPTUlq?=
 =?utf-8?B?WW5lY3ZybHBNR0FCZGdtamhOLzZhay85ZkY4R0xiMDh2QnRsV3QvWGtOWXRV?=
 =?utf-8?B?ejMrYlBERU1RdDh2dzRJZUVpK05SamlYamJYTTRPenVrczM0Mjg3NFB6Vmgx?=
 =?utf-8?B?ajRzUVBqOXg2ME5yZlkwdURWZWYzVkxnTHltVmtlSnFDY1I4MHpWSE5LbFNj?=
 =?utf-8?B?MUZvM0Z0SVBGWElNdWxTSWtlZnU0d2JxVmNxeHNhekY2NVBkQU0vNWE1SVY2?=
 =?utf-8?B?RkhIZkJyeUQ3V2E2RXJYajRwb0dqTE51Qnd5OGNIVkJIRWZBeHdxQzl0RHh3?=
 =?utf-8?B?aU5UU3gyb3NORHJDMmNtMmpuRUJTTldKYk5ZQWVkdXVlbU8xdE84cHlBRXh5?=
 =?utf-8?B?U01BbUltUnl4SzhiUW9BenEwMWN4U0pvR2QzNit4S2toMVZXdmN2dFNMMHhK?=
 =?utf-8?B?OUwvdzkwRTJFc2Q3ckhkYUowTE85MHBtNzlBcjNMTU5zSm1uYkNBUHJjcW9O?=
 =?utf-8?B?ckREUG4zYVZ2U2kyaDdEMTNIQ2NFL0FCMlNYRDJFRmd5RTh0M3JJVHkzNjZO?=
 =?utf-8?Q?GS+82eW9ttn4Xp0ZPTvSBlzZSN6?=
X-Forefront-Antispam-Report:
	CIP:162.55.72.218;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR1P278CU001.outbound.protection.outlook.com;PTR:mail-switzerlandnorthazlp17012051.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(156008)(35042699022)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: duagon.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 11:30:59.4078
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de4d5258-7d31-4425-8a8c-08de4f729015
X-MS-Exchange-CrossTenant-Id: e5e7e96e-8a28-45d6-9093-a40dd5b51a57
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5e7e96e-8a28-45d6-9093-a40dd5b51a57;Ip=[162.55.72.218];Helo=[hz-deliver02.de.seppmail.cloud]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF00009523.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR0P278MB0869

On Fri, Jan 09, 2026 at 09:31:30AM +0100, Bartosz Golaszewski wrote:
> On Thu, Jan 8, 2026 at 2:49=E2=80=AFPM Jose Javier Rodriguez Barbarin
> <dev-josejavier.rodriguez@duagon.com> wrote:
> >
> > Since commit 1f4ea4838b13 ("mcb: Add missing modpost build support")
> > the MODULE_ALIAS() is redundant as the module alias is now
> > automatically generated from the MODULE_DEVICE_TABLE().
> >
> > Remove the explicit alias.
> >
> > No functional change intended.
> >
> > Reviewed-by: Jorge Sanjuan Garcia <dev-jorge.sanjuangarcia@duagon.com>
> > Signed-off-by: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez=
@duagon.com>
> > ---
>=20
> And what are the changes vs v1?

Hi Bartosz,

Thank you for your answer.

There is no changes in the code between v1 and v2. As I wrote in the cover
letter, the change for v2 is basically the commit renaming.

I know sending v2 without changes is not strictly correct but I decided to =
do that
because I make some mistakes the first time and I would like to clarify tha=
t.=20

I failed in first patch series submission as not all people involved receiv=
ed the
cover letter (among other mistakes) so I decided to send each patch as v2
(with its cover letter) to the correct people and mailing lists.

>=20
> Bart
>=20
> >  drivers/gpio/gpio-menz127.c | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/drivers/gpio/gpio-menz127.c b/drivers/gpio/gpio-menz127.c
> > index 52b13c6ae496..f51e7517f551 100644
> > --- a/drivers/gpio/gpio-menz127.c
> > +++ b/drivers/gpio/gpio-menz127.c
> > @@ -223,5 +223,4 @@ module_mcb_driver(men_z127_driver);
> >  MODULE_AUTHOR("Andreas Werner <andreas.werner@men.de>");
> >  MODULE_DESCRIPTION("MEN GPIO Controller");
> >  MODULE_LICENSE("GPL v2");
> > -MODULE_ALIAS("mcb:16z127");
> >  MODULE_IMPORT_NS("MCB");
> > --
> > 2.52.0

Regards,

Javier R.

