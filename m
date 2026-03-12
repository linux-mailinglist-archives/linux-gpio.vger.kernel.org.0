Return-Path: <linux-gpio+bounces-33237-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eMgsOKGFsml4NQAAu9opvQ
	(envelope-from <linux-gpio+bounces-33237-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 10:21:37 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F51226F79B
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 10:21:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 14E933028001
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 09:21:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C09A3AC0C6;
	Thu, 12 Mar 2026 09:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="MQ1HXX+7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013006.outbound.protection.outlook.com [40.107.162.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB5623BD05;
	Thu, 12 Mar 2026 09:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773307292; cv=fail; b=Qf33KvAG6qWdy8/+zg2gJ+dx4iWDQzJOG5lunvOCOxOLJT42k40wrxY3Ubhw5hCPM+QCDcBoVMV6QBTR6g/wrG0h+417Wf+hxcTd4N9sw5gCngxipw+wq4d4Wmtr2fDHIr0G7qOZjyg67POlsI6sr57/rbp27MjseDYpvPCz/SA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773307292; c=relaxed/simple;
	bh=k4fogNkHXWPxcHHFWUlm9fyVAApwQXDSZjkQl7N6vpc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=QF96Ig92X8a0dXDj+MgKDZ/fD2V9z0R0sFUbgGPNZLcYBq38KfX3lW+R24yoNgci3KhrR2l6JhgpwLCous5Y4cdGZeSy/Cq8tBwd3ahcTbmFT80vnnEtxRpgFEDn+XigKGzodfBZC+NBCi8brpRcYxINha/wcSK5uRX78+XctRk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=MQ1HXX+7; arc=fail smtp.client-ip=40.107.162.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZCnkEEIVyfxU4exY+vmGjHG7p86SZdnjnTIlS998Qid0qzQGOR9IgqlSIhOHtVQcotdV6+pGTN7DEbJxZEG+4ZpK3MaBowlCidembbOa1pJpVwJ7ooxWWrMQg9dvnHs1FZ+5uSbctKDIuWYPgPzFNk4+iYJrKrzoGKE4kkSWqiNAIWIul7TMIg5W0pRY4MQ0U2N5qID1xlmUDeThdZzqF+jVwoBwWnVw65EvAY1CQQK+0HmSOehQJrQ301duB0r1OTh5XtVm9ksba8fDP3sUvwRpMyCwFs5vPamqY1i+VQ5ODzltQFx/MDVEpC9aZdq/xtRmwLktKOFj1ZGxJtE/eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K3hRyLas/Q+xXDmvc0rZbDO9N3RkScigw2wBCv50L54=;
 b=K9Y67RekHYrrwEmWhR+Brc7ck/en8T6Ul09V5eHCf56Cy1fGfn+jXiM6RvOIEoK40tTYmbQ97c4Ha514Xxq1y1psXiIsjxwGUZBt7w1kEQWcNAHGm3Pg+43aYAZMKo2mkNCx+dHO3QckJCBzZhpIbnFzhObk49oZTgPRndJGxzK0bIfxZUb+2VdfGe97/L743Q+kBnCReHdgeiw2CpyVVa3hcQ8gldR5aPa3jV32m71Iggh/4/e/Bh8x2aISyssVsfDtGa5WsOeVlRNGbE0zJLNmwEahto6uJPrFOivHw/YX3om+kF9pgOl0+SQen9lK7z1CNn+mRrFxJsSSwMOWSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K3hRyLas/Q+xXDmvc0rZbDO9N3RkScigw2wBCv50L54=;
 b=MQ1HXX+7zVZCt605PlbDy61tA1LbcoExJFjwuxq/OPe+smH7zsYxqZDQXhVaC3mJZWNNfkVH9bIrrD7CIqsQeeDMaYUBtKmPDM+XzuGtJ36D/BTHvpaLOIoSQ8exmcSoVtHEff6e0ptqoDJm3vH3+59KgXFZ7C9ORkk9JHJD1r7Vmwg4GGnA3sDoa8cJ5Xih/Ly/Y/ADhG5zTkmp2tY0sGyL7Bj8Nw3lwlPx/pL9kpJiIcehlT0NrQXAAU4XaoJtA+A+fl8XcAWzpdGaEzizR2H75yyQIYNayZJY/qzzO+US5Xyh/dQIomY1VyLCcBhpEpVzhMcxLIZuzYCpKPhK5A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB8402.eurprd04.prod.outlook.com (2603:10a6:20b:3f6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Thu, 12 Mar
 2026 09:21:25 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9700.013; Thu, 12 Mar 2026
 09:21:23 +0000
Date: Thu, 12 Mar 2026 17:23:23 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Tom Rini <trini@konsulko.com>, AKASHI Takahiro <akashi.tkhro@gmail.com>,
	Peng Fan <peng.fan@nxp.com>, Alice Guo <alice.guo@nxp.com>,
	Marek Vasut <marex@denx.de>, Greg Malysa <malysagreg@gmail.com>,
	Michael Trimarchi <michael@amarulasolutions.com>,
	Yao Zi <me@ziyao.cc>,
	Arturs Artamonovs <arturs.artamonovs@analog.com>,
	Anis Chali <chalianis1@gmail.com>,
	Nathan Barrett-Morrison <nathan.morrison@timesys.com>,
	Paul Barker <paul.barker.ct@bp.renesas.com>,
	Utsav Agarwal <utsav.agarwal@analog.com>, Ye Li <ye.li@nxp.com>,
	Valentin Caron <valentin.caron@foss.st.com>,
	Vinh Nguyen <vinh.nguyen.xz@renesas.com>, u-boot@lists.denx.de,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	arm-scmi@vger.kernel.org, linux-gpio@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>,
	Michal Simek <michal.simek@amd.com>
Subject: Re: [PATCH v2 3/4] scmi: pinctrl: add pinctrl driver for SCMI
Message-ID: <abKGCyZLNrl93RMj@shlinux89>
References: <cover.1773256350.git.dan.carpenter@linaro.org>
 <1048331f5d3c8e0cdbe1542bcb65bbf942a4275b.1773256350.git.dan.carpenter@linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1048331f5d3c8e0cdbe1542bcb65bbf942a4275b.1773256350.git.dan.carpenter@linaro.org>
X-ClientProxiedBy: MA0PR01CA0045.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::20) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS8PR04MB8402:EE_
X-MS-Office365-Filtering-Correlation-Id: e8ae812e-abe9-43c4-4430-08de8018babe
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|366016|52116014|7416014|376014|38350700014|18002099003|56012099003|22082099003|7053199007;
X-Microsoft-Antispam-Message-Info:
	yb2gRvX3qRHdmoODsOC3/aa7JBuOfV838blY24LVAueX9wbKIuh5S86A0Gf1GTNFl2wAkJFaRQj5GU7Awjg7GuGc3c9xZkFWVfNR97X4vWP+yckyL927gqEAdfKDiLp9ED8+KRCL4Z+KtE5JOqrvtClecMSl4EGUfqO5T2Dtlntxo599J3WNfn1OUHuYivg9/YB7W0a+FdfoeYgXy+IwbVs5InAhFEa/fu1pbGnhnOSmRLSfFcQ0ZaosrIOM1DNVh8RsXVb+PGjZDXvnUj1vixtMDp13K1Yg3ZOgKTNw0PtQbf1X/bpdamL2L2J7/NSSw7RnaI/M61cC62+PQyy0r3LaHXpOhrkPZ2FUOmWKsoZrjNc807TWyLPcpHD2sMFJCnqealBcqFOS15WSkHEpWe2VRs889VntLVMTKHJtFxUkKMCjc5dz2kIsSZyNMoNT7eAn0dql7R6Do80d+2ybLqqe0ILDUu0PX6jKxnhEaws8vbVs6B1DDVobLMFQqNDPT4AdzRKZFPX4G/ZmlZXGiqJDPsZsJIIxdFk8sMgOEsIIqz69yaV1Ok3V2I5JK3FyK4L+78LwYIk4bp0EaXbDFnFfc4A1iSpVzTKj7IXZyI/ouLCzcGPHfIBZVSef97Xq6cWc/mtSDd3z2d6XZeMvPeLz6w04fqhb/2uEICl9Lhquu21/4+BYFpNstuRuhy4h2qOc1UixVi9zZGqA7l3eRg3VO2o0SVTUL9pG9eBa4PGkLOIvQJF13OTmff8pxhJJJQPdwFSg3QuRYHE1hQk/pmAb71MMpBXy0rkX1TxeOTI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(52116014)(7416014)(376014)(38350700014)(18002099003)(56012099003)(22082099003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yzRm09XwHQr7SsXnDlS7pjZBsj7lKI23RloWBK3P6qwsk2vO1AXvWm4kYwoD?=
 =?us-ascii?Q?1X4O3Y22/FlsK3cyMJOIz0jOqmGH+/dQ8+thL57v7l6E4xLhK+YC7m+EW+Ea?=
 =?us-ascii?Q?hmOu8UChy9Kf3qowhRDlK8k4Jwu7mpGwcbB+9wuqWeVYeOYuqQeT05CUVlMe?=
 =?us-ascii?Q?2Y5sEEHqjhQh2dT68+N8hdZNZGW2yKt/v80/orSQ3zylU3/nxpVhUNgq5fh6?=
 =?us-ascii?Q?RE/VNdM0Vzw48RPw5hPBLiqBTimlgRkvUZfyCWVfQ/mOmzyLRDBPTXW8q0LG?=
 =?us-ascii?Q?tTOFLndlV9ewRbuFanQu+ABmN+rFFCtpYFDvDfsrdLtFQeyNs29kgfaB0HVa?=
 =?us-ascii?Q?IO9eLoHqhmvWQWVxYSpi2HGj4immIIAepjAL87ACycuBBRb8fOyWcBxUZxkQ?=
 =?us-ascii?Q?8ztKnPfHnoRszOAoZpSZZg49JtwxBuYBwR1YHr1C0IiCgIv6mkyYQyfalCX9?=
 =?us-ascii?Q?0n+pnSzb+TMWP+Dlkj2ILHwH0kok0j5IqPS7qpp1JGUiu2fsQ5ejbIGN0EHi?=
 =?us-ascii?Q?VsO+T8Nf1uUdKIzTWF8t0zLo74k7Rtswt1zaxFvQNrqPx5AI05XDgnptIfdf?=
 =?us-ascii?Q?Remhd6a3VV6LCv/wgLkaSaFBY7zL7d+Cxd3zCWniKcci0I2nPVslUsRNIYUm?=
 =?us-ascii?Q?mXlExzHxFsof1nRnv6p0udDHmeV0ONHQCncdwJA3xwwgkpLwiNGZzqRr4MdB?=
 =?us-ascii?Q?9otQIbkLwL9KB8t0Hjd4Qg0ZB/bZt2SItRW22+S6oA+4mMrwm4G6TCj80Ulz?=
 =?us-ascii?Q?nKWTh/A2lWOswA4cqVlOr9NAiFz4L51+WahUlCQE1KKkxRp2BJfSFMPLvW9/?=
 =?us-ascii?Q?WLLN7ax6dG1n/JVYIJUSMb/JTpGZCv1BsraMbuH+KKFhXyvD9hif70C8DBTL?=
 =?us-ascii?Q?uq7/i4kBAq+hxEhYtOwg/waQvWQf4GVr0H3NDrL3t06RnXFjnGIb5vTRYT6+?=
 =?us-ascii?Q?hUjd5Zg5iXfYIj+VFlhmyILBQa76Lqtj39zInkPuVCpiAKXUMmYmBHf5cm7R?=
 =?us-ascii?Q?OnylX7dSS7uzCoQgK88rl63vHJ4K6a6hfyxavlcaonsSIg1ungeq/gOPTEdl?=
 =?us-ascii?Q?NIK2afo7vvqEtGTW5Q2eMYJpyIyGGFSwTLHVVFiEcOLY35mxTbLzhBdgGdNs?=
 =?us-ascii?Q?LjzaEUoahs07Xysh2+d4b5TaQvMGQLLqHdB5s+MuwshcjOhygRiV4myarEuA?=
 =?us-ascii?Q?Pdab9fw09RamFZVAXUo8EXZD6zHsRf46I6vLTQV8fFnzH9TeJAho6jMqci/T?=
 =?us-ascii?Q?jUi2Qczqqznb6nR4e3n8005noXKUXSGQ7fCcSPW1BSglURJhwne8P1xBImPe?=
 =?us-ascii?Q?/yo6zXR3H3C7QTrCEAR6bhel65sm99jHstGH/Jf3YywsCubw/OwDu9T5mQ4u?=
 =?us-ascii?Q?C/B5qR1xIQCCDpK+VXKsWKLAnfV5G8FeG04dy8lzJUwAkRRuy/Fiff0yS7u4?=
 =?us-ascii?Q?ghsrm0P+/SH3NU03HCeJog5caCdKg9bUOfvO9F33cAwYOjo8hAaj1+46A2DO?=
 =?us-ascii?Q?moNG9H37VZFVQgLaeH6xt3QOTjDDL4EOlyVfjMelNtG91aH8xGDgDI8oyESo?=
 =?us-ascii?Q?L3Tm7hsPXOKQ2+GWRucVk4FKwMS/Jx6AUF8bfv0vYMGTMVcElW7Ule7DSy3f?=
 =?us-ascii?Q?Wvf57yO3paIVq4JRLCfq/VIR3SO5crR/A1UlLBOql/mF3WVrcLJNtOrYPN+2?=
 =?us-ascii?Q?EdmW+kvmAY+tXdUB89TyKRrAB6TpyTvbn8eDJsyAwZBF2cLKvu96vCjQEpuR?=
 =?us-ascii?Q?IP+Ln9SStA=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8ae812e-abe9-43c4-4430-08de8018babe
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 09:21:23.6887
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ieTm4oWDVklE7rMCW/b4qzNItAeA1PB23uLuMuU3rVTQnc9XZRMl541Osl/l/thNoEd7ZQePgMQcgYKJ6I+JiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8402
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33237-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peng.fan@oss.nxp.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[konsulko.com,gmail.com,nxp.com,denx.de,amarulasolutions.com,ziyao.cc,analog.com,timesys.com,bp.renesas.com,foss.st.com,renesas.com,lists.denx.de,intel.com,kernel.org,oss.qualcomm.com,vger.kernel.org,linaro.org,arm.com,amd.com];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:email,0.0.0.19:email]
X-Rspamd-Queue-Id: 2F51226F79B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 10:41:25PM +0300, Dan Carpenter wrote:
>This driver adds the base support of pinctrl over SCMI.  The driver
>does two main things.  First, it allows you to configure the initial
>pin states.  Secondly, it's used a base to build a GPIO driver on
>top of it.
>
>To configure the states then add a pinmux config to the scmi_pinctrl
>section:
>
>        scmi_pinctrl: protocol@19 {
>                reg = <0x19>;
>                pinmux1: pinmux_test {
>                        pinmux = <0 1 0xFFFFFFFF 18 1
>                                  0 2 0xFFFFFFFF 18 1
>                                  0 3 0xFFFFFFFF 18 1>;
>                        function = "f_gpio1";
>                        groups = "grp_1", "grp_3";
>                };
>        };
>
>Under linux the pinctrl subsystem will parse the function and group
>properties and use that to handle muxing.  However, under u-boot the
>pin muxing is done using the "pinmux" property, which feeds raw SCMI
>pinctrl PINCTRL_SETTINGS_CONFIGURE commands to the server.  The
>numbers are: selector, identifier, function_id, config_type, and
>config_value.  In the example above, it sets pins 1, 2, and 3 to 1.
>The linux-kernel ignores this pinmux property.
>
>Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Peng Fan <peng.fan@nxp.com>

