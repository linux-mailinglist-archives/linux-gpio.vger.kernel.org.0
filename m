Return-Path: <linux-gpio+bounces-39739-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YogYOzykT2o9lgIAu9opvQ
	(envelope-from <linux-gpio+bounces-39739-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Jul 2026 15:38:04 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E79731A71
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Jul 2026 15:38:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=3Ne87iu2;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39739-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39739-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 21B93305C00F
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jul 2026 13:28:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0DB029AB07;
	Thu,  9 Jul 2026 13:28:50 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012001.outbound.protection.outlook.com [40.93.195.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3915823393D;
	Thu,  9 Jul 2026 13:28:48 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783603730; cv=fail; b=hg320P6UrcL418Wb1mySZSzecRs/VIp9iCsoYuj+/IOiWZkkkWpsxBvdQcTujtw37+Ojkpin0U8iK4A8O/AIRFnd1Iyj1AE0oJkP3M+cBXe5k+iIuKpJfQy//0LglrmUJ5vZe1ik01zljYPNGjbvM2NvOi4NGcXoNj0k0m8Hi/k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783603730; c=relaxed/simple;
	bh=4PZiWSECdsqmX9V/8da9PTw/dC668mULssmlhIbPxFc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XvAQKtef5TcsRtau2j8nWUrFpiZarqvnbGn8cKoctLfjLjpkER/XiYtk5LcMz+alr6H9CVLF6GLWdWsaE3GNmxU2IXE2IKtplYndLY66iDzuCHrEtHPc6fkrV2PuPBEiPv/xzWXdFRQeBqFSnr26ckMNie4+LsfC0oNnZkZ/QRQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=3Ne87iu2; arc=fail smtp.client-ip=40.93.195.1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tUHyPR3j68btvMJkru1wjQsd4wiKWh1HGJgOCT8ylE4JkRk59ZPFKrBsSxfQcD7FZmLM6ZSy7cp9KdH34PWhN/7yDThnil8QD3YlPOAvzGFyFzeiFeuoAL9BeOVhGCL6XjH/mmNPt2hoM9aMwex+yDXfEKM7lpKZRdkX7yvfJCJs8Ij+VSMc2LYF84jh/Fz3JUhl0Rb0I5yCGiO4KpZFuTAzloS1VD/WYVXaZSQOp/HSbY5Q0RRVwp4/deX2xeuzm8aSK0aeu0B7odX4AjzEncoPHOQDibea5tu7OmRLV8xRWjzhRdNBjNw2d0Yeh2r20eTrhl3ooOce5+MPNdzSEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/C+7o5/T2HbNqUxj/88u/vQrAPFDdk6b1Mfe4rRHoFk=;
 b=ug+IGD+rmpX96FhZ9wBXl94ekkjobbg70MiyX0Dpb/Mnu1rSSewIk1SSOE62FyzSMek8cEeflxSES/5FLlMoUro2zFYJL4Dq9P4oORdZTC7xLEvxw7qBkEGsqweT/euqJ2hhNKeW04XcbHbk5r8bpboxYcp8quoRhPB2GVP1e1GIGKeH3HIhJ49t1TajDEohR6IuD0cpe5whO8IPxi35qNzYx9LGsbSDYAkp4SuwCVcnXMCvTpio65jUnz51+4ylio9uIZANI34Ap0CdY7T8jRLZcH9fWp9fSFF0waM9to6goXAZPBsLYj17fKb2LTct8psYAJe00eUf1ygM1+uiBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/C+7o5/T2HbNqUxj/88u/vQrAPFDdk6b1Mfe4rRHoFk=;
 b=3Ne87iu28UhcCQYLavNyGepsZYKuxcIZcdlHh72lfVs8oiraE4//0fCZEIgJ6TfHBokkM+z1bvg6b62T14mJwMN3qxQY6b2WFEfrZ3DR86f9Uo76p8n9jBVGuLHYeu7+b5nNBVVM+Y0FddQ1bDpttEMJ8Tuso7K5OqEfCnZ6als=
Received: from BN0PR08CA0019.namprd08.prod.outlook.com (2603:10b6:408:142::12)
 by SA0PR12MB7089.namprd12.prod.outlook.com (2603:10b6:806:2d5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 9 Jul
 2026 13:28:39 +0000
Received: from MN1PEPF0000ECDA.namprd02.prod.outlook.com
 (2603:10b6:408:142:cafe::6a) by BN0PR08CA0019.outlook.office365.com
 (2603:10b6:408:142::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.10 via Frontend Transport; Thu, 9
 Jul 2026 13:28:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 MN1PEPF0000ECDA.mail.protection.outlook.com (10.167.242.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 9 Jul 2026 13:28:39 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 9 Jul
 2026 08:28:37 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 9 Jul
 2026 08:28:35 -0500
Received: from localhost (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41 via Frontend
 Transport; Thu, 9 Jul 2026 08:28:35 -0500
From: Michal Simek <michal.simek@amd.com>
To: <linux-kernel@vger.kernel.org>, <monstr@monstr.eu>,
	<michal.simek@amd.com>, <git@amd.com>
CC: <vincent.guittot@linaro.org>, <Souvik.Chakravarty@arm.com>, Alex Shi
	<alexs@kernel.org>, Andy Shevchenko <andy@kernel.org>, Bartosz Golaszewski
	<brgl@kernel.org>, Brian Masney <bmasney@redhat.com>, Cristian Marussi
	<cristian.marussi@arm.com>, David Lechner <dlechner@baylibre.com>, "Dongliang
 Mu" <dzm91@hust.edu.cn>, Fabio Estevam <festevam@gmail.com>, Frank Li
	<Frank.Li@nxp.com>, Guenter Roeck <linux@roeck-us.net>, Jonathan Cameron
	<jic23@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Len Brown
	<lenb@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Linus Walleij
	<linusw@kernel.org>, Lukasz Luba <lukasz.luba@arm.com>, Mark Brown
	<broonie@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>, Pavel Machek
	<pavel@kernel.org>, Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>, "Rafael J.
 Wysocki" <rafael@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, "Shuah
 Khan" <skhan@linuxfoundation.org>, Stephen Boyd <sboyd@kernel.org>, "Sudeep
 Holla" <sudeep.holla@kernel.org>, Ulf Hansson <ulfh@kernel.org>, Viresh Kumar
	<viresh.kumar@linaro.org>, Yanteng Si <si.yanteng@linux.dev>,
	<arm-scmi@vger.kernel.org>, "open list:ARM/FREESCALE IMX / MXC ARM
 ARCHITECTURE" <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, "open
 list:DOCUMENTATION" <linux-doc@vger.kernel.org>, "open list:GPIO SUBSYSTEM"
	<linux-gpio@vger.kernel.org>, "open list:HARDWARE MONITORING"
	<linux-hwmon@vger.kernel.org>, "open list:IIO SUBSYSTEM AND DRIVERS"
	<linux-iio@vger.kernel.org>, "open list:ENERGY MODEL"
	<linux-pm@vger.kernel.org>
Subject: [RFC PATCH] firmware: scmi: Make SCMI arch independent
Date: Thu, 9 Jul 2026 15:27:00 +0200
Message-ID: <d7f7e8c9589d937b60e43168845ab4fda15037a3.1783603600.git.michal.simek@amd.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=27821; i=michal.simek@amd.com; h=from:subject:message-id; bh=4PZiWSECdsqmX9V/8da9PTw/dC668mULssmlhIbPxFc=; b=owGbwMvMwCG2mv3fB7+vgl8ZT6slMWT5L7w3WT3r6+IzHJcPcrMdu+L6zj/77l7Rzzua0pXqs 465Xb11qqOUhUGMg0FWTJFlOpOOw5pv15aKLY/Mh5nDygQyhIGLUwAm4rqPkWFz3g5JVh7mNf3G t3QijZ50GfPVVurGL2w49OhH2CqtzlRGhusHena4W87N2c9zpfLNzoaK5gjdPoZNb97pmz6f17n jIxcA
X-Developer-Key: i=michal.simek@amd.com; a=openpgp; fpr=67350C9BF5CCEE9B5364356A377C7F21FE3D1F91
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECDA:EE_|SA0PR12MB7089:EE_
X-MS-Office365-Filtering-Correlation-Id: cf550857-a433-4827-20ef-08deddbdfcca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|82310400026|36860700016|376014|1800799024|18002099003|3023799007|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	sny4MhPmLXhZEk4jgghmigPO30TCxd1ML+M2VV2P8ollDa83JqnfiJJArTM2h45Tj2gfZqUF/8GMTWhEG5X2J5hQUi4tC8FBVFTLx3ycljIp/0wd0Q+15SHD4b76BLh81S4FHsUlzmz4s5Y/OmBXFTLIgRiH5s3567rtnJ4vb7arqDpLgCS7tUv+RvuwOs1TwIlAP70B2DVzLvyl0e1qzVR554oKkLAg2pvFnm12zdKUAYzUM+qRfXS6gLWGwv9lKqW1w+cQLYpj/TerTinaz5qZCjro0cjmKQ5OFzs4V0tM1vTLGnNJGOdmy3/3a1zYndLY31krujuwztPrOmxa/ZocFvSLO2bHaoBYlbf8iZrt369oGz9qnbnYNFu5Cn6olojU7rxmprdR9ogC+A9UPCV6aoQh/MugrkAlwODOlnj7VmwBzRVSCulSZ40EwD8SKVLjmDhC/3tODYI38wTArblS+1urE8lwgp+2lxUywWSdxGehih+T8lSNrP3r6oIMn3BWoFMIYkeolh621ffHbOcDSKeucMfym9EmP+/V2Xjd7kryjovfX0oMqOGBkDO5Oaf7DO8ld3mnc3yADBwm0H3YYNuopgZYXiiMuyehWvaCnoS0YY/zS+oXH/kr4iRiUuoPjJP6e4TKU+8ZuyISo0YVqvuAtxN3PfJBeWX6ElwQokyg5j9oOu3phIjkFlgaGei3wbZMA0uQQHbmfXpSVw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(82310400026)(36860700016)(376014)(1800799024)(18002099003)(3023799007)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	nlJ4ZyX8WPoKGWsBaufYYNEtqzeHNDkq4VZCABsnljpE2ntBCG6P6tD4Q1qKmeAkq/tmmAona8o4jav0CxGH1fmfuLNUCe6Fuyz/UNqdnpYaqxLbV3MV5FtbtqsUbMyNQrCep8QchxmXaq6y5hXYlhBlfiowwCvZNDYDwdbjHH9TkwN2oS+LNkwuqr4kkOEEb1Hn2kc8/Jw9sVB8Uy1+KsfNLu0HBjepxROPQ/9wB2n9YdH8wbkiX/zCVVRa7VQpTW49imf11DOOYL7nRFDouTwvDfMnnHEsO6HNG1Fm94mZjBrUPw/mZi3O7Z+BefgqMwMzoGev3TszrO+rpdw+/MlfAeweqXS/gr+L78MFoDiZh3n15ujsWYBo4C145CFaXcrN4A8ryjwTgZAoaBWZkp3CwGsRUX/q2s7MklR5mKpZhIVDejgn95CDEa+wHL7O
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 13:28:39.2491
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf550857-a433-4827-20ef-08deddbdfcca
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECDA.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7089
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[46];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39739-lists,linux-gpio=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:monstr@monstr.eu,m:michal.simek@amd.com,m:git@amd.com,m:vincent.guittot@linaro.org,m:Souvik.Chakravarty@arm.com,m:alexs@kernel.org,m:andy@kernel.org,m:brgl@kernel.org,m:bmasney@redhat.com,m:cristian.marussi@arm.com,m:dlechner@baylibre.com,m:dzm91@hust.edu.cn,m:festevam@gmail.com,m:Frank.Li@nxp.com,m:linux@roeck-us.net,m:jic23@kernel.org,m:corbet@lwn.net,m:lenb@kernel.org,m:lgirdwood@gmail.com,m:linusw@kernel.org,m:lukasz.luba@arm.com,m:broonie@kernel.org,m:mturquette@baylibre.com,m:nuno.sa@analog.com,m:pavel@kernel.org,m:peng.fan@nxp.com,m:kernel@pengutronix.de,m:p.zabel@pengutronix.de,m:rafael@kernel.org,m:s.hauer@pengutronix.de,m:skhan@linuxfoundation.org,m:sboyd@kernel.org,m:sudeep.holla@kernel.org,m:ulfh@kernel.org,m:viresh.kumar@linaro.org,m:si.yanteng@linux.dev,m:arm-scmi@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-clk@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-gpio@vger.
 kernel.org,m:linux-hwmon@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-pm@vger.kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[michal.simek@amd.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,arm.com,kernel.org,redhat.com,baylibre.com,hust.edu.cn,gmail.com,nxp.com,roeck-us.net,lwn.net,analog.com,pengutronix.de,linuxfoundation.org,linux.dev,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[amd.com:+];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.simek@amd.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D1E79731A71

On heterogenious systems like AMD/Xilinx FPGA there is a need to talk to
SCMI server from different architectures than ARM that's why remove
ARM/ARM64 Kconfig dependency with also remove ARM from description and
rename folder to reflect it.
From specification perspective only ARM specific transport layers should be
available on ARM/ARM64 architectures.

That's why get rid of ARM prefix and description from documentation, file
names, folder names, MODULE description, module names, Kconfig and
comments.
But keep origin Kconfig symbols not to break existing users.

Hwmon, pinctrl, powercap, regulator, reset, clk and cpufreq scmi drivers
already miss arm prefix that's why synchronize all of them to be without
arm prefix.

Signed-off-by: Michal Simek <michal.simek@amd.com>
---

Likely I missed other locations but I wanted to send this RFC to have a
discussion about it.
---
 Documentation/power/energy-model.rst                  |  2 +-
 .../translations/zh_CN/power/energy-model.rst         |  2 +-
 MAINTAINERS                                           |  6 +++---
 drivers/clk/clk-scmi.c                                |  2 +-
 drivers/cpufreq/scmi-cpufreq.c                        |  2 +-
 drivers/firmware/Kconfig                              |  2 +-
 drivers/firmware/Makefile                             |  2 +-
 drivers/firmware/{arm_scmi => scmi}/Kconfig           | 11 +++++------
 drivers/firmware/{arm_scmi => scmi}/Makefile          |  0
 drivers/firmware/{arm_scmi => scmi}/base.c            |  0
 drivers/firmware/{arm_scmi => scmi}/bus.c             |  0
 drivers/firmware/{arm_scmi => scmi}/clock.c           |  0
 drivers/firmware/{arm_scmi => scmi}/common.h          |  0
 drivers/firmware/{arm_scmi => scmi}/driver.c          |  0
 drivers/firmware/{arm_scmi => scmi}/msg.c             |  0
 drivers/firmware/{arm_scmi => scmi}/notify.c          |  0
 drivers/firmware/{arm_scmi => scmi}/notify.h          |  0
 drivers/firmware/{arm_scmi => scmi}/perf.c            |  0
 drivers/firmware/{arm_scmi => scmi}/pinctrl.c         |  0
 drivers/firmware/{arm_scmi => scmi}/power.c           |  0
 drivers/firmware/{arm_scmi => scmi}/powercap.c        |  0
 drivers/firmware/{arm_scmi => scmi}/protocols.h       |  0
 drivers/firmware/{arm_scmi => scmi}/quirks.c          |  0
 drivers/firmware/{arm_scmi => scmi}/quirks.h          |  0
 drivers/firmware/{arm_scmi => scmi}/raw_mode.c        |  0
 drivers/firmware/{arm_scmi => scmi}/raw_mode.h        |  0
 drivers/firmware/{arm_scmi => scmi}/reset.c           |  0
 .../firmware/{arm_scmi => scmi}/scmi_power_control.c  |  0
 drivers/firmware/{arm_scmi => scmi}/sensors.c         |  0
 drivers/firmware/{arm_scmi => scmi}/shmem.c           |  0
 drivers/firmware/{arm_scmi => scmi}/system.c          |  0
 .../firmware/{arm_scmi => scmi}/transports/Kconfig    |  0
 .../firmware/{arm_scmi => scmi}/transports/Makefile   |  0
 .../firmware/{arm_scmi => scmi}/transports/mailbox.c  |  0
 .../firmware/{arm_scmi => scmi}/transports/optee.c    |  0
 drivers/firmware/{arm_scmi => scmi}/transports/smc.c  |  0
 .../firmware/{arm_scmi => scmi}/transports/virtio.c   |  0
 .../firmware/{arm_scmi => scmi}/vendors/imx/Kconfig   |  0
 .../firmware/{arm_scmi => scmi}/vendors/imx/Makefile  |  0
 .../{arm_scmi => scmi}/vendors/imx/imx-sm-bbm.c       |  0
 .../{arm_scmi => scmi}/vendors/imx/imx-sm-cpu.c       |  0
 .../{arm_scmi => scmi}/vendors/imx/imx-sm-lmm.c       |  0
 .../{arm_scmi => scmi}/vendors/imx/imx-sm-misc.c      |  0
 .../firmware/{arm_scmi => scmi}/vendors/imx/imx95.rst |  0
 drivers/firmware/{arm_scmi => scmi}/voltage.c         |  0
 drivers/gpio/Kconfig                                  |  2 +-
 drivers/hwmon/Kconfig                                 |  2 +-
 drivers/iio/common/scmi_sensors/Kconfig               |  2 +-
 drivers/pinctrl/pinctrl-scmi.c                        |  2 +-
 drivers/pmdomain/arm/scmi_perf_domain.c               |  2 +-
 drivers/pmdomain/arm/scmi_pm_domain.c                 |  2 +-
 drivers/powercap/Kconfig                              |  4 ++--
 drivers/powercap/Makefile                             |  2 +-
 .../powercap/{arm_scmi_powercap.c => scmi_powercap.c} |  2 +-
 drivers/regulator/scmi-regulator.c                    |  2 +-
 drivers/reset/Kconfig                                 |  2 +-
 drivers/reset/reset-scmi.c                            |  4 ++--
 57 files changed, 28 insertions(+), 29 deletions(-)
 rename drivers/firmware/{arm_scmi => scmi}/Kconfig (91%)
 rename drivers/firmware/{arm_scmi => scmi}/Makefile (100%)
 rename drivers/firmware/{arm_scmi => scmi}/base.c (100%)
 rename drivers/firmware/{arm_scmi => scmi}/bus.c (100%)
 rename drivers/firmware/{arm_scmi => scmi}/clock.c (100%)
 rename drivers/firmware/{arm_scmi => scmi}/common.h (100%)
 rename drivers/firmware/{arm_scmi => scmi}/driver.c (100%)
 rename drivers/firmware/{arm_scmi => scmi}/msg.c (100%)
 rename drivers/firmware/{arm_scmi => scmi}/notify.c (100%)
 rename drivers/firmware/{arm_scmi => scmi}/notify.h (100%)
 rename drivers/firmware/{arm_scmi => scmi}/perf.c (100%)
 rename drivers/firmware/{arm_scmi => scmi}/pinctrl.c (100%)
 rename drivers/firmware/{arm_scmi => scmi}/power.c (100%)
 rename drivers/firmware/{arm_scmi => scmi}/powercap.c (100%)
 rename drivers/firmware/{arm_scmi => scmi}/protocols.h (100%)
 rename drivers/firmware/{arm_scmi => scmi}/quirks.c (100%)
 rename drivers/firmware/{arm_scmi => scmi}/quirks.h (100%)
 rename drivers/firmware/{arm_scmi => scmi}/raw_mode.c (100%)
 rename drivers/firmware/{arm_scmi => scmi}/raw_mode.h (100%)
 rename drivers/firmware/{arm_scmi => scmi}/reset.c (100%)
 rename drivers/firmware/{arm_scmi => scmi}/scmi_power_control.c (100%)
 rename drivers/firmware/{arm_scmi => scmi}/sensors.c (100%)
 rename drivers/firmware/{arm_scmi => scmi}/shmem.c (100%)
 rename drivers/firmware/{arm_scmi => scmi}/system.c (100%)
 rename drivers/firmware/{arm_scmi => scmi}/transports/Kconfig (100%)
 rename drivers/firmware/{arm_scmi => scmi}/transports/Makefile (100%)
 rename drivers/firmware/{arm_scmi => scmi}/transports/mailbox.c (100%)
 rename drivers/firmware/{arm_scmi => scmi}/transports/optee.c (100%)
 rename drivers/firmware/{arm_scmi => scmi}/transports/smc.c (100%)
 rename drivers/firmware/{arm_scmi => scmi}/transports/virtio.c (100%)
 rename drivers/firmware/{arm_scmi => scmi}/vendors/imx/Kconfig (100%)
 rename drivers/firmware/{arm_scmi => scmi}/vendors/imx/Makefile (100%)
 rename drivers/firmware/{arm_scmi => scmi}/vendors/imx/imx-sm-bbm.c (100%)
 rename drivers/firmware/{arm_scmi => scmi}/vendors/imx/imx-sm-cpu.c (100%)
 rename drivers/firmware/{arm_scmi => scmi}/vendors/imx/imx-sm-lmm.c (100%)
 rename drivers/firmware/{arm_scmi => scmi}/vendors/imx/imx-sm-misc.c (100%)
 rename drivers/firmware/{arm_scmi => scmi}/vendors/imx/imx95.rst (100%)
 rename drivers/firmware/{arm_scmi => scmi}/voltage.c (100%)
 rename drivers/powercap/{arm_scmi_powercap.c => scmi_powercap.c} (99%)

diff --git a/Documentation/power/energy-model.rst b/Documentation/power/energy-model.rst
index 0d4644d72767..ca147ea36232 100644
--- a/Documentation/power/energy-model.rst
+++ b/Documentation/power/energy-model.rst
@@ -56,7 +56,7 @@ framework, and interested clients reading the data from it::
                 +----------+       |       +---------+
                 |                  |                 |
         +---------------+  +---------------+  +--------------+
-        |  cpufreq-dt   |  |   arm_scmi    |  |    Other     |
+        |  cpufreq-dt   |  |      scmi     |  |    Other     |
         +---------------+  +---------------+  +--------------+
                 ^                  ^                 ^
                 |                  |                 |
diff --git a/Documentation/translations/zh_CN/power/energy-model.rst b/Documentation/translations/zh_CN/power/energy-model.rst
index 48849919d8aa..057c76a087cd 100644
--- a/Documentation/translations/zh_CN/power/energy-model.rst
+++ b/Documentation/translations/zh_CN/power/energy-model.rst
@@ -54,7 +54,7 @@ Documentation/driver-api/thermal/power_allocator.rst文档中找到。
                 +----------+       |       +---------+
                 |                  |                 |
         +---------------+  +---------------+  +--------------+
-        |  cpufreq-dt   |  |   arm_scmi    |  |    Other     |
+        |  cpufreq-dt   |  |      scmi     |  |    Other     |
         +---------------+  +---------------+  +--------------+
                 ^                  ^                 ^
                 |                  |                 |
diff --git a/MAINTAINERS b/MAINTAINERS
index f37a81950e25..a15909357b10 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26293,12 +26293,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/firmware/arm,sc[mp]i.yaml
 F:	drivers/clk/clk-sc[mp]i.c
 F:	drivers/cpufreq/sc[mp]i-cpufreq.c
-F:	drivers/firmware/arm_scmi/
+F:	drivers/firmware/scmi/
 F:	drivers/firmware/arm_scpi.c
 F:	drivers/hwmon/scmi-hwmon.c
 F:	drivers/pinctrl/pinctrl-scmi.c
 F:	drivers/pmdomain/arm/
-F:	drivers/powercap/arm_scmi_powercap.c
+F:	drivers/powercap/scmi_powercap.c
 F:	drivers/regulator/scmi-regulator.c
 F:	drivers/reset/reset-scmi.c
 F:	include/linux/sc[mp]i_protocol.h
@@ -26312,7 +26312,7 @@ L:	imx@lists.linux.dev
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/devicetree/bindings/firmware/nxp,*scmi.yaml
-F:	drivers/firmware/arm_scmi/vendors/imx/
+F:	drivers/firmware/scmi/vendors/imx/
 
 SYSTEM RESET/SHUTDOWN DRIVERS
 M:	Sebastian Reichel <sre@kernel.org>
diff --git a/drivers/clk/clk-scmi.c b/drivers/clk/clk-scmi.c
index 7c562559ad8b..d8736feb73fd 100644
--- a/drivers/clk/clk-scmi.c
+++ b/drivers/clk/clk-scmi.c
@@ -481,5 +481,5 @@ static struct scmi_driver scmi_clocks_driver = {
 module_scmi_driver(scmi_clocks_driver);
 
 MODULE_AUTHOR("Sudeep Holla <sudeep.holla@arm.com>");
-MODULE_DESCRIPTION("ARM SCMI clock driver");
+MODULE_DESCRIPTION("SCMI clock driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/cpufreq/scmi-cpufreq.c b/drivers/cpufreq/scmi-cpufreq.c
index 4edb4f7a8aa9..51cff1838aca 100644
--- a/drivers/cpufreq/scmi-cpufreq.c
+++ b/drivers/cpufreq/scmi-cpufreq.c
@@ -493,5 +493,5 @@ static struct scmi_driver scmi_cpufreq_drv = {
 module_scmi_driver(scmi_cpufreq_drv);
 
 MODULE_AUTHOR("Sudeep Holla <sudeep.holla@arm.com>");
-MODULE_DESCRIPTION("ARM SCMI CPUFreq interface driver");
+MODULE_DESCRIPTION("SCMI CPUFreq interface driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
index 12dc70254842..79c2477b1a7a 100644
--- a/drivers/firmware/Kconfig
+++ b/drivers/firmware/Kconfig
@@ -6,7 +6,7 @@
 
 menu "Firmware Drivers"
 
-source "drivers/firmware/arm_scmi/Kconfig"
+source "drivers/firmware/scmi/Kconfig"
 
 config ARM_SCPI_PROTOCOL
 	tristate "ARM System Control and Power Interface (SCPI) Message Protocol"
diff --git a/drivers/firmware/Makefile b/drivers/firmware/Makefile
index 4ddec2820c96..0d4c2f29069a 100644
--- a/drivers/firmware/Makefile
+++ b/drivers/firmware/Makefile
@@ -24,7 +24,7 @@ obj-$(CONFIG_TRUSTED_FOUNDATIONS) += trusted_foundations.o
 obj-$(CONFIG_TURRIS_MOX_RWTM)	+= turris-mox-rwtm.o
 
 obj-y				+= arm_ffa/
-obj-y				+= arm_scmi/
+obj-y				+= scmi/
 obj-y				+= broadcom/
 obj-y				+= cirrus/
 obj-y				+= meson/
diff --git a/drivers/firmware/arm_scmi/Kconfig b/drivers/firmware/scmi/Kconfig
similarity index 91%
rename from drivers/firmware/arm_scmi/Kconfig
rename to drivers/firmware/scmi/Kconfig
index e3fb36825978..167c22a788a8 100644
--- a/drivers/firmware/arm_scmi/Kconfig
+++ b/drivers/firmware/scmi/Kconfig
@@ -1,11 +1,10 @@
 # SPDX-License-Identifier: GPL-2.0-only
-menu "ARM System Control and Management Interface Protocol"
+menu "System Control and Management Interface Protocol"
 
 config ARM_SCMI_PROTOCOL
-	tristate "ARM System Control and Management Interface (SCMI) Message Protocol"
-	depends on ARM || ARM64 || COMPILE_TEST
+	tristate "System Control and Management Interface (SCMI) Message Protocol"
 	help
-	  ARM System Control and Management Interface (SCMI) protocol is a
+	  System Control and Management Interface (SCMI) protocol is a
 	  set of operating system-independent software interfaces that are
 	  used in system management. SCMI is extensible and currently provides
 	  interfaces for: Discovery and self-description of the interfaces
@@ -82,8 +81,8 @@ config ARM_SCMI_QUIRKS
 	  depending on the SCMI firmware advertised versions and/or machine
 	  compatibles.
 
-source "drivers/firmware/arm_scmi/transports/Kconfig"
-source "drivers/firmware/arm_scmi/vendors/imx/Kconfig"
+source "drivers/firmware/scmi/transports/Kconfig"
+source "drivers/firmware/scmi/vendors/imx/Kconfig"
 
 endif #ARM_SCMI_PROTOCOL
 
diff --git a/drivers/firmware/arm_scmi/Makefile b/drivers/firmware/scmi/Makefile
similarity index 100%
rename from drivers/firmware/arm_scmi/Makefile
rename to drivers/firmware/scmi/Makefile
diff --git a/drivers/firmware/arm_scmi/base.c b/drivers/firmware/scmi/base.c
similarity index 100%
rename from drivers/firmware/arm_scmi/base.c
rename to drivers/firmware/scmi/base.c
diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/scmi/bus.c
similarity index 100%
rename from drivers/firmware/arm_scmi/bus.c
rename to drivers/firmware/scmi/bus.c
diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/scmi/clock.c
similarity index 100%
rename from drivers/firmware/arm_scmi/clock.c
rename to drivers/firmware/scmi/clock.c
diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/scmi/common.h
similarity index 100%
rename from drivers/firmware/arm_scmi/common.h
rename to drivers/firmware/scmi/common.h
diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/scmi/driver.c
similarity index 100%
rename from drivers/firmware/arm_scmi/driver.c
rename to drivers/firmware/scmi/driver.c
diff --git a/drivers/firmware/arm_scmi/msg.c b/drivers/firmware/scmi/msg.c
similarity index 100%
rename from drivers/firmware/arm_scmi/msg.c
rename to drivers/firmware/scmi/msg.c
diff --git a/drivers/firmware/arm_scmi/notify.c b/drivers/firmware/scmi/notify.c
similarity index 100%
rename from drivers/firmware/arm_scmi/notify.c
rename to drivers/firmware/scmi/notify.c
diff --git a/drivers/firmware/arm_scmi/notify.h b/drivers/firmware/scmi/notify.h
similarity index 100%
rename from drivers/firmware/arm_scmi/notify.h
rename to drivers/firmware/scmi/notify.h
diff --git a/drivers/firmware/arm_scmi/perf.c b/drivers/firmware/scmi/perf.c
similarity index 100%
rename from drivers/firmware/arm_scmi/perf.c
rename to drivers/firmware/scmi/perf.c
diff --git a/drivers/firmware/arm_scmi/pinctrl.c b/drivers/firmware/scmi/pinctrl.c
similarity index 100%
rename from drivers/firmware/arm_scmi/pinctrl.c
rename to drivers/firmware/scmi/pinctrl.c
diff --git a/drivers/firmware/arm_scmi/power.c b/drivers/firmware/scmi/power.c
similarity index 100%
rename from drivers/firmware/arm_scmi/power.c
rename to drivers/firmware/scmi/power.c
diff --git a/drivers/firmware/arm_scmi/powercap.c b/drivers/firmware/scmi/powercap.c
similarity index 100%
rename from drivers/firmware/arm_scmi/powercap.c
rename to drivers/firmware/scmi/powercap.c
diff --git a/drivers/firmware/arm_scmi/protocols.h b/drivers/firmware/scmi/protocols.h
similarity index 100%
rename from drivers/firmware/arm_scmi/protocols.h
rename to drivers/firmware/scmi/protocols.h
diff --git a/drivers/firmware/arm_scmi/quirks.c b/drivers/firmware/scmi/quirks.c
similarity index 100%
rename from drivers/firmware/arm_scmi/quirks.c
rename to drivers/firmware/scmi/quirks.c
diff --git a/drivers/firmware/arm_scmi/quirks.h b/drivers/firmware/scmi/quirks.h
similarity index 100%
rename from drivers/firmware/arm_scmi/quirks.h
rename to drivers/firmware/scmi/quirks.h
diff --git a/drivers/firmware/arm_scmi/raw_mode.c b/drivers/firmware/scmi/raw_mode.c
similarity index 100%
rename from drivers/firmware/arm_scmi/raw_mode.c
rename to drivers/firmware/scmi/raw_mode.c
diff --git a/drivers/firmware/arm_scmi/raw_mode.h b/drivers/firmware/scmi/raw_mode.h
similarity index 100%
rename from drivers/firmware/arm_scmi/raw_mode.h
rename to drivers/firmware/scmi/raw_mode.h
diff --git a/drivers/firmware/arm_scmi/reset.c b/drivers/firmware/scmi/reset.c
similarity index 100%
rename from drivers/firmware/arm_scmi/reset.c
rename to drivers/firmware/scmi/reset.c
diff --git a/drivers/firmware/arm_scmi/scmi_power_control.c b/drivers/firmware/scmi/scmi_power_control.c
similarity index 100%
rename from drivers/firmware/arm_scmi/scmi_power_control.c
rename to drivers/firmware/scmi/scmi_power_control.c
diff --git a/drivers/firmware/arm_scmi/sensors.c b/drivers/firmware/scmi/sensors.c
similarity index 100%
rename from drivers/firmware/arm_scmi/sensors.c
rename to drivers/firmware/scmi/sensors.c
diff --git a/drivers/firmware/arm_scmi/shmem.c b/drivers/firmware/scmi/shmem.c
similarity index 100%
rename from drivers/firmware/arm_scmi/shmem.c
rename to drivers/firmware/scmi/shmem.c
diff --git a/drivers/firmware/arm_scmi/system.c b/drivers/firmware/scmi/system.c
similarity index 100%
rename from drivers/firmware/arm_scmi/system.c
rename to drivers/firmware/scmi/system.c
diff --git a/drivers/firmware/arm_scmi/transports/Kconfig b/drivers/firmware/scmi/transports/Kconfig
similarity index 100%
rename from drivers/firmware/arm_scmi/transports/Kconfig
rename to drivers/firmware/scmi/transports/Kconfig
diff --git a/drivers/firmware/arm_scmi/transports/Makefile b/drivers/firmware/scmi/transports/Makefile
similarity index 100%
rename from drivers/firmware/arm_scmi/transports/Makefile
rename to drivers/firmware/scmi/transports/Makefile
diff --git a/drivers/firmware/arm_scmi/transports/mailbox.c b/drivers/firmware/scmi/transports/mailbox.c
similarity index 100%
rename from drivers/firmware/arm_scmi/transports/mailbox.c
rename to drivers/firmware/scmi/transports/mailbox.c
diff --git a/drivers/firmware/arm_scmi/transports/optee.c b/drivers/firmware/scmi/transports/optee.c
similarity index 100%
rename from drivers/firmware/arm_scmi/transports/optee.c
rename to drivers/firmware/scmi/transports/optee.c
diff --git a/drivers/firmware/arm_scmi/transports/smc.c b/drivers/firmware/scmi/transports/smc.c
similarity index 100%
rename from drivers/firmware/arm_scmi/transports/smc.c
rename to drivers/firmware/scmi/transports/smc.c
diff --git a/drivers/firmware/arm_scmi/transports/virtio.c b/drivers/firmware/scmi/transports/virtio.c
similarity index 100%
rename from drivers/firmware/arm_scmi/transports/virtio.c
rename to drivers/firmware/scmi/transports/virtio.c
diff --git a/drivers/firmware/arm_scmi/vendors/imx/Kconfig b/drivers/firmware/scmi/vendors/imx/Kconfig
similarity index 100%
rename from drivers/firmware/arm_scmi/vendors/imx/Kconfig
rename to drivers/firmware/scmi/vendors/imx/Kconfig
diff --git a/drivers/firmware/arm_scmi/vendors/imx/Makefile b/drivers/firmware/scmi/vendors/imx/Makefile
similarity index 100%
rename from drivers/firmware/arm_scmi/vendors/imx/Makefile
rename to drivers/firmware/scmi/vendors/imx/Makefile
diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-bbm.c b/drivers/firmware/scmi/vendors/imx/imx-sm-bbm.c
similarity index 100%
rename from drivers/firmware/arm_scmi/vendors/imx/imx-sm-bbm.c
rename to drivers/firmware/scmi/vendors/imx/imx-sm-bbm.c
diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-cpu.c b/drivers/firmware/scmi/vendors/imx/imx-sm-cpu.c
similarity index 100%
rename from drivers/firmware/arm_scmi/vendors/imx/imx-sm-cpu.c
rename to drivers/firmware/scmi/vendors/imx/imx-sm-cpu.c
diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-lmm.c b/drivers/firmware/scmi/vendors/imx/imx-sm-lmm.c
similarity index 100%
rename from drivers/firmware/arm_scmi/vendors/imx/imx-sm-lmm.c
rename to drivers/firmware/scmi/vendors/imx/imx-sm-lmm.c
diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c b/drivers/firmware/scmi/vendors/imx/imx-sm-misc.c
similarity index 100%
rename from drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
rename to drivers/firmware/scmi/vendors/imx/imx-sm-misc.c
diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx95.rst b/drivers/firmware/scmi/vendors/imx/imx95.rst
similarity index 100%
rename from drivers/firmware/arm_scmi/vendors/imx/imx95.rst
rename to drivers/firmware/scmi/vendors/imx/imx95.rst
diff --git a/drivers/firmware/arm_scmi/voltage.c b/drivers/firmware/scmi/voltage.c
similarity index 100%
rename from drivers/firmware/arm_scmi/voltage.c
rename to drivers/firmware/scmi/voltage.c
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 28cf6d2e83c2..1319c466ee87 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -262,7 +262,7 @@ config GPIO_BY_PINCTRL
 	  create a simple GPIO device based on the pin control interface
 	  without doing anything custom.
 
-	  This driver is used to access GPIOs over the ARM SCMI protocol.
+	  This driver is used to access GPIOs over the SCMI protocol.
 
 config GPIO_CADENCE
 	tristate "Cadence GPIO support"
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 2bfbcc033d59..cda0aedb36ca 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -401,7 +401,7 @@ config SENSORS_ARCTIC_FAN_CONTROLLER
 	  will be called arctic_fan_controller.
 
 config SENSORS_ARM_SCMI
-	tristate "ARM SCMI Sensors"
+	tristate "SCMI Sensors"
 	depends on ARM_SCMI_PROTOCOL
 	depends on THERMAL || !THERMAL_OF
 	help
diff --git a/drivers/iio/common/scmi_sensors/Kconfig b/drivers/iio/common/scmi_sensors/Kconfig
index 67e084cbb1ab..5c152d9d30d2 100644
--- a/drivers/iio/common/scmi_sensors/Kconfig
+++ b/drivers/iio/common/scmi_sensors/Kconfig
@@ -12,7 +12,7 @@ config IIO_SCMI
         select IIO_KFIFO_BUF
 	help
           Say yes here to build support for IIO SCMI Driver.
-          This provides ARM SCMI Protocol based IIO device.
+          This provides SCMI Protocol based IIO device.
           This driver provides support for accelerometer and gyroscope
           sensors available on SCMI based platforms.
 endmenu
diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index 1bb36ca477b7..e6fb0699c0a2 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -595,5 +595,5 @@ module_scmi_driver(scmi_pinctrl_driver);
 
 MODULE_AUTHOR("Oleksii Moisieiev <oleksii_moisieiev@epam.com>");
 MODULE_AUTHOR("Peng Fan <peng.fan@nxp.com>");
-MODULE_DESCRIPTION("ARM SCMI pin controller driver");
+MODULE_DESCRIPTION("SCMI pin controller driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/pmdomain/arm/scmi_perf_domain.c b/drivers/pmdomain/arm/scmi_perf_domain.c
index 3693423459c9..00bae4e04aaa 100644
--- a/drivers/pmdomain/arm/scmi_perf_domain.c
+++ b/drivers/pmdomain/arm/scmi_perf_domain.c
@@ -184,5 +184,5 @@ static struct scmi_driver scmi_perf_domain_driver = {
 module_scmi_driver(scmi_perf_domain_driver);
 
 MODULE_AUTHOR("Ulf Hansson <ulf.hansson@linaro.org>");
-MODULE_DESCRIPTION("ARM SCMI perf domain driver");
+MODULE_DESCRIPTION("SCMI perf domain driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/pmdomain/arm/scmi_pm_domain.c b/drivers/pmdomain/arm/scmi_pm_domain.c
index 3d73aef21d2f..64ac7566d943 100644
--- a/drivers/pmdomain/arm/scmi_pm_domain.c
+++ b/drivers/pmdomain/arm/scmi_pm_domain.c
@@ -168,5 +168,5 @@ static struct scmi_driver scmi_power_domain_driver = {
 module_scmi_driver(scmi_power_domain_driver);
 
 MODULE_AUTHOR("Sudeep Holla <sudeep.holla@arm.com>");
-MODULE_DESCRIPTION("ARM SCMI power domain driver");
+MODULE_DESCRIPTION("SCMI power domain driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/powercap/Kconfig b/drivers/powercap/Kconfig
index 03c4c796d993..d3eda4a70978 100644
--- a/drivers/powercap/Kconfig
+++ b/drivers/powercap/Kconfig
@@ -61,7 +61,7 @@ config IDLE_INJECT
 	  on a per CPU basis.
 
 config ARM_SCMI_POWERCAP
-	tristate "ARM SCMI Powercap driver"
+	tristate "SCMI Powercap driver"
 	depends on ARM_SCMI_PROTOCOL
 	help
 	  This enables support for the ARM Powercap based on ARM SCMI
@@ -71,7 +71,7 @@ config ARM_SCMI_POWERCAP
 	  and monitored against the SCMI Powercap domains advertised as
 	  available by the SCMI platform firmware.
 
-	  When compiled as module it will be called arm_scmi_powercap.ko.
+	  When compiled as module it will be called scmi_powercap.ko.
 
 config DTPM
 	bool "Power capping for Dynamic Thermal Power Management (EXPERIMENTAL)"
diff --git a/drivers/powercap/Makefile b/drivers/powercap/Makefile
index 5ab0dce565b9..b0d5d1e91d7e 100644
--- a/drivers/powercap/Makefile
+++ b/drivers/powercap/Makefile
@@ -7,4 +7,4 @@ obj-$(CONFIG_INTEL_RAPL_CORE) += intel_rapl_common.o
 obj-$(CONFIG_INTEL_RAPL) += intel_rapl_msr.o
 obj-$(CONFIG_INTEL_RAPL_TPMI) += intel_rapl_tpmi.o
 obj-$(CONFIG_IDLE_INJECT) += idle_inject.o
-obj-$(CONFIG_ARM_SCMI_POWERCAP) += arm_scmi_powercap.o
+obj-$(CONFIG_ARM_SCMI_POWERCAP) += scmi_powercap.o
diff --git a/drivers/powercap/arm_scmi_powercap.c b/drivers/powercap/scmi_powercap.c
similarity index 99%
rename from drivers/powercap/arm_scmi_powercap.c
rename to drivers/powercap/scmi_powercap.c
index ab66e9a3b1e2..24eef8045e80 100644
--- a/drivers/powercap/arm_scmi_powercap.c
+++ b/drivers/powercap/scmi_powercap.c
@@ -546,5 +546,5 @@ static void __exit scmi_powercap_exit(void)
 module_exit(scmi_powercap_exit);
 
 MODULE_AUTHOR("Cristian Marussi <cristian.marussi@arm.com>");
-MODULE_DESCRIPTION("ARM SCMI Powercap driver");
+MODULE_DESCRIPTION("SCMI Powercap driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/regulator/scmi-regulator.c b/drivers/regulator/scmi-regulator.c
index c005e65ba0ec..ffceaa66e257 100644
--- a/drivers/regulator/scmi-regulator.c
+++ b/drivers/regulator/scmi-regulator.c
@@ -417,5 +417,5 @@ static struct scmi_driver scmi_drv = {
 module_scmi_driver(scmi_drv);
 
 MODULE_AUTHOR("Cristian Marussi <cristian.marussi@arm.com>");
-MODULE_DESCRIPTION("ARM SCMI regulator driver");
+MODULE_DESCRIPTION("SCMI regulator driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index d009eb0849a3..f09d2107d158 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -264,7 +264,7 @@ config RESET_RZV2H_USB2PHY
 	  (and similar SoCs).
 
 config RESET_SCMI
-	tristate "Reset driver controlled via ARM SCMI interface"
+	tristate "Reset driver controlled via SCMI interface"
 	depends on ARM_SCMI_PROTOCOL || COMPILE_TEST
 	default ARM_SCMI_PROTOCOL
 	help
diff --git a/drivers/reset/reset-scmi.c b/drivers/reset/reset-scmi.c
index 4335811e0cfa..a4f95a7fff87 100644
--- a/drivers/reset/reset-scmi.c
+++ b/drivers/reset/reset-scmi.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * ARM System Control and Management Interface (ARM SCMI) reset driver
+ * System Control and Management Interface (SCMI) reset driver
  *
  * Copyright (C) 2019-2021 ARM Ltd.
  */
@@ -128,5 +128,5 @@ static struct scmi_driver scmi_reset_driver = {
 module_scmi_driver(scmi_reset_driver);
 
 MODULE_AUTHOR("Sudeep Holla <sudeep.holla@arm.com>");
-MODULE_DESCRIPTION("ARM SCMI reset controller driver");
+MODULE_DESCRIPTION("SCMI reset controller driver");
 MODULE_LICENSE("GPL v2");
---
base-commit: 0e35b9b6ec0ffcc5e23cbdec09f5c622ad532b53
branch: xnext/scmi

-- 
2.43.0


