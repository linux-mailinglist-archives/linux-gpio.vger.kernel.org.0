Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F8704BFC7C
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Feb 2022 16:27:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233234AbiBVP1i (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Feb 2022 10:27:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233166AbiBVP1h (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Feb 2022 10:27:37 -0500
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FDDDB188D
        for <linux-gpio@vger.kernel.org>; Tue, 22 Feb 2022 07:27:12 -0800 (PST)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-2d79394434dso35205657b3.5
        for <linux-gpio@vger.kernel.org>; Tue, 22 Feb 2022 07:27:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=M7KlgWXQWd7u5zN88d3FEdeXMnGHfvqOgkB7ieC4Fio=;
        b=ODsv/u+joGwh3jx8IOckn0vwvZepq+jBmcim13lrUYtePTwA6x7/oMoor47S8SmnIm
         soDah+BFvrKCVxYBPfPh7D8F5KwXBsqDDl6xktGNvufLfPRdXjuQT49tV7Oo9lHYABJa
         cnkVShNbvh0KQbt6USgaEGgu/TurtHFWXfG/bIztuAV+2H3pm4qZQXxSCV3GXAAGowHx
         CbTKs8jTLl1wk93E5auZJ4AngCldI/RDNOIbmYYeDrB/nR0EkAA6QvpWXPihEpgdet+n
         /gykqh8nq3n18jua8Fajk9obpWfAYz588QOFcfJnJQ+Ebr8yVnQvawKITPv8EgPu3ZiX
         xfiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=M7KlgWXQWd7u5zN88d3FEdeXMnGHfvqOgkB7ieC4Fio=;
        b=ENYmAZsDzOqQKgThWP4TXun3mZRG+Gidr/dZThtbqor4OBaEnFZFIQkElrtLvmN4lm
         90Yqafopi30MTqTQZdSPX69QbAF4RSdaG8k0Lxc2LMwycR+RfixXbmfa7a8HzsdLH/e7
         Dw6LJfKIMBOVGzb4x85I2gQxaRfhES4UZe2xtncjEc6yMU9ixNkrI3P+rtBwjgsNTv+T
         7GZEjmeGw5C42p6MZ6l6fkoNvvr8GIC/qVuNtQTP6ReDMcLNr+Y1xnVrXaYFzYHFm1Ra
         Q5GhQwgyhXd2NiAzFUXT4Y2gIJ7z0fQLrUecaz3bQQxPAedVf0T81q/B5FLM+PqmwZlE
         tCfQ==
X-Gm-Message-State: AOAM532ngLsKaVJaFMo4a/lmBSCu430+cAYTGbDMH8COt2TX3CZl3yZH
        roxAEiHclnpbJ4GNE6c16MZQtBrxZGuRGuVlswLY25n2as5I9Q==
X-Google-Smtp-Source: ABdhPJwqA+Cl7j5nqAlqEIEvaB1HBNI1ya0ezn+DA+pENZSD+GYlap0ZLzT5d5J/d01sATjyPlRkBUb4b0EvK3uSHM0=
X-Received: by 2002:a0d:c585:0:b0:2d7:85cd:d9e5 with SMTP id
 h127-20020a0dc585000000b002d785cdd9e5mr5660697ywd.118.1645543631346; Tue, 22
 Feb 2022 07:27:11 -0800 (PST)
MIME-Version: 1.0
References: <6d8a6a05564f38f9d20464c1c17f96e52740cf6a.1645460429.git.geert+renesas@glider.be>
In-Reply-To: <6d8a6a05564f38f9d20464c1c17f96e52740cf6a.1645460429.git.geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 22 Feb 2022 16:27:00 +0100
Message-ID: <CACRpkdaJAEivz_RVGCyDvwJtDnb7E+mpxt8a66TicZW=oNttNw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sh-pfc: checker: Fix miscalculation of number of states
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Feb 21, 2022 at 5:22 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The checker failed to validate all enum IDs in the description of a
> register with fixed-width register fields, due to a miscalculation of
> the number of described states: each register field of n bits can have
> "1 << n" possible states, not "1".
>
> Increase SH_PFC_MAX_ENUMS accordingly, now more enum IDs are checked
> (SH-Mobile AG5 has more than 4000 enum IDs defined).
>
> Fixes: 12d057bad683b1c6 ("pinctrl: sh-pfc: checker: Add check for enum ID conflicts")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> To be queued in renesas-pinctrl-for-v5.18.

I certainly trust you to generally do what is best for the Renesas drivers.

I have a question about this checker infrastructure because it is obviously
a piece of really valuable code for Renesas.

How general is this checker? Do we have other drivers in the kernel that
would benefit from it or is it completely Renesas-specific?

If it has general value I think it should be moved to be one floor down,
with the pinctrl framework, if possible. But I don't know the details.

Yours,
Linus Walleij
