Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38B6028EAB6
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Oct 2020 04:05:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727753AbgJOCEi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Oct 2020 22:04:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726903AbgJOCEh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Oct 2020 22:04:37 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44E4FC08EC8D;
        Wed, 14 Oct 2020 16:35:20 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id 10so783230pfp.5;
        Wed, 14 Oct 2020 16:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=i3YcbkuQqwrFru4HZ/47dhLnuoEAfZ7hiCepnSo+pQY=;
        b=Y0PBqtYVwUIp3gcosJRVmRZSNaVntJSbbl72U538cBGR80rq9ATU/j4JMo4Y6tGnFO
         iZipdtDkBjt2jxfSx26FY9wb2j324J2mGrcTQnxjX4F4Q8akO7ZAHmwc2Ydx7I53czUp
         X2LA3zjpnOHESQl/dqDQVjZwcDFnuaeRVCOSjslAG0p3vFsSJbsw3bcY169e4sieK+Mu
         X4Q10i9sCJ85/wFP5vZPK3/QYv8CYHFcRnnsqrQ8/pjTMOjGHbFHE+TuZxpBcNmK7KX6
         QG0HOnJidw6dmP/w0sLF3/dRA4M/DVffSo8qOJLn8qnt1JJqJ7he03c1a3twJx+Q6i9G
         CIHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=i3YcbkuQqwrFru4HZ/47dhLnuoEAfZ7hiCepnSo+pQY=;
        b=nOdthHdu20csxOjONrUZVCnPLeAvk0pug5H8/6dvAfb8YYb3k1SJFhoGD64o2vY4rt
         ApNYMzkxBYmlBV8c5UE/UfIim/HjMHNTAanRZDZrtuz1jo6lC4pSu0eFhW6Aj9SE+bnR
         ZLAX8PXr8ks9CT8TGOziVuo7aPbCyOqcPM9Ofsv6VrhhRc9ugu8yUdlV5AVhQWOvRgN0
         6t5CX7i82W/ItQ3uTwv3/VC/mAlej4nVRFyX1F21K3PmgBMfTus+tOBuudL4C2VLqzfC
         KkYgK9OO6vSbERLOf/y7XebkbSZI4pJIQaY2jP3WJ1BWBWqw+0GbtxQbdkfoa2h7wA3X
         rK2w==
X-Gm-Message-State: AOAM530JFwm1flZP/vX6K23wAiuzUcN9iiTSlp5BwQ8fdDZOR4lm6G1r
        Aj01zGu65kzsHSIcQiIl/mH+XDuXkMzkwA==
X-Google-Smtp-Source: ABdhPJys5uyFt/w6vRFucHDtrmWSot3qL78Cf3XlTcWcYJc/LOJM37ICatmb7KTs5Ctc8GtTdMcRUA==
X-Received: by 2002:a63:c70c:: with SMTP id n12mr1058500pgg.102.1602718519788;
        Wed, 14 Oct 2020 16:35:19 -0700 (PDT)
Received: from sol (106-69-182-59.dyn.iinet.net.au. [106.69.182.59])
        by smtp.gmail.com with ESMTPSA id 14sm705001pfy.192.2020.10.14.16.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2020 16:35:18 -0700 (PDT)
Date:   Thu, 15 Oct 2020 07:35:14 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH 0/5] gpio: uapi: documentation improvements
Message-ID: <20201014233514.GA34185@sol>
References: <20201005070329.21055-1-warthog618@gmail.com>
 <CAMpxmJUbxuAHmcf_1vP27qb1gSXTfE1OBb8X3MSoESpa=pycgQ@mail.gmail.com>
 <CACRpkdZ+9-bFg1zYXE=ppGUa0OY0f9-+QRefd1q1OMsLEdh1dg@mail.gmail.com>
 <20201013132952.GA219958@sol>
 <CAHp75Vfy9bkny-1gyw7fKf3S=RN-DdZYK40eMC27tE9ApKF6jw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75Vfy9bkny-1gyw7fKf3S=RN-DdZYK40eMC27tE9ApKF6jw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 14, 2020 at 08:14:20PM +0300, Andy Shevchenko wrote:
> On Tue, Oct 13, 2020 at 7:34 PM Kent Gibson <warthog618@gmail.com> wrote:
> > On Tue, Oct 13, 2020 at 03:21:47PM +0200, Linus Walleij wrote:
> > > On Thu, Oct 8, 2020 at 5:46 PM Bartosz Golaszewski
> > > <bgolaszewski@baylibre.com> wrote:
> 
> ...
> 
> > > I am waiting for Kent to respin them addressing Andy's comments
> > > on patch 5/5 then they can go in as fixes I think.
> > >
> >
> > I had replied to Andy's comments - I'm prefer with my version than his
> > suggestion:
> >
> > "I'm not keen on that alternative as what it suggests is actually a
> > pointer comparison, and even if the user realizes that they may instead
> > use "strlen(label) == 0", when they shouldn't be assuming that a null
> > terminator is present in the array.  I avoided mentioning "string" and
> > kept it in terms of the char array for the same reason."
> 
> My point is to make documentation less cryptic (= less programming
> language stylish).
> If you can rephrase it that way - nice! Otherwise, I leave this to Linus.
> 

I agree with your point - including code snippets should be a last
resort. But sometimes that is the most effective way to do it.

Cheers,
Kent.

