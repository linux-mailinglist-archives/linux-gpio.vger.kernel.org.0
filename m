Return-Path: <linux-gpio+bounces-33295-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YOJ4CMsUs2mDSAAAu9opvQ
	(envelope-from <linux-gpio+bounces-33295-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 20:32:27 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A4BF0278082
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 20:32:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CB02F3095C36
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 19:31:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35F37401A25;
	Thu, 12 Mar 2026 19:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="RfUKB0LT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011004.outbound.protection.outlook.com [52.101.70.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73CC1401A16;
	Thu, 12 Mar 2026 19:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773343845; cv=fail; b=aIhiOcRpXZud9neaERP1WUwrIVg3DDl63LSj7/J3yZYk65DOgiMsXfkhWk/H0ErQXgHNpRRTBcdSBuLZKa6k8T/Cqx71VRIut8Gf/fRjNUXs1MMCkA9PGySFOWRS7deMuDAMh4fBDKx6ditASkrnzebmzeDDKozpY8LGIkhJhHs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773343845; c=relaxed/simple;
	bh=g5yyKa3IYXjMdI7rvknEj7BfgCvDEvVt4dhuy4IVChE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Uo7wCFRhFF0h7bu33CMt2FPC92ROH8G13deFvm4iR4JNEL/vGX37oOzV7Gco7Kjpz6G/u6ALu5vd1+qjepR/2PLzExYtnPE/qXF3M5hw6UiM5hZhHVOjegW/69R2pWaYXeOa7AdTr5a4F0P6PDzUtbifjiyRGBqHOJlU2qGUy1E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=RfUKB0LT; arc=fail smtp.client-ip=52.101.70.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TykikAoUyze/HIP09ISH2QFvI7XgP8x0BcBYyRuivHGN/GSdfy2ftPkJDdE+jsNcKkaOjM4bGnPejcz4BYEt1zc1rYZFAhFhIXRKOEy+CeOwpVfhAGJzZQlgFn8uD0c2RM9gsvkRQIYrH/d855dUWK9PTu+/PiQ4KW9aOTU55y5I21wKPz9Mn93keb70t/dpggaqlKNtFsKM7Vx2pXIpY3bRi8lK3SMpazDU+UKwjJGZitjxzJt7sConpayKJ3inmhtuNISFHWoYmJ9REXSBGWGqtxBVQJ4SFSUqXbJ6Xxz3wPE88oL7E9BQDSgEPFkOGpNTvvFRmkol+kkT8SvWYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5moIam4IKb4wSzM8JvecfNVmA5fUzw586N+RSwOttEA=;
 b=qFHFYRrHActamMVrRO430fWf/uQnAVXAtJLGgAzmAaoND4N6hyvU+UUZ8QVa/YhO18820oD8On94L3lYRpjyyE0ryaWsQIO2R6/viPcJ+J6ua91XJ0EMfDR3bqiQA3WXUmEAUYUQqgyXe3jM5globGC6BNvyhj5rIEtbc+e8oaAzGWus6OxBUZ2L69yOJqbhdGp9vSIcIlxLCzwHtuSLmFLen4s8VnSrSQIpw8nKybbK6tIImsliDpHleyEtEZZiCKdyWIriOIwpx6hPluW1oWHnkR1znSgqhMNEBfF7aV0FHDTtVthqojIaYvnbXmZ01IvmBq4gNelpBHdMtgkD0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5moIam4IKb4wSzM8JvecfNVmA5fUzw586N+RSwOttEA=;
 b=RfUKB0LTnD0P5nBOmil6s4MYIYxgw+Rp5kbvQNnijAtLCgcx6YQqj3vxoHonaRNZgNgRqR1DdxDVLZZiAWQxwL/bJAaNHpV+2+af1bY8FnDLBarScPUIEI+6sovp5nx+/KwJQSn9JZs9GLCC/f0z34KyB0hSzp1pqC8jm0CX9o9Nd9tbcsdZ+n6OLYqKObeQB5e46cS7WFXCVtPPOLYteHF7kj4ayQ3J7IMzZ6ALGZmwSfp8/8fEr6mCU+XXlfykFZiU9WskVLTNcR/Y7zswKX/fSL70jJyqVXWJAp2HKYChQEMRDfFfu990zITl/Bv6cjiaUIIXlePa09sDPhiKZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by PR3PR04MB7468.eurprd04.prod.outlook.com (2603:10a6:102:8d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Thu, 12 Mar
 2026 19:30:35 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%4]) with mapi id 15.20.9700.013; Thu, 12 Mar 2026
 19:30:39 +0000
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
Subject: [PATCH v11 4/5] gpio: rpmsg: add support for NXP legacy firmware protocol
Date: Thu, 12 Mar 2026 14:29:56 -0500
Message-ID: <20260312192957.1978329-5-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260312192957.1978329-1-shenwei.wang@nxp.com>
References: <20260312192957.1978329-1-shenwei.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0061.namprd04.prod.outlook.com
 (2603:10b6:806:121::6) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|PR3PR04MB7468:EE_
X-MS-Office365-Filtering-Correlation-Id: 211a7286-81d2-421c-435c-08de806dd7b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|52116014|7416014|376014|921020|38350700014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	eSUzUbzUOIl27YIfSRlTCxsoOxkEDxqTe0CefQFSBhAItinaM6LSyHrew258mCvJlpdrcxJIa/XzZVppsIxd3swHzpdRNto0o1fYAEkj8fDyTgah0MTOq2pPA4bgoxn8oGhsEAcQlMZhS2b2+PtiKQKUnA4UtCZeMyIMkFXjTwHJcYB2b0guxC44k2ZaGEEjttlwA+2KzuqHtJ9po5sIfUhpgqUj1q3Cp2JBBKsueI7PfVOC9f0BQsFApfCFKVoZGxNJIeMnMqDcbrMRrlYOz02WXsE81iivqv+twuQl6eWTRZ3ThgT+XnzVN9mNREiUJWQMzPredkeWG2a1KPUDQUovJR/DMTUENJXZEAuNmp77C7Kflm6f4/iCyqLfXQul+RcNXWVJKTcewaIdD17oJu2Xd9AVEOuPh4fPAjdNcBzbesTcPhryGYJnlmhqc+mm1Lr37QGfLcrzR+DHh7uMrYJdIqPCYrMF13EQf//d2CD6rjNGsdt0O3mFTFUklKL8TMvq5smgnd+WlKyMic9/7r2a/7ig6/JYub8k4Jj9zynLYgRGLkhJ6X6ulSn4m6CKdnJuAffck9mK1QxjocrjN502co/ObkQeJdTAKrweAYgI6cXgE8TCPGwKNEC9f3C/nyDgE/gLOJoWDc4mBBRqWelSV1Sz11OSI+tZ7x3LEjyKQv+jJyXvOwpkKZaJQWlUx1g3QNrIFJMm/B60XrGy3bdlDuL42NFYjLLSBmSE17fjqpeEmPpb56i8g+wpym9QkV+N4a9gUikEe3GYp1p5Z44ebESY2VzslShaWXlwtANhQIsgzLOECaSBH/5nIEff
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(52116014)(7416014)(376014)(921020)(38350700014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uCkdoedW62jSmWomwqgzAD8khEpiGcSVQUfrDMFMxICU95MXpF7+fZA77x9l?=
 =?us-ascii?Q?Flbt51KBLY+1PSTYefo7JiK/TqupaHn7K/ky7350YGh421ZMmnGrD6Hl5Qs6?=
 =?us-ascii?Q?bCRi71Gaqi3U6wuAorvEkWgCgpWVApYdBTxm0wF9Oo9eOtWSraDwjGfOXFxe?=
 =?us-ascii?Q?7NAdZRH55EujOlhLqJ8Dy4pfNBPIdyOGOWMXiivEGxRcTulBIjlEIQncu8m2?=
 =?us-ascii?Q?nnYjdKqQUMJxih/DU72ZUflfu92265fieNqZXnYBLFIJaPHrghDxxzN44Z+T?=
 =?us-ascii?Q?WJ0BRCWNfH7TQcaEWwfWjAd2gG4Jer+wEGXQkiaaeZa5NcWhnVZGy/3E4GW1?=
 =?us-ascii?Q?u6PenjXXY7KqpxekOXcH3MNtitbvezrQo/18reLgUx1wjUgAYhX5b9aUz/Wq?=
 =?us-ascii?Q?U8zaVoCjGmHv92oTzZs5u1HGsAZkthz1og116wTKTHLWxGwQGCVkdcBfwleg?=
 =?us-ascii?Q?8GF1KVITquOGOBLkK4W5MTpJUBDHevw8npQVdVEyoAAmFfyyTb9wQ0bD9s/X?=
 =?us-ascii?Q?MDjENdyzpn+Sy1iXuQUIzTHV4JggeAd7QPjyGrVVlXpGjBIFFHnECNQJFvPU?=
 =?us-ascii?Q?jjhL07edaTKMx8mlQT0sGdJt+e4Gy2w+RNJXLV9J0jR5En//T2qQiQ7sP/rq?=
 =?us-ascii?Q?pI6njRDyrdHL0nEA7GbG8Su/Ea9VDIdmEoPZuZnrrVlp6jx+OrweD4L4jWWT?=
 =?us-ascii?Q?pc1xYac2Y0xDsxAkGDsWFHJ+29z8WpnRJWkWr3w7LmAm0Iorn4slOmOdlwHb?=
 =?us-ascii?Q?H2IhdRNuyqICzM2uTGOYSqsWsB8Gj4PUwlMnH4A1PI9EvPBU2eMVbbH2XrYc?=
 =?us-ascii?Q?hf2lyaQGA5Ouoqodh1jYUPXXF/8KEIWx1h/TDAOvbQfPdE6DU8QusaLp2+is?=
 =?us-ascii?Q?5LKGBl3E9d80PjhlNKd95YVzte3WKdPTK642u2RkkWeJq6C+dofjAEJSu9nk?=
 =?us-ascii?Q?0LYxdrfpG+nlAdm5DCipOIQXDzHJZaxlwoEx3AHvtiBd/NL65ILYE9pr4lUo?=
 =?us-ascii?Q?uZxSyiP/x9py2uZtF/i78C0gioG5eu+4aGRUMelrGpw3HgB9CXKpYQ+u/MnQ?=
 =?us-ascii?Q?ud1nQzEjagEqZUS37xgBCA2V7P3hatSIpSAdOtaR7SKKtmim5qNYwoWEvFmR?=
 =?us-ascii?Q?Me7NkzvFtmsxehVgam+dDKlYcaTigSWZaiWnMhWwkZrLPGsd044lJ5G+RYRP?=
 =?us-ascii?Q?Ykuw1V8D03Y86RLqON28SwkPQdJrkXiY993Qu6Eg/x/2nhPLkgR+3RpHOMMU?=
 =?us-ascii?Q?hmuAKToONDMpifX/SbDExzp4RxiX4lQh7BaK0uWUD+HR+2Sf88YiCZ4s69Tm?=
 =?us-ascii?Q?l//a3HKmCObsAuY8tDOhPEmA1Mlxll9u2Gd3QJmxZ4XAf/Jvph22bEI3Uk/0?=
 =?us-ascii?Q?uG0IAyoCKW0XB3XoUB2AxZi/AoX35Nfum/ht5532OlHcBWyHvwlrWIc7GNK8?=
 =?us-ascii?Q?kFnTV+zoHC7uidrXchddDrinOpEEzLQWudXu9poGRq/Reg0KrtmhCUzvEvfA?=
 =?us-ascii?Q?d6b3l8r4jrmb1wjKRR8/AbVc1M9zkxKWwjmvDC6/wNjn9sXkxAh1NJspMARt?=
 =?us-ascii?Q?jo6KQN45OzhKJQCDSNaGSfpDMi0Nf83hdC+AW6qx006vxzQZvz5zYTGnwBCC?=
 =?us-ascii?Q?TpQ+Oimoj0oeVZKgFXBBPp+frgFGJ5cP0fVuv4gnPWg1AKWy/Rz2XyMBTj3r?=
 =?us-ascii?Q?SHE/CAR3toLar0TGeAogrLUO4y145mT5Dn/zTolM2tSdpGX4pcizlyKQuR99?=
 =?us-ascii?Q?vYpm6u4TeQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 211a7286-81d2-421c-435c-08de806dd7b4
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 19:30:39.3715
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BERsyqUKQOzUbXjk9t9D1jiYEF3ZasOMpNi4ckFBARpB9K1wn77SO30W6B9wvlT2/bw1vvn/nb9p8MgAA1tz/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7468
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33295-lists,linux-gpio=lfdr.de];
	URIBL_MULTI_FAIL(0.00)[nxp.com:server fail,tor.lore.kernel.org:server fail,i.mx:server fail,imx_msg.id:server fail];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,pengutronix.de,gmail.com,nxp.com,lists.linux.dev,lists.infradead.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shenwei.wang@nxp.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[i.mx:url,nxp.com:dkim,nxp.com:email,nxp.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A4BF0278082
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Implement fixed-up message handlers to maintain compatibility with
existing i.MX devices that rely on the NXP legacy RPMSG firmware and
its transport protocol. This ensures backward compatibility and preserves
functionality for deployed NXP systems.

Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
---
 drivers/gpio/Kconfig      |  15 ++++
 drivers/gpio/gpio-rpmsg.c | 147 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 162 insertions(+)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index cff0fda8a283..cd0ac5bf4443 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1907,6 +1907,21 @@ config GPIO_RPMSG
 
 	  If unsure, say N.
 
+if GPIO_RPMSG
+
+config GPIO_RPMSG_NXP_LEGACY
+	bool "Support for the NXP legacy firmware"
+	depends on GPIO_RPMSG && ARCH_MXC
+	default y
+	help
+	  Enable support for the legacy NXP firmware protocol used by older
+	  i.MX products. This option provides compatibility for systems
+	  that still rely on the nxp legacy message format and allows
+	  existing deployments to continue functioning without requiring
+	  firmware changes.
+
+endif
+
 endmenu
 
 menu "SPI GPIO expanders"
diff --git a/drivers/gpio/gpio-rpmsg.c b/drivers/gpio/gpio-rpmsg.c
index 9c609b55bc14..be263c09a1f0 100644
--- a/drivers/gpio/gpio-rpmsg.c
+++ b/drivers/gpio/gpio-rpmsg.c
@@ -84,6 +84,147 @@ struct rpdev_drvdata {
 	void *channel_devices[MAX_PORT_PER_CHANNEL];
 };
 
+#ifdef CONFIG_GPIO_RPMSG_NXP_LEGACY
+/* NXP I.MX Legacy GPIO RPMSG protocol */
+#define IMX_RPMSG_CONFIG_INPUT		0
+#define IMX_RPMSG_CONFIG_OUTPUT		1
+#define IMX_RPMSG_GET_LEVEL		2
+#define IMX_RPMSG_GET_DIRECTION		3
+#define IMX_RPMSG_CMD_UNKNOWN		0x7F
+
+#define IMX_RPMSG_TRI_LOW_LEVEL		4
+#define IMX_RPMSG_TRI_HIGH_LEVEL	5
+
+#define IMX_RPMSG_ID		5
+#define IMX_RPMSG_VENDOR	1
+#define IMX_RPMSG_VERSION	0
+
+struct rpmsg_gpio_nxp_packet {
+	u8 id;		/* Message ID Code */
+	u8 vendor;	/* Vendor ID number */
+	u8 version;	/* Protocol version number */
+	u8 type;	/* Message type */
+	u8 cmd;		/* Command code */
+	u8 reserved[5];
+	u8 line;
+	u8 port_idx;
+	u8 val1;
+	u8 val2;
+};
+
+static struct rpmsg_gpio_packet *
+rpmsg_gpio_imx_recv_fixed_up(struct rpmsg_device *rpdev, void *data)
+{
+	struct rpmsg_gpio_nxp_packet *imx_msg = data;
+	struct rpmsg_gpio_packet *msg;
+	struct rpdev_drvdata *drvdata;
+
+	if (!imx_msg)
+		return NULL;
+
+	drvdata = dev_get_drvdata(&rpdev->dev);
+	if (!drvdata->recv_pkt)
+		drvdata->recv_pkt = devm_kzalloc(&rpdev->dev, sizeof(*msg), GFP_ATOMIC);
+
+	if (!drvdata->recv_pkt)
+		return NULL;
+
+	msg = drvdata->recv_pkt;
+
+	msg->type = imx_msg->type;
+	msg->cmd = imx_msg->cmd;
+	msg->port_idx = imx_msg->port_idx;
+	msg->line = imx_msg->line;
+	msg->val1 = imx_msg->val1;
+	msg->val2 = imx_msg->val2;
+
+	switch (imx_msg->cmd) {
+	case IMX_RPMSG_GET_LEVEL:
+		msg->cmd = VIRTIO_GPIO_MSG_GET_VALUE;
+		break;
+
+	case IMX_RPMSG_GET_DIRECTION:
+		msg->cmd = VIRTIO_GPIO_MSG_GET_DIRECTION;
+		break;
+
+	case IMX_RPMSG_CONFIG_OUTPUT:
+		msg->cmd = VIRTIO_GPIO_MSG_SET_DIRECTION;
+		msg->val2 = VIRTIO_GPIO_DIRECTION_OUT;
+		break;
+
+	case IMX_RPMSG_CONFIG_INPUT:
+		msg->cmd = VIRTIO_GPIO_MSG_SET_DIRECTION;
+		msg->val2 = VIRTIO_GPIO_DIRECTION_IN;
+		break;
+
+	default:
+		break;
+	}
+
+	return msg;
+}
+
+static const int imx_std_cmd_map[] = {
+	IMX_RPMSG_CMD_UNKNOWN,
+	IMX_RPMSG_CMD_UNKNOWN,		/* VIRTIO_GPIO_MSG_GET_NAMES */
+	IMX_RPMSG_GET_DIRECTION,	/* VIRTIO_GPIO_MSG_GET_DIRECTION */
+	IMX_RPMSG_CONFIG_INPUT,		/* VIRTIO_GPIO_MSG_SET_DIRECTION */
+	IMX_RPMSG_GET_LEVEL,		/* VIRTIO_GPIO_MSG_GET_VALUE */
+	IMX_RPMSG_CONFIG_OUTPUT,	/* VIRTIO_GPIO_MSG_SET_VALUE */
+	IMX_RPMSG_CONFIG_INPUT		/* VIRTIO_GPIO_MSG_IRQ_TYPE */
+};
+
+static int rpmsg_gpio_imx_send_fixed_up(struct rpmsg_gpio_info *info,
+					struct rpmsg_gpio_packet *msg)
+{
+	struct rpmsg_gpio_nxp_packet imx_msg;
+
+	if (msg->cmd >= ARRAY_SIZE(imx_std_cmd_map))
+		return -EINVAL;
+
+	imx_msg.id = IMX_RPMSG_ID;
+	imx_msg.vendor = IMX_RPMSG_VENDOR;
+	imx_msg.version = IMX_RPMSG_VERSION;
+	imx_msg.type = msg->type;
+	imx_msg.cmd = imx_std_cmd_map[msg->cmd];
+	imx_msg.port_idx = msg->port_idx;
+	imx_msg.line = msg->line;
+	imx_msg.val1 = msg->val1;
+	imx_msg.val2 = msg->val2;
+
+	switch (msg->cmd) {
+	case VIRTIO_GPIO_MSG_IRQ_TYPE:
+		switch (msg->val1) {
+		case VIRTIO_GPIO_IRQ_TYPE_LEVEL_HIGH:
+			imx_msg.val1 = IMX_RPMSG_TRI_HIGH_LEVEL;
+			break;
+		case VIRTIO_GPIO_IRQ_TYPE_LEVEL_LOW:
+			imx_msg.val1 = IMX_RPMSG_TRI_LOW_LEVEL;
+			break;
+		default:
+			break;
+		}
+		break;
+
+	case VIRTIO_GPIO_MSG_SET_DIRECTION:
+		imx_msg.val1 = 0;
+		if (msg->val1 == VIRTIO_GPIO_DIRECTION_OUT)
+			imx_msg.cmd = IMX_RPMSG_CONFIG_OUTPUT;
+		break;
+
+	default:
+		break;
+	}
+
+	return rpmsg_send(info->rpdev->ept, &imx_msg, sizeof(imx_msg));
+}
+
+static const struct rpmsg_gpio_fixed_up imx_fixed_up_data = {
+	.recv_fixed_up = rpmsg_gpio_imx_recv_fixed_up,
+	.send_fixed_up = rpmsg_gpio_imx_send_fixed_up,
+};
+#endif
+
 static int rpmsg_gpio_send_message(struct rpmsg_gpio_port *port,
 				   struct rpmsg_gpio_packet *msg,
 				   bool sync)
@@ -576,6 +717,12 @@ static const struct of_device_id rpmsg_gpio_dt_ids[] = {
 
 static struct rpmsg_device_id rpmsg_gpio_channel_id_table[] = {
 	{ .name = "rpmsg-io" },
+#ifdef CONFIG_GPIO_RPMSG_NXP_LEGACY
+	{
+		.name = "rpmsg-io-channel",
+		.driver_data = (kernel_ulong_t)&imx_fixed_up_data
+	},
+#endif
 	{ },
 };
 MODULE_DEVICE_TABLE(rpmsg, rpmsg_gpio_channel_id_table);
-- 
2.43.0


