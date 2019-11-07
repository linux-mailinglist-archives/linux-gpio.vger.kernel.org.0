Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94FBCF28EA
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Nov 2019 09:15:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726791AbfKGIPf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Nov 2019 03:15:35 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:39664 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726734AbfKGIPe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Nov 2019 03:15:34 -0500
Received: by mail-lf1-f65.google.com with SMTP id 195so873771lfj.6
        for <linux-gpio@vger.kernel.org>; Thu, 07 Nov 2019 00:15:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ddu1jpN900ZYw8O2527aC0Qt1kxo8E2DHWggSrL8BkA=;
        b=s8Gr3BoVtXMT/Fb7k5L9tJbyp3KDE6/8ODrdgh3PTNxUoQ6QzlDAs7mYfYdFczW2ZP
         sQiWPKaG06EXfzjFEZn/G0pwSp7ve/HNU0PGv8P5Ht4J/rf5ifK4t63LWYsPDpoPHNev
         avrBqsDGp7wCgogRfGQIIOkRWyu/4n+uAtqpKZs0SEY/b1CK6fwbCkc7FBm5ZUGbW43E
         4jfT0vcH/CV3bLDszK1HNowBQSk1ZLX1e2HdmpNXNpBnFtL/wIQSUviM73revyjNLo3C
         voE42LyLYSaXAwDlX65a+1P/M0rCIGlFc/al1Wat71fu+ecCuqVtmITd9aEIRJWkrU1K
         9FwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ddu1jpN900ZYw8O2527aC0Qt1kxo8E2DHWggSrL8BkA=;
        b=Kok91+1sWAbRqYRid2RcLVIqbXAQkl0b1IZlRCbtGj3uVJkFlCt5zMlOt1YiB4Ay38
         aQxe3Y6y/keipb1E8+IRKFWq7n3E0SFbXuvivU7sCqxm7cdh8ukCCNM882qdLuQogxZ+
         p0oHROpKMvE8TOaykGyGdkGNI5Dk7tuIGSMTz9A9yl3TGRXgYYHeEPwUnHJ8YcZEDX6t
         JuBoNEDANbSYcEdie24b01in1bwyyeFwirdEDPzVdTYY4b0JcZkLJXXnuAQ7TerS1m14
         sqHg7y+Ksfd7MLMc4PwEU1u/bV9RNe9ZKE777TSjuQRU87Ij92+bWDL3HduClra3sQe1
         om1Q==
X-Gm-Message-State: APjAAAVXLNcC6LNgATS83Y8Pi+zq0iXCqlZJas3HX7EH94INelagBt69
        4hnmu9RmIxxY6i8XiT+tNYY69dHQ2AJHPQt5gks5bg==
X-Google-Smtp-Source: APXvYqww5bQPnZN3NrQQtclGOU1WQ8bslsEpjPP5aLvQl+V5ZxWWIobqARd/TgCXuy71plqbep1x1/xXRUOzWfZqWQk=
X-Received: by 2002:a19:855:: with SMTP id 82mr1443368lfi.44.1573114533151;
 Thu, 07 Nov 2019 00:15:33 -0800 (PST)
MIME-Version: 1.0
References: <cover.1572945605.git.matti.vaittinen@fi.rohmeurope.com>
 <d25edcc3a5d912be9d7c3a927bad6baf34a1331e.1572945605.git.matti.vaittinen@fi.rohmeurope.com>
 <CACRpkdav+Sz04WE6N5KkKMQLOtx2BZrjWrEin06yPZQ31a47hg@mail.gmail.com> <d1d33dee96a4dea71a14dfdb6d590beade529c2c.camel@fi.rohmeurope.com>
In-Reply-To: <d1d33dee96a4dea71a14dfdb6d590beade529c2c.camel@fi.rohmeurope.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 7 Nov 2019 09:15:21 +0100
Message-ID: <CACRpkdaFzW5BGgK=p8MANJn23VC5X2oBh4oYhZJOOBPT2aJmSQ@mail.gmail.com>
Subject: Re: [PATCH 02/62] gpio: gpio-104-dio-48e: Use new GPIO_LINE_DIRECTION
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Cc:     "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "vilhelm.gray@gmail.com" <vilhelm.gray@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 6, 2019 at 7:58 AM Vaittinen, Matti
<Matti.Vaittinen@fi.rohmeurope.com> wrote:
> On Tue, 2019-11-05 at 16:23 +0100, Linus Walleij wrote:

> > Oh the patch bomb already dropped, hehe.
>
> I was slightly impatient ^_^;

No big deal.

> > Anyways I want one
> > big patch to apply. Please make sure it applies on the GPIO tree's
> > "devel" branch.
>
> Right. I guess I can do that.

Thanks!

> > Collect any ACKs and drop most from the CC else the driver
> > maintainers may get annoyed.
>
> My problem is that I don't know who are the driver maintainers I should
> keep and who I should drop. I don't usually know who are interested in
> which changes.

The process is not perfect, just some best effort is fine, as subsystem
maintainer I do merge mechanical patches like this across all drivers
without consent of every possible stakeholder, it's impossible to
involve everyone.

Yours,
Linus Walleij
