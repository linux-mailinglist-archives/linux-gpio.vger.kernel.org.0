Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06DCF7C5281
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Oct 2023 13:52:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232060AbjJKLwZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Oct 2023 07:52:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231758AbjJKLwY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Oct 2023 07:52:24 -0400
Received: from mail-ua1-x929.google.com (mail-ua1-x929.google.com [IPv6:2607:f8b0:4864:20::929])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BF4398
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 04:52:22 -0700 (PDT)
Received: by mail-ua1-x929.google.com with SMTP id a1e0cc1a2514c-7aae07e7ba4so2247281241.1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 04:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697025141; x=1697629941; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2jhOJjfgk/tsytWSI6B4SlUQEQAwcOqSvyjudj+7ZSQ=;
        b=f5wR5tveSmcQPGZDDrEbj3qfaxpHaLZ5OBZh1X6BzDBaEYuhpMVYbc+nK490SGpCbl
         6dxrxhTki7WC23v70fksagdklFcSpOmFuEI4O0tiu6TLfhDOewt7gqy9Si0Wjsz1scRk
         2+tMcz71nTrSlwF7IoEs8rQqfYSSKqt3joVHF0ceGWCKi49Qe4RQwkW0zBcs8m/aTX+2
         9kTPTuxqzLLSohcv8cOonZC0bdaK1FaBP5+915uTa/kiYi+NZXAwmd08HSsEgcJkk7sE
         vdz+1EPBkltW8ok81Go7qR7ZB6a3eLPdCUA11R3nrnxF6ka0pDoYFmw1y4BYliUrgOZ3
         u8kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697025141; x=1697629941;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2jhOJjfgk/tsytWSI6B4SlUQEQAwcOqSvyjudj+7ZSQ=;
        b=OeS+VkJqBg3eHTzt/3aVUKLWoO/R9f3W2mTY/Rq2FAuXS3nc4pRuYTbXO0e54yYrv5
         s4GhRl9/B3B5SXiBbwDucqkEeSkY/6vYVDbwaWToH7FA2bfDHWabZe38ZYMdH7cosoU2
         /XUHDIeGOR1ZXq/lWti2zXOwifBhbU9uDSgfpoYujkmPH2jnHD0QpuT2jErEZcyYsl3e
         CGQesVVTNPS8JqGACu6TVPpcCIPnMR7g6fzcvT9Ck7hkI6L9t8PUUrf6fODykBGGLand
         dxx3JJaOAm27U4NwgE0luT1wRmLEuuhdLscRoVmYflFi/Ds+7dJ46rsfYvoaYVbkDr64
         aIwg==
X-Gm-Message-State: AOJu0YygG+PHoSL+lUKptc8bowoa3P3Hv5g/ZfEjI4/qb60hfUpdNOsb
        Ajdep7rCv+5UN3zU7eEoJUa18Eh/tOtul6b11D93ug==
X-Google-Smtp-Source: AGHT+IHyT7U9K2uU1USFnYRRnTCLcgzE3gwjWfEFqFJSqWotgTWitPJ2vkRGQ+QGMCHffNhyxUE4OOT3ZCUbtDgsGyw=
X-Received: by 2002:a1f:df01:0:b0:486:e696:c69a with SMTP id
 w1-20020a1fdf01000000b00486e696c69amr16399078vkg.16.1697025141607; Wed, 11
 Oct 2023 04:52:21 -0700 (PDT)
MIME-Version: 1.0
References: <20231004183906.97845-1-brgl@bgdev.pl> <169696282723.222014.3485016870976123694.b4-ty@kernel.org>
 <CAMRc=MenBeJV+p6LirsCfyaPRWfAvSrVQayqUc77KOyvRGMqvQ@mail.gmail.com> <f1b8555b-5acb-43cd-b48b-1dfafdb8d27c@sirena.org.uk>
In-Reply-To: <f1b8555b-5acb-43cd-b48b-1dfafdb8d27c@sirena.org.uk>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 11 Oct 2023 13:52:10 +0200
Message-ID: <CAMRc=MdLXjnYiTjfoKjqAVcLvG5r3p5mWYbSupDM3Di-BAe5eQ@mail.gmail.com>
Subject: Re: [PATCH] spi: bcm2835: add a sentinel at the end of the lookup array
To:     Mark Brown <broonie@kernel.org>
Cc:     Florian Fainelli <florian.fainelli@broadcom.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>, linux-spi@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>
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

On Wed, Oct 11, 2023 at 1:45=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Wed, Oct 11, 2023 at 09:36:19AM +0200, Bartosz Golaszewski wrote:
> > On Tue, Oct 10, 2023 at 8:33=E2=80=AFPM Mark Brown <broonie@kernel.org>=
 wrote:
> > > On Wed, 04 Oct 2023 20:39:06 +0200, Bartosz Golaszewski wrote:
>
> > > [1/1] spi: bcm2835: add a sentinel at the end of the lookup array
> > >       commit: 9aaa25df9b02bfe5579cbc9b4cc1177c662ec33f
>
> > Can you provide me with an immutable branch containing commit
> > 21f252cd29f08892d48739fd7513ad79c1cff96a (the one this one fixes)?
>
> > We are very close to removing gpiochip_find() from the GPIOLIB and
> > with this pulled we could remove it for v6.7.
>
> Ugh, *please* say this sort of thing when sending patches rather than
> waiting until after they've been applied.  The default is just to add
> patches to the normal development branches which means they have the
> whole history for the release cycle after them and may well have other
> things applied on top of them before you get round to asking for them to
> be applied on a different branch as is the case here.

I'm sorry. I didn't expect the removal process to go as fast as there
were quite a few users but it turned out to be almost ready now.

We can wait until rc7 when your for-next branch will be more or less
immutable and then you can tag
21f252cd29f08892d48739fd7513ad79c1cff96a alone (it only has a few
commits between it and v6.6-rc1) if that works for you?

Bart
