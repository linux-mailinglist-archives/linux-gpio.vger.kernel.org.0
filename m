Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E71227D3EB
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Sep 2020 18:51:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728663AbgI2QvM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Sep 2020 12:51:12 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:40696 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728459AbgI2QvL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Sep 2020 12:51:11 -0400
Received: by mail-ot1-f68.google.com with SMTP id c2so5104886otp.7;
        Tue, 29 Sep 2020 09:51:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Az1h4KFWScdNodLS6LZ5ux2Q7QM84gnoEPToYbUwaU0=;
        b=ckBYBFLzkAjk4lWir9IwtasPySMteQ+ZIyb2hZSEhaUMFbaoOICDPA0UjqXEwjs4aV
         DOCa8Mq8LaGVfZx7gTkSYSdDnArp5wM/8jUrE03+FB8GUql9+i7EpfAez5YUsrbiIt2v
         zMIbM+ESkM63zpW/Q0nBOZVc+z6sTXQ2tonF6E36wPg/opzW98S3VbseAQwy8W2Altir
         kEMZRskh9vmUf5Wk+h3ImuvljQqDprKBywY8yeSKVySyoTJJVfL5csrMo+pRaqZON4HT
         /vphD5PFjSzIaXHoUm0TYeA4ESu8Xn58F+kyx4slS74o3JyPADcrZ4P4nezOnt2tOonP
         +MPQ==
X-Gm-Message-State: AOAM531XExR9HxDywWc2YGC/f6QpURHoHZJ+uBYm4k5+7+xeH9gQgWOV
        fxLSH+6jwicDFyUn8ttrnw==
X-Google-Smtp-Source: ABdhPJyfIGDzPhgnVPEpNLWF10x8U1bsWTaRgcvgQg/aYnIH0da1omYuzsvOstTm3Huprm4+/dV4Pg==
X-Received: by 2002:a9d:6a0e:: with SMTP id g14mr3330133otn.126.1601398269996;
        Tue, 29 Sep 2020 09:51:09 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id b14sm1099679oii.52.2020.09.29.09.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 09:51:09 -0700 (PDT)
Received: (nullmailer pid 760427 invoked by uid 1000);
        Tue, 29 Sep 2020 16:51:08 -0000
Date:   Tue, 29 Sep 2020 11:51:08 -0500
From:   Rob Herring <robh@kernel.org>
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Jason Kridner <jkridner@beagleboard.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Robert Nelson <robertcnelson@gmail.com>,
        linux-kernel@vger.kernel.org,
        Christina Quast <cquast@hanoverdisplays.com>,
        devicetree@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-gpio@vger.kernel.org, Trent Piepho <tpiepho@gmail.com>
Subject: Re: [PATCH v2] ARM: dts: document pinctrl-single,pins when
 #pinctrl-cells = 2
Message-ID: <20200929165108.GA760369@bogus>
References: <20200919200836.3218536-1-drew@beagleboard.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200919200836.3218536-1-drew@beagleboard.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, 19 Sep 2020 22:08:37 +0200, Drew Fustini wrote:
> Document the values in pinctrl-single,pins when #pinctrl-cells = <2>
> 
> Fixes: 27c90e5e48d0 ("ARM: dts: am33xx-l4: change #pinctrl-cells from 1 to 2")
> Reported-by: Trent Piepho <tpiepho@gmail.com>
> Link: https://lore.kernel.org/linux-omap/3139716.CMS8C0sQ7x@zen.local/
> Signed-off-by: Drew Fustini <drew@beagleboard.org>
> ---
> v2 change:
> - rephrase to make it clear that the pin conf value and pin mux value
>   are OR'd together with #pinctrl-cells = <2>
> 
> 
>  .../bindings/pinctrl/pinctrl-single.txt       | 21 ++++++++++++-------
>  1 file changed, 14 insertions(+), 7 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
