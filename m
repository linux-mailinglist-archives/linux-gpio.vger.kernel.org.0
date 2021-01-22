Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54B693003F3
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Jan 2021 14:18:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727628AbhAVNRk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Jan 2021 08:17:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727478AbhAVNRc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Jan 2021 08:17:32 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25FB1C061786
        for <linux-gpio@vger.kernel.org>; Fri, 22 Jan 2021 05:16:51 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id a8so7464101lfi.8
        for <linux-gpio@vger.kernel.org>; Fri, 22 Jan 2021 05:16:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BpHtWisCEbp39ZnGfIbZSorIiskXc7SNUksq5DeV4rs=;
        b=WeFtWW52nBgnXySdz5t0Yk/1aiwAlTQDBSqGxiiKSx4zv/Qx0+nrPDlKFEOAEwr6w0
         IfugZQDr6oJgX85fKBdTaZtEG7uBlgyZG2tSAJEG7lcqLYY2lMUxh8lgyiwpDAoRgDWY
         aPD3AlGCuQ7M2hHYNPw7uCvCNut/lqE4qv20Yv75+cYkm070lJU4SPJyQiBJWH1RfWWO
         ifXFwOPYYxFyfZ+Vz0jL67QEfTyStFM860i7OOl038AMYW2mm/iBJkdMcjUfShOpdJ58
         ZRpoCjene/nnNNTC3ZJQmaj+SoqDE5R7hERkcXEywvgYwydqxbu6LeLGaUxkG2C7BfU2
         0pww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BpHtWisCEbp39ZnGfIbZSorIiskXc7SNUksq5DeV4rs=;
        b=AyonTg9bxsKtrBczvIg4yhekOvcLtmv7rSUGYlL03V7uQ0CiQsqa7chDMIHiW65Pga
         DB3qb0kxiTFlrnE3f7k4csJeUJIaUtXyqvbyY62sLCvWZFTNsOwCYG8L5MD9eAaijpeR
         a3KtsnwVqDpnt9TLQ9n7iKJh9OtOD8hQtuofIJQvlqrlr3SkS6LVDDjjfDIoIi14cqTm
         CWRm+Lk+TQ5HP5vyqoQbcTlVtIxukJYPtUlWatIPV7t5wQofd2zKrN7RLmOO+eqPjPnA
         9XAUZT2lBvud6+P6xdtSknSikOhSE1zRhfOZ7rz6gGydKmkzsof+1OuargAgADjGW/NU
         Dxyg==
X-Gm-Message-State: AOAM533AjHKPD+POb8htu/JdWlfbmd/Ddydg8Ikc86pwF0g6HKVdmFB4
        2x1IvsJTU08n59PeJZxjfRbD+Tai5NqJZT3LWatyEQ==
X-Google-Smtp-Source: ABdhPJxILvWro31995fipjxTfL6ysb0E/7JxGABGecm4el8PPYbKHEX6Cowm1f03NXIwRWCZxiDkb65uAKwNw8QrEx0=
X-Received: by 2002:a19:8bc6:: with SMTP id n189mr167491lfd.291.1611321409546;
 Fri, 22 Jan 2021 05:16:49 -0800 (PST)
MIME-Version: 1.0
References: <1611127757-52999-1-git-send-email-abaci-bugfix@linux.alibaba.com> <YAjysf3IQvxO/qsT@builder.lan>
In-Reply-To: <YAjysf3IQvxO/qsT@builder.lan>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 22 Jan 2021 14:16:38 +0100
Message-ID: <CACRpkdYHc+GFDHhherQm3+xm+akN+NdCz2hkAzLprb0PPC6CFA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: spmi-gpio: Assign boolean values to a bool variable
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Jiapeng Zhong <abaci-bugfix@linux.alibaba.com>,
        Andy Gross <agross@kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jan 21, 2021 at 4:19 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
> On Wed 20 Jan 01:29 CST 2021, Jiapeng Zhong wrote:
>
> > Fix the following coccicheck warnings:
> >
> > ./drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c:340:3-15: WARNING:
> > Assignment of 0/1 to bool variable.
> >
> > Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> > Signed-off-by: Jiapeng Zhong <abaci-bugfix@linux.alibaba.com>
>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>
> Although we're mixing bool/int on line 417 and 637 as well, with:
>
>         val |= pin->disable;
>
> and
>
>         pin->disable = val & BIT(0);
>
> respectively. The latter could be dealt with using !!(val & BIT(0)); I
> guess the appropriate for for the prior is:
>
>         if (pin->disable)
>                 val |= BIT(0);
>
> If you would like to update your patch with these as well I'd be happy
> to review this.

I would opt for a respin with the above when we are anyways at it,
no hurry as it is no regression anyway.

Yours,
Linus Walleij
