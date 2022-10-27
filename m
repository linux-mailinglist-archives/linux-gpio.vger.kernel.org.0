Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9812260F1CF
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Oct 2022 10:06:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234847AbiJ0IGS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Oct 2022 04:06:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234900AbiJ0IGF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Oct 2022 04:06:05 -0400
Received: from mail-vk1-xa2a.google.com (mail-vk1-xa2a.google.com [IPv6:2607:f8b0:4864:20::a2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B1DB7E014
        for <linux-gpio@vger.kernel.org>; Thu, 27 Oct 2022 01:05:59 -0700 (PDT)
Received: by mail-vk1-xa2a.google.com with SMTP id g16so305230vkl.11
        for <linux-gpio@vger.kernel.org>; Thu, 27 Oct 2022 01:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PbjvvTryxfYTd4fXObbLTLqvoSuq5m9bVnDqafRtL6Q=;
        b=MJnbbJvxrPAY/hEvqiH9wuVnCxgVktvwnSvEAr303cvIhEhA+R6ch2CNUxxPwuF9Lf
         B+Rstqt+DanGWd5f1bss6ZDP7IUIP7iRhR+FDtMP4NXIfOqz9Iqys34XNqufNlQ32ZIZ
         Bt43SfYw2biHUF2Gbb1z3RDuiIEgBdU7pK6BBmUn0ixTkiOAPNwtWaW2FJ0LXEkNiPsV
         bAnuiopds4I0E7YwEl6uzNsMf5MGJn9W0uDZviwd2xmkwruMiaxkXhlTn0Qs+08sh6vO
         OZqOdROtBmGwvZuCk7Q+NeAjDZ/pFoJgDvTltQi33oQcjQ0LcXnrlT6oqeUGgglMOpwR
         1m2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PbjvvTryxfYTd4fXObbLTLqvoSuq5m9bVnDqafRtL6Q=;
        b=jYIGv4+wjcdl5D7wfQa9ktEVAnpwsIXsh6irmVb2P6QbDjaIwK43kFfBjbcdAU2sac
         das/VYjHHMUzws0YhMMtOq/Wxe8pywwIpTNG/rc5ZR6pt4foOQu0N6TjCHI+d2zLEs3+
         7eb9NEWEesunZU6opJ5rr7389J/pKwvIjGIUlED3NwcC/n5reFfMPhrHSvHZD516AQHt
         TnInhfwGv202cA+WmT2c+F/k9nO9rxqBaQSHt3/mwSp31NDubB0F/j67NY2ilcehF7qo
         9f8Z/roUFsRjmUM/1qtz53uWnHtTmJqbDGO43NyEJQ+CSFQ8jqORM5gqTYtqYXtiyvfA
         2FpA==
X-Gm-Message-State: ACrzQf2AQszAlcwZtHRchgyEh4MZB2FIAa/GzX/vBGFys0u4vFOoeQMu
        RucHnwfcqjJJKrUuBgPuiFjg5JFX+CEdcxhIuRcgRg==
X-Google-Smtp-Source: AMsMyM7R6WPx6q5LmdolFABQ4jE7ZWCKIA2uN+JbJAdp/SSzVYMRV8msQR/uxRMqRYJXGsYSoNe5G6Ih4Hh/ypphm6U=
X-Received: by 2002:a1f:2455:0:b0:3b7:88a4:c121 with SMTP id
 k82-20020a1f2455000000b003b788a4c121mr7970733vkk.1.1666857958599; Thu, 27 Oct
 2022 01:05:58 -0700 (PDT)
MIME-Version: 1.0
References: <20221026123425.498912-1-brgl@bgdev.pl> <20221026123425.498912-3-brgl@bgdev.pl>
 <Y1kt1iHYpbZGaND4@smile.fi.intel.com>
In-Reply-To: <Y1kt1iHYpbZGaND4@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 27 Oct 2022 10:05:47 +0200
Message-ID: <CAMRc=Mf3_0+w6COjE6zYMP4v6dXEUPwWbcfw98sRehn0N2oFeQ@mail.gmail.com>
Subject: Re: [libgpiod v2][PATCH v4 2/4] bindings: python: add examples
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 26, 2022 at 2:53 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Oct 26, 2022 at 02:34:23PM +0200, Bartosz Golaszewski wrote:
> > This adds the regular set of example programs implemented using libgpiod
> > python bindings.
>
> ...
>
> > +if __name__ == "__main__":
> > +    for chip in gpio_chips():
> > +        info = chip.get_info()
> > +        print("{} [{}] ({} lines)".format(info.name, info.label, info.num_lines))
>
> In all of them I would prefer to see the main() explicitly, like
>
> def main():
>         ...
>
> if __name__ == "__main__":
>     main()
>
> (In this case the module can be imported by another one and main be reused)
>
> Also have you considered use of SystemExit() wrapper?
>
> ...
>
> > +                    sys.exit(0)
> > +
> > +    sys.exit(1)
>
> Is it in the original C code?!
> I would expect that no chips -- no error.
>
> ...
>
> > +if __name__ == "__main__":
> > +    if len(sys.argv) < 3:
> > +        raise TypeError("usage: gpioget.py <gpiochip> <offset1> <offset2> ...")
>
>         SystemExit(main(sys.argv)) ?
>
> > +    path = sys.argv[1]
> > +    lines = [int(line) if line.isdigit() else line for line in sys.argv[2:]]
> > +
> > +    request = gpiod.request_lines(
> > +        path,
> > +        consumer="gpioget.py",
> > +        config={tuple(lines): gpiod.LineSettings(direction=Direction.INPUT)},
> > +    )
> > +
> > +    vals = request.get_values()
> > +
> > +    for val in vals:
> > +        print("{} ".format(val.value), end="")
>
> > +    print()
>
> Without any conditional it will print an empty line, was it originally in the C
> variant?
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

Thanks Andy but this is unnecessary churn, these are literally just
code samples. Unless some new issues pop up for the other patches,
I'll leave it like that and apply it to master. Then we can work on it
further in there.

Bart
