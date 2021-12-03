Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB94A46798E
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Dec 2021 15:39:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243440AbhLCOnH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 3 Dec 2021 09:43:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232079AbhLCOnH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 3 Dec 2021 09:43:07 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CA7BC061751
        for <linux-gpio@vger.kernel.org>; Fri,  3 Dec 2021 06:39:43 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id g14so12294503edb.8
        for <linux-gpio@vger.kernel.org>; Fri, 03 Dec 2021 06:39:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bm3OfVnqEM2rPeI03LWJLo7oTjjfBZxbar2wT0kZNrI=;
        b=efZcrRCb4B2mg4duThjXDrKJJRwMylsRb06cNnOma65sMSP4ZL2BOEQQc0ZpeFMNKo
         XFbNX4rU9PzDjTokkpn17vJjjC4OScNFEsyf09pQSJZdltk8MEhtWf938Ljienec7S8d
         ylfqVAZMLY041UWtsgSm9J89L/G1Gf5hMS3FCQE41ZkniOV9KEzL8iBSOEMB+II6r99D
         ypqIUYov0ZsNGk2Ltzck2FDdnUhwDhVu+UnunMPmw1apkzes0yRuDdaX/kpNe6wJJXdC
         nAaU4cb1wyq/GKms9CYaOAmYSpT8sSMO6m7hmO5Gw4c0vyHNKnhIrwo8lfd92m/d3OC4
         TTDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bm3OfVnqEM2rPeI03LWJLo7oTjjfBZxbar2wT0kZNrI=;
        b=VN2vWHiafnsFEIeENE6zqyOBy8HLmUBXnkwiSGX41FS1LeCaIIVSt3DOGTKdgPQ9ID
         pmekJQ9THXS3CWnwdGBpSeezVhY0pJTgg+Xjyu6vhvrToVu3rqKi3NJiEJWPesCSqUGh
         LZdOg/CU42+H0wd9Wvy1kqcXgaDFt3suzVnt0Db9XRjFl28auYgfByEIH9fPCFzwHHCy
         wCHNGtGsbz9pY8sjqgD6ToI1YU9ExvIwREObTieRe+Ohe96vmPeMVuQm/jjMXIUOjHGf
         6QhFMO6xXpa5cAeYV8mrhIlTWEmU5rGosJrJVc2ryp2ey+grmS2HpKlmjId4qGqM29iC
         /GTA==
X-Gm-Message-State: AOAM53229GOniLR6eR1cYkrFQLAh3HHmBZvHYTYnx2r4cBJEkp1EDLPL
        RTcO2z/79ztwN8ZsvTUWMZdGRSPTq5MT7sPKEFnKLA==
X-Google-Smtp-Source: ABdhPJx9H05FQHpdFHLFaWYOytGgjkyIb1PJmuxJmpUPajr/NU4g5SVB3u2hBUxw/0UZoxx9+yWULjmIH/wzzTtj8aI=
X-Received: by 2002:a05:6402:2805:: with SMTP id h5mr21156766ede.267.1638542381580;
 Fri, 03 Dec 2021 06:39:41 -0800 (PST)
MIME-Version: 1.0
References: <cover.1637917008.git.viresh.kumar@linaro.org> <0471e032dc7e7148956cd7a00519ab26e265df46.1637917008.git.viresh.kumar@linaro.org>
In-Reply-To: <0471e032dc7e7148956cd7a00519ab26e265df46.1637917008.git.viresh.kumar@linaro.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 3 Dec 2021 15:39:30 +0100
Message-ID: <CAMRc=MeWKyZKb0yR40HoFXMfD8XwXMfNp2YovRy1-ksDc6DfOw@mail.gmail.com>
Subject: Re: [PATCH 2/2] libgpiod: Remove dummy declaration gpiod_line_config_get_event_clock()
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Kent Gibson <warthog618@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 26, 2021 at 10:07 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> gpiod_line_config_get_event_clock() isn't implemented, and just has the
> declaration available. Drop it.
>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  include/gpiod.h | 12 ------------
>  1 file changed, 12 deletions(-)
>
> diff --git a/include/gpiod.h b/include/gpiod.h
> index 44deafc83c11..0bc0ceee4b76 100644
> --- a/include/gpiod.h
> +++ b/include/gpiod.h
> @@ -777,18 +777,6 @@ void gpiod_line_config_set_event_clock_subset(struct gpiod_line_config *config,
>                                               unsigned int num_offsets,
>                                               const unsigned int *offsets);
>
> -/**
> - * @brief Get the event clock setting for a given line.
> - * @param config Line config object.
> - * @param offset Line offset for which to read the event clock setting.
> - * @return Event clock setting that would have been used for given offset if
> - *         the config object was used in a request at the time of the call.
> - * @note If an offset is used for which no config was provided, the function
> - *       will return the global default value.
> - */
> -int gpiod_line_config_get_event_clock(struct gpiod_line_config *config,
> -                                     unsigned int offset);
> -
>  /**
>   * @brief Set the output value for a single offset.
>   * @param config Line config object.
> --
> 2.31.1.272.g89b43f80a514
>

But we want this function - it should get implemented, not dropped. :)

It's actually added in the devel branch for line_config accessors.

Bart
