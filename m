Return-Path: <linux-gpio+bounces-18056-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDAB1A72DBA
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Mar 2025 11:26:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 83BD33AE034
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Mar 2025 10:26:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38C3A20F08C;
	Thu, 27 Mar 2025 10:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="mAm50l7o"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013047.outbound.protection.outlook.com [52.101.72.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC80020F062;
	Thu, 27 Mar 2025 10:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743071168; cv=fail; b=dao80SDyJAAmqgKyOxla9k7mX+afP3xwMCUqscRE75u0PtFAReW4BQmxJ1H6Q8EUaiHVVf9+f6ZhhJrviiF5OrmGEXDK5jYBTPNVBd9IQtR608CJrPTvzUwasGSQmALXDA1n1jRIIcUFMOp6ifqER4JGnbMs57cr6KUysfHuvPU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743071168; c=relaxed/simple;
	bh=LNoq7S9B7gMt0W7JUWZmKnJpdgNvKbs+kzrnIe7TshA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rcMne/AwFDgOn+x61PD3J52VxoZBm7AqGvP+aeyIO64QTSHGOOB1DHLekAUke8TMan7Zc+XTnCm9cLKAmiOr6VZRBPHA97fbubUkXy2KCaJvD1AI7ggBJccNljt3Uci/DWQMADfcE0cFUjB0lZZCiFk6Go/RPoZ+4U8UdIKk8ik=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=mAm50l7o; arc=fail smtp.client-ip=52.101.72.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EbRsl0667Ty5qcFg8qNsdx84OdOpHgLQyMUJJ1n7RinSeOF0NkkaXj2wtsOYP77eSh+c2puj73SqiTjmRDNZc30hYkuuDi7bhqjhpyyH2H8inO7xIWJpHgyD2kJHL9IZbr0leeiVwOr+uOA1JPE7RBscWa7+R39+p7dTJtSbBLlnjK2N+WEus1XeVRY0IYgQmLdkSjVr+MyAI/PVPRXeSW5tsXFFHgnD/iR3nmSP9X1bEPSHJXMw3JU4atRF+mvXZ3qmxih/kCEFloGPAfl4hChvBY+6R8WW9NovjtDvJhNujcZQRSIUCk3IKSzQoOE980Oy11inqwiaMtct1wLW4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LNoq7S9B7gMt0W7JUWZmKnJpdgNvKbs+kzrnIe7TshA=;
 b=AohcFXKTYhDuewrJ6XknmUw5KZ5S37wjzFdNgpY15PoJ7537KJmiDrjOPjgFn2V9AKInIFZzxZHpSTAy9zXq9hu+Y0hTsg9ZNbY1xN2KhVMRGvbcMoXfIcy4GZ335FpFtfqoERqlBDxWrxCyy5/JxMzZjp1DN+u5ON0rCcgs5apXz2FBZUKW1erD4UoyUqd/7NfnsvrVF/9680HgF1+gf4Kc/5dCy+t3c9SoWa5SaJLAHk6umeYBgVJYMktQdYXclj5ie8s8LyCOHht77SOSBAMxDRIoMgtSpD4MITvKSb/HAAZJO+p1KkxBKdIu1jzjd1O8ddnc8T53HaS3d50PLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LNoq7S9B7gMt0W7JUWZmKnJpdgNvKbs+kzrnIe7TshA=;
 b=mAm50l7oYo4QisVNXcFUCsu4RINVeed5lqhqB4mEE7D5QcwhaurEuWFUsVqIxhwi53aTDMMkXsp5WFf6OGmmnXMd92O4EUpU0BM+pvVf+0B5ALCFzYeRqLE5JkHYt9YgAX4z+dQWgqsTvGcWlAGL3TzGuzRbjgmBjGs2X2FUtMKdgMaMz8jG2SxyzSQU0yb8+AS5jTwnhgDZ7kl1jahUYnugFCstm+tkt25vC0wgowBQkXp62GTxrGSFJnLZ+6MAqG6scf1HCq4mnZpNRODxyYb8IZ930LJaxX0SKmdxuwwKdkgRR9k3AEnmQ+YMGioyw8gu9rNb3Yz51RiFrRP4PQ==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GV1PR04MB10153.eurprd04.prod.outlook.com (2603:10a6:150:1a4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 10:25:56 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8534.040; Thu, 27 Mar 2025
 10:25:56 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>, "Peng Fan (OSS)"
	<peng.fan@oss.nxp.com>
CC: "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "brgl@bgdev.pl"
	<brgl@bgdev.pl>, "krzk@kernel.org" <krzk@kernel.org>, "lgirdwood@gmail.com"
	<lgirdwood@gmail.com>, "broonie@kernel.org" <broonie@kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
Subject: RE: [PATCH V2 1/2] gpiolib: of: Add polarity quirk for s5m8767
Thread-Topic: [PATCH V2 1/2] gpiolib: of: Add polarity quirk for s5m8767
Thread-Index: AQHbnrJLM4bedCKUU0arWRZyN8XZE7OGxNqAgAACsMA=
Date: Thu, 27 Mar 2025 10:25:56 +0000
Message-ID:
 <PAXPR04MB84596784D16347C84EACC6A688A12@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20250327004945.563765-1-peng.fan@oss.nxp.com>
 <Z-UlL_zpdAvi0UcK@smile.fi.intel.com>
In-Reply-To: <Z-UlL_zpdAvi0UcK@smile.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|GV1PR04MB10153:EE_
x-ms-office365-filtering-correlation-id: 1dee1464-2eef-4c58-c1e2-08dd6d19c2a2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?baRvCpZDhbGnspLDK+B/w1L2AXFPc/10TxhrXFj2nlqHKiYRy8uaB+2n/4P1?=
 =?us-ascii?Q?Khnw0mGxZli3PLW7kwGwOnRct9KVtYI+uWgjGQ58uAbdMHJnXFBL224ul5Bo?=
 =?us-ascii?Q?K+Los1QCbkUhPE+gogjm3pAF2F+6AX2lIBWLy5gsPC7QI94JlMbfcjnvqoQV?=
 =?us-ascii?Q?eluNe1sa9yS+7NC/LvF5Sq2vF1ErAzA+29Mm+/eamO+RJ9YZ7YvUsqM6dqiO?=
 =?us-ascii?Q?3xmZQjblp+gOmjKZyYf3of3tuBiqVyoGAGeKvbyyh1q7MCrV9VhLLRw1oyji?=
 =?us-ascii?Q?Jlxgd+NA3XE+tUV4kFMrKoZo1KHqQ+/FhDYzUcAcGFo9d7zOZsAEVfwq4szb?=
 =?us-ascii?Q?xsGzxDSyM5HsrAlqmK38eG9XMQeyuX5TKSWAl6RKmCOyjgfyhp8k7M+Uvo7M?=
 =?us-ascii?Q?dex+Fjw2KGbG1toT81wCaNuvCFSGhsYLnd6e05iucq97voXy8XqxWLnCL4Et?=
 =?us-ascii?Q?wQZUk9EJYfgA11cVbz0nEAFM6nvYhZ/8qm8AMXdG34QiNPyPn1bHTY0D1vlR?=
 =?us-ascii?Q?DQ2xTg5wt1NQb6c2cMfnd9TyBE0kbgEQAoeCeqht3Zo155HFpkrE1M8oCn5k?=
 =?us-ascii?Q?ErhIHIh0pZACPXfV5CBmrxQ9pUeT35hqgDLIGOcHf0RynOVtTyWgIczWTi7j?=
 =?us-ascii?Q?vO9ZqhIe0Fb/vBVupCafE54FlHIzkoiOcnEp29+85BzGhL8Gefwi+PhDet+K?=
 =?us-ascii?Q?Xa9osm9RYsomY4CMN/j4Id4+ORwwuMF7De3njSCUB7RiGYuCx8K0ewN4cil+?=
 =?us-ascii?Q?rTl9SpB5mbUpO7bAda1kq/xCeuYZCiguUH0OyGM90Ed607cdCnENyYtgJ76N?=
 =?us-ascii?Q?K1QattRZPEb8ucZ4XUs2ye0+oLjiW218APRuLWaGhI8Y/2D37RnRYHpiSaoQ?=
 =?us-ascii?Q?EN9h9tDLuZVoJRzhzNOBKAlnl5TOC52Yx0VNkV5kdHqDEXvw9MY2YdT6mC4A?=
 =?us-ascii?Q?O48USgW7+1CBnluzDRg/XkYdwrLtlFRpLqAAXVlstkdGqftVMcT/adCLLZ9l?=
 =?us-ascii?Q?qO/ck8KqR5pwKhKPXv967+MNO+oiYNF9F/3IZQzvoQAT7BgatITNfHX7/E9d?=
 =?us-ascii?Q?gyDF2X6en1lrO+39gugnC0RPr3IDrM5xmNugJSY+nHa4MXx2RkzqNK0dqjaM?=
 =?us-ascii?Q?ajvfJemcloUESYxqaoCaIOWckiMJO6d/15WBNvnHvcoYFMXylc0uPIl/pQDi?=
 =?us-ascii?Q?/TBqfs29qJqWo94gRzF1dWAJXBCv46SV6Ztv0osVIaKPyN382nyomXkpmxP9?=
 =?us-ascii?Q?1M0dzRMr36A0YQdXKygVwrnx3DZ+I/odZjV7gsQC0MkoLUMsxMBsKX4tDw2f?=
 =?us-ascii?Q?IG2thf+CkxuEaz92cjxXdHt4wKqAy+HvKE4/SMIzsck5OMivUKEvvWPCHz6y?=
 =?us-ascii?Q?62bAvJ8seqS+l68SBysYDnW4xHs2WCcHQYmhZE4xuB4Yr5RezUKuIPynuLae?=
 =?us-ascii?Q?9QUzpJ/ukLeIvTOoTUGm+8eK5knpngk1?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?e+Cxx4OblY1DZ4jarVoRNROcAQYXVxE5N4G0b+3XUQhxo+6nDkmeOju0MyhX?=
 =?us-ascii?Q?4xXyexR5w9PKV4p6kMBlXx29zZ8wJlMxRIni1eLvUC29wA/pLeikxrRsl7Jt?=
 =?us-ascii?Q?PQn0d/xP0WLvgDE3B84TPfoglBZ1b5/X9Yyzye/80egTjBGagtosZTUrFgCg?=
 =?us-ascii?Q?lf8yQY6lQ3qSTaW4R0dw4yFj0G1K7PXtVjB5Y3HwXrK2SvIQWZgrhAtd7luh?=
 =?us-ascii?Q?zwP7MiYnAQFY/U+2UosnH38o8Sn7l5rMZTLM2bryzwuEj4bEPTzMWgY2Zvs9?=
 =?us-ascii?Q?PRrI/6sfR3JnPFpbjXRSEyICTTgHdRt4S3XkcmodwUF6dwkvwXgLZ4/0rBj6?=
 =?us-ascii?Q?LtX6O29WCzU0loRjIFHe4d53pRmNXmQIOQ1zFEM0Dd6YPT5utx+KgzqIOn7q?=
 =?us-ascii?Q?YyhkPODBdXwYjlipU27/VVJDYWCZ2tS4sj9QXGem6OjMC37EKSb5ho+3aOdu?=
 =?us-ascii?Q?cixR35HWLvm0KMu4ytRofSpkj8g+s6VJwmztQriYG4QdXuTucruiKb6zV1Cb?=
 =?us-ascii?Q?C5MPC0MIHFmmnIcCjQN+qNwiePwpVjsQ0yFIwoy4cs7LrTrZmhw6xoYJzpuM?=
 =?us-ascii?Q?cWt/RAKwgxUAbZv4Q4N3IhHM4Z3NUUYuWdQfSHt3g25QLt37LgjPlYWmOivl?=
 =?us-ascii?Q?SehmKMnsO+MIir8zRR3T/XK6i6xQ+6OfhUbkxcRGi0lsFqC8igYJ04b9n841?=
 =?us-ascii?Q?zbXl0nuHxNsb7iWTgCdYopSOwxjFrGpITRDrOjH2elZSWc53Ss+VkUxKJ3zT?=
 =?us-ascii?Q?Myx+ST5/iEY57QRdba/hIvIgTxgNd244wbqSSxAT4GBxT68QohZnXHx8Gn7g?=
 =?us-ascii?Q?Gt6cHZz2UojFXAvGR9dZni58FftVThb6DHenvHRGnJZzBwRjckZXMNFOur2H?=
 =?us-ascii?Q?6KWZ+ze7wc4zrZ8AnlgfDAMe1/sEgKqghErgw9h87lEFWHq3NIuw4SWvVeZ7?=
 =?us-ascii?Q?Cg2bWmWaGbfitLNNpXVqBCWVxqIFyGa/IwW4TBOdBqOCShlBJ7dCpPGvw4+5?=
 =?us-ascii?Q?fIpG3vkG2oSBGcNbKmj+ss1f3jOG+3Nr1Qaa5riJF4BxQdugorx8iTXN9/Td?=
 =?us-ascii?Q?JvlVE94VsdtapUB676BZW/ixWdRnXg4i6bdvPTC/0GyDJ2JTPmp1Nlu/uToW?=
 =?us-ascii?Q?voJUnBVyTsrgVQhCl2Qz6RrbXCOfI10ysPYTb1yQhydNoqiErlRydVIXrpPw?=
 =?us-ascii?Q?YwPk8357Uhe5FCrsknyXc2tcL9k4N6mwUlT1Fi8W1pAhdzqgu47POfzd5ZWr?=
 =?us-ascii?Q?M8Q5aMcs2PIaq/SFp6pmZtTo5XD+92KVI0+MMOQzC3AN7QvKhMPfYaISnxAI?=
 =?us-ascii?Q?V4G0URc9fUJcWGsU+iAunTMeJm+Gkn7qJUzuk3rFZOjNGq59WPOMIxK/R886?=
 =?us-ascii?Q?j6dYyUv7Gntwha4VCPqfQfc1QxVOMHTFEvapo/LRtFjXUq6/fE6+MMpKbLTS?=
 =?us-ascii?Q?2lUVtSq6wsVgsFJnF+rpyO7Kbi1kobbXoXtVlh2IY0iS6yFj2uAD+/RJoqPG?=
 =?us-ascii?Q?ttMRS9spHEt+qjkAqo8wJmI43otmq7OW1EAOUw/bNouDLZgkvVUDoKSC1bgM?=
 =?us-ascii?Q?9tFc3M2Az0ELMZKMKOo=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dee1464-2eef-4c58-c1e2-08dd6d19c2a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2025 10:25:56.3011
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P14IKHuRhTbSoCfNPwlk38b6aZ/zWFm7uHvmnOC3er4fKeEn7F3ua2t6ELNsmyV2pAiN/c7/N6QJu9dFjixcGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10153

> Subject: Re: [PATCH V2 1/2] gpiolib: of: Add polarity quirk for s5m8767
>=20
> On Thu, Mar 27, 2025 at 08:49:44AM +0800, Peng Fan (OSS) wrote:
> >
> > This is prepare patch for switching s5m8767 regulator driver to use
> > GPIO descriptor. DTS for exynos5250 spring incorrectly specifies
> > "active low" polarity for the DVS and DS line. But per datasheet, they
> > are actually active high. So add polarity quirk for it.
>=20
> So, to make this clear: this is simply DTS mistake as driver basically
> ignores the polarity or other flags in it, correct?

Correct.

Regards,
Peng.
>=20
> --
> With Best Regards,
> Andy Shevchenko
>=20


