Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27CB5435FAF
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Oct 2021 12:49:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230325AbhJUKwJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Oct 2021 06:52:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230285AbhJUKwJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Oct 2021 06:52:09 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87564C06174E
        for <linux-gpio@vger.kernel.org>; Thu, 21 Oct 2021 03:49:53 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id 75so25251715pga.3
        for <linux-gpio@vger.kernel.org>; Thu, 21 Oct 2021 03:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=diSXIurctqParyeX91eQ1zquoLUSJfsB8YTVPKGj1rg=;
        b=DgwVI/GAtAT6Y0Gceejk+CFb9t3hp5sJtnTnxDP8ZAY+IrUyZ2jT1SI+FiFBwQsS4S
         4iUtNy9GhXtt6Mg4lYSRf0PdfgkXyTN//GARnhMS5oL4tQxSmEhDOp9xxWKqZgHO/KoQ
         MlGQTZs8U/Us0JTjZOVFg4HC7pPZfDL6Eaaaffta4AdVwYfeEmTGPWY13SHUaue66+rP
         /RqLPOhIZguk+tG1fJ2+CwpK2zx9ZN6VMEY3VL6h+OhWAvAjm596Jut0Pdei2CBVQ8mp
         YJfqYBaFoTew2gWZCzotI16ogBwo0+qgDSHmG4QnMg3SurrqZ8olYJlfIjqsqdWQo2pq
         aSUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=diSXIurctqParyeX91eQ1zquoLUSJfsB8YTVPKGj1rg=;
        b=VdxvkfJ7gtGgWEfRoytS0X/Lr1bnRoTEljpCrnY+hfTBiNqlRrPGAomNuahUc2Cear
         UHWJmO8NVpTKKe0QWJgQfVUwbJAeH/rfyXyCn/3I2XsY2V3M0+7l1JokFdEEE1AFvL99
         trPXsXDmkljqcV2VU6lrwR7hqvL5pyCLyX0MEhuU4l25k9krOYDTkGqodoY1aJvPBqLX
         67Jo/2JHeqbCtzvhwLqx3HcgYU690SvlAHQthewGr14ekdUR5ijELKUuBopSuPaKxFCJ
         8fRdAxyFHN5+MvHlxvKzqwYdKOLaK1vhpeUCvDpPa5zBlSnl4BCGvAiVB5d/ieBV54Qf
         8SgA==
X-Gm-Message-State: AOAM530g4r4svNZQZe34ZyHm+ZGTNeps5Znu4olHAAYF++uF9sigQij3
        R2Lm7DE8TajfCt5ziHleH7By2Q==
X-Google-Smtp-Source: ABdhPJxQmq6uOHLqJCEYKHHk8rV8cTL5H3Ywlzsew3ZtjOIE3cFz7q3n2AHECjXVsjUD9Uq0kaqbrg==
X-Received: by 2002:a63:1e0e:: with SMTP id e14mr3812332pge.5.1634813393001;
        Thu, 21 Oct 2021 03:49:53 -0700 (PDT)
Received: from localhost ([106.201.113.61])
        by smtp.gmail.com with ESMTPSA id y20sm5743062pfp.68.2021.10.21.03.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 03:49:52 -0700 (PDT)
Date:   Thu, 21 Oct 2021 16:19:50 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Arnd Bergmann <arnd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Viresh Kumar <vireshk@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Jean-Philippe Brucker <jean-philippe@linaro.org>,
        Bill Mills <bill.mills@linaro.org>,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Cornelia Huck <cohuck@redhat.com>,
        "stratos-dev@op-lists.linaro.org" <stratos-dev@op-lists.linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Marc Zyngier <maz@kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "virtualization@lists.linux-foundation.org" 
        <virtualization@lists.linux-foundation.org>
Subject: Re: [PATCH V6] gpio: virtio: Add IRQ support
Message-ID: <20211021104950.nhvify5lo7y5fdfh@vireshk-i7>
References: <8ca87330fd348fc5199ad08904ec90cc6a91a1bf.1634723848.git.viresh.kumar@linaro.org>
 <CAHp75Vctj-v8W+LgdVpYgRVL3fLdcFnOFRFg74LeCc=xLD+w4w@mail.gmail.com>
 <20211021043443.snhqpac5ofmxfb7k@vireshk-i7>
 <CAHp75VdKn7Sze9HxN0gBgbuQS2K6oB+SQsufw576Rkfg4-osOw@mail.gmail.com>
 <20211021095229.lqeb7dtxv4ix2vc5@vireshk-i7>
 <CAMuHMdWDRGmxt55vvRTnyu5SwXCDtkcOLmKA87cd4SSa8S+Z=Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWDRGmxt55vvRTnyu5SwXCDtkcOLmKA87cd4SSa8S+Z=Q@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 21-10-21, 12:07, Geert Uytterhoeven wrote:
> On Thu, Oct 21, 2021 at 11:52 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > The structure will get aligned to the size of largest element and each
> > element will be aligned to itself. I don't see how this will break
> > even in case of 32/64 bit communication.
> 
> Structures are not aligned to the size of the largest element, but
> to the largest alignment needed for each member.

Right, I was talking in terms of the structures we have here for GPIO.
The biggest member here (for any structure) is 32bits long, and
compiler shouldn't add extra padding here.

> This can be smaller than the size of the largest element.
> E.g. alignof(long long) might be 4, not 8. 

Right.

> And m68k aligns to two bytes at most.

Interesting, I assumed that it will be 4bytes for 32 bit systems. So
in case of m68k, we will see something like this ?

struct foo {
    u8 a;       // aligned to 2 bytes

                // padding of 1 byte

    u32 b;      // aligned to 2 bytes
}

-- 
viresh
