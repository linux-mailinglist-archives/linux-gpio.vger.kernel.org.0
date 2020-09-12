Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52810267738
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Sep 2020 04:21:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725765AbgILCV5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Sep 2020 22:21:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725763AbgILCV4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Sep 2020 22:21:56 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E597FC061573
        for <linux-gpio@vger.kernel.org>; Fri, 11 Sep 2020 19:21:54 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id w7so8618130pfi.4
        for <linux-gpio@vger.kernel.org>; Fri, 11 Sep 2020 19:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=TYiCoYPb34JrZDJnFKU5BmiPqq0VK0NzMZqsLMBvjKI=;
        b=TlhhALky1Zagx9zcQH/MXWiGmRSdJGllCFKv6/mlaq6d/XWl6XMyjL/4x2+SsZgNrj
         bdxF1oM6sQxrYbuY1pwyXesYGjDoGb3l6+SOF9bpeqSNFNKClwgPtSltniKg36o+ZPwW
         4rgNAghUWNIWg9tnthvXAsL/D/5nC71JzOqFlkvm0Xb/kthCy0/fyAjuLQLWXLBmQ5nm
         kV+ranxxGC8rTN8lrbrtB+UEe7kQ2HrLTuopEFbAKh3QdQx6lZEvC8O33fBnPparIpBK
         ePLcolDWRXbbsnp3YlC8zS9JD8uS2JCED9fe2ZsFtZejTgeIm9jbKgewDRpmF3JNRNdb
         lh9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TYiCoYPb34JrZDJnFKU5BmiPqq0VK0NzMZqsLMBvjKI=;
        b=sMlnpMxCJa6zx9LKeGNj31kWu6xLNF+ACmidwaNwpVGXyDrvNTYBQnoePTPKf7r3yQ
         drDarVIggJJwiQLE8H6KJVei0CKp3t3V1biQqfudMRo8YLzSS6xGjlKAGWGtIr6n0M8V
         4iqsu1FdYG3Me1fJbhdI8oS7N4NoSuUUs3IciK9ctK43FQno7lOONs/QUL0Y2FQEZiri
         l2N94s+AIiytXT4U4kgn44sGGLa2RRVHMBbr+cFJB1K2z0nUZd5aNkrQhfmLkhnyC5vn
         iF0OodGBWoeUtRExzENdZ5z5Ls8HBwt4NullYVLyzWFvobmjhozb9NP+E3JIYxbwG1d/
         WTcw==
X-Gm-Message-State: AOAM530Eu5yLsTBq29WpETKvmJvqL0gKGNFv2dQNi8SMSbGBIACZsIhp
        ze3ZalQDtZlodn8VyovOF4jz6W4E8ds=
X-Google-Smtp-Source: ABdhPJyAVTV7UBHFATvis5Yt+kFMLGb5xycJTMHG5e208UHE5GsP4qZTJNFCXZK9kH+yk31kQt+1Uw==
X-Received: by 2002:a63:fa45:: with SMTP id g5mr3572393pgk.448.1599877314166;
        Fri, 11 Sep 2020 19:21:54 -0700 (PDT)
Received: from sol (106-69-184-100.dyn.iinet.net.au. [106.69.184.100])
        by smtp.gmail.com with ESMTPSA id m17sm1373096pjn.54.2020.09.11.19.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2020 19:21:53 -0700 (PDT)
Date:   Sat, 12 Sep 2020 10:21:48 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v1 1/2] gpiolib: Fix line event handling in syscall
 compatible mode
Message-ID: <20200912022148.GA3880502@sol>
References: <20200910101935.47140-1-andriy.shevchenko@linux.intel.com>
 <20200911030539.GA574097@sol>
 <20200911083109.GF1891694@smile.fi.intel.com>
 <20200911091249.GA1874731@sol>
 <20200911095355.GG1891694@smile.fi.intel.com>
 <20200911101714.GA2132928@sol>
 <20200911142846.GM1891694@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200911142846.GM1891694@smile.fi.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 11, 2020 at 05:28:46PM +0300, Andy Shevchenko wrote:
> On Fri, Sep 11, 2020 at 06:17:14PM +0800, Kent Gibson wrote:
> > On Fri, Sep 11, 2020 at 12:53:55PM +0300, Andy Shevchenko wrote:
> > > On Fri, Sep 11, 2020 at 05:12:49PM +0800, Kent Gibson wrote:
> > > > On Fri, Sep 11, 2020 at 11:31:09AM +0300, Andy Shevchenko wrote:
> > > > > On Fri, Sep 11, 2020 at 11:05:39AM +0800, Kent Gibson wrote:
> > > > > > On Thu, Sep 10, 2020 at 01:19:34PM +0300, Andy Shevchenko wrote:
> > > 

[snip]
> > 
> > typedef u64 __attribute__((aligned(4))) compat_u64;
> > 
> > which is bitwise identical - only allowed to 32-bit align.
> 
> Yes. That's what I meant under "not the same".
> 
> As far as I understand the alignment makes sense if this type is a part of
> the uAPI definition. But here we have it completely local. copy_to_user() takes
> a pointer to a memory without any specific alignment implied.
> 
> So, what you proposing is basically something like
> 
> ret = copy_to_user(buf, &ge, compat ?  sizeof(compat) : sizeof(ge));
> 
> Correct?
> 

That isn't how I would write the copy_to_user(). The size would be
calculated once, using the linevent_user_size() helper, with
appropriate documentation as to why this is necessary, and then
used throughout lineevent_read().

The documentation would mainly be on the lineevent_user_size() function
itself.

> I don't like the difference between 2nd and 3rd argument. This what looks to me
> hackish. Variant with explicit compat structure I like more.
> 

Agreed - writing it that way does look pretty nasty.

But my suggestion is actually this:

ret = copy_to_user(buf, &ge, event_size);

I suggested ge_size previously, but event_size might help highlight that
it isn't always sizeof(ge).

> But if you think it's okay, I will update your way.
> 

I would defer to Bart or Linus, but I think just calculating the
appropriate size is preferable for this case.

Cheers,
Kent.
