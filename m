Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C22029713F
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Oct 2020 16:22:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S374623AbgJWOV7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Oct 2020 10:21:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S374556AbgJWOV6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Oct 2020 10:21:58 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82F17C0613CE;
        Fri, 23 Oct 2020 07:21:58 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id gs25so2664176ejb.1;
        Fri, 23 Oct 2020 07:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:sender:from:date:message-id
         :subject:to:cc;
        bh=3rcXVSOL+tJRZBQm0pw/Zq9ogwm9bItd4VPlftbM00g=;
        b=Bge8D9q4Ck+6oQR5swtz7kx/CVmO3H/gxI93IJbbAM8yPEyVzaym+n/+CREN6Aya6V
         48qAhym76RmXks5OZYbeJqEh6rZj+GDw+9zgBKjBjHpYCpiUckLxwxM85Wxpqws4WCG1
         kw6bp5+QWJAyIUd+vV5gVlCvpkg6SRKDSM36LJ0w3RW/wqdmznrdb01WoNfYVcRo/yjK
         hqHr633nbepgJoGUrk2p+PeYO9lOG9GAetosPfND6Lk0euVNFd0YRCH46VaYi3reDIqo
         37IYNKd0A/k96+BQXtXDcD8KJ3EuGkf0xITNm34FzUeTWudaHg33pg9qPLWTONieWWhM
         WLoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:sender:from
         :date:message-id:subject:to:cc;
        bh=3rcXVSOL+tJRZBQm0pw/Zq9ogwm9bItd4VPlftbM00g=;
        b=d+uvW5Uq7QAr2ik/Wd7pq7jboStl0nEaMdZFcU8o1/ztx5XB2hoelmkUWOcakBvlB/
         JuHII/rV5Es+l6Ifz7DazUwamEsVaM1P+63k8eypveWfxIgYCKb959WyL97r0DxC5sSU
         8KIow+zHfZtcquhW8YMGSZG9I6d3U8kkGU4Ho8H3iZX4ZMxGn/ESDdChgsRUGrFNKUXy
         i2M89dKNwroXn2PJhbT73YubR/jVcgCdRHWvYjgZ/lUe6dc3yScQ0SVETdxxgczZb/3m
         LyreTGXvvPZetzLALY+LHkNNX87pQNvk6ZSoLr+PPcX3LYWGJ79ysJ/y4uG8TryRKFMX
         arBA==
X-Gm-Message-State: AOAM532Z60mF6n7d/YMCs3wVU4I1vlTt9Pfw96xYb/CLpnU+sH8VHXZn
        /FN6hWemwQqgJXF64b6E7r2U8nfRs+F6lcf1Da8=
X-Google-Smtp-Source: ABdhPJxPWuUVMmCsJll590lxcX3FUKbgd71i6nIoh0ZydFGbplw/o9febMpu6Mv6DOTrtp2ltM5kHrANFd2w2IZum5Q=
X-Received: by 2002:a17:906:33c7:: with SMTP id w7mr2067255eja.398.1603462917224;
 Fri, 23 Oct 2020 07:21:57 -0700 (PDT)
MIME-Version: 1.0
References: <20180129005948.7714-1-bjorn.andersson@linaro.org>
In-Reply-To: <20180129005948.7714-1-bjorn.andersson@linaro.org>
Sender: getarunks@gmail.com
X-Google-Sender-Delegation: getarunks@gmail.com
From:   Arun KS <arunks.linux@gmail.com>
Date:   Fri, 23 Oct 2020 19:51:45 +0530
X-Google-Sender-Auth: _vvNSE9j93IlwHnXLdmbEcZjtDI
Message-ID: <CAKZGPAPrwXNeYk+bDiMBRczVf4PaBANnzhmenZie+V0BJ7OqBg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: msm: Use dynamic GPIO numbering
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, Timur Tabi <timur@codeaurora.org>,
        Arun KS <getarunks@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 29, 2018 at 8:30 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> The base of the TLMM gpiochip should not be statically defined as 0, fix
> this to not artificially restrict the existence of multiple pinctrl-msm
> devices.

Can someone please provide the details why this is needed for
pinctrl-msm.  Is there any msm-chipset using multiple tlmm devices?  I
m only concerned because, after this change, the use of gpio number
from user space has become a little difficult. Can we merge the patch
from Timur to maintain the past behavior when multiple tlmm devices
are not present, which is most likely the case?

     static int base = 0;

     chip->base = base;
     base = -1;

Regards,
Arun

>
> Fixes: f365be092572 ("pinctrl: Add Qualcomm TLMM driver")
> Reported-by: Timur Tabi <timur@codeaurora.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/pinctrl/qcom/pinctrl-msm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> index 495432f3341b..95e5c5ea40af 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -818,7 +818,7 @@ static int msm_gpio_init(struct msm_pinctrl *pctrl)
>                 return -EINVAL;
>
>         chip = &pctrl->chip;
> -       chip->base = 0;
> +       chip->base = -1;
>         chip->ngpio = ngpio;
>         chip->label = dev_name(pctrl->dev);
>         chip->parent = pctrl->dev;
> --
> 2.15.0
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-arm-msm" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
