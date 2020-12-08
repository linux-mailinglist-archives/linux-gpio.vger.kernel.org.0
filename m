Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 531B92D2647
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Dec 2020 09:35:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728295AbgLHIfg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Dec 2020 03:35:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726931AbgLHIfg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Dec 2020 03:35:36 -0500
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B844BC0613D6
        for <linux-gpio@vger.kernel.org>; Tue,  8 Dec 2020 00:34:55 -0800 (PST)
Received: by mail-lj1-x242.google.com with SMTP id a1so16823073ljq.3
        for <linux-gpio@vger.kernel.org>; Tue, 08 Dec 2020 00:34:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=195UJafgdu4DiqsgA5FNUf3zYycV58fxtYb2a9pEgf4=;
        b=yQzshfGBrbKwARa8KTb7YGpmHKgxQ+tPfZNklXD6jKETBClbWk1PxhuuSJnZLm7oph
         DVYXZBP3y3BWhnnZ7f/Ob1rVVoWT38gnZkizNon529oaTOrRJzIWXOnC5Kpix0cOvhtZ
         /mrARLD14JrOybc2QaC1v/MCqrQiSA+Vf0y0qGkxZqLr5D1xy1w6zLD/7SKV7sdPMmZO
         73d7XqAYNaY6dU5kIIj3pEzBLNc+ky1zphYQGoMpqu9uiOrVyLCnCZD0Ljze2l5EeaFf
         3s8ZdYE5JDAz8E/hyqEIm7LkDHXgfuboAMQRN6BFAGf7232W5ycy8RFvCOk4lNWi0Yjv
         nT/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=195UJafgdu4DiqsgA5FNUf3zYycV58fxtYb2a9pEgf4=;
        b=UzaTJVyhan3S6KVYysNif/RtJiLwUwn8qEcMj3hVv9WQIT7EuHMWn1Eqr1bPK1tNZ4
         A0QgvxVicw8SziwtDyMwibxjBKlwGBKf4GymLlqd9+neF1oqkhY0F/0TD2Dthv9xpzmn
         0RohDgfmjoXTXdxg92ml92xEZCd+tlCIRhynylJg+DxeyGLBy1V43mvRIauYnemDdAnk
         v1OYTgJ5VOZrNmVvXzoNKG3eVM0INeCLbzt0COo9lH7VHZqSbkF2a36Azz5oBlC/EPN3
         apZseyi23sefy1ddLjTzgFhYiD2ZaoeyYKsZYPtXLj9xRVnCQgcWlNREAdP1NncDD+tc
         J16w==
X-Gm-Message-State: AOAM530ziBeIyxgYk0/f2NohwfmVOBO3iAoQaa07J92WJ+l5c0cZgG/P
        qiCzVcOa9L4Q8doVAE19ArT+ClVkhxv1TIG5uwN9rA==
X-Google-Smtp-Source: ABdhPJz08If1smVODrdSah1o52/iEr3KU7W2SERtuqjk2irk+tpCJx8X0EynGRNZdDqgKk4DfHeiN59zmhBmlmvqj6Y=
X-Received: by 2002:a2e:94d:: with SMTP id 74mr1041013ljj.104.1607416494299;
 Tue, 08 Dec 2020 00:34:54 -0800 (PST)
MIME-Version: 1.0
References: <20201207175940.10631-1-andriy.shevchenko@linux.intel.com> <CAHp75VeHz3CAZMQgQsU+WdDyjS+woMTyeOWYDzARePq1aaa=Og@mail.gmail.com>
In-Reply-To: <CAHp75VeHz3CAZMQgQsU+WdDyjS+woMTyeOWYDzARePq1aaa=Og@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 8 Dec 2020 09:34:43 +0100
Message-ID: <CACRpkdb4AYx1dOYkZvHzRD7fbGfVbKoGqdnmh1m=rdhGnAaPag@mail.gmail.com>
Subject: Re: [PATCH v1] pinctrl: intel: Actually disable Tx and Rx buffers on
 GPIO request
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Dec 7, 2020 at 7:07 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Mon, Dec 7, 2020 at 8:02 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > Mistakenly the buffers (input and output) become together enabled for a little
> > period of time during GPIO request. This is problematic, because instead of
> > initial motive to disable them in the commit af7e3eeb84e2
> > ("pinctrl: intel: Disable input and output buffer when switching to GPIO"),
> > the driven value on the pin, which might be used as an IRQ line, brings
> > firmware of some touch pads in an awkward state that needs a full power off
> > to recover. Fix this by, as stated in a culprit commit, disabling the buffers.
>
> Linus, since we are at rc7 I'm not going to send a PR for this single
> fix (I truly do not expect anything to come). Please, proceed as usual
> (either to v5.10 or to v5.11 cycle, there is not much difference b/c
> culptin is sitting in v5.9).

OK no problem, I applied the patch directly for fixes so we get it in ASAP.

Yours,
Linus Walleij
