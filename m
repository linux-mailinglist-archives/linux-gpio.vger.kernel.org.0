Return-Path: <linux-gpio+bounces-36055-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qIgaBUGU+GnnwgIAu9opvQ
	(envelope-from <linux-gpio+bounces-36055-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 14:42:41 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C94094BD12D
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 14:42:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B93E4301983E
	for <lists+linux-gpio@lfdr.de>; Mon,  4 May 2026 12:42:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D87463D6481;
	Mon,  4 May 2026 12:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="dt31EdbP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011022.outbound.protection.outlook.com [40.107.130.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1CA23D47BF;
	Mon,  4 May 2026 12:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777898534; cv=fail; b=QRfVNcKY23Zv8rxTe2c3vzrNDMmPvZN5aGpRChJOqyACYUpo5arXvVZgyiQawowU4DaCF21Dlf9j2IDM3YXy3Q4r1lkYO01yuAmY8tBfsoKkQLuigAKNRurxBHUb1jqCpMD5cUcFNz+HU2skTpyPI9w2AC/FWl/Y4U0fAIg7I3I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777898534; c=relaxed/simple;
	bh=QrRg6z4HUCLQt5+1hiTy/A/LPNtl0OovSYWc1Hr6g7c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=W4ZTn3xLZx3VWUOnDquD2YA23SdrOKs0ZQltRnStHfgNKde5kweCvIuzgGiFyJRn1ntpKbqH1OAF83Zl5e44nl0Cj/DvfdxrVBFRK2USc0FGp49pj+vmhEaZg1brlzeb5AFHn2ftVsbVvvcGmJSIZsTlIgM2iXIlHHstkk7Yln4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=dt31EdbP; arc=fail smtp.client-ip=40.107.130.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uawj8ocagIF0p2sPB1NDnsUcM8P8Zgt51qLp1qzeeLxt3VsRwhKRnT8s51wjJypHsa0XLpxTcB2T7RVjcLZQNE8R9yPvCLaAbwfe9IFzLPXEHhhJbuKM9M4056opUIFkx1mn7wubInUxQ02Q9EEMyTxQ3Ne/7s82ej4HfoUBgg7/GY6ZvtCji8/aE7DeOszmWou1RzyPCHmeXWBXxUdlB1Q8GXNXGUbpCVpYGBtkfIEuaozaIoh9NFXj+4/SL469/Hh04i4oj34yySbT4gEP3zmoowFa4VBS8EGNiOUkJej6MKv3lRQSIfkZ0Z/ab+9MGItdJX1SUw4eF4XfXOEsTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nd9WsGVc+B6zlJlmKmQ7+C1dICQsJp9GHcqLEnX0Ohs=;
 b=H7vX/6E6QFnE/Dsuuv94RlF0BAJOqw1PAFyIvXBnJsfUc/D2g1ySBNe+hK89XBudCgoUbaLCL7ER/1EeoufQzWv5xi8GDm1HC+oeuNT+FCfsJc6/lzb228PLCF+i9fjQHVLt+8ZQX5vaU31xin+fn3/9S8CsIm7zNMrjf5BCoJ/cfzRSYZznEQSeU9moK0eTghuigw7I5UyudZjZ+Zgdg5Gu9R2Z+6DkpkU5XPG24XMt8li9ZU7sZvEZsvJ+USel7vMzQpHICfICTjXS4pIU/6h8R4hN+nPhsfh4H7GBI7rM3UcICrEfi8WZYgbo1JCb5qU4bGo2vP26NP8B5S6uwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nd9WsGVc+B6zlJlmKmQ7+C1dICQsJp9GHcqLEnX0Ohs=;
 b=dt31EdbPTSXdBuakFCsXc8Ngtqun/CnoOlduhX6A0LJVtCTwyK9He0yzvh12Ovm8W5lzmsXd+MiLAnuJlm6hK6ehdosktUbv+ToVNAtzDJ63MhC9dFttYOn+v1LZTrOZobBGA8itpI2v3GQ/rB9bg58M7ULQ8irsIrM34kjok36TskYU2SDrD0w20wlwYEyQCra0/wm5Y2tf86ta7ul/ZblMk1wRshGIUmCicut+AtFJU4gBfdbRLdH3Sl/fCVnxRnocaWVHvfESKt3gDqltMW46px1iyY/EWRzEmTXyUoIRecR1srt8fVFe55asF0anGG+8XgOQohoUHEWqVrjLXw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::20)
 by PA1PR04MB10360.eurprd04.prod.outlook.com (2603:10a6:102:44c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 12:42:00 +0000
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85]) by AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85%6]) with mapi id 15.20.9870.023; Mon, 4 May 2026
 12:42:00 +0000
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
Subject: [PATCH 3/7] pinctrl: s32cc: remove inline specifiers
Date: Mon,  4 May 2026 14:41:51 +0200
Message-Id: <20260504124155.3615001-4-khristineandreea.barbulescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260504124155.3615001-1-khristineandreea.barbulescu@oss.nxp.com>
References: <20260504124155.3615001-1-khristineandreea.barbulescu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P191CA0013.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d5::8) To AM9PR04MB8179.eurprd04.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 6e5b23a3-e674-41db-67a7-08dea9da891d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|366016|1800799024|376014|7416014|22082099003|18002099003|56012099003|921020;
X-Microsoft-Antispam-Message-Info:
 JKF6kXEcm+JZpLzEMWhvxIN/b3zKvus0XTytG9dA1cyBIsZ/E/f16OAW4VkY85YogSPxz0jFBdDQduo+OFEfCojCshIC/GtWNXLsf4lrLJTPRRYMLjjd9N6mTRfZugPdwk+lX2c11gE0qoyj+QtFelpNu7i7gf87vQm6sZcIf1AL504T+ChSmDg4Z6ksDmbxD2CblChsAaXJ11K4nq2kJrXkbGlErnNRlptc97mGwA0IeinNVZXd5/LAaHXTizQYw+06UzFgKNIniqqHf4YXWK9y+kq1kw4rTIapVf21uQwZTTSo4ZlfWhnyk2Ewq1yqQCPygOCoRmBAeEPWy6Mi55J8kAAOAWAho1RLBaPEx5fVy6OijiidrmP+V4Y57a2Q2O5DV9vZqk5eBdFUufMdkeeYoqg0pErMt3tsF7Zmpo15p3nI4b1OnFk8+sZnw4nNkJB3jGBD2fk+kooDjzH5A6Ri0OUfvbxBMwJRmQNe3hLCeFuaAw/Xmrc+OoK9EBXs3nTjzsnoNF/mGZvhy4ViGZxvHJTDL5Je5jvQyzu7OOGECZhGz8Znj4Ymg+D+ORJGyOOhWItadcvT1VTaA/qA+tP6CwvngIj8DrHyYlUY5BUJ0IwYsXxOkb8ILKwaNmbIT9O9tNk4gvw7Yymix5YI49NuQc7Z0Y7Uhbe7M0yi/iJqFssESXZM5ymbZsAeQ86qU3Fn176i92WCGeHQfu9Q5Ovm8L3xMYXlh89HDgxO4EQ=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8179.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(7416014)(22082099003)(18002099003)(56012099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?uLntq9Nu8nslDEmEXlSPGOF4pKw6a8RGsOZ0LNXXgYPcEM/skPsceGmO8ZkE?=
 =?us-ascii?Q?kUoiUeNVlymobZL8LiuJ090gSG4y+eTO1hlSGpxezwgO/DCLs+o04gFhbySi?=
 =?us-ascii?Q?ZSFbBrZrBbXrTGkl+w67EfvP2z2igJZvbRWP7mFI2wGMppb0Tpnh4RkE/FbT?=
 =?us-ascii?Q?UMmXf/4SXgjpaMx4ug8lhOmBQtv6MwhISmHMrGj28OQcAJAuMrewz+AD1sN0?=
 =?us-ascii?Q?qgqI54aJjWp4Nvp+VgjLJ+H/ty7Pb0nXa/w/T7S33fcmVeymiEX8C0vVZ5Ec?=
 =?us-ascii?Q?vn4c1exlJ6n8ZXEJvP6iuiEyGAnteGtd4wH5UOwirxV1xZ/lh3X27+HdxTF8?=
 =?us-ascii?Q?VvBRXlPoc10jB5MDfJtxFnQBBbZEppDERjjdxn0G6qAT3+w7YSqm0XYqhs6o?=
 =?us-ascii?Q?scUP1U4/0VS3k5S47IPyzmdJ4+v7sK11ukkv+yNaRiciavJdxKC5Yb2WSYoj?=
 =?us-ascii?Q?tCYeiBMxxDzQgtMoe7ArC84AFQXJV76oss1NMiAqO11g6dgJdlfBgWqovK7w?=
 =?us-ascii?Q?Gb5IF+M9ZzYOahQA2pTyga4xXwlgMSljMVMNszaiy6Q/HjirjCc7GI8/Cbjf?=
 =?us-ascii?Q?lonln4dn9AzY6TXGmrwnx8KO7G0jhp7YUXVerC0xQHaI5N7xoXLTVJnvnNek?=
 =?us-ascii?Q?4WY5++iZhy7XowKfi8sdtxNiVUZb3JfhuK2mGFebJVqXtOEzQG2jwQNd5JTL?=
 =?us-ascii?Q?5Up6cswVZdKzkhIbm4W+K1MC/DYpU8G644ngJZZoA27wezKYR+KOrJFk0MMf?=
 =?us-ascii?Q?VTPA1yPmx8/mw8LqGE8hvorcFdwIhgg/oXCc2nREBH3cjyeuyWf1TM3bFmhO?=
 =?us-ascii?Q?y5GSk7LEO0pkLCSMzIJ33yjK0R4Wje2imC1P4UK+2zEznIsk2WFcUHUqvXxq?=
 =?us-ascii?Q?MJTY7WYJbcNkbZXncqEFt9628ha8gL8ZEGZmVN138AARigHq5yCNOOUHBm7b?=
 =?us-ascii?Q?20O1Bh14+FShP4LPlRW1XgQpSEMVa8Qwr/cnQ4D5F4AqvRM7+Fnd84d6Ch3S?=
 =?us-ascii?Q?RavsdLc5b5mslnpU/0FJS15C01UZb3f0K/HgLbiUWcZw9IZSrPUanM2IIw3l?=
 =?us-ascii?Q?7OAeITXRA/l3Pe3mzCIHzEYbIkm9QXWv8r0EksY2n4Rn7zH6QZxPLv+uMxvc?=
 =?us-ascii?Q?CpY0XF+udJFujicOkv3i1U6p4qwjPpa2kttJInmZccpepNS+Sk+N6H5mWLpt?=
 =?us-ascii?Q?m4ED038/1vTFWxYth04oAl6zx81l3dNbt3aSEMFIHlYLn5/R/2sROYcQ6g1G?=
 =?us-ascii?Q?orcRrvutlGj6+KkR20oC4CXHP9TBwCGUm/sOC6SAZhp4sV4C9dG4nkdnW5M0?=
 =?us-ascii?Q?6b3ZiEdfUWdMo3XUmI+wnGlmpXHUCBNb5XSzksKZU4pHHi0bwKtDvVwt79px?=
 =?us-ascii?Q?iHUxjApINI3XyeTtRka/oyUvE+ZomxN0uoJ1kEWaBmXehWnFkaOArPaPDhNG?=
 =?us-ascii?Q?GYjz8FiD0v5uSTs2uQAXbzACnlbxQe06Z/IDjvXPXYm8L8E571GtI9tVqJtN?=
 =?us-ascii?Q?Bxua/0W5LbvQMKtgcuDBlcs4uwdocLcDJ/5Aqiki7U5LafAIvdZ7+waPGdE7?=
 =?us-ascii?Q?PJ4RpQEuPPavVtYlvHjOsXcGw+/z65yN45or8kBxpsAw55hr/gs3zfTcbSsy?=
 =?us-ascii?Q?5CiX+bCRbv25HMx3jgYYGKSnm6OstMynX/98UtN/1q7jFfZ2Qs0HYw0UMxDM?=
 =?us-ascii?Q?oWoTau+zK4FUWmdfLzhHNjzKHwILgEd47R97+PGVXYDBxbfUAdTP6lV/Loja?=
 =?us-ascii?Q?+whyTghWeo/YkXnSpoSS50W1A+OBPiYETVruxHgddF7UY8Ho2LXz?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e5b23a3-e674-41db-67a7-08dea9da891d
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8179.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 12:42:00.2888
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xDeh9605COTW0B5zubSPR5rQhKLxOgpvdYTmIkD+jD4Sir0TLD1ovReRJGg3PsJEV4mXZfoUT6rOeELggzRdKPfp0xCGvef1cGhGXIYzoFFKpi1sOB5W6Q5GM++nsPc9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10360
X-Rspamd-Queue-Id: C94094BD12D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[30];
	TAGGED_FROM(0.00)[bounces-36055-lists,linux-gpio=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.nxp.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,NXP1.onmicrosoft.com:dkim,nxp.com:email]

Remove unnecessary inline specifiers from
static functions.

Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
---
 drivers/pinctrl/nxp/pinctrl-s32cc.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/nxp/pinctrl-s32cc.c b/drivers/pinctrl/nxp/pinctrl-s32cc.c
index 558d9ae1fa0c..1c95e0022020 100644
--- a/drivers/pinctrl/nxp/pinctrl-s32cc.c
+++ b/drivers/pinctrl/nxp/pinctrl-s32cc.c
@@ -131,13 +131,13 @@ s32_get_region(struct pinctrl_dev *pctldev, unsigned int pin)
 	return NULL;
 }
 
-static inline int s32_check_pin(struct pinctrl_dev *pctldev,
-				unsigned int pin)
+static int s32_check_pin(struct pinctrl_dev *pctldev,
+			 unsigned int pin)
 {
 	return s32_get_region(pctldev, pin) ? 0 : -EINVAL;
 }
 
-static inline int s32_regmap_read(struct pinctrl_dev *pctldev,
+static int s32_regmap_read(struct pinctrl_dev *pctldev,
 			   unsigned int pin, unsigned int *val)
 {
 	struct s32_pinctrl_mem_region *region;
@@ -153,7 +153,7 @@ static inline int s32_regmap_read(struct pinctrl_dev *pctldev,
 	return regmap_read(region->map, offset, val);
 }
 
-static inline int s32_regmap_write(struct pinctrl_dev *pctldev,
+static int s32_regmap_write(struct pinctrl_dev *pctldev,
 			    unsigned int pin,
 			    unsigned int val)
 {
@@ -171,7 +171,7 @@ static inline int s32_regmap_write(struct pinctrl_dev *pctldev,
 
 }
 
-static inline int s32_regmap_update(struct pinctrl_dev *pctldev, unsigned int pin,
+static int s32_regmap_update(struct pinctrl_dev *pctldev, unsigned int pin,
 			     unsigned int mask, unsigned int val)
 {
 	struct s32_pinctrl_mem_region *region;
@@ -484,8 +484,8 @@ static int s32_get_slew_regval(int arg)
 	return -EINVAL;
 }
 
-static inline void s32_pin_set_pull(enum pin_config_param param,
-				   unsigned int *mask, unsigned int *config)
+static void s32_pin_set_pull(enum pin_config_param param,
+			     unsigned int *mask, unsigned int *config)
 {
 	switch (param) {
 	case PIN_CONFIG_BIAS_DISABLE:
-- 
2.34.1


