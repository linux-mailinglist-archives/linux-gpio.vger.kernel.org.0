Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DDFF207825
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jun 2020 17:57:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404312AbgFXP5Z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Jun 2020 11:57:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404751AbgFXP5V (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Jun 2020 11:57:21 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BB92C061573;
        Wed, 24 Jun 2020 08:57:21 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id g17so1203184plq.12;
        Wed, 24 Jun 2020 08:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Ptn2w5e6anRr1NlNku10i3q3CyuFAMfWr3pdlWZGFp4=;
        b=IbAR3hxGsMrhz5UYf7u/9VpJa12J4CTZ1s9fwmcXSWa0Q6L6+pu22ca03mkDFu49/g
         AZ2/Xe114B9qUmNQDYqo4yo/4LSBw/u/cY0nap9cgwy3p5NTBRUzPg6k2HKoUfGJ44o7
         ScnG5V6Gm1l5wDr8Hx9R/YAvlmszfqo7yHBhMJDKQhouMPIH8ZciRX5RJkKEs5RtbOYY
         8rHA+ejnuGXfMqZKCChz83nPmQCidGEXC04y4EOzxG6O2S0ctult5PC0GuZvHv0o51HW
         z+tVpIZcdSUq0J95eYVYbn+DL+ZXViXu38qV5FxtSoUgO4L3QIfRKii8qPOlC3B0s+LW
         Jp1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Ptn2w5e6anRr1NlNku10i3q3CyuFAMfWr3pdlWZGFp4=;
        b=IgqxkHC3Hqxw42pi2g+vBMVlmNJvWiCaWKiThRQRwob0q9ll5UUHykaF7C6jQ5judA
         NHpfAioX5RyAmkIOgPoB5KthyIsLT7AGg+KmGcRMqFbtw5d8Nu9cDH9tsIfdl4JAwq2e
         eVHoEbcNjS4QhV6Su887A+DchTB2nHOXO/RqngtfuZzRKjGc8ZrVN4AAbPvH/ItBm9Cv
         D88ZECMb2UXOMVoowCVss9K3ZI0AfJTPhi2bBWk8ikoACIQkUDqSWQCeVVXUy25wCuM9
         vPJ66nAAdvJfkiDm8aggC1E5m+Zp2D1IWnOdQ8o7ZAg2y2/EL7cOxSGd+XlqsL31XtmV
         6pFA==
X-Gm-Message-State: AOAM532eUXlNBR2gX5i6wXsoTOmiKG2KqQOJnrCrWa1QDLJG0XTsaQMR
        A7V3ykYD+w6WTOy4Tv/sJNrZ+J6XYEBc6Q==
X-Google-Smtp-Source: ABdhPJyC+UOBAzTeiwiePlhrYtQ9wecg7FvR4wH0+t6Tb7uk0Hisqzgm9WozyaDsa2zMh466xF65Vw==
X-Received: by 2002:a17:90a:d709:: with SMTP id y9mr6546265pju.30.1593014240728;
        Wed, 24 Jun 2020 08:57:20 -0700 (PDT)
Received: from sol (220-235-99-174.dyn.iinet.net.au. [220.235.99.174])
        by smtp.gmail.com with ESMTPSA id h8sm17082362pgm.16.2020.06.24.08.57.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Jun 2020 08:57:19 -0700 (PDT)
Date:   Wed, 24 Jun 2020 23:57:14 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 10/22] gpiolib: cdev: fix minor race in GET_LINEINFO_WATCH
Message-ID: <20200624155714.GB8622@sol>
References: <20200623040107.22270-1-warthog618@gmail.com>
 <20200623040107.22270-11-warthog618@gmail.com>
 <CAHp75VdG4r95ZU8G9TfL+jkT63+Gppb8w5TRvAtCR_pAk0o=NA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VdG4r95ZU8G9TfL+jkT63+Gppb8w5TRvAtCR_pAk0o=NA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 24, 2020 at 05:46:33PM +0300, Andy Shevchenko wrote:
> On Tue, Jun 23, 2020 at 7:03 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > Merge separate usage of test_bit/set_bit into test_and_set_bit to remove
> > the possibility of a race between the test and set.
> >
> > Similarly test_bit and clear_bit.
> >
> > In the existing code it is possible for two threads to race past the
> > test_bit and then set or clear the watch bit, and neither return EBUSY.
> 
> I stumbled over this myself, but...
> 
> > -               if (test_bit(hwgpio, gcdev->watched_lines))
> > +               if (test_and_set_bit(hwgpio, gcdev->watched_lines))
> >                         return -EBUSY;
> >
> >                 gpio_desc_to_lineinfo(desc, &lineinfo);
> > @@ -897,7 +897,6 @@ static long gpio_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
> >                 if (copy_to_user(ip, &lineinfo, sizeof(lineinfo)))
> >                         return -EFAULT;
> >
> > -               set_bit(hwgpio, gcdev->watched_lines);
> >                 return 0;
> 
> ...I think it's not an equivalent despite races involved. If you set
> bit and return error code, you will have the wrong state.
> 

Not quite sure what you mean.  There is only an error if the bit is
already set, so you've changed nothing.

And the watched state is not part of the lineinfo, so the state returned is
the same either way.

Cheers,
Kent.

