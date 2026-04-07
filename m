Return-Path: <linux-gpio+bounces-34842-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8NBBEWFS1Wkf4wcAu9opvQ
	(envelope-from <linux-gpio+bounces-34842-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 20:52:17 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A2CC33B3132
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 20:52:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7681430BA8A7
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Apr 2026 18:49:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E591633AD9B;
	Tue,  7 Apr 2026 18:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=duagon.com header.i=@duagon.com header.b="pHsjHF85"
X-Original-To: linux-gpio@vger.kernel.org
Received: from ZRZP278CU001.outbound.protection.outlook.com (mail-switzerlandnorthazon11021138.outbound.protection.outlook.com [40.107.167.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A4A1346E4A;
	Tue,  7 Apr 2026 18:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.167.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775587773; cv=fail; b=fTVLmLS8RgrauDTwthqoriIKE0y43aAlBEag1C6tHd4qAOuEzFrvIbOALgZo2WQuap6jV1PVJ9wdOgFIEyzIyizUpg8Tgq7BGx8Px95ISeH/3xgLAB6i9CsXmXZKIJiS/W0Z9frmJmh7CVUWEI9jtsUvZHR6jsLyyt/Mt3SYRzA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775587773; c=relaxed/simple;
	bh=aeDVrrItmk8WSjqsewRj0e57AbnxYLJMKI6KXHZ6oos=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Nk7kMfwCHTtMSmzKX7F2utfbNpq9UGy3EmbDT9NL0kNW8hfxuBkc9kX+PGH0oZTDACbbNYCt0B7SumB88guaAKeZ8f/jLYXmdrbf6Vskuu3vuJab4i3pLVbvi0P5gP+zldbui2zyBndjlqAhCNPDcReP8/hTArA+BAfzhFBQEzA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=duagon.com; spf=pass smtp.mailfrom=duagon.com; dkim=pass (1024-bit key) header.d=duagon.com header.i=@duagon.com header.b=pHsjHF85; arc=fail smtp.client-ip=40.107.167.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=duagon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=duagon.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gLhNnu+/GwK2uJEYSrdfSqQZQHCjsr6yCl5TjgoLutEwyiC0op3ScJSrfLHbKFPiOhbBkuUv1H5WYespmaLRPt4F4wNH3KXPLCqU6DoswmVZLZfqzOX1av0xTISI82/60LQAwdZx3mIVnJlOFgkVgGFMkQ0LRz9jUfTvU7rN9tsIq69s8wzYEbUuuyzGdTkPLseUdMQbLXMIZBtkDDb8qSKxeRgnm14+f6bsQ0S9mJn8ydo5xF06IhzPSFAlSFv0iX/He6nO32KAfiFBp3HMWlOtvx3wkH36l3YQvcY1dJxBDqe/htcWNwTEdgtuV/p7+XAMo8lBfBn6chzQPTDASA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=80LYFMBNyiaSYy2rLpu8/akbUd/rZRfeFtH1sEzNUuM=;
 b=U8eB9BwpeFMtpss4TBCmCdy8vP4Nw4GkHa1I4lRRyTVxws1y2G+imaShG7J9unHDr+gcGmFrmjRyXOWkHNwGLpTInnYeRQnQEjdAfbqwt+pYPM6mAkb4JFFshixD5flaJL1UTnqQPrfHVsT/ajHiO6J277qJvuSeGiYCSvJYoF9er/I12Zf9/shNN4Dxd6Sd+BJfj39xB42vfbAIDnu2XLhGhQO/HGNQkHBEtGlcr4+26B61SjdMoDzMISsHoMV80JEPajfF7SzXwPlkWExLay5D0kIoNkUg6KIwFD5P0D1LLap7AlS5AdBun22voMkz/ExjqUK6Q0Q+VDqhMXnCIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.85.28) smtp.rcpttodomain=kernel.org smtp.mailfrom=duagon.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=duagon.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=duagon.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=80LYFMBNyiaSYy2rLpu8/akbUd/rZRfeFtH1sEzNUuM=;
 b=pHsjHF85ixwtluuWGz/wBSDbu9fHlBluI0KZhYQbSVU0nsyjuzV6A5Kl0YP0ew6F0sKfI495IgxDgSvUrfFmgM1acBOOG71BfqW83jxBHwkp88RZngTZhoqChJrqLcZRSmMzMkBNgtoCZ13Fh/gLtjrgEtkvfXdlfnoqtcS27to=
Received: from CWLP265CA0425.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1d7::17)
 by ZR5P278MB1941.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:b0::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Tue, 7 Apr
 2026 18:49:28 +0000
Received: from AMS0EPF000001A1.eurprd05.prod.outlook.com
 (2603:10a6:400:1d7:cafe::ce) by CWLP265CA0425.outlook.office365.com
 (2603:10a6:400:1d7::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.32 via Frontend Transport; Tue,
 7 Apr 2026 18:49:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.85.28)
 smtp.mailfrom=duagon.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=duagon.com;
Received-SPF: Pass (protection.outlook.com: domain of duagon.com designates
 40.93.85.28 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.85.28; helo=ZRZP278CU001.outbound.protection.outlook.com;
 pr=C
Received: from hz-deliver01.de.seppmail.cloud (162.55.72.219) by
 AMS0EPF000001A1.mail.protection.outlook.com (10.167.16.231) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.17
 via Frontend Transport; Tue, 7 Apr 2026 18:49:27 +0000
Received: from hz-glue05.de.seppmail.cloud (unknown [10.11.0.47])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hz-deliver01.de.seppmail.cloud (Postfix) with ESMTPS id 4fqwGb1nbnz4wxW;
	Tue,  7 Apr 2026 20:49:27 +0200 (CEST)
Received: from hz-glue05.de.seppmail.cloud (unknown [172.18.0.7])
	by hz-glue05.de.seppmail.cloud (Postfix) with ESMTP id 4fqwGb1WgDz20FK;
	Tue,  7 Apr 2026 20:49:27 +0200 (CEST)
X-SEPP-Suspect: 19c25697b5ba403aafdb132e3ff015e2
Received: from hz-scan05.de.seppmail.cloud (unknown [10.11.0.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by hz-glue03.de.seppmail.cloud (Postfix) with ESMTPS id 4fqwGb0nrKz23dn;
	Tue,  7 Apr 2026 20:49:27 +0200 (CEST)
Received: from hz-scan05 (localhost [127.0.0.1])
	by hz-scan05.de.seppmail.cloud (Postfix) with SMTP id 4fqwGb0Dqhz8n8v;
	Tue, 07 Apr 2026 20:49:27 +0200 (CEST)
Received: from hz-m365gate01.de.seppmail.cloud (unknown [10.11.0.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hz-scan05.de.seppmail.cloud (Postfix) with ESMTPS;
	Tue, 07 Apr 2026 20:49:26 +0200 (CEST)
Received: from ZRZP278CU001.outbound.protection.outlook.com (mail-switzerlandnorthazlp17011028.outbound.protection.outlook.com [40.93.85.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (not verified))
	by hz-m365gate01.de.seppmail.cloud (Postfix) with ESMTPS id 4fqwGY2LvTz2xLN;
	Tue,  7 Apr 2026 20:49:25 +0200 (CEST)
Received: from ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:34::6) by
 ZR2PPF05AEF8FE9.CHEP278.PROD.OUTLOOK.COM (2603:10a6:918::2c5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.19; Tue, 7 Apr 2026 18:49:22 +0000
Received: from ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM
 ([fe80::30b2:3be9:48ab:c354]) by ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM
 ([fe80::30b2:3be9:48ab:c354%6]) with mapi id 15.20.9769.018; Tue, 7 Apr 2026
 18:49:22 +0000
From: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>
To: linusw@kernel.org,
	brgl@kernel.org
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>
Subject: [RFC PATCH 5/5] gpio: mmio: add port-mapped read/write callbacks
Date: Tue,  7 Apr 2026 20:48:05 +0200
Message-ID: <20260407184805.807328-6-dev-josejavier.rodriguez@duagon.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260407184805.807328-1-dev-josejavier.rodriguez@duagon.com>
References: <20260407184805.807328-1-dev-josejavier.rodriguez@duagon.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA3P292CA0072.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:49::17) To ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:34::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	ZR0P278MB0523:EE_|ZR2PPF05AEF8FE9:EE_|AMS0EPF000001A1:EE_|ZR5P278MB1941:EE_
X-MS-Office365-Filtering-Correlation-Id: 0eb99eb4-9037-445b-6a00-08de94d6653e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 qIJyjxiUGbm9QZXYCqWBY+2XKFf/C9h9dXk+LZABf3NYfGWXK7VQFOM9odQRE5c5Hk0EhzggboW6BgsWEWYntO2PjvQ7aW4Cwx8hxyf9zpJ4yly2dlC5A1ttI2Ocr7FKtzDMiauzDL3+0b8bqKnKQhD1uPLdhJ12WDJUij8xKbIne5/2ZVYmfI23MaIJggD5O9iNg3w+enufwjHAxSS6mWjzSjnrFdIDAmixoxisoJ8LPVZL19rLHghEuaKdq51zbs798tvwIeynHN/Ovg8HZhD6N7dVtHk2lIKnj1Esmxc3jo13+O70H/j/t8cWFasR+8ey0ykbf6ZKC+doviJrxtAU0SMksduVFZJ2Q09thNeLbZSRAW34JPgUMXcW+6XdnWq8pUCihGm7qyj0HxyTJQg7G+qFG3Jekfbb402JeYJGpBbzGmv1eRTZMDyKqw83wbW1hn/V2s17GC4mPZANpgryw09GKkcYImLdPKrKviDtPYsZ6SQDv2DqjxPKse07OPkNOTGITGhZ8BSbvQ9LE4QlYr81K07ZdtndWQKnzOgCyx3AtttwSk/UmKOF79D2rkkSoO5+mQ6O4Lddjbr5rsCmZTm4bhtz82Smwqio4vMOxiGosq4LKVeFdWdk0UAy5yWrVZnSN46IYDGDv2Ly1hEW2XKhkVEYt08wAO2pSIef+JITF+XpPa0Ek2jZb7LeueSJMZzsDom9IK9vgeOWSj4VeWZI31mimKoC/1O2FFI7YEgcReHd9VB4FJ7xasfvYHONbxWFjhFGLtUGueCS1dKX7En2V1jLk1Zu2yqJsbo=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 VIxas3cbkgf+SYBVWld/7V/t7i9CQTRMzeZevyNPXAhkCX3SzpWUHdORTjqk2IH0tAkA9ToZe70nyuhD7z4Do/5bHfVpqlJwcDrtrqsclLmSZhkuzoMuLKw1zYqX2rKdUF1NDpAQsJjL9r8FMvfOmJ9YFFDgEmVTaVK9X2CJEAS8elKaWWoKsYFgDFwatAWxTSR+KYVR/52hX9qLO/5fsEjgt00AgpJo70mp9LFiuPKjaun5v1RYamBTkZE3n068I+q6eqTjmxtJqA8YLe4NJ1ryMUgE25ACILkZOfhWVE8A2gSSMZpaXmQNjQMXpxxEtwV6O5s1Qj3nXt/pgn1quw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR2PPF05AEF8FE9
X-SEPP-CCCVersion: 2026-03-30T09:40:10+02:00 639c564b
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.85.28];domain=ZRZP278CU001.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.85.28];domain=ZRZP278CU001.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001A1.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d26b513e-0705-4716-efaf-08de94d6620e
X-SM-ruleversion: 2.1.0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|35042699022|156008|376014|14060799003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/7N9l856ZsN/J8z+NahoFKv6ubfcabrQWuvPHTDLZt9mvHxekzF1Zyq/c81p?=
 =?us-ascii?Q?fKJcsiQiLK81kFC7WTYw5TEDOglGnO4ZPi/x1xqYShtymWxXL5bbTXNmKsM0?=
 =?us-ascii?Q?+DGDnJP0mzXiOY/nyRVuYjSy3w+jnnGNVr11aNC0B59avx5MWzGJJdPOSO0N?=
 =?us-ascii?Q?+u35EY6tpIJjSumEsvp+ie+yNJNOWEXDivXGWq/GQwTH1knHlib0iIkQiLMI?=
 =?us-ascii?Q?DHMhWQJ3G51h28wyg9HaJKH3srpgczu4VasVuV1Wj6Es96VvklrtO9fKZG9R?=
 =?us-ascii?Q?qshDz6i4fraCcohgSXjINICvmWEXj6zKBcPEB8V5z6Y+Qcv4grbZuzIWedLT?=
 =?us-ascii?Q?bhxYlftxZ09qd65/3ZDDmITjDLVcFxe8SjXeUTW0FgssGJo1l33+x3U4hllr?=
 =?us-ascii?Q?XoHBDvrFff+ROUsZ1ypVOSvD6UG2HGDoRyhhp1w/StW9qFY7E8pra9M9dbSf?=
 =?us-ascii?Q?7rbtKkdwinF79F/pWmGeo1oor2amdK1HVT2zJd8sSrDun+YdOrsPPECnLppC?=
 =?us-ascii?Q?/0EIJwOiM4EKN0mrDu6ODalBn47SgyTp358QJuH5Hrry204UlAC8GxlUfuWn?=
 =?us-ascii?Q?Nx7DZg5CCtE7MgYc6Iml3+z0Mh63xnFUTGQYgwJ37mUhcG7mmBav/5yiYvpF?=
 =?us-ascii?Q?i9/Dgy0fjwMdtDot8xvWHBGQOp2R9Ousdj4mmWdc/EBKBXpF+lJY68OAe7KI?=
 =?us-ascii?Q?+HoFCgDQXQJs+ETf6ecpwQNFsZ3MyN+1kiaHwCoFZqsg7a6JZSrfJ1WYU6kG?=
 =?us-ascii?Q?iNjrYyLPjCD9O+IKc64n3BNLv0Nk2HBddO/pXOpqiJgJKtf6fV9VlZ4afUWF?=
 =?us-ascii?Q?hSZml6oONphoxbEv5vjlAOLGKYK8HSFILDb2Qr1cy9sgCP5ywA1BjfPSDsXA?=
 =?us-ascii?Q?cJMUlhWjjYX2THMMYY0ICZyXvakUzilyyC06GAlUhYSkQDj2lOb/njFJNAlm?=
 =?us-ascii?Q?LRv6VECWqz3zmDBOxCxm8rTaknVY44qm3EaXhzEHZwD/lyDESLAS/6/DurJ6?=
 =?us-ascii?Q?PmPXAsuOSzlmmbeyv6aMNDJ76gWsDWaDQwkBV0tpYc4iCRhohK5mAAsDuGMD?=
 =?us-ascii?Q?eanYkOSP222Tipdr6ieRFBQJuvTm4uFOSLg4QQK33jO4pdVM9k2c+MFdcFGW?=
 =?us-ascii?Q?nkdKknkzmxxQoRCMQGV4vQVUi5G9SZpr+Ep2RsN8an3UgSm1j1dZfsfMfTiC?=
 =?us-ascii?Q?ar4QvMvgM9GEceBj?=
X-Forefront-Antispam-Report:
	CIP:162.55.72.219;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZRZP278CU001.outbound.protection.outlook.com;PTR:mail-switzerlandnorthazlp17011028.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(35042699022)(156008)(376014)(14060799003)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	UxuUThmbBhHMGZG5RLwXAbnA8fLimKPFDP9KU4SELBVgrcahxqLYZg/vh8/kPBtx2RCEmq3PyBklm6/e4V9AZj1f+A8Ahiahnggr86BJ4PWchkinW6Plf934kNV5xuaMl1hZHHi8LOS4xdiNR4Iui+wswpVxM8h7JftOu2c7XqxHevYzZaOXD0kYO3zHj+Jp0eUYGlSzaTRJZFakzYE9aWMguEEsWLVErhI9amig+Z67dL9MV/tO+wVBWw7NWaRHzdMCc7kO/xq7eS5+G7wh8WnKmqJAXvV2u/o5pO0w1vcm2323JMr2czv+m7N3UvG5jDSdQZDkJzlU4uJwjUKsBmLfJNxwCzz5ICA3rclA9R1kJSy/J3rJ3+in03y1dPXzAgQa22eo23nW9Vzil2d4a6T65tOv3LEtgosY7Q8ssaoAs8Ix99rI35HlKU2sTAXo
X-OriginatorOrg: duagon.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 18:49:27.5000
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0eb99eb4-9037-445b-6a00-08de94d6653e
X-MS-Exchange-CrossTenant-Id: e5e7e96e-8a28-45d6-9093-a40dd5b51a57
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5e7e96e-8a28-45d6-9093-a40dd5b51a57;Ip=[162.55.72.219];Helo=[hz-deliver01.de.seppmail.cloud]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A1.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR5P278MB1941
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[duagon.com,reject];
	R_DKIM_ALLOW(-0.20)[duagon.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34842-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dev-josejavier.rodriguez@duagon.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[duagon.com:+];
	RCVD_COUNT_TWELVE(0.00)[14];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,duagon.com:dkim,duagon.com:email,duagon.com:mid]
X-Rspamd-Queue-Id: A2CC33B3132
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Implement PMIO read and write callbacks for 8-, 16- and 32-bit
register accesses using the corresponding port I/O helpers.

Signed-off-by: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>
---
 drivers/gpio/gpio-mmio.c | 102 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 100 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
index 247ce5b76441..9b20283632a9 100644
--- a/drivers/gpio/gpio-mmio.c
+++ b/drivers/gpio/gpio-mmio.c
@@ -124,6 +124,60 @@ static unsigned long gpio_mmio_read32be(struct gpio_chip_reg *reg)
 	return ioread32be(reg->mmio);
 }
 
+#ifdef CONFIG_HAS_IOPORT
+
+static void gpio_port_write8(struct gpio_chip_reg *reg, unsigned long data)
+{
+	outb(data, reg->port);
+}
+
+static unsigned long gpio_port_read8(struct gpio_chip_reg *reg)
+{
+	return inb(reg->port);
+}
+
+static void gpio_port_write16(struct gpio_chip_reg *reg, unsigned long data)
+{
+	outw(data, reg->port);
+}
+
+static unsigned long gpio_port_read16(struct gpio_chip_reg *reg)
+{
+	return inw(reg->port);
+}
+
+static void gpio_port_write32(struct gpio_chip_reg *reg, unsigned long data)
+{
+	outl(data, reg->port);
+}
+
+static unsigned long gpio_port_read32(struct gpio_chip_reg *reg)
+{
+	return inl(reg->port);
+}
+
+static void gpio_port_write16be(struct gpio_chip_reg *reg, unsigned long data)
+{
+	outw(swab16(data), reg->port);
+}
+
+static unsigned long gpio_port_read16be(struct gpio_chip_reg *reg)
+{
+	return swab16(inw(reg->port));
+}
+
+static void gpio_port_write32be(struct gpio_chip_reg *reg, unsigned long data)
+{
+	outl(swab32(data), reg->port);
+}
+
+static unsigned long gpio_port_read32be(struct gpio_chip_reg *reg)
+{
+	return swab32(inl(reg->port));
+}
+
+#endif /* CONFIG_HAS_IOPORT */
+
 static inline void gpio_chip_reg_init(struct gpio_chip_reg *reg, bool io_port,
 				 void __iomem *addr, unsigned long port)
 {
@@ -474,6 +528,46 @@ static int gpio_mmio_dir_out_val_first(struct gpio_chip *gc, unsigned int gpio,
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
@@ -684,8 +778,12 @@ int gpio_generic_chip_init(struct gpio_generic_chip *chip,
 	if (ret)
 		return ret;
 
-	ret = gpio_mmio_setup_accessors(dev, chip,
-				    flags & GPIO_GENERIC_BIG_ENDIAN_BYTE_ORDER);
+	if (chip->io_port)
+		ret = gpio_port_setup_accessors(dev, chip,
+					flags & GPIO_GENERIC_BIG_ENDIAN_BYTE_ORDER);
+	else
+		ret = gpio_mmio_setup_accessors(dev, chip,
+					flags & GPIO_GENERIC_BIG_ENDIAN_BYTE_ORDER);
 	if (ret)
 		return ret;
 
-- 
2.53.0

