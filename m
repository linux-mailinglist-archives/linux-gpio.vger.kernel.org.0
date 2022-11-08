Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2354062114D
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Nov 2022 13:47:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233974AbiKHMrc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Nov 2022 07:47:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234128AbiKHMr2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Nov 2022 07:47:28 -0500
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6942551C3D
        for <linux-gpio@vger.kernel.org>; Tue,  8 Nov 2022 04:47:27 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id bj12so38192528ejb.13
        for <linux-gpio@vger.kernel.org>; Tue, 08 Nov 2022 04:47:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ioB2Pj2dj+j6cLcAyHpva8ZzHBtOBVLLO7B5OtXKx/Q=;
        b=Cj6OlLz8KBnHKZt4OvaJcf+I0jZpagvKQRl5AxpAe6tVH9pwiRrxSm2th7mVShhS/M
         jJ7Gh9PNOdnWv9eEkBp4AHZ6zU4rZ0U1U4BThUnFXfDPt0yndjtxV39MAqWwpX2w6MF1
         XBkIlowlnra90g+BzTwP6khA1v0zrzyUsONHuri0rMElWQS2dwiRc0amaSP6c6NWQBVs
         NcZOUcqoe31SZIhwvLijPIMQvg+3x/9emE+maZgpX9NSG8L6BiAi/yKi3k4sZxzOe7Il
         Uwz2hDpWGdw2jUZFJXnySRl/fYVlFbvFxNDGvLRr9ZtuRUpRpq8N4BFJype5ojo6d6uo
         5pHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ioB2Pj2dj+j6cLcAyHpva8ZzHBtOBVLLO7B5OtXKx/Q=;
        b=JOKgiq3EKoTrIZwn5zP1Dylx7diRRzI9/U2ImXAND1J4pSD4YNfeOyVNIhJl/VZ3Ha
         b3SjeExXCoOy8Nj9DukY5m5JeK+a5uEwxIXdcBRhP+9gRPLUmWb/NIYq/ppPF5A7j7ii
         OIvWApbBzE7gFrqznnJke1uUvBcyNzlwex1RpaWHcvaTiiNP5fVpSRn5fg96Xu300684
         xe0p/g4E6wiA8NuiXFkLbcQxqfxXJCejYbIrUCzOOqvLVgjfUJ7aNRIJQdw8a39u5gdO
         aIvA3uqUB8OPkYaBgOyS5xVhn4zYJgjpUTbxRhIEIJp/bLi11AcyRKo+lUv/KxZEkUIK
         04Iw==
X-Gm-Message-State: ANoB5plWO7QVwIYqfGRznaoqRWoug4AJjDehHupaY2c33zt+p14p2sLC
        wlTtupFuWZhSMUZUZikg1vt+WS7xmKNFg7Jv16LrS4Y1rRI=
X-Google-Smtp-Source: AA0mqf6zkHL4fcyjLsR4NmvEFxKaT4NYNjHVKN1t+Ks7ev0AvMSCWQ+1/4/Ai4u8IQCsXSouVkeKu2LOn4IY78C5p1U=
X-Received: by 2002:a17:906:6acc:b0:7ae:658c:ee45 with SMTP id
 q12-20020a1709066acc00b007ae658cee45mr11019972ejs.190.1667911646022; Tue, 08
 Nov 2022 04:47:26 -0800 (PST)
MIME-Version: 1.0
References: <20221027065110.9395-1-quic_aiquny@quicinc.com>
In-Reply-To: <20221027065110.9395-1-quic_aiquny@quicinc.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 8 Nov 2022 13:47:15 +0100
Message-ID: <CACRpkdbCwvGr4JA+=khynduWSZSbSN8D9dtsY0h_9LxkqJuQ_Q@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: core: Make p->state in order in pinctrl_commit_state
To:     Maria Yu <quic_aiquny@quicinc.com>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>
Cc:     linux-gpio@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Maria,

thanks for your patch!

On Thu, Oct 27, 2022 at 8:51 AM Maria Yu <quic_aiquny@quicinc.com> wrote:

> We've got a dump that current cpu is in pinctrl_commit_state, the
> old_state != p->state while the stack is still in the process of
> pinmux_disable_setting. So it means even if the current p->state is
> changed in new state, the settings are not yet up-to-date enabled
> complete yet.
>
> Currently p->state in different value to synchronize the
> pinctrl_commit_state behaviors. The p->state will have transaction like
> old_state -> NULL -> new_state. When in old_state, it will try to
> disable all the all state settings. And when after new state settings
> enabled, p->state will changed to the new state after that. So use
> smp_mb to synchronize the p->state variable and the settings in order.
> ---
>  drivers/pinctrl/core.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
> index 9e57f4c62e60..cd917a5b1a0a 100644
> --- a/drivers/pinctrl/core.c
> +++ b/drivers/pinctrl/core.c
> @@ -1256,6 +1256,7 @@ static int pinctrl_commit_state(struct pinctrl *p, struct pinctrl_state *state)
>                 }
>         }
>
> +       smp_mb();
>         p->state = NULL;
>
>         /* Apply all the settings for the new state - pinmux first */
> @@ -1305,6 +1306,7 @@ static int pinctrl_commit_state(struct pinctrl *p, struct pinctrl_state *state)
>                         pinctrl_link_add(setting->pctldev, p->dev);
>         }
>
> +       smp_mb();
>         p->state = state;
>
>         return 0;

Ow!

It's not often that I loop in Paul McKenney on patches, but this is in the core
of the subsystem used across all architectures so if this is a generic problem
of concurrency, I really want some professional concurrency person to
look at it before I apply it.

Yours,
Linus Walleij
