Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 775E851B03B
	for <lists+linux-gpio@lfdr.de>; Wed,  4 May 2022 23:17:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357423AbiEDVU6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 May 2022 17:20:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357448AbiEDVU5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 May 2022 17:20:57 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 740814C7BE
        for <linux-gpio@vger.kernel.org>; Wed,  4 May 2022 14:17:20 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id w187so4576719ybe.2
        for <linux-gpio@vger.kernel.org>; Wed, 04 May 2022 14:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Cubx0T4b84/s4qGZu+cq3otZVlJ+cjcrzVHI5T7uJoU=;
        b=r68CgTY+ckJqWEVDSWW2VJiHoQPXGhNjpSNc5921/Er4HMVt+duADEAxSRXYLpK9h4
         1bBZk/5YlofBR9bVtPGvZnozpPf8L63FT33SQV97e9pIgx0CB7h+gSW6t1A1UbJGQ2MN
         T/rXRmqmcGA9FbC1E6h/yf5iABYTiSS5khUGhF68cVKBsNWQ7PNLUGVO/s9OYQ0WsFl2
         1ZpyHsCewhDVjYemkPAP9RI1FNJ9BBO4Uo9SU9ELYBkwlpfefUmNJvrIyJuS3YEY6F2w
         OOQ+W9TmRjakDJnee9ZbkEsjs1QIcN8L8bAmmADaJPCxnqqOsu32IXuBVRO2ttru5XVN
         AKlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Cubx0T4b84/s4qGZu+cq3otZVlJ+cjcrzVHI5T7uJoU=;
        b=S6HjpDjXzpS8L/0gk4CE/5wRB5iEGUfK28ZQmoeDfDJR/jbmux+hm2nB/S1BRwAw60
         kioJ1M28uTwTueuOA50HIMMoX6c5pKolt+Cqgf5adYo+MK808uolgAxLsSViNLb8jByI
         BRCy27B7MhrwS5QNvK2B+UZVegdN/ZAgEO+VpdHbpfLbx8CgM2I7WXzC1Kgi003/K20+
         uIrrmfDF9Mkbu1ak2nRafNtAaY+R/ZL2QNNFbvunUl0Q6Yp56LaRHL1D247brqK+3heL
         DBwnWBiEjEeeBtjdJWZKzj5BXEAaiVeh0Xp5QScgGsmKSk/AkB+e0PFfg+1eK9AMv2FX
         fBKA==
X-Gm-Message-State: AOAM531D5H9eBm2s182/f0WylzNAxXpzKt3dK/PssYZaS/u4mH31jUTT
        ZDtEPcNEvC4tSssu4MiNlJa2tcVOZBpVtVxw/32eAwqkW6k=
X-Google-Smtp-Source: ABdhPJwWCrMiKTBi/o3yi0ZclSRjozzu3LMmeNOsrH8z19d94B3HWAgzO1cAvf+W8ImK05RH8gWKXROmgLbsRr1sQwg=
X-Received: by 2002:a25:e684:0:b0:645:d429:78e9 with SMTP id
 d126-20020a25e684000000b00645d42978e9mr19846905ybh.369.1651699039696; Wed, 04
 May 2022 14:17:19 -0700 (PDT)
MIME-Version: 1.0
References: <YmwuK60FMGR2Kn0R@smile.fi.intel.com>
In-Reply-To: <YmwuK60FMGR2Kn0R@smile.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 4 May 2022 23:17:08 +0200
Message-ID: <CACRpkdYB3NSNuzh9JTBjWQDHoTn=v9WBBS-rfrOMH8RPL8NRLA@mail.gmail.com>
Subject: Re: [GIT PULL] intel-gpio for 5.19-1
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linux GPIO <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Apr 29, 2022 at 8:28 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Supposed to be an immutable tag to be included in GPIO and pin control subsystems.
> Have been in Linux Next for a while w.o. any issues reported. Please, pull.

Pulled into pinctrl as well, resolved the conflict by selecting your
version of the code in the stm32 driver. Please check the result!

Yours,
Linus Walleij
