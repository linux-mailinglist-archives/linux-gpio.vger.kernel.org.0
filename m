Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D452F4609E7
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Nov 2021 22:01:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235379AbhK1VEs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 28 Nov 2021 16:04:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235923AbhK1VCr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 28 Nov 2021 16:02:47 -0500
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71349C061748;
        Sun, 28 Nov 2021 12:59:29 -0800 (PST)
Received: by mail-qv1-xf2e.google.com with SMTP id a24so12461397qvb.5;
        Sun, 28 Nov 2021 12:59:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=4rO1iIOhsYpU+TCgKO8j2fQHJ/f2ICdARIm4zSkxnuc=;
        b=NqmTjIMphBoyFHleTUmRXmruOFaw0Zc/1i4PzyQE7Q+2vlcjbOLOPm8MCSWtF/bee2
         MwgG9/l4vbXe0+TECRGAyvBKPqENYvk5jORjtrICTStpzEMYe4y/IcMdAMjl+OfIeVHh
         6fN4wum2DRyvzcdjf8ghQRWuEZk7ppVyxBo9JF0Pfr2zWU4PsNRAo4kMfE4/S54zfKZ0
         j/QrF+vS5DeZpNKvVDRrWqMxWUpBXeVq7Hev+rvYXykgHE/ztQpGLxNly3+Q5jV/4t0/
         oLymJbiRgmrlTbpAL7O+uGIFLeb0nBi4Uv0VIpUb0XClehI1+kB0Hfd+qMJjt1XPEiYf
         /jIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=4rO1iIOhsYpU+TCgKO8j2fQHJ/f2ICdARIm4zSkxnuc=;
        b=Sc/Mxne7L5pcZF5xvL4sBrkCffig3ZedzxC5K78aPqeQ19EzbxumK9jIs8Ymxfxno9
         +0zA/4J5SI4GD9/4cZzxN0JqL3ll8U/NlkbJBD+Q2HFVs/m7iTwjRANT16QebV8gQCdj
         u4TLT5n63+SjNK/eqGfyPObnjd0qZWmIuwbgOVrF0e15xCJCKbXpLYCTA8utgnI4Eycu
         2A2tfyUWYNLsZqFndapiHPbFls37EXX2NwqAuwmliWeM7/6pisC0cBouKwOnPOzlPkr7
         0V4d+Q/sJdqYTLipAFAKeug3C8KxemxxhUvN2cIzJc+2nZdGinAnCV7f5rHL/zezpXE4
         o7Gg==
X-Gm-Message-State: AOAM533rnNN0ISbPWcBvcl80rLCH4nrXhlcwV5B7oX7NKdca6NJDupj1
        N7mbwl90yQ6CVYrgVcoflFo=
X-Google-Smtp-Source: ABdhPJyNg7UDp9tZwTuDdbfYt0YCLMZw/T3WxJA1Rdjw6Xrg16WwaEJIXLdyMqUQrPYZBKTjPIAVyg==
X-Received: by 2002:ad4:4ea6:: with SMTP id ed6mr37650882qvb.54.1638133168589;
        Sun, 28 Nov 2021 12:59:28 -0800 (PST)
Received: from [10.4.10.5] (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id v12sm7756215qtx.80.2021.11.28.12.59.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Nov 2021 12:59:28 -0800 (PST)
Message-ID: <fca5e8f8-a442-c9ec-27ed-da9c8a8d8ed4@gmail.com>
Date:   Sun, 28 Nov 2021 15:59:26 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v3 07/13] clk: imx: Add initial support for i.MXRT clock
 driver
Content-Language: en-US
To:     Fabio Estevam <festevam@gmail.com>
Cc:     NXP Linux Team <linux-imx@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Sascha Hauer <kernel@pengutronix.de>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Stefan Agner <stefan@agner.ch>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        soc@kernel.org, Russell King - ARM Linux <linux@armlinux.org.uk>,
        Abel Vesa <abel.vesa@nxp.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Giulio Benetti <giulio.benetti@benettiengineering.com>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-serial@vger.kernel.org
References: <20211125211443.1150135-1-Mr.Bossman075@gmail.com>
 <20211125211443.1150135-8-Mr.Bossman075@gmail.com>
 <CAOMZO5Dqo6c=4nGCOakMKG8fn=V1HA7-O26t3GmwWtD-FbZiPg@mail.gmail.com>
 <dae68360-456e-3db8-57ed-2287dc7cfd57@gmail.com>
 <CAOMZO5Ca7j6_KOBJ1XVpx0yRvCaAH3i2Wac0jwL8HT8pxso2eA@mail.gmail.com>
From:   Jesse Taube <mr.bossman075@gmail.com>
In-Reply-To: <CAOMZO5Ca7j6_KOBJ1XVpx0yRvCaAH3i2Wac0jwL8HT8pxso2eA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 11/28/21 15:54, Fabio Estevam wrote:
> On Sun, Nov 28, 2021 at 5:52 PM Jesse Taube <mr.bossman075@gmail.com> wrote:
> 
>> we can have multiple imxrt versions in there like the other IMX clk
>> drivers, is this okay?
> 
> Yes, in i.MX we use drivers/clk/imx/clk-<soc>.c
> 
> The same pattern could be used for i.MXRT as well.
> 
Uh so i should change it, or can i keep it like 'clk-imx5.c'(how it is now).
sry for the confusion
