Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BADB6748CAE
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jul 2023 21:02:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232584AbjGETCW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 5 Jul 2023 15:02:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233393AbjGETCS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 5 Jul 2023 15:02:18 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 487CE198B
        for <linux-gpio@vger.kernel.org>; Wed,  5 Jul 2023 12:01:57 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4fbbfaacfc1so2817876e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 05 Jul 2023 12:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688583714; x=1691175714;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sCsGZRzf3HYCGfa3J/FwmvyZFYe1Uzq7njxx6cRcALI=;
        b=f8rFSZhyPMufcQlj9n6Kb5YkkoNZ/Rcp9KzhozHLymYOFEBCfSxF5kNgqTGNmsM+vG
         hnAbE9h41qXOdtKkKzWfSLq8xca7Xd3HsnGIQWzuGNqD6czhHX5RY2OluIiUkGYKGwkf
         oqE8zbRdi/mK5wGSuDNZjk2JwoCees+DPMHLMcA8oubhdaM1cS9BA3hvqxA97vJtic7O
         lZ0f87gTeeTTYVmKVOVcBxAxeaPfZbGCS1h4vVN2WsnJ7TMWKMF5dZWkoOEq1soFwV7B
         PAGG+H9fvtGYI4kyaWLgFlNjGr8IGUYnh1RBZtrwHjNtyN38rucO3V4btAoaeH27l0RT
         X4ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688583714; x=1691175714;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sCsGZRzf3HYCGfa3J/FwmvyZFYe1Uzq7njxx6cRcALI=;
        b=ChueN7UOYAmtSxWSoBB1+P6eNlQhHq75aYUeI/TSR6/DdphApOzuqSvupQRHuWoeKy
         //xN9fOr9AzLU07qlqf+a6LTWzPROpLdv8ZuaRcQZ/Survovt9kDgFwKFpnke22oIHMH
         3qsaHRtszVhHW/8VGrEQMn/keoRp0RCqUQ4q67W7RGrXiJnldv7wSIEgCcGqqGXQj20i
         k7imOFT288bMsqm+aVkE55y7w+8ZmBDMNhPs5x/4Pnbck58680uc+CJlQDcesjcNzC4q
         wXbkk4abKPCEeqWa7FsrfXx5YwiH+rh247+EFdxLaYm3nNAymHHPHNbEApWaTegsliOl
         tbNg==
X-Gm-Message-State: ABy/qLY+soT3KVt5ED5WkKUBTcwxn362olu6+G+DCWvr4/Hgu0tWv12d
        dnjhnqXelQIiiqcN7N/YirDbjSnKVHtm5jA8Vfvk6cgxNPE=
X-Google-Smtp-Source: APBJJlHz+bGTxoBYEWa3Mx8vdec2PFYHcq0ukHiMMB4xKJI7N1m2UXzsu7l/vIgAgylbfzExbT8SGp0Gn5tJc4hBpaE=
X-Received: by 2002:a05:6512:2821:b0:4f8:710c:e2c7 with SMTP id
 cf33-20020a056512282100b004f8710ce2c7mr13857329lfb.33.1688583714300; Wed, 05
 Jul 2023 12:01:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230705153713.2511647-1-shenwei.wang@nxp.com>
In-Reply-To: <20230705153713.2511647-1-shenwei.wang@nxp.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 5 Jul 2023 22:01:17 +0300
Message-ID: <CAHp75Vf+RovRT2rYJDnizeRUwwKE_Twfd+tF5pY3XEc_xOkXYg@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: mxc: add runtime pm support
To:     Shenwei Wang <shenwei.wang@nxp.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org,
        imx@lists.linux.dev, linux-imx@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 5, 2023 at 6:37=E2=80=AFPM Shenwei Wang <shenwei.wang@nxp.com> =
wrote:
>
> Adds runtime PM support and allow the GPIO controller to enter
> into runtime suspend automatically when not in use to save power.
> However, it will automatically resume and enable clocks when a
> GPIO or IRQ is requested.
>
> While putting the GPIO module itself into power saving mode may not
> have an obvious impact on current dissipation, the function is necessary
> because the GPIO module disables its clock when idle. This enables the
> system an opportunity to power off the parent subsystem, and this conserv=
es
> more power. The typical i.MX8 SoC features up to 8 GPIO controllers, but
> most of the controllers often remain unused.


...

> +       pm_runtime_set_active(&pdev->dev);
> +       pm_runtime_enable(&pdev->dev);
> +       err =3D pm_runtime_resume_and_get(&pdev->dev);
> +       if (err < 0)
> +               goto out_pm_dis;

So, after this if an error happens, you will have PM left enabled and
the next probe won't work as expected, right?

...

>         platform_set_drvdata(pdev, port);
> +       pm_runtime_put_autosuspend(&pdev->dev);
>
>         return 0;

...something here is missing?

> +out_pm_dis:
> +       pm_runtime_disable(&pdev->dev);
> +       clk_disable_unprepare(port->clk);
>  out_irqdomain_remove:
>         irq_domain_remove(port->domain);
>  out_bgio:

--=20
With Best Regards,
Andy Shevchenko
