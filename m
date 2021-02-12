Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBB01319AE3
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Feb 2021 08:54:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229946AbhBLHvk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Feb 2021 02:51:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229922AbhBLHvg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 12 Feb 2021 02:51:36 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E26CC0613D6
        for <linux-gpio@vger.kernel.org>; Thu, 11 Feb 2021 23:50:56 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id v30so11503249lfq.6
        for <linux-gpio@vger.kernel.org>; Thu, 11 Feb 2021 23:50:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IcYBOTOTtM/fD05ORuEKGods9zXoh8CDnQEGXlPlh3I=;
        b=fxgD7GASpgLTqeJwS4fg2RtRYUKSrlc8VbpU+zoaKG0lW2Jj29H6n/7ucLhDYUJUfb
         SeLrXVIOWrpjE7OaWUROE1ZRbBL/mHf5ygAM+6wuzIAOUd4MPde2tV5l6EGNxtvCF201
         o10gLbViG4Xj+CRCJvC/GZWhUm2c4EiNErY3ZZymU7ltFtEEqgC5bIp6YF0sll+hONWo
         6afIB7EeH9Dzp8usBzft0rPwY2Tvi1Ro/I0wjQKyftc2XiJy5B4Qdz/IxA32StXOqsvt
         tOeQkP3g3K4vZSXWCXHE4K0tQLnFq4uGMdli1Ck7CqgWPIt5Bg5K+61IwYu9ZeMwLn5C
         seAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IcYBOTOTtM/fD05ORuEKGods9zXoh8CDnQEGXlPlh3I=;
        b=oVZGaPvdvibPGZIwO6T3AHbLvDnEDGHNgC2fGqs1TIY+WY6aNj6f0+QpVeEIl4mRg/
         WOuhr7Sw2xjhyn7envocBD5vLvY1VCGR2oO8Xxk7wN6AUAH8g3wcqm3PiYilYPeGh70i
         RrRP84Kzg5d20UzqJj3x5OkDqBhguNLWUsJBsFmmebkP9gzHihrV2ZEGLGZQSv0NLg1E
         h6uoYtlwlXUjqCdje2TBbIFPsBzd0MoP8bTIKcBACltSpA8ZolCmP4/1QQWtjguk1U+r
         iS7CJvWPJNcUzyKeJo3KJkEcMz2LSPHb75dkBKK4CNRcOZ4Z5GiJh2GGwmRkOdo0qsR5
         kBXQ==
X-Gm-Message-State: AOAM533WEXbE2ezzFEg0HcXw8y5govTLkM6Nqev6OgJim6jlDA1qIUzA
        hHEs9jhR8mtp44irVv7YX/lRjzan5GdOc0gYzcpn6Q==
X-Google-Smtp-Source: ABdhPJy6hy0DafG+RP/hCnhT3D81OmDjB4+p69zTidYbeLYX6fKxq6ptiW7znBA9tupHQJ/1Y90M1Is2a5r+DyQAAu0=
X-Received: by 2002:a19:6b06:: with SMTP id d6mr1005706lfa.29.1613116254456;
 Thu, 11 Feb 2021 23:50:54 -0800 (PST)
MIME-Version: 1.0
References: <20210205140132.274242-1-vkoul@kernel.org>
In-Reply-To: <20210205140132.274242-1-vkoul@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 12 Feb 2021 08:50:43 +0100
Message-ID: <CACRpkdY393_LUDUQxVuv9JEY=hkkfs=u2OziwzxZsL52QxqusA@mail.gmail.com>
Subject: Re: [PATCH v6 0/2] pinctrl: qcom: Add SM8350 pinctrl support
To:     Vinod Koul <vkoul@kernel.org>
Cc:     MSM <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Feb 5, 2021 at 3:01 PM Vinod Koul <vkoul@kernel.org> wrote:

> This adds binding and driver for TLMM block found in SM8350 SoC
>
> The binding is dependent on TLMM common binding from Bjorn:
>  https://lore.kernel.org/linux-arm-msm/20210126042650.1725176-1-bjorn.andersson@linaro.org
>
> Changes in v6:
>  - Add rob and bjorn r-b
>  - removed quotes around 'defs' and drop the phandle for binding

Patches applied!

Thanks!
Linus Walleij
