Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFDA12F640C
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Jan 2021 16:19:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726578AbhANPOp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 14 Jan 2021 10:14:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727181AbhANPOo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 14 Jan 2021 10:14:44 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB38CC0613D3
        for <linux-gpio@vger.kernel.org>; Thu, 14 Jan 2021 07:14:03 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id t16so6137993wra.3
        for <linux-gpio@vger.kernel.org>; Thu, 14 Jan 2021 07:14:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8w6v2zJu2NouosfOkB7KDJ7+6VCJGcJrCDw3sLK/y/k=;
        b=T79sQaNftJS7ALh4FTSxEpet2d91HaXlsY1PwOpKPfZkNayWfUEY7O0hKzrf5cTTND
         JUbkfxPSePvKwgZczneEVlERUaewOM4g78bJMNcsuPcepFjzGJ6ZsVsEqkhpX93GvEtj
         6o3EMsSnekiRGCVi7qKyvGHHhmRE3VuvngeunQH+Ixp2jBeptWIpRpmisnX/kQOO9trP
         RuTd4DIORfTAa4ztjgxI73A848lYypNBKYKMzFBCeMEWaTTOc0qAIPYKM27u04ERvg2t
         wt4q6regC52jN0iYG+1Dm4UsGiXgmVTJ/sJjnDBbBEh/vSeCNLYrCb2AZktxYiIrVeUG
         2JcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8w6v2zJu2NouosfOkB7KDJ7+6VCJGcJrCDw3sLK/y/k=;
        b=ARbWlzW3pcDMXbKjRTnSzsBZEhSokGMAlPlipGyeUdGac/Ff8HKtxfRyYDzDbE67+O
         fkun6DLvV1bS00TdAIzcT07M9/JsRcN6hDBpsLLbm2DdImjK2rrXMIZ6JB8HWe3cKaup
         IInQmqnatUBR6mS6jPZhHHuGylJT/vIEl91beFyOLlHPJrpIoyHMNxkIt5z7ZbiFEwf8
         Q9bXf9YtdSn6rOhoBcaZ9nO7xYccR2RW/1Q0iE2D2/PzUl29uyCWQiz1NJWj3NRUW3K3
         g4DsfxZBSNPU1poV5xuSChuv4xx/P4a+2oEtwN5lYU1pG2Awzw6j+X2HRP7HoGTjm2xT
         a0fw==
X-Gm-Message-State: AOAM533TfmrGChNeSTKQx6cGEfCN044Nyrd/y4MAM+VGYta6Ml6urGCr
        nmmGdy2Jk78xeetCUxOuT/wBybPeO+P4pWsjmICPgQ==
X-Google-Smtp-Source: ABdhPJwjV5PI8yQpRk4BZuoz72XANsVvORO3WGPymL6Zm5a8eHs7zDueHsZffSfhh0dCC5EvwBD8vISh3zSvVPTUXxo=
X-Received: by 2002:a5d:43cc:: with SMTP id v12mr8211673wrr.319.1610637242660;
 Thu, 14 Jan 2021 07:14:02 -0800 (PST)
MIME-Version: 1.0
References: <20210107025731.226017-1-warthog618@gmail.com> <20210107025731.226017-8-warthog618@gmail.com>
In-Reply-To: <20210107025731.226017-8-warthog618@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 14 Jan 2021 16:13:52 +0100
Message-ID: <CAMpxmJWRbUc4Wdrhaxs1F+W50n0SOgvcgQrurnjvUBJaeHX6tA@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] selftests: gpio: add CONFIG_GPIO_CDEV to config
To:     Kent Gibson <warthog618@gmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-kselftest@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Shuah Khan <shuah@kernel.org>,
        Bamvor Jian Zhang <bamv2005@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jan 7, 2021 at 3:59 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> GPIO CDEV is now optional and required for the selftests so add it to
> the config.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  tools/testing/selftests/gpio/config | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/tools/testing/selftests/gpio/config b/tools/testing/selftests/gpio/config
> index abaa6902b7b6..ce100342c20b 100644
> --- a/tools/testing/selftests/gpio/config
> +++ b/tools/testing/selftests/gpio/config
> @@ -1,2 +1,3 @@
>  CONFIG_GPIOLIB=y
> +CONFIG_GPIO_CDEV=y
>  CONFIG_GPIO_MOCKUP=m
> --
> 2.30.0
>

Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
