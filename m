Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D85E1572EA4
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Jul 2022 09:03:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234440AbiGMHDP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Jul 2022 03:03:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231133AbiGMHDO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Jul 2022 03:03:14 -0400
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (mail-ve1eur03on060b.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe09::60b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35401E0F78
        for <linux-gpio@vger.kernel.org>; Wed, 13 Jul 2022 00:03:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A57Ma6q4il5C8ZdVaHZRWnOV3buKBT+1SymTPwbcnXSN1YkozYPsvx4FokYyKxDDCVBw/bWDPmlnA0aZrCP9wxQvt7LJON9IcI5GhBzR5IU7oq4R94qgYebVbk/IRTsEDag2bGasQ5+DulAyDa5P3NPDKzozIWeUIc0N3L6qF0tlFfXmbXIhUSLba8i0fvS8UNNvEdtMFSTLqEhiPg8cIcUVoXXNthgdlgdGNLDyEntFYy0mzNMRz5YuwUeaCeeqn8L7g2YlKxikpPdQX/0ZIUBjvYoCoZ6IvBcZtqKYhc8sQhhWacSPSrWTDuCopqAv06+ODLVxB6E7tSzvpPwfSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D4BWf41OfXqB920LFtbdakleou8kvUVCGcrKXecoF6g=;
 b=LH0Ns1xRWNNz6KhyRGSeWVE7T75oSgd1oaMwQSnDJ2pia/onJBfe/66dU4IgV2Z6S/3uYiWiZRrUF8pEjzVrYvkzcUzvmXjPXnT3bxaQWNwdE+OcdDi1opadQ5Bx2gx86qwL+2nPJ0758hnfJbT/3oGQD43N1zjM9y7mFw7MdigTG+vnSbb5BEY5fU+JfQ9kyWYFBGCGW/a7MEkXoWKfit7tTqvoxaO1LHZBT6rfWPtYaEEUReOXPWK0hxu0dVUraEgZH3LWydTlo8tKvMs72ef9KAWG0ReXqvG52Wt2BwafizmzrlAjvOElUEX90DPuAQqiGSCxi9pFf1imkp9jaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D4BWf41OfXqB920LFtbdakleou8kvUVCGcrKXecoF6g=;
 b=UG1uE03kaAJZb5IsMv28nek/BycHzz7jourXEY0QDDh2mlDZob92F2NXWtKE5BZxvsYBm/6gd2R8xjgrtbHOuEf/ZaZBFKJi24DWSnAADVnDaeiaEBYXCpdjPymUDY/96Jp1hmYQOjPmDaKa8cMGm03kkh0s0fW9SLIQDJGQyhQ=
Received: from DB9PR04MB8412.eurprd04.prod.outlook.com (2603:10a6:10:24d::9)
 by PAXPR04MB9138.eurprd04.prod.outlook.com (2603:10a6:102:22d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.26; Wed, 13 Jul
 2022 07:03:09 +0000
Received: from DB9PR04MB8412.eurprd04.prod.outlook.com
 ([fe80::1c1b:6695:20d7:fd10]) by DB9PR04MB8412.eurprd04.prod.outlook.com
 ([fe80::1c1b:6695:20d7:fd10%5]) with mapi id 15.20.5438.012; Wed, 13 Jul 2022
 07:03:08 +0000
From:   Jacky Bai <ping.bai@nxp.com>
To:     Fabio Estevam <festevam@denx.de>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>
CC:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: RE: [PATCH] pinctrl: imx93: Add MODULE_DEVICE_TABLE()
Thread-Topic: [PATCH] pinctrl: imx93: Add MODULE_DEVICE_TABLE()
Thread-Index: AQHYleXPSUbcOKoNu0eQfqKVys6AfK174L0w
Date:   Wed, 13 Jul 2022 07:03:08 +0000
Message-ID: <DB9PR04MB8412A5EA6C8196F2026DC27F87899@DB9PR04MB8412.eurprd04.prod.outlook.com>
References: <20220712115154.2348971-1-festevam@denx.de>
In-Reply-To: <20220712115154.2348971-1-festevam@denx.de>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1562ab2a-0abe-407d-cdc6-08da649dbe2b
x-ms-traffictypediagnostic: PAXPR04MB9138:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ME9mOzufYpzAbs9phJLLD8ul91beZCuTJcAl3NuvaklFGgmgDwcccb8UlUn0SoqeGJ75z+fhyD422A5uK8Av2kF05pKGax4Q6U2gq+6i37W2AoifhrK2TrPZjC0yqrXldUNhQxek5AvmNejKB+4Q4ZJMobFubmnKJ6/uolCRX9zWpAKLGVOQHO9wzaR+TzJBgPco1Kc6YNbVqpaZZ20Mt+AfLGN/PtSZEiCzhZuUgIWZlYS0Nus31qoUwBCY4QszfLoCJagv6qIwAZHzqSDCX8fRGS5Um2Oo3VUUVKfDWirJNL/ylWJXUbyGK4M0FNQw/HctTYbAxa1qcKKoiZph32I7bYVlUCuZqp0PW+YyRrbY+j5c7tDzkXjKuWOSVRMeUUdg3PgJrFLvSNlYVowKz5zb6Fbw25r2namenZDpF7AIP70CxFTXe59VIlQmHJFuS0ue5WIc/eHOL3v+IXp8+Z+AJgAFku4TBqeuWvtcNxJ2Ah+pFlez8HnuIBfAc3CJCVdVS2QIbQR3lFE8HKke6tyEd7WRMOdZ/Nm9yNN4XB8i+Gh0gS8PUYQUMkRbl4bwlHOWHc32S+KuujrNs4hra2DSyuuH0Fe9Twh2/gdCHem/ChgG20jxaJnDcWKCMkMo6xYAqIZzrIoY+iL/HQIRlM56frP/GnM5wNOHylNE9WSu9X9bQTWXhvylIsvNrrd5TPFmsQpgnH3M5vrlHQXbxRbeLSresPK/m4NoxkVv7wIjHWTzlmlOKm/fKDEQ217g2rVDr8sDQfEC/5UD71MExlWhwhfHxUbg98wdbvs928zQr9ghY6qm0kgm1+6PTDPH
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8412.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(39860400002)(396003)(136003)(376002)(346002)(8676002)(5660300002)(4744005)(55016003)(2906002)(33656002)(122000001)(8936002)(66446008)(66556008)(52536014)(316002)(86362001)(71200400001)(110136005)(66476007)(6506007)(76116006)(64756008)(9686003)(41300700001)(186003)(7696005)(66946007)(4326008)(478600001)(26005)(38070700005)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?HXgFT9s03FdmhtsyplXcEOiwFKD3df8+aWlzovfjj6uiJ3JP2aTDxXxk0ckM?=
 =?us-ascii?Q?LHUTrPgZvAyGHfa3SM1YSk/ZwjjkRBEPuP8OAnFtQFtQ4j1doOh35ziPtiCe?=
 =?us-ascii?Q?CNyXAMatL/5R+OVCKCbYmSDfq7/Ui6wynAiLqtBFXjwVGAZ5aG7JqsAjV2O/?=
 =?us-ascii?Q?6pE22Kc6A1qlQwd7GfWxNQYltVo0upaSJ2SMrybdxKqViTuA79i+Qxn/hw1z?=
 =?us-ascii?Q?n58ed1tgfv2+RDQEV3INOLWtIT+NAggXwGOF5dhbxuc3WhUe1R6R/UALaX/L?=
 =?us-ascii?Q?Qoz8tEgpQEtrdGO+zShpatwLvs0bMV5z9ymvHM/kzgH1vWetNGaINwMoH4hE?=
 =?us-ascii?Q?rnrjW3gNxD734Zu5+OnetmGZH+hOLeB8i7jYEfr38EJncrDocxvIsyb/T/5+?=
 =?us-ascii?Q?OAISbNNPmtF2zazOdq8FHIjzMUdUrLD6mG4xyw3NL75fqFLSVJv1PePirvbX?=
 =?us-ascii?Q?O8dijNyEDEOJ+zaS58s5Wf6BuIru9meeMCvaT1ecsR0H+B+b24Fs6yuylIlm?=
 =?us-ascii?Q?b/I43qPjZInJLhTPtg7qKZyO5k88EmgZc8da4yK1TgoA8Crw1Bqbs70h4QGr?=
 =?us-ascii?Q?84i7VHQwwBkXdwzrQpafJDcc37Ha5wm+e/lZ69c49J5RL2+eH0AzbgB404ws?=
 =?us-ascii?Q?kYBMlnrPq067X4BAub5cTSvCL0WVFiclqTcKOzvebER0/vXeG7x3a9IgNIkD?=
 =?us-ascii?Q?zHk4+2JjULay6wBbK63XaoEhqVEvA9MEjsKLwNxCTg0xSN+SvEmS8uyITwpt?=
 =?us-ascii?Q?NRvz/bAt5EA79GdtLpQnX2nIXYI7ZeR9z+03PlFNgZ8hMGY4/qAETOaS2FWz?=
 =?us-ascii?Q?WLfxs9AOTRCHLpDssOYCRUlk77ddPFcEK7usWE9F3f/auFiyG38IsaiAyqNG?=
 =?us-ascii?Q?cvwm+OmaD0iswVCjArSV+1TFhq/2oU6I3ixQjtRV/LBrmZBnCdOn3M2+pbdy?=
 =?us-ascii?Q?OZAQzJuk37bEDkIQvAs5G0mV2fqMHf0a98Pp/Us8SwqFQpHTqZnvJbv3qENo?=
 =?us-ascii?Q?Mw9STO5mYcpX52wZ5A1id9bKobjb2mgtkLtVXfFgyywhkcNWVLZVxDsI1h2S?=
 =?us-ascii?Q?fa9cCWfFBvLI5wAh9KJlpMSWrMZ6wdaCid5ensV00T7KOyaqR7AK+u4R3Bwl?=
 =?us-ascii?Q?aIj1I9VNDLJS81isTSCNALc603FK8hkps7QTeP3qOtsPh9CdXns8MrYbcCSb?=
 =?us-ascii?Q?JULYz2V5eOqDqePLnYBqA2th/CowjHrBr2FBU/vCVHZNr0u6Y4pWjQUdyQ69?=
 =?us-ascii?Q?J8B+13aqp9OeeMLVGIEtzak4OpAON+QTGiSZ5xgNUCt75UbxHT0O/4B5JZnz?=
 =?us-ascii?Q?Cw4EnIDhLCupPW6RQwnbtO3nYvXKLz4Pza7dToi0t3Xd51df+8Y0SVWY7MF3?=
 =?us-ascii?Q?ffIKrcwI33hjQWwG0K/S8/p1UfwtOncVUUzXsVJn5wO25oi0QQMQoyT0kcl1?=
 =?us-ascii?Q?PfVeCm8rnd6BYQbuHqA9b8Z6NElgj1tnl8KcroJGFBBi7TnCT2gdgD451/yP?=
 =?us-ascii?Q?Ws6/I8ymaUdV4b1GOpAEt8Zw3Qw4fS5ptUi5P1mGVJNpJMZcJofpEBvnV2Tw?=
 =?us-ascii?Q?fJlz5O1dYtT7KhawBIU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8412.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1562ab2a-0abe-407d-cdc6-08da649dbe2b
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jul 2022 07:03:08.9062
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fZK7g7NynognTpudSIjjr/xNfHcAfNUeyksraVROEChLNFJetkMSvR546hxf7Ji43fu638VGie4G9FnF9vbQsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9138
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,SPF_HELO_PASS,
        T_SCC_BODY_TEXT_LINE,T_SPF_PERMERROR autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

> Subject: [PATCH] pinctrl: imx93: Add MODULE_DEVICE_TABLE()
>=20
> Pass MODULE_DEVICE_TABLE() so that module autoloading can work.
>=20
> This also aligns with the other i.MX8 pinctrl drivers.
>=20

Reviewed-by: Jacky Bai <ping.bai@nxp.com>

BR

> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
>  drivers/pinctrl/freescale/pinctrl-imx93.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/pinctrl/freescale/pinctrl-imx93.c
> b/drivers/pinctrl/freescale/pinctrl-imx93.c
> index 417e41b37a6f..91b3ee1e6fa9 100644
> --- a/drivers/pinctrl/freescale/pinctrl-imx93.c
> +++ b/drivers/pinctrl/freescale/pinctrl-imx93.c
> @@ -247,6 +247,7 @@ static const struct of_device_id
> imx93_pinctrl_of_match[] =3D {
>  	{ .compatible =3D "fsl,imx93-iomuxc", },
>  	{ /* sentinel */ }
>  };
> +MODULE_DEVICE_TABLE(of, imx93_pinctrl_of_match);
>=20
>  static int imx93_pinctrl_probe(struct platform_device *pdev)  {
> --
> 2.25.1

