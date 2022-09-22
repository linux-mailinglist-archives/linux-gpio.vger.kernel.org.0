Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 613E65E5D5A
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Sep 2022 10:23:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229518AbiIVIXQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 22 Sep 2022 04:23:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229499AbiIVIXP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 22 Sep 2022 04:23:15 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EDB588DFC
        for <linux-gpio@vger.kernel.org>; Thu, 22 Sep 2022 01:23:14 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id lc7so19465523ejb.0
        for <linux-gpio@vger.kernel.org>; Thu, 22 Sep 2022 01:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=2loV0vXqAS4yY1zw6DmfKA2Yuywgdx5seUxvEgvjVZo=;
        b=abfxgGTFqNy0mj3FEpRruExGIlWS672/CtxLcAlx6qwaY8FyWInjhTYvwZrgZtSwMi
         HDpBnNwkYRAtb9vS2ynMeZdQ2x2SiROdD3UpCsbTMAcwObfNp+TTwg0mxKa48g7IT/9R
         PqLYXN4aIKhq6QFbwGmGhLQ3sWG0K1rH+ErlsG1yja5n/NMGpW04mJw+tfo1nYx9yJQD
         ZTqtCXh08NquBFL9QildMX/whw8eiMdbb0p+6a4//3Wxq7KDIduJpdwdgqxd/Unyr3BJ
         MVtYLgDwMj1LryKFqdQmCiXPKR6HL2Tp9nW0Zu5m1/3CXqhCuiMHmQ0r6OMgmkmbd6/2
         EOjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=2loV0vXqAS4yY1zw6DmfKA2Yuywgdx5seUxvEgvjVZo=;
        b=z7BcqKTJ8Tp0+byrsp7eXx+c/lEJechwJHy8otGcnO9NrHHCXKJ9mLiCQf6+D45M+I
         bX4Vb7KtNKzCwfaTVDcDkpFcXUm2NeSVjQB6ADREbNjeEA2oEIuZ5hkUb+mC+lLxrEyf
         G2GmsQtgtutLPQpXP5Fiz6//CpwLGqO/o4+fVrUNuyhMUWPh2edh/3/ZtJSmRPAU/JTn
         WNdiAO/O0gb6HAc1kZZc2KPkZAj6RrMZUNzqX4YS/aqsKu+Sdn5Mw4RQjtzEQ45mXr6j
         /Q1Isa512lhnDtFe/ZNyRmhMnn+yLfGiqB7Nvvh5ZWwGsaII8m/I/z22HxkLSMDKGMS7
         yw+A==
X-Gm-Message-State: ACrzQf1SMbl/568HUM/YSg5yxukpiQTiSX8FKufAHxg2e51pNAuThk1w
        Iy7QE3BRU78OrAY7vO638deEtwNmKY97E//au2HhIw==
X-Google-Smtp-Source: AMsMyM4foiAxz1tF3nfskAIqn06zu7pjGL3slVKVcwipETMwxQq7dFJQT6V2esIXizb3ofSVmZMXe/nn/P4y+wA5lKk=
X-Received: by 2002:a17:906:8a4a:b0:781:70ab:e7cb with SMTP id
 gx10-20020a1709068a4a00b0078170abe7cbmr1721894ejc.492.1663834993067; Thu, 22
 Sep 2022 01:23:13 -0700 (PDT)
MIME-Version: 1.0
References: <1663746237-7133-1-git-send-email-haibo.chen@nxp.com>
In-Reply-To: <1663746237-7133-1-git-send-email-haibo.chen@nxp.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 22 Sep 2022 10:23:02 +0200
Message-ID: <CAMRc=MeDqMg_sh2YCGhO3=BkjFRbqFUf0VaH0H2EYd81e5H_8w@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: add NULL to the end of arry of_find_gpio_quirks[]
To:     haibo.chen@nxp.com
Cc:     linus.walleij@linaro.org, dmitry.torokhov@gmail.com,
        linux-gpio@vger.kernel.org, aisheng.dong@nxp.com, linux-imx@nxp.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 21, 2022 at 10:02 AM <haibo.chen@nxp.com> wrote:
>
> From: Haibo Chen <haibo.chen@nxp.com>
>
> After commit a2b5e207cade ("gpiolib: rework quirk handling in
> of_find_gpio()"), it add an arry of_find_gpio_quirks[], but in
> the for loop, it use *q to judge whether it is out of the arry
> range. Unfortunately, in the arry, forget to add NULL in the end,
> which has the risk of out of arry access, here is the dump on
> i.MX8MM-evk board:
>

This was already fixed by Michael Walle.

Bart
