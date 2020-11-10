Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89CC72ADF88
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Nov 2020 20:32:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732299AbgKJTcT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Nov 2020 14:32:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732202AbgKJTcS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Nov 2020 14:32:18 -0500
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 657C2C0613D4
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 11:32:18 -0800 (PST)
Received: by mail-ot1-x344.google.com with SMTP id y22so13696999oti.10
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 11:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+6GOQgcp8D4RGZTBstUnyoFcHjwgqFb+Hk6EZdqVWmc=;
        b=nL1qy7p8kfWkS19TAqkpvrp3M3gTLjfjRYWlzV017KGib4EpPyCFzaQeeQOGUrF7xj
         qQ8nDAJ5UcbLNb5Bmx4zKKT01e00uYr99uVl7lVBQtn0gt3fyTvjW6vSvOYQgSQSDCL/
         PrAfES26a+yws2t6NjCZOPyLIY3XBd9f6wy2YbmfgU19kkA8b+5qIQNlY4GxBZEaDL68
         9WxLuJ0ESE9RBNufR/PKtRD8pprcHeNu67urxilpfGwXoqTzt6elQVo/EFpZr2s6jJBB
         1KgSEqlYiRvWd/B5hhyuJ6OiSPE4Ry73cehFLnYOhu3KhamMCpETP+0SQDdoNDydIsoB
         2KYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+6GOQgcp8D4RGZTBstUnyoFcHjwgqFb+Hk6EZdqVWmc=;
        b=hMmVfzgDlkUMkHjdanw2MWiqxquQnxUVVE/0JGcaT0VHE7DvM90s7s/JsQXLsEWLdf
         4FvMeIN4gye8G3z5Re7aW81mygv4mNESCSKp+Hb8AmshiVZVBp23Vifwa1e+Tj0tyN4V
         gJHsEj8XVxGW02rRHjS0gLBs3Gs6RdGT4WSBxGsoExzDAtwFKQH96NVZZAZKC7qqPCSa
         HumIdIFwAqXrE02RnPd5/b6IKjdcbpRTOY/8pKp/TVMd70QSzSFKWgFYVh69MlzR5Vz0
         seS/t6Yp5iLMsYGP58e7IgzHm42a5nb3EOpAdmjE/SlSthcoQ9Rz6QQ8CjCE2IKO32Nh
         zIYg==
X-Gm-Message-State: AOAM530EcUZGmeUtO/snVH0G30OcpK2WePY4INlUiTCaPF6o6F1gRUdL
        HnsNoq5zzlutYrThXjWqHGTear8Kj6vtRRs4MtP2EA==
X-Google-Smtp-Source: ABdhPJyMAQHxrYIclbqtyS8M6yuePVDJFWGmlx5/pY6lF2XgzVFWr5M2LtbMTcdBjPQvSbFPetjTaEFF6+l1IOPLowQ=
X-Received: by 2002:a9d:323:: with SMTP id 32mr14718568otv.352.1605036737761;
 Tue, 10 Nov 2020 11:32:17 -0800 (PST)
MIME-Version: 1.0
References: <20201110190054.20517-1-john.stultz@linaro.org> <19b7b301-3460-7ece-21d3-59cd7490c8ed@codeaurora.org>
In-Reply-To: <19b7b301-3460-7ece-21d3-59cd7490c8ed@codeaurora.org>
From:   John Stultz <john.stultz@linaro.org>
Date:   Tue, 10 Nov 2020 11:32:06 -0800
Message-ID: <CALAqxLWQua4UWwXomOin5OdizevvY2F=rMExyDbB3o8h5F731Q@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: Fix msm9853 Kconfig entry to depend on,
 not select PINCTRL_MSM
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Prasad Sodagudi <psodagud@codeaurora.org>,
        Vladimir Lypak <junak.pub@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 10, 2020 at 11:29 AM Jeffrey Hugo <jhugo@codeaurora.org> wrote:
>
> On 11/10/2020 12:00 PM, John Stultz wrote:
> > One fixup following my patch commit be117ca32261 ("pinctrl:
> > qcom: Kconfig: Rework PINCTRL_MSM to be a depenency rather then
> > a selected config") being queued in LinusW's tree, as a new
> > config entry was added for the msm9853 that also needs the
> > change.
> >
> > Applies to LinusW's pinctrl devel tree.
> >
> > Cc: Andy Gross <agross@kernel.org>
> > Cc: Prasad Sodagudi <psodagud@codeaurora.org>
> > Cc: Vladimir Lypak <junak.pub@gmail.com>
> > Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Cc: linux-arm-msm@vger.kernel.org
> > Cc: linux-gpio@vger.kernel.org
> > Signed-off-by: John Stultz <john.stultz@linaro.org>
> > ---
> >   drivers/pinctrl/qcom/Kconfig | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
> > index 8bdf878fe970c..cf56e029cd9c7 100644
> > --- a/drivers/pinctrl/qcom/Kconfig
> > +++ b/drivers/pinctrl/qcom/Kconfig
> > @@ -115,7 +115,7 @@ config PINCTRL_MSM8916
> >   config PINCTRL_MSM8953
> >       tristate "Qualcomm 8953 pin controller driver"
> >       depends on GPIOLIB && OF
> > -     select PINCTRL_MSM
> > +     depends on PINCTRL_MSM
> >       help
> >         This is the pinctrl, pinmux, pinconf and gpiolib driver for the
> >         Qualcomm TLMM block found on the Qualcomm MSM8953 platform.
> >
>
> Subject should indicate msm8953, no?
>

Sorry, I'm confused. :)
The subject is "pinctrl: qcom: Fix msm9853 Kconfig..." is there
something more specific you are suggesting?

thanks
-john
