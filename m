Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BBBF3DC3BC
	for <lists+linux-gpio@lfdr.de>; Sat, 31 Jul 2021 08:06:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236806AbhGaGGL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 31 Jul 2021 02:06:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229683AbhGaGGL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 31 Jul 2021 02:06:11 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A571BC06175F;
        Fri, 30 Jul 2021 23:06:04 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id e21so13612624pla.5;
        Fri, 30 Jul 2021 23:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=kkYR/Frx4R2DyWI2gfNu67QMmpFEnLowXEkWWryWivM=;
        b=AoJSquL7GgEWOobaTQEfJLGCXM0PcvCt2eErc/2yoWwggZHpEdLrTkclA0FJjBkBZ7
         6aXxc1xUv7hcgCoeFttNerIddA5xcGK8XdjMzOnr2gLa3K6HttHBqnsx+U0Y0/wnjTuT
         fgAjR5TutFhSARuT7oxJnixSnCau8DflhS7X3pBDI1qIQspkmeTk635rj2+x+kvRFgLy
         hYc0IeBLqaJJPXvkl7t88wVJLbsk3LOc5RF3cZVj2yu7LxnoEIWLQ3/KNtReS9tSfNjV
         A9PE9cgJf23KFQjoL6SKUjCZHQmqmIgKshVk9utoOMrj1OzNOAtSwVi/+RTqqTa/0pYF
         m9OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kkYR/Frx4R2DyWI2gfNu67QMmpFEnLowXEkWWryWivM=;
        b=hmzRTjkJFloTL14yGGoCVZZlinGUI9v8btc3wFN97aKu0yyODD5TE1BBNN0niufAtU
         hPfJjj8AIF/JawKIS7Iw1eFMme5K0pFdYnRECr8e7T5hw4pU2IMP24CljXSll0y/Oh4q
         B7F0aXowRBiRiw6H4abgbPeVzMKevU3fM1GhnTJD2ouGL9WD82fGbxgJ63kZGwwwsF4c
         ukaiRHpkxc8OAl3X+WxW8uGUh55YdEXSuvu5Nvm3VHVNys5/hqUdxMFgPmglhiuXmrpf
         e8gIkVyZmuzyvnbNdw9j1rX3evNw0Cnc+bWgB21cmOFeY8sCEHW8NOexXcG9KPe/Ty7d
         7E5g==
X-Gm-Message-State: AOAM533z4mSjDr3Hv/xD+6CDTOJVIWVOZUKoX6xv8hQ9JfF7Qj5bxsSa
        wl/emleN1YUtSOCpf78V9xA=
X-Google-Smtp-Source: ABdhPJw318ZWUUbeFdJlv0DZtWwRI4JcsO14Qj8eF/dtAOvDDJIe8xicf6GNtnQ3RQM2eKmKKvNnQQ==
X-Received: by 2002:a63:e14b:: with SMTP id h11mr4441417pgk.283.1627711564186;
        Fri, 30 Jul 2021 23:06:04 -0700 (PDT)
Received: from sol (106-69-176-40.dyn.iinet.net.au. [106.69.176.40])
        by smtp.gmail.com with ESMTPSA id m1sm4711142pfc.36.2021.07.30.23.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 23:06:03 -0700 (PDT)
Date:   Sat, 31 Jul 2021 14:05:56 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Dipen Patel <dipenp@nvidia.com>
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-gpio@vger.kernel.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, robh+dt@kernel.org,
        andriy.shevchenko@linux.intel.com
Subject: Re: [RFC 08/11] gpiolib: cdev: Add hardware timestamp clock type
Message-ID: <20210731060556.GA11043@sol>
References: <20210625235532.19575-1-dipenp@nvidia.com>
 <20210625235532.19575-9-dipenp@nvidia.com>
 <20210701142433.GC34285@sol>
 <ba32de51-0639-36e2-3575-1f7915542a19@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ba32de51-0639-36e2-3575-1f7915542a19@nvidia.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 29, 2021 at 08:07:15PM -0700, Dipen Patel wrote:
> 
> On 7/1/21 7:24 AM, Kent Gibson wrote:

<snip>
> >
> >>  			ret = gpiod_direction_output(desc, val);
> >>  			if (ret)
> >>  				return ret;
> >> @@ -1152,6 +1186,13 @@ static long linereq_set_config_unlocked(struct linereq *lr,
> >>  					polarity_change);
> >>  			if (ret)
> >>  				return ret;
> >> +
> >> +			/* Check if new config sets hardware assisted clock */
> >> +			if (flags & GPIO_V2_LINE_FLAG_EVENT_CLOCK_HARDWARE) {
> >> +				ret = gpiod_hw_timestamp_control(desc, true);
> >> +				if (ret)
> >> +					return ret;
> >> +			}
> >>  		}
> >>  
> > The error code here can come from the pinctrl timestamp_control(), so it
> > should be sanitised before being returned to userspace.
> 
> I do not understand what do you mean by sanitise. I just followed what
> 
> gpiod_direction_output did just above which also returns ret from gpio
> 
> driver code similar to timestamp_control API.
> 

In this context, sanitise means convert any kernel internal error codes
to their userspace equivalent before returning them to userspace.

Fair enough with the gpiod_direction_output() comparison.  I was thinking
of a patch Andy recently submitted[1] to sanitise gpiod_request(), which
can sometimes return EPROBE_DEFER.  But I guess we can wait until we find
a case of a driver returning an internal error code and add a sanitiser
then.

Cheers,
Kent.

[1] https://www.spinics.net/lists/linux-gpio/msg60998.html

