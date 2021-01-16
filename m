Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B18C32F8A39
	for <lists+linux-gpio@lfdr.de>; Sat, 16 Jan 2021 02:07:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727091AbhAPBFp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 15 Jan 2021 20:05:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726262AbhAPBFo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Jan 2021 20:05:44 -0500
Received: from mail-ua1-x933.google.com (mail-ua1-x933.google.com [IPv6:2607:f8b0:4864:20::933])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 974C1C061757
        for <linux-gpio@vger.kernel.org>; Fri, 15 Jan 2021 17:05:04 -0800 (PST)
Received: by mail-ua1-x933.google.com with SMTP id j59so3520484uad.5
        for <linux-gpio@vger.kernel.org>; Fri, 15 Jan 2021 17:05:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1jaH2X7S2VsQNxdRM32ntn9sMg9v7F6IuCY/DoxBE34=;
        b=e+5OdhvN0c0ih4PhNWYKwJ2k+cIHzWc5jrHXuJvOiu31HGIAUyaCuAMtXO5bq3D31R
         Jf7v14vECN/jHCOwVRbSxTJWPj9idoVpyqznPzX5kxH17Kt4/CVXq3IdYzadtU4e6RQx
         TcApMa222+2mnKQBn02Wpl7C7+M5K4lGlmQu4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1jaH2X7S2VsQNxdRM32ntn9sMg9v7F6IuCY/DoxBE34=;
        b=O7MyRPwp6reJVQnw2TwVcaf7WE930EqiU8ZGQDwB9U1rzq+/cWkZrb3LqzUPrHWTgZ
         PGnf4TIwS4BNIxdE/zaLCpBcj8oMQTWAK5VViFRNTnKFigh72HWqjJ/xREZNyorw8nT+
         uFQKmZ/pATrzMT2Fa3RrvjAJrRuAF25FAHFbsQEaQjDrncKc+iV/rprTf4oi/ILoaaUe
         dAQ5lNKjbLoyXhmWdGlms/OuDQvjjHnOdjwoggbBkXFHJzyT2PqmHpz4wcAEO1G7Wg72
         jkkjjG0dVzmrndEJNYNqwNMCYMS0NSK3wvOOAu55Ip3HvglLodlx9q5NM9f+s0qTsSgO
         w62Q==
X-Gm-Message-State: AOAM530hCakvC+cXXZ+hJztYWOSJdud6uR8ufSZ30u74J16PXwaJc9E+
        UtCg1atsM7+HKphzjJZAiOQxJMFLj7NHXQ==
X-Google-Smtp-Source: ABdhPJxvR/rfSXEiusE26Qzmls8YWi7jYkCP+vdwPddJKRupUzAL+e2Ot1i+sFoEZO4+hu2DZSvhuQ==
X-Received: by 2002:ab0:634c:: with SMTP id f12mr12013001uap.63.1610759103482;
        Fri, 15 Jan 2021 17:05:03 -0800 (PST)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id f9sm1359181uad.4.2021.01.15.17.05.02
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Jan 2021 17:05:02 -0800 (PST)
Received: by mail-vs1-f45.google.com with SMTP id e15so6048410vsa.0
        for <linux-gpio@vger.kernel.org>; Fri, 15 Jan 2021 17:05:02 -0800 (PST)
X-Received: by 2002:a05:6102:2361:: with SMTP id o1mr12707550vsa.34.1610759101867;
 Fri, 15 Jan 2021 17:05:01 -0800 (PST)
MIME-Version: 1.0
References: <20210108093339.v5.1.I3ad184e3423d8e479bc3e86f5b393abb1704a1d1@changeid>
 <20210108093339.v5.4.I7cf3019783720feb57b958c95c2b684940264cd1@changeid> <CACRpkdZJR142en_=rge5Gp7-MH6SzxjHmkCh_rUx=8j6SVZYSQ@mail.gmail.com>
In-Reply-To: <CACRpkdZJR142en_=rge5Gp7-MH6SzxjHmkCh_rUx=8j6SVZYSQ@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 15 Jan 2021 17:04:49 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WG5s81mh+S6Fhyz51nsui=EcsAVJd24uChrszKWHzauQ@mail.gmail.com>
Message-ID: <CAD=FV=WG5s81mh+S6Fhyz51nsui=EcsAVJd24uChrszKWHzauQ@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] pinctrl: qcom: Don't clear pending interrupts when enabling
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Neeraj Upadhyay <neeraju@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Srinivas Ramana <sramana@codeaurora.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On Fri, Jan 8, 2021 at 4:36 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> Hi Doug,
>
> this is an impressive patch.
>
> We definitely need to touch base with Bjorn on this, preferably also
> Sboyd.
>
> On Fri, Jan 8, 2021 at 6:35 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> > Fixes: 4b7618fdc7e6 ("pinctrl: qcom: Add irq_enable callback for msm gpio")
> > Fixes: 71266d9d3936 ("pinctrl: qcom: Move clearing pending IRQ to .irq_request_resources callback")
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
> Some mechanics:

I just realized that I addressed everyone's comments but yours.  Doh!


> 1. Does this need to go into stable? Or is current (non-urgent) fine? Or fixes
>    for v5.10? I.e. required destination.

It probably ought to go into stable, but I'll leave it up to you which
version of Linux it lands in.  I don't personally know if anyone is
criticall waiting on this to land upstream.  For Chrome OS we're not
desperate for it because we've already landed a temporary revert of
Maulik's previous patch and the extra clearing of the masked
interrupts isn't causing any really visible problems for us.


> 2. If it does, should patches 1-3 also go into stable? And are they
> prerequisites?

Yeah, the last patch requires the previous ones, so they would all
need to go into stable together.

-Doug
