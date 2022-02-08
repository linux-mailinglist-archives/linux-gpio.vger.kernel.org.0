Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CEBA4AD653
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Feb 2022 12:24:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349748AbiBHLXz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Feb 2022 06:23:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355936AbiBHKBL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Feb 2022 05:01:11 -0500
X-Greylist: delayed 62 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 08 Feb 2022 02:01:10 PST
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80CF0C03FEC0
        for <linux-gpio@vger.kernel.org>; Tue,  8 Feb 2022 02:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1644314470; x=1675850470;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=vTarUrJ3IsWV/J/Oxh8vzQITkIKufb53p2yPWYuMZOo=;
  b=RzFYL3zaArgH7bKYhzh01HNyFvip87x0rDdHltfLoiDZ+eJlwVNpYQ+7
   8h7gMsPT93GkMZmkI1jW3egi9Fw/1mPURUqtFHOMDTPvRQB/wlY/93DGA
   OAwQh5BZvrN0uxBWNXN8DcqlU/dYeov8vsAnYWRYqsdCCeyVUHJTEhhYk
   UH/LFdezTGI115IbaZdIO1OO5buXezfYrd1Acr2jRyVlgv3ZzWOOrWv71
   zJCyo31XS3vl5LeNJu+Vvdu9kM1yYkJa/nyy+UbyrV7HxIcuCViXRvHfw
   1DQisczGusf47EVFVVEdM4o5jYhx4HPy+OyJWohhxSN2wkh0onH76a/1w
   g==;
X-IronPort-AV: E=Sophos;i="5.88,352,1635177600"; 
   d="scan'208";a="296502343"
Received: from mail-bn8nam11lp2174.outbound.protection.outlook.com (HELO NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.174])
  by ob1.hgst.iphmx.com with ESMTP; 08 Feb 2022 18:00:06 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AeOSWxU6cgGrwTJ73O+UPnTRL8/50u1ueI0FLNg5cuUnsop2g+jLOGM39ajtlslZfPq7VHXlSksnsitYQ5f3PLLMTUjC7yfFntb4utvn5LqprBbCcElB+K44ealno05+GXYLFe3zW4/AV0zLbFzC9HVRHiSNrXAw9gtir5SmW2OFTM/umFAjXPyncFggpJYOiG3I6/9DUuVATjkPQfsWI1NcqbJwNh0awduIJDGkxESpVB4bK9ygDX+Or/cR5uOm5QsqYoQr7ghyrEKBNox4Ft6U+w9gHmqzL+zeiWBbLZVw0036lMylv4+2gi4s3xNjkgmbAdib4dW5v2RU5BtfVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nUxDDmiAEF4x3ZIZEajPvz/mcwJLQI6EyiuNLuzn79k=;
 b=MfVss+G5O7imaNX/jnHcTd45mSxSLFSuSN+U6DZsAvLP4UoJQS/o/AsppIpHvvNikoOT//ecXiFM5ZM6zegKxR0QnCx0oO7gOxEr3NbONpanUkToT0qmUia9iJhRej4KcR8KROlUT676rOeMzEbQ0bnkgdYnvmySJxR5vRSCfxkwFzL0ACYA1bsPhe7ByXKQp9fRbOz2R1XusoXNpZig3v2kDuZONtUeSOdzqZTzFwZdWbbNTVGystxHtJikg3v/LrSZVk4By0tUfEtobOoOdptxhAi65ZvHepJQPj22YPBt7Qimf2q/XFr0aCJkh9IdnSSUJ8I8wagvRQPY/uVFcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nUxDDmiAEF4x3ZIZEajPvz/mcwJLQI6EyiuNLuzn79k=;
 b=nWkbUwzoy3oIQvAPS6FrqdQxaoayw4pjClJM1IqgwzhC6p/NHvCLqlmqhZn4oSWPNqP+Nyw2uwbr2eA2KM4nonmUW/ToQgxb3NZHpFtsvSt8z4UQeYFU9ZWwjD/Q+FSO+EZq4ZmJ68q6aKmUV6dbv3IvPqgNUq3azOYJUN5LA1s=
Received: from PH0PR04MB7158.namprd04.prod.outlook.com (2603:10b6:510:8::18)
 by DM6PR04MB5834.namprd04.prod.outlook.com (2603:10b6:5:162::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Tue, 8 Feb
 2022 10:00:04 +0000
Received: from PH0PR04MB7158.namprd04.prod.outlook.com
 ([fe80::ad7c:72b0:de53:f5d2]) by PH0PR04MB7158.namprd04.prod.outlook.com
 ([fe80::ad7c:72b0:de53:f5d2%8]) with mapi id 15.20.4951.019; Tue, 8 Feb 2022
 10:00:04 +0000
From:   Niklas Cassel <Niklas.Cassel@wdc.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
CC:     Damien Le Moal <damien.lemoal@opensource.wdc.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH] gpio: sifive: use the correct register to read output
 values
Thread-Topic: [PATCH] gpio: sifive: use the correct register to read output
 values
Thread-Index: AQHYGcd1jDKOa8jQ/0eC1rqOXQQztayEC8WAgAVhqYCAAARLgA==
Date:   Tue, 8 Feb 2022 10:00:04 +0000
Message-ID: <YgI/I3DAcPSnlOGX@x1-carbon>
References: <20220204130142.21727-1-Niklas.Cassel@wdc.com>
 <aa6f85f3-1146-e857-148c-7a314b21e647@opensource.wdc.com>
 <CAMRc=MfrQYSOu+6ZPgLqxek2RfvmCVzS64rKRp_rsq+Hk1QYxg@mail.gmail.com>
In-Reply-To: <CAMRc=MfrQYSOu+6ZPgLqxek2RfvmCVzS64rKRp_rsq+Hk1QYxg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dc569fc8-f19c-4e39-41cc-08d9eae9c77f
x-ms-traffictypediagnostic: DM6PR04MB5834:EE_
x-microsoft-antispam-prvs: <DM6PR04MB5834D642970EC07A41CDBF03F22D9@DM6PR04MB5834.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UR/dq83PKct0K9SL7HMi22zMi6GTaDUExQMlxDk3ywummopOX2PeluYiWJUripgksegJpjk8JTMwwH1RoF63rSmx8ICu8Wy0BFMmN8+4Rcx/GzrjBlb2b6yzLy3aPaOnF7FERfVqOm6RYFrZ1Dw7cDVIF4CieZrVhBWNH8tlYvOwoGTkoXs4dXz5AH+Q1aOtRo2djkhX1aj+uyAO4hB85JM8AiuWVNy0u/bzzw0R6GzFUhAtbI83kL9jdSXhFEgAh2KjEnuJUkffTK/jFLYZqPN4wFNvCXvbbzsqosmMWyDN6Ajbr2TMgtWmUWWcEU4IW44He4vVy7JQNHDyJjMBnn7W2ihKsWjYVSaU1gApyPJrT3q0ehchOewx8eskTi4bpWe1jLw6Auqs8Jc/B4Kuiade/2suU5z1AVSgZsSMCDQrE46iMlSHBvpF8W1oL4JnqGUIgQg1bR9oNHlkiVSy9xa4bB/FsRqXf/Izn2k35wzNSzWJvUISOKQlHOao0FRPwnz4QMPF1uTYP0Ng3EcG+q2HnDvhfvLyXnQkQiRfD9BrxGGDp+O/j+slPFRORm+3tQfrVPEjFKNioOJ/DXag6ETvSUDl54Ww8DRV7u0lagdjbgc84BW9+Cl8aVhq7oG65/BNoqyN67OXJKASk1OROZf0pNAg7/IkAA+k+0zXbCuNakEnDTaDy/8IuC8P3s/9jzv4DusQMs/QmHgPzYv1ow==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR04MB7158.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(91956017)(86362001)(76116006)(66556008)(33716001)(82960400001)(6506007)(6512007)(64756008)(5660300002)(66946007)(4326008)(8936002)(8676002)(38100700002)(66446008)(66476007)(122000001)(186003)(26005)(38070700005)(6486002)(2906002)(6916009)(71200400001)(508600001)(316002)(53546011)(54906003)(9686003)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?WJ6uCcB/awdgkRx9Zxf6w59faqF/bHUr0Y3pEcHS0A5jrQvbpWwxlOftOoTA?=
 =?us-ascii?Q?oZhr6jyBWSH+qEfEYvn8g7phzgMDHUkr1jicddxksZczvOANAp/6Z243MY3G?=
 =?us-ascii?Q?dOWUrrpEm0goMTV80dPXnrh0CQhvBKovESiCmxSshJF73QfyVVa8cJl4pYY4?=
 =?us-ascii?Q?On7SDMx5CfGRfD1NDF5orgboOzWhi6ADNsCdI8kSBNk6Dxzv7HMpoRmZ3dLr?=
 =?us-ascii?Q?ysx800D9evCVnb7QZTmghKmcRctxyjrx4Pi79xlPhIb5gx0PboqppDBfBF58?=
 =?us-ascii?Q?eTMUXVMQYQg2e/qWTxVNWZZiul6ZFrSqZE4ze5ur+FSfYh/zA92plKCAH0wx?=
 =?us-ascii?Q?0T/Irnt5xvZ5Afkk+LO53qk4mmf4TZwvRlmHINVkzY3xAh9SjJ4IEJ2tKyXN?=
 =?us-ascii?Q?3IiPfax9YDZux+aUiZVsEpmfCKMlU9rv8oPWoO0jebwU1DpQTVXeLhQ5/rdq?=
 =?us-ascii?Q?K1jUHqEGFCJyJtwSnqPevvG4V9TYCDDOdjZRLDzS5QuTJOkTC5r3bHFtAwLG?=
 =?us-ascii?Q?jjrWKLQDQHYMG0MCEv7YdJzbhZ5ZwEOAnYRu7tPePn+9DPAQxiwUu8eHtZD8?=
 =?us-ascii?Q?oileoGzSbVbRaR3NBlpwORLs13LSzTYjyN0mlRH3KlcDy88x6jfOLzBzZZWT?=
 =?us-ascii?Q?RzwbF78QvLC3ZRPwBxdH8N7ucheBlFHUHxQDYYd/cASwKWOghquPBhWP7kny?=
 =?us-ascii?Q?cwEUi4pRqWsZTZdWYUVjQtTDFgrPV7gRX3bdIsKGpmK/4c9muyoD2iaYPQ3w?=
 =?us-ascii?Q?zVi+RxSVRNcbEMHUOwt3wyKdvQluUSyzrqkEXXfe+wGYVKtcC9AsDXNZL4su?=
 =?us-ascii?Q?FswBzv9SJV8O3uiVcksQIClhK4JAem8aA5Jk3cwGuTCt23adEyZjvU7OJb1s?=
 =?us-ascii?Q?uFR2MzNiZMFhLIzYC6S2ScgFFxVBK8HfwZbGmMYtcmdOeSFQ2e9v/vZuRb1F?=
 =?us-ascii?Q?1C8MoAFQhOI7rJLl4BXLC7E2Vwh1DBz3sorvFy4L8FCrKbJ8jJ0IihKRDkFz?=
 =?us-ascii?Q?WL375BBwtah29MAL95OqwPVal470OuGNWrCuYRLjnznOyQ8pHCUkQ50ATmWU?=
 =?us-ascii?Q?YWazOFq930E9ITryLzLhI5wsG9PIHIBNiRg4tTHUu/4O3zBDNC1eHkJMqY4t?=
 =?us-ascii?Q?SUokxHgjDkq3lcq8nDZLLGAwJSWa3Za2YfIYdN9lMQwtQheouTNkFPUBKnBM?=
 =?us-ascii?Q?elkSRHlJeOBlEMYhfYmci204Jto8Lh3BC0K89myhwNpYDzeCr70MqJ++8x8H?=
 =?us-ascii?Q?pLBPCUe8aPVIUqcBvt4udhs10tmBEvGcAomSz8/CKssQw7SIJ66AtPn+RG1x?=
 =?us-ascii?Q?eJYsWh3e1d9NGihI7FHiL+UZjKHUppewVUXF1IxecKnEqY1pY7x+DrsIt3P3?=
 =?us-ascii?Q?cFXUhbXehh1SBr++cCidp9rR+vPPduLXUxA3LnUg6cxiy9Puwk4SSwg5udZ6?=
 =?us-ascii?Q?1Vk5UbNlq1AgQGkNdTAajVwty51p3+6PRocWaZUvYog7pB13YeiuAiB9Cwc/?=
 =?us-ascii?Q?/+6WJ2TaMocD5hIy4Jo7ePv6XcXq2L+Z7xrvwrrqWSTp8qG85+fPtuqEUKgR?=
 =?us-ascii?Q?010s+8wGLIoSQWXBeX74y5aOT84ifG/f2COAKMZyqS/mcSoID+5cSqs8V1uK?=
 =?us-ascii?Q?kjj6pJ4l8ZFXyLegyaGpBDM=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E156E096646FBA49BC69104B660C049C@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR04MB7158.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc569fc8-f19c-4e39-41cc-08d9eae9c77f
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2022 10:00:04.1640
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6THPjUoTfNZ0p8JXP+z4+xdHpPtLR0BDUMjniwgOthnF03VGwgd/wmYfNvypKzx3sBn3XmniTTPAm2/rd9625A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB5834
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Feb 08, 2022 at 10:44:41AM +0100, Bartosz Golaszewski wrote:
> On Sat, Feb 5, 2022 at 12:33 AM Damien Le Moal
> <damien.lemoal@opensource.wdc.com> wrote:
> >
> > On 2/4/22 22:02, Niklas Cassel wrote:
> > > From: Niklas Cassel <niklas.cassel@wdc.com>
> > >
> > > Setting the output of a GPIO to 1 using gpiod_set_value(), followed b=
y
> > > reading the same GPIO using gpiod_get_value(), will currently yield a=
n
> > > incorrect result.
> > >
> > > This is because the SiFive GPIO device stores the output values in re=
g_set,
> > > not reg_dat.
> > >
> > > Supply the flag BGPIOF_READ_OUTPUT_REG_SET to bgpio_init() so that th=
e
> > > generic driver reads the correct register.
> > >
> > > Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
> >
> > This probably needs a Fixes tag. I have not checked which patch though.
> >
>=20
> I added the tag and queued this for fixes, thanks!

Hello Bart,

Thank you for queueing and amending the Fixes tag!


Kind regards,
Niklas


>=20
> Bart
>=20
> > > ---
> > > The patch was tested on a canaan,k210 board (canaan,k210-gpiohs compa=
tible
> > > string). It would be nice with a Tested-by from someone with a SiFive=
 board.
> > >
> > > However, the u-boot driver for this device already behaves exactly th=
e same
> > > as this driver does after my patch, for all platforms using the drive=
r.
> > >
> > >  drivers/gpio/gpio-sifive.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpio/gpio-sifive.c b/drivers/gpio/gpio-sifive.c
> > > index 403f9e833d6a..7d82388b4ab7 100644
> > > --- a/drivers/gpio/gpio-sifive.c
> > > +++ b/drivers/gpio/gpio-sifive.c
> > > @@ -223,7 +223,7 @@ static int sifive_gpio_probe(struct platform_devi=
ce *pdev)
> > >                        NULL,
> > >                        chip->base + SIFIVE_GPIO_OUTPUT_EN,
> > >                        chip->base + SIFIVE_GPIO_INPUT_EN,
> > > -                      0);
> > > +                      BGPIOF_READ_OUTPUT_REG_SET);
> > >       if (ret) {
> > >               dev_err(dev, "unable to init generic GPIO\n");
> > >               return ret;
> >
> >
> > --
> > Damien Le Moal
> > Western Digital Research=
