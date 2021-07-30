Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 694723DB58E
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jul 2021 10:57:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230405AbhG3I5n (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Jul 2021 04:57:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230335AbhG3I5n (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Jul 2021 04:57:43 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C733C061765
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jul 2021 01:57:39 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id m13so16434841lfg.13
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jul 2021 01:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BbdyoTmjo4sgH6v+fvXhcTfkmoK9HWI/jjK+3JUSm0w=;
        b=fLFK7YV+DviMQxdO8uQMBzWU8HyObz/hghIFJncHssQ1lUY9LhI4KxZz5GTTz+RdIT
         UUltnrEQxkSpFanFUSmrb4DNmu2QBi6BRZZGY5dCZ2ZnczDMljy2dKEkuxX40JZtkykr
         nOgtis9LG5Az1TZet9owJ2UqCbECdUdn/DoaA3LxfRxXaqnGemwmMy7HfEQjiFYC4tGo
         BEh9Kc14hfflCOkKu/eG6BlV9zSBr5Xy28IYz+KT6X40XRDHFOU5PXwapbZa2Z/ryPCo
         ad3V+Ozk9sQSYsxuU+DnGsDWWS302lx5g14Yj+ozMmyAoErSmJKeqDfRcGUj+P9Yn0Qg
         ormA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BbdyoTmjo4sgH6v+fvXhcTfkmoK9HWI/jjK+3JUSm0w=;
        b=tEDz0NBL58hKqwIruxFAlkbfrJXLIGg0K2A4MCIUqqrY2s7kBVtuwBF25JC/WgRzoo
         dTneAnOEuJBayQ7Biakv5XRLeW/yCqqzQynvD/HxLgp6voYF4sntrVicS7iDuxZRTEWe
         dmO3xtBSHps+a85AE8kkHsIOU2YFQNOX95gUV5Zzff5BxrpwbB9KfwsPfmOUBmkR4DU1
         J0gUtFo++cNv5NiLsUT+HKLDTKJq24EtDlz7PQUCaPCQfLXO+j6cdGwvrCbaW9QCo/Cb
         ttkYF3pfqe8sxcQP9YNbKLjE8KeaSexGqY2AYjak63dS5nJAx/IYlUwDZmupZ6j/hht4
         4SOg==
X-Gm-Message-State: AOAM5312K3iqXtFSGehfJ2trOrzjMLIfOX9ygZgsUF5BkTLVnVkvL8X5
        LBi+VOX4OMRQr6abWafcpsf9c7rZKRLJofelqPNk2w==
X-Google-Smtp-Source: ABdhPJzbuCiW7R2AalCAHPFUWru78tSz2+7oa6G+f6+aICiRT7MDv4vmL+cOnAxWseEMKRfWqr51bzUossdRQwKRjEU=
X-Received: by 2002:a05:6512:3696:: with SMTP id d22mr1164612lfs.586.1627635457432;
 Fri, 30 Jul 2021 01:57:37 -0700 (PDT)
MIME-Version: 1.0
References: <5B3HVQ.XR62REW2D4KQ1@ixit.cz> <R3LHVQ.51D68IW9A14U3@ixit.cz>
 <CAD=FV=XJYDE-gmN5Sq9n6GH2mr6V2o-AbUxcsHKrM_vkemU-MQ@mail.gmail.com>
 <T0BWVQ.57K5KI0VO3U71@ixit.cz> <CAD=FV=W7aGzH+VFPvCz3fPAew8MS2rsdfvz2Mg6ikP1ZCUScxQ@mail.gmail.com>
In-Reply-To: <CAD=FV=W7aGzH+VFPvCz3fPAew8MS2rsdfvz2Mg6ikP1ZCUScxQ@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 30 Jul 2021 10:57:26 +0200
Message-ID: <CACRpkdbeZrc+a91Rp9JXapTu+QpNZ_df50SZ1wdze7gXAc66Ew@mail.gmail.com>
Subject: Re: (probably) Qualcomm PM8xxx PMIC chips driver issue in 5.10+ kernel
To:     Doug Anderson <dianders@chromium.org>
Cc:     David Heidelberg <david@ixit.cz>,
        Brian Masney <masneyb@onstation.org>,
        GPIO SUBSYSTEM <linux-gpio@vger.kernel.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 8, 2021 at 12:50 AM Doug Anderson <dianders@chromium.org> wrote:
> On Wed, Jul 7, 2021 at 3:13 PM David Heidelberg <david@ixit.cz> wrote:
> >
> > thank you for your reply. Further investigation led me to the "irq:
> > Request and release resources for chained IRQs" (hack) which I used for
> > many previous kernels to avoid fatal panic (at PM8xxx dependent
> > components).
> > It seems it does not only collide with your patch, but also thanks to
> > your fix I can drop it since from 5.10.
> >
> > Only thing which remains is this warning in the place of RCU stall:
> >
> > [ 1.739567] ssbi c00000.ssbi: SSBI controller type: 'pmic-arbiter'
> > [ 1.741905] pm8xxx_probe: PMIC revision 1: F3
> > [ 1.747435] pm8xxx_probe: PMIC revision 2: 0B
> > [ 1.751786] ------------[ cut here ]------------
> > [ 1.756102] WARNING: CPU: 0 PID: 1 at drivers/gpio/gpiolib.c:3316
> > gpiochip_enable_irq+0xa4/0xa8
>
> OK, I guess this makes sense. I think this WARNING is actually what
> your HACK patch was trying to avoid. Presumably, though, the
> irq_request_resources() in your HACK patch ended up enabling the
> interrupt before the system was ready to handle it.
>
> Looking at pm8xxx_probe(), I guess it's effectively doing this:
>
> irq = platform_get_irq(pdev, 0);
> ...
> irq_set_chained_handler_and_data(irq, data->irq_handler, chip);
>
> ...and the IRQ is actually a GPIO. I guess nowhere in there is the
> interrupt actually requested. I'm actually a little surprised that it
> works but I'm certainly no expert.

I made this alternative solution to the problem but haven't had time to
test it on my board (APQ8060):
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git/commit/?h=apq8060-proper-pm8xxx-irq-path

Yours,
Linus Walleij
