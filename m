Return-Path: <linux-gpio+bounces-36072-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qGGCFBWd+GmdxAIAu9opvQ
	(envelope-from <linux-gpio+bounces-36072-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 15:20:21 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DAFF44BDC52
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 15:20:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 17F90300C0CD
	for <lists+linux-gpio@lfdr.de>; Mon,  4 May 2026 13:13:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15F8B3DDDB9;
	Mon,  4 May 2026 13:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="HdX3owar"
X-Original-To: linux-gpio@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011019.outbound.protection.outlook.com [40.107.130.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F713DCDB8;
	Mon,  4 May 2026 13:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777900327; cv=fail; b=N0P4U2JfA8V+LLft58CPVTIwy1n4dNthLGo9Gn5I0USIYrucpK/N7gt8VuRgmDLiqida4pWEaRhc1zI9FeIICrGIGGiIpZ+zUWeIykB7vDOIgUBdxvu4h0miWTcTW9D6jL3cEZMPNTAhuCnA28CoNi53GaBZ5z6IqXwaf0OEhiQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777900327; c=relaxed/simple;
	bh=a4AmnFedah2Hn5fv0eKZpoxUoI+xGpviKem+dmTR1Vg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=V8cQHH/fNXbzN2Y6YoUHho/Iv/bll3jymQEqMwFCyl4swcJ14IxedHiWVpV7uunuuPkfMz+R2a4ktud1NIErf3P0Jxl1M6yqMwFoGPWhSm8nqxDcOPoRkCYI8DpGRNk9kT5sn3l24hgweFhKw6uKuO8zEVZiK/1ODGaJUayHLbQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=HdX3owar; arc=fail smtp.client-ip=40.107.130.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qRXJ1iUToICSGTOS79WWyej6gsrbKpM3dp5B0v6DUegc9CB8A8q61v+UAOUieWqjAG+nipOIBOQNUk3d7ZaCWVjMP03+OrKDLgHJNeKmY04qqYd08mVZeL9RcdCxqZpoKZsjcA1+kb+ZFuAqUUFElzkxvS/TPRCosyJXtKPLKauz5Bew0xg9x1c7JjdHKKhlWtE/0TiNYYrlz9RE2m5T/mwpkvHa4imW2HeEcsek3XxitBYcHHxJUcNJOZKqVUn+FGOXZhTSuRwCUGh4qsh3WrSGfquyJ/4Dx9U9wEbzqCelthD3KXrKmDGr2CVQLM7nQ8gEAPH3IxnbY0z5WP9YEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N6FcMx6RYsfyRvKJXW3MmIy7Hcl20XPAjs8W3AFHBa0=;
 b=VXAxN4vzc3Omg14U5S6nHo1VinH3OF41bK7W2D0aRfJZdkrysFj2+MAKeijOWJf0fTEGB7+0gTZO2besteaZEw0TnOzrEEojmLmt8hS7KvM7/5wQiofsajdpuuAOYm2gLWODz2fqTXZk15SiNU4VZl1udEMjuJH4YAxYD82NI9bRTkDY09/BW2KfyGg9DLgK35ykK1BagDdCkdzWw3Q3/SHtPc+bR7dD9vZcJtlX4GBYdW3slli6yNau46LIJBjbVUOXAbMarcVObBXx0B9B58ctlv5ilSbhkPRHN46QoUMYpT1/DsUV+T+PgecNX7PJjgChL7FWGS1SirtImo89CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N6FcMx6RYsfyRvKJXW3MmIy7Hcl20XPAjs8W3AFHBa0=;
 b=HdX3owarJ1+CvgHTOBusX9aEIQbLnLUemuL01y8n6/4npYf/SVo5JjmUJyY/A54WfuWtKIxncVHVMbXFTUZThWrdxZOp4QvcvuM0R1FnHUm50NjsdEyKU/fScs3jz0jVJgRok8OQ/8doO3fA1PYoRF3f3IEbvYbf7EVfGs74/LrHGecJtbzlcy6QLONKjyeZOUvauli7mKdVrKPVrAqAPAhVSkV23f05wQvpKisoOhsqoFH4TUm20yzv8cvcgV81aUWVGt3hB7mFo2rl8EO5rmPwU5hpeBLbrCTaFIdOmhdiYSPLChhdYcBdThWcuN6HgXxJ3zht9en4NL9WsnsYxA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::20)
 by DU2PR04MB8583.eurprd04.prod.outlook.com (2603:10a6:10:2da::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Mon, 4 May
 2026 13:11:56 +0000
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85]) by AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85%6]) with mapi id 15.20.9870.023; Mon, 4 May 2026
 13:11:56 +0000
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
Subject: [PATCH v9 5/7] dt-bindings: pinctrl: s32g2-siul2: describe GPIO and EIRQ resources
Date: Mon,  4 May 2026 15:11:46 +0200
Message-Id: <20260504131148.3622697-6-khristineandreea.barbulescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260504131148.3622697-1-khristineandreea.barbulescu@oss.nxp.com>
References: <20260504131148.3622697-1-khristineandreea.barbulescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P190CA0001.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5de::7) To AM9PR04MB8179.eurprd04.prod.outlook.com
 (2603:10a6:20b:3b5::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8179:EE_|DU2PR04MB8583:EE_
X-MS-Office365-Filtering-Correlation-Id: 82334b5c-26f4-4cd8-7c2a-08dea9deb7e7
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|1800799024|376014|366016|7416014|921020|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
 QNQcOVN2UJ6zG6xOj2CUyTn5oOjvQi+arD01FCTlI4nK6zwIJ8WgngMKMpnbZOCVe+i5TJcF3NWYpzOmBbYd333fQm2awNzn4X0C4A/c3ietO+/owkKSXcBQuxHQgvgt/4VDb5nZHMkkKIRImUQke+5F3j2wpNSJXZjZ3X8RxvGfaQ+fbrQgOYUhnnobEe+FbpNY6B7p/QHjVqZo5dv10uGIS2IF1c/pLnn7bVrlakNLvAuePvpI4nyotZcDiTC4b3UR/hmlj2msOOLPOR+0l12CwESH4wHMSPZczH0PV+s4Hc0q9KsaAPD3A12YAAmGtHHZTKSpxNUU0l3EBDKWddq8X4Y8DUAwN0tM1UgHjSI/nFDXtoXXIkgEVLeYzhQ5XurPVuArb1K0VCLzALJthrGOM1WPgFhU2hdEQ4fVtcRzxf3VrT3xgIU6/ZjBCxRHey8N12xcx93GqHGeqiHxunRU3Hujv2fVL4kqYXUtUkl79y5d3DNe88R6c/M758Nimh3DcIsJkzTA1LK0qJjHJFnmNJFdAHN/aQHbHv/7TeOz3mxKUeBIMErPt1T6/ftWmCJ0X58hG0N2UxFUSncRLCN4+Mr8X0LgceTI+BEwgPh2L7Y+TtCtdzEV6v2OKGruTTV7HkZnVmMQvB05vItbcaLfObs3kF8rdjnki55ub/9F2QAUnrg2PjbR6JbSdMXg
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8179.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(376014)(366016)(7416014)(921020)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?VHZaZ1BUQzVMV05kUFQ4NWN1M1RrTzczcnYrNXp6U3BURjhNalM1S3doVDVV?=
 =?utf-8?B?YThQQ1VIcHMxZVA5UUYrdk1WU1ZVZE1oY21VRFNZRnFEMUV4TjMxYnRnKzFl?=
 =?utf-8?B?bG5kbjd5cThsMFozVFBNQm43eXMwdFhNRHhQK0EydXVDSHYxTnBJVU5QNTEw?=
 =?utf-8?B?NFkvMWZ4L2haOStMa09XMEQ2bEtieE85ZG9waCtDaEQ5M25PNUsrWkdsMUgz?=
 =?utf-8?B?cDFJanJmNzU4N0x5bVNWdXVDMDA1VkRacFNLaEQ4YmVnTFUzcm9GdWlLMEZV?=
 =?utf-8?B?dytyUktpeWlIYmJ3eWNuTlZFeWJsVjJPSlo5SVJRK3RlN2NEdENmKzBxeXYy?=
 =?utf-8?B?TWN4bXN2L0luNVprM05IZmtuWVZnQXh1VWgxL3B3QnUvTXBKdlJlZWwrQXhl?=
 =?utf-8?B?RytQWDhmR1ZDSzg2SkZDSHEzRGxSMGI1ODNzT1hlOXRSeDJUdjIwdXlka0NM?=
 =?utf-8?B?Q1FXbWhSbkxMRUtBeC9hYzd1ZUxnMENkSW1nTDNrYjhPOGQyNThoYlJkR0E5?=
 =?utf-8?B?S3JCU21hSnUyL2FhUGI4b0ZCQ1NQb3BTVVh0Q3UwYVpON3JDV0NyWDZIVVhh?=
 =?utf-8?B?RGVTQ2NReDhGWDR0M3I5UXpRTmVyZFdCR0dlaUZZUXM2eGErUHB5dXJiRlI2?=
 =?utf-8?B?MnZGRFZsQXJRRDVqRVJkZHlkcERkRGFGRi93Q1RGblZ4amkxQ2NaeGZXVkR5?=
 =?utf-8?B?c3FhNFd4NllDZVpoVGVlY04vUDhCUi83N1phejBXeGYyUHpoYTdXK3Nha1l1?=
 =?utf-8?B?blZnVFkybUhHU0poNEVoeDhHMGJwZ1paRVFUc0xLOGxPQkRhTlF2SlZpOHUz?=
 =?utf-8?B?aU5kNnZZL3BFQnI5aDhwUG1Hc3NCTzYvUysvdCtXYU1ia2ZCWDA4aUJOa3BN?=
 =?utf-8?B?Q29RaXlta2pqa1RNcXRaNzRObnRVZ0lYSGRKUFVVSHVjbHZWS0x0VFFWQ1F4?=
 =?utf-8?B?SmRVNE8xTlR1cWNuTlkyblJyR3AvbytqWHUyT3BQMHlZTHMyZUJzdDlGUEpI?=
 =?utf-8?B?MHRKWFNOeDBjTTl0d1J2LzJSeTg2bGJqcmI4RW9HUy9PYW5mcktSUmJIN1oy?=
 =?utf-8?B?c0hqK3N3TVJFdERReldXblJhSjBsalBLdWlNM1lHWEk5QWhJY1FnQzF0L1dB?=
 =?utf-8?B?WWFFaTc3SVRnYk9qb3JwbDFzS1QrQWduNTE3Z3RrWEgxdk51SFg5b0VOM3dT?=
 =?utf-8?B?NXFhbW41bFZvaXIrSmhqdVJzS0FOUkZjNlhnUk9RdWtNTnA5TEw2RUgvbXlU?=
 =?utf-8?B?clVvMGtjVVRpTDBzbldUT1IxYkNmeitCZ3orVXpoZTNFNGo2d1p1RWR6K2w4?=
 =?utf-8?B?WjFlcyttTWR0UlptcytCQ0l4UXlwdmR0QjdXbzkzbkxQam1ueE1uZk10UGp6?=
 =?utf-8?B?V2Z3aHRUYnBXWjVwdTBUbDE5WHQ5ZFNybENEeXFRWU1ObGRjSU5Lc2l5RjRI?=
 =?utf-8?B?Wm9Ua09YbzdvN0xPYVRmTjRheDZZcDBBa0hJL1hvaGM0aUNIMmlzS2QrSVIz?=
 =?utf-8?B?aFk4eGEzc1FWcFhEeWYvaXNITTRmOHJNTTJsNmtZUWRaUnJEMiswbTYzYVF4?=
 =?utf-8?B?bjVFTVJwRW5qTENwZmhCc0tJQUhwWlVBZzJtbzg2cFo0OTRRUTlkZFhibnl5?=
 =?utf-8?B?dzBxaWNBQ0E4cFRrblM3MU5ROTNQWTRydGEvM1prSWpmRnpobWdRUTRLekVW?=
 =?utf-8?B?TzV5aFBnV2xIV0VNeXdWLzNOVFkzbGdOWU9HbHc3NFczV1dLZVBlYUZpQzBS?=
 =?utf-8?B?SFFNeXNCamtsQTlSc1dGL3NBVnN5azRJd29uYThoMU1vR09Ta2ZURVZyU1ho?=
 =?utf-8?B?Qi92ZnltSXErbW9hbktIb0ZUT1NJUHdHaFQzZ0pvYXArWGdXbk1CS1cxeGpW?=
 =?utf-8?B?ak8rS3RDcmdLUVU1M3FhaFRwNCtRbVJIeGR6Qk93Z0cwWDBRMjkwNTk2ck9H?=
 =?utf-8?B?WG1Sdm9ZWUpTK1hyQ3NRckxtSkdzREk5ZVlQUzBMelI4N2krL0sreHRadTRK?=
 =?utf-8?B?WnoxaVdTbmg2U2FNS3AzRWRFQW8rRk1rZlNYRzloTmkrclRCSmFocnR1dEsr?=
 =?utf-8?B?aUxIN21wVjNsYmpodmlEdG9hYkNsaVNhV0gvcUV6SmdSMGFQMndoUWtqR3Az?=
 =?utf-8?B?Q3lmbHpkVDl1dGtQM0JCZU1BTGxTOTd1UEN3N2EzdTk0Z0NsSGFkazJVV2Q0?=
 =?utf-8?B?QjQ3Mk9LRG00d2dVUUluQkJhTTc5OWpCaFluTDlvVSsvOW5IazFNMllUdldZ?=
 =?utf-8?B?OGNac2VUdmlPNmN5anJiSi9rZHNzcFZ1dHQ4cjB1QmkyQktlTmpwaHRNRTA2?=
 =?utf-8?B?SGJOZ3BDdlJHRFBPRVBvNkZpTFhqL1AxRmlveWVaaWU3WGswZ2xaNDUwTXJQ?=
 =?utf-8?Q?IGswcNATMKPBSeYHwWegTIexaUsnSSFq0zhP3?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82334b5c-26f4-4cd8-7c2a-08dea9deb7e7
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8179.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 13:11:56.7997
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7ywr4UwLqgpTx5CijUHEBoUWoneUjSgMAbroOKMhWEGV/6uQt3D3matlhtSJoD5ynmLBUkcFZVbxiHesFWOPvavOKnBv/toBWgw42OuE7X0M66HfR4k9GqNTlUSFg3T2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8583
X-Rspamd-Queue-Id: DAFF44BDC52
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36072-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,bgdev.pl,kernel.org,gmail.com,suse.com,nxp.com,pengutronix.de,linuxfoundation.org];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.nxp.com:mid,NXP1.onmicrosoft.com:dkim,nxp.com:email,devicetree.org:url]

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


