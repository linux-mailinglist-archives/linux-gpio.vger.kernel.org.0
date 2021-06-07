Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04CB839DDD8
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jun 2021 15:40:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230385AbhFGNlr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Jun 2021 09:41:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230381AbhFGNlr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Jun 2021 09:41:47 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D895C061787
        for <linux-gpio@vger.kernel.org>; Mon,  7 Jun 2021 06:39:56 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id q21so24962082ybg.8
        for <linux-gpio@vger.kernel.org>; Mon, 07 Jun 2021 06:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VlXDuzHKluTkhD5zvNM3nuwm1YIsxipLM0a14l1XdN4=;
        b=n8zru0ajQmXsS/hEV3K5YVM3VTbwv84fG1iqwEZFzABWmUcpIeP4t4ig/EFDRd9yDA
         eZB48b6Ly6VNPnXr73amlDSMG0r/VezuhvcsKSFpah8S2e7lKfvs/qGWGGamaPumOifr
         zFEqSwx6HmC+e/Bpv1U5ZgvSEffPWaOh4aOlFeOS0Nzc2+bb4K9M4ZW0pTnKzlRp/YBr
         SqrS4PmCxyL1Rdwj8rOA9V/hbBEuNKtYHvq4VvrLr+7CRk1fzh7Ow23flTk5JsDw1v/2
         noPrzfDIyrwMiyxoRJruQXw3fpyOwEEg1+KQZl9NLomTE/ZYSQkVpi4CXrsguCnf+cib
         oy1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VlXDuzHKluTkhD5zvNM3nuwm1YIsxipLM0a14l1XdN4=;
        b=Y5oFmUAF2GLpF4EhrWY9zU+pnyq+PYmzWANtOxdWz9/ZI1Se0VkD8wKdLWfkkRsZ19
         mbO/NmWtldjFtuLVhKfG4jRKXSmfG7GoLyl97gV6qqlWdqqPJIJFwWJJ5KjTsx4ac2M5
         nNEBppiJ2hRZox0NNddpgwrY+PnQDTWXnuEyZVhZg0Em+C+Z9BbxX3uASeHOnqCGMdwJ
         1v6AV6VXqg4XWxEU06VYg0U5VfVeDARa5Fk5acq2drZUn+1OIUEdEVxHWVxZFQgXVQH2
         VkWOytKlGCMf3TfIkjoJJ3Y1xmk8nMtlmn3XbeVmIacGriZTp1RnHeySwAFmxfOx0Dm4
         9L0w==
X-Gm-Message-State: AOAM532MNqHHAcKA7j3kvW4lkLNGfM01EQ3uWrPL0J5n1/rNBrieGc+6
        hlUOaPKiqvlKAZHPrMyHvkjT7nZs7KOgVofkLzbQzgccDjw=
X-Google-Smtp-Source: ABdhPJzKoUs8qoJEnd+R+x3/KSsW2OZ2yeBPW9osZaSI2IxCBvJQovcJAFCC/EHEVBIfwR4ko42JMpDGASzHS094hfM=
X-Received: by 2002:a25:1ec2:: with SMTP id e185mr23958988ybe.23.1623073195494;
 Mon, 07 Jun 2021 06:39:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210604225857.18694-1-michael@walle.cc>
In-Reply-To: <20210604225857.18694-1-michael@walle.cc>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 7 Jun 2021 15:39:44 +0200
Message-ID: <CAMpxmJWQf6JYy9CBD0Avp_KP5KqL6ew05ohGLmHyzX62hu1f3A@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: regmap: move drvdata to config data
To:     Michael Walle <michael@walle.cc>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jun 5, 2021 at 1:01 AM Michael Walle <michael@walle.cc> wrote:
>
> Drop gpio_regmap_set_drvdata() and instead add it to the configuration
> data passed to gpio_regmap_register().
>
> gpio_regmap_set_drvdata() can't really be used in a race free way. This
> is because the gpio_regmap object which is needed by _set_drvdata() is
> returned by gpio_regmap_register(). On the other hand, the callbacks
> which use the drvdata might already be called right after the
> gpiochip_add() call in gpio_regmap_register(). Therefore, we have to
> provide the drvdata early before we call gpiochip_add().
>
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> Signed-off-by: Michael Walle <michael@walle.cc>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> ---

Applied, thanks!

Bart
