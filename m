Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E92B33A5C75
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Jun 2021 07:27:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231952AbhFNF3j (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Jun 2021 01:29:39 -0400
Received: from mail-pg1-f181.google.com ([209.85.215.181]:40650 "EHLO
        mail-pg1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229879AbhFNF3j (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Jun 2021 01:29:39 -0400
Received: by mail-pg1-f181.google.com with SMTP id m2so994833pgk.7
        for <linux-gpio@vger.kernel.org>; Sun, 13 Jun 2021 22:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=SKkIWihex8iN4vHyV2ULlQRHidyqRPcEAHjFrEdw0eo=;
        b=Ztkc32hhSlxDlYO/aubdvIkMY/qTaOmjdAcpUSwoddC36oiCXbW0t6Fgj7dqeMLjGr
         GKKydNoa0tuWwuRm9W2Oku1KuwQbuQOU2vGNe8iqT5qZpembeOWkm6pzrzcJ4UtTfT3O
         2e868LLS7FN9kx0eyKZAZvbNfNgLUlJuXj7X9NiAHHdoSF54ImmSfOU4XZRvkkb4q+zS
         4n3axSTfriXtldwQE7uH4sqiNUTf1F6IEBtIlG+THkwuA/uo2Dwz3YbQDLu64X6E4IsQ
         KnRwXOZqqYRo41Ey01DOqng25fgXBzlcHhBQhLIZGYVo/TgWDOPU1MK/3+ddM/Lr4vPs
         Pwhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=SKkIWihex8iN4vHyV2ULlQRHidyqRPcEAHjFrEdw0eo=;
        b=K+FA7YhdHGbgHizmXdvjB4Ahm0NYvoz/PRBN9ehWdJlWJYavbrCR6G72HZCMQ0bZ/3
         A8Lj0RaR8HieqewsA70m3TEgC3WLW8xtchVux94PqmU1KgP1/Of3bJtKpM13zGD00S/S
         eAyFqjIZ9jCD1IxLtV7u8syH/VnPcj05ywCPtJugSdojfI+RZYVcCFB+Yb7+lAJGVDey
         sbCI1sooWEjSdpYXNThvLUR7YcW4++62ggb6pOJkOdk3qu1BOGfc1YdMiX6XZ2m3dcH/
         catP0sMFTDgIAUjuSHP31ssoHaeo2VnNsg9c9gtHsOfC6bl5/HoLODOXSaq/o7B0k58d
         Ny8Q==
X-Gm-Message-State: AOAM533xsBlyXON7SyACHVPtHWICtZlwTzMjv0atOXmwBsbiIgk1OkB7
        M65B+8d2Gw26+98IS5BVZYzHEwtom3vTYg==
X-Google-Smtp-Source: ABdhPJxQbwYoqWhTfdLy3aAMNginzsjm12had6Yj2Ufq28W5WByJrv24ex9t825/WyIyYjOTicJLzg==
X-Received: by 2002:a62:87c9:0:b029:2ea:572c:e4b1 with SMTP id i192-20020a6287c90000b02902ea572ce4b1mr20241936pfe.34.1623648381981;
        Sun, 13 Jun 2021 22:26:21 -0700 (PDT)
Received: from localhost ([136.185.134.182])
        by smtp.gmail.com with ESMTPSA id gf10sm10515354pjb.35.2021.06.13.22.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jun 2021 22:26:20 -0700 (PDT)
Date:   Mon, 14 Jun 2021 10:56:17 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Arnd Bergmann <arnd@linaro.org>
Cc:     Jean-Philippe Brucker <jean-philippe@linaro.org>,
        Stefan Hajnoczi <stefanha@redhat.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Viresh Kumar <vireshk@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        virtualization@lists.linux-foundation.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Stratos Mailing List <stratos-dev@op-lists.linaro.org>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Jason Wang <jasowang@redhat.com>,
        "Stefano Garzarella --cc virtualization @ lists . linux-foundation . org" 
        <sgarzare@redhat.com>
Subject: Re: [Stratos-dev] [PATCH V3 1/3] gpio: Add virtio-gpio driver
Message-ID: <20210614052617.jfdgunichi73eup5@vireshk-i7>
References: <cover.1623326176.git.viresh.kumar@linaro.org>
 <01000179f5da7763-2ea817c6-e176-423a-952e-de02443f71e2-000000@email.amazonses.com>
 <YMJOk6RWuztRNBXO@myrica>
 <01000179f9276678-ae2bb25f-4c0c-4176-b906-650c585b9753-000000@email.amazonses.com>
 <CAK8P3a2-bXfDcPymMct2aUXs2m+YgbKdmAatMMs9tnc+HjS_xQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a2-bXfDcPymMct2aUXs2m+YgbKdmAatMMs9tnc+HjS_xQ@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 11-06-21, 10:34, Arnd Bergmann wrote:
> Extraneous __packed annotations do cause real problems:
> 
> - On architectures without hardware unaligned accesses, the compiler is
>   forced to emit byte load/store instructions, which is slower and breaks
>   atomic updates to shared variables
> 
> - If a function takes a pointer of a packed struct member, and passes that
>   pointer to a function that expects a regular aligned pointer, you
> get undefined
>   behavior. Newer compilers produce a warning if you do that (we currently
>   shut up that warning because there are many false positives in the kernel),
>   but you can also run into CPU exceptions or broken code even on CPUs
>   that do support unaligned accesses when the variable ends up being
>   actually unaligned (as you just told the compiler that it is allowed to do).

I understand that these problems will happen if the structure isn't
aligned, but in this case the structure is aligned properly, just that
we are explicitly telling the compiler to not add any padding (it
won't have added any in here). Is it still harmful ?

-- 
viresh
