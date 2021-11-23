Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62A05459B3E
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Nov 2021 05:31:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231451AbhKWEfC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Nov 2021 23:35:02 -0500
Received: from mail-eopbgr80040.outbound.protection.outlook.com ([40.107.8.40]:30982
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229553AbhKWEfA (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 22 Nov 2021 23:35:00 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DjkGGkxZSnAQBVUN2kN06Nx/hOfHz0AsiRSbPftrsBPaUupy6NclGqDHeFCGARFrXf/ORBr6ExRCU6V7+FPQvSCYzFo+hdr/7ofjRORT88BxVgCe50e0Y15q5agna5fGGj6Pa0LbgxCjxr+XZcHwuGgHyczwLLZkAps9jqs4KfRKHajGaW2KzbJV664Z6Du6pnrbJfTxZjJOkZ1khbaTKaX8S9sN4HdJbkkLjkBLkh9DCB5NfEF9SB3nf4ES/zIYiF0iVY1yh+pJJvUa/Cx2kbc/8GsBvNJfzXdpHvsyVFzPIkSmYPZLxEw/pJymjRaXmhxszz9yt8dJfxgGWX8zyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ecbKa6tDkhC/HpIZ1xs0ogttDLMl6nCcKOUNQ91i6ZU=;
 b=kwp4xXCZY/6g6xm3SDG9NgmyjISU9/URNJktjxiKlI/1gfX8M8Ftdwx1HusctlN/4fn66AKVrsH3ZIk8ONny0hrhv9GDm+1zBXvq4A18VHeYDISzQbjbW+OHs/csjeeczeVzLbOUIE58vXOLXgoCxS9Wnn4hQBKoy1lzJIan5s51BFVfMkmuLlVDe4s5C9vwj22qRwlsHVS6xPMjfrQxHlJfi5wKXMlVmlwmFA2XgdHStISwDzQereRw4NxAq0nAEoFIUyL1lmJwJnVR4kswuh90fJmzFXAyO2juw4bX7XqsPRQX8VqNdCDFqmiIrs7VS1gJ4XXW+vKmERg/pBDASg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ecbKa6tDkhC/HpIZ1xs0ogttDLMl6nCcKOUNQ91i6ZU=;
 b=Di14OTmzuRruWH1B6Vt7M5j9I0tNmo48vc+UV1/NklyAI7Ox6x/i2uvLqnsaiRU10B03w8HmwQzPRaritEcrHIDINUiEiXLQE36vQnpb1Pz19vXDVWzn4q7/hy4NLhYp75ybcvHzA5cAusO84k3L0HAqDLgZ59yYSTFn4f8SQw8=
Received: from VI1PR04MB4016.eurprd04.prod.outlook.com (2603:10a6:803:4a::27)
 by VI1PR04MB4110.eurprd04.prod.outlook.com (2603:10a6:803:42::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Tue, 23 Nov
 2021 04:31:50 +0000
Received: from VI1PR04MB4016.eurprd04.prod.outlook.com
 ([fe80::f9e6:287:5bad:b6fa]) by VI1PR04MB4016.eurprd04.prod.outlook.com
 ([fe80::f9e6:287:5bad:b6fa%6]) with mapi id 15.20.4690.027; Tue, 23 Nov 2021
 04:31:50 +0000
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
Thread-Index: AQHX0D0AJ7FLhc5hlkSFa85u3j6wJ6vxDoKwgB+BOoCAABHEUA==
Date:   Tue, 23 Nov 2021 04:31:49 +0000
Message-ID: <VI1PR04MB4016A93023DA6816D50B094690609@VI1PR04MB4016.eurprd04.prod.outlook.com>
References: <20211102225701.98944-1-Mr.Bossman075@gmail.com>
 <20211102225701.98944-12-Mr.Bossman075@gmail.com>
 <DB7PR04MB401021F7155E723194BA857E908C9@DB7PR04MB4010.eurprd04.prod.outlook.com>
 <9bcb9068-25f5-edfb-98a0-92a7e9cc1909@gmail.com>
In-Reply-To: <9bcb9068-25f5-edfb-98a0-92a7e9cc1909@gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 58e33868-93a1-4bc8-440e-08d9ae3a2ae6
x-ms-traffictypediagnostic: VI1PR04MB4110:
x-microsoft-antispam-prvs: <VI1PR04MB4110665899C7BC938A00CCFE90609@VI1PR04MB4110.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:167;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iZRUmZnzB/RWYlz/OmtrE9Wa+LDcimIzIiutJ/T5ucceqIWpDn+STA32MK6kiNddpvTRq3FqIfLV5DgOsVpWHJjZnXa8t5abvPQVvSRFJyOlaZeLTtP3ipSwllKijCr5YXiloSc7FWtvcj/70P1FEh2IhPiPhGitYkLh6b/r7Dnn31FWPkXzzmktgRnZwDWMycgT1rQjwGNG8ZFGiTHb0Fd6wMSxV2TmUjLYtjBWBf4BwTo9EkPL8MA5YwmC+uABgAgGww9hPrKiTWqaunZXKoi9ocjr4CfW4OBhsnMYnEVXXXJ8LH5vSIW/DDfBmurU7gsCbj7u73DQ6NelGIfT2zLNuNgY56Rn4H7/CZTDT1eU+kX99z6TbawpVKeNYUJ4MKDaOtTIUvCgnX1cjqkWaQ7+FreI5thjwRNeRrtYh7GNunW1aHW3vbgaYkDYJoLN1VhLy+mzqP+Ds+3TtG3x0dIqjV2u0OhywNH8SNRa5WemrhiEGW7XwJViRY3oFycLF5zqEps8zZX4blXFcJ7tNKny5KqMBScoJ9NTIiLOmgHFJjUomdYoe2M/2ok14tApYht97QYX1njO61XCnt1cO1Wshyv0jD21AujDAHYTMy8+2SHO7eZ0zs9d1gTB13tgpbmWS/cdOGlRJKFn30xSfMCo6MZuYKSeL8itciHLebt6YTlFdIfse1XOEAmTO/xXp3ELYTBebdOiXDL8nzp/4Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4016.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(52536014)(9686003)(5660300002)(83380400001)(2906002)(4326008)(7696005)(66946007)(8676002)(66556008)(8936002)(33656002)(99936003)(6636002)(66446008)(54906003)(110136005)(7416002)(86362001)(64756008)(66476007)(76116006)(316002)(122000001)(38100700002)(508600001)(53546011)(6506007)(38070700005)(26005)(186003)(71200400001)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WlhNSUhuSkhJbDhwZzdiL1ZBeVRqTElSQzZKSXkxalh4cEhMczVIVUhTcUtr?=
 =?utf-8?B?anJ0WjhSN0pxbWpkcHNrQndvMURKYU9qQnBZKy8vUlNMTGJCYWVQRjU5YUtW?=
 =?utf-8?B?RkdmVzRqZUlwOElyNURGOVZnMktETEdTMmdReHdUL1kzaU1TNXUzcENBeXNt?=
 =?utf-8?B?Q2RFRTdWeGh3aWNTUjRaY1lEQ1ZpTjdGb2FYd1VHUE0zSHJGb3k4WENnREJU?=
 =?utf-8?B?UHhvcFFmalQ0OEorRWtBS0h6MjI2VHlyNFhMczljV2hiU1c1U0lVYnlKN2lr?=
 =?utf-8?B?NjJTdTBWelpoMUYyNEgyNDV4R01LMkJ4S012TGJqSGxWLzYzT0ppU2FhaEhr?=
 =?utf-8?B?aVFFcVpCQ0RGTDZPNGNmTk1VWVloMmYwVHg2NnNFdEVVRXc3NzFJbDluaFZH?=
 =?utf-8?B?Rm5aRnF0d1o0dVUvUURGS1k2a1I0ZHZrdU8zUHFhc1M0ZzdIa0I4V29sVDVm?=
 =?utf-8?B?WFYyOERBQlFFdGZKd1NJa0FQUkFIcWNPYWV6VXBWV2pBa2tlK3lxcU9rL1ov?=
 =?utf-8?B?eGMrYzI1Mm1EZ1lMYUxTa0tDOU9SY1BBUCtkSk9NN29Qckhhb3lGYm54OG9S?=
 =?utf-8?B?SkMxc1NGaDNMN1VNeDVnWDlLVnlBc3h2bG01MkxMcXV0YmR5VHB2OU1sMzlX?=
 =?utf-8?B?SG02MVlQclNFYVRvNEJoZS8vaDFkaTdZWEtDcm5BNEgyMGVxU3Zpb2praFZt?=
 =?utf-8?B?d2NwVnIrTFhYNm9kalJVaDBNcmxkR2I3YTBocUNVWGVmeXErQ3pQYkQxL1hJ?=
 =?utf-8?B?eGo4TlRKU2RJWWY5OXJNdDgzRzBKQ2o3MnhPcTlPSXVMbFQ0aEhEZjdDUk9v?=
 =?utf-8?B?aXJRM0s3dWp0MThOUlV4N0NscnRvVFZzV0o4SzJpQk14c1ZZLzRacGFUODhi?=
 =?utf-8?B?RDBvS0NKVFRSWWlzWVlrUXV3WTh6ZGI0b081THFac1hrdzdENGtNOEtwcVhV?=
 =?utf-8?B?VnpFYllRbE9ta0RzajRqeHpYOG9MSEJkb09JKzBLV3Y4YjNvZ0tJbktFcHVR?=
 =?utf-8?B?UzhEdzBoZFNvSXhDeWRGT3pWVTl5dytNRmk3OGdvcDlTVjBIWjJpSFMzUm05?=
 =?utf-8?B?K0RtcU5Ya2p2enV1MnlualFUZzcvV0FGRmtGK2FCL3JmaFRGRmZYSklaNitH?=
 =?utf-8?B?WVB6T1ZYb1Q1YjRPWmtBdzhoVldjSnlyRkdMeFdkNlR5ei9tRDN1Tm1tYWdN?=
 =?utf-8?B?SUwraXEvcmE4NEJlOWpDeUhGZ1RHaUo4TDNOV0VKSEJGS212N21tdFpWUUJU?=
 =?utf-8?B?bmRkb0lHblpnRko2VzRRait4UDhjMjNSWHlVc3pSVGQ5aUc0Z1BnWWpjSkRY?=
 =?utf-8?B?eUVDZitSOVdPOVdrSnpTd1JOcDdIcjBQWUNNK296dFUxd1V0SGxzYU1tRlI5?=
 =?utf-8?B?WXMvMGFmY3J1b25TaGYxZTMwc0Zja21tZ2RsRWozZEs4MGFUSFFyZjhxZWVt?=
 =?utf-8?B?b29rUzlXV0p3UDhQVDhKdEpxTEEwNjludTBWbkpGa3B3QWlDaWwySHg0OXM5?=
 =?utf-8?B?UTducEtSdm9aM3c5bFVUWVVvcnZIaEdkOW9jb1lzeUVuSUtsSzhiM1E3K0Fz?=
 =?utf-8?B?T0RXeXVPOHgvaXRGOWJzbXBwODBMbnJLak1OQjgrUnU3TDJPRko4eFdSZW5S?=
 =?utf-8?B?eXdpUVZRcHNyYk4yWXZ3UllPQ3I4Ym9PT01mZzdXWlROQnBrVEpKUnBwWHVE?=
 =?utf-8?B?bDFtS3ovZ1M5STRnakw5bjVmcjREeWlCWTZXeEdPM0wybjRFenJRdVBHTlVW?=
 =?utf-8?B?WlFxZk1lZGJMZ2psZy9EN0dPVi96WnZVcVJOUnhsaXJUOXNPdVYwWGw5c2ZO?=
 =?utf-8?B?SWlrODZYRktnU3YxeVozenk2WmRRK1RPUllGVEJMU0YrSlNHcXozaXM1Rjhr?=
 =?utf-8?B?Vzh0QktucXRmZXRjbVd2VTgrQjV1MGNNYWVOeHd0TFNWaU1nQmxlSXFPeU1I?=
 =?utf-8?B?L3BVeTdieDEwOHJnbW9nT0g3ZWh5MHVUWmlnbWp2aEJBcEhZZTVMNXRJUmNX?=
 =?utf-8?B?YUx4c042YlJLQTFtY09wV3dYdGtEa25NeTBnQUJ2Zi9TNEx1ZHVjUkxqUnQ4?=
 =?utf-8?B?b3hmcklMRVBNcDEwRHBrekVrcE5ERlIxQVordnF0WUVCYlY4Q3VLUlc5c2Yr?=
 =?utf-8?B?UitQS2VhdGtwUUxmbmsxSzdPKzdYUmx5cnhyQitaRktZelZtWjJsM2pqQnNO?=
 =?utf-8?B?bEE9PQ==?=
Content-Type: multipart/signed;
        protocol="application/x-pkcs7-signature";
        micalg=SHA1;
        boundary="----=_NextPart_000_00F8_01D7E066.13FBE400"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4016.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58e33868-93a1-4bc8-440e-08d9ae3a2ae6
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2021 04:31:49.9706
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XgtieggvnDkWhUHJZp6bSKR50CYz7ZW43WBysdtEFDzsdDk6weC9SVL3uulDDG3nA0P0AFyo7xpCmUxhN7LOUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4110
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

------=_NextPart_000_00F8_01D7E066.13FBE400
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable


> -----Original Message-----
> From: Jesse Taube [mailto:mr.bossman075@gmail.com]
> Sent: 2021=E5=B9=B411=E6=9C=8823=E6=97=A5 11:14
> To: Bough Chen <haibo.chen@nxp.com>; dl-linux-imx <linux-imx@nxp.com>
> Cc: mturquette@baylibre.com; sboyd@kernel.org; robh+dt@kernel.org;
> shawnguo@kernel.org; s.hauer@pengutronix.de; kernel@pengutronix.de;
> festevam@gmail.com; ulf.hansson@linaro.org; Aisheng Dong
> <aisheng.dong@nxp.com>; stefan@agner.ch; linus.walleij@linaro.org;
> gregkh@linuxfoundation.org; arnd@arndb.de; olof@lixom.net;
> soc@kernel.org; linux@armlinux.org.uk; Abel Vesa <abel.vesa@nxp.com>;
> adrian.hunter@intel.com; jirislaby@kernel.org;
> giulio.benetti@benettiengineering.com; =
nobuhiro1.iwamatsu@toshiba.co.jp;
> linux-clk@vger.kernel.org; devicetree@vger.kernel.org;
> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org;
> linux-mmc@vger.kernel.org; linux-gpio@vger.kernel.org;
> linux-serial@vger.kernel.org
> Subject: Re: [PATCH v2 11/13] mmc: sdhci-esdhc-imx: Add sdhc support =
for
> i.MXRT series
>=20
>=20
>=20
> On 11/2/21 22:19, Bough Chen wrote:
> >> -----Original Message-----
> >> From: Jesse Taube [mailto:mr.bossman075@gmail.com]
> >> Sent: 2021=E5=B9=B411=E6=9C=883=E6=97=A5 6:57
> >> To: dl-linux-imx <linux-imx@nxp.com>
> >> Cc: mturquette@baylibre.com; sboyd@kernel.org; robh+dt@kernel.org;
> >> shawnguo@kernel.org; s.hauer@pengutronix.de; kernel@pengutronix.de;
> >> festevam@gmail.com; ulf.hansson@linaro.org; Aisheng Dong
> >> <aisheng.dong@nxp.com>; stefan@agner.ch; linus.walleij@linaro.org;
> >> gregkh@linuxfoundation.org; arnd@arndb.de; olof@lixom.net;
> >> soc@kernel.org; linux@armlinux.org.uk; Abel Vesa =
<abel.vesa@nxp.com>;
> >> adrian.hunter@intel.com; jirislaby@kernel.org;
> >> giulio.benetti@benettiengineering.com;
> >> nobuhiro1.iwamatsu@toshiba.co.jp; Mr.Bossman075@gmail.com;
> >> linux-clk@vger.kernel.org; devicetree@vger.kernel.org;
> >> linux-arm-kernel@lists.infradead.org;
> >> linux-kernel@vger.kernel.org; linux-mmc@vger.kernel.org;
> >> linux-gpio@vger.kernel.org; linux-serial@vger.kernel.org; Jesse =
Taube
> >> <mr.bossman075@gmail.com>
> >> Subject: [PATCH v2 11/13] mmc: sdhci-esdhc-imx: Add sdhc support =
for
> > i.MXRT
> >> series
> >>
> >> From: Jesse Taube <mr.bossman075@gmail.com>
> >>
> >> Add support for i.MXRT1050's sdhc.
> >>
> >> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> >> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>---
> >> V1->V2:
> >> * Nothing done
> >> ---
> >>   drivers/mmc/host/sdhci-esdhc-imx.c | 7 +++++++
> >>   1 file changed, 7 insertions(+)
> >>
> >> diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c
> >> b/drivers/mmc/host/sdhci-esdhc-imx.c
> >> index afaf33707d46..c852a6df5611 100644
> >> --- a/drivers/mmc/host/sdhci-esdhc-imx.c
> >> +++ b/drivers/mmc/host/sdhci-esdhc-imx.c
> >> @@ -305,6 +305,12 @@ static struct esdhc_soc_data =
usdhc_imx7ulp_data
> =3D {
> >>   			| ESDHC_FLAG_PMQOS | ESDHC_FLAG_HS400
> >>   			| ESDHC_FLAG_STATE_LOST_IN_LPMODE,
> >>   };
> >> +static struct esdhc_soc_data usdhc_imxrt_data =3D {
> >> +	.flags =3D ESDHC_FLAG_USDHC | ESDHC_FLAG_MAN_TUNING
> >> +			| ESDHC_FLAG_HS200 | ESDHC_FLAG_ERR004536
> >> +			| ESDHC_FLAG_BROKEN_AUTO_CMD23,
> >> +};
> >> +
> >
> > Hi Jesse,
> > 	I have few question here.
> > 	Why only use manual tuning here? Does this usdhc don't support
> > standard tuning? or meet any issue when use standard tuning?
> No std tuning works, so does cmd23, i changed it to use them.

Okay.

> > 	Please also double check why not use ADMA in default? Any issue
> > found?
> Yes this is the output with ADMA:
> [0.00] mmc0: Unable to allocate ADMA buffers - falling back to =
standard DMA
> NOTE: I did not look into why this occurs.

If you config enough space for CMA or DMA pool, I think =
dma_alloc_corherent() should not meet issue.
ADMA descriptor do not large than one page(4KB). This is not big. Seems =
strange.

Please double check this. If this is really a limitation on imxRT, I'm =
okay to use SDMA as default.

Best Regards
Haibo chen
> >
> >
> > Best Regards
> > Haibo Chen
> >>
> >>   static struct esdhc_soc_data usdhc_imx8qxp_data =3D {
> >>   	.flags =3D ESDHC_FLAG_USDHC | ESDHC_FLAG_STD_TUNING @@
> -357,6
> >> +363,7 @@ static const struct of_device_id imx_esdhc_dt_ids[] =3D {
> >>   	{ .compatible =3D "fsl,imx7ulp-usdhc", .data =3D =
&usdhc_imx7ulp_data, },
> >>   	{ .compatible =3D "fsl,imx8qxp-usdhc", .data =3D
> &usdhc_imx8qxp_data, },
> >>   	{ .compatible =3D "fsl,imx8mm-usdhc", .data =3D
> &usdhc_imx8mm_data, },
> >> +	{ .compatible =3D "fsl,imxrt-usdhc", .data =3D &usdhc_imxrt_data, =
},
> >>   	{ .compatible =3D "nxp,s32g2-usdhc", .data =3D =
&usdhc_s32g2_data, },
> >>   	{ /* sentinel */ }
> >>   };
> >> --
> >> 2.33.1
> >

------=_NextPart_000_00F8_01D7E066.13FBE400
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
9w0BCQUxDxcNMjExMTIzMDQzMTQ1WjAjBgkqhkiG9w0BCQQxFgQUgLGxSIWOxJ/NnqXzTXeJuV8c
WhswgZMGCSqGSIb3DQEJDzGBhTCBgjALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAoGCCqGSIb3
DQMHMAsGCWCGSAFlAwQBAjAOBggqhkiG9w0DAgICAIAwDQYIKoZIhvcNAwICAUAwBwYFKw4DAhow
CwYJYIZIAWUDBAIDMAsGCWCGSAFlAwQCAjALBglghkgBZQMEAgEwgd8GCSsGAQQBgjcQBDGB0TCB
zjCBtjEcMBoGA1UEAwwTTlhQIEVudGVycHJpc2UgQ0EgNTELMAkGA1UECwwCSVQxETAPBgNVBAoM
CE5YUCBCLlYuMRIwEAYDVQQHDAlFaW5kaG92ZW4xFjAUBgNVBAgMDU5vb3JkLUJyYWJhbnQxEzAR
BgoJkiaJk/IsZAEZFgN3YmkxEzARBgoJkiaJk/IsZAEZFgNueHAxEzARBgoJkiaJk/IsZAEZFgNj
b20xCzAJBgNVBAYTAk5MAhMtAAbHVf9AFft39E7nAAAABsdVMIHhBgsqhkiG9w0BCRACCzGB0aCB
zjCBtjEcMBoGA1UEAwwTTlhQIEVudGVycHJpc2UgQ0EgNTELMAkGA1UECwwCSVQxETAPBgNVBAoM
CE5YUCBCLlYuMRIwEAYDVQQHDAlFaW5kaG92ZW4xFjAUBgNVBAgMDU5vb3JkLUJyYWJhbnQxEzAR
BgoJkiaJk/IsZAEZFgN3YmkxEzARBgoJkiaJk/IsZAEZFgNueHAxEzARBgoJkiaJk/IsZAEZFgNj
b20xCzAJBgNVBAYTAk5MAhMtAAbHVf9AFft39E7nAAAABsdVMA0GCSqGSIb3DQEBAQUABIIBAL3E
ccbiqTbchx5/VHVc3TmoXh76Um5K4oBGfkiKwOCVPLMWmKeqbr57cBjCTGXt9wLSoeaV5FTCE0//
A4P4FLRswLMjjP+/rfU+yNilEbvXtSvXWKZB7h8BgCa1XB73gFovRSiUlN2cQwmUs/DcuUje1tDJ
2mEMHkNbC2jCr4ESkd6UkQ8WSMqIuvEEcvRXn30RGflaGTJXwoXdI8bNlRA/7BrDdAyCMcK2FQyw
f2h0+4K6mRQ9rOgA8FZ8GJIL8a6eXCtRzAQT2M24bXswFxwQxOlX81MabVMDkIh7FW3r6fnWECDo
6u+84XlWiqfePCWtWJUfqCVLoQE9OXCf/joAAAAAAAA=

------=_NextPart_000_00F8_01D7E066.13FBE400--
