Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 189AF23AF6F
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Aug 2020 23:06:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729041AbgHCVGg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 Aug 2020 17:06:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728400AbgHCVGg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Aug 2020 17:06:36 -0400
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com [IPv6:2607:f8b0:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62F38C06174A;
        Mon,  3 Aug 2020 14:06:36 -0700 (PDT)
Received: by mail-il1-x143.google.com with SMTP id 77so3891383ilc.5;
        Mon, 03 Aug 2020 14:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=I8E3XSJDvDX1egjA2GUXctrW6F+MeWdt3qnYussCHHQ=;
        b=ijZHz8UzGGZ/lxjpnlwB+zPaLAj+Wkm6TPf2WxOY2ZS01RRfI5oYVTmoJpOmTLxYVV
         22hkznu90lUCsXc0bDEAH+lhC4uWKdv0hi+vRw4iRn/1k6SbMp6KdV08RpTY9o+y79bj
         A7NikTxAa2dyl4mE+RGJG7cT6TieeAmV1VgtROBkn8FgDsngGas05muf52+94kJLn9TT
         EZYYFwxmel46D+KiHmSS8AG6S2ciiEwWuIyviSzjrWDbOSh5Be7U5N3k6IH0wHMt/G+A
         j0BrBAJlXNLod9ZybzKUxyUVaqSlZJThl8ervfSS8/1Fsz06FUVYMHZUriORTqOlBsOK
         Vppw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=I8E3XSJDvDX1egjA2GUXctrW6F+MeWdt3qnYussCHHQ=;
        b=ZhnGt8B9Xw7lW58ILvmQNoiFfKWLm6SrV5WrfBCTU7eqrdZLsYAl9vx9t12omTMb4Z
         gO3v+21iTBCxJ0O3LB8+z3RZAutTVOHXA3BOsuaB8uASy+PX2pTSkXYdO2vn9zvPzwEw
         Q3YPiAbDb/6IAEMhObqieiKO1CaP1UGU8B7FDubZDI2rqm873Dv5p2Gly1HUd3dg6Fju
         WfGcmKFlaLrYFLKbaxepGxya8PsCZy8om1ON9IzvUqNTcDtZ2EE5o7Fss+CMTypkvtgp
         mWs2zHOXOgjzHtcsYR03jrK1cEBX9PuxEEB8Gu4KrSHJ0Iv49WY5381hRmUsNJPNFNjE
         O5OQ==
X-Gm-Message-State: AOAM531CJ1J/Opxi90jrm0/tNjvI5oVEMs1NO7+tWn6V8RD+99f5dL3l
        9taDfWT/uR+IAh88fsQNQyR33QRiJ5uUf6qOc40=
X-Google-Smtp-Source: ABdhPJzMP/AfQwwTdCMUhAIaQPr+JCoZfZydL4H1zf0+6aUdK9VYmFGd08a6HCEh564qh6z4RBSNAoTSkVZEgtGRwlU=
X-Received: by 2002:a92:da10:: with SMTP id z16mr1333579ilm.293.1596488795803;
 Mon, 03 Aug 2020 14:06:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200714080254.v3.1.Ie0d730120b232a86a4eac1e2909bcbec844d1766@changeid>
In-Reply-To: <20200714080254.v3.1.Ie0d730120b232a86a4eac1e2909bcbec844d1766@changeid>
From:   John Stultz <john.stultz@linaro.org>
Date:   Mon, 3 Aug 2020 14:06:24 -0700
Message-ID: <CANcMJZC-kAc1kqqNhfd9wvFS4ans8t7cpAfNVZbybA4W6x5-KQ@mail.gmail.com>
Subject: Re: [PATCH v3] pinctrl: qcom: Handle broken/missing PDC dual edge
 IRQs on sc7180
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>, rnayak@codeaurora.org,
        mkshah@codeaurora.org, Marc Zyngier <maz@kernel.org>,
        ilina@codeaurora.org, cychiang@chromium.org,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Todd Kjos <tkjos@google.com>,
        Amit Pundir <amit.pundir@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 14, 2020 at 8:08 AM Douglas Anderson <dianders@chromium.org> wrote:
>
> Depending on how you look at it, you can either say that:
> a) There is a PDC hardware issue (with the specific IP rev that exists
>    on sc7180) that causes the PDC not to work properly when configured
>    to handle dual edges.
> b) The dual edge feature of the PDC hardware was only added in later
>    HW revisions and thus isn't in all hardware.
>
> Regardless of how you look at it, let's work around the lack of dual
> edge support by only ever letting our parent see requests for single
> edge interrupts on affected hardware.
>
> NOTE: it's possible that a driver requesting a dual edge interrupt
> might get several edges coalesced into a single IRQ.  For instance if
> a line starts low and then goes high and low again, the driver that
> requested the IRQ is not guaranteed to be called twice.  However, it
> is guaranteed that once the driver's interrupt handler starts running
> its first instruction that any new edges coming in will cause the
> interrupt to fire again.  This is relatively commonplace for dual-edge
> gpio interrupts (many gpio controllers require software to emulate
> dual edge with single edge) so client drivers should be setup to
> handle it.
>
> Fixes: e35a6ae0eb3a ("pinctrl/msm: Setup GPIO chip in hierarchy")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Just as a heads up. I started seeing boot failures (crashes really
early before we get serial output) with db845c when testing with the
android-mainline tree that pulled v5.8 in.
I did some quick bisection and came down to this patch, and sure
enough things boot again with this patch reverted.

In my testing earlier today with v5.8 (+ just a few patches for db845c
support), I didn't see this failure, but the configs in use are
different there.

I'll try to spend a bit of time to understand exactly what is failing,
but if you have any initial suggestions for things to try, I'd
appreciate it.

thanks
-john
