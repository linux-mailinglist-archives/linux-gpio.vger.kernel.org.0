Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD50E331054
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Mar 2021 15:05:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229848AbhCHOEt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Mar 2021 09:04:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230135AbhCHOEo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Mar 2021 09:04:44 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C1FAC06175F
        for <linux-gpio@vger.kernel.org>; Mon,  8 Mar 2021 06:04:44 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id j4-20020a05600c4104b029010c62bc1e20so3881104wmi.3
        for <linux-gpio@vger.kernel.org>; Mon, 08 Mar 2021 06:04:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=oI6X2MifW0N1KwImsVj+ePRWB3MSjLj4erm+zxgelkc=;
        b=XVQf3UFOHOTd9CQ30QMqYSt5hbJr64Ndyglt6OHyBhKrkp1rca+y2cd3MyDIutMUH2
         pvaMccQnEeAoODb+J8REZZelxhYX6r4E10+TO+24wojw4u56YzBqmIDdrpJ16AFCl0mj
         QjyzF0LMJIMN47NV83DRmfeU2H5ywDby5nRUVeCeWq+qQqehqADGnG+BidpQuxvrtMnG
         hHieEqlAfhQ5GZSpDp2YAN07Dr8J+aJaWD0Jhvvu9CZ7Uexs4LfJAjDxig6Ntr/KXhcU
         MEWL6jLx7lqG63PDIvzTvFb/AYezqpzCjSfXNsR5UsPkMZr7mgCdgbbj1i2X1lQuykUp
         nzyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=oI6X2MifW0N1KwImsVj+ePRWB3MSjLj4erm+zxgelkc=;
        b=TPLy5KCMaMONpu4Dg6ifDdeSzAeK1MIgXZMsDWntJYWQJYTkpk+mb/G8TvlrDHVcTy
         VgJprQ//U/tPqzVa76pYpIhDcjI7ZaGc6SCN95nL37eJeuMNidjbVmkopEQil6xklBBa
         yFPjNQwP3k9HkAM1NRgxt+Nqxunl+1VymeOFGnpUGRCVxmvabNsUV3fbMQXPefMyRsBm
         tVcFCGPDEaZbMRIcphwRZSTWe+Xd2aIJKoAnJNg0udePZZHUNF2Zkh1EZnqCIT+S7Cyn
         +b/8G3L6ClH/Xe77dEqvMcIoeVbyfmqe6nHPu2PBXyMbtcYr8+kvng4L/7Csxgc1lu9n
         uf8A==
X-Gm-Message-State: AOAM531S8uQh35lZinbBovLoNPPD+Mp7hCQu4cVU13GakECtwsyms6Ku
        71R75TaN1MOGORS4NzZyBHF3JQelUUUk9w==
X-Google-Smtp-Source: ABdhPJxcwvKzFlG03y4UwEFL3La1o4zq+/k5j1GZWA57CcjSYNzcbGyHJWBxsiYggRiHDDfzhSfhAA==
X-Received: by 2002:a1c:e244:: with SMTP id z65mr6212143wmg.130.1615212282984;
        Mon, 08 Mar 2021 06:04:42 -0800 (PST)
Received: from dell ([91.110.221.130])
        by smtp.gmail.com with ESMTPSA id u3sm18835619wrt.82.2021.03.08.06.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 06:04:42 -0800 (PST)
Date:   Mon, 8 Mar 2021 14:04:40 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Luca Ceresoli <luca@lucaceresoli.net>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] mfd: lp87565: fix typo in define names
Message-ID: <20210308140440.GH4931@dell>
References: <20210219223910.1831-1-luca@lucaceresoli.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210219223910.1831-1-luca@lucaceresoli.net>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 19 Feb 2021, Luca Ceresoli wrote:

> "GOIO" should be "GPIO" here.
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> ---
>  drivers/gpio/gpio-lp87565.c |  6 +++---
>  include/linux/mfd/lp87565.h | 28 ++++++++++++++--------------
>  2 files changed, 17 insertions(+), 17 deletions(-)

For my own reference (apply this as-is to your sign-off block):

  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
