Return-Path: <linux-gpio+bounces-31642-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mBHrFW5Ijmm9BQEAu9opvQ
	(envelope-from <linux-gpio+bounces-31642-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Feb 2026 22:38:54 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0253613150D
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Feb 2026 22:38:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 73C33313AA83
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Feb 2026 21:38:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17BF435BDA0;
	Thu, 12 Feb 2026 21:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="TJDb/xNz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011009.outbound.protection.outlook.com [52.101.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0F8330D24;
	Thu, 12 Feb 2026 21:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770932281; cv=fail; b=mVtDlIZscTfgHqsmDlnT5uNV00kju/ywxfGEkPhhTiPnBPO9nkfMn3+Kt8lbgocmGZRfNBv3m0XtJiphScwXw/n48IJYexUYko+a+qx86Z5R7QPpxWDTqd8P+d/RpK9wITeJ3cGmq+tcrNkiv9+rIqTR04URLPnqceGZEG+lQUM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770932281; c=relaxed/simple;
	bh=6SqKbix4u8uriJ/a6R0DzmkSlC3f9FELJK3PZKiIJaA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jZCrbJz2c1tCrVORcLkD+yDEfqB893lnPpcK5fwYLpsE/GKwzCi6Oe+vOOnZptDirjX2tYGfd8rQZvbpOlfIUyQEwDbFWa3V0xJQQfjOtXiSK1+Gzn5G0OATs/yh+UIUxTQ6HZwBh4FsNAVV6jyuqWtsBHgHSwuD2hrgT7ST+dM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=TJDb/xNz; arc=fail smtp.client-ip=52.101.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=abk2ceFO6MsnZ16Qaxe31rZU6DsNJZXNJVVVFGZmUxXNjm256AtGx7GeoKjREpZBojVcMFmt8T1Y7rMcOGKGVNEOA2w82L8AlLRiQ5qP6s2d717eJ04/TRXgCLBHwxvTpGkAIBVQJda+zYEX4/MA2OzvvejF+h5IqhU+Up0wdJLNoWHlNStAlv7G1EBCSV7q7VWuhPW/jEfU2gHZirn7s/9p2q0kQlZJ7/JQi0uUv0ZccBrteTec7xgYHXjBqANN7qupKvgywCJJ+oX6nN1QiwWwQctH8a8aRNwzvi+aZYqH5HwKpTMzesC5uJAp/xSnZhqz20FaqrXb6XLgsImu5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vHjn70swDdWLLv2zCNEtQPoHvvD+r5yGSKfMbd2+X74=;
 b=im3PpSPLdlkyhbmrMM8GyhiRa7iNb3a7bnaycGSlg6JNiTZLDMDwQf5QtT8/TSdx+ESCvhNszKMJo0eBXYhLzK+2YYS20HuHaVWnwfJHrLBBCVK8c3jzqiwGN7tfonYdkKkTEJ8Mt9Qcxv55Z5fKSTx3Xr5YVgAyhfq5teEPV9B6C+D11c+zQ0gb5h17ywtbzJ/OWUJg7UZVaMufKpwQNnmyo6O9BsByMo8MzSqH/74Zpr/HtJw1FdCHFBIJC0S6in24VggBh44MgWpyfOb1JtYSqynUPOLChZt1P8K2qUveNJ67s46A3ZiUcHJFFU6NtFMWXBucO4SH3VUeUdWN0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vHjn70swDdWLLv2zCNEtQPoHvvD+r5yGSKfMbd2+X74=;
 b=TJDb/xNzQZOCsr3Dz7t8LndJq07tGMzAP5FdGjekR9n4ewAi2MV0qlBATSzAxjEF/zHc/8c3x7PTTph/n78mQZfVRSv4QlIwv+AuDxF5+r4sXVvdlSijMQ8UmEoUnQYXKcTGBEV1NkF5nYYZWavLZZnINdHdUJuO/ytRJZW0C3tDBRtaMTNjv/2RF14PPaOY7t+awbUfnSOIcrHlG3gaETriM2qdJxnI3sjXiKSoRvNqDxKAbjnpTSyTonPEO/ZieUBK4Y+nVPhU6CqqAD09LrfA9H4kL1KpOU1qfyjVbAUmPXnt+vYK/58rKyQaUevDGkpgRvYB9MK/6svrOwb/xg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by PA4PR04MB7936.eurprd04.prod.outlook.com (2603:10a6:102:c6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 21:37:57 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%4]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 21:37:57 +0000
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
	linux-imx@nxp.com,
	arnaud.pouliquen@foss.st.com
Subject: [PATCH v8 2/4] dt-bindings: remoteproc: imx_rproc: Add "rpmsg" subnode support
Date: Thu, 12 Feb 2026 15:36:54 -0600
Message-ID: <20260212213656.662437-3-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260212213656.662437-1-shenwei.wang@nxp.com>
References: <20260212213656.662437-1-shenwei.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8PR07CA0040.namprd07.prod.outlook.com
 (2603:10b6:510:2cf::26) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|PA4PR04MB7936:EE_
X-MS-Office365-Filtering-Correlation-Id: efd93ad5-a254-40f6-c1fe-08de6a7efcb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|7416014|52116014|376014|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?O1oTKmRQql1huZhz6ss+rDx/b4R7vYZZ1cD5q44WpPg6xVDpP5hodrGhQByM?=
 =?us-ascii?Q?sPvVQj+MdJVN8+q8y4hqCBeID0Ie/2FsX2tbeuXfipCylnLeaAkjFBFDM2cj?=
 =?us-ascii?Q?TS+5PMkGjYa/7p7C5Sdq9ullvAJDd/aGU213WIUqTilWtaRak8QSfHmwm1CD?=
 =?us-ascii?Q?YlVoA76eBZUVoWawFTqQXzt1oBmRWmUbKUxP6VpGBWqGv+MDN9J1gwnCM0+y?=
 =?us-ascii?Q?HnRclc7vzRMsrD1XQixgl2KnJkmp73TqcKvftR4TSWLYTKO1oM69268BPWrx?=
 =?us-ascii?Q?MW8h/cYzKJ3383wtaDc4G5qxU1aaSqo78PHzUycBeJPsKOuTu7vK10HkIomu?=
 =?us-ascii?Q?2dt5fDbJlzYq96U2R/llOCjmR9XdvPfSYb8hkP/an0o4hUT5hQeAnAVkcBed?=
 =?us-ascii?Q?zmTfxxXLs89Er8Nu5SYPuOs2+fMovcJWiSGIeRG1/uJ9zZZ49rHpimW3ohB7?=
 =?us-ascii?Q?BZQ6WpEoBdattsywsDWycC590vz80aJ1THUeWGqiTRVqZK7XZ0BSYASBxwjv?=
 =?us-ascii?Q?tRnOJZy3153weemlfz4sSUv49mhZoq/ljsi/zJGK1Yky4xhGOw7u1CkorX1I?=
 =?us-ascii?Q?iNe+jLSqUNpL6gPzXFknw8e2KvqzuaCWHairu+udnXsmgPrCbcBohMHrSPzT?=
 =?us-ascii?Q?TngBRYFgNbWF6Q1olqPl/dnrG0l8lqudXvi8m2DB/uiV1tS59vdjXMw1xHFm?=
 =?us-ascii?Q?onGqAOQufKKrZkwZpmHUuTFK8MXLWAB+JMS9IHQ1MtVnog36iWWXgwsXSVqP?=
 =?us-ascii?Q?Y0cpmwDb6+LSfxP3C/OZMiY8cI6SaYLI32iv1VE2Ogvdn6DK+NQtO4Kh1eKS?=
 =?us-ascii?Q?VT3QPak30UVvZETfi1QEWx9hRwf2yObedUBh+97PQtHAJR8wdxePQyxgiHv1?=
 =?us-ascii?Q?C6Q6wMASkdzxSIAi+ivfCwsen8l+m+4Xn1K1ht1aY6lgs+qif1aZAa8quHb1?=
 =?us-ascii?Q?ZKig7qXVtKNaU/VeqdSzAR2AWwii0gUD4Mmo35IwSUxIjSw7FV9hgO1Z3HQ4?=
 =?us-ascii?Q?4e5cFhKEvUtTBUEBR0kjkFLoTxRLWH6Rol9JUnABHjx1IRpeM4yGd4i4gcBl?=
 =?us-ascii?Q?fwAFxjPCBI5DJk1ArQJG4hGGwvmkJe/e1J6VrxM8x0zzP7OutIIhVFNzXPMa?=
 =?us-ascii?Q?ffD8ggZuDc+2WQJse/QU61gr3FcBhNfNzvbAyew8WK7uDSgTG1uXDpcM/ABk?=
 =?us-ascii?Q?TpNLHoeAAR4j5gXsLtoqH9vpx8tfULhOMzBaFv1Mxsq6XM9uJRcNTJwpNRb6?=
 =?us-ascii?Q?y25rjZpEcJ9Qo0i/QY7IG2bEc/hNApsG8aIdOrFx1TgbTLoNipCpmpre/PZZ?=
 =?us-ascii?Q?av2suzaeztx1Vqp2ckSRoPnexmHgMSi1wJq+EAfiATuCrjb8CKL6F8JLdAxz?=
 =?us-ascii?Q?G/Zh2mr7cdB5LCgz+KsUVwRVacPJML4GwrDpYfTj2qRJzIQMWBCJlabeYDlr?=
 =?us-ascii?Q?xSwECU5BURj+VYzzUyIcFcq6qJHMdscU1nnbant8s078PPc/+Bpxk69j8SC4?=
 =?us-ascii?Q?vtxItpXcmZ+ljM4nbir/3IIIBjp4bx4yGLnoMyop7byqc2j/UVfC6S/eBJyu?=
 =?us-ascii?Q?RtCGZDom8uMLUihxs7pzXYGmdUrY2sENvFeb+5l1p4vnW5cOe/tCIi0pEMGa?=
 =?us-ascii?Q?kOSaFac9USfav0sOoAv32cj0VmyC8FnBxhqk6jbtSnA8?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(7416014)(52116014)(376014)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wpU5lS7NZ6rBLknlo0jLyfbiqHYaI/SeSCpmXKkTQqCFyjuimS0gH+mPsvHx?=
 =?us-ascii?Q?Bu0fVlDK2eRHGOAwGh/tjEAQ3pDyl5LU8FisnXeF/rgD0RdgmFz4hTlBbFuy?=
 =?us-ascii?Q?2mHvRyMj+1IcNvoy6t7sEYc86s6JEWcd+bM4wy6znPWiOZg+CVYh7aShoM/8?=
 =?us-ascii?Q?k7c5WAwgDbFNDwtQcHHweoehO/KLcyx25NZEXzcmaKK+vfGAXXqYA1wAIPVs?=
 =?us-ascii?Q?e0eiiSEno4jZdVDKJ+aXdvcyED5RizXHOgEMi2j+QUXqWha942tqRVoxmZbB?=
 =?us-ascii?Q?kSWgG3C8JU56YNfjnZCWsfLxdU6oqmRv6wAPPjNiMV8B9XdLK60b2OZI4guo?=
 =?us-ascii?Q?FCyGePQEO/YoDD/M2VIleA8XMHW58N17DzjZMRy7uMGK8Zsk+7Z7bfms/USt?=
 =?us-ascii?Q?xMBOWjzcQzhDdFczKEh3JDGdTlXfZGDtTyf4pkvrcoN8uJVvXehYEetD8Hl2?=
 =?us-ascii?Q?mgEyiXn+W1nuc3G8o+Y84lRwwD6PWJ72FPIdAi5pzutWQnIIR42IQ7ePROWL?=
 =?us-ascii?Q?fWi4nCmoBO0dTKLtP3mhg2RCp5d8FRzztgmXLzkKaWu7m8GBo4zZpPX0pfVj?=
 =?us-ascii?Q?5xDiR8xuagL5uobc5dAuw3amt7/a3Qco+yBdhbkEoOkUU7hb41SlA32EOUgC?=
 =?us-ascii?Q?FvJ9thrcX4cKW8WABLlkrQKbYz2gWxQ9qsToJUxQRNvpUo3fE//0o98ZzGLM?=
 =?us-ascii?Q?BaIpwFN78CV15Acdk8XdkoSFRhYxl6dDSxTwG8M4rApw5Ey+NVvSdQteNE1W?=
 =?us-ascii?Q?QTR/Gtwp8hdfcPWzr+R6zDGDno6bh9+kCFMR62Uco60/l8Fk5Ax8XF+Qttl/?=
 =?us-ascii?Q?15oIopdfgRuUAPR4OZfzVLCw0OmlFCL5wdrlck191UfDTQm5w9nODyTq1KxW?=
 =?us-ascii?Q?AhqWedrBRV350WtBjTEcEBqVTmaFIX/LHgch9ithle8mC6+LB/bCtbuKQ6Cg?=
 =?us-ascii?Q?ZsGGzGaztn+jq05ZfgZqvIoV0O7VnKTrMC6v5eH3sANB/3i4BG3/QeBBgAb0?=
 =?us-ascii?Q?MOK4Y2fuDMD3oMqxYdRQTFrIyrezYEcA0U4Ekl0bc5D3AHeKN8kibb2b9BGw?=
 =?us-ascii?Q?cHa+K0UBcBMjG3khpiOBKbQEq5R5n36kWKRgrANOpS4ttbV1PMnkaVRWCzjN?=
 =?us-ascii?Q?A5ugjasmQIRozOs6WxSgmeoCaKF5Q7j1auIx34CeV0Jg5RXreasZMNS+OWpI?=
 =?us-ascii?Q?IDtY0uQxx/R6I0jU0iCW1RyoqzIFOOv/X5ZUOREbOqzL9SZmzeHeAXnIPNVu?=
 =?us-ascii?Q?sRxsFtvWua6YAhuxmeVH1Mth1wSgJeYoMpW3GFWWx5NBmCbBygJDrykMeoFD?=
 =?us-ascii?Q?XZWfT1P7XpMzkTUf5f2MtKJv+vvwUg4JSmnKq/ei8gskuIcV2+d/mgUsfiA5?=
 =?us-ascii?Q?+Gb+5BpodDfWNneyzGVim2857xpN/4u59jKWqPrl+T6GwrJbi0LLeYnlwIe1?=
 =?us-ascii?Q?Q2VGavvGFnguGiqiBexmlivSxf7NUbOCVBV1UZD0RkUEvPMndfEnr9yLtITF?=
 =?us-ascii?Q?+v2wGLGN+BvriS9B5taoXdahC8q5RC7tMxZhCcd+nJt1uAYmFIuXxwnRy9Se?=
 =?us-ascii?Q?A2eOrNdL+nTAvmoZzjHfV373X3MoPcy/tBcRMrLQXdrvfz4XiQdM4qFhMReR?=
 =?us-ascii?Q?lqAa8li9pUkPKlzsqJYqcLk7H9cgsouf6lX2slOrPk1lAPRKxhwhJ21ge5hY?=
 =?us-ascii?Q?XbgBKEu18FDDucyHR1A+SUdr8C3BQIn2ibvy11zKN40SG8Bs+w0zKECTEPbE?=
 =?us-ascii?Q?brUz8L6sIQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efd93ad5-a254-40f6-c1fe-08de6a7efcb5
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 21:37:57.2651
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dCS7zHLkyVHjJKorWXctkikQ9Qeb4KSouUrk5ogqP6cwe8wwFDog3+5ANbaaiC+J7QHpRI7z/x95qZdZ4qBCIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7936
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
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31642-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,pengutronix.de,gmail.com,nxp.com,lists.linux.dev,lists.infradead.org,foss.st.com];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shenwei.wang@nxp.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:mid,nxp.com:dkim,nxp.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,devicetree.org:url,0.0.0.0:email,0.0.0.1:email]
X-Rspamd-Queue-Id: 0253613150D
X-Rspamd-Action: no action

Remote processors may announce multiple GPIO controllers over an RPMSG
channel. These GPIO controllers may require corresponding device tree
nodes, especially when acting as providers, to supply phandles for their
consumers.

Define an RPMSG node to work as a container for a group of RPMSG channels
under the imx_rproc node. Each subnode within "rpmsg" represents an
individual RPMSG channel. The name of each subnode corresponds to the
channel name as defined by the remote processor.

All remote devices associated with a given channel are defined as child
nodes under the corresponding channel node.

Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
---
 .../devicetree/bindings/gpio/gpio-rpmsg.yaml  | 55 +++++++++++++++++++
 .../bindings/remoteproc/fsl,imx-rproc.yaml    | 53 ++++++++++++++++++
 2 files changed, 108 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml

diff --git a/Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml b/Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml
new file mode 100644
index 000000000000..6c78b6850321
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/gpio-rpmsg.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Generic RPMSG GPIO Controller
+
+maintainers:
+  - Shenwei Wang <shenwei.wang@nxp.com>
+
+description:
+  On an AMP platform, some GPIO controllers are exposed by the remote processor
+  through the RPMSG bus. The RPMSG GPIO transport protocol defines the packet
+  structure and communication flow between Linux and the remote firmware. Those
+  controllers are managed via this transport protocol. For more details of the
+  protocol, check the document below.
+  Documentation/driver-api/gpio/gpio-rpmsg.rst
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - fsl,rpmsg-gpio
+          - const: rpmsg-gpio
+      - const: rpmsg-gpio
+
+  reg:
+    description:
+      The reg property represents the index of the GPIO controllers. Since
+      the driver manages controllers on a remote system, this index tells
+      the remote system which controller to operate.
+    maxItems: 1
+
+  "#gpio-cells":
+    const: 2
+
+  gpio-controller: true
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 2
+
+required:
+  - compatible
+  - reg
+  - "#gpio-cells"
+  - "#interrupt-cells"
+
+allOf:
+  - $ref: /schemas/gpio/gpio.yaml#
+
+unevaluatedProperties: false
diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
index ce8ec0119469..88281ffc18ca 100644
--- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
@@ -85,6 +85,34 @@ properties:
       This property is to specify the resource id of the remote processor in SoC
       which supports SCFW
 
+  rpmsg:
+    type: object
+    additionalProperties: false
+    description:
+      Represents the RPMSG bus between Linux and the remote system. Contains
+      a group of RPMSG channel devices running on the bus.
+
+    properties:
+      rpmsg-io-channel:
+        type: object
+        additionalProperties: false
+        properties:
+          '#address-cells':
+            const: 1
+
+          '#size-cells':
+            const: 0
+
+        patternProperties:
+          "gpio@[0-9a-f]+$":
+            type: object
+            $ref: /schemas/gpio/gpio-rpmsg.yaml#
+            unevaluatedProperties: false
+
+        required:
+          - '#address-cells'
+          - '#size-cells'
+
 required:
   - compatible
 
@@ -147,5 +175,30 @@ examples:
                 &mu 3 1>;
       memory-region = <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>, <&rsc_table>;
       syscon = <&src>;
+
+      rpmsg {
+        rpmsg-io-channel {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          gpio@0 {
+            compatible = "rpmsg-gpio";
+            reg = <0>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            #interrupt-cells = <2>;
+            interrupt-controller;
+          };
+
+          gpio@1 {
+            compatible = "rpmsg-gpio";
+            reg = <1>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            #interrupt-cells = <2>;
+            interrupt-controller;
+          };
+        };
+      };
     };
 ...
-- 
2.43.0


