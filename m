Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71F6050E870
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Apr 2022 20:41:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244491AbiDYSog (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 Apr 2022 14:44:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244485AbiDYSod (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 Apr 2022 14:44:33 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38F772316C
        for <linux-gpio@vger.kernel.org>; Mon, 25 Apr 2022 11:41:26 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id y3so10992733ejo.12
        for <linux-gpio@vger.kernel.org>; Mon, 25 Apr 2022 11:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Mya3nkIwUh+TIu4djYFcQK6BbUW1zaOYt4akasWqvFg=;
        b=B9KKXsLTpzuVV8sBlKnNNvWObeafflqmJvR/smeZgdhpHe7uFZ496oEr1jZfzXMymA
         pVVpZlQzDspkhMyYyU2BEn3cLLzy+4K1AJIP8KNuHHK2F4+OXzHT0Lx4MAnyADwSC2fz
         C3xXlkkJaCxNbA2z0qwrIsYi0VRxXQVfQNb4GKBP2wWkiow6GzhhujMirqo82yf2GMd/
         sS9eWHmKe84vW/wgDaguhMBHbRRg6rKcnOyzyk/LMSi+TOaBqwwqq8KAdCli/3p2a2Tp
         LEvpc51OZYXOjxQlQEjLMcq9Lpjbv+8TlCYiyAzWWCKDPD+dZI8GzuCtdxJwpd8joV6j
         Wcaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Mya3nkIwUh+TIu4djYFcQK6BbUW1zaOYt4akasWqvFg=;
        b=649tt29L9F6E5PtWOVK8dsOGB05I8fEoKLhauTyHcTQ0DwcW/0QddN8uA7o19wsMMp
         kf0k3OHeqcHRdestOP7F8oLjCMmL8gN4GLfyaD1O4YVCOyVg2lsz3vn7AE1UUmTEPRx5
         fvMBUtvNLfQEtP+CWKBZUZhsy2oKuhGuf17iU3I7ThtstULxdK6tbcBBP0Tr/7gtukKV
         HkRvXaoAXTMcf141x6B+H95KD62BsiSBNRJx/rGzHj3etCKF1FDZ4b9893neYodb6kAq
         EUET/zkC/EZbaf2FYUHiysXNn4Aj46MGHt3wmhBEQ0MACfhAHL7cCZ1VqBXEfRwYHy2H
         2+tw==
X-Gm-Message-State: AOAM532k04TRlSGl4lzzv4WISsJhMWG55p4t36TFJrgpcyKudP9zVq4o
        K9OpRQmRsAj3OiyDmBrX40p4YD2tWzlVuSkl12VJCQ==
X-Google-Smtp-Source: ABdhPJxxi69r7JPs9NcrUSZVx/mya0DVWjV7GHPAed3DI2n08j+lZIdXYcnh6dMilSxNEph0K4PXbEgKFunxQP6p+cs=
X-Received: by 2002:a17:907:6d94:b0:6e8:c309:9923 with SMTP id
 sb20-20020a1709076d9400b006e8c3099923mr17335243ejc.101.1650912084719; Mon, 25
 Apr 2022 11:41:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220422131452.20757-1-mario.limonciello@amd.com>
In-Reply-To: <20220422131452.20757-1-mario.limonciello@amd.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 25 Apr 2022 20:41:14 +0200
Message-ID: <CAMRc=Mf7FVN4QeAEdap_JzKmTy6i0A=BbcCZtCCQhzocg4PDfg@mail.gmail.com>
Subject: Re: [PATCH v2 0/1] Fix regression in 5.18 for GPIO
To:     Mario Limonciello <mario.limonciello@amd.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Natikar Basavaraj <Basavaraj.Natikar@amd.com>,
        Gong Richard <Richard.Gong@amd.com>,
        regressions@lists.linux.dev,
        Thorsten Leemhuis <regressions@leemhuis.info>,
        Greg KH <gregkh@linuxfoundation.org>,
        stable <stable@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Shreeya Patel <shreeya.patel@collabora.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Apr 22, 2022 at 3:15 PM Mario Limonciello
<mario.limonciello@amd.com> wrote:
>
> Linus,
>
> This patch is being sent directly to you because there has been
> a regression in 5.18 that I identified and sent a fix up that has been
> reviewed/tested/acked for nearly a week but the current subsystem
> maintainer (Bartosz) hasn't picked it up to send to you.
>

Hi Mario!

I don't have any previous submission in my inbox. Are you sure to have
used my current address (brgl@bgdev.pl)?

Bart

> It's a severe problem; anyone who hits it:
> 1) Power button doesn't work anymore
> 2) Can't resume their laptop from S3 or s2idle
>
> Because the original patch was cc stable@, it landed in stable releases
> and has been breaking people left and right as distros track the stable
> channels.  The patch is well tested. Would you please consider to pick
> this up directly to fix that regression?
>
> Thanks,
>
> Mario Limonciello (1):
>   gpio: Request interrupts after IRQ is initialized
>
>  drivers/gpio/gpiolib.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> --
> 2.34.1
>
