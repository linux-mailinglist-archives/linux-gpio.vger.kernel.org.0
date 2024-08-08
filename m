Return-Path: <linux-gpio+bounces-8667-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EDA394B505
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Aug 2024 04:21:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 518FA1C216C1
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Aug 2024 02:21:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32667BE5D;
	Thu,  8 Aug 2024 02:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="VbRYLZYl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2068.outbound.protection.outlook.com [40.107.21.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F6C10A0D
	for <linux-gpio@vger.kernel.org>; Thu,  8 Aug 2024 02:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723083705; cv=fail; b=V5X9shgCyGxrFY4q7mZVlZhetDd923W+ghCKZNUurGS2iDOYR4S7QQf21/jaY8rajk0jwakYxtLZWdmhqVYAf+m6DRoDOMaN9OAenQkpCNVFkKrvsueho9F+Msaqm2AvxHH16eeohrjoR3JA3E+5DntO9RiVjtZD+vLeD1YDN0I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723083705; c=relaxed/simple;
	bh=SA/uEgZ5JxLXWPMh3cNvDtcXo1NKucShkLbniv/hmZU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=O6Q8VvsFKtj3UPdWv61PKuPIiVTaMb+OQCiC4ZIWjTiEZOCyDG2nnU53xuI+C+6uVoGyOuprPDHVtcHOUalWO8fBztpAN9IuLMre6vDjR0Z1sBqMSp88ki6/pjMOi0LpCMwrEX05Kf22zd/GBpV8lpewVUsVe8EI+hyTo9Szj0M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=VbRYLZYl; arc=fail smtp.client-ip=40.107.21.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OXtclcD8J96ik55CQ2Qt68JcgY8uWHAeuht3JUIqah5DRHwziEV2HgyIzhE0RMWSJHPZiCr8aC7HcPODxhtLnu1Du2RE5zpCYaCAHwsOmNReJL/CW1OtHA5a54UoRZ2BmxWxq20jhtSCfbu6A8KwEZ8JKY7nGWYY4ePHrmc1DV0EDQHonyiSUjGQZVczxZqBHpuo5XW29YSMNHyGYwlA7Iy8wRER5O5y2QyZnkMj9J3AiH6hJL/PoSYlXvMeUq5g1aB2/JvgZ9Z1MSACr9IGDdXUZ/6MkvxmZOgeYonFuTLxU2vcOOGSw8+otAcGnSDS2LKU/Xw+R4bWcplSdloXCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FYjVEqlCvwbtMVGIq4j+79XC0zUj1MdVx/aMdRM7D4k=;
 b=ZKPsPQaz53UDdNuZ9oVRmN3rchM6PPcF2bHG886FxuPVttlJx5gWeePww/Bq6Bi1THiubaYAk2xx7DohNzMSBRtnsa4jm2bGlOJJJReSRzY5Z9LcXbUORFOkPP4OooPxERb0FpvEVRcKJC3xhuHDZssBwT65N0eecGmXkuWMIkgTVrjyFnxQOHDC4xFHr/GIxOHNGxfmqWM+wn3KfVudnhx4rQ6jYercsQ/s8Fn6Uhy5AKimxgQvOqruILHgXgY+XB7UV7Sik8lNVV2ONlnT7+YEQgOJWvE2U/pxkBG1CcD5pV0O9y3YrUmf3K0IOUIhXGtLvQYz3CPn7DrgUN1YzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FYjVEqlCvwbtMVGIq4j+79XC0zUj1MdVx/aMdRM7D4k=;
 b=VbRYLZYlD7ZZ3hYtg5CCG15Fh30pTSKWZzMV/7D1OLVFipwR2vAlcvGVNiVZDhYcxuB4yvLKDW2/99434ZQqDR0SxBW/UYHT9sV7r0/EOLWAy8tA0xmsndl4CDAfk9v530xJt5eMnbWPxNDH2ISi52fqOedswgTAXub/uKtp9nRdIWqeQTOXJ7td49RC5ZrcXm1j1vuLINuDXoEFe6MyTFHCs6lUqsVkT48sfftsUol/zorzo0vtIC6Ih78aX4Y2m8AD1qtv3G3a2EWTEDXEJf3Ht/zQxhR5JdWSQiK/DZXA4AVMKJezLoNVlOil4gU1/Dpbjo2P24Oo1tYv5ri55w==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA4PR04MB7773.eurprd04.prod.outlook.com (2603:10a6:102:cd::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.27; Thu, 8 Aug
 2024 02:21:39 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.7784.020; Thu, 8 Aug 2024
 02:21:39 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Fabio Estevam <festevam@gmail.com>, "linus.walleij@linaro.org"
	<linus.walleij@linaro.org>
CC: Aisheng Dong <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>, Fabio Estevam <festevam@denx.de>
Subject: RE: [PATCH v2] pinctrl: imx: Switch to LATE_SYSTEM_SLEEP_PM_OPS()
Thread-Topic: [PATCH v2] pinctrl: imx: Switch to LATE_SYSTEM_SLEEP_PM_OPS()
Thread-Index: AQHa6PUggt5ro6jlmEesrhBQVM9McbIcoTVQ
Date: Thu, 8 Aug 2024 02:21:39 +0000
Message-ID:
 <PAXPR04MB84599FB9ABFA414E6F85C8AF88B92@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20240807181033.77848-1-festevam@gmail.com>
In-Reply-To: <20240807181033.77848-1-festevam@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|PA4PR04MB7773:EE_
x-ms-office365-filtering-correlation-id: 3860710d-ca3e-4421-d221-08dcb750d5d7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?TNgti7j02laa0WUwWEtmsPcybeAjHFonwMuXG7mwjXd8MDK/43ZZdvYS6U2x?=
 =?us-ascii?Q?kCROKN+X2vlsZwNQYEF6HNPAFUk1kK5cBT734yQLWd9UW3FD4syYpvme5qs8?=
 =?us-ascii?Q?vDEcbdYDh3fPK1H8qJ/2a8uPbXOBb9Q4aBxO6wPAPZ/R5urdAxzPsf4NT5UJ?=
 =?us-ascii?Q?iNtROth4Dkvw/cpzA8/RR7ACRfA33Bgai+kdEMKe3iEB47ATPAkvVExHpuHm?=
 =?us-ascii?Q?F5dV3MQpnphzuKVvf8h5KCXy/e4KpsWgEkeH9vu6d/6aLjEzYZFXeKKEYg6x?=
 =?us-ascii?Q?g3/fwnw6KwS1PvaJ6VMoLaNYUK8Y5nD9LhRvA4pQOkZ8iUNj5FiEs7gwt7fG?=
 =?us-ascii?Q?yw9lE85lqu0sE13eMyUifxP6iSOEo8acOrfAAcMGZPgEYL5QGhMtjJ95w+SE?=
 =?us-ascii?Q?/Xc+9OA+LdnfvK2ujEBtcCekSNS6wjDrIoKKE2sqz/zL5pDZ8ua2EoKW4Q51?=
 =?us-ascii?Q?M5unr3py5jIed6DmDTwInDXxve9bNbZ/DiAtwVvhBwdBdS5Y4xpFXcaVuLpx?=
 =?us-ascii?Q?n8dWMP79TXLhcoH1vx+7DIyeuVdiky40J0wgG2W+X1iTvehHseqWKfgCyRA9?=
 =?us-ascii?Q?Y4tEWqbahKt91ud/I5xfG4gUW0dqjysYCZMfMQmk2KMuASt6b896E4c7jFwe?=
 =?us-ascii?Q?tZv3IFLWzv7Kln43qr7yok42WDPMERYcelgjcXQzDOfQugH+rOpiLNG2i6B6?=
 =?us-ascii?Q?6lBQBYTgRsIiU/OeqPkp8J/qwvJVgQ2ma4Y//D8GmqDbPdZGLzl13VW9YqdJ?=
 =?us-ascii?Q?lamNLnOiOh37RuCsk7m6s4wgIDaAS7AYn1FFBvj0vozbqXtSzurMdfbQZU/i?=
 =?us-ascii?Q?JLJQsO7MADJIaAe2I0R609xQHTvRdwOnXLBldBCydO/heiICljhzmUd4/O2V?=
 =?us-ascii?Q?ANftdWhxRyG+bELfgygS82stsoQvoLpdkJNlWZ5Ng/m6LrHW0jqhEPqRoApx?=
 =?us-ascii?Q?12wLnxd7arm7ALRE2o6EPO3dl9gVHZa6F9fzVcwm3cUNuQ3p+v5OAicpcCba?=
 =?us-ascii?Q?OZ5U19pLx8r2Hw2/TzOfucVlaLCoDmLXZvEFqewWbT3HosrFf6ynpmuQtewR?=
 =?us-ascii?Q?dPz+Q/xI0Qobotz2Ne03XxHOI32WxAMFHoKHaS/9zwQ8iRHmX3aJ5ty+mz8G?=
 =?us-ascii?Q?8qjHB9mx9JZQossmrxDCjgy735KPeL2RkNpRV7gqyMAhiJ1Zw2Bt7+pmi+M5?=
 =?us-ascii?Q?yNK+pahhPWTPCP3wThvZAlQL5c+JqpUYGGQlkWTXLcGiqEHJCCxm/eRDncCa?=
 =?us-ascii?Q?juCSeJidR/jmFrRqS2CQMIkInzk8cw9v7JhFiYiFfpdWhS7+n4KUH0ZJHXRT?=
 =?us-ascii?Q?uvd7pndW9GN1XJwnR0hlQCYNTKrB4crP+aX6Ftt7MYP+7fS2xglLixs6QQTO?=
 =?us-ascii?Q?IPpnQ1CDKtV+Iuklplibx+G+XiwaOFOCF04Jz+642TYkPVdZ5Q=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?WY7SUApaUzE+4QArx69jN+irolZ5Xq42qYE/IpS4lQbKJXuVu+lnNGaNfVTz?=
 =?us-ascii?Q?/3wPBoMl7rDmfRQiUIVZNtg7swInRgdcaNGqUBMEP3N/b76fP4f2gTBmbfIN?=
 =?us-ascii?Q?VI9cuzTL9Rs9xQ/dYk3C6gqdcd7pa3wJuva2aJWvhfiL9HYH2GYUsI8VrIA+?=
 =?us-ascii?Q?xjwVaoAhLjKMR9yiwdm2SwRy+zdx8Nafz92IQDVkU50zLHWXfbpmKdCNotH8?=
 =?us-ascii?Q?AXXaJjuDGPoTbMW6oOUqWPWMlrhS21Jyuu8qa/DC++cU+pkaAGhkzHkc4j+N?=
 =?us-ascii?Q?DjBK5bvrB+XFc/i4MKwEiDczZ5xeQ8tLzSCRolRHog/svpmft/LiI/NxFhLU?=
 =?us-ascii?Q?TbBe6d+HJtOMW1gwakFt7tlPEjJrCGRhlc9Uv3non2dEWSKBhBZoh9mrlaJ7?=
 =?us-ascii?Q?pl5offq7YZ7tk+++ptb9Le7XUJyWkVeK5nIFXWl5IfYkw0EEjMHSaEKfEdxB?=
 =?us-ascii?Q?GukFoiKN38jIf+GkvOi6CRyZcFdai5UNvzoo6wJ9IQX9UFRGsyVqK1M+fDZf?=
 =?us-ascii?Q?MBxjHm5hkfjLlOIsv9ZlDkyxJSnRQbabtbjZ/UrByNHQ1ZbxkkgPV5cUbNE0?=
 =?us-ascii?Q?Wlgp7aajLKZvSkc98LnFgiBUCNmKq5C/XfvD5yFX0LpPafLNli8FF4FJH5C8?=
 =?us-ascii?Q?X/0uSIFuZxNLstOYvO5Abxeww0d7wxsPlglHBP2CGcX9YnQIlEka7zPrvamR?=
 =?us-ascii?Q?dblavw0USO7bxEcqRlb0zI0CWC9RQHEvbt4Y69J8nA7luZWPhhSYUQ+bYQdT?=
 =?us-ascii?Q?54vrqg1bYzZh6vQBIHov1jUnAtDc9f+qnriOCnBouNZ7qOyv1oTfrFduksoP?=
 =?us-ascii?Q?hbZjZm458j1D9xSMsEjrSh0Mr9XLeGZCe5Hsy12zfJ0lvLbybV09jYEHDKl9?=
 =?us-ascii?Q?9+5zv+yVQZSkIWd/WBD5GrNrdJCAJMKQgqFjDr6vZLDZT3vTFC83uqvIBabF?=
 =?us-ascii?Q?AmM6jjz2/2E+9YLYN+akfK/ZkXthoo/1SrfcUTFxP1sGAldjBxdWX1EBu+M1?=
 =?us-ascii?Q?d8/jG1xexbV/8ZulxteCmYE/F1CMLgOyO/+25HFpxrLSDLLPKqm68cUyvJgt?=
 =?us-ascii?Q?Y7og9hca79GskrlL6Jt5wDzoMi8LiJgRYlLQrpTa6/3/IpIjcrQhMjyRhVvp?=
 =?us-ascii?Q?wk1r5diAfnsdNsloXMKb+soB2S+PHrGTzyrWw71or6Y16bSxWP83k/aGBQkA?=
 =?us-ascii?Q?aatRwPojOdbYMAwIUHeAX+UMqWh+LmVKD/flTUL7rsrLfX7K27b7rTHxNKll?=
 =?us-ascii?Q?qhyqUNt8dtkIXji/KeoOl9/4mKVpXLqtPpwIPy53IoIFHgvmjCIPjKe75lTt?=
 =?us-ascii?Q?97jtnbri8MRh0t+ixyZhi26rR5yGmsq/6R1fTJ5089rq9rP+hmSJb4FmqhuJ?=
 =?us-ascii?Q?1iUMyu7Tm9mdOneNAEXuQZqxRDnU9wyR76l6dwboQo/U2BoFJOkGs37Ew34S?=
 =?us-ascii?Q?ugpNRux9Dad5LtzPHNFrDuXc52dcBDv7wBuQFk0BfyRfAr3kytqqgIXAkX0K?=
 =?us-ascii?Q?A3qKMW4nubgbvalrB6e94YA5bqKx8GBTI07OnvmiMGt3HsVSOZ16uy9jMB35?=
 =?us-ascii?Q?MuIpf4CAAJHlrjhWcxg=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 3860710d-ca3e-4421-d221-08dcb750d5d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2024 02:21:39.2292
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: paHJubkZWb5ZjLsIAkPByOd6OyfsOZyF+xoAAT4n+1TWQpV7U5ksUoTqFlgaWWgzSsRU5sVuJWR6/1isl8FK7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7773

> Subject: [PATCH v2] pinctrl: imx: Switch to
> LATE_SYSTEM_SLEEP_PM_OPS()
>=20
> From: Fabio Estevam <festevam@denx.de>
>=20
> Replace SET_LATE_SYSTEM_SLEEP_PM_OPS() with its modern
> LATE_SYSTEM_SLEEP_PM_OPS() alternative.
>=20
> The combined usage of pm_ptr() and LATE_SYSTEM_SLEEP_PM_OPS()
> allows the compiler to evaluate if the runtime suspend/resume()
> functions are used at build time or are simply dead code.
>=20
> This allows removing the __maybe_unused notation from the runtime
> suspend/resume() functions.
>=20
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
> Changes since v1:
> - Pass pm_ptr() to the correct ops structure.
>=20
>  drivers/pinctrl/freescale/pinctrl-imx.c    | 7 +++----
>  drivers/pinctrl/freescale/pinctrl-imx8mq.c | 2 +-
>  2 files changed, 4 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c
> b/drivers/pinctrl/freescale/pinctrl-imx.c
> index 9c2680df082c..d05c2c478e79 100644
> --- a/drivers/pinctrl/freescale/pinctrl-imx.c
> +++ b/drivers/pinctrl/freescale/pinctrl-imx.c
> @@ -804,14 +804,14 @@ int imx_pinctrl_probe(struct
> platform_device *pdev,  }  EXPORT_SYMBOL_GPL(imx_pinctrl_probe);
>=20
> -static int __maybe_unused imx_pinctrl_suspend(struct device *dev)
> +static int imx_pinctrl_suspend(struct device *dev)
>  {
>  	struct imx_pinctrl *ipctl =3D dev_get_drvdata(dev);
>=20
>  	return pinctrl_force_sleep(ipctl->pctl);  }
>=20
> -static int __maybe_unused imx_pinctrl_resume(struct device *dev)
> +static int imx_pinctrl_resume(struct device *dev)
>  {
>  	struct imx_pinctrl *ipctl =3D dev_get_drvdata(dev);
>=20
> @@ -819,8 +819,7 @@ static int __maybe_unused
> imx_pinctrl_resume(struct device *dev)  }
>=20
>  const struct dev_pm_ops imx_pinctrl_pm_ops =3D {
> -	SET_LATE_SYSTEM_SLEEP_PM_OPS(imx_pinctrl_suspend,
> -					imx_pinctrl_resume)
> +	LATE_SYSTEM_SLEEP_PM_OPS(imx_pinctrl_suspend,
> imx_pinctrl_resume)
>  };
>  EXPORT_SYMBOL_GPL(imx_pinctrl_pm_ops);
>=20
> diff --git a/drivers/pinctrl/freescale/pinctrl-imx8mq.c
> b/drivers/pinctrl/freescale/pinctrl-imx8mq.c
> index 529eebe46298..316469e72a17 100644
> --- a/drivers/pinctrl/freescale/pinctrl-imx8mq.c
> +++ b/drivers/pinctrl/freescale/pinctrl-imx8mq.c
> @@ -341,7 +341,7 @@ static struct platform_driver
> imx8mq_pinctrl_driver =3D {
>  	.driver =3D {
>  		.name =3D "imx8mq-pinctrl",
>  		.of_match_table =3D imx8mq_pinctrl_of_match,
> -		.pm =3D &imx_pinctrl_pm_ops,
> +		.pm =3D pm_ptr(&imx_pinctrl_pm_ops),

I see other pinctrl drivers are using pm_sleep_ptr,
pm_sleep_ptr is better here?

Thanks,
Peng.

>  		.suppress_bind_attrs =3D true,
>  	},
>  	.probe =3D imx8mq_pinctrl_probe,
> --
> 2.34.1
>=20


