Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66155332F8C
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Mar 2021 21:05:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231272AbhCIUFZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Mar 2021 15:05:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231550AbhCIUFS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Mar 2021 15:05:18 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7558C06174A
        for <linux-gpio@vger.kernel.org>; Tue,  9 Mar 2021 12:05:17 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id n16so29357017lfb.4
        for <linux-gpio@vger.kernel.org>; Tue, 09 Mar 2021 12:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kohwRGgEQaCo3tkVZ/WeefWjMw7rUpI7M2Guk4ayfeY=;
        b=S13/iT8hpP3g4wvVRrgM3z+9NAV7Zn2ysUe5VpbU2RnXwT1e/Sw+vKdkSklZmdAUHL
         f/moaaV4N359aLcYjVPvLeF/igF3xPAQ1mpjjLQ2OabAW2f4RbnjdUEnrNVg3pua6/D7
         W6MegJ3ZDJ/ebxGGMA69l8lCNgL8k8g3/dMV4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kohwRGgEQaCo3tkVZ/WeefWjMw7rUpI7M2Guk4ayfeY=;
        b=NBmNdFUFi8hEbaAdFRROPobBUOgJwDB7jGUg8UqrsOLuJ3iplP5htk2xSqXuoD2/0G
         Dt5R1NGtEVLtDzaoX4MaJIYrujrxW/YOIzkUbCKr2W6cEmqrmg2GKaBe+1l2iU3NIQrD
         XwoGnc/6eeyt1P/X7V13ePRmwejwqXmSKSsqFU0owUJNnbFnLlEPMcfU/RlyIP5ynroc
         dZi/aYE/BQWxxJKaGaBekM3Bs+Mdn5Id1pLnD0CRr7I5kVUXLUHrIrJ33evlBjQ5qrCR
         boLss5B3vZ3SjbGnOpWzqG4RWbccb/dhPMrFXIaZ56BAmGAN/kTpOAmG9rNQ898jjJLX
         F/9g==
X-Gm-Message-State: AOAM531TAg/RoO7m6wPTRgM8GLLB4/g9WA4cwMkG4Zi3dYgGZFESWK1q
        QgUPX+X6h8UCHNjZOU2KGfUmyG/UgxzvNA==
X-Google-Smtp-Source: ABdhPJyRpBfYF5Wc+Ru1SH2wRvAGv9JBJf1/kfa0g43wueDhD2HcYSgQWXyI/vGAwq67J52Yj+ZkcA==
X-Received: by 2002:a19:c7d3:: with SMTP id x202mr18795130lff.638.1615320315838;
        Tue, 09 Mar 2021 12:05:15 -0800 (PST)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com. [209.85.167.51])
        by smtp.gmail.com with ESMTPSA id g26sm2291401lja.10.2021.03.09.12.05.14
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Mar 2021 12:05:14 -0800 (PST)
Received: by mail-lf1-f51.google.com with SMTP id u4so29386459lfs.0
        for <linux-gpio@vger.kernel.org>; Tue, 09 Mar 2021 12:05:14 -0800 (PST)
X-Received: by 2002:a05:6512:2287:: with SMTP id f7mr17726280lfu.40.1615320314276;
 Tue, 09 Mar 2021 12:05:14 -0800 (PST)
MIME-Version: 1.0
References: <20210309153443.16647-1-brgl@bgdev.pl> <CAMRc=MfO7J1z8oGy+OiRR000dJAYg1LTynz33Kh6BMb1hUrg5g@mail.gmail.com>
In-Reply-To: <CAMRc=MfO7J1z8oGy+OiRR000dJAYg1LTynz33Kh6BMb1hUrg5g@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 9 Mar 2021 12:04:58 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiiuSPZGh1ai_NuV8BHgXO36H_aQ28Bx1u82gE23S1u0g@mail.gmail.com>
Message-ID: <CAHk-=wiiuSPZGh1ai_NuV8BHgXO36H_aQ28Bx1u82gE23S1u0g@mail.gmail.com>
Subject: Re: [GIT PULL] gpio: fixes for v5.12-rc3
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 9, 2021 at 7:43 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> I realized only after I sent out this PR that I had rebased the branch
> on top of v5.12-rc2 (because of the v5.12-rc1 situation) without
> --rebase-merges and this caused git to drop the merge commit for
> Andy's pull-request. Please let me know if you can pull this as is or
> if I should rebuild my branch and resend.

This is fine - it's small, it's a one-time pain, and there's that reason for it.

So as long as Andy is aware of how his patches got rebased and don't
match his branch any more, I think it's not a big deal, and I've
pulled it as-is.

                    Linus
