Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 841B314C96F
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Jan 2020 12:18:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726178AbgA2LSs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Jan 2020 06:18:48 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:40259 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726128AbgA2LSs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Jan 2020 06:18:48 -0500
Received: by mail-wr1-f68.google.com with SMTP id j104so3826251wrj.7
        for <linux-gpio@vger.kernel.org>; Wed, 29 Jan 2020 03:18:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=WdEwvXuf/f1ew5arKRFGjQIWnawCPhuYtVKO7QPsc9Y=;
        b=Sw3HgBhFTNZBQ36hs9fAypBBY7Fa4Sh5OhqWXeKEPKx1kmSDHDG26lN9LA8NuPw2qF
         p1DHCrsJ8EOijNoxlSKupI7Zxp/jNH8T5E9VvGgDRaqOitPqAwUS74HmiAa2e9jQLPbv
         89Du9baS80tY7ud1v+dhJl/UHWfb1rsw6BinQLgP7jPdxm3FsWERhB7LLxEIdmcc48pv
         IvpJw07fjov6WMjVtkzx0qF2RvIxiyEMBsvtYuAZEu6G6dxXDSHBPJDgjeuZ9nxRC4Vq
         xKwuGm14d1NEDJdCQHvkh2GjoQQsU1G/gsuEuT6g11JkYEZpLnLFNMDd8mOBL+N7a+4f
         yEnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=WdEwvXuf/f1ew5arKRFGjQIWnawCPhuYtVKO7QPsc9Y=;
        b=AS/iZDtUm1earVQWIGlUQsdcyv+vy25O6xPu56hEL9MvqEs2QXvWi2XGB0tuBOmozZ
         hcgaRGjeaYlvs28iVKu7xNJRLlfecQD9roDzipxTphfqX1W2clKj49ZM76v++nY9HI1z
         k3nS9E2vsHbmRp+rvCXzTO5uOcTknbVgQC4mn77it8o9ojZ+K0dwSBzQt8vwtvpVk3ws
         CNlSdb4tEOsu9lrH0P+EKqHTEt3xRqiSkpdNAiI+zSQVtOtzTp9PfsI9HF9Yo0j+xmyA
         CEPwb8f/QnyCoL+9rZUc1Xje8lPc3ViR033DtEb5RpmNv2K6K/WT/n8tcp3LW94M/N2l
         bzkw==
X-Gm-Message-State: APjAAAUKCPx4ssitP0O5yPbMMcEJMjE2DV7LzgaV93EEO/L+wgbEow/t
        /i97lPo5wprsBQmZ80gwxwwoeA==
X-Google-Smtp-Source: APXvYqyMoIcsyaEqYxxW6ffIc7cM/EHFn0b6ThBfRh9LHZ4nCf4C8TEqE1Hf1HzIgoqg9YnSyuDr8A==
X-Received: by 2002:adf:a109:: with SMTP id o9mr35424484wro.189.1580296726681;
        Wed, 29 Jan 2020 03:18:46 -0800 (PST)
Received: from dell ([2.27.35.227])
        by smtp.gmail.com with ESMTPSA id b17sm2448180wrx.15.2020.01.29.03.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2020 03:18:45 -0800 (PST)
Date:   Wed, 29 Jan 2020 11:18:58 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     broonie@kernel.org, linus.walleij@linaro.org, robh@kernel.org,
        vinod.koul@linaro.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        spapothi@codeaurora.org, bgoswami@codeaurora.org,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v6 02/11] mfd: wcd934x: add support to wcd9340/wcd9341
 codec
Message-ID: <20200129111858.GC3548@dell>
References: <20191219103153.14875-1-srinivas.kandagatla@linaro.org>
 <20191219103153.14875-3-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191219103153.14875-3-srinivas.kandagatla@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 19 Dec 2019, Srinivas Kandagatla wrote:

> Qualcomm WCD9340/WCD9341 Codec is a standalone Hi-Fi audio codec IC.
> 
> This codec has integrated SoundWire controller, pin controller and
> interrupt controller.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/mfd/Kconfig                   |  12 +
>  drivers/mfd/Makefile                  |   1 +
>  drivers/mfd/wcd934x.c                 | 306 +++++++++++++++
>  include/linux/mfd/wcd934x/registers.h | 531 ++++++++++++++++++++++++++
>  include/linux/mfd/wcd934x/wcd934x.h   |  31 ++
>  5 files changed, 881 insertions(+)
>  create mode 100644 drivers/mfd/wcd934x.c
>  create mode 100644 include/linux/mfd/wcd934x/registers.h
>  create mode 100644 include/linux/mfd/wcd934x/wcd934x.h

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
