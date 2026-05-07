Return-Path: <linux-gpio+bounces-36383-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6CPiEXSu/GkNSgAAu9opvQ
	(envelope-from <linux-gpio+bounces-36383-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 17:23:32 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA194EAF1A
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 17:23:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6BA733034E13
	for <lists+linux-gpio@lfdr.de>; Thu,  7 May 2026 15:22:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9E213F23D9;
	Thu,  7 May 2026 15:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="n8vYuJer"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010000.outbound.protection.outlook.com [52.101.84.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477301D5ADE;
	Thu,  7 May 2026 15:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778167326; cv=fail; b=BpQD62CHfiWko7rYFdVyFCiDXCQ+8WVm+K5IVxvWG8Nn0XOJDAxsc/9nChKSIgT4oO5OYaH4gWs/skXrv/WWvRy7rOQ3mH+7mge5lk+dfiHXot5o1lyu4a5oUCc9XDIlYqkBCl9lWG7O1vL/jIYxgSJLN4NJa5LKwp5ZiS4zTp8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778167326; c=relaxed/simple;
	bh=/i9hc2HHIZaMJJpu+fwiXPYU5G+1cD/v4WVFQIDz1nk=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=HKkFltTQbJrhrUGNh/JpUWfmDLTEnqKCFatmfKxNc40mlS46faVG3ATugaFMOkk2lWNS2waXG1H3MFVYU8bGNsAmPFGLRc0sPwApkY++tBgbMlej/FlIRw1Wa8dw7Df0bKBrgPEYBU9QRw43JG2B8zktqr2rx67o0nJruZOYe20=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=n8vYuJer; arc=fail smtp.client-ip=52.101.84.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ogSsnJO2prOgfPOZGeSW3PPB3Z2IUDAUy/PcsVAmnINukBOLDSp+ynh3Y8sl0vMvT1FAgpYGv03c4dY5dPnZFIPH1SpyUWRvgN0sMbftM4zZuY/uiDjaCZXY+21hgukUm1iXssWYPjz+MzpnuHxYrOs5bJY5zKHG4YF8IjOvXgXK6JOGUZnA50XVkwMMhFtP37n0vsgNdZGmHkyRSYYTv6Y08/j4SCG4BrAGFIOxk1HHEFnvN0UCEp62tusCb0grEDuoxYn9eHGQcZmUzC1dQeCHcfX+Fjzmc4SYxOkV3mah6JZsK6QaGjrJOo/QX8ZEe2kOXo6U8kNfdHcaLo6Rng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YuPNxBKw9weoPV/ZEOYnsbXpr2S1EjEqXIkSlvMjBq4=;
 b=t8UHFCJRbai8GgBOxOb5uh5mGpWYoEtJdsR5MLc1hkcU8RYCq839Zi/2WVh1zIFLiKtAny4YU4N0u3kxmRINL1XF+Mnt+Ni8zGhzOFMSfs94zegzilB3rUoVUDIuvWJYn+G1lXUZksodeg0Bv55KKtwj/Zrir9VO1kvfI9NOdaRf28Nimnn4rqjeEoOPH8Bn4VDQlSEFSTgnut05aS4MfeHdz86Qfzqx9ciS9lwCVVrv8UuCGWJXjJt7aPJs/EQAtF3iQUVt5JVeg+51x01sGWBPAf/roMAPGmIxMAoN6HZlYM6POtaAjERXmsKIFndNQCIcDdiXe+W1L9BLfeIIxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YuPNxBKw9weoPV/ZEOYnsbXpr2S1EjEqXIkSlvMjBq4=;
 b=n8vYuJer7KeR4u4sIgts7FtXYy9+X7mw94JbeArS48RM3nZufvTJozFAER/R5uDw03HQJglL+xZB2r492nGO5naetcvfUXiEhfQhspG82kSk5w5Ummmd50Q4HZw+4lNTz9HFMe6kfnNvFNVJ7/LR7FG25wd6X3+vEmbEufj7zIk9h5gXvzk8qSOGl2TbQyc6w0iSRjr1QddA/zpjj1W25uAaL0XnYcTCkJo7byi8ENfleNWWh6ZHgIl+7NSKmbNbd4RhVcCIIRupJ4eCqkesrDE59RckFKhsy1LQxE1apgROqnq9c7see+aIEht/YPUUCAFLSvzWir0KqFfY8akLUQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by MRWPR04MB12306.eurprd04.prod.outlook.com (2603:10a6:501:85::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Thu, 7 May
 2026 15:22:01 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.20.9891.016; Thu, 7 May 2026
 15:22:01 +0000
From: Frank Li <Frank.Li@nxp.com>
To: linusw@kernel.org,
	Peter Rosin <peda@axentia.se>,
	Kees Cook <kees@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	linux-kernel@vger.kernel.org (open list)
Cc: linux-gpio@vger.kernel.org,
	imx@lists.linux.dev,
	kernel test robot <lkp@intel.com>
Subject: [PATCH ib-mux-pinctrl 1/1] mux: describe np parameter in __devm_mux_state_get()
Date: Thu,  7 May 2026 11:21:14 -0400
Message-ID: <20260507152117.240612-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA9PR13CA0109.namprd13.prod.outlook.com
 (2603:10b6:806:24::24) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|MRWPR04MB12306:EE_
X-MS-Office365-Filtering-Correlation-Id: ed281bf9-dc52-4886-ea99-08deac4c62ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|1800799024|19092799006|376014|52116014|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	nspJJzTyeQRJujkxr4RKQQo7XtoFFz1tRVIk3sYbmBiCFFCsF+LIvx887cajaD+oM6LkhrDaZlhDVeNmdaRdHq6DcLsWQxJgqX9SDJ3MKErVkb1Lwitit37DBR3XR1h5kmW747De95HiKpFVSpwa04iLBlStySQOzYOiyCPQFJ7GVmjANcqQFFrp2gBc8VVs4L8QTX5Tru4LdVBKJNy1GVlqNFG+WbzRUJWGG0pyyE4F6dJP5w9XhjH6A3Ax6cD9s03XSxAonevY59zPzsPkGzr+Qb/HRjcXN2Sr83lA1BgynYCFFlxG7Dk9WIFXX0XtxVmm9gqjAUrArLaiTdvY3xTMxzIR6nbDWOIpb8CyrRwxJmj8v9wSSq++70pB0cMh01S1KCAxqcHDEwqsceIrLUi0esJF86IhkubKuFS/FSq8CwLIQflkVORo9xDSf7gxLlhOr8B9ibbU2Jq4+aayS5TP+gWVyLLUVtKTF+U5C4zuX8JfPwXTgDiCUBSZttC3197c7T6p0pnUjP9JpMSB/WkB9+KyNAp4e67kTfe0RjlfRCGtqvnj/W1e8NPH8clGu/EKZ9DpJ94lplw12myUYU0dxWz7sU+QjyD73/Wgk6BKHD31h9+3OVgQf5p3p2owAEclNUlQFBrUYHv2NnzW1Pj0BedGXLE8Oj07kikzeKYW8Auwqt8OGWBIv5BcbTAGCrsOIWoeCTXxOwavUlVLLjNeQKse3Cwy5qNAfC0bSoYJb/ARJnDjwIERdZ3HL1eo
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(19092799006)(376014)(52116014)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SwRAUO25u/TuN1oHZfGL4oYFugzMn8UhaMCKnUqWJCb7M3HxTEKF6LAnmzAo?=
 =?us-ascii?Q?lZg5JMJ3PLEfDVP5vornnI16WhZhY0JGnAdmIMsnOfT7oDIiezTION+Rxfci?=
 =?us-ascii?Q?RXSmR1yzZH+ATm9goBVAnSu9TqGPmvQa+pqPQGLO7asNrmJmxMMbi8SwkR36?=
 =?us-ascii?Q?OfJpoGpYcntVSYTsY/+JR2Ax4eT1+4ITDIvildUFvMHDrEd+Ks6N06N21Zri?=
 =?us-ascii?Q?A1CmSRbYW589SvhI8Cn89/HY272yF07zg6C7rE8WXF8mUPjfRuzfL54Bjlzh?=
 =?us-ascii?Q?2RKpr/keivEo0EMO87TUBGvjSjLLAErvg7oj2Wp1bzVWTvWImzoBaqbWzVvQ?=
 =?us-ascii?Q?bjLlrlx/ziq03TwUrsdwFO4pC+wHl7/TJBXqDNhOmXNrL5Dz7ce8X9FxX200?=
 =?us-ascii?Q?3iRhtxA/mgYUZ939/XGN/i6OEdVx/mGN2w3mquVpzpv/1XqABWc9Hm1eI14d?=
 =?us-ascii?Q?UUszRuiQDtwdCgC2/1w+xUOcyAyUmwvnDITAypyGEpCNZ9rXUjtV90+lfjfb?=
 =?us-ascii?Q?5qDZsXQLkVq8ns5u+tI1xmPppLe/p9/sFCQr06h02e/gHnt8cUmayEJ6q6JL?=
 =?us-ascii?Q?u8XvUGsIiA9tgGnYubOjOjOA5VvenCuzi1DprXuOu7akklkVPnenZiAc+QQr?=
 =?us-ascii?Q?WdC0cUu6Q4PndvFbVVOJSO+3zLTpPyHdVYJ+/uV7//3W+y/Ttsg0fPnq16wM?=
 =?us-ascii?Q?JwYfAjSTUQXfVWwCBogYb96HoqRGDhVHHzMo1W3l65dxtVuzDQrK2yO5+UkN?=
 =?us-ascii?Q?63hbYDIdaVVbpTrfkdI3LoaKtA0DzmucyZwwaIdLLXKDjSET91mGLsnrZzRw?=
 =?us-ascii?Q?BxsxJUhkEK/LZGfINszZqs+vcxhlgiJTWr0sbVinR8VAk4OTFmzXJTaqKaWZ?=
 =?us-ascii?Q?14pbhhKuDhPLC7+rjeCoCl1lforBY+RD8GTjb8z1K78QLNvcbcMMwUIGXtPf?=
 =?us-ascii?Q?P9HIiqJmdbCv5R9YO7ZLexfXM4Ed3D1jxVaAtXuovCT9bgsj+d8fNQMkqMXz?=
 =?us-ascii?Q?d8HzeIDByTivT6IypXrxocSWnCIVoMJVtpwyVIdKW5MrEIfn3duKws5KwrbG?=
 =?us-ascii?Q?67M7m1G/xYVjjvt65uVpYL+C1zcFBIS3OTdS2W205D1okK5ajfBZ+8jl1pgS?=
 =?us-ascii?Q?9RC0v3zKPvy52dIQAmCkh/cKaSVSTKi10hR3Wi7zEQl00DNTWFkm6wLfEqj7?=
 =?us-ascii?Q?PN+LOlOMFdRKAoFaLzGKaYjHtKdBi6BErfninDdbO3wAVPt2gpzMMGtzfPtp?=
 =?us-ascii?Q?SGVfIgG2y4eYuQULVcDrHgkqcEfErTQACyetnvsPC8Zww4acgdaAzcXufeNq?=
 =?us-ascii?Q?YOHWm97fqxjVRC7cSiZDSW4R2hTmq4j2kHtoOVS8/QQbntbiZf1FsmpIzerP?=
 =?us-ascii?Q?rRMbVi7Dm1ryU/SLstjvLOON8Q/zo3BC7zme1UhZgSzEWSv0QPoqiY0ida5k?=
 =?us-ascii?Q?HUdpzQVjt2zxIuFcNGxyVBsDpRYMhOH8NXcIE5LHKKaqmNyHb37aVGow94D6?=
 =?us-ascii?Q?xldbVj6o06P7z02dhpRV+hoO7KRrKnM9Xcqaab5Mvas94cZqobsVQGfRPtbq?=
 =?us-ascii?Q?4kGZE+6bRq18cIeHe3VmJxPeIUlyl5Gk/PcjkIGYVs+TQZa6wKT3UJSq2JVF?=
 =?us-ascii?Q?ttb8makE9Kq8LGSuXknSUf7mayluiakeotMj5C3P1G2wU3EIC89xtKlbrKAZ?=
 =?us-ascii?Q?IkmBugMTRUk6j4ean7Ke6dQq4uFMJbVDGgHGn4IF5b69klCEDC+neiECB4PX?=
 =?us-ascii?Q?k8aWXtFkpw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed281bf9-dc52-4886-ea99-08deac4c62ab
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 15:22:01.0569
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pbc5RvY1IFZaE49kyARlZp+xJ4O1eUkxBopAQPP5xb18N4FE8kfVvR8b+QUO77Q9D3SdiLW5cB0D1f1DHDEMUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB12306
X-Rspamd-Queue-Id: 9BA194EAF1A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-36383-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@nxp.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email,nxp.com:email,nxp.com:mid,nxp.com:dkim]
X-Rspamd-Action: no action

Add a description for the 'np' parameter of __devm_mux_state_get() to fix
build warning.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202605061502.ullLjmtN-lkp@intel.com/
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/mux/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mux/core.c b/drivers/mux/core.c
index 2f01acfccf47b..5083e3d19606b 100644
--- a/drivers/mux/core.c
+++ b/drivers/mux/core.c
@@ -771,6 +771,7 @@ static void devm_mux_state_release(struct device *dev, void *res)
  * @dev: The device that needs a mux-state.
  * @mux_name: The name identifying the mux-state.
  * @optional: Whether to return NULL and silence errors when mux doesn't exist.
+ * @np: The device nodes, use dev->of_node if it is NULL.
  * @init: Optional function pointer for mux-state object initialisation.
  * @exit: Optional function pointer for mux-state object cleanup on release.
  *
--
2.43.0


