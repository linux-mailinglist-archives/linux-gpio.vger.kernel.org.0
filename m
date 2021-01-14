Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36E9E2F5A0C
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Jan 2021 05:55:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726469AbhANEyg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Jan 2021 23:54:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725902AbhANEyf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Jan 2021 23:54:35 -0500
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6F25C061575;
        Wed, 13 Jan 2021 20:53:56 -0800 (PST)
Received: by mail-ot1-x332.google.com with SMTP id n42so4117321ota.12;
        Wed, 13 Jan 2021 20:53:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=F/k23s6lgOXZTqVuz1xHoCpi6MO42eB1Dy/aDLB/l68=;
        b=Coc4H+UnaMckq5Z75k2Q3USrwW93aY7dO8h+Qix6g7Kv187G+0IqgvkZS0x7rws4ay
         drZewiOBfXeJC3p0qcAUuOm+g03lWXrHZuU9g8/f6qh/rV/dgiVt5mo408EmGsmiJtuL
         7l011CS9rYTisF+uCszEIRVnnKbatIxJeJwlgCCj816UPg2LOe+rK0K2tyJwzdWUNfPO
         mP59NVkJM2/YSvGH6J4N7Y3BezoY56fFVNqRcDGcgcZ+Y4TY+OF55zOh0UX7w9coHzQx
         k9v7wQ9JPI9/bKAu+GYebDmCgXRxsGYdMK8KzGJHweWSZqyaqygir6SjWEA2HdNUd46b
         6IxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=F/k23s6lgOXZTqVuz1xHoCpi6MO42eB1Dy/aDLB/l68=;
        b=Zg+C7QtH8gC6dmDy6A3lxzsAyvFLS7x8tahtzEHdWcwvJCpt/7VwaeCDjQZifQ6BES
         7A4Y1Su0EE2w4FqWPGXjE4o6E4VvtpgcrGySRkLyanV5z3QH/+rw1cn1f5T7UgA9YI0a
         F71nimrZTO0mmmn66RzKhkoBO3BizzsbzoSKKNnYJo5Kd784mC1I6VK0/d8a+837do3O
         KJmckUYx4Iwg1B1MhchfctV+sf11ObOmhBPIEjQ/+P2XTVZISUcdJfJ3gPwLaztJxVG2
         rokbimznmwgnQDRfnivg1JAEwJIkjMB9aVddW4+6X7RZE+2HrT62b1/HUifq48hHm5eX
         8iuw==
X-Gm-Message-State: AOAM533TKA+m5ynPxQ7/WIG3rckrMvRnnvIDtTpR36HsBLhkP+QGAiOh
        cBCDpINUVCsTSl5OQ0aswICjHKMbJ9y58MqSLh/Ah3pyWoQ=
X-Google-Smtp-Source: ABdhPJx4Xf5P3YiozBLInHmduvDf5X+on8T7vqIGA34k3G4cvNXXgPHh1nwm+gkhePe43fKP8aLMW0JSMAB7VPcNV4M=
X-Received: by 2002:a9d:2f67:: with SMTP id h94mr3481013otb.238.1610600035974;
 Wed, 13 Jan 2021 20:53:55 -0800 (PST)
MIME-Version: 1.0
References: <1610509395-107554-1-git-send-email-abaci-bugfix@linux.alibaba.com>
In-Reply-To: <1610509395-107554-1-git-send-email-abaci-bugfix@linux.alibaba.com>
From:   Baolin Wang <baolin.wang7@gmail.com>
Date:   Thu, 14 Jan 2021 12:53:47 +0800
Message-ID: <CADBw62qWmR9w+rXCjjO3_Yw9Hk_BoSFZhM7pbiRKp+bgnOfonA@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: sprd: Simplify bool comparison
To:     Yang Li <abaci-bugfix@linux.alibaba.com>
Cc:     Orson Zhai <orsonzhai@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        linux-gpio@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jan 13, 2021 at 11:43 AM Yang Li <abaci-bugfix@linux.alibaba.com> wrote:
>
> Fix the following coccicheck warning:
> ./drivers/pinctrl/sprd/pinctrl-sprd.c:690:8-23: WARNING: Comparison to
> bool
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <abaci-bugfix@linux.alibaba.com>

You should keep other guy's reviewed-by or acked-by tag for the
following version if no other big changes. So again
Reviewed-by: Baolin Wang <baolin.wang7@gmail.com>

> ---
> Changes in v2:
>     - make "pinctrl: sprd:" as subject prefix
>
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
