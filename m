Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2031876DAFC
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Aug 2023 00:52:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232075AbjHBWwL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Aug 2023 18:52:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230251AbjHBWwK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Aug 2023 18:52:10 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50E8C9B
        for <linux-gpio@vger.kernel.org>; Wed,  2 Aug 2023 15:52:09 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-3a1ebb85f99so218985b6e.2
        for <linux-gpio@vger.kernel.org>; Wed, 02 Aug 2023 15:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691016728; x=1691621528;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9qzpG3gIU/S0XcDLKGDu9gNUJpgK/1yyRvn2bhEmM58=;
        b=xrmpApeQ2v6sILt9CRqF3YnHSMiSJYgEblMuNX6hhdBoYCLL9uNzQKZ5qQLYpVZmtt
         INgtnnTUfcC3RC2tnfGh9hYuvZ3ebUtc+UhBPHsGEIL6+1YjVa2USiLximhYXC0YCG1w
         ERbvq/x/E0WyfMZcUpXvHHgXcs5NQUG79qg1XMx8llW9kRp7ayuHhSNiWnyAk1ZkSoYl
         VSWrBMKYIGR22jMyIIMzl+O293it6cbfwydi+LzfQhs2XqqrW2eV5OysnXGY6NeFm8Ao
         0qIIbUPBuF5trx8btNkKaGTIiRNwM37M5Br539VkyFfQZhtHiqNM/P7Si38BdWffnTNJ
         Vkdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691016728; x=1691621528;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9qzpG3gIU/S0XcDLKGDu9gNUJpgK/1yyRvn2bhEmM58=;
        b=QociPt95HaOxvLDhSBO0wYIski/t2c/gs3JWvNEQMXjpfGqIAsYWT/QB+hyunSGl2l
         eDo9kUEJHZP+pQ1NwLbPh1DnlYFO6TrlON/qftQipRZuRksUdxw1csRm55vhTK7p18CH
         51cLU9zToE2uHpaDSjni/aF+abxDKOziWNiyd4+oRxFq1mxAWXVMKSTV0e6MLw9ZnT9T
         eiA4VhMuA9jmL1lfOXFl8jjcy3JazF+QOs/A5KCa96WWRb/qcWAXfyeH68z2FOwKvcZj
         B/Fqb67sW4dIBftGJ99ewPqnR8A0Z4FZrbJ5b+gpU5DtGQtmZHX8SVRMk+h3QnidGrUS
         /Kvw==
X-Gm-Message-State: ABy/qLYrW1pY7cDlHrj/1WzQLSCj14yUjreWUjLZ9P5Kc6M84vImXiLX
        ZyaSQwPZwUInrkNlCKRB2Hw2Ube6G+PcSFn9IPdqPQ==
X-Google-Smtp-Source: APBJJlGS+pNLS10Ghyz/+qDdpXNy2UKH4DHXtkFNIUNC/vRs0Td4khQtSZjXJLWpsP4zhYRzhRaS0kgKwSpqvjq0PzE=
X-Received: by 2002:a05:6358:880e:b0:132:db25:bbfc with SMTP id
 hv14-20020a056358880e00b00132db25bbfcmr7288698rwb.2.1691016728583; Wed, 02
 Aug 2023 15:52:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230802152808.33037-1-brgl@bgdev.pl>
In-Reply-To: <20230802152808.33037-1-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 3 Aug 2023 00:51:57 +0200
Message-ID: <CACRpkdbNHVpCbBqRMd2eWvU9rMQoxN3Z3hwxqXhN8R5HMonA=g@mail.gmail.com>
Subject: Re: [RFC PATCH] gpio: consumer: new virtual driver
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Aug 2, 2023 at 5:28=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> The GPIO subsystem has a serious problem with undefined behavior and
> use-after-free bugs on hot-unplug of GPIO chips. This can be considered a
> corner-case by some as most GPIO controllers are enabled early in the
> boot process and live until the system goes down but most GPIO drivers
> do allow unbind over sysfs, many are loadable modules that can be (force)
> unloaded and there are also GPIO devices that can be dynamically detached=
,
> for instance CP2112 which is a USB GPIO expender.
>
> Bugs can be triggered both from user-space as well as by in-kernel users.
> We have the means of testing it from user-space via the character device
> but the issues manifest themselves differently in the kernel.
>
> This is a proposition of adding a new virtual driver - a configurable
> GPIO consumer that can be configured over configfs (similarly to
> gpio-sim).
>
> The configfs interface allows users to create dynamic GPIO lookup tables
> that are registered with the GPIO subsystem. Every config group
> represents a consumer device. Every sub-group represents a single GPIO
> lookup. The device can work in three modes: just keeping the line
> active, toggling it every second or requesting its interrupt and
> reporting edges. Every lookup allows to specify the key, offset and
> flags as per the lookup struct defined in linux/gpio/machine.h.
>
> The module together with gpio-sim allows to easily trigger kernel
> hot-unplug errors. A simple use-case is to create a simulated chip,
> setup the consumer to lookup one of its lines in 'monitor' mode, unbind
> the simulator, unbind the consumer and observe the fireworks in dmesg.
>
> This driver is aimed as a helper in tackling the hot-unplug problem in
> GPIO as well as basis for future regression testing once the fixes are
> upstream.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Anyone can easily see how this will benefit testing, so:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

> +config GPIO_CONSUMER
> +       tristate "GPIO Consumer Testing Module"
> +       select CONFIGFS_FS
> +       help
> +         This enables the configurable, configfs-based virtual GPIO cons=
umer
> +         testing driver.

Since this is only for debugging, should it depend on DEBUG?

Yours,
Linus Walleij
