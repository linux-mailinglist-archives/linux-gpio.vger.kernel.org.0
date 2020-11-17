Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9CC02B72B3
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Nov 2020 00:54:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725943AbgKQXxn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Nov 2020 18:53:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725771AbgKQXxn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Nov 2020 18:53:43 -0500
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 992AFC0613CF
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2020 15:53:42 -0800 (PST)
Received: by mail-lj1-x241.google.com with SMTP id 11so337978ljf.2
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2020 15:53:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wR6pEgT8ea+4PXfS6Cl91lk2j5DaVF587c8uhOkMLUc=;
        b=iVCmJqXeEPc2JjvsRxcSv5A17qafx4HABWp++wblXI2YYNDDDZ/ZHUKXSQOijJZIJf
         Tc1KLUYTLjR8TRtZ/DlXricdKOPfUJkJS+hCxtqAOmasp1x5Ir8rYJ9h73T1m7v5jvMN
         5073JdB5qqx3Z/+PTqoZMfKwX7zoLlq+Q6qkByBwKAITpklvcnJs9aY9W+/DRpU5co+E
         3OtYgh4aYK6+sE4xkERXGkDLf8dAvx1gdPbY4LZmOYEbLSX65fS25lq+i0cS3u1vUrc4
         03u3t/kW2gGyIFTH2NjVrgAgzd9Djm6D1qKEG9yat8+tzuk7ripYIzZk5A179YvXZzRB
         9kgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wR6pEgT8ea+4PXfS6Cl91lk2j5DaVF587c8uhOkMLUc=;
        b=rSlds3DkMOZNKi3EsBqbGm/olvYBGmHFcKKpd1BmoxPdXh+2by6yG6ki3wsxZcT8d/
         aeY5D5OErdDjhO1wd8S06fOyFgakuxvKdGoq4kmAu7HTDane6YJ+6TI0jQJdauXzQDRK
         ISAX1gWmJ1EZo2jZwsWWrpeLRZdc5ZiY26DR3T0M/z6om9DUXefC4lpZXuJpJpNWzWIK
         f8qg5qe8hbYNfNEBOh7L3nGdo7xOCeYNLgz1Ht7Yvjn/73HnnHc6M6+/chjzL5NxCx9u
         MIny/moINFRkcBWEcqGHsX1wa9bbqRmJkpBKOMBJpflOrYkrpjmfoEkB81OzX44Rbcqb
         rSQg==
X-Gm-Message-State: AOAM5333N1CF2XMsBo2hc1KbizYGCpjLjFlLHXTAGOeN1RO7bOkkwebI
        QwzM9MOtV2E357jX7X6AFnSc7iLfCzmn4TBw+G83xQ==
X-Google-Smtp-Source: ABdhPJxVerKoELJoLFw2Zm47eOboQQzJCqKWTSE2LY1wr8SyHdtlKfBXYRWbtRwr62j0DBRG73M+pSuHQHjVJ7HABJ4=
X-Received: by 2002:a2e:7c03:: with SMTP id x3mr2556090ljc.338.1605657221141;
 Tue, 17 Nov 2020 15:53:41 -0800 (PST)
MIME-Version: 1.0
References: <1605201148-4508-1-git-send-email-srinivas.neeli@xilinx.com> <1605201148-4508-4-git-send-email-srinivas.neeli@xilinx.com>
In-Reply-To: <1605201148-4508-4-git-send-email-srinivas.neeli@xilinx.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 18 Nov 2020 00:53:30 +0100
Message-ID: <CACRpkdZw_rYXUq_UuJrjUk-moSZAiNL1f_nkuWhA2xovgk-vtg@mail.gmail.com>
Subject: Re: [LINUX PATCH V3 3/9] gpio: gpio-xilinx: Add clock support
To:     Srinivas Neeli <srinivas.neeli@xilinx.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        sgoud@xilinx.com, Robert Hancock <hancock@sedsystems.ca>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        git@xilinx.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 12, 2020 at 6:13 PM Srinivas Neeli
<srinivas.neeli@xilinx.com> wrote:

> Adds clock support to the Xilinx GPIO driver.
>
> Signed-off-by: Srinivas Neeli <srinivas.neeli@xilinx.com>

(...)
> +       chip->clk = devm_clk_get_optional(&pdev->dev, NULL);
> +       if (IS_ERR(chip->clk)) {
> +               if (PTR_ERR(chip->clk) != -EPROBE_DEFER)
> +                       dev_dbg(&pdev->dev, "Input clock not found\n");
> +               return PTR_ERR(chip->clk);
> +       }

You can now use return dev_err_probe(dev, ret, "failed to get clock\n");
to avoid all the comparing with -EPROBE_DEFER.

Yours,
Linus Walleij
