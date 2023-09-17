Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32AE37A36A1
	for <lists+linux-gpio@lfdr.de>; Sun, 17 Sep 2023 18:47:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235961AbjIQQq7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 17 Sep 2023 12:46:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236387AbjIQQqi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 17 Sep 2023 12:46:38 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2113132
        for <linux-gpio@vger.kernel.org>; Sun, 17 Sep 2023 09:46:32 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-99bdeae1d0aso456021366b.1
        for <linux-gpio@vger.kernel.org>; Sun, 17 Sep 2023 09:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1694969191; x=1695573991; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0paMOWTj7qFjWlnbMH8/b4zKX3pixZT+0KYdXbHqu5E=;
        b=Oh1UB1+RciiQ5hY1lEWIslYavaePDb7gSxuGbYIRlqbZ2u7v3jfThxGQsqXDxlkVYj
         BoV0S5yxNB7nG/84GytHiENEZ6KlwV3Srba0v2oAUNBr5+a0uDucAiznZNkPoWI1Xc9Q
         lHrg7iMctTCYHlJidZ01NAlA1wsr4SMKYAhZg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694969191; x=1695573991;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0paMOWTj7qFjWlnbMH8/b4zKX3pixZT+0KYdXbHqu5E=;
        b=L/diIVEDbgShbp4p4uBhx3zRdp4kDeq0wcoaYHGtmSDhaI0dv8UwAC1qfzkBfzrPuK
         2g/6+y+yEJXKy/Jr3sHYsXvfrjVxpWFM2WY4UJ88q/SSQA9g2SnCsYK6FWOfb2WY+pZX
         ngBSqRIC9S5ZyEEmMrK3425bM7ISte5GAYfknGDjdXzKqy6QgSKgUXSXeB3ClOngV0Gz
         rayBW3gv3VbtKWPnuLazTc0G4RVrTDbM2uYSsxTP2iooga9w/trA4YWKLd7hkqhMOn4o
         VbchFOEl73QGwqQxKIN96Lhcu2Va9cY2KkcrrWKuxYoQwqXOQ+xPRJvJjphlwiVFgT91
         TaCg==
X-Gm-Message-State: AOJu0YwyhYP37BrM/1U0US3febODqvAbsBH7LaLBElKIL6m2xWTp/oXo
        sOdpWKyMlFJOoX8Hua61NngmuGxEAY8hOCYnFOQHDM/f
X-Google-Smtp-Source: AGHT+IF/vfjdnLFQdz8tW+QrYBkY5EmdaXeQq56pMh2d2zofd7FCzj2j6n6+hXbkAyoBUEguqhaG4g==
X-Received: by 2002:a17:907:78d4:b0:9a2:295a:9bbb with SMTP id kv20-20020a17090778d400b009a2295a9bbbmr6304009ejc.25.1694969191283;
        Sun, 17 Sep 2023 09:46:31 -0700 (PDT)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id kt26-20020a170906aada00b0098f99048053sm5299767ejb.148.2023.09.17.09.46.29
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Sep 2023 09:46:30 -0700 (PDT)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-522bd411679so4757565a12.0
        for <linux-gpio@vger.kernel.org>; Sun, 17 Sep 2023 09:46:29 -0700 (PDT)
X-Received: by 2002:a50:e70a:0:b0:52a:1d54:2534 with SMTP id
 a10-20020a50e70a000000b0052a1d542534mr6243521edn.25.1694969189489; Sun, 17
 Sep 2023 09:46:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230917091225.6350-1-brgl@bgdev.pl> <20230917091225.6350-2-brgl@bgdev.pl>
In-Reply-To: <20230917091225.6350-2-brgl@bgdev.pl>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun, 17 Sep 2023 09:46:12 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjr5N-2ZKgn_gPaMapprn1vbBxzsdp4fJY+2iC=1H2T5g@mail.gmail.com>
Message-ID: <CAHk-=wjr5N-2ZKgn_gPaMapprn1vbBxzsdp4fJY+2iC=1H2T5g@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] gpio: sim: fix an invalid __free() usage
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        Alexey Dobriyan <adobriyan@gmail.com>,
        Peter Zijlstra <peterz@infradead.org>,
        akpm@linux-foundation.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, 17 Sept 2023 at 02:12, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> +               has_line_names = true;
> +               max_offset = max(line->offset, max_offset);

I really don't understand why you kept this old broken logic.

I sent a much better version of this function that didn't need that
pointless has_line_names thing or the 'max()' thing, by just making
the code a lot simpler.

Whatever.

> +       line_names_size = gpio_sim_get_line_names_size(bank);
> +       if (line_names_size) {
> +               line_names = kcalloc(line_names_size, sizeof(*line_names),
> +                                    GFP_KERNEL);
> +               if (!line_names)
> +                       return ERR_PTR(-ENOMEM);
> +
> +               gpio_sim_set_line_names(bank, line_names);
>
> -       if (line_names)
>                 properties[prop_idx++] = PROPERTY_ENTRY_STRING_ARRAY_LEN(
>                                                 "gpio-line-names",
>                                                 line_names, line_names_size);
> +       }

But I do like this reorganization.

            Linus
