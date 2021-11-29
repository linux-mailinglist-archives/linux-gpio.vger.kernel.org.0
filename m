Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F31C046161D
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Nov 2021 14:20:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377773AbhK2NXM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Nov 2021 08:23:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229953AbhK2NVJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Nov 2021 08:21:09 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89C68C07E5F7
        for <linux-gpio@vger.kernel.org>; Mon, 29 Nov 2021 04:03:16 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id j3so36267737wrp.1
        for <linux-gpio@vger.kernel.org>; Mon, 29 Nov 2021 04:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=9Dc/iG+ktAxKNzmT8TfQ9f8djyDVfbbGG7SZtfMUUC0=;
        b=D6KK2C4hTMnF9Ds8wmygY9WOGFq+Z+eOzalBiPuUVUVl0PQzqQEp6tKvT8EDRdquPd
         oVCqAXXOOSL6hrmjrBWoG8tLAVhlDgB3f112bHxQcTeIQ5gzJ0KtqRw/lPAbkuVW5BP9
         SvN9lmOtg2XRyd3Jbadqp7uHxi4pXpB6upAbYzoJuIoXjhDmtypiK3wvLWEZoJi3Znn6
         70dBOFUyFPXNTZH4PW3MYdzfKBsczBRKRQ6Wq+8et6l0A1f5fJRJkKLWybmgYozxejYS
         VEKYHvXzWfAdO79pUw2P9IkJE55g6+6TGyLpOanPweuWgGQCJfym7UtGbQzpZyVT5fVt
         CZCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=9Dc/iG+ktAxKNzmT8TfQ9f8djyDVfbbGG7SZtfMUUC0=;
        b=l04aJt+GMZBLZzawWo+Cgvf2lBQNhldfR6N/J6WEsm8824iaeGTWEToWG/8oDcvw3t
         teQoAa5x6dujNfL2h0e1+I00hid9ARSzt8viq5qGXF19vNBVankQNU4u0yWe+xNMYmCt
         KPkyTKU3zg1es+7HmxMzcTUBwU/IaIDRL8Ws6ycys+SWiYk/by1Jd12gj1ZxwJrSv/jC
         oCeZMBLPsuH9h0VGxpA5vzWa3cKsr7EH6NarQh5qZPrBA+oZ53H7dHIhb4BbNGrs7R2D
         QEdHr3CDVxLrj4hScvOl21LyDVeSagI0PCkdPdt8W0DNtUSK7WVXg2Re6ElzW2E3dlzM
         +s3A==
X-Gm-Message-State: AOAM530xnXB3Y/g3Kz2rjTvxn04Sal1jb1ERfs/UDMI270vorf7Bm4t8
        I33pfoIypu69l3B1OjZ8iYHTRw==
X-Google-Smtp-Source: ABdhPJwhYvYhaxhwlxS+w6L0D3y8AaCDYKbNspMO1hyFG4E8A5s290sdFXWWgRPk7ZVy3MGQrWy1vA==
X-Received: by 2002:a5d:63ca:: with SMTP id c10mr33559892wrw.124.1638187395188;
        Mon, 29 Nov 2021 04:03:15 -0800 (PST)
Received: from google.com ([2.31.167.18])
        by smtp.gmail.com with ESMTPSA id n32sm24506264wms.1.2021.11.29.04.03.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 04:03:14 -0800 (PST)
Date:   Mon, 29 Nov 2021 12:03:12 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     Matti Vaittinen <mazziesaccount@gmail.com>,
        lukas.bulwahn@gmail.com, Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-power@fi.rohmeurope.com
Subject: Re: [PATCH RESEND 4/4] MAINTAINERS: bd70528: Drop ROHM BD70528
 drivers
Message-ID: <YaTBgOBbUsm5uVY3@google.com>
References: <cover.1637066805.git.matti.vaittinen@fi.rohmeurope.com>
 <90b0565c0eb9429b0962f08d45292a5a9ebe5cea.1637066805.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <90b0565c0eb9429b0962f08d45292a5a9ebe5cea.1637066805.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 16 Nov 2021, Matti Vaittinen wrote:

> The only known BD70528 use-cases are such that the PMIC is controlled
> from separate MCU which is not running Linux. I am not aware of
> any Linux driver users. Furthermore, it seems there is no demand for
> this IC.
> 
> Ease the maintenance burden and drop the driver.
> 
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> ---
>  MAINTAINERS | 8 --------
>  1 file changed, 8 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
