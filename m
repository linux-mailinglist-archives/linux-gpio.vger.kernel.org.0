Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C15B8231C69
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Jul 2020 12:02:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726746AbgG2KCE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Jul 2020 06:02:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726208AbgG2KCD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Jul 2020 06:02:03 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84BD0C061794;
        Wed, 29 Jul 2020 03:02:03 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id w2so13976471pgg.10;
        Wed, 29 Jul 2020 03:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=TcAbcu4b2MCOdxF06fdyH7UgcMhYEDFeJHrp4ij7/R4=;
        b=UG2Q/DcxeP3B/3eMJa8fn4+P0L10ezGDWil0QNLIK3XVYn61soZPteCAuoGwTv2Ie5
         JgzH1+L8pjQ0K+cZqIUKYcgV/g4gqhAuv0MMeuQS+puFp+IGl7LZ6WB2F6D7FUfp1CPo
         LwFU1o460xSozJaSeTsOEI/htJ5EX/dxjgGP3etijEOYx0QidZchFRdovmRY4gF5Hkyd
         wntOyVpBJnuhRnyXRusFBKjC08VMfkhNWJyBUqx4HpYMfCu585RUc8z8yxLabE2EYd2L
         GXIUGNQ/Kn54GpQDMSszT13roSXz8Z2mspv/SgFSs7ytXHyIw3uo8dcokyYLvduRFI9Y
         5Xaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TcAbcu4b2MCOdxF06fdyH7UgcMhYEDFeJHrp4ij7/R4=;
        b=VbzZ+9ACPHcQrNyKey7vDXSN64qqbi0B9Rftn2fa/ii29jXZGOy+hfyehDjx4OZ+cZ
         O1oqWaDYEXh3Prp1RKMKqlUDSJEDc14A++4X7rjEWuSLpwqBvsk0964w/bniIfiK1ZQt
         CIpPZHaQDeGq5fRH4iwUIahsmE9BAUOSz3vGxtAa4+IrdkmXZP14X7RqE/VUQc9uA6uG
         h+r4nxAJKJbxyUOIwO70w5p21Yv93rPUks5jwsp9Cgb6HM0b5kOk3/q0azhcGPZ/rc9k
         FlKCMMpwNjunFM8JGxWi9M6XyMuSy46p5fiUoaPdx+nUhnkEK/6FOlmWZc2ZHtGnTjQv
         BjDA==
X-Gm-Message-State: AOAM530VwZouo9jF2kYVNwA0QvpEw2FVgmZwXzN9KWzzomEb+j3en4PJ
        l8xnKZVZr5J0bSMmDlEYQwc=
X-Google-Smtp-Source: ABdhPJxzag6GQkCa/vOhIcD+UJxGkue/MQu2bEm9A+8suxjrrR1GApoJcFOvJj+6J3XyhJFpbujQCQ==
X-Received: by 2002:a63:1007:: with SMTP id f7mr22824756pgl.147.1596016923046;
        Wed, 29 Jul 2020 03:02:03 -0700 (PDT)
Received: from sol (106-69-185-93.dyn.iinet.net.au. [106.69.185.93])
        by smtp.gmail.com with ESMTPSA id d128sm1742650pfa.24.2020.07.29.03.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 03:02:01 -0700 (PDT)
Date:   Wed, 29 Jul 2020 18:01:57 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 05/18] gpiolib: cdev: support GPIO_GET_LINE_IOCTL and
 GPIOLINE_GET_VALUES_IOCTL
Message-ID: <20200729100157.GA761242@sol>
References: <20200725041955.9985-1-warthog618@gmail.com>
 <20200725041955.9985-6-warthog618@gmail.com>
 <CAHp75VcKtATPDKGAViWqjOJDqukDrgZ13aTU6rTJ1jEeB3vmVw@mail.gmail.com>
 <20200726011244.GA6587@sol>
 <20200729022814.GA1750878@sol>
 <CAHp75VdUZ=N7Gd8NgYY4ifY68Rc5DyEOqrfjdTJvwiZ3ayNCMg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VdUZ=N7Gd8NgYY4ifY68Rc5DyEOqrfjdTJvwiZ3ayNCMg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 29, 2020 at 11:05:48AM +0300, Andy Shevchenko wrote:
> On Wed, Jul 29, 2020 at 5:28 AM Kent Gibson <warthog618@gmail.com> wrote:
> > On Sun, Jul 26, 2020 at 09:12:44AM +0800, Kent Gibson wrote:
> 
> ...
> 
> > I'll rework that for v3.
> 
> Please give some more time to review v2. Especially the v2 API approach.
> 

For sure.  I'll be spending some time setting up and testing on a BE 32
target so I wont be ready to submit a v3 for a few days anyway.

Cheers,
Kent.
