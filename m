Return-Path: <linux-gpio+bounces-32515-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gF+qAmuiqGnKwAAAu9opvQ
	(envelope-from <linux-gpio+bounces-32515-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Mar 2026 22:21:47 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 81909207EAC
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Mar 2026 22:21:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 60A9630FA493
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Mar 2026 21:19:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6450E38735D;
	Wed,  4 Mar 2026 21:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="AoXTQAD5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013038.outbound.protection.outlook.com [40.107.159.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4940386C29;
	Wed,  4 Mar 2026 21:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772659154; cv=fail; b=mcu4DfHINc2Y/QguVnWYNvxruQFbwBOE2+vrcTQOuKSJ2mQUHBhTEoSDl0WyiR4xPoAJ53pyrsxqe02Gk1bZ+YCrZ//pGc2uD7ToDXytdpgHrLrWvKdIKAzmeVCVL0eFlJ/8dV2U3Y5jix9jcG9/NbhkjLfPReTIeimUc17aH3Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772659154; c=relaxed/simple;
	bh=6GPsFy9zCNA4aOGX5lsr4ft8T8IqZh9Ce5RCYwC8o6Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nsSmMSGx4eG+cuJ7lCTaJ+1Rqq3vyHhksH8y6qq2YhymcHT0LizHa92xbxYkkU2BIdb6vrqIT7p2taMoohrEyo096Mm17IfSdCFmfWzJzHmWQ4UiygjoOUArG8wD9nmbaJ0bpbcSVydR8lTiMN97AwJwPjnCGJDcEWG5HbOeM4g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=AoXTQAD5; arc=fail smtp.client-ip=40.107.159.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tYXF1dMPtaDz37X6BxaY+UDoA36ZKyGNpkJkRXRNemkuXMjyZ0Wy+gOkZcFXX7SGwEvqMVeRnTZJ7yU/6UOziwuzRIpzs/BbD2CYh8+qvFQx57JEN3D0DrchYTWC2qr/QKd/BVCYGyEAWPxIi2pGnJ7RKxACuRGc/4D3arEnrfq3YfBiGaWxoocvvCtjjUpAXAXbeTo0QAfodLcWF5m3JXKGCU5rYgX8pGxnvrHMR6unNoKKAlTL7BUrFjVSBdAC3BEuhkv0HzYRZ163ktb9gmdfhJFcTAdwVKI25xYlg/ikphBF1TLBJZznNTmBc6u1Otsdxjy8goEzmXRiBr05AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RC93O/9B2LylJvMbACxtTRweB3sixPckboUTpa+OTAc=;
 b=jB+Tnpuh8aC7yLgFC3NmPN9PRtUF64lr96zYOEk2B9REDeaUo4gUIBXiNdQoE14t1hpI5wvBr1SZeBeXtw/pEWFHEgAJtwS/slJKekp3Uw5A8MIlRsdutxRAoNPwMRYSKuLNlYTbNzXOsx34pj8UU9n7/euZ9m7ac7ZelHlWzHLH0DghvwMPnRUWiri0FwT1QdL0vykopSBR9nJlRSPC0viaciDvK+9sDQXuT/DeypA5BH8YV1Q/qfrEbvysrexwgqwBZdOe+i0zXgAFO/4ja63XfnIUbKEqS5r/R40ZD8kQgxDF+xt4BGfvflmr3KPDVqdrlsnpHZayTPCgrz0a6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RC93O/9B2LylJvMbACxtTRweB3sixPckboUTpa+OTAc=;
 b=AoXTQAD5FVfAEVahPlsynbvB+nB8uIP466OLD8w0SKTPsOpEsRQsoW0kZSEh3C9cYTZnxAm2NWKgsCVnqZtDlnCsdXhX+51OWlR+QAvrwmJHPIWGUERvck2EWiTjO3qUzV0DezsIrMXhbuUQ9fFv0WB0n5+ZmjyBsPGT0ltIhuto6TRqsJrYnqmRtr67Xh5ky81M0BVx88TkybwUqcdG5aS9odlB4hPQQJY4KsJ+bxdeLPF0z4hbLUGwI/3pmiCsN0uUBcACMtWwfQgrv6iqJmZ6Ruj2wQcYj416zG8ruVSC4HsYB6gMNGS53ZKvGXx7tbK2u5WYkflZsNw3RZbxCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by PAXPR04MB8206.eurprd04.prod.outlook.com (2603:10a6:102:1cb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 21:19:11 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%4]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 21:19:11 +0000
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
Subject: [PATCH v9 5/5] arm64: dts: imx8ulp: Add rpmsg node under imx_rproc
Date: Wed,  4 Mar 2026 15:18:08 -0600
Message-ID: <20260304211808.1437846-6-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260304211808.1437846-1-shenwei.wang@nxp.com>
References: <20260304211808.1437846-1-shenwei.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN7P220CA0021.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:806:123::26) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|PAXPR04MB8206:EE_
X-MS-Office365-Filtering-Correlation-Id: 01a4bce0-978c-4076-b1f0-08de7a33ad90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|366016|7416014|376014|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	+58f8Cg0zMZGgix53VUSY9kQ6wOzbdb/mj5ykYj4vlGYaUh/NWEVguqFEulKKrJbOKYgyBqj2App1occk/+xjOdver83/nwnBKn5K6jaVudq9Y9tRzIrP/k18QtRVfp9STeJcTrwmm1nekDt7CyS1oRxlC0GTCPM2yRZcoR/AUjTOIvg3sNVxSZmQ+AmEi4qWidCHXn9EnrfxC3O/GNhS9YakQ5u/4qccpMlNz5psuoQUo1Hf0bxL3a7k05/NK8CRP+Vl0F8IXCjYHMPlMyYOV9hVHQA1qGNNx3baKuS/UoxoiXaYrP7VzXq0q8YDVBQqTZHnmlBcxBNsBFE84bH58vCEcE1/9Vopba0TYvI4pVUllPPQdjtTdKiDKAiEd1DD06B1sv7mpwBiubhq6L2vf6r7hK+VeAelV/Lv+TOloBEzXXpiNJR28MgsQ6lP0KBHTxiHTu7YXRidiSEoMVHBakWP8DlVxC2Jtr9ftyBCz08/1cM9dq1PFu2ZTqVrzRL5YIIKmtWDVwm45TRW+somFsGVmMBjIE6w/uWiKfxq3xKer03I7Qgmp8Jl9zg8LpJ7CuGUQ8IDrx0O89mvO4mBHxa8BkWFcfD6EdBw+CbSVtRONpOtrE1NZOckEYsAjTSkSebeZIKv+tAgz2rU5J+Q2vNwXzkCcCHGgXUkDBsCoqiO8xc6dT9fO3Rttjja8dIlX72aZMhaROQ+PTAtOaITA67KfdYrulN0KDcGG+oPEj1lCMdvuK7pI9hib7pwR88djsoER7H/YEYupIc0FRcSrYjfxv1/H01qAPLk3KqaXNrnBJSbseW1aKv9kK1gOps
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(7416014)(376014)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ePHz9CVBdUyzCKfbByPXfXJfzzpZv3df94Fxm4nANpyxFBXjn/Puu7AFrHzP?=
 =?us-ascii?Q?t9ReUdMhKgUIbVxHXropyr95QJ8YgwgVMc9vSmokEy0SNcWznrshyIqt3i1j?=
 =?us-ascii?Q?G6N9zwxMmGL/EmpGw0TwXFChxTTVy3SQZ+3ouDwhk3YcEqTAdsbPaVH1dFmb?=
 =?us-ascii?Q?aO7z8LmlA5e1MSrbw9ZJOK5V91VV00lTmWaznp4Wl3Qx9JHmMdClOdn9hGkB?=
 =?us-ascii?Q?c0YBDfZgIjpJ1hbrKh94cM2/z4laoc8cr7KecrcyxeoExA6qp9jHDdcamejf?=
 =?us-ascii?Q?5UFkxOuOXOBLFfwejIRr2AKlUFTOGMNo2dPRK/xf4wQI21IZNxZnykdCp22j?=
 =?us-ascii?Q?fquIG3osbUuEPjFXu6MBW+NY2m6N9ypNIEnRDEOW2yuZT43/myKYBIu19IWf?=
 =?us-ascii?Q?gihdl+Zn4R/XmUPUu21mPShQOmS8IhH2On67XMCcLxnyEm3UG7l50rubN0CR?=
 =?us-ascii?Q?8p1cIKNZsjUc0OeAZ6jzunYyMSoriG6vnI63Ir+HxRElss9SV7Prc2xpsSAB?=
 =?us-ascii?Q?CaVgMSJjWNv59DiO9BcsD4Wkbccr+6AhmcD9h38rehNLRFyROdPrZVhPh01G?=
 =?us-ascii?Q?PTadzFaFfiOeJG9/XBBIaZdXjHLPBrp+v7pmYfqFaVNckYpyqqXb5iYAea5P?=
 =?us-ascii?Q?t9eOMjJDaKy/svtJm5lcMTkaRLuK6fKW3c6xfFJE2Y/ZMOeGD5FUlNaMoVca?=
 =?us-ascii?Q?0TUpoB90YDOxuKDgj+XEnhd8zj5oEkjX0luXdB9yO7mZb3La3xqy0E2QtoLe?=
 =?us-ascii?Q?H060OONft9SQrYsrZo3lLRA0WswF4iklYslGoobHwEp18PKUXqsy7vCWfKFm?=
 =?us-ascii?Q?IP0MycWlhDP+B2GqfMRGPtSNyRIsKArpFAmzbs0v5V9q/igD5OhSY8u7Yr3f?=
 =?us-ascii?Q?nUAy4RKLAaErF/cmU0cyi0uyJ6GwD3Ojso3bu1QGmKIneEKJLYVUtkTb3eu1?=
 =?us-ascii?Q?rxjOQcob0IjiNzLqtisFJwhd1HtFYCKB178F5lQBcB6QycaWrNazzu4P1Arb?=
 =?us-ascii?Q?Ak1GJ//p5WCNbYvQ20q7M/PGM+inxoh3WR5tljXjjwZvmyKMwRuSOWXHKN6+?=
 =?us-ascii?Q?eH77gLGw04EL4IhmFsLPLy+fL3GSXkpmI+vy+KlyqCKSs3RwwJi2oznzd0Jg?=
 =?us-ascii?Q?yBC5vJf3+lhrDVnJ56I8WG+u8FRg/RgHBmfiRqLodnVrFqLBfTnirw4P++DK?=
 =?us-ascii?Q?cw0EIS55Oo+8iP/zAT3ro+wEy74kxc1zOx5LaWmlvJHwdK68Eb8lqWYwCC8h?=
 =?us-ascii?Q?BD876v4VVytwOg8cnm2015cearEth+qAuBtqt+GekS7A+EJr1maUpWqvZJwu?=
 =?us-ascii?Q?htwXKujvRKXxFK3pPJ7y4+LmeaAHxfw3iFOqEjKDkcU/dpjYRd1oA6TjCmSx?=
 =?us-ascii?Q?LDuk8Lxn26HAGDq9fYbyC/t5070OXlP3YfUmiElnGj5rn4UgU6EwmptqY9ka?=
 =?us-ascii?Q?ujcPzHxggSEsAmqcuFfKgptPOYJ5iPm5aHa9x3BvUgNYUIct2seLpvhs75/B?=
 =?us-ascii?Q?0AOrNZ7mASQghj+D6krmg/nEc44Ip2hpNxp0JnoOnNqsYomdlJPFFdLn5LM9?=
 =?us-ascii?Q?z52ZstbG5VQ/xXoTD3m8708lGM5jXsKSpqW+/yCTtL/03riS+Ot8XML2tWJn?=
 =?us-ascii?Q?RaWyTdl3Qp7X2kWNbkISHmxVw6cVFsi3jHr89sKdvaDsHuNAAqePwqpvKwuk?=
 =?us-ascii?Q?6hC31idL+/FdLZtTOANg66FwXF2F+o5ttjklbP63kzqUptxKmrsNmUFJ+85P?=
 =?us-ascii?Q?bq3H/oxslg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01a4bce0-978c-4076-b1f0-08de7a33ad90
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 21:19:10.9289
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wPOYTwpfwadB9+YcFKiVOP9pNbwrjxgxJHBvobWGsqPoClXF3zrfYjq5kZ+xAqjyPgCNLXjrsb7iQhsgZNlLmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8206
X-Rspamd-Queue-Id: 81909207EAC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,pengutronix.de,gmail.com,nxp.com,lists.linux.dev,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-32515-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shenwei.wang@nxp.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,0.0.0.1:email,i.mx:url,nxp.com:dkim,nxp.com:email,nxp.com:mid,0.0.0.15:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Add the RPMSG bus node along with its GPIO subnodes to the device
tree.

Enable remote device communication and GPIO control via RPMSG on
the i.MX platform.

Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
index 9b5d98766512..ad1ef00a1e3d 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
@@ -191,6 +191,31 @@ scmi_sensor: protocol@15 {
 	cm33: remoteproc-cm33 {
 		compatible = "fsl,imx8ulp-cm33";
 		status = "disabled";
+
+		rpmsg {
+			rpmsg-io-channel {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				rpmsg_gpioa: gpio@0 {
+					compatible = "rpmsg-gpio";
+					reg = <0>;
+					gpio-controller;
+					#gpio-cells = <2>;
+					#interrupt-cells = <2>;
+					interrupt-controller;
+				};
+
+				rpmsg_gpiob: gpio@1 {
+					compatible = "rpmsg-gpio";
+					reg = <1>;
+					gpio-controller;
+					#gpio-cells = <2>;
+					#interrupt-cells = <2>;
+					interrupt-controller;
+				};
+			};
+		};
 	};
 
 	soc: soc@0 {
-- 
2.43.0


