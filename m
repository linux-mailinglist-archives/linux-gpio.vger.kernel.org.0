Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66BEC2AC129
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Nov 2020 17:45:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729942AbgKIQpo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Nov 2020 11:45:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726410AbgKIQpo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Nov 2020 11:45:44 -0500
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD812C0613CF;
        Mon,  9 Nov 2020 08:45:42 -0800 (PST)
Received: by mail-pf1-x442.google.com with SMTP id a18so8502537pfl.3;
        Mon, 09 Nov 2020 08:45:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=71ZA6fbBt/FYq9Yhv+Sw9ZIQkG6/ePxg0ItPs/D9GHo=;
        b=dFGCRp4HQO2QC53KqPkIOGuKPiTb0MMC+WaFg+uMtDK1oksOXt3Y1c0HQUxtVjOxtt
         gvy8L27H6qCKEPKY08LIHUuaXdwjWebNkTqKNTS//oAVPDlDPZV5zAU3hWnrafy830Db
         OYMi+aZqgKS6nIAEU5BJ6KquRDJDcRzIR/6y3gBqGzxyAefFpun5/Z8fjNQ3GlTGdDiY
         Zpj9pRXkPXX2I9Pzu4OTB8FkueM8e+Hvc0zWrKUpDb5gwZ1i/DaoZGS+yoa9Wg2yt7hf
         oj0/lbKp8fhdTSGFpGrk/DSl9L4TWz6lmv8HLDu+ZA1rP+ai2pLgBVcv5rAzO7wUSVeX
         1B2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=71ZA6fbBt/FYq9Yhv+Sw9ZIQkG6/ePxg0ItPs/D9GHo=;
        b=P7D8bvkxpo7ApjWaU+S8Co2yXtOnXJTaccStFuZF6RwIi8nbIZYVuBvFhXmw2nRImU
         U+VgcMfiVzQTBc2YIxCGIZIRPbKMYeUHF0uPXzNRZl2IDklnUnBVQPpSPY4JDGgzufxp
         q6Aq6I3JCvYC8JoJ8cSyj3Bxyw6bsakeB1M/8DsYjdHkYCqUB8ESpLU97c0Qle65H4zA
         h08IOSWPg/ppPTF11BcohSyci1prQjizhpa21QnzXTVXULrlUKznuYHhTUD4/cD1vIBS
         9IaF7nlMbMVBUID6Y1v9xYIZJtXKjJ7Ylkdq91WypktR/M3XZjrTYqgqpkAXEfOSK1nH
         O9Rw==
X-Gm-Message-State: AOAM532q7uMdUzQTbN5W0Bv+oA0kxy2aGbLL5c2rxlH7KsSXBO6SpO1n
        sd9mvgNSQj74+5doOyyG4JM=
X-Google-Smtp-Source: ABdhPJyEigPHxinw9lcZASoyZh54Ipx/Vyh6HNx1mgZ52ds7e8/f3SY+ZA2LYWRcNIVEWTw2bHRGbQ==
X-Received: by 2002:a63:d357:: with SMTP id u23mr13835450pgi.106.1604940342272;
        Mon, 09 Nov 2020 08:45:42 -0800 (PST)
Received: from syed.domain.name ([103.201.127.51])
        by smtp.gmail.com with ESMTPSA id p188sm10796880pgp.65.2020.11.09.08.45.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Nov 2020 08:45:41 -0800 (PST)
Date:   Mon, 9 Nov 2020 22:15:29 +0530
From:   Syed Nayyar Waris <syednwaris@gmail.com>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     William Breathitt Gray <vilhelm.gray@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v12 4/4] gpio: xilinx: Utilize generic bitmap_get_value
 and _set_value
Message-ID: <20201109164529.GA28710@syed.domain.name>
References: <cover.1603055402.git.syednwaris@gmail.com>
 <15a044d3ba23f00c31fd09437bdd3e5924bb91cd.1603055402.git.syednwaris@gmail.com>
 <CAK8P3a3f=fuq24QwNee3QgoMcSK5rcvLRpdTOWBZ9NJ4d-4bvA@mail.gmail.com>
 <20201101150033.GA68138@shinobu>
 <CAK8P3a0y7mh=ZDPefgpawY97gpYv79UXFLBzoGfu3ex2up2aDQ@mail.gmail.com>
 <20201109123411.GA19869@syed>
 <20201109134128.GA5596@shinobu>
 <CAK8P3a2FMkMc0K+hu0pnqC8wEMeapKPkZXaBm+HFYYPTes5NHA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a2FMkMc0K+hu0pnqC8wEMeapKPkZXaBm+HFYYPTes5NHA@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 09, 2020 at 03:41:53PM +0100, Arnd Bergmann wrote:
> On Mon, Nov 9, 2020 at 2:41 PM William Breathitt Gray
> <vilhelm.gray@gmail.com> wrote:
> > On Mon, Nov 09, 2020 at 06:04:11PM +0530, Syed Nayyar Waris wrote:
> >
> > One of my concerns is that we're incurring the latency two additional
> > conditional checks just to suppress a compiler warning about a case that
> > wouldn't occur in the actual use of bitmap_set_value(). I'm hoping
> > there's a way for us to suppress these warnings without adding onto the
> > latency of this function; given that bitmap_set_value() is intended to
> > be used in loops, conditionals here could significantly increase latency
> > in drivers.
> 
> At least for this caller, the size check would be a compile-time
> constant that can be eliminated.
> 
> > I wonder if array_index_nospec() might have the side effect of
> > suppressing these warnings for us. For example, would this work:
> >
> > static inline void bitmap_set_value(unsigned long *map,
> >                                     unsigned long value,
> >                                     unsigned long start, unsigned long nbits)
> > {
> >         const unsigned long offset = start % BITS_PER_LONG;
> >         const unsigned long ceiling = round_up(start + 1, BITS_PER_LONG);
> >         const unsigned long space = ceiling - start;
> >         size_t index = BIT_WORD(start);
> >
> >         value &= GENMASK(nbits - 1, 0);
> >
> >         if (space >= nbits) {
> >                 index = array_index_nospec(index, index + 1);
> >
> >                 map[index] &= ~(GENMASK(nbits - 1, 0) << offset);
> >                 map[index] |= value << offset;
> >         } else {
> >                 index = array_index_nospec(index, index + 2);
> >
> >                 map[index + 0] &= ~BITMAP_FIRST_WORD_MASK(start);
> >                 map[index + 0] |= value << offset;
> >                 map[index + 1] &= ~BITMAP_LAST_WORD_MASK(start + nbits);
> >                 map[index + 1] |= value >> space;
> >         }
> > }
> >
> > Or is this going to produce the same warning because we're not using an
> > explicit check against the map array size?
> 
> https://godbolt.org/z/fxnsG9
> 
> It still warns about the 'map[index + 1]' access: from all I can tell,
> gcc mainly complains because it cannot rule out that 'space < nbits',
> and then it knows the size of 'DECLARE_BITMAP(old, 64)' and finds
> that if 'index + 0' is correct, then 'index + 1' overflows that array.
> 
>       Arnd

Hi Arnd,

As suggested by William, sharing another solution to suppress the 
compiler warning. Please let me know your views on the below fix. Thanks.

If its alright, I shall submit a (new) v13 patchset soon. Let me know.

@@ -1,5 +1,5 @@
 static inline void bitmap_set_value(unsigned long *map,
-                                    unsigned long value,
+                                    unsigned long value, const size_t length,
                                     unsigned long start, unsigned long nbits)
 {
         const size_t index = BIT_WORD(start);
@@ -15,6 +15,10 @@ static inline void bitmap_set_value(unsigned long *map,
         } else {
                 map[index + 0] &= ~BITMAP_FIRST_WORD_MASK(start);
                 map[index + 0] |= value << offset;
+
+               if (index + 1 >= length)
+                       __builtin_unreachable();
+
                 map[index + 1] &= ~BITMAP_LAST_WORD_MASK(start + nbits);
                 map[index + 1] |= value >> space;
         }


