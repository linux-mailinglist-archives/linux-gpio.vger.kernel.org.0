Return-Path: <linux-gpio+bounces-36057-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AJd9IlSU+GnmwgIAu9opvQ
	(envelope-from <linux-gpio+bounces-36057-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 14:43:00 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4674E4BD14B
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 14:42:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B2FC93007487
	for <lists+linux-gpio@lfdr.de>; Mon,  4 May 2026 12:42:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEB473D5253;
	Mon,  4 May 2026 12:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="EIuQqPqi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011022.outbound.protection.outlook.com [40.107.130.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5173D6476;
	Mon,  4 May 2026 12:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777898538; cv=fail; b=KgFQCNeuUyud4wnnu1xCKFLqMMXYE06cjHjJO+3Gop7fI6wM++BzPDTFebiUOspvSYNWK6MG8HKirU9h8bU+xwPvVVZfy1u7+bHEubIUnqzkBG/Xm9Nb0J1KNW5MNjMHtC/WXHBsFZBQ4bgAuk7sYbg1GASTQ2hrJD8RVrJzR/E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777898538; c=relaxed/simple;
	bh=a4AmnFedah2Hn5fv0eKZpoxUoI+xGpviKem+dmTR1Vg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QhXDoEccwA0IxAeZ+E2+W4agXmOZ/5boy482GULIw9wtMaw1WcsBT0JtCgEF83T/qReTuHMOB8m4UfXo8nXMX+YN2qo7y1Ceiv/pGGo1ecbOSnnfI0eAKPuzxl905kCK2gmbwRaeFM/T0BBKtBlM73XYqakiDZJIe1M3Xwuubd8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=EIuQqPqi; arc=fail smtp.client-ip=40.107.130.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VgKdedR/gDEsHO+I/rUgWKoAaYjEq+6G0rmWbUMto99XcttzVy9cUAXRXQrBcbQajHrkJcSpQaOpQxnhu3svxNDhmsmncR2IV28mcJ5qgH55UCk6BT8aRw549QjKSn95TtSalQeSqO+OS4Zd6/cuZQZ8F+UiuebBD8HZqeBI21IZqvJm1d9nBAHrsGCFlqC/6FczOM3DoJCU7/anY6Uvvj/2LksVFkIPSUbYvs43TxhzCCFgi3ZvcQwnT3RE+eqY7NlSqhkRimp9XaHW8I7Vl0QSE0gH/JHfT9B/IbmQTe/d7W/Hhgx4FN5dwQ6xg+Bd6IPAQqyVUTlKTXBrf+njKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N6FcMx6RYsfyRvKJXW3MmIy7Hcl20XPAjs8W3AFHBa0=;
 b=HndIXwDsKOkPd3xYk7oGVqIEooQfIIO7TV5CNpqRBkRq5Rh6X84GIpus0ZNe29J81wW7VPSQnZmNe1DKOoXmzSmvZ4wXgIyZUPfUkFvvh+KsvYTUfQla7cg75/tLmwQXXLulUVUDwkZZ6ceNA3+66yP9jSltJOpwCiI66tSAFhdgv+uFtvUrVNlzZ5AGOw65TX27mBY0DLESUGrdy/DNHXiQ1u+ZhkBO7m3WmPpkrr6y89wPFtB4oFFNzG+9cixQ3qOsplDanpr9VLKdstu1Ttnq2GzgRrOo4Mys3hqzE4M5xOeGD6NkYKIZe/i+n9ZIVGfY+C8lKI9JUa0HClor3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N6FcMx6RYsfyRvKJXW3MmIy7Hcl20XPAjs8W3AFHBa0=;
 b=EIuQqPqiaDGgas5i70MYi/4pm8V/AVxgeJWKiVnkCRkLGgPGSZDmCEb6jzDXQuW4XHp3aaMks+m5qQE/d+DvK2JEGWhHD2h1j5FyLDo/wJT8WPmYeNgssRn/17tY2Zmp3MTXQrZaFnebCBfyaiyOAMKEDOz3vKl2ek9d1T+z+/LJ4Cxo3tiFX9B2UhP9zsO/lk488/QhIFp+m0g0JdOnOpeaMztcMJIVjyve6vmi5c+hJjgDNHaHPOfFc3Y7IPSHPIM313PUp4c2yHumLic+4TifcSTDtyoiK9gzEWVSlSzDmWuktrk/eK9tM+rPDoukYUVWc6qMI+4DMB0v6MP9uA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::20)
 by PA1PR04MB10360.eurprd04.prod.outlook.com (2603:10a6:102:44c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 12:42:04 +0000
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85]) by AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85%6]) with mapi id 15.20.9870.023; Mon, 4 May 2026
 12:42:03 +0000
From: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
	Larisa Grigore <larisa.grigore@nxp.com>,
	Lee Jones <lee@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>
Cc: Alberto Ruiz <aruizrui@redhat.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	devicetree@vger.kernel.org,
	Enric Balletbo <eballetb@redhat.com>,
	Eric Chanudet <echanude@redhat.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH 5/7] dt-bindings: pinctrl: s32g2-siul2: describe GPIO and EIRQ resources
Date: Mon,  4 May 2026 14:41:53 +0200
Message-Id: <20260504124155.3615001-6-khristineandreea.barbulescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260504124155.3615001-1-khristineandreea.barbulescu@oss.nxp.com>
References: <20260504124155.3615001-1-khristineandreea.barbulescu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P191CA0008.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d5::19) To AM9PR04MB8179.eurprd04.prod.outlook.com
 (2603:10a6:20b:3b5::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8179:EE_|PA1PR04MB10360:EE_
X-MS-Office365-Filtering-Correlation-Id: 058ec4bc-b66a-44e1-4b3b-08dea9da8b48
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|366016|1800799024|376014|7416014|22082099003|18002099003|56012099003|921020;
X-Microsoft-Antispam-Message-Info:
 +G+X9X9lNF6t6Bpm7fyTEvPDcgRTHMVKoHzwc1CC2RfTYZav1R610dOb3/4uFSyvVhLnNguASht0Zm3D8LQcgTjvYfjPj2O13s9JaZ919QQChdHgilqeBU+p8fA3f7K+U8mrXo/lSXsd8WOYoINkNiIEFE7LigxW21Wa8s1spJIRaSHGOvoL2BqhubOTbMCleQfooJbctCwbvMZP1SvpM/vWrYhLZfK0uYJqSDlwJ5eqruqChveUxu1H8/bavuUl00wmMEv2oi/UvckJl8jCinBIi5HWlHWEPMCBjlvwKNS/Gt5oofPqVP5v0mM9+c6eJnvfcQS3+HLH5/QZb6zJ33RKy1NsWD8FOMuCzI4b3ZZrJ3phVQ7SdkAvEC/EoprMKpxuiE2Smt2I4BvBude0QzpDvMS1vGdn6hVFuKyBZLlT9Xe4vu9ijTylfjwFaafgLNK5+XK7nE8UD8FKVGouQWOTjNKiOJF+Q4w+TXxWfR3JZIXG0jo2mVqf79H0yYY6tA/JZv/ayIumlY52+CQHt64J8eeQZxmfmP7cRH7iDA53jqTyM5LxIIlFZQyqgSxKHwmM1Gxgt1ZXTO1mh7a2esd7g8PEiXi8gyy5RuxGk6Gn8+WX0Jv0lFRxz88mVQOua0v/lksh9pF5KtPJB3FmrvE/3LuBkINWz5tK7Qyiu6J69cbcHIukKha8g7r30Ier
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8179.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(7416014)(22082099003)(18002099003)(56012099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?mLYP7rJTv0PaGbuCF3y2gahGK0BG1oUihCTj7MZ7+bHLrf/8zdnpbKm+V/bT?=
 =?us-ascii?Q?vH2QPj4FaInhXAvyaEX4c3fQJO3FwZsbkffLZMzHSPhqtCwCLuipU2BBmvsG?=
 =?us-ascii?Q?+bRVcazCyfxD+wfzj/RT7lONNa5D3WX0vepAQvOaLI9PLW87IJ8+seFgcIrR?=
 =?us-ascii?Q?+ALHNRPI0s+sN6XELQ6xoT89ncBULvSZ40QM3F64dFNIM6LVCW2pSa0gN5pL?=
 =?us-ascii?Q?OycPjtCqvTrWE9zH3bwPUhgkEV3tP2UMZgDV5PMdUd2E2afRL1jBg+h7IKr5?=
 =?us-ascii?Q?0hd+SAs/R95xkCWwzcSSxM18rVRK0o+7Nk1jxl74dnbseGHYl4olXbD2Q+0a?=
 =?us-ascii?Q?1ET1tAXqaHOhVzmzNDb2wAv6vmDXtxWW+OMQY8e8nssQ/mygppZrxMgohS1q?=
 =?us-ascii?Q?KL9UFTFa4yyefVwPe6/X8MDR/xzXF+RyGYPl75UClsVQFFyAjFi6tN8EqwJL?=
 =?us-ascii?Q?DtV1hROG/as0RAWDLtcViXEPOxIqomB6H5tj9Pke2niBRF7hAdl1hHRvv716?=
 =?us-ascii?Q?flpIhZLediKEznfO4OwLPeNRqkVsxzwC9Q03Z2vjV8jKZaNPwMS4A1gMLHGU?=
 =?us-ascii?Q?6LSOlGM0DxhlKF9JamnVSMRyP3lgkQl3dEvZptr+aQS8vdhFLIKHSx3Xq7U7?=
 =?us-ascii?Q?KgUYm/4I+qVxoPyDL3bWgXJFzZKsTfcX1prlroOLUfB4RGtUqW8HmKQifVoi?=
 =?us-ascii?Q?1mCKb25v8KRlwgwWZ0PizBoqd0nY6H+o43mdIk1bjW232+BQFBCbWnLKjNnz?=
 =?us-ascii?Q?4ncXZUluM2hpeO76R2b0YIwqhhiK1vN81+CwNuPCGbQTY8WqykrWQAStGNUx?=
 =?us-ascii?Q?1TXXVrhthCEoShzzYsGSfsE1t2/tU1I0jrhe2ixv2SSnt7KMwJGwMlOXOLHk?=
 =?us-ascii?Q?2Gi+zurUUGA2oXLdw2pLf26iQ5Bqozw1LsgvFIXK2CYXvkAK/RVBeMzbBH2P?=
 =?us-ascii?Q?cFQps5IxW170uPXY9tvfqZ+JDJ29Q7NEW+B/AUlgPTQdwImdq8WX6BtvxW3O?=
 =?us-ascii?Q?RXLE9PFiiXYMLuuhiq4HrKk+OsTgvjpy8yc3qRpIUzt96ffiLBHkOrmcgMGS?=
 =?us-ascii?Q?8lSYiQ3UacVPoyo9xVJfV4T/ev8qgnomhYqvt5KdpEaNms6WNqz7GS7KciXy?=
 =?us-ascii?Q?16lA1YvNWk7BB6OXt8pbnxPS0Sa2iK5lVwtmZ1HqaauP0T8dz2ih3cLPHRCi?=
 =?us-ascii?Q?jP1IfrvmjbPp5Tlz70kLyIzMZ2yfSLdgcSlTC0vVTe5d1I1Mbr3KVEzP2OZc?=
 =?us-ascii?Q?QYiTAxM9PmpwFdaXr0snG0MWaHiG2qg07EZD/3XkvzAZGX/ZdkR2fbHhXzxD?=
 =?us-ascii?Q?x62rDWEVRbY4bPSMyk1Bydcy7L90qQi4+8dpQ0oPKgCnB33JJ5O2JW8ZAqIB?=
 =?us-ascii?Q?Kin4Gv5FxNFl3sKvMVOYnhBzIs1IToKGSnYW7i8Bl4HSCTFY6oHqnPzCjFGb?=
 =?us-ascii?Q?wERMgzN5oDXeLkWto5u2EI/X3CnliALOQylC1M7KxuOHiez/hBcoAQozvvCH?=
 =?us-ascii?Q?yLWCpvHzV95m0ognMByIcokNTs+Wd3s+cUV5s7VMcmhHzSp51zQOTBamsP4M?=
 =?us-ascii?Q?uZHuDP1RJmGhIcejGz1LPHkt4f6CTL+Y8FkMqLprowDqYSY70gyoxyyUre+1?=
 =?us-ascii?Q?GI4yKaSlYvzjVFlxt8LkNVXyjOrTzFIR4hVwT9FIx4KIOSP7Xbeq95t7pzci?=
 =?us-ascii?Q?x1ZB+19E7QeLVZDqtmJybLrpW0yU3hSSnoe5Nsm+9aar68/bzpFbaC5n4saj?=
 =?us-ascii?Q?a+/lIegHNtQKfGU8i3GIq232gx3qbQP8Yp46xLQWlD4DbYekgyUc?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 058ec4bc-b66a-44e1-4b3b-08dea9da8b48
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8179.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 12:42:03.9296
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GhgHkBPcqE8LExWXLBk7ssxmPjMCFpgaJGXfooUBGT8nSZTkuJltEdH60HZA4JtlpcPEV7GWnAXVcVqkySZAxP/QB7O5dgZQ2lLP9897IiTK4XoAq0i8wBPVgbPvjcAs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10360
X-Rspamd-Queue-Id: 4674E4BD14B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[30];
	TAGGED_FROM(0.00)[bounces-36057-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,bgdev.pl,kernel.org,gmail.com,suse.com,nxp.com,pengutronix.de,linuxfoundation.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[khristineandreea.barbulescu@oss.nxp.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-0.997];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.nxp.com:mid,nxp.com:email,NXP1.onmicrosoft.com:dkim,devicetree.org:url,4009c240:email]

Extend the S32G2 SIUL2 pinctrl binding to describe the additional
resources used by the updated SIUL2 pinctrl driver.

Besides the MSCR and IMCR register ranges used for pinmux and
pin configuration, the SIUL2 block also contains PGPDO and PGPDI
registers for GPIO output and input operations, as well as EIRQ
registers used for external interrupt configuration.

Add GPIO controller properties:
  - gpio-controller
  - #gpio-cells
  - gpio-ranges

Add interrupt controller properties:
  - interrupt-controller
  - #interrupt-cells
  - interrupts

Also update the binding example to show the complete SIUL2 register
layout, including the GPIO data and EIRQ register windows.

Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
---
 .../pinctrl/nxp,s32g2-siul2-pinctrl.yaml      | 107 ++++++++++++++++--
 1 file changed, 98 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml
index a24286e4def6..0bd341f1e84d 100644
--- a/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-# Copyright 2022 NXP
+# Copyright 2022, 2026 NXP
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/pinctrl/nxp,s32g2-siul2-pinctrl.yaml#
@@ -17,26 +17,39 @@ description: |
     SIUL2_0 @ 0x4009c000
     SIUL2_1 @ 0x44010000
 
-  Every SIUL2 region has multiple register types, and here only MSCR and
-  IMCR registers need to be revealed for kernel to configure pinmux.
+  Every SIUL2 region has multiple register types. MSCR and IMCR registers
+  need to be revealed for kernel to configure pinmux. PGPDO and PGPDI
+  registers are used for GPIO output/input operations. EIRQ registers
+  are used for external interrupt configuration.
 
   Please note that some register indexes are reserved in S32G2, such as
   MSCR102-MSCR111, MSCR123-MSCR143, IMCR84-IMCR118 and IMCR398-IMCR429.
 
 properties:
   compatible:
-    enum:
-      - nxp,s32g2-siul2-pinctrl
+    oneOf:
+      - const: nxp,s32g2-siul2-pinctrl
+      - items:
+          - const: nxp,s32g2-siul2-pinctrl-gpio
+          - const: nxp,s32g2-siul2-pinctrl
 
   reg:
     description: |
-      A list of MSCR/IMCR register regions to be reserved.
+      A list of MSCR/IMCR/PGPDO/PGPDI/EIRQ register regions to be reserved.
       - MSCR (Multiplexed Signal Configuration Register)
         An MSCR register can configure the associated pin as either a GPIO pin
         or a function output pin depends on the selected signal source.
       - IMCR (Input Multiplexed Signal Configuration Register)
         An IMCR register can configure the associated pin as function input
         pin depends on the selected signal source.
+      - PGPDO (Parallel GPIO Pad Data Out Register)
+        A PGPDO register is used to set the output value of a GPIO pin.
+      - PGPDI (Parallel GPIO Pad Data In Register)
+        A PGPDI register is used to read the input value of a GPIO pin.
+      - EIRQ (External Interrupt Request)
+        EIRQ registers are used to configure and manage external interrupts.
+
+    minItems: 6
     items:
       - description: MSCR registers group 0 in SIUL2_0
       - description: MSCR registers group 1 in SIUL2_1
@@ -44,6 +57,28 @@ properties:
       - description: IMCR registers group 0 in SIUL2_0
       - description: IMCR registers group 1 in SIUL2_1
       - description: IMCR registers group 2 in SIUL2_1
+      - description: PGPDO registers in SIUL2_0
+      - description: PGPDI registers in SIUL2_0
+      - description: PGPDO registers in SIUL2_1
+      - description: PGPDI registers in SIUL2_1
+      - description: EIRQ registers in SIUL2_1
+
+  gpio-controller: true
+
+  "#gpio-cells":
+    const: 2
+
+  gpio-ranges:
+    minItems: 1
+    maxItems: 4
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 2
+
+  interrupts:
+    maxItems: 1
 
 patternProperties:
   '-pins$':
@@ -82,6 +117,38 @@ patternProperties:
 
         additionalProperties: false
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: nxp,s32g2-siul2-pinctrl-gpio
+    then:
+      properties:
+        reg:
+          minItems: 11
+          maxItems: 11
+
+      required:
+        - gpio-controller
+        - "#gpio-cells"
+        - gpio-ranges
+        - interrupt-controller
+        - "#interrupt-cells"
+        - interrupts
+
+    else:
+      properties:
+        reg:
+          minItems: 6
+          maxItems: 6
+        gpio-controller: false
+        "#gpio-cells": false
+        gpio-ranges: false
+        interrupt-controller: false
+        "#interrupt-cells": false
+        interrupts: false
+
 required:
   - compatible
   - reg
@@ -90,8 +157,11 @@ additionalProperties: false
 
 examples:
   - |
-    pinctrl@4009c240 {
-        compatible = "nxp,s32g2-siul2-pinctrl";
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    pinctrl: pinctrl@4009c240 {
+        compatible = "nxp,s32g2-siul2-pinctrl-gpio",
+              "nxp,s32g2-siul2-pinctrl";
 
               /* MSCR0-MSCR101 registers on siul2_0 */
         reg = <0x4009c240 0x198>,
@@ -104,7 +174,26 @@ examples:
               /* IMCR119-IMCR397 registers on siul2_1 */
               <0x44010c1c 0x45c>,
               /* IMCR430-IMCR495 registers on siul2_1 */
-              <0x440110f8 0x108>;
+              <0x440110f8 0x108>,
+              /* PGPDO registers on siul2_0 */
+              <0x4009d700 0x10>,
+              /* PGPDI registers on siul2_0 */
+              <0x4009d740 0x10>,
+              /* PGPDO registers on siul2_1 */
+              <0x44011700 0x18>,
+              /* PGPDI registers on siul2_1 */
+              <0x44011740 0x18>,
+              /* EIRQ registers on siul2_1 */
+              <0x44010010 0x34>;
+
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&pinctrl 0 0 102>,
+                      <&pinctrl 102 112 79>;
+
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        interrupts = <GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>;
 
         llce-can0-pins {
             llce-can0-grp0 {
-- 
2.34.1


