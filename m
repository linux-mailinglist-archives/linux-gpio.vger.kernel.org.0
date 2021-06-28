Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DB5C3B5D30
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Jun 2021 13:34:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232486AbhF1Lgp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 28 Jun 2021 07:36:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232353AbhF1Lgp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 28 Jun 2021 07:36:45 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 068EFC061574
        for <linux-gpio@vger.kernel.org>; Mon, 28 Jun 2021 04:34:19 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id s137so6215866pfc.4
        for <linux-gpio@vger.kernel.org>; Mon, 28 Jun 2021 04:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Uv73wSWQ3CJPaoevAe2VCr2WovR+xxmmqqYNLNVfSuQ=;
        b=g4jHRMYmestGxoS3bNHsPC2jHhA0HNhFr8ySatnBmzjM962e9CKfF309WdajqRSaX/
         BPi+DC2Zg0wpR/ahko7664iCfv5o7l22l3n9u9QwANzuPKedyNiWMk9FKEfaWthJN3mp
         kt73RC7+UhjrMtMsBb+rMB63eYznmRK3mq1vRghHLGtynazHC4dgf183Uc55cChAy2oE
         zHa/mrE8XjPjfZvT4X5xmB3Yzlkz3lcswnIKHAW84o2mA+97719JO10C3Clea0qgr8I/
         LJPvq7gK4m2ZYqBI0amN1/pm4Qj1ObY1lv7KDdGShUfPL0tJzvvauuGdaYMxA2tQG/Tm
         3+xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Uv73wSWQ3CJPaoevAe2VCr2WovR+xxmmqqYNLNVfSuQ=;
        b=rj44rCXgdL5R0x49OjqgBWkuX5RU0KGy6aEFPc8cq1AOx32jO/YP0DylwQXjZUKwKt
         +x4UssLe29F90oOfSx+8Z38xaoNFoI1k5jvIApKtYWk6NzWJ1ZkMM2ZAFUc0Lr/m9Jcz
         i8DGoE6tS3tPS5ZTOJ2insb2HAI79mSXC1xavTl5cGW+/1gzm7UtUeTmRzDNNBDqsTzU
         gE4HRNedNzOEPDiA90Wh47l/yYuo1gForgiwokPUYB/MoSErc1JLNUa2HBas0Ko9730/
         7PXfTIzk+tPbSBOAXZeLcG+oEKPESImtblVD5KJHqkNeqG1KuL5zsUtFboX+SDf/dfbO
         82+w==
X-Gm-Message-State: AOAM533DBRBV58fsDooMsUt6oAbB/WNGxZTSdSkR1wQH7N0TheNM0cHF
        GE16UmyV0ECsnA+UfClZ880=
X-Google-Smtp-Source: ABdhPJwSEvw1epl3vWl7CRNuYNIRtF/vBmnHN2J0fC9OyAVmeHm+4IqpfN6MdziiXDG+bQYsh1dhVg==
X-Received: by 2002:a05:6a00:17a4:b029:304:a2d1:25a6 with SMTP id s36-20020a056a0017a4b0290304a2d125a6mr24428863pfg.68.1624880058547;
        Mon, 28 Jun 2021 04:34:18 -0700 (PDT)
Received: from sol (106-69-174-4.dyn.iinet.net.au. [106.69.174.4])
        by smtp.gmail.com with ESMTPSA id w65sm1675688pfc.115.2021.06.28.04.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jun 2021 04:34:17 -0700 (PDT)
Date:   Mon, 28 Jun 2021 19:34:13 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Helmut Grohne <helmut.grohne@intenta.de>,
        linux-gpio@vger.kernel.org
Subject: Re: [libgpiod][PATCH 4/4] bindings: cxx: implement C++ bindings for
 libgpiod v2.0
Message-ID: <20210628113413.GA20057@sol>
References: <20210621191830.10628-1-brgl@bgdev.pl>
 <20210621191830.10628-5-brgl@bgdev.pl>
 <20210627084757.GA21720@sol>
 <YNmyvYDZwNeYRyTU@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YNmyvYDZwNeYRyTU@smile.fi.intel.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 28, 2021 at 02:30:05PM +0300, Andy Shevchenko wrote:
> On Sun, Jun 27, 2021 at 04:47:57PM +0800, Kent Gibson wrote:
> > On Mon, Jun 21, 2021 at 09:18:30PM +0200, Bartosz Golaszewski wrote:
> > > This is the bulk of work implementing C++ bindings for the new libgpiod
> > > API. The tests are not converted yet but the examples are fully
> > > functional. More details in the cover letter as this patch will be
> > > squashed with the one for the core C library anyway.
> > 
> > Firstly, I don't have any problems with patches 1-3.
> > 
> > Secondly, I'll be focussing on the API here, but I'm not up on current C++
> > best practice, so take my comments, or the absence of them, with a
> > suitable dose of salt.
> > 
> > A general comment - you use retrieve/read/get/return for essentially the
> > same thing in the accessor method documentation.
> > Perhaps you could settle on one?
> > Variety may be the spice of life, but sometimes boring is better.
> 
> It's a weak point of many documentation files that I saw :-)
> Nevertheless, it's good practice to define terms in the preface pages to be
> sure everybody is on the same page with meaning of them.
> 
> Kent, do I understand correctly that Go bindings use C library?
> 

No, the Go library is pure Go - it makes the ioctl calls itself.

Cheers,
Kent.
