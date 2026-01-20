Return-Path: <linux-gpio+bounces-30784-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJGzG1uEcGktYAAAu9opvQ
	(envelope-from <linux-gpio+bounces-30784-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 08:46:35 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E0853008
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 08:46:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id CCFFA648E94
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jan 2026 12:02:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 606FA426ECB;
	Tue, 20 Jan 2026 11:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="RJyTYVbt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013028.outbound.protection.outlook.com [40.107.159.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A39426EB2;
	Tue, 20 Jan 2026 11:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768910380; cv=fail; b=Wm6Nzkp9hhkhQQRuP2SxsxKkIaA3TJd3Trq7RpUa2vQ0hw3FTzUkkmeaQYe1+i3Lbn+/5FI9BGYxBS6JyV3ZjM7RWt+dfvau4XfrgdF8kvO+W3rBfxJ9BZI4/7Wiv56FUrpOR/BCKms3RfINsZ8VcT/POVlhOIkQKiHXt8U/FVo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768910380; c=relaxed/simple;
	bh=0opUi1oAun/Kibnw73ZDlTHCHvEvkGX3oYOq7b6rsTM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LSgTlFAiQ4N8zz1PfjHGz73qrOWJg3UGhSYV8KBaKDFeiMQg6xVJCyh4FfAuyl6JL3BQq0reyQYeh9rMOB+ovJGysFIAgj/I06LuKkCYwrSu0j+sR5T8lGIcqLOCp0Sl6MgcPw2kpyjbwvwQid61R40bx/KwsmTahKB/bAjv6OY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=RJyTYVbt; arc=fail smtp.client-ip=40.107.159.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JjgaiMQ+vKpAPdx9JLS6x+3SRpKf8X/6G8GUUfDvi6pJBnZbIaXDwexcfePD2TZrqiHBMhPGcroW8+sful3tqs6Yc/3S+l78B0n8YrMpaFvcmbolVJhG0ofouOv6D2s/1eoHfoQbn6zkRQDaRfnzxt4Vgq4j4nySgkw3Ehjtvq8/9kQh08rXdibUiQHpZmBk65vjiru+lJDyB2ZChn2bL4J32vYfhmplv92VpX58rzu2Agowrxl8l9WKtSsVWS7JbJdd+vxS7u0vy97xx1Z6f6TG7DEtncE6v3tMGYj+3FIyhSgFKiMMVnBqDWP/Y7Tpyc0PY3Hj/xc81oOz+4gITw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vqja/pm+VcMjs4dDEryA9K1mvbTddcFRpY5ZNEGz2yQ=;
 b=nORnClIEQTvhj4q73JzzuM5+kPUPayi4iZzJ82chiUJBsNP6i160an7MmkvOdQ8RdzzcBOL8E8A9unYIxKRp+4ruxGfU7HF0CcXd1qmqg+1HXkm0tI8epz9KhvP7aoLhVqjqHVlBsTguMJFo6tqW6lOxHL/gyoyz0EEB7byVKCfKeur0akeKAP2RO/tTJ1h4Vt1YUC0t0QWFJCIHD7tR1goRc9YCWdkqKWhi9NM5dQrehH0PXxZv1PW+KIkmy8wqFVTv+sI+BGJy++xrNpUK0BYvq9XhB7Sy4IxwwFFv4n3h9tCkdiwDalh97pn7HtibM3BbuXrpAorCo4EFJPI5fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vqja/pm+VcMjs4dDEryA9K1mvbTddcFRpY5ZNEGz2yQ=;
 b=RJyTYVbtbSnDAIf+meVV+rp3/AMPBvBI0Pvr3zGLQ5JviI+222u0f9vRd428TWGxyvPXoUUYix7UKHG53RyI54kFNh+0gBpK1f2BxxTL8ykKiJAVIFHXvKFYlTDttsboCV4fC56Cz1Q7U8nvT2cNa0Pg2gLAepPSSmobj8T9M/TTtJPrjBsd9QudsXUD3l1veuOCFwXeoV4PCjYY37MdmLTX9uFHwA/aPIgriCSG+56eXoNe8LXLsUa7TIAW2HtVIAhfxAV0d6JDRZgGCNZteQq/HOAK7aEmnrbpv4dabamNeqqsi5n70v5crkhFSN98I0aih667IGQis9PWc39L9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8190.eurprd04.prod.outlook.com (2603:10a6:102:1bf::23)
 by PAWPR04MB9717.eurprd04.prod.outlook.com (2603:10a6:102:380::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 11:59:33 +0000
Received: from PAXPR04MB8190.eurprd04.prod.outlook.com
 ([fe80::6720:8c00:7732:fc42]) by PAXPR04MB8190.eurprd04.prod.outlook.com
 ([fe80::6720:8c00:7732:fc42%7]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 11:59:33 +0000
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
	"Rafael J. Wysocki" <rafael@kernel.org>
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
	"Vincent Guittot devicetree @ vger . kernel . org" <vincent.guittot@linaro.org>
Subject: [PATCH v8 03/10] arm64: dts: s32g: change pinctrl node into the new mfd node
Date: Tue, 20 Jan 2026 13:59:15 +0200
Message-ID: <20260120115923.3463866-4-khristineandreea.barbulescu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260120115923.3463866-1-khristineandreea.barbulescu@oss.nxp.com>
References: <20260120115923.3463866-1-khristineandreea.barbulescu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0447.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c6::13) To PAXPR04MB8190.eurprd04.prod.outlook.com
 (2603:10a6:102:1bf::23)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8190:EE_|PAWPR04MB9717:EE_
X-MS-Office365-Filtering-Correlation-Id: fc202743-d08b-490a-863b-08de581b5f9e
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|7416014|1800799024|376014|366016|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9wvLcmtX3mTYUmf5QUOBbiQUc3CEcdJmfjLwr69gNIQFCw8jAbfOdDLxTjT1?=
 =?us-ascii?Q?dDnyXzLw1FcG3dZH7jivhyAbL1lFTP6Tsspx2lpPPq2DB6cFRkOAnnlDLqG4?=
 =?us-ascii?Q?8jQYLgkBzfK6YmcZqoS6tfMfkNKoNs8T0EjO+OdERQAoGiqwpdVUuLxi+0nW?=
 =?us-ascii?Q?wMpapZecZZjjt1tmFX0XDZq95xb1RBmf+ostVACtI14i1K6um7FlmWKfl5oH?=
 =?us-ascii?Q?HdGrGO4sgeAkVuoqvVDxcBdVdf593HFuU34K771CyEezR6LSeCUg+Sw7c5ls?=
 =?us-ascii?Q?Y/t4WjbPYwWff8eIZMnBkTNXGSGje5s0v1npw+vi088OCdj8uRO16AE2sSAH?=
 =?us-ascii?Q?kQSfaI9Ysg8oREHy9MuA2VkGmCBTpTQqLPzNSCE8WvxwJTVT1Yr/sB6yRXSK?=
 =?us-ascii?Q?zNTnmv3jRp8Qqw0+f9uHtK8CTvz+b5UX4a6hyET+KXuL0oErHt+GLMpF6xg6?=
 =?us-ascii?Q?ZRVM78GjSeZBt3/DToRGkr9ycF5IHtFGkLOr6rDZSrpjInOp1Ozo1KaNTclW?=
 =?us-ascii?Q?ihMt07M9vYLHdi/3y8WpQ27JrUQvbZKI9RCB5vkmvCIUr6LalnH0H/CGIP/a?=
 =?us-ascii?Q?Hj2u4iavOojgI0UnHMh43K9dfhLzqLE+VSoFzyEFU6+qDJDkRd1/cxU1FMXw?=
 =?us-ascii?Q?+RfLkbAR6usIq3QmWmfGnw0uFiCYkAuZnNstoIBcqsMnxSSc5NoRgfN5CEAE?=
 =?us-ascii?Q?HNtiEZceqc9fHJDfolT9oIPP0/9l3qz9hcV+Hni1+zgzbse6ppuVHHHHiyU9?=
 =?us-ascii?Q?UjcQXoFLYQEW9FYmDqY3ozYGmlNeZk88OAaODUsSBAFjTHuBgYd/v56rSF35?=
 =?us-ascii?Q?aNj/CEZz0FdS0KnwqaqJDMPAnUdjIRUj/lykqHviH4p7ifw3z/yONVyHAFih?=
 =?us-ascii?Q?nzPM4UyJu0RLDZ3XjbMkSGU0oQ0pb62ZdGH+IhbYtmZ6bKZW+nqB+lqscA1q?=
 =?us-ascii?Q?mxgWhJa0f3TTkmJf9hE1iHCU4/kseKuhXSGG1B39PJ1eg3dAHvYbrGoydys3?=
 =?us-ascii?Q?cTVOeIDcwUOSgxsVcXb6FGm0mb4vKopfsR4ciA245OGfx1GkeAEg0PHnW1lo?=
 =?us-ascii?Q?gy/tRaivBSCmAiHVAAIv9k3lmPVNyyOy/84zU4QEofIs9zMoWDoIuE8vaJcn?=
 =?us-ascii?Q?b8Fdmg0GWvGlKzLT5rI1yH47sBe9OcPTrF5NF/amr2RzNM0mYL0crm+G7v8s?=
 =?us-ascii?Q?vY3iW4KcuTdFeE6ZLJKb0ScqCYvq7S0YEmS2U0f++0xAYUkm8sQY7seILgdk?=
 =?us-ascii?Q?i1IaJC/CPsgCVJMtpevcay8+w3Q4+nQQsWWee9QS8BHekpwm1X41dRQZTc88?=
 =?us-ascii?Q?PFNpyTcanCyJnO6ENKYsOO8D/YYh43ppnvxJOhX58CaC91AItqE3Gec5fp7/?=
 =?us-ascii?Q?1+uJEpEgQKkkvH7xSVrtkg+EiZBSbqagD2MtIEy7+Vb2F0Id2qNp8UKxmPzN?=
 =?us-ascii?Q?L7Dv6fxuyGF9SMnM2lqziC+35OSi512qYYZG3YLdS6BTY1LCk4zFJeC4+RqS?=
 =?us-ascii?Q?GDJ+gYOr/+x4Mn/i2WB9O+fxPPi04q3Xoa566DGsN+2uMF2GevD5HP+VBGfx?=
 =?us-ascii?Q?47nwvRawKRrQOAItO2dnCCiHBf4sGRZLko/OqOoZkRztTo3Qzz18nHBbfp1q?=
 =?us-ascii?Q?Jw4C0xmMATTSjqru+F8SYKQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8190.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(1800799024)(376014)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oDil5JXzlogXVPq1+moLqRmFJPE/sw5TQYADFVZ6oBvdUBKdpQlGMpICIti6?=
 =?us-ascii?Q?5yXxsK3wJLqCMfZZF67TMOvZovbETxqkdIX1qdZEmT2/CPDpa650lBm+SWHy?=
 =?us-ascii?Q?6nXuEiuxklAn0ctWPM17T8uk87YkbkDsa/Jz271yaMfhaXP+RmrvSYTmlvsf?=
 =?us-ascii?Q?lEqNuyEyvkV5jAY6mra0nIutl4p7HE8oqXequdLjzQ+5AosOGXaVl0uAIEnB?=
 =?us-ascii?Q?t+MoI+0PS8wDdbBCy+ERuFEpKVh2iIirxqcU5QPbn0SygPPvON74pI+Ae4b1?=
 =?us-ascii?Q?duSqA+/5gKG49e33bup8BjNPfiwowNDpotuUE6BqPnOHE6Rx1ZWqmutfKqGT?=
 =?us-ascii?Q?OHDDiTa920wzCFsr2RqOLhPl3d60g7YMlrkfwCOo5EPS1FXxp4An5VmHSBol?=
 =?us-ascii?Q?0ZmC8s4Xv5ix6q4FVfk8RTuhJPn8MJ8yxa+a3ZXCdTCntI+4pbqLdDL8JdQw?=
 =?us-ascii?Q?NcLBcbaRH6WPgN2nUeiTGMgvl+Igy6L/W7g4mnqIK6XVzttlX/tUdJv74Vxk?=
 =?us-ascii?Q?dCUZ1mn98HBvY5VdZMHXuqGdIcsJCXGxXJnq8bYywn63bdEzYwLaG/Uv/FM+?=
 =?us-ascii?Q?15Ih0xKeQGP8Q2zU8GhuDzX/JjEQ5rsHOaJiTrkBg8Y3uuSt9HYjULuaUEN+?=
 =?us-ascii?Q?Bo1ew7RxOb67lgxL2wTUGWXmfPkUPK6jc9QQnJCEKqTT0u4I+RBpULjUraVJ?=
 =?us-ascii?Q?MgkCEmdM+MaAUTVL01IXa+cfMGg11cWEap/4mfUtxs0Y8M99aPIQ+rX76QIH?=
 =?us-ascii?Q?0aJ/CS+c/mAnAsW7o8JGMxeLi9WRpATyFV55820gZ46AWn5frvO/v0tZLll4?=
 =?us-ascii?Q?cXlcAwZqHhDFe3YdLaSYJzOdh2k5Ov3IxEDsLE6KC0pNcBjUs/tsbgFNJQr3?=
 =?us-ascii?Q?eBVBfAEKykaAAwaC+ceF2p5PQLZcMnGx9yx3zpYWsHzHjJUT84peiQ7sB8d0?=
 =?us-ascii?Q?xpuFPktLu97cbUmKGauxmjh5EEe7CIPa9/MSMcmOd9YX3nA/tu1NqhMC+Zi6?=
 =?us-ascii?Q?MB/YNXk1xdqxZWIp37Mguvc+OvlMzAfQq370bqRYSXI+KR3l4cWdBwS74tgK?=
 =?us-ascii?Q?qbRiXtbSaX9fOn6bVvYTNWRm0rJywRwkkp76NLw7sWNl/iRa78+7Q3/TdEzR?=
 =?us-ascii?Q?K3tha1GRNzHXylOa3mV83izS2X5D1thg6CmjYjoXN/aqooo52n1mudM3EyNq?=
 =?us-ascii?Q?LpHE74R4IQ/OwAb9SeRSJ44M7HpmP4E2r2CxP/CMKm9FauUIau3OOcCG6jqb?=
 =?us-ascii?Q?kB5kWYVAxeN0mAe26jIbmuyUuZYngNEV+mE3WsxP2Q+fVXvLtaSEZi4VArMn?=
 =?us-ascii?Q?KTO7S8mM1thAdDUDPmvoEOvKYVWSfv+O6D2t2PRYeRzQ3CUKq8vTZpnlGerY?=
 =?us-ascii?Q?PsNYdDcR1RoFNryDcxdQ+lSTK30r49mHB7OXsUIpgh1Ih9EKWopStwkiSER2?=
 =?us-ascii?Q?h5auyYqGz35UfeDPHUgVPCsOMory5XRuzc+uo2nLeAN2PEW7xHQg0obcjlFb?=
 =?us-ascii?Q?VzFmu85c1I4vW3+Os6mWOOhG6FVf7QfGyYotjNMZQ4las31QuW4QqJGpBCmh?=
 =?us-ascii?Q?LQ/EoH8jFNVjfSoO/XZj3fEq4OJw0ULRmstr1pdND36ssuLUPCtSYLH3n9EV?=
 =?us-ascii?Q?turWshC78SyxeLU9c586ahrBKvV47YGBkXrAdUcCbWDD+OdAWuWnutzxSbdp?=
 =?us-ascii?Q?seUH4KT1qn3gOvVLrYPNXKSoNBWnQzYOGlv96D293SGbAg/AB3sGY00IM1UT?=
 =?us-ascii?Q?rMGHgahV+6z8sWqAnu1TncuxlEemY5JMpElQgHfEHE8lXgs7Xfsw?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc202743-d08b-490a-863b-08de581b5f9e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8190.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 11:59:32.8526
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dV4qDlSxTNrhGTDz5v1KiAO7DUUqb7RpcKIkWXJ0t9YAeDJwixF0bnyj33eO5X+opPHDSPYmZ/aCnYFrBinYeyvqGnq4l0qJmUjomg2sBGz8d1KthjDmr6afXozH5c8k
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9717
X-Spamd-Result: default: False [3.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : No valid SPF, DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	TAGGED_FROM(0.00)[bounces-30784-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,bgdev.pl,kernel.org,gmail.com,suse.com,nxp.com,pengutronix.de,linuxfoundation.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[khristineandreea.barbulescu@oss.nxp.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	DBL_PROHIBIT(0.00)[2.99.68.96:email];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,2.159.138.16:email,oss.nxp.com:mid,4009c000:email,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,4009c240:email,NXP1.onmicrosoft.com:dkim]
X-Rspamd-Queue-Id: 21E0853008
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>

This commit will switch to the new mfd node for representing the SIUL2
hardware. The old pinctrl binding for SIUL2 will be deprecated in a
later commit since it doesn't correctly represent the hardware.

SIUL2 is now represented as an mfd device. Move the pinctrl related
properties inside the new "nxp-siul2" node. The latter one is now used
to represent the mfd device.

This change came as a result of upstream review in the following series:
https://lore.kernel.org/linux-gpio/a924bbb6-96ec-40be-9d82-a76b2ab73afd@oss.nxp.com/
https://lore.kernel.org/all/20240926143122.1385658-3-andrei.stefanescu@oss.nxp.com/

The SIUL2 module has multiple capabilities. It has support for reading
SoC information, pinctrl and GPIO. All of this functionality is part of
the same register space. The initial pinctrl driver treated the pinctrl
functionality as separate from the GPIO one. However, they do rely on
common registers and a long, detailed and specific register range list
would be required for pinctrl&GPIO (carving out the necessary memory
for each function). Moreover, in some cases this wouldn't be enough. For
example reading a GPIO's direction would require a read of the MSCR
register corresponding to that pin. This would not be possible in the
GPIO driver because all of the MSCR registers are referenced by the
pinctrl driver.

Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
---
 arch/arm64/boot/dts/freescale/s32g2.dtsi | 35 ++++++++++++++----------
 arch/arm64/boot/dts/freescale/s32g3.dtsi | 35 ++++++++++++++----------
 2 files changed, 42 insertions(+), 28 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
index 51d00dac12de..fe36851ded15 100644
--- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
@@ -122,20 +122,27 @@ rtc0: rtc@40060000 {
 			clock-names = "ipg", "source0";
 		};
 
-		pinctrl: pinctrl@4009c240 {
-			compatible = "nxp,s32g2-siul2-pinctrl";
-				/* MSCR0-MSCR101 registers on siul2_0 */
-			reg = <0x4009c240 0x198>,
-				/* MSCR112-MSCR122 registers on siul2_1 */
-			      <0x44010400 0x2c>,
-				/* MSCR144-MSCR190 registers on siul2_1 */
-			      <0x44010480 0xbc>,
-				/* IMCR0-IMCR83 registers on siul2_0 */
-			      <0x4009ca40 0x150>,
-				/* IMCR119-IMCR397 registers on siul2_1 */
-			      <0x44010c1c 0x45c>,
-				/* IMCR430-IMCR495 registers on siul2_1 */
-			      <0x440110f8 0x108>;
+		pinctrl: pinctrl@4009c000 {
+			compatible = "nxp,s32g2-siul2";
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl 0 0 102>, <&pinctrl 112 112 79>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			interrupts = <GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+
+			siul2_0: siul2_0@4009c000 {
+				compatible = "syscon";
+				reg = <0x4009c000 0x179c>;
+			};
+
+			siul2_1: siul2_1@44010000 {
+				compatible = "syscon";
+				reg = <0x44010000 0x17b0>;
+			};
 
 			jtag_pins: jtag-pins {
 				jtag-grp0 {
diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
index eff7673e7f34..5d5d21b74019 100644
--- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
@@ -180,20 +180,27 @@ rtc0: rtc@40060000 {
 			clock-names = "ipg", "source0";
 		};
 
-		pinctrl: pinctrl@4009c240 {
-			compatible = "nxp,s32g2-siul2-pinctrl";
-				/* MSCR0-MSCR101 registers on siul2_0 */
-			reg = <0x4009c240 0x198>,
-				/* MSCR112-MSCR122 registers on siul2_1 */
-			      <0x44010400 0x2c>,
-				/* MSCR144-MSCR190 registers on siul2_1 */
-			      <0x44010480 0xbc>,
-				/* IMCR0-IMCR83 registers on siul2_0 */
-			      <0x4009ca40 0x150>,
-				/* IMCR119-IMCR397 registers on siul2_1 */
-			      <0x44010c1c 0x45c>,
-				/* IMCR430-IMCR495 registers on siul2_1 */
-			      <0x440110f8 0x108>;
+		pinctrl: pinctrl@4009c000 {
+			compatible = "nxp,s32g3-siul2", "nxp,s32g2-siul2";
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl 0 0 102>, <&pinctrl 112 112 79>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			interrupts = <GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+
+			siul2_0: siul2_0@4009c000 {
+				compatible = "syscon";
+				reg = <0x4009c000 0x179c>;
+			};
+
+			siul2_1: siul2_1@44010000 {
+				compatible = "syscon";
+				reg = <0x44010000 0x17b0>;
+			};
 
 			jtag_pins: jtag-pins {
 				jtag-grp0 {
-- 
2.50.1


