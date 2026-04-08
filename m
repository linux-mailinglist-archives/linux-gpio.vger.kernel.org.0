Return-Path: <linux-gpio+bounces-34859-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SAm3Fdbj1Wm2+wcAu9opvQ
	(envelope-from <linux-gpio+bounces-34859-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Apr 2026 07:12:54 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CEED43B7181
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Apr 2026 07:12:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 20381301038F
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Apr 2026 05:07:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 269D63537F6;
	Wed,  8 Apr 2026 05:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="LKpJAgXj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013016.outbound.protection.outlook.com [52.101.72.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A50E070830;
	Wed,  8 Apr 2026 05:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775624862; cv=fail; b=FMpRu2bZx9Ms+eXfhaYtKZ5L1kUDsy2EtaLdoSVMsz/+AU3YHTCFGh4pMmkyP79sh+9bNYK7T/ahpoTvyK4IRZoUbvi7L+TX1Ug/O4wKIdaA0MvHQYZ2K3sR3tRc50eshWbdaN86dQDh46f4NQ4zVlnfynlQmQ/PqAj3Oub3mKE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775624862; c=relaxed/simple;
	bh=uaT3Rp8+Y3TES/xqDXlagPM6hdCdMakhjJt06Tt1u/4=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=D5xMbTTg8PcEv8/YeFh3qyVLvjrJn+fKsROsnpmojBf7r8JSlyFGEGOCurXzkcy6FOjxpImyn1Q8wVYFU5z1R9i0/itdpgoe50yXRlf3A19/oTSoZf0VPwixUjTk+Fk0lgdISVog/fy3FAjhfbpFn19LMeG6h+TC0S/Bgk/tEOQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=LKpJAgXj; arc=fail smtp.client-ip=52.101.72.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A4+R5073/17fSqyzvtS3Uy+x62H43Wrfx0Al+a9eXCKOZYZW4FNnpI1IKRmRTsb/Ag2WsINF5rvrVnY1/PZGyY0HHkHF01nLuwmVZUcusH1xLEUDBY6k5lC1cGmEdDys97Kf/iOyWxcsZEv1HmheWJaCXJAUChww3vN8lS754mb/LIxtctZfkfifrwwA3ac3JEjPsxMa70vzyBgFr+mWP256DyA7XTWaMr1IHxmNF6LOAmWTeNufOkox+FDos4Y8i12H6CypzBOLzZ+wLKGT1hwXJ2Cf1RM5tLTeVZoz1/JqakQFevVRPCT7FGQyFYNkXFanXF0Y25ZGDGdQuA2Kew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xvEC/M9HT/ZwBKNO7Qee/iqvOxb5W1h3VMAt5qxlAKI=;
 b=ityGO7Lu93alFgaJL7CZXQ2/Jvg8xu4tH1LgVSZ7p0wojtgdKQc67iYpoXS47j7TniZR9LeVGpqI80YZtRx5UhssT0pFbyMVarDUFl2ccSNgUSq4d3XQaUQjqYgf5a3bdQwd0nCGXEQ3tKz8pQumpuDrv9/Ws6iTC6PElvNa1vYB8yEcnmGsIGKksmrjniULjpmPBpFfzBxLqT6V736cf5AQJi7hQhj0Nc4ald0WdxyXM5iyIyMQJdSf7dWhvfFTDvJESO2vCOZvhdbqtWvQnWZ2WgeOs6cFrF9eOW3AATdimm8dV5y2Z8YicFkPQc7MdP3zfzqzjwsYLuOws7QLRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xvEC/M9HT/ZwBKNO7Qee/iqvOxb5W1h3VMAt5qxlAKI=;
 b=LKpJAgXjrpKgjINURZY6hBI4T9lciOXeAq8RkfUwykO4JhNemgsra7yUZz2Oe0wuRUSoYTgAU+k3Y6ugNc9ALfKo16Z3sKbTC40lrimw6n3riv82/8Rd/8grk0K49N3kUC8gNmRhvbRrmqlbVhjpL38lPSjO9pOA8OkIMOo9UE0VqWCjnzUqh/2iNmbtbGJ820Ap02qq35yPRVPiqMTUkllpfAjJhtJ17XdX8u1Bd6Z2AqyyojR1WTRD40gvtwdW6marHgEFhB9bKqomSwFOIADgbSDlkoo2oCQGP9KQVHkeW3gjkZvQVS9rp1WTqwVfyGbt+Z7uPx1DWrTJMz+T+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DU6PR04MB11085.eurprd04.prod.outlook.com (2603:10a6:10:5c4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 8 Apr
 2026 05:07:37 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9769.018; Wed, 8 Apr 2026
 05:07:37 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Linus Walleij <linusw@kernel.org>,
	linux-gpio@vger.kernel.org (open list:PIN CONTROL SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev,
	Frank Li <Frank.Li@nxp.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH 1/1] pinctrl: Add OF dependency for PINCTRL_GENERIC_MUX
Date: Wed,  8 Apr 2026 01:07:01 -0400
Message-ID: <20260408050702.2454661-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN6PR2101CA0014.namprd21.prod.outlook.com
 (2603:10b6:805:106::24) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DU6PR04MB11085:EE_
X-MS-Office365-Filtering-Correlation-Id: e94dfb4a-354c-44ce-0bdd-08de952cc05d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|52116014|1800799024|376014|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	wiiUndwZf6MrQT/kxVMLD3QSNiBkeduftsBN2wBqhkL/M8LHBJNTAyWAzZw7ACMBehd9Dzrd0EZIvKjEtDhzf9Kp1QGBLt3JW2PKtZNG8lE9a60pGsc9L2QOebVAU2mHhk1QkEnU1doXSF6YdiyNBofBSw/Jmjjm2MOyayUrewNMFL6g8J65WI1/642iWjCZg4F4z/WaAW8b0LOJf9KyP6Ztd5fuA+LcCgk7yxAE22UpPN52WKjpqHDbTQGqt1vpO5C4j9BzBU8M0RlTyWVxYRQS829dlrczNs5q4d3Z3cLe7I1L/GL7Hz102535D1gfYXh0hABh82qnqj7ZcskK6A+2AXQtnv7ZSnuAHIAg80jOyHB/E5Lb9E7fN3coFQ6MZJkLfOBbzbfXffy/cmTSN7YNOZHqhrGNft+IaRL3dudsdsyrxMbw7dcOl7we4sXay4SvwVmTB6vatC2JSUj3ckw1owW87FXY1e0HOhXFKn5v7ER2N3qefz9tl/aNRvcmr1Ps9u8hdQOP8UznHEKpYzZ5ihpquHc59UlbphJBfvyzBAFf0mz2ZZ4oNeN4EBUZqmLjZFXufK4nzMTkrtFFW9ZAJRnJ4v4dVog8zJTaM2bDUAHvIjgTG5pnd59a+p34dvq95L1dHHwaE8DeR9gqAmZCFTC/HBwB0XFO1qpOucBCzppA3cE59DOApiUAWhPqj+V8aeM9QqU1bbDvrBemYrOBsvkmOFsljTUUosY6PMj+YaI5s/HzS+elMXEp7m5bVzA+NB1OIxUX92kQJ+GzEMnzgjgLs114dstJtC7vFWo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(52116014)(1800799024)(376014)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3BRhFnv/eC1OL+Sy2fJk2KzuN/u3sImwk552BZ62wiIb1UcxPSC8dV8OLosk?=
 =?us-ascii?Q?dmChvsmgjFMlvnRptpO59bCWpBp2usAHV9+d9JOprYzDke+LFgD1GKB9XGZk?=
 =?us-ascii?Q?ZHmPAUHV1EBKBEKbnJX6WW+JHz7M44FMRbZZwVTz9z+8TnNnoWOS8hftKPyx?=
 =?us-ascii?Q?YSynbTzlCG+PBeiU+wvub5dOrSeoNKGGVt3GGbp4Hsfjnt30f3uYsPrS/ClL?=
 =?us-ascii?Q?2MR6eFdT9Ae4vwcZ9ZD6Eobkx+oBzxQI88gsNMwvJo+cRUD0xm1jSZ6cYYhM?=
 =?us-ascii?Q?AlBcWnC8O0HHlZAIPJb0NNMTDKqp6k1gg+QuJsJprAJKuyDopVDT8r8uNtKp?=
 =?us-ascii?Q?9To9YsLUh2Hxiy/0rDcfhEaNlWJcRPZBEMmuY09gx2qC/USQURcnZA9y1YJ4?=
 =?us-ascii?Q?qJeRC7CF/qKclfpHOKnzh1ahDlw/aFwfV0dG/Gti8L3Z2YjyLDtO/i7tK5E1?=
 =?us-ascii?Q?+irMRSB3Dfczl3H8jAC74ilg2xvZ2OpJ3Xt8E79Lhy09OCLM6170Jzk6ZElM?=
 =?us-ascii?Q?S+onCK05JUi904NM07t+P/4o0SP4kaKsFRlfh4ii7pnbOx6sKKrC9F0LJcUl?=
 =?us-ascii?Q?4lnXqKxidMBe13KqsEQToDZObQpN4aVgsWxDa7sHx40IbSXr/5FFQGbQW/pR?=
 =?us-ascii?Q?ZXLsQl4NpctI66ALTneRq0QRaKQ9qpSadEx9tb2k6b+GUWtCFNBrmXiQl1Pq?=
 =?us-ascii?Q?GlOtGbRRs76Si8J2eQV86fq4G7O0VFRTLeLde7TzeYnj0ha0PdOxpwRza4UP?=
 =?us-ascii?Q?2ffi5r7F6GbLAMwqrfBJ2kPXxI9GryrBlYZecAo8kAAeDcfP0L6HfAHDvOGe?=
 =?us-ascii?Q?uJzOCnBADZU2tiFdsIvjmc6/kWGKDb9kuQ1puyQNynHH90omVmC25hP1nBke?=
 =?us-ascii?Q?QfV/nt61eYDINhIO41UJpFFiXTk96DiKkXN4Aaym+/Nj2GhZxKUaHRiODsoC?=
 =?us-ascii?Q?xa1wlOYKUMgrulMj6PWXZyvpSAcOawnLG6tWihY0dV6Gf8j9VSO5FD93Dcyi?=
 =?us-ascii?Q?gjO7OzS7+Ji/3EIcKeC/pzGYxc/jTJEbfxef66fiRkUjfEcSpjIVNi4L/gY/?=
 =?us-ascii?Q?oBrxmA4O5nCm5Kmjn5iiUnyqOCt+2KzdZTbmjYIPxdveWWCGPI550vL7B9Qw?=
 =?us-ascii?Q?Q80WkZIcXVD/UYSAyFX5iY1hPgrABxQzitmovMyz9kzAmY07fy5dc7zrUxN6?=
 =?us-ascii?Q?HPGxijbP/puFcNpUGV7E+g555JZGnumQnq8/mA6kxLNSEvl6G8SlDDe61E1B?=
 =?us-ascii?Q?K7M7CIDWVRzEGSZyvlESnMZaZLm+XbfDiBhE2okcy2eLqjzfX+3kewJjo1Mp?=
 =?us-ascii?Q?XQDuzd9pqbhzF2Qya790JCjakEhNFwxoEsLBP4VQb2FtS1iOYhj9c/RulpMX?=
 =?us-ascii?Q?rt2KPZZyfBHCOKoiqcxVyuljL5fcy+EazAuZ13YM/hTnWhNAgbrSa+rtIouX?=
 =?us-ascii?Q?eFuyl4kRLwX0jAyxl3Flo1a7aUT8VDvLMgeUqsvYRrf5VQt+ztcyAwpnfnBo?=
 =?us-ascii?Q?YQGTGYw1qk5FY721WQu8dASXXOngjPs81xQ8CXWpdzBeMu6+/s+cRdnGKpy3?=
 =?us-ascii?Q?J/PgUJjapjpnbK8QXIow13niFIJ7waDAVLaYfUd6ePK5/FUAM7s1JXBWx7HM?=
 =?us-ascii?Q?pdPCr2liFzkg6M/JtFXAFY0TeyA66x6IeHZeCNAIlofkaNOKmqydmjyJXfh0?=
 =?us-ascii?Q?bRLOEP0bnLOHiabsCJtqOwxZjPXvHYbYq9txTOPaxo0jU2bx?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e94dfb4a-354c-44ce-0bdd-08de952cc05d
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 05:07:37.3774
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oZJPDGDWMwWFB9vgPwZp73EjGKqKTNO4tr9znCWh2wFBRsGzxe/rnqD+C4mupwZ10S2ZWEwzxXUPcQmT0Z7OIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU6PR04MB11085
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34859-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@nxp.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,nxp.com:email,nxp.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: CEED43B7181
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add an explicit OF dependency for PINCTRL_GENERIC_MUX to ensure the
generic mux support is only enabled when device tree is available.

Also fix the stub implementation of pinctrl_generic_to_map() by correcting
its last argument to match the non-stub prototype.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202604072013.aI84l57L-lkp@intel.com/
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/pinctrl/Kconfig   | 1 +
 drivers/pinctrl/pinconf.h | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index b6d4755e67510..a568f7664ea4d 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -277,6 +277,7 @@ config PINCTRL_GEMINI
 config PINCTRL_GENERIC_MUX
 	tristate "Generic Pinctrl driver by using multiplexer"
 	depends on MULTIPLEXER
+	depends on OF
 	select PINMUX
 	select GENERIC_PINCTRL
 	help
diff --git a/drivers/pinctrl/pinconf.h b/drivers/pinctrl/pinconf.h
index 67044dff61e4c..83f2d00c732e1 100644
--- a/drivers/pinctrl/pinconf.h
+++ b/drivers/pinctrl/pinconf.h
@@ -189,7 +189,7 @@ pinctrl_generic_to_map(struct pinctrl_dev *pctldev, struct device_node *parent,
 		       unsigned int *num_maps, unsigned int *num_reserved_maps,
 		       const char **group_name, unsigned int ngroups,
 		       const char **functions, unsigned int *pins,
-		       void *function_data)
+		       unsigned int npins)
 {
 	return -ENOTSUPP;
 }
-- 
2.43.0


