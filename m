Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CAD5452726
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2019 10:53:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730978AbfFYIwx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 Jun 2019 04:52:53 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:43822 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730781AbfFYIwx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Jun 2019 04:52:53 -0400
Received: by mail-lf1-f66.google.com with SMTP id j29so12023773lfk.10
        for <linux-gpio@vger.kernel.org>; Tue, 25 Jun 2019 01:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6sVy1ZdjISYZ4x2JdrMT9LI1XuB2hh4y/prk76ssgW8=;
        b=G3KRAhAGe1qA98XT+tNHwa6bfkqWZJ5R3S16P7b1ifCEGfzYc3qRb9OR5cQ1pA/RAD
         sbtplkiwf81OLc1zT+WYjzWFq2429RCTZOnLkcf4QinyL/0XQ1lkYPiWnOCt0jOpliOo
         yhcyXb2W1TyqBurZptQzuoYglnr+ocZF0b6rUitx9tlT23mwMsz41LZrAbd/h98BZGXu
         YRDc8ns+UFRDXEk7nIKRpIJckJt2v5cEP4Mnwi1YeO1sXDVdVzo5vIsEFdDMZYf9Levx
         tNjVXQJK9c3sLR59Hfb2xcviF5y9fxomKTljgGSey8+PPsn/LjsTdnytJS+AbSvsTmgA
         TY5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6sVy1ZdjISYZ4x2JdrMT9LI1XuB2hh4y/prk76ssgW8=;
        b=Vse/OcUD4TCQtQZ99q1dTMjOu10DhoZU5AP8TkYyxXbtHAVj6aAdaF4XjgtgvDmBzB
         o/3Mg/SEYzrqdQnDOFXpnHuVDNtQY2OdPt5O6hpUnxAAwYBCdVPcGkhddOSaPzj0aFGo
         Hlbv/EL7s9HKuPOdIRMbAMgAiY5r/BzJahQwVd9EeyAyxPXK1D7yMIzAhrneEW1aIJ/3
         xbRltip2kH9hLHHazzzO+vtHgQekpd7eMpFMammVBxXomzqxloP3znuQp8WBmhDR3VQR
         s9yFnF+48+3p9fPn+rdAZrdBeHSHVEIob7JRAdVT1zn1UMA7rPz73CUlcmjcB65wAecY
         EMdQ==
X-Gm-Message-State: APjAAAVn69dFwVpVxzI+i8jZivs5XS88wW2QSd7vDInjCEe1F0izn4aH
        7NsNRP4u5qUpol1NbMslqdLiJqNKz1ap9bNGGsQT7Bpg
X-Google-Smtp-Source: APXvYqyE2yJaybeR4mT7wbfZf/tS94S/SlU0cAeCtceLJiDRJCRt6joGVNWjbcfYTBxGjyPWLwAjVeBQRiHmFRfChkI=
X-Received: by 2002:ac2:4891:: with SMTP id x17mr28602618lfc.60.1561452771554;
 Tue, 25 Jun 2019 01:52:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190613015532.19685-1-yamada.masahiro@socionext.com>
In-Reply-To: <20190613015532.19685-1-yamada.masahiro@socionext.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 25 Jun 2019 10:52:40 +0200
Message-ID: <CACRpkdb1MySnzCVGb6v1KovmgJtagKeSe+mrPvsVOJz_s198eA@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: remove unneeded #ifdef around declarations
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Masahiro,

thanks for your patch. For some reason I managed to pick up
patch 2 before patch 1. I applied this now with some fuzzing.
(Please check the result.)

On Thu, Jun 13, 2019 at 3:55 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> What is the point in surrounding the whole of declarations with
> ifdef like this?

I don't know if it is generally good to have phrases posed as
questions in a commit message, we prefer to have statements
about the change not a polemic dialog.

>   #ifdef CONFIG_FOO
>   int foo(void);
>   #endif
>
> If CONFIG_FOO is not defined, all callers of foo() will fail
> with implicit declaration errors since the top Makefile adds
> -Werror-implicit-function-declaration to KBUILD_CFLAGS.

Maybe this flag was not in the top Makefile when the #ifdefs
where introduced?

> This breaks the build earlier when you are doing something wrong.
> That's it.

Good idea.

> Anyway, it will fail to link since the definition of foo() is not
> compiled.
>
> In summary, these ifdef are unneeded.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Pushing this to the zeroday builders and let's see what happens!

Yours,
Linus Walleij
