Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7CE85A28D2
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Aug 2022 15:50:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229704AbiHZNuE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 26 Aug 2022 09:50:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231868AbiHZNuD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 26 Aug 2022 09:50:03 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D67344331A
        for <linux-gpio@vger.kernel.org>; Fri, 26 Aug 2022 06:50:01 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id p16so153004ejb.9
        for <linux-gpio@vger.kernel.org>; Fri, 26 Aug 2022 06:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=TG9FgVqi16LcRZPucuD11y6AVi0ILI4JGPeRwHluIjU=;
        b=qQFNTe2hotOb/o+XOeHSkNh888Wv+A2OI6RACKCB02wfnqsHW4VhBNwljxGBpS1Gpz
         QzwBobxjyttdHvpFMxSzwTBJc6nskaYQKhjy4qp15F+GO7fOxdPofwo2tjIQ/Bj2zzaG
         4bzrfDgnRkWXqar/grl2RqNi04r//6jMafKhgvFkRcCBPeXGG7Z/MHTYd2Hh9b1keAM8
         BKfTjHKdE1PyvDKSZ2FB3yQybF5oPbm+wPQSHqlwWe2QPLP1V9/fE/6kxZDdJglbNaIW
         v4oYyDH2Y6dmnvQt9URauX0Qoi/3u2ppiL2irvaLRYH8RwSMqq9nWojbqd4l7Fb6wlGs
         XTaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=TG9FgVqi16LcRZPucuD11y6AVi0ILI4JGPeRwHluIjU=;
        b=iS06uah4H1eZ5ex2iEGmU3zzHPDuoH+vMt0j+tl4mOnd6pOmcZvUhVagZAxfz2PVr3
         giwAaBI5OyW6VlsUT2d5MZTbQYQIsB4M31yukIsCzm8W+47lOTiZjkGAsBzL+j6fkibi
         JsZ6hLn2xIjiqtnh/5bUYkin56ZL1XggXVNFUm9hEZcOwyJvvuFaT/8MGYBvGZWA7bjx
         +VXCp8dPtceXNEdVktUphbUO8md9i5MyYfLNMlQYhUJcPUVzEGLsnodb87qNON+he0IZ
         PchtD4mauoM7iJvUYUSvtIAfwEjWoiDIOIMMtiXLJs3OrdJzRJJc4Tksea5uLlLp942s
         bNQQ==
X-Gm-Message-State: ACgBeo3HhfVoL2xA0+81rvEon2hZQpMy15eHWOK/Ld8R0FZZkJoYNV+u
        1cxsameGlFnvKKDbcmp/chJFgK712vP9+2wr7B8KVA==
X-Google-Smtp-Source: AA6agR5u0kMHIqr2Sykv6xwyKqyIoWq4UaK5pcx+HYQdU9jyokivM4Cu/SHtZ0DUaUkVm8ttZKbzeve9caR+0zBdJbY=
X-Received: by 2002:a17:907:72cf:b0:73d:d007:e249 with SMTP id
 du15-20020a17090772cf00b0073dd007e249mr5333295ejc.500.1661521800345; Fri, 26
 Aug 2022 06:50:00 -0700 (PDT)
MIME-Version: 1.0
References: <f31b818cf8d682de61c74b133beffcc8a8202478.1660041358.git.christophe.leroy@csgroup.eu>
 <CACRpkdY53c0qXx24Am1TMivXr-MV+fQ8B0CDjtGi6=+2tn4-7A@mail.gmail.com>
 <CAK8P3a1Vh1Uehuin-u5QrTO5qh+t0aK_hA-QZwqc00Db_+MKcw@mail.gmail.com>
 <CACRpkdbhbwBe=jU5prifXCYUXPqULhst0se3ZRH+sWOh9XeoLQ@mail.gmail.com>
 <CAK8P3a0j-54_OkXC7x3NSNaHhwJ+9umNgbpsrPxUB4dwewK63A@mail.gmail.com>
 <CACRpkda0+iy8H0YmyowSDn8RbYgnVbC1k+o5F67inXg4Qb934Q@mail.gmail.com>
 <CAK8P3a0uuJ_z8wmNmQTW_qPNqzz7XoxZdHgqbzmK+ydtjraeHg@mail.gmail.com>
 <CACRpkdb5ow4hD3td6agCuKWvuxptm5AV4rsCrcxNStNdXnBzrA@mail.gmail.com> <87f2ff4c-3426-201c-df86-2d06d3587a20@csgroup.eu>
In-Reply-To: <87f2ff4c-3426-201c-df86-2d06d3587a20@csgroup.eu>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 26 Aug 2022 15:49:49 +0200
Message-ID: <CACRpkdYizQhiJXzXNHg7TXUVHzhkwXHFN5+e58kH4udGm1ziEA@mail.gmail.com>
Subject: Re: [PATCH] gpio: Allow user to customise maximum number of GPIOs
To:     Christophe Leroy <christophe.leroy@csgroup.eu>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Alexandre Courbot <gnurou@gmail.com>,
        Alexandre Courbot <acourbot@nvidia.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Jonathan Corbet <corbet@lwn.net>,
        Russell King <linux@armlinux.org.uk>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
        "open list:GENERIC INCLUDE/ASM HEADER FILES" 
        <linux-arch@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 25, 2022 at 4:00 PM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:

> > Christophe? Will you take a stab at it?
>
> Which patch should I write ?

One that removes CONFIG_ARCH_HAS_NR_GPIO entirely, then
allocate bases for new GPIO chips from 0 and upward instead.
And then see what happens.

Yours,
Linus Walleij
