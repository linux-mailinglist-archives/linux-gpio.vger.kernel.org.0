Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18BA8578D2
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Jun 2019 03:00:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726776AbfF0BAe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Jun 2019 21:00:34 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:64609 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726687AbfF0BAe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Jun 2019 21:00:34 -0400
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id x5R107Tk025524;
        Thu, 27 Jun 2019 10:00:08 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com x5R107Tk025524
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1561597209;
        bh=6VB1wZsBwsm/iN1345MEJ8y/YbQrBvHe3gm/fQA66sE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=AbMqleUMF8WbkQW/DZ3atN0QXRNxLPw1q18m3uoTLxht9p+MrEed4X9Jmc5MmzRat
         Exup6cH8GnliIiLsAE3f7+FeXtGhyrA2hPWu+hybbjiYJHJ95Hb/6TGEfqZxQud11A
         1V9yJdKLQUu/VeS276NrdtEfdk7RGnbK+wKej3kIhwRu8oXlVpp+I1o/JpDTaZXApu
         xhKPOozi6OodXtOtgJY0ythGVq3ePMAVx+g8HeCA83jsyo68fuxvre14nq0kkO7kp9
         +H3HOxj4IatIV8cO2zzX12Ko5sf0mk+r1dR6q7Okctrir/tYNiVNKosCn1ymbS0Zjy
         4Vo9MZCbMFrAA==
X-Nifty-SrcIP: [209.85.222.49]
Received: by mail-ua1-f49.google.com with SMTP id j8so195737uan.6;
        Wed, 26 Jun 2019 18:00:08 -0700 (PDT)
X-Gm-Message-State: APjAAAWK9L5KAnawsipEw2w76cfJka2gw6fEyMULVXXiWgAtUFVgWZ7W
        ac/k3YTo7vPyzaLJjFMJ7rMetjqcIQ6KA3TLgMA=
X-Google-Smtp-Source: APXvYqwk0+dMb6B8alF8LE6yyL8exB7smiJopBH6EsTaiAnUD0pn7i1JY5b+amt9LwdZKsr1URzpxGEsZHMuJkQfBGg=
X-Received: by 2002:ab0:234e:: with SMTP id h14mr666049uao.25.1561597207108;
 Wed, 26 Jun 2019 18:00:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190613015532.19685-1-yamada.masahiro@socionext.com> <CACRpkdb1MySnzCVGb6v1KovmgJtagKeSe+mrPvsVOJz_s198eA@mail.gmail.com>
In-Reply-To: <CACRpkdb1MySnzCVGb6v1KovmgJtagKeSe+mrPvsVOJz_s198eA@mail.gmail.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Thu, 27 Jun 2019 09:59:30 +0900
X-Gmail-Original-Message-ID: <CAK7LNATUh+c=iUBiNe0ooV3ZykUpS4B3Bj93K7yJ9osgUH+=vA@mail.gmail.com>
Message-ID: <CAK7LNATUh+c=iUBiNe0ooV3ZykUpS4B3Bj93K7yJ9osgUH+=vA@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: remove unneeded #ifdef around declarations
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 25, 2019 at 5:52 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> Hi Masahiro,
>
> thanks for your patch. For some reason I managed to pick up
> patch 2 before patch 1. I applied this now with some fuzzing.
> (Please check the result.)
>
> On Thu, Jun 13, 2019 at 3:55 AM Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
>
> > What is the point in surrounding the whole of declarations with
> > ifdef like this?
>
> I don't know if it is generally good to have phrases posed as
> questions in a commit message, we prefer to have statements
> about the change not a polemic dialog.
>
> >   #ifdef CONFIG_FOO
> >   int foo(void);
> >   #endif
> >
> > If CONFIG_FOO is not defined, all callers of foo() will fail
> > with implicit declaration errors since the top Makefile adds
> > -Werror-implicit-function-declaration to KBUILD_CFLAGS.
>
> Maybe this flag was not in the top Makefile when the #ifdefs
> where introduced?
>
> > This breaks the build earlier when you are doing something wrong.
> > That's it.
>
> Good idea.
>
> > Anyway, it will fail to link since the definition of foo() is not
> > compiled.
> >
> > In summary, these ifdef are unneeded.
> >
> > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>
> Pushing this to the zeroday builders and let's see what happens!


Sorry for my terrible commit message and offending response.

I appended a new commit message below.

If you are OK with rebasing, please consider replacement.

--------------------------->8----------------------------------
pinctrl: remove less important #ifdef around declarations

The whole declarations in these headers are surrounded by #ifdef.

As far as I understood, the motivation of this is probably to break
the build earlier if a driver misses to select or depend on correct
CONFIG options in Kconfig.

Since commit 94bed2a9c4ae ("Add -Werror-implicit-function-declaration")
no one cannot call functions that have not been declared.

So, I see some benefit in doing this in the cost of uglier headers.

In reality, it would not be so easy to catch missed 'select' or
'depends on' because PINCTRL, PINMUX, etc. are already selected by
someone else eventually. So, this kind of error, if any, will be
caught by randconfig bots.

In summary, I am not a big fan of deep #ifdef nesting, and this
does not matter for normal developers. The code readability wins.
--------------------------->8----------------------------------




-- 
Best Regards
Masahiro Yamada
