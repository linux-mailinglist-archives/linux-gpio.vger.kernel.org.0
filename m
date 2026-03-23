Return-Path: <linux-gpio+bounces-33989-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UU9uKPfJwGljKwQAu9opvQ
	(envelope-from <linux-gpio+bounces-33989-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 06:04:55 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 103C62EC93F
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 06:04:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B0DFF30078BE
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 05:04:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D29A2609EE;
	Mon, 23 Mar 2026 05:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="mXstpnQy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013064.outbound.protection.outlook.com [52.101.83.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E3E4414;
	Mon, 23 Mar 2026 05:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774242290; cv=fail; b=rZnfhPthr0XL6YIe64JDOWLGqR1X/MMy0ltXS737SBibXs0DBSm+U6657R1b+Nw+jKS7RO37OEw2mzMr44tADykPlJYKM3XkhvVCsgeZlofe50a93s9jgzVpNxkEeeZUzd4rLD8EYz8rkJfYCzUjf3RMNjorb7xMxb4csdkfrf4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774242290; c=relaxed/simple;
	bh=IxtiPxjXmduiabfkuGBmQW9LXxt3QjIzRacomkgBPhc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Y8Pb1jzFJTAtejZhAbvmDRuhejiZWymQ0Q7xtLwnijnSVzHql1V7u7ppwbFgKCDKPRVpxUMBAOGOLJqg/QnBSuqjBs2earq7HiEvHfa7NDSi+56eHeJ1K1EWENDvO68NFAu8MOUhLJ9CdEYJZZMjHJdJ+uO0xrnBV2xMPSGKw5k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=mXstpnQy; arc=fail smtp.client-ip=52.101.83.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ndZJbMq0/KmVUVYa5gOz71mxkKIjyIOIbbbYoKx27r52JYbGriuo+V80ryPIb+1WZVlq0TkImPKS+4gfuOG6vp21XBP8CS+bi67BFbIE+GAOOnNiz/MM6n7jWQrAxndrMktcdX00d/A9LYVoQ7bi6ER7AA6orqwMVcrI1TqZmWkiTHf+tzk4mzaA79As9ve2hnc89So7yF3iDn7/sIlSvDyyUDBpd1oiOOsAyt95ERa1N6OHcSUPvW7o1rm1oMVCvOprFuvH9xJc6p9phFF9AuVwBXfs/ommlDaP8jTrCy09nd4JIHJLekYFvKzA9lQp70mPrDoLNIgLhSsEFB+Ekg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SsCN1F9+1ZhXcZSx4UhQ063DlSXD0x5hBye9ET+rMZ0=;
 b=j2RC7HJa48IafTJcVgxKvN/1HLn/p2zaKPHXjaiFQg8mTLJZ+tUzonL9/jJAaN8BZ11BO9DSRjxMzsz+UT3v0+gt+S30csxX4G2mMYqD9GiBkG5TgXBr0DV4jckMj1TfKyapERvAI41yyoUt6vj5QRObtmo6j7VjMYkO3Y+lDQ0K+g/F3umpkV/fHwZ1mGYU616zbrS9vv0XUSdrVLmxqLz5tCjksVNTTLj6EJ/tGnPkIQrMqih3h2+KeywPXOT6kt60sXAMI8WYEmI7SbgFB/B7iAeaf5TAy1gKC0pWj/0SCWhjAKhuEm55awN7ZdbSZXQrWvcFQkQdv0tOUTX/AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SsCN1F9+1ZhXcZSx4UhQ063DlSXD0x5hBye9ET+rMZ0=;
 b=mXstpnQySFY4EU9oATsEjpAl4cGcfUn70n1FZk01lpUp018DBTWOVG7qh+YybRgGAyMfyqSHvEjStVvgBNMG+zK+KLibZrqZG/Rl2S23Szz3UoMa/vNEJt5GtSPuqbyGiiNjU3C/ILr1TgmDBp9p0tzqTKyH7y4/1+RTjJsPIx7JSwyZIT/FK/XAFuG97YCtaOWCpNxS83VL22WLPoOYRz8Ign3JgRcDVB+x3gyU0xnCggeQmwYx2O0T901xehmjx+TKbSZ/OPAYlIrWhqtoNmQAgxk0oTeMszt52k0YjNG2gRMEeB/jDIDJKJjLsJZJ9p7XW1+IeuKfwEOMPARIgw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI0PR04MB10317.eurprd04.prod.outlook.com (2603:10a6:800:216::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Mon, 23 Mar
 2026 05:04:28 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%3]) with mapi id 15.20.9723.022; Mon, 23 Mar 2026
 05:04:24 +0000
Date: Mon, 23 Mar 2026 14:20:24 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Peng Fan <peng.fan@nxp.com>, AKASHI Takahiro <akashi.tkhro@gmail.com>,
	Alice Guo <alice.guo@nxp.com>, Anis Chali <chalianis1@gmail.com>,
	Arturs Artamonovs <arturs.artamonovs@analog.com>,
	Eoin Dickson <eoin.dickson@microchip.com>,
	Greg Malysa <malysagreg@gmail.com>,
	Ian Roberts <ian.roberts@timesys.com>, Jacky Bai <ping.bai@nxp.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Marek Vasut <marex@denx.de>,
	Michael Trimarchi <michael@amarulasolutions.com>,
	Nathan Barrett-Morrison <nathan.morrison@timesys.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Oliver Gaskell <Oliver.Gaskell@analog.com>,
	Paul Barker <paul.barker.ct@bp.renesas.com>,
	Philip Molloy <philip.molloy@analog.com>,
	Ranjani Vaidyanathan <Ranjani.Vaidyanathan@nxp.com>,
	Tanmay Kathpalia <tanmay.kathpalia@altera.com>,
	Tom Rini <trini@konsulko.com>, u-boot@lists.denx.de,
	Utsav Agarwal <utsav.agarwal@analog.com>,
	Valentin Caron <valentin.caron@foss.st.com>,
	Vasileios Bimpikas <vasileios.bimpikas@analog.com>,
	Vinh Nguyen <vinh.nguyen.xz@renesas.com>, Yao Zi <me@ziyao.cc>,
	Yegor Yefremov <yegorslists@googlemail.com>, Ye Li <ye.li@nxp.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	arm-scmi@vger.kernel.org, linux-gpio@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>,
	Michal Simek <michal.simek@amd.com>
Subject: Re: [PATCH v2 0/4] u-boot: add SCMI GPIO/Pinctrl support
Message-ID: <acDbqCbCSulKNELd@nxa18884-linux.ap.freescale.net>
References: <cover.1773256350.git.dan.carpenter@linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1773256350.git.dan.carpenter@linaro.org>
X-ClientProxiedBy: SI1PR02CA0050.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::12) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VI0PR04MB10317:EE_
X-MS-Office365-Filtering-Correlation-Id: f0c016c5-f06b-4ba4-9e8d-08de8899a69d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|19092799006|366016|1800799024|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	C1v+9WndEnowEEJbtXaIaZT/kKt2Ar/wXj0223TanGqVgDWoROQq5bdtLJzXKDTWJ3sr1PgXVkGryw8xij/jh8BA82JsCPz2xfIkFHZdiQOFEHkWJfQSWmHmuo4nhKMH38UFh6hZ6ZqiA7lKPxv36L0xs07DBS7mWsXGTe6JVD6dR3m4dN++ECg6mXsPcTuSV6NUBYLhSR10ZZNox7nJUEF4yldY7Kr/hGljMRCyT8ykjQNsq/2m6o6MjucFIEzb7zIEZQeQuFE+1Oszz+C891YMvs78oD/17Pvq/Pa9ATNtbiYHdMltjMRf4DPwajE8VckWE9be9vK+MbS4l9nYN1jx+3wad/rEHTvmr+Ba72sHScvKSirtdAO6pmUMhgec8ArVHPLD/1ch2NeDg6EpoCNl0snMT6Wu6DbGzF+G0YO83Y5MoPR2eNICXoCX4SY9hwTR7mwgGJsLXCcD+lG6v0NueUOQuqw9sI/liImr/6t+ma+VBRfJl324+XsyMe6wfMxS++N7M30STn0/OePW5DeuDQac33gm4Xr9PaDLxV4yQjvd9b3ikrcwfAZ1gxFj00uit4OYPw1GCYt+EGoPgTwLZlza8f3CRz9rFk0sKRPR1J+xVetVJMMU4abChtoH9rsz3f587J9gbTAvFEycJgS/IbxM/J4yED02mVmjMBYTV7Yn44T1+J9BrLIdE8dVyayQSQNRY2h3eBSJ1XGGYKLp5frAZ3sp5IQsqlpX1KpFdSdmmsl8zE8bxh2niAEwqZTiGp+cftcr37o9swQfBgbkR/RAkNEOLWzx/heMZGc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(19092799006)(366016)(1800799024)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gSGjpDLm2NrCPq2HRgeYXoPltvIsC3tYS11TmC7hnNddYBh9K8pemz4L9a+Z?=
 =?us-ascii?Q?sC+x6NMEf4+Itwk5ALiU7LuaUai7Mhw4MyzO+P+2bwEmAvQiYkL8hrQUI2lW?=
 =?us-ascii?Q?p7WkQB8sXHQbs8YqtPvXkztKje/byxnAE3QZq1yBINiHcA9NA98Fc5LpQc+c?=
 =?us-ascii?Q?Z5IChKhCUytE+f26DzXIEgdtz6CxhUH+qDhpXMo517GM7DLcv1DmdTi0k1p8?=
 =?us-ascii?Q?EKMnYE/vkm6m71WmDJEkJX/mqTKQWs3VtUod4I+l8RKyjv/N2/BOBK8DX646?=
 =?us-ascii?Q?vDr88LfS74ADeQ9QW/JxCUu47FsBgd/LYty3LR8VOjOL5TcP7FtM+ut17Jt4?=
 =?us-ascii?Q?vF5x4ntYETN1++M3+pno9xD5ym6qP199Derr0AqIntOZhiM0DsCRHo2l23Ll?=
 =?us-ascii?Q?la48vbJBW1UAUHhQYziutmMgNA0W9VkkU+mwZdOknv40IVpisrJk/+Ed5cDo?=
 =?us-ascii?Q?tlO3vvGLJAZO+MBrp9sbARwN/LHI+1L8qB5Cm875ldwNJ4FjuXETKjkscluG?=
 =?us-ascii?Q?OIuF5cAaCjgVM7HxsvT59du7ftm54k4d9BTbeqRcYX3QK+2/E0mGBJqJ2170?=
 =?us-ascii?Q?W4/AxdXQdjKwcX59qRzAGS/ehJRhhXhfuUQM8O1jWzEnA+kx6KSiWEFWMEBH?=
 =?us-ascii?Q?pmHEdziv/n//GQxEXGyQahhPCBfqJC5i6Z1mHRX3mg5f2HxB8SGTOfKdSJ1a?=
 =?us-ascii?Q?zAa3ftskjwNxK3CwRd5R5GPEUQxPvlq6ns/1I/riMLob2bYBWe6pDhzbPV/t?=
 =?us-ascii?Q?cF7hHYimn0QGvG3dK6kxXal6wt5OlnZQ0NmiAVmEFiMhIKC+xQ5aS2+CMnfq?=
 =?us-ascii?Q?1LdXgcGBykMw3ld2fhYFbpfRSKfhg5C7Dje1tcumtsYWXNj9z2eplmMCmkAv?=
 =?us-ascii?Q?YBsjOA586x7WPfn68BcFZYAxRDcQUk8+HUL/zxJDyzwughUjnGiOGVIzcHTI?=
 =?us-ascii?Q?kIaY9w1o4JLjwA144XGExXg4jmMKfkp+YDCA+SCvJAEKlc7RGH1kNGD5WKtY?=
 =?us-ascii?Q?VKvQpeaVdygzTfesw/06xHpfTlcM4NFHk/b1pTI3n0SiVJukzXzB11sDAxKM?=
 =?us-ascii?Q?/e9nEKdpeULVXu3PrlXrGAyKCvhy8PinV8bw1RSmy0mN6wisavUrqMzfGHEF?=
 =?us-ascii?Q?UzObq9GCQCdLvcGb9daw8PoXW9HY/+PJxvLdGlivra6cp+K9sg8nRTvXyeY3?=
 =?us-ascii?Q?pt01wd/aOHBG8rJaF3bWZaPTjUVXbQEkSMEpgTa+xlaimDKLluAmwzzGydNE?=
 =?us-ascii?Q?Q7aNlU1US8h7NGrC/uBiBUSLV6xyYgPnI7kkYlIPTnOJjbf3vqhGbHKlwRJV?=
 =?us-ascii?Q?qbVtWXZVKpGnRfSUaEjs/V1ULPUS5BeMoBZBALvBppSVV73N7yFN+Q8rIgvW?=
 =?us-ascii?Q?YXCVLAsWcnyjOTiwz434/6q8LFQck+PobIyOm4vdHQwb/pag70xWsuRFbAp+?=
 =?us-ascii?Q?iUkF5SjEUwYAfgL5P3hgb9YZX3upOd0Zxy58WroK3Lan6XKe6QqzLqLogeB2?=
 =?us-ascii?Q?lOwviAWMQuyCZaRk2cHJAtVVuJ8tDFj7Ps/Axgu18pVQNPogBuZnkZqTC5D/?=
 =?us-ascii?Q?SJ1YnwS3JFar5849h3ycFEAxVCrC04cE2z0e3zOkS0WDXuPNV9zvPiZLwy71?=
 =?us-ascii?Q?OnAsGVWFQO6t+CWHaE3dtTIjaHoe5YkdrI4EMy+pzE7tpq+r3Z6pZE1P+F/a?=
 =?us-ascii?Q?fOiaMA9cEI7ns79DXzEV3xNuVQIUT/9DXxRaH896tk0BojRP4UO4WzzlfRmn?=
 =?us-ascii?Q?b0faor7KNQ=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0c016c5-f06b-4ba4-9e8d-08de8899a69d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 05:04:24.3134
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yJXZwxSVjtHBrQ8fNKLlze3oFeDNaGI43t/YStcokbEID62o4js66TrGaXC2uDUuXg+hsQm1JibJwAnrV5NHyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10317
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33989-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[37];
	FREEMAIL_CC(0.00)[nxp.com,gmail.com,analog.com,microchip.com,timesys.com,mailbox.org,denx.de,amarulasolutions.com,linaro.org,bp.renesas.com,altera.com,konsulko.com,lists.denx.de,foss.st.com,renesas.com,ziyao.cc,googlemail.com,intel.com,kernel.org,oss.qualcomm.com,vger.kernel.org,arm.com,amd.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peng.fan@oss.nxp.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nxa18884-linux.ap.freescale.net:mid,NXP1.onmicrosoft.com:dkim]
X-Rspamd-Queue-Id: 103C62EC93F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Dan,

On Wed, Mar 11, 2026 at 10:39:30PM +0300, Dan Carpenter wrote:
>There is an existing SCMI pinctrl driver in drivers/pinctrl/nxp/ which
>lets you configure the initial state of the pins via device tree.  This
>patchset is a more generic version which provides GPIO as well.
>
>I wrote two small cleanup patches to the NXP driver, one which renamed
>an enum and another which made some white space changes.
>
>The next patch adds an pinctrl driver which lets you configure the
>initial state for the pins.  But the main thing is that we need one
>driver to handle the SCMI pinctrl protocol so the pinctrl driver does
>this.
>
>The last patch adds GPIO support over SCMI.
>
>I tested this code using the SCP SCMI server on OP-TEE over Qemu.  I
>created a custom mock pinctrl device in SCP.
>
>Changes since v1:
>Address Peng Fang's review comments.
>Use the standard gpio-ranges to describe the pins instead of
>inventing a custom format.
>
>Dan Carpenter (4):
>  scmi: pinctrl: add pinctrl message IDs
>  scmi: update comments for scmi_pinctrl_config_set_in()
>  scmi: pinctrl: add pinctrl driver for SCMI

I picked up the above three patches.

Thanks,
Peng

>  gpio: scmi: Add gpio_scmi driver
>
> drivers/firmware/scmi/Makefile            |   1 +
> drivers/firmware/scmi/pinctrl.c           | 365 +++++++++++++++++++++
> drivers/firmware/scmi/scmi_agent-uclass.c |   4 +-
> drivers/gpio/Kconfig                      |   6 +
> drivers/gpio/Makefile                     |   1 +
> drivers/gpio/gpio_scmi.c                  | 248 ++++++++++++++
> drivers/pinctrl/Kconfig                   |   9 +
> drivers/pinctrl/Makefile                  |   1 +
> drivers/pinctrl/nxp/pinctrl-imx-scmi.c    |   2 +-
> drivers/pinctrl/pinctrl-scmi.c            | 365 +++++++++++++++++++++
> include/scmi_agent-uclass.h               |   2 +-
> include/scmi_protocols.h                  | 379 +++++++++++++++++++++-
> 12 files changed, 1371 insertions(+), 12 deletions(-)
> create mode 100644 drivers/firmware/scmi/pinctrl.c
> create mode 100644 drivers/gpio/gpio_scmi.c
> create mode 100644 drivers/pinctrl/pinctrl-scmi.c
>
>-- 
>2.51.0
>
>

