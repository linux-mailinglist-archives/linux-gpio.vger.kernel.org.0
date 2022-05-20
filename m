Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7226952E53B
	for <lists+linux-gpio@lfdr.de>; Fri, 20 May 2022 08:46:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345983AbiETGqu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 20 May 2022 02:46:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345388AbiETGqr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 May 2022 02:46:47 -0400
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EACD1116F1
        for <linux-gpio@vger.kernel.org>; Thu, 19 May 2022 23:46:46 -0700 (PDT)
Received: by mail-qk1-f180.google.com with SMTP id i68so5075456qke.11
        for <linux-gpio@vger.kernel.org>; Thu, 19 May 2022 23:46:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0fEsG1REenhTDQ83emJMZQJrbaqrpI3TQgu5APLMoJ0=;
        b=SO3dxV3AGqUW3n2dcG8OeY5gRUvhPpipv8I+xg417Ua0NqRiWxg3o+YAfjCkhiWEJC
         dZFLfrhO2q6v5VuEFBC0+sGRfi9265IPBOtYSBl/bHCbkkVgIuafz17AqtP+uvS/YQt/
         tB7s+MEmR+Agw7CLt/gOw05tvksgo/7SzPHYqv0aXTsFnvTdYh7jN1TupIUKFgNxzuyR
         Fi8UjU7rOMyTk31WrFYeKtmysSrb4SMw+5gQ63ugTRKrJrtiXD1V39MT27zZdd/7nYn5
         2WEpn6x4KO1ugXBz9xbO/pdIhK6uB3NBmeaHBEcXQnlKuAKXwDyZHXz4ZWWiEFo9DVmj
         GjcA==
X-Gm-Message-State: AOAM533GiI1qr5QxBQX2c/bq0DcJSEWUtkrJS19ffD7HuMHjq9i3ujmr
        ttIrOORBggyxHJS81wc7bxc79Jpd6qPS3Q==
X-Google-Smtp-Source: ABdhPJymF9zIQju66QAEf4q9tsEMXjF71gnXsOvIyMoO+qVvDWb89UOeXfXgH7Xz9JVqus3D3k9hIg==
X-Received: by 2002:a05:620a:472a:b0:6a0:23f0:6a64 with SMTP id bs42-20020a05620a472a00b006a023f06a64mr5382751qkb.534.1653029204671;
        Thu, 19 May 2022 23:46:44 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id b126-20020a37b284000000b0069fc13ce1fcsm2598771qkf.45.2022.05.19.23.46.43
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 May 2022 23:46:43 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id b124so702603ybg.12
        for <linux-gpio@vger.kernel.org>; Thu, 19 May 2022 23:46:43 -0700 (PDT)
X-Received: by 2002:a05:6902:120e:b0:634:6f29:6b84 with SMTP id
 s14-20020a056902120e00b006346f296b84mr8192031ybu.604.1653029203180; Thu, 19
 May 2022 23:46:43 -0700 (PDT)
MIME-Version: 1.0
References: <73c75a67d1c87b049d633057c0e765e708ee02a2.1652884788.git.geert+renesas@glider.be>
 <202205201122.xuM6bWUt-lkp@intel.com>
In-Reply-To: <202205201122.xuM6bWUt-lkp@intel.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 20 May 2022 08:46:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX_WMwPVTbGQYLSeCb5P2BNimkzeif+o9oDwx40qt7D5g@mail.gmail.com>
Message-ID: <CAMuHMdX_WMwPVTbGQYLSeCb5P2BNimkzeif+o9oDwx40qt7D5g@mail.gmail.com>
Subject: Re: [PATCH] gpio: sifive: Make the irqchip immutable
To:     kernel test robot <lkp@intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Damien Le Moal <damien.lemoal@wdc.com>,
        Marc Zyngier <maz@kernel.org>, kbuild-all@lists.01.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
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

Hi Kernel Test Robot,

On Fri, May 20, 2022 at 5:29 AM kernel test robot <lkp@intel.com> wrote:
> I love your patch! Yet something to improve:
>
> [auto build test ERROR on linus/master]
> [also build test ERROR on linusw-gpio/for-next v5.18-rc7]

As of commit 2d3535ed2c73fee3 ("MAINTAINERS: update the GPIO git tree
entry"), the GPIO for-next tree has changed to
git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git#gpio/for-next

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
