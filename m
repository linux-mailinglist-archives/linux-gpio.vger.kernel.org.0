Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82095414CF2
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Sep 2021 17:25:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236393AbhIVP0d (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Sep 2021 11:26:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232318AbhIVP0d (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Sep 2021 11:26:33 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21A99C061574
        for <linux-gpio@vger.kernel.org>; Wed, 22 Sep 2021 08:25:03 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id m3so13446592lfu.2
        for <linux-gpio@vger.kernel.org>; Wed, 22 Sep 2021 08:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=o2ozx2DT1WJAl/tVhnxD82ZPa9HEXcQif0SRp4Qc9MQ=;
        b=cKe7zBR2IMCMqRycvQ9tR97AbLTlgAlPShZg4ManTUFVX7uJYX1YpBoCffqlo+Pz1X
         v6nTvcXPjvyNIGY6F7WNzCrqJ860mAOMDaF+AHydLC1U4RCBvcXSsBsCkAkX9lq61LCd
         hkdDhs6GfM+4K14mm6gUucX09jHrevXBk34Czc5AwK4Xmvy/GRB69nxQuyVcG3TQCq9F
         5Z8UpWGSUu7YQzaCNBZGHVA8qNk4vHHLo1lHpIppmJytPL73fcMS6OqXiPjbOABhi1Gr
         lQMchU+FaVI1U+yijXVLal+3z7hCfv/l8QICV7hCZH3IQGbCOZ8MbYum9lL1isSziE89
         Rqkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o2ozx2DT1WJAl/tVhnxD82ZPa9HEXcQif0SRp4Qc9MQ=;
        b=r48Zlb8bdBw8oVG0Nbz18Dj7eWeACiRCyRC8Jeh+eYXUHRNmlxRU9hMr5ynQJimrAl
         9EKJ618pcN5bbv3APRIhirSOcdlXIK5nEOE5w7d5GhRNHfn8cOnKubEnUZ52NLMoUFwp
         82KNNB3ZFrz79pzS25Lol6zN47t5J8usELz8YedakUWMcTsSEb5IWqYsz0SMYPjiJUmQ
         bwqA0Jy3hse7rypzey+zqTEJ3oqsX0CkquUBYv0gmrp9c0zjYoyg+N1Fm++4BQQfo6Ln
         hvRiCOGQedPxzs06UplfAMj4gAS2h09173Pw3tdkcSpI0DuKVhDWn7g/TLCYhiZW959M
         WLYw==
X-Gm-Message-State: AOAM533j0roAWP9uAJfHpOL852KIu790CQTRCWt0gj7TvLp80xCDXToY
        oKaOZQVlCTWvnU//P13icxzCHQKTV+6AzLj7fsmw82cZfEU=
X-Google-Smtp-Source: ABdhPJxW7UjNwACyvlFC1owydL7JFejNIlLgXFb+zizp1VJtAXk4DuRv5lJWYk7uRLBDtB4dp51hvfzFc/+/L/1+aPg=
X-Received: by 2002:a2e:89c9:: with SMTP id c9mr164781ljk.288.1632324197721;
 Wed, 22 Sep 2021 08:23:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210922150616.27408-1-broonie@kernel.org>
In-Reply-To: <20210922150616.27408-1-broonie@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 22 Sep 2021 17:23:06 +0200
Message-ID: <CACRpkdYM2VziiZmFp+ZPVG=Z8RszHOufvtRAokxOJXw6vUhzZw@mail.gmail.com>
Subject: Re: [PATCH] gpio: 74x164: Add SPI device ID table
To:     Mark Brown <broonie@kernel.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 22, 2021 at 5:07 PM Mark Brown <broonie@kernel.org> wrote:

> Currently autoloading for SPI devices does not use the DT ID table, it uses
> SPI modalises. Supporting OF modalises is going to be difficult if not
> impractical, an attempt was made but has been reverted, so ensure that
> module autoloading works for this driver by adding a SPI device ID table.
>
> Fixes: 96c8395e2166 ("spi: Revert modalias changes")
> Signed-off-by: Mark Brown <broonie@kernel.org>

Thanks for working on this.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
