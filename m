Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B5F4443B48
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Nov 2021 03:19:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230518AbhKCCWZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Nov 2021 22:22:25 -0400
Received: from mail-eopbgr40044.outbound.protection.outlook.com ([40.107.4.44]:45327
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229592AbhKCCWY (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 2 Nov 2021 22:22:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FKWLHU2WGw4AttIJSDSJ8fATRX9IFsToPrCGFBHUTIwt8lFgBfBDXi7lHQRon4jeqMq9MP5zUWiRbPFMJrRHRmJPyXb5nTjZkevPHilmD3fpfdwZtB1x/wbFHS7Nn9sey8hkAhA0QM/L5ZCCzBoaka9I6HvS11z0M4Ld/f6wf0GV7UMwaQI7fvFgl7VyHoLaPavMR95+pJhzWZ1fQ/p57sZbWOuJBKbomu5Ip7g3Jy+pIvD63VGH0m08GuPCa0KyOtXD73u8Mr62GmYknmH+EnBhSxxNT/rrjbDqm8ZjMAuIVisLRQ9Jo3n8zgXApkzmhwsCrA4Tbf7X316hT+OPrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a+gJJovfmXvF5P2vkLeAvOKioiseQk6phB59tEXMte8=;
 b=mJZg6g+VKItpmRD/TQmt1OMqp44ZB7yg5rfE/IyShx1gmklw9jEIr3pTEL3yHGQQW3V3cV6X6LVB2EjfVPS1X7Xyq1oMqDkfIO+8ApkL9VR6iLysXk6+dIq7o3BHTfDKP6zPh6mN7UbG9KIqi+/xlLl98IGoBOVB9cA+n1ks0MXyaAFjiSTziEIR6xHyXAQsaf2xiypmMBCfA/jXtlyKAzqHX7SUX+DMn8DV1zYmYUjBp4khK2POeVhXUnBk3kJY/42N4a/Up1xUYidYW62d03ypdhwT/YeBHAWxsUu7rqyVCI+T5BGjNVRlarlT0qjyIES7rNPyogStBH51tl/gtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a+gJJovfmXvF5P2vkLeAvOKioiseQk6phB59tEXMte8=;
 b=Jj/ZNXcbxBsTdETQgZhshOD/hgnKXY5O+2eMDniFbTJX2gdruOT1p8/EHiT6HCC7Fn6CN8r288EYVIFdSt263T8bKdDyrCMZloCfedW9o/zIkRn7WfJfcODU04tM074q4OLZI2vVZsnGpg3mbfW/VU87zlQNZ6rFqfHmK+7/EKY=
Received: from DB7PR04MB4010.eurprd04.prod.outlook.com (2603:10a6:5:21::30) by
 DB7PR04MB4380.eurprd04.prod.outlook.com (2603:10a6:5:31::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.18; Wed, 3 Nov 2021 02:19:45 +0000
Received: from DB7PR04MB4010.eurprd04.prod.outlook.com
 ([fe80::94cc:8972:12cd:5bef]) by DB7PR04MB4010.eurprd04.prod.outlook.com
 ([fe80::94cc:8972:12cd:5bef%3]) with mapi id 15.20.4669.010; Wed, 3 Nov 2021
 02:19:45 +0000
From:   Bough Chen <haibo.chen@nxp.com>
To:     Jesse Taube <mr.bossman075@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>
CC:     "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        "stefan@agner.ch" <stefan@agner.ch>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "arnd@arndb.de" <arnd@arndb.de>, "olof@lixom.net" <olof@lixom.net>,
        "soc@kernel.org" <soc@kernel.org>,
        "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
        Abel Vesa <abel.vesa@nxp.com>,
        "adrian.hunter@intel.com" <adrian.hunter@intel.com>,
        "jirislaby@kernel.org" <jirislaby@kernel.org>,
        "giulio.benetti@benettiengineering.com" 
        <giulio.benetti@benettiengineering.com>,
        "nobuhiro1.iwamatsu@toshiba.co.jp" <nobuhiro1.iwamatsu@toshiba.co.jp>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>
Subject: RE: [PATCH v2 11/13] mmc: sdhci-esdhc-imx: Add sdhc support for
 i.MXRT series
Thread-Topic: [PATCH v2 11/13] mmc: sdhci-esdhc-imx: Add sdhc support for
 i.MXRT series
Thread-Index: AQHX0D0AJ7FLhc5hlkSFa85u3j6wJ6vxDoKw
Date:   Wed, 3 Nov 2021 02:19:45 +0000
Message-ID: <DB7PR04MB401021F7155E723194BA857E908C9@DB7PR04MB4010.eurprd04.prod.outlook.com>
References: <20211102225701.98944-1-Mr.Bossman075@gmail.com>
 <20211102225701.98944-12-Mr.Bossman075@gmail.com>
In-Reply-To: <20211102225701.98944-12-Mr.Bossman075@gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4443a71b-345e-41dd-7353-08d99e706748
x-ms-traffictypediagnostic: DB7PR04MB4380:
x-microsoft-antispam-prvs: <DB7PR04MB4380E56C50CF974B11C8D5FE908C9@DB7PR04MB4380.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:89;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nFkOPZmgm7NnfyYHBUIwyhd+7BBLyaDlb+/m09PYxgwsH6vxgvEK3OHID92nqB8gSTQodemu9lSFf7o7GCYI3fyfjEiMJmFWgqEI9dJbflxR7MO3BVTUtuWnFpWiV3gxRzflnZnvM28Bzjx6HC3VJScxkkufRiaUq5XdttPhR9LDJ5X+BwnZI1QDitQeMUdaBm+h5MN684hnjQgTXsUR617aSy1G/UuEF3pQR8bTqngTPDFCnj0QIBzjuagfk89CMtqf62ICiJuLrcyvK8S92q20fV4NpNpEOOKHdXJrM2FGPFBdnC4eDk7Jj7NJR+vtCb7GqfWlV/NoC1MLybzfJWJKp6NcF/LFxXCmKcvdiz21yQk+8InX3rwiXihpGyHgAytc5B2xWs0JzsIo9TxfnMxc3y2DO11TyKq9YMtpQYn73WWV6mvdolj3fKb0njr7+bUI1fQw6FyIJTMhSyvQIjYNEr/wruwpMvgRFv4n90kyfgJvrOvBM4FIYsL1aZ5QsdoR3tk3MPPQ2g8WicFb7dZtI/i0mSW8FjoGPMWuq0f9JnNsCpoHvNS8Ul/TWdOi4mWBwPbJi33P015oMUeWSjGla/MfZEKC4ppAFZZIpI404+zKLdTu0WtWWG9SKSW70W/NL0btQVrGWMmVFZTYFwLqeonBnYeBJiPTB9Do6U0K1sIz0L67guqkrNmIVH6kVHnaOl8lEjNfdu8V1y47XQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4010.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(66946007)(316002)(71200400001)(76116006)(55016002)(7416002)(2906002)(9686003)(86362001)(53546011)(38100700002)(66556008)(83380400001)(64756008)(66446008)(122000001)(66476007)(8676002)(508600001)(5660300002)(52536014)(8936002)(6506007)(186003)(110136005)(54906003)(4326008)(99936003)(6636002)(7696005)(38070700005)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?dWU3dUlQMkxQdmlKWnAzOHFmVXRKZVVBa3ZKRERwOFU2WFFZQUhHVW1KM3Ix?=
 =?gb2312?B?WFFNeE9HVTd0YmoxbDN6RG1wYzFKd2ROSkgxUTFFaFpxU0xpUTAyVFIweHhn?=
 =?gb2312?B?UXBBMEZnMXZzeFozdnFqNkQzU05jTy9TTFlaVmJBbHlHY3RtQ3MzVk9SSStC?=
 =?gb2312?B?Q1RTdWNaRk5ORFcyYy9weXdEZWliYWpkMTZUc0VXalBmS3JQbkhIYnkxcnpE?=
 =?gb2312?B?d0d4akpLREp3bktweWZyMkl6VExLenRlOGVXOGdUdzJXb1VrcUxNYkx1emVP?=
 =?gb2312?B?cHdsYUNGOU45QnVkRnNTbXQ2UHZwOEdycmtvaWEvWHc4aU1EbEY0ZXdZVEcr?=
 =?gb2312?B?M05OVitVRVg3Rkx6cEVQKzVXdXVOSk1uRDdOL0Z6ZFlSV0d6MHVOdGg0TkUv?=
 =?gb2312?B?TnV3SE1xUlZOSDltdlBKN2FtTVp2ckhpM0s5OWV2VldSL2k4aldJN21pc1FK?=
 =?gb2312?B?aTdORERzOUwxRjkwRWJGT3AyazJHWlUxTmlXbEI1WnJKWlhuV1dzTXlmemEr?=
 =?gb2312?B?UWNHVTRHTW1LMDVQekZWeUNUc3pKK3pFWHZWZlhnQWJNUmJXSS9ZUlN0L3ZH?=
 =?gb2312?B?dmd6VEZobFA0WkRzVVlQdnRnRUNJQmtXMnBReTl5VE1IdEJlUTNaZ1hEVUd0?=
 =?gb2312?B?bWZ0N1VVMXNPRkZiUjF3RVA1MnJCenpaSDU0UCttZ2dBL1lHdHZEVWRUU3F3?=
 =?gb2312?B?TGlwdFpHSU93NDJndkYzNVlGS3VRKzB6UjlndnBTM2JCTFFudHVzSm5IUkJR?=
 =?gb2312?B?Mi9TN1dWTklKWFQ3YzNGQWtjdENwTlhTQVo2R0xWb1ZPWml4dW1CdmlZY01u?=
 =?gb2312?B?T3JsZm1kR2VrcXhaUkhKWlJ5V05YNzhmSXAzM2crM3pSQ2oyWG4zZXJ0c3dX?=
 =?gb2312?B?TVVqcVgxb0duczNCd2pyeTk2bWU3MFJLQS90VmpFaSszdmJPckhHRmJRbHZ3?=
 =?gb2312?B?cGhFcklFbGlGR3p1aTZjTTlCRUxhMkdvamo3NUl5Z1NLTTIvNUJmbTdWOThX?=
 =?gb2312?B?VTZMYWRHMTlxazdWRlpKWHNDODhjNEh2YkFhRWxMdW5tN2N3ek1NcnJQQmFh?=
 =?gb2312?B?RVY3YWlvTXplYUlLNFpLWENmWGJIUUpGZnpOb0t0N3BiRi9jeDRnaGFaYUhy?=
 =?gb2312?B?bDRRVHJ5alJKZDNwWDE5Mm5zN2NOWDdmTVoyODlVMDFQY1BnVnN4UXdQR1Jz?=
 =?gb2312?B?Y3BGYzVlOU1LZk9HYnY4b2lJMXorZ2pqZHg5bWpsUVZPTEQvY0g4S2ZDbDRq?=
 =?gb2312?B?U3U5S3BkNFRzY3RLRDFzU1NjMkt5UFh3QWlZWDNqM1RvcEhDVjV5RnluRENl?=
 =?gb2312?B?ejRNQ2QrN1J2Wmkrd3gvd0o1T21GU0xtanZYSVZCRFBrVWdpaGp4NFNFOERB?=
 =?gb2312?B?OGVBL2RsTS9PR09icWd3UGxnWkZ4WmNuaXNVY2hjcGRIZGprYUxoaGJhMEU0?=
 =?gb2312?B?THIxR0NVekhhdmNIQnMxMDAzTWRGbDg0b3RhQlhFVW5JWWs2Y1l0SXUrM2dH?=
 =?gb2312?B?UVlwQjJzU2d4WVRtWVNKVWdDV0w3TEt4aEd6M2hURWVMbHdhblhxVUtSQ1o4?=
 =?gb2312?B?enQza3ZRUG4wRzEvTVllYXB6azN2MFhQNlBpY0cxWStMc1NkRkxrVDhWaGFa?=
 =?gb2312?B?aUJoY1lXT1ZHYjZGYjlpa3pmNzRHc1ZMZXJBRVlqTEFLNEFCNHBYMm1GUTBw?=
 =?gb2312?B?N2hqN1VOR0U1a3FBQUI2TE9lU3VsNXVaQlE4UEduYTVPV1k1MXF2WE5uRlFI?=
 =?gb2312?B?MkpjczJReFE2QzlwV201YnUzbXc1NjFpUWpqZzdIK1A3L2M2Tk1TbDlaMks5?=
 =?gb2312?B?Vi9wR25lYndPNnFGZ0l3RTJsUUR5YWp6Zy9rYzZwVU5JaHJuNWFVbXlFSXlU?=
 =?gb2312?B?Ym81RXFuVjV6UEpmK3ZVSHZPcW1Ndlp3R21iSHZSZ3ZlVTB0ckhRZW40alU4?=
 =?gb2312?B?VWZCb2FwdWZnSFBNVENJOE9oTzgwczdET3duYlB0MUI2QzRPNHFXNDlDRHlo?=
 =?gb2312?B?UkRzRWNqcTZhdnZMQ21ZWUQzTDNQV0lKK2o4NmpoenNCOFhCclEydkdpaWJW?=
 =?gb2312?B?SjhBZyt6TUQ0Q3lkSlVnbi94T2daY2dMbGVQdTFoS1ZzUHB4eWtUSzZqNXFp?=
 =?gb2312?B?YnJsdmkza1M5eTc3STVoMDE3Tm5LcTQvby95N29yb3ArTTVmR00xSE9ISHRn?=
 =?gb2312?B?VHc9PQ==?=
Content-Type: multipart/signed;
        protocol="application/x-pkcs7-signature";
        micalg=SHA1;
        boundary="----=_NextPart_000_0148_01D7D09C.509274D0"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4010.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4443a71b-345e-41dd-7353-08d99e706748
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2021 02:19:45.4793
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dVpq0Z8p/tuuDpnyYH9Jrmcm4dJrg3cbADNRabCkIW15DaWxWFKvQxR3kUtH9ueeM4w82pDveP6riWDYg/W3Cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4380
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

------=_NextPart_000_0148_01D7D09C.509274D0
Content-Type: text/plain;
	charset="gb2312"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Jesse Taube [mailto:mr.bossman075@gmail.com]
> Sent: 2021=C4=EA11=D4=C23=C8=D5 6:57
> To: dl-linux-imx <linux-imx@nxp.com>
> Cc: mturquette@baylibre.com; sboyd@kernel.org; robh+dt@kernel.org;
> shawnguo@kernel.org; s.hauer@pengutronix.de; kernel@pengutronix.de;
> festevam@gmail.com; ulf.hansson@linaro.org; Aisheng Dong
> <aisheng.dong@nxp.com>; stefan@agner.ch; linus.walleij@linaro.org;
> gregkh@linuxfoundation.org; arnd@arndb.de; olof@lixom.net;
> soc@kernel.org; linux@armlinux.org.uk; Abel Vesa <abel.vesa@nxp.com>;
> adrian.hunter@intel.com; jirislaby@kernel.org;
> giulio.benetti@benettiengineering.com; =
nobuhiro1.iwamatsu@toshiba.co.jp;
> Mr.Bossman075@gmail.com; linux-clk@vger.kernel.org;
> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> linux-kernel@vger.kernel.org; linux-mmc@vger.kernel.org;
> linux-gpio@vger.kernel.org; linux-serial@vger.kernel.org; Jesse Taube
> <mr.bossman075@gmail.com>
> Subject: [PATCH v2 11/13] mmc: sdhci-esdhc-imx: Add sdhc support for
i.MXRT
> series
>=20
> From: Jesse Taube <mr.bossman075@gmail.com>
>=20
> Add support for i.MXRT1050's sdhc.
>=20
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>---
> V1->V2:
> * Nothing done
> ---
>  drivers/mmc/host/sdhci-esdhc-imx.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c
> b/drivers/mmc/host/sdhci-esdhc-imx.c
> index afaf33707d46..c852a6df5611 100644
> --- a/drivers/mmc/host/sdhci-esdhc-imx.c
> +++ b/drivers/mmc/host/sdhci-esdhc-imx.c
> @@ -305,6 +305,12 @@ static struct esdhc_soc_data usdhc_imx7ulp_data =
=3D {
>  			| ESDHC_FLAG_PMQOS | ESDHC_FLAG_HS400
>  			| ESDHC_FLAG_STATE_LOST_IN_LPMODE,
>  };
> +static struct esdhc_soc_data usdhc_imxrt_data =3D {
> +	.flags =3D ESDHC_FLAG_USDHC | ESDHC_FLAG_MAN_TUNING
> +			| ESDHC_FLAG_HS200 | ESDHC_FLAG_ERR004536
> +			| ESDHC_FLAG_BROKEN_AUTO_CMD23,
> +};
> +

Hi Jesse,
	I have few question here.
	Why only use manual tuning here? Does this usdhc don't support
standard tuning? or meet any issue when use standard tuning?
	Please also double check why not use ADMA in default? Any issue
found?
=09

Best Regards
Haibo Chen
>=20
>  static struct esdhc_soc_data usdhc_imx8qxp_data =3D {
>  	.flags =3D ESDHC_FLAG_USDHC | ESDHC_FLAG_STD_TUNING @@ -357,6
> +363,7 @@ static const struct of_device_id imx_esdhc_dt_ids[] =3D {
>  	{ .compatible =3D "fsl,imx7ulp-usdhc", .data =3D =
&usdhc_imx7ulp_data, },
>  	{ .compatible =3D "fsl,imx8qxp-usdhc", .data =3D =
&usdhc_imx8qxp_data, },
>  	{ .compatible =3D "fsl,imx8mm-usdhc", .data =3D &usdhc_imx8mm_data, =
},
> +	{ .compatible =3D "fsl,imxrt-usdhc", .data =3D &usdhc_imxrt_data, },
>  	{ .compatible =3D "nxp,s32g2-usdhc", .data =3D &usdhc_s32g2_data, },
>  	{ /* sentinel */ }
>  };
> --
> 2.33.1


------=_NextPart_000_0148_01D7D09C.509274D0
Content-Type: application/pkcs7-signature;
	name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="smime.p7s"

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
MjBFbnRlcnByaXNlJTIwQ0ElMjA1LENOPU5MQU1TUEtJMDAwNSxDTj1DRFAsQ049UHVibGljJTIw
S2V5JTIwU2VydmljZXMsQ049U2VydmljZXMsQ049Q29uZmlndXJhdGlvbixEQz13YmksREM9bnhw
LERDPWNvbT9jZXJ0aWZpY2F0ZVJldm9jYXRpb25MaXN0P2Jhc2U/b2JqZWN0Q2xhc3M9Y1JMRGlz
dHJpYnV0aW9uUG9pbnSGL2h0dHA6Ly9ud3cucGtpLm54cC5jb20vY3JsL05YUEVudGVycHJpc2VD
QTUuY3Jshi9odHRwOi8vd3d3LnBraS5ueHAuY29tL2NybC9OWFBFbnRlcnByaXNlQ0E1LmNybDCC
ARAGCCsGAQUFBwEBBIIBAjCB/zCBuwYIKwYBBQUHMAKGga5sZGFwOi8vL0NOPU5YUCUyMEVudGVy
cHJpc2UlMjBDQSUyMDUsQ049QUlBLENOPVB1YmxpYyUyMEtleSUyMFNlcnZpY2VzLENOPVNlcnZp
Y2VzLENOPUNvbmZpZ3VyYXRpb24sREM9d2JpLERDPW54cCxEQz1jb20/Y0FDZXJ0aWZpY2F0ZT9i
YXNlP29iamVjdENsYXNzPWNlcnRpZmljYXRpb25BdXRob3JpdHkwPwYIKwYBBQUHMAKGM2h0dHA6
Ly9ud3cucGtpLm54cC5jb20vY2VydHMvTlhQLUVudGVycHJpc2UtQ0E1LmNydDANBgkqhkiG9w0B
AQsFAAOCAQEAJpGYHveFzmgLQ4J62fcmPkd4wJ8urL46itMWCgyLBPRARYB9oArCqPd4j0Yl0RmS
F1oNZgVDYQTy2aLoe+YGm23TkdJsTx1ExTxtv+njRnvvlSXMMULlOIt25/Vj+vTZ/wjFDq6PJOSZ
MSQHaVHSUrkLBT1H0pBmCA1Ecjuo7gUpG5T2NqD5KJP083pJZ+nogA9TVC9Ob+jNx0d/UR7UgRLf
KOxBG05AakTa4luadPIRktiULtjzG20WDhvAIg4M9w1+9SV+LpvvqBtkovpCfj9Rf4pNRV1CjjTY
AFIH0s3Q11HnFd1UNHKUvpp7/SrTyxaCXBO68U5aJz4zDjwIPzCCB+swggbToAMCAQICEy0ABsdV
/0AV+3f0TucAAAAGx1UwDQYJKoZIhvcNAQELBQAwgbYxHDAaBgNVBAMME05YUCBFbnRlcnByaXNl
IENBIDUxCzAJBgNVBAsMAklUMREwDwYDVQQKDAhOWFAgQi5WLjESMBAGA1UEBwwJRWluZGhvdmVu
MRYwFAYDVQQIDA1Ob29yZC1CcmFiYW50MRMwEQYKCZImiZPyLGQBGRYDd2JpMRMwEQYKCZImiZPy
LGQBGRYDbnhwMRMwEQYKCZImiZPyLGQBGRYDY29tMQswCQYDVQQGEwJOTDAeFw0yMTA5MjIwMTMw
MTRaFw0yMzA5MjIwMTMwMTRaMIGaMRMwEQYKCZImiZPyLGQBGRYDY29tMRMwEQYKCZImiZPyLGQB
GRYDbnhwMRMwEQYKCZImiZPyLGQBGRYDd2JpMQwwCgYDVQQLEwNOWFAxCzAJBgNVBAsTAkNOMRYw
FAYDVQQLEw1NYW5hZ2VkIFVzZXJzMRMwEQYDVQQLEwpEZXZlbG9wZXJzMREwDwYDVQQDEwhueGEx
MjkzNzCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAL6VTRRCbJgUEuoR2bppNZQc3ghr
l0pDEZjK8uaayFYadelTc6iWe8EBLWrrOWd17yNeXc054yw+Yu8eI1IWMEE/mo5l93Kw+BkuCUda
vpqZUMOvaPDKkHNPBNPJ6AP+vmZW8p/46dxo6Nx6xGzkpbUZ1Ju1a9LuxeFQBNNvV54wYbFmoKJF
eQQ3RZdEafNucOw8ukTyWurcC8fPUQwqE1sFRdtjLeJWZBtrvNim4oikb5UFxcmoaQkJ/sqoJGZL
+bR3ZZx3101+Y7RJp56hfqT1eqkJkc7OTz+tsZx3p1a6r266NCB/RBIGVD2cFmhUs2Uitp/oB+9k
BhycuX8wowECAwEAAaOCBAowggQGMDwGCSsGAQQBgjcVBwQvMC0GJSsGAQQBgjcVCIWCwH6BjvRV
hu2FOILrmUuaklY/heaKboS14X4CAWQCATowEwYDVR0lBAwwCgYIKwYBBQUHAwQwDgYDVR0PAQH/
BAQDAgUgMAwGA1UdEwEB/wQCMAAwGwYJKwYBBAGCNxUKBA4wDDAKBggrBgEFBQcDBDCBlAYJKoZI
hvcNAQkPBIGGMIGDMAsGCWCGSAFlAwQBKjALBglghkgBZQMEAS0wCwYJYIZIAWUDBAEWMAsGCWCG
SAFlAwQBGTALBglghkgBZQMEAQIwCwYJYIZIAWUDBAEFMAoGCCqGSIb3DQMHMAcGBSsOAwIHMA4G
CCqGSIb3DQMCAgIAgDAOBggqhkiG9w0DBAICAgAwQQYDVR0RBDowOKAiBgorBgEEAYI3FAIDoBQM
EmhhaWJvLmNoZW5AbnhwLmNvbYESaGFpYm8uY2hlbkBueHAuY29tMB0GA1UdDgQWBBQY587dMxoS
HzI5SkUyoLrumaVa5jAfBgNVHSMEGDAWgBRYlWDuTnTvZSKqve0ZqSt6jhedBzCCAUYGA1UdHwSC
AT0wggE5MIIBNaCCATGgggEthoHIbGRhcDovLy9DTj1OWFAlMjBFbnRlcnByaXNlJTIwQ0ElMjA1
LENOPU5MQU1TUEtJMDAwNSxDTj1DRFAsQ049UHVibGljJTIwS2V5JTIwU2VydmljZXMsQ049U2Vy
dmljZXMsQ049Q29uZmlndXJhdGlvbixEQz13YmksREM9bnhwLERDPWNvbT9jZXJ0aWZpY2F0ZVJl
dm9jYXRpb25MaXN0P2Jhc2U/b2JqZWN0Q2xhc3M9Y1JMRGlzdHJpYnV0aW9uUG9pbnSGL2h0dHA6
Ly9ud3cucGtpLm54cC5jb20vY3JsL05YUEVudGVycHJpc2VDQTUuY3Jshi9odHRwOi8vd3d3LnBr
aS5ueHAuY29tL2NybC9OWFBFbnRlcnByaXNlQ0E1LmNybDCCARAGCCsGAQUFBwEBBIIBAjCB/zCB
uwYIKwYBBQUHMAKGga5sZGFwOi8vL0NOPU5YUCUyMEVudGVycHJpc2UlMjBDQSUyMDUsQ049QUlB
LENOPVB1YmxpYyUyMEtleSUyMFNlcnZpY2VzLENOPVNlcnZpY2VzLENOPUNvbmZpZ3VyYXRpb24s
REM9d2JpLERDPW54cCxEQz1jb20/Y0FDZXJ0aWZpY2F0ZT9iYXNlP29iamVjdENsYXNzPWNlcnRp
ZmljYXRpb25BdXRob3JpdHkwPwYIKwYBBQUHMAKGM2h0dHA6Ly9ud3cucGtpLm54cC5jb20vY2Vy
dHMvTlhQLUVudGVycHJpc2UtQ0E1LmNydDANBgkqhkiG9w0BAQsFAAOCAQEAsjJuJnMzvA59CAlY
87eQCOafWbMF4HfC4oobtAqboB48BtCZ5dOeo+X4XQRaSmTwFJ2hZjX614KFnRGXLk/nDIY4pp8+
fqfgHKUdY1ceVqs+Kjtabk3gY8zq7PtFUsAkwp4OW23kwphh7Awx1tf3XRZeOqwiVuk5V57GT8Tu
dKNiOZqut3mrcdZINNUsqjt7ZA82r4ov5MbEBHeWVjo7CeWbgZFZhKhMKC9+2DKEUkdDJUcDYqxz
+Rh+6B+dgxeYkTGIqHELhkMjMCC5SwRNHfCxXCI+qRy4zIAo2K3V96zs3ungqiFZuFrpatfSBfAL
d86AIrOgsHhvOB0UU1W//zGCBLMwggSvAgEBMIHOMIG2MRwwGgYDVQQDDBNOWFAgRW50ZXJwcmlz
ZSBDQSA1MQswCQYDVQQLDAJJVDERMA8GA1UECgwITlhQIEIuVi4xEjAQBgNVBAcMCUVpbmRob3Zl
bjEWMBQGA1UECAwNTm9vcmQtQnJhYmFudDETMBEGCgmSJomT8ixkARkWA3diaTETMBEGCgmSJomT
8ixkARkWA254cDETMBEGCgmSJomT8ixkARkWA2NvbTELMAkGA1UEBhMCTkwCEy0ABsdWyH4wxYEw
yQ4AAAAGx1YwCQYFKw4DAhoFAKCCArkwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG
9w0BCQUxDxcNMjExMTAzMDIxOTQxWjAjBgkqhkiG9w0BCQQxFgQUfuaDrby5jnDi1psCcEQ9Wl7P
B8owgZMGCSqGSIb3DQEJDzGBhTCBgjALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAoGCCqGSIb3
DQMHMAsGCWCGSAFlAwQBAjAOBggqhkiG9w0DAgICAIAwDQYIKoZIhvcNAwICAUAwBwYFKw4DAhow
CwYJYIZIAWUDBAIDMAsGCWCGSAFlAwQCAjALBglghkgBZQMEAgEwgd8GCSsGAQQBgjcQBDGB0TCB
zjCBtjEcMBoGA1UEAwwTTlhQIEVudGVycHJpc2UgQ0EgNTELMAkGA1UECwwCSVQxETAPBgNVBAoM
CE5YUCBCLlYuMRIwEAYDVQQHDAlFaW5kaG92ZW4xFjAUBgNVBAgMDU5vb3JkLUJyYWJhbnQxEzAR
BgoJkiaJk/IsZAEZFgN3YmkxEzARBgoJkiaJk/IsZAEZFgNueHAxEzARBgoJkiaJk/IsZAEZFgNj
b20xCzAJBgNVBAYTAk5MAhMtAAbHVf9AFft39E7nAAAABsdVMIHhBgsqhkiG9w0BCRACCzGB0aCB
zjCBtjEcMBoGA1UEAwwTTlhQIEVudGVycHJpc2UgQ0EgNTELMAkGA1UECwwCSVQxETAPBgNVBAoM
CE5YUCBCLlYuMRIwEAYDVQQHDAlFaW5kaG92ZW4xFjAUBgNVBAgMDU5vb3JkLUJyYWJhbnQxEzAR
BgoJkiaJk/IsZAEZFgN3YmkxEzARBgoJkiaJk/IsZAEZFgNueHAxEzARBgoJkiaJk/IsZAEZFgNj
b20xCzAJBgNVBAYTAk5MAhMtAAbHVf9AFft39E7nAAAABsdVMA0GCSqGSIb3DQEBAQUABIIBALPN
Mq2Ma4kOoPickMrC0rmhzWzD38kJ9YqybHa/3Mp3mV+ZIHyi1ZQdRCV6srHQSq/o1Ky8hspH1HHL
zcZNlA3LGI2AMr7x7pcoD1T5tIsDdxPKpohnWq1rZQKUpYHbwNt3NQTSoWBXG59O/5ZW0g9v0WRE
5FCZ8A/Oxd3TPcI1X6aseURPSePFdF9Jb/GQkZHll1xl/3MhVbGkr8oqfaRfI2pOcOCOpAxh2fGQ
Md9tL5hljnb5ceudeedlXpqqP5kGGXHADnfF6K/o692Nwk0cc8kZMvOc3Gq2bQRNr252krr/715d
qkzJfR++OEBc9J+DPEGxCTsmB9RHA0EvxSkAAAAAAAA=

------=_NextPart_000_0148_01D7D09C.509274D0--
