Return-Path: <linux-gpio+bounces-36073-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2A7NFEed+GmdxAIAu9opvQ
	(envelope-from <linux-gpio+bounces-36073-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 15:21:11 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D7DEA4BDCA9
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 15:21:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 213713044A36
	for <lists+linux-gpio@lfdr.de>; Mon,  4 May 2026 13:13:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19C143DBD71;
	Mon,  4 May 2026 13:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="GhphSivg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011067.outbound.protection.outlook.com [40.107.130.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43AA43DD537;
	Mon,  4 May 2026 13:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777900328; cv=fail; b=qHeryOHYIZOKjNq1FhL9+4cuhPytJaYdgHZSZ221tyUtJ7nhSoO5kT3cfanSueZVXxBTBbz2x/GcYawLq4tJG74OwUS1VNb3BfZfMaheyHxAw4eZ67L6D8nm30hSThcQG0Niy3VMGOGaAV8fJKIZCUNK1MoeBBMCCc/rFiFweuU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777900328; c=relaxed/simple;
	bh=cFbFlplHesLR5wBOyODwsoIl1AkJzR4ar9j+NuYc4RA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=s7LptKh4la3RmqgBS4Af5WvEllm2rMFf60bwfJfXh4k66bGYUPQI5DAO7ZM2wmAe47FyLlIShpYiBNKuhpHFNbxi02BGCRtQPryOIGIj8hRUuywnuzQn3lSSoCY/k6KxHDYq4afJEbU+gQPHu9xL+s0NAbDkri84dIwm0ZgudkI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=GhphSivg; arc=fail smtp.client-ip=40.107.130.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d2nFrL6dXlUBe8AeiHXN7YjkHoE+BkToMmfHNXaGr4ogA0j8IKMSQspVJMPTZQ94UOGGSO5eiGmha/DoUSXrxmjoxPksi5KXFwPiMfRWUPag3xQtBuenSPda5ZEJEGsdCinYB6dWV0uKiwAIZuQgpGaZOH/VFzn4O9Gjv4Kc+m9R/B9U2uyWAXgYKMN/KY62gn1jSge7J74Hb05FX6RHMFC+Ikwn8Z+pnFF3ESwZAvpQQ9HqxfAgXCxx2DN/UrWBxxhYYu4mHfFax/TPlamUxvblnFewt0v4ZkKY8Qcdbs9zl0oNUfuMqg+WT4bEBlL97atoS2rxezcEJH7TNkqNpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/5UPQXBjaVJqxkbADk3hIiu2fwFER/itTPSLkusFe+U=;
 b=O39Sgwj1Y1P6JRkYhWF9bpEy7gmYiXkZUb2KOr2Z2CXZDecCV4YSeZrnG9ZJFKbQyxS5oUCyDdFmJ8bXYy5NrwyXtloSuIIY8MDN4293sryVK8tHFypHYh2rVxbD4kZ/VX7+ZsynACp6vMTL9BOFF0amSNeTXrbCJxK2UxzrOCM527D4PYxJeG21DWE0FTDQoNQiPBmcUNSdhePqJDBbot4Z8NUsvIFZWP0MM6JxywPRaft+VPi7H5dRzKW6uGoDxTBzr5zzBJF5I6eGldjqoBJSZu/NuERxXTNu/slbZjLkZozJjRPNpDQr7XYaaEboGE/MdV4hyY51EsGCaKbL/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/5UPQXBjaVJqxkbADk3hIiu2fwFER/itTPSLkusFe+U=;
 b=GhphSivgDGHX3ENYrOgN9bGR42RV0xmY1lyp5IZr/hvgRqZ6WO6FYA7DPI47WM5w24WqozjgQS+1Ivm9+TK+87eSlQkGUGrianATDgL/J2MnV6QZaaC7iH729DMXOFH2XyZbDZ2UzSb3jE9NYBuWZs76B/GNpxC68LXHowdgoIXF6m2g1MaCPGh3UQrPhYQvRwC127t8yxUE7bCUqprNFnwiEwnIWNzn1/CAFKc3e3Vy6/hOiVBed6Zl9NACPCBOlG14wC+gTh4lam41jBdtzT7X7Mic/hIKQsBRM+6hxZ1eTOc406G0ZEkQIJ/aRja3P1LI7rgwJqjpOh1LI6pFiQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::20)
 by PA2PR04MB10160.eurprd04.prod.outlook.com (2603:10a6:102:407::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 13:11:59 +0000
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85]) by AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85%6]) with mapi id 15.20.9870.023; Mon, 4 May 2026
 13:11:59 +0000
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
Subject: [PATCH v9 7/7] arm64: dts: s32g: describe GPIO and EIRQ resources in SIUL2 pinctrl node
Date: Mon,  4 May 2026 15:11:48 +0200
Message-Id: <20260504131148.3622697-8-khristineandreea.barbulescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260504131148.3622697-1-khristineandreea.barbulescu@oss.nxp.com>
References: <20260504131148.3622697-1-khristineandreea.barbulescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P190CA0014.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5de::18) To AM9PR04MB8179.eurprd04.prod.outlook.com
 (2603:10a6:20b:3b5::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8179:EE_|PA2PR04MB10160:EE_
X-MS-Office365-Filtering-Correlation-Id: 665e2f37-d5ed-4364-5ad3-08dea9deb981
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|19092799006|1800799024|921020|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
 x4cFZjrnZnKdKnyb6anVcapoG14u2SfmUJtZMWPxbUzBjfLK4Xbt0cgPlsqRaN837hwKGrwsyoXxzWJQA4q6HyiF/rQ17Dk99sXu+JG5R0Svb/XaxfgQmGWNS3QqIQVUmpw1XYfO4/oiTFNaDSknGByuHFfOh08Rt4CG6+dgIEaCL3n7Hs9f7laDSUk/8j+C3OG50pawuh8EDd/JpdqwzM7R3iADKHoolbsHYQvM3BcCNLZZkDg4WfiOlWZy0M+D86VlG1sm7ICKLFANe4Zjd46OIsO7NCFLIlugMzx80QS5ga56lT8BCTww/0iApQmWYkOy8fwYHGgsqZovBwYiLPG2PZnQxnOKvmtSTD/m7M5lk1LxrUR9X/gNJKJsK8oQMuf9YXifhj/lGlIjSrz6cY37OJ6yQmots+fBxtzKfObx0T3oPRsRwLKv8luBn/AmQK1kzy2DsLvJ5mpYbtxTaUoItFJVhWb2QW5oPvM5K1NcEoatjtya/ETc2Kj8x3zq4FFdWFekh9q3hF0o6Mk3O0A00YnFwIkfhv9khCpDdwrrgYSd8tUn3ty90zlAUScVdxR0AkzrWgBkzfuAJpYz2yUg5FWHZV34CcUyNl5qKu5KBBt6EhqXXsenvOk9g9AMqylhLuCUyk624Zi7lt6yPn5ZlZgRzNJys15c3MtpMJmLSEk4fpZXCk9qIp6V0Vq7052vd+lvGptW8eDOQu+zjyda8t2Oaihps3hdnMKb0v0=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8179.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(19092799006)(1800799024)(921020)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?TEdWLzJZcmxDZjI3cnlTU2M3S2MzbU1Qa3VHWlg3ODdSZGp3dThmV25ZUHh1?=
 =?utf-8?B?VWlzQVVzd20wa09WZTl0cTlPZTVxa1R2Y1o0SXNVYjVvc2RXUVNvcDNJTFlt?=
 =?utf-8?B?L0EySC94bGQ5UHFhKzNUR3BZMTBTWXEzeHRNMS9DRTAzcjBxa01PTlljNHdN?=
 =?utf-8?B?N2V2alRzUDF3QmZiYk5aTFR1T082MktKU1ZpL3FaWmduNGExeno4UHp3Wm1E?=
 =?utf-8?B?UWZEZEMrSTBVUllMMDNUd0VYay8waHNjaDRzenk5OEJyQnVSYzljSkFFUEhp?=
 =?utf-8?B?d0RpRXRFb1ZxVlI1OEZlOUJqVzdkK0lIZ0JzNjdTUFZNeXBlMzFLWUtKc0l3?=
 =?utf-8?B?R0FEU283a3puUy9PbnFlR0hhZTMxWHgya3NDOEV1clluWGFqSUV1VU8vZjI3?=
 =?utf-8?B?SW50VGFTOTRBQzJqa1BlWnFkSEI2T2lnandxSkR4OW00RHpOeHh4emJzVXI5?=
 =?utf-8?B?U2plRkI1U3dSZzFzTkFWVmp4MXRFNTJuRkt2V2owcHFRQ2ZvTFNpSS9qUm8r?=
 =?utf-8?B?VGcxOHN6U25xMXpMK1o5VW15eGxXWG5LUWgwZ0FCcnlCVjFNY0YrY0dOV2Vs?=
 =?utf-8?B?dmo4VTNvekFIckt0SUd5Qzhqa3RKMDlYcmtOUXlKa0FCMnZkYml2V1pWSzZP?=
 =?utf-8?B?cTNkdnY1ZVFjcVpyNnNUbVZNQ2E0UGtZUTI3K3p6NjBRZ0lPNkRJSVBTVnNv?=
 =?utf-8?B?N0s0MUxxWDVFd2l6RHp4TzVWbm5QQWw4cHVCWGdDWjJwZ01qZDljci9IajVo?=
 =?utf-8?B?TWtnNkxJeHQraGo3aDFla2lISnA2YVJETXRpcTBBcDE0Z2haV0cwTCtlc045?=
 =?utf-8?B?dEhTSkdySlczRFY1Vld3SDJSVFdDaGFRRUFFK2JGUDg2WXgwNStHVk9vT0Zv?=
 =?utf-8?B?YlNONXhlZkkwN0lwOFJMdjkwTk54SnVqWGpkb1RYcnkzMWJnZjdrcDlPQnJh?=
 =?utf-8?B?L3NqMzEwTnhXS0k5ZkZ1TzlhM3pKejI1d0JlWmUrYzdoRWdpRnlOOW1zTXdm?=
 =?utf-8?B?bjV2WFVrRWFDK2o2a3Q1eEwxL015dW5yWGhOdTlpQzR0S09vN1FINHR2UmJp?=
 =?utf-8?B?cFJCRUEvbEYwWjBGSGZVZWdrYitjbER4UHlIQ1kwaGROSDBjdW04Tnlab1ZW?=
 =?utf-8?B?VVE5OGM5alFDOWlMWnVjOERtYWZZVjc2dHBxM2dZQkVtWDlUTDg3aTJSaU56?=
 =?utf-8?B?NDVjSWVGOVFVYWMrYmw0cFgvREZJUDBqTGZJdjJFQm1GUS9iMDROdmdoVmdW?=
 =?utf-8?B?Y2hGWlpCdmowNjJISXBnSEdFRDhic3VpZTZXR0U1eDNSQ1JtZGFtTWhpVUJW?=
 =?utf-8?B?L2lFWU1jaFAvTm5tVUpXeTFBcFhOUjhzYkc4TkU3Q0dka0lHK1Bkbkpuc0VL?=
 =?utf-8?B?MnRhbWZXSDUwYS8xQzlKdFpla1FicXFLSTRRM053LzVndml5bVJ4d3hlVFRI?=
 =?utf-8?B?ejM1MnlHVVNJemNJcGl4ODF0bHRCVEd5WmJsZkhFaDc5QzRtS0ZHUURpRmo4?=
 =?utf-8?B?dXp6cVp0UzRtYkVmMklHdmZuTU8vSDhUZk9zQ3pmWXBTdlVyOGJ5REFRbWdG?=
 =?utf-8?B?eXJiOEtQdWZXeVJhejBiTjNEbHBwMXcxMS9uYWh4UExGK0FhTndaZmI3Uzcv?=
 =?utf-8?B?VVN0UmdIQ1NhZmx3K3pLamZEQ2xhNXh4aVJ5ODZBS0xGS3lzWEczQlFBT3pB?=
 =?utf-8?B?d2V1b29NZjNKeGpRSk55UWRqWm44R05URmNLS3ptTkF3c2dYUzlUUXV0K2Y0?=
 =?utf-8?B?ZlVtcEYreHREMUk1SVdMUXNad3MyOG1EcGRXODd6cURoM3NiRVV4SlZiRnhR?=
 =?utf-8?B?SmZHTHVZaDZSR3dMdFNScHdaR1JhbkdYTDhoTkk0SzZRc1V0TEVONFl5Ni9S?=
 =?utf-8?B?L0htcHEzOXVDVVR3cVhhTDVSdjdTdk9DSVhMKzFjcDIrNktpUkFlOEJKc25D?=
 =?utf-8?B?bm1ReVBlL0VhVG5Nb0VlRmxwV3l0Z0JCbW4rUXZXUW5PMGNiOGdFOHk5ZGhX?=
 =?utf-8?B?U0VxKzRMczJ6QmxERldSRUkra21hbisxZGdBRU03dWVUN1ZZNkI2c3kxNGtl?=
 =?utf-8?B?L2JyM0tpUHZWeHpmNmUwbld2c1RVZ3VZODNVYi9SRmdMMkhva1pzbU5uNlBu?=
 =?utf-8?B?ZlE2VjU5NWhoSlMyKyszczc0MG5USmpaUVlsR1ljNloxUW1oUXQ1V2tvaVZS?=
 =?utf-8?B?YzQ1SnBlZjc3dHBleFIyM2U4MG0rRW5UN1FkYldqOUNkWk9QbVhZMG11TVZy?=
 =?utf-8?B?UG85WlRoaXFqdy8wWEkzZ0VSVlRPVjBxK3JCZ2IvUzQ2S3VVaEYrRDZJQmM1?=
 =?utf-8?B?SXBkNUtlSVNOSDlXR1BpdGVnTlBSMGRZUzd4bGRmdENDZU5SV1BMaFJyL05T?=
 =?utf-8?Q?yWeHh2G9+zcgh8UggXYmtJJWZh9c9m2S9XYdW?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 665e2f37-d5ed-4364-5ad3-08dea9deb981
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8179.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 13:11:59.4734
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: krcim9jM1oUmcovHX/ZijklqhFp17S9IpDSrsEwlbGg7DRUhB7I2mpFMqWod9bYxrwtgTVMKaaIebZt1Qs9sb2QdfM5DFodG5zbZ8OTKCO+fbrLgb8J5fAEn+KUuv2tS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10160
X-Rspamd-Queue-Id: D7DEA4BDCA9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36073-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[30];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,bgdev.pl,kernel.org,gmail.com,suse.com,nxp.com,pengutronix.de,linuxfoundation.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[khristineandreea.barbulescu@oss.nxp.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[2.99.68.96:email];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.nxp.com:mid,NXP1.onmicrosoft.com:dkim,nxp.com:email,4009c240:email]

Update the SIUL2 pinctrl node to describe the additional register
ranges and DT properties used by the updated SIUL2 driver.

Besides the MSCR and IMCR ranges used for pinmux and pin
configuration, the SIUL2 block also provides PGPDO and
PGPDI registers for GPIO output and input operations,
as well as an EIRQ register window for external interrupt configuration.

Add the new compatible string for SIUL2 pinctrl nodes
that describe GPIO and EIRQ resources and keep the existing
compatible to maintain compatibility with legacy bindings.

Reflect these resources in the SIUL2 pinctrl node by adding:
  - "nxp,s32g2-siul2-pinctrl-gpio" compatible
  - the PGPDO and PGPDI register ranges
  - the EIRQ register range
  - gpio-controller, #gpio-cells and gpio-ranges
  - interrupt-controller, #interrupt-cells and interrupts

Keep the hardware description aligned with the updated SIUL2
driver, where pinctrl, GPIO data access and the EIRQ register
block are described under the same device node.

Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
---
 arch/arm64/boot/dts/freescale/s32g2.dtsi | 26 +++++++++++++++++++++---
 arch/arm64/boot/dts/freescale/s32g3.dtsi | 26 +++++++++++++++++++++---
 2 files changed, 46 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
index 51d00dac12de..b3bef4ee559d 100644
--- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
@@ -3,7 +3,7 @@
  * NXP S32G2 SoC family
  *
  * Copyright (c) 2021 SUSE LLC
- * Copyright 2017-2021, 2024-2025 NXP
+ * Copyright 2017-2021, 2024-2026 NXP
  */
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
@@ -123,7 +123,8 @@ rtc0: rtc@40060000 {
 		};
 
 		pinctrl: pinctrl@4009c240 {
-			compatible = "nxp,s32g2-siul2-pinctrl";
+			compatible = "nxp,s32g2-siul2-pinctrl-gpio",
+					 "nxp,s32g2-siul2-pinctrl";
 				/* MSCR0-MSCR101 registers on siul2_0 */
 			reg = <0x4009c240 0x198>,
 				/* MSCR112-MSCR122 registers on siul2_1 */
@@ -135,7 +136,26 @@ pinctrl: pinctrl@4009c240 {
 				/* IMCR119-IMCR397 registers on siul2_1 */
 			      <0x44010c1c 0x45c>,
 				/* IMCR430-IMCR495 registers on siul2_1 */
-			      <0x440110f8 0x108>;
+			      <0x440110f8 0x108>,
+				/* PGPDO registers on siul2_0 */
+			      <0x4009d700 0x10>,
+				/* PGPDI registers on siul2_0 */
+			      <0x4009d740 0x10>,
+				/* PGPDO registers on siul2_1 */
+			      <0x44011700 0x18>,
+				/* PGPDI registers on siul2_1 */
+			      <0x44011740 0x18>,
+				/* EIRQ window: DISR0..IFEER0 */
+			      <0x44010010 0x34>;
+
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl 0 0 102>,
+					<&pinctrl 102 112 79>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			interrupts = <GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>;
 
 			jtag_pins: jtag-pins {
 				jtag-grp0 {
diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
index e314f3c7d61d..3b38500d7d05 100644
--- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
 /*
- * Copyright 2021-2025 NXP
+ * Copyright 2021-2026 NXP
  *
  * Authors: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
  *          Ciprian Costea <ciprianmarian.costea@nxp.com>
@@ -181,7 +181,8 @@ rtc0: rtc@40060000 {
 		};
 
 		pinctrl: pinctrl@4009c240 {
-			compatible = "nxp,s32g2-siul2-pinctrl";
+			compatible = "nxp,s32g2-siul2-pinctrl-gpio",
+					 "nxp,s32g2-siul2-pinctrl";
 				/* MSCR0-MSCR101 registers on siul2_0 */
 			reg = <0x4009c240 0x198>,
 				/* MSCR112-MSCR122 registers on siul2_1 */
@@ -193,7 +194,26 @@ pinctrl: pinctrl@4009c240 {
 				/* IMCR119-IMCR397 registers on siul2_1 */
 			      <0x44010c1c 0x45c>,
 				/* IMCR430-IMCR495 registers on siul2_1 */
-			      <0x440110f8 0x108>;
+			      <0x440110f8 0x108>,
+				/* PGPDO registers on siul2_0 */
+			      <0x4009d700 0x10>,
+				/* PGPDI registers on siul2_0 */
+			      <0x4009d740 0x10>,
+				/* PGPDO registers on siul2_1 */
+			      <0x44011700 0x18>,
+				/* PGPDI registers on siul2_1 */
+			      <0x44011740 0x18>,
+				/* EIRQ window: DISR0..IFEER0 */
+			      <0x44010010 0x34>;
+
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl 0 0 102>,
+					<&pinctrl 102 112 79>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			interrupts = <GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>;
 
 			jtag_pins: jtag-pins {
 				jtag-grp0 {
-- 
2.34.1


