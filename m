Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E29C4557004
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Jun 2022 03:41:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231915AbiFWBlL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Jun 2022 21:41:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229778AbiFWBlK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Jun 2022 21:41:10 -0400
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (mail-eopbgr10049.outbound.protection.outlook.com [40.107.1.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88CBB4338C
        for <linux-gpio@vger.kernel.org>; Wed, 22 Jun 2022 18:41:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l82kuvkriu3osqnCDpDD7sU3ehQwZDx8KNgfvjaDpouNMhsVOkOWNZvVUHGVWL6FSLwwU8zqYWp7w7g1vtXUFXhF1NhQiJQiejr1OraIeYYpoZXUn0vcgvWzTjlhmJNx9n8r66yd5yqlcVTqeY1WJpwka1ZETYwhCDKeDY8k+taORwOldqIgLX1GzfUTmlkeJBeR8lwAZLOn4Zj4vMlMrEvstb5vqHcb5aTVIR2nOWT4qqRf01hyCmtRY1aYzhEn8NvtonR65d7fin8J+woEXb9nUOh5hLK2vib7lIgwm+WbhQ9lgefu96PFUyxv26sBwkRZyd7yKlwS6lDydQXtRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QgsHssKfa/PyGM+2+X4gPkSc+q9mScQu8h3qm6aq+80=;
 b=d9wKTIk7JwUrN0UM7YqZbhxKWzENCUZ/KSxGqufBHHMd34EFCBqXQQ14GG6J77E715tbiLvdE3uCdteCXart9i771AnhgH1+c4sTSRWy106EkDZNAEhQqWMGBxq91XS70ZDmTm8pAb5JFrWmmCIXwy6i64FYB8x6xqsAnD46Yrs5jzkURChp6CFTQSbzI2+mZDRqfYVVnnTVc1X7C1RpFw64KROb4P781Kg5cUWysiO6PThYxDsXZXG1o3PzVxMKXfWTg1xuthaKe+qmnAhci7ZlbsD2Myzdov26D+/xBp4WstkgJP1M4kSruBELKox41dFh08j2OAmssKBOZEiW+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QgsHssKfa/PyGM+2+X4gPkSc+q9mScQu8h3qm6aq+80=;
 b=YpS5HroIHOpvoZps559dT3T/gw4By4pSplY/25nidc+Z8eoCbGLRfncpK9pj+0DOezScAbY+yTtZdPVBliTT+RWU7nOe9I4x/SfmUd2RCH1XeCQNQLcR8nV7/rnLUhY5YUGyfUbj8IRSpvt+bkJseghEbenh26r304u4WijMgGE=
Received: from DB9PR04MB8412.eurprd04.prod.outlook.com (2603:10a6:10:24d::9)
 by AM6PR0402MB3815.eurprd04.prod.outlook.com (2603:10a6:209:16::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16; Thu, 23 Jun
 2022 01:41:06 +0000
Received: from DB9PR04MB8412.eurprd04.prod.outlook.com
 ([fe80::9dbf:79da:79b6:97b6]) by DB9PR04MB8412.eurprd04.prod.outlook.com
 ([fe80::9dbf:79da:79b6:97b6%4]) with mapi id 15.20.5353.022; Thu, 23 Jun 2022
 01:41:06 +0000
From:   Jacky Bai <ping.bai@nxp.com>
To:     "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Aisheng Dong <aisheng.dong@nxp.com>
CC:     "festevam@gmail.com" <festevam@gmail.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: RE: [PATCH] pinctrl: imx: Add the zero base flag for imx93
Thread-Topic: [PATCH] pinctrl: imx: Add the zero base flag for imx93
Thread-Index: AQHYftQVxw3sppS650SYFFwqmU/2sa1cRsdQ
Date:   Thu, 23 Jun 2022 01:41:06 +0000
Message-ID: <DB9PR04MB8412383F8EE245B0E0751AEB87B59@DB9PR04MB8412.eurprd04.prod.outlook.com>
References: <20220613031854.1571357-1-ping.bai@nxp.com>
In-Reply-To: <20220613031854.1571357-1-ping.bai@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4379500c-47df-459f-c518-08da54b970b4
x-ms-traffictypediagnostic: AM6PR0402MB3815:EE_
x-microsoft-antispam-prvs: <AM6PR0402MB381567169BEE9D894978221687B59@AM6PR0402MB3815.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GULS+Eq2QBTH4rp2mizgRphNEpTuKoABBrT9JoZlCRtfZzEKB1m1riW5c0bCQN3j/1rE+nSJBg6pgP+O4mmvGYlBZZjxTCLFkgjiMDNfwBNqd4lyipqJQcdnuV8LGDeTrRAor7cl/0bR6HKSQ4pps4xpmgPAPTGSkB4k6gs/8H6YaGGoojiPefNdBlJ2vL3/GNyqtRytgXnazhRLEjtc2LpiDErQKNVc14pJbRPeu6Bqyf5Xtntwjy9dqTapA3qFt6DzeaDfjxgvRZvljcwiCGC3bu8jgkQ41r/Ey52k7TEYVCkgfKveq97EVSGncBb4eSAP42p/V7lHSFzByAYORSlqdFLbcWcJ5rb4uyAlJqgIZcNnjlPRyp9soxcav6O5NE/aXvNpmwa5AGloSRLKTNhaju++QhiIIR16eZvb6vHskXNqH3h/yc0dPe0I3P/a47VV3iRoTjdh/mm0ukNrRTuE4J9XyI69xt5Mc0IFanSjmO9UY4A76lga679YgY4pDvgzXMR4Wf9vVp/YCmf2pOy7mdKaWCI27mVOIdt0+ZpeBd1Kfkve5omj9ISPrA41mFaQSEFWb+zgduW0DBo9dlRO+wjdNWtlsdn0uwo36jyP/Iqb8mxZuJDrWWM3wKkYqY8yh//1JU1YAsdG6gTwcVnKV+jUCcnXUVtg9qwmMmhqVTlP55zFGuvhpCkxQDdBGFR7hE0WBqKNQxlIbE2loEupyIildep7S53VawHAUAxfFOOlVW8WQRTDrtR7Dzfr
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8412.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(396003)(136003)(366004)(39860400002)(346002)(186003)(86362001)(55016003)(2906002)(8936002)(4744005)(38100700002)(122000001)(5660300002)(71200400001)(8676002)(33656002)(52536014)(4326008)(66446008)(38070700005)(110136005)(6636002)(66476007)(66556008)(64756008)(54906003)(41300700001)(9686003)(26005)(76116006)(66946007)(7696005)(6506007)(478600001)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Pqz8Qmu6+vW6BoyjCL+KD5RY2zOcjZB+1yCgaGkZHycg5WPiNC92JAM+B5PG?=
 =?us-ascii?Q?CCzk1/KKnAuLWxl8YSyHAWWSOzYgJ8aPV6pcoiwi+XU0GK2N7yT5c+LD+RSM?=
 =?us-ascii?Q?WO73zvUqCVXtdEAwycakdUDY2WQhyQyIsV/1eWKVl3HfuZ4+snUb6thz1XuN?=
 =?us-ascii?Q?uP/UbzaDhr6fFANqOXLhafw90qU/IBRDb1vVOcWNUWA+xBqSviIA5/ag1a0L?=
 =?us-ascii?Q?rQjTM7jKYWx75057CpePy3XSMmyJGW86/xY4YL+y+WnugxqRrG4b2bYQNO8D?=
 =?us-ascii?Q?Y0Wr75Vc6p9ub0FGJCX/grZL/xRGqnj7bw8EHRguE3kwXgWGAg3cUK6EbGWj?=
 =?us-ascii?Q?R+Dd3jWJUKVIuYkXjVChKkAp2+tKNhZVfcGwCEOBT4OCzKcMkGN8EKGRal+y?=
 =?us-ascii?Q?NGp+5QGOI8aL6X2h5ZcqL3Zb5tS8tzrd0eOp2/IX5BBdmPKyraJu18FkDN1X?=
 =?us-ascii?Q?djXozTcRFRiF4kL7fEcukA9PUnGAW3VGQjneWsx4ZaT/slCahecp7/5XVkTc?=
 =?us-ascii?Q?kBp+9f2daVcThpPn7asXqVLomkCFp+LAuHlhRkkCbNyt1jETqqVgG7agRYca?=
 =?us-ascii?Q?iqvq9oNAqJT44t3a8df7c/CdTArKyXoUcd73uHT6qTXE4Jo2Nun/xs0x9exb?=
 =?us-ascii?Q?v9WhpdGDEfB7Mwgvk3gqhmoydJOOuw0TCuABpLQM1dTp7iv3l05DEbtDmld8?=
 =?us-ascii?Q?yHYTohk5F6ee4DDUGKXB4JN4y/alQKquEmYp/bUjjjFVe/y9A/imzxG5P1O3?=
 =?us-ascii?Q?N0WIgSfdq/uCcEyyFlwB968JP2/sM9MDI4sA+IYUAQOVJljpLPEIIZek8Lwy?=
 =?us-ascii?Q?BXbWtslZLG75IZxGEbSYfZ8Rcu54mTRpudCDtwbpfkQKzJiTbbJ3MbBaYIMl?=
 =?us-ascii?Q?/xrVkF74Oso+SPfy6y9k2ZDGNHQl1fEXlq6cyaL4NsGWaI/jo/+bTuhXhcqk?=
 =?us-ascii?Q?NsFi3uagQaAsrg7I+iDEuGDpBOOecz+KAUBJkCZLbWU27SqCEgHxgjLoFqrd?=
 =?us-ascii?Q?NJzH6Nudv65x2Q2XPjKdm3WcCYKiREvTsgrQ8LRBf0Y+PcYzK37tj2Ca7Ff7?=
 =?us-ascii?Q?UA8S18u10OXT2XdIMH2gzw/elht1Xgx5FvI7NpN4S1fn3/hqIAGH2FTULm7w?=
 =?us-ascii?Q?CdzpTguMNgmAzS44QkoZ9LuO5Mt5PZtnbInz7OEMMI7G/1GF9kPv/9IlcT/o?=
 =?us-ascii?Q?u0LV79NRDXg327YJGb0Bp4j8N2WTIxx20wO11zJtKlWTjwbQe6R7RtoKJ8Up?=
 =?us-ascii?Q?GT1tSOpn2yojDaSGRGKVoh7TlTO0umIV7/7ymhILq3kIoO4Vb7mwhog/k5Vs?=
 =?us-ascii?Q?WDRiY7OLr1B646mV94xfBTM/6z48ghlDj3h+WlT5257fGNqDVr8dRcjNauUc?=
 =?us-ascii?Q?GVNg3r10YZaKA3q47++dBZIfCpmR+Gcx9bECg2NKx/ZbuDUDGWJLsJRty1p0?=
 =?us-ascii?Q?c5FFDZDOgJ6kwvZAutYb4qcZG5dztfatzSWM68cG+wap5UeaOo20q3oAIyie?=
 =?us-ascii?Q?cgewVljuOBMjdX656T9mPNJq7WfpTfvXUci/8vwb6OKaJxLbTsTDEz0yNX0a?=
 =?us-ascii?Q?lphtcT+pbwMZI7TGs+OM4E31XWH1NzPenbjyeh38sTb6RwJZEh0uqgPv7mv6?=
 =?us-ascii?Q?wpMCwIC5sMKVv685/lC5E5u8nng1FXQmBjtUcsXlFvU6Oq8isUm50/xKWZxl?=
 =?us-ascii?Q?M0WJtm/rPjZTXVpplZPrSTPnA+yzB0hi0rUaaNmx9yCiLV1MRlnESwjuhBRC?=
 =?us-ascii?Q?pH3gsYwGlg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8412.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4379500c-47df-459f-c518-08da54b970b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2022 01:41:06.2455
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y2LhWcU19aB3A7+H3r3GwRMcSj0JXq3btewcJgSzrGFzsTnpwBxoy8MTg6mHc5ich1XfqCSoThMH7PkXm2oaKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3815
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Ping...

BR
> Subject: [PATCH] pinctrl: imx: Add the zero base flag for imx93
>=20
> On i.MX93, the pin mux reg offset is from 0x0, so need to add the
> 'ZERO_OFFSET_VALID' flag to make sure the pin at mux offset 0 can be foun=
d.
>=20
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> ---
>  drivers/pinctrl/freescale/pinctrl-imx93.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/pinctrl/freescale/pinctrl-imx93.c
> b/drivers/pinctrl/freescale/pinctrl-imx93.c
> index c0630f69e995..417e41b37a6f 100644
> --- a/drivers/pinctrl/freescale/pinctrl-imx93.c
> +++ b/drivers/pinctrl/freescale/pinctrl-imx93.c
> @@ -239,6 +239,7 @@ static const struct pinctrl_pin_desc
> imx93_pinctrl_pads[] =3D {  static const struct imx_pinctrl_soc_info
> imx93_pinctrl_info =3D {
>  	.pins =3D imx93_pinctrl_pads,
>  	.npins =3D ARRAY_SIZE(imx93_pinctrl_pads),
> +	.flags =3D ZERO_OFFSET_VALID,
>  	.gpr_compatible =3D "fsl,imx93-iomuxc-gpr",  };
>=20
> --
> 2.25.1

