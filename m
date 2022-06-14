Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1177554B4CF
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jun 2022 17:36:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356877AbiFNPgS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Jun 2022 11:36:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344072AbiFNPgR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Jun 2022 11:36:17 -0400
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F5E72AC7A;
        Tue, 14 Jun 2022 08:36:17 -0700 (PDT)
Received: by mail-qt1-f172.google.com with SMTP id l3so5020303qtp.1;
        Tue, 14 Jun 2022 08:36:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+0Hk2AFNKQgkWbvipCu+92xiO5qRKMwKyffIoACTDw4=;
        b=TPKPykwF4a66qvj3NOgFEb4wZNOhvETiV4cHs2OD4DUULSfozeO+Daw08CcUNSxy5r
         TGIsQSJrKbd/LXVPpUttFK/HLz345DtTO4gws/n+0y7SRh8puthDXEV3M1cOgZH7Cvj8
         F8XubUUTAfdeMLuEcl/uQtI3eaw1CZXeAbKTJxWKMXSHQYHu6D8GCjHauBLfZV4544nW
         oBztZaCbIyma0cZzjruQNtsu+ETVLHhC0sV5+U6n9wYjFnYmXDgTGctWsTgAkXWRTbbV
         ib/1WUuMsfe/zbqTa1pzjR53AWUYOKKlNwcovsNpX+EMStr9WRNQ3sB8LJcfR1xPTbTk
         oNnQ==
X-Gm-Message-State: AOAM533lcUA3gI3pokJaOzMo5DmCaLtucCKLr1Qdq1u1UhKYWGcg632J
        PYhteiMQEPKGeDatkpZ+9zrEH+L26uA3jg==
X-Google-Smtp-Source: ABdhPJw/J/i/Mh961GuRUCWzaQqJPzHJI9J0yq8qJbZHmyut1cF+72A9FsV0/Ub3ToJvnzYTqQ+O8w==
X-Received: by 2002:a05:622a:5c6:b0:306:6cf1:4f5e with SMTP id d6-20020a05622a05c600b003066cf14f5emr732103qtb.30.1655220976125;
        Tue, 14 Jun 2022 08:36:16 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id bl4-20020a05622a244400b00304e33f21f7sm7163041qtb.68.2022.06.14.08.36.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jun 2022 08:36:16 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-3137316bb69so33497547b3.10;
        Tue, 14 Jun 2022 08:36:15 -0700 (PDT)
X-Received: by 2002:a81:1dd2:0:b0:30f:a4fc:315e with SMTP id
 d201-20020a811dd2000000b0030fa4fc315emr6497733ywd.383.1655220975600; Tue, 14
 Jun 2022 08:36:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220520154051.29088-1-phil.edworthy@renesas.com>
 <20220520154051.29088-3-phil.edworthy@renesas.com> <CAMuHMdUiqUUN_A+a2hcVpdx56NKHSBPMiYyHeS0SAVwdZSbZZA@mail.gmail.com>
 <TYYPR01MB7086A7083ACEBF9468ACE2AFF5AA9@TYYPR01MB7086.jpnprd01.prod.outlook.com>
In-Reply-To: <TYYPR01MB7086A7083ACEBF9468ACE2AFF5AA9@TYYPR01MB7086.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 14 Jun 2022 17:36:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW=iUzNJRYnsK_MrVLA-CFsm-xfuCjZbUUe+q6oZx4Z4w@mail.gmail.com>
Message-ID: <CAMuHMdW=iUzNJRYnsK_MrVLA-CFsm-xfuCjZbUUe+q6oZx4Z4w@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: renesas: Add RZ/V2M pin and gpio controller driver
To:     Phil Edworthy <phil.edworthy@renesas.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Phil,

On Tue, Jun 14, 2022 at 5:00 PM Phil Edworthy <phil.edworthy@renesas.com> wrote:
> On 14 June 2022 13:43 Geert Uytterhoeven wrote:
> > On Fri, May 20, 2022 at 5:41 PM Phil Edworthy wrote:
> > > Add support for pin and gpio controller driver for RZ/V2M SoC.
> > > Based on the RZ/G2L driver.
> > >
> > > Note that the DETDO and DETMS dedicated pins are currently not
> > > documented in the HW manual as to which pin group they are in.
> > > HW team have since said that the output level of V1.8V I/O group 4
> > > (for MD0-7, and debugger) is the same as the 1.8V IO group 3.
> >
> > Thank you, I rediscovered this explanation just before pressing send ;-)
> >
> > >
> > > Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> > > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > > --- a/drivers/pinctrl/renesas/Kconfig
> > > +++ b/drivers/pinctrl/renesas/Kconfig
> > > @@ -193,6 +194,18 @@ config PINCTRL_RZG2L
> > >           This selects GPIO and pinctrl driver for Renesas
> > RZ/{G2L,G2UL,V2L}
> > >           platforms.
> > >
> > > +config PINCTRL_RZV2M
> > > +       bool "pin control support for RZ/V2M"
> > > +       depends on OF
> > > +       depends on ARCH_R9A09G011 || COMPILE_TEST
> > > +       select GPIOLIB
> > > +       select GENERIC_PINCTRL_GROUPS
> > > +       select GENERIC_PINMUX_FUNCTIONS
> > > +       select GENERIC_PINCONF
> > > +       help
> > > +         This selects GPIO and pinctrl driver for Renesas RZ/V2M
> > > +         platforms.
> > > +
> >
> > Please preserve sort order.
> For a while I couldn't see what's wrong here. It should be ordered on
> the text, not the Kconfig symbol, right?

Exactly, cfr. commit d89a08f52b0dd30d ("pinctrl: sh-pfc: Tidy up
driver description title").

> > > +       case PIN_CONFIG_DRIVE_STRENGTH_UA:
> > > +               if (!(cfg & PIN_CFG_DRV))
> > > +                       return -EINVAL;
> > > +
> > > +               /* DRV uses 2-bits per pin */
> > > +               bit <<= 1;
> > > +
> > > +               /* Dedicated port is irregularly located to the others
> > */
> > > +               if (port_offset == RZV2M_DEDICATED_PORT_IDX)
> > > +                       val = (readl(pctrl->base + DRV_DEDICATED) >>
> > bit) & DRV_MASK;
> > > +               else
> > > +                       val = (readl(pctrl->base + DRV(port_offset))
> > > + >> bit) & DRV_MASK;
> >
> > You can simplify this, by handling the dedicated port offset in the
> > definition of the DRV() macro.  Same for SR().
> Do you mean put conditional code in the DRV() macro?

Indeed. Cfr. the IMUCTR(n) in drivers/iommu/ipmmu-vmsa.c.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
