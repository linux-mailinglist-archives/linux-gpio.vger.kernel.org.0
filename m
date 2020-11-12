Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEFE72B0307
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Nov 2020 11:48:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727836AbgKLKsQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Nov 2020 05:48:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727890AbgKLKsQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Nov 2020 05:48:16 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 632A7C0613D1
        for <linux-gpio@vger.kernel.org>; Thu, 12 Nov 2020 02:48:14 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id r17so5517111wrw.1
        for <linux-gpio@vger.kernel.org>; Thu, 12 Nov 2020 02:48:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=tPHs26tZVzjYTtDdN/JsS0EUnogdFtiSHtkC4AZzcV0=;
        b=JbcZc2KM5Zvf4uoQzgfwxcB0lbhWGxGNY9TEFLEBbD9ZCA1xtJ9YeXdFnZV67a88bq
         K8C2Iu/kY9bnzQb5Kpc8EVzrVmC0EL51sMYY3bpTfEr5qxC73cJHf37FAVHObafN2+rX
         5uB84Zzx5SKIrijPGRPd3sa0wmukSEoyFZel+HhvAy5soadpoOws70Z/jifAm0O/0IhU
         t1gy7JAmL2i6JYnJUQlMDK4MzUZWvK63CEmxz5FbhwZn402GgIC31QrbVv+eQLuwzI+0
         Adeg0VSAvYxXXEK+lua91QJDNezFDblMrwA8tOs9CwfPK4l7MT/f0gsPqrWg64b0wFU0
         VTng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=tPHs26tZVzjYTtDdN/JsS0EUnogdFtiSHtkC4AZzcV0=;
        b=Ohz9DAG4hbpw12eYPirhlxheMwq0nnvnOpZU6MyWfoHtCywma95M5UO5qqVmd619FO
         SHOqWI0TgEEZrL2jIWguBP3WlxkRiiaivVr7GSmi/nmU8OMtbCQ0snxXUGLkGLz7fRTs
         0SZmeW+3Ufsl8SlTRzP08YCOBV6xahOO2PqjDVxHU/KVenqFwDJKVzYIZuf0x7bgaLPM
         DirpzG8wHiUFW6CZEhJk0vsZY31h8CcrqjcY1poYbUL9b5cxs75jghERMjVnrpCiqg4r
         uGbBon8dktDpqGfdx3kR5woN4LeLnD/M5/dTfsTOoZ7ES5Sgz2OZbxxQ5tcA3Xm4dWfA
         rpgw==
X-Gm-Message-State: AOAM532nmHc2RqZwaRqWYQYYTH6cJmkblQgFdd66j+b/IBbNmkGtw76W
        ie5jipMI7Uz5V14BnWpF86p46A==
X-Google-Smtp-Source: ABdhPJxJe257UJcNJBZatQ/sRn63dN4+H1TdZfn2l1zm1QawGzpMKVmhSLXfHTRO3tSAocrzqyTICQ==
X-Received: by 2002:adf:eacb:: with SMTP id o11mr24600043wrn.208.1605178093161;
        Thu, 12 Nov 2020 02:48:13 -0800 (PST)
Received: from dell ([91.110.221.159])
        by smtp.gmail.com with ESMTPSA id 89sm6300574wrp.58.2020.11.12.02.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2020 02:48:12 -0800 (PST)
Date:   Thu, 12 Nov 2020 10:48:10 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>
Subject: Re: [PATCH v2 16/25] arch: arm: mach-at91: pm: Move prototypes to
 mutually included header
Message-ID: <20201112104810.GH1997862@dell>
References: <20200713144930.1034632-1-lee.jones@linaro.org>
 <20200713144930.1034632-17-lee.jones@linaro.org>
 <20201112093918.GV2063125@dell>
 <20201112100731.GC4556@piout.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201112100731.GC4556@piout.net>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 12 Nov 2020, Alexandre Belloni wrote:

> Hi,
> 
> On 12/11/2020 09:39:18+0000, Lee Jones wrote:
> > Both the caller and the supplier's source file should have access to
> > the include file containing the prototypes.
> > 
> > Fixes the following W=1 kernel build warning(s):
> > 
> >  drivers/pinctrl/pinctrl-at91.c:1637:6: warning: no previous prototype for ‘at91_pinctrl_gpio_suspend’ [-Wmissing-prototypes]
> >  1637 | void at91_pinctrl_gpio_suspend(void)
> >  | ^~~~~~~~~~~~~~~~~~~~~~~~~
> >  drivers/pinctrl/pinctrl-at91.c:1661:6: warning: no previous prototype for ‘at91_pinctrl_gpio_resume’ [-Wmissing-prototypes]
> >  1661 | void at91_pinctrl_gpio_resume(void)
> >  | ^~~~~~~~~~~~~~~~~~~~~~~~
> > 
> > Cc: Russell King <linux@armlinux.org.uk>
> > Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
> > Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > Cc: Ludovic Desroches <ludovic.desroches@microchip.com>
> > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > ---

[...]

> > diff --git a/include/soc/at91/pm.h b/include/soc/at91/pm.h
> > new file mode 100644
> > index 0000000000000..0fd5093f7f73a
> > --- /dev/null
> > +++ b/include/soc/at91/pm.h
> > @@ -0,0 +1,9 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * atmel platform data
> > + */
> > +
> > +#ifdef CONFIG_PINCTRL_AT91
> 
> Shouldn't that be a header guard instead of depending on PINCTRL_AT91 ?

I copied the same semantics from the header it was taken from.

Happy to turn it into a proper header file too.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
