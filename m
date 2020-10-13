Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4E9728C680
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Oct 2020 02:52:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727917AbgJMAw6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Oct 2020 20:52:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727950AbgJMAw6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Oct 2020 20:52:58 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FA6FC0613D0
        for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2020 17:52:58 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id f19so15406897pfj.11
        for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2020 17:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=EnbzNYV7aiHjt5pWIe7mYcJTguar7FeQa5+3LZl8xkE=;
        b=T2d+eMMj4vPtBHCVu49ErrYmoQADCUQI8sBFaIKUOyuvpoPVUW4nnISog+u4OEcW1v
         kIef2w5gTj7f+Gl4C2pBFxFeMjucHnlbnZJMmbCsMSURF2FALdpi4B5lJrzHVSCOqFIh
         H41YulWnB/HS0KzZv6/nMtG3x9id2vMaT7+xs1RHMmw5AJdc79hB8TfDTJhceLbymT5J
         0x2ybk+umTkzNaagb/av4hQKE7z5w3LJqKOypu7yi3e9NXFKJeWYqRakxwoxUi59GUAH
         +gVe/IXg0BQlx4iwHqOka2tffCyOLg3OGpRlJqi8kpzB3TytrRndEKTbJI7sZ4oFaXVR
         WOAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EnbzNYV7aiHjt5pWIe7mYcJTguar7FeQa5+3LZl8xkE=;
        b=CL3ddtzJxDQrn1IeJYwTYKAVoa+hpVvQZxXeIFESnywdS5b/8/8lyX9QSAVk+Lb/3f
         scbQRPv/5pT7/FhzaCiAGHZEgKGraJlZutRI47vYzXLizo868L/xOeOgqJhRrpV6UsTl
         kFFkoRA+GvBbi17UwT7nEGLdwHFAxlHuJW9tV82+aB9w7ICCGO49dpeE6KOuVMUg2nwc
         Mj3g8ddeLLRsK1UWQ9AdgNFUu9BO12+YWjlHj3eYzYQouJMoi+1AHfN1TDIuLvI1pT/B
         b+y6p/Z16P34swuh7jMRQ8BwFgqw4FZ2fBXECwn09LlQztRwE53yk6U1rk/zo7sQnPB9
         iF3g==
X-Gm-Message-State: AOAM531+7N0u5iW6504yKWIx/L/CdMtFIK9xS31HtolpZPfBcdg2Pgee
        jNkX/jvTBEaSkeoNjXJTpb8=
X-Google-Smtp-Source: ABdhPJzOFqUcoAgD1EXArBJ3xeOvIJqMtfLRcr1iS/OVsfKdR8dJIOxPB9W1ZCTlMXDqLo8KvqY0Ug==
X-Received: by 2002:a62:78d5:0:b029:154:ebc0:c92c with SMTP id t204-20020a6278d50000b0290154ebc0c92cmr26590686pfc.24.1602550377767;
        Mon, 12 Oct 2020 17:52:57 -0700 (PDT)
Received: from sol (106-69-182-59.dyn.iinet.net.au. [106.69.182.59])
        by smtp.gmail.com with ESMTPSA id 70sm22281366pfu.203.2020.10.12.17.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2020 17:52:57 -0700 (PDT)
Date:   Tue, 13 Oct 2020 08:52:52 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [libgpiod] Rethinking struct gpiod_line_bulk
Message-ID: <20201013005252.GA9387@sol>
References: <CAMpxmJVWr-M3R-PfsrDvtpZTtSTBLHL95sAorO5EHVwg1eX67A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMpxmJVWr-M3R-PfsrDvtpZTtSTBLHL95sAorO5EHVwg1eX67A@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 12, 2020 at 05:15:25PM +0200, Bartosz Golaszewski wrote:
> Hi!
> 
> One of the things I'd like to address in libgpiod v2.0 is excessive
> stack usage with struct gpiod_line_bulk. This structure is pretty big
> right now: it's an array 64 pointers + 4 bytes size. That amounts to
> 260 bytes on 32-bit and 516 bytes on 64-bit architectures
> respectively. It's also used everywhere as all functions dealing with
> single lines eventually end up calling bulk counterparts.
> 
> I have some ideas for making this structure smaller and I thought I'd
> run them by you.
> 
> The most obvious approach would be to make struct gpiod_line_bulk
> opaque and dynamically allocated. I don't like this idea due to the
> amount of error checking this would involve and also calling malloc()
> on virtually every value read, event poll etc.
> 
> Another idea is to use embedded list node structs (see include/list.h
> in the kernel) in struct gpiod_line and chain the lines together with
> struct gpiod_line_bulk containing the list head. That would mean only
> being able to store each line in a single bulk object. This is
> obviously too limiting.
> 

I don't think I've ever gotten my head fully around the libgpiod API,
or all its use cases, and I'm not clear on why this is too limiting.

What is the purpose of the gpiod_line_bulk, and how does that differ from the
gpio_v2_line_request?

> An idea I think it relatively straightforward without completely
> changing the current interface is making struct gpiod_line_bulk look
> something like this:
> 
> struct gpiod_line_bulk {
>     unsigned int num_lines;
>     uint64_t lines;
> };
> 
> Where lines would be a bitmap with set bits corresponding to offsets
> of lines that are part of this bulk. We'd then provide a function that
> would allow the user to get the line without it being updated (so
> there's no ioctl() call that could fail). The only limit that we'd
> need to introduce here is making it impossible to store lines from
> different chips in a single line bulk object. This doesn't make sense
> anyway so I'm fine with this.
> 
> What do you think? Do you have any other ideas?
> 

Doesn't that place a strict range limit on offset values, 0-63?
The uAPI limits the number of offsets requested to 64, not their value.
Otherwise I'd've used a bitmap there as well.

Or is there some other mapping happening in the background that I'm
missing?

Cheers,
Kent.
