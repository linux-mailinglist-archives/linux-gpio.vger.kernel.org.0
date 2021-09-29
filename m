Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2219941BD99
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Sep 2021 05:42:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243892AbhI2DoW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Sep 2021 23:44:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242323AbhI2DoV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Sep 2021 23:44:21 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59DAEC061745
        for <linux-gpio@vger.kernel.org>; Tue, 28 Sep 2021 20:42:41 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id m3so5004680lfu.2
        for <linux-gpio@vger.kernel.org>; Tue, 28 Sep 2021 20:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IuNTL9gPvpWYsW3AwxYryKONOf4+S+yGJL4QxUsihbA=;
        b=h7mvpzImaXE2WV7qwWKc2k5Jqj0LIXIZYtDyLIOOa7f0MYkXYYneJn5QWbqPgwBQxQ
         bSiclPOqlt57iy3gVD8Q6aXV0R3mZs0DU421XL+PEBe9/UyURCMtA4Ux2VfU9AjuLnuL
         dvu5KRMi2MZPbyVWgjqy7XGMiLfXKLHVOQCphKRcU7Ipe18W7J9z3+vFpTPPBhKWFTmA
         aDB1WUxmKCqha1Paw/WytXLKfSPjuU772NfZv7P3hzhteJ6iJdoVt8abA9dBiQbFEnLL
         LgFksSFjwAXKFOE0aYOBuX79a/qG7kTJsQvDZpmvm0CqetzfQXBXBg0vZ8lVKqL+xK+V
         9V+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IuNTL9gPvpWYsW3AwxYryKONOf4+S+yGJL4QxUsihbA=;
        b=DUoOrCxeCg95dkO4F3V3Oa1P1wTxxFk1dqvAg/Ydzp3/ct6AWuBRuh/NRgiOTSdLik
         0YKfCKQdj/EiPeCuvFwEWWykH89smdBwNU3vFWr/IdWtfkO70TMAezYbTekKReZxXqYx
         g5+w/zuIrwFcKHtMSA9f5XACP1zmz8HX8khs/f/O6rseb6vQLpoROqsgwR3cuYhKV8hV
         J4/AhVbUf8rUtC55Wp9z4Cdzva541uQ+Z4Y9Js3nSEsCaBWGuXfUfy6yyfvJ6VNhczYB
         Lq+X3JoDmh5zUFO/ufOz+c6TkIQcxIN/zZyg6agtRgAjWZktOM9F1lMpLkeef6c7AfXw
         nFuw==
X-Gm-Message-State: AOAM530/+J4k9QVEauCD1JiwUpCENXdS4zxE6TndQzW4qKbYKB4S9Chi
        C0cc4FGK9T+CpIcthxnmhUdTjMvchfnQa5SKUNHwWQ==
X-Google-Smtp-Source: ABdhPJwflCbRIz99ZM3n81OZD0bcobRt+9ytyfnyFvFexD+UThys3zwr5ilEDOM1PEC9Bhei1U3vyqJMMda+w4ALBr4=
X-Received: by 2002:a2e:83c5:: with SMTP id s5mr3615270ljh.515.1632886958477;
 Tue, 28 Sep 2021 20:42:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210928235635.1348330-1-willmcvicker@google.com> <20210928235635.1348330-3-willmcvicker@google.com>
In-Reply-To: <20210928235635.1348330-3-willmcvicker@google.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Tue, 28 Sep 2021 20:42:27 -0700
Message-ID: <CALAqxLUju1Bw0dDpi_oK6-eOiP6B2Xm1MV19G53WaRFm3Z_AWw@mail.gmail.com>
Subject: Re: [PATCH v2 02/12] timekeeping: add API for getting timekeeping_suspended
To:     Will McVicker <willmcvicker@google.com>
Cc:     Russell King <linux@armlinux.org.uk>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Lee Jones <lee.jones@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Saravana Kannan <saravanak@google.com>,
        Android Kernel Team <kernel-team@android.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 28, 2021 at 4:56 PM Will McVicker <willmcvicker@google.com> wrote:
>
> This allows modules to access the value of timekeeping_suspended without
> giving them write access to the variable.
>

It's important to cover "the why" not "the what" in these commit
messages, so you might add a note as to what code will be the user of
this (the samsung/clk-pll.c code changed later in this series).

thanks
-john
