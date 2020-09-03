Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6226625BCAA
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Sep 2020 10:14:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726493AbgICIOP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Sep 2020 04:14:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728855AbgICINz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Sep 2020 04:13:55 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 491AAC061245
        for <linux-gpio@vger.kernel.org>; Thu,  3 Sep 2020 01:13:55 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id w1so1765196edr.3
        for <linux-gpio@vger.kernel.org>; Thu, 03 Sep 2020 01:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zUoJbHPHuQXdey7P9WwyU7u5m+V2GxPJvOAbd/pjt6Y=;
        b=Vls6af3nzQFKgGvvhF/oX43ytcRIy1cL6cfsmdlTLy0V8u8caSqNL++pef1UL8SLTF
         5BxoR5ULjKWh6HL2xQnr2jtLmgtpeZiHDuduqNsZoV2iMe+yDhV+4PkKFQbvCwIcSAZa
         DImsPiza7nA2m0ZOimu8TLhBWVpTCRmU387kDxlJ2sepaG1nw1maxek1mJ5ZgmX0aOZd
         x0ZzT9cRNwXpVUn1DsiwyYYLw9CgCY/3wkRl3ssYVbTfHvgeLAceCcJLY81rQfl6TqXc
         5+WrVs8ZBBWCYp/hj9ChaU0n/7NbZI/kl4zcJoMWt+CMmCtoJx9fOK5QYgluWl/V2Efe
         PsHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zUoJbHPHuQXdey7P9WwyU7u5m+V2GxPJvOAbd/pjt6Y=;
        b=GvO6d5zWKUr2z7/aAKqCctW7pW/Ow0tUfturvDYYUaXIFZFQg2QwdQpnZpa2SCb5If
         15Wdto6n11GWgE0UTTo0aksha89AKsCWXY5kC3sFLFsJvUmfu1sIkLCgjX0pA7NLg9pa
         4FLa9487CU8/W98lGHxSlTPO3rFEiE2MnXsH6x3sjypz1q+065lHhe7Kzta3KsZ0zKtZ
         HS4Vx6USCUJviDjxY/fw8K5fD4OrAmlk9WRHec2nEDy5eFHPCexHT83JfTCnb8W1AwHt
         O+qn+DDhPRZoMxvAQwvp0axCWZuhUVtQIti6XR5kXnb4rT7jFZ4/BMzkAbrQeXrDTIvv
         EAmA==
X-Gm-Message-State: AOAM533iAeNhJaDvN9H7/StKXc1YTHM4vrpPt3iaMyNCrBHm+zlD2I6T
        MYiufVSdN2GOmmnjx7cuzOrkwsiWmSSL6gsV8uyb9Q==
X-Google-Smtp-Source: ABdhPJwo/AfQnqSjG0sAN18pqSXAniRYmu0hReePCXgJwLZspfnKT5OlG2QeSIjiKtEHZ9f1HQY43/kNlTh6KMQ0Xa4=
X-Received: by 2002:a50:f687:: with SMTP id d7mr1882489edn.353.1599120833752;
 Thu, 03 Sep 2020 01:13:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200831032006.1019978-1-warthog618@gmail.com>
 <20200831032006.1019978-10-warthog618@gmail.com> <CAMpxmJW9EC_ocs8dA3j+QPu8sW4Na9WEvPYEUZjfxk4-ojf+kA@mail.gmail.com>
 <20200903080909.GA17108@sol>
In-Reply-To: <20200903080909.GA17108@sol>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 3 Sep 2020 10:13:43 +0200
Message-ID: <CAMpxmJWMxkg14Jx1VyqcX_rhGWqFo4YTfWtDEQe-NUTtqx2kVA@mail.gmail.com>
Subject: Re: [PATCH v6 09/20] gpiolib: cdev: support edge detection for uAPI v2
To:     Kent Gibson <warthog618@gmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 3, 2020 at 10:09 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Thu, Sep 03, 2020 at 09:55:22AM +0200, Bartosz Golaszewski wrote:
> > On Mon, Aug 31, 2020 at 5:22 AM Kent Gibson <warthog618@gmail.com> wrote:
> > >
> > > Add support for edge detection to lines requested using
> > > GPIO_V2_GET_LINE_IOCTL.
> > >
> > > The edge_detector implementation is based on the v1 lineevent
> > > implementation.
> > >
>
> [snip]
>
> > > +        * close in time as possible to the actual event.
> > > +        */
> > > +       line->timestamp = ktime_get_ns();
> > > +
> > > +       if (lr->num_lines != 1)
> > > +               line->req_seqno = atomic_inc_return(&lr->seqno);
> >
> > Do we never increase req_seqno for a single line?
> >
>
> For a single line we just use line_seqno for both to avoid the
> atomic_inc here and so reduce the time spent in the ISR and any
> SMP sync overheads.
>
> As per the comment in struct linereq:
>  * @seqno: the sequence number for edge events generated on all lines in
>  * this line request.  Note that this is not used when @num_lines is 1, as
>  * the line_seqno is then the same and is cheaper to calculate.
>
> Cheers,
> Kent.

I should have RTFC I guess. :)

Bart
