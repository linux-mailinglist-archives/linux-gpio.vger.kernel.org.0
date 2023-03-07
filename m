Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48F1B6AD8E3
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Mar 2023 09:13:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229961AbjCGINs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Mar 2023 03:13:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229685AbjCGINr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Mar 2023 03:13:47 -0500
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2113.outbound.protection.outlook.com [40.107.114.113])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C63D622DE2;
        Tue,  7 Mar 2023 00:13:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AKXGQW3FiGSmKR1mJr7p3Grw+o4i2ZRkOZ+BP7znBWKRE/AbdlhApn7YxS+PcgMfSDrEU6dffIUlOEdR+I3wryho3GO8IRdJOs+Z/FBoqR+ALDCtRs9MIDjQqRe3oil5r/Mzg6YVrxJdbWrXNFmZ3J2C6A1hzVtLs3qotmJ5TarDBBRoof6xWZllIiVv6CIKE+o5L6vKBsbs0qLAUlx7ACH1g2fdoljZaOPgpv6A80UVpIMJ0tE361hkDNMd3q0exDKdqNpYI3eho/LEP3Tg0B9WGSzKaYcUAhochHhhysULDbq/LuK4fTfoXTO3ma7BOlCgLRw4C829MOBi8GnnYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gtxx3K1wzaWizQVIwBEzTKwTuccII6SiRAD7gUQ9IOQ=;
 b=bwG8jkQkIzE9Z4xMtWKfKfK0hLwEBiw2M6/ukXJOkm+NDPBcCRgt60giesMHcd2625SgHF7ueOfZ9FybHrDtXasqJQSUp7uLlZcWF+lThAjBl6YDfvqqj61BL3CpzpPj4scP6CkIBoVtflLi7Mxv82Tu5EZrpREMD89f0h3MH6A43c2wvhfsgoKw2uXhMt+fKqBIJuF+6pqZAY5f/s574uqLrVu4uRWcADBCNsoiENLLh7QBbZYXMypaCAHvR5QLyINPivxnPbXQzlu2Ql5Ko0trniHT1PtXtMCBXY1E4Fu6T/5BRC+Dp80fOIro2+WFyy8s+UQP2AeDRPgGJPKLlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gtxx3K1wzaWizQVIwBEzTKwTuccII6SiRAD7gUQ9IOQ=;
 b=AKnCSNDRbJCXjvMVlNo/5QsxyrJxdzhPn38c13IQA0IssqYwj8BQV52KLixfBqF+Io6qyki02NPsWFv5BONZH+ljRgsl1TKhfH5EPtifz6BD18PyXkJa0BE2RQve8rmsREx9hhO2r7GF/wLl82MvCxb6Xi+ntsON1d98GQ5TYdA=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB7753.jpnprd01.prod.outlook.com (2603:1096:604:17c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Tue, 7 Mar
 2023 08:13:41 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::f54c:4b2:9c7d:f207]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::f54c:4b2:9c7d:f207%7]) with mapi id 15.20.6156.029; Tue, 7 Mar 2023
 08:13:41 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?iso-8859-1?Q?Uwe_Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v6 01/13] pinctrl: core: Add pinctrl_get_device()
Thread-Topic: [PATCH v6 01/13] pinctrl: core: Add pinctrl_get_device()
Thread-Index: AQHZUAoZhjJXzQRnckWhgNWWpo0zwa7uZ+eAgACJSoA=
Date:   Tue, 7 Mar 2023 08:13:41 +0000
Message-ID: <OS0PR01MB5922EA0703F259A99C157D3286B79@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230306090014.128732-1-biju.das.jz@bp.renesas.com>
 <20230306090014.128732-2-biju.das.jz@bp.renesas.com>
 <ZAZ4LY+xG2LGiHwh@surfacebook>
In-Reply-To: <ZAZ4LY+xG2LGiHwh@surfacebook>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OS3PR01MB7753:EE_
x-ms-office365-filtering-correlation-id: bf439c98-1cca-4c2a-1f67-08db1ee3dd0e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5sugV1BCdHio2V0ktg7fAZJhz1WKOHi3770kKc9y2jOx8Rq8XybWdmo6/M6oS33MBgW05pxVdvf+Py6vIwLJbytxVZJMK5TQMssA6exUmw+aPidgGEv0pJIyFu2Z2qIj2Xxjx+UY9Sjy3FGFurqwM1ZrW5DSryVmjc3hbCT+ZM64Me/+Xtom2mWJs9xBs+3D18EMiv+LVKohkA8sW1LG1mDGfDS7ZKCPPRzvFzgf01fH0kqvQIlH5XKbILTsIkRD6METnxAMn/PkTK9BKKpiO1g3JajIb57jb4cNd/fiNhkdfH3c7UxfpwdNVoyM91sFImbzR87p7lKJkI/o5l5fkGUeMTriq2z37IBgw1h7RBGXlG5C0UbvQt5+cxd0hXnIRplhjKXTTkkkEHcXTkOrNsxOroT5NKxOdFmE9+1ZHYzsJmoh7/AjHnKIjo91Ppw2QRsFiVaYdpITs3FIURaQVId7tkPY8ipks7EPIDUhKj0dgOIGs2I47XFyZ2q5FekaVVUdX82ufjC7xm7oVvYX3aR1BXt7XAYHqJZnEixaJMBb7Zy0K41A3PFQXLf/09PQj++WAB2ONhSL4ilWCs4OmSIfMIK79fmbZgD+t9HRxNtaS3Vx7bfYrOMW4laQQjOKTIL2jYzIzWwnfhPcDF8C/QfBaJaslOb+Ft//iPXAQ7ll1GRgTqS2baeyxHm/qZY3Wu8MFlx4AlE5icn207bWBA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(136003)(366004)(346002)(396003)(376002)(451199018)(6506007)(38070700005)(86362001)(83380400001)(33656002)(38100700002)(9686003)(55016003)(122000001)(186003)(26005)(41300700001)(66556008)(66946007)(76116006)(66446008)(4326008)(6916009)(64756008)(8676002)(2906002)(66476007)(8936002)(5660300002)(52536014)(71200400001)(7696005)(54906003)(316002)(478600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?xq+cWRVZiaiJbXif5vCT1ADRrOX9TVOCWepUAyPL+6vjl6jasmcs068ElM?=
 =?iso-8859-1?Q?c0x5zAyDpr5kglhz1OZQkb6KpCg6KISnmfjkgo6gzFGf6q66r8CcPTlt9Z?=
 =?iso-8859-1?Q?ce4BKzzRBi1qHdq50Li85TrFK35DhobOKKE9Xvb2m9hGa9cWyPUpuiSitr?=
 =?iso-8859-1?Q?bG3xAP0jXpr0uJzE3hk1g5IZ3LGaaAYEZFztlzOYAgC8gqzNeo4kJgA1o8?=
 =?iso-8859-1?Q?4UE6fsVFqV1uO31MgLsXQpYB64vmE2ZTtheuzrU0mikQmgGQc/eJgk7SkY?=
 =?iso-8859-1?Q?55ohhk4EHSW6LMEq821Ft3ZbEMhcGum56PL5pbSdo6hHWUhRAGYZ+p7/+w?=
 =?iso-8859-1?Q?Sj04YsyultJfu7Sq6kgX4QaNlP/r3rcWsb4VECkF7VNCbytUlGu71YoUPz?=
 =?iso-8859-1?Q?xA7mAoXlSv1bwO80jO+Zor3gafGKx4xXSHG3I+I6ZNMXj6UbUWhrw/ZhyY?=
 =?iso-8859-1?Q?1+wIm6Tr76g36mW9UtToVx58lhh3bYHXmnSkm1gX59UF9xBxMHD6EslF1/?=
 =?iso-8859-1?Q?fDa3+c8CobggRHpDW/ZqWySXyBSBZvKAXkOapv8ATMj09qqbkqlAzgO5qW?=
 =?iso-8859-1?Q?L4Sm2HkSg2b1qr4yUAWnE4Vx+1g8YLivmuv+urdQfC0FZo24Y2LwSt4zGe?=
 =?iso-8859-1?Q?Bd7+jjF9jk5OUTyLPBFs2w4MBRDPIKw8zEqt3/o9IgSWfDCR0x6e0EPGYG?=
 =?iso-8859-1?Q?7qnaz7ngelqL5FL1WbsQcYVltyq27e0Rjy/KlhhtV3DWONX957Io2TCgZK?=
 =?iso-8859-1?Q?eB5GSjJUJaz3ax/fNzbxe6qyziMcyElDPoVdzleBmpIiqfbhChcB1j1/WN?=
 =?iso-8859-1?Q?aqWi+Fw+oui5gJ/aABlLxXCBFgS8hswTXNjx8luLY1dX733QSiLNpotC4J?=
 =?iso-8859-1?Q?CB12dDyRI6zGdf+gLx3T1GlkCFJ0nq/1xNWZDiyLnnoLEnCrEJmoHeDlIV?=
 =?iso-8859-1?Q?SVGM68zol7PzHgyD5IQOiDQbYam27UHpe8pliwiTF3e9lOqZR9U4uDkgzu?=
 =?iso-8859-1?Q?2pMpgZTkc0dN68fKol+cL+A2aHVm7BfmRySO+2zOIBNoO4hzdkaIj8Jbxq?=
 =?iso-8859-1?Q?uvATQ3rXibaL9WfbHKXmbICudI2Bi4PaPjPm7xUy2/CzITVECfJ5dRfgBK?=
 =?iso-8859-1?Q?OzUtOdOpTx0PUas4X/yo3fI4YY8lyHeZX2cY4VSqP7vY7vvHkbRMNlcR/6?=
 =?iso-8859-1?Q?SIKqZ8trFHbQacGXz2Q+hlRloVdFUDJ7b/wiO1fO5UQuA93Nq6d9Yg8pMJ?=
 =?iso-8859-1?Q?96XZYuT7+Q86erOSCNUTlVcLLCweTZ2D40cQhG+ivHorHxKWRi6UATXCZU?=
 =?iso-8859-1?Q?Q9vvsDPCU9yJLdS7fzYMjJm4T9vd8Tay5ECewdsJA8Utv5LCwHzQ19Uvez?=
 =?iso-8859-1?Q?9XwKZMNZoMAqAQPcIqP/sl1GGJJmSGYH2xRqhrGEq9T4ujtZYHRfbeIhwx?=
 =?iso-8859-1?Q?7K6hhwNUnwRfoedpeIjLg8Ob7a42aojksTwQV7Pdxo8pS50MFDAnL2cDIT?=
 =?iso-8859-1?Q?lDvWlWKQpWwAPUu6GHLztJ9NxkxKWDw8n7Mb2ZV5EYCiwTj/cCaoAOfyOq?=
 =?iso-8859-1?Q?bsUr1qupoTN8loW/iaf2l/ra3Re2Qd9igfzV/Il7AiRrS3IDo0W9We3drk?=
 =?iso-8859-1?Q?eIxPXqUCYs2PYNuZnbnZ6DVnmj9llTI7uE?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf439c98-1cca-4c2a-1f67-08db1ee3dd0e
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2023 08:13:41.7844
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9U4Woo4fCm5hznDcUYXfPbG3K6hJRycDrFrY8MTujYP6719zYCYuJ0HUR9+c3DGO4lv0qRMHIl0ByPx1ZKBWU9mjZ/IeQax0mrKGr/tgEdk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7753
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Andy Shevchenko,

Thanks for the feedback.

> Subject: Re: [PATCH v6 01/13] pinctrl: core: Add pinctrl_get_device()
>=20
> Mon, Mar 06, 2023 at 09:00:02AM +0000, Biju Das kirjoitti:
> > Add pinctrl_get_device() to find a device handle associated with a
> > pincontrol group(i.e. by matching function name and group name for a
> > device). This device handle can then be used for finding match for the
> > pin output disable device that protects device against short circuits
> > on the pins.
>=20
> Not sure I understand the use case. Please, create a better commit messag=
e.

OK, Basically pinmux_enable_setting allows exclusive access of pin to a dev=
ice.
It won't allow multiple devices to claim a pin.

Maybe instead of find device handle, it should re worded as to find the
current owner of the pins associated with a given function and group name??

Or please let me know have better suggestion.

Then use this info for matching the device used for pin output
disable.

>=20
> Also it is missing the explanation why there will be no collisions when
> looking by the same pair of function and group name from different device=
.

setting->data.mux will be unique for a pin. So there won't be a collision w=
hen
looking by the same pair of function and group name from different device.

>=20
> (Always imagine that you have 2+ same IP blocks on the platform before do=
ing
> any pin control core work. This will help you to design it properly. )

OK.

Cheers,
Biju
