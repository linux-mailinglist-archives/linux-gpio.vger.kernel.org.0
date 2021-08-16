Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B4393EDF0D
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Aug 2021 23:08:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233165AbhHPVIo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Aug 2021 17:08:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231938AbhHPVIo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Aug 2021 17:08:44 -0400
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com [IPv6:2607:f8b0:4864:20::c32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 656A8C0613C1
        for <linux-gpio@vger.kernel.org>; Mon, 16 Aug 2021 14:08:12 -0700 (PDT)
Received: by mail-oo1-xc32.google.com with SMTP id w13-20020a4ad02d0000b029028b14dc4d2dso3024857oor.6
        for <linux-gpio@vger.kernel.org>; Mon, 16 Aug 2021 14:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=DhhEi9REryF7Euqq+T5kr4qdAnwWtXdUixXZ+suk4Bc=;
        b=ZFFABO/zVDWWQmLLx0RAO6ybYuaWOdMI8nfvqWkZjHWT8a6efPqOopO3FP63sz7FCF
         euRekIkxlsBrNPkbbInMLWEp5RUGKhseciWZxhfOUiN7ek051Qryieqvixa9QRfxErmP
         fGQRczUdjxKv75kS7gpw4JjRovjWd6GJIh454=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=DhhEi9REryF7Euqq+T5kr4qdAnwWtXdUixXZ+suk4Bc=;
        b=T7OXScde/Q2c5zj0EolP/N6+7e/YHgF0ykc7/6sVIu5l9gcWSoy2+5rkRTjrdzGTwg
         5HQTlfUFdO7/bYUl3xMlEN4WLBz8QtUmhVS9l9XSw1YZDU44FZpOvXsyxw/NLbJxl/CN
         NrgSCNbTimpQCHPl82QkUuE0XF3631bOln6DF21kJP0ZyyuuKygtZV2QQCS4vx6mDq7c
         Pjmd1ivQ7exhpDywEmwKnKcMps+9M10lxYLKIDkX/FvUdbRG4ZIdUkLzV8go7/2KdYGF
         w8oZ3QVEcwBcBpB13ig4B1MdYTuUWg7ud3W+/Y+xjbdTNSVU/xmN+Jq+wKsLZ5Biif3v
         vCpw==
X-Gm-Message-State: AOAM532Q6YMh/F27AIr+OqToMR5J8dLitp4rtI85y/B2nMw0+0BfJ2FT
        eJv9x2ts7NA9cPFQOekYZzwXXHl9Cmof5AP6r2oU8g==
X-Google-Smtp-Source: ABdhPJwkW0aWkQ3eA/CgUBtD3vfjlQxS+WPjQ68YkWRc3r79J/uwSbmFY0qfQ58wr1VReoLjN/jo6yEDlFehMe1Pnb0=
X-Received: by 2002:a4a:3651:: with SMTP id p17mr191016ooe.92.1629148091816;
 Mon, 16 Aug 2021 14:08:11 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 16 Aug 2021 14:08:11 -0700
MIME-Version: 1.0
In-Reply-To: <4af8171aefd6f0387438225666ec1ccc@codeaurora.org>
References: <1628830531-14648-1-git-send-email-skakit@codeaurora.org>
 <1628830531-14648-2-git-send-email-skakit@codeaurora.org> <CACRpkdZteWY6X+prHeAF0rtPVbCk+X9=ZYgpjgAMH24LhOjhaQ@mail.gmail.com>
 <4af8171aefd6f0387438225666ec1ccc@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Mon, 16 Aug 2021 14:08:11 -0700
Message-ID: <CAE-0n53sR12fEa_cNPeT5eGcQVzzL57pd-tYnJbpP0NXkHMTsw@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: qcom: spmi-gpio: correct parent irqspec translation
To:     Linus Walleij <linus.walleij@linaro.org>, skakit@codeaurora.org
Cc:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        David Collins <collinsd@codeaurora.org>,
        Kiran Gunda <kgunda@codeaurora.org>,
        linux-gpio@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting skakit@codeaurora.org (2021-08-15 23:50:37)
> Hi Linus,
>
> On 2021-08-13 14:27, Linus Walleij wrote:
> > Hi Satya/David,
> >
> > nice work on identifying this bug!
> >
> > On Fri, Aug 13, 2021 at 6:56 AM satya priya <skakit@codeaurora.org>
> > wrote:
> >>
> >> From: David Collins <collinsd@codeaurora.org>
> >>
> >> pmic_gpio_child_to_parent_hwirq() and
> >> gpiochip_populate_parent_fwspec_fourcell() translate a pinctrl-
> >> spmi-gpio irqspec to an SPMI controller irqspec.  When they do
> >> this, they use a fixed SPMI slave ID of 0 and a fixed GPIO
> >> peripheral offset of 0xC0 (corresponding to SPMI address 0xC000).
> >> This translation results in an incorrect irqspec for secondary
> >> PMICs that don't have a slave ID of 0 as well as for PMIC chips
> >> which have GPIO peripherals located at a base address other than
> >> 0xC000.
> >>
> >> Correct this issue by passing the slave ID of the pinctrl-spmi-
> >> gpio device's parent in the SPMI controller irqspec and by
> >> calculating the peripheral ID base from the device tree 'reg'
> >> property of the pinctrl-spmi-gpio device.
> >>
> >> Signed-off-by: David Collins <collinsd@codeaurora.org>
> >> Signed-off-by: satya priya <skakit@codeaurora.org>

Can you please add an appropriate Fixes tag?

> >
> > Is this a regression or is it fine if I just apply it for v5.15?
> > I was thinking v5.15 since it isn't yet used in device trees.
> >
>
> Without this fix, [2/2] Vol+ support is failing. If possible please
> merge it on current branch.
>

Are there any boards supported upstream that have a gpio block that
isn't at 0xc000?
