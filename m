Return-Path: <linux-gpio+bounces-34986-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mGnuGWaq2GkhgggAu9opvQ
	(envelope-from <linux-gpio+bounces-34986-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 09:44:38 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C263D383F
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 09:44:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7C2ED300274A
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 07:44:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09EE53A3818;
	Fri, 10 Apr 2026 07:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=duagon.com header.i=@duagon.com header.b="EvHTSTbZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from ZR1P278CU001.outbound.protection.outlook.com (mail-switzerlandnorthazon11022088.outbound.protection.outlook.com [40.107.168.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37745389101;
	Fri, 10 Apr 2026 07:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.168.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775807073; cv=fail; b=hL8e0hPQYLOy2nJpwvCHqnqnkMlO1moZiETA2OIqcFmwmnUkOjjXQUf5VylbZvfubDvs5YKV2u5aAjiDEJ7UqvF8EilkQX+5UQo+waVB1mybxuKXym3UgreW9+EX/FV5Qi+nx0eATDx9YRT6SI4zdA99FjVZ3luXWJeh9IHPhGw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775807073; c=relaxed/simple;
	bh=tx4k4j63cWKikmnpSs8dXgh7zUFvulMTzCZ1ZAldmNg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=mprUlpOZq9n1+Cf5wtZxvrkPl2T7eGd7B6vhuckBNIaKfS6Vp6DhNOQeIyWzCDX/qV4vYRNUpopwTxO5j2oFxPloo5vNw2e33FH6k591UmoK+PZh+M4t2gcK2VyPslsWMOJtNYBXNhDXRFR3q74fwzvrLylNwMK5KbDML9WPLnc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=duagon.com; spf=pass smtp.mailfrom=duagon.com; dkim=pass (1024-bit key) header.d=duagon.com header.i=@duagon.com header.b=EvHTSTbZ; arc=fail smtp.client-ip=40.107.168.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=duagon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=duagon.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T3iWwPmnUgSuAMtILZMZYOSrYbr05vn1xmlQtFMrZnKpgO48xNQiG6fY5LRgU/PXBG28DaiakBZ9/TaiC9EQzhVXK0MbXGSWARao9jJcZzK3nxMy61Etocrsa5Dw72+oxHRYvFhGkx8joL7TPOrn1rB0wAM8YixxCVLIWVclFKxarziefd7nh+yLTXRqeM4FQOrZfhps8QYyYVlgT4CbL10wGs1E1esb+uhbDWDZjS7QZ9+W/UfCL92eO65TYRrfoX21xhNU0LJqUTlaqEMrKnMlK89JX1PhYfPy/8VkEX3Z/oAaDc+y4bmYCZYYMAf95aH98CGzcVn09hznwpb6ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oY2u0bWrVwB7J/Nrv9Lhl63ATh7qlUb71lrPbfHEKfg=;
 b=Y6w/H0C3eRKme8E1G7cXoLmsKXYMJGgIpHVgBnr0ItZFoB1oZEQZuwrtlrs06DLqjyGH+luPe1BYWeu43Pz1p/Fz/W0SK8aDCBzHnnJeFSR5Xwrwg69FBc3dna3wGkhsiM4TdYKO2IwCRuiKiiccSqXnGIqG8zU7iww9NtlZfwY71G5cFut+B0DfGreuUVeYZOIBgYcMBY6AG/8LNNr5msFErrCt6aZcfK+8ufs+s5md6VcrJZfBlLTcbnMA9/olkrGdeXAb07erfGQDNu4c/MwpsWnhoZSSFKJMc0dnGbMZOgL7C/rj4xoVrKgVvLJQc8x9L+JQoncHVjP3sNIzEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.85.3) smtp.rcpttodomain=kernel.org smtp.mailfrom=duagon.com; dmarc=pass
 (p=reject sp=reject pct=100) action=none header.from=duagon.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=duagon.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oY2u0bWrVwB7J/Nrv9Lhl63ATh7qlUb71lrPbfHEKfg=;
 b=EvHTSTbZ7Sl4+V0FD6IDJy0kL7YM8KS25r3CTBAXJFtI6RClVNSDmxIdQMRWWwib2fErJ+kTiHB0BXNr7Qhnzi5LkEsGwFF+j9m9y6ZyW6MbIqVghMBxJ8k0j2uANo6boMlmTe/nHMYz9PX8RG0lXxEpmT99KvEbKrPBZdbQhZc=
Received: from DUZPR01CA0214.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b4::19) by ZR0P278MB0992.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:51::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Fri, 10 Apr
 2026 07:44:26 +0000
Received: from DB1PEPF000509EC.eurprd03.prod.outlook.com
 (2603:10a6:10:4b4:cafe::fc) by DUZPR01CA0214.outlook.office365.com
 (2603:10a6:10:4b4::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.43 via Frontend Transport; Fri,
 10 Apr 2026 07:44:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.85.3)
 smtp.mailfrom=duagon.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=duagon.com;
Received-SPF: Pass (protection.outlook.com: domain of duagon.com designates
 40.93.85.3 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.85.3; helo=ZRAP278CU002.outbound.protection.outlook.com; pr=C
Received: from hz-deliver02.de.seppmail.cloud (2a01:4f8:272:5fe6::218) by
 DB1PEPF000509EC.mail.protection.outlook.com (2603:10a6:18:3::626) with
 Microsoft SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Fri, 10 Apr 2026 07:44:25 +0000
Received: from hz-glue02.de.seppmail.cloud (unknown [10.11.0.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hz-deliver02.de.seppmail.cloud (Postfix) with ESMTPS id 4fsTMs3Nkvz11Gp;
	Fri, 10 Apr 2026 09:44:25 +0200 (CEST)
Received: from hz-glue02.de.seppmail.cloud (unknown [172.18.0.4])
	by hz-glue02.de.seppmail.cloud (Postfix) with ESMTP id 4fsTMs2zSbz1x2B;
	Fri, 10 Apr 2026 09:44:25 +0200 (CEST)
X-SEPP-Suspect: 7ffcd419564b4bdc8e31067ff0ba8fed
Received: from hz-scan04.de.seppmail.cloud (unknown [10.11.0.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by hz-glue02.de.seppmail.cloud (Postfix) with ESMTPS id 4fsTMs2CP2z1vlB;
	Fri, 10 Apr 2026 09:44:25 +0200 (CEST)
Received: from hz-scan04 (localhost [127.0.0.1])
	by hz-scan04.de.seppmail.cloud (Postfix) with SMTP id 4fsTMs1hnCz6qlT;
	Fri, 10 Apr 2026 09:44:25 +0200 (CEST)
Received: from hz-m365gate04.de.seppmail.cloud (unknown [10.11.0.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hz-scan04.de.seppmail.cloud (Postfix) with ESMTPS;
	Fri, 10 Apr 2026 09:44:24 +0200 (CEST)
Received: from ZRAP278CU002.outbound.protection.outlook.com (mail-switzerlandnorthazlp17010003.outbound.protection.outlook.com [40.93.85.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (not verified))
	by hz-m365gate04.de.seppmail.cloud (Postfix) with ESMTPS id 4fsTMq4ptZz1yt0;
	Fri, 10 Apr 2026 09:44:23 +0200 (CEST)
Received: from ZRAP278MB0525.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:2e::11)
 by ZRZP278MB1952.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:bb::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.42; Fri, 10 Apr
 2026 07:44:21 +0000
Received: from ZRAP278MB0525.CHEP278.PROD.OUTLOOK.COM
 ([fe80::f383:28c1:ea22:fb29]) by ZRAP278MB0525.CHEP278.PROD.OUTLOOK.COM
 ([fe80::f383:28c1:ea22:fb29%3]) with mapi id 15.20.9769.020; Fri, 10 Apr 2026
 07:44:21 +0000
Date: Fri, 10 Apr 2026 09:44:18 +0200
From: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>
To: Linus Walleij <linusw@kernel.org>
Cc: William Breathitt Gray <wbg@kernel.org>, brgl@kernel.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/5] gpio: add PMIO support to gpio-mmio
Message-ID: <adiqUlsY5zBc-Jjx@MNI-190>
References: <20260407184805.807328-1-dev-josejavier.rodriguez@duagon.com>
 <CAD++jLnCKuAzcTjy-iXpLK6MWA0t8L_gw-KokryKbjhnzAwKrQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLnCKuAzcTjy-iXpLK6MWA0t8L_gw-KokryKbjhnzAwKrQ@mail.gmail.com>
X-ClientProxiedBy: MA3P292CA0055.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:48::13) To ZRAP278MB0525.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:2e::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	ZRAP278MB0525:EE_|ZRZP278MB1952:EE_|DB1PEPF000509EC:EE_|ZR0P278MB0992:EE_
X-MS-Office365-Filtering-Correlation-Id: a081d036-00f6-4d9f-c01c-08de96d4fd45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 3JK9mG2kLCw24yhRdYZuTzVa0gPnIcEoji+TLGDErQbSOT67Sk7yYMspr5e5G5Jft7l33yifcBoBgUNMmT3Dcpy/IEUb0Tbf7xtANKGBcxCnFStsztqoqzAU4IjVOBFbqtWj29glH32Uz6PGncfMwrDOyz3AUfw4m5a/yPIfZwDliznxfZUYGeB2No9sJoPtUCVjUpKjelRfnO9KNUWQu06YhL4Io46koMu6x9gXO3/LLNCA1KSm1JfzFWCWv3cK8ifx54xUk9lXXNRjq+sD9kdsdd9kDsDaR21oS3kkz+Fx/Ex/bjy2tL2q2TTifiP4j69wU3TL9bkB8nUcIIQI9tnSVQXLmigSPrRLM0VqC4kHhra/92LCYPDh1ykOh/4FJHFKtxOPOtcf8RUsFjLQVPL9e1yYy9oKpmZ0rar9y73kmiJHJMRAbFol79ZhslK9pdLVUUak2GLf4FzK26dleZm0b3qM4ZQYYtj+KCCyD0JA2Z2uil8tBFCl0OU77w3R2IE5xgCPRXKqINdfZ3PBjhWO7hIU/zL300/GTR5YCbbJS9yYdjESV1KR3cD0vhVCC5bTSS5lq25wv03ZBuRZZPUcfQczMuQ8jrXAVmC/IsSJSQipCvdfN8yqp0E7URHtxRSunwVVmNRZPSNMrf/5XH6R/f1+g8wjlXe5H50pi1Z9DgY30rHw9SllU191PquApbiLSRcjPa/NMMXvZVDWp4vd4Vwxi4CPk/rwVau97jiFdjgLUBfZrCNurAOoNpoSY6ngmc/g/WLB34inRGbFUdk1HRLKM9FyF1QalKPjvFs=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZRAP278MB0525.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 hEv53Gv+JArz6ZPHV2DWy+4LDEvUmDTMAVkQVktulBSQPHgWKpOSeT42snu52uJOlyBhLBzlsphgvjcbJw1dOzA/fZyJIigXdY2y2zPlfOmgvC7keiTW+A0SII3mvyYySwfUbIaoXN1iOFVwUdSezdL1+7K1o5fwIFPghHDmwdgJpE7AM7SLy/L/46zw7j6ropNGBjwYz23zuqZZ5KURF9AT0fNBNhWkfJxIyNMnJQDFFHMC79GjhZ+UhOtyFFMSYBdUzzlju5jY3o29l+jehsqEscy/AWqaK78PVScsE3rGHqQp5eJ7rJkrWd5IlorzunopZMq4benrVvCxT5Eyrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZRZP278MB1952
X-SEPP-CCCVersion: 2026-03-30T09:40:10+02:00 639c564b
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.85.3];domain=ZRAP278CU002.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.85.3];domain=ZRAP278CU002.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509EC.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	27fc5b99-b135-4d5c-a518-08de96d4fa32
X-SM-ruleversion: 2.1.0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|14060799003|82310400026|10070799003|35042699022|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T2VEMEMvWHdaTGpJRUF2NmVCaFFsY3lnZmY4dXdJNUx2UEhpdUg1bWpMa1h0?=
 =?utf-8?B?cTBJZERlQlV4NjdQaGRuYjREa3o2WUdmbHZSNmdTc1RRbk1MWTZsRTlOT01C?=
 =?utf-8?B?WkU1R1VyMmk3bk1mSFFINVQ4OUsyNm03TUJTRXBhRjdVS3RrVERrWmJFaFU1?=
 =?utf-8?B?MW92ZWVLMUgzZ0VMREx6Z0R5K2lrVTMvdWg1VTB2cVRsL1QvRHpuQ1RFdnN2?=
 =?utf-8?B?OFZoaXJCZVpKcjFuTkdDU2tOcTFSd0xkclBNdkRnaXZHY00xWlVjekVhNFZh?=
 =?utf-8?B?WjRJWWJPUUNza1VwNEo5aVVzRkZZOWZaUUlwak1oL0hENlgvM3RYVnJnblFk?=
 =?utf-8?B?dUhKU3QwNjdXZW05WG9kc2JuOGJabUZMRlpNZDRJVjhobk4vNUxYRlhIeTMy?=
 =?utf-8?B?cDM3LzE1U0VPek42OXJUQVU3Y0llMEE1RjNydk5PazZvak9SMUVUUmo1T1dz?=
 =?utf-8?B?ZHZraVR2Y2tLSnZoT1ZXekorRUxtS3NFR2RrZVJ6SlpZRitJU3pkdTRVMWRQ?=
 =?utf-8?B?SUJjVmh0eTVLOHk5ZXU0T21CUmdTTUUxeE1XQ3RxRDlqMml6K3FJVnl6ZXNL?=
 =?utf-8?B?ZUM5bW1DRjVRZzdrQi9pM2ZRUzcyUThjbGZ0ckxmZERUZHBtOTI1TUZ1YS8r?=
 =?utf-8?B?c3RXTW56WlNVZmY4OTA0NXdEUWlYVVlaSlBjbUNSYS9lNDBzYktxWVFDT29N?=
 =?utf-8?B?K3hoZm9oWmQ0bmJIekU1VVhFSVVJZVZOMXdnS3ZWUi9TVzlJcE5FcjlxMnNG?=
 =?utf-8?B?ZzI2aVM2WHJIYWFkZ3RUZStodjdGNEw4TC9xVnhIZG1BTVdQeE5OSEMxYkVW?=
 =?utf-8?B?ZnJXRDM2QzBWOERCaXBtUkhJME8rVWJPS052OGlFZ29TbVcrcUdUNTk2SG9m?=
 =?utf-8?B?Tk1UNHliSWN6Y3dHRHA0VUpoZmhXVUlLeDgxNjloZDlFWG5ySTJmNktYYnZI?=
 =?utf-8?B?NzhFdExnaDB4VGFWSXc3SSt5N3BGcWxiWDZGQ2tRS0p2SURGUmlIUUpJTk9n?=
 =?utf-8?B?Zml3R29jcS9ZYTA3Q3V2eFd4cHlTdzNRTWlVNnlZQzU4VUdYbHF5dTlwMTZU?=
 =?utf-8?B?aWxCL1dDUThFTlBBY05oSUtRb05saGFRaHFRYnNFK3ZIWm1sV3l1VG1nK1ZO?=
 =?utf-8?B?a2sxR0FBeE9CMHlRZTRRNUNKWXdrbzZybkN5TVVlc0wyTWZ0eTRraEhTQ0RI?=
 =?utf-8?B?cE51L3RxYzI3NTFpMWUxUHFSeHJiTGV5bzBJa2hHT0tsSVJvRndwNmhhVTJR?=
 =?utf-8?B?dGFFWmtxWlFUMWU4QnByeE9qZnVTOFBuWVJkdEI2WWE0U2pvc090UzF5T1Q3?=
 =?utf-8?B?ano5aXkxSWZCWm9uM3crQ3JKR1laUWNtRENHM2J6VHRNSzdpNjYrRlQ5MU16?=
 =?utf-8?B?SitzV1NydE55cWYxSkJtQ1pXS25GRXQyLy9TU2NsN2NPaEVmVGxzT2RkeC9C?=
 =?utf-8?B?SWwvV3FNQkNBeEJCVTVzTGYvRWppdk80OENjYXdBa0UrUEtMa0hsUnROdzIy?=
 =?utf-8?B?ZmVGU2ZWa0VSMnJCMUtVWThoYllOSy82Z3RmZUgwbzhJY3hyZmRNMUQzOVZ2?=
 =?utf-8?B?Wmt2Qk03eExCdTJ4TzBqOGE4eUlaV3ZqWGFDRHFpVFdtVDlxencxUmU1SDZ3?=
 =?utf-8?B?VGpOeE00S3RoZWQ3eGl5ZEROM1pzakVtdFE3STJBRWdITGdLOEVxMlB6bWdv?=
 =?utf-8?B?ejNmWTZoWW1BZ0ZIVCsrcUNwenpWeGxXcFBNWkc3TUx4NEIxK1N4MWxpWERO?=
 =?utf-8?Q?/clazSp+vj852JoOTwmyFYUNW2T7KYxERNvS0YF?=
X-Forefront-Antispam-Report:
	CIP:2a01:4f8:272:5fe6::218;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZRAP278CU002.outbound.protection.outlook.com;PTR:mail-switzerlandnorthazlp17010003.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(14060799003)(82310400026)(10070799003)(35042699022)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Vgr/rsNnUH9Pay7UNOPdzmFLWgPaj4TgG74Lyr/kW0PeKyL0e8Hflm1/c4/saIC4zSveQsd+QNucVwdKcBAqiDen/hjrxEybR76VPA7TjVIQBzZdl6gqCclxvxaIMkH6LL1IkBr+dYOhvsUGNXYBVHe5EKBlx9tUJpP/4W42l6eSs7izQImDO5gmA5BXDwf/xZvPrrks6DAWIXHemfQq2sJ6VgQ2jDxA1GgDPGHePA7q3tHobjYs9qIDIx1PBQBvEGjHr0nyjh73bCMXvFIGqpb1QGyBN3RWRw3CHMAblFa5vf/NXlUkuXXjmcL/DVLlejWpLHzdbIuSG7bs2AYa/3NXQZVfNyz9DncADjobCNcNbIWy4pETlxN0UC1yOvmP8TCB6k7zehAxZoWM4GXoDf6wBvsI3gKuuwCSGX8c6dLar8xrSNsP7Q3lxTX1fUu8
X-OriginatorOrg: duagon.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 07:44:25.8343
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a081d036-00f6-4d9f-c01c-08de96d4fd45
X-MS-Exchange-CrossTenant-Id: e5e7e96e-8a28-45d6-9093-a40dd5b51a57
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5e7e96e-8a28-45d6-9093-a40dd5b51a57;Ip=[2a01:4f8:272:5fe6::218];Helo=[hz-deliver02.de.seppmail.cloud]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509EC.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR0P278MB0992
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[duagon.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[duagon.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34986-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWELVE(0.00)[14];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dev-josejavier.rodriguez@duagon.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[duagon.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[duagon.com:dkim,duagon.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C0C263D383F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 09, 2026 at 10:14:17AM +0200, Linus Walleij wrote:
> Hi Jose,
> 
> thanks for your proposal!!

You are welcome :)

> 
> I'm very happy to see some traction on this. I add WBG to CC because he
> wrote so many port-mapped drivers that I think he'll be thrilled to make
> use of this as well.

I was a bit worried about if my approach was correct or not, so I'm really
glad to hear such positive feedback.

> 
> On Tue, Apr 7, 2026 at 8:49 PM Jose Javier Rodriguez Barbarin
> <dev-josejavier.rodriguez@duagon.com> wrote:
> 
> > This series is an RFC for adding port-mapped I/O (PMIO) support to
> > gpio-mmio.
> (...)
> > In particular, feedback would be appreciated on:
> > - whether extending gpio_generic_chip_config is the right direction;
> 
> Pointed out on the patch that you can just create a
> gpio_generic_port_chip_config
> or something like that, it's only used at config time (usually locally
> in probe()) resulting in a transient stack allocation anyway.
> 
> Also that makes it easier to see what's going on.

Seems interesting.

As you pointed out, creating the new gpio_generic_port_chip_config would
need more refactoring to adapt the new structure. I'm OK with that so I'm
working on it. I will include those changes on v2.

> 
> > - whether introducing a common MMIO/PMIO register descriptor is
> >   acceptable;
> > - whether PMIO support should instead be implemented differently in
> >   gpio-mmio.
> 
> The main feedback I have is to use a union between port and
> MMIO address instead of a struct with both.
> 
> It makes it clear that we only ever use one of them and saves
> some memory, especially since we use several instances of
> it per generic chip later in the code.
> 

Annotated. I will include the union on v2.

> Yours,
> Linus Walleij

Thanks for your review and for your comments/suggestions. I really
appreciate that.

Regards,

Javier R.

