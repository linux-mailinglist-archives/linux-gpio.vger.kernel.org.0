Return-Path: <linux-gpio+bounces-35083-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kNd7EqbF3GmcWQkAu9opvQ
	(envelope-from <linux-gpio+bounces-35083-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 12:29:58 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F273EAA87
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 12:29:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4EF933001844
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 10:24:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1540A3B7770;
	Mon, 13 Apr 2026 10:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=duagon.com header.i=@duagon.com header.b="KH55n18b"
X-Original-To: linux-gpio@vger.kernel.org
Received: from ZR1P278CU001.outbound.protection.outlook.com (mail-switzerlandnorthazon11022143.outbound.protection.outlook.com [40.107.168.143])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2710F3B52EF;
	Mon, 13 Apr 2026 10:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.168.143
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776075868; cv=fail; b=WaIX5BzdMz5fiKcdY0gHSQyr+qbL7iS+/XT3630y8dDYMh0FeLleRUDNOwpkGweuWdn5PvL2wf0BFfWZMOfpyXjlUgatGn+SJsTJ1Tkn+4y+tZKKT/zQ0OXmc+RcqlQV+Wf9PXwGgq2KYrQux8oVbzUIRE1t/ahR0zDsfwv7W+8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776075868; c=relaxed/simple;
	bh=AuqG3tx0+vNJ97l13bwKnEPJ7IrJWMTezljLElz+4ik=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iFmTMPba5AC/C2QH9oQnaUlQ02GfDEIsaTomf5VWZMlV1JHRU27g+aQ8OJOV7S/gQl68KCLP+Uvvam45sqK6TIvvJl5/FkOkhScSKSM9OEBtDbbD2QRPkeA/L9t13gA12BeRaO4OmjRNSp39q/f1HXRoYb6RkLKlgcPUe/GMuQU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=duagon.com; spf=pass smtp.mailfrom=duagon.com; dkim=pass (1024-bit key) header.d=duagon.com header.i=@duagon.com header.b=KH55n18b; arc=fail smtp.client-ip=40.107.168.143
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=duagon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=duagon.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Iu2gdHXcVRviiVdALF88GA1DbQXM80xb0+nwn8pyFYVkcZylu0qQD5j50+1yzRZwL82mrZCAqbQHptebFHeaUYbvReBrZkbIVDo2JGgHXgOuMMwOE18rrJQT6wPUHpUcm8P+Vs1goT3BaD+0byzc8L7jH2n6dQd1KySthby7loZowKxkZpPoEljuptDvKPAPU7hFOzh0H96CjgWKrw2dV1QRoAL4Xg6q1Z8Spe1T5t1og8PWmZhv9AAeodoW1kKt3bUNoi8cMP/GQUhXFt6aIf+ycnLyAExgwiIUY6ik6mFfRCebSy0g1eAdKa5AI5jJ7TNp5LrjS8jgwdIKIYE3Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xd+nT0hm4xTy3V/fdyUTyUumXb+Its8SJiOb0s3zVB0=;
 b=tUv/6RrMiN40zjB7sO8RLKxsvJJyuoz5on+PK/i9PdaIgF5E/FsuqkuVA4XzXjNYtCrY3uAVyzqRiMn2yHPxh1TIe/9wXQ+Zdi2DkvzvU1E7pVg7HxiVz/WJod9d25rnur2nmIPAuuAJ6f9W025WjWvPhBNPDyJkpfG45u709xwdZgPd43s5L22OT2X0IoaPFvWryHfF43xUB41T9ij70EJKcfGCqKmHbCZoNomwaz4hBS/hHhGBzj2dExerwzoHLave5pVPnDMcnasIEZ+ZNh5rBKfkw3X/3xT78oevKPVXQXDIZhG3D65+dh/c9bG0qrLDN8xBFvzqPN2gNfeIJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.85.4) smtp.rcpttodomain=kernel.org smtp.mailfrom=duagon.com; dmarc=pass
 (p=reject sp=reject pct=100) action=none header.from=duagon.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=duagon.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xd+nT0hm4xTy3V/fdyUTyUumXb+Its8SJiOb0s3zVB0=;
 b=KH55n18b4J9b7oymnB7NGIJBFEY5GEV6w3B7L/fbkSsgSdv5aVqIv3PtlSXNDhdQzfwC7IXpCGA2hgLbp8Pk+1OwKaThE+AnC6qQOn4XSDnxzNWspGKhjIgbwIlJmPXDEvp7f6zhM20MGo7CvM3oPj357OfoRIIIsdHwNnwelFI=
Received: from PAZP264CA0046.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1fc::8)
 by ZR4P278MB2011.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:b5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Mon, 13 Apr
 2026 10:24:23 +0000
Received: from AM4PEPF00025F95.EURPRD83.prod.outlook.com
 (2603:10a6:102:1fc:cafe::4b) by PAZP264CA0046.outlook.office365.com
 (2603:10a6:102:1fc::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.48 via Frontend Transport; Mon,
 13 Apr 2026 10:24:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.85.4)
 smtp.mailfrom=duagon.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=duagon.com;
Received-SPF: Pass (protection.outlook.com: domain of duagon.com designates
 40.93.85.4 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.85.4; helo=ZRAP278CU002.outbound.protection.outlook.com; pr=C
Received: from hz-deliver02.de.seppmail.cloud (162.55.72.218) by
 AM4PEPF00025F95.mail.protection.outlook.com (10.167.16.4) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.0 via
 Frontend Transport; Mon, 13 Apr 2026 10:24:23 +0000
Received: from hz-glue06.de.seppmail.cloud (unknown [10.11.0.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hz-deliver02.de.seppmail.cloud (Postfix) with ESMTPS id 4fvNn25s9lz115L;
	Mon, 13 Apr 2026 12:24:22 +0200 (CEST)
Received: from hz-glue06.de.seppmail.cloud (unknown [172.18.0.5])
	by hz-glue06.de.seppmail.cloud (Postfix) with ESMTP id 4fvNn25bBJz20gn;
	Mon, 13 Apr 2026 12:24:22 +0200 (CEST)
X-SEPP-Suspect: ebb784a53b9d427fa15025735fdccdc5
Received: from hz-scan10.de.seppmail.cloud (unknown [10.11.0.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hz-glue04.de.seppmail.cloud (Postfix) with ESMTPS id 4fvNn24xyZz27y7;
	Mon, 13 Apr 2026 12:24:22 +0200 (CEST)
Received: from hz-scan10 (localhost [127.0.0.1])
	by hz-scan10.de.seppmail.cloud (Postfix) with SMTP id 4fvNn24jtkz4h73;
	Mon, 13 Apr 2026 12:24:22 +0200 (CEST)
Received: from hz-m365gate02.de.seppmail.cloud (unknown [10.11.0.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hz-scan10.de.seppmail.cloud (Postfix) with ESMTPS;
	Mon, 13 Apr 2026 12:24:14 +0200 (CEST)
Received: from ZRAP278CU002.outbound.protection.outlook.com (mail-switzerlandnorthazlp17010004.outbound.protection.outlook.com [40.93.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (not verified))
	by hz-m365gate02.de.seppmail.cloud (Postfix) with ESMTPS id 4fvNms1kxtz2xG2;
	Mon, 13 Apr 2026 12:24:13 +0200 (CEST)
Received: from ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:34::6) by
 ZR1P278MB0997.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:5a::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.48; Mon, 13 Apr 2026 10:24:09 +0000
Received: from ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM
 ([fe80::30b2:3be9:48ab:c354]) by ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM
 ([fe80::30b2:3be9:48ab:c354%6]) with mapi id 15.20.9769.046; Mon, 13 Apr 2026
 10:24:09 +0000
From: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>
To: linusw@kernel.org,
	brgl@kernel.org,
	wbg@kernel.org
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>
Subject: [RFC PATCH v2 2/3] gpio: mmio: add port-mapped read/write callbacks
Date: Mon, 13 Apr 2026 12:23:25 +0200
Message-ID: <20260413102326.59343-3-dev-josejavier.rodriguez@duagon.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260413102326.59343-1-dev-josejavier.rodriguez@duagon.com>
References: <20260413102326.59343-1-dev-josejavier.rodriguez@duagon.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA3P292CA0047.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:48::9) To ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:34::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	ZR0P278MB0523:EE_|ZR1P278MB0997:EE_|AM4PEPF00025F95:EE_|ZR4P278MB2011:EE_
X-MS-Office365-Filtering-Correlation-Id: d3e3e7f6-bbf3-4fad-f1a2-08de9946d4df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|52116014|366016|56012099003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 AHcZGVhv9wCMEkS4gELAA2SbpoqRUONqWf+ChcG6MFl96/iqLIJByL46wYbwxgVstwFAE0YFUhDc16gnrEW6Vno4F2oPx6A+8+dMQryLkZBqdQTNnDXzzlHXYeawYGp6k8kvDMH6ymjAACqGg//hxhSOXHBorc2laIM1b+8hGYhmbNlaKyn432VjLniE4pGTXYlCzj5j32PZD03w8zF4u0I6cIKBfBNcyqavW4WnFKHg3MghI7q9Jkxx0HvWcIvs/0Hu7CeUWl+I8uWvYb0FBkLkydNY05iCrETVv8j248L/wzvvwWfyv/gBGfET735jRnhOU4AECysz7CDM8DGjH/AmJeMdQA4O1fMwoq7fUfZZvlw89LhTPUsDEgWecqucHLnM4IB2kpwtZl9wL21dDcWJ3e8/8j1FpoTwcmcbtlyRhyHjxJvUxgkbD3X0O2pcb2HiKS1ysGThQzjkiKi06NoJeaHKX5WiiauZAzs4VgvsNRMSEN9Hijg+uEygbNn/T9NV1CsaxipbbTv6k6n/l4eUazWxxuJVpKpG+pPGDvGClFgO31yPgnOkLZIMpfD6aoVv+OtLcn8Wo9Qq8N7Haq9OHmj81IQHGidxFw3L0vplvJJuS1LXZz1AXuegg05/vzWSPuD+NdJB8cswg+pxXLDYeTYv1YKs3kV8TuWFzBUUFuUSJRHtxAB3YFHPFvUHUYEi0HU3+ejACSsw9qAlxOoF3I+YhK2gR/6C4WrNC4pO+LfLVUk47v4MBcAGQRUoFIRjNjjyXV8Xjkc4gfiF196CU6/XL0kmM+FKMSwd3XU=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(56012099003)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 YkXN/lL+gTP2MAsUtq8HEavWmc6jLegVwZ3WC09mljUtlFg2JeF464pWCvBfE7PlSU5ZpKlGSn9XRdf4tvLdXG2bXIWeUqrzIzVtd/rKjrQHW2w7UdA56oWz/PoqmqvhNLibMf3DXPldgEUoH0vKfNOIfO6ElHScATBBj1waMC7b+bPw3k3taXbqAMD/LeZrcuJQp6cXzT2WbWaqKYi1YVBDxGPQsSSUH/ptoxuNUE7hpWl5kOOBlX2/cvEeRJMbMKZOD+oei+2P0TMXvwlyinGnE1MjVTOsntnXRA+Gauy924J06zmjeVBdO8HzR5xt3xPMIcjdfAvAC5dQhnps3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR1P278MB0997
X-SEPP-CCCVersion: 2026-03-30T09:40:10+02:00 639c564b
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.85.4];domain=ZRAP278CU002.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.85.4];domain=ZRAP278CU002.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00025F95.EURPRD83.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b8411440-5e0e-4b25-0322-08de9946cc8d
X-SM-ruleversion: 2.1.0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|35042699022|156008|82310400026|14060799003|36860700016|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Xa7x0ODdqHZooAOzOsBgfreTMWLVOEKm1R95Trn+E7NSe6pLrMYDiFcxRCZP?=
 =?us-ascii?Q?Tmhy6/B5YQURTbWAnHvgg/9HZFCMvWpjPexcABosnp3Cc3jadJi5NdpOL5f/?=
 =?us-ascii?Q?8srH4aNjjSw9se6zApaNIUry4WCre0W/+PgROFAMvZWqjZ26K/ATDw9224t/?=
 =?us-ascii?Q?93MjA4sH3cIKcrihdULE4SGkHrzrYeZSMro4iCZiRmgbQ3tzgjCvz1OwqKPv?=
 =?us-ascii?Q?lX06iGPLW327zgq8H5P0ASHRMBBiUbGft8FTFNLpkjuFuw+rJWBtkhgJZoup?=
 =?us-ascii?Q?7Maa/am9wkHPvmQgDsdAPh9RrdvKyYvxzz3iPS3B+tV3zuJXjukENUkK6qNB?=
 =?us-ascii?Q?wTbK7up0YLHzM33CqXU5sMMWR/0Df5XzbtYbss3k6KWw6n+CW9w1YsK7Y+7r?=
 =?us-ascii?Q?iGvXtg1AqpwgyJ5KDM+22q0k+TDX8DyPxc5EylMSA+jEKm5+ffmQ8CpXZj7I?=
 =?us-ascii?Q?1dGg7K4/DqVzRTBZfoMX95Q/6euNYPATh+cOrQi6Jt7uHsrIAdMcBXN4sQX/?=
 =?us-ascii?Q?YHqwC45rnxny3OKlwTaEMTAu8NeoXhagEpKbmp+AyLVKXrbK9WMqdXsFGS9V?=
 =?us-ascii?Q?UlkNVSWymaPKVQUmd2yNusiK0IgxSiPV+Nu+5ot7IHoFMmI1DC5fVd2pyjUe?=
 =?us-ascii?Q?UroOXRgMu7t0C/URY5Do3k1VMju5mWv8ufmmx+ADFrbgxuWmiZmHA4wDgCRR?=
 =?us-ascii?Q?YRHVqig8YehknjfhvP4ap8YqynqZrgez784JZBHg8o0ScuiQF3LvjudQXV6R?=
 =?us-ascii?Q?AZA76yRDB/RZJEcs+OTd+sbtjDS5wvtOqWCTYEYyEocCUtIaF12H4v5qdDdD?=
 =?us-ascii?Q?ZGKNHJiYoM6jR/fV4DrUZjAxDYXZRur9Aj14sqlebn00blReefWl6rbZC+iA?=
 =?us-ascii?Q?TrTRir8ut7C4LBQ5wornMsNTDJvhN6dSctWOUGNnYsoVOPBKOWzFnBQ1N/5t?=
 =?us-ascii?Q?E672q8kNntMdT84K/ISwLv2W2nkPyVXkcK34wok4nLL45NYXI1wiv0A7PPm/?=
 =?us-ascii?Q?kszyHCVVe68h34nWczpODETMHdP7rfUUqpHsh8n2ILWoEc/hpIB+x5DGQrBJ?=
 =?us-ascii?Q?FaZy57/5NVcU2oEn52b/RkuUMjUHaGc5bUxAJU7xJHv8C1ajIu377uKS48zj?=
 =?us-ascii?Q?aYw9MCCstQLZJZUdLSKy4pXftC70lnlG85kRjWhmVm8Kv3enphQbLwY6Dom5?=
 =?us-ascii?Q?yqnN89QYKTiVIHwRunWgyNrM/zH6aGeQn0R5qY3gc+zAMhYQY3ifVrsHgGN+?=
 =?us-ascii?Q?KqyLY7ght5oNVbwv0a5x?=
X-Forefront-Antispam-Report:
	CIP:162.55.72.218;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZRAP278CU002.outbound.protection.outlook.com;PTR:mail-switzerlandnorthazlp17010004.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(376014)(35042699022)(156008)(82310400026)(14060799003)(36860700016)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	fgIdwO2kRUVMu/TCX8gTmpX45XNGTi6mj32NGpKNeBPJi6sM/czRIxVAZ39MTZgQSOv2C3qc/xUI46V1gOJdqudNJ8BLXKNllZbMVDJ/Iw8ikSLqHK1/hetRZRuQcRNdUprje4g3mU+eYcNK/Q7l/uzEkqogU1h1u1pbyYdTWV8rL3p+A03+ghp+ReM4b0Sm9tvX6rd1h1NJL3llE7OBEx6/kR/kCYsCzGnEY8jI2Lp05RRE/ZrkQPEuMHixL9ZGHSjGmWSNu6ZJuGmu9pBTtoke8nFzftWnVBpndhiiEUawFmihqPg7hVyyH+qbbIVgfgRCStL0oTUoVRcyh4m2nebMXmdTh0fxjtcD9hXiMJD8mIrGqd99F9sXtqCiJPnIBQ0G7zzh9IYke3iNRGKHGsHn0OC4Gn0SgvCSgonMtVqhwAG5MycI70qfnzr9AHG4
X-OriginatorOrg: duagon.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 10:24:23.0678
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d3e3e7f6-bbf3-4fad-f1a2-08de9946d4df
X-MS-Exchange-CrossTenant-Id: e5e7e96e-8a28-45d6-9093-a40dd5b51a57
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5e7e96e-8a28-45d6-9093-a40dd5b51a57;Ip=[162.55.72.218];Helo=[hz-deliver02.de.seppmail.cloud]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00025F95.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR4P278MB2011
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[duagon.com,reject];
	R_DKIM_ALLOW(-0.20)[duagon.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35083-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dev-josejavier.rodriguez@duagon.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[duagon.com:+];
	RCVD_COUNT_TWELVE(0.00)[14];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,duagon.com:dkim,duagon.com:email,duagon.com:mid]
X-Rspamd-Queue-Id: 57F273EAA87
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Implement PMIO read and write callbacks for 8-, 16- and 32-bit
register accesses using the corresponding port I/O helpers.

Signed-off-by: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>
---
 drivers/gpio/gpio-mmio.c | 94 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
index 39326ab7e494..d23c5d275e6b 100644
--- a/drivers/gpio/gpio-mmio.c
+++ b/drivers/gpio/gpio-mmio.c
@@ -124,6 +124,60 @@ static unsigned long gpio_mmio_read32be(union gpio_chip_reg *reg)
 	return ioread32be(reg->mmio);
 }
 
+#ifdef CONFIG_HAS_IOPORT
+
+static void gpio_port_write8(union gpio_chip_reg *reg, unsigned long data)
+{
+	outb(data, reg->port);
+}
+
+static unsigned long gpio_port_read8(union gpio_chip_reg *reg)
+{
+	return inb(reg->port);
+}
+
+static void gpio_port_write16(union gpio_chip_reg *reg, unsigned long data)
+{
+	outw(data, reg->port);
+}
+
+static unsigned long gpio_port_read16(union gpio_chip_reg *reg)
+{
+	return inw(reg->port);
+}
+
+static void gpio_port_write32(union gpio_chip_reg *reg, unsigned long data)
+{
+	outl(data, reg->port);
+}
+
+static unsigned long gpio_port_read32(union gpio_chip_reg *reg)
+{
+	return inl(reg->port);
+}
+
+static void gpio_port_write16be(union gpio_chip_reg *reg, unsigned long data)
+{
+	outw(swab16(data), reg->port);
+}
+
+static unsigned long gpio_port_read16be(union gpio_chip_reg *reg)
+{
+	return swab16(inw(reg->port));
+}
+
+static void gpio_port_write32be(union gpio_chip_reg *reg, unsigned long data)
+{
+	outl(swab32(data), reg->port);
+}
+
+static unsigned long gpio_port_read32be(union gpio_chip_reg *reg)
+{
+	return swab32(inl(reg->port));
+}
+
+#endif /* CONFIG_HAS_IOPORT */
+
 static inline bool gpio_chip_reg_is_set(union gpio_chip_reg *reg)
 {
 	return reg->port != 0;
@@ -462,6 +516,46 @@ static int gpio_mmio_dir_out_val_first(struct gpio_chip *gc, unsigned int gpio,
 	return gpio_mmio_dir_return(gc, gpio, true);
 }
 
+static int gpio_port_setup_accessors(struct device *dev,
+				     struct gpio_generic_chip *chip,
+				     bool byte_be)
+{
+#ifdef CONFIG_HAS_IOPORT
+	switch (chip->bits) {
+	case 8:
+		chip->read_reg	= gpio_port_read8;
+		chip->write_reg	= gpio_port_write8;
+		break;
+	case 16:
+		if (byte_be) {
+			chip->read_reg	= gpio_port_read16be;
+			chip->write_reg	= gpio_port_write16be;
+		} else {
+			chip->read_reg	= gpio_port_read16;
+			chip->write_reg	= gpio_port_write16;
+		}
+		break;
+	case 32:
+		if (byte_be) {
+			chip->read_reg	= gpio_port_read32be;
+			chip->write_reg	= gpio_port_write32be;
+		} else {
+			chip->read_reg	= gpio_port_read32;
+			chip->write_reg	= gpio_port_write32;
+		}
+		break;
+	default:
+		dev_err(dev, "unsupported data width %u bits\n", chip->bits);
+		return -EINVAL;
+	}
+
+	return 0;
+#else
+	dev_err(dev, "not supported because of missing I/O resource\n");
+	return -ENXIO;
+#endif /* CONFIG_HAS_IOPORT */
+}
+
 static int gpio_mmio_setup_accessors(struct device *dev,
 				     struct gpio_generic_chip *chip,
 				     bool byte_be)
-- 
2.53.0

