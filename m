Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F29CD32CBBB
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 06:07:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229714AbhCDFGb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Mar 2021 00:06:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229494AbhCDFGF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Mar 2021 00:06:05 -0500
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41D78C061574
        for <linux-gpio@vger.kernel.org>; Wed,  3 Mar 2021 21:05:25 -0800 (PST)
Received: by mail-oi1-x22e.google.com with SMTP id l64so28763389oig.9
        for <linux-gpio@vger.kernel.org>; Wed, 03 Mar 2021 21:05:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6HGZ0WK2qAddwQzRzoqcSS6KSsx7wj5H1uzTNx3pDvU=;
        b=MvQZdKA+2dXHhKDVpUNMuZxALRvF+KJ57uzjymQPNDJi49g67kn7Qx+5/XIfPRRVxH
         jCXz1pnM24guQtQyWEOdBFROJdGTlWpVpvzkqyf1cWlM9lh9mcnH3wzeRA/j9MHJPqMG
         /ui1QuHyNiv/B7v4hXFOwojPcn+rRxjkta6UQ62UzywxuoSACBZzRjkksh+Z2KL5gBbl
         XUl6mmilvSEgyEo5Nh6/Rqnje13wP0WKZU9cyQ7sWK52uRFcvtv3POpZwuHDK9qshcte
         qSSu4ruBWEeeoWUQJpEpobWQLttJu2PyygkkC5E0a8Y7s3of0dbiSv5ZO6zzUXcAqED/
         Ai/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6HGZ0WK2qAddwQzRzoqcSS6KSsx7wj5H1uzTNx3pDvU=;
        b=L7Dj+SiCb1rZM01YpGXVzJoYCJrJsK05+KrTWVEhU+UWa5MwZ1V8MoExqnHXeBweaG
         AH/0lBqjIDc2hM3qQK0P7Cc9SFpPVmWdaFKXDGc0t9VQjQcjrlI/M1ej2UgZaBhq2amt
         FxHwA9Txi2std4VrUDcsQDNBAyo6E64alX+U5YYF8GYf8JzMlIxXktftXLEy7xiUo9b6
         +pP2+yARzFfGE8u5liFsEJNS5MulYhk3RkCRsQ9OmsOUKwMb+YrD0dsWheboAKC2VWGm
         ztdfWinXmVb9sfJBRJmpz5IOwrQeYlmWE7CsnRxcbzu9d3DRFRrWVsu189hxFyTEcNNN
         9BSw==
X-Gm-Message-State: AOAM531LdecWYZAgA8rV+PSxsIGr1J60nKW40AoeM99lH4j/byWDUJyL
        BraZp/oFA7g/o94qQpB3Z387XJO1o0/wtw==
X-Google-Smtp-Source: ABdhPJw/f7Y1QbK5Q/CLbd7YgYq4xEyl8QnvDGyXJvCA2ts+oC6w6oURHHFufgSnr+gZQC4EllCKHg==
X-Received: by 2002:aca:4bc5:: with SMTP id y188mr1797036oia.135.1614834324673;
        Wed, 03 Mar 2021 21:05:24 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id r81sm1043568oie.2.2021.03.03.21.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 21:05:24 -0800 (PST)
Date:   Wed, 3 Mar 2021 23:05:22 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2] pinctrl: qcom: support gpio_chip .set_config call
Message-ID: <YEBqktwx3uYAJR9O@builder.lan>
References: <20210303131858.3976-1-shawn.guo@linaro.org>
 <YD+iWuLS/9knWLFb@builder.lan>
 <20210304022459.GD17424@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210304022459.GD17424@dragon>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed 03 Mar 20:24 CST 2021, Shawn Guo wrote:

> On Wed, Mar 03, 2021 at 08:51:06AM -0600, Bjorn Andersson wrote:
> > > @@ -717,6 +731,7 @@ static const struct gpio_chip msm_gpio_template = {
> > >  	.get_direction    = msm_gpio_get_direction,
> > >  	.get              = msm_gpio_get,
> > >  	.set              = msm_gpio_set,
> > > +	.set_config       = gpiochip_generic_config,
> > 
> > Generally the pinconf/pinmux part of the driver deals with groups, and
> > the gpio_chip deals with gpio numbers. So I think that either
> > gpiochip_generic_config() should somehow do the translation, or we
> > should use a different function that does it (even though there's no
> > translation).
> 
> The transition from GPIO to PINCTRL world is being done by
> pinctrl_gpio_set_config() which is wrapped by gpiochip_generic_config().
> This is nothing new from gpiochip_generic_request() and
> gpiochip_generic_free() right below.
> 

You're right, this seems analog to the two other gpiochip_generic_*
helpers used below, I should have made this comment on the previous
hunk.

I don't think it's right to have the driver implement both group based
and pin based pin_conf_set/get functions (at least not for the same
entities), but I've not found the time to review the core code to
determine if this would cause any issues.

Regards,
Bjorn

> > >  	.request          = gpiochip_generic_request,
> > >  	.free             = gpiochip_generic_free,
> > >  	.dbg_show         = msm_gpio_dbg_show,
> 
> Shawn
