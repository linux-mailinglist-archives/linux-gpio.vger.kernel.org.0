Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C47E2F4168
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Jan 2021 02:56:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727090AbhAMB4X (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Jan 2021 20:56:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726876AbhAMB4X (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Jan 2021 20:56:23 -0500
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED823C061786;
        Tue, 12 Jan 2021 17:55:42 -0800 (PST)
Received: by mail-ot1-x32e.google.com with SMTP id j12so455112ota.7;
        Tue, 12 Jan 2021 17:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vi9vBEa9pJQcyGzap+t16sV/0A2eRr6OduWFyN0i+JE=;
        b=qH3yK4ajUVncbkZLmND9vGggon72FVjiS/3pC5Ki1JdK0sFSWXVn2xH5mxqfsR8X2K
         gBbHjBYdJlqq/pJL73mnQTBYsxCeOZ0Px2UdXCgdJNk5QvNRhdzcLREijckZUkbgp6e9
         MP6XBPpd80NEGK8Te/cZdf0kUjqTuJA+/yW5yHuLbyW7/RrzXPIzIOiWPGVMR2203PsW
         ht4L9SSh8qUQdbz06FMgBFKI3b7snU1zPdsdZppr6K0Pj/DgavFTz9uI1gzQTSEVsuxe
         Q0pcUJT/915b6qZegaVnC3rB2I/gdFMMT1ltMD+V8tVpLoE56j5SJZdOeqfXf+OzOFEE
         qEqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vi9vBEa9pJQcyGzap+t16sV/0A2eRr6OduWFyN0i+JE=;
        b=KSGw8M1mdeIUYX1PmcigemYakyZvgGUPzNYFXNnaiYh1lI7EUgVr5CwNUYkhU9IocK
         PddHXxOG9PMQJc4CQWqhGHfIjJ4KTklZBBNnklc7t/4cI4EyZOnCSLfWSqCfxAZRQ7Xf
         hBvjNplKvvHmmZ2ge8pFl3ZYGUOYPCHZIMEpTRnZby/G6isKBMquDmXo+2RSpJ0xoZE+
         O1W0RmclVCQjgb2Y0VFNINjFbKrEeTOB3ALenxOkIEKJqtWBGQDmu9r8hf6h61Zfzt5W
         ZFu1bhlXMw9fz9BmuorFNM3lqrs2D6pajzxsXV4OBw3Kr6/OqJWYgRrr3EXR1jwphRgn
         pYEQ==
X-Gm-Message-State: AOAM532aoSvkYA59Z+9pC48Iw6g0kygC64wta8CCt2l4IcJXY/zIHsrU
        Lh0zGEO3vQcbuFZu3Bx2+aXMIlkMdQiXhMt1/HY=
X-Google-Smtp-Source: ABdhPJwWhcclT4lGSlNLczythqwnb86JQUvlAErggsPh3BipYFo8PGtwuZMomcEfLUmzcCdaWDsBx20Ct1dXwc/D+nM=
X-Received: by 2002:a9d:2f67:: with SMTP id h94mr1487955otb.238.1610502942404;
 Tue, 12 Jan 2021 17:55:42 -0800 (PST)
MIME-Version: 1.0
References: <1610440080-68600-1-git-send-email-abaci-bugfix@linux.alibaba.com>
In-Reply-To: <1610440080-68600-1-git-send-email-abaci-bugfix@linux.alibaba.com>
From:   Baolin Wang <baolin.wang7@gmail.com>
Date:   Wed, 13 Jan 2021 09:55:35 +0800
Message-ID: <CADBw62oXzk8fyCt+gFOH9+8zXenDXrQ14H7nPC3xVbfCKOU4DA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sprd: style: Simplify bool comparison
To:     YANG LI <abaci-bugfix@linux.alibaba.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Orson Zhai <orsonzhai@gmail.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>, linhua.xu@unisoc.com,
        linux-gpio@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jan 12, 2021 at 4:28 PM YANG LI <abaci-bugfix@linux.alibaba.com> wrote:
>
> Fix the following coccicheck warning:
> ./drivers/pinctrl/sprd/pinctrl-sprd.c:690:8-23: WARNING: Comparison to
> bool
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: YANG LI <abaci-bugfix@linux.alibaba.com>

The subject line should be "pinctrl: sprd: Simplify xxx", otherwise
Reviewed-by: Baolin Wang <baolin.wang7@gmail.com>

> ---
>  drivers/pinctrl/sprd/pinctrl-sprd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/sprd/pinctrl-sprd.c b/drivers/pinctrl/sprd/pinctrl-sprd.c
> index 08dc193..dca7a50 100644
> --- a/drivers/pinctrl/sprd/pinctrl-sprd.c
> +++ b/drivers/pinctrl/sprd/pinctrl-sprd.c
> @@ -687,7 +687,7 @@ static int sprd_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin_id,
>                                 shift = INPUT_SCHMITT_SHIFT;
>                                 break;
>                         case PIN_CONFIG_BIAS_PULL_UP:
> -                               if (is_sleep_config == true) {
> +                               if (is_sleep_config) {
>                                         val |= SLEEP_PULL_UP;
>                                         mask = SLEEP_PULL_UP_MASK;
>                                         shift = SLEEP_PULL_UP_SHIFT;
> --
> 1.8.3.1
>


-- 
Baolin Wang
