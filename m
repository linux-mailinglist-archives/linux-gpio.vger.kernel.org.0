Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A3B72D81BF
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Dec 2020 23:17:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406734AbgLKWPO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Dec 2020 17:15:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406717AbgLKWOz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Dec 2020 17:14:55 -0500
Received: from mail-ua1-x92d.google.com (mail-ua1-x92d.google.com [IPv6:2607:f8b0:4864:20::92d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40878C0613CF
        for <linux-gpio@vger.kernel.org>; Fri, 11 Dec 2020 14:14:15 -0800 (PST)
Received: by mail-ua1-x92d.google.com with SMTP id 17so3017832uaq.4
        for <linux-gpio@vger.kernel.org>; Fri, 11 Dec 2020 14:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=B+v8QnAZfVmqdM00Egj83ptDN3hTPJz74BI1U+QyDFM=;
        b=g7q7BwyabpGEt1cdczJmqxzv2S6iTyT9mkFah7BKR4FKU5Dr3lxJHEJC0Rr50ihcQE
         x1mkixFbjWFPbE0IiX/M08n2k7Qd6Hc7d6scCrDuqsa0QM/mQUpTbrYJPT9xoIGnPfRQ
         ULTkk4v6bW1+d6xwlNbplePkS2/QY4dSfBP1s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=B+v8QnAZfVmqdM00Egj83ptDN3hTPJz74BI1U+QyDFM=;
        b=V59RtX1d39J2ypV3lbh1fuaXjOKfgXPCvXk+s1Ea8ovnwDaPtqW9aFaHRXhZ4npigS
         zRFZvHJmk6FXLmsoP6Z3diaiMR4CBRMWIV1zDgT79i5f4WtutXL/0B0Jmkd5Dyua3XWw
         TBMrsn8wFvQ4Bf/y4msKvaRxcFaoUYLVNZSFTGFjJ7hq7oGsXwcFPkqpVFsyIoHv+OfG
         96o1ACx7E9lUB8EvzhTDSTet0yO87yWa55FF4REmzD1z0ISNVbWAahDsjcDCDdMxUt4g
         vUU/LX2kDf4kIeQSsV2KhQYnPOKTejtcoFyzUtHXsOlU/LoWGrs/GkzeO4JYMpCnGc25
         Ujig==
X-Gm-Message-State: AOAM532QBvlaN80wRSrSiZDCmVb89GjXxMv1o6lF9Gs8T5ygUEO3bEsl
        08jNV486MLnoyH/oOFxuSg5UD++wIR1yKQ==
X-Google-Smtp-Source: ABdhPJzrqEml4bzhCly/oNOnmIIKcwcIjETCms4yC+IYG+OJqhwdEW0h1zZuAoHVfbQrotyN/wATZA==
X-Received: by 2002:ab0:d6:: with SMTP id 80mr15390870uaj.46.1607724854195;
        Fri, 11 Dec 2020 14:14:14 -0800 (PST)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id s20sm1201780vks.21.2020.12.11.14.14.13
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Dec 2020 14:14:13 -0800 (PST)
Received: by mail-ua1-f54.google.com with SMTP id w7so3354258uap.13
        for <linux-gpio@vger.kernel.org>; Fri, 11 Dec 2020 14:14:13 -0800 (PST)
X-Received: by 2002:ab0:6285:: with SMTP id z5mr14895918uao.0.1607724852718;
 Fri, 11 Dec 2020 14:14:12 -0800 (PST)
MIME-Version: 1.0
References: <20201124094636.v2.1.I2702919afc253e2a451bebc3b701b462b2d22344@changeid>
 <20201124094636.v2.3.I771b6594b2a4d5b7fe7e12a991a6640f46386e8d@changeid>
 <d6c5dba9-bcc7-fac9-dd41-c989509c822b@codeaurora.org> <CAD=FV=UOSkHQMcSV8Zq5qPfBoUu5xYzfNZqUPmymvD7PXUAN4w@mail.gmail.com>
 <b84d5bb4-e413-ad20-a19a-c7420abd5d5d@codeaurora.org> <CAD=FV=UXo3RPuVSYwOrHJMxF38K-ynoaPv4ZVQ6N2ok_zcoOFw@mail.gmail.com>
 <5f24ec87-6d91-dfd9-0f4f-6687f37c60ac@codeaurora.org> <CAD=FV=Wm_q60w34LmbtC88BkfS0aKp_a=AjnuYFL=g-DX_-=yQ@mail.gmail.com>
 <92c61a18-0a1d-099e-4a11-b33a052b4ec2@codeaurora.org>
In-Reply-To: <92c61a18-0a1d-099e-4a11-b33a052b4ec2@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 11 Dec 2020 14:14:01 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XvWFd84OxHmYgO8McV-ixe+ucMxhOdAWzHu4nLnnCtbQ@mail.gmail.com>
Message-ID: <CAD=FV=XvWFd84OxHmYgO8McV-ixe+ucMxhOdAWzHu4nLnnCtbQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] pinctrl: qcom: Clear possible pending irq when
 remuxing GPIOs
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Neeraj Upadhyay <neeraju@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Srinivas Ramana <sramana@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On Thu, Dec 10, 2020 at 11:07 PM Maulik Shah <mkshah@codeaurora.org> wrote:
>
> I have slightly modified your test case (see at
> https://crrev.com/c/2584729) which is as per what i used in my testing.
>
> Here is what i am doing, setting GPIO to a fixed function (function 2 here)
> Note that function 0 is the GPIO (interrupt mode).
>
> 1) Pull up the GPIO in function 2
> 2) Pull down the GPIO in function 2
>
> Repeat above steps, and you will see fake interrupt every time pull down/up.
> This proves that if you mux away from GPIO then still PDC sees the line
> and can latch the interrupt at GIC.

Ah, super useful example!  Thanks!  Yes, I can replicate your results.

...but this seems to contradict my other test.  Ah, dang, I think I
see the problem with my original test.  The important difference is
that in your test you used the alternate function "mi2s_2" and in mine
I used "qspi_data".  When I selected "qspi_data" it must have been
actively driving the pin and _that's_ why I couldn't affect it.

When I change my test to use "mi2s_2" then my toggles via "wp enable"
and "wp disable" cause phantom interrupts.  That confirms what you're
saying: the PDC _can_ see the twiddles even when muxed away.
Presumably the active driving my "qspi_data" is also what caused my
phantom glitches.

So, as you said, that means my mental model is totally wrong here.
Wow, if I had known that earlier I would have saved a lot of time.
That'll learn me...

OK, v4 being posted and you can see if that handles all the cases?

-Doug
