Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 889B51D617C
	for <lists+linux-gpio@lfdr.de>; Sat, 16 May 2020 15:59:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726362AbgEPN6w (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 16 May 2020 09:58:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726302AbgEPN6v (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 16 May 2020 09:58:51 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98504C05BD09
        for <linux-gpio@vger.kernel.org>; Sat, 16 May 2020 06:58:51 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id g11so2139209plp.1
        for <linux-gpio@vger.kernel.org>; Sat, 16 May 2020 06:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=2BY2MeLSpblRsT2HXMrnj+8RTEHYsF/7I5WsuiZ4e0A=;
        b=g23b0tzlxh5U/Q+b1TlCSIoFD1b7ijt7m+aIeCA9SmYHEzdY0luaNze2zJdRrpMGYr
         B0IixNNgblhDV3KwWKPwxo6txNaJt917whiSTfAkaEKCtn4mxJSGBczM99kjjb5EtBsJ
         hBLmZuc2ZTs2OI7V5xn1DgiSnCc25UNiDNjWSH40q2aHTHYzavuXkvYd50hLFOqtOHoz
         pps0oqMLkRADJDbb5rwOURa9EWn2lYR29+WM6pSmPD+0VJpUjjtOIjjiEHGqUDNjET5p
         4WLI2GW8IrOiFCu3J31zav+oS9Z6u5LbYy/4dzfnqIlrpQanCJOtWpyOUasQztmsYjpq
         NXcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=2BY2MeLSpblRsT2HXMrnj+8RTEHYsF/7I5WsuiZ4e0A=;
        b=CZ2EOLSsyUfCBQKtmQsTimipito0r3QYaLPn4HU4eTdWzA+/0INCDU6XqinGqaSf5R
         IrXFGNWbw2RDM5PRIMIJ7gQnfxjsFmZOPt68DXPFI/RWwg6rRj1jF0cyakAqVIINaLvQ
         kcaROIyTPTBvBGp2xa9Y/iJjyo1+yOBEOcwbdn2LpYCR+jkxBpJPpXMYsvmROAhOmnKB
         zAq9U4vbM5MwpLeWlrY9L46bKbGvNE1qcv4jOo75lrNvXVLk7eIGGBy8wkSJoZBUY82w
         9QxP1WrUiSpg9vtd0TaXDsquCaf2jnr3ZM11uXf2i+gWuuIvWYsY12P6X8IUbVooyz2w
         e7lg==
X-Gm-Message-State: AOAM530eRjF/ig0VhzTkow52UbbQxVSz8WFqxJRbI7x86gxLSZ/Ur2a9
        JSf1RUksH+nxTSIf6dFVMKsE
X-Google-Smtp-Source: ABdhPJxtjTOQlMVwHc6XBjCPMpxiD+/uWxir6Qcgj72yx4sXRkrxQB9IhupN/NwOTUwgwgSHAQeZbg==
X-Received: by 2002:a17:90a:ee85:: with SMTP id i5mr8866034pjz.165.1589637530724;
        Sat, 16 May 2020 06:58:50 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:216:faa9:20af:7888:5f3d:69ce])
        by smtp.gmail.com with ESMTPSA id d35sm3914205pgd.29.2020.05.16.06.58.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 16 May 2020 06:58:49 -0700 (PDT)
Date:   Sat, 16 May 2020 19:28:42 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Kent Gibson <warthog618@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH] gpiolib: notify user-space about line status changes
 after flags are set
Message-ID: <20200516135842.GA17153@Mani-XPS-13-9360>
References: <20200509141507.19531-1-brgl@bgdev.pl>
 <CACRpkdZ2WGs=aWjwS=vk6-PDMvXMLppfBBF-8rs42F=ko3biNg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdZ2WGs=aWjwS=vk6-PDMvXMLppfBBF-8rs42F=ko3biNg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, May 16, 2020 at 11:30:36AM +0200, Linus Walleij wrote:
> On Sat, May 9, 2020 at 4:15 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> 
> > Since the flags can be configured in different ways depending on how the
> > line is being requested - we need to call the notifier chain in different
> > places separately.
> 
> Ooops.
> 
> > This comes late in the release cycle but I only recently got down to
> > writing libgpiod support for this new ioctl(). When writing test cases
> > I noticed this doesn't really work as expected.
> 
> This is why I am so grateful about the tests you are doing with
> libgpiod! We actually find these problems quickly and not after
> years. Thanks!
> 

This forces me to add tests for chardev in MRAA ;) (Don't ask me about other
interfaces)

Thanks,
Mani

> > This patch fixes the
> > issue I identified this week. There may be more coming the following
> > week though...
> 
> I will pull in your pull request once the next -rc is out as I had already
> sent my first pull request, but do not hesitate to bug me about this.
> 
> Yours,
> Linus Walleij
