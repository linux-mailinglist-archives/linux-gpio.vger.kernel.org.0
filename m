Return-Path: <linux-gpio+bounces-33293-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uOGxIm4Us2mDSAAAu9opvQ
	(envelope-from <linux-gpio+bounces-33293-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 20:30:54 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D000277F82
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 20:30:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 667B33023D4B
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 19:30:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6534A3FE65A;
	Thu, 12 Mar 2026 19:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="WKbBfHZb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011034.outbound.protection.outlook.com [40.107.130.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9793AC0EB;
	Thu, 12 Mar 2026 19:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773343839; cv=fail; b=FOEfw1qt81pOI2pVZAZjkmkLC06VIaSmAxnAY3k30RAUZM5z608LhJpObsXoyYYiN/1zBELIAdHeivrofStSiImNruawEsKq0B+SKWOiVgq25PYGF325CohVpZN63miNPRopiDF3Aa9cByBrsLozSoevxuc9GmDljmkip2SJ47E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773343839; c=relaxed/simple;
	bh=6SqKbix4u8uriJ/a6R0DzmkSlC3f9FELJK3PZKiIJaA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=d+elp9+mtQCrlOI6Csd0iXnTlrJopZWpY9ci9q2L8yScCECQyaxE8PdWhGOTeht3FPc9t4czHc+kVdQ1c9jzQD2/QVOfIbzAgQ6jnuI49U60/mTE28RwcaJa4EY4jmU9fdKgm+lOja10Wsss0daL0z2v5iHxNUtsEhWwW4VbuiU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=WKbBfHZb; arc=fail smtp.client-ip=40.107.130.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=thiuhz2Zfb03U9G7T/NO2pZpOc6fH0VDv5w8vwBwoROEY8DRar1ZI3DEZpt+zKvhA3n/IasXomYPIHfM2+mtSNfNg9RjhRAaGa9KU6mH4wWcg/JgdZ/c3oke+FaaTr783+UT9IVc1WSqGlpbNBTp5r+yUeiwCq6Yg3CU2Z4sAROM4TdlHZsbIJ/XZEVUsXvc6JlfFxVQwAdKwGq+ChEGHgcdZQF4+FnFoPe+PJT2mZjiafH6agWo+041bH9zZRCxi6jDwYK+uBoSRXKA8NVsoyqpv4DGEkCVFdPtDpDnvrZ2XZdpucSHp9DJLAWOpuXzi4RYJ7dvakrj3UcJ7sBgWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vHjn70swDdWLLv2zCNEtQPoHvvD+r5yGSKfMbd2+X74=;
 b=YxWkdcVPtPlJTkW+qSWX3JlQtKC1MY1GoIOvWJH4/2fZaVzEWOOeu+awEvBAQQzwoLVRTyQTm9JRH/3MfDQgChUroEEgB1X5lDY/d/9m0oTl9CWUZoG0P6AYEmlekDok9DL0ndAzgOovW4MOiLJw6jnpVjti+Q85xPFbMAwBdftRcXFqE9Dblt1/RTMkwLzSZbwITNAFhOaByOrASy6GpWpCiU+T/7ieEIRDkRC+FwbmKGhvMf9k5uVVvcp00/vrv/w10a1hBdyfncJTMbectQf+OEd0x5/IiSIT/iaRRM3CWv34IM12SP3b6bGK37dsv2q1syl1BANPRKZ0tUwWYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vHjn70swDdWLLv2zCNEtQPoHvvD+r5yGSKfMbd2+X74=;
 b=WKbBfHZbVAYnFYosSKNoPtTyAg1sYza0A0XeC4Qhfxs4sX5eg6uZ/00c+yjJbQFyLqQeMj8ShjA/sO/l/h8+Gt8JnNT97I/jkuLxGQMAK81kkdAoIa0Uy2l46oaX8vayJpTI+qdETdzEfLtPlt4TjYxSZ4zffgj4VNkQK1uYi7OQeCDuE9oc4kOE/5Sys8ucLtFwNGmKm93n0kvYtghy8U+9JPZsIkyIsLDX4N7jCcewln+y7inTsV8uM7nzSJuSvU5cyOCQO6SzxsvNOxr4y5ZXwDoWt4uioWEcHj8PBZR3VIQRnofDKEXKjKw/xxtSvUxmkHO98eGmAs0SD/0YFw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by PR3PR04MB7468.eurprd04.prod.outlook.com (2603:10a6:102:8d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Thu, 12 Mar
 2026 19:30:28 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%4]) with mapi id 15.20.9700.013; Thu, 12 Mar 2026
 19:30:31 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	arnaud.pouliquen@foss.st.com
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-imx@nxp.com
Subject: [PATCH v11 2/5] dt-bindings: remoteproc: imx_rproc: Add "rpmsg" subnode support
Date: Thu, 12 Mar 2026 14:29:54 -0500
Message-ID: <20260312192957.1978329-3-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260312192957.1978329-1-shenwei.wang@nxp.com>
References: <20260312192957.1978329-1-shenwei.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA1PR03CA0004.namprd03.prod.outlook.com
 (2603:10b6:806:2d3::8) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|PR3PR04MB7468:EE_
X-MS-Office365-Filtering-Correlation-Id: 63f20c70-f8d6-4f01-2b84-08de806dd31a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|52116014|7416014|376014|921020|38350700014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	/9qQqT6lyBhL6EeI/JHlmv2dhc92Gn3hkr6MVPF34pbqlLKwy0QXKhyFeJVUYBtjAD/xNPVRzCIPfuVwCjlNpygCHyf0tGp/idEUQSHwMwB8ZXc/hzKgXUgV4pn/ZKyRHmRe/xfbPV+R3kb93UFRARkJyRVC2i/HIYq9Cll0/DK5mFOEUb2TbNHlk+h7iYsBbpS2iEA6x1cGajOffSmXKxg5A0phIlPG2OHPY5LoOsEqX+aBFi4KN+jDXkFD0mgMZkogx9ewQfbh3IBb4ilftgWTgaPETYoDuRN3OZRzaqjhBwT3je/mHlPYvR7OJEjOaUBVyxFcjlRLpCKTJlX8RI5WOgguxm5nLQLETQdH8cgUDOUYSwHdkNhbd7iaQwUUNtPbayfea22ZlnRhXW4NYwjBH297Zt3VS9SpX9/P9St3kbI2BDhV1Zr9z/GSVDetf4fzQobrn2gosj5N4oE5HV7zJaBuXXY+i3EGrnhgQn3dmfm4VNOhTwJb2aSVg5ZFPKYQZ3dOr5AFcPbB1sklz4mCC6nFHMDddYlXwgGeC6C10D00Wy6d12f+aBJIObHnF0I1D77/9/BT8CiM0ntP0ZmsQchFEBzeBY8q35NaDdqouh2VGOIawIvzZDF+RmnOfXJZ3WqBx8k1cSgMvh5ENPzGaD6LfuVEaOOLtkSF2KtxgN+n8eSwqhrdYq7rWasM5YNmHg0OIn8eMARRfxvoZylMVDZYC67wFhWFvo37Mbj6gBzT1HFLU320Pfardg89pFmQ85O5+BsxQZ3Rri9CDg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(52116014)(7416014)(376014)(921020)(38350700014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zraCrI5OC56C7OUmJbjs5pGMVT8Fe1R7kMOHfkwzYXai47DLdBOi3HVzD3cx?=
 =?us-ascii?Q?6M51vSGigX0Sy1VMyMgsla/jSlk/A2FeLvZ9bpkVzOK3vIP5VuN+qHye7qOs?=
 =?us-ascii?Q?pS666ftsPst0xMea+NwKN0Dn9MuEwgblYZP6Vp7nXoRTSU6FRSKZN2hpOLPo?=
 =?us-ascii?Q?OiNGy8KDL6wk4VFKRKkFgKqA6Q2F62f2or/tELp2rubpA8fzRRoCeAGy0HbI?=
 =?us-ascii?Q?PBbvDjdDcdq7Jyiw+eoaQLsUF1oX21WCeO/J+Qb6ybUSQrtU1z0fkv6z+r+V?=
 =?us-ascii?Q?5CmKteL+UdwkklAPNNXqwtSv/JyFY/xqip4pIgPusV+JAKe6dmOkAxUMjsIU?=
 =?us-ascii?Q?gtFVW2dQCravldUC+Byfzy1EAE9Ofb/Ij0kXWaGykfRboWP5+NrM/Rt716wv?=
 =?us-ascii?Q?io6xdd0fYkBtf9qEyKOdVlmdNtsTA2cS3nkAy4BRp9o3HW2asSSE6V/eUzG+?=
 =?us-ascii?Q?cwqbkfeITy90m2PAC+n7z/1FeRtM/Z6ayYXXE9ogPMddo92U26GjZ4A3kJ1Q?=
 =?us-ascii?Q?KT9M9YD1pFRqN2mmSe2TUw6DjcnS09aWNq5AD1JONj62ajiBqaR38C+D0KF6?=
 =?us-ascii?Q?y68+irg9hWRD/BevvuqILFFTIGJIp1X1zUuLgnzweUNjvQO08+thUzjZyxXK?=
 =?us-ascii?Q?z3uf+eWdLsVEvwf43I/bsSKk/TX0/uI0ISLc2OJTwiUKtYoUcGXD4ziWm6MW?=
 =?us-ascii?Q?ppxYhiQIP7H/VMws5aJXo+kjuZy5xIhBgRJYmYO/YqzXpMuiKiAZ0wUmrpM4?=
 =?us-ascii?Q?wc79z8Rel84xLjln+zwG3lpTJLY7XPxBNlJGM0oobzs7jO8kM5u7McBZRUGj?=
 =?us-ascii?Q?llt8dtXDQRwUbfTbhj8PxlgKdKHsG/tIXJAACU/aCaDrpMbJE/BXHak0ljJ7?=
 =?us-ascii?Q?OzFLQNs6HQzeIMh9USqItJTImU/qBfOh0i+gep2ruB84cXkbPGzWnaxr67tE?=
 =?us-ascii?Q?6Mihvi6kVqPSZiIDplLTw7Inmlhfzl8jCpUC+DW5lJxF9LvUlG1zWRKHkB2H?=
 =?us-ascii?Q?Lxyv3hwrWpMM/JL7zuDBmgwccHZ3i9m/TJZxHv1A+PbbF3QLRaHwA8jHT2A4?=
 =?us-ascii?Q?jm+iwKIJWK394KvlpQlIOekzTt4o6r++VroKhtsTCLkbvNlihfme91mVWL6V?=
 =?us-ascii?Q?VVjapkDN95MhxXczz524CQhFMmfddLcinqcKV9+1sTikZqS//x0AC+boK1Zr?=
 =?us-ascii?Q?SbZkEm0yvTfrE+4Kgvu3HZzwvaaccEPA6IRjieAvZYOaK7O919ewytQz5NAn?=
 =?us-ascii?Q?X/BLDlgOp7abPfxeqiAbSz5WLzFI2/Yh5QFRh8h50IuDo0t08pAkzi7Bgc1W?=
 =?us-ascii?Q?SrrQ+hC60dApIJ88QyhkfWQ9w1sHFckTcVo/SOJD3uk2AbPnVG2zSFhVXKm+?=
 =?us-ascii?Q?tThJ0e4seN1PauyPLgTXBibO2B1GB18188eXNPyFoKAUsM9SMTCHZ9FYHvF4?=
 =?us-ascii?Q?zp5ePGgBHWqrUORnyPQ1ZeNvlMhZmsmGdUSRMHMJ2VlHFm2qFRmtIAVjU8TE?=
 =?us-ascii?Q?CAqvypXj08COUwdVMCUMe1EZEUAadUnT+twl9wI6Oc5b/c7GgcYB1EOho3NU?=
 =?us-ascii?Q?0SPTG/8OPFmwlCkB5+WRaEKiyiAfPhUtD1BhAtVt+AAAK8FE8bNrDNfkDdHM?=
 =?us-ascii?Q?51f7QxR58vCREYhabYHGz/+//71bfi3vQigD9ZXDVMkRQAUrWUUqOd+z7Bb8?=
 =?us-ascii?Q?QjgXTd1LuihSKfk/kd3hUxH88J5EeMaoUhyEohTNMeKUOGnzqjVHVMBTf0mJ?=
 =?us-ascii?Q?PesI0rQMBQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63f20c70-f8d6-4f01-2b84-08de806dd31a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 19:30:31.6672
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qakaEug1onog+clX5louR9SNXjTHNhV1EbgD07qGzNWVHblAH6uIagP9QzNuU8qcKG2poF75iXDMMpxdOkC95Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7468
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,pengutronix.de,gmail.com,nxp.com,lists.linux.dev,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-33293-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[24];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shenwei.wang@nxp.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_PROHIBIT(0.00)[0.0.0.0:email];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,nxp.com:dkim,nxp.com:email,nxp.com:mid,0.0.0.1:email]
X-Rspamd-Queue-Id: 4D000277F82
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Remote processors may announce multiple GPIO controllers over an RPMSG
channel. These GPIO controllers may require corresponding device tree
nodes, especially when acting as providers, to supply phandles for their
consumers.

Define an RPMSG node to work as a container for a group of RPMSG channels
under the imx_rproc node. Each subnode within "rpmsg" represents an
individual RPMSG channel. The name of each subnode corresponds to the
channel name as defined by the remote processor.

All remote devices associated with a given channel are defined as child
nodes under the corresponding channel node.

Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
---
 .../devicetree/bindings/gpio/gpio-rpmsg.yaml  | 55 +++++++++++++++++++
 .../bindings/remoteproc/fsl,imx-rproc.yaml    | 53 ++++++++++++++++++
 2 files changed, 108 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml

diff --git a/Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml b/Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml
new file mode 100644
index 000000000000..6c78b6850321
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/gpio-rpmsg.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Generic RPMSG GPIO Controller
+
+maintainers:
+  - Shenwei Wang <shenwei.wang@nxp.com>
+
+description:
+  On an AMP platform, some GPIO controllers are exposed by the remote processor
+  through the RPMSG bus. The RPMSG GPIO transport protocol defines the packet
+  structure and communication flow between Linux and the remote firmware. Those
+  controllers are managed via this transport protocol. For more details of the
+  protocol, check the document below.
+  Documentation/driver-api/gpio/gpio-rpmsg.rst
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - fsl,rpmsg-gpio
+          - const: rpmsg-gpio
+      - const: rpmsg-gpio
+
+  reg:
+    description:
+      The reg property represents the index of the GPIO controllers. Since
+      the driver manages controllers on a remote system, this index tells
+      the remote system which controller to operate.
+    maxItems: 1
+
+  "#gpio-cells":
+    const: 2
+
+  gpio-controller: true
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 2
+
+required:
+  - compatible
+  - reg
+  - "#gpio-cells"
+  - "#interrupt-cells"
+
+allOf:
+  - $ref: /schemas/gpio/gpio.yaml#
+
+unevaluatedProperties: false
diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
index ce8ec0119469..88281ffc18ca 100644
--- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
@@ -85,6 +85,34 @@ properties:
       This property is to specify the resource id of the remote processor in SoC
       which supports SCFW
 
+  rpmsg:
+    type: object
+    additionalProperties: false
+    description:
+      Represents the RPMSG bus between Linux and the remote system. Contains
+      a group of RPMSG channel devices running on the bus.
+
+    properties:
+      rpmsg-io-channel:
+        type: object
+        additionalProperties: false
+        properties:
+          '#address-cells':
+            const: 1
+
+          '#size-cells':
+            const: 0
+
+        patternProperties:
+          "gpio@[0-9a-f]+$":
+            type: object
+            $ref: /schemas/gpio/gpio-rpmsg.yaml#
+            unevaluatedProperties: false
+
+        required:
+          - '#address-cells'
+          - '#size-cells'
+
 required:
   - compatible
 
@@ -147,5 +175,30 @@ examples:
                 &mu 3 1>;
       memory-region = <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>, <&rsc_table>;
       syscon = <&src>;
+
+      rpmsg {
+        rpmsg-io-channel {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          gpio@0 {
+            compatible = "rpmsg-gpio";
+            reg = <0>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            #interrupt-cells = <2>;
+            interrupt-controller;
+          };
+
+          gpio@1 {
+            compatible = "rpmsg-gpio";
+            reg = <1>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            #interrupt-cells = <2>;
+            interrupt-controller;
+          };
+        };
+      };
     };
 ...
-- 
2.43.0


