Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54AE01BDBE1
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2020 14:19:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726776AbgD2MTv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Apr 2020 08:19:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726524AbgD2MTu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 29 Apr 2020 08:19:50 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A0A4C03C1AD
        for <linux-gpio@vger.kernel.org>; Wed, 29 Apr 2020 05:19:48 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id u10so1454790lfo.8
        for <linux-gpio@vger.kernel.org>; Wed, 29 Apr 2020 05:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=C1Ts4DfOpbqwNmKAyV/9/Lll4n9YArjQ/mn7brU53Ks=;
        b=HeQpH7rxp/Oyh4cRIDkKuEC/nrOQkmhe2swtarQuUReEO9o8Fgc5g5gq10VX8AQ9Ca
         9FUz0xLE0yzVF97yDlEt5U8ogfTQLqmFS5CBYqICi2zKUeyYtLnU/dG73H3PEFPr4uzg
         O7fEBhpMIUKX1MZfGlQ3RPfC8YI+3CQ4CWCQ2+9tqLp6xSNSavLwClNKF9av4efRAURB
         KeARE2/mJ0kKPp8hy5nuL4+z4J2kd9NG229n7jc0ndiQF1qA1xFeAMNAHoETBgACTXeB
         QqIgG/CQ1UTq3Q8vG88ewPteWzXsxqDvel6D9PYwVvaXXYsiFAA8QiKShxdQzqvsKXpw
         IdMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=C1Ts4DfOpbqwNmKAyV/9/Lll4n9YArjQ/mn7brU53Ks=;
        b=QshG3OoHaaOZliTsF61rv7o2c27s3tT3tTLM09uSvgh6iGuzxsyMakjhThsW/5gDDj
         +DKzCL2k/OQQZM9eqKpihkD/R3vSJnWUG03kAZjEQ3dDJyIc/VyD3HqDhemYoPtnp8WK
         brxAU6AsdNp91C22mSW/Qmm9lQxACMh4erk+Sl6TM1KzjFbCMD4ogVajNh78VjhrOldo
         PHMdxeckKWi+m/r4MyLXeDX8OOgtwoMr42g+dE71W7maIdBx/EqJvhefmwFb6pp03jXX
         NAqq339eu0yqP5BjRYhsY9ocD/qYlKEXMZma9vmw6zXPy/n2haoXuM3nkAB1mYw55JEI
         hCJw==
X-Gm-Message-State: AGi0PuYl69EDkE8iwkEhWXLlln0OQfe6aNHwbGFxtazdbKykUCGh0dT8
        qRO1fpqeRU9iitNME0VHP72JWGVrjvP/PUK/RJ5FSniw
X-Google-Smtp-Source: APiQypJ2jgIIIfWcY9D1adj1uOLPdacJazusj6aGHmHvzzde6RhBsWaPWv8/f2ZwRjyszUh2zAlZgyz1YZbk16iyJ9M=
X-Received: by 2002:ac2:4a9d:: with SMTP id l29mr21464343lfp.4.1588162786702;
 Wed, 29 Apr 2020 05:19:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200428172322.1.I396f351e364f3c09df7c7606e79abefb8682c092@changeid>
 <20200428172322.2.Iacb3c8152c3cf9015a91308678155a578b0cc050@changeid>
In-Reply-To: <20200428172322.2.Iacb3c8152c3cf9015a91308678155a578b0cc050@changeid>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 29 Apr 2020 14:19:35 +0200
Message-ID: <CACRpkdaT_G=Wa7iYhfBVGrcViy7EbDH1+Qme+UQTGTWybu7Fzg@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: Make "offset" and "unsigned int", not just "unsigned"
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Apr 29, 2020 at 2:24 AM Douglas Anderson <dianders@chromium.org> wrote:

> When I copied the function prototypes from the GPIO header file into
> my own driver, checkpatch yelled at me saying that I shouldn't use use
> "unsigned" but instead should say "unsigned int".  Let's make the
> header file use "unsigned int" so others who copy like I did won't get
> yelled at.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Patch applied. Nice cleanup!

Yours,
Linus Walleij
