Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 477BB2EFC40
	for <lists+linux-gpio@lfdr.de>; Sat,  9 Jan 2021 01:38:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725926AbhAIAhU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Jan 2021 19:37:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726216AbhAIAhU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Jan 2021 19:37:20 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E7B5C061574
        for <linux-gpio@vger.kernel.org>; Fri,  8 Jan 2021 16:36:39 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id u25so6394374lfc.2
        for <linux-gpio@vger.kernel.org>; Fri, 08 Jan 2021 16:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LPpBJ/fMnI8yZebGm9hJTyLbUyow2Z4x72tEei+91U4=;
        b=fwx1XaV/wTLLLznyxTbRB9fBBtCC7ZerKopuVgRnrNv4UjYn9rGgPIok1KWef3q7/9
         HhFEOfPfad4MD8CunVXnEMYb02XvnxhA+6scxi0a295u7B67Sjmh43ECuKBphmcj7aLc
         YkjQGjFOO9GHmf9RWRwsrgh5wfb8Z7obFBZyQJPcd3g4sq5Me9jJ0jz6N74wFyEuTaWS
         Oh+1J24YFbH2T4t5FlrG0t3MuJ6lzVWZAIof7515hWwxMcA0tmZB2BesKHXAAySLjTWA
         FZlrQZ6Kc73GO6RNjSsfBMpbhxwiAEFZceLAGnQp1t2fZzRw35oBh/efLpwWtOywgbhJ
         JMTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LPpBJ/fMnI8yZebGm9hJTyLbUyow2Z4x72tEei+91U4=;
        b=CM3jUcbY9cj8JCxwxWgFYAYTvfKf2TJ4q2tnCzr46nUZFStfiNx0E/G6mOthA07Doq
         Td3ue7XVUeLsq120cEV/kEBB+I+iLcoUT33un29v4UGAJnegJT20EJWdMr+Tv1sAi8SN
         8xg9IqXemrQvQJ5dS4UsLEEA5fEPWP9s5jKu0o6k+CMEEeUY6XaY/Cxk1AFWl85+7ih2
         RsflXMkEdGiQPEvKIeUO40EkGIgxprVYRtjTB9c7Jiy50LJ/gSfRqGjeAhgIZqal/6tJ
         BdblGyxzGxvXIyNJ5MO00sNcTxRWi2bIGOxP7tE6kZseKjq3WR6OSe1U6/16V4N5rPHR
         N1bA==
X-Gm-Message-State: AOAM532q4Grk2aYstoaVcuLuJu0lc5q54LE+g+Fxk3VCBFv9FR8F2Ebp
        aVCdX0a1wal7bKBBNmg37fW5exDNugAA65fFwCwKsg==
X-Google-Smtp-Source: ABdhPJyKfgFd0+N91BmEQfByY+TlvnwSS1jTQHDidO8kM302MgTNIM49BLxDjOg2R89x5e7GBMfkIxBEso6+Wcw/nXo=
X-Received: by 2002:a2e:85d1:: with SMTP id h17mr2413376ljj.438.1610152598070;
 Fri, 08 Jan 2021 16:36:38 -0800 (PST)
MIME-Version: 1.0
References: <20210108093339.v5.1.I3ad184e3423d8e479bc3e86f5b393abb1704a1d1@changeid>
 <20210108093339.v5.4.I7cf3019783720feb57b958c95c2b684940264cd1@changeid>
In-Reply-To: <20210108093339.v5.4.I7cf3019783720feb57b958c95c2b684940264cd1@changeid>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 9 Jan 2021 01:36:27 +0100
Message-ID: <CACRpkdZJR142en_=rge5Gp7-MH6SzxjHmkCh_rUx=8j6SVZYSQ@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] pinctrl: qcom: Don't clear pending interrupts when enabling
To:     Douglas Anderson <dianders@chromium.org>
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

Hi Doug,

this is an impressive patch.

We definitely need to touch base with Bjorn on this, preferably also
Sboyd.

On Fri, Jan 8, 2021 at 6:35 PM Douglas Anderson <dianders@chromium.org> wrote:

> Fixes: 4b7618fdc7e6 ("pinctrl: qcom: Add irq_enable callback for msm gpio")
> Fixes: 71266d9d3936 ("pinctrl: qcom: Move clearing pending IRQ to .irq_request_resources callback")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Some mechanics:
1. Does this need to go into stable? Or is current (non-urgent) fine? Or fixes
   for v5.10? I.e. required destination.
2. If it does, should patches 1-3 also go into stable? And are they
prerequisites?

Yours,
Linus Walleij
