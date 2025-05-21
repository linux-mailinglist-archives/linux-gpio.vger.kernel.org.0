Return-Path: <linux-gpio+bounces-20392-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E102BABED09
	for <lists+linux-gpio@lfdr.de>; Wed, 21 May 2025 09:29:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C81297A575B
	for <lists+linux-gpio@lfdr.de>; Wed, 21 May 2025 07:28:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28D95235060;
	Wed, 21 May 2025 07:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="YV4/W+oE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2088.outbound.protection.outlook.com [40.107.249.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB0112E5B;
	Wed, 21 May 2025 07:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747812561; cv=fail; b=APZ5VxNSfHRGDQ79tnpFd6gkNekUOulzc69EebfXo3bStkjzyicECpPZVnTVq5Sj4gXajXA2B+NblQ55n1IBe+1M8Zq+W1RFimmDEd31ezVx4koPSTRa5cD01x9duYkX/yXJaE+eG+X64FE6egLW4NC4WiSKep9iwXGQrxJSyuU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747812561; c=relaxed/simple;
	bh=ObzFp8nRFEUvDD9OMTgWvzHKEvqnzc4qEmtgZlfBYlE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qN8gi9u7aBpzvbNBYWvNKI42rZamFexIBZjOpTnqKA6CIi4vVRvsgGRqvLhcJkcWi+b4HXbHXSKkEOtAhYbl/cKY5v92TyEIozxyhhMAJ6WwlxVgpMgggrr+cX+z26e0bVv52y8ytBwlb99w+kVktXDnv4M8jR5n8bwzEALSvFs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=YV4/W+oE; arc=fail smtp.client-ip=40.107.249.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PkE0FOX8QlTGPUg0+kOOBTKNGopKxE3O1W72HnBVrjhehMhPyrMCFmdmKwGEdHs54SyWqDiwhMURyHD0lN0JBQUdbBiR76ML6KvhJ5ysOZmfqBDcykdrhl2qU8CwNav9P47MDC9TNC3fWmpYiVkajmyoRwAtUBa3MFIHVgbXDRM9OZUzhImaDqEB+eM1SH3j47eNjKGlcHUz8v39yDUrgTTRafHuHy5O86XHZ4VnH3cF984Sn5QESJGHbOY6wud895MhpEPuq03d/thsZSIRW9BDMi/2c6HvWexRynA1GJgKrFme//7/6v7wGkzX1Mid4dJtG45oah1MklS3TJrkvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ObzFp8nRFEUvDD9OMTgWvzHKEvqnzc4qEmtgZlfBYlE=;
 b=U9t3tGSREzuNh+28+Iak9ELyt98BPZR8NliaAy+lbAWylbu30+tJQCkxqTBznvwmNqjXt2wNzZo1QQb65XifijaAXFSxs6C2u8w4pywITaOaSOEYlZSq9U0r8P/V/1eBdr9av3NmqV5SkWipxSH53EXRzHQtoXB8W+wf66xWvRKg80f9pdwjjoHmWIgVxnant4Lngy0fYSwfpRr5hnxkGTmdNkRh9ySqu6XnSwa7u5vl2ysLvJFJzqgweV0bttDycoV0iNs3FoyXUHTY7M9JoFJXNl4x2PODlu6QRo5q9XGqVl7SYZIW0zh6pcnWkfSr2A1ptS/ALfpKxxaK3KqSgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ObzFp8nRFEUvDD9OMTgWvzHKEvqnzc4qEmtgZlfBYlE=;
 b=YV4/W+oEZEIOHfTAqg967YT9B1Vhg8goK7qQR6wgJ6QD7EzWd0AHVYeI9vhQ7pS5TREeopzCEqqozjXl24Zwj3ALik+dBbXUR8OyAY5OBmIBLAIzTxMPweu3f73clKSIU0W+lJK86gaf9WyFNxCd6icbT0/UxQe0iV7Fw+62l93X37AFLVuhXDkbiph4PfoDr5pn7rOl6dVCvrWHLWHgvp6D5pdvoYLYrwjVQpyXe0d7/WonsZjakrWbkN892gbbN0rPbZKqT/erEe/Y4Td+ATQmm9tOwUiZkj/04zgSpbQ3GC8OqTjcla3ye5kKyn6T0gH87HHM9KBXMMvK4kUxBw==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM9PR04MB8539.eurprd04.prod.outlook.com (2603:10a6:20b:436::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Wed, 21 May
 2025 07:29:16 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.8722.031; Wed, 21 May 2025
 07:29:16 +0000
From: Peng Fan <peng.fan@nxp.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, "linus.walleij@linaro.org"
	<linus.walleij@linaro.org>, "brgl@bgdev.pl" <brgl@bgdev.pl>
CC: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, kernel test
 robot <lkp@intel.com>
Subject: RE: [PATCH] gpio: davinci: select GPIOLIB_IRQCHIP
Thread-Topic: [PATCH] gpio: davinci: select GPIOLIB_IRQCHIP
Thread-Index: AQHbyiEjEl7a/CI4dUeAWBDO4NdhhbPcr9kg
Date: Wed, 21 May 2025 07:29:16 +0000
Message-ID:
 <PAXPR04MB84592BA061B3F981B3E76F69889EA@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20250521072048.1053190-1-peng.fan@oss.nxp.com>
In-Reply-To: <20250521072048.1053190-1-peng.fan@oss.nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|AM9PR04MB8539:EE_
x-ms-office365-filtering-correlation-id: e959e62c-4dfc-4502-9b31-08dd9839316f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?LLS/rSSAEXIMgy0hFhUShZobeTpdsCF6nIgaGSmpxSe+pLAkg3GzDYdd9so4?=
 =?us-ascii?Q?NIDYSwidHJjrWq+m05rdwiW/sAuLlkOlai+zrc5HdV8fvlMd61awJra9oAkk?=
 =?us-ascii?Q?dPJQqgXvyFhWw+7dADDI683PagTXai9ScgZAtSDikmiEOg8fQCX5txQo4JYF?=
 =?us-ascii?Q?tc9yyIKhvgPj7p5SGmguOsHEeHB9/y+17+JOQh35X/IVho+sPqgA33MX8fsV?=
 =?us-ascii?Q?cEdChWZ59+0pHt/crkrwCH1fcun7k6bhY1SF2vdm1HL7g+0s+CJboo/Bc0ht?=
 =?us-ascii?Q?9cmtTImugMtp+eujsdlzq5F+98muImRfpBuDeDPSYmWc9vYC6vIeGyVEv6Sk?=
 =?us-ascii?Q?21IqFXjGDy1Ux2L2bnHripqcbp+4ooUQlmtQhHhHidkKNky8kU641inwucU9?=
 =?us-ascii?Q?q97LrKpH4exvmzwhUvJdoE+IgF6KSgWsh3zBg7g593x1bOI34SvwNpfIxoR0?=
 =?us-ascii?Q?82GUIXZ93VbWXDZYR55uGkYINSbmNbK9IKnFNAgPRwCYtnX2yUSFJ/5Pq2fu?=
 =?us-ascii?Q?GkBGBKP6CrGWN8HZjcWrJvqGz2zScwESJRTSMlrkZe+8pnG0D040FNjM5qec?=
 =?us-ascii?Q?a1CPZGDs3oC5T2lzgI3pUCFdNeXzo5EDsRb5LWXrICRMjfHc7WHU57x0+yPa?=
 =?us-ascii?Q?GJ5aJd5LtJj07bGJnDFIgLydC/fnnsKpbeVCAe4U/eVnuHiZoewGrdyhqm0R?=
 =?us-ascii?Q?t5E5G4Y91rwpsvqT2Rx1iTP5jdtD4wOpzZDVuQXCQTE2anSsrva0JOuQqs3B?=
 =?us-ascii?Q?jaN6RrLB9Ouj/6jW+DN9srV3eG388bDn04nZ+Er77vbR+uk55kGihoyBI1hD?=
 =?us-ascii?Q?fBseOOAGE1AjNmWqUDkouJXpuZDWo6M6Od+QrgdB30CSudW/znRI87hL2qVn?=
 =?us-ascii?Q?xsxB4OVofZunESArtA/0ZzjK9r3YLiZ6la8Bov3yORq1VYV+MfuojGiLlIKn?=
 =?us-ascii?Q?LPG1nUQwG266axHUiqacwcXFexbm1t0Ggj6fcGrs/lNv8HVTpMMNNK5fwHw1?=
 =?us-ascii?Q?taUtasQjsTJLmy5wD0PA3oo2u6tA/ZgzyrSXIqeGgmmBD7aI/cdMwNR3iibx?=
 =?us-ascii?Q?V98yEpjJRgpMxenVB/I1IH1J5xQ2QYFp8zsyfiPLna+0euu39zAY3KvuIutt?=
 =?us-ascii?Q?eDGBcZomv7JHtsyKrkdAVQaa8qI9buPXFG6rYF751Un0uSV212+EB+eqfn0J?=
 =?us-ascii?Q?J4EuBXujkBHOob7TKlOx7DjikEU+GDrZ60H/46DSXfpSfnoX0cJv4ICRAPCe?=
 =?us-ascii?Q?wfku+KeCwtMSAi9mjos00a1Ru+UPK42vW1pscvw0+8Ky4KBeZoH+WHx3W2FS?=
 =?us-ascii?Q?n6996Mnx40HpzRrSsAIHuMlzKBT/TVSecRRwsR0Q5qacJ1eapbwOxCe4SEnw?=
 =?us-ascii?Q?PKiXRxHdwhuNCnYUT4BTOyhuflZDyxP9PFwFgnPXZ0Z1DaBk5eT1Pgvv7ZG6?=
 =?us-ascii?Q?9qubISWHoRQ=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?P8FfUblRj5WsV7R2LPFVMyne/QmavKcktmrHH/XjCjQZzxpHHDnZwqKDWtD/?=
 =?us-ascii?Q?Mu+/8fL3/kG/pP1XPHCIwBCYye7wSzqaM314YH3MTrZjKGHRQUJl7nJWFpv6?=
 =?us-ascii?Q?FYRZYcNuS2t/Ukhtj3x5dRL8H8luEcpbU0fOqSyT3nspwWynT2Dgfjjr8uI4?=
 =?us-ascii?Q?6g68Tgh2ohJAjWx/EkIgxRVIpXNeB1A/sgg7tzl54giEuPRr1/Klof3iAO8B?=
 =?us-ascii?Q?zd6G9tR6oNQkSM9RMJBL0cm3ynUsXax8KHomqSynhcvB6hTY2Jx5Qe82i+R7?=
 =?us-ascii?Q?F4ymF6MvkQxzUJlbqcHDEgsD2xP1cEE+Uh0UsmD0QAwXV3LekIDlFdXkDKGA?=
 =?us-ascii?Q?311G7SX40yEklwDlzaQ2NCkNpsEOe0J7Ak5GVIIX/qWb5SaViJpTBVaDHsHF?=
 =?us-ascii?Q?lnaOLaHuBMJk/C+VOeI7jo9z5QBPjBubOZWsLQquptBW7A9OMR6OviQDnoLK?=
 =?us-ascii?Q?jS1NrDGczgv+u122xlgK2925McDDAquxlAkD9kfosJKHNgbd21xs/Y764lYR?=
 =?us-ascii?Q?exMY+glSY8/1Ok2tGkdj7sIEJHXUFCGbU5xsKjWedPJQPz8R1hjGx4Jq5Z/j?=
 =?us-ascii?Q?BVwQMruNLNav+wC2xLdHXtAPY8A6/7alBmwU0m5dteb2vc7hqoAigZj5OpSQ?=
 =?us-ascii?Q?wTyMSrLoLb97VeEZMuia7WUOv3w75aK6XYiRSy8H+C1Q29mO80kBefoD9EtI?=
 =?us-ascii?Q?XR3UM2xi7m6GHUblIJY+Yg0lbVdRKGwtqaeMoFWDtUrnk8dYNJs/CZcEaPbc?=
 =?us-ascii?Q?DNxfHuofdRpUXWJYuDjHaKC95UgS63eoYhcIgexhFnFYdy2aFcjooJv39Er6?=
 =?us-ascii?Q?pvu8DrAP9YdDU2jeXjq9eNc7IOK/A+gvSxu0WvcfImvKD6ViZB3wKTLQOqxv?=
 =?us-ascii?Q?kIgNuCOSTZ058SPH3h259OL8JD/nd80YFjArd5AcHuRj136mRhSgckdP2c6c?=
 =?us-ascii?Q?osbWS+n3WztrcFd5d79sJTwwXF09OeHtyap/i2X9wyc8TGG92z4Ar9yWZmrX?=
 =?us-ascii?Q?7rSDz+6RleswdhLpZOE1327pp9CzxN6Ay7XzqcFpDlUhXgUTU1x+aZTOKiPd?=
 =?us-ascii?Q?yU8WFYjUFZojG+QvxgM3qznEJy+CWCYOzCKKvcus+NOlSyT2ESuJTBRzQmDH?=
 =?us-ascii?Q?ZNgQbCnaXv/W98DujYr0O5+qKrmzMBEFICmJgQMMPxaLt31B7cxRnjGcJk5j?=
 =?us-ascii?Q?2Dl3i7/NV6QF7UI+tX2cr25E9Iv6ZXz5m+jB72CZMpsjuHmt4ZvcWS3nOUWe?=
 =?us-ascii?Q?KVV9Z0BxErW7avKU/hrI8KZvLQHVurDza13lSQipyIVNhprhbGp4emsUw+O5?=
 =?us-ascii?Q?ukLB0EH34umYvJf3tcsCdzSE8sa0VoF1P78vLei28HviEVT83+Q7Nvg2/jHm?=
 =?us-ascii?Q?P+On73m+l/SGC04KJnp7dpP7vXU2E2hMCJ6XjwABSlrvQtM20Maur1Mfgudf?=
 =?us-ascii?Q?wbQhaNcv9i2a2ujDS1vXUMOhNyab0RDfGd31jxAxYv9/PKa10LFS7cc+A4Z8?=
 =?us-ascii?Q?e5oSyuDFGNNGc/nb+dHjQSSwccrrf49GpVoThAQQL6ykpHerGc95zl/j6/g+?=
 =?us-ascii?Q?VJuS8ke1AK3l8at9znE=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e959e62c-4dfc-4502-9b31-08dd9839316f
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2025 07:29:16.6263
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 93Zi7w4U0vQR/eGL3UQYgcpnBUnfzUQoGjfPBNSYHJGZbBr5wdbGpfOuZINgKN4yu8N8jTu5McVCEZab8ccnVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8539

> Subject: [PATCH] gpio: davinci: select GPIOLIB_IRQCHIP
>=20
> From: Peng Fan <peng.fan@nxp.com>
>=20
> This driver uses gpiochip_irq_reqres() and gpiochip_irq_relres() which
> are only built with GPIOLIB_IRQCHIP=3Dy. Add the missing Kconfig select.
>=20
> Fixes: 3f50bb3124d7 ("gpio: davinci: Make irq_chip immutable")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-
> all/202505210606.PudPm5pC-lkp@intel.com/
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Drop this patch.=20

Bartosz had a fix.

Thanks,
Peng.

