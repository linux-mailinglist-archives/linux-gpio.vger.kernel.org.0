Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1EB9B78DD1E
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Aug 2023 20:53:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239276AbjH3Sry (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Aug 2023 14:47:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243825AbjH3Lsy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Aug 2023 07:48:54 -0400
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com [IPv6:2607:f8b0:4864:20::e31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB6BC1B0
        for <linux-gpio@vger.kernel.org>; Wed, 30 Aug 2023 04:48:50 -0700 (PDT)
Received: by mail-vs1-xe31.google.com with SMTP id ada2fe7eead31-44d38d91885so2323216137.1
        for <linux-gpio@vger.kernel.org>; Wed, 30 Aug 2023 04:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1693396130; x=1694000930; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BUEjMt/8gQISEBJ9n8m7X9z7I5hN+ItDdhTAq683G6c=;
        b=DvOkbKRsSbb0wfQeyPAZukyIGi30OVQ3Ah9ST1Ho1ugOcm+HfcTTqpHhTYknwaJ635
         bjZxtn7XolTtTCdTtESZ2ih+bC8kkOZAHdbu6L0ZzF5NKextXE60hS+oOwqGD3DnynTX
         mWO3sk56h3xmx8IIRgOY5ZXJF8eVkc4wV6Bex2U/IxRi/EO1PL1hsepeGiIhxIvZYIAj
         bW9jrNCTI3KtlhwMAbmuXjBOEkwcADGIilvb1QD4TlcV4aWnK9Hf/bBKbU1TNOK2iTI/
         tEKQh9xcMuaGxch0fKItMgvxstdRyHtrsSWRCIxyLRXnjsen/oqY3zhncjA3ii6WH+n7
         s7Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693396130; x=1694000930;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BUEjMt/8gQISEBJ9n8m7X9z7I5hN+ItDdhTAq683G6c=;
        b=KwlGXGLINNmemvUYKSY4otHy4chPoNhF0oKV8Etcv+ogoVcohQkJcaw3T8c416F9ZA
         85OVVcycyTs0JfdSgkeRC0+cEmJ8aesBNsUOdjpwyUXwDZRhd3O7Bzzle3m7llVr4Ojv
         toJE9/5jJHQPzjmpk2OXXm6M+8006PDwmfkI4Y1wg6OUbeLyaKWeJLh9nzZxSxfq2a8r
         JIxcj+lSPreyaUh7tcRz8vs0GmoMisO6ktYHG6qslaG99sHbhl7f4x/fxI2N/MY0/RIg
         9bylGPVRNvBYzO6HfasRb52fBk7KM3NnoAPW2dRShqRZsLDc863DlfEKlf3NHXiUFUne
         9MHA==
X-Gm-Message-State: AOJu0YxlHqu0FsIi/3f3dxHy4pIaTV/kYknu/0Nz1rmGR56HdRJAQsU/
        KMPmArhoimZVqlABFWOvzgUi8f9JqNEkzEKE7unFxg==
X-Google-Smtp-Source: AGHT+IFV9dQcsM+38+/FNEpB96SHGugYRFcvM44VlQQUJLvoNTgY8bbVDzAm2LXi5GhcwqyuMmb+KG704wzn8csJ22U=
X-Received: by 2002:a67:eeda:0:b0:44d:3bc0:f0bf with SMTP id
 o26-20020a67eeda000000b0044d3bc0f0bfmr1577013vsp.8.1693396129942; Wed, 30 Aug
 2023 04:48:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230829114301.10450-1-brgl@bgdev.pl> <CAHk-=wigZt6kVkY0HU1j_LJ5H1KzwPiYnwwk6CbqXqT=sGenjg@mail.gmail.com>
In-Reply-To: <CAHk-=wigZt6kVkY0HU1j_LJ5H1KzwPiYnwwk6CbqXqT=sGenjg@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 30 Aug 2023 13:48:39 +0200
Message-ID: <CAMRc=Mcbaw9A1sdU3VtPvuThaCm6woPtGaCp0xRT6AcK2UzDkA@mail.gmail.com>
Subject: Re: [GIT PULL] gpio: updates for v6.6
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 29, 2023 at 10:29=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Tue, 29 Aug 2023 at 04:43, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >
> > Driver improvements:
> > - use autopointers and guards from cleanup.h in gpio-sim
>
> So I've pulled this, but I'm not entirely convinced some of this was a cl=
eanup.
>
> That gpio_sim_config_make_device_group() change is "interesting". Doing
>
>         return &no_free_ptr(dev)->group;
>
> looks a bit crazy. My first reaction to it was 'that can't be right".
> It _is_ right, but I'm not convinced that getting rid of one kfree()
> call in the error path above it is worth that kind of semantic
> complexity.
>
> I guess we'll get more used to this - and it will look a bit less
> crazy in the process - but I did want to just note that I'm not
> entirely convinced we should encourage things like this.
>
>               Linus

I on the other hand absolutely love SBRM in C. I have been using
autopointers a lot in user-space when coding in GLib/GObject and it
quickly becomes second nature with no_free_ptr() not being much
different from g_steal_pointer(). It's an even better pattern when
used with reference counted objects where the cleanup function just
drops the reference so you can do a less "crazy" return
object_ref(obj);

Maybe this particular example doesn't save a lot of code but I think
it's worth using SBRM consistently across a given file, otherwise
mixing both styles will lead to an unreadable mess.

Bartosz
