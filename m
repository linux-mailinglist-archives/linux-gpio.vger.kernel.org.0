Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77C1C226188
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Jul 2020 16:03:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726491AbgGTODj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Jul 2020 10:03:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725815AbgGTODj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Jul 2020 10:03:39 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AA13C061794
        for <linux-gpio@vger.kernel.org>; Mon, 20 Jul 2020 07:03:39 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id u25so9782743lfm.1
        for <linux-gpio@vger.kernel.org>; Mon, 20 Jul 2020 07:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4AGV/Qaxh/I6F4LFiDi5lh+HB1lovQ7a2JPMBACmb9E=;
        b=TQLE7kXLPkX+nlWBAq+iSeC8FzdztZgHBjoGZMNYNP7zq7H3OnGOYhIfDyjGaYpZsu
         nRJPti3v7lcTqUFQMyuae6dHQ3ozhmh+550Lgkp8ImBYIkcbRh1dTfiJJo7uflHs7oZ5
         3i4mxheFG8YU0JvNM2vHUYOKy1BDZpu+NbVmlzOEPrVHufKyLVHIR7OXrh84R5CXzez1
         ly5RHC85gHiGtIdCLXuooswbu6/7zSjD/fWSuqrZNq62mJhKl4vcTWqUZ10e9q03grCI
         +6JonYINKTfVfx8mVvsy/Q99hXRZ3QWt1ZSvcPetCbR6/du9XM5H9WpfFSk827NCKzzH
         qyvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4AGV/Qaxh/I6F4LFiDi5lh+HB1lovQ7a2JPMBACmb9E=;
        b=H7ogY9a7r1oZ5FTNa2V4uMqgvTeBJCkjg2OPXVxebN16kop32rT+D5hD7H6KPvsf7C
         2kLVXcQ3B3UiRTPIGa4eaSiebj5yJ6a7ZdQN3CwdSppwLCzyQClTSX9iMg2+vTKyIpXf
         HWY3EaWd/PrH1KmLCT2z7aEma/Onkd2gZA6JoMDB31pd968iJnpaqC8uaZaC+LGh4ksB
         wwUqS1GBpgHoJJaH8RT44JQJjPwUymZ24rqoIzlnqLiOtY814uty94WTucGA9lTj5Qqb
         SiusfsMl5bflTTABQ5ltlSA5M1SD1dhg3G/YgRsbD2nBwY+piFK6Z7H2DT8pjNgDAXjh
         HoRQ==
X-Gm-Message-State: AOAM5314mql0pCLT/YTe0mnJiqKxYG6lkPE99ZQMU9+Cml5qc+3OSt5G
        Dgc2Z3fS2idAB6Q2DBG/xLcLwzJT617deR7w8sjA2A==
X-Google-Smtp-Source: ABdhPJzkZlA3KWl9yIJEt4QJBvyKwNFV+Mmho1BqTwNxp9C4SgN8Bn3fLZ/UFDc98h5kPnzx4NTMY60oDDniAmvE35c=
X-Received: by 2002:a05:6512:3150:: with SMTP id s16mr10972368lfi.47.1595253817568;
 Mon, 20 Jul 2020 07:03:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200717181220.1773543-1-drew@beagleboard.org>
In-Reply-To: <20200717181220.1773543-1-drew@beagleboard.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 20 Jul 2020 16:03:24 +0200
Message-ID: <CACRpkda=yQio47Wy=EkDX6X4e1nECkU9=XdAHM+wqRPWJL-cEA@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: omap: handle pin config bias flags
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Tony Lindgren <tony@atomide.com>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 17, 2020 at 8:12 PM Drew Fustini <drew@beagleboard.org> wrote:

> V2 changes:
> - adjust the braces to match the correct coding style

Thanks

> - Linus: should I be creating a patch that is just the delta for the
>   braces?

No, I noticed I mistakenly applied it to the pinctrl tree instead
of GPIO so I had to revert it there anyway. I applied this
version to the GPIO tree instead.

Yours,
Linus Walleij
