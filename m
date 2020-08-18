Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58E9D248699
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Aug 2020 16:00:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726570AbgHROAL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Aug 2020 10:00:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726482AbgHROAJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Aug 2020 10:00:09 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26825C061389;
        Tue, 18 Aug 2020 07:00:09 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id 2so9440566pjx.5;
        Tue, 18 Aug 2020 07:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/oh+BcdsFeBRm7bcoZIVYJ25TsHY2ROrPUeqhFfeYCY=;
        b=rPsGsqpBlwfOIi1dDqvsJIViRe2mzwhb1+n7f2Ez6TWD9FWEPhZD1teu6GGT/YEKBk
         xX4n3EmeK6UC0cHa/PILAC66FWHopAqt2WOCYoOr99kUGIgFgd5KwcpAspg5l9jBkhT6
         B6suQg6iPopeT5V5p06r+MH6K6uWfU+HxcWh+CF+qIQcsPoJW3z7/519xtBzwq/KnjgB
         1KxnywCbY7qdOpJOrFG/3olaE31TWk/146VsMQCZlHS8BLacEsZkOEQxBSDxDTRlymlX
         VVboTuvAuIUNTEii9Y85xPOBan44+nD+pwnfRccdua5gFLOs78zSgnmOSsfEL3aNJ9Xm
         6JjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/oh+BcdsFeBRm7bcoZIVYJ25TsHY2ROrPUeqhFfeYCY=;
        b=EaViUmdHBHTm5PqV0JI1oOVSk0emb6zePqnEBL13cGnIdhy9o/qIUiwlGvpuG+6qVO
         CfPyd6TbJnYrjRX59c7UmSNGpH4CTo6D1BSBh36SMSLJ9tU9mXnQeZeDwXmir8eMsRvy
         /DCS9/jZRJmBeHffaYlwudxnWHGW7fGDlkHcl6sTZKfvqe0XZsvHjh26jDlg9KRuPPHj
         1zH5AM+DtwS7LeIm1iafNuQwnO59XPaQZczVCkqNHkmWHsY7U6ubyOaLNXrZZ3dotHId
         W15Pqg0VXgm4r90VTGNfJ+5/iqzDQCfyUNCfW1Wrgqeae5nVUOCkDAryRgdrLxCQmIFU
         5+7w==
X-Gm-Message-State: AOAM532dm2pM9ZJBmtm85BkP9vhsxhMyMFbw59Lzr42rX5n2YR70BBsk
        ifcN0SqvgRmpNGgrPSuv3pGt0pMwHsY=
X-Google-Smtp-Source: ABdhPJxH966E5lH7RAu83+sOGjaAPxkud5eI2kNsZBNzLmIKwHRuvQEJRRAWIJjU6JCS71onbA4i4Q==
X-Received: by 2002:a17:90a:fe91:: with SMTP id co17mr79426pjb.103.1597759208613;
        Tue, 18 Aug 2020 07:00:08 -0700 (PDT)
Received: from sol (106-69-184-100.dyn.iinet.net.au. [106.69.184.100])
        by smtp.gmail.com with ESMTPSA id w82sm25275749pff.7.2020.08.18.07.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2020 07:00:07 -0700 (PDT)
Date:   Tue, 18 Aug 2020 22:00:02 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 09/20] gpiolib: cdev: support edge detection for uAPI
 v2
Message-ID: <20200818140002.GA17809@sol>
References: <20200814030257.135463-1-warthog618@gmail.com>
 <20200814030257.135463-10-warthog618@gmail.com>
 <CAMpxmJVeAKpNnX0HXSNSLYqX6T+qxun8ppZ7EwzFb3WsS=nanw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMpxmJVeAKpNnX0HXSNSLYqX6T+qxun8ppZ7EwzFb3WsS=nanw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Aug 16, 2020 at 04:32:34PM +0200, Bartosz Golaszewski wrote:
> On Fri, Aug 14, 2020 at 5:04 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > Add support for edge detection to lines requested using
> > GPIO_V2_GET_LINE_IOCTL.
> >
[snip]

> >
> > +       /* event_buffer_size only valid with edge detection */
> > +       has_edge_detection = gpio_v2_line_config_has_edge_detection(lc);
> > +       if (lr.event_buffer_size && !has_edge_detection)
> > +               return -EINVAL;
> > +
> >         line = kzalloc(struct_size(line, descs, lr.num_lines),
> >                        GFP_KERNEL);
> >         if (!line)
> > @@ -666,6 +944,16 @@ static int line_create(struct gpio_device *gdev, void __user *ip)
> >         line->gdev = gdev;
> >         get_device(&gdev->dev);
> >
> > +       line->edets = kcalloc(lr.num_lines, sizeof(*line->edets),
> > +                             GFP_KERNEL);
> 
> You're allocating num_lines of edge detectors even if only certain
> lines have edge detection (via attributes). I don't like it but it
> made me think about struct line. How about having struct line which
> actually only represents a single line (and it contains the relevant
> gpio_desc pointer as well as the associated edge detector and any
> other data only relevant for this line) and a set of lines would be
> aggregated in struct line_request or line_request_data which would
> additionally contain common fields? Does that even make sense?
> 

You are right, and it makes total sense.

I'm not totally thrilled with the block allocation either, but an
earlier draft with edge detectors/debouncers created and destroyed as
required resulted in complicated lifecycle management that this approach
avoids.

I'll have a look at restructuring it as you suggest.
The only downside that springs to mind is that the gpiolib API expects
a desc array, which we'll no longer have handy, so it would have to be
built on the fly as per the sparse gets/sets.

Cheers,
Kent.
