Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6D6E25BC56
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Sep 2020 10:09:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728444AbgICIJV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Sep 2020 04:09:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728422AbgICIJS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Sep 2020 04:09:18 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE47FC061244;
        Thu,  3 Sep 2020 01:09:16 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id 2so1130781pjx.5;
        Thu, 03 Sep 2020 01:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=RURXhoSNO6UVA5+14oGQ42BXO9M7ZTHBpyDbq8ci7Tg=;
        b=R1eQSNdV+yfRPHbTWeXz/dsE6R/9h6TUKo2Z03c0RW6y6977qwabfy86+Nh3D9hUlL
         kf1Rvy/bzV2Y2ALXtVxHKDaFWw84VmflJ1F+212osnpMZnbFijnvuRUFVaJn0E/mKpne
         I/n9iVHXiCeOArxYDCeHxWnkhaJfbmNGAwiTM/w0I4ZKXmeCqKjX52/HPrOfj4vpSWPr
         JWYWbmKdggCKRXbfhOXUoQmpaWU9T+45cpKLCXa8CPQWrnJk/Z+SjlxN3NcjPQd+6jWY
         1uSfuDjQUJ+L+5PKGEs2XlARLQ25x2s5dYCRnpTtMipm4Fx4mA+LNryb6j0iMxQ067xD
         98Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RURXhoSNO6UVA5+14oGQ42BXO9M7ZTHBpyDbq8ci7Tg=;
        b=TmO7HfthLwwxlo4Nf8Bq1WJbSt427pfGXei8ZBuvYv13TKlzzgD0n0RbZPWAJwupSz
         7/58bLkSKUf9zd3LHfL2jVpArnocbtQz5c52M5UIaE0DCE4DIWCGco1dJbFevgFrVWfE
         QYa+Pgcb0JvttkYpuaYKuViYXbQhaU+OEW27AhmwM6PxnIp/1mr+GPco5wWt60j5oWcD
         uyMXs2chAKRe4+9Ok2c6ou6o8oZkUv0kptuvvNv9c5crk6S2IfKjGcZ1AhJ/uv47KR6G
         6oxZyToHQQbRVw2OghCvEGj1WojopGBQaQT1/JuAg0MlOgEbm6OIPtjBuzuv84rl9F6A
         8glQ==
X-Gm-Message-State: AOAM530N2Guws2Yz3Vx2HP+FS6BPPnR3O4dAkVyN9VKWQiCyrhd9+oZK
        b8yqG9vlNVEoQ+Qdi/DooJEXUHEGzk4=
X-Google-Smtp-Source: ABdhPJxdYvZCbYJdIIz3QXLwk+zuevQELWKIUEfKDi0B96Qfd92l/lXvPdjI+RVvFqNZzzz4wN7Q5A==
X-Received: by 2002:a17:90a:384c:: with SMTP id l12mr2066227pjf.27.1599120555112;
        Thu, 03 Sep 2020 01:09:15 -0700 (PDT)
Received: from sol (106-69-184-100.dyn.iinet.net.au. [106.69.184.100])
        by smtp.gmail.com with ESMTPSA id q2sm1799248pgs.90.2020.09.03.01.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2020 01:09:14 -0700 (PDT)
Date:   Thu, 3 Sep 2020 16:09:09 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v6 09/20] gpiolib: cdev: support edge detection for uAPI
 v2
Message-ID: <20200903080909.GA17108@sol>
References: <20200831032006.1019978-1-warthog618@gmail.com>
 <20200831032006.1019978-10-warthog618@gmail.com>
 <CAMpxmJW9EC_ocs8dA3j+QPu8sW4Na9WEvPYEUZjfxk4-ojf+kA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMpxmJW9EC_ocs8dA3j+QPu8sW4Na9WEvPYEUZjfxk4-ojf+kA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 03, 2020 at 09:55:22AM +0200, Bartosz Golaszewski wrote:
> On Mon, Aug 31, 2020 at 5:22 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > Add support for edge detection to lines requested using
> > GPIO_V2_GET_LINE_IOCTL.
> >
> > The edge_detector implementation is based on the v1 lineevent
> > implementation.
> >

[snip]

> > +        * close in time as possible to the actual event.
> > +        */
> > +       line->timestamp = ktime_get_ns();
> > +
> > +       if (lr->num_lines != 1)
> > +               line->req_seqno = atomic_inc_return(&lr->seqno);
> 
> Do we never increase req_seqno for a single line?
> 

For a single line we just use line_seqno for both to avoid the
atomic_inc here and so reduce the time spent in the ISR and any
SMP sync overheads.

As per the comment in struct linereq:
 * @seqno: the sequence number for edge events generated on all lines in
 * this line request.  Note that this is not used when @num_lines is 1, as
 * the line_seqno is then the same and is cheaper to calculate.

Cheers,
Kent.
