Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 926A223C3DA
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Aug 2020 05:06:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725999AbgHEDGs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 4 Aug 2020 23:06:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725950AbgHEDGs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Aug 2020 23:06:48 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2586CC06174A;
        Tue,  4 Aug 2020 20:06:48 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id w19so11477525plq.3;
        Tue, 04 Aug 2020 20:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=QDticxdTQ9ZAvE93eIeivxOMm0CMx+gyMo4J8Uikmss=;
        b=CjSuj/T9LnSckPWebwCnf9GF+adDQErajAn/Yw4Qdsqzr2cLaBAdBnRC2yg1eIs6Jb
         N0uzMimMaWwEA+3xMdB6LACohl+M+IlDaTEaohQRdbxNpOtP4c0QySQle2GnZfl04g26
         baKg6nuIWqgf3X3+cfMqDOvGpg/5t2lycubePKHLTiMYPu841Ma9lj0XkZJMAxmRlQLf
         m8W03WPdjMyfpbYIGvUKtMjvXUIt08NTV3izDIa23M89eTuquGhsoHa5unP0CjrEPjly
         r1Gkm+APKi6rZExSNlnH/ABMwHtz7woIColQFphOTSyZWOufumFuq+KiYqULzCRSLRGX
         +R1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QDticxdTQ9ZAvE93eIeivxOMm0CMx+gyMo4J8Uikmss=;
        b=EFCBDllPlTTj1Xe4RXIioD7QmLQQe7VDk56OORdtD4I46O2LCmi7ov3svlhrNrAtrr
         QFgyA+vghJMcZqCdPxFXphYjgEq0qdencBdkoCcn69CqnVDvNCGl2VeqfgprLO4tVH42
         Q83KINAyETU/OCFix6ceIvbz0cKc0htS8b0uNtDT13+fUke0Rq92P5Aqxsoq9CXWivZn
         dZGlLl2EPC7GGBhpg6O4Rl+HHSYAgh3i5h9hiRmcMd0n20axHRzBjXD4jZ8FsHddYEBk
         09YmXVeG+5X4oF2XEN2cNx/190Zsb5EfnQlvAgADRBHZg//rXR3TUKbqpkQSbowuAQLu
         nSyQ==
X-Gm-Message-State: AOAM533DNuamdh7Cu2qygy0ypjfpg1ukJK6RmklaNZOAxXtaZANLlbP7
        AD+i2U8UcQypeA/djyHZvgQ=
X-Google-Smtp-Source: ABdhPJzhUhNs6E6jD1OHzwKsR1Cqd8X6240dyoyVAGW6WF8RqRLORWmt3A4SYsfE+XMqHel5xV3Ssg==
X-Received: by 2002:a17:902:10e:: with SMTP id 14mr1103007plb.297.1596596807515;
        Tue, 04 Aug 2020 20:06:47 -0700 (PDT)
Received: from sol (106-69-185-93.dyn.iinet.net.au. [106.69.185.93])
        by smtp.gmail.com with ESMTPSA id d81sm793398pfd.174.2020.08.04.20.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2020 20:06:46 -0700 (PDT)
Date:   Wed, 5 Aug 2020 11:06:42 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 05/18] gpiolib: cdev: support GPIO_GET_LINE_IOCTL and
 GPIOLINE_GET_VALUES_IOCTL
Message-ID: <20200805030642.GA119030@sol>
References: <20200725041955.9985-1-warthog618@gmail.com>
 <20200725041955.9985-6-warthog618@gmail.com>
 <CAHp75VcKtATPDKGAViWqjOJDqukDrgZ13aTU6rTJ1jEeB3vmVw@mail.gmail.com>
 <20200726011244.GA6587@sol>
 <CAMpxmJWaEVwjXSFHTYmwdfA+88upVkJ4ePSQf_ziSOa1YdOUKQ@mail.gmail.com>
 <20200802033158.GA13174@sol>
 <CAMpxmJWZpMFbrMBkLiR9q7chdamVnjw0geDf-pgKrz=AWD8mNg@mail.gmail.com>
 <20200803230118.GA3650@sol>
 <CAMpxmJXv2Ruo-yJTm9bjyj90jWMA_BWHuNyVwyXkzxqmzoHoHA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMpxmJXv2Ruo-yJTm9bjyj90jWMA_BWHuNyVwyXkzxqmzoHoHA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 04, 2020 at 07:47:43PM +0200, Bartosz Golaszewski wrote:
> On Tue, Aug 4, 2020 at 1:01 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> 
> [snip]
> 
> >
> > > Also: I just started going through the patches - nice idea with the
> > > GPIO attributes, I really like it. Although I need to give it a longer
> > > thought tomorrow - I'm wondering if we can maybe unify them and the
> > > flags.
> > >
> >
> > I had an earlier draft that did just that - and that is partially why
> > the loop is last in wins - I was using slot 0 as the default flags.
> > But the default flags cover a lot of use cases, including all of v1, and
> > it was simple and cheap to provide a default - and it simplified the
> > initial port of libgpiod to v2...
> >
> 
> If porting libgpiod to v2 is the only concern then I wouldn't stress
> about it. At the same time I'm wondering - is there any use-case where
> we wouldn't need the flags attribute for at least some lines? Because
> if it's always required than maybe having a default isn't that bad.
> 

The only case where flags are not required is an AS-IS request. I
have no idea what that use case is useful for, but it is in v1 and
therefore supported by v2 for backward compatibility.

So there is almost always a flags attribute, and I didn't want to
waste an attribute slot on it.

Supporting the default in the kernel is trivial - it is literally just
the default return in gpioline_config_flags:

+	}
+	return lc->flags;
+}

which would otherwise be 0.

Cheers,
Kent.
