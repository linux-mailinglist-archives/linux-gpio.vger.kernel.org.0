Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75EE9534619
	for <lists+linux-gpio@lfdr.de>; Wed, 25 May 2022 23:55:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232135AbiEYVzG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 25 May 2022 17:55:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235471AbiEYVzF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 25 May 2022 17:55:05 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62683B36FB
        for <linux-gpio@vger.kernel.org>; Wed, 25 May 2022 14:55:00 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id 67-20020a1c1946000000b00397382b44f4so66779wmz.2
        for <linux-gpio@vger.kernel.org>; Wed, 25 May 2022 14:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pensando.io; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/oBh+Znbc88NiDeYaHpcLs3NJcAFoy3MCBRZMNMGpQw=;
        b=arfvwNzDDLgge/qyXCYs6mi8SFh5fASF9WAvA3CMnMWaUtgiy3QFHT7IU6lKDS2BVh
         WrL/CARwCWxnEYK5zRUId/2SUMGApf4e7UBK+Zdn3lso/PvChAqUP9DhzLZq2s/6ZgoD
         7mVF2DH4324yfM97di0AzI26SutPzq4Md+/+M8nW55zkuz+c1CrrYJII0V/mjGbxhM+k
         TTm4lUAXyVT4A0fFNZA+IKbEmdamDebiDlU6MnFM2Nw4SFeK4zcsDKm4Tyda/deXw34G
         fHwUjAUPL/WKKTXeekwmgsvqPXjsSnqJnZO1cJ0qoQ2xA501AnbsFOJueL4csev4WMj4
         Jorw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/oBh+Znbc88NiDeYaHpcLs3NJcAFoy3MCBRZMNMGpQw=;
        b=oM7GuXdz6MUpDSbiFXtud42dFyYsuusVi8ed0hcUqkTC3cAlJ/dxACMsnuo1QXRl1K
         Nip0/yMaeQ05SeUwjHN7LitOmzZfXubaDvrxSaNItvzNaglbkW/kA4tSr4UD4hGLqigT
         OTc2+NP33Y7GQZr3m09FjTcOdX1I5lebZpgKY9r5ub46yxr87sIIL4tuR/ntIsukvYTX
         TBFvuk+C9frqK1NsH17zZAycwcSpCPnBW8/TDXDZNXgz45BIfqLt/So+ZDZrw+la2Hiv
         AtwyM2k9/LlsSM2vombMCyxUeR/PnacjxzzkC42Vp+zTPQ9lcIXuCKxMkr7KVDn6W07m
         goAA==
X-Gm-Message-State: AOAM532Cl4YaFIPoGNlVqv6kCd7Oce53m601LqyHW1sx7tVSBNxw+UXl
        nk6M+NxX5lXeDs9Lrd3MFNGpFt5gzm9xq+OPDuD0uw==
X-Google-Smtp-Source: ABdhPJwEdTcOuaFFxDw66wiF82VdkmXZa5C+ZdHZn9Ask4eKJm/UyqU4NfEyal57N8Yt5HepbbE1akxgZF/HJ+Ov6SQ=
X-Received: by 2002:a1c:e903:0:b0:397:36b8:795a with SMTP id
 q3-20020a1ce903000000b0039736b8795amr10328612wmc.98.1653515698905; Wed, 25
 May 2022 14:54:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220406233648.21644-1-brad@pensando.io> <20220406233648.21644-11-brad@pensando.io>
 <20220412110622.2xsk3k63dafqxib5@mobilestation>
In-Reply-To: <20220412110622.2xsk3k63dafqxib5@mobilestation>
From:   Brad Larson <brad@pensando.io>
Date:   Wed, 25 May 2022 14:54:47 -0700
Message-ID: <CAK9rFnzp0+80dX_-NYidfVXWJ1sru5mNk1vgVDzoV7VeEekpwQ@mail.gmail.com>
Subject: Re: [PATCH 10/11] spi: dw: Add support for Pensando Elba SoC
To:     Serge Semin <fancer.lancer@gmail.com>
Cc:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mark Brown <broonie@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Olof Johansson <olof@lixom.net>,
        David Clear <dac2@pensando.io>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-spi <linux-spi@vger.kernel.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Sergey,

On Tue, Apr 12, 2022 at 4:06 AM Serge Semin <fancer.lancer@gmail.com> wrote:
>
> > +static void elba_spics_set_cs(struct dw_spi_elba *dwselba, int cs, int enable)
> > +{
> > +     regmap_update_bits(dwselba->regmap, dwselba->reg, ELBA_SPICS_MASK(cs),
> > +                        ELBA_SPICS_SET(cs, enable));
> > +}
> > +
> > +static void dw_spi_elba_set_cs(struct spi_device *spi, bool enable)
>
> The methods naming is ambiguous. Moreover it breaks this module naming
> convention. Could you change them to something like:
> dw_spi_elba_override_cs()
> and
> dw_spi_elba_set_cs()
> ?

Yes, changed elba_spics_set_cs() -> dw_spi_elba_override_cs()

> > +     /* deassert cs */
>
> > +     elba_spics_set_cs(dwselba, 0, 1);
> > +     elba_spics_set_cs(dwselba, 1, 1);
>
> What if the CS lines are of the active-high type? In that case basically
> you get to do the opposite to what you claim in the comment here.
>
> Note the CS setting into the deactivated state is done in the spi_setup()
> method anyway, at the moment of the peripheral SPI device registration
> stage (see its calling the spi_set_cs() function). Thus what you are doing
> here is redundant.

Yes this is a redundant initialization and is removed.  For Elba these CS lines
are active-low only.

Regards,
Brad
