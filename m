Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C69C81264ED
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2019 15:36:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726779AbfLSOgj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Dec 2019 09:36:39 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:36284 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726751AbfLSOgi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Dec 2019 09:36:38 -0500
Received: by mail-pj1-f65.google.com with SMTP id n59so2634177pjb.1
        for <linux-gpio@vger.kernel.org>; Thu, 19 Dec 2019 06:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=3gbpWV4kH90OI8ENcAfGX4jtlPcVhbvtJKySrV8YtFs=;
        b=DfiU9kXJFb/bHN3q2qrfSA6s/TCbOeP4WjT5eeeepn+WkCV+1PzbIiLUbFXipmyjgi
         WdNmj+oRVq8w72XY2c3ekVd46bXUYOuPulYF0ULgQ001pfpAuCrxrcKTeWD0oJ5eiV5O
         ylKsUmRxAHmqajdQZ56PY+H2N0FhCr8SdqLdM9y1ISxff3zpCxApgOaeSxNKC36WIYPu
         jv0w1e9Nb591tCEFSQw1mCWFmgitgZw0oQf2V+VvnwvPs9PZfFxkZIcEoRDQRttFWrOh
         Dp9sJr21jnOn/W48X0K89NhtWTayxOpBKRPJo5mgMR+2CFbBPnWknEifCU/n4mBlx8Ho
         uv9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=3gbpWV4kH90OI8ENcAfGX4jtlPcVhbvtJKySrV8YtFs=;
        b=rbMPOVY0+NCStpOikIP9/f/Xi7LLch3OIoOfd8ySVWPpKw8w7ijbuhTYzRsiSlG5Zv
         FmWefrgGXGA+SU9O+98NXUUX+6F9ERTLuCdvppDI4i3KaxK7D8j+Ga/r8Y+YI7vJbuxt
         CAlpXbSl4iNVGw69QJnw2yEOS4wTHFXB+6pVy+TmgM7P3xJ5lUtyPp3oDxvo3VRw3wcD
         QETBD7snfPtOqWq5unpig8jp2cBy5RYoIj22fZ6mKZQQAgG5jDbd3X+bddKM/XrDGAlt
         piwIC0tETJ+wkT43SfH/6A9RzgMTNm3nxpkmp7aR2NYfSRTNupFdxGYy89IFx4LRGLyG
         eeQQ==
X-Gm-Message-State: APjAAAWRskFi73sHO8u3huzjh1BS82feLYVSFQMpponXjY5WqHA+bWgG
        eSgjEPkGVRy/QnloB4NfR58FAmQQ
X-Google-Smtp-Source: APXvYqw48nSaMY9HiGYLmOM5IDps2/3q8jeMuz7EEG8NBrj9MjDCGpFMhNtkpdduHnTPnatcLszUbQ==
X-Received: by 2002:a17:902:bd4b:: with SMTP id b11mr8297237plx.6.1576766197916;
        Thu, 19 Dec 2019 06:36:37 -0800 (PST)
Received: from firefly (220-235-124-2.dyn.iinet.net.au. [220.235.124.2])
        by smtp.gmail.com with ESMTPSA id d22sm7748147pgg.52.2019.12.19.06.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2019 06:36:37 -0800 (PST)
Date:   Thu, 19 Dec 2019 14:36:31 +0000
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod][PATCH 3/7] tests: event: extend test coverage for
 reading multiple line events at once
Message-ID: <20191219143631.GA12100@firefly>
References: <20191218142449.10957-1-brgl@bgdev.pl>
 <20191218142449.10957-4-brgl@bgdev.pl>
 <20191219133502.GA12028@firefly>
 <CAMpxmJVXgx-zduPT4pAFJw3QFFCb=7f3aXB-rhd2uXuKYefTSg@mail.gmail.com>
 <20191219140518.GA12078@firefly>
 <CAMRc=MdKhLpBsDjcwM4JfFkUmx_VFAjfxNrMFWUBsc8ZWO49Ow@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MdKhLpBsDjcwM4JfFkUmx_VFAjfxNrMFWUBsc8ZWO49Ow@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Dec 19, 2019 at 03:07:10PM +0100, Bartosz Golaszewski wrote:
> czw., 19 gru 2019 o 15:05 Kent Gibson <warthog618@gmail.com> napisał(a):
> >
> > On Thu, Dec 19, 2019 at 02:48:48PM +0100, Bartosz Golaszewski wrote:
> > > czw., 19 gru 2019 o 14:35 Kent Gibson <warthog618@gmail.com> napisał(a):
> > > >
> > > > > +
> > > > > +     ret = gpiod_line_request_both_edges_events(line, GPIOD_TEST_CONSUMER);
> > > > > +     g_assert_cmpint(ret, ==, 0);
> > > > > +
> > > > > +     gpiod_test_chip_set_pull(0, 4, 1);
> > > > > +     usleep(10000);
> > > > > +     gpiod_test_chip_set_pull(0, 4, 0);
> > > > > +     usleep(10000);
> > > > > +     gpiod_test_chip_set_pull(0, 4, 1);
> > > > > +     usleep(10000);
> > > > > +
> > > >
> > > > I assume the sleep is to wait for the event to be generated from the
> > > > call gpiod_test_chip_set_pull, which is not guaranteed to occur before
> > > > the call returns, otherwise you can toggle the line too fast and may
> > > > miss events.
> > >
> > > Yes, this is why I put it there. Otherwise, some simulated interrupts
> > > were being dropped when they fired while the previous ones were still
> > > served.
> > >
> > > > Arbitrary sleeps in code, including tests, should be avoided as they
> > > > are brittle and obsure what you are actually waiting for.
> > >
> > > Indeed.
> > >
> > > > An alternative in this case is to add a second event fd and wait for
> > > > the event to arrive there before continuing.
> > > >
> > >
> > > I'm not sure I understand. We can't have two event fd's for the same
> > > line. Or are you thinking about setting up a second line, generating
> > > events on it and consuming them so that we can rely on the timing to
> > > make sure the events were registered for the first one too?
> > >
> >
> > I was thinking of two event fds on the one line, and you are
> > correct, there can only be one, so that wont work.
> > Wrt using two lines, I'm not sure ordering can be guaranteed as you
> > end up with two separate debugfs writes...
> >
> 
> Yeah I gave it a spin and it turns out it's not reliable - some events
> still get dropped albeit less than without any syncing. The usleep()
> calls are still better than this. Any other ideas? I agree this is not
> optimal, but couldn't come up with anything else.
> 

The two options I can think of are getting the debugfs write
to block until the simulated interrupt has been serviced, or adding a
multi-line set to the mockup so the two lines can be set simultaneously.
I'm not sure the first is possible.
And the second wont help if it results in two interrupts unless the
order the interrupts are serviced is guaranteed.
Either way it seems like a whole lot of work just to remove the sleeps,
so the sleeps seem like a reasonable workaround :(.

Kent.
