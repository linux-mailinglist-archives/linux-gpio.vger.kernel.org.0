Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFAE5410C0C
	for <lists+linux-gpio@lfdr.de>; Sun, 19 Sep 2021 16:47:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232772AbhISOtA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 19 Sep 2021 10:49:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232664AbhISOs7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 19 Sep 2021 10:48:59 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 389C9C061574
        for <linux-gpio@vger.kernel.org>; Sun, 19 Sep 2021 07:47:34 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id m3so53467360lfu.2
        for <linux-gpio@vger.kernel.org>; Sun, 19 Sep 2021 07:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=lmDmi4ftibwcwvQEbdJqNW7006uN+Sn0ovT9xUpowbg=;
        b=n7L0J9pPStqtmw9pJSM4IYMMGi2K9h8R0s8soWPd7QUE6OYVsQlwZZkeR6yHOQO8OC
         8TSo0XugMgqobFzoL0iQo19lJm7TBB+dZZym756y/Nb0pX0/ftTfpPnVaDudGWQWhWof
         D8WrVCCXydGQXup/Z/u3tB3sMrAaKAJv6kqh2ka5aFrJ0xBsvfgD3APBhlRPirqbVVAo
         XZEJNarW8ldkljJ4349eSFvKfU28GIjx/PghKlXYOu+ID5HycZahCTd0kHog3QQAHu1C
         u6FjRpVxKY8yacZ0CdaaghgJrM3c420Ct/h9QEEK0gjaEpTayKiTRg1Ce6An73C4vS4j
         Uz+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=lmDmi4ftibwcwvQEbdJqNW7006uN+Sn0ovT9xUpowbg=;
        b=ih7cd8LdrvuPyRvwy32tcI0xf35z1/wF7LWd0s9YX8mwaiqJej0n1LJCFHGJ0ICtkH
         PaMa7WixjcCa+XoUPkuyj9U4Tc7n21R7GtZaBYCbfTx82gz447uAN6R+kJanaLq23LIa
         MuXV4UrHxvzWHI/Z3kEHBzinvHtLPUobXTdFACx/PKtTS42pIz4i3lxs82PR96NIuyQo
         vqsslDCIGZ0PNOE8ppgUkFmSlA2wDmMd3aH2PNISaSSr4cIy1YmYR2hlV1N6jSCnr0qu
         m6YUnWb1KyQgcSKBmAOv1xhSz9j+mFAX0hKzOaD4Wg1c3+uSEtwrdqqIDXt1+8oCOWfB
         Kmog==
X-Gm-Message-State: AOAM532QDwZjV6EIQfFFKfssw167EuQT/W8UZYBFpWqm6YbQyMKVMjKa
        67oA5DdDvi4il0eImETvkf69x5rj2rUcF5A30aybEw==
X-Google-Smtp-Source: ABdhPJwXnTjXl0i8JlJQlNjJu8tA3ja58MlRNxYCL22486ltOyGOxvhIR5XFzp5T4vRuXB22kODXEPpoqdt/anIjpJ0=
X-Received: by 2002:a05:6512:3c92:: with SMTP id h18mr15315667lfv.656.1632062852495;
 Sun, 19 Sep 2021 07:47:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210913224926.1260726-1-heiko@sntech.de> <20210913224926.1260726-5-heiko@sntech.de>
 <CACRpkda2Hc6E27LK=vH_qKkTayG3qP=BGdqBKyLR2dMhekyWTw@mail.gmail.com> <1992229.jx4eJSTThl@diego>
In-Reply-To: <1992229.jx4eJSTThl@diego>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 19 Sep 2021 16:47:21 +0200
Message-ID: <CACRpkdYmfYmQpc6+bnpqaiQGrgH7gcBK-fgZ7VjTHGwPHULyCQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] gpio/rockchip: fetch deferred output settings on probe
To:     =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jianqun Xu <jay.xu@rock-chips.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Sep 18, 2021 at 2:00 AM Heiko St=C3=BCbner <heiko@sntech.de> wrote:

> The issue is that the pinconf part for PIN_CONFIG_OUTPUT is actually
> using the gpio controller to realize this setting. So when this ends up
> in a pinctrl-hog, stuff explodes while probing the first pinctrl part.

The Nomadik driver has something similar, I came up with a solution
ages ago which isn't elegant either, so it's not like I'm any better :/

commit ab4a936247561cd998913bab5f15e3d3eaed1f9e
"pinctrl: nomadik: assure GPIO chips are populated"

> Thinking about this, the component framework may be one option?
> And then adding a pinctr-register / init+enable variant where the
> pinctrl hogs can be aquired separately, not as part of pinctrl_enable?

Check out my commit, but the component framework is what we
should ideally use (IMO) when drivers depend on each other
so I think you are right.

Yours,
Linus Walleij
