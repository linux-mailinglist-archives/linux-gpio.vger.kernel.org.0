Return-Path: <linux-gpio+bounces-17718-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 325CCA66C2F
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Mar 2025 08:41:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 555F1170287
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Mar 2025 07:40:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A6E11B81C1;
	Tue, 18 Mar 2025 07:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="h6D+VRqc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2053.outbound.protection.outlook.com [40.107.105.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558211917F1
	for <linux-gpio@vger.kernel.org>; Tue, 18 Mar 2025 07:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742283484; cv=fail; b=uv67++Y2xxYnrkwXKcr+F7MmHtKdALyUXge5gpQNSccmuZBPizXmvoC8VbzheGFdmrcSqJcJNbSkPWnuGi7ybW0yPJo+zj7YzCgg4E2N6ZonRxBp+uqTCZzUiscQPd1mfQ+vBw9d/9TbIKvgB5V+GsGd3PDotZATE/IaoONsl+E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742283484; c=relaxed/simple;
	bh=Qsd13Ec8ZCdM/aJic1KougqaQr5LNgpXb3ZTEQ7+a9c=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=LK5Qz+3Mfm86zeQzKDuWmacgv08tI+wT4i8TYifH7xeqFsNcQ5nIoteVAWMM2lpkTNEiQ18jTd5gAhRWCQ/aMSSRv9gUUd5Z3ee5jm7FFCM+gFEomUzlQerescMRA8syDTXdNBQ3GYdyPzou03E1D9iyNF66iTky1RO4XynvHns=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=h6D+VRqc; arc=fail smtp.client-ip=40.107.105.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UVMCgJs9nXZwlw2IFGBc3Xyv16SMs0YJ2uqSr+mnx7kGRFC8z2gJID9EwyaxVmqInT6OtRu5uYZF1iMFouYkiUGF2iLxdGyB/lryexOA8HsDauGB+cgfcJMtaCgeCKpqcMpsoYYeUWSXDXcwTo1AGRhOM1Eamo334o+UcupnC6qLcX22/ZyXh45aDLvyy4vHCiiKi4DTZyZg74mCSn6TJxKW64/1ejNzeP2jk1IR0/2AhTLmDBtn7CX7B2OuQsxFpS98hedk1moLwxKbNSYVk1FEtwqbfXFJ16WohdTAA35Eb5PEI9Fxg+cdqVC177uMTqm0Df16tZ7Gp6RCW2jG2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qsd13Ec8ZCdM/aJic1KougqaQr5LNgpXb3ZTEQ7+a9c=;
 b=wUDH8eXED/gPR4xHJud0/ByW310pVN66bCultlvcfjic+cDi3hDnlJXe4+jdGmK4HtGyXx9Z7TotYDi12EtTbt2rWboGWB5k1UQA9STZRBseUHEPjVAF+brzQz4GiBnQwBfkFWlXM8GIR9309e6AiXooOJAIN3xSRhVE8o2xJGH9l21quivrIZHeey6UbmwgrjuXf/QnZgJnpskvW6DOmWcpwxzJhpngYiW55qGUo+8jLR9WWnomzMytGJ4xldWvGH2J/CMIdrCsMj5gIUkBzYrcvbJyMTtq0cDxkgMk0OxYDQgghQcxDnOfVmnmeTTbMjmXv4errEFfZNn1GNKRSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qsd13Ec8ZCdM/aJic1KougqaQr5LNgpXb3ZTEQ7+a9c=;
 b=h6D+VRqcFWfrmOOvdy74UoyjkUygBYWTDTb9iFOlrnYTeUB34HORIdD5XzCt4h5yBpVdUYKktQUW5dwCh9eDCPaHmSMe7TJCg6KCJnk7yFZaxO8GHzzCR5uP9t7cHCUTzV4EWj5JGBzaS/gSNWcRhxTvvojWNccw+MzEddC9cHXXyoZCzTUKh4QUCiGam5NzNLEQa2/5wk+0IfPdlSrvSW7udA3cBO37oWyb5GA7liqYegZbgIHIoYm3DnNBIlj1pCTzZ0WaBvLV4M3iRuocT/d5ZztJAcJnLnS/tISEyEReBZUvzm0heJ25klS3+aNnrgSMwKzunaiy9oUVkHPbKg==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB8994.eurprd04.prod.outlook.com (2603:10a6:20b:42d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Tue, 18 Mar
 2025 07:37:59 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.8534.031; Tue, 18 Mar 2025
 07:37:59 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Linus W <linus.walleij@linaro.org>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>, "brgl@bgdev.pl" <brgl@bgdev.pl>
CC: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: GPIO TODO
Thread-Topic: GPIO TODO
Thread-Index: AduX2JVnMdEdC/ApTkOWXjYXYxLUeA==
Date: Tue, 18 Mar 2025 07:37:59 +0000
Message-ID:
 <PAXPR04MB8459BEB700FB66FE693EF1CF88DE2@PAXPR04MB8459.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|AS8PR04MB8994:EE_
x-ms-office365-filtering-correlation-id: 2cb6739d-6d60-45ce-a134-08dd65efcec8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?3TQMReapTgBjM01dd+a2sSroag7hSRcQaYPUmv5VLpqQYXorEd0XRrxczW4k?=
 =?us-ascii?Q?u6ULen8aeTgXuvrGLYJh+Sw+y/ZR0KZRXdkdz32DxVHyl9OEPZ6Amu6Ti9Us?=
 =?us-ascii?Q?orkEYVnGzB641P21x3KpNruH1jh6bxu9rU208eG0EViM/+eTQOwD06zqrSfR?=
 =?us-ascii?Q?ioFYqJ9w9haIZux94Kd5je/T3kCO1cX936AggygLPbyx/xMmOO/z3q8hlWBr?=
 =?us-ascii?Q?G7waV6PSG/AnjzfkvForvLeusdN9bAMQjEEesgNR1o16rEy0g+rEUWQHe05l?=
 =?us-ascii?Q?b91O0PDlJSzfnIySKlSHY2UN9GUviyQtJQaHyWI0Zf2EAadIhFf2lOcuSJec?=
 =?us-ascii?Q?JU6kUAB+4GKuO5WJPiAQZIkBmfeLhbimBouvVOMCaivr1Gy8p75oZWhlcZEB?=
 =?us-ascii?Q?hrmfZI4czEOKaFBSILXvY21XNr3hGvOxBivMY+OAGUSJydSYhjTy5sOVVAyT?=
 =?us-ascii?Q?Ai07hV/mgAUfYTwJAxHmb0TgfhAbPI5wow/I9R+wvlc1JQDalY8h9EWElfxX?=
 =?us-ascii?Q?7tQvYdxnpcoOjiSwMWYfaUbk6WpS7YQA4F3Ldl7LB6eu38qqD9/iVUS+wS/s?=
 =?us-ascii?Q?nOMIG0LjCgqU7bAwvd+5IUKtXE8kBHHb8C6g4ZCjt4NIV56dKuXAi9p947Cf?=
 =?us-ascii?Q?VhEIVgnsKX+74KKd4db35t1d0sZNQKKTo5R7LFYPz17OeiPYvImBQHlkJ8bm?=
 =?us-ascii?Q?ISzkb8+CGhT2NIDC4rLazEfWdS72lTaFZLCTYubLadEeLU91cKa2C+wSNO+i?=
 =?us-ascii?Q?+xtRGTlptZiqFZP7PPXk7O7s0lii4EoQKVSQbeocBtJ++W6ApZbiGl4DOkht?=
 =?us-ascii?Q?kXK/HpN8XzJUB29nki2+amX/aojFzrQdH5SuhR6N/91tymHsyuaO+ZeDdP7s?=
 =?us-ascii?Q?ZR0U4tJjYWGB7lOO77cA9+MQWm1Eebu/+N0YO8IEFODhMjjsbhzeakbK2dFp?=
 =?us-ascii?Q?M5D2cM8HdOWi+AoeWsnBbH41MPd5xFwyHcD19BKwJc11jJ2XWuO+knQLqjSc?=
 =?us-ascii?Q?ER2Fq6Vg7772eQzBgt+c2K/Qugv30JvSAg/3h2da2H2JZWfNU+NyulX8P6Vy?=
 =?us-ascii?Q?vOUHXiDPxa6h2VMlhuVK4dcCXz/DcC/xS7uH7r7r4Fp2e4Y1m9h7PjYfSu+q?=
 =?us-ascii?Q?Sbw5M/7JD8PsbbMxLdY6yQ9/KrqAufnmOfkxeiOOQwQ7HQCBbDqpp5bwryIn?=
 =?us-ascii?Q?02cM4rNkbkFXl+vL4cHfzFTlAUrOIKJ2aHdR1LHkN76ovF5KQIFvVLC4i5xt?=
 =?us-ascii?Q?cFUwL49LUznOrEiqMkN7ushFv28bkWlH3OPsIwYf90JHJMIbFctjQ2LAG/Z2?=
 =?us-ascii?Q?zrWJyPxCxYxPMPY8XcwcoZCVil1finRQGTM2e3TF1jt124/19M0wOb6uUQhQ?=
 =?us-ascii?Q?GF3/YV4z6LzTMcibDR+D7EoNLBQJDQDiaDdj8V90NAvDwRsLonDn63e+3hr9?=
 =?us-ascii?Q?nHP7PKIIINk=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?SCVWwF2qVNt7XW5ct4oU4l+YlEBUKHisUurZqZjla6ZJwlq9Vj8xgo/QTKYL?=
 =?us-ascii?Q?O3SXD4B+SA7mTAaI5IOEn1uUbFPmT2LXtDGL9+1NzGe4Wdp0URODJcPjd+xc?=
 =?us-ascii?Q?NylntjSxY4cJPaH+5vOuYTFJKFQvnhz9HxRo8fgpwyGqhVjvrpzIAYP/oKs7?=
 =?us-ascii?Q?Y7JfHxHauK2qx9BEDXByAK5XmakTUJ5ZdpeQoBVV12H5OxNK/Y0zgIqnrR7g?=
 =?us-ascii?Q?oK8rxZPZoDSj/nbVg6t6MDCGcHUDRGfLCkAsZcmfVrrO2srjo08DjLjbF7s2?=
 =?us-ascii?Q?7iVFA8b1a3AKUu15JxOTXhwuxwmFyfsT1PkPW9dY83ON4mrF5e6fjoEFMIs9?=
 =?us-ascii?Q?+G+taWdLqOu1iWoVUz02blcRvoYnaMjp0e9PxZMGOSoPiilUUluy3Y2M/VRX?=
 =?us-ascii?Q?1B5jlX+11wHQBq8zhVqdIsHTBs9tI3eeQKzG3CkTtDyvMI/lDobIlZgxzPPQ?=
 =?us-ascii?Q?zEVUhgchxVtuioHWItmYY2Cn9irV01jC2uc5iwZxd6ii5CtqTN7XczTXZ1nt?=
 =?us-ascii?Q?QeCrRQVbvrTDqT+dvmFqTl5qmxRYmjA1JApJxGq1clO8fy9QrixA7b2R0Yyo?=
 =?us-ascii?Q?IEGGi5GoHdQHuIoEkHd9z58rn6GWcmbKceyk6U62ytx54+EnS6U5ujVRz19w?=
 =?us-ascii?Q?SPoFxd4P49TGIJgADwuAWXYgWVyENnsp0vjPzj3VlLRDq9KHax1tyoZuStpq?=
 =?us-ascii?Q?ElOuyEVQ2GOWMHIDz56RJXrylvIkEoa9IJpnn9bLhJR/oYwK8kD9//wuZUPN?=
 =?us-ascii?Q?VCE1lV0B0GEgrFBud8c6A+xDJ09LJIuAnJjXzGMhELfmIryU9G8kOkMwpOCL?=
 =?us-ascii?Q?2WaiKdj7F3+aQjjzWHRrz7/HyuN/T52hmb2NVtKxEfXkpDMiNcE83fcW+QXu?=
 =?us-ascii?Q?b6AhURU0zyzdsYCvDt8mllfJI2M2ms22RsoS/RhP6v31sgr+doer1060H0II?=
 =?us-ascii?Q?RzD+MpJRbyFfVnEPVshQtVcWdzK4PzzZgf2o8BVNoPq8G3Zqce9AwMRPVDMp?=
 =?us-ascii?Q?CvAORh9zGqwnmHN/W12QMs1ewox0SxlCNylcMjHUqgOEvYBfusUeVLolM8zU?=
 =?us-ascii?Q?FpHgtEfdGB0gV/0rG47Bp965OL082KSOogtL96Qb6PinoJBqkPxBJ5VKLhQM?=
 =?us-ascii?Q?8v7b44s7aCCFfmS62rbDs/Q91e+6+wROukPQgWcGRaJ14Ja+x8zhkXuL8/Oo?=
 =?us-ascii?Q?KqSV0AhXbiwik23UuY/hNLtdbuDR39KcCSEBLjh2pO8cy3HPEmN4rQuTS6An?=
 =?us-ascii?Q?NnLrHqSl1rG1bUcBnGZYeoexsqFKiRSY2t8tnuxJxqXuzcBF1coIX93+ARsu?=
 =?us-ascii?Q?mZreIzcTx74S36nrgy1T5YpoLdNOTSMUG9qeb0YDLPHytzmpnBzigylL3pA0?=
 =?us-ascii?Q?myxNoYEmtaQxeCN/jHh3Kfh5rVghALGuGrfmP+wYzeTMBm0RfwNp7aha5pdn?=
 =?us-ascii?Q?YNNQZCE984PiQcGN+Jxxjz6TVBwKEhXky+7imnuMSPCxilYi7+Y3g8iBjIy5?=
 =?us-ascii?Q?DqTlYHijDbZac2GgfSL2CqV12caPb/LtRculRwc8+vng0vlYhwG/zcWMoIwb?=
 =?us-ascii?Q?r6MfzUb+z76weITW9rQ=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cb6739d-6d60-45ce-a134-08dd65efcec8
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2025 07:37:59.7182
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0EeGSYNY3anZK+8oINY1CgkAdYcon1813f62DFdvpXi6pJsRY7psqQgvKLan98jlFLQUHUUpyDMs8X9RplYn6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8994

Hi All,

I did two patches to drop of_gpio.h for=20
drivers/spi/spi-stm32-ospi.c and drivers/regulator/s5m8767.c.
But when I search lore.kernel.org, I see Andy did some
work on the cleanup, hope there is no duplication with your
work, and I wonder do you plan to cleanup the remaining
ones under drivers/net/ drivers/nfc sound/ ?

Besides the of_gpio.h, anyone working on immutable
irq_chip?

Thanks,
Peng

