Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6776E24AC89
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Aug 2020 03:15:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726609AbgHTBPw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Aug 2020 21:15:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726466AbgHTBPv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 Aug 2020 21:15:51 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 327CDC061383
        for <linux-gpio@vger.kernel.org>; Wed, 19 Aug 2020 18:15:51 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id a26so684069ejc.2
        for <linux-gpio@vger.kernel.org>; Wed, 19 Aug 2020 18:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=L95gIXwGMvZZq8+ZBbJLFbYWdlFmXYekwntOD8a6oOA=;
        b=WG3KUIydvAL6lmQrHxm61oJNRNmcU6P3AYdrnvvDk2Y+hKlIojHKEJGegWF4qwv1+Y
         QTeYxO/dmBMjiGuD8Bcer9Szc6wGqRF7KS54/JvegK794xU8NuZtLrfXge70efh+Srjf
         j8SOWTy9A9tvc8TrHp9v6b/ZgrKwYzANCvRu97KxycC19b+fIKbadEqG5DQwkPrUYnrD
         oXvP4WUQANyhz4Iia2vNUjttdG3ES2Q5Q+15Mf8bYJ86ICEPE5SpK2K5syACwh1i+IeQ
         SzVm4NRN8oEMld6tQ3d+tp0J1Y7Gsx/80wE5GM+Iv8TVgc/ysjZ1fPS6WsvaQVMk41/k
         HhsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=L95gIXwGMvZZq8+ZBbJLFbYWdlFmXYekwntOD8a6oOA=;
        b=gEd/JxJA+DiWVATHVdWFTJfo14/pkFI7Jn2BvzZ2LH9OyJFNOc6mXBv7iBV//0aqp4
         2McYADA3HjQoG0h3sFHLPjMltoSpIzxbzoQLa7GUSu8RrYeYjQ7zYkGvkiK2MHatrH7H
         RNXQPkKgcpwfptq5jYaPYJYLhgLwgyfrSgFjfB28pNI5q7J7RPA2bZR80T/DGUPiImD2
         EkFuLJuEiUY//yJQNddPDEjTIu9sbbt2EY0tIEl978iIZfvnkRiYpV1AiFrrLHGFlhbL
         az5zRy9znC2D2f6YdW6B3545wvoOMwp8qSYOKTnGTjRGtui9g5zk7FotZC5QKeDtsp4t
         rjeA==
X-Gm-Message-State: AOAM533+swcWzHMU65bAQtv880stHSmlQuTUjdZDIdxej7pS6HCYFmLO
        vQbi8lygpGN1M32CpMXo9UH2ow==
X-Google-Smtp-Source: ABdhPJyEI0+REUtIA4p2wEAbWZN4TQlHgJzr4Z/vBB40QUXm8ya4oYGDbsGWCuRbDl47Y0QH6guB/Q==
X-Received: by 2002:a17:906:528d:: with SMTP id c13mr1023638ejm.61.1597886149318;
        Wed, 19 Aug 2020 18:15:49 -0700 (PDT)
Received: from x1 ([2001:16b8:5ca7:9f01:a7aa:12ad:e665:579d])
        by smtp.gmail.com with ESMTPSA id i26sm274194edv.70.2020.08.19.18.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2020 18:15:48 -0700 (PDT)
Date:   Thu, 20 Aug 2020 03:15:45 +0200
From:   Drew Fustini <drew@beagleboard.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>, linux-omap@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: [PATCH] gpio: omap: improve coding style for pin config flags
Message-ID: <20200820011545.GA140179@x1>
References: <20200722120755.230741-1-drew@beagleboard.org>
 <20200819063127.GU2994@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200819063127.GU2994@atomide.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Aug 19, 2020 at 09:31:27AM +0300, Tony Lindgren wrote:
> Hi,
> 
> * Drew Fustini <drew@beagleboard.org> [200722 12:09]:
> > Change the handling of pin config flags from if/else to switch
> > statement to make the code more readable and cleaner.
> > 
> > Suggested-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
> > Signed-off-by: Drew Fustini <drew@beagleboard.org>
> 
> This looks OK to me:
> 
> Acked-by: Tony Lindgren <tony@atomide.com>
> 
> I've lost track of the pending pinctrl/gpio/dts patches you've
> posted :) Care to also summarized the pending ones and repost
> them now that v5.9-rc1 is out?

Everything appears to be in mainline already:

commit f1b206cf7c57561ea156798f323b0541a783bd2f
Author: Drew Fustini <drew@beagleboard.org>
Date:   Wed Jul 22 14:27:52 2020 +0200

    pinctrl: core: print gpio in pins debugfs file

commit bde8c0e64c78633612aaf283692f72bef0bbc549
Author: Drew Fustini <drew@beagleboard.org>
Date:   Wed Jul 22 14:07:56 2020 +0200

    gpio: omap: improve coding style for pin config flags
        
commit 75dec56710dfafd37daa95e756c5d1840932ba90
Author: Drew Fustini <drew@beagleboard.org>
Date:   Fri Jul 17 21:40:43 2020 +0200

    gpio: omap: handle pin config bias flags

commit 40e30d26d909af89de2dcd0b4abdd27c47ac2235
Author: Drew Fustini <drew@beagleboard.org>
Date:   Wed Jul 15 23:37:38 2020 +0200

    gpio: omap: handle pin config bias flags

commit abe4e4675dfc62b7f2328e2c4bce8b5bdcdff7c0
Author: Drew Fustini <drew@beagleboard.org>
Date:   Sun Jul 12 12:37:19 2020 +0200

    ARM: dts: am335x-pocketbeagle: set default mux for gpio pins
    
commit bc6d201591344aa21d616179ee9ad406a7336267
Author: Drew Fustini <drew@beagleboard.org>
Date:   Wed Jun 17 20:05:43 2020 +0200

    pinctrl: single: fix function name in documentation

commit 27c90e5e48d008bfda1cf6108eb699697317c67b
Author: Drew Fustini <drew@beagleboard.org>
Date:   Wed Jul 1 03:33:20 2020 +0200

    ARM: dts: am33xx-l4: change #pinctrl-cells from 1 to 2
    
commit a133954188887a830b5ce438a287a5e4e234b1be
Author: Drew Fustini <drew@beagleboard.org>
Date:   Wed Jul 1 03:33:19 2020 +0200

    pinctrl: single: parse #pinctrl-cells = 2
    
commit e14d2c766392ff1f226017fd62f0b6283a53bd0c
Author: Drew Fustini <drew@beagleboard.org>
Date:   Thu Jun 18 20:29:21 2020 +0200

    ARM: dts: am335x-pocketbeagle: add gpio-line-names

commit aafd897a5ac4cb7f9b4f99acc5365a7df1f77aa0
Author: Drew Fustini <drew@beagleboard.org>
Date:   Thu May 21 22:09:26 2020 +0200

    ARM: dts: am335x-boneblack: add gpio-line-names

commit ff82009fcc6ace774570107750f5af91c9081b0a
Author: Drew Fustini <drew@beagleboard.org>
Date:   Wed Jun 10 13:02:58 2020 +0200

    ARM: dts: am33xx-l4: add gpio-ranges

commit 25fae752156db7253471347df08a2700501eafde
Author: Drew Fustini <drew@beagleboard.org>
Date:   Fri Jun 12 13:27:58 2020 +0200

    pinctrl: single: fix function name in documentation

commit 80bf72598663496d08b3c0231377db6a99d7fd68
Author: Drew Fustini <drew@beagleboard.org>
Date:   Mon Jun 15 17:57:01 2020 +0200

    ARM: dts: am5729: beaglebone-ai: fix rgmii phy-mode

commit d7af722344e6dc52d87649100516515263e15c75
Author: Drew Fustini <drew@beagleboard.org>
Date:   Tue Jun 9 23:45:21 2020 +0200

    ARM: dts: am335x-pocketbeagle: Fix mmc0 Write Protect

commit f46fe79ff1b65692a65266a5bec6dbe2bf7fc70f
Author: Drew Fustini <drew@beagleboard.org>
Date:   Mon Jun 8 14:51:43 2020 +0200

    pinctrl-single: fix pcs_parse_pinconf() return value

Author: Drew Fustini <drew@beagleboard.org>
Date:   Fri Apr 3 21:19:31 2020 +0200

    dt-bindings: Add vendor prefix for BeagleBoard.org


The only thing that isn't would be "ARM: dts: am33xx: add ocp label"
which you applied to omap-for-v5.9/dt.

thanks,
drew
