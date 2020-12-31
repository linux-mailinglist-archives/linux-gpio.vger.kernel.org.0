Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 052272E7DA5
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Dec 2020 03:10:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726302AbgLaCKB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Dec 2020 21:10:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726289AbgLaCKB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Dec 2020 21:10:01 -0500
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com [IPv6:2607:f8b0:4864:20::f2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE349C061573;
        Wed, 30 Dec 2020 18:09:20 -0800 (PST)
Received: by mail-qv1-xf2d.google.com with SMTP id a13so8535109qvv.0;
        Wed, 30 Dec 2020 18:09:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=QovwV2L0UMEd26xUOh5iY0A9BQ0S+3zOullG0T4ZOPw=;
        b=jG/zA9gr14gYEU7RcfEASC3XPerOE8ewIyEIonYkp2niGKc9uX7C+F9sosc+NBUJlx
         ht5zQTeglhqFmPKMFd5WJJ4gCeA4QNYQ8iwBlRT+d+mveZyZLWaQ7FAazlNjGA+2S6O6
         86x6lLQbglg+lRAkWLrlXn+6Ry94K8TBrkpJMPo4nahpnA9ABpMJoG3VX0RwBpzZAGmb
         iVhfpQQcuRkDrRyRugsk2o5VsdkzKx+I+Ja0ss0IQFC59DGLtfWvifA01Mbk4ppedMde
         bov10Td8QuHD2nW/HloO8+Y4vcui0MfFm4KJGO/qonbxRb9VBDsa1+EA2eSJGk0MLHjT
         eg8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QovwV2L0UMEd26xUOh5iY0A9BQ0S+3zOullG0T4ZOPw=;
        b=cKCm0r1PWrIm4vie0a6M/L3UfMu5/TjMXg71yBu2eYcXMEMZIWtMoQd0KeaJFW2cXc
         kTGcBRybwAFCbE7Fl+CraMyHMOxUnGGUumo+ip36YSDWuM65rSitSfCzwoISysOexdfI
         HUFZLeaqNQfyp/h8c3jVBVTxIX/1jfBnFsWctP68KS5HzDDrgiAPLkK/wn7n0GWiueBW
         CZJiY161WAiLHE+2K2p5zjeqlZq2nRYGqA/aXad0o15az8JN7MNLv4Z6NxXWIR1/SlsV
         BLxSjLT9MY9DZHtqvTp6VLmiGk/v06RQkN0l2Hgqp4LQHuB0xy/efdcB1xd7VHBITURz
         pzbg==
X-Gm-Message-State: AOAM5324LPqjLr+b/vTI4lA1gxXOMQXkIpDXN7pmt69jEnSMOJrV7HEY
        XNxEwA7AojUdGvPGyquYx2Q=
X-Google-Smtp-Source: ABdhPJxH9FJ11CtyboV6HCmPpD29FSDJ9y7WwwxElHrSK3EpnB/0olYZM90pMNS7x/153lBSp5m9mg==
X-Received: by 2002:a0c:ac44:: with SMTP id m4mr59433000qvb.45.1609380560017;
        Wed, 30 Dec 2020 18:09:20 -0800 (PST)
Received: from localhost (097-091-201-069.res.spectrum.com. [97.91.201.69])
        by smtp.gmail.com with ESMTPSA id b6sm28586075qkc.128.2020.12.30.18.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Dec 2020 18:09:19 -0800 (PST)
Date:   Wed, 30 Dec 2020 20:07:07 -0600
From:   Andrew Halaney <ajhalaney@gmail.com>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Arnd Bergmann <arnd@arndb.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Ding Xiang <dingxiang@cmss.chinamobile.com>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: nomadik: remove an unused variable
Message-ID: <20201231020707.sob7kttbv42h7432@halaney-zenbook14.lan>
References: <20201230154624.714388-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201230154624.714388-1-arnd@kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 30, 2020 at 04:46:17PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> A recent patch added a local variable twice:
> 
> drivers/pinctrl/nomadik/pinctrl-nomadik.c:953:8: error: unused variable 'wake' [-Werror,-Wunused-variable]
> 
> Remove the unused outer declaration
> 
> Fixes: f3925032d7fd ("pinctrl: nomadik: Use irq_has_action()")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/pinctrl/nomadik/pinctrl-nomadik.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/nomadik/pinctrl-nomadik.c b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
> index d4ea10803fd9..abfe11c7b49f 100644
> --- a/drivers/pinctrl/nomadik/pinctrl-nomadik.c
> +++ b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
> @@ -949,7 +949,6 @@ static void nmk_gpio_dbg_show_one(struct seq_file *s,
>  	} else {
>  		int irq = chip->to_irq(chip, offset);
>  		const int pullidx = pull ? 1 : 0;
> -		bool wake;
>  		int val;
>  		static const char * const pulls[] = {
>  			"none        ",
> -- 
> 2.29.2
> 

Got rid of the warning for me, I don't have hardware to test on but I
don't think that's necessary for this.

Tested-by: Andrew Halaney <ajhalaney@gmail.com>
Reviewed-by: Andrew Halaney <ajhalaney@gmail.com>

Thanks,
Andrew
