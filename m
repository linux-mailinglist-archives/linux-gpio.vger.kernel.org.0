Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 14E8B1B15A
	for <lists+linux-gpio@lfdr.de>; Mon, 13 May 2019 09:43:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727690AbfEMHnd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 May 2019 03:43:33 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:50860 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726841AbfEMHnd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 May 2019 03:43:33 -0400
Received: by mail-wm1-f66.google.com with SMTP id f204so7220551wme.0
        for <linux-gpio@vger.kernel.org>; Mon, 13 May 2019 00:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=2SVkcixuV+vIKx8xDNZuyAT9UK0fzjYF/b5ce8pCl+U=;
        b=LvnhpyUOg/fe+RLGQXLz1XqoioBuGPsaZYetsZRYzhCP7PHiNcJAXKVPD3pg02fLCn
         H/TUqrAnssQmBiq4xA5XnuFUu01cp9MB7+7fYw/Ai+FxQbcMCexvAVfnVbmVNJQttTUe
         ael2fjcPqteB/83JAJjEIkEUBnerHvAhdN/+QJUjYVFX5ljyUuCsBNmEMr6ExStjRXaX
         jwUs9obpnSHdBZ8XrLQZJAOYwhEHxDPcEgEvVzlf0O+s8tGzhT3UXVum2YXsOTzhT3dv
         6q9FuQ3Vibk3KNcBC1FpBC3kc41XXNX/AB62vxLCAizVrIjoa9ciUMgs4enwYft749hd
         5qjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=2SVkcixuV+vIKx8xDNZuyAT9UK0fzjYF/b5ce8pCl+U=;
        b=Djx/Xm3CvsRukFK5eID+5JzH7sTZwHZfMDIywQmfjPlOs5aaqHRUSB/g8adD3zXXIj
         i0YaiPgoyucj9MNWptO+b1L6bzumSanQG70028pI30E55xhr1S5W8f3SOJVvnMd2Cxpq
         jcE1F8rDFZFizfeVfxXpsKk8NSQ2RbSsUI4rQLWMpkW8dtUVJNZ/5r5Hz7JEHUBqxEeL
         7bul9alC4RcwGZUdcqvuos2rlJoukhk3NNBKDJQhBKZ4U1VeG5Uw8+r0VI8+nPoAo00U
         Bei2V59xj1NFAgDKOczCtI+9viTvY3oo0Kt3d5uy+KZevF5MZhb3Mc7Rq5Pn1vN0fX/2
         V1FQ==
X-Gm-Message-State: APjAAAXgCW6tmR3vEHc//V0wghGYYb1N72OL+fytM0Lu3fz3OgQOzmvp
        Vm0jiGeUNz8V0R6fYAOieUzrTA==
X-Google-Smtp-Source: APXvYqwp8nAXWcx1osFAjj9b+GA8DgpLgKaUzmyU2T2zcrbCMz9vA5t8VV7tfWYcz6KGhz3E6C8uYw==
X-Received: by 2002:a05:600c:247:: with SMTP id 7mr15179643wmj.31.1557733411492;
        Mon, 13 May 2019 00:43:31 -0700 (PDT)
Received: from dell ([2.27.167.43])
        by smtp.gmail.com with ESMTPSA id 24sm3859594wmo.3.2019.05.13.00.43.30
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 May 2019 00:43:30 -0700 (PDT)
Date:   Mon, 13 May 2019 08:43:29 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Amelie Delaunay <amelie.delaunay@st.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [GIT PULL v3] Immutable branch between MFD and Pinctrl due for
 the v5.2 merge window
Message-ID: <20190513074329.GJ4319@dell>
References: <1557392336-28239-1-git-send-email-amelie.delaunay@st.com>
 <20190510072314.GC7321@dell>
 <20190510151556.GA4319@dell>
 <20190510151912.GB4319@dell>
 <20190513074237.GI4319@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190513074237.GI4319@dell>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 13 May 2019, Lee Jones wrote:

> Enjoy!

Should have said: now contains fixes for reported Smatch warnings.

> The following changes since commit e93c9c99a629c61837d5a7fc2120cd2b6c70dbdd:
> 
>   Linux 5.1 (2019-05-05 17:42:58 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git tags/ib-mfd-pinctrl-v5.2-2
> 
> for you to fetch changes up to d17ed797b8fd5c8765cd959ac44aaa2f090f5a89:
> 
>   pinctrl: stmfx: Fix 'warn: bitwise AND condition is false here' (2019-05-13 08:28:26 +0100)
> 
> ----------------------------------------------------------------
> Immutable branch between MFD and Pinctrl due for the v5.2 merge window
> 
> ----------------------------------------------------------------
> Amelie Delaunay (5):
>       dt-bindings: mfd: Add ST Multi-Function eXpander (STMFX) core bindings
>       mfd: Add ST Multi-Function eXpander (STMFX) core driver
>       dt-bindings: pinctrl: document the STMFX pinctrl bindings
>       pinctrl: Add STMFX GPIO expander Pinctrl/GPIO driver
>       pinctrl: Kconfig: Fix STMFX GPIO expander Pinctrl/GPIO driver dependencies
> 
> Lee Jones (2):
>       pinctrl: stmfx: Fix 'warn: unsigned <VAR> is never less than zero'
>       pinctrl: stmfx: Fix 'warn: bitwise AND condition is false here'
> 
>  Documentation/devicetree/bindings/mfd/stmfx.txt    |  28 +
>  .../devicetree/bindings/pinctrl/pinctrl-stmfx.txt  | 116 +++
>  drivers/mfd/Kconfig                                |  13 +
>  drivers/mfd/Makefile                               |   2 +-
>  drivers/mfd/stmfx.c                                | 545 ++++++++++++++
>  drivers/pinctrl/Kconfig                            |  14 +
>  drivers/pinctrl/Makefile                           |   1 +
>  drivers/pinctrl/pinctrl-stmfx.c                    | 819 +++++++++++++++++++++
>  include/linux/mfd/stmfx.h                          | 123 ++++
>  9 files changed, 1660 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/mfd/stmfx.txt
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-stmfx.txt
>  create mode 100644 drivers/mfd/stmfx.c
>  create mode 100644 drivers/pinctrl/pinctrl-stmfx.c
>  create mode 100644 include/linux/mfd/stmfx.h
> 

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
