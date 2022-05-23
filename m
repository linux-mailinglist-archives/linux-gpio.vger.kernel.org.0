Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 657815314C1
	for <lists+linux-gpio@lfdr.de>; Mon, 23 May 2022 18:26:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238323AbiEWQAI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 May 2022 12:00:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238310AbiEWQAH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 May 2022 12:00:07 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BDE760DBF
        for <linux-gpio@vger.kernel.org>; Mon, 23 May 2022 09:00:06 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id m20so10900247wrb.13
        for <linux-gpio@vger.kernel.org>; Mon, 23 May 2022 09:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=hH6Sw2227bde22AtOz6RnEi8JLF2ESkvCuMIfkjdakw=;
        b=knbEVZxZ2aF5sEZ6hHdZJry9hAnHBLawNAQqTVuACzx38StTZTp/evQJ8ZAuv5X4EX
         p/wrOpEngV6Rqfmr87E7bcXTWww12AI7NaTcUX9l7HGUnAcDSylf4EE3SwZZJr2blmwi
         VGrxgpDucsV8jcJ38aflo/jzHPM5puC4Ke/BVMzIf4U8Ho3NHsflXn2vaFj3owkoWi8G
         nDwewEVYPovrzkN8YyRpWU7R1/GloUGapKxc+DSbulyu1uhzxM/vxbF1FstWurAyVNnV
         CPqRt95dJdjnp3Fx9dxyZd/NLD+2vtLvWqBRshS71Y9+M/ABY92LZCJZ7W4E69YjaWGN
         h+DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=hH6Sw2227bde22AtOz6RnEi8JLF2ESkvCuMIfkjdakw=;
        b=6yzZiou+GcvBw7xDiWGzDYbHq7Fljqos/XkaHwzD7FkPQBZRjkht6pBPYkDaKzhipe
         mclKnkUIirps6xhV5u7Wg3q7EYRRFan/NzbgC+2UmrX1gEb10Oa18Oso4q3w2uZsgXBd
         47SPY1j9gV+tCl+/c6V5KHpJDEQBLRxrdXrGvJG7OglbrguithFQB+MV2uZLJiFJ0hyB
         5JNXDC288an517Fd1Y8RPJMfI/97Ij84dWXovMK28tr1oj38CzXJEIdOIU7PBMwGWB6E
         DhKr/caBKDp0tQyZ1RnBq9jcnvPK91aMVFE/EocQkWUe53Cy/7kZoaiQB8q9eC9MjUZi
         S5RA==
X-Gm-Message-State: AOAM532GVkGqeWKlf3lSasJd19YgI/9m5cmHD+Z3mZj/ZcNmT+vrunfR
        4Pre3L3ZafZIv0YPEXOBe+uzl2ayXUqepQ==
X-Google-Smtp-Source: ABdhPJy88++sam8Rno3SlEnS7UBaPrZKfxINWFCXLRdNktVufOGwdP+w2hrC38lE1yPB3AmwVEiYug==
X-Received: by 2002:a5d:6b87:0:b0:20d:2c2:b6e2 with SMTP id n7-20020a5d6b87000000b0020d02c2b6e2mr19201048wrx.72.1653321605073;
        Mon, 23 May 2022 09:00:05 -0700 (PDT)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id s1-20020adf8901000000b0020c547f75easm10169414wrs.101.2022.05.23.09.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 May 2022 09:00:04 -0700 (PDT)
Date:   Mon, 23 May 2022 17:00:02 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     frank zago <frank@zago.net>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Wolfram Sang <wsa@kernel.org>, Johan Hovold <johan@kernel.org>,
        linux-usb@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v5 3/3] i2c: ch341: add I2C MFD cell driver for the CH341
Message-ID: <YouvgpvrKbH1Holu@google.com>
References: <20220401023306.79532-1-frank@zago.net>
 <20220401023306.79532-4-frank@zago.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220401023306.79532-4-frank@zago.net>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 31 Mar 2022, frank zago wrote:

> The I2C interface can run at 4 different speeds. This driver currently
> only offer 100MHz. Tested with a variety of I2C sensors, and the IIO
> subsystem.
> 
> Signed-off-by: frank zago <frank@zago.net>
> ---
>  MAINTAINERS                    |   1 +
>  drivers/i2c/busses/Kconfig     |  10 +
>  drivers/i2c/busses/Makefile    |   1 +
>  drivers/i2c/busses/i2c-ch341.c | 331 +++++++++++++++++++++++++++++++++

>  drivers/mfd/ch341-core.c       |   3 +

And this one in its own patch please.

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
