Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44CA51681A4
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2020 16:31:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727053AbgBUPbV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 Feb 2020 10:31:21 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:37108 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728103AbgBUPbT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Feb 2020 10:31:19 -0500
Received: by mail-lj1-f196.google.com with SMTP id q23so2615863ljm.4
        for <linux-gpio@vger.kernel.org>; Fri, 21 Feb 2020 07:31:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=umwufImp+RAKAXYwNmIfHSar8yKzL+hitzXL/t+Eqo4=;
        b=UFoVyIMokBF9uMtOCiNiPbsM2bcjPQ+rSe1suiXN9tHQ2gXelPi7omzcHdFjHomGFx
         2wXd9ifKNWI/ND8syyRtKd+Wk3RJLsAB27RsLnX3/w+pm8nGyfC5R/uS7HtXafLgra6L
         Cu5d684iOB4wqdn+8TY2FbwH0ovff16NXGl7eKvscbJaws92YsNk1QNB84h+ePLE2AHH
         fqyzrUNEo/7gmZjxOjfkpXcU8z9w003F8xC5Kp5tWkzpGAzcCzgJTzbJbdLvYcoiljMH
         1dsMko1/zy8EYMXbJ78z+RoYyexW5mlpD+2VhbAmc1QkxKXjuU0H40X94LRR9Oj99DpV
         5+qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=umwufImp+RAKAXYwNmIfHSar8yKzL+hitzXL/t+Eqo4=;
        b=hiDsdhU7xZQqIPQZxAIx3ait3K5HHm6KudUClo9LU2JVte4f4GKwngSei/A7TCLFh0
         ilxEOS0Ahz4tEYmZW1Bd9MWQw6ktKkGBCpyO/uve5rLIFFycvbr3gyOMzHfTeaRnqrhw
         kVqJdZfIt361P3uamRChZVALyVM8TWQe7T7AzAXxW3C2LDSYAZVGpU/qHM5WLmqRdVD4
         DAJZL3coAvIEecXgJV8A6svCubBDfgT6+hKd8taRo8LCZpa1toMAQhNcL6y/f6Gypj3e
         YFf/mGxKQ/EGtKmrOkEpnI+mMX6b+2TvedDdigZBuFR9I3K+mbnPz1Y8gnhCAfDG9FSn
         Rg2Q==
X-Gm-Message-State: APjAAAU103BMrkwXtOZaMNuwQMNviLI0VHICA5DLjbD0zTrXfxKH+c8Z
        Uu4OPWX9z9VBlmDxHK/K4S5QQszcxV4s+IKTHHCdhw==
X-Google-Smtp-Source: APXvYqy40L7BUxSoL4RPpdy6dgmoozwbqU5Au4UJypIZx6/XGeiyRlZMQAfFrJbPwb+oGeu+EOX8ahlhnv3TyHgZTaM=
X-Received: by 2002:a2e:9013:: with SMTP id h19mr23128266ljg.223.1582299076864;
 Fri, 21 Feb 2020 07:31:16 -0800 (PST)
MIME-Version: 1.0
References: <bc20fdbcb826512cf76b7dfd0972740875931b19.1582212881.git.jpoimboe@redhat.com>
In-Reply-To: <bc20fdbcb826512cf76b7dfd0972740875931b19.1582212881.git.jpoimboe@redhat.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 21 Feb 2020 16:31:05 +0100
Message-ID: <CACRpkdbXLKpzOwc7pkdPEN8DAQk64P=5qTo3HfW5tvZnYL70UA@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: ingenic: Improve unreachable code generation
To:     Josh Poimboeuf <jpoimboe@redhat.com>
Cc:     Paul Cercueil <paul@crapouillou.net>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Feb 20, 2020 at 4:35 PM Josh Poimboeuf <jpoimboe@redhat.com> wrote:

> In the second loop of ingenic_pinconf_set(), it annotates the switch
> default case as unreachable().  The annotation is technically correct,
> because that same case would have resulted in an early function return
> in the previous loop.
>
> However, the compiled code is suboptimal.  GCC seems to work extra hard
> to ensure that the unreachable code path triggers undefined behavior.
> The function would fall through to start executing whatever function
> happens to be next in the compilation unit.
>
> This is problematic because:
>
>   a) it adds unnecessary 'ensure undefined behavior' logic, and
>      corresponding i-cache footprint; and
>
>   b) it's less robust -- if a bug were to be introduced, falling through
>      to the next function would be catastrophic.
>
> Yet another issue is that, while objtool normally understands
> unreachable() annotations, there's one special case where it doesn't:
> when the annotation occurs immediately after a 'ret' instruction.  That
> happens to be the case here because unreachable() is immediately before
> the return.
>
> Remove the unreachable() annotation and replace it with a comment.  This
> simplifies the code generation and changes the unreachable error path to
> just silently return instead of corrupting execution.
>
> This fixes the following objtool warning:
>
>   drivers/pinctrl/pinctrl-ingenic.o: warning: objtool: ingenic_pinconf_set() falls through to next function ingenic_pinconf_group_set()
>
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Josh Poimboeuf <jpoimboe@redhat.com>

Patch applied.

Yours,
Linus Walleij
