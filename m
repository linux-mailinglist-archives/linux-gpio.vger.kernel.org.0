Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 609423998DD
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jun 2021 06:13:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229486AbhFCEOn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Jun 2021 00:14:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbhFCEOn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Jun 2021 00:14:43 -0400
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5C55C06174A;
        Wed,  2 Jun 2021 21:12:46 -0700 (PDT)
Received: by mail-qk1-x72a.google.com with SMTP id j184so4748253qkd.6;
        Wed, 02 Jun 2021 21:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WSBVtEwjNJceUSW+ED54by5q0ntVhKU4EZfInF4XBmQ=;
        b=ALSkX+TZCWadbcLs53Y6oEcOcUob861l+3sMaf3bsrc7RQda1oexFXL8fGmiav0Xpi
         /ChK3KS/oFMr3CjNybg5mytdl91qRxUGZgvSeLuBQeM6IBSJhAUWrEGRlzNH5SnYxw1r
         0LdsgZUDyGu6tfUQcjHf8Su5QHoDTMOdCLx/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WSBVtEwjNJceUSW+ED54by5q0ntVhKU4EZfInF4XBmQ=;
        b=dHnH/JXqT13yoDam0FmA/tsdyNtrwymop5R27iVrdvvJKn0mWUC0pJzYprj0iqbd/d
         8eCOt2felqopz+fPjuA8vfd9ekp8UHCUjGTk5oyK2tliYc4JO4UkH4SRDa82asqdqnRN
         h7zu+z3Zdbavq7KZI2QWZXenDNtzepSUzr//5YioFo5lTIAo0Q9HOWX8otdnNosbLoC3
         rRSv0J7u2HU68WhfwEp9moBWXS6vuDbM7x/fCVtY/bQ82xVT1LHPLYMjxEGPElV5+tJC
         bQvm94Ig6atPzur+eH5ajctreGXQf3gpHyT8IjlYzqalhCjfLtsG19M9fCActOcoTU6c
         OI9A==
X-Gm-Message-State: AOAM530l0UnVT/OJ5x5jxOwOsDnD8CC3xA+J1Wb5H1AVryfKltRyuZ77
        RNHbt8kuPi/Uae9pQNJQE2H5UcmwWmLTWkEsBwU0ayV5
X-Google-Smtp-Source: ABdhPJwTjlMS+8+L8BrVHX4Xf5NgGJL3RRe8WHEXPcfnogTmYIgrBQEd9Bnnz7jEgKwCaeeqz/0xBZ7xr0UxwDga/Og=
X-Received: by 2002:a37:e0f:: with SMTP id 15mr10333070qko.273.1622693565759;
 Wed, 02 Jun 2021 21:12:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210525055308.31069-1-steven_lee@aspeedtech.com>
 <20210525055308.31069-3-steven_lee@aspeedtech.com> <CACRpkdZy0UwaJcYTiM9asVwNh4wuEYdMSrmqAPAiikbrvjtKpw@mail.gmail.com>
In-Reply-To: <CACRpkdZy0UwaJcYTiM9asVwNh4wuEYdMSrmqAPAiikbrvjtKpw@mail.gmail.com>
From:   Joel Stanley <joel@jms.id.au>
Date:   Thu, 3 Jun 2021 04:12:33 +0000
Message-ID: <CACPK8XfbpCWx_ZOPuUy0QCT2N9kj9_+WGZv4wEPXgUUoVDf+fQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] ARM: dts: aspeed-g6: Add pinctrl settings
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Steven Lee <steven_lee@aspeedtech.com>,
        Andrew Jeffery <andrew@aj.id.au>,
        Rob Herring <robh+dt@kernel.org>,
        "moderated list:ASPEED PINCTRL DRIVERS" 
        <linux-aspeed@lists.ozlabs.org>,
        "moderated list:ASPEED PINCTRL DRIVERS" <openbmc@lists.ozlabs.org>,
        "open list:ASPEED PINCTRL DRIVERS" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>,
        Hongwei Zhang <Hongweiz@ami.com>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        Billy Tsai <billy_tsai@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 27 May 2021 at 23:47, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Tue, May 25, 2021 at 7:53 AM Steven Lee <steven_lee@aspeedtech.com> wrote:
>
> > AST2600 supports 2 SGPIO master interfaces and 2 SGPIO slave interfaces.
> > Currently, only SGPIO master 1 and SGPIO slve 1 in the pinctrl dtsi.
> > SGPIO master 2 and slave 2 should be added in pinctrl dtsi as well.
> >
> > Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> > Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
> Please funnel this patch through the Aspeed/ARM SoC tree.

Applied, thanks.
