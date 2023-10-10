Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA0867C0000
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Oct 2023 17:10:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231865AbjJJPKY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Oct 2023 11:10:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233134AbjJJPKX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Oct 2023 11:10:23 -0400
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1A6FBA
        for <linux-gpio@vger.kernel.org>; Tue, 10 Oct 2023 08:10:20 -0700 (PDT)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-5a7c011e113so9415257b3.1
        for <linux-gpio@vger.kernel.org>; Tue, 10 Oct 2023 08:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696950620; x=1697555420; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bNVRgyFvWum2hRFmlW92z1wg/5s9UkkY7tvKtWeRi8Q=;
        b=SVSLCKj5dikkLNk6DOuRJHon/PhbCOdxZuJBsZD4Y0GPVDcJcDiTRsqmSsKO4VeCPg
         3sFgYZ0wL3MXOhi1/jAGpDGQlq7g53JVhK+J34QCeJqxsiucw0O3zIyqrgCKMzxksVin
         rRsSzRuA0cch3Ipy3RQC5EIqilhjpkXsfWwKD3cX2kL6WcW/mRwCQIuxedkIw4ZzJ9MW
         CJwXqXUNEVyvUXRq7Pxg3BhEsvPmfwQB+qwW5Ju+Cm9M7jYztfW4bx0TI44udUItWZFX
         G5VcxkkxP22eMj64OhfAbs6iy8SRebmx7OAl29iQDD0ztKZXDFRmQQ1Gr3TFflBHmFpw
         P4RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696950620; x=1697555420;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bNVRgyFvWum2hRFmlW92z1wg/5s9UkkY7tvKtWeRi8Q=;
        b=psdsui8hvx6URHYOLj2ZKyh/2AHNoFeB/mUJHlTqWQY0b3i8qRaNuDu2DHMhMRnuZb
         N90+x/ieKw3rP15WO8Hu4CyXTJAds74DTCOKxP3rl95QDboPDYzyhnjEXAECvo/7eYrX
         PP9DwOwskC3VOwc+61Rg0NQU9RZw+ug9hrgCHpUy1tmje3mwhHMcAnS0eD3NeRGI14LJ
         EV7crVN571zel9nPz4CEYC5X+3DBQjb/riPm4JT7sw/VqS8J15oQWGRI9lmiDe8Uqv6d
         iDs2+8exXetJRCLhxhOZnmEVjh1OBEQhLUwzSVsF5+V40RqrReeW0Biqpb7Ip6ym9MMV
         WErw==
X-Gm-Message-State: AOJu0YzHrnq2Fr03VUQ8HXm2odBSUhB5BCgENrG+AM98wXeD6b6sBqzz
        VCNC8OW3Y87fvNdKBC6Bis367HDqhfnPAJPlRluaAq0umqaz7yHzkrs=
X-Google-Smtp-Source: AGHT+IHfvy8QBycFXs2pUxVfYETVBPejg2TIRQTJu6G07uZHpYTTeTyT86wgocW2zL5M6/OjRH6H1VYO28y8QHYa0Dk=
X-Received: by 2002:a25:ac9d:0:b0:d86:53cb:1eee with SMTP id
 x29-20020a25ac9d000000b00d8653cb1eeemr16293192ybi.2.1696950619976; Tue, 10
 Oct 2023 08:10:19 -0700 (PDT)
MIME-Version: 1.0
References: <20231009173858.723686-1-dipenp@nvidia.com> <ZSVN73ffDkGBzmmI@smile.fi.intel.com>
 <ZSVWKSVNsBqDcOFS@smile.fi.intel.com> <ZSVcFo2sDVbMCW3Z@smile.fi.intel.com> <ZSVewh61i8JzwxQQ@smile.fi.intel.com>
In-Reply-To: <ZSVewh61i8JzwxQQ@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 10 Oct 2023 17:10:08 +0200
Message-ID: <CAMRc=MdBGf7g1xcGid+AuWaLhm3AJEAvFjK4PFOhs2dUF35QdQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] gpio: tegra186: Set fwnode of the GPIO chip
To:     Andy Shevchenko <andy@kernel.org>
Cc:     Dipen Patel <dipenp@nvidia.com>, linus.walleij@linaro.org,
        thierry.reding@gmail.com, jonathanh@nvidia.com,
        linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 10, 2023 at 4:25=E2=80=AFPM Andy Shevchenko <andy@kernel.org> w=
rote:
>
> On Tue, Oct 10, 2023 at 05:13:42PM +0300, Andy Shevchenko wrote:
> > On Tue, Oct 10, 2023 at 04:48:25PM +0300, Andy Shevchenko wrote:
> > > On Tue, Oct 10, 2023 at 04:13:19PM +0300, Andy Shevchenko wrote:
> > > > On Mon, Oct 09, 2023 at 10:38:58AM -0700, Dipen Patel wrote:
>
> ...
>
> > > > > +       /*
> > > > > +        * This is needed for driver using gpio device matching w=
here it
> > > > > +        * has to use gpio_chip fwnode to match the gpio controll=
er.
> > > > > +        */
> > > > > +       gpio->gpio.fwnode =3D of_node_to_fwnode(pdev->dev.of_node=
);
> > > >
> > > > of_node_to_fwnode() is specific to IRQ, in other places we use gene=
ric
> > > > of_fwnode_handle(). That's why better just to use dev_fwnode().
> > >
> > > On the second thought is there any parent assigned?
> > > At least I see that in tegra186_gpio_probe(). Are you saying
> > > it is not working? Or is it (matching) called _before_ we
> > > add a GPIO device?
> >
> > Okay, I think I got it. There is a function called tegra_gpiochip_match=
()
> > in drivers/hte/hte-tegra194.c which fails after my patch. Yeah, if prov=
ider
> > doesn't set fwnode, it can't match. But, since the driver sets the pare=
nt
> > properly it means that the matching function should be done against the
> > device.
> >
> > Seems to me that in HTE code the matching function is broken.
>
> I'll send a patch soon. Please, test it.
>

I'll have you know that if it is about to add any new "#include
../gpio/gpiolib.h", then it's a preemptive NAK from me. :)

Bart
