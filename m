Return-Path: <linux-gpio+bounces-20391-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 936CEABED07
	for <lists+linux-gpio@lfdr.de>; Wed, 21 May 2025 09:27:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 24DB37B3603
	for <lists+linux-gpio@lfdr.de>; Wed, 21 May 2025 07:26:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2F6123505F;
	Wed, 21 May 2025 07:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="UcF+kmbc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013057.outbound.protection.outlook.com [40.107.162.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99FD712E5B;
	Wed, 21 May 2025 07:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747812469; cv=fail; b=UAZWr9bLn0yWds5pPdlm9g7ARylXvnRDQTkv/Nxg47FlAs7r7zvxSPDsLOmrhA+KWyx9ta3+Vbxwy635EnB7OaZq2AtdxNtTEfkcFKVlTxyC5+HQviuWc6DoCh+8qTRES9kK4U4WmO/PJBE/cPXneALJYL+0P1+KbA7Vf4WL6P0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747812469; c=relaxed/simple;
	bh=fFhiqFMAnjhjvMNolCN2gI0IMw4/7jQAVktEedevIxs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=o9zVfUE6FLmTyrc8WJFvkjQkvAeJ8T68VjDN5N8lHbEfkMi228pqSJMoiBI4MiSbOrvwMzyDF8YEGsiTopK+5sR86Wu0bMSHyNLaWOua2AetvCwAEfoeOmnGvnJSNR5JdYdyXCHO7iB0bA1Wjile6TDtvRvL759IKxk4EKQl77U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=UcF+kmbc; arc=fail smtp.client-ip=40.107.162.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yAOdlhSeTA88Ko6VrpBu90AGWIcDgwZHqmAFh8/gU/eZliUvLkYU/2qOBfDt9ljDNnMJ5GeaxVJK+qVwBYtWVAvmXvVCDL/2Ajg3bFv2c6qf/e6tKctneyQNWTtaXkHaFIwpvgFMg57mmxcesflyfxK/7U84OkAFccHOmwomT3/W+n9w91Bt22++Vy4jbgPDTiEHGjjL5bZEcCmB1YYPFmp8nAW8NN+Tm4nPbXBemAP47wuvFo69aRKpVKKnmcczU0kIPz8vyfD7lMiH1YZXflEyMOaMc8hzGechzxcxwF+GFGq2dvRRS92S9LMfIRAkvEiOzkpnonEZjv7BlJ/zCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DD95awy/KvXazT22MDFw8F/e1yh3VX/4u4b0//7sMPM=;
 b=I5mb54lvAhM3vCo6fVd1RLmgiSKTVlKPCJNOfC+mRE28r9IEj+ySu2EkdRZq04rVwZ5QdNAlgMfsgJXfxVUEjAR9us0qil9x7i9QuXKd1S+KwXEdGYVuVjL7gq7GGhFCbsDZ9VrFJFND9GV427Lghxfji6fNFOpdFLw6Eu0GPAHQsQm3M04tnWkpOuoT07+n/Qzm4lHoGFbcxgx5o1xonBcur8n/Qc571Nvw8HM45XTN8FQ9eUqSI3DdmrrBLOP96TLaM4HNe7ywgKQjVulyLYKONMDy4P0rbeKq+FEfloKTRodLf9PYvIAESYc5aDY6avA1WWvB6zhRTq2bUXFw9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DD95awy/KvXazT22MDFw8F/e1yh3VX/4u4b0//7sMPM=;
 b=UcF+kmbc3A1KBsIhgDbDlQllHS+4f7kOC8NJ1Cydlesoju/5d3CEOdD+Q0zDobJffPKzeq4cSL7yU90zicYTVK1P2TWXZWNwDm7OT4dFNnYbRaiRjBLq7Psr/2joHCU34wDCusRUBvaLIOP8pypuHOqsKPuEPlTJ09bxodD8x4M+zdlhuszs80vITF/hgzPblqfAcyfhyr4WPrraZZxccdZRy9pzBizTkOXQ6sk5/e6+TvgbCzxUDg5mUQnbjF9+qtnW5dth3eo3H519A0oV2Ldb1h0byapGR/rQWuMUqn73v9o6UUtU7msTl5F7qCK605UqYVY/0LolhULNYveUuA==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU2PR04MB8775.eurprd04.prod.outlook.com (2603:10a6:10:2e2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Wed, 21 May
 2025 07:27:42 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.8722.031; Wed, 21 May 2025
 07:27:42 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij
	<linus.walleij@linaro.org>
CC: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Bartosz
 Golaszewski <bartosz.golaszewski@linaro.org>, kernel test robot
	<lkp@intel.com>
Subject: RE: [PATCH] gpio: davinci: select GPIOLIB_IRQCHIP
Thread-Topic: [PATCH] gpio: davinci: select GPIOLIB_IRQCHIP
Thread-Index: AQHbyiFiAXGIjXNaiEKSziOE+hKW37PcrwSA
Date: Wed, 21 May 2025 07:27:41 +0000
Message-ID:
 <PAXPR04MB8459CE5696113684FF076D12889EA@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20250521072416.57505-1-brgl@bgdev.pl>
In-Reply-To: <20250521072416.57505-1-brgl@bgdev.pl>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|DU2PR04MB8775:EE_
x-ms-office365-filtering-correlation-id: 83eea6e9-cd2e-4aa0-5e99-08dd9838f925
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?G0ZtS29FqArNC0sxbTA92SNdkcjdIlaFZIH2K3TbGQeNy/DTvc6bszxPKMsG?=
 =?us-ascii?Q?bCty0BoNpq7YuGL0xJ6oCDZChe5rqox2Wy4RJHQOeYbk4mGJJS+HRH/IiJjh?=
 =?us-ascii?Q?B2wyzXyTKp6ZAJzx71gi49cdh++Nm10e2N/BPsWwxGuwBwcSl8teAEN7EJ3+?=
 =?us-ascii?Q?Y95UX/LYJnB7Ldvhe456hvr0bfe5qlq9FvaB3NX2s0rOg3foOtMRH2WVtNO7?=
 =?us-ascii?Q?WN9R6SJ+dkkznowRHtMpIe5VolKScQ1z2veS/qk0EIx7xN7ToxImX8xzo1kF?=
 =?us-ascii?Q?2PRGItG4kk9FmX74MxmOtL7Jijbogen01HA8wrVLxGoN6lPix5E6vbR8ebnZ?=
 =?us-ascii?Q?gyEiAACIJHhFqFHR4nSoS/7lKF7dn+AoxO52mbQ98jv8PqIedL+r+0BJHxAW?=
 =?us-ascii?Q?bRbZ2rqO8iETMHmypFCfGVeXQRAgUZiXp1qfWGKh3We3W7Auy68TyDnMzsgE?=
 =?us-ascii?Q?tNHP3ZugmRn61uztlY/BDHT6mFt8jM7SwYfeXB/db4cx90yvscg32ZxNB7Cd?=
 =?us-ascii?Q?sEm3B6Ly6JkChI4yVpnKren15r13awm+48FSLmo7V9HX83WyUmJ9Nh5vV1AD?=
 =?us-ascii?Q?Rzf7M824rkT41VJ6NCdqQseMcPbXSl1nmH96aq2Pii0uV6OK/gN8M8RSkqzY?=
 =?us-ascii?Q?sRks1X7hwZ2bC2lTvDkLqQpILs8/n8LhEM/m1vnj2a5GuNWHun7Jte9qQIvf?=
 =?us-ascii?Q?e0bJ6XFG29QgXGD6WSmcInUPn9NAU/CX/SUFgOVZ8M2StHZuQjgSOA/OglJJ?=
 =?us-ascii?Q?WqgjQ0N0qblnhGmSbOhcdlEEdLb8SdJuSSaC9vBOnDcfjB/s1r0jZtocLNGC?=
 =?us-ascii?Q?HvoznW1VVu44wRKuhoTs6zs34+B6EJVw/iLCZm0XYR31tlvWBYA6JNOO3AKc?=
 =?us-ascii?Q?+AiBL/v2v/zmWn2mjcki+juJZWV6VhNbyHzYQ5PQxVQeiGLr9036NCrnlAM2?=
 =?us-ascii?Q?qxBoOEl20UGJobXWHiimzHqYVRN51EyX2HKxQh8omp7CSzqO1RsPFXU0jfdt?=
 =?us-ascii?Q?SpJnKUwC7hNDoGTuTlsvsmjmr+cANtYtw/ObNk2kn/BC7rT8eye67iMHpbQk?=
 =?us-ascii?Q?s0QxL5f0MtUKWt6gE1D2LYbQ7r6ukFT2yrwbW7zcON61VHQ2fosPSg8+qe5D?=
 =?us-ascii?Q?WT5do1P28Jg47aaotBrjticlhUXtYqS63mpNvZx7A7YmieqzRCAzZitUBpws?=
 =?us-ascii?Q?MlGpX/9WSeoS5PLpNPNAlE/ZEFONIu16MgzsZCNWkNCVEV64AjJAUqW/Jk5H?=
 =?us-ascii?Q?7JK3a7SePittbMaMY7l+Lv3UOk/FCIJ+myyAzWFZGylOrhAxSgpKERfLKTp1?=
 =?us-ascii?Q?8UjPSvcfqCzZWrCJbPQNlmvb99ElumN/L9nhu9WaCu8la8J9QgK9YJ9WpFh5?=
 =?us-ascii?Q?FJDcfGS+GjJPjEWKxQYqRpeTlgDpIbC2VG2bfft68WIah9y2YCQ4B2rnWHT1?=
 =?us-ascii?Q?1UFwB2LqUbk=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?RkZh8xxyafDCtD76TcE1GoXWlgkgd/pSR/JFiML3JhoWw780Jh9Q+HguzrMb?=
 =?us-ascii?Q?5UaZAN9+q0ARErqYT/oCh4+1S3BB5L0N05l37r9HoVqQ0TLVivxurfu1Y97q?=
 =?us-ascii?Q?EDGMOnLIKcklPXpwl0vpsZ4kO00+DdpgVp4LT2ARothBkFGrG+0Vd7+BlCSe?=
 =?us-ascii?Q?MUjqo1peawYSDrdjGldZbFE4m9mn86z5DO5RoLlugcoK5xq+xD24FHWDkf5c?=
 =?us-ascii?Q?zE2o2xQX0SiKFNT39B+GqEYh4OflSPe5V1jyY0NtxIkW0tVv3z8rO5w3yqA5?=
 =?us-ascii?Q?/zowrgM0Pr5ch+/y2bMs7EkUHvrnMOebgXoM1w6xee+JGTU7jzoeBemMz9Kf?=
 =?us-ascii?Q?vUOVvX3JDyw/egujOYvtJjOXkUfkAqk4u2FM5Kjn+MhJbHQPbr0Q5Rs8mcOF?=
 =?us-ascii?Q?OdZ8gyRp5JfWB4NDDjzx8j2bOPh3jIqfFN1By1iNjg6r9u4OMfVb99MQRS4r?=
 =?us-ascii?Q?oONIdCraklG+WibXrXgzrBibitMZMdlZuoQYGB507L/UfPNOim41CHASyimg?=
 =?us-ascii?Q?cEUF6U5sVFNXtJNvycd8vq9CvfgEULtxgqAbsB25tIpm0FDynSHlMKb13LqR?=
 =?us-ascii?Q?Lhsq5RBk7J8ggTcYq28FuQw/224sgOFkMdh/7NCDOPCBuCWHCOs9X+Nv16Oc?=
 =?us-ascii?Q?97OIKxegvfuPsfuDK1pTthO1JXI1N5F48cPgxlk65tLrNlLnoRb4arEDkkLi?=
 =?us-ascii?Q?6e5iwkyuQ5ZNxk5GG+LEM/3hiW68aayei7nt9XX/OQNd3Nd86BMrYa3Iymp0?=
 =?us-ascii?Q?Eag+zKkNPHApp6LQEnArDEdJ08fq5jzyBpu5gdbxm1Jdwtt0SYPknT9BxMp0?=
 =?us-ascii?Q?KqiMy/N2aVqmkneU3+ZDNix4hnU5664cqicRAnHOh1Mz2T3Qzy/1uFWjrZ/Q?=
 =?us-ascii?Q?GF+hFzEfH3D/kiWGM7D26okKiF1IdmUbEJdY+eesowZBZmmWJ5XsKAgRdjXT?=
 =?us-ascii?Q?vkW4o51Pdg9NlUmu8yH6phXg9Mp8JZ20QkNwB1D1UGjbHe0d9VOoL8K7vrqQ?=
 =?us-ascii?Q?ZarWiXkdHX6f/QM7wnvTtXhlspx7Xm6qfqxk4WDaBMz86o1xMM8pqXf1M6hx?=
 =?us-ascii?Q?2RNx16MfJlu4w5sn/x+ghTTseoNzBNiZdWfeGyEvJHyITP/MJr8QICHRQ4tt?=
 =?us-ascii?Q?Yguwm+38o/jTDCpKGSyNtxVuyEdBXgEv/MSbgbYj1GTzNyangHZjaYpA7Gf4?=
 =?us-ascii?Q?12QV3VV8C1USfYxLrnYOYRXYZkN0hmoOg7JQDEq4JbMMSEWTV0Bt+KM9lvVK?=
 =?us-ascii?Q?Gy/2a9qPuXAF1ha9e55WRoYMFFd4gaOZXzBNM/lYkiphzyBw91JrrM8rPZEN?=
 =?us-ascii?Q?LVbFcmvBdVQLCtpnbutE0+qn5tiFUcHQAkJxVO86JlsRvINz1Bbqcwv6thEH?=
 =?us-ascii?Q?Al8gkGqG0+ttnsNpVP2Ni7tzOCHZhj2NbRUed0Ty+oeDce1pclJltNxupB20?=
 =?us-ascii?Q?MdFCPfXm098qzNaexFZuY1fyQW58DJlCfdvUrHu2xqmC2lu5415KX5lIASnR?=
 =?us-ascii?Q?dHVs5/YTGSiIGSLULM9ep3a6yH5elBp5c0k0veNfzPAg8dfem+kvUXYLA/u7?=
 =?us-ascii?Q?OdPBhC50KlRymqMuTME=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 83eea6e9-cd2e-4aa0-5e99-08dd9838f925
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2025 07:27:42.1686
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FV8aFpArKQZ3ZtTUt2NM/Wx3UmgAa7YMrWOa3rT0QOlV8aGyrfi/ZvROsN8qP2HMv08GHOhM2iXPGlArEzZZpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8775

> Subject: [PATCH] gpio: davinci: select GPIOLIB_IRQCHIP
>=20
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>=20
> This driver uses gpiochip_irq_reqres() and gpiochip_irq_relres() which
> are only built with GPIOLIB_IRQCHIP=3Dy. Add the missing Kconfig select.
>=20
> Fixes: 3f50bb3124d7 ("gpio: davinci: Make irq_chip immutable")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes:
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F
> lore.kernel.org%2Foe-kbuild-all%2F202505210606.PudPm5pC-
> lkp%40intel.com%2F&data=3D05%7C02%7Cpeng.fan%40nxp.com%7Ca0
> c5af787d854064539608dd983883ab%7C686ea1d3bc2b4c6fa92cd99c
> 5c301635%7C0%7C0%7C638834090666472921%7CUnknown%7CTW
> FpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAi
> OiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&
> sdata=3DDMwJeyC%2Bu4xmb1Ijuf6erLE3EVgprzEW%2FR4Gjo55zOs%3D
> &reserved=3D0
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Acked-by: Peng Fan <peng.fan@nxp.com>

> ---
> Another one signalled by the build bot. Peng: if you could go through
> the other patches you sent and verify their dependencies are satisfied,
> that would be awesome.

I tried all configs under arch/arm/configs/, no error with this patch appli=
ed.
I will give a check on other archs.

Thanks,
Peng

>=20
>  drivers/gpio/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig index
> bbc71cdde9ed6..5bc31b56b5157 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -253,6 +253,7 @@ config GPIO_DAVINCI
>  	tristate "TI Davinci/Keystone GPIO support"
>  	default y if ARCH_DAVINCI
>  	depends on ((ARM || ARM64) && (ARCH_DAVINCI ||
> ARCH_KEYSTONE || ARCH_K3)) || COMPILE_TEST
> +	select GPIOLIB_IRQCHIP
>  	help
>  	  Say yes here to enable GPIO support for TI Davinci/Keystone
> SoCs.
>=20
> --
> 2.48.1


