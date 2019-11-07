Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF283F31E7
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Nov 2019 16:01:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727142AbfKGPBv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Nov 2019 10:01:51 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:41940 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388269AbfKGPBv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Nov 2019 10:01:51 -0500
Received: by mail-lj1-f195.google.com with SMTP id m9so2624127ljh.8
        for <linux-gpio@vger.kernel.org>; Thu, 07 Nov 2019 07:01:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jgAkr102LqQKPAr3pGJYhPDK4e/SFK30Vkoy1JW8C9s=;
        b=K6FTWVC18/HyP+n8tnIdWBbmpg4P7IxBIGjTfd3smZOdNgDhapmaHf1IhT8kb2LSeg
         Jp07yGotkBOcA6+pRceCmh3VjtNawsLwxSifx2YACvzh9JDUgrSG5pHHU6YW2cq3V8qi
         wbXClCy8b0xtcYKRt6csHAPi5UH1fVW1AlSaTW87EJcyy26oAX/KQxunAyTCdCbMLQao
         hmwkxLx/5OQRsiBShbFCZRZq+qwSxwx5ReOVAbsv2fE+fKibsPIEhdksbqEEnkH6QekX
         NqQzaZNv//tuRz+X9s5Fgxa3pRbvJVbZDYBy4Ju2n+OYbhL2uB9GnNoF66wM6k4KJ3B1
         J1vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jgAkr102LqQKPAr3pGJYhPDK4e/SFK30Vkoy1JW8C9s=;
        b=qM9KaT2aT8AVSYVNCksqA/yhFErUK05r6nlOmpHU4/BHH4DgJNJDHbSoivFtNWSeUX
         5U4AOAliUCNFszFK6GlqOkZ/OIIS7cjNjA7FTaYJE9fVbXzI4HXUYh1JOPNIpFJf1J60
         h9g+o25j5iSvxUg6krcIrvoqAmpWC+ciT3KqEPmrUULjlZgkqSrxzF8aL1BMkHkM58oB
         sT/x/PSlgVbSlCHSqgmG0UC+2Z9FP0sBgw5bgbJL8UtuH15RN+HGUbSF4zHnaqss145T
         gLmYLigtFFLcf9w+deky1mzVbpTIbxdNkytalv+79VITaCg0PuC/yUgzpMM6zIMekMcR
         2IhA==
X-Gm-Message-State: APjAAAU+SsEVKZ59PhkqqC3ftDbDetUq9TAOadSj6h8BF/zk+TjEQ91R
        +PL2W4iVmC/xjPKJxIMPtQ7MiNwjDBXSBHSUZDYA5g==
X-Google-Smtp-Source: APXvYqxEfc/CuHeO/tUPbA/L8KnwpKF2GYeDL5vyFe1U1/wxU4srnu1AJ/8ugakgyWV8GG7sl3Pz4PrhWVkvlJpK/wQ=
X-Received: by 2002:a2e:90b:: with SMTP id 11mr2740565ljj.233.1573138907121;
 Thu, 07 Nov 2019 07:01:47 -0800 (PST)
MIME-Version: 1.0
References: <20191107103540.21088-1-jonathanh@nvidia.com>
In-Reply-To: <20191107103540.21088-1-jonathanh@nvidia.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 7 Nov 2019 16:01:35 +0100
Message-ID: <CACRpkdZircUVEcQHV2saCk_Mihf-hUWWKUJ=h9jg1it58VeitA@mail.gmail.com>
Subject: Re: [PATCH] gpio: xgs-iproc: Fix crash when driver is built as a module
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-tegra@vger.kernel.org, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 7, 2019 at 11:35 AM Jon Hunter <jonathanh@nvidia.com> wrote:

> Commit 6a41b6c5fc20 ("gpio: Add xgs-iproc driver") introduced a new
> GPIO driver for the Broadcom GPIO controller. When this driver is built
> as a module the following warning is observed because the
> bcm_iproc_gpio_of_match structure is defined with the __initconst
> attribute ...
>
>  MODPOST vmlinux.o
>  WARNING: vmlinux.o(.data+0x834d0): Section mismatch in reference from
>  the variable bcm_iproc_gpio_driver to the variable
>  .init.rodata:bcm_iproc_gpio_of_match
>  The variable bcm_iproc_gpio_driver references
>  the variable __initconst bcm_iproc_gpio_of_match
>
> This then causes a translation fault on boot which and results in a
> system crash. Fix this by dropping the __initconst attribute from the
> bcm_iproc_gpio_of_match structure.
>
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>

Incidentally Mark Brown already sent an identical patch.

Thanks anyway!

Yours,
Linus Walleij
