Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87921697BEE
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Feb 2023 13:36:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233745AbjBOMgr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Feb 2023 07:36:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233561AbjBOMgq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Feb 2023 07:36:46 -0500
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FE1E3802F
        for <linux-gpio@vger.kernel.org>; Wed, 15 Feb 2023 04:36:45 -0800 (PST)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-530b85f118cso39601007b3.9
        for <linux-gpio@vger.kernel.org>; Wed, 15 Feb 2023 04:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=peZj4Dk2pewXfcQXtkuPVVkhigNfkMkCTdv1hPoK17Y=;
        b=Hi5pgs95llh+e5WF9CMkxjOw6RVm/KtBj41xOF4pZCqWPkB0RQQNcdR9GK3MJqQ2Qu
         syQNFFkzsHTuLwi/hFT+M8i66y8lI96mro/ajroI0KY9Q+koWHhsUyvT+atNZlRCiU6g
         rNElhuBU/r2ZplBitdzGZtwnDo/Xq87PEM3aQXVqvRge+UiaAvPEo941jm6WguYGbkKM
         0Rn/rangyTVxkpnwKyscZCYsaHQIMxjHJrrxONNd6/oLfa+qUWopGuwNGaGmJcThqi85
         WIdzWrg7BoInBHgx+HojPtfQ9vLz6KXtnWCTktGAWcN07IYpX6SIDixHha+zY/obPvPI
         wPdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=peZj4Dk2pewXfcQXtkuPVVkhigNfkMkCTdv1hPoK17Y=;
        b=wPz4yJGoI/KX1lLHNK0qJPSA42HfQeG9a2D0IqKlnh53KUwQ4SkzqhL64XqJN+1KUG
         RUGCVbovliu1/iuEZnnABXnUpjEzfm/HEJucg1PUfmSQZsGBfqC6EMFhHMDKdsCGnQY3
         tGU+sAent4FOjBO+MF7LW7enkNX/iV7eGhE6SR1+TOIFdd3nhWcvU7FHzlLyuIxHAlh+
         J3acQcGxZFvtWdWlgi9GiUQj5GCGY1CqxBe5Cfvy/RX0+0hi44AMt/D8iMJA0VizaAxZ
         kQtL9kFUe4bf6jM6KqgqfqXhr9MRmRLcUXosEK0oZNar8oDJmUihqb9EjPC9Lnt0uDn+
         hVSg==
X-Gm-Message-State: AO0yUKVaCdn+WNtQ3Ia3WH0y5TmnyDfDfSjOBjiqK/fKYjBWP9nI+G0E
        O1V6eFmq6Hiz8cCAYmGg+YmpCWSnVmwPFQxhWzuteQ==
X-Google-Smtp-Source: AK7set+q7msr7DRhg1NWbsLLGrj0a/RemAwt6fWpgKw2yjIRNuUVqVgtYGWMmcjHOU9YJgjoCzyXn+EniltG86FbHRQ=
X-Received: by 2002:a5b:604:0:b0:803:19fa:2c20 with SMTP id
 d4-20020a5b0604000000b0080319fa2c20mr163418ybq.207.1676464604763; Wed, 15 Feb
 2023 04:36:44 -0800 (PST)
MIME-Version: 1.0
References: <20230215095249.246911-1-alexander.stein@ew.tq-group.com>
In-Reply-To: <20230215095249.246911-1-alexander.stein@ew.tq-group.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 15 Feb 2023 13:36:33 +0100
Message-ID: <CACRpkdZowEfa0As9XMs+OOrsaUk5=pYyhAGXKXzGWZHQdU4SUg@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] gpio: vf610: make irq_chip immutable
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, andy.shevchenko@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Feb 15, 2023 at 10:52 AM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:

> Since recently, the kernel is nagging about mutable irq_chips:
>
>     "not an immutable chip, please consider fixing it!"
>
> Drop the unneeded copy, flag it as IRQCHIP_IMMUTABLE, add the new
> helper functions and call the appropriate gpiolib functions.
>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> ---
> Changes in v3:
> * Use calculated gpio_num instead of accessing struct member

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
