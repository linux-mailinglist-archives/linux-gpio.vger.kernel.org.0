Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A8743E5A7E
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Aug 2021 14:56:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230006AbhHJM4d (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Aug 2021 08:56:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237431AbhHJM4d (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Aug 2021 08:56:33 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 299F6C0613D3
        for <linux-gpio@vger.kernel.org>; Tue, 10 Aug 2021 05:56:11 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id n7so3961084ljq.0
        for <linux-gpio@vger.kernel.org>; Tue, 10 Aug 2021 05:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Eg3c72WxfY/AkMY5/Ux5BoPto2wsC9nVFGQQrOCK6K4=;
        b=W2L6I00RxalHhv1J+KdbMdGE9rIp7UQg8NRBrfkh2uT7jJqhAZ5WTVaO+AbOd/px8Z
         kUnNn0fwDDHr7E/f8q1JTrp+FPksDUKra2uky7kWp3n/HbnYdLH1/bKU9j3tRAQpc3FH
         wLvWmV1Q6xDmeya1Zmdqa8b/NRL0rd2lzwAjf6s6Clcai4NsmnnrFVS60mxN/ckkWChH
         /J1swI38Llq16cEBV9JsVx5TtzfSbtWdE8GpFek1EAgmFK5OzfV4TV6Cawvvn0EjtNGB
         eU5Qj+a+/ipJDswS9yNqou3+vX0FdyV/51uXIqYpFZZmdwLmwecKSoLae7Od++q6pCdX
         6f+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Eg3c72WxfY/AkMY5/Ux5BoPto2wsC9nVFGQQrOCK6K4=;
        b=YCVer0zlzFvbJ9a3SADoldG9Mwa+i9VWO6agSSA9UZvN3zQGajaazRb27N59TtNh22
         6XiVtf689/iUrpF31N/V6mZfDi7kCPY5jB8HBGly4VEWEy+2c1aCdlsp6Frx+xu3Tk6S
         /DLx9KL2P7dUCS6D9Qbw7ZoXH0to/IGsTCMZ3HzJQIZjdMyEzl2yZ9pBU+B1pRtqzM+h
         s0OEaEWL2wLgc15hc0uT0hHoqS82bgJ4+uZ99zF1tb4CX2J0BQ/I8a0740ZBqiRawPEJ
         2s9emu2jt1FECmlJUgXPVLoc5c79a8RDONQMDbaTqaM9g4COTejOMTyQfy6oEeyz62R+
         U90w==
X-Gm-Message-State: AOAM532vmIUCKR/CVpP8n577qnqQP7xAoLDk8dtwe3eGmvckRuYySmNe
        7g2ve5DTTKZiiZ1VUc/dRrx+oo0/4HXjVoslLvLsfg==
X-Google-Smtp-Source: ABdhPJyirmUH7PBSPfBVVVbbuOdns3uDP6PM97CUkBd41cgMWWS6PeftvgpmfmQdr32ujlwVreU7BZeBFBIexyDvooI=
X-Received: by 2002:a2e:a231:: with SMTP id i17mr9057345ljm.467.1628600169499;
 Tue, 10 Aug 2021 05:56:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210722132548.22121-1-andre.przywara@arm.com>
In-Reply-To: <20210722132548.22121-1-andre.przywara@arm.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 10 Aug 2021 14:55:58 +0200
Message-ID: <CACRpkdYKk4An56a0rmoXgmcpAmGTLeyhM6qfTK+y1yopHB4NXA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sunxi: Don't underestimate number of functions
To:     Andre Przywara <andre.przywara@arm.com>
Cc:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Icenowy Zheng <icenowy@aosc.io>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 22, 2021 at 3:26 PM Andre Przywara <andre.przywara@arm.com> wrote:

> When we are building all the various pinctrl structures for the
> Allwinner pinctrl devices, we do some estimation about the maximum
> number of distinct function (names) that we will need.
>
> So far we take the number of pins as an upper bound, even though we
> can actually have up to four special functions per pin. This wasn't a
> problem until now, since we indeed have typically far more pins than
> functions, and most pins share common functions.
>
> However the H616 "-r" pin controller has only two pins, but four
> functions, so we run over the end of the array when we are looking for
> a matching function name in sunxi_pinctrl_add_function - there is no
> NULL sentinel left that would terminate the loop:
>
> [    8.200648] Unable to handle kernel paging request at virtual address fffdff7efbefaff5
> [    8.209179] Mem abort info:
> ....
> [    8.368456] Call trace:
> [    8.370925]  __pi_strcmp+0x90/0xf0
> [    8.374559]  sun50i_h616_r_pinctrl_probe+0x1c/0x28
> [    8.379557]  platform_probe+0x68/0xd8
>
> Do an actual worst case allocation (4 functions per pin, three common
> functions and the sentinel) for the initial array allocation. This is
> now heavily overestimating the number of functions in the common case,
> but we will reallocate this array later with the actual number of
> functions, so it's only temporarily.
>
> Fixes: 561c1cf17c46 ("pinctrl: sunxi: Add support for the Allwinner H616-R pin controller")
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Patch applied for fixes!
Thanks for finding this.

Yours,
Linus Walleij
