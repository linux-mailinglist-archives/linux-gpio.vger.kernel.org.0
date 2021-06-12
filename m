Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48DB13A5168
	for <lists+linux-gpio@lfdr.de>; Sun, 13 Jun 2021 01:43:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231537AbhFLXpg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 12 Jun 2021 19:45:36 -0400
Received: from mail-lj1-f181.google.com ([209.85.208.181]:46754 "EHLO
        mail-lj1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229753AbhFLXpg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 12 Jun 2021 19:45:36 -0400
Received: by mail-lj1-f181.google.com with SMTP id e11so14632688ljn.13
        for <linux-gpio@vger.kernel.org>; Sat, 12 Jun 2021 16:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EalsWCsJFowLNEVzhHm1lWSLDTCxtWmvVNOXoCrUtK4=;
        b=qOJJIbR060xrNQHnk0XLKImR3pOcj8QGUb5xK7ELblqTmEZCJS74j5gnq75g6c75tM
         SB0myegq6lBMPc4bUkFKrTklaFAjqPcpJyoRg6zq4HbKg42cridHytx8kpKJFALyPZpJ
         9Mk96WWfvHS5dh57lEXwD9TjrjrcMGqSnikJKNKzX+ITJWB/n96OFhtmqTaMmS/R9JoY
         AXBnemHAsv/HReUZO1/tCGIAdjbHBv1rufuuipJygQzxyhGQaug4vfWPBgArf6fNOm/A
         qJpBhPqgNmrHft+errrFrMOQbA9xi6fE31x975qPWSYqUe39QFgD4+VDmZxMxPhbX9qd
         AkAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EalsWCsJFowLNEVzhHm1lWSLDTCxtWmvVNOXoCrUtK4=;
        b=K1LBL9kLAg9wwtlbAyCx9qali33wipAsUn0bsf2h6UJ3REsCP1jkqVhmKTjZWWs9NB
         7FomvhSQPIWw107xIozhfvbee3ry13DmOrDb9tkNWsKrKDRrq4xPwClj7b2q295P6dFQ
         YwocqEynoPKFHO6qDBLS7XslbYq/oWPTQQpNbvL0qXq38Npn9m56RWf9Y1T6a6A5eECa
         9J4OdHNyNA1MvpaPATJfREUtqLET8PpSJMNWAOioV85PQjTR1knlljPe0Xj/ZpxxFXcb
         mD+E41d87wepXVER8tfKp9nLUf+tQ1lggg0ySfRpEBq5pBrUZX6qxzvCTWeCBhiwOGou
         Jwfw==
X-Gm-Message-State: AOAM531YE6lsp9/wLVm/PbeJ8IycYJtsN4So7QfEe4mWlYw3DmQYPrWE
        BueL0pDt1xw9chk8rYzAESmmqk82z8NQvTATGLoRhQ==
X-Google-Smtp-Source: ABdhPJwvMYaCQCF2p+5B/CtmW0lS6oDnONI/Ya3Cit+nOauN/KUqE6E8NhPu/QyOamnq8hlhvD6xdP67LkzNK28LxaI=
X-Received: by 2002:a05:651c:1501:: with SMTP id e1mr8477025ljf.74.1623541341035;
 Sat, 12 Jun 2021 16:42:21 -0700 (PDT)
MIME-Version: 1.0
References: <CACRpkdY+DKx-c+74b2xiGQ2H9+e2yeup+HEqg1+u1nvQoO6pXA@mail.gmail.com>
 <CAHk-=wgRA2B1b0gn18t+e_TaJdJGQ8Lurpw7qmyZZmQaGwZo8Q@mail.gmail.com>
In-Reply-To: <CAHk-=wgRA2B1b0gn18t+e_TaJdJGQ8Lurpw7qmyZZmQaGwZo8Q@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 13 Jun 2021 01:42:09 +0200
Message-ID: <CACRpkdZfxcauTRbFwtFbUgbLV_p79fTL_9XdPgZNhiS5Hi1ViQ@mail.gmail.com>
Subject: Re: [GIT PULL] pin control fixes for v5.13
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jun 12, 2021 at 9:09 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> On Sat, Jun 12, 2021 at 3:07 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> >
> > are available in the Git repository at:
> >
> >   git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git
> > tags/pinctrl-v5.13-2
>
> Nope, not there.
>
> I think that "linux-nomadik" is bogus, I do find those commits in the
> usual "linux-pinctrl" tree.

I see you found it, a bit of hide-and-seek in the weekend.

> How did that odd thing happen?

When I issued request-pull I took the git:// URL for the wrong tree
and didn't notice. Oh yeah it says it can't find the branch on the remote
tree and that I ignored because sometimes the public mirror take
some time to sync up so that message is not uncommon. I think
I'll start waiting for the message to come back OK... It is there for
a reason.

Thanks for figuring it out.

Linus Walleij
