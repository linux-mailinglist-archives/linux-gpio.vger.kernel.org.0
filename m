Return-Path: <linux-gpio+bounces-38042-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id m3vaIZC5JGrq+gEAu9opvQ
	(envelope-from <linux-gpio+bounces-38042-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 07 Jun 2026 02:21:36 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9B064E953
	for <lists+linux-gpio@lfdr.de>; Sun, 07 Jun 2026 02:21:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=iopsys.eu header.s=selector1 header.b=bISwwpFG;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38042-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38042-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=iopsys.eu;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BAF03305D6A4
	for <lists+linux-gpio@lfdr.de>; Sun,  7 Jun 2026 00:17:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82E83285CB4;
	Sun,  7 Jun 2026 00:17:24 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021083.outbound.protection.outlook.com [52.101.70.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D77E280A5A;
	Sun,  7 Jun 2026 00:17:23 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780791444; cv=fail; b=EFgx28In1wcriId8x+nXT3B4ycpIgcX2Q7WdGHDI1o5xufU15Fm7Gy1HRc7vqCvtDGTk3KmUag7o4pSx5PmdbwwzlJsVv4ELa6kSUEy7DQFdqqKb5eAh4/NtfQpdPlFCinZMFFXKF2BKVxeiES/Swx5JLN9LsxIiQiaDlpeae+E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780791444; c=relaxed/simple;
	bh=DHXcAdTgGi+pyHsTvI7Y0cHfe+bVThveHoq26C8NeFk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mBFyuk8SeTKFCRQwF673gcBTQCkt4joQZ3RIpR329mPaQLYyWkJqPx6x1IjQQ/Il5Mo8n9Gx2qUDkdmXfzVa78pJ33CBq22jDUCHW2PdZiugOriMknrX6Bnn4CqUUQPk68YLlbfty4uixjY5YhV+eBcDMYSw26Y73zkl55KA2O8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=bISwwpFG; arc=fail smtp.client-ip=52.101.70.83
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ic91LRgtEoC1JvZ7o2To+yt/ka5JCOJETIEKL0cS4KfFEGxOg9GNh6XV2Hdk7C9nj4CtyjRygmSvNbeLr21sk08l9Q4OFj/vifQC8s54G/uJDi7T5YiWGa+6O7NFNciekn0iT2Op96Ed0EJeC9wrkWdqxTZSSVHp1XtXOF6K9aOZlQvUz6vFCKO5TBsDE/nZ/IaKR4aTFZG9sI5xWjW6BU/keodxhnWEzhFQF+LWwdtKKgeqBK7Aeukz1p/xpJ0uhmdwR6qy1qCnisZsFW+MRyXDtcAPmURpm6A9IrrfE9UuGpjXjaVzDGLGGThn58pGHcwxlchxquAGkJOPlBTgOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=muSguldPZDsh4fnmXwDXRLeLjpkaF54PXcQu9iax1s4=;
 b=OspnzZCvPwDlHhiDrc8J0mHBejOtZOhmmOMceGt/x2DGO++Sfp+gQ1SLYee+MUU9QXCbPvXIFcbTjOwWp2rHqKuFjgxp1is1/fLga3NJPP54TWd9EBPAzoWjb0x+maYrq44e1leaEG9TOhQ/sU1whqPJlXYgW9JYcukD+m9Ut8QnedqvMilkxkc+8fQ6nvsAea3UawuzoGjsIvwTTMgWaoch1DRpIDsAJiwd87wpff46CsesLJjKMCfIufmRPJl9A2MG3Y3vZZX+HXL/qCKbWGkIHMQu2yJM3z6R2zDTzbwpYA34E0oU4tZ1u7qthEzs2OLnRh9CxZgfrLf9N3PfQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=muSguldPZDsh4fnmXwDXRLeLjpkaF54PXcQu9iax1s4=;
 b=bISwwpFGfcGPUf0Rl6QyPdSnAhWLyCuTDXt4+GO4tLK0cySRhxPI7WAYMkaq4qjeeCjS32uc3A5c7yXrn48xlMdTXQulQUimtWa9zZIJUbROFCqeJe86t3VMfKQmqr8+79aJvj9Ss7mOS2W7W8YUS1XJGxdnJsK6+xBoqxGqrB++TBW9pjLXBgwjEa0LQUQYKBVsTUnPOTD8GDwB9a9whvd3jxLV32zjReG/mMyMpboW5BljdGNGTuqtIJPtWGGhFHtItwnpma6J1Gf4pjnVUNFHysJqFMa+r1o9U85gTcXz4T4jMxEUFtcfWGSPbBtFQoeHT1fnZLq2iy/5kzQqLQ==
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by MRWPR08MB11707.eurprd08.prod.outlook.com (2603:10a6:501:9b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.11; Sun, 7 Jun 2026
 00:17:15 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0092.007; Sun, 7 Jun 2026
 00:17:15 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Linus Walleij <linusw@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>,
	Markus Gothe <markus.gothe@genexis.eu>
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH 09/18] pinctrl: airoha: an7583: add missed gpio22 pin group
Date: Sun,  7 Jun 2026 03:16:45 +0300
Message-ID: <20260607001654.1439480-10-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260607001654.1439480-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260607001654.1439480-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3PEPF0001DBFE.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::319) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|MRWPR08MB11707:EE_
X-MS-Office365-Filtering-Correlation-Id: ed4caa72-69a6-4a5a-519e-08dec42a20fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|366016|22082099003|18002099003|38350700014|921020|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	ABNa1qcrUznjZxOfkUYnYN2bY65jITV7MDOXDC4PxgzGPNQQMxortTK+kbjs212d+i6ox8Tbrh8bnDGHkqbiDJzCNZyWl2pO1iQeAqapHLuop/Wrg+TFaghB0COFv9wrvCTRFC3yzUeG3Wq2gkxOsW9+fmt5Pv1Bht3YrHag9X+W946PgKCR9633lcVDDisF+XnLZ+06OUKWf+LKjngRKcq0+jjdzVa1wC0kHVDIMOgPmkes8ps+TwO2lxLlnuPDDcvm2xwSlpkOJsIMJFlIi5Rsd7hHD0WlLn7NIYXZVvaFPo7RG38KeJ4mP2q7UpVUxBRwANuCOjcn+btLcppipAucT1IS5RiCbFq648NLII6MCIRbnnR87a6BP+gl/QnpoYGFIeXye7UtM7sHwl/9f/xCPD8V9ZNdJ25T70Y3Oi3vNUW5vDvQidU/pFy1ibPcbi68qgn+mdl8n0MFizWRM0FsjK/+QdsCEfaMpyDcdAHfo8BxnhKohzxll9xI7zCuGegSjbYzIHdikVMtz8qNZolpo+6wdjz3e2SpDELuyA6jEXajoPxH0SJCh1s67HWoFZ6dPUw7mp7dxvWgKmrgyJa+gn3R6mwxRNbShpJFNC7GYQD2h2VzlKZT1fwSG2kezuUj0qDfQnl5jI5gaEMrjyrqT5Brh/H5p2aaxEvwAGc+3fB3z7qAHpBS2imV6/VLP2fkyXyJvWqM556SlcGtcO+ODi3tewoG/2vhC1TSHOZRw/eAjmaCIXFb5kHoXDZl9xBr8jqPBDczNAvvyW7y5Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(22082099003)(18002099003)(38350700014)(921020)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JchQRGouyGh72uUGu/NLrzpnzdGJJuz6UcDaTSu7t68q/WuTWVeLQPMUV0Lr?=
 =?us-ascii?Q?7kE0tceZZvB7VDPfRbCkZlUAA8m3czFW5vFPzKizn9gpoHlgy/BZKeeOgMqi?=
 =?us-ascii?Q?4AxMnzD+tNF5EgwGzD+4toh8MCj8rnE7Knd4Dt1whm39Be3qSrIrQXKJuawd?=
 =?us-ascii?Q?UMHxIJrrSNt2ZPfsfzgvCG0E3WnkmsyQbH1bLT5ga6Cr1mN9nm57GM613RGT?=
 =?us-ascii?Q?sDJjD9TRQMrbM4DZJsRBrbFVp+gw+WtCBxOExASXw/QuOARPEz2tnRtHGQn+?=
 =?us-ascii?Q?t0PpjiZU3cUMikJvYNle6teVxr1HlinJC48MTLoDEQowc+Kl8Twbmu8VYoc5?=
 =?us-ascii?Q?yIquREzsyM3yq+uKdGov7vJrscUlXO60FFHtZxYXOp39T/xy1G+ZuEIhj3v+?=
 =?us-ascii?Q?7+BS3Cc7WWddNJhhPg/Hs2G392stRuAWZSG/IICsLWIegK7kvRCI3KYM/wyX?=
 =?us-ascii?Q?7lejqczr7vv807obhWBnRRDbPwhpxTaf8eCHSybtKBSyZa8CHCDh0tOsYCjR?=
 =?us-ascii?Q?2Gu1Y7qDs10cO+sVS5aFOwDL8Rst+vBMJrtSXsYzy453D9QJI2zqSUmfPHiY?=
 =?us-ascii?Q?7vp/No9ToZvCqyuHzyHmPJb9TWPDVHud2IWXlx/Xsm3ArhIoNFWj1myCrQdw?=
 =?us-ascii?Q?cZCEhwnNIsRbJT/X03ganVD5soWELYZ2zqQtu+fr0eLOg44tmTWjn9QjEl9c?=
 =?us-ascii?Q?ysFXNAGe5AAr8dVXy1eQj5vQ7W38+218fzQ2fqunYQZe+U3QIlECSd5Y+ogc?=
 =?us-ascii?Q?YQJSgeACrvDcUDfS1f6jwzNQ5yJnI8jq6iWO/pFDWSzqdFkwrRsagDaL7m6t?=
 =?us-ascii?Q?6ik4MAU6mLhegCI94H+VN9PVSkW2Xw9wkljgP0xxJdz2Q3Vbp98OHSSuqHK0?=
 =?us-ascii?Q?GzBfeIHuS9pXSJnQQqQ6b4VThNnq2bF9iqmDzOyykvhZh/DfZUrrsq7REY3p?=
 =?us-ascii?Q?QvSyHy6LxDnfkZ3nJpNK1yNVBTj0Av4CBbLhVrp329mMCk0Ie3w3du+N/kUY?=
 =?us-ascii?Q?teuWtP5ks5SaoTU/aZeC7RXnpiMFpw1wL+5zWCdjZLVgXbcnRFPAM/ESqyUU?=
 =?us-ascii?Q?yIDRMeQR9Mv+VRK5dWYlXL5GEt8M+hhmj7qYABFulTAVbL6YjhpB2vAUSf92?=
 =?us-ascii?Q?Fc1GwmAy21qPPCHgjx7tYEz6w9WnL7SG8oxSLskSQcZqEbhDmrO1488XKrUa?=
 =?us-ascii?Q?hTSUywjzB0VQxXM0ECvkms4f+EmfV3QMFudjHpQw7ib4IAl4Vj43qYpCh0Ep?=
 =?us-ascii?Q?CF/cV64YV4p8W6KBFJtha6RHVj1dCMutwpv1SkTJtyKVdgY7urnAm0MAkuAA?=
 =?us-ascii?Q?52hPuJg2oxc3TwuoTkO57mAZMs/+kXO0oqWFyGkr0BaCjLCzXIfuAmUxrzxM?=
 =?us-ascii?Q?fE6NSY7+ZksnQMfASy7l107KBIjKHOuwFvDzzImrtzIw4BGn7a7x767/A4vx?=
 =?us-ascii?Q?c2JG4TgUAGEmEyhfLxtq2VI6buR/+d3GWYeSthWOKhDOZSOIOIdqfJ+CxcdC?=
 =?us-ascii?Q?hA4ozFCvAH123ZgZev7GuMoY4as9rSUmS6AG9wfHVaY9SiyCTlD4Mmnna+VW?=
 =?us-ascii?Q?uMCUlWruO3ik3lIGFYrBX8bu8Ayk81GhwCQnMUdPk+/Ej29x4QvF773qKFoF?=
 =?us-ascii?Q?3uBTIifR76YIZj5sOrpxsieywGtXeGUFL5g92CDyRsK41oGowFdscXvZvTmc?=
 =?us-ascii?Q?IN5KbbeDhqkIQGoDyKgS9VoBgOD83PAWpBKeSIMTYNrVvPJ+8QckXcdzxU4U?=
 =?us-ascii?Q?9x3aZZcfX2d7Jldzp4FlqpQlKZso2Fs=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: ed4caa72-69a6-4a5a-519e-08dec42a20fa
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2026 00:17:15.5940
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EbqAnJGDiSXB7iaYbEMLmYytRvzCjSd3WpagZTdfAuTlSHgMr19Ceh/En6vbxmvqurmQOdjNzuaM5UeI1ZJ6u1M3hX+/Y2PxI0+9GJQ7FkU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR08MB11707
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[iopsys.eu,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[iopsys.eu:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38042-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,collabora.com,genexis.eu,vger.kernel.org,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:sean.wang@kernel.org,m:lorenzo@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:ansuelsmth@gmail.com,m:brgl@kernel.org,m:benjamin.larsson@genexis.eu,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-mediatek@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:srherobrine20@gmail.com,m:markus.gothe@genexis.eu,m:mikhail.kshevetskiy@iopsys.eu,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mikhail.kshevetskiy@iopsys.eu,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[iopsys.eu:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mikhail.kshevetskiy@iopsys.eu,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,iopsys.eu:mid,iopsys.eu:dkim,iopsys.eu:from_mime,iopsys.eu:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EB9B064E953

gpio22 pin group is missed, fix it.

Fixes: 3ffeb17a9a27 ("pinctrl: airoha: add support for Airoha AN7583 PINs")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/mediatek/pinctrl-airoha.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/mediatek/pinctrl-airoha.c
index 9dce3ed6de17..e66b608c4803 100644
--- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
+++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
@@ -749,6 +749,7 @@ static const int an7583_gpio18_pins[] = { 20 };
 static const int an7583_gpio19_pins[] = { 21 };
 static const int an7583_gpio20_pins[] = { 22 };
 static const int an7583_gpio21_pins[] = { 23 };
+static const int an7583_gpio22_pins[] = { 24 };
 static const int an7583_gpio23_pins[] = { 25 };
 static const int an7583_gpio24_pins[] = { 26 };
 static const int an7583_gpio25_pins[] = { 27 };
@@ -828,6 +829,7 @@ static const struct pingroup an7583_pinctrl_groups[] = {
 	PINCTRL_PIN_GROUP("gpio19", an7583_gpio19),
 	PINCTRL_PIN_GROUP("gpio20", an7583_gpio20),
 	PINCTRL_PIN_GROUP("gpio21", an7583_gpio21),
+	PINCTRL_PIN_GROUP("gpio22", an7583_gpio22),
 	PINCTRL_PIN_GROUP("gpio23", an7583_gpio23),
 	PINCTRL_PIN_GROUP("gpio24", an7583_gpio24),
 	PINCTRL_PIN_GROUP("gpio25", an7583_gpio25),
-- 
2.53.0


