Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA81334E38A
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Mar 2021 10:53:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231512AbhC3IxL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Mar 2021 04:53:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231220AbhC3IxF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Mar 2021 04:53:05 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4211BC061762
        for <linux-gpio@vger.kernel.org>; Tue, 30 Mar 2021 01:53:05 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id j18so15429870wra.2
        for <linux-gpio@vger.kernel.org>; Tue, 30 Mar 2021 01:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=uBksXsVr3EOftVJO4jegYtTjXvXDW8BhOpwxvtku7rQ=;
        b=tVpNQYNwNqop4UIaUcZUuGLUS3Dw4a8XAQjMEsfyL8bNlHCUboADMDZIj2W9QXmkFr
         Uzv3I3n/AvAFoVcWbuY6EEAMGvo/eoP+eqvCULwbqEDJekt5NUg1h+qWdfWZdUlTheEm
         f7qcdfwH8D3W+FszU3r1biac/MO8rO2eKX7B3AdeZT39r5oR7Y/1H2kjktmcJbDXubqE
         kmco2R3SVd/DxYvyoSweE6J63hJ/kaoP7sTHe6DwIVs4gTTqgB88qN6Ctcmad/DIv+Sl
         zVjLv5HJRnm43PxHnW/oUgVV8YuiuFFPrCNpnB0orKmD9UoUZaf8LMrAVle/07zFJA/R
         Ovyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uBksXsVr3EOftVJO4jegYtTjXvXDW8BhOpwxvtku7rQ=;
        b=tdT4AdZBPFj1pXBzOg/p4S1WJoUCpeC/Y7HhMTLQiLf3i7MmNdAf+8c+EfvnN2ro7N
         YPPIq8WiEZz+DcptV5unmOrjq4tzSP/Cx/iv7WUwQP5PPrp9bf3n6IZcUXWIF0AHwcDS
         re53RREBSssLyy4LiXO5bp26jMr7evL18BMaEA5hoYgiWbmjQDIeoVvolK540Y9y1j+6
         oYJUYtWTUnMKBAb1UyxzOIUgkx/pWzYPZ3WFuLFVlYRdnh22o6h8N+EBAEXMWvqCffYP
         mQelTbpI6oddn18cuNZ3X0zQzU+cdGDR6wX6KjeZn4klbNnpLcjAS6YkvwbfsArV/xUU
         o/NQ==
X-Gm-Message-State: AOAM532iQvJYvfB4BlWk9IRNSSCGsOIVgMgWS8OejATv+IkX/zWVmOGX
        Gon//ZrV3axaEsUXjf5FEnY=
X-Google-Smtp-Source: ABdhPJxQeNIR2CBBXWaGn9QGvOgMtuQRoGjje4kHVTCt3OBtAc/xc33aUeOP9Io0O+v2kGjmDzlysw==
X-Received: by 2002:adf:f0cb:: with SMTP id x11mr32044908wro.206.1617094383978;
        Tue, 30 Mar 2021 01:53:03 -0700 (PDT)
Received: from [192.168.1.10] (176.red-79-148-190.dynamicip.rima-tde.net. [79.148.190.176])
        by smtp.gmail.com with ESMTPSA id j16sm4380998wmi.2.2021.03.30.01.53.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Mar 2021 01:53:03 -0700 (PDT)
Subject: Re: [pinctrl:ib-bcm63xx 7/22]
 pinctrl-bcm6328.c:(.text.pinconf_generic_dt_node_to_map_pin+0x34): undefined
 reference to `pinconf_generic_dt_node_to_map'
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     kbuild-all@lists.01.org, linux-gpio@vger.kernel.org,
        Jonas Gorski <jonas.gorski@gmail.com>
References: <202103301631.ZPi7Mix1-lkp@intel.com>
From:   =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>
Message-ID: <4f19acd6-31d6-88bc-3143-d750d3762bfc@gmail.com>
Date:   Tue, 30 Mar 2021 10:53:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <202103301631.ZPi7Mix1-lkp@intel.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: es-ES
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

PINCTRL_BCM6328 depends on PINCTRL_BCM63XX, which selects 
GENERIC_PINCONF, so I've no idea why this happens on mips64...

Any hints/help?

Best regards,
Álvaro.

El 30/03/2021 a las 10:17, kernel test robot escribió:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git ib-bcm63xx
> head:   d28039fccf948a407de69106465caa465b1dcf32
> commit: 9bf34ac5ab5805f0a798d40423c05596b7a0cee6 [7/22] pinctrl: add a pincontrol driver for BCM6328
> config: mips-randconfig-r024-20210330 (attached as .config)
> compiler: mips64-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=1 build):
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/commit/?id=9bf34ac5ab5805f0a798d40423c05596b7a0cee6
>          git remote add pinctrl https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
>          git fetch --no-tags pinctrl ib-bcm63xx
>          git checkout 9bf34ac5ab5805f0a798d40423c05596b7a0cee6
>          # save the attached .config to linux build tree
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=mips
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>     mips64-linux-ld: drivers/pinctrl/bcm/pinctrl-bcm6328.o: in function `pinconf_generic_dt_node_to_map_pin':
>>> pinctrl-bcm6328.c:(.text.pinconf_generic_dt_node_to_map_pin+0x34): undefined reference to `pinconf_generic_dt_node_to_map'
> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
> 
