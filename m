Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 629BE38F6EA
	for <lists+linux-gpio@lfdr.de>; Tue, 25 May 2021 02:18:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229581AbhEYAUI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 May 2021 20:20:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229543AbhEYAUH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 May 2021 20:20:07 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 132C1C061756
        for <linux-gpio@vger.kernel.org>; Mon, 24 May 2021 17:18:38 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id q3so13026513lfu.2
        for <linux-gpio@vger.kernel.org>; Mon, 24 May 2021 17:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lU98oqYZy9LMpWRIVC/iOJVtPr25gCqXEbSC0KE2HyA=;
        b=Z0A4YTuI+et7WamhQwbpeL7DsoQsF7Ua1YcYV4PuWf/unLg0FK4OyfCPtn8ju23OMV
         f4ZRHtH3PZ51h0Rx8RGos1KrY0HJbMYeZR3l72jlxAc7gE6eHwgUXJUww9D0pIJu1yCb
         TN6MSnljzXK2rflr6vC2q845XUCsEuKxHC8iy6LcTiK3RBNB9jXmD4t/qP/N/0pZCD2q
         NYk7e/nIFxW5bBymJIy+MUr/AaoQgj8xdCucfU/rPEXIk4bBLBP3hvtd0648zeKrNVwB
         vQEPXtRFtpikG60dHa1v4DPAtX6OlVy77tS5ty44hxWu9Rv1szhLYqkecfdcg1o0Z3ci
         OfLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lU98oqYZy9LMpWRIVC/iOJVtPr25gCqXEbSC0KE2HyA=;
        b=V4NV8d6TILEFNyZgDDI9M9y+nBJObIrETgMeIgFopy+RMgOakT99lTPafKTVouRsdH
         794dwEh6azWwM9dws4sXWbpBDWGLU1VzEdZi99jcAOIxWCPh8uWcrbKBtu+fmyqC1JoA
         aV/VPOMbi1DtlF11sEiEsxvh6zzGs3n8tM0P7wJNs4yv2FR1cfsX+SHTxdc8s0IFz6Jk
         W8U64P7NvZswAJBVedmTcnOqsmhKkTbruI+PDYYzIfwIdOaP+fvpbIhOnREMbZBk/dZ4
         IWffvbpLOSajO0EUndG1KojT4bqkMUrg8Mb5X8LHDEfIl/DypNZ4013VQZEZPtNVXr8C
         GRzg==
X-Gm-Message-State: AOAM530wZCLlpxD9Hho9y3IKml3kmdOK0EUUALU6ojm7n1PBjWb3ii6N
        pXHg7CtRWv7rzS8xdvgKkgbB6WQxVW4LL2h0WSd/cA==
X-Google-Smtp-Source: ABdhPJygddabh5kIV+leOfkKFonaw9VscHm4yErigpg0emiVpFC9RYx8ml0O2HMh08c2oJ8ecYk5w/JjuH7dSDMDRTE=
X-Received: by 2002:a19:ef10:: with SMTP id n16mr11888963lfh.649.1621901916420;
 Mon, 24 May 2021 17:18:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210520202730.4444-1-dariobin@libero.it>
In-Reply-To: <20210520202730.4444-1-dariobin@libero.it>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 25 May 2021 02:18:25 +0200
Message-ID: <CACRpkdanh32PREaYhN1dW1p0GDamSZ04WgRr-afm+6L-c1fJCg@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] am335x: set pinmux registers from pins debug file
To:     Dario Binacchi <dariobin@libero.it>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Drew Fustini <drew@beagleboard.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, May 20, 2021 at 10:27 PM Dario Binacchi <dariobin@libero.it> wrote:

> The patch was born from the need to change the slew rate of the LCD pins
> of a custom AM335x board during EMC tests. The AM335x, as described in a
> note in section 9.1 of its reference manual [1], is unable to write
> pinmux registers from user space. The series now makes it possible to
> write these registers from the pins debug file.

I am going to hold this series back pending more discussion on the ABI
and whether it is useful.

Yours,
Linus Walleij
