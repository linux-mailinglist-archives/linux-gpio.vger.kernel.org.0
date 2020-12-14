Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FFD52D94D8
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Dec 2020 10:18:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439706AbgLNJSI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Dec 2020 04:18:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2439687AbgLNJSF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Dec 2020 04:18:05 -0500
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A409C0613D3
        for <linux-gpio@vger.kernel.org>; Mon, 14 Dec 2020 01:17:25 -0800 (PST)
Received: by mail-lf1-x141.google.com with SMTP id r24so28315104lfm.8
        for <linux-gpio@vger.kernel.org>; Mon, 14 Dec 2020 01:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=65hNEP/Zbo/41eInJTb1Gnu1ewevqq7m2f/maoMTQwI=;
        b=Fq10SaFA/GxYpnZsD4Kf1rGdUVRe8oUsqVizqfxleuCRlIDD0wmj/tlvT84+16/27D
         1shmKZ1BgDnzQmb2npZ1N/U41jVAF7SoWmrD04d6qYIkPQ5CiK34vL3bP0t0G2Lq1iQA
         x2askaweOGj2mu01Z/vag9Q7zKZRz4yUlSVllbLiNAD1GE8UitSam1S5abRLUM8/OrvT
         PtVq9YYiV6TreiGa9z8uAJ5lCNk6a8J3HeBsS5Bsk4EYbHAtQKQofj/TBhXzGu7mgskp
         L4eCUDxOBcLMVG5shJxr/YBNQRQk/dot2uPtPRF84afNpU1hY4sYYX6wmNF2u7yA4FVw
         JQ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=65hNEP/Zbo/41eInJTb1Gnu1ewevqq7m2f/maoMTQwI=;
        b=KzjgywX2HjIFiOfbbyhfRGZwXKi3XVSsVR2OvmQdNYoolbpkorqGX5DV3HpZgG0oQc
         +47cNCtt+fTTJRJcNgGCTJEh+Q27k32OZs5F+POSE6h6Z500MDeIQ17V4XTHex27HWGM
         b602UEB8NwzmKL7M61mpeTtkBTnVAqRyJXqjY45np5JI3c2zYkQ7gxmJrBSSe4wLCnuW
         0SigVqDXxxbwiAyHQKRo8Yl9wz1gEvIz94pyYpV4DPPuKtyaGGbG1PCTj2tGh3mDEsz5
         e4ExOzRtVoEvGd5y6QC19e2HEB4uRIyXld775RTEGXpPC+ZdTWVH2jcWK48baKRB8ZP6
         zd1g==
X-Gm-Message-State: AOAM531wGRj36EPl0S2dO7ktmDLhBty/vNVXzlcprvZTA25fY9a8J7JR
        aKjzGwBlfEVP/jsMpqV/dneMIIFKsor5WQgQpQtyRNxbDiCIlg==
X-Google-Smtp-Source: ABdhPJw1EZXpEQFNlkLympMxrslKeW6dQZNM9e92qymVnytbQ0W65D835UzCJd87S/7r5LF+j8qj+AOoZe445JzBCJc=
X-Received: by 2002:a05:651c:1312:: with SMTP id u18mr9206514lja.200.1607937443582;
 Mon, 14 Dec 2020 01:17:23 -0800 (PST)
MIME-Version: 1.0
References: <20201212003447.238474-1-linus.walleij@linaro.org>
In-Reply-To: <20201212003447.238474-1-linus.walleij@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 14 Dec 2020 10:17:12 +0100
Message-ID: <CACRpkdZkd7hqfCqXNXSaixKD_tSb=3X-JkttMA33skXhsgosyg@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: Disallow identical line names in the same chip
To:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Dec 12, 2020 at 1:36 AM Linus Walleij <linus.walleij@linaro.org> wrote:

> We need to make this namespace hierarchical: at least do not
> allow two lines on the same chip to have the same name, this
> is just too much flexibility. If we name a line on a chip,
> name it uniquely on that chip.
>
> I don't know what happens if we just apply this, I *hope* there
> are not a lot of systems out there breaking this simple and
> intuitive rule.
>
> As a side effect, this makes the device tree naming code
> scream a bit if names are not globally unique.
>
> I think there are not super-many device trees out there naming
> their lines so let's fix this before the problem becomes
> widespread.
>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Johan Hovold <johan@kernel.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

I applied this patch for v5.11 with replacing -EINVAL with -EEXIST
as suggested by Andy.

Yours,
Linus Walleij
