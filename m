Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A695F2487D7
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Aug 2020 16:38:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726969AbgHROiB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Aug 2020 10:38:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727033AbgHROiB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Aug 2020 10:38:01 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F67CC061389;
        Tue, 18 Aug 2020 07:38:01 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id m8so10074144pfh.3;
        Tue, 18 Aug 2020 07:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=2r3YLIonviXk+yiTh2eL5fGwLG3nibOXqnr3jMeFSxw=;
        b=vPDS6jyEFa2pVglVMhDsJUQB3MELfJ46P/i/Kx5bmZjr1wl0M1cBAfXE02msNjRehH
         76vt2EQ44Wusv6N6rGb6Zyh3nbYbIlp04r8yzboE5YpsHEnqqDaIvKLe0E3ZlFsjHjLS
         mgXHS9cePmDk4Ydxd7kHpKAkdVntxnylNRmF6QjOExWxBnxGuh41glOpahf9z1CiXYEf
         QCIm5YBFoMQDns4qw8YCBKlc9eojA2XKdHlxjMUgknxV9IvTzchhAk+GTBEQ5tnB58bU
         Vgo7urIRUdSba8NThKLzlbwEWiAO4IFllSZ9wXEw6b+C/OEKpiPITyiv/HM2155IHPqV
         V1fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2r3YLIonviXk+yiTh2eL5fGwLG3nibOXqnr3jMeFSxw=;
        b=g5o260hgAsj3diP/+8fW52OCsGwI3SQhwoPrm4ZlnIXwuVrjbJNOd9ZWOmocVZPp4Y
         nYE53mo25zDCfemmOQ1RbYKjtvVOrk58iWk1CM/5Kd0S75qKx9Elp20OKUNtgD3MixgG
         CYl+SzU7xkLVpQovRdxVWJnhAwmO50GfJ/xeCaibX3sEG5P1abiFe59T05balV1KQ6Vo
         7TGL+KxgO6jG2YRVCICTt93dV8nRE6BagnvAgqHuH2epQ0wYNxtCMc+k2ZTDQsbGmb1J
         vkNoV5LkeS2OrSqBmq5TXdQUMbbP+X/gE8mMMkne9+iAygSSml7icmLkWLuHjqCDXqJK
         C1DQ==
X-Gm-Message-State: AOAM530xtP1plJvYs6Hut0ltbeobSV7mNDyyQwPl9/6GWynQPTNDkL32
        dImFQWznnKeR56arfIvnek75PPXm11o=
X-Google-Smtp-Source: ABdhPJwUON8dwXpoGVKSYuYs9uPXS4HjS7ngwVT1Jae5RghclPIexe/+chXmz79GW1A5l7N72s0PJw==
X-Received: by 2002:a65:58cf:: with SMTP id e15mr13720757pgu.59.1597761480619;
        Tue, 18 Aug 2020 07:38:00 -0700 (PDT)
Received: from sol (106-69-184-100.dyn.iinet.net.au. [106.69.184.100])
        by smtp.gmail.com with ESMTPSA id z1sm158662pjn.34.2020.08.18.07.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2020 07:37:59 -0700 (PDT)
Date:   Tue, 18 Aug 2020 22:37:54 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 12/20] gpiolib: cdev: support setting debounce
Message-ID: <20200818143754.GB17809@sol>
References: <20200814030257.135463-1-warthog618@gmail.com>
 <20200814030257.135463-13-warthog618@gmail.com>
 <CAMpxmJXxUD9HqkEAzMjJA6dOem9aAkPwdT4BKyPXb-C06dGkqw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMpxmJXxUD9HqkEAzMjJA6dOem9aAkPwdT4BKyPXb-C06dGkqw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 17, 2020 at 08:21:58PM +0200, Bartosz Golaszewski wrote:
> On Fri, Aug 14, 2020 at 5:05 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > Add support for setting debounce on a line via the GPIO uAPI.
> > Where debounce is not supported by hardware, a software debounce is
> > provided.
> >
> > Signed-off-by: Kent Gibson <warthog618@gmail.com>
> > ---

[snip]

> > +       debounce_period = READ_ONCE(desc->debounce_period);
> > +       if (debounce_period) {
> > +               info->attrs[num_attrs].id = GPIO_V2_LINE_ATTR_ID_DEBOUNCE;
> > +               info->attrs[num_attrs].debounce_period = debounce_period;
> > +               num_attrs++;
> > +       }
> > +       info->num_attrs = num_attrs;
> 
> AFAICT this (reading it in gpio_desc_to_lineinfo) is the only reason
> to store the debounce period in struct gpio_desc. I'm wondering if we
> can avoid extending this struct only for such uncommon case and store
> it elsewhere. In all other cases where you read or write to it - you
> have access to the underlying edge detector. Would the single-line
> struct line I suggested elsewhere be a good place? On the other hand
> I'm not sure how to get it having only the desc. I need to think about
> it more.
> 

Yeah, it is stored there so it can be returned by lineinfo_get() for the
GPIO_V2_GET_LINEINFO_IOCTL and GPIO_V2_GET_LINEINFO_WATCH_IOCTL.
And the same applies to any future config fields.
I would also like to not pollute the desc, or anything else in gpiolib,
but wasn't sure where else to put it.

I'm open to suggestions.

Cheers,
Kent.
