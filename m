Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5FC9F5272E3
	for <lists+linux-gpio@lfdr.de>; Sat, 14 May 2022 18:26:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230469AbiENQ0y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 14 May 2022 12:26:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231540AbiENQ0x (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 14 May 2022 12:26:53 -0400
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C6282CE2C
        for <linux-gpio@vger.kernel.org>; Sat, 14 May 2022 09:26:50 -0700 (PDT)
Received: by mail-yb1-xb2f.google.com with SMTP id x74so7600589ybe.4
        for <linux-gpio@vger.kernel.org>; Sat, 14 May 2022 09:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uAAN2W54G48k9hRqje/cdaPTrbIW4YAQoF/hPdMAfD4=;
        b=NgAhjgFHi90HV2GORZIQ4dktxh+umurffW9MJr9ugCzFo3AOyZIR0rtZtnqis+BXgt
         9/PWQLorLuUj5ssBcR9dpOyZVGb5tVBRVn5WtjTfhxWqd0b+/Aps6LaqJmS0T96MyoSi
         fNKs2ZaugB33/LC0VPxjyXgzry5NFeye6XHzsnc07WCW3mwLf+UlSSwm9QdH9tC6jMSI
         +jLlBGIvB68JmdxHLvk32ZBmv+Z2TfWXLUWmS5rSP+Ml5vLcXb+/VQ5/XxS+ihnLXUK9
         gVCTZ1T8qJDhNpUYxKMUYjO7VCU7hqJDBTcngG8EixlAiT8Q5vWGETNept85pD/VbnN3
         QZfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uAAN2W54G48k9hRqje/cdaPTrbIW4YAQoF/hPdMAfD4=;
        b=HkSfmSLW8pQ5PF/VhLSfuYk8Crelr1m9VfWOQwOcvO7jY5AqlR0S9PQ+f50G28XEeG
         Lb8av4bhvjhAUrFX7uQG+1YZMhu5cc0yqnkseHAPtPo4ELHcKO2swGvNLaOk5mFCCad3
         yGLWz5CeVuDNBensEF3YRl8l4CmCdLMORsk2HIhPLO6Lyl36l81sv+kfY1QQBftQIgWn
         iuQb9jtvl5thO+iE07zkPsC5TABGMhD+FGNXzXkuMrt2o3mCrRk7JzdBRs053VKwlXKW
         MsDd3XVb7lMl4+UfqaxJpmrtS3RELNd74O686XmbsqVSLIBgQDCipotjC77ZKpByPDnk
         onjA==
X-Gm-Message-State: AOAM532/Q1y/Z1+B1Ng3aPLZM7170wSKiXYD2nvqga7xuoTSLQE7hpU2
        +ED/PPaOTsTvC1I4IWQUS48TMf5bHTmFHGgctVy2Qw==
X-Google-Smtp-Source: ABdhPJw4dvOEMBqoKApaz3M52UhSyBHJuFPFbVJOsBzfkjuUCL4abpY/zc7w1I7zX/avexmLj1yiVR9myg0teR7uhb0=
X-Received: by 2002:a5b:302:0:b0:64b:a20a:fcd9 with SMTP id
 j2-20020a5b0302000000b0064ba20afcd9mr7045834ybp.492.1652545609490; Sat, 14
 May 2022 09:26:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220512162320.2213488-1-maz@kernel.org> <CACRpkdajTCS5CmQLY8hffVe1x4WzWuC_myQVGZNKV3sRzLPa=w@mail.gmail.com>
 <87r14wmmea.wl-maz@kernel.org>
In-Reply-To: <87r14wmmea.wl-maz@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 14 May 2022 18:26:38 +0200
Message-ID: <CACRpkdZ9NgATS-C0EqLVcxNf1CejwsRMV+NCCVhqrKQ=3c346A@mail.gmail.com>
Subject: Re: [PATCH] gpio: Remove dynamic allocation from populate_parent_alloc_arg()
To:     Marc Zyngier <maz@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel-team@android.com,
        Daniel Palmer <daniel@thingy.jp>,
        Romain Perier <romain.perier@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Robert Richter <rric@kernel.org>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, May 14, 2022 at 12:36 PM Marc Zyngier <maz@kernel.org> wrote:
> On Fri, 13 May 2022 22:24:40 +0100,
> Linus Walleij <linus.walleij@linaro.org> wrote:
> >
> > On Thu, May 12, 2022 at 6:23 PM Marc Zyngier <maz@kernel.org> wrote:
> >
> > > The gpiolib is unique in the way it uses intermediate fwspecs
> > > when feeding an interrupt specifier to the parent domain, as it
> > > relies on the populate_parent_alloc_arg() callback to perform
> > > a dynamic allocation.
> > >
> > > THis is pretty inefficient (we free the structure almost immediately),
> > > and the only reason this isn't a stack allocation is that our
> > > ThunderX friend uses MSIs rather than a FW-constructed structure.
> > >
> > > Let's solve it by providing a new type composed of the union
> > > of a struct irq_fwspec and a msi_info_t, which satisfies both
> > > requirements. This allows us to use a stack allocation, and we
> > > can move the handful of users to this new scheme.
> > >
> > > Also perform some additional cleanup, such as getting rid of the
> > > stub versions of the irq_domain_translate_*cell helpers, which
> > > are never used when CONFIG_IRQ_DOMAIN_HIERARCHY isn't selected.
> > >
> > > Tested on a Tegra186.
> > >
> > > Signed-off-by: Marc Zyngier <maz@kernel.org>
> > > Cc: Daniel Palmer <daniel@thingy.jp>
> > > Cc: Romain Perier <romain.perier@gmail.com>
> > > Cc: Linus Walleij <linus.walleij@linaro.org>
> > > Cc: Bartosz Golaszewski <brgl@bgdev.pl>
> > > Cc: Thierry Reding <thierry.reding@gmail.com>
> > > Cc: Jonathan Hunter <jonathanh@nvidia.com>
> > > Cc: Robert Richter <rric@kernel.org>
> > > Cc: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
> > > Cc: Andy Gross <agross@kernel.org>
> > > Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> >
> > This looks very appetizing to me but:
> >
> > drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 15 ++++-----
> >
> > This seems to have some changes to
> > ->populate_parent_alloc_arg not even in linux-next,
> > so I get confused, what are the prerequisites? (Probably
> > something I already reviewed, but...)
>
> Odd. This patch is on top of irqchip-next, which is itself already in
> -next (you got me worried and I just pulled everything to check).

I confused it with pinctrl-ssbi-gpio.c. Simple beginners mistake.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
