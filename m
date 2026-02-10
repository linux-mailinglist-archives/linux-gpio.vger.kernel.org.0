Return-Path: <linux-gpio+bounces-31560-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eJi9Noxli2kMUQAAu9opvQ
	(envelope-from <linux-gpio+bounces-31560-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Feb 2026 18:06:20 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB2011D8C4
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Feb 2026 18:06:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C409A304EA55
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Feb 2026 17:05:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11CEA329E40;
	Tue, 10 Feb 2026 17:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="jsOz/23x"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010051.outbound.protection.outlook.com [52.101.84.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09073326D69;
	Tue, 10 Feb 2026 17:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770743151; cv=fail; b=DIq6mvtRXb94xPAWNT/MzZRPu7NJGLDnctXxLhjkf9CZxDUYJGZxCof3+zzPJDYpgyWPXltrx5GffDTBKNaBojgQwNSsoit/o6eSJpP6Ha/G5XnKlJkLTlVvTV2RbuzEs0qu+A9uLkQRkbKnzoQMAfw7uUA6yJECXDYrwwn/Yrg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770743151; c=relaxed/simple;
	bh=Ml2CudLR0hhBavJumwpUzbgkHDOgilUqQSIa9+F+YzY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nW28z6cgiiCAa/18Ee0T4W3KFRglDgjpM5lEbRhNwtQem97wGEo9ciVgCa6tdNSKUzFT7vyicNVF4DMLnsgtmRU2NaklETkuKvz6+lje4HBJcxplUYs1LY1XnD+WYqenKZJVMFJW4zXFOOk5K9LRjL4Au3IAWjvQNTxTHmAH31o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=jsOz/23x; arc=fail smtp.client-ip=52.101.84.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uER07/ALyhUqF+TQ5PTpMeAYp2OzxbjiCe7vIfEBsrK+k1n6kbNeE6UlJ2/YkpOukVFhTz4vrFFSYHkACJExzxZBckKSKL7KwAxT8Hu8mn7uLrDRnUXc2OFtH7FnaUH/0Vu2vPFtoA/6EzPEqJBFzFW7anFDbLC6RSPFF9V/WXi8Jh4MROwadAKBGDMWUfD8OcBO4sxjXuNt2cYW5skgqZYvPdIJyedqC1Ip2njcGKQ1ye7OyPJZmZ/Qw46g55ElvoJuZQhvcqN0FQmodjMT72DOaQ508OMi8atlVd/crXWkJxV5rCPoIW692Dp1bgEJ0GZKtSVnAFZd1VhgqWRIgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yVqckOBNIY3LbX1I/NiivWSMqnKn59+hQw/6glWHZZA=;
 b=enEaNBbRXGCYpIhhtnigLzshzEtE2WhOKTThWY+lClrPj2PiJcxNApwzMU0Hv5ipfJJtuBTdvnYGRZlrLpGr1XAVToSAO624GwV60pvCuMa7uPv7ma6EtTfAZG+U6QqOWfhZ5sNz8XKInkSAimpye6XiwIfV7aobga6C/gUf7ES3INJM043t9uG+S9ar4HLMaXGFQjf0or3cA5MsD/FgcdGYWMACfRP4A/DmRMrFj7OCelIjvrrsEon5AxKrFPk1kUbcmDHt3NE9wa4/fS6H7KG3TiYM2mAKhB352j06MucVZYwAwh4j/UFKwIQJbr/OyUt8hr+8JebCj020w+jjbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yVqckOBNIY3LbX1I/NiivWSMqnKn59+hQw/6glWHZZA=;
 b=jsOz/23x25jbb4w5s0IqazgYZtiIRyN9OsKGWL4txD12zxni4kLq/U91ict5VYT9s7B9ZBOVe5H22BfYF1D0gTPFCbPj7ZPvzBZyKf+BeXgJgP+y88AV/GDvPp9zpPQ4ZaAagTiLSVRzxRuFM6RpBuwO44gBYwuYR2lmA2unbgKcH6u+rcg0C8mKt4HFkhRqtX9D59jXDDLKMXAEP7HGSx+39ynetDFSus1o0cVSZFFKNgvV9wHI3uobE6QykfkweIX9EsuWnwf2Ax88Hh86GVtXXtPceHmEEKCID9Psa4WIT42VJLJF0ARKV+cHUPKalUF1mgJ1CojtYyvkI1fLUg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by DB9PR04MB8362.eurprd04.prod.outlook.com (2603:10a6:10:241::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Tue, 10 Feb
 2026 17:05:45 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%4]) with mapi id 15.20.9611.006; Tue, 10 Feb 2026
 17:05:45 +0000
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
Subject: [PATCH v7 2/4] docs: driver-api: gpio: generic gpio driver over rpmsg bus
Date: Tue, 10 Feb 2026 11:04:36 -0600
Message-ID: <20260210170439.406513-3-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260210170439.406513-1-shenwei.wang@nxp.com>
References: <20260210170439.406513-1-shenwei.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH5P220CA0008.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:34a::6) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|DB9PR04MB8362:EE_
X-MS-Office365-Filtering-Correlation-Id: 9459d578-fb7d-4b89-ff8a-08de68c6a135
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|52116014|7416014|376014|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sYEmXJnaG00hEZEE8stHApElaqMJ4qOp1GidSZvr/+O0KCaR5bkRMRtd+FOy?=
 =?us-ascii?Q?+h5kYhaBA9YUQ57OmB9OiyqXuJpc8U/MuHeHP7zR3USuU6gInTg3maVRmw1j?=
 =?us-ascii?Q?etiOVk2R7nrVNgYCJpQZ77ngexHpfH8yWG68rzq08Wj3n3Olm65WV7Qsv+pI?=
 =?us-ascii?Q?Jln5W2R3gPLjGOLweyD8hPZsyu2crHOek0BQ9zn8g0N96jMZAGdC2SeGLZYR?=
 =?us-ascii?Q?Wu7CFJa3iTmpmYKb83h6/12l4ql92KnCHlNhmZZt2js0+Dy9DY/cJ8+nq/5j?=
 =?us-ascii?Q?WwgxkgnDUrJ6shNodH8W59iJaX53aPOs/GHF+7CZ+uEj6J1wXLFds7l7uA8i?=
 =?us-ascii?Q?eChkUcdnPVoMOqIAlfdvZECsc7aadsOUiEsJGwDjU4YzQie86PPmZIjQma1Z?=
 =?us-ascii?Q?/8KwuzrQTOllvH2EqzRK7qe9er22Sf0vGyRiAMZ5f/M9pnRgBMkK3AQn/y7x?=
 =?us-ascii?Q?7UgbfBn0fclNHmoZ0wb+YzQqeVIQPOolZgpqHGVw1wFPsdZ5TBEiqTwpZamL?=
 =?us-ascii?Q?w/YBlxzus8SC1Sh5vbBhg96vdRYX75vqtmcTpljqMI5csurmLk+tuguFI7tt?=
 =?us-ascii?Q?rzoCm+yMEX/3mTm3lKdB5Dd4mHgZLRlRYvMX84JKZy9OqpdfQvieRTBnQS51?=
 =?us-ascii?Q?SKXo7gUEmBzScgXELHYkowE6mtXkHjqYNqej5FIN9EqJW8VR8bSTtduIvlMO?=
 =?us-ascii?Q?ZZf7ndrSCu4RdeGmpaDB2/Wj4RDw4pSJwDGfrlTWHWrN+X9bI1zGlYT8+Agl?=
 =?us-ascii?Q?i4IEKBXbiAj93uCLY2H9ZzZaTpvO3O+YGHGRFNTXsosB/iEx3ie1RsLcxw1X?=
 =?us-ascii?Q?kYQQcLtu3jGNMCATFvv2lh8zUshM1CdkrP1RDs6bSNQfPDjkmJU1FIBbJrN7?=
 =?us-ascii?Q?l4O6rt0d4isO5jsvHOB2x1qNPHu3HwKnfljXYTuLJeFm7+KF5syFo8hxQfsa?=
 =?us-ascii?Q?af32uL+tIaYvp9Id6JZAoYj4dOb6UER3xfpyNIqp7SyRlnZS0C16neDWpiMI?=
 =?us-ascii?Q?6hCvS5vm1RfUvcHQtRnaC5DyEuB1HV6pwSfdiBZQ58YKiwH4jR+44/vOb9Pz?=
 =?us-ascii?Q?FlsdnnNRcbEbumw1zg1xPqlBjaw8i4nHPCgl5y32W+ketschddI7RJtoYWsm?=
 =?us-ascii?Q?vxzX/dqxSmTlrBUstNmvs7hm2aamm/TP+J1ArDBlImh8iVzmly2+XGogKfQL?=
 =?us-ascii?Q?88W1vlqXIY/hj18gIbzDlGOz1kPgMonZqNSbjoPo1lPYvKMnX8/MOuxwESTZ?=
 =?us-ascii?Q?PWnmUbFxb0W/DGSiTxc4CMfbbbeqiGea3ZFsLYCEQO7LUS1Gh+zdZBQ4rdG8?=
 =?us-ascii?Q?pGt0ElWDfG+J+E+n7Eh7JfMuoHHfQh5WD/VECMVnZHyrIwKLaTX6DbUivdRh?=
 =?us-ascii?Q?14+fuHyN0Y325NwnkUPeKOcfrFFKxrNJihRMXUaWrM4G32k+iCCH7uFehIHD?=
 =?us-ascii?Q?npxyUTTbTAWO70wKnNRAZVO8zSRTUEJ0g4RpQGm67oN15z4TYsP6AqiZDsjg?=
 =?us-ascii?Q?VcrIuzyrNlSsdoOO7cDULVhuVLayTYTaKDIg/XltvWdeai5ow90ARIy16Xdt?=
 =?us-ascii?Q?KCP5XajQbaej4ixD0aYhcSs3/aRXEecnaOOR7OV/1/0egZI2zLljas0fvEqp?=
 =?us-ascii?Q?0UxCLYG0KM8cwtD8ARQp0Q4BxbKGJCfmP2i+90kPLU6P?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(52116014)(7416014)(376014)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yERE+oome5/OKct8jjcvZDjL9JRHg/yTml7MmrmqbnnHWoL6GaYRepEUTO1B?=
 =?us-ascii?Q?FwGGN/nS/EveRWQINoalN7WcJ9xQArfWr0GmMxymHaDjTcS3bMrMs9ZTyaup?=
 =?us-ascii?Q?8+JL7b3Ks8pyQ8at94qwqmOfcfzbjwNgVQjMTtmqoneglLHkHbcRUQxT3mN2?=
 =?us-ascii?Q?BL7oOekKlJSBTzWLu4YXBlUMV3KEvi0ZQUu8FQjjcRvffCaj9OWykMIx6Hul?=
 =?us-ascii?Q?SWwjKr2eT9P4ibhnhb0ZSThExYVhCdtm+Pj7rdSg1xY4ZsezQI7inVdqQx9z?=
 =?us-ascii?Q?anjiq/hBMPFfz6s9ZqSYZUf5u6Y6emjqX0koeviKA5Rn39Jf4Bn+lEhYa4oV?=
 =?us-ascii?Q?/HiL0iJ0XQFiM9X+K5vMd1CTnLIMmgV2Z/dSP3ZyZUU+lE4+4MqUikWyq/9d?=
 =?us-ascii?Q?+7rCpYE7ydJUVd3Cf0DRurZY5wej3aY9H3GJiynAabFGkChMIzub2qyVGFQx?=
 =?us-ascii?Q?2XfGkly3JLYczTGZe4oBC/yW6gQynsqPE8HD33Q/cjmB6BBSWGPnI0NId9dN?=
 =?us-ascii?Q?j5Rn/EIobjob/mQhHrTPYoE90JHNN6P+BmxTChzJKFD2l21nMytE9dVza9lQ?=
 =?us-ascii?Q?QM7ABDJPIEzk+t7t6m1qTu8KYz/7vSsrMi3npvrj35ytlP7hdA6Y7iRQjzo4?=
 =?us-ascii?Q?d2Ap9m5jGr9VtWBHKaAJy6RWqv+8SRA8cjGb7/5e0TL+2hxPt9F53nF8gfbW?=
 =?us-ascii?Q?SW8VebxYL4fVb///x8/TzlBrTVom9mlhNncrvsVuUeaRCFYjCShbfUekN3DL?=
 =?us-ascii?Q?HgwDqT4TQE828erJ6a24yd2AK4SjxHIVBgw40px/+2EunVQIb5mNafpriK97?=
 =?us-ascii?Q?RuXVEjQMj2beUCZT6Af8fWxcHaHUX5lPHAXdCtgUjD6rLkIaMbQiUK8LQG0y?=
 =?us-ascii?Q?65oB+pDwOBQe4HjSWQBUPt7HL4ahp7TGk1qiBecvRmf6byLFTks2cLZtEC7N?=
 =?us-ascii?Q?QdkhP6mSkzk9fbegnvasHEcwCr1ZdhuQOtrU6LJ58fd2p1+EIVKLFa3S3kWK?=
 =?us-ascii?Q?YHzS850P07je5GE8ieTAaOrqnZoqd4AdVo5AUxc5yaxiwbNbLAIr/0ZS7ozv?=
 =?us-ascii?Q?dSN2ukba0nAW0kisBMAJSK7KcRcIMJwyekFB2XvszCa6tmgymDx+yp27xApu?=
 =?us-ascii?Q?yGnG7L3m5IrsVqXtUPxKz8EDQVpxsAwxOOCd/kiiPvXVH+oT0fzIdKjD5/OE?=
 =?us-ascii?Q?0/U5wRqGrLaE7jF3SGXQtwfHDCf3IGcCA4LBHLzHIV2lL3xQmoPAN4HKpzZ5?=
 =?us-ascii?Q?5AmMVM3WHhQO19TR+lJltKwIVNvNZOUJitoma0jMXo6MVlgIJ04URmC+zAld?=
 =?us-ascii?Q?9ItiL8RAJyKrmVlPmD1aEnPjP6GQAFPLeqQtM0pL/6HrWtF60/6gbgZWGQzZ?=
 =?us-ascii?Q?/eG6pK/hNChlK8f7LB/blSCG7mzop5ixhK+HFvarah6MbBEvzDjsFn1X3UUk?=
 =?us-ascii?Q?tZuvAKmPua7vQZXUV/mNap49W8BcZIJMaU9EzdlK+hwXpxsrJUZtPCBb8zQr?=
 =?us-ascii?Q?JMkNqZyvf84Gdkv5sUZX1Rz4dkZhpvy0fpGROqcprcoN+78zHEON8MDVpuzv?=
 =?us-ascii?Q?rEnqTg27X5XF5/9XqIxOPhvR+72s7nGd2QPV95rjWsQFZFlx23gOR4vBMyaL?=
 =?us-ascii?Q?RAfofOfXu7Qu8iOJJtpz6tl0lmNn25gueJJI0/pawhmt4rfiDgh2xGdI+nwZ?=
 =?us-ascii?Q?WyUo+I7C32la6L/eeE0ZSfTRH4VbwDvyRek279n/sxoM5lAI73+FX+Z/kox9?=
 =?us-ascii?Q?r/sBFdnTmw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9459d578-fb7d-4b89-ff8a-08de68c6a135
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 17:05:45.2207
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XvanMmhftIm73jQCxiDZmLejny09JKcXWQnsC78P+VixRJlg1R8MRS+2LLSk9sQtxfAoLjtzdWIeBbVHoO0/jA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8362
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31560-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[pengutronix.de,gmail.com,nxp.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,foss.st.com];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shenwei.wang@nxp.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nxp.com:mid,nxp.com:dkim,nxp.com:email]
X-Rspamd-Queue-Id: 5DB2011D8C4
X-Rspamd-Action: no action

Describes the gpio rpmsg transport protocol over the rpmsg bus between
the cores.

Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
---
 Documentation/driver-api/gpio/gpio-rpmsg.rst | 236 +++++++++++++++++++
 Documentation/driver-api/gpio/index.rst      |   1 +
 2 files changed, 237 insertions(+)
 create mode 100644 Documentation/driver-api/gpio/gpio-rpmsg.rst

diff --git a/Documentation/driver-api/gpio/gpio-rpmsg.rst b/Documentation/driver-api/gpio/gpio-rpmsg.rst
new file mode 100644
index 000000000000..6964de309471
--- /dev/null
+++ b/Documentation/driver-api/gpio/gpio-rpmsg.rst
@@ -0,0 +1,236 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+GPIO RPMSG Protocol
+===================
+
+The GPIO RPMSG transport protocol is used for communication and interaction
+with GPIO controllers located on remote cores on the RPMSG bus.
+
+Message Format
+--------------
+
+The RPMSG message consists of a 14-byte packet with the following layout:
+
+.. code-block:: none
+
+   +-----+-------+--------+-----+-----+------------+-----+-----+-----+----+
+   |0x00 |0x01   |0x02    |0x03 |0x04 |0x05..0x09  |0x0A |0x0B |0x0C |0x0D|
+   | ID  |vendor |version |type |cmd  |reserved[5] |line |port |  data    |
+   +-----+-------+--------+-----+-----+------------+-----+-----+-----+----+
+
+- **ID (Message Identification Code)**: Must be 0x5. Indicates the GPIO message.
+
+- **Vendor**: Vendor ID number.
+  - 0: Reserved
+  - 1: NXP
+
+- **Version**: Vendor-specific version number (such as software release).
+
+- **Type (Message Type)**: The message type can be one of:
+
+  - 0: GPIO_RPMSG_SETUP
+  - 1: GPIO_RPMSG_REPLY
+  - 2: GPIO_RPMSG_NOTIFY
+
+- **Cmd**: Command code, used for GPIO_RPMSG_SETUP messages.
+
+- **reserved[5]**: Reserved bytes. Should always be 0.
+
+- **line**: The GPIO line(pin) index of the port.
+
+- **port**: The GPIO port(bank) index.
+
+- **data**: See details in the command description below.
+
+GPIO Commands
+-------------
+
+Commands are specified in the **Cmd** field for **GPIO_RPMSG_SETUP** (Type=0) messages.
+
+The SETUP message is always sent from Linux to the remote firmware. Each
+SETUP corresponds to a single REPLY message. The GPIO driver should
+serialize messages and determine whether a REPLY message is required. If a
+REPLY message is expected but not received within the specified timeout
+period (currently 1 second in the Linux driver), the driver should return
+-ETIMEOUT.
+
+GPIO_RPMSG_INPUT_INIT (Cmd=0)
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+**Request:**
+
+.. code-block:: none
+
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05..0x09 |0x0A |0x0B |0x0C |0x0D|
+   | 5   | 1   | 0   | 0   | 0   |  0        |line |port | val | wk |
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
+
+- **val**: Interrupt trigger type.
+
+  - 0: Interrupt disabled
+  - 1: Rising edge trigger
+  - 2: Falling edge trigger
+  - 3: Both edge trigger
+  - 4: Low level trigger
+  - 5: High level trigger
+
+- **wk**: Wakeup enable.
+
+  The remote system should always aim to stay in a power-efficient state by
+  shutting down or clock-gating the GPIO blocks that aren't in use. Since
+  the remoteproc driver is responsible for managing the power states of the
+  remote firmware, the GPIO driver does not require to know the firmware's
+  running states.
+
+  When the wakeup bit is set, the remote firmware should configure the line
+  as a wakeup source. The firmware should send the notification message to
+  Linux after it is woken from the GPIO line.
+
+  - 0: Disable wakeup from GPIO
+  - 1: Enable wakeup from GPIO
+
+**Reply:**
+
+.. code-block:: none
+
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05..0x09 |0x0A |0x0B |0x0C |0x0D|
+   | 5   | 1   | 0   | 1   | 1   |  0        |line |port | err | 0  |
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
+
+- **err**: Error code from the remote core.
+
+  - 0: Success
+  - 1: General error (Early remote software only returns this unclassified error)
+  - 2: Not supported (A command is not supported by the remote firmware)
+  - 3: Resource not available (The resource is not allocated to Linux)
+  - 4: Resource busy (The resource is already in use)
+  - 5: Parameter error
+
+GPIO_RPMSG_OUTPUT_INIT (Cmd=1)
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+**Request:**
+
+.. code-block:: none
+
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05..0x09 |0x0A |0x0B |0x0C |0x0D|
+   | 5   | 1   | 0   | 0   | 1   |  0        |line |port | val | 0  |
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
+
+- **val**: Output level.
+
+  - 0: Low
+  - 1: High
+
+**Reply:**
+
+.. code-block:: none
+
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05..0x09 |0x0A |0x0B |0x0C |0x0D|
+   | 5   | 1   | 0   | 1   | 1   |  0        |line |port | err | 0  |
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
+
+- **err**: See above for definitions.
+
+GPIO_RPMSG_INPUT_GET (Cmd=2)
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+**Request:**
+
+.. code-block:: none
+
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05..0x09 |0x0A |0x0B |0x0C |0x0D|
+   | 5   | 1   | 0   | 0   | 2   |  0        |line |port | 0   | 0  |
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
+
+**Reply:**
+
+.. code-block:: none
+
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+-----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05..0x09 |0x0A |0x0B |0x0C |0x0D |
+   | 5   | 1   | 0   | 1   | 2   |  0        |line |port | err |level|
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+-----+
+
+- **err**: See above for definitions.
+
+- **level**: Input level.
+
+  - 0: Low
+  - 1: High
+
+GPIO_RPMSG_GET_DIRECTION (Cmd=3)
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+**Request:**
+
+.. code-block:: none
+
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05..0x09 |0x0A |0x0B |0x0C |0x0D|
+   | 5   | 1   | 0   | 0   | 3   |  0        |line |port | 0   | 0  |
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
+
+**Reply:**
+
+.. code-block:: none
+
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+-----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05..0x09 |0x0A |0x0B |0x0C |0x0D |
+   | 5   | 1   | 0   | 1   | 3   |  0        |line |port | err | dir |
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+-----+
+
+- **err**: See above for definitions.
+
+- **dir**: Direction.
+
+  - 0: Output
+  - 1: Input
+
+GPIO_RPMSG_NOTIFY_REPLY (Cmd=4)
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+The reply message for the notification is optional. The remote firmware can
+implement it to simulate the interrupt acknowledgment behavior.
+
+**Request:**
+
+.. code-block:: none
+
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05..0x09 |0x0A |0x0B |0x0C |0x0D|
+   | 5   | 1   | 0   | 0   | 4   |  0        |line |port |level| 0  |
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
+
+- **line**: The GPIO line(pin) index of the port.
+- **port**: The GPIO port(bank) index.
+
+Notification Message
+--------------------
+
+Notifications are sent with **Type=2 (GPIO_RPMSG_NOTIFY)**:
+
+When a GPIO line asserts an interrupt on the remote processor, the firmware
+should immediately mask the corresponding interrupt source and send a
+notification message to the Linux. Upon completion of the interrupt
+handling on the Linux side, the driver should issue a
+**GPIO_RPMSG_INPUT_INIT** command to the firmware to unmask the interrupt.
+
+A Notification message can arrive between a SETUP and its REPLY message,
+and the driver is expected to handle this scenario.
+
+.. code-block:: none
+
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05..0x09 |0x0A |0x0B |0x0C |0x0D|
+   | 5   | 1   | 0   | 2   | 0   |  0        |line |port |type | 0  |
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
+
+- **line**: The GPIO line(pin) index of the port.
+- **port**: The GPIO port(bank) index.
+- **type**: Optional pamameter to indicate the trigger event type.
+
diff --git a/Documentation/driver-api/gpio/index.rst b/Documentation/driver-api/gpio/index.rst
index bee58f709b9a..e5eb1f82f01f 100644
--- a/Documentation/driver-api/gpio/index.rst
+++ b/Documentation/driver-api/gpio/index.rst
@@ -16,6 +16,7 @@ Contents:
    drivers-on-gpio
    bt8xxgpio
    pca953x
+   gpio-rpmsg
 
 Core
 ====
-- 
2.43.0


