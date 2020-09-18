Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DE6226FCC7
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Sep 2020 14:44:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726129AbgIRMoP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Sep 2020 08:44:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726121AbgIRMoP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Sep 2020 08:44:15 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F188C06174A;
        Fri, 18 Sep 2020 05:44:15 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id c3so2932536plz.5;
        Fri, 18 Sep 2020 05:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=CV8lbT4hNvISevl0YDPpkGjO0PydmbsCz1V4dqdiUGA=;
        b=W/TfL5RwGfoOnqu19aAF8kIG1aWOAWIXfPnbkRNZlJTyvL102BxgWU9A3ANFOaA1Kf
         sXv5CvDMZCw1Wzl+O1MpaV0ZBMRSWcM2dqyELVVEQsjn1TBrJdReyEHriqEmOpft1RIc
         74ICzqa7bi0g3KYn7r1l+k4hYj0VuFRtxyI7T4iM6s/lqdkBLf/L8+/6TTagsBH5tIG5
         3FO2wUDJqPE9UO8ZtmZz479AtObEhIhDDGI5oM51yYQXKLQl5GAWwT0OelbfVy+EJOfv
         wee3bNuXJvSTvhYyibeGNi2TfCcUmPIVmjJWYnzPADRUPHxDKc18qr4T2ZrfZCbCdCCO
         niIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CV8lbT4hNvISevl0YDPpkGjO0PydmbsCz1V4dqdiUGA=;
        b=TSXM+vNylGq/pTAktfknxoy3mnWForU02SURsqx1ErBYOhV0Lf30oWnlQx5Nhh+dud
         4/lEJ5HNZy6sdWVhaKIxQCfxT6KidUCN3FzkhqRT6RvVb8bQo1DosjFo28uH6Yzolzcl
         gPgYhr/5Zm4Y18YqufHFQyp5b1+Dc8OExWehI5AjzZb7G+xLaKqBk5z4ddLw5Qazcm2R
         CZ3P5UGAX6UMR4HbcKRhZ/0fcXd0wERT4jGNjAUtIeGA+k/n5LomxZs/yfLPX0TRKjw0
         7/pjiPKlPHEsOOFv9MfWHEwtKD6sRV3NYvuMV+AKHjpcTACK6hN2XKkUXA0+dvB7DByN
         x6sg==
X-Gm-Message-State: AOAM5315O9bf8sZGajevxwqfzaUYGSFEBY3J2fr4Y77WnmrF299ArWGc
        XwSk0nDshHXCxLyvUmfyMwM=
X-Google-Smtp-Source: ABdhPJwc01PjkF3QQADTtUnMrlPTRMGKfbMkhAYq8TdSNfZg3114EXYTDNvY+0aaGDfTiEL3KtLTYw==
X-Received: by 2002:a17:90b:2345:: with SMTP id ms5mr12442494pjb.202.1600433054677;
        Fri, 18 Sep 2020 05:44:14 -0700 (PDT)
Received: from sol (106-69-189-59.dyn.iinet.net.au. [106.69.189.59])
        by smtp.gmail.com with ESMTPSA id w6sm2945630pjj.33.2020.09.18.05.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2020 05:44:13 -0700 (PDT)
Date:   Fri, 18 Sep 2020 20:44:08 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v8 09/20] gpiolib: cdev: support edge detection for uAPI
 v2
Message-ID: <20200918124408.GB24657@sol>
References: <20200909102640.1657622-1-warthog618@gmail.com>
 <20200909102640.1657622-10-warthog618@gmail.com>
 <CAHp75VcyuPYqXTk7-yBd1dR3BitXQnz1YVkD+PuJRWVOu+1ueQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VcyuPYqXTk7-yBd1dR3BitXQnz1YVkD+PuJRWVOu+1ueQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 15, 2020 at 01:39:41PM +0300, Andy Shevchenko wrote:
> On Wed, Sep 9, 2020 at 1:33 PM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > Add support for edge detection to lines requested using
> > GPIO_V2_GET_LINE_IOCTL.
> >
> > The edge_detector implementation is based on the v1 lineevent
> > implementation.
> 
> 

Hi Andy,

Thanks for all the review comments.  I'm hoping to address them and get
a v9 out in the next few days.  Do you have any comments for the
remaining patches - particularly 10-12 that complete the kernel
implementation?

Thanks,
Kent.
