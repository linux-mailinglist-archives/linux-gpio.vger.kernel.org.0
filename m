Return-Path: <linux-gpio+bounces-34839-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aK1VHLpR1Wkf4wcAu9opvQ
	(envelope-from <linux-gpio+bounces-34839-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 20:49:30 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F693B3082
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 20:49:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 48C2E3015172
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Apr 2026 18:49:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E567233CEA9;
	Tue,  7 Apr 2026 18:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=duagon.com header.i=@duagon.com header.b="TMEMC+5y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from ZR1P278CU001.outbound.protection.outlook.com (mail-switzerlandnorthazon11022084.outbound.protection.outlook.com [40.107.168.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A21629A9E9;
	Tue,  7 Apr 2026 18:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.168.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775587764; cv=fail; b=Qe4kiq9IsU/Eozae72d1IgYv77KzxuXoKM2KFaH1X1CaP3MwbpQdMzDxDKtzR8gmpd/FtIB1h5PVmfPz9O8Klx0x34MLHfbESGy5cTQZxjjyPY7SKv8ivYv9C371pgbnz9N+MRnrEdpFHg/NHGFbkE8TK9WljCEE/Lve7f6ztkw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775587764; c=relaxed/simple;
	bh=ecms8B4FqSPo8VoQjUg5JZLxhJxVIAk594/4yMeu1T0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tCi6rySazdHAOPd/IZVASkIO1Pf5cEKLdfT4UwtYR/3L60flnkA9vBz4IWgq0vLI8n7ZY3obZJYzTIkJsBPlZqOYyyCfYjQi4/37SYJk1PgAKYOQh0cb7s97JU9w65jft/nBddJM9QsE4w/HJEAMtO4o65I/hrsMTc/mNhrQqB0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=duagon.com; spf=pass smtp.mailfrom=duagon.com; dkim=pass (1024-bit key) header.d=duagon.com header.i=@duagon.com header.b=TMEMC+5y; arc=fail smtp.client-ip=40.107.168.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=duagon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=duagon.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SqZ5SEyGf01EYaV7gJ1yt4pnx9NLDn0Ctt+Lb1Vq5Gr8lGt+gZBqt/LQDon9LVGk3u/bJe/HsGTKc4TER2qcU/JsKluECOZM/NOk7yAc0iW8VatdQL3DGsqZOR89VcZ8wWRg1lj9cCsu4HSsSJxGhpehEoXctczHF3HRkw3+orQyLG214d9Aa6iYezh/oViK1t2uU/sgvgipbFWuY+k1C0mFvbry4oJCifNxL6yA8c1Lc9q4TfjkZBHKGonoA6X2E+2uiw0twtGnfXGP22zUOsIlQ6MMywbdHB6IiOK2UfF6nD8I9D/uTVP+xNm1mb3QYYXKeZ7uSvIrV/0a4gaImw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c8IJN6c2rwlYoRCX7RASxatVjWIn67eVkoOv4Swru3E=;
 b=UAdVIp/3YVkPrD50RczzKRWKRHpLd9mZZ3c0hNo0lxgSiTfPRpda46LWkUfx3SuwK9wcS+LT4a8y4o2dYwMHflueyRZmNqU8pwJMnCrEfsH28vLrQKGfnmpCPybjCRtv/BgKe38h2+iUtgHuLragdcZlxmJm1MfL+QWGirvsk4CJdF/b7bK/9dNnfXjUPwclcxVB8iRTmNfRtwqiqk41Y+cmg/4PwkQpIShd1uKlPEdFaPFaHuD/05YEmCakqYgGQu2xw5m1Dw3w09sf1gmSsGQKPF0tHHtN9Y6y524YuCNKKlA1j+EWjEEu3UIyu2w0P/BBLZ8DmHim2xltHmzO2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.85.4) smtp.rcpttodomain=kernel.org smtp.mailfrom=duagon.com; dmarc=pass
 (p=reject sp=reject pct=100) action=none header.from=duagon.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=duagon.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c8IJN6c2rwlYoRCX7RASxatVjWIn67eVkoOv4Swru3E=;
 b=TMEMC+5y+X/SwzVPEzpU9pNDJVxVRD++B3qitFp/ekTtYvnNpNjIQv9dbVMHkKN5ptliHsBWrajJrPAn5ulrHByUqkYqP9gpG6HmEx0HvSRnLj4D51zPHENjTDSciEJqoySVm2/i0RvmvpzKGq5vXkVhroGHEIgrzAbP+MPKfwo=
Received: from DUZPR01CA0251.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b5::23) by ZR4P278MB1919.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:b5::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Tue, 7 Apr
 2026 18:49:19 +0000
Received: from DB1PEPF000509EE.eurprd03.prod.outlook.com
 (2603:10a6:10:4b5:cafe::48) by DUZPR01CA0251.outlook.office365.com
 (2603:10a6:10:4b5::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.32 via Frontend Transport; Tue,
 7 Apr 2026 18:49:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.85.4)
 smtp.mailfrom=duagon.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=duagon.com;
Received-SPF: Pass (protection.outlook.com: domain of duagon.com designates
 40.93.85.4 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.85.4; helo=ZRAP278CU002.outbound.protection.outlook.com; pr=C
Received: from hz-deliver01.de.seppmail.cloud (2a01:4f8:a0:13df::219) by
 DB1PEPF000509EE.mail.protection.outlook.com (2603:10a6:18:3::628) with
 Microsoft SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Tue, 7 Apr 2026 18:49:19 +0000
Received: from hz-glue05.de.seppmail.cloud (unknown [10.11.0.47])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hz-deliver01.de.seppmail.cloud (Postfix) with ESMTPS id 4fqwGQ75Zzz4wxW;
	Tue,  7 Apr 2026 20:49:18 +0200 (CEST)
Received: from hz-glue05.de.seppmail.cloud (unknown [172.18.0.7])
	by hz-glue05.de.seppmail.cloud (Postfix) with ESMTP id 4fqwGQ6lmgz20Qq;
	Tue,  7 Apr 2026 20:49:18 +0200 (CEST)
X-SEPP-Suspect: af384c80c4b44ccd888e8df1f683e4e8
Received: from hz-scan07.de.seppmail.cloud (unknown [10.11.0.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by hz-glue05.de.seppmail.cloud (Postfix) with ESMTPS id 4fqwGQ6B84z20FK;
	Tue,  7 Apr 2026 20:49:18 +0200 (CEST)
Received: from hz-scan07 (localhost [127.0.0.1])
	by hz-scan07.de.seppmail.cloud (Postfix) with SMTP id 4fqwGQ5b45zmZR;
	Tue, 07 Apr 2026 20:49:18 +0200 (CEST)
Received: from hz-m365gate01.de.seppmail.cloud (unknown [10.11.0.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hz-scan07.de.seppmail.cloud (Postfix) with ESMTPS;
	Tue, 07 Apr 2026 20:49:17 +0200 (CEST)
Received: from ZRAP278CU002.outbound.protection.outlook.com (mail-switzerlandnorthazlp17010004.outbound.protection.outlook.com [40.93.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (not verified))
	by hz-m365gate01.de.seppmail.cloud (Postfix) with ESMTPS id 4fqwGN71fwz2xLN;
	Tue,  7 Apr 2026 20:49:16 +0200 (CEST)
Received: from ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:34::6) by
 GV0P278MB0162.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:2d::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.18; Tue, 7 Apr 2026 18:49:15 +0000
Received: from ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM
 ([fe80::30b2:3be9:48ab:c354]) by ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM
 ([fe80::30b2:3be9:48ab:c354%6]) with mapi id 15.20.9769.018; Tue, 7 Apr 2026
 18:49:15 +0000
From: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>
To: linusw@kernel.org,
	brgl@kernel.org
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>
Subject: [RFC PATCH 2/5] gpio: generic: extend gpio_generic_chip_config with PMIO register fields
Date: Tue,  7 Apr 2026 20:48:02 +0200
Message-ID: <20260407184805.807328-3-dev-josejavier.rodriguez@duagon.com>
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
	ZR0P278MB0523:EE_|GV0P278MB0162:EE_|DB1PEPF000509EE:EE_|ZR4P278MB1919:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e46528d-bbb9-4842-373e-08de94d66065
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|52116014|56012099003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 RYaxuY/MjD6Uatc8aSho6oxBP6TD2uth481j0MEDkgwlYigidH6p4QMYVd0ScKRK5dhq9+j0AUxCg6CmOwx7Zv50LVcOR4TPoucdR6NhFY3FL7vFgxXqcl3l90GhBjwZt+BgAtH53k0Xt2S40QwL4crdhgf5fKFudUeJSPtBrfdz5IplTYeQrWPzGP/MmIhBYQv31++zmv0nqeMD9Xaw7NNvznhCb8MAg1xL3OAol1jhIhDIyR78Avar2q7FAsVZeFcjMbuSf7sPtHa2Vs1wc7Buq4noL7uiPi0NQ3KPlUoZ8A3pMatrpk14VP85xS3gXKkoXAOpKipTLTCodN+Y/3jq3sZcqCKzLgaDo8bO4ULzUf7ArfJQaghY+kMAcyy4SrXGmk1BUb5cK2VFC4ngxb9TN8C4KGG8njCIwPeygf2NlKf/dpyrmJDiKRKFG0rGyHo6Bsx2gkoTHpgYqrfv1OVkUaTPoGcEPTYaJg1d9ud7xIUbi513MItxQ8+gJZZ8xwUBDqKQ26rxbibChS1oMUEgNCreRGvT/4WqlmM1S5GAsD61tb4Ug6sDHtnoKq702FMC1lIdP/XkzW4CtFWZs9EdwliJqQvTAl41PlGfGFolF52C7zbIvsLwoaBUL8KsIcrXx4oqiecCzBzjJy6obMuErzFlf5OFg5M4egyICGZKHB0p8mtpKv415CvaCxGuZyq6ymTYlju6ZqM9N1TIGLDm81lVh2j3a1MvcpHwZRlw3xYrj+Caq4jdDd12q3WpJv1TvRzAlZTg8Si/uELV8pIKBxDrLUS+KrlFHeF5lJw=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(56012099003)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 gtLUWa+LF5jUUqBPGip95oan0PemEPgi82HK78XcwGVDp4Fu7w7KwR3IjsiAqj9zw59Sd1ZDMmw12AvVNz3rJ2d/ISGiZc1Wi5EQlaS+GPxUUrE9kqqHzcdlyTnf8TxF3S8AJ6ibZP2t3udHVUtPHpU1x5H9/GPhaUxgek7OkMFfJLIXaGy7i0qBPWWl6C5byRU/z/QbH6mL8dCLUb/tS2CcgRGIrIRzsv5/PRvKG+K5jJtUu1e4FHIRBu/diOt3kGf/QNTw07aF/jjtgdEjxJBaj9tHpyjo1Nn7BYgDNcUI5nqEaWYWQJ+vGVVQwPaSfGKHfYxvYQmbAkYqM0BEbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV0P278MB0162
X-SEPP-CCCVersion: 2026-03-30T09:40:10+02:00 639c564b
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.85.4];domain=ZRAP278CU002.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.85.4];domain=ZRAP278CU002.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509EE.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ee669834-4cc8-4f0d-47dc-08de94d65ddd
X-SM-ruleversion: 2.1.0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|704162211799003|10070799003|14060799003|35042699022|1800799024|82310400026|36860700016|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gtGqWCV5CcyLy0q5p4bxfqZXmHWaHh4f0zvjtv1pvhgqADOpZ4yZa2FzOdRV?=
 =?us-ascii?Q?zQPIYYipbb69XQ3m0m7DWn1AMQHFAbg6WvjERx5Qj4cyyneco/6hB/7cSF6b?=
 =?us-ascii?Q?T0Y8NtnTzRNOY9qVsVZk9AsHUJITa0YwgHc2aw6rUtQ+9JznIStO5VlsR/vA?=
 =?us-ascii?Q?RcrSYDWcbxp6rMRZp5zRPUpDjHoKALUgU/nCIcALbMbQUXZRRGFzjOX94W9K?=
 =?us-ascii?Q?syVsSvGzDP0CD/7L974OAdni+7UrlZarg8CM03Eu9K49VYaijhhJzmJVkGnn?=
 =?us-ascii?Q?HPov24BLSyaXuKyrVzSl5n/nlWhnLtS1oN94OTr2TSUmeVcl7+qE21ENBhYm?=
 =?us-ascii?Q?13/32mPzdjhcN32hQZLXB/Wx0v/5cRFkCl0/H4NYudtcIQisMeQWjCwLJefp?=
 =?us-ascii?Q?nZEkpcTQEjoRQOV+KTA93mDvyEqLr15Yjtpmip0uI/e+EkWuRZe4bJvo1b+M?=
 =?us-ascii?Q?M6IdSor2mLDTt78lxh5qXMY5Wxsm1ItJdATH23oaIHKUVTNxkv0+eatXOEn3?=
 =?us-ascii?Q?GUGQ/UANBkEO1MvoNa2S72zyZ6KQntCvZg1FQm6krE1ztDp5VdsS8wiBIxPN?=
 =?us-ascii?Q?ZgHogMZ+ceejCSVZzXpMR9yIxnBDOB685NzZbYOlSQrGYKQ26wQQdK71nLBt?=
 =?us-ascii?Q?wkypluVLoKRB+/fh6Y/v3CLtlTx5LlXXCytX1+K3A0rWBqMzklK5/H4Hq1Ym?=
 =?us-ascii?Q?4USdDqMstiXwV9A0Fg3MJPy6dX6rlIPotbQZ+2eYFfzYZ/9BeNuBD7yKhDUl?=
 =?us-ascii?Q?riYPijWDQJ/Z+8aJiO66Ila/iLefKOocpqli/6zeljushN4g89XnBCegr6vk?=
 =?us-ascii?Q?k6bEV3Wl1eB7T0PAuRvwRT8bSniErUvNAHbxE7uX3X1bUaVsJF2/RrOGUvSX?=
 =?us-ascii?Q?EOYkJFe5OfUGiMOMwY1osFbqmCqn+0Q4gKD6n62O9dsNq7S2IzUCQAEzWCEv?=
 =?us-ascii?Q?qzB2jWFYQ3b7rVw8mxvuEYpDXmEgnAaZJBPPtKsOie2uCBJa3hW6+g/kAPHj?=
 =?us-ascii?Q?aWN9SvJnq44vIyJ7nKEYjGO4QNfUZOGyyYvBmqTRfRPQ1ZzgI2pAqGtH3Ntd?=
 =?us-ascii?Q?uy+mQr3mITU/SUtVt5LEQnaRcP5YbFOZa+9I4cuyJZXDEiQ/IB4ZrLSq2mhL?=
 =?us-ascii?Q?L+gsWVgMsSAmKpiU0Bb8A3dqq8m4Xz7kWA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:2a01:4f8:a0:13df::219;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZRAP278CU002.outbound.protection.outlook.com;PTR:mail-switzerlandnorthazlp17010004.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(704162211799003)(10070799003)(14060799003)(35042699022)(1800799024)(82310400026)(36860700016)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	N3ArDBH/9yThMd58DmZPSkCCwjK93kHjNeq6fzWAG4C17Qot6YbP9Rq7j+PCmpY1PDjki/a4wCmxUKHrPmfRECm9YDsQQUGqQUfWc1H3hW4tFlV+zJnm04FGM/o/70SueYBtZSRq6Qibhp7zAYMFPLoTM9gbXLXEUh78EVlJSEoeZ4AlXY178WUfRTONJTFweJRpWd82tewxHH80sS870/2WhWA8PFVyNenovMglUI0gk2VdbD8xeRUrnEOHjaqNU+BLpvf+xxQ+EhchMAQJm1OlGGh5LO0p00m4gZ9Ny9rY8sk/SLy+t0qCEp6qtr/WjyyJYt5rxHAWr9JtqCRbgDIfGahAPKaSPQlHGjWYbAjmgNDnoNhYWSlSpgOX6/fnFPsZwEMFOaG4s1SMBKo0eTaPDmyAqY37HjuNMLxD9ykKvXsDqgKXtuKXgOXPQOzF
X-OriginatorOrg: duagon.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 18:49:19.3050
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e46528d-bbb9-4842-373e-08de94d66065
X-MS-Exchange-CrossTenant-Id: e5e7e96e-8a28-45d6-9093-a40dd5b51a57
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5e7e96e-8a28-45d6-9093-a40dd5b51a57;Ip=[2a01:4f8:a0:13df::219];Helo=[hz-deliver01.de.seppmail.cloud]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509EE.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR4P278MB1919
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
	TAGGED_FROM(0.00)[bounces-34839-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,duagon.com:dkim,duagon.com:email,duagon.com:mid]
X-Rspamd-Queue-Id: 60F693B3082
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Instead of replacing the register type with gpio_chip_reg, it is better
to extend the structure by adding dedicated fields for I/O port
registers.

This ensures compatibility with memory-mapped devices.

Signed-off-by: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>
---
 include/linux/gpio/generic.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/linux/gpio/generic.h b/include/linux/gpio/generic.h
index 87c624070901..9a71a8fbe56e 100644
--- a/include/linux/gpio/generic.h
+++ b/include/linux/gpio/generic.h
@@ -43,6 +43,11 @@ struct device;
  *         assumed that setting a line to 1 in this register will turn that
  *         line into an input line. Conversely, setting the line to 0 will
  *         turn that line into an output.
+ * @dat_port: Port-mapped counterpart of @dat.
+ * @set_port: Port-mapped counterpart of @set.
+ * @clr_port: Port-mapped counterpart of @clr.
+ * @dirout_port: Port-mapped counterpart of @dirout.
+ * @dirin_port: Port-mapped counterpart of @dirin.
  * @flags: Different flags that will affect the behaviour of the device, such
  *         as endianness etc.
  */
@@ -54,6 +59,11 @@ struct gpio_generic_chip_config {
 	void __iomem *clr;
 	void __iomem *dirout;
 	void __iomem *dirin;
+	unsigned long dat_port;
+	unsigned long set_port;
+	unsigned long clr_port;
+	unsigned long dirout_port;
+	unsigned long dirin_port;
 	unsigned long flags;
 };
 
-- 
2.53.0

