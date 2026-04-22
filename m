Return-Path: <linux-gpio+bounces-35376-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WAmnOKc+6WmEWQIAu9opvQ
	(envelope-from <linux-gpio+bounces-35376-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 23:33:27 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E81144AF72
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 23:33:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1B043308642E
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 21:30:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26BBD376BFB;
	Wed, 22 Apr 2026 21:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="kVBbLuOx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013033.outbound.protection.outlook.com [40.107.162.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53CD6373BE7;
	Wed, 22 Apr 2026 21:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776893421; cv=fail; b=atR7ezAmYPxA+HyacK1eaYoBhrD1YzCfBBQ/DgzOimh9zntOPVB7IvcxJVVbgAaNhhsbsHWO1OyBsRfmHuWftUNfjZtRqlJxKF/CdPLPx1RBaOUxMjSpKODQzOiKxhvK2PGP8VKfOmbHlZtvaJ7nBjjj5Z1G6C5LHrUuGGJlExQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776893421; c=relaxed/simple;
	bh=Sq6M/k0DD9yIAkOdFeotr8JNq5GxkDqXAKkY8xcFaCI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=t3tEMa8T8Cjwtamoj7+zYsFHJ4gF891qMMUkzRHc+AWDkQrmkpaiTcMNFDgxoIxbOMVugs+XRk54YzcVSM2KZRu8JyLQjVVmo10qcWjXUFbbFnRtDXHHTvt3AN+u0FAyEp/gNzwqLgdyF0PbDZz4Q5ugfyP3NFR9wBEUnliL5n4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=kVBbLuOx; arc=fail smtp.client-ip=40.107.162.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ay/0vmxmo1vqj3RiYFLrWj5R3Twh6ug1sfqwYhw6MmR+z06sulDBinAPfu81qCS141eVYoq4jgD55hGBVF5CYy1CBjgVE84shdlOwrC3cZVt0cFkpW3gqUY8oOGKbXvNgE6f74rv9lE7KKMFs3FehD/9eRtaZRUzkyYXjvjwNwyOIVfTkAOtchBeXi574rVBK4Y2s6nBOevJPkAoeUkBg6/CxzHWbvIHFHzB0o8ZQyJffg12bA5540YF86MLudoRx1tznMU28lF5jGn6P8F8rOpMJHb1QacliTCAFOSSVBBWi7SOlgFF/mz/E0+a2ZVuriOklNA2MMcCjqj/wZ3xXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jKHDLdvg1YJf9UnmktdQnTqEYCINMhF05ST4Y7Kk+6Q=;
 b=OxCx0aruffkAJx2UD1RCwMrc1f9NscLC+U4Fb9fFqcgP+X+jvAraL6xadRTomQUavogUhx06yhSh7fZeWCSjS+kuyMRgpSFzuKJyYfyVeIcJaVcHsuu1n5j23X2Dx4b+eFoDkdcD56D/49fZBLLe1bQVrgs2U92l6VkQMhFwTXvtOtPxGocVqNcj6yzVT0eRQlnsrCZjHT6eBCPwKSoc6ag6+nrqqM+BiNCDWC1rx+PxmIiMkb/MRIMKWAHzUaNXAgLtVSSPwWh4qWt75LexB8eTqugsm7a6yKU8Pd0/B9zpXUqS/MCwH82cGMfqIJk78DCluSaiP3c4sc1SBioJHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jKHDLdvg1YJf9UnmktdQnTqEYCINMhF05ST4Y7Kk+6Q=;
 b=kVBbLuOxnvTqmAfqOzzk4Vc3UIeq4J5hLZXiqRIYogn/m/0w332XJHbQJRC3YlGOFg6KfiNn2GZ5OUbZLyKJ2bXTCe33Sm1ZRU1AvW0IuAzkzjU668HASzBOqHT1axpRh5aN2ODinTcgFTjAncNgMFEGqtdeu28kYjA29qhMR9D6nYrJG0iZyAn3a2AaTfoKiragrL2lILBBZDD6RCbZxXODDqmLogUYp9cQZBljUl49GpBkuWTTP+pCD2vcGqGpd4czmRbjfy23hwPWqVv2WD9mfVObpCPFz9wBYkV+HeR2r/3XxBpraR9WV/AyuGp7mRbz5OM7THLRtbaqa9CEIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB9176.eurprd04.prod.outlook.com (2603:10a6:20b:44b::7)
 by PR3PR04MB7449.eurprd04.prod.outlook.com (2603:10a6:102:86::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.21; Wed, 22 Apr
 2026 21:30:16 +0000
Received: from AS8PR04MB9176.eurprd04.prod.outlook.com
 ([fe80::ba87:1cd1:53d9:fcd7]) by AS8PR04MB9176.eurprd04.prod.outlook.com
 ([fe80::ba87:1cd1:53d9:fcd7%6]) with mapi id 15.20.9846.019; Wed, 22 Apr 2026
 21:30:16 +0000
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
	Sascha Hauer <s.hauer@pengutronix.de>
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
Subject: [PATCH v13 1/4] docs: driver-api: gpio: rpmsg gpio driver over rpmsg bus
Date: Wed, 22 Apr 2026 16:28:46 -0500
Message-ID: <20260422212849.1240591-2-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260422212849.1240591-1-shenwei.wang@nxp.com>
References: <20260422212849.1240591-1-shenwei.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0058.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::35) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9176:EE_|PR3PR04MB7449:EE_
X-MS-Office365-Filtering-Correlation-Id: 3196bfa6-688d-4d32-7d4a-08dea0b65145
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|19092799006|366016|921020|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	nyTuvo+MemQcf/+4WpUJN6UaMkHWTRoieJq4z5KMMzNdNxGTsaPpJirV7X2pipNzjOvIsbFHGjf2zJ902i9vSWRxquO50c1rImJPWj9YjPww7bDXB+gp1vu+0/d5lMb6YmQSEQhMwlC/sYWdjgjOtL2sqfQR67hOqrMDB9R2dCI7ykZy7tRBpZnPU7Hh/V20BHvqiAADX2R8xlkoZETd0ezczS3Ir1BICmrsvF6KEoBbdzqFZVEHheoTRygMDzhwr1WcWXCdMWubbkpDKb2WzYlaZJ02BNPBVEi0mGKFYLGH7pcwmMbnO1aVmm4D4I0PO6o++FcQ2SAj+LEZpouVwcGBlayk8VwT324V6ITgSCIzhpu8O51Y7Q+tbM3F0rZ38Ic/R8OlPfynHFtUypVdYzRHn9QOscOjQB5xHaB7quKQFOUOqWMCmvNOf8WSb5TJlMHmoN54fFtD11CXtjecrbKKpEys3m2ADM30F784V/HNiyqqtG3whonVdljOQZ9vnTjtt13oH8tVJMWVyVZC9n73OkvFxV7PQR9eSu5fkpvLFab3kxAVdRgXH0ed97efA080NwUriDSsZdoCj8Q9wUpVVgDQ2T1nM7Z/nJGARDSavYzFXFGd2iPZo1Tkf1yS4HJjZsd0D5Nwy99J+m89S4Omg5vTRJAb7wrXhZNxk0Oh0ZJKIJoV1dn6iZfe/+wkZ9/Hg/Dsp22kL5U2Y9qsMnO/6MqDg9KwwP9mI8t84Fs8yZrTkpfXjhCdRYsh1TqCAfB77CuUNQeAnegDU3qg2oXqKE90v50XRCWT6N2MjkisIE7mSjAtNVc8jQel9IPE
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9176.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(19092799006)(366016)(921020)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zv4gUfAz+be2l+wmwho3LnXpFTDmyAgb0OURGGOmhkeKhhruOiwFhr8LCcco?=
 =?us-ascii?Q?eXJk35VGVauUlu4XnkK+iquRn2LLzavuiiY9DtgYOtl7PlzIeGeU5IIJWQMN?=
 =?us-ascii?Q?0buduQ9r4u/MZB3KZ66hNvSyqx2yg5ql3TvYNvIP3IeIExwx211TIVTxr0xB?=
 =?us-ascii?Q?Ux+YGJ6vsMGU6hTAEcvfP1OCmTJHy08/95YTREfTcowBPt+isD5/pG210taj?=
 =?us-ascii?Q?3tw4h0WY2VUenVU5hOi1adDo+bq7B2XW7Dg6WGsNcDSAejuEHy5bwArEtIw9?=
 =?us-ascii?Q?EbXqjaGE3TyxyREjQIP06b/ZssXqTB3GeCPeCruA4P926l4PMc0+G6YZtDqK?=
 =?us-ascii?Q?9eOfMU4jRCKi7NzkW5ZwT89U0SyFK4e965FEdaCdsfALa0hm0cvG9FLnSL6q?=
 =?us-ascii?Q?DmjzOaAZKqbFQNpWUffWaSDLMk5TGW5ZFK/Ipgz+JSs+oIPdI52SxFrHnorj?=
 =?us-ascii?Q?ppdIpXEV1sxhfhYiRIdLON7CllaIBPUjsKf5k4+w2/GwyLXTDRue7KVY5AvD?=
 =?us-ascii?Q?wMnH6cMx2z7bsLHtyP+oKWF9ealhbHHGHUv4jXJCwZfsSOMz0Jojz2lgCA2Y?=
 =?us-ascii?Q?cqYKhlPxSFdqF7oM9+zSYXSGBci5XFOiEcINPgxuzXocUNMhjFFFzNwHOuA+?=
 =?us-ascii?Q?B5xZLEU7hcanUKOjTyuY15kUHdsOMhv8L1Cw+Ho0U82O7q+vjCJjB0MgDGn4?=
 =?us-ascii?Q?zsfJOKPVUX2ripUPBDuZZn02KzI9XM8fY6Kc64WtyZf/dgCqlvi5UOa4iZHw?=
 =?us-ascii?Q?J1e2DXnHkWSU1pJjHwzHJxIMjwn1FYV+yscwwTwbcf0GVGo98cDGlj6DHn+O?=
 =?us-ascii?Q?afpSTb9sZm12EeBbaPchkxbdBg4fSS+vq0zRUrdgruXPhaLQWHZILkXpo55M?=
 =?us-ascii?Q?yfk1tb7q85z5phCzb05IiLn5/J9YcbsEE0QfRpcHYVzzrochPXs60Bmn7y0D?=
 =?us-ascii?Q?QFPjeGeKrrDzw3r5xxqcym2uXosUDgIKmrH8MoWgUKBRuEz1X1e/0HrKm5j2?=
 =?us-ascii?Q?rnie7Ikql2MVu1Hr92RmkKwJyN2QjQxiH6tZaIVFHQLD5AJWampWLSlnNPmY?=
 =?us-ascii?Q?+rRfZfRrqPLE2m0/l8Uiz03zksJi11U6NHYaUFDPccRkgWQWpHb4elQHjcx0?=
 =?us-ascii?Q?FC7MAqC+0lo7v5s/dzzbqz+vweSplGEz2SA/ADS8hmHMOwy0LR7BzGGiv9pX?=
 =?us-ascii?Q?dkERAx1JFrXeiaFdjEYvyg52LG7QcNjd6JLMub+sAVnf5u49FwcbIECVJ0lb?=
 =?us-ascii?Q?geFZu9x1lw4hknnA7nKhy1VNHWSoOk+y2hwIIezGTW3yhndEILBJN+C9WPNH?=
 =?us-ascii?Q?/Pn23N6nMaQ4zWZsxVqw0k5hNc0qLpZ+/ym5aIWLKPemNE9k+KFVueYaUoR0?=
 =?us-ascii?Q?8K1z1fhxcagD+t4UwMPAmxcTRzd1X90jvyllWlD9D6AmhQG7HXTs6U5/rIM0?=
 =?us-ascii?Q?gQLoSUlxpjnWA6ANbS/quFmTGrnpzvxvqMjeNxzXEGPqO97HP6Tc27fYll9K?=
 =?us-ascii?Q?0HTrXIQOJHqlMMVYcCwApQEZIXii6SyKRHJR90/dGzA63PDvb8/iKLMhtg8b?=
 =?us-ascii?Q?CU5fPxsOAdw5gLEpDEtXAtQVnULL92fGKyaHiFeLzUOeqYC7A43P46zlwTLO?=
 =?us-ascii?Q?yzbzDi/DOa6x1gTmEIbxC2yQ/4z9jHNpwuI1vcnF8s2QHkyoFq0LJnAVg0Bd?=
 =?us-ascii?Q?+Hue3p/+e28Fl/JXzFocCoh2W6/FkS1hDQ5G6UdocwxYTgOWjb2YTpsnKeV6?=
 =?us-ascii?Q?ATzh0bGw6A=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3196bfa6-688d-4d32-7d4a-08dea0b65145
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 21:30:16.4340
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h/CZQ2fbSP09/YV2BjA3OZG9plD7gSJ+fMFnuvGkxiGGz4GijpXboTSmXQLyqHw3jhrbJktDSpqPfLT4yzvgrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7449
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
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35376-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,pengutronix.de,gmail.com,nxp.com,lists.linux.dev,lists.infradead.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shenwei.wang@nxp.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 5E81144AF72
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Describes the gpio rpmsg transport protocol over the rpmsg bus between
the remote system and Linux.

Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
---
 Documentation/driver-api/gpio/gpio-rpmsg.rst | 266 +++++++++++++++++++
 Documentation/driver-api/gpio/index.rst      |   1 +
 2 files changed, 267 insertions(+)
 create mode 100644 Documentation/driver-api/gpio/gpio-rpmsg.rst

diff --git a/Documentation/driver-api/gpio/gpio-rpmsg.rst b/Documentation/driver-api/gpio/gpio-rpmsg.rst
new file mode 100644
index 000000000000..abfde68c9b0a
--- /dev/null
+++ b/Documentation/driver-api/gpio/gpio-rpmsg.rst
@@ -0,0 +1,266 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+GPIO RPMSG (Remote Processor Messaging) Protocol
+================================================
+
+The GPIO RPMSG transport protocol is used for communication and interaction
+with GPIO controllers on remote processors via the RPMSG bus.
+
+Message Format
+--------------
+
+The RPMSG message consists of a 6-byte packet with the following layout:
+
+.. code-block:: none
+
+   +-----+-----+-----+-----+-----+----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
+   |type |cmd  |port |line |  data    |
+   +-----+-----+-----+-----+-----+----+
+
+- **type (Message Type)**: The message type can be one of:
+
+  - 0: GPIO_RPMSG_SEND
+  - 1: GPIO_RPMSG_REPLY
+  - 2: GPIO_RPMSG_NOTIFY
+
+- **cmd**: Command code, used for GPIO_RPMSG_SEND messages.
+
+- **port**: The GPIO port (bank) index.
+
+- **line**: The GPIO line (pin) index of the port.
+
+- **data**: See details in the command description below.
+
+- **reply err**: Error code from the remote core.
+
+  - 0: Success
+  - 1: General error (Early remote software only returns this unclassified error)
+  - 2: Not supported (A command is not supported by the remote firmware)
+  - 3: Resource not available (The resource is not allocated to Linux)
+  - 4: Resource busy (The resource is already in use)
+  - 5: Parameter error
+
+
+GPIO Commands
+-------------
+
+Commands are specified in the **Cmd** field for **GPIO_RPMSG_SEND** (Type=0) messages.
+
+The SEND message is always sent from Linux to the remote firmware. Each
+SEND corresponds to a single REPLY message. The GPIO driver should
+serialize messages and determine whether a REPLY message is required. If a
+REPLY message is expected but not received within the specified timeout
+period (currently 1 second in the Linux driver), the driver should return
+-ETIMEOUT.
+
+GET_DIRECTION (Cmd=2)
+~~~~~~~~~~~~~~~~~~~~~
+
+**Request:**
+
+.. code-block:: none
+
+   +-----+-----+-----+-----+-----+----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
+   | 0   | 2   |port |line | 0   | 0  |
+   +-----+-----+-----+-----+-----+----+
+
+**Reply:**
+
+.. code-block:: none
+
+   +-----+-----+-----+-----+-----+----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
+   | 1   | 2   |port |line | err | dir|
+   +-----+-----+-----+-----+-----+----+
+
+- **err**: See above for definitions.
+
+- **dir**: Direction.
+
+  - 0: None
+  - 1: Output
+  - 2: Input
+
+SET_DIRECTION (Cmd=3)
+~~~~~~~~~~~~~~~~~~~~~
+
+**Request:**
+
+.. code-block:: none
+
+   +-----+-----+-----+-----+-----+----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
+   | 0   | 3   |port |line | dir | 0  |
+   +-----+-----+-----+-----+-----+----+
+
+- **dir**: Direction.
+
+  - 0: None
+  - 1: Output
+  - 2: Input
+
+**Reply:**
+
+.. code-block:: none
+
+   +-----+-----+-----+-----+-----+----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
+   | 1   | 3   |port |line | err | 0  |
+   +-----+-----+-----+-----+-----+----+
+
+- **err**: See above for definitions.
+
+
+GET_VALUE (Cmd=4)
+~~~~~~~~~~~~~~~~~
+
+**Request:**
+
+.. code-block:: none
+
+   +-----+-----+-----+-----+-----+----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
+   | 0   | 4   |port |line | 0   | 0  |
+   +-----+-----+-----+-----+-----+----+
+
+**Reply:**
+
+.. code-block:: none
+
+   +-----+-----+-----+-----+-----+----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
+   | 1   | 4   |port |line | err | val|
+   +-----+-----+-----+-----+-----+----+
+
+- **err**: See above for definitions.
+
+- **val**: Line level.
+
+  - 0: Low
+  - 1: High
+
+SET_VALUE (Cmd=5)
+~~~~~~~~~~~~~~~~~
+
+**Request:**
+
+.. code-block:: none
+
+   +-----+-----+-----+-----+-----+----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
+   | 0   | 5   |port |line | val | 0  |
+   +-----+-----+-----+-----+-----+----+
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
+   +-----+-----+-----+-----+-----+----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
+   | 1   | 5   |port |line | err | 0  |
+   +-----+-----+-----+-----+-----+----+
+
+- **err**: See above for definitions.
+
+SET_IRQ_TYPE (Cmd=6)
+~~~~~~~~~~~~~~~~~~~~
+
+**Request:**
+
+.. code-block:: none
+
+   +-----+-----+-----+-----+-----+----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
+   | 0   | 6   |port |line | val | wk |
+   +-----+-----+-----+-----+-----+----+
+
+- **val**: IRQ types.
+
+  - 0: Interrupt disabled
+  - 1: Rising edge trigger
+  - 2: Falling edge trigger
+  - 3: Both edge trigger
+  - 4: High level trigger
+  - 8: Low level trigger
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
+   +-----+-----+-----+-----+-----+----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
+   | 1   | 6   |port |line | err | 0  |
+   +-----+-----+-----+-----+-----+----+
+
+- **err**: See above for definitions.
+
+NOTIFY_REPLY (Cmd=10)
+~~~~~~~~~~~~~~~~~~~~~
+The reply message for the notification is optional. The remote firmware can
+implement it to simulate the interrupt acknowledgment behavior.
+
+**Request:**
+
+.. code-block:: none
+
+   +-----+-----+-----+-----+-----+----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
+   | 0   | 10  |port |line |level| 0  |
+   +-----+-----+-----+-----+-----+----+
+
+- **port**: The GPIO port (bank) index.
+
+- **line**: The GPIO line (pin) index of the port.
+
+- **level**: GPIO line status.
+
+Notification Message
+--------------------
+
+Notifications are sent by the remote core and they have
+**Type=2 (GPIO_RPMSG_NOTIFY)**:
+
+When a GPIO line asserts an interrupt on the remote processor, the firmware
+should immediately mask the corresponding interrupt source and send a
+notification message to the Linux. Upon completion of the interrupt
+handling on the Linux side, the driver should issue a
+command **SET_IRQ_TYPE** to the firmware to unmask the interrupt.
+
+A Notification message can arrive between a SEND and its REPLY message,
+and the driver is expected to handle this scenario.
+
+.. code-block:: none
+
+   +-----+-----+-----+-----+-----+----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
+   | 2   | 0   |port |line |type | 0  |
+   +-----+-----+-----+-----+-----+----+
+
+- **port**: The GPIO port (bank) index.
+
+- **line**: The GPIO line (pin) index of the port.
+
+- **type**: Optional parameter to indicate the trigger event type.
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


