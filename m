Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C56D3986BD
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jun 2021 12:43:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231909AbhFBKo4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Jun 2021 06:44:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231646AbhFBKo4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Jun 2021 06:44:56 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC407C061574
        for <linux-gpio@vger.kernel.org>; Wed,  2 Jun 2021 03:43:11 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id g18so1868423pfr.2
        for <linux-gpio@vger.kernel.org>; Wed, 02 Jun 2021 03:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=WNy36R/oTjrtrMVEv7lR50FBdSjvXpQOmcbzPCW3S64=;
        b=u/elTlJ90NJwNAJUIWHjoVI2tZ8xx6ffnTLHTOMrcaE8EC+3+nQQz6Z1eeOmmPZBU0
         h/pA7GsbuOyyC/jA4nGMSxLeKJYYAzfZOS3gYUIf+h3BqSOTCwS82C2/1uTHVa3S4Mvl
         u/kRgiBNx/fqrPQJw9ez7xOsrSGMByWpvQHpgVDlyWDQqDnu546bI30DFJozoJ6KQvL9
         DYs3pIp8KeLFyf1wkCREqh+E33mJ1IxYPnf6nUocR5LohLVAv62k6sP9H7i0nUBDlLSw
         MlRDtB7UUZ5EDjUx18LtK4msZdOD4MwTTzX6PfM2cG679WKOI2bEezf5ZqjXP6s7UrjC
         OC6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WNy36R/oTjrtrMVEv7lR50FBdSjvXpQOmcbzPCW3S64=;
        b=hSy7JKaRys0TioSWb1XjmYvtJjjwTsWFpAljjVxQM0AWhGbf4QwZOxtMJXOBnoF1l0
         gT6F58TY4HHBwbgEdX73yRvkr1pU046YLJ4E6PMHUuqF+YW7HtQL0vMMY9covfZCGgNW
         urMpcXgxuG3ilt9EFtf8HKdlxlJSHAIWCKMr2mZjb2kxj0Gia1YTdPA49kRNJn6Xwswo
         LIjruJBPD5Z6IRAVGEzBZ3xi8VkQb+xrQAdAgul7WIaPD2gtoEVrgvPf7KETB6PL4Cdb
         SctkvGwBetOgoyRx7V4Dyulo9UnEvAN5dNXm4pUfjw0BCdVaEUMPelF5KknRfTIqeLdL
         BUmw==
X-Gm-Message-State: AOAM531uiMne/cwg0NIcXcEbQwv0ltFl63xOp93M4FECzm8sfZ9LZTE8
        9Nv7JK9X4qrm4sRZmrz3p3U=
X-Google-Smtp-Source: ABdhPJwi3XsYuFMbBac73gnPZk9wvdDKPd3W9fAJttFe9xV2BoH2w/BleIVQUqpqAi+yI3bQLHgTqw==
X-Received: by 2002:aa7:9af6:0:b029:2e9:dfed:6a59 with SMTP id y22-20020aa79af60000b02902e9dfed6a59mr12507664pfp.37.1622630591239;
        Wed, 02 Jun 2021 03:43:11 -0700 (PDT)
Received: from sol (106-69-174-31.dyn.iinet.net.au. [106.69.174.31])
        by smtp.gmail.com with ESMTPSA id ig1sm494430pjb.27.2021.06.02.03.43.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 03:43:10 -0700 (PDT)
Date:   Wed, 2 Jun 2021 18:43:05 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod][RFC v2] core: implement v2.0 API
Message-ID: <20210602104305.GA202614@sol>
References: <20210518191855.12647-1-brgl@bgdev.pl>
 <20210527112705.GA20965@sol>
 <CAMRc=Mff+=PNNqZUGO7Mq=OdmywYgS8+QuTqVYr4eOmA6Et_5g@mail.gmail.com>
 <20210528232320.GA5165@sol>
 <CAMRc=MfP5jEDqONYA0b7Dmm1hi38C8V1XSaX6xm03Cv4mpCJMQ@mail.gmail.com>
 <20210530004544.GA4498@sol>
 <CAMRc=McYaPqFrYiQqYnzVq9YAK8sXD_dW=UYwdiWgFOBTJt2iA@mail.gmail.com>
 <20210602031257.GA6359@sol>
 <CAMRc=MdedHN8AFzuXCz7pZJX2D1h1AncbR+KH4c1-=+nLARpTA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MdedHN8AFzuXCz7pZJX2D1h1AncbR+KH4c1-=+nLARpTA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 02, 2021 at 10:36:52AM +0200, Bartosz Golaszewski wrote:
> On Wed, Jun 2, 2021 at 5:13 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> 
> [snip]
> 
> > >
> > > Ok got it.
> > >
> > > I think we're getting close to an agreement. :)
> > >
> >
> > Well that makes one of us ;).
> >
> 
> Oh we don't? I thought there are only minor disagreements on naming
> convention and error handling but for most part we're aligned on the
> general shape of the API?
> 

Indeed we are.  My apologies for the failed humour.

Cheers,
Kent.
