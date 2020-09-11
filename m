Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D720265C3E
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Sep 2020 11:13:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725816AbgIKJM7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Sep 2020 05:12:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725774AbgIKJM5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Sep 2020 05:12:57 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D66A8C061573
        for <linux-gpio@vger.kernel.org>; Fri, 11 Sep 2020 02:12:56 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id gf14so1393096pjb.5
        for <linux-gpio@vger.kernel.org>; Fri, 11 Sep 2020 02:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=FggqCRM1yrFB2InDjvC6M4lI0C51oSBMJA2njdZ+yZI=;
        b=NCsGLtGPy9k9+2CD6Qs6JdQ/zp0e1csy00azvGZDyz9xcyiHeVOLOGF+oJDOkh9HVP
         HfIYoqWOnGufa5Z9aCvIqvXLxxSRTzGmJD0rWc6+tB9ns2hriYFKSJbTvvNre61MVv/7
         161kHXZ+MNTiOd/qxG8lCUdm+HjY8tv/W3Bi/sKmRJnq/e4yZFUhDRwANVSedjYnW1KN
         BmNrfIECe03qSUvLP+h8z32P4FYCUGBWMTn9BW0R7JHZ49T1N0Z6Jr95JPZd4beA9uHk
         T3iUptH8ZZSiNb5/JOz39aUTAW/Zokn+kR5UaoA+/1RP1RBjxD529YyT42rd+6NezxB2
         j2qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FggqCRM1yrFB2InDjvC6M4lI0C51oSBMJA2njdZ+yZI=;
        b=oeFOGxVG9c1wwOjT8JAFjabLWaaDWewOgnODvGA9Y8rA4hDnrdAdRooPIgSqo8pBgp
         vHnmr1bkW2SzRuzhL+naplYWn01Xn97/INhrQUp5Z+wfiWn/U5hy3Y56T0sqao/RqjcC
         xDNPxWWCWfrwV1PSZc8GpZr+gGnbHLqzAfHuNFDQqwEHqJrzzs6g7lJMJ+DYgas5mx6z
         SOKvnA20XO/QdHQ1DFvZjKFYLcddtg97Z6Dq/maWgs5+73nxIQahXwzZ6Wr2I1IKzczA
         01YiG3VQQ44BhmJHBszc+6TV4+TJNsHCOsypduFwG9hngPrW8Z8Ctbvooi93eY/+d4yE
         4HWg==
X-Gm-Message-State: AOAM533udegDDN5ULskA50qKPcQPgApFCQJp8tWFt4VvNB+N5nUOxNB4
        zKy70IK/4/oYBL39J6QDqoDib/zKtSQ=
X-Google-Smtp-Source: ABdhPJw9f+HUpFhsOxD+V6BWy8DC4cg9pV87CJACVvWNREwuKYJlzMlmgkPL0rnpKx0E5X4SumkNhQ==
X-Received: by 2002:a17:90b:100f:: with SMTP id gm15mr1307688pjb.235.1599815575402;
        Fri, 11 Sep 2020 02:12:55 -0700 (PDT)
Received: from sol (106-69-184-100.dyn.iinet.net.au. [106.69.184.100])
        by smtp.gmail.com with ESMTPSA id e1sm1641446pfn.78.2020.09.11.02.12.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2020 02:12:54 -0700 (PDT)
Date:   Fri, 11 Sep 2020 17:12:49 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v1 1/2] gpiolib: Fix line event handling in syscall
 compatible mode
Message-ID: <20200911091249.GA1874731@sol>
References: <20200910101935.47140-1-andriy.shevchenko@linux.intel.com>
 <20200911030539.GA574097@sol>
 <20200911083109.GF1891694@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200911083109.GF1891694@smile.fi.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 11, 2020 at 11:31:09AM +0300, Andy Shevchenko wrote:
> On Fri, Sep 11, 2020 at 11:05:39AM +0800, Kent Gibson wrote:
> > On Thu, Sep 10, 2020 at 01:19:34PM +0300, Andy Shevchenko wrote:
> > > The introduced line even handling ABI in the commit
> > > 
> > 
> > s/even/event/
> > 
> > >   61f922db7221 ("gpio: userspace ABI for reading GPIO line events")
> > > 
> > > missed the fact that 64-bit kernel may serve for 32-bit applications.
> > > In such case the very first check in the lineevent_read() will fail
> > > due to alignment differences.
> > > 
> > > To workaround this introduce lineeven_to_user() helper which returns actual
> > > size of the structure and copies its content to user if asked.
> > > 
> > 
> > And again here.
> 
> Thanks!
>
> ...
> 
> > > +#ifdef __x86_64__
> > > +	/* i386 has no padding after 'id' */
> > > +	if (in_ia32_syscall()) {
> > > +		struct compat_ge {
> > > +			compat_u64	timestamp __packed;
> > > +			u32		id;
> > > +		} cge;
> > > +
> > > +		if (buf && ge) {
> > > +			cge = (struct compat_ge){ ge->timestamp, ge->id };
> > > +			if (copy_to_user(buf, &cge, sizeof(cge)))
> > > +				return -EFAULT;
> > > +		}
> > > +
> > > +		return sizeof(cge);
> > > +	}
> > > +#endif
> > > +
> > > +	if (buf && ge) {
> > > +		if (copy_to_user(buf, ge, sizeof(*ge)))
> > > +			return -EFAULT;
> > > +	}
> > > +
> > > +	return sizeof(*ge);
> > > +}
> > >  
> > 
> > The dual-purpose nature of this function makes it more complicated than
> > it needs to be.
> > I was going to suggest splitting it into separate functions, but...
> > 
> > Given that struct compat_ge is a strict truncation of struct
> > gpioevent_data, how about reducing this function to just determining the
> > size of the event for user space, say lineevent_user_size(), and
> > replacing sizeof(ge) with that calculcated size throughout
> > lineevent_read()?
> 
> So you mean something like
> 
> 	struct compat_gpioeevent_data {
> 		compat_u64	timestamp;
> 		u32		id;
> 	} __packed;
> 
> #ifdef __x86_64__
> 	/* i386 has no padding after 'id' */
> 	size_t ge_size = in_ia32_syscall() ? sizeof(struct compat_gpioevent_data) : sizeof(struct gpioevent_data);
> #else
> 	size_t ge_size = sizeof(struct gpioevent_data) ;
> #endif
> 
> ?
> 

Pretty much, though I was suggesting keeping it in a helper function,
say lineevent_user_size(), not in lineevent_read() itself, to isolate
all the ugliness in one small place.

So in lineevent_read() you would:

   size_t ge_size = lineevent_user_size();

and then use that to replace all the sizeof(ge) occurrences.

Cheers,
Kent.
