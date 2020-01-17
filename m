Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1275E1406C1
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jan 2020 10:47:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726587AbgAQJph (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jan 2020 04:45:37 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:42744 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727026AbgAQJph (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jan 2020 04:45:37 -0500
Received: by mail-wr1-f65.google.com with SMTP id q6so21923392wro.9
        for <linux-gpio@vger.kernel.org>; Fri, 17 Jan 2020 01:45:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=w7L79aO9Rjvj7e/M8+iEMEEveQjjR2gbYrDBVwpUq9o=;
        b=AU3Q0YFzNGFnPl2im0TCXiz0kZFmI4e+nD/ve/eF7yLahrW8d++UrxFPzBjRAJPjAt
         3CleXkagBfSe7EGUCZPhWUbiShEnyyHrPrus7owRa1tZOvc4X4kaNjIm53FBH32vCdwG
         25tPQ1kvVoexoNpJIaRWvNg2uWqNNyPXCJuNqfxeDLC7kgMcjtExtrbn461hmX6o18eR
         z/ueZhZev7ROxyx9EbAymf9GEFAhzTK4nHniaUpDbfhIByHXJ0hyrft9qnPcpy5p2FMG
         74m+7xkanZFcxFe402+tUM6mHCxZylTOvv/7KMCQ/A0R9+xhf7ycwKJU7FApZShjHLm4
         ee7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=w7L79aO9Rjvj7e/M8+iEMEEveQjjR2gbYrDBVwpUq9o=;
        b=RP0bj7SltzbMENb1FS/2fbCrhb+diRLQu0MnyR42Bxr4jbyxAxBsbO0HbNzH61eerD
         81tIrlwNJg8+xUgXS4RKtJoWCpXs4w2pUqLmR7fC/q2ZNv537GV9jRtzGRmh5qzzHtEB
         l8t1mXMspctTSGFWbfbAOKA73Ubghv5yiEa/lTcq4xeHY/yTXu0YCg1hhmce1bMgc/Vk
         LqPDspnNf35Uk4M4J02VqiibIgH7tkna/Er1eISnod40lxf4f2M7NxZp51BAmv2+mxq4
         5pj55ikyCZLnNgmGN1L20pArX1mnwa3ex2E89cQ7vNcLtPleN1VrzpnfDk8pFZcAGFM8
         RcYQ==
X-Gm-Message-State: APjAAAXATDA04yA73KR5i0pU7OJKAIIXe6M+uJ0VLb/EnCEElWJOUWaf
        BAGY/7MNXVfGenMTzWjD50WT0Q==
X-Google-Smtp-Source: APXvYqy+oGT4r2HmL/m9cMbiZkerRGNi6pZOIoPtR3pUfPUq2DITG2EHd/C0t3kP+W5BHPUU07E6Wg==
X-Received: by 2002:adf:f3cd:: with SMTP id g13mr2177501wrp.54.1579254335984;
        Fri, 17 Jan 2020 01:45:35 -0800 (PST)
Received: from dell ([2.27.35.221])
        by smtp.gmail.com with ESMTPSA id u1sm3606795wmc.5.2020.01.17.01.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2020 01:45:35 -0800 (PST)
Date:   Fri, 17 Jan 2020 09:45:54 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     support.opensource@diasemi.com, robh+dt@kernel.org,
        linus.walleij@linaro.org, Adam.Thomson.Opensource@diasemi.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@pengutronix.de, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v4 2/3] mfd: da9062: add support for the DA9062 GPIOs in
 the core
Message-ID: <20200117094554.GB15507@dell>
References: <20200108104746.1765-1-m.felsch@pengutronix.de>
 <20200108104746.1765-3-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200108104746.1765-3-m.felsch@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 08 Jan 2020, Marco Felsch wrote:

> Currently the da9062 GPIO's aren't available. The patch adds the support
> to make these available by adding a gpio device with the corresponding
> irq resources. Furthermore the patch fixes a minor style issue for the
> onkey device.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> Reviewed-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
> Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/mfd/da9062-core.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
