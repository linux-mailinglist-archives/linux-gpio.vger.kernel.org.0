Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC64234DC10
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Mar 2021 00:50:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230361AbhC2Wtq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Mar 2021 18:49:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230237AbhC2WtV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Mar 2021 18:49:21 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BE45C061762
        for <linux-gpio@vger.kernel.org>; Mon, 29 Mar 2021 15:49:20 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id o10so20797158lfb.9
        for <linux-gpio@vger.kernel.org>; Mon, 29 Mar 2021 15:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=E4tKKb2a4oBSDIpYwaGjwlweWtUcnCP2F2IKUIazGxg=;
        b=jh8Mjbn87KOkyBGNsxEg/Ymi6IUu3L/mshbpFP6y0zW3kb6fq/FuNWK+FO5+969uKw
         FReJ41RRI4d9TmSdy9AXonaORuXoPFddLAumM5hZsgzj1dksNTzDKKI6BmCELcajzpJC
         kG5plqmdZEkm8YAT/TtKG2v5O18gvFDjVr1KGmI8Nbv14D10pBin1NzyRaiWXBhJtTcv
         eVZCfXzAm4rE3Dt/fphFNaz8KcJNjJdaxpGF6hnq4whXhYq+RML8RyhtIqYPvZcYhh4n
         7hM3sMpLNYsHXcdMnlkmEV89/ScoOhV6WqKy+Xs1qF7lhOKACipDJY6GAQnlt3R9+o0J
         dxzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E4tKKb2a4oBSDIpYwaGjwlweWtUcnCP2F2IKUIazGxg=;
        b=uSOUjkRkskQKf21Uaz1GpoD6vbdedayvTk3gvl34tOqMgLjT45NKMX8DDF72NdtobG
         HEFbZx/CtZl9T9XZ7LjAY02nTlBAHMR347owoGwTCZEksiXwn9sIKSKUllhRDUdVWIdQ
         fN32uXgqqdnm31+lGZGoZoPuAj1pKjlrhaW2VQ4ZqCUEst0yVYDo5FJN7TBflJnlWDSN
         /deeUSNAyA0Kr44B8inKWZtFGMeFs0lEshSZ5lXGPd6lA7t3hUbDGv6cbzPGsHdP12sU
         GuZdNUfAA8/qx3hqhwTyzpgQuxE2+7PUJkOil8yGmqMVNQaS8TpZqok/rIblxn14Yv8o
         0qmQ==
X-Gm-Message-State: AOAM533Z26rz8M3ziBtPoJnrpzGknNqTOEBedxX+eY8ExUCmiWk2Y7Go
        TuKa88s8pvPnMue/5SPJ8vbg5bYSy4LxPzzSvww5fg==
X-Google-Smtp-Source: ABdhPJzg4jhvxMth/6VKB2AYKR//A+nYWaltwTtVVME+e8p5A4pR+R8l8f+tPL4/NnT9NkfvLHxsSttlg2DYdwiWueI=
X-Received: by 2002:a19:548:: with SMTP id 69mr17568989lff.465.1617058158844;
 Mon, 29 Mar 2021 15:49:18 -0700 (PDT)
MIME-Version: 1.0
References: <YGHrop0zkyZMLMdd@black.fi.intel.com>
In-Reply-To: <YGHrop0zkyZMLMdd@black.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 30 Mar 2021 00:49:07 +0200
Message-ID: <CACRpkdbG28a+u7yCArYBC-gETqnc9X+6O3yFWLWR7vUv_mTfcA@mail.gmail.com>
Subject: Re: [GIT PULL] intel-pinctrl for 5.13-1
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linux pin control <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 29, 2021 at 5:00 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> One little change so far for v5.13 cycle. The other one in your fixes branch
> and shouldn't affect the merge (will be excluded automatically).

Pulled in for v5.13, thanks!

Yours,
Linus Walleij
