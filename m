Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D1B0391628
	for <lists+linux-gpio@lfdr.de>; Wed, 26 May 2021 13:31:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232816AbhEZLcd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 May 2021 07:32:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232964AbhEZLcW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 May 2021 07:32:22 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE008C061342
        for <linux-gpio@vger.kernel.org>; Wed, 26 May 2021 04:29:00 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id w206so1523603ybg.7
        for <linux-gpio@vger.kernel.org>; Wed, 26 May 2021 04:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VZJmw4c/w1aJviXBkJs75wOQwEwbtioXuzg9Qv6tv5Y=;
        b=H0GiLBuoHLyqgHE/J91D74h4OQY++YzDVM96DR7+OsXwVLE5OPl7Hwtl29AZwm/Za7
         OADlmn1BNwhB8H38M2WUzEXkITgXSGkocLNKbnyEra2+ZT2+K6JOn2wIyzgc1Wnxn93w
         pkdIKPL7hlrK61sJMSv/AcpJgrd+iY/BUvGx9s3xCVDfK2I6x3WsvydAomSavlqHgn8z
         vL4x9RIVBPYU4b6WZsBmP5myKyJtjNwXLfnAaSsUxzkQJ2EOCDQPzbZ31GxVRG3Y2bHj
         dc80iBtM/D5RaDx5VWXcTkbJiJewOe9L1YRILEIRv5an3UAqKKG1FsePeVtBJyUkARjS
         V+eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VZJmw4c/w1aJviXBkJs75wOQwEwbtioXuzg9Qv6tv5Y=;
        b=o8iAhSx9IvNKrZ6qqsvXtV/EiP8293MMnrjL1y7UbQqytDnmdTjLej9I+/O/bMrbkg
         Id+eODxqzv53eV3BZdHOeWuUfkUlCV7zuSZv+49BJ0dNl53bG0vGVFihwv9J/82FJ913
         xIALi19OzNCt7kubTNMPhBdsvJaBEuudJxB30yN/rxKLWw8Wv2NwAuQtTWqcQ5XQOLtq
         0y4RqzrQ7jiMc3hVq3OJFsvklmGzzHBZqx9O7+oJoz8GttkDPO8gNE3v0cjzgYwS/7Qs
         DFEZZRQpOOeThx7Me1BBtJPPdwO4fRMiJHy9w0Wak7IBIUTPeyWy4PDaW0VZbgPhXMKf
         Chhg==
X-Gm-Message-State: AOAM5330F42cFpNr88fEzmz4NmJYlaJ4kC5wBv1zxAbzvFO3I5vWC7Lk
        2igQHaWb2nn+DWnmVtDu9ArAaR8Uu+dYTTtAS7CX1yKaEKI=
X-Google-Smtp-Source: ABdhPJy1XkJQgfNmWeEbTm94qa+mEuNw5X68zb1bTQxhHHrPdFqHAV8LspcoAQallQ8h0F2T9t906bvCqOGSreByjl0=
X-Received: by 2002:a25:1804:: with SMTP id 4mr15627151yby.157.1622028540172;
 Wed, 26 May 2021 04:29:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210525175858.11611-1-grygorii.strashko@ti.com> <20210525175858.11611-6-grygorii.strashko@ti.com>
In-Reply-To: <20210525175858.11611-6-grygorii.strashko@ti.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 26 May 2021 13:28:49 +0200
Message-ID: <CAMpxmJWWS2dqRW_MPiFQq6c1wqFrKcEUbThZFyHeG1ZpgdGjJw@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] dt-bindings: gpio: omap: Convert to json-schema
To:     Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        linux-devicetree <devicetree@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Aswath Govindraju <a-govindraju@ti.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 25, 2021 at 7:59 PM Grygorii Strashko
<grygorii.strashko@ti.com> wrote:
>
> Convert the OMAP GPIO Device Tree binding documentation to json-schema.
> The GPIO hogs node names defined to end with a 'hog' suffix.
>
> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---

Applied, thanks!

Bart
