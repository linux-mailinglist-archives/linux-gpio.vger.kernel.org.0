Return-Path: <linux-gpio+bounces-17630-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E2187A614A2
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Mar 2025 16:18:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A725170425
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Mar 2025 15:18:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8C4E1FF5E9;
	Fri, 14 Mar 2025 15:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=topic.nl header.i=@topic.nl header.b="rPwg5bRh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11021079.outbound.protection.outlook.com [52.101.65.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0FE94C92;
	Fri, 14 Mar 2025 15:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741965501; cv=fail; b=JA60pjmJYOlrBglXHnoSMnCcAadj6QRD7KujU65EiSM6cxoYF5Aohp0qBLK5W0fhJkQXRQXZQHo6qRnmHf62f+9ic0cvyePAwODSWtmJT1eMZaXYDRs0JdVbPl3bXMjW3oBo5j2m5gHNOPE3vvbeKj+J+23qCdW0B8H06jeUqqc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741965501; c=relaxed/simple;
	bh=9c/5rlfWRdLaZbg+HjX1ZO6k1fV1Vf1Kxlccsi99CR4=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version:
	 References; b=eGn7mfaAU13FRJznDvDFyQLiHlZJkjjfdLO2czf/YDpKwG4saGon2nLXf+MAD9ifVSFCaBrp8vI3mVgnu42qyqiYdJongQEtjVa/ZXFTiA6FftG3fJr2rJojW952SRmnnl1HDKzNTLczeHsWWhyxT0G53cddIkYhHsHSYPyACts=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=topic.nl; spf=pass smtp.mailfrom=topic.nl; dkim=pass (2048-bit key) header.d=topic.nl header.i=@topic.nl header.b=rPwg5bRh; arc=fail smtp.client-ip=52.101.65.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=topic.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=topic.nl
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KlRxSunsroRT4AgEeCNZ6ACsun7+Bs2uEgQFlr7vdELn/bedXUwrYYW8OWumi33darZzZFNKeyHGTvbV7YMlHF15o16tDBao4RizqdAgo3aplUx3df0p+nd2bD7Am/JN46pkL0AfajFgzHsF84JYivu+t4mzzCpUvyOWt6GKEN3aGNaoClNPt3gCl9EZbgR7QeInkfPEQlWXWXTzVy/YxXPfTCHcS8lYOnOBWTD9F6W/0o96crUBLNNE1YM/l19O0sm11/rxNxPsHSpLDX93Tbk9rPu9Mc8Arh43cp7hxTPwePosBSZYRHeYBFLOu9gH4EBqb8VXZUlIwqrvxHKw4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+eRnkDBu0LfjZEWgU6e4GTKNel+BEXGROEYsBBcldUc=;
 b=TD60Ddu113Up8D5zJhmuZNAVRRF/HpQXR3SjUNnY+kj9fJe/45OW2mXdQvpwCyk2ZeHfuuPS1Ei9CKyc6dq9Ng4WxbXgSKGqzx572ZRiUtbzwIxzUTuuMPwq1v/LYcnkcJB5j1o+8uiUyZ6+NfQxc1BO/NvTog0dLnlxyz+bqRWscAAI+d/Kvwzr6b74Xg7HMye+Af7+Ztq7uUopjyakEB3KOgJYPmob3n+ZCEFA5uSG2gq15IS8t7ZZX3d+uiK3z3NIEohyR54wdXw230JRV7l5iTuFq6aqhX58X032BYW3nQdCl4bwbRzvFbdwQMTkeQdFgl/eWsuU0FwVPzCmLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 13.93.42.39) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=topic.nl;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=topic.nl;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+eRnkDBu0LfjZEWgU6e4GTKNel+BEXGROEYsBBcldUc=;
 b=rPwg5bRhXYxsnemC0XVQFTVoXW77ZiEElvdKoO7ToDrEUwgVNsi1wjwydWfje2Y3Oc5/TqT49jLi7n1P5HgWKi9e3setxtDGGfwzDsWt11OmJV8LGMZCzEdMl6ymvw8of8HOi1b+D+qt17mvbAMolynr1HVlUtXCtXaf6d0RAD48KauNjPwuqpoSZkfEX111OrUjQrBoGDHHhlJvO1alJg3AnHhZUAAV978Qln2ZtwbMqPUVy44iOU23A6FV+fHLn5LlSVZlySfxIA4BpprKrl8/YTUr+o4Kyirtr4MAcYfZXF+twaug3lElZ1Fq4g6959MzLF3dGcvp0ONWpzcSTQ==
Received: from AS4PR09CA0019.eurprd09.prod.outlook.com (2603:10a6:20b:5d4::10)
 by AS8PR04MB8261.eurprd04.prod.outlook.com (2603:10a6:20b:3b1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.28; Fri, 14 Mar
 2025 15:18:14 +0000
Received: from AM1PEPF000252E0.eurprd07.prod.outlook.com
 (2603:10a6:20b:5d4:cafe::ad) by AS4PR09CA0019.outlook.office365.com
 (2603:10a6:20b:5d4::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.26 via Frontend Transport; Fri,
 14 Mar 2025 15:18:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 13.93.42.39)
 smtp.mailfrom=topic.nl; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 13.93.42.39 as permitted sender) receiver=protection.outlook.com;
 client-ip=13.93.42.39; helo=westeu12-emailsignatures-cloud.codetwo.com; pr=C
Received: from westeu12-emailsignatures-cloud.codetwo.com (13.93.42.39) by
 AM1PEPF000252E0.mail.protection.outlook.com (10.167.16.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.20 via Frontend Transport; Fri, 14 Mar 2025 15:18:14 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com (40.93.81.78) by westeu12-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Fri, 14 Mar 2025 15:18:13 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from AS8PR04MB8644.eurprd04.prod.outlook.com (2603:10a6:20b:42b::12)
 by GV1PR04MB10523.eurprd04.prod.outlook.com (2603:10a6:150:1d4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.28; Fri, 14 Mar
 2025 15:18:10 +0000
Received: from AS8PR04MB8644.eurprd04.prod.outlook.com
 ([fe80::e86d:f110:534e:480a]) by AS8PR04MB8644.eurprd04.prod.outlook.com
 ([fe80::e86d:f110:534e:480a%5]) with mapi id 15.20.8511.026; Fri, 14 Mar 2025
 15:18:10 +0000
From: Mike Looijmans <mike.looijmans@topic.nl>
To: linux-gpio@vger.kernel.org
CC: Mike Looijmans <mike.looijmans@topic.nl>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl-mcp23s08: Reset all pins to input at probe
Date: Fri, 14 Mar 2025 16:17:45 +0100
Message-ID: <20250314151803.28903-1-mike.looijmans@topic.nl>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: MA3P292CA0043.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:46::17) To AS8PR04MB8644.eurprd04.prod.outlook.com
 (2603:10a6:20b:42b::12)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AS8PR04MB8644:EE_|GV1PR04MB10523:EE_|AM1PEPF000252E0:EE_|AS8PR04MB8261:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ba26e7f-f1cf-4be9-7343-08dd630b7096
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?HM1/gm5p/rAHs/5yRDdWH4qie+LlQm/X0lbv+XQTodPogAEmRfj38ms/qDWQ?=
 =?us-ascii?Q?t/mi2wkPLBIiE0uGD2MhgMs2xSLvdO1p0iWXsWgHBYOz91iW7P7U5S+Kwxj8?=
 =?us-ascii?Q?z8fwfKPUHjyggQaauC9VPeS6UowrnQhDPE0/f5f++qx4PcDEYblZ4dB6WbW+?=
 =?us-ascii?Q?h+cdFzVeCOl8p9GDEEd2aiOin9Ip9XtINfmuCBtidulbwE9q/MP6gLiCFeUc?=
 =?us-ascii?Q?FYK5UyW0eh4huuQuwTwG/byotLxj/DhQUGwrkVSZIIYmh7asJ2yAhdZgjJqi?=
 =?us-ascii?Q?jASzuKc8AbdCVpd7id6aTbCTFBGSFlLo9r3P8+INLTy3hVsCacgjihyegoEZ?=
 =?us-ascii?Q?MAg++5ib2NwyWpgRahtbbtd/Cvyo3hz3gQpkKonzY4P8hufUt4P2i1zt+K6m?=
 =?us-ascii?Q?JVL2ll2xzp6IU8ni7Pna7Z/OP2Nua7hVq/WPHUdNjWkClH5R8X0IRV+GzPoJ?=
 =?us-ascii?Q?IoUnyl6GCMxOpsoZGO4BzU7LJHSc/PY3DpFR6EsdgyrV3F5pFnpUK4I5+cYH?=
 =?us-ascii?Q?Yv6f98LTz+E6TMNJBU8iVbJeXrZapwpKG0k8HXkVtO9KMFOGWN9CFqjti262?=
 =?us-ascii?Q?Ui0Wa27oGilMIIn8C8Xo5VLQKn6k2rDisrwoGj3ZQkgRTLhhNCvkUMuH12mR?=
 =?us-ascii?Q?J4OeYqCLInRHuFhzOyeW87CLsNh9m7OEda6AT/5+KUlH7gzm2N0mTvvPsqTU?=
 =?us-ascii?Q?2xu7c+N8sTyrhdJy7RbHE3zQavgq23GUWYLNif7INA5qrK963qvmJamKuZh1?=
 =?us-ascii?Q?MEPx9rnKZgeigGnvfMTooMH4GbpMwQZYoF2q/txZh31zWIsXDMSldFQVm1ZO?=
 =?us-ascii?Q?sQ8U0SEnzhwZ+xqYhkrREXv9hYEceehBdGoYa9mgtDe1MaR0V7tO4kBc2+Iz?=
 =?us-ascii?Q?r+HRAqNHRHYbB4bN8z0XVvPTjBwDAb2jiq5P/SLq6t3ua6vxEJF2yOUF7Pmw?=
 =?us-ascii?Q?XB09eg/x9Z+p7WHC7gs54orLyiMsnfvi8u7PTTQonNPcWkgauX+YAWd7KLt4?=
 =?us-ascii?Q?9giaNa9hjpBw2jsobFZR0RS7pRkKj4o3hDGSF0UCmokaWhhbfpESAU/A76C9?=
 =?us-ascii?Q?p8m/ser2jBYt3iTIt/8KDUtqjBUW612p342Q6sQDy7zwElqp0lZn7CFqzuzX?=
 =?us-ascii?Q?JhLxr+KvFNqjM9BINCyWTFA6zrcpLz46/4Qbh0ByyTd5UfQDVcmUXt8Uv+L7?=
 =?us-ascii?Q?AoW0iNzltVi5DO6YAJbhinFPL3Jw3Cq+F+9GolHh0hyD7yZ5UNFxHDclBufZ?=
 =?us-ascii?Q?mFKQIkz8ECyh1hV/SUWS1FLsVNNNG1y2NpBQYGwXYT5vXESkutRE6T4DclcT?=
 =?us-ascii?Q?ecwjz56QGkKcq+6ZT98Ob6kMsUUobEJafSmXYJVkLcqJq4s4VKvVz6wijwP7?=
 =?us-ascii?Q?HJKmI7UbSYkqPsS/W7s+sDt4drxRXH8g8D2SH/K49BkzS8wd4hgH2ErkGEjM?=
 =?us-ascii?Q?pAUL14qnrCiSQBVDjwetOWY7RGmC1DUp?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8644.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10523
X-CodeTwo-MessageID: 001ab236-add3-49c7-897d-dc7e39302ec7.20250314151813@westeu12-emailsignatures-cloud.codetwo.com
References:
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.8cb9c8b1-3ce2-4a2a-93ba-a38ee66a1643@emailsignatures365.codetwo.com>
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM1PEPF000252E0.eurprd07.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2844c620-a5f5-4a28-4fd0-08dd630b6e0a
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|14060799003|35042699022|36860700013|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Mwz8jq3giWNTkfJhviBUkfIBeDIxf8WBwquY+GCXyl7WHokAJJNAlF0xEF3/?=
 =?us-ascii?Q?oBaUVKbajWvJL9Pyksvl+1B2BQFaziLUtNRdRUYsED99WOfW4AkeS9BHfqLn?=
 =?us-ascii?Q?KLOK/9cy5YYEhDJ9l6rvYQRTSavdWfnkEymWW05CstgcOt6bNEtF4zwgQdZz?=
 =?us-ascii?Q?sdivhOU4F04M5ZCSwgzXKEc+vCGeEQSveE5+ySWy1WBHMudIE5ZTv80dOcld?=
 =?us-ascii?Q?bya4zcDcGtGf0jyYq4hIP2w9TRd7nUKQd90+VcPCWXVtsN60jnCk6H9V+DsT?=
 =?us-ascii?Q?gtsVcvs3BVOHhJDh3NPsORjShAdCgi5U0ZmwMpdXn09BAEZop6hFxMN28G4O?=
 =?us-ascii?Q?+jirtbXPcMGxObwhIXGlmrjlRwf2GsbZISzbMeW1PNRLd5CwyhoOzE9BK6xG?=
 =?us-ascii?Q?5n4frfOkAuwW/v46aUYJYLG4CL+Oby4eO+hzAPcDaAMzTEKQt21KirIGLrvN?=
 =?us-ascii?Q?ht/PJqWyelJ0zK+dd2Vb+IJdSI2u9cz5Fo5napF1lOJiED85la7DkmjLi42l?=
 =?us-ascii?Q?P6Cyqj4Yqg9ddNUxNB2nuH3hAYTUcnvyqodnbgOw7evGadEeb3/8CZqsqKUq?=
 =?us-ascii?Q?XOUHILmNBpJQBaB1vEigOOu8fsyI2YozfXOf4eOs38nvXXyyK3Kokmzg4xws?=
 =?us-ascii?Q?ooX+ukeH8xAEs3cuVI574ok3lbSGgKkVcdTu0dDPIEhcQG3cOm9LUmIfpxF6?=
 =?us-ascii?Q?4fC8YPQPKCJpFnhzP1AgVj0u6tXLOc5yztk5jkyn8z3zdQwESXE3+SWeEmtd?=
 =?us-ascii?Q?Ja8/220bb+6LdnDjnS/WYpdnM6BPUaLPsj5rcna8TV7zj6OdZClU+cJn7Q+Y?=
 =?us-ascii?Q?Wji6JojIBchWFxn9FlViTv7oI10OF73rtKi66YzZzZUfqCP2ykHqQwSS0Jp2?=
 =?us-ascii?Q?Ck5D8ZjPZJYyTPAWuZPNiDmMV8umFlhLzuUq9YiX9sCxIMFDbg7DRlFN9PNM?=
 =?us-ascii?Q?UFXhxUsBsBbo975usuQtW0Rnw8CDxpbGd3rMZ80HbW6rAub3Bm/swHoZET9/?=
 =?us-ascii?Q?9lqfLnRyz7GVzE00e4uY1GjlgTeBz48DvPiYLoTM0n6mUSU8uMnh0DZ3WZLI?=
 =?us-ascii?Q?LbqjwBxKkZeuZgLHC2wUimmGz6o18Ykoqy1dmJIWG/J98jXWefa0do4KJUFW?=
 =?us-ascii?Q?U6nHQv0xRrNBWhbdejB+J0opGjNonheIPcpPXjgmHP4bWNWaAMQ+OGyZLOzJ?=
 =?us-ascii?Q?+6GSUKmKDILmRGNmFhmp7ES4WutwbdytDk1Twwqz8mojEuWmm4AW0N/4Ev5r?=
 =?us-ascii?Q?zv9auYIENd8C1ih4aEvVBBPKILiV34aguWS6sQdr/dNliFw9eikQHdC1oKVh?=
 =?us-ascii?Q?Ab2pR+tq4CZH51NvGzJti98Ntfv4ECeZZHhcWfnp/9kufWvHAqJwNubrLbRz?=
 =?us-ascii?Q?LT/ibRoZcwR1qPv8J6DeS9SHKwcf2mTNvxz9Qzy31JRIyIvGsUdplbKqMBqW?=
 =?us-ascii?Q?N2FiATS+zIw=3D?=
X-Forefront-Antispam-Report:
	CIP:13.93.42.39;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu12-emailsignatures-cloud.codetwo.com;PTR:westeu12-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(14060799003)(35042699022)(36860700013)(1800799024)(13003099007);DIR:OUT;SFP:1102;
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2025 15:18:14.0864
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ba26e7f-f1cf-4be9-7343-08dd630b7096
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[13.93.42.39];Helo=[westeu12-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM1PEPF000252E0.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8261

At startup, the driver just assumes that all registers have their
default values. But after a soft reset, the chip will just be in the
state it was, and some pins may have been configured as outputs. Any
modification of the output register will cause these pins to be driven
low, which leads to unexpected/unwanted effects. To prevent this from
happening, set the chip's IO configuration register to a known safe
mode (all inputs) before toggling any other bits.

Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
---

 drivers/pinctrl/pinctrl-mcp23s08.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl-m=
cp23s08.c
index b96e6368a956..de2147cfe83f 100644
--- a/drivers/pinctrl/pinctrl-mcp23s08.c
+++ b/drivers/pinctrl/pinctrl-mcp23s08.c
@@ -619,6 +619,14 @@ int mcp23s08_probe_one(struct mcp23s08 *mcp, struct de=
vice *dev,
=20
 	mcp->reset_gpio =3D devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
=20
+	/*
+	 * Reset the chip - we don't really know what state it's in, so reset
+	 * all pins to input first to prevent surprises.
+	 */
+	ret =3D mcp_write(mcp, MCP_IODIR, mcp->chip.ngpio =3D=3D 16 ? 0xFFFF : 0x=
FF);
+	if (ret < 0)
+		return ret;
+
 	/* verify MCP_IOCON.SEQOP =3D 0, so sequential reads work,
 	 * and MCP_IOCON.HAEN =3D 1, so we work with all chips.
 	 */
--=20
2.43.0


Met vriendelijke groet / kind regards,=0A=
=0A=
Mike Looijmans=0A=
System Expert=0A=
=0A=
=0A=
TOPIC Embedded Products B.V.=0A=
Materiaalweg 4, 5681 RJ Best=0A=
The Netherlands=0A=
=0A=
T: +31 (0) 499 33 69 69=0A=
E: mike.looijmans@topic.nl=0A=
W: www.topic.nl=0A=
=0A=
Please consider the environment before printing this e-mail=0A=

