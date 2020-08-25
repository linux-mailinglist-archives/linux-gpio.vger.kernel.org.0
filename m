Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1AD1251651
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Aug 2020 12:13:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729710AbgHYKM4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 Aug 2020 06:12:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729637AbgHYKMx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Aug 2020 06:12:53 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90A13C0613ED
        for <linux-gpio@vger.kernel.org>; Tue, 25 Aug 2020 03:12:53 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id z18so1000540pjr.2
        for <linux-gpio@vger.kernel.org>; Tue, 25 Aug 2020 03:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=xX92bPOZbt3/grqwTKQZiCyjmq/ugCoByLBgnfdVMK8=;
        b=lPmqMD62bB1Et2NxkmsOc1EqYJlMVHNWvAEVBzcQm65gRI7GM5R46BGVsZI38rmiUV
         mQbj8fl/c7J5NjdD1LouPoCgMvGoYMWR0LHBE1y3yF2D6oeP/jIqGXgBHSekwFbvA6DH
         tmIoMtqz5McC5FiU2nAFmb08gCOrNsr0oKNqw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=xX92bPOZbt3/grqwTKQZiCyjmq/ugCoByLBgnfdVMK8=;
        b=KcNvF8WU7qVEqprIFCOJFQoCrHF2CxqHj5q4oNjiiB2p5m2lfLU14SpKlGiNrFKysL
         4/Idle/pb/CUJNB2lWt8+t/i6PfGDmN1mCib3rpHPehgnhH+U28m0e3UKZwf38KFdRA7
         6C32O6fz5FvzgqnDeu+XzSLZCu9LLClI/CDR6K1i2TtVLe1h1989FB9A5dnudKPC8bgb
         R/Sl6j9iG8xh2DWRL6ClZYQMcWVGngo4/J77iRVPOlMjBSvEs4V8TN7SxqTZb/hDN2OX
         JuNqxjEi2n3W6xbZNb9/W1v724qLvD0z+pMWOGKiY7HZhabHYz7BvnwGMujRdsokO4v5
         0dAg==
X-Gm-Message-State: AOAM5327fE4/eX0cBvjfAgeRQ1RCVj44eTrRbDc2DfZMUfV8VBRVVUw8
        6Egt2+FK44gNJgOhKkkJC9ql1A==
X-Google-Smtp-Source: ABdhPJyg9MRRE/KTmNzcehHxAuIdSqEP6EHaiy2FfEv0vFEPLIHznTGG3PbB6dlvh6g/ERU1vFrAog==
X-Received: by 2002:a17:90a:b904:: with SMTP id p4mr736867pjr.130.1598350372001;
        Tue, 25 Aug 2020 03:12:52 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id r16sm2511206pfq.173.2020.08.25.03.12.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2020 03:12:51 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1598113021-4149-4-git-send-email-mkshah@codeaurora.org>
References: <1598113021-4149-1-git-send-email-mkshah@codeaurora.org> <1598113021-4149-4-git-send-email-mkshah@codeaurora.org>
Subject: Re: [PATCH v5 3/6] genirq/PM: Introduce IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND flag
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, agross@kernel.org, tglx@linutronix.de,
        jason@lakedaemon.net, dianders@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org,
        Maulik Shah <mkshah@codeaurora.org>
To:     Maulik Shah <mkshah@codeaurora.org>, bjorn.andersson@linaro.org,
        evgreen@chromium.org, linus.walleij@linaro.org, maz@kernel.org,
        mka@chromium.org
Date:   Tue, 25 Aug 2020 03:12:49 -0700
Message-ID: <159835036999.334488.14725849347753031927@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting Maulik Shah (2020-08-22 09:16:58)
> diff --git a/kernel/irq/pm.c b/kernel/irq/pm.c
> index c6c7e18..2cc800b 100644
> --- a/kernel/irq/pm.c
> +++ b/kernel/irq/pm.c
> @@ -69,12 +69,17 @@ void irq_pm_remove_action(struct irq_desc *desc, stru=
ct irqaction *action)
> =20
>  static bool suspend_device_irq(struct irq_desc *desc)
>  {
> +       unsigned long chipflags =3D irq_desc_get_chip(desc)->flags;
> +
>         if (!desc->action || irq_desc_is_chained(desc) ||
>             desc->no_suspend_depth)
>                 return false;
> =20
>         if (irqd_is_wakeup_set(&desc->irq_data)) {
>                 irqd_set(&desc->irq_data, IRQD_WAKEUP_ARMED);
> +
> +               if (chipflags & IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND)
> +                       irq_enable(desc);

Where is the corresponding change to resume_irq()? Don't we need to
disable an irq if it was disabled on suspend and forcibly enabled here?

>                 /*
>                  * We return true here to force the caller to issue
>                  * synchronize_irq(). We need to make sure that the
> @@ -93,7 +98,7 @@ static bool suspend_device_irq(struct irq_desc *desc)
>          * chip level. The chip implementation indicates that with
>          * IRQCHIP_MASK_ON_SUSPEND.
>          */
> -       if (irq_desc_get_chip(desc)->flags & IRQCHIP_MASK_ON_SUSPEND)
> +       if (chipflags & IRQCHIP_MASK_ON_SUSPEND)
>                 mask_irq(desc);
>         return true;
>  }
