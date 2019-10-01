Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 002F0C30C2
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Oct 2019 12:00:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726349AbfJAJ7A (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Oct 2019 05:59:00 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:41877 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725765AbfJAJ7A (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Oct 2019 05:59:00 -0400
Received: by mail-io1-f67.google.com with SMTP id n26so17813684ioj.8
        for <linux-gpio@vger.kernel.org>; Tue, 01 Oct 2019 02:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=4+D66yQ1XKt+D031cr690YzqRQkc0yeAkqK1XV5/0I8=;
        b=w9Q9l7i50MhvL+34yCWYD+B3rDKo0/O55Ga5W+YLsaizENRIGygtUzu0O+uiVpOm33
         41rKEC09scVfx6DOhvQilfnNkkvbb9i13wfQRxV/QNIxkvVEm+9UNnpDndZuvdAa/bod
         e8oaAxxu9M9ndSfLdK17AjaKXGva1R8sUvQqoRE5/S2zBpmPJWFrYZBOJ74OKA9JW8CS
         3BqXMjokCLRGazRQU1GvL2OlOfXfAnWvxQ4pmR3iXMWFfyywDwiPeW1au1vZb1EAQHqX
         neZPgdAJKvAT56OTZN8Dk2RqER61r4QbToqbrUpNQF8mwL1Wle7vL5JwMnR6GwkmYIiL
         yaGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=4+D66yQ1XKt+D031cr690YzqRQkc0yeAkqK1XV5/0I8=;
        b=AxY7iwjbpzng/kLHba4dHc1InSd2dVti66s+CEL8z2BhIMWp4K09rh9HcpnnQxDvPR
         J/8GLlm7lGCdqzQgsBEulUulp69dIuJqjhzt2RCjac7V/QYgAPn+uq1RMT+xvBL+Lpkb
         f4f3gtxIp95FyFUR0WSFvyLQLIZpiFTQCkGSOxTQZe8Xwrz4GQZkjP1w7Ex/aox8nZP3
         4RwIF1N8X+lXSWaWwtb7zof8GXnilyA+JAt0zIKw9XzMlU61itGP4C6PNFAgzMcKh3rU
         DSLwP7CM55/Bf68OkjcxwyImoCQkn7AQx3kXfxaepa2oiA8jm93vjfUrKRXyZLzS9lXe
         NwYA==
X-Gm-Message-State: APjAAAWK5J+1MH/RZnla6udrgDSuFt8rHcx6GdwASvzQ6PqclVNZRGLD
        toYQtPpfVVOiC4DETowdlCGbqHFkN3ZaaljJjgD52g==
X-Google-Smtp-Source: APXvYqxv7evUpx09uWrXctIA7vmC7mHZOXLyVWlsBou0ow8G4n3Z3A3MDdQZCAOeyyN5ioPq4KWW9/EUg2ByR/HrhEk=
X-Received: by 2002:a5d:8911:: with SMTP id b17mr25433333ion.287.1569923939163;
 Tue, 01 Oct 2019 02:58:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190919132403.1835-1-brgl@bgdev.pl> <CACRpkdaiKzbE6bKX+Wg-KxO1QkG3245evvaM-xCNgDTYdf-qKg@mail.gmail.com>
In-Reply-To: <CACRpkdaiKzbE6bKX+Wg-KxO1QkG3245evvaM-xCNgDTYdf-qKg@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 1 Oct 2019 11:58:48 +0200
Message-ID: <CAMRc=Mdvx7E-PO7eST-A9n3TM+YuF7p0t2_u5KEqsm7BJd4EWQ@mail.gmail.com>
Subject: Re: [GIT PULL] gpio: fixes for v5.4-rc1
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

wt., 1 pa=C5=BA 2019 o 00:12 Linus Walleij <linus.walleij@linaro.org> napis=
a=C5=82(a):
>
> On Thu, Sep 19, 2019 at 3:24 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote=
:
>
> > please pull the following set of fixes. Two are core code, one is a fix=
 for
> > a driver. All are stable material.
> >
> > The following changes since commit 4d856f72c10ecb060868ed10ff1b1453943f=
c6c8:
> >
> >   Linux 5.3 (2019-09-15 14:19:32 -0700)
> >
> > are available in the Git repository at:
> >
> >   git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpi=
o-v5.4-rc1-fixes-for-linus
> >
> > for you to fetch changes up to a94b734a563498ac4b8fff61179a3c2bba781a4e=
:
> >
> >   gpio: eic: sprd: Fix the incorrect EIC offset when toggling (2019-09-=
17 10:08:35 +0200)
>
> This doesn't work with v5.4 for some reason:
>
> $ git pull git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git
> tags/gpio-v5.4-rc1-fixes-for-linus
>
> remote: Counting objects: 16, done.
> remote: Compressing objects: 100% (16/16), done.
> remote: Total 16 (delta 7), reused 0 (delta 0)
> Unpacking objects: 100% (16/16), done.
> From git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux
>  * tag                         gpio-v5.4-rc1-fixes-for-linus -> FETCH_HEA=
D
> Auto-merging drivers/gpio/gpiolib.c
> CONFLICT (content): Merge conflict in drivers/gpio/gpiolib.c
> Auto-merging drivers/gpio/gpio-eic-sprd.c
> warning: inexact rename detection was skipped due to too many files.
> warning: you may want to set your merge.renamelimit variable to at
> least 1294 and retry the command.
> Automatic merge failed; fix conflicts and then commit the result.
>
> Do you think you could rebase on the v5.4-rc1 and send me a new pull
> request? I'm afraid of trying to fix it and screwing up, so would prefer
> a rebase.
>

Done. This was due to some functions being moved around during merge window=
.

Bart

> Yours,
> Linus Walleij
