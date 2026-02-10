Return-Path: <linux-gpio+bounces-31564-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YAcuEPlmi2kMUQAAu9opvQ
	(envelope-from <linux-gpio+bounces-31564-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Feb 2026 18:12:25 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D64AD11DAC6
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Feb 2026 18:12:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6D028306B4C0
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Feb 2026 17:08:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E49D3806C9;
	Tue, 10 Feb 2026 17:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="XvvcXT+M"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013069.outbound.protection.outlook.com [40.107.159.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C773331B825;
	Tue, 10 Feb 2026 17:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770743319; cv=fail; b=AyXtIowGXdCNVfak/bRkwV2WI1VvRlhQynKkDz9fXZEfBI5QtMME/yWSCwqPUqSmUFkkf8OcDXhMhC+azyCEqpEbyPMYvKgLuMk9kqU4xB8XWVGGifcfMR+bkJ614hjC+M5o6jUUtq3+WihB6g1B3Auv1pIyV8lE0QCI14dwoXA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770743319; c=relaxed/simple;
	bh=bSxKG/pQ0BH8w86eztxt6YUa1tdwWgAkGYE1VdFdG0c=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=WAX+ChT4BMzVqSMwS6wrRFE/sSJqBDyjaDV+Jw6hKTzlmAopb7IXDJ2nN+ANo6AiJ9vuHnACazUEjiLxBin8mDnUEP8L1D88gokSe7YI+XIVY0F1NJnqmNysX8yn6c88AZgDVH5XKkbW/fAvlwjaBwoAkDTSQyqW4M9dCUm1WIo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=XvvcXT+M; arc=fail smtp.client-ip=40.107.159.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FwO66ZsBloYja/NkD5i5zSGAiXJ/OzTCrIgXGr5Nl3bqTSZgahFeJxVcQBzVIRnrGGE8EFzPtTvKJ/s1btDED7exriB8g6cZaaNpWzBQTZf4a9sTqGnQGntQCyOrS6Ck74H6x37RY4QQDnw/ZiD4wCnHE6/gF80Z6i20cNdmagpzoas/rbE1S5POVo4hyrZUtNGVju5VDbY4dunGly6xCiqdI5ZlJbNyUBned6U2u1dK1sK/Q9jay2gLBw9bnAL55rzKSCtFExfnvBkDKnPNKUVbptVVaq+knGsDqurhDFRcHJUltFjuItL/hr41wzEahB3mnagdY0iRmawoTkK14g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wtbFpYrTdulEgD2DiQFMOvshLaHY6WPXpa/V5WFFW2w=;
 b=TGz9Oi2xA7+mOsuaRKOEBvRtbN85zReISs4HO+nq38Ckd9g7IDWCPFbRNWYk7Sm7QdXKBtbaHbuXmzuBX1KxfjrbETdoncmh0fgUx8iC80G0Q0DaMb6uvGGfht8l7fP85lXAl63mdehXH3jbycVmibZkdI95ouB3aqOx5KKjRjo+WppTlb35+2PvXzgX2NaRObwZFEN7vFVKEG3Cuf3l6BGD5X99hf0qeMGjLEw2xEkHHs96EirqGO50mDZVesc7waAs23i5JltoG4kQEFUABuFGeS3WzLTIth3rW/bKVGPMirNdR7Xfii6Kd5eEY99MOF+UWHz6Y50aNgb6W+jjpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wtbFpYrTdulEgD2DiQFMOvshLaHY6WPXpa/V5WFFW2w=;
 b=XvvcXT+MGW0+go/hv/sgOszmx8gPd1KBvo62doDP+AtGvWsHipp+8EBHK4RicsWvAOtPf13roYIcCkmMWadvZwSEFiZ3aUtSSvF4kmlunyVpZDmSP6a0C7E5MsPOvN73lvkB7DrY7J4KmKEQsjRmrosD5TgeA9oIDBFVmbf0FAqZ5uwr71b8SC5XlDjPS0q5y5O3r+M1IkbszgJY6qa85tOpKIxu0EtBoK1D18aMELVBevcowEAXv/zZYz8szACxndPf/1dZ4oTRZAR7JE7iBh4lNE1aMd7Dg7ntcT06IZROQqCmJxD7PGzCl1LfdLiVjnRg1W1eTGLSfL+1dVij2A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by FRWPR04MB11284.eurprd04.prod.outlook.com (2603:10a6:d10:19e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.8; Tue, 10 Feb
 2026 17:08:34 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%4]) with mapi id 15.20.9611.006; Tue, 10 Feb 2026
 17:08:34 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-imx@nxp.com,
	arnaud.pouliquen@foss.st.com
Subject: [PATCH v7 0/4] Enable Remote GPIO over RPMSG on i.MX Platform
Date: Tue, 10 Feb 2026 11:08:10 -0600
Message-ID: <20260210170814.406883-1-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0089.namprd05.prod.outlook.com
 (2603:10b6:a03:332::34) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|FRWPR04MB11284:EE_
X-MS-Office365-Filtering-Correlation-Id: 68d30834-817c-4d24-abc4-08de68c70619
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|1800799024|19092799006|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?b2Y9qtNvT1aCI+eFRJDuzhhD5MCgsm4jugLgwT5KGJJ6V1sQEY/S2BN/WvmL?=
 =?us-ascii?Q?NsWioAwBgR2Sf3l0CPOYee6CNr5SwTaf4cguPzo+3wdCX2Qb1AZFcEC0wMrq?=
 =?us-ascii?Q?yQWjdg5ujMCVYdB3T6SqMY4d5Y4w5pl4eFSqkvAsJaQbfq8px/dLp8YZ9doA?=
 =?us-ascii?Q?d4EFYZceHbwoVlMz/8SzREc4bCM93D/PLS5X1YVq4nePwW7F6NkMNcKr7oba?=
 =?us-ascii?Q?uLcS7cbG5cNfxMtet/Z/HHEBVf1DrSxxPfvx+tGalYhoY2DNqDQoweS99R0j?=
 =?us-ascii?Q?KMKAaSFeB9LUJJD01rHJ13xW+9AzCylUyOcpDiOwBnGjPC5VrdBzeRtcAB6K?=
 =?us-ascii?Q?VmR1KIcduvr3SPjZ4urCjjs5d3tY/+MNKQssGTzoRJB/wGyuLxq3Dh6NBRFk?=
 =?us-ascii?Q?KhaJ+KJhdfc3J0muAivmRdxXrND+Zk4RBWmYnDCCxHTuTEWRjM3Iin+NRNGa?=
 =?us-ascii?Q?H1Rn+a8Jmvp21EIfyUAdRFvgMqiGr85pTjv4PQXdf6EwzC8K3AgrzKifDjUz?=
 =?us-ascii?Q?AUp1EcYKo09MbBqXxi+ZoqWdNP4jX4Z2MKLGLYoxDAzPGF5vQ/mUFTlijjs0?=
 =?us-ascii?Q?kkJ/OTlohqQTAXiTc+Yu8FOJBIl06yuTQWQj0NwT0PeVn8S+npjnqX/PCyCJ?=
 =?us-ascii?Q?G1AY4mre52Ly4TNdlCNKRej4h/fYJv03m/2vhDwDQiAyiy3ZhsS18Y1x7yYI?=
 =?us-ascii?Q?O4s9s/6J5isIwj2TGtXV/DChp5gnT4v/+jRhtqbOkIO1hT9mbPuSLAvB2vnl?=
 =?us-ascii?Q?g+CMEL1tNaW4tp3fEPRMxBidvZxhzGzISXfrnGt0B4UemHUD+njZ/yq3aoQ/?=
 =?us-ascii?Q?+iNAi134QSbOGPgbgLQsa0u86TEOSB4K/faODkjGy12STlZ4lC6Fwi8RUVzD?=
 =?us-ascii?Q?roBS3eMLKAWiPRXQOZUSaOmvwHfoOlI2fz3//TEdaYnby9ylzaJo/GJPM5lW?=
 =?us-ascii?Q?icHCfMXYR8N/ULMAdz+pRBG2yfHushd4HWfNed0zz5uzf0snMLTg7WY98cVo?=
 =?us-ascii?Q?5CH5AJWDLrtDiB2uRQ97jPxHkHRIWZOQPFxoB4x03tl/jotRTkVn3HU7z0cj?=
 =?us-ascii?Q?rDeo+tKFnQTezSQLeja0KGaiteIOUWbZO3qdcCKwASRUboeNeow/nUh8vb2i?=
 =?us-ascii?Q?0YZt78iBB29y2IXeePW8AIyms9NFUt8ik25HZxQIV3pMRq36dFueTzgmsH4r?=
 =?us-ascii?Q?S+7MdrvAm1gsQ8wGui+74XlnLNaqdJEPkhvavdjiNTbwlYdWOe3qDbOkQPY1?=
 =?us-ascii?Q?35OyOtjO0pyUlMd7cHRp2619Agau2dk70j63Zv+uC956i4t4anffC6ssXxqr?=
 =?us-ascii?Q?4pwjhJ2OVSukKna4Z37Aj8PoKEQeLNwoCBZ+87u/WCjs+aVPbZsMAHjW2jsP?=
 =?us-ascii?Q?iCXfxVeAzPd3+AbYTreU5T/UjbMROhQmjMZwoqFUBRbmaHOlrZks2gK8mWsy?=
 =?us-ascii?Q?S1XzEAbrS15eFKC17zgmgyXLynbqJsUvnJh8RBRH4eWm8aBqajxtP1R0+ri/?=
 =?us-ascii?Q?YQ4L8O+/EhPg4oHv63FMjakOofe6oYUbUESNIpUy1hw9R+R3ckRlH8LXyUpS?=
 =?us-ascii?Q?hnXKfUHnVngygGLC7VDQBtLk6seWNISJSE2XCaiyToY8B1kxZnF9A+GPLsbx?=
 =?us-ascii?Q?OKZLG6nmHDA5MBCjmZ3PP//xb4FR6eACHKuFzVR8rXDw?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(19092799006)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?e+j9zFTiD3w0oS6xtHuHmOJlO+CAhg/lfCdRIGK4kNVFl2PNaonQofWLqw0B?=
 =?us-ascii?Q?o50qlyltwSmnz5O5SdvIBF4HgjoF2MBci+AjSak+awNfPF5kENYxC+Tv68+g?=
 =?us-ascii?Q?gM3RgpR36tKY73h/ZBKL9QbA4STP1qrGj754tfw/KMMDPnMoej5seOLEWRfF?=
 =?us-ascii?Q?xCT7ucmGJptL4hrkG4XoRF90LJN9SZfBycX6IzgDzyums4HUrdFz83c94e9N?=
 =?us-ascii?Q?SAgwA0dbwBWlnk/A8vdvvtVXhyBhFbvjbztnt5AI2KgqT8SGg1ljxU1hDeCR?=
 =?us-ascii?Q?k7eo3CNkZYJVJskosseCCAHXdMV4v4xISSjFT9xtE5BQFJoT0DO+DYdmM9rE?=
 =?us-ascii?Q?OJFhRMoMHnYlgoLgEWf9Ni0ooAPtIFUOGIwxXPSqzV3D9VGHIxRb4FjPNk6O?=
 =?us-ascii?Q?SNzA9zccHUUpgvzSXrW5phatTGmKPI5qMSudleO+BZpnqzC/4B5j72STk6j8?=
 =?us-ascii?Q?36hXRp2JDzcJ7IydTytyecMLWtDrgRQeLJNMgBbvDqk4JZp8anECfxDjidm6?=
 =?us-ascii?Q?q/BxaTkTn8u6Tk8cFcch96SDkdqEZt5t0LMREW3BpeYefNOfwDzq7bZ1LbSk?=
 =?us-ascii?Q?hs6yJiwkLp0BJAKoVbE9A8nwdnDoyQ9iTs1RBAP/4GErZ7sGZ0NvF4Cd0yEA?=
 =?us-ascii?Q?U5Z8Q3iJ5D4mlcY8dnOImMgn1DCJRQt0KXxCsVI1UDFDViyeLuyfrynpzXBg?=
 =?us-ascii?Q?xlvo2dA2u9asAghplG5VfN9Wn+mmaTWgUlhdvyp/ob/OyOaiO49mnf7C29O3?=
 =?us-ascii?Q?Zlh4xln5opcA+HenFjbKXjXThmP0ZGyUg6cqI2NufqCYed2KXgY4QDzsMMnS?=
 =?us-ascii?Q?g2zjcZt3P3bF06QAKFEiiwF7AzUgGxZJQmWbSoWCz+bPIOTxeRoURf0K6hCD?=
 =?us-ascii?Q?MJ/Qx+eqXZBq5KmKWcEF65rpFeodQRGzSjDLZRUdg7YTpA9KvczNUtw5gqLc?=
 =?us-ascii?Q?s4m3U52Llwydy0i4bTmwfdqbTVfVEXy9b5cGnEutZKy1rZ+LTpti4mQMd7X7?=
 =?us-ascii?Q?b8x0IUYD53Eis8f+gkI5iVGp4X56yl5NUQsxcoZZ0wqYdENlj8FBllt8c4wS?=
 =?us-ascii?Q?ma4yRYGa3DhHOseLMtstlhkwzNFTMQYf/Uxn0sNJKzMzrLPC7n4bde9eVOVg?=
 =?us-ascii?Q?cXvZ/ORAPnytokU9D68vTJYOw5EOzliCB5bmgLaPSMQzQHYaB9ZAFE7TmO6o?=
 =?us-ascii?Q?W74Psp1qsJXsNjtbAUxLyyvUxA34mQ9ah1T/GBXAsysdORNiPmJaHgn+5jN7?=
 =?us-ascii?Q?Bw3lNjl6A1qLxwsABJi5w9ncQf+0N2e3UysbTPMBv0/dJEbGx3u6DSxNTgK1?=
 =?us-ascii?Q?RY5F67McHLX4cc2zmCmhFMKu9VZqlP0+ioEpZ6uxiulsNcoSnt09OcCIsBno?=
 =?us-ascii?Q?x5K3hxRuxRhpc77Ctd7mgLtaht0uRJkJj/m6V0xh3Xq9Vu0I30r83OZHzTh0?=
 =?us-ascii?Q?C8Hv5Vn9+989GjqP557mHM91gVQmd9Yz3kYp9tW/IcSfm4Fp82pjkOQCtYqi?=
 =?us-ascii?Q?WhwboQzyXeveILbxD/UqdZeiKCieP3xL6sJVT4DKkYNpAGyWhM2nm9wt8GEv?=
 =?us-ascii?Q?LkSaDbG8dzI/WQIqpphokZ2dNQ7Oy0jelJn3cIChJyMaWnlvwd5e4DHacmk0?=
 =?us-ascii?Q?SJWDxBhJNw+ASy7GURnjhGT1yxSgZW8jWFB4K/LpBpNUYK0qsuMi3UAkbEkt?=
 =?us-ascii?Q?NXZIyIBdT92yDAJwnGcAJDm/bv25HWTJfcaHOC/78Yd7ktLbSediRP4mClaf?=
 =?us-ascii?Q?0mTSY/flBg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68d30834-817c-4d24-abc4-08de68c70619
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 17:08:34.5103
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OLGiQDTWJX1taUoOf1EEvxyzEODLfMMvtP2nnZj+GibjjADbA9qn5wO9cVMVfQEcW9+77rlSmj97IJYgOAvYHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR04MB11284
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31564-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[pengutronix.de,gmail.com,nxp.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,foss.st.com];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shenwei.wang@nxp.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:mid,nxp.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,i.mx:url]
X-Rspamd-Queue-Id: D64AD11DAC6
X-Rspamd-Action: no action

Support the remote devices on the remote processor via the RPMSG bus on
i.MX platform.

Changes in v7:
 - Reworked the driver to use the rpmsg_driver framework instead of
   platform_driver, based on feedback from Bjorn and Arnaud.
 - Updated gpio-rpmsg.yaml and imx_rproc.yaml according to comments from
   Rob and Arnaud.
 - Further refinements to gpio-rpmsg.yaml per Arnaud's feedback.

Changes in v6:
 - make the driver more generic with the actions below:
     rename the driver file to gpio-rpmsg.c
     remove the imx related info in the function and variable names
     rename the imx_rpmsg.h to rpdev_info.h
     create a gpio-rpmsg.yaml and refer it in imx_rproc.yaml
 - update the gpio-rpmsg.rst according to the feedback from Andrew and
   move the source file to driver-api/gpio
 - fix the bug reported by Zhongqiu Han
 - remove the I2C related info

Changes in v5:
 - move the gpio-rpmsg.rst from admin-guide to staging directory after
   discussion with Randy Dunlap.
 - add include files with some code improvements per Bartosz's comments.

Changes in v4:
 - add a documentation to describe the transport protocol per Andrew's
   comments.
 - add a new handler to get the gpio direction.

Changes in v3:
 - fix various format issue and return value check per Peng 's review
   comments.
 - add the logic to also populate the subnodes which are not in the
   device map per Arnaud's request. (in imx_rproc.c)
 - update the yaml per Frank's review comments.

Changes in v2:
 - re-implemented the gpio driver per Linus Walleij's feedback by using
   GPIOLIB_IRQCHIP helper library.
 - fix various format issue per Mathieu/Peng 's review comments.
 - update the yaml doc per Rob's feedback

Shenwei Wang (4):
  dt-bindings: remoteproc: imx_rproc: Add "rpmsg" subnode support
  docs: driver-api: gpio: rpmsg gpio driver over rpmsg bus
  gpio: rpmsg: add generic rpmsg GPIO driver
  arm64: dts: imx8ulp: Add rpmsg node under imx_rproc

 .../devicetree/bindings/gpio/gpio-rpmsg.yaml  |  55 ++
 .../bindings/remoteproc/fsl,imx-rproc.yaml    |  53 ++
 Documentation/driver-api/gpio/gpio-rpmsg.rst  | 236 +++++++
 Documentation/driver-api/gpio/index.rst       |   1 +
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi    |  27 +
 drivers/gpio/Kconfig                          |  16 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-rpmsg.c                     | 583 ++++++++++++++++++
 8 files changed, 972 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml
 create mode 100644 Documentation/driver-api/gpio/gpio-rpmsg.rst
 create mode 100644 drivers/gpio/gpio-rpmsg.c

--
2.43.0


