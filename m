Return-Path: <linux-gpio+bounces-31558-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AGBhAmdli2kMUQAAu9opvQ
	(envelope-from <linux-gpio+bounces-31558-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Feb 2026 18:05:43 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 711C211D878
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Feb 2026 18:05:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 471BC303B142
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Feb 2026 17:05:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CBFA327BFB;
	Tue, 10 Feb 2026 17:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="fEpHbwRF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013036.outbound.protection.outlook.com [52.101.83.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 959BA326947;
	Tue, 10 Feb 2026 17:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770743140; cv=fail; b=Oa5N7TscWdB5bxsVKSxPhXmKuUEbI1APYuaUsE9pmwJrNztH1R2spjMlMUkXvJ+TTmS954oDYQWqf8U3cTJ72cv9RlpczVo+O+LJTm9qIesyqPtv0zODbQS6tThQhOiMV1gyWqKOJNaUBmUKOA3WqMxsw2eQ7yk8EZKpDybGlSM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770743140; c=relaxed/simple;
	bh=bSxKG/pQ0BH8w86eztxt6YUa1tdwWgAkGYE1VdFdG0c=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=H6h615L0AqEJewWPw3+sioDYOLs092dHm4xYNFsPrv66SYf1bCiQrNjfsRHqRMFh9565hHiD8SVhPfWJFvSbaFUZlRJ9VjeCoHL8mjPID+xSyf2x9rYCin6yPhC/jhzs7S2yeL/7cvHTyrMbkVHHipRDTBG3j8NzNjmMGUGlBZw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=fEpHbwRF; arc=fail smtp.client-ip=52.101.83.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KiQZoINPybH2/EsQJQYtM8ymYY/82T3rJOA01PZmyfi4dRuN5tjiEzIk5PXTXO8x4bcUvVkrWepMxrAdGFmmKMevj3tHAXK9YAP/n4BC6cze3PwdccJ14k6v5JjSIOwUVwnZ2bxcLu54aRUNVAmPjUun3/uVk6s6uq4n+NayhU4vUIPoAChrtk6klt64dtVeYiVvzyFCr2rYWZ6/57JL0zuIYoNM0IUHmLZjy6NMhdzxXoJUvlyo8e6098NVUxkOexbV+ncsS/ZXlDywrIAXmLGnEMZHXxRz+lWCXbv3uPg95J3Zcw22Lh/l/QAr8fn94EkoxneGBAP5VaMRjEvAHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wtbFpYrTdulEgD2DiQFMOvshLaHY6WPXpa/V5WFFW2w=;
 b=R+/FtphWlDKtdkC0RkN8ueQitvhGdTgdid89ZTqSqCyQppYRlKXrMrQ23Hr2sS8dtFJvze52tPHG1WNYvVRo5jyTVVoKMLQSazsci77Vl81f7CO6ySNSN80YaW2YTagXRCycAFTqC7PUOHQ44l3eVkxy9NnNbAWRkIJ+1c6Ef051KiBT/+LUp9f/4BT2WeCnwUYVbhfhpJCacnoPSea3dQ1BOI3OnINc5RqYYidiKjs58goY6qrpr+1BwkTiobI/TuOxllSrReYBL32Udk5HXaeU+EumQK60vn+bQChedrmb1JHq5oteJ2rbVm0oBNJONdNcyIRgq6fnF96FbEksLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wtbFpYrTdulEgD2DiQFMOvshLaHY6WPXpa/V5WFFW2w=;
 b=fEpHbwRFE+/ctH68dA7x7g9XFWKnKothTo1EnKs7N02naePFYBZeXzC5rOimRoROlXVyoPnKhCUAaUIsmwUPjHJSdzRWYOcJwYHbEg3aa7MSDkmo56Trd7fqdjv4V413vQcGt+tWdKG3YB7QpIsUagirGHe9dRqP8v5TRORcIcd8AfKmNljK7oBtlzeE7WkNsxLUI+cq7ttYqr+ty8wE7zdy0fX6Yvpmv4kDYy7b1VxYQYt/9ZwijEo9kZekuHhlTR/vpGd3q0XXqzixxKXn5QfhXZ26iSFEU8pagQ2Q7+sqrI6p5qctMpZBCP0E8GhM6whyJLcjRMLZp9EpPxVxtw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by DB9PR04MB8362.eurprd04.prod.outlook.com (2603:10a6:10:241::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Tue, 10 Feb
 2026 17:05:35 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%4]) with mapi id 15.20.9611.006; Tue, 10 Feb 2026
 17:05:34 +0000
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
Date: Tue, 10 Feb 2026 11:04:34 -0600
Message-ID: <20260210170439.406513-1-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH0PR07CA0052.namprd07.prod.outlook.com
 (2603:10b6:510:e::27) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|DB9PR04MB8362:EE_
X-MS-Office365-Filtering-Correlation-Id: fa51869e-3ccb-4e57-9309-08de68c69b00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|52116014|7416014|376014|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EYBH8VRqWJ8NOIoBfLRq2z+7GQTiKxKW910Hfpz6Jhx1axXBMj1qxEKzx5rj?=
 =?us-ascii?Q?SZzKgbJQnFbeSGydg3pckycaelMWimukQnL0DpA1NLn4iMerLgKxnV5irg6s?=
 =?us-ascii?Q?OnaPidbbOP0PdX+XwxYdPomYyRwKcL0UehZL+UZ95jVPqxb4AssGvWRP8aDg?=
 =?us-ascii?Q?p1jqWT0SLdIzA3hl0NBjGB4AvbELyccrm6q576cobo6pBtvVoPm0Ho40nOgN?=
 =?us-ascii?Q?YDO33W1Z6yT+bXL0YIBy1eZsfavmeQKzXEi10GQfngL/XUgO+EuF4d8KQ2lS?=
 =?us-ascii?Q?ldif9TXXuwYAiBAGi3FzJ6fkHWFKp/lkwG/nWosX35skG6BkNmrXXIvMtZSn?=
 =?us-ascii?Q?RJY/+j59wx6NfodkiW1Xen7tnZtrc3tkh+RgdwdK/C/0FZ5PdRtMx2jKrULB?=
 =?us-ascii?Q?fp44Hu7dpxtdKziNicyaLFSsCVxRwNxHHDKYXFQuj0zmoOUn3mnXqFaSgX5i?=
 =?us-ascii?Q?t06Con5/vgICbVHm3fZadubuyCKfUeVk2ZTgN+Tu+a8yEgMLE/kTwc8NUyXe?=
 =?us-ascii?Q?CgRZoCoMpczWhzdBAOGbdMj05MpWwq9Gn1vN0BJBcJxCMV7L+zxMe/2KhfRc?=
 =?us-ascii?Q?uFTkgUt5vNi3F9aQadh5UGtN5tkrKsxEvEiQqXUWgMT/LU3r5gLBy2XxPH4J?=
 =?us-ascii?Q?oSNXvStCJ7B3PxfSDj6ZWP+cC5SZnDZ6Wr5X344GAwc5s0kaxz9kXE0QZcoK?=
 =?us-ascii?Q?IjBD5NHxq0+ZsRhw3DBcGsGjtl1eK8BRd+SowWewxNiNs8NC3TX3Jpsljzur?=
 =?us-ascii?Q?XZ/xVCHf2LvPCdQDtDVCHnTI/Tl8m7sNhaAyTnSAitxVAkGVIvzIkTdvT+TQ?=
 =?us-ascii?Q?q23SFfAHX7HpQ6pZhr9lzBZhNy6f43Si4b/PA2n/z9uw/R5Knhs/sFsNuGAG?=
 =?us-ascii?Q?ZgYEPB7Uj+Wf3hb6t5O/vni+zw0iq2tvtM9sxe7aVow0u6GUN5U5zdOz3l7z?=
 =?us-ascii?Q?KXE9vEk5b6GwAjimn4FO/yPnL8b3k9vowt1opirNijxTNe9SzYEel+cYiAge?=
 =?us-ascii?Q?j83FV7ZkXyGG9sclT+VoCAJEPQVIO8ZCqzoelZ4kFnWYRsr0bUJXk9ZZ8BZw?=
 =?us-ascii?Q?VXTqtWp3oatgSxc8eB3CsIeGUwHeWrh7uRBGGD/iGSD4f1tJePq3XS6vMtxN?=
 =?us-ascii?Q?j/NZCVx7rjLxc9voiei6a5XyrlSe2Dl/caw1isGTHLxkTL3iLxBj/CEI9XK3?=
 =?us-ascii?Q?egy4CyMZkBQbwa5wfeBteNBQAUBzNICjv+NZHMiZBKht/gLDeSdCd+9jl5Zp?=
 =?us-ascii?Q?xvU52a1wovKPSk/gwIA6VJYUgSM20FRtBirNRUu0NDfZTSFPgiL0kxVqEQEl?=
 =?us-ascii?Q?m14uRcLcN+rRl2cUfz9/4z3h0eQTDepKA0Pd9PgldQGiKm/7VEq4wTL8vn2O?=
 =?us-ascii?Q?ozl6RRjusVkjZL4yeOX1VGSAMelonaOhlHhO636L5sQo+8SQtUnIB2Q20MsL?=
 =?us-ascii?Q?WY1KBe7h+35qk7jxpmsg2ihnb784yn4208PRN04dZf+YiXG+jz9Gxmvb76Rs?=
 =?us-ascii?Q?2hRGPue2daFwZd26z/GsbfcKcUVSI0YTBKj9C7IMDEpTV5vN1s5PySyEhpOP?=
 =?us-ascii?Q?gY3xgJ0wi2Rm+6wYuVLRlJWVjrdWMd1Eqg6SVjqxDWlnOIn2bR8O1qvyw85S?=
 =?us-ascii?Q?iKIy6Y+r4FW+p54eHwFyNPUSWvjjTKGoeJjwDnDRynVO?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(52116014)(7416014)(376014)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HbJl5UhVgQ7eECfAaFkL7naX+LHgJF2OuXlCC8rT1klVKgZd3quZPtAnA4ZA?=
 =?us-ascii?Q?6tw/WJVSL4uhwMPj3U6cGSW2iAo9JjcmtT9hW/QjacRx+G6qTBGctYheXt83?=
 =?us-ascii?Q?rHzO2H/9odEJaXAu9Gl9HUY/UUrWsDyP5yis9L4KU2HnD0xjaj+qg1FvqBCR?=
 =?us-ascii?Q?r5LTM2wK/BnblXBkvVVEWGuL9G+HJKusaG3EFeAp5ZIsz66TdvsrldNNQLf9?=
 =?us-ascii?Q?UqNWYEZ8YnJ16WdejhHTXyy2DESAwUntAaHfmneHisdQ3pvGPCWm4DrpjyRL?=
 =?us-ascii?Q?Xdy3YZ+3gKVidGWAZAznlVQ9SYyUD7OPFkXmLGrYCSdymaRKgLMfq6ENhRep?=
 =?us-ascii?Q?Sw5yJvw4wIyE6pf5hraoPSZY3pLBxSZIkqrwVEwUpQjmpfdWVFYlwO84w4R7?=
 =?us-ascii?Q?Jpdj5rQz2XtHVPPMVlDHy6eRShPsLjVbbAEyBmFcSNEPMe09gCwsjvSM1DpV?=
 =?us-ascii?Q?ia1Q6oR492hq/rDwFxqEFRf+2VQqJKZf5gWrj7tsQ8OOc/oYLosNnhnxZCWc?=
 =?us-ascii?Q?cVn1hjkcdu2dPFvQXwDwc9PW/AM/AieY4zPbjesKZqeioJWAZaxuDy53nXN5?=
 =?us-ascii?Q?/MoR5SNLLUF2PN1oe+mqRZXlIw058AoQO4RplgpWT+Ui75cQfixf6k+GouAV?=
 =?us-ascii?Q?UHXEEFMIe9ppPQWQgunxsoOXcJa/NRf1z0vaWIcjeukey46SDQh8bmit+QfZ?=
 =?us-ascii?Q?B/7J33Eql3ptPqPaxIn8TUE2WJINDq5wCxKuHHGjVr5Wp7rekdrvINaSzOgP?=
 =?us-ascii?Q?yD2PrLkrF45pDs9kSAD+Q1PdLGx78Wuk1N11Yv64CDZ5JqDGyMLRTlglU0n1?=
 =?us-ascii?Q?svRCX4zZsab95AivvG0P7tQFYMWI4MirN0WNjJV9Ic2fmrxRAAhQjzBywM8t?=
 =?us-ascii?Q?iZkYxifpzytb2uC8O/6ap9OwHqFb9MBWk9HfB2gERhxPrxn/VSPOhxqkrAFX?=
 =?us-ascii?Q?kp9WFn7mL2DE+lhOqkTtGvTUe+DWNHRp3ZpsxsjvX7TMK0VKYCiKAY3ltF3o?=
 =?us-ascii?Q?uWB89LZWe4tqEOC1zql6UoaO4TcRaYegYxzsdoSdj5PsIKfJCqinaDnVL7ox?=
 =?us-ascii?Q?PSpy2cS1h5+hzs8jSuryyIKf1mbyHGVSqxle7SzoejfiPVdrACQnlTt+L72I?=
 =?us-ascii?Q?0iafQu0HND/PRYdrv4bcLLYVeNaIZshDnbrRy9x+h7Vez1GKer5IQBU4cGZd?=
 =?us-ascii?Q?QhKhUEq9S3yHqd0dgSgn8C4rhetClbGESjZKN5muYre37ScAFFJQhxBFEfAQ?=
 =?us-ascii?Q?eFYFpuqAOF354DTYBaSgjWsUp3LS4GLtOPI2oO5pDsPncpIqrXUe0vwS8igo?=
 =?us-ascii?Q?PGU4bTBzpzhwCWH2O+W1JLAkf6WFEBqzjmI1vpHB+UTNRWTcuA5ustgTBHfq?=
 =?us-ascii?Q?vJaKXHQeH0xQNoCy8ZlvWqDN+uZiRU2iyHzT0AoxaOWPDo/kRXcIVLXHiaZQ?=
 =?us-ascii?Q?TmaOS2cVS+8+f3dwaRJxnkX1yLxJ9+OcOf49ag9/HXLWU9u50nR0Q5nxIXMF?=
 =?us-ascii?Q?7OLlKKlwTpnp8vV4zV7KVQlolsRvEPfMwxlJq+VbaCjTJu8MFhAI4sG4rsmJ?=
 =?us-ascii?Q?W4NdOMzbwYrt6IJXNhTo8PJFQwc1/14ryBf3ZWZ4d73xDJqpPe1KwFGi6Wat?=
 =?us-ascii?Q?vX+05MO5NQgeHeBO5Bw3tdR2ZpGD3fAN46Va3k4jzzi5MF7hDOKpUJSYd34O?=
 =?us-ascii?Q?mjVJIdUxwD0vTY6irFmEwh522gkb+wDZeE9zQDrX9BhGd+t7Z3+mxYhHtMol?=
 =?us-ascii?Q?yHbVTt1F/w=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa51869e-3ccb-4e57-9309-08de68c69b00
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 17:05:34.9067
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yxwoeOJ6nN58FJ12RvNnXRL7zbz6THeyw+ZUD+hwgEhc4JSuUHllMDbhzdTjeGZgjacftauVpVG0T34NCQX4Hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8362
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31558-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[pengutronix.de,gmail.com,nxp.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,foss.st.com];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shenwei.wang@nxp.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,i.mx:url]
X-Rspamd-Queue-Id: 711C211D878
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


