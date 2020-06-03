Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2B8B1ED862
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jun 2020 00:06:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726512AbgFCWGM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Jun 2020 18:06:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726462AbgFCWGL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Jun 2020 18:06:11 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86A6FC08C5C2
        for <linux-gpio@vger.kernel.org>; Wed,  3 Jun 2020 15:06:09 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id e4so4776154ljn.4
        for <linux-gpio@vger.kernel.org>; Wed, 03 Jun 2020 15:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kZqWRAwkoZGm0MT0LhnL1ITCWUWQqRFExLfdOqT2sHM=;
        b=ifeeWNzF4wAPFHd21i1T7hZ+XQ6kUW4qhTa1hOviPEAn2zLRmxrTk+PNyY6YzjnT0W
         wrZnnAVGSZDC/eVD9dmypYQTNtVP7cklzWMfI8aP1cmBXiCBALQKH6+NOZTaZgRtegxa
         Jur7UHc1fR6FnuJNg+Df8haSfvODK8uVx5mIDjKH9QZkWiSKhsEe+5K0y4f9tn1dlvBQ
         hVpSSx3uugyxrCir29UzLvNT3zb41Z2ALoA/SSslvhH5zGTlUpAuVwqZs7JdaF9+dhnl
         GbGo+7g3eL+Uxl3b6SOexC57gwx1Suz5jvxY0KLHuYBHcBLeTNtFhdDkkjcpv0pRigsT
         RpVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kZqWRAwkoZGm0MT0LhnL1ITCWUWQqRFExLfdOqT2sHM=;
        b=bn+8/efd/ygitdrFV+AH5KbNKAERz4Hfw92ybQXKJTN6TRUUb49S5BxMgC7ZtcOck2
         5W5bsEfwhXbyARIRlq+kNUstJniwW0ks6Wq5uLOpL51+yWxGzS5iv8AWtndxHDQC0WRe
         LzcU+7sPIHUsBgAfWcZOVY5aQP2rxIyQ1YBdymWOIwUZMJQWeae1OS+e9amWlbMzAddG
         C5Uzxuz5m68gOldRuY7S+Y1KHt/gYUQNvtCVhL1aHOOlLW6bWxYgW4MGCV28wZ2KfP2t
         cjUSF1TtKQgK9GHJyJ22bW4VXvVei45L2YNYdDBbTuEYcgLbkQ1V5kXX6VnHyL3LoQ/u
         fQiA==
X-Gm-Message-State: AOAM533B3cP23mdRjo5hfMZbJ9Y28pcDVihtvVsozZS0IVnJQp9h4eFB
        ySdVaNTFcWRX5vw6zI+35CuCEGK5lyQnXqngnfnEog==
X-Google-Smtp-Source: ABdhPJxVc4P8kuV8rJARiopGCBcGT0QqtREKnWBawX5I9+sY0Q0Qd0KfCLEAs0rplFWBOdvE+GE+YbcX9BpW+DwedR8=
X-Received: by 2002:a2e:a40f:: with SMTP id p15mr665797ljn.286.1591221967893;
 Wed, 03 Jun 2020 15:06:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200531073716.593343-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200531073716.593343-1-christophe.jaillet@wanadoo.fr>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 4 Jun 2020 00:05:56 +0200
Message-ID: <CACRpkdax2rFLnqY2pBEjfV6GH+wCHOrc4bQ7iYZEzWo=Fmi0NA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: pxa: pxa2xx: Remove 'pxa2xx_pinctrl_exit()'
 which is unused and broken
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, May 31, 2020 at 9:37 AM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:

> Commit 6d33ee7a0534 ("pinctrl: pxa: Use devm_pinctrl_register() for pinctrl registration")
> has turned a 'pinctrl_register()' into 'devm_pinctrl_register()' in
> 'pxa2xx_pinctrl_init()'.
> However, the corresponding 'pinctrl_unregister()' call in
> 'pxa2xx_pinctrl_exit()' has not been removed.
>
> This is not an issue, because 'pxa2xx_pinctrl_exit()' is unused.
> Remove it now to avoid some wondering in the future and save a few LoC.
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Patch applied.

Yours,
Linus Walleij
