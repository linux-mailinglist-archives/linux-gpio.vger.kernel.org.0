Return-Path: <linux-gpio+bounces-37800-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YBKBL9+PHmodlAkAu9opvQ
	(envelope-from <linux-gpio+bounces-37800-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 10:10:07 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 245FB62A375
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 10:10:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 404B630D5F0F
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jun 2026 08:02:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A36D3BE162;
	Tue,  2 Jun 2026 08:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="b26JaYhx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012068.outbound.protection.outlook.com [52.101.66.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02DBE3BD64E;
	Tue,  2 Jun 2026 08:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780387325; cv=fail; b=rA4ZdvEGYcYjihMNt+8fVbUTzBxnhbbXyX9PXrGREBM33LdsdUGrmOOrc5Lqceap9IpBJwYn2gBeY773vxRj7Prbu461FUToS77TYa3EVfAgO/Orjce0lGyghtRCdjKQYMElHKGfeY2ZARkXPRbaCyI8Eg+f8FYK1X370KlRze0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780387325; c=relaxed/simple;
	bh=D24LXAR2zNcQWLLbE3dBd5w439kas4f3lpwZKx/yPhQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XroaY+wYcoJmtWShcZfOS/FujbKDfLn+FQSpaEpMTrS2kPcD5npJnr0jhezKlsQpbTMuhYpzTPsPQK3uX2f39ZlYpeoDgRxoroOD2ygopWADVjfdU0SkuxN83GgYHIhmKCkOXLyiAP/1V385+ka1Dk2bsGQuP67cih1LDadhxi4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=b26JaYhx; arc=fail smtp.client-ip=52.101.66.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lNze1BxYft3+fryEdYCNd/ydozNYAG+qZq7t5PaByZWLV1M8If3nl6/o1EHExdMc2Ud8IwvbbkvHnqBdNyrX28L6kno0MQ7cfdWgedKLaOTyxD0Wim47cTUicpWajRP4V1/aw+gebI26HdrZCbuAfEMhn/Y5zJZEBTdDSrWAWVIABj00R6JCmXCuXjlgb7R0FGr7DmpEOoi9Z3d9vm9g+mZrxavOgTKB0mqPQbfIYZQK1NLCRY3oFhGdkbO21SERPnDQjawFPyc3H1/TxlOMZReJh3fRFbfIiIXVhJ+zuvIR9qYSQk4gg9x/VLdzp6bMeI+PInfojCBWcGPgYkKp1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9hdjxNWIUcH9VQeRIo/RvSYny2bXzyh/JNkrRYp+JGE=;
 b=WX3d3za52+8G2plmE6Nx99z66Yh+FDotpqLUSqwKzalAEYp1satCfuyYsT2ghOqRFQtKi5eUXgutWZqzVgMpXIP0exBy840y1JxkRvTCTWtds7iKomV75YTrkBaew/tmXfRfDwZ7HEDk17vLMW2oAHqbPEr3Rb1bpFzmJjKQxbEXOWn2/fez733ZgfYIj88JxY6pmKKXfSapfsDgVtDQxNzBFlGoWQFEOE6lugXO9KpaKyr0Bn3+mMXZ7VhmwBvgsFYsaszC3CYxN29tw7ki0v83Ak6+opGA9V1buzOsdRLTRIH1m7Wg5aO3P+AkoiCJWFJmelB5qxXyb/LfzmwLIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9hdjxNWIUcH9VQeRIo/RvSYny2bXzyh/JNkrRYp+JGE=;
 b=b26JaYhxZzQChlek7xZCwKoVhSGtaa2vo7LVl8Q/1UG24azZkBak25Xy73Q76qZCei7iuyh/Cp73FNapN8q8P07s6EsbEFKOHC99izToH0+1+g0A/2/Cs6hYCAAM6Lv7N/r3keIqajNA8ayyuk8hUhE8dIWYo2NlQKWRkGi9WFgoU+O8FUuITJOccV/fRX7wAE83dHySVQ752JeDJkGfUWmvAnzbdGnNdbMOQ6IalSUCSbrb0eOrJkTI4HYniOrxRH6BlRrAnC00MaoNQ1EQiAdHIgTG9NTyQQFm78JoWIevU/qAwT3BrXvRdk9oEImuGb7eTuI/H2TRyGVwwgnLeA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::20)
 by VI1PR04MB6830.eurprd04.prod.outlook.com (2603:10a6:803:132::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 08:01:54 +0000
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85]) by AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85%6]) with mapi id 15.21.0092.006; Tue, 2 Jun 2026
 08:01:54 +0000
From: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
To: Linus Walleij <linusw@kernel.org>,
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
Subject: [PATCH v10 3/6] pinctrl: s32cc: change to "devm_pinctrl_register_and_init"
Date: Tue,  2 Jun 2026 10:01:29 +0200
Message-Id: <20260602080132.3256239-4-khristineandreea.barbulescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260602080132.3256239-1-khristineandreea.barbulescu@oss.nxp.com>
References: <20260602080132.3256239-1-khristineandreea.barbulescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0157.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ba::12) To AM9PR04MB8179.eurprd04.prod.outlook.com
 (2603:10a6:20b:3b5::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8179:EE_|VI1PR04MB6830:EE_
X-MS-Office365-Filtering-Correlation-Id: 6db7d70e-cee1-48c1-5930-08dec07d34c5
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|19092799006|1800799024|7416014|376014|921020|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
 hw2q3+in1Eb854osQpyXqTpgmkMqst9AH689B+3D1KDV9siLYtwcUkoPTLFy8NGilWNLLxsNO6Dj2Rhhf6RSbu2ul7axNzxOAB1K2nSPXQdAcA7iTD6YwzvE7SFIADPH+kF5RhLy79HeL/sINUWpxj0RZPeIHhFh+gTW7Kq5DQjQQM14XAIINfzFOpfImVGRTX6HrYMdtlzYzij5DTjwyh7NoZqZisxqdYBOy2cFjLVdPVKiARuRmP62WXX2IreP5uroMZpowfiE3+3D5urUtFpsnhJM9/256tstqY9anRNsW9sHZXM09zAU9N9tg3ahKv5YFDFjZWQK3KMPO7rKr4gEePyCr4i4TKTP1k1J5RhZVfTLVlXHj0UB7TfO3Pp2EPiTWWV1vU7OxuGnNJZ2Ln3FV1IoXPEnUlDBI6Aokoz2ei9W+o2XwX6Qr/eNFPFyoFMXkAzA/ga3JXPCD5T9PXxROwf52iQV55XEzlFJJGWdFcWjsitV0yFahDru/fCaKg188TPJov8SeVfwyPljRt+rz6j3w+EK/Adjb/1HuW+WgyKz+UJ6oFEG2Xlc/WKsb6FpmsSf5RWWsQ4P2DdaBHaYl2S1ISFzM6s0ya8TaSsWTyZKg0DHa01ARgz6s3SSZkyyGRYcmfxN2l9x8tsgWVZTRo0w8v0aLsic77r3QuGIrblajXcby7jVtidpYA8q9G3jUAalRGEamUVPgVsR4B71ORSlDNK8bTNTwrOXhi4=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8179.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(7416014)(376014)(921020)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?WXpRL1BrUjRZTW9McUpwVEYydzBjR3hkU3dTNXVzMTFhc0hDcXVFV2FuTjZH?=
 =?utf-8?B?SlBoaUdsRnN6cFVuQ2trSDR3a2RQeUUyUURFVXQ2Wkh5cWpJS2lGNEkwNEds?=
 =?utf-8?B?QjgycVBkZEkvZnJWT1FDSGR3aUlGZytSUzhYTUFWejErVlFoN2YvM0VsRjhi?=
 =?utf-8?B?T0FJamcrb3NnRzdLRndvTzJ1ZDc3cDB1b05MbWpEZEtCNFltbzdpZnJzanYx?=
 =?utf-8?B?OHRZTStJV2ZwQmNpY0VWQ1BYeXlMNXk5YkJzVkk1Z2lQeWRJZUYwaEszSUNt?=
 =?utf-8?B?OXNkcTNtcnhBU3RkNlM3UFBVM2l3WjhhTnE3RGptK0RDQWdkS01lY0JHNjg2?=
 =?utf-8?B?Mlg4bTMrbDNlVVN4VEFBOGRQcEtZWFhVVFJETHZqZFUvVGRYbHZjTjBqVFR5?=
 =?utf-8?B?MnpEK1dsSi9kR000TnRKT0JhRTZ3SzlwcTRVS0FISHBYWGZrVFJGNHdjQzJJ?=
 =?utf-8?B?MGx2U3h2dmp1RnZ6bmVrMHFKcENna2JrTHJIU25keXJUbk4wQ1ZaSGtMWmh2?=
 =?utf-8?B?YnN1Z05iaDlWcDR2MkpFL1JhSzBPT25ZQTlhYUJ0QkwyZjJ3YXE3Sk5yK1Fl?=
 =?utf-8?B?aDFiQVAvNG5McDM3ZlFSbG1EM1lxTG14ZGgrekRWNXpZTDZtcTVPeEQ4Wkhm?=
 =?utf-8?B?TllxZE54RjhpeUdjTWZ0VnlBamQ4K2lLbVRFcVROc1p5c3QyUWRGcnQ0RHFX?=
 =?utf-8?B?dG1QUCtsUGoya2pPdUJSY2xrMzROeUdhK0ltU0ZSTzZYVTlrdmtYNVlVck5X?=
 =?utf-8?B?N2FWWDlvRkcxVkhNNGg4WlBTRmRXUzRXYXFmeW5yc242SW05K1c1QmQ4amxw?=
 =?utf-8?B?L212eTZMb2hsYTQ0MzE4WDNidUExWmNneXNwMHdialJINWs3dmZkUjcrbGZD?=
 =?utf-8?B?OTBXd1BwRjdsdGRnazZ1clVxbWlTN1dFa0tSWE8yTWw0eENuMFZPZUI0ZnlN?=
 =?utf-8?B?N3lneWVKTmVweGFFcFhFTGpoSEswUExtU1NwcjJwNnM5cHFHNUd5Wlg5Q2I5?=
 =?utf-8?B?VWdLWFg1RWZvQlR1c0I4YUx0N1Bqa0N6L05sck5jT1hhVjNMT1FkT01DSnRP?=
 =?utf-8?B?eUVvSzB0cTJ0U3FOa3RNZWg2SituWWg4T2wrMDNhOFFsS1hEMlVSUXpQTHZX?=
 =?utf-8?B?c3VwelVzQSsybE5EOGt1c1RBaEhQb2hIYitRRlZkT2U1dXpEc1lubk4xa0VT?=
 =?utf-8?B?dWdFck1lZWJjU0FFZ21wdTh6aWUzQ1RGSm1zdGtBUUVSWU9tQ2tYSStUWkNp?=
 =?utf-8?B?Y3RaOHIyRzQybEo2dFErS2xMUXR4S0ZQOHR0elZnZUZpSERNcXRFWnlPVzQ5?=
 =?utf-8?B?cjV3dEVtRXU5bXRpL29qUTRzNDRTOW9oUWtIREt2Unk0TTRIRjFoNnpJYU5u?=
 =?utf-8?B?YnA2MFlQUXdpZldZUnVkZ0kyYXRLNjNrd20xaEgwM0xIdzdxeEFNTlFwKzA1?=
 =?utf-8?B?ZmFPWE5pZDA0UG1SSlpGbTFtVGxieEQzdlNIMHV5U2o3RHQ0UkJkMDFhM3FU?=
 =?utf-8?B?bmZwM1FNbGZudmlRZFJFVHpvV3duN2lMSzhJeWZkcjNLSnQra0FoNkNObElZ?=
 =?utf-8?B?OWhpRG1DTGNUOGJXZTY1eFV2UEk4M2FWZjA2emtBNll0OTdXUlBtWmNGQ0dV?=
 =?utf-8?B?T0FZQS83R2FDTmhtMXRLbTFBSU0xNThKSmNiMGdwYnlOSjZpZ25TVkthZEFy?=
 =?utf-8?B?c3h0bXZNUmlVUUNjWnRxTkVGdEYxT2pPTjd1L0orOGszNlFIOFo4WG9DSnJS?=
 =?utf-8?B?UUF4cStVL3pDeFRqWmRIR2pNcWtQc1AvNVo3U0dQdzUyTWszbiswNU9oeVJQ?=
 =?utf-8?B?ZnBOWmd2YmZobDY4L1hsODBBM3ZsUzVZakRYb3hSV0haVDVPQXQ3YjhsVmox?=
 =?utf-8?B?NUdwTDFleHE0aGc4L2F0OGgwSHdkVnJMUDFSdjJKWC9oM3Q5UWd4b2FIWVhv?=
 =?utf-8?B?ZEorYy9xWG94cWRzZUNQenpDTUhDYkZ1M2NOL2lPN1E5TENrcHljaGROTXRH?=
 =?utf-8?B?Q0NJZ2g0c2lUa1B6VkErV2hzYklJWmFEekw2V3lCU2lYa2tNOVZWWlFXKzFk?=
 =?utf-8?B?b1MzQTl2MUhvSGgyV0VLeGwrelhwTnM3OUJFZmVMQlN3RGNpakhNSC93R05C?=
 =?utf-8?B?MUNPQmMreFFndW5rY01MWTBaUlFyODgvTWVsUWN1KzU5MUU0SWFpOWh2MFpG?=
 =?utf-8?B?VnR5NW1YaW81K1AzYVNXbHQ1YUVGamZMMHgzZUNiV3BNVFdGTmRvU3hPUHBo?=
 =?utf-8?B?dnZiNXVqVHdXL01NNmRrVXRweERiQmNNenY2YWNpQTVaUnJyR2cxdGFRVHpS?=
 =?utf-8?B?KzR6eUt1bm52NndwZ2RuclhqSG9TVyt5akJqelVvcUlxQmRwWStsUjEyK0cw?=
 =?utf-8?Q?MhOrzrWsBN7FfnuUsNBrrzoLwYRcgFkNjSUdu?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6db7d70e-cee1-48c1-5930-08dec07d34c5
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8179.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 08:01:54.2128
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oRgIHZdyu8to0uyZnOjMjHXCP6B3MwpPEPjyfahWf5AEarvuAMkyt9Ylgl6a0gL4jp8AiCE+6g+9Lmz8NmBqHvYMSOqXma+p0xj4LxWNLagOC33G1sBOhQNHuq9zBwNi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6830
X-Spamd-Result: default: False [2.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37800-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,bgdev.pl,gmail.com,suse.com,nxp.com,pengutronix.de,linuxfoundation.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[khristineandreea.barbulescu@oss.nxp.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,NXP1.onmicrosoft.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linaro.org:email,oss.nxp.com:mid,nxp.com:email]
X-Rspamd-Queue-Id: 245FB62A375
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>

Switch from "devm_pinctrl_register" to "devm_pinctrl_register_and_init"
and "pinctrl_enable" since this is the recommended way.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
---
 drivers/pinctrl/nxp/pinctrl-s32cc.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/nxp/pinctrl-s32cc.c b/drivers/pinctrl/nxp/pinctrl-s32cc.c
index 2645a92df0ba..89a4eb2000ee 100644
--- a/drivers/pinctrl/nxp/pinctrl-s32cc.c
+++ b/drivers/pinctrl/nxp/pinctrl-s32cc.c
@@ -978,10 +978,10 @@ int s32_pinctrl_probe(struct platform_device *pdev,
 		return ret;
 	}
 
-	ipctl->pctl = devm_pinctrl_register(&pdev->dev, s32_pinctrl_desc,
-					    ipctl);
-	if (IS_ERR(ipctl->pctl))
-		return dev_err_probe(&pdev->dev, PTR_ERR(ipctl->pctl),
+	ret = devm_pinctrl_register_and_init(&pdev->dev, s32_pinctrl_desc,
+					     ipctl, &ipctl->pctl);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
 				     "Could not register s32 pinctrl driver\n");
 
 #ifdef CONFIG_PM_SLEEP
@@ -994,7 +994,12 @@ int s32_pinctrl_probe(struct platform_device *pdev,
 		return -ENOMEM;
 #endif
 
-	dev_info(&pdev->dev, "initialized s32 pinctrl driver\n");
+	ret = pinctrl_enable(ipctl->pctl);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "Failed to enable pinctrl\n");
+
+	dev_info(&pdev->dev, "Initialized S32 pinctrl driver\n");
 
 	return 0;
 }
-- 
2.34.1


