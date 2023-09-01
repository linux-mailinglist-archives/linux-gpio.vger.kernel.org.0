Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9FE9378FD4E
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Sep 2023 14:33:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349472AbjIAMdT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Sep 2023 08:33:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241787AbjIAMdS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Sep 2023 08:33:18 -0400
Received: from mail-vk1-xa31.google.com (mail-vk1-xa31.google.com [IPv6:2607:f8b0:4864:20::a31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EFB2E7F
        for <linux-gpio@vger.kernel.org>; Fri,  1 Sep 2023 05:33:15 -0700 (PDT)
Received: by mail-vk1-xa31.google.com with SMTP id 71dfb90a1353d-48d333a18b3so731396e0c.1
        for <linux-gpio@vger.kernel.org>; Fri, 01 Sep 2023 05:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1693571594; x=1694176394; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zv9DTBV6+afGDZn/X61wzbcDjqP9MrfiLayUgf/s9R0=;
        b=N5O2MCq5Tlan/bmpDcXvtOvBrWzzd/HP9VuzE37FLGDMFSQVeul2A8Pevi2KQbDZMh
         piKcASCHFb2VuQt8H/5LCsZWEy/hBEkgBB2pbd2I2ZMqHlQInDocdOVnONZXCb2qBkXX
         Anm341dAewzsLZKSuzFDQdEbElocZCZTcqwQDXfATFManRWwQbTtVnlxJmZgUluY7v5n
         7a9B951oL+XOYmIaMtLIW0+/w9CvmnTlZlGLn7pmOA4shENHoEli3OPoV2qxPnvfGwiO
         on3hPdvW9UeyTqRUFDXI6qhbthr4YZbsBme3s7ahYRCVh2BvXOfNct38Pl+a2Tb9hpaB
         HWfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693571594; x=1694176394;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zv9DTBV6+afGDZn/X61wzbcDjqP9MrfiLayUgf/s9R0=;
        b=TWTLozfWTvj1ZASSD8coEl+vG8c7KMZBnpdMB/jSwom1eOglZcP8uBUZKInfrfiyiR
         TuUqwOnojmXCVUG7Ljp1pKA9J2eJeFZgNF72Eof+OpEAa/10sXSia59duGu9zbwEJBSb
         cSKlnG57kaKkYVZas64q81nAvRRocksmO8vMoqaTANHgkzNpV86b4Of5xF+z6i/OASLQ
         ZzXTRFj193gfdgdv8jcU52dT6Tu33vykPHb7it/vDyYhBU/qT26vZW5M1SZwLjrDPWnC
         rPf+jFPgB1i3DYI9KWXAEfYiFjcJ6XUr2KyqkQ+TVJGVw7DXOMGiny1J5AiWBAobZsYC
         Qffw==
X-Gm-Message-State: AOJu0YyBmyzlJBhM6mFkjJmMoRIf7vatWBs70HErxo0p5r5tSmagEL2T
        1bQ0uC7LQEUgE17a3BOAJBtT4E4EP2dBT75YA/UONQ==
X-Google-Smtp-Source: AGHT+IFPsxpWsvVL6VgcRIHEtGBsz1gVxpsWzjAqKuSMUBcje4tHiq0cXy0FbqIZD8diE2rNnl21DBDXeSiuaGBDsx8=
X-Received: by 2002:a1f:e043:0:b0:48d:1071:efd5 with SMTP id
 x64-20020a1fe043000000b0048d1071efd5mr2327215vkg.13.1693571594633; Fri, 01
 Sep 2023 05:33:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230901111548.12733-1-brgl@bgdev.pl> <CACRpkdYLcOZQ9r46aBwesh-H392C_0AWC8n2ikuwUknfEhoNNA@mail.gmail.com>
 <ba9803e9-3aff-42b9-87ad-4e6d75d36d87@sirena.org.uk>
In-Reply-To: <ba9803e9-3aff-42b9-87ad-4e6d75d36d87@sirena.org.uk>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 1 Sep 2023 14:33:03 +0200
Message-ID: <CAMRc=MdX3jtssO_zWCp9g5r00esGgASNeN437aJheRobVyqZcQ@mail.gmail.com>
Subject: Re: [RFT PATCH v2] spi: bcm2835: reduce the abuse of the GPIO API
To:     Mark Brown <broonie@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>, linux-spi@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 1, 2023 at 2:31=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
>
> On Fri, Sep 01, 2023 at 02:15:39PM +0200, Linus Walleij wrote:
> > On Fri, Sep 1, 2023 at 1:15=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.=
pl> wrote:
>
> > > +       struct gpiod_lookup_table *lookup __free(kfree) =3D NULL;
>
> > Whoa!
> > This is really neat.
> > As noted, it will confuse static checkers at no end, but they just have
> > to adopt. (CC to Dan C if he now runs into this.)
>
> It also doesn't look amazing for humans, it's very not C like...

Once it's widely adopted, you'll see how much clearer and less prone
to bugs in error paths the code becomes with autopointers. It's 2023
dammit, if we can't have flying cars, let's at least get some RAII
into the kernel. :)

Bart
