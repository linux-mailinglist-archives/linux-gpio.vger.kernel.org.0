Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AEB22A789F
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Nov 2020 09:13:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727114AbgKEINW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Nov 2020 03:13:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725287AbgKEINV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Nov 2020 03:13:21 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18C95C0613D3
        for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2020 00:13:21 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id n18so634624wrs.5
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2020 00:13:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=KIVDH5XDaH9ggqUGZIcHQKJ7aQU16gyfDGlBZkQnizw=;
        b=VBWz/toLd3hCJcC6mxxUIHV3prc/FNPmLS+XTZI7Sy/FNrUqPlnMfQFbIIHakTj9HP
         Yn9DI/ud3jhVmgCW7Glt8NXO349Ggcq1PXXKAFyezewZZ5gVdCUttZUW/tzpR8SkEFDM
         pPBLuFGEYKCOGnByxMpP+EYi7+HPQT5dZjlNRLUrj3YvXlElpch/DtOAMszyOthFYn6v
         vZFU+Kx8XCc9Pzy6ZnhcL6B5Reqmv9KiUwuAYzriyRJqt3iKoBzONgq5il4oToEuqSIS
         IfyC8EAiwDd8ejiKAVgQrpN3m+5lrr6tSrnAxzFWpgQVFVMvj55y9HK7aLFNe5WhVTMC
         A6bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=KIVDH5XDaH9ggqUGZIcHQKJ7aQU16gyfDGlBZkQnizw=;
        b=a6aV5HY5WJnW5J7TdgWtMmPruUIr9CicV5/gqoyd8NafwQgP0J+bTbKRANhhDBH9zQ
         P1FT53qagOUZAyX1Rq7xfIRSCdtVopi+NrDlyALyZz7R0JT/NfksT5QJoBQkcPvl8Z36
         OjooOhUZCDP+EtvRwbU+qlfUbaqbZM4pQIsotf0NuyIDILUkA1yeWnIwZoyatzU5A+en
         Cii5POwzTP9ig/7M6KXFKgX9bSLhr9mKyEADCN8fAqg1oJR0yJLRfOCg5b8z9e/OMxl/
         hk6cr6LTI/k1sWS8elVcg4ztqrD1u2bbxt7HaHgMH0wZ8NJ0rB5eQBqxdbCDCGm5vLQY
         dAjw==
X-Gm-Message-State: AOAM531OIsZ34bAuwV7Ve1A18eyD9fIV61wEPSjuYFsfKr2PDHniLWcR
        ID2LrqINEGdcSZEmkYEPDeuEEg==
X-Google-Smtp-Source: ABdhPJxmI88f9sWXGzgdGVLDtkew8wv8clnE2hbBjcS/u9b7MYcpXX6E1oLQBy6Cx3+pbh7wUCgXUA==
X-Received: by 2002:adf:db8e:: with SMTP id u14mr1313307wri.233.1604563999770;
        Thu, 05 Nov 2020 00:13:19 -0800 (PST)
Received: from dell ([91.110.221.242])
        by smtp.gmail.com with ESMTPSA id d20sm1343401wra.38.2020.11.05.00.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 00:13:19 -0800 (PST)
Date:   Thu, 5 Nov 2020 08:13:14 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>
Subject: Re: [PATCH 1/5] gpio: tps65910: use regmap accessors
Message-ID: <20201105081314.GT4488@dell>
References: <cover.1601164493.git.mirq-linux@rere.qmqm.pl>
 <e3a3979657babf716e5f4072e373637ce86ad7ff.1601164493.git.mirq-linux@rere.qmqm.pl>
 <CACRpkdaMHH35C1LqUROFBte3T00Lz0zApHy3hdZ83Z8EZR04hw@mail.gmail.com>
 <20201001090104.GM6148@dell>
 <20201104144331.GG4488@dell>
 <20201105014728.GC17266@qmqm.qmqm.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201105014728.GC17266@qmqm.qmqm.pl>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 05 Nov 2020, Michał Mirosław wrote:

> On Wed, Nov 04, 2020 at 02:43:31PM +0000, Lee Jones wrote:
> > On Thu, 01 Oct 2020, Lee Jones wrote:
> > > On Wed, 30 Sep 2020, Linus Walleij wrote:
> > > > On Sun, Sep 27, 2020 at 1:59 AM Michał Mirosław <mirq-linux@rere.qmqm.pl> wrote:
> > > > > Use regmap accessors directly for register manipulation - removing one
> > > > > layer of abstraction.
> > > > >
> > > > > Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
> > > > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> > > > 
> > > > I suppose it is easiest that Lee apply all patches to the MFD tree?
> > > Yes, that's fine.
> > I think this patch is orthogonal right?
> > 
> > Not sure why it need to go in via MFD.
> [...]
> 
> The patch 4 assumes all previous patches are applied (or there will be
> build breakage).

Okay, no problem.

Linus, do you want a PR?

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
