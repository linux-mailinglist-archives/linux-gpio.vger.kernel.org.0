Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E0715446E9
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jun 2022 11:09:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236374AbiFIJJM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Jun 2022 05:09:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239571AbiFIJJL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Jun 2022 05:09:11 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 154C315FC8
        for <linux-gpio@vger.kernel.org>; Thu,  9 Jun 2022 02:09:10 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id c2so30293605edf.5
        for <linux-gpio@vger.kernel.org>; Thu, 09 Jun 2022 02:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Rc/IVAYtJjH6VEt/sT804T87WPLCNxf0Mur+KBOsrrA=;
        b=qMm7Y+hX17A+Slvn3vf/S+NyPGP4MwTBSDb2ARZsyHqNkkluMmvv0/EuQhyRsSBKf0
         ZY1l/aqwHUZ6uW2KU21yrFVNum2rDvniI+xPDnE+/Ho0iefkGnCvJ8hs9ocptTyOsQWe
         0tEYZNANMhQsEn6jVgVU6SlaaXSnMnamV/k+60L7UZ+haailexskgo4tcRkIfloJVLyR
         6+/9OlmeMbhBjgsfCvgN7b1HskU6jgd/bV8JOXXCjxorTuLP7qAehM5kRKzT1ceoWrVl
         vYshbOPGOYcgYYeXVCwwf/ZZxEUyyrwtMSF4ms9sybkyV+JcrrDa8LB/FpBy1jYIiE74
         ZiRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Rc/IVAYtJjH6VEt/sT804T87WPLCNxf0Mur+KBOsrrA=;
        b=2lTw955A6BHP5PiJnLz+FI5xFu9j2ecKNmlAnkj8VUx2i6pJ9zSvmGOteph+OfQ/1a
         V/+TPNMy1hLGx0T0NSzijUw/AqbsvE+LdyqSa8MJ0lQWJw4YoLDlvls63L9CJ9XQdY9M
         ng/4LNlb/6iJG1Jkt9PXqpBbed1+iU8BMvfDra68mj9BbuNAu6in9ZmknOhHEvP6v3v/
         9VaFpg2oDAG93XSG+i6N6Sh55ME/Fr1e7hM2HDcVZcdKiNq/MHYeTjbLApb2dHjmD8EG
         cmffx2cFx0cISTbRzVxGVPYEd3GKnOVIYOGERE26swZBk8tvwDeqT4KCepvlxDufuU+x
         scDw==
X-Gm-Message-State: AOAM530Zr9aivN7H9fGNAK4M/EGpzq7VX0M6t1aXa62wBIfyewp+ywa9
        Isu24DWN1GYgTk+yfxky6PJKXPCd/cY0EF5nHIVP3ku41s0=
X-Google-Smtp-Source: ABdhPJwE7o3zRPVs4NVcmYf7aMvFsSjwUpXAzT14UbhpTS9dBXo7wMroEDF839+Tc6h2dTz5MSFpgbGuzb601zlIX2w=
X-Received: by 2002:a05:6402:4408:b0:42d:dc8d:a081 with SMTP id
 y8-20020a056402440800b0042ddc8da081mr43991325eda.69.1654765748582; Thu, 09
 Jun 2022 02:09:08 -0700 (PDT)
MIME-Version: 1.0
References: <YqCToAlhcjNNS+67@smile.fi.intel.com>
In-Reply-To: <YqCToAlhcjNNS+67@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 9 Jun 2022 11:08:58 +0200
Message-ID: <CAMRc=MeMvAv1vLCKUnYAHDtewXdUd=KNs7Dq8vi3LyjimVrY5A@mail.gmail.com>
Subject: Re: [GIT PULL] intel-gpio for 5.19-2
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linux GPIO <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 8, 2022 at 2:18 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Hi Linux GPIO  maintainers,
>
> Converting IRQ chip to be immutable in Intel GPIO drivers, this is for current,
> i.e. v5.19-rcX, cycle. Please pull.
>
> Thanks,
>
> With Best Regards,
> Andy Shevchenko
>
> The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:
>
>   Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)
>
> are available in the Git repository at:
>
>   git@gitolite.kernel.org:pub/scm/linux/kernel/git/andy/linux-gpio-intel.git tags/intel-gpio-v5.19-2

Pulled into fixes but please use the regular url, not the gitolite one.

Bart

>
> for you to fetch changes up to b93a8b2c5161696e732185311d309e0aaf0575be:
>
>   gpio: dln2: make irq_chip immutable (2022-06-06 14:09:16 +0300)
>
> ----------------------------------------------------------------
> intel-gpio for v5.19-2
>
> * Convert IRQ chips in Diolan and Intel GPIO drivers to be immutable
>
> The following is an automated git shortlog grouped by driver:
>
> crystalcove:
>  -  Join function declarations and long lines
>  -  Use specific type and API for IRQ number
>  -  make irq_chip immutable
>
> dln2:
>  -  make irq_chip immutable
>
> merrifield:
>  -  make irq_chip immutable
>
> sch:
>  -  make irq_chip immutable
>
> wcove:
>  -  make irq_chip immutable
>
> ----------------------------------------------------------------
> Andy Shevchenko (7):
>       gpio: crystalcove: make irq_chip immutable
>       gpio: crystalcove: Use specific type and API for IRQ number
>       gpio: crystalcove: Join function declarations and long lines
>       gpio: wcove: make irq_chip immutable
>       gpio: merrifield: make irq_chip immutable
>       gpio: sch: make irq_chip immutable
>       gpio: dln2: make irq_chip immutable
>
>  drivers/gpio/gpio-crystalcove.c | 70 ++++++++++++++++++++++-------------------
>  drivers/gpio/gpio-dln2.c        | 23 ++++++++------
>  drivers/gpio/gpio-merrifield.c  | 22 ++++++++-----
>  drivers/gpio/gpio-sch.c         | 35 +++++++++++++--------
>  drivers/gpio/gpio-wcove.c       | 10 ++++--
>  5 files changed, 96 insertions(+), 64 deletions(-)
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
