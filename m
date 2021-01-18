Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE5032F9682
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Jan 2021 01:08:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728543AbhARAIZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 17 Jan 2021 19:08:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726785AbhARAIY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 17 Jan 2021 19:08:24 -0500
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15C28C061573
        for <linux-gpio@vger.kernel.org>; Sun, 17 Jan 2021 16:07:44 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id b8so7667684plh.12
        for <linux-gpio@vger.kernel.org>; Sun, 17 Jan 2021 16:07:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+s48l+utKXWQZEo/TGVb6I7KsEo167Yvd6SvpU8kR70=;
        b=VBSmQm530yzieOSWtgBBvTGnVJmzzvRWgE90BqI1ctC/UATwL0IhZNQ9tAWMoFEugj
         Tk57XESv98CGiXfQ092HOuMqa2RVF1LkTISvv+c7KOzYJ8I6BiyHGz/jLZe5iA/W1wJv
         F6sUOd+3CNWbyS9ZmrdA4rHTx9U9Ry4cZdd7KOLs4X4QJ3d9lbrVUroEyy6nM408/zdW
         8PwenFMFS7mOo/m+M5Iea/4XjzjMvdBSaaXJhJnFK45nIlthi9CjCvwKJBYo8BWB8Xxh
         Ed2hAJfAwz5A8bi7zhIDzYjVN+3Lz26VVL29b0eJOyRI60N4hNQkMP3/vVJ07z8RFsgI
         Hnfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+s48l+utKXWQZEo/TGVb6I7KsEo167Yvd6SvpU8kR70=;
        b=pjx/AbFbYb+jopsz/4fwKPqJNVPEYutAMHT3Pd4MnwSLnJlUT3A4oQ0vp+ATwQFtLr
         XWFbgass2xNbJufthAuPIOdFA6pDSzQMeU375xwMcHDqfM3c5hY9DkSyVMbrIdRVAY2q
         FETzlZk8Rwri6xh+kvmSn+Wfe8UYtn31U+WXqMcuZ4fkk/8Re0ePofJeGrSr+FCXYIoD
         XlzFJSei1cbRSYR9vebSEOFSGER/BJDBBgvxNa/RoSVZC4R+wh4kRi75f4aLiUswQo5q
         GlqYxsSU2KxClr8teFyT+/Ob1GwKQgiFx2vLPyYAf3a5OIXl7gIIPoIR9VwMfypyTucq
         iOGQ==
X-Gm-Message-State: AOAM53345Z+hqkhC7T+FGbiyd/RuKAlYiLsmFtkQkhk11Aqcbrc0qRG8
        dQ6iTftjnAkZrusQw85mjuw=
X-Google-Smtp-Source: ABdhPJw0q+ZghjdEYcFYMYSYD8hNxLZ7/i9E1SMqDX3mwl/rtzZvR+Er65e9SgklRLOQpEK1o+fjGw==
X-Received: by 2002:a17:90a:df84:: with SMTP id p4mr22972616pjv.81.1610928463607;
        Sun, 17 Jan 2021 16:07:43 -0800 (PST)
Received: from sol (106-69-181-154.dyn.iinet.net.au. [106.69.181.154])
        by smtp.gmail.com with ESMTPSA id gg22sm1701521pjb.24.2021.01.17.16.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 16:07:43 -0800 (PST)
Date:   Mon, 18 Jan 2021 08:07:38 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [libgpiod][PATCH v2 3/7] treewide: rename BIAS_AS_IS to
 BIAS_UNKNOWN
Message-ID: <20210118000738.GB6841@sol>
References: <20210115103018.27704-1-brgl@bgdev.pl>
 <20210115103018.27704-4-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210115103018.27704-4-brgl@bgdev.pl>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jan 15, 2021 at 11:30:14AM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> When inspecting the current bias setting of a GPIO line, the AS_IS name
> of one of the possible values really means that the kernel uAPI can't
> determine the bias setting because it didn't set it itself. In this case
> it's better to change the name to BIAS_UNKNOWN to reflect that.
> 

Your checkin comment incorporates some of my review comments, which were
actually a bit sloppy.  While I didn't bother to correct myself for that
email, I'd rather the checkin comment be more precise.

Specifically, I was conflating gpiolib and the cdev uAPI.  If the bias
is set via gpiolib then the uAPI will report it correctly.  If it is set
otherwise then the setting is unknown to gpiolib and therefore the uAPI.

And I'm not sure if the DT example that I used in that email was a good
one. But say the hardware initialises with pull-up enabled.  If it hasn't
also been set via gpiolib then it will be reported as unknown.

Cheers,
Kent.
