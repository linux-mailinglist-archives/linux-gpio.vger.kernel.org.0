Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F85A2D97E6
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Dec 2020 13:14:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407371AbgLNMNm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Dec 2020 07:13:42 -0500
Received: from mail-eopbgr1300115.outbound.protection.outlook.com ([40.107.130.115]:22112
        "EHLO APC01-HK2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731411AbgLNMNl (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 14 Dec 2020 07:13:41 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N12tinANFwssjb5sRTAjKlISa8ewCv1DK/7CvKONFmM+VIz60QVH4Qh3eJSB8OE36keS6eIE/0CXOoAMpe6VHOEBGwlTr6sIQAG3XsUhrYwBVmGrAB1H8nnp5TZVBSOOstgKJLYetR5mijB2MApQ7SIouIsgxe0aJ+q9dmWaZ/3lFh9Rr8Pa0I+l+3VzxB7uBdudLk+vi/rHODeqt+NP0D+K5gkJ1UuuZQmw5YIaRud6j4VYE/uOSuxyxqbEQbYh3Yg5wYyEw0WE6J/NwXy1RM1RgnABsGq4DU1nmP4jZMFVYKt6MKS675LZ/ZQ2EyHd8iMBFsUfoQVqPeCGlslQrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TUj1nZhhnUNtG73fRQ79Gmz1HHBVieRY366xBxwmKrI=;
 b=Z2xs6DqVWV7BWPJcDHc7zAot4qVcoHDPN35mb3uDy+fPMozcDyeFclhBtFN9HC7MmqX6H6RyAMA9kl1djaL35z2CRMI+5YyrK0DXNfQOc1z4cknyU41n51DwPUzWu+Mgjyg4m2LYc3MPbNCSIwrfqRG7d3etzmj8923TRcqJl/VoXMdWWpuZlAseS6vQBiRbknsla1RwLXKgt/53ldkd0+KM4pYJfh5Z4zuxwbBVJTkQIm0FZgSz3/iwFQqU0U+W5hosRUIRCqWX9hcQFjA0A8IEhFEzjLajtGXdgEzUb9Cy5IGFQGVmdq1rOsTD/BQqHmZc1S0JgrvRXs7DBNLXbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TUj1nZhhnUNtG73fRQ79Gmz1HHBVieRY366xBxwmKrI=;
 b=iZZv17Hsi4Z85Pnup6F98rNfTaJuigE7Jwn5PwhVzlfkkY61f9Cn4WoRGeyZhm7I+3iKmeKCscRegILSLAHLWRz7HZAWuflqBa1LWjvBe0XmX7Tje2eaB5vYb1vVJBhJ1LVXAn2rK0l7+oVh/m0LxJ1+md0Hxf7/tC8QZ4dJ9MM=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TY2PR01MB4507.jpnprd01.prod.outlook.com (2603:1096:404:10f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.18; Mon, 14 Dec
 2020 12:12:06 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::2023:7ed1:37c3:8037]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::2023:7ed1:37c3:8037%5]) with mapi id 15.20.3654.025; Mon, 14 Dec 2020
 12:12:06 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "marek.vasut+renesas@gmail.com" <marek.vasut+renesas@gmail.com>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "matti.vaittinen@fi.rohmeurope.com" 
        <matti.vaittinen@fi.rohmeurope.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>
CC:     Khiem Nguyen <khiem.nguyen.xt@renesas.com>,
        "linux-power@fi.rohmeurope.com" <linux-power@fi.rohmeurope.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 08/10] mfd: bd9571mwv: Use the SPDX license identifier
Thread-Topic: [PATCH v2 08/10] mfd: bd9571mwv: Use the SPDX license identifier
Thread-Index: AQHWz7CtFkd987I01keBlE++ccgF9an2hOYw
Date:   Mon, 14 Dec 2020 12:12:06 +0000
Message-ID: <TY2PR01MB369272E63DA6E4E62A64B585D8C70@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <1607686060-17448-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1607686060-17448-9-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1607686060-17448-9-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: renesas.com; dkim=none (message not signed)
 header.d=none;renesas.com; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [240f:60:5f3e:1:1453:ff:c191:5a7a]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 8c594d3d-f6ce-4d83-dcce-08d8a0297977
x-ms-traffictypediagnostic: TY2PR01MB4507:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY2PR01MB45073028A025FD0D022FD89DD8C70@TY2PR01MB4507.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:983;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rvJzMF6HHnjw/Sp+ZnGrWEP6urckpeBPtyxhwyGCf3QrE6AGYCG3o+aplk6X71wK5WGBLtGJENuscoKfRcqgQOl7hKlLxKzPQPXpxoHQnTOTuxmWgahmUOjdX+bBfXHJg604hOmk5JdsE2H7BEasla9u205g6cjSIOlzn/9OnPZwDFf4bPmHkKs+EISFROh+AUYea2zQ2AQTyg7iqAX3/d9gtTUDIzH/W/cWf1ZXTFTn7WOkGMxvJB4deXtVZoMxvH9itrF1vZ+4m4SuUMgjM1Gbx9nktEX8v7yR8+ArA+RwcLLFlaQMh98Pe/NhoN2aeeHxaNFDFM0w5K+Op/EbvnVM2Lzj9oUJr1aDixm0oXJc1X3aCL/YMW85FX6rSYwp8DLXBMyKGuCLgF92tSCyUw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(366004)(376002)(346002)(136003)(8936002)(186003)(316002)(71200400001)(33656002)(9686003)(7416002)(76116006)(66946007)(4744005)(66446008)(4326008)(66556008)(86362001)(55016002)(6506007)(5660300002)(966005)(478600001)(110136005)(54906003)(7696005)(2906002)(8676002)(66476007)(64756008)(52536014);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?iqRdvWnojaOu4UcicG2QaXdZ5wqIkGUbs2NEBw5eIFqyHj2GqnK9DnR/q1pq?=
 =?us-ascii?Q?b6coMcH25seAmPsUWNdjHlz3XwsUhWYZZWn+q7SiqJqVQZhYJICuLdoSnifj?=
 =?us-ascii?Q?HP99O4cdQ0xpKbyi9NtnzXEl7y9ruFWW1GMYZ/KGy1lVj+IXKDpaM8+QzxMI?=
 =?us-ascii?Q?ecazyiQscAPDa5L+km3+kiMyHToKRGd7sV3lWv/rQUi0x76N3h0hWC5s8+oU?=
 =?us-ascii?Q?8dtr27CQgLMgtqEQ/anBqykXBA0LCQ5yLLZlARnpr360SPLjqkoJp7oudYEu?=
 =?us-ascii?Q?zpr2JJL1b9t8FHlkmCAxWTLH3op2lYueT6g3iWrlrSyvKenSSy5e9u3u/VTi?=
 =?us-ascii?Q?sFVdEe011QdBJNI+9wf7jeaOS6BcFPqMZK7SqyiE20W9D2oZUx1FH3oMYDIn?=
 =?us-ascii?Q?S8BtlxIRRbmVn3R6RkmsmTkQjrXVsomttpdVO/JVnqmAICeshDh6M0k6W0yX?=
 =?us-ascii?Q?NDWpT2rBcgBLQy3Bx5fjdSfcAyhsTg1AWOO/S8BdtPzkfGAKhItWVTWC6jM7?=
 =?us-ascii?Q?40LCUFaIBGuRBcccftdzYQw9wujp93Pf0tauJ2Lxe2/nC5WOoyOEBmQevvFz?=
 =?us-ascii?Q?dH9AWK6n3HvjnCGXME7GkNwovubg6ljW7UP4dFbBI+ERmwvfREJ6lYNInFCk?=
 =?us-ascii?Q?DbqexSdjR+bbFOdt8oNpVm5tkpLpI/6RjrGXNX4TDtM8+n5uzh6jmnUhTJkQ?=
 =?us-ascii?Q?oGznfyDhF3I8ZIbn8R/CijYf6ak8Dn6RPmWboou6qz4e0/YhbCYbNdsPYENm?=
 =?us-ascii?Q?jjRRf81e9NcKzwXOHUc2HpwRFTcjhfIWtawKiLbFxR/0sf++3T0cCrsUFByD?=
 =?us-ascii?Q?quXUXZIQQgEHqeauVF6vLRim6kF2y1LT/tv/04ZNt+P5FgyrZdG3P0QqU0tT?=
 =?us-ascii?Q?wlifLMbRUl7vUHkF+myXMsZlcpxWA90GYagruAsxZP/6OHrudMRjPMjJ4Vd8?=
 =?us-ascii?Q?99d3gKAS7WDzd5jtjNrsc86FVry8lbVM4489NYW9GjjS86hP2Lo1lUWEzERf?=
 =?us-ascii?Q?5s3oZNAWVWRcYpbw55U5deb+U9qD1txHwibDjb/WjDaVf1I=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c594d3d-f6ce-4d83-dcce-08d8a0297977
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2020 12:12:06.3857
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lXTajflMB9X4IhMrQhT+OUPY/MHzQOUZefhi6vJsNSLHtjmZE0JEHLnwgOYRnjmKtyGg63n8uG+g4tSiIiQdb5Y2C0Yye5XsbfmVtdu5TYWYQQh+R7IAfCAgXCuweOn3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB4507
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

> From: Yoshihiro Shimoda, Sent: Friday, December 11, 2020 8:28 PM
>=20
> Use the SPDX license identifier instead of a local description.
>=20
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

I forgot to add Geert-san's Reviewed-by here. So, I'll submit v3 patch seri=
es later.

https://patchwork.kernel.org/project/linux-renesas-soc/patch/1607414643-254=
98-2-git-send-email-yoshihiro.shimoda.uh@renesas.com/#23832735

Best regards,
Yoshihiro Shimoda

