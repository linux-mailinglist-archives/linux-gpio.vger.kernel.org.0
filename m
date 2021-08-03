Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9ADDB3DF806
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Aug 2021 00:38:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229931AbhHCWix (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Aug 2021 18:38:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233459AbhHCWi0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Aug 2021 18:38:26 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAE3EC061757;
        Tue,  3 Aug 2021 15:38:13 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id d1so864341pll.1;
        Tue, 03 Aug 2021 15:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=mtMk8/id55tqF/zH96Hx9KDINyNpzaA5iOGXRjHT2Ag=;
        b=jleiWgAB+ErOvppHrQTI6/6LNUqK5nTuAAsk807AE73YrDfBinh5rbszK868ED/peS
         GLy2HCBng6nFc7zfdRHugPswGeAdXhun3S6JJqmf8qI1QGz4CvMw4PEcKg1mn8vaj5kQ
         +p7ALCHjNLtOB9bbpVLBolZ1qao1nuiGmPFQFk6JOYFM9HXLw+Uu8/MsGSsyH7PWaset
         b3n5c/rqQEc2uvhUHqAZXUqx0kIfOiWqJjm4rYNuybq8eYOjkxdX8THxlssEuf7Azu/u
         M8n2wSq3LFvMRVWltVD34WmwsI/nWrD5UAFhP2UdnuUBlpM1ruMnkAQNssWnWsm0KcMl
         FORA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mtMk8/id55tqF/zH96Hx9KDINyNpzaA5iOGXRjHT2Ag=;
        b=flySSOElmr0oCgyNJAuYrYgpFRc81+8rgTWsKlbGOeS7MwIi6as2z0TLejCdXt5saI
         nvxcFoLXda5V77OaAfKxbn8KzQree8jwx1y/nE5Iv0qCtbipzPGGXYaE8v7esas5m3iS
         gPw808noc6+GRqqE63h+dEuBHXx1ExsBfUJ5Vuo7YZZuIlEoOnLzu/GdSEeLqZ+DW4RI
         v4992rwnTKPX90561p6tiXAcmVVtgZyFiDLCjODlk3Bz4CHWIbrl31b/H/WbtSkDyo+M
         aK7noYoZJosVKvQjCkKtwGJIktJrAarVD+WIWJJH+nuWHKnGcfDRe6S8dO6/oHSpDdJQ
         LuEA==
X-Gm-Message-State: AOAM533PmZ3OkaJGcCTU9aM6kYIajJiCEepMa22jKtrXmZExZKk/TCQH
        z9ushqLg+4b97CyqyE5nrec=
X-Google-Smtp-Source: ABdhPJz/24XejeMFwYlrbJbo/3K6SkKR/MpUdvnaGZ5Cz9m67paQR1r/TT1DZIYvou03g8MiNpktjg==
X-Received: by 2002:a17:90a:3489:: with SMTP id p9mr6676048pjb.197.1628030293220;
        Tue, 03 Aug 2021 15:38:13 -0700 (PDT)
Received: from sol (106-69-177-173.dyn.iinet.net.au. [106.69.177.173])
        by smtp.gmail.com with ESMTPSA id mr18sm207607pjb.39.2021.08.03.15.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Aug 2021 15:38:12 -0700 (PDT)
Date:   Wed, 4 Aug 2021 06:38:05 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Dipen Patel <dipenp@nvidia.com>
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-gpio@vger.kernel.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, robh+dt@kernel.org,
        andriy.shevchenko@linux.intel.com
Subject: Re: [RFC 08/11] gpiolib: cdev: Add hardware timestamp clock type
Message-ID: <20210803223805.GA5020@sol>
References: <20210625235532.19575-1-dipenp@nvidia.com>
 <20210625235532.19575-9-dipenp@nvidia.com>
 <20210701142433.GC34285@sol>
 <ba32de51-0639-36e2-3575-1f7915542a19@nvidia.com>
 <20210731060556.GA11043@sol>
 <1102e1b2-9d53-fc93-b7c5-bfeb9eb2e18d@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1102e1b2-9d53-fc93-b7c5-bfeb9eb2e18d@nvidia.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 03, 2021 at 03:41:56PM -0700, Dipen Patel wrote:
> 
> On 7/30/21 11:05 PM, Kent Gibson wrote:
> > On Thu, Jul 29, 2021 at 08:07:15PM -0700, Dipen Patel wrote:
> >> On 7/1/21 7:24 AM, Kent Gibson wrote:
> > <snip>
> >>>>  			ret = gpiod_direction_output(desc, val);
> >>>>  			if (ret)
> >>>>  				return ret;
> >>>> @@ -1152,6 +1186,13 @@ static long linereq_set_config_unlocked(struct linereq *lr,
> >>>>  					polarity_change);
> >>>>  			if (ret)
> >>>>  				return ret;
> >>>> +
> >>>> +			/* Check if new config sets hardware assisted clock */
> >>>> +			if (flags & GPIO_V2_LINE_FLAG_EVENT_CLOCK_HARDWARE) {
> >>>> +				ret = gpiod_hw_timestamp_control(desc, true);
> >>>> +				if (ret)
> >>>> +					return ret;
> >>>> +			}
> >>>>  		}
> >>>>  
> >>> The error code here can come from the pinctrl timestamp_control(), so it
> >>> should be sanitised before being returned to userspace.
> >> I do not understand what do you mean by sanitise. I just followed what
> >>
> >> gpiod_direction_output did just above which also returns ret from gpio
> >>
> >> driver code similar to timestamp_control API.
> >>
> > In this context, sanitise means convert any kernel internal error codes
> > to their userspace equivalent before returning them to userspace.
> >
> > Fair enough with the gpiod_direction_output() comparison.  I was thinking
> > of a patch Andy recently submitted[1] to sanitise gpiod_request(), which
> > can sometimes return EPROBE_DEFER.  But I guess we can wait until we find
> > a case of a driver returning an internal error code and add a sanitiser
> > then.
> Make sense, I will add sanity check
> >

But I said don't bother yet.  And you need to know what errors to sanitise
before you sanitise them - unless you want to run through all the
possibilities that can be returned to userspace.

Cheers,
Kent.

