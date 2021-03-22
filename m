Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DEDD34439C
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Mar 2021 13:55:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232429AbhCVMxJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Mar 2021 08:53:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230185AbhCVMtk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Mar 2021 08:49:40 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FC12C061762
        for <linux-gpio@vger.kernel.org>; Mon, 22 Mar 2021 05:49:39 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id a1so20896850ljp.2
        for <linux-gpio@vger.kernel.org>; Mon, 22 Mar 2021 05:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tPIYcJzHi1a1N5X3L1/zW5t2P1h4j5EQPOmhn3qmkOg=;
        b=TRTabGa0rERvZ0TpbH+0alUkFgvkJ49pXLsQ2LnDAjh8Pzj8i5Hwy1kMHEq5Ozubxc
         cLiPFtvbjG3BmPzb70bc4q+pQZIF0SAEtNWa647r9ld1CFUqv8MyBfPy2JksrIhDk6tP
         /EDjixfDYF+GbfM4tmWW8rSQmjJMaPXCNfwDOQN8H2fbM7rlYQE14F51drGJcebk5Fvo
         Rvq7q5ePdeMAlYyEAUiY+asTgrNcJrkb0jkmpRMqZ3wg7rEEFJyzDg7SyWyCc8mqiLES
         mEy5MGReW+gFyTZmPwLONGKDyfdVEzxSELoBPjuu2EqgGd2wiHmwFuCGS2x5QTOtCLGv
         RFVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tPIYcJzHi1a1N5X3L1/zW5t2P1h4j5EQPOmhn3qmkOg=;
        b=ZU1QukVy3CkAZtsF/Ek+wOVikkYpS6zd8jJWbZAwqIMqqK3e7EfgFsNgtQNOMPT2F3
         Jz9hj6swaXwoPPbgggAm/aRDJC3sntPzqm6RUPbd4oVDALtezCtV22EBp04I2xD8+ZkO
         Y+ApDKbodS0hOZcm3lGi8UX2EyVLr8LW6Iu6eYKGVK2h/AibfouT3cLs29sdn+zEnztO
         vh3BPlO/OTsdS7sSGw/ie+0mGWUwEW7u4lAQd/vrFaid8cuWny9pqxSaIaTmcgLtOu7C
         oRS1HrdvP/9Tccs6fvXW4Zu6Wrm/u7E+MRdY6O1ALf70HwxtbEMRiG1azTMeVne4jh3o
         scUA==
X-Gm-Message-State: AOAM533BNvo6m2QwecdZEUIJrfn4Le0KFRtIcSkkOZYJsYhRsJVkIOne
        OFiaXAv0XTqXdO2XVqGh47kxwTi+KJwwZ7dGBnItiWtjx1LrSWC204U=
X-Google-Smtp-Source: ABdhPJxs+OJWuuZFV/t2j8mBrdRCzSpexvxk+SYearRtjG1b8AE0lga0xxKn+LUQbdIaMqTEqT+d0gLYlZrjDIpYhPs=
X-Received: by 2002:a05:651c:103a:: with SMTP id w26mr9546111ljm.273.1616417377642;
 Mon, 22 Mar 2021 05:49:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210317155919.41450-1-alexander.sverdlin@nokia.com>
 <20210317155919.41450-2-alexander.sverdlin@nokia.com> <CACRpkdbnc2UHM8w85DjsoMKoim-pSX7-7c2YOUnUDdthNc9Vpw@mail.gmail.com>
 <5a163661-ec37-c8d0-24ce-440336e32c33@nokia.com> <CACRpkdYoK03nYRYCHS-0Fj=i3pTuN1-EyrVW2jaG92AyVogYJw@mail.gmail.com>
 <ee619663-80e7-f6c0-9f73-d3ff7438773f@nokia.com> <CACRpkdYnxfb1wQDxpLOs7H9-3cTm+dtQRpNxmQBGLce_TYwOCg@mail.gmail.com>
 <CACRpkdZn9EHTH+MJtph3MUF1WxuTZzbTqRmtec=XgVUoy5VZsg@mail.gmail.com> <1de688c3-1014-2e29-ecb9-09cff4d52d95@nokia.com>
In-Reply-To: <1de688c3-1014-2e29-ecb9-09cff4d52d95@nokia.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 22 Mar 2021 13:49:26 +0100
Message-ID: <CACRpkdamDOtf3qQG2CHjSV5CpkVPVzQD32uG8=zRiA=93E-7XA@mail.gmail.com>
Subject: Re: [PATCH] gpio: pl061: Support implementations without GPIOINTR line
To:     Alexander Sverdlin <alexander.sverdlin@nokia.com>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Marc Zyngier <maz@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 22, 2021 at 1:36 PM Alexander Sverdlin
<alexander.sverdlin@nokia.com> wrote:

> > One way would be to stack more compatible strings:
> >
> > compatible = "lsi,axm5516-primary-gpio", "arm,pl061", "arm,primecell";
> >
> > Going from more to less specific. We see that this is a
> > PL061 and that it is a primecell, but we also see that
> > it is a version specifically integrated into the axm5516.
>
> The problem is, it's not the only SoC with this "issue".
> AXM56xx and AXC67xx will follow, and these "hardcoded offsets"
> will be different. We are not going to add a compatible for
> PL061 per SoC, are we?

Why not? If the hardware is not 100% compatible due to
misc factors, then it needs special compatible strings.

See for example:
Documentation/devicetree/bindings/interrupt-controller/arm,gic.yaml
  compatible:
    oneOf:
      - items:
          - enum:
              - arm,arm11mp-gic
              - arm,cortex-a15-gic
              - arm,cortex-a7-gic
              - arm,cortex-a5-gic
              - arm,cortex-a9-gic
              - arm,eb11mp-gic
              - arm,gic-400
              - arm,pl390
              - arm,tc11mp-gic
              - qcom,msm-8660-qgic
              - qcom,msm-qgic2

> Well, you can always merge v1:
> https://lore.kernel.org/linux-gpio/20170222123049.17588-1-alexander.sverdlin@nokia.com/

The new patch (using the hierarchical IRQ chip) is much
better so no need to revert to that. The only remaining question
is really how we obtain the hardware offsets, whether they way
you do it in your patch (and which also happen to agree
with the existing bindings) or another way using a lot of
compatible strings.

Yours,
Linus Walleij
