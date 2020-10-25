Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D12222982B2
	for <lists+linux-gpio@lfdr.de>; Sun, 25 Oct 2020 18:12:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1415113AbgJYRMg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 25 Oct 2020 13:12:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732431AbgJYRMg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 25 Oct 2020 13:12:36 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88179C061755;
        Sun, 25 Oct 2020 10:12:34 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id e7so4790377pfn.12;
        Sun, 25 Oct 2020 10:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WeS81+img7GaZvJjPDyZ+olk5wvegDJJPWSHbohGVrs=;
        b=HD4do+251venKNTAcmZyC2yWlT70smOO53vD2jMenjecxpwYg9RYghaixm9vxEsR+G
         VC5UdY2d9j2Dbtt5TXdGd7MoWvYJW6VQNInb1XVxbqhYedkbRvBy+BkFZoDqY5V8UXAx
         Fg2IzG/eHvoW/C000g5Hw+fpNZU2gGSKHWJNPOD7IfUVFM0mWDns8CM7g2Pj8J48vjJr
         kI3YAa3RAsroeoS+zsQ4M8B/LivC/hzb0yCeji3Xoa5RUBjcONn8MzlNdHSCzUnCQRIU
         fQFYd5wh+UtIqtoEehqeWoBGRoHA9BaKUPCgipd4+MTaB5k8GCanksAuOCxqiLTUi4B6
         73/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WeS81+img7GaZvJjPDyZ+olk5wvegDJJPWSHbohGVrs=;
        b=NoIVJl7RKj0K8dUZuvEKximaOMO5HcBO+yErvwJdRMPmIlgewIH1J7lqWDDJGcZY4i
         d0RM011ccUzpHS6ia4Q/RkcixCZQT+u71uxW+T35ba2oLP/8LI8El9pOGEvfPta1msqI
         31a9gLZJn/oIY4GKAAW3Cp2+/xm1WEOL61EiTI0Lpst0FynIb5g8q5ximlN8muh9QqI4
         BvvgPuwqP3SgeDU2kTuKCBZvjs8X9O7N1tG7fVfRhjSUQXde48ujlnOFYc66diwP6HNX
         bl41ytNpLlsRgqKkuaS7W9wiBYxb5KqVs56Z3BG3v2Oyqf9H4kvt3Xo1ZNpLTR8Jnh1/
         zy8w==
X-Gm-Message-State: AOAM532lzx2G5Asmul9g1qc+OFDsnSAA3mFYqkip/3sXdufi1vuCeSTN
        JNC2apTyqrhGy9oQKw3nAMpl/flck9nRHPTOZDzO/26NpcU=
X-Google-Smtp-Source: ABdhPJyoDu1IeQ+UIz789d57dewg7IKm6RZTGYocftmXxiTgYJ7KkKOXbToUPSR7hnX1KqFBgLNI58dhNsihTV/X/tk=
X-Received: by 2002:a65:47c2:: with SMTP id f2mr10328252pgs.4.1603645953639;
 Sun, 25 Oct 2020 10:12:33 -0700 (PDT)
MIME-Version: 1.0
References: <20201024061552.4497-1-coiby.xu@gmail.com>
In-Reply-To: <20201024061552.4497-1-coiby.xu@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 25 Oct 2020 19:12:16 +0200
Message-ID: <CAHp75VdRBPcdRaTjnDNk5nSN8fMY--Gq=042+fYGddv=Xs6uHw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: amd: print debounce filter info in debugfs
To:     Coiby Xu <coiby.xu@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Oct 24, 2020 at 2:32 PM Coiby Xu <coiby.xu@gmail.com> wrote:
>
> Print out the status of debounce filter as follows,
> $ cat /sys/kernel/debug/gpio|grep pin130
> pin130          interrupt is disabled| interrupt is masked| disable wakeup in S0i3 state| disable wakeup in S3 state|
>  disable wakeup in S4/S5 state| input is high|   pull-up is disabled| Pull-down is disabled|   output is disabled| debouncing filter (high) enabled| debouncing timeout is 124800 (us)| 0x503c8


> +                               if (!tmr_large) {
> +                                       if (!tmr_out_unit)
> +                                               unit = 61;
> +                                       else
> +                                               unit = 244;
> +                               } else {
> +                                       if (!tmr_out_unit)
> +                                               unit = 15600;
> +                                       else
> +                                               unit = 62500;
> +                               }

In all three if:s can you use positive conditionals?

-- 
With Best Regards,
Andy Shevchenko
