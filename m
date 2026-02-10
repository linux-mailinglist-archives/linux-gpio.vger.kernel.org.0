Return-Path: <linux-gpio+bounces-31568-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EOJlJXhni2kiUQAAu9opvQ
	(envelope-from <linux-gpio+bounces-31568-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Feb 2026 18:14:32 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA7711DB83
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Feb 2026 18:14:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BF122303675A
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Feb 2026 17:09:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87798374180;
	Tue, 10 Feb 2026 17:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="V//4kZ6x"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013040.outbound.protection.outlook.com [40.107.159.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180763803DC;
	Tue, 10 Feb 2026 17:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770743340; cv=fail; b=FCcoycqCi53eye9fHBH91dheltFtoA8lN35dYOx/J32rRS9OfJOpB+NEpb6iXdzWi/vZk8bCuN8hKe7cPuIMGpDCQTuUO/SzKGfJJ+v2VA2IENOKpM0DS1kOPAHRd0j8+rGuLjqMAW7l/cXWtcOrv0JcqYAgXe5QkQcNnqDE8tI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770743340; c=relaxed/simple;
	bh=cGobakO6CsA1ExL18AiFrMqP2HAld54z5WFCDQwfoUs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pvYjgh1SAOOdWJe/XoexCApgVhhTa6DpkwJp4PpRBvK5t7eCesCblS0ZG5OwCOytvWk0CkkAFBaLgL8gt/Yo1AMVMiZ0rw2Fr47ZA8HpXbD9imH3231RedzVj/diwUQW4Z6k5itL4UOl84lkoNuJLEUFa2jxBY9zdIkb0mkeneI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=V//4kZ6x; arc=fail smtp.client-ip=40.107.159.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R1N1+9b525dR013MICVFnTIMk4L5qpTCufinQK+ajX5buGDtONA8YMBlNcUZMRJw6OSmw5FSCbS6joDYh5YcRamMM5GQwXV33llSl3mgpfZiRXUqsoAXKF1k62PJoEd+DselJgCuTWZucBwaHMa9B1VvG9s+G9fw4zDVKOUY5SK4zwokpq0Sc97R4fwDB4UcLPJPIIynxpnT3IwZYLHtx7LidM7/vwIBvK6TmbzZ+iIS0LyhzTStxN1G4MKTwfZlj9idgFkuG3IBphVdjUJNTemtZyf4si9n6nsmTX4lOs6omBJrFnS23YMszkltMCvMLJizZ4ZxyUu4bXaGc3LoOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U3Z6Sl1hmnAVNbH8POuWCNQSscOH1M9kbu7yanKFppU=;
 b=aBTrczJWeOSpJ8LHFo3sRvyhntT/LgoSG+0iEiOZJVo9RtVJjUHUyojCI7jx2GjRaJwewbO3/3vY3zSZhLvZlATE3DW9rrQsTDf1a9BTVA0DKLeqtW1pIaoTH/9EmjaWOCmGW8BD+VLt20MVb7s9Pn6/2Fjjonx9WuZZv3kBLfisCEI5/+koFsKXQFStHEDSx7wX9MOIEgCa0hJyb455NB43/dZ8T8aICmUPD16su8wO/WaW39fMxBg1UL04+yyRDSoZmhLq3tBPPMnTtf0jRKpl29e13tcpk9DfyHAvpFtAFMXziVGzKlzZOfQbXKSPcBK/j2kd15n9Fc/h8RN4/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U3Z6Sl1hmnAVNbH8POuWCNQSscOH1M9kbu7yanKFppU=;
 b=V//4kZ6xQljZbETNj7GfA/Ugt6WTgfLbMX3ImCMJUixZHWLV3WjUqdeYpixDLrVrdZno+piO0lLplzBgSaHeUUFxymzhg+e9YdISX1GG2ZJJ7v6zQyk7zJBqbhHDPbCB1t7a7krLh3puDxUnMsZebrtXGQnwPe2J1IyX9s59CUe8yAkDKTGEIPi/l5NMTOtXBysiP8vr8FSF5HJ8HTHeOYTSfPtuDxUSM9MvSOfqoGDR0g6oSix5vdk5K6RwDclVURQMbXyRkn5tUZgqDe7G9n7SWIVckZr6o7099tOdP+AhisQkRnjVhUQ4J5hro1n88cIEDYf1vDI8xQppGELSkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by FRWPR04MB11284.eurprd04.prod.outlook.com (2603:10a6:d10:19e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.8; Tue, 10 Feb
 2026 17:08:56 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%4]) with mapi id 15.20.9611.006; Tue, 10 Feb 2026
 17:08:56 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-imx@nxp.com,
	arnaud.pouliquen@foss.st.com
Subject: [PATCH v7 4/4] arm64: dts: imx8ulp: Add rpmsg node under imx_rproc
Date: Tue, 10 Feb 2026 11:08:14 -0600
Message-ID: <20260210170814.406883-5-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260210170814.406883-1-shenwei.wang@nxp.com>
References: <20260210170814.406883-1-shenwei.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR20CA0021.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::34) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|FRWPR04MB11284:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f50e6fe-a251-43c1-36ff-08de68c71317
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|1800799024|19092799006|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QPvIK9ukEBGicexKa5icatnkFdzArGgtWTIJywfnOCncgAZsMIk47wn9UZ01?=
 =?us-ascii?Q?PJhxs0qqkAGIgx0KErDuMTgWryHysGjjHbXs4jYtvluJPd2bGPy5+8lbcHaA?=
 =?us-ascii?Q?45bEhQ+3VFWqNgxfbKILoI57lQVlgKOhS/zWXWOzEVnuo3BA1DjKZPXhm1rv?=
 =?us-ascii?Q?PXYG730Sjr8dXVcVNse+mDm7vwVQT2TNR3aImAEr0FSowOms1T4oendlw1x3?=
 =?us-ascii?Q?hno7ieuUZOKaafyw5pHmrUMenmY2tmqQrPWjJXDi20H5P6ypy5Ri/GaGnqFr?=
 =?us-ascii?Q?JhLsSRK7+TGoE2FEKv8B4BszsRdi+irpnlpCTAtTB2IxKr+cjd5zLE/Sm3AR?=
 =?us-ascii?Q?4a76RTt+Ph7azVeegns8yivMlnB3DanIW6dVIsCXVHW1faB/PXR377WTYHGB?=
 =?us-ascii?Q?SFCOsUvWvpSoX04xUZW72pfKJh/+AsD6z8YlBLFagOanJ4oGcbii+l532ukm?=
 =?us-ascii?Q?GlRrTAxgrDkEPugE/egADTDdk4hGiqATy7gI13CHuSKkzNLbPx1uFXql8Mwp?=
 =?us-ascii?Q?ObbdI5Q0D3PL7TrNckArQofJU9PpabzlYcm2G0Q7UV/5m5C48lj2pUqgy8Pu?=
 =?us-ascii?Q?bCRMlbCkBr2xNQgvH2ofcoF/wnZ4BJC5RQ7JoDhyMwHhGg/qaWxV5CQ5GQLa?=
 =?us-ascii?Q?2v9RyWST2eWhOzOr3h2Jq+CmlpiZ0VOCDzapu4aAuIXRF0AQ06aEZGVi48N2?=
 =?us-ascii?Q?Du5ET5aty+52wfJbjQXn7tLGVb8kn3Pt9NCDGzij1UyN0Q/46kmo925lpEgh?=
 =?us-ascii?Q?xUkTN9SQlZNNSeG7LpYUOzoI/H5WjmPL3/PYOmYbRwvzD1KhWca7uSfPmw3y?=
 =?us-ascii?Q?59rK5zszZ3m7P0Jx97zKtneO9gsPv+oJd5UP6UV5aS8FNqddzCIv3bxAnZXN?=
 =?us-ascii?Q?NudreF+U56mT7JePOlaT82M0/OilfNeKCqVwVzVP4yyB5CG3MK7TRXExSDnt?=
 =?us-ascii?Q?KuSrnCqRZxZIjxm25mM8CkdymWT/nFEcOLA1HDZmiHnSo7tOqEONiQQctxWp?=
 =?us-ascii?Q?nHTipnwAPNE9THUGsdevFpHCG8A10zADSwkQ7v+NaaDy95I3mJ3Vdv6IjzAV?=
 =?us-ascii?Q?f3iKFf3FmV7YKRmuF+I/PLps1vsvvSgd5JCtAxqyNf/YDIU04h2125BZsTI5?=
 =?us-ascii?Q?q8bOM1GYVCBAKX8SHjWtqM1sFIP0JIO1HAG6P8V45KcNmYFnaftHsSN6dbrA?=
 =?us-ascii?Q?eKlZa9ABLjg3urRwo0p5xNxAb/jF9kSHsX7lp7JCvszh+u1tvFjDvp7t2J8y?=
 =?us-ascii?Q?GAtyi0dSDj5krbEWyWwfqSj04b1KEy2NiAihaaavjmkHBj7LzFkNcBYaP6qm?=
 =?us-ascii?Q?/Wsvt3aZy2X22pmUaehqGZnhsOoXZmk408OHc2l3g+tXsy73HZTxREWw/f2I?=
 =?us-ascii?Q?MHPcseiu1E8ji1vCQcTrNPHfjXeoKcZk50giJ5xWBfsixRmBbBnk6gwOGHiP?=
 =?us-ascii?Q?fbgPWIRphZJcr22rJkRKonDo2cvZRiuBgGtBolpR4Morj7jmvOxavgt9bHbq?=
 =?us-ascii?Q?IyqUnLNxT1OyCZUfWXDLBqeL70LTFBYa2DRkvY2UERh9/WwSHQNbUMVbtHb4?=
 =?us-ascii?Q?AsXiYkgorbR8RnJLwnOvz4bHmGICN61KDKpKz1kMhNdKq1+LjLJLH/cDyeDW?=
 =?us-ascii?Q?9v+GZfU41bR9n0RG3PC2Es7VfRKr7qjwUcGnSD1n0Wsf?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(19092799006)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?egiWXjKXoP+aqIJZlZMfvsnfOiznDM8TT6AzQEaQhpyk/Da+oDTN0z/uNswm?=
 =?us-ascii?Q?xZIfzvgBEmPduMWHzmhEodjpJwxEIpuurRS6R0bw58gUxlUE8CmxQfRwgufG?=
 =?us-ascii?Q?8vN0C/I4onAVTxq2zZjYl1BMDnXkfiH/gyodRaBLOPDaFi3/YyWgkJ3z3WN5?=
 =?us-ascii?Q?aDsSODrs7/oRXGun1Reflr5Kf7HqOjFDhaNRfB3xZF3UCfr5No2W7HYadaRw?=
 =?us-ascii?Q?eEycnLQxq7kIKesjnga6RKysynM27yDfTSPAUAKxRFryqs7A2j9PI1it4gEs?=
 =?us-ascii?Q?l4uY/kg7kxFFrvHExY4ikk5ao7ygD0YqWLWD9bQPhrAUHwovy+v2DoeN+gyQ?=
 =?us-ascii?Q?knfRvMJcWNbphDzP04E3+zXJHj5ZRCMO+TM/ZagIEGIxnDaW/p9UYewkBzfj?=
 =?us-ascii?Q?0303EIeZHRxk+48Ra0A/X5a+s0sdPdP4HuTSct8XtyA2leAfOmErlJyDhAzL?=
 =?us-ascii?Q?Ti/pTeyTQPRThLbNZiTJnN0lhqB1Yx8CVAWulRUXzm9TKLgU3qWc7YUXCpKg?=
 =?us-ascii?Q?BaAMq0QMoZeF7OfIzqQQT6o/xKfddyos+aKfTOzXAalz92ZO9BYP6HZG9JLU?=
 =?us-ascii?Q?Zs5MzBYQ2xVE7YoyFaOOjKE0ndTv3r88J1PhrX2VTae7nDPtYi7PSFZYbIRa?=
 =?us-ascii?Q?V6pKHta15+L3AvPFAmVWA/R9MjqGtctRzNWYWH8WHMSNU4abBcE7PfZ7Mkzo?=
 =?us-ascii?Q?1IYV5oP4bonLq7h5XSA10XIFnzgkChEsMu1a2rBhDM9/Fi3Zwk8N8tsj9IvJ?=
 =?us-ascii?Q?CA5fFDG4nHh39JQdcMez4ZOT7M2R+qbJ8cFzt7L9qKIZvBeJqId8acFSyAkg?=
 =?us-ascii?Q?5YpaPVPZWEnRm0GVmn4cYdf7OOc9T/V27ruW4YRr3ld0E+nDbBNcnYsNhL8G?=
 =?us-ascii?Q?/iw9OLZXUHVUb1C5QJDCbfbwAexsETdMamHaIKxEv+XGUknNjQKKJn9zirLC?=
 =?us-ascii?Q?TD3ZZ/si6t9bCrWlhZtGFSLY//Dw+ZQS9KQeftZ1JY0ree7wxwbERQDxK6BZ?=
 =?us-ascii?Q?zegX820e/IpRbce/hg1nbPwBLS8debLAovOn3054v75QIvBnnUVyiJBZmLux?=
 =?us-ascii?Q?3ipOfJjWd27bf0d28G6mL8AF8W/7Gthm9BtQGS1zWGc3GWPSCTHybcHWFDnN?=
 =?us-ascii?Q?bXNFlPhbma7jpGWPCNRg2KRh1FHZPGcFitw1ioqNlGWc1fViifoYlPEwUTZg?=
 =?us-ascii?Q?KZhOQF8EJ5/3t9vJFEQUsyLIla0i72DqxqlY5kibx9uI8IrBpMKPGcBam50R?=
 =?us-ascii?Q?8GIq7T6nx1LfN0E8WeVLGrkWXn2T142uZdGjjXA9vVzQATeF1ZDzo3LFYGH8?=
 =?us-ascii?Q?QBA8syVjaksiBubbhK341bVxgHfPWFwikNIDGW4FFFT9tK5XZoGGbcNPc+/f?=
 =?us-ascii?Q?+u/gkE3k1Jjg5dUN5Y6qaLewSGFW535rdEOw+vWntW4VdzTmLWHyHmMru4bm?=
 =?us-ascii?Q?ueUU0EYLMvB4LJIKY+ROC/8+bWULXQxsPhdkll6W3crcqa2Ocm1U8x5nORCB?=
 =?us-ascii?Q?FQYO0PAc45Aid7JJiT1fpd0XwrBOdYkktTIY0U5jCemgf3IK0/ogvcbut+WM?=
 =?us-ascii?Q?+7Ex5uWXr80Ki0tcf/7pI7vm8TvIB528w10+2I2b4fCOwpCMCBnEYSz8uDXf?=
 =?us-ascii?Q?zlAgZLCv2oQyal2VZ79sauG2EZeNRhxQLykda5eiljQ6kwZmmWaI76uvEZT0?=
 =?us-ascii?Q?wP8B0lP883D8BnLY6o4agN1SAvql6Ol9LN+uWp4z9m9sIgMnstQtBHW3ek+5?=
 =?us-ascii?Q?/eljlcCyCA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f50e6fe-a251-43c1-36ff-08de68c71317
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 17:08:56.2621
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W4ENlbxbsC0ZXH6gLSB51iZBV+egGKvUVAEKQDG1JvKDNFENjZFL7j6yqAxF9AMZlJojoqqxZr3KnoB904qL1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR04MB11284
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31568-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[pengutronix.de,gmail.com,nxp.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,foss.st.com];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shenwei.wang@nxp.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:mid,nxp.com:dkim,nxp.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.1:email,i.mx:url,0.0.0.0:email,0.0.0.15:email]
X-Rspamd-Queue-Id: 0CA7711DB83
X-Rspamd-Action: no action

Add the RPMSG bus node along with its GPIO subnodes to the device
tree.

Enable remote device communication and GPIO control via RPMSG on
the i.MX platform.

Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
index 13b01f3aa2a4..93846435c6c1 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
@@ -191,6 +191,33 @@ scmi_sensor: protocol@15 {
 	cm33: remoteproc-cm33 {
 		compatible = "fsl,imx8ulp-cm33";
 		status = "disabled";
+
+		rpmsg {
+			rpmsg-io-channel {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				rpmsg_gpioa: gpio@0 {
+					compatible = "rpmsg-gpio";
+					reg = <0>;
+					gpio-controller;
+					#gpio-cells = <2>;
+					#interrupt-cells = <2>;
+					interrupt-controller;
+					interrupt-parent = <&rpmsg_gpioa>;
+				};
+
+				rpmsg_gpiob: gpio@1 {
+					compatible = "rpmsg-gpio";
+					reg = <1>;
+					gpio-controller;
+					#gpio-cells = <2>;
+					#interrupt-cells = <2>;
+					interrupt-controller;
+					interrupt-parent = <&rpmsg_gpiob>;
+				};
+			};
+		};
 	};
 
 	soc: soc@0 {
-- 
2.43.0


