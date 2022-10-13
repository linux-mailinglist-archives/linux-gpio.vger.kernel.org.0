Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BCF8D5FD9C0
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Oct 2022 15:00:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229825AbiJMNAz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 13 Oct 2022 09:00:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229652AbiJMNAy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Oct 2022 09:00:54 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C467CE99B
        for <linux-gpio@vger.kernel.org>; Thu, 13 Oct 2022 06:00:50 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id c7-20020a05600c0ac700b003c6cad86f38so3197492wmr.2
        for <linux-gpio@vger.kernel.org>; Thu, 13 Oct 2022 06:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e090UptYvOlwk2o/spWxT+a1kzobKHCjkmTW/8q9c3w=;
        b=F93eWzPL++XtQDy3a+zXwCE1abMBEHhZZC5fk/G5lRAZN1p3fw0BJzCSRf1JxVOu7E
         elk+ogcpjyjt0BJaW1qA7Bf1QwT5SOdBIxRdpsMN19BHaa1o+q35gUZk9ao/5jly7Us9
         bVJFBbIlaj9Pbwrogy+r+lvxcswsp7V/YFm7Y/YRtQHDM7NYVkQLQRl1Wgj09iJ82lJS
         tNxno/D2gJt/GRKM6SJoloEDoFDKI6sIIh9hlZfqvKTIFvS/1Agac/4U7sENZ9zSO5bm
         FJoRM6/sVmjvHYzN9GK/zIModIXYZIW2y/aMWHCVMYiN2oEYl7B2MA8JSShQ9OADH32q
         Yl7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e090UptYvOlwk2o/spWxT+a1kzobKHCjkmTW/8q9c3w=;
        b=g3ICbL6KRPdJeqMy2MoUgCKTWvp0l/J2Rvk7elBoRGYiALcLBBE/9Abuil3nsCnGak
         EVFZvrmVnCjEmdxkjxZaDEmfkEGd7sgmc1emcZbzLjAjhDwmRsnm9n2+XiKtTbJs4ojn
         +sMSCtylqZJV17skiPnTPUMALkJPwhm2O4BjNJiZKzboKmqWoNiayqLPhagGWnvFmGmB
         U3JPewg8fqyWnrwRsuSSU0pmN1o7V8EOzSzkDtzcn2XdnVFcXvQadO8ilRZKf9INJBWd
         4VUqnq/uff79R2k6FUBcWUds8BrdWPPRD88vC5DIto0AOuiXq1mQMT8aYfCxi5IOCdNl
         9Quw==
X-Gm-Message-State: ACrzQf3g0zlYSv/v0FpTZKSqJe9lGUkGTy1Jk6pKmbQtMCS9osuKpZjJ
        DXFn0GFYp+IPRUn+1P4qooiUKA==
X-Google-Smtp-Source: AMsMyM5/qlMI5/7Jp1jEd/FpZ/9JWGz4x3dWQG9gJzlvxn/ShMXACpcKdGSWC8DNtFHlxSjfNttBLQ==
X-Received: by 2002:a1c:2543:0:b0:3c6:b7bd:a474 with SMTP id l64-20020a1c2543000000b003c6b7bda474mr6110469wml.95.1665666049068;
        Thu, 13 Oct 2022 06:00:49 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id c3-20020a1c3503000000b003a6125562e1sm4333524wma.46.2022.10.13.06.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Oct 2022 06:00:48 -0700 (PDT)
Date:   Thu, 13 Oct 2022 14:00:46 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 4/7] gpiolib: of: add a quirk for reset line for Marvell
 NFC controller
Message-ID: <Y0gL/tdaCFOq98uo@maple.lan>
References: <20221011-gpiolib-quirks-v1-0-e01d9d3e7b29@gmail.com>
 <20221011-gpiolib-quirks-v1-4-e01d9d3e7b29@gmail.com>
 <Y0aW7vDxfNa/8bAk@maple.lan>
 <Y0cLLraNFVXtD2/k@google.com>
 <Y0cMibfIomw3S5dc@maple.lan>
 <Y0cNqBKm7LhZd28t@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y0cNqBKm7LhZd28t@google.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 12, 2022 at 11:55:36AM -0700, Dmitry Torokhov wrote:
> On Wed, Oct 12, 2022 at 07:50:49PM +0100, Daniel Thompson wrote:
> > On Wed, Oct 12, 2022 at 11:45:02AM -0700, Dmitry Torokhov wrote:
> > > On Wed, Oct 12, 2022 at 11:29:02AM +0100, Daniel Thompson wrote:
> > > > On Tue, Oct 11, 2022 at 03:19:32PM -0700, Dmitry Torokhov wrote:
> > > > > The controller is using non-standard "reset-n-io" name for its reset
> > > > > gpio property, whereas gpiod API expects "<name>-gpios". Add a quirk
> > > > > so that gpiod API will still work on unmodified DTSes.
> > > > >
> > > > > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > > >
> > > > How/when has/will the DT bindings documentation for this hardware be
> > > > updated to describe the new bindings?
> > > >
> > > > Delivering the quirks ahead of driver updates is great for avoiding
> > > > merge conflicts but it also conceals the rename from reviewers so
> > > > risks neglecting to update the bindings.
> > >
> > > I was planning on sending binding updates once driver patches land.
> >
> > I'd have a (weak) preference for them being shared in the same patchset.
> > Maintainers can either ack or the changes can land seperately but
> > having them in the same patchset helps avoid having to quibble or check!
>
> OK, so how about once we agree and land this patchset to gpiolib I can
> blast driver patches + binding patches together?

That's good for me!


Daniel.
