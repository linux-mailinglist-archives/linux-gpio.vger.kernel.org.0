Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0566E1ABF54
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Apr 2020 13:34:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2506074AbgDPLG1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Apr 2020 07:06:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2505871AbgDPLGS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Apr 2020 07:06:18 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E83D1C061A0C
        for <linux-gpio@vger.kernel.org>; Thu, 16 Apr 2020 04:06:17 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id k28so5243431lfe.10
        for <linux-gpio@vger.kernel.org>; Thu, 16 Apr 2020 04:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=PQVuIKSPezF1i5nCh/JaET+VC8GB3RQdOhpUD+ddEWo=;
        b=uov2nDuIn/Wfs71R36fHzId2m3P8g9dLE0bbrT5rdMT6v1gNr99qpLTkqwfWLdheNj
         aJRfWypx92TWH/ddNAgwVJgctFXrwcS8Wj4/lF+ooJQtZM3UCfKSBqMvI/S26u0NY4+M
         KETVQvX+ghNwNDuK7WllZpjXjZYHXcVylRB9gpTEyb7Z5FGER8KMYnDKCQXh5BKvfhwm
         Ntqw4RZhvB5pgLZWFGWt40USck22CbjJTuBp7aHKtcRBv6VoKcWju7z+bvjaJwcWm69G
         mcXcTOI6cqaMu8SqDH3qo+jlfcC/OTzkwLtNsK2w/XrS5LpH0cv3UdPaY89RkQ+l4Au8
         Kfxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PQVuIKSPezF1i5nCh/JaET+VC8GB3RQdOhpUD+ddEWo=;
        b=MIaWgk7dw+E7EQMAs9BGu0QTLK41dpoTDkrRWrZk/KQ3HQ+kTQ6Tlzyod+HDDUdh03
         2CEh2Zwt5ZN1U087xn2PfKaHepGvGE3bnlm3XhxJT1Q7FWCKn2Ndlp+6Xh9G8x7jIw3/
         DZPLpWmvjYCTkBo1N+hom7VtcF4krKMp8A0HNgsFTH+hDtf314gpDTYqXNIHdm2X0RNR
         gLQgre8z+IJMOa+DOyrp3wu+P75XOq3/HmXWKCueJcSXpSUjIPSdkBmATPE5VmYrzn7c
         N55oJxK9mcSY0FXTvT9ICY3NK7p4ML05kTOyZ/Gw8fhKfeE8w2rt2HO0ypULuOc6YoKV
         JuHA==
X-Gm-Message-State: AGi0PuZ827yrcDJugxDZ2pKODtG4efgzK6TAEb8Y7PoJP+Ox2XiTuD0+
        ji7W5S0qfMvNGL5z0Urq75g=
X-Google-Smtp-Source: APiQypLgw9vGRJ2wQiVzAogFPGr8u1/vreLctR6UCuyGuF0g39JdN3TrvCIzgX975/wk1OQBy1Ydxg==
X-Received: by 2002:a19:43:: with SMTP id 64mr5574302lfa.67.1587035176422;
        Thu, 16 Apr 2020 04:06:16 -0700 (PDT)
Received: from mobilestation ([176.213.3.142])
        by smtp.gmail.com with ESMTPSA id w1sm11852373ljw.48.2020.04.16.04.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2020 04:06:15 -0700 (PDT)
Date:   Thu, 16 Apr 2020 14:06:13 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 14/14] gpio: dwapb: Amend indentation in some cases
Message-ID: <20200416110613.4yyrlcle4oiy46a7@mobilestation>
References: <20200415141534.31240-1-andriy.shevchenko@linux.intel.com>
 <20200415141534.31240-15-andriy.shevchenko@linux.intel.com>
 <20200415171516.cugbzhvjua6cygnq@mobilestation>
 <20200416105614.GZ185537@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200416105614.GZ185537@smile.fi.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 16, 2020 at 01:56:14PM +0300, Andy Shevchenko wrote:
> On Wed, Apr 15, 2020 at 08:15:16PM +0300, Serge Semin wrote:
> > On Wed, Apr 15, 2020 at 05:15:34PM +0300, Andy Shevchenko wrote:
> > > In some cases indentation makes code harder to read. Amend indentation
> > > in those cases despite of lines go a bit over 80 character limit.
> 
> > > +			dev_err(dev, "missing/invalid port index for port%d\n", i);
> > 
> > What about shortening the message text to fit the 80 chars per line rule?
> > I suppose the "missing" word could be omitted.
> 
> More likely port is not needed, but I think this kind of changes are material
> for another (logically separated) patch.
> 
> ...
> 
> > >  			/* Mask out interrupts */
> > > -			dwapb_write(gpio, GPIO_INTMASK,
> > > -				    0xffffffff & ~ctx->wake_en);
> > 
> > > +			dwapb_write(gpio, GPIO_INTMASK, 0xffffffff & ~ctx->wake_en);
> > 
> > Hm, do I need some rest and missing something or the &-operation with 1s here
> > does nothing seeing the operands data types have the same width?
> > 
> > (the change introduced by commit 6437c7ba69c3 ("gpio: dwapb: Add wakeup source support"))
> 
> No, you are right, it seems no-op to me, I have noticed it as well, but I think
> we may improve this by separate change (as you seems also prefer not to mix
> logically different changes in one patch).

Ah, Linus already pulled the series in. Next time then.)

Regards,
-Sergey

> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 
