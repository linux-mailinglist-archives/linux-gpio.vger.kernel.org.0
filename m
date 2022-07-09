Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05E5556C945
	for <lists+linux-gpio@lfdr.de>; Sat,  9 Jul 2022 13:53:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229460AbiGILxT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 9 Jul 2022 07:53:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbiGILxS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 9 Jul 2022 07:53:18 -0400
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F21E18B16;
        Sat,  9 Jul 2022 04:53:17 -0700 (PDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-31d27fd3d94so9917257b3.7;
        Sat, 09 Jul 2022 04:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1HdCa8JaBhBe1x+dQjl5PVk/b2s2b2bApOUpgobQiZc=;
        b=Zj+rynRLWTx6GjzPfSmKFqFIlmu16iinYammW8Q5H8SMbhT2RB3b1smHMxQ6T5nmEK
         Ej1ve0jBLI1w/EaVRw2eqC+5pgosHPLbem9hod6vl8IAE7z7Nr0tXon4Ldy9YoC6OkEj
         Y0iYfPpdd/cyKROQeNBxAxTRMdL4xCYroMICZ64FbLZ/eQFurFhvReODeata+I/RK9t6
         pjGvZv3Zu5tgw+VvhMKbshTY/vyqMygUfglcQVFDMcOMnO6dw5cw6kQqRk1vwOtfxqEs
         zUw9vM0YGWTgF8yrRw7G41Bs4e6OGOyNiIwKH04yUIixcbffxOtAnttv25x0o/t7kU5m
         W5NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1HdCa8JaBhBe1x+dQjl5PVk/b2s2b2bApOUpgobQiZc=;
        b=Ea8UiCN3pEgayV/VCan8dBr5CkMFERBl1OcntI/kyJ6xcpkhphabwywdcIJo04dfhj
         wKjFWJ8yBZCs9ALclFnqJqvWcdSQO3ShiUDJSoI0YLmQlYI5G1GbJR1rcx1UOyqf+dHF
         2+wIK770OSRu95lwusC4zraVeznR1LYFDy1Q3r0aRzIylMkYBQWKj1ADORQ1CfSc8OLT
         v8oQRbIrK2jBMRet63BH6IxxtmzB9/xFpGK/+p2zWC4k3qrf/8vsIq3yQR99PstCSQ3J
         A+GeWXFsQ6V9xEB7bMbCU+grH5yoIHbm7FJm3jT9Qn1AONcW91H01yRHIiglnLOtE/BO
         Z9EQ==
X-Gm-Message-State: AJIora9VYKo8nL0rgvSwRvcGLNE3qMGo1Ibt67Nyi3ZyVGHihpGieyL1
        s2ElHY/VBJs3HasQ3HgPNFv1efy1R6EfnckMMfE=
X-Google-Smtp-Source: AGRyM1t34SOaeHMpbBP42yDVZZ7Yk7/a8nvd8vWppoQ8b4AP03aUHRugEErG8Ze0HVi4z0e4AS02+b13SMorpBwQrXg=
X-Received: by 2002:a81:4986:0:b0:31d:388b:d08d with SMTP id
 w128-20020a814986000000b0031d388bd08dmr4739829ywa.185.1657367596167; Sat, 09
 Jul 2022 04:53:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220708093448.42617-2-nuno.sa@analog.com> <202207091223.nBzeL6dk-lkp@intel.com>
In-Reply-To: <202207091223.nBzeL6dk-lkp@intel.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 9 Jul 2022 13:52:39 +0200
Message-ID: <CAHp75Vfs5Q=hJ6v5Ft4w4+DU3HgbV5z0FsuZXrFEK3B43-4SaA@mail.gmail.com>
Subject: Re: [PATCH 01/10] input: keyboard: adp5588-keys: support gpi key
 events as 'gpio keys'
To:     kernel test robot <lkp@intel.com>
Cc:     =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>,
        devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-input <linux-input@vger.kernel.org>,
        kbuild-all@lists.01.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Michael Hennerich <michael.hennerich@analog.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jul 9, 2022 at 6:22 AM kernel test robot <lkp@intel.com> wrote:
>
> Hi "Nuno,
>
> I love your patch! Yet something to improve:
>
> [auto build test ERROR on dtor-input/next]
> [also build test ERROR on next-20220708]
> [cannot apply to brgl/gpio/for-next hid/for-next linus/master v5.19-rc5]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Nuno-S/adp5588-keys-refactor-and-fw-properties-support/20220708-173730
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
> config: x86_64-randconfig-a013 (https://download.01.org/0day-ci/archive/20220709/202207091223.nBzeL6dk-lkp@intel.com/config)
> compiler: gcc-11 (Debian 11.3.0-3) 11.3.0
> reproduce (this is a W=1 build):
>         # https://github.com/intel-lab-lkp/linux/commit/64267ff775fd4b945fb916a10187be1c15faa165
>         git remote add linux-review https://github.com/intel-lab-lkp/linux
>         git fetch --no-tags linux-review Nuno-S/adp5588-keys-refactor-and-fw-properties-support/20220708-173730
>         git checkout 64267ff775fd4b945fb916a10187be1c15faa165
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash
>
> If you fix the issue, kindly add following tag where applicable
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>    drivers/input/keyboard/adp5588-keys.c: In function 'adp5588_gpio_add':
> >> drivers/input/keyboard/adp5588-keys.c:263:18: error: 'struct gpio_chip' has no member named 'of_node'; did you mean 'fwnode'?
>      263 |         kpad->gc.of_node = kpad->client->dev.of_node;
>          |                  ^~~~~~~
>          |                  fwnode

Yes, exactly the point why of_node is bad to have. In legacy code like
this you need to guard access to it with #ifdef CONFIG_OF_GPIO IIRC.

-- 
With Best Regards,
Andy Shevchenko
