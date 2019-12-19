Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6CCF712643C
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2019 15:05:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726847AbfLSOF0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Dec 2019 09:05:26 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:47048 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726695AbfLSOF0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Dec 2019 09:05:26 -0500
Received: by mail-pf1-f196.google.com with SMTP id y14so3307455pfm.13
        for <linux-gpio@vger.kernel.org>; Thu, 19 Dec 2019 06:05:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=XO3xm0xVHWREPlLK9pvf1X9cqc9t6B7oPkzxYHpzic0=;
        b=HsSm6y58mvbpZ8QarK6Zi4zAPXfOachooKfeLw1D4pzPGmTCiVOTxVaf6W9BCaKDDu
         3dWlbwbYZyZ2uC3ASu9NkcGoaXr3VZ3ISCgosi90eyGl9QJkah2A6inTpM4YnMLmOYEQ
         eUNPTEUepSHcl2+SMlILRuaHyOfhVJ/tKNnv6LLXWhpKfJc744Hwtr2GRH4Uy9d2jeD1
         cYQ6RkoFiVSilhWDsCDWY7X0oy+5YuunwS1r32fHAqjHUp4J3nowJSNE32vJUaNexcOy
         bGizRRiS8k2mimgs1fH4RG6iP4pw+F6cKunotHiC7SdluG/FFkxObKsPgS0tLUHpmjRC
         Lm8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=XO3xm0xVHWREPlLK9pvf1X9cqc9t6B7oPkzxYHpzic0=;
        b=X8XbzCjtrVF91WAFJmyQny1ZM0lYh72yMvFzczQ7h/tOwB/7U3y7OhPhT3dsPCknIv
         MQKwIYrKGqRowUuYDDY6Os9+hinuyPQiH46L3R8aaYnybVOLqFkeoqzXdeajP4PKhTb0
         rO+u4RrfBA2hjNcS3B8HiRK9C0Pg2iB+mK1f1ovLD67rdToYIeJcEqt9VKG+DKS/EMBS
         7w6uN8+VqMFdfxwOBf7zgT4ZD16jVwp/fK+55Rxeh6t0ABGg3LgpdCtbwdgwTmWzdWGo
         12hNmrHyZ4zNc1yXjc0ElXkHQsYz616SiCjv6Go96wDN7F6sVxeKH4wOBg7oPqR96kd0
         7HEA==
X-Gm-Message-State: APjAAAUd+/p1IrpWSxlEDZnupmBhHwzdqOcWKmdGkPNtAP958EosEURm
        xo3kIWwK3eqgieBcMn78Yfs=
X-Google-Smtp-Source: APXvYqywSK7pRcI0tTc5pQMCzL2gfd2Nv9NBRVDcNIhtDOfLr7DPV3gk4uwh09bn/QBx2NY6FQ/bHg==
X-Received: by 2002:a63:5114:: with SMTP id f20mr9055195pgb.321.1576764325582;
        Thu, 19 Dec 2019 06:05:25 -0800 (PST)
Received: from firefly (220-235-124-2.dyn.iinet.net.au. [220.235.124.2])
        by smtp.gmail.com with ESMTPSA id o98sm6905764pjb.15.2019.12.19.06.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2019 06:05:24 -0800 (PST)
Date:   Thu, 19 Dec 2019 14:05:18 +0000
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod][PATCH 3/7] tests: event: extend test coverage for
 reading multiple line events at once
Message-ID: <20191219140518.GA12078@firefly>
References: <20191218142449.10957-1-brgl@bgdev.pl>
 <20191218142449.10957-4-brgl@bgdev.pl>
 <20191219133502.GA12028@firefly>
 <CAMpxmJVXgx-zduPT4pAFJw3QFFCb=7f3aXB-rhd2uXuKYefTSg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMpxmJVXgx-zduPT4pAFJw3QFFCb=7f3aXB-rhd2uXuKYefTSg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Dec 19, 2019 at 02:48:48PM +0100, Bartosz Golaszewski wrote:
> czw., 19 gru 2019 o 14:35 Kent Gibson <warthog618@gmail.com> napisał(a):
> >
> > > +
> > > +     ret = gpiod_line_request_both_edges_events(line, GPIOD_TEST_CONSUMER);
> > > +     g_assert_cmpint(ret, ==, 0);
> > > +
> > > +     gpiod_test_chip_set_pull(0, 4, 1);
> > > +     usleep(10000);
> > > +     gpiod_test_chip_set_pull(0, 4, 0);
> > > +     usleep(10000);
> > > +     gpiod_test_chip_set_pull(0, 4, 1);
> > > +     usleep(10000);
> > > +
> >
> > I assume the sleep is to wait for the event to be generated from the
> > call gpiod_test_chip_set_pull, which is not guaranteed to occur before
> > the call returns, otherwise you can toggle the line too fast and may
> > miss events.
> 
> Yes, this is why I put it there. Otherwise, some simulated interrupts
> were being dropped when they fired while the previous ones were still
> served.
> 
> > Arbitrary sleeps in code, including tests, should be avoided as they
> > are brittle and obsure what you are actually waiting for.
> 
> Indeed.
> 
> > An alternative in this case is to add a second event fd and wait for
> > the event to arrive there before continuing.
> >
> 
> I'm not sure I understand. We can't have two event fd's for the same
> line. Or are you thinking about setting up a second line, generating
> events on it and consuming them so that we can rely on the timing to
> make sure the events were registered for the first one too?
> 

I was thinking of two event fds on the one line, and you are
correct, there can only be one, so that wont work.
Wrt using two lines, I'm not sure ordering can be guaranteed as you
end up with two separate debugfs writes...

Kent.
