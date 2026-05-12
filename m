Return-Path: <linux-gpio+bounces-36677-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4PI2N5M7A2oL2AEAu9opvQ
	(envelope-from <linux-gpio+bounces-36677-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 16:39:15 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F043522B88
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 16:39:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6EE223054537
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 14:36:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E4D4394EA2;
	Tue, 12 May 2026 14:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="pi3CQxHH";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="pi3CQxHH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11020072.outbound.protection.outlook.com [52.101.84.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D12783B5F62;
	Tue, 12 May 2026 14:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.72
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778596559; cv=fail; b=Mu6y6Edol9PZJOf2rDnwgpyOR7bX7J3waHF1E+fElhYXdJ+TMlW2Ve4vLj52ll5ugjfm+ehO5Itecb9qBbBw+E18Y5FeKrDgj4b6AVuZrKrDpZw+9NJZCHyKlLo6cn5OZwrrA8I8C3NPYuhMJT7bV+MWZwNp/NajEdYChetBTq4=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778596559; c=relaxed/simple;
	bh=t9GeHQIUP+FmLWAdVDgKPyDBfvbmgFonD2kxfM4H+YU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=H/4HzZbxbXKG6Ggp1U1q2hMQjYaSYuMGkUwSpGtJ7yzATmgXsOBmRJGU0CuRIkYW4sVoDZcwi6pYPmF9HuS44e5WjFfAhFhuePCeT4gTk07ktYSZT3utMVVA8WqI00DV8h85HW0kXeyWy/5+H+7Wbg/h5qUWSxDPqdSms7fG2vg=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=pi3CQxHH; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=pi3CQxHH; arc=fail smtp.client-ip=52.101.84.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=BjWzYpN5/41mleCA6NDmDUwLzur29ZlIomh2mXPDh9HULV6qQ9H4/gwVkY4Ny+HZFh1OXE5r3b36OSPcf/D66XznDJzg/FnhZipDUtnsYQWrFvOfCUXyUr7NKFQdePAdoz86g5CwrgklFD1drrNjV/qkGjpHKuXGT7pl9HTlMsyiCtOXnw4R5wvlrue4e1y949bdKzHUSUSaVGHWqbsvsAEoMHErU5wb3z2T7dw3+F+ijBiNTEDZ3dyK6EuRpi/ZKZjSNXFrJbJoLsaSD32eVBgveYdt08tbVStOO6n8FfIG2vF7/0eDjMO7GuZ4COB+uiTOCi00lS06Ok+7+O3FDg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t9GeHQIUP+FmLWAdVDgKPyDBfvbmgFonD2kxfM4H+YU=;
 b=Pd/Nemvsjd2x95qJrK0nkkeNi7xDKkeKqHC6BRVJLTksQU8Mbhmtn7XJrIKM7RdFIOkJxZ1MuzPZyE8TrBUmluTjaPxbDdR3JWxEBF7DsdA2rpOkBJT4sV91umNTiOtWQHOvvXuC1MFyAzgLr7aP+tj2kRJPP1tPqALckh+vuKlV8NvoXayK6fQbyFrDCgaaCshIAbT0AO5HFCnG2cWqtpusyCNemifrMcJ0sHRvxCqgyTVbeMq+VniztbFoRvF9Ty4qo+yXvRv2BfVmlCrkyhtuIlh5jkNijncxLenVuebLvCU6u5g79Qb8UhkGGwQIDHpwKmXEnEcXacElNninxg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=axentia.se smtp.mailfrom=solid-run.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=solid-run.com] dkim=[1,1,header.d=solid-run.com]
 dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t9GeHQIUP+FmLWAdVDgKPyDBfvbmgFonD2kxfM4H+YU=;
 b=pi3CQxHHtnUhPZOCl+mZNw7E5AOybMiCLT/6FLMAQ5kPMDQBXK+qTUdaOxnPRjxrE0NiYqBb1BWsM6IMk2Wh0FHNTjmzOlDswO5tAYhjM8wPzhItS8Hc98h0qUKADnEn5uDMlJT8ZpCOziOlCXu0d5rj9X+7Yb93NBYeQJYe7tQ0pAeZMHMANyxDf3jN3k0g9FkqsWEnTonnwNZIbbTkV3+F1NqGiaB6dYeqdddcbVsCJsqvsoWthtUwUmYXWrTaAlYjoCgbtyGSmmkY+Fgeq4ZYeU+Zqav5IWJysVZ3huN85lwgDS1G744n1mlcoL6EfJYDmwMa3TjBy/tBUvEUqg==
Received: from DUZPR01CA0140.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bd::23) by AM7PR04MB6885.eurprd04.prod.outlook.com
 (2603:10a6:20b:10d::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 14:35:54 +0000
Received: from DU2PEPF00028D0A.eurprd03.prod.outlook.com
 (2603:10a6:10:4bd:cafe::47) by DUZPR01CA0140.outlook.office365.com
 (2603:10a6:10:4bd::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.11 via Frontend Transport; Tue,
 12 May 2026 14:35:54 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DU2PEPF00028D0A.mail.protection.outlook.com (10.167.242.170) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.8
 via Frontend Transport; Tue, 12 May 2026 14:35:54 +0000
Received: from emails-5971197-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-220.eu-west-1.compute.internal [10.20.5.220])
	by mta-outgoing-dlp-305-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 464B57FE89;
	Tue, 12 May 2026 14:35:54 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Tue May 12 14:35:47 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fE0ZGnkN6GpdmRGJ8H5Li9WKalm701SN8S2AlFH3zZkDNe3ioJRTZXxkfVQHbRvfWjzZgB1dLAmRjlw80zCNny0rKrN+9/z42PlfIpzaeCMCecHjncraI6VP76Jf/x1uqShxjuNxgKPm0WW4xXXswcR4H4bHKHXRsyLxYEllMb9VUonrSDcYY47G7jzMcoporPI/VkhBkiQqqeZkqHzGaa4DYaafgZ+vHVd17pknqBRq8x6sDRZ7s3RUwgpuP6D0uNvx1yZkHV3oqVqVCGcNNAR0zD0vzwHie3oDsqDqwRnW+CkyKhQteP9O+e0u+t1VkzVLU5TmUaaZkMWe7HfNxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t9GeHQIUP+FmLWAdVDgKPyDBfvbmgFonD2kxfM4H+YU=;
 b=HOaPkRhqI5SppxCON8WuI4I7PTIk6UZZUUxBGlo/KsTEu6uDt47z71yjzYM7kxyQ7AL+6LB2SfTMLzZHHrKujplS61fbVB5OTsa6kmuxUyqU0g7OBa1LzbY/kJAMaVyNIt8Xsontz17m3RvAZ8vWlaW7vcnP5olRxtL6P5w2ZY/2DYXwEli8Jyq2RPSJzMx1gockXJzo+EMY3YVbP6W0WMcQjvWbS13EHauhQtRF38E1qym+S6/JtvD0FyLGTaeca7FgOLY/MxK9HYEb+MPc74hyADNwTyCvGtxJF9alHpwouSLLvEow0m144tmyXYz0Ma61FzZLL8G4qRfqcFIcVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t9GeHQIUP+FmLWAdVDgKPyDBfvbmgFonD2kxfM4H+YU=;
 b=pi3CQxHHtnUhPZOCl+mZNw7E5AOybMiCLT/6FLMAQ5kPMDQBXK+qTUdaOxnPRjxrE0NiYqBb1BWsM6IMk2Wh0FHNTjmzOlDswO5tAYhjM8wPzhItS8Hc98h0qUKADnEn5uDMlJT8ZpCOziOlCXu0d5rj9X+7Yb93NBYeQJYe7tQ0pAeZMHMANyxDf3jN3k0g9FkqsWEnTonnwNZIbbTkV3+F1NqGiaB6dYeqdddcbVsCJsqvsoWthtUwUmYXWrTaAlYjoCgbtyGSmmkY+Fgeq4ZYeU+Zqav5IWJysVZ3huN85lwgDS1G744n1mlcoL6EfJYDmwMa3TjBy/tBUvEUqg==
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 (2603:10a6:150:313::24) by DB9PR04MB9842.eurprd04.prod.outlook.com
 (2603:10a6:10:4ee::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 14:35:44 +0000
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b]) by GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b%7]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 14:35:44 +0000
From: Josua Mayer <josua@solid-run.com>
To: Frank Li <Frank.Li@nxp.com>, "linusw@kernel.org" <linusw@kernel.org>,
	Peter Rosin <peda@axentia.se>, Kees Cook <kees@kernel.org>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>, Thorsten Blum <thorsten.blum@linux.dev>,
	open list <linux-kernel@vger.kernel.org>
CC: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>, kernel test robot
	<lkp@intel.com>
Subject: Re: [PATCH ib-mux-pinctrl 1/1] mux: describe np parameter in
 __devm_mux_state_get()
Thread-Topic: [PATCH ib-mux-pinctrl 1/1] mux: describe np parameter in
 __devm_mux_state_get()
Thread-Index: AQHc3jVK7PoCsdmV2kKGaFoScJjbf7YKfM6A
Date: Tue, 12 May 2026 14:35:43 +0000
Message-ID: <dfad5a06-3445-4d2d-9b83-9f9ad6c691e3@solid-run.com>
References: <20260507152117.240612-1-Frank.Li@nxp.com>
In-Reply-To: <20260507152117.240612-1-Frank.Li@nxp.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
x-ms-traffictypediagnostic:
	GVXPR04MB12057:EE_|DB9PR04MB9842:EE_|DU2PEPF00028D0A:EE_|AM7PR04MB6885:EE_
X-MS-Office365-Filtering-Correlation-Id: 354adf35-47b9-467d-a698-08deb033c5fa
x-cloud-sec-av-info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700021|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 ldGDyk71OniRjHpt3LvcIcqj6GCumO6HWC2PLoajds1rQ1HtRp9+opR/CkKROZr18OA3hSsHjoht+unK4bCe/l3SC6dNb3v1uxi9/sDiC0putiAjDuB4SqSQEbWDDUbesHIkYrODHqEto2n1hOxbHhxoxnkpYkwjXFqGTvaasLQ7ympagWVjlzoK0HgXCPv98ZiqxBEobnoaSEnFSdhfF4otjhGhuQwldj10UKaDUBlyk+cHAjSlitixNkWjJMWo5SvbvfOW3tMapygrk4KkYIhGb/sQs1sY/bB1ESkn6rEn9Yg4GP3hC1kaksp4jmOkVPdWAo537CSTBIw6JIxB7d4b/bB1mHe6P7q2xh+Fha4gg2dgs8v2Bn0FqVsAUmNoCCDFwdf8YLg3cUXupc+Tp3Xe5hC8+JCN7DluvdexQF1e6juB/plg3YQu0WwTxbfDlNGBmsqxd8kK6oaOsRQr2kK06/CXIv76CjqV35GMS/itQCb56C+Xg63+LbXd/yGgE9a/ATNx9FVYJUti9/DDiY9puGZivUqlNIP4NjXL6aQg8JbA87/AeeQzjrlGkgkXWCewRAFkAFMnBcMuGwe+pWGsLiJhLlnJzF0DNelGf+b/9tdQEh0IKA03fut8OJWCJwvKCyx1yaKctt6vKEyF3yTiFpIwyzrQbRtZbbaRsBMsNwh+q7y+onImDxe8E1lN7qxA4nYCj2qxaIHup/1rPTYfPIiYRaurFpdRsQNl2MdMjhONQclTf9y8f+5sR59w
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12057.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="utf-8"
Content-ID: <C55F456B33EBA046B4C97EF57FEC6236@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 MaADrXO9yqvXaMrm1gfXeNpzsxGgUIXF9dV0HUXEJtBDTP6FiPyIMqkf+KUXsmsn+EyKdPCYrzflL1kMPJ1eg1A4QCcglkcipx2455owBx3d6LLgBJ9DFefDQ6gtooSWr9VPq+RqqjGRTqcneddnjfS4tNLfWdhJwR21xxzr2p9ygpIhg2sfDUOt0MhA+iOqSMe7yj28qgysyouXVn1AjEi5lvk16catptVMdRNTBS5Zv65YXv9+U91bBJvjSC4khIr774Mb4UCLpf3eVqHY7UHBJzFRCOw4gYhDxwKyM/icQ9m4OgmE4fWCJcM+3Eg/MkAT+PrV2JcuU0aFk1Pbsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9842
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2-7.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: d3eaaf8802244663908518e745ced4c6:solidrun,office365_emails,sent,inline:52898e410c9135e74123992a16484859
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D0A.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4782e429-3c93-4090-cf56-08deb033bfb9
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|14060799003|7416014|376014|35042699022|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	N8QucHi1IzHkCisc5bm90EG3cY93Kg10O+A9wA5fFf7xFNXxu9cIf8uxizo4FzrMwvIy9GJr9RpwjfMdFJvMmJKYlrRN/SfNmo8hU+GdiYBGj6UQYXefAy+dk99oy/4TxJwZM54tOF+xOWtLohadt9sJoW4VhN4AM/lLUJzIhOuvgOtruluyN3Gc1Sv7ohdVu0k67hN03+U85KsslQOtdbkp0yIAN/3RJ3Jdf5mRy2FppQ/ckETpj1tXIJ9F8GJViRJhGQ+3wMsJo6nK5wQHc8vy4gc8N24neSOLJGvqNIaBbdXKqQQzXtvwSDb3uhIobcqvoqmSWz7W3jYekA8L/TkJLNiCxokGeLoaoUGuJaFHF56DkcOuNuZ9M6Rxm7XNziQH1oBUDp7j4r7BTH5bS3fbelwiyCG4YDYllkwZ+RzvgBYr4evSHAZOb4lUon7GhAtQu2tXnqvMTxC0SNVhdvVV2Y6U4lNswF8bDCq6O8mQxX2JluTqpkeO/8Qyf8ByIPP2lSKYKXQ3m0pPdQDplXi/KMJkJtvKGoMa4vt1H5xYHKmMkfh0kZ5O3Ut75228Zr2B2cav4B4jk1SbvMPcNEYNy99/mIYNHH016nWTc+sX+Y7k9w8q2Hg6A7lrPl3VY/0sbYMRuv9lnTEKnJnM2mBSI07KWxfnUmH8kfXxdk6zM7+eHjsJ/jwJTMqW4Cw8ey06VUnU9+mIfHqHhLpbIs9BWeaWYbp5N8FThVGw5io=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(14060799003)(7416014)(376014)(35042699022)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	fIqGsFM5vYPDt3Gtic5jiYWM/++ySHUvEmDrOY7uwJMejEEKWpALriV1D1nn3Uvt2sg48UCi4N2Xyu8trdUZZRpYIXJzAVliWujQWOmTJJNzgkRsnSS0Ju5xvgdMIHbTonBx/4PP3OsLYHbTiJpZJ0A17XNUpNjChfiSngBfIgZelofAI9NctETIAwMo4QNrXd2tUrdOMpo/mPymBWalBAR2roCi0OMG90sde4B5rum4ODEQsh364BNgaGpF/2OcUPWFOAp+PjBMqV+kw7YT1ZpCjrkqpyk1B5P3ywCkqvetPMkRkyM4RyIJ1b2Hc5ukYT0w3KIPbT9QWLdlhI10QK4k0Q5gn+rPANGaLBL5AFDFXecHjhN2kg8VY51o3RedbcF4o8xk1UDVQCgazkbjKMOUCZe1lVJyhGbmAv21m5YOFg6Z+ISKeMG6oBIUu/Z9
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 14:35:54.4109
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 354adf35-47b9-467d-a698-08deb033c5fa
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D0A.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6885
X-Rspamd-Queue-Id: 9F043522B88
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=3];
	DMARC_POLICY_ALLOW(-0.50)[solid-run.com,reject];
	R_DKIM_ALLOW(-0.20)[solid-run.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36677-lists,linux-gpio=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,intel.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[josua@solid-run.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[solid-run.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	RCPT_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

SGkgRnJhbmssDQoNCkFtIDA3LjA1LjI2IHVtIDE3OjIxIHNjaHJpZWIgRnJhbmsgTGk6DQo+IEFk
ZCBhIGRlc2NyaXB0aW9uIGZvciB0aGUgJ25wJyBwYXJhbWV0ZXIgb2YgX19kZXZtX211eF9zdGF0
ZV9nZXQoKSB0byBmaXgNCj4gYnVpbGQgd2FybmluZy4NCj4NCj4gUmVwb3J0ZWQtYnk6IGtlcm5l
bCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPg0KPiBDbG9zZXM6IGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL29lLWtidWlsZC1hbGwvMjAyNjA1MDYxNTAyLnVsbExqbXROLWxrcEBpbnRlbC5jb20v
DQo+IFNpZ25lZC1vZmYtYnk6IEZyYW5rIExpIDxGcmFuay5MaUBueHAuY29tPg0KPiAtLS0NCj4g
IGRyaXZlcnMvbXV4L2NvcmUuYyB8IDEgKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspDQo+DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL211eC9jb3JlLmMgYi9kcml2ZXJzL211eC9j
b3JlLmMNCj4gaW5kZXggMmYwMWFjZmNjZjQ3Yi4uNTA4M2UzZDE5NjA2YiAxMDA2NDQNCj4gLS0t
IGEvZHJpdmVycy9tdXgvY29yZS5jDQo+ICsrKyBiL2RyaXZlcnMvbXV4L2NvcmUuYw0KPiBAQCAt
NzcxLDYgKzc3MSw3IEBAIHN0YXRpYyB2b2lkIGRldm1fbXV4X3N0YXRlX3JlbGVhc2Uoc3RydWN0
IGRldmljZSAqZGV2LCB2b2lkICpyZXMpDQo+ICAgKiBAZGV2OiBUaGUgZGV2aWNlIHRoYXQgbmVl
ZHMgYSBtdXgtc3RhdGUuDQo+ICAgKiBAbXV4X25hbWU6IFRoZSBuYW1lIGlkZW50aWZ5aW5nIHRo
ZSBtdXgtc3RhdGUuDQo+ICAgKiBAb3B0aW9uYWw6IFdoZXRoZXIgdG8gcmV0dXJuIE5VTEwgYW5k
IHNpbGVuY2UgZXJyb3JzIHdoZW4gbXV4IGRvZXNuJ3QgZXhpc3QuDQo+ICsgKiBAbnA6IFRoZSBk
ZXZpY2Ugbm9kZXMsIHVzZSBkZXYtPm9mX25vZGUgaWYgaXQgaXMgTlVMTC4NCm1pbm9yIG5pdDog
U2luZ3VsYXIgZGV2aWNlICJub2RlIi4NCj4gICAqIEBpbml0OiBPcHRpb25hbCBmdW5jdGlvbiBw
b2ludGVyIGZvciBtdXgtc3RhdGUgb2JqZWN0IGluaXRpYWxpc2F0aW9uLg0KPiAgICogQGV4aXQ6
IE9wdGlvbmFsIGZ1bmN0aW9uIHBvaW50ZXIgZm9yIG11eC1zdGF0ZSBvYmplY3QgY2xlYW51cCBv
biByZWxlYXNlLg0KPiAgICoNCj4gLS0NCj4gMi40My4wDQo+DQpBY2tlZC1ieTogSm9zdWEgTWF5
ZXIgPGpvc3VhQHNvbGlkLXJ1bi5jb20+DQoNCkkgdGhpbmsgcGF0Y2hlcyB0byBtdXgtY29yZSBh
bG9uZSBlbmQgdXAgaW4gc29tZSBsb3ctYXR0ZW50aW9uIChuby0pbWFpbnRhaW5lciBiaW4sDQp3
aGVuIHRoZXkgZG9uJ3QgZ28gdmlhIG90aGVyIHRyZWVzIChtbWMsIHBpbmN0cmwsIHBoeSwgLi4u
KS4NClNlZSBhbHNvOg0KDQpodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjYwNDIzLW11eC1z
bWF0Y2gtZml4dXAtdjEtMS05ZjQwMzAxNGUwZDdAc29saWQtcnVuLmNvbQ0KDQo=

