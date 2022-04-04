Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B0474F1298
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Apr 2022 12:06:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355082AbiDDKIF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Apr 2022 06:08:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239305AbiDDKIE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Apr 2022 06:08:04 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A6D03C49F
        for <linux-gpio@vger.kernel.org>; Mon,  4 Apr 2022 03:06:09 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id 2so1085748pjw.2
        for <linux-gpio@vger.kernel.org>; Mon, 04 Apr 2022 03:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=D++Ab2sJHbsnKyZIy5EF/bhmlltBffd2jErZtm4dVc4=;
        b=GSj5ZZOy/wtDz6XNlvc5utPNykqQPZmKznzGXBfUIKPE6AuRHR2Eve7MG5MQhgRMLR
         n7CihJ2juuUdzMEMQ/6qBCO1PZHslwscBjbcYQXCHmkcjOoDxl9xkug20NCDhXKSkoh/
         fvaLM+nD4vQchPSmP/tNd73gNkIkvpMEW6uC5IlYx7xmGDVfuUMvTg+oBbG/ikOcQxQP
         HKtQDhFI/ka5b1x/WPWeKy0zhsnSiJAWnHGlH5zR67fMTUsCO6Ul9T33O3a9ik5qqmxA
         mNczrBg+ViOjpaavffBAra5RgWX8KD0yBw3/9/8NmLfWDKjRii+Bw1bw+a9seheKqjtn
         THig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=D++Ab2sJHbsnKyZIy5EF/bhmlltBffd2jErZtm4dVc4=;
        b=5I9oL/H7vCQAvaXp0fDu5wbWxk+2BFwkUMVtUaVKOB1Zi6I4D7rSDLg4g561FolY0l
         mjaclz779YK6Y8sFbg5vMvwDddedcalE8AqaQdOSNDbNeWJ7Uh3bwkzJMvy3rg/7rRyJ
         zqu/aRgoPPvdB5nP9hILB52ULr2NIp85M+2ntTT0BRjSaYhhQ+t0JlZkafLM5lDraT7/
         H5/shAZ50Bl2pTnyeWymnsbuEZsr5XJmuKSc+t/UTjoBV94U8UEZ+Zp3fvDoPvPC24gL
         KLfv79igXAIflnn3ASjMBu5FX6PpPSHNzbLI5gPvn7wc7aeJFgJWhNO//3t1PuYRgL+K
         eoIA==
X-Gm-Message-State: AOAM531/nJ71fORAEchZSl8bfKvC9Rb8veJnb0ueRZ3new/mNUNFcdBG
        ihs1WBgOAAKx3NmtCR0kZ+o=
X-Google-Smtp-Source: ABdhPJzSzjlw3jaoczwp403gLUnUvw7rxpAyb4N62YdHBTGjwaknyAiQUqYTHYAM8GBMcu/RFsjBZw==
X-Received: by 2002:a17:90a:c791:b0:1c7:26eb:88dd with SMTP id gn17-20020a17090ac79100b001c726eb88ddmr25346098pjb.218.1649066768731;
        Mon, 04 Apr 2022 03:06:08 -0700 (PDT)
Received: from sol ([118.209.204.33])
        by smtp.gmail.com with ESMTPSA id f6-20020a056a00238600b004fae79a3cbfsm12296510pfc.100.2022.04.04.03.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Apr 2022 03:06:08 -0700 (PDT)
Date:   Mon, 4 Apr 2022 18:06:02 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: gpiolib: why does gpio_set_bias() suppress ENOTSUPP?
Message-ID: <20220404100602.GC24083@sol>
References: <20220331025203.GA53907@sol>
 <YkWyU8seDqyDL532@smile.fi.intel.com>
 <20220331141524.GA93836@sol>
 <49e5857d-1438-cd5d-b4f2-b374f01e2596@redhat.com>
 <20220402014510.GA7939@sol>
 <90f7d9eb-935b-3803-1531-65bd20418bc3@redhat.com>
 <CAHp75VcuM2qZjZCkcZ01u=KSqyudMJTB8meORpZ0hxA4_PFg8A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VcuM2qZjZCkcZ01u=KSqyudMJTB8meORpZ0hxA4_PFg8A@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Apr 04, 2022 at 12:23:18PM +0300, Andy Shevchenko wrote:
> On Sun, Apr 3, 2022 at 6:34 PM Hans de Goede <hdegoede@redhat.com> wrote:
> > On 4/2/22 03:45, Kent Gibson wrote:
> > > On Fri, Apr 01, 2022 at 12:36:57PM +0200, Hans de Goede wrote:
> 
> ...
> 
> > > Probably best to extend the uAPI to add a strict mode and leave
> > > existing usage unchanged.
> >
> > Agreed, adding a strict mode to the uAPI seems best.
> >
> > And if you do it this way, you should probably also make
> > the kernel log (using a ratelimited log function) why (e.g.
> > bias setting not supported)  the call is failing since errno is
> > not going to tell the user enough here I think.
> 
> ...which reminds me this one: https://lwn.net/Articles/657341/
> 

In this case I'd be more inclined to return a sanitised config along
with the error code.  So the user gets "the config you requested isn't
doable, but this one is". They could even repeat the request with the
sanitised config, though I'm not sure if that would provide any benefit
compared to just not requesting strict in the first place.

Cheers,
Kent.

> -- 
> With Best Regards,
> Andy Shevchenko
