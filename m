Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D261A6AC6
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2019 16:06:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729066AbfICOGA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Sep 2019 10:06:00 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:42793 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725782AbfICOGA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Sep 2019 10:06:00 -0400
Received: by mail-lj1-f194.google.com with SMTP id y23so5063486lje.9
        for <linux-gpio@vger.kernel.org>; Tue, 03 Sep 2019 07:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rNZulk2fI4zPvvXfpcsK+3HNYwjxIf9VMNrxwKmlruc=;
        b=EiERYzIZGO3JG3el6NZQYClR+H2etUZBptQW93xYh8umA+swtec3IibNNuyOHklSu1
         YnH2PIgB2nEqZLzXyT/m3wstI4V3paI4YniNkNLhuLNM1QNw3DxEZ5jj49jCYMLz1PDd
         tKkYkQlLbGdb2CpyQoE2Nrub0TLldxSVqFnX9brVmaMMtLp00adV84Jsoss5o2R6ABEC
         DWyaiK2e5w1ELB+4fpgCxMv168pHw6JzGGptISFHzGOu2GAilA7UpXt3+kt/UDi2IQN1
         XqIP5z9oCNY3/rBdg29S+IYGS/KaLes8tmRdp8NjjIuuPhc/gfbGsvXX53Jx4LrrlqAU
         uvhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rNZulk2fI4zPvvXfpcsK+3HNYwjxIf9VMNrxwKmlruc=;
        b=V2ZqSTGIT8p18KgCeVtFZMCrOAOQKa8g6wxkecykTUXm7LMxsRvZp58ef+DRP8fvQx
         Cd/evabHezK3/lOz/bWLO4jsZUWgRd1hYdCnFKiGEU4jPFYDgul1IDtyS+VkdN63H669
         HIJyOOwhulS4xaveLPM7c5M7gJq0yJmMzvrurPJs0N6Y6HCTxm5f+iXoZYg9lM977heg
         4CUT/wu3V0Vbe0xy38BwLHjnozM4Yt/e140XgkFo/phiNx9T1Cx6rUKCAG4H2XBINcV9
         +uEEn7mSN4U9cSq/Lqpj1MS1bqgA2LIhbKtkfsl3n06xohI10+bdDR1DcO1iRt970c/g
         B0Jw==
X-Gm-Message-State: APjAAAXfoRBUUOIICslunsGgQ+VTsyXxIUS3SkP0wJas/rqSV6NAOpQu
        CssnDCwmftdggSbZriUO9448jVwqgHFPS6PxZX/ldhZDmGY=
X-Google-Smtp-Source: APXvYqzdxnxZRNSAZUK1lQHtCidDzAIm3yIFIX6FQvmWUWpimJxUDJVeac8j0JOLQL5UANV/725CSLstVodPG5wreEA=
X-Received: by 2002:a2e:b174:: with SMTP id a20mr20265603ljm.108.1567519558603;
 Tue, 03 Sep 2019 07:05:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190903120214.16375-1-brgl@bgdev.pl>
In-Reply-To: <20190903120214.16375-1-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 3 Sep 2019 16:05:47 +0200
Message-ID: <CACRpkdYsZAu14Pcy6tFpQtgzM05j3hxsAub32YZvi2ykyTbQeA@mail.gmail.com>
Subject: Re: [GIT PULL] gpio: updates for v5.4
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Bartosz,

On Tue, Sep 3, 2019 at 2:02 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

>  include/linux/gpio/driver.h              |  27 +++----

I get some really serious merge conflicts from this (due to other patch from
Yue), but I did my best to sort it out, let's hope it builds and runs...
watch out for explosions :D

Yours,
Linus Walleij
