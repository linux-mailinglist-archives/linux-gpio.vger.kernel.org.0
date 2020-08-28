Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04457255C8A
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Aug 2020 16:32:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727022AbgH1OcW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 Aug 2020 10:32:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727919AbgH1OcQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Aug 2020 10:32:16 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93D5AC061232
        for <linux-gpio@vger.kernel.org>; Fri, 28 Aug 2020 07:32:15 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id y2so1568138ljc.1
        for <linux-gpio@vger.kernel.org>; Fri, 28 Aug 2020 07:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wVomXPK0U4YnUe61pOa0mrtN3m3F0A/CetmINqj4FvQ=;
        b=IXeEjsjDMU8OHqYlJ0p8rDf4WgvfOfbeZYG1fmksYO7VBPareOmDTBDBpJfLu2f4Mo
         oc5Qx/kRjst3CdFtvOjdIsdvwAPlR01NAKq2ZLg9Cf9Jcr/yk4fT6QHA2POLXvJjElqK
         4rlzpaVgAadANBaLSYZqeuj1JdC/A2vnjVb+5nOK8cQN0Sptd2OUBdZK8CHIYtGh+PWj
         aWYjoQQuUTLUwr2wTHzH8etMU6LEC6XUu414lYInENZPAWDAWJtSMHLUvvwCiBxYDI5L
         +mJHbZIhZBpuwqrxyq0MBlWEdp+B+UtBmlAR7AAdUpkOXyQTTgO5odt6FNXZhOLQMs1A
         +Xzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wVomXPK0U4YnUe61pOa0mrtN3m3F0A/CetmINqj4FvQ=;
        b=EAmLA00CA9wD7BCI6UU4auxhg+sAf/ZGowH5UP8jO1+5mhpZHpeQCTdg4GbCkRBvcc
         KDq3PZvx8sG77ako9rE6YkCWxWLxrW7PW87lXSkH4wNPPcYuU9f42nMBh7K2wCI1o0VH
         6sF2aRBV61qbS7qL4X1UbAnFkoAsqDNslgBZ0sN4jOdTAPNBDcliLijPlNR1KplzCXpi
         1wA+EPr1vxRofSjUO6IxEHvq1AjgrpYZnU5rnF0b9tghzFjN0R4ZeZgmiUlujblSQNu6
         7G7uU7mr+LzsqEV1Vvq4K/uBpMtlpaBfq96iG1EVOMjT6VbEYJFJPJUynkEDk52g5h2E
         pMnQ==
X-Gm-Message-State: AOAM532VVgEa99CuvKXMem2U0Kw2jc4592Xth5TwUSI73Kud0RuceVUH
        tscWibo1oLaOf0OIIlF/fPFq779HKsFJWebH5snTcw==
X-Google-Smtp-Source: ABdhPJxyQbKAxlRRRvc2vRtyWbyMbMoH5z28IQ9c6tGUgZBDV3PTLB/tba5Nu2XqbmrEWhyYyf5fprRmxxYMiT4YEWI=
X-Received: by 2002:a2e:4e09:: with SMTP id c9mr1062954ljb.283.1598625133997;
 Fri, 28 Aug 2020 07:32:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200827185829.30096-1-krzk@kernel.org> <20200827185829.30096-27-krzk@kernel.org>
In-Reply-To: <20200827185829.30096-27-krzk@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 28 Aug 2020 16:32:03 +0200
Message-ID: <CACRpkdZQZ+ANpMmwFUbTxQ9=EZEXZkr7Z3DLbica=Q09bmntBQ@mail.gmail.com>
Subject: Re: [PATCH v3 26/27] Input: bu21013_ts - Use local 'client->dev'
 variable in probe()
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Bastien Nocera <hadess@hadess.net>,
        Sangwon Jee <jeesw@melfas.com>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux Input <linux-input@vger.kernel.org>,
        platform-driver-x86 <platform-driver-x86@vger.kernel.org>,
        clang-built-linux@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 27, 2020 at 9:00 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:

> 'dev' is shorter and simpler than '&client->dev' and in few cases it
> allows to skip line wrapping. Probe function uses '&client->dev' a lot,
> so this improves readability slightly.
>
> Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
