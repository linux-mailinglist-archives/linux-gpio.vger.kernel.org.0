Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6ADAB32C7E3
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 02:12:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239899AbhCDAdG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Mar 2021 19:33:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244778AbhCCPLo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Mar 2021 10:11:44 -0500
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5A72C061765
        for <linux-gpio@vger.kernel.org>; Wed,  3 Mar 2021 06:45:33 -0800 (PST)
Received: by mail-pg1-x52a.google.com with SMTP id p21so16500142pgl.12
        for <linux-gpio@vger.kernel.org>; Wed, 03 Mar 2021 06:45:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=J/L9Vsw6/4k+W5B5jJbhVRSy0ZASEPs2i2qo9aGLtRI=;
        b=VGb1t57vd1AnaLDcJVgN0jcQy4XECFfONFfDLkIfkz2Y2zxu1CIzs1wUoRVoUt5cBE
         skF1UitNqMHZcMEaG27wih+EWlksdJA3G22qW1x6PpOHuSJQDxC6p9CQBWVyjkmuI6TQ
         oIIGFKQBIkdztN5UFttnMGc3DQJPkHEDUqsLlMWzsJ4/x5jl5l36k5fUayG54ngnjAqr
         FTc8XTaGF7QkIxxL7+r2awBrKJJpmUK2JkUY94had+VGDesrEJyxs/m5IXgjTyiHCyZG
         j/y9+IVY+qqn1otynXFQIZvW3wyHtmNaU9htF4kN/blogsAGvdCg3x/EQbPycgC7Eaar
         9ZiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=J/L9Vsw6/4k+W5B5jJbhVRSy0ZASEPs2i2qo9aGLtRI=;
        b=WsDq/DvytJXjVCzvgwDlSyi8jKnQ43Jf/Y2YHRV7NNmOQi0YSWbdNH6BK3wY/EQpVx
         Ju0ENWbdGpCnB9ejp5xS4I865SFyDb2MOfKMzkWHMd0RLCD4sS3xAkOZA9Eklaq75YQ9
         I/GD0vdGq2RkqrSLYrOBd7tIuKpVxrbbH29dvWtZDn4H4ulPQL7deA3jSvQREFycPDJC
         dw7qQGnfONjB+LoV/oOLqCb95Y6pEs4opSGkwdtYyBKQ7lYXn2H0zsl7ey9j53J7O4FV
         A2Ie/xSUWeeCwMPnWNfkAEEwYMU/LOSgstbODwzF/jEhLIgIcrvi08ObznpSLe0gV1hq
         8DkQ==
X-Gm-Message-State: AOAM532V+q1Os8ZEctbHewTFd2COOUvlX433dnuvrWM8dfCrr+rkszGh
        q+4eaTxOC6Y+6XQvrC7EJ9obZg==
X-Google-Smtp-Source: ABdhPJyxVLc/RTAHDPDHeJkezvj/md/ZQ4R/ctQEls9J9aAp1iO/W16NfVaxdhPgrjyYZxkQmSaBng==
X-Received: by 2002:aa7:9f52:0:b029:1ee:db83:dac6 with SMTP id h18-20020aa79f520000b02901eedb83dac6mr3276872pfr.45.1614782732430;
        Wed, 03 Mar 2021 06:45:32 -0800 (PST)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id t6sm23716191pgp.57.2021.03.03.06.45.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Mar 2021 06:45:32 -0800 (PST)
Date:   Wed, 3 Mar 2021 22:45:27 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Andy Shevchenko <andriy.shevchenko@intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 1/2] pinctrl: qcom: handle tiles for ACPI boot
Message-ID: <20210303144526.GC17424@dragon>
References: <20210303132622.4115-1-shawn.guo@linaro.org>
 <20210303132622.4115-2-shawn.guo@linaro.org>
 <YD+YSS/s79gqwEpS@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YD+YSS/s79gqwEpS@smile.fi.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 03, 2021 at 04:08:09PM +0200, Andy Shevchenko wrote:
> On Wed, Mar 03, 2021 at 09:26:21PM +0800, Shawn Guo wrote:
> > It's not always the case that DT and ACPI describe hardware resource in
> > the same schema, even for a single platform.  For example, on SC8180X,
> > DT uses the tiles schema while ACPI describe memory resource as a single
> > region.  It patches msm_pinctrl_probe() function to map tiles regions
> > only for DT.  While for ACPI, it maps the single memory resource and
> > calculate tile bases with offsets passed from SoC data.
> 
> ...
> 
> > +#include <linux/acpi.h>
> 
> There are at least two possibilities to avoid this:

So could you explain why we should avoid including this header?

Shawn

>  - use is_of_node(dev_fwnode(dev)), or in case you need board files support,
>    !(fwnode && is_of_fwnode(fwnode))
>  - provide the tiles support directly from the driver thru internal data structures
> 
>  And to me the second approach seems better, because there is no guarantee that
>  tiles support is only defined by the fwnode type.
