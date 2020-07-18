Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA54F2248A2
	for <lists+linux-gpio@lfdr.de>; Sat, 18 Jul 2020 06:25:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725763AbgGREZz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 18 Jul 2020 00:25:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725372AbgGREZz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 18 Jul 2020 00:25:55 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33EB5C0619D2
        for <linux-gpio@vger.kernel.org>; Fri, 17 Jul 2020 21:25:55 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id l6so6246176plt.7
        for <linux-gpio@vger.kernel.org>; Fri, 17 Jul 2020 21:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Gn+1oJ/W4PWZPcp/x0FJpcDKALoEGh5RUDkh7FtXjeM=;
        b=iwTWJ8DXnuzVKnsSi1K7n6b2nC6xqHbe1N6vIdG7WNRYgl6MHiQdPL6DjR2Rwm7hfw
         lOl4iqhqB+bCSXpq4VGB5P3DUCA6gungWfRvr5/lDe24TMGBENAVWP6Y3x+Q59pV1GBe
         rczSIAUKXTpSqQzuEEKaUcTDGdNPsTrASTIVppFd3fr6rRojcW/iOUOGsN+cRDAllNt7
         jDFkqkGqyucmXsPIk5EuS9jOMoyoo4EdCsjNLsVckn/ZKgQqsxSm1E3nzxw2o7WzL0ii
         ooOq3fPPpV88FKVT40nLnWQBJLz5sgI+aE+scxybtHgv54TAisqY9lIo5sLL5t4Mc1q+
         ac2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Gn+1oJ/W4PWZPcp/x0FJpcDKALoEGh5RUDkh7FtXjeM=;
        b=D+cdU1hCShayuikwUJJ941lvw7JfIVfc19+QxH36XgKB5ZyZtRGDqQkLwdT617ond8
         RBnVyYkuMW/hkm4d2lFDFXOBQmIaksYO9xTF/77YMiZIRqauPUheBIWFp7JYc+q0tNIQ
         jO80SIM2GGOL1is+jUjfP1OFuGlXBxAsLzS6rFcCiASLRpqmyPtmkk/N4iFyF3Z44h+9
         rN4j+VVuajlRt1WVFxZ/cUGWriCF7jfbPYtvH7xiCMlLqcdClND2tXgPNX29Hfw+46Ba
         vSrztLkFtZfimpZ1+tbF+K6E7Qv/FiStrXz18RmP7j5OxIvoF1PbllF+/oITuuAFJYjt
         DQ0A==
X-Gm-Message-State: AOAM532O05tN1RNm3fE63AW1wPY3htPabdKjaY786tVnaUc83huNJLdP
        rZTbGCSV1VoEvR6lYaQWu70=
X-Google-Smtp-Source: ABdhPJzJg4dlDibAVN1E/V4zohFHP4xfrW5hUm4uMZ7QsaLW+eGACWPNatQSw8Ux1HtXMU3bMdtsjw==
X-Received: by 2002:a17:90b:1045:: with SMTP id gq5mr13007802pjb.30.1595046354525;
        Fri, 17 Jul 2020 21:25:54 -0700 (PDT)
Received: from sol ([118.209.58.72])
        by smtp.gmail.com with ESMTPSA id 207sm9206077pfa.100.2020.07.17.21.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 21:25:53 -0700 (PDT)
Date:   Sat, 18 Jul 2020 12:25:48 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Maxim Kochetkov <fido_max@inbox.ru>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: gpiolib gpio_chrdev_release duration is about 30 ms
Message-ID: <20200718042548.GA43247@sol>
References: <7eb11c0d-cd11-f873-c336-4ec955a7bdb3@inbox.ru>
 <CACRpkda-pXF71vr5v90yipKubc14tbZW5Ryw1o7rdn4FbWwsTw@mail.gmail.com>
 <190bca20-946f-52f9-64f8-8971da17d38b@inbox.ru>
 <CAHp75VfQdTtbiHjhBuf3czdKAgmiQeALo7CaqW36oEkSGSHUBA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VfQdTtbiHjhBuf3czdKAgmiQeALo7CaqW36oEkSGSHUBA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 17, 2020 at 06:07:04PM +0300, Andy Shevchenko wrote:
> On Fri, Jul 17, 2020 at 5:17 PM Maxim Kochetkov <fido_max@inbox.ru> wrote:
> >
> > I need a small userspace program to do some GPIO magic to communicate
> > other hardware like devmem. This program takes about 2,5 seconds just to
> > find GPIO lines by name.
> >
> > replacing synchronize_rcu to synchronize_rcu_expedited in
> > atomic_notifier_chain_unregister gives the same boost as removing
> > synchronize_rcu
> 
> Have you tried to replace an atomic notifier call with a regular one?
> IIRC it's still not clear why atomic is used there.
> 

Indeed, I recently submitted a patch to switch the
atomic_notifier_call_chain to blocking_notifier_call_chain, as some of
the chained calls can sleep.
Not sure if that is related, or if the change would make this case better
or worse, but it would be interesting to find out.
The patch is in the current gpio/devel, btw.

Cheers,
Kent.
