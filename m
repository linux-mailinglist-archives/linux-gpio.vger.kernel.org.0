Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F139C72DC27
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jun 2023 10:17:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240896AbjFMIRB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Jun 2023 04:17:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239466AbjFMIQ7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Jun 2023 04:16:59 -0400
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com [IPv6:2607:f8b0:4864:20::92a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AD4E126
        for <linux-gpio@vger.kernel.org>; Tue, 13 Jun 2023 01:16:56 -0700 (PDT)
Received: by mail-ua1-x92a.google.com with SMTP id a1e0cc1a2514c-78a5384a5daso214025241.0
        for <linux-gpio@vger.kernel.org>; Tue, 13 Jun 2023 01:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1686644215; x=1689236215;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jEXHJ7+CzTjqY42i7ufLxXuYp4jP4pAzlIJJjhreKOA=;
        b=FoTX2HBW47cEpiZpTWpV7I8hNGyX+9RryDq8Royumhj/qhucWThjJJCWOQKbwP4+4V
         MaXp+FyJQ/Lri44p406OM0X8efRvlk+QMTQfNsBcvxxE4+dL4rBAX5lj77M68AQK83NN
         5o4KS/UHpJgtxS3UvKWNowDDH9DaPF/gTO9nRlgJ/l7yvwB96BYXBIdgPd67PT7QkV+w
         P/NXOVyjWV4z9UNY3rakzEKxwc9Nw1GaLpp+Po9bXzEdqhA/FcvTHdvzJz198Z0iw3GB
         EnxXrvKwiaopA0lFD7G7maO0761GaZK033k4/o0OBk+xPHt7+YaOgd/U68e8Kct7b3M9
         u6pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686644215; x=1689236215;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jEXHJ7+CzTjqY42i7ufLxXuYp4jP4pAzlIJJjhreKOA=;
        b=eoiIH6EGp3P83bscSkfJApyn+w7iiA8s8tPOKXyZphqNBw7Fv/loyGsbLLo7fUgSx3
         QgwhXdU/mMyEQu7QpozKcvguX1mh3ex1usa+TSSFrsqr2azYGj+HtMq8iWXn+GbEgplU
         iLGk5urlfICf9RyysTP3Y7e0HNZsgIOW9BimsYQZwp5eqjncUMiLnvL83kfPLX6rQF9o
         /M4HVvQEXJd9bPghKs7zgPTqKKWVOA8cjqiAUgtZum+FYENc9eSg8rYOR++k0R01itxt
         DI+VYXrTYlT/THZf8BKy1SVy5TlzETpUXx0TG05HrN80an2pHCvQGgaqVzkeQHrDIsd8
         MRKw==
X-Gm-Message-State: AC+VfDzmKVAou37YRlUKfpbvUlnvqfA3rQ87drRgvBm0Xejy1dxqScB7
        VjjIPTfrClGESpQJ2fBkzJ3gC8SNdAU/j1lQsMi2Jw==
X-Google-Smtp-Source: ACHHUZ5p/8p960d4W2co6C2I48zSglcWHIrtBuqaqvdioJ7a73klmV5vpftx2dj1DzsEsGL5XexYsEX642VZIeTiWUw=
X-Received: by 2002:a67:e94f:0:b0:43d:91c2:3b08 with SMTP id
 p15-20020a67e94f000000b0043d91c23b08mr3604734vso.14.1686644215729; Tue, 13
 Jun 2023 01:16:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230612-crates_io_publish-v1-0-70988ee9a655@linaro.org>
In-Reply-To: <20230612-crates_io_publish-v1-0-70988ee9a655@linaro.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 13 Jun 2023 10:16:44 +0200
Message-ID: <CAMRc=MfNpirS8SEFDQsweTbOwNWG+-2XPz77kATzCSq_QN-fAw@mail.gmail.com>
Subject: Re: [PATCH libgpiod 0/3] bindings: rust: prepare for crates.io publish
To:     Erik Schilling <erik.schilling@linaro.org>
Cc:     Linux-GPIO <linux-gpio@vger.kernel.org>,
        Kent Gibson <warthog618@gmail.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
        =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 12, 2023 at 1:37=E2=80=AFPM Erik Schilling
<erik.schilling@linaro.org> wrote:
>
> After libgpiod-sys is published [1]. This series does a little bit of
> cleanup and prepares libgpiod for publishing.
>
> [1] https://crates.io/crates/libgpiod-sys
>
> To: Linux-GPIO <linux-gpio@vger.kernel.org>
> Cc: Kent Gibson <warthog618@gmail.com>
> Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Cc: Viresh Kumar <viresh.kumar@linaro.org>
> Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> Cc: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
> ---
> Erik Schilling (3):
>       bindings: rust: add version number to dependencies
>       bindings: rust: exclude Makefile.am from package
>       bindings: rust: document build without install
>
>  bindings/rust/libgpiod-sys/Cargo.toml | 4 ++++
>  bindings/rust/libgpiod-sys/README.md  | 9 +++++++++
>  bindings/rust/libgpiod/Cargo.toml     | 6 +++++-
>  3 files changed, 18 insertions(+), 1 deletion(-)
> ---
> base-commit: 9788bdd3d6791205431e65366dcc518446f7ca6a
> change-id: 20230612-crates_io_publish-946e08590c5b
>
> Best regards,
> --
> Erik Schilling <erik.schilling@linaro.org>
>

Series applied, thanks!

Bart
