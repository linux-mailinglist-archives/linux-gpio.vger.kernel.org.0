Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 430F52D579
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2019 08:25:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725895AbfE2GZY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 May 2019 02:25:24 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:41203 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725882AbfE2GZY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 May 2019 02:25:24 -0400
Received: by mail-lf1-f65.google.com with SMTP id 136so1002360lfa.8
        for <linux-gpio@vger.kernel.org>; Tue, 28 May 2019 23:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=B3lbQE2t8tEmVgt9o6GAQQq8+7jHXGWM6mCYIQ8+ya0=;
        b=wB0SFRtWdBS25FQwlxgDqoioG2JMCee1JO3trlXkUEQlwE8zKjg/0L5wXHjxb6GlVB
         wCA675RduQm0PynujnXytmOLpubVnOiDtA1jsfD68ihLy3uycaOsC5prWWrpvaxXJHZB
         p/pNvNjFXyXNSlYbSkE7FkEvK3p25Y/EocbjlC3XXWv7xYIEwAKk1Q58/2t9fVcmVpqJ
         I1qPVajgcAQPWILGcRQ/Y+h9LmTK0hIhh5Fm+XFXBPzwVlZliQ+7TfXEd7oI4hUM6dO7
         EAkyjLrzp7jk+zSRvQ4WqFup9N5s8CihTyK7soQmS41HjdWsVDe16OYsmbzhB4A1Hi2N
         X1dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=B3lbQE2t8tEmVgt9o6GAQQq8+7jHXGWM6mCYIQ8+ya0=;
        b=QUKGJYs294FVbEwkrsqaSjkcpE/g/jyzrMmULguh2SXfVjM1RJqsTTDWOpQsUDZHqJ
         b8mh7EnvZg6YagI6vo77LctpUVOuq3UYX+EJcWBoT0vp8YMRvFto13svGlvet+nfhBzf
         i9kv5qkesA+xXbwcpg3f/f9O5yqA1YOpXSVF+TiVUJZbJyDJjh2VU/Bk4oAgfa6F9BjQ
         KQjkqxpYCpiL58XOaYM3mF2AvyV7nc4cmAmltK4drXttkSz9Syq4A9ZHcFyya0uMGiPd
         S0F2xaP+8OEnQqZFJfpG7JQnY/9cT/vF0IWZAmxhiAsnfJTfBEE+fEOEFAcINOKHpG26
         qmaA==
X-Gm-Message-State: APjAAAUk1vVYpL7g3nGoYMrP85vOfRMAjOXlGQpS5aI+igduOqzfUEEB
        vtpWA1DEIHcSaKEeRhLYdDlrlM2DfhJQCuDrG+RMfA==
X-Google-Smtp-Source: APXvYqyBA+PSZZeZoqBiwk392JIbs7Yf+lJ3Xxyzvxrpibt4Wud2QcvuMDANB9aB6ixnoZPeTgRp6Q+/XUyoyxxWkUw=
X-Received: by 2002:a19:ae09:: with SMTP id f9mr1609906lfc.60.1559111122621;
 Tue, 28 May 2019 23:25:22 -0700 (PDT)
MIME-Version: 1.0
References: <CACRpkdYFqcu=gz57H-+h5C3g_rvD-+XoRTw_A86PKDVA3=rfJg@mail.gmail.com>
 <CAHk-=wgZBfGwnyRGjziYvPMssSf7XO+7L_FTGfkR9Gz031VAzw@mail.gmail.com>
In-Reply-To: <CAHk-=wgZBfGwnyRGjziYvPMssSf7XO+7L_FTGfkR9Gz031VAzw@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 29 May 2019 08:25:09 +0200
Message-ID: <CACRpkdYP+i8VQBm_1wr+SrW4QQ-hHO4jNT3Ln-z67ngphuQgbw@mail.gmail.com>
Subject: Re: [GIT PULL] pin control fixes for v5.2
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Amelie Delaunay <amelie.delaunay@st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 28, 2019 at 6:44 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> On Tue, May 28, 2019 at 1:44 AM Linus Walleij <linus.walleij@linaro.org> =
wrote:
> >
> > The outstanding commits are the Intel fixes [..]
>
> Heh. Swedism? "Outstanding" in English means "exceptionally good". I
> suspect you meant commits that "st=C3=A5r ut", which translates to "stand=
s
> out".

Dammit it is a Swedishism of course, it happens when I'm stressed.
Luckily there is another one on the other end.

Thanks,
Linus Walleij
