Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65D62265DA1
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Sep 2020 12:17:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725868AbgIKKR2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Sep 2020 06:17:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725829AbgIKKRW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Sep 2020 06:17:22 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAFB6C061573
        for <linux-gpio@vger.kernel.org>; Fri, 11 Sep 2020 03:17:20 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id t7so1488902pjd.3
        for <linux-gpio@vger.kernel.org>; Fri, 11 Sep 2020 03:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=C39Ii7TdEoYURk9UrY945qYpoxPNNA2DzEGQhO4Rsy0=;
        b=u0uVTx+zh0j0U21hVEP4mBTqUikb0sV4BKzxedYOQ8OPpxnaTLoOKF93mf2eMYgaE+
         YL2umwHacD9FLIrN7/VvL8BNGiZ1RBTKyWzhk5UQbHj1slPWmmwdiQEA2T9GAsJ1eqBO
         Acyf25v5+9myoWhksIsGpP1qyV5a3tjeLc1vyx/pz+ArFPOd7iU9pvvM4l/1QVHjSk46
         YmaG3ntxtKS1P7TEBofuc9BCpZxjoAB+e/WR/Y0BP5tk8Z6ZxtZJCvaKmGpl5hcswdM3
         9sC5/tC3lCho1VJGLPAXNm54FZgkfZTcSpWgod4EZy8sx2RmzRvxpASiG38tVPfrQxAw
         IgOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=C39Ii7TdEoYURk9UrY945qYpoxPNNA2DzEGQhO4Rsy0=;
        b=kf5usrXgmOwnUESv60XDGKyNqeLkfh3/Z0tyGK3HN65sQVf/Fjgla+L/Nfh4GwuKIh
         MHULfG7l8bK6cwnEvdpzJeBtI0+gZSfzm4EuWDl2wrJoAkJskHeBhB4evKw+NDIAAIdC
         JZ47B067nY7eiRJwQAEiX0kHnwK5dwvZSNCvJaZmU0X4UNgjdlMANdGWhb+H85Q5UQ2I
         jW1juJjG3zR5T5yYRBuT3eGK7X7uVEXbftrMm25ucZZyQgLOcZF27czENQXVHs+YazEK
         sTaNnPQuz8x9vyVpybKy4ss6KVFwdGRexJu3pWEpwr2ob5fxlFItbK/RaTG25jqb9w//
         lPgw==
X-Gm-Message-State: AOAM532YnjUTA0mHZPYMZQRO9t/uSs0EVZ8ZKah/ClXawZwbtQR7cmAh
        GIn6Wssqr/Vn12+c+V/cvB+f0Wn249s=
X-Google-Smtp-Source: ABdhPJz0ABvSlQqdW+BgD5wmGqdqRRFmHwoLDBRlKbOPYkOGx6kjaNqg165xVAfKS2FNECMW8GlT0g==
X-Received: by 2002:a17:90a:f682:: with SMTP id cl2mr1653701pjb.158.1599819439841;
        Fri, 11 Sep 2020 03:17:19 -0700 (PDT)
Received: from sol (106-69-184-100.dyn.iinet.net.au. [106.69.184.100])
        by smtp.gmail.com with ESMTPSA id h4sm1187872pji.19.2020.09.11.03.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2020 03:17:18 -0700 (PDT)
Date:   Fri, 11 Sep 2020 18:17:14 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v1 1/2] gpiolib: Fix line event handling in syscall
 compatible mode
Message-ID: <20200911101714.GA2132928@sol>
References: <20200910101935.47140-1-andriy.shevchenko@linux.intel.com>
 <20200911030539.GA574097@sol>
 <20200911083109.GF1891694@smile.fi.intel.com>
 <20200911091249.GA1874731@sol>
 <20200911095355.GG1891694@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200911095355.GG1891694@smile.fi.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 11, 2020 at 12:53:55PM +0300, Andy Shevchenko wrote:
> On Fri, Sep 11, 2020 at 05:12:49PM +0800, Kent Gibson wrote:
> > On Fri, Sep 11, 2020 at 11:31:09AM +0300, Andy Shevchenko wrote:
> > > On Fri, Sep 11, 2020 at 11:05:39AM +0800, Kent Gibson wrote:
> > > > On Thu, Sep 10, 2020 at 01:19:34PM +0300, Andy Shevchenko wrote:
> 
> ...
> 
> > > > > +#ifdef __x86_64__
> > > > > +	/* i386 has no padding after 'id' */
> > > > > +	if (in_ia32_syscall()) {
> > > > > +		struct compat_ge {
> > > > > +			compat_u64	timestamp __packed;
> > > > > +			u32		id;
> > > > > +		} cge;
> > > > > +
> > > > > +		if (buf && ge) {
> > > > > +			cge = (struct compat_ge){ ge->timestamp, ge->id };
> > > > > +			if (copy_to_user(buf, &cge, sizeof(cge)))
> > > > > +				return -EFAULT;
> > > > > +		}
> > > > > +
> > > > > +		return sizeof(cge);
> > > > > +	}
> > > > > +#endif
> > > > > +
> > > > > +	if (buf && ge) {
> > > > > +		if (copy_to_user(buf, ge, sizeof(*ge)))
> > > > > +			return -EFAULT;
> > > > > +	}
> > > > > +
> > > > > +	return sizeof(*ge);
> > > > > +}
> > > > 
> > > > The dual-purpose nature of this function makes it more complicated than
> > > > it needs to be.
> > > > I was going to suggest splitting it into separate functions, but...
> > > > 
> > > > Given that struct compat_ge is a strict truncation of struct
> > > > gpioevent_data, how about reducing this function to just determining the
> > > > size of the event for user space, say lineevent_user_size(), and
> > > > replacing sizeof(ge) with that calculcated size throughout
> > > > lineevent_read()?
> > > 
> > > So you mean something like
> > > 
> > > 	struct compat_gpioeevent_data {
> > > 		compat_u64	timestamp;
> > > 		u32		id;
> > > 	} __packed;
> > > 
> > > #ifdef __x86_64__
> > > 	/* i386 has no padding after 'id' */
> > > 	size_t ge_size = in_ia32_syscall() ? sizeof(struct compat_gpioevent_data) : sizeof(struct gpioevent_data);
> > > #else
> > > 	size_t ge_size = sizeof(struct gpioevent_data) ;
> > > #endif
> > > 
> > > ?
> > > 
> > 
> > Pretty much, though I was suggesting keeping it in a helper function,
> > say lineevent_user_size(), not in lineevent_read() itself, to isolate
> > all the ugliness in one small place.
> > 
> > So in lineevent_read() you would:
> > 
> >    size_t ge_size = lineevent_user_size();
> > 
> > and then use that to replace all the sizeof(ge) occurrences.
> 
> But in any case it makes code a bit hackish, no?
> 

Maybe - I'm not totally happy about copying a partial struct either, but
one way or the other that is what you effectively need to do.

> We calculate the size of one structure and by the fact *partially* copy
> another one.
> 

Perhaps it is a matter of perspective - as I see it you are calculating
the length of the event that the userspace expects, and then copying only
that amount.
As you say in the comment "i386 has no padding after 'id'" - other than
that it is bitwise identical - the only difference is the length.

> And actually if you look closer to the types, the compat_u64 is not the same as u64.
> So, I'm not sure your solution would work in all cases.
> 

There is only one corner case here - 32-bit on x86_64, and it works for
that - I've tested it.
For all other cases it falls back to the full length.

For x86 the compat_u64 is:

typedef u64 __attribute__((aligned(4))) compat_u64;

which is bitwise identical - only allowed to 32-bit align.
And if compat_u64 wasn't bitwise identical in this case then your original
code wouldn't work either ;-).

Cheers,
Kent.
