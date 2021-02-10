Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80EC5316CC8
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Feb 2021 18:33:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232268AbhBJRcB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Feb 2021 12:32:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232287AbhBJRbo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Feb 2021 12:31:44 -0500
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54AC7C061756
        for <linux-gpio@vger.kernel.org>; Wed, 10 Feb 2021 09:31:04 -0800 (PST)
Received: by mail-pf1-x431.google.com with SMTP id c11so1698002pfp.10
        for <linux-gpio@vger.kernel.org>; Wed, 10 Feb 2021 09:31:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=r3TD1VAfUO11hF9aR+MVS7dpwQ4XHZyMR7TiZnGBl0g=;
        b=JFoezMNI7Nb31jHhwYFqP7nmDWA7073Dh5KxzGSxmXniyuDG8tb0hMnQZEikXrqcJH
         DDuDNhIFh51Fh9LBHlwW5xgjdKp31CMNmxmYCPehx6dfgEMjAZDlhgQb1hMT/VfBNSgQ
         F6SIOWzti1rHnvPYZxrGB5VZEpYxgSNE48nZds/Pe8gB6qM/rOUPzDdCh6/kIZ090IZa
         WKMx8bkWnRIxSvqvQ6uqNQbyNvVaABOyxR2Fb3tFOGl173gPgOmgwvRR37qWbINyZWjV
         DMmnSU9EqiZXbzQiHNb1h6Rea5HvCAi/tRLydSOJobWAz93H+AcLeAVX8wdrkksf2kT9
         YjqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=r3TD1VAfUO11hF9aR+MVS7dpwQ4XHZyMR7TiZnGBl0g=;
        b=G3SYqgO16T2pArDsZzF9m2UcUEIMp+vMoFtUaZcrlrsYqjr979TnVIsr07Q2PaEIB5
         VnnMswyFYDXvRFSdH3A05717ngKVDkk8nC+hMIBU09oDcMSy84HwIWNaAvxmfz9nMOp8
         a5D/IfC6R0PXAV669WmOdxwGl2vOXw+YSZ2qtOaN43LxL6JRXZmqFaebGNShqxlrUCtp
         AytUkABCK2Npr+zrbkUPPIViF2rRq/D12qMnf7ZYYrHBeL0vd8o06LnCGJnJDZllW+sk
         wX2zyBWKtG4tpoJd21+mgynJ39fDApmrlwEkj7KgYq6I+bVOkmNzri65DnnU8FoshdGS
         wGow==
X-Gm-Message-State: AOAM531rubeJ8X7bYdbsxhm6CH/NyEyW9zZ5RuP1Lrkyoh6/9d6qCJqP
        JNC0Jae3wDsAoVC1i3kqnZ/PDQ==
X-Google-Smtp-Source: ABdhPJyxaBuTrDORPtY6pXqrKAzLL/RSuxC5vxYQJdxX/k8MC5hxfnNUcPe2nTKsUGq5plyO4rkUoQ==
X-Received: by 2002:aa7:92c6:0:b029:1cb:1c6f:c605 with SMTP id k6-20020aa792c60000b02901cb1c6fc605mr4179151pfa.4.1612978263556;
        Wed, 10 Feb 2021 09:31:03 -0800 (PST)
Received: from x1 ([2601:1c0:4701:ae70:7b19:df69:92d6:528e])
        by smtp.gmail.com with ESMTPSA id 68sm3153793pfg.90.2021.02.10.09.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Feb 2021 09:31:02 -0800 (PST)
Date:   Wed, 10 Feb 2021 09:31:00 -0800
From:   Drew Fustini <drew@beagleboard.org>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>
Subject: Re: [PATCH v2 2/2] pinctrl: pinmux: Add pinmux-select debugfs file
Message-ID: <20210210173100.GA178344@x1>
References: <20210210074946.155417-1-drew@beagleboard.org>
 <20210210074946.155417-3-drew@beagleboard.org>
 <CAHp75VcDVVZ=hg5hfRTs9hJ20gdEE_Xhccyg859nsvtyxTXCyw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VcDVVZ=hg5hfRTs9hJ20gdEE_Xhccyg859nsvtyxTXCyw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Feb 10, 2021 at 11:56:49AM +0200, Andy Shevchenko wrote:
> On Wed, Feb 10, 2021 at 9:50 AM Drew Fustini <drew@beagleboard.org> wrote:
> >
> > Add "pinmux-select" to debugfs which will activate a function and group
> > when 2 integers "<function-selector> <group-selector>" are written to
> > the file. The write operation pinmux_select() handles this by checking
> > if fsel and gsel are valid selectors and then calling ops->set_mux().
> >
> > The existing "pinmux-functions" debugfs file lists the pin functions
> > registered for the pin controller. For example:
> >
> > function: pinmux-uart0, groups = [ pinmux-uart0-pins ]
> > function: pinmux-mmc0, groups = [ pinmux-mmc0-pins ]
> > function: pinmux-mmc1, groups = [ pinmux-mmc1-pins ]
> > function: pinmux-i2c0, groups = [ pinmux-i2c0-pins ]
> > function: pinmux-i2c1, groups = [ pinmux-i2c1-pins ]
> > function: pinmux-spi1, groups = [ pinmux-spi1-pins ]
> >
> > To activate function pinmux-i2c1 (fsel 4) and group pinmux-i2c1-pins
> > (gsel 4):
> >
> > echo '4 4' > pinmux-select
> 
> ...
> 
> >  DEFINE_SHOW_ATTRIBUTE(pinmux_pins);
> >
> 
> > +
> 
> One blank line (existed) is enough.
> 
> > +#define PINMUX_MAX_NAME 64
> 
> ...
> 
> > +       buf = devm_kzalloc(pctldev->dev, PINMUX_MAX_NAME * 2, GFP_KERNEL);
> 
> You have to (re-)read documentation about Device Managed Resources.
> Keyword here is *device*! Pay attention to it. TL;DR: misuse of device
> managed resources here.
> Potentially memory exhausting (local DoS attack), but see below.
> 
> > +       if (!buf)
> > +               return -ENOMEM;
> 
> ...
> 
> > +       devm_kfree(pctldev->dev, buf);
> 
> Calling devm_kfree() or other devm_*() release kinda APIs is a red
> flag in 99%. See above.

Thank you for reviewing and pointing out this issue.

Do you mean that I should not be treating these buffers used in the 
debugfs write op as belonging to the pin controller device?

I have looked through the kernel code and I realize now that I don't see
any instances of devm_*() being used inside the read or write op for a
debugfs file. As I consider it further, devm_*() does not seem to make
sense as I am creating the buffers only for temporary use inside
pinmux_select().

I'll get that fixed in v3.

Thank you,
Drew
