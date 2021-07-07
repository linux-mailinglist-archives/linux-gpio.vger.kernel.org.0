Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C1693BEB29
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Jul 2021 17:45:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231727AbhGGPr6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Jul 2021 11:47:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231665AbhGGPr6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Jul 2021 11:47:58 -0400
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com [IPv6:2607:f8b0:4864:20::f36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17BEDC061574
        for <linux-gpio@vger.kernel.org>; Wed,  7 Jul 2021 08:45:18 -0700 (PDT)
Received: by mail-qv1-xf36.google.com with SMTP id v17so1228487qvw.12
        for <linux-gpio@vger.kernel.org>; Wed, 07 Jul 2021 08:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hcfZ3j4Z8UYH3U7O2UTx/vOfKQIaPd7OV0NaRWh45wQ=;
        b=hNet0qnD7L4JyGqUpCZl05B3acF29wVC1OAIkBL56QzKyauD11IoHnUVOCWS7rqhTR
         okifC0lCN63xZj5Jjwi7qRsQYsYfp/uJJHNiLldEV5kWM6EfTKedRWS0mqGTBceAfrMO
         NEv8sXN3BUg0PxVzLzsH4/5XiFaIMYnUc6Neo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hcfZ3j4Z8UYH3U7O2UTx/vOfKQIaPd7OV0NaRWh45wQ=;
        b=oV0WR3j+GChXUNXI7UJwz/h7eSXQMzgvxZYzqDPzze3hPreMR71IqpTEbp6PNxg+gw
         evosYuO5FJ8K0siUfRioDnjFV4vTKD4pceUfw54h8Wpnf1pNRsppDw1noV4iafRWuKvq
         I0MO8WNE8vNwOMUzVVznpMf1wEXaG15r0M0n7t46VpmtTHCcMQfj1ti6yLk727DdKwlk
         1uSPv/XLW5TVpos//QvKJVgd/t0JjNT44beW9yzziSYOnKukQv4ssHpfo0iuXHVUty0/
         R3eQz5nkEA5aQz/evPET1szkDgokkQEP2BqBnLNNfHgQsrhRcar9lqDtjE9pbgNcLUvJ
         uSZg==
X-Gm-Message-State: AOAM533RvQdOznjeOegGo8n4b39a0V2GBAUxt7I7Zn/fWxSxi7XsopGs
        XwCc/kubsDJCY2/ICx0YCP0xVh4rlKSzXQ==
X-Google-Smtp-Source: ABdhPJyv9CA/NFAaESsbXk7fkuOaDhA2S8qrRq6cqPRCPWitWpoK2c2pFBFdl7bK5drAA84b++A/Pg==
X-Received: by 2002:a0c:f850:: with SMTP id g16mr24127075qvo.5.1625672717085;
        Wed, 07 Jul 2021 08:45:17 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id a20sm223831qkg.44.2021.07.07.08.45.15
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jul 2021 08:45:15 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id b13so3851377ybk.4
        for <linux-gpio@vger.kernel.org>; Wed, 07 Jul 2021 08:45:15 -0700 (PDT)
X-Received: by 2002:a25:dc50:: with SMTP id y77mr33159003ybe.405.1625672715008;
 Wed, 07 Jul 2021 08:45:15 -0700 (PDT)
MIME-Version: 1.0
References: <5B3HVQ.XR62REW2D4KQ1@ixit.cz> <R3LHVQ.51D68IW9A14U3@ixit.cz>
In-Reply-To: <R3LHVQ.51D68IW9A14U3@ixit.cz>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 7 Jul 2021 08:45:02 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XJYDE-gmN5Sq9n6GH2mr6V2o-AbUxcsHKrM_vkemU-MQ@mail.gmail.com>
Message-ID: <CAD=FV=XJYDE-gmN5Sq9n6GH2mr6V2o-AbUxcsHKrM_vkemU-MQ@mail.gmail.com>
Subject: Re: (probably) Qualcomm PM8xxx PMIC chips driver issue in 5.10+ kernel
To:     David Heidelberg <david@ixit.cz>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Brian Masney <masneyb@onstation.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On Tue, Jun 29, 2021 at 4:27 PM David Heidelberg <david@ixit.cz> wrote:
>
> I did bisection and it lead me to the commit
>
> pinctrl: qcom: Don't clear pending interrupts when enabling
> 39afef8a282b8ce63edb8d2ceb8a71e5440de059 for 5.10 (equal to
> cf9d052aa6005f1e8dfaf491d83bf37f368af69e for upstream)
>
> adding people into CC, I assume it's possible it just uncovers
> different issue, but reverting it makes 5.10.y usable.

Sorry that my change is causing problems for you! :(

If I had to guess my intuition would tell me that this is happening:

1. The bootloader on your system is leaving some GPIO interrupt
asserted but masked.

2. Some driver in your system is requesting its interrupt in its probe
call before it's actually ready for the interrupt to fire.

3. Since the driver isn't really ready for the interrupt, it doesn't
clear things properly and the interrupt just keeps firing over and
over again and the system just locks.

It's been several months since I wrote that change, but I believe that
before that change then requesting an interrupt would implicitly "ack"
any pending interrupt and that will no longer be the case now.

Assuming that the above is true then probably the best way to fix it
is to figure out which driver is requesting its irq too early and move
the request to later in its probe.

You might be able to use "initcall_debug" to help find out what driver
is probing. You should also be able to add some printouts to the
pinctrl driver to see what interrupt is actually firing, though it
might be hard to figure out exactly where to put the logs since it
uses a bunch of common code. Hrm, actually, maybe the easiest is to
add a log to msm_gpio_irq_enable(), even just adding a dump_stack() to
that function. If my guess is right then whatever the last stack
dumped would point to the problem.


-Doug
