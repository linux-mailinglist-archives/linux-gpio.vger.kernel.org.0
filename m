Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF59F7A34CF
	for <lists+linux-gpio@lfdr.de>; Sun, 17 Sep 2023 11:06:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229651AbjIQJFd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 17 Sep 2023 05:05:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235133AbjIQJFY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 17 Sep 2023 05:05:24 -0400
Received: from mail-vk1-xa32.google.com (mail-vk1-xa32.google.com [IPv6:2607:f8b0:4864:20::a32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 791C418B
        for <linux-gpio@vger.kernel.org>; Sun, 17 Sep 2023 02:05:18 -0700 (PDT)
Received: by mail-vk1-xa32.google.com with SMTP id 71dfb90a1353d-4935f87ca26so1494181e0c.3
        for <linux-gpio@vger.kernel.org>; Sun, 17 Sep 2023 02:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1694941517; x=1695546317; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HP1LGUtNLwUI59eq1jyFHHm5cPn/tDriJQdBb0fCPNw=;
        b=sx4ssjVaSHR37XsNWdMzsGgkPvFgh/PuB6VsDSQDfwignqg+aHer4+ACWvQO0aVhuZ
         8HG4cdHfaHj0iGWmD1kpnXfMO0dYnstrosC1wYw7hTs+308Lkz9CiP6O/agV4ospJ33R
         JE8xp5kO3Si/1iVNi0dLYU4ZScUPfjAXA1TDXW+U4PghrG5b6Qbx08giI6B/H6JlR58K
         MKHjWSiuTqvN4b63iu/grGL3C5tDAXhlCsHfvcsE0HN71thvfnQlMYk5dckLEOwyzagc
         iffqnLHly+VJzS+U8gooI9Wz9IJJA2wHYVFATPjpkHwHn2Ek9Vg1IY93seHRGVELnAiV
         8Jsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694941517; x=1695546317;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HP1LGUtNLwUI59eq1jyFHHm5cPn/tDriJQdBb0fCPNw=;
        b=xDaoksjRAbmr1DLShNK5A+uHd62micYg7Rcy88B0SX/L39IdwFjcEyPGD8FlL03hCn
         lpdLp7oEekuE6fWbPdeOwreOJ4r55+cjHhHiAA2jKQdTdx7a3hRnzwJs8t9Z8eOsgLfa
         ENInib336J+9D7a4cGeGGpD0gDAkbgLN4qH0Jn48Q1tqRxk7KSIwPOQtJ3zDGLV1K4GN
         wOo40ZQ6V1cdAUndFRUcaLtGKivHF8wt5dWdvgAIy8mqozZrOU2h2VLSI7Go+gX4pjhg
         FAuWCIGJfJS19EhjIIDpa53O4O8ATkxaTIfnPgWQrsjj3tUCTBQWkuChZ9W2IQfj0xt1
         3PTA==
X-Gm-Message-State: AOJu0YziGZwIkWln0hRq8RGR4LBrQvke6ljOrRWvGQ9e1gEnvjvV683Z
        ZpyugUx/0WsJnn+tvm5hIU6iUXhhavF3y/Dgt7HQ5g==
X-Google-Smtp-Source: AGHT+IEOFuukBkmPR2OxcvqFI6/I9hCYWJtetPmuLWYRbGOhVG9LNvCsqg/Hq6Y7+gWE09rNQ+cgW4jPJVelx7H7oK8=
X-Received: by 2002:a1f:cac7:0:b0:495:e236:a73 with SMTP id
 a190-20020a1fcac7000000b00495e2360a73mr4856611vkg.11.1694941517609; Sun, 17
 Sep 2023 02:05:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230917085837.6199-1-brgl@bgdev.pl> <20230917085837.6199-2-brgl@bgdev.pl>
In-Reply-To: <20230917085837.6199-2-brgl@bgdev.pl>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Sun, 17 Sep 2023 11:05:06 +0200
Message-ID: <CAMRc=MfoWamUG+pcEg6_0QCQ2RFeUyLoqdFPhkkiUTmkU+S7tg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] gpio: sim: fix an invalid __free() usage
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        Alexey Dobriyan <adobriyan@gmail.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        akpm@linux-foundation.org
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
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

On Sun, Sep 17, 2023 at 10:58=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> gpio_sim_make_line_names() returns NULL or ERR_PTR() so we must not use
> __free(kfree) on the returned address. Split this function into two, one
> that determines the size of the "gpio-line-names" array to allocate and
> one that actually sets the names at correct offsets. The allocation and
> assignment of the managed pointer happens in between.
>
> Fixes: 3faf89f27aab ("gpio: sim: simplify code with cleanup helpers")
> Reported-by: Alexey Dobriyan <adobriyan@gmail.com>
> Closes: https://lore.kernel.org/all/07c32bf1-6c1a-49d9-b97d-f0ae4a2b42ab@=
p183/
> Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

I'm sorry for the noise, I realized I dropped the `if (line->offset >=3D
bank->num_lines)` check that were added by commit d7459efc9276 ("gpio:
sim: quietly ignore configured lines outside the bank") for a reason.
I need to send a v3 with that restored.

Bartosz
