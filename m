Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C227445B691
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Nov 2021 09:31:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229754AbhKXIe5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Nov 2021 03:34:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240231AbhKXIey (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Nov 2021 03:34:54 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB85CC061574
        for <linux-gpio@vger.kernel.org>; Wed, 24 Nov 2021 00:31:44 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id 133so1524078wme.0
        for <linux-gpio@vger.kernel.org>; Wed, 24 Nov 2021 00:31:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=DW3Sf6N08lASOSXUzYPT8aFLQNqv9Hi7A0DiwupYUUQ=;
        b=BmHxxW7X/tvxf/nSHyRfiuPj1VT+oWKl2i8kAerlSfQRf1HdkXEwxHgymLIadzGHlD
         kOuGkXHLCVFW6jLQ59owRW4vXBDt7ZRAL5YRn44vCMSsTz/2k/sWI0DpgpFEQhEX1ZJy
         KRiYpeJbaahzaMPrkG7M4h9nVfMEzQm22rIoi4IceE0bCZa5y3CTeq/TYx4NR2yBGyPg
         a2M2KEY1pzfbzSQixNKKhIOz1F0pLio8AXLQ6JqyDpdnyf6sVcpviZ7ygTT4DttPO3tt
         67tj3i2QlT19+N/7DgLClLAChNQOnDuTSXI7NfK9oj+A659wKFwbhIQr/uOsSEHo5lhf
         Mg2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=DW3Sf6N08lASOSXUzYPT8aFLQNqv9Hi7A0DiwupYUUQ=;
        b=kXq9yAMO+9tFUQtz4hDq5tS0U5nLbhC7ppbw+OBLfIPfQaP4IhxgkBYP8tFeUlvPdt
         Szxfj6B50O0BCtCj/JrPeG3OHgHlxCbdmcwdHkSdCHZXpJpfR9LPdMyEbnnfGjjzup9h
         u0X8EMqRBFcNvequP1+RZ9AYdZNY1uRpN2Yb9OjTO0u75qyKr7UACO4+97EV/IX37W0H
         Fb2sw1/bgOWcBkpvavGnkqBr43xE/H8/ndZfiLU/XlcbhQlqcddD9vRlMuP7fsc74FtS
         7kAVHQKs8B8X5LSDdcp7jKUXJYma49PVP7QYvGKdmtVxf4ApZG2KQ79gOXb+t6R+31QO
         LfIQ==
X-Gm-Message-State: AOAM530wXlUUj4SLBJnpQDvNq0Zk8B6E6OrR8Qny0jD5dBqnCT1Ut2Tx
        0mWX1w6UNbnEtESlqNywfNzFz6jwDdFsiQ==
X-Google-Smtp-Source: ABdhPJzfVep1URruA7K5k+2NV1XeEYFS5nhEMm82YeqbNJV0pBOOFtWWBBhhzFPpA0E8Rkae2jacYA==
X-Received: by 2002:a7b:c452:: with SMTP id l18mr12833136wmi.46.1637742703325;
        Wed, 24 Nov 2021 00:31:43 -0800 (PST)
Received: from google.com ([95.148.6.231])
        by smtp.gmail.com with ESMTPSA id d9sm14150225wre.52.2021.11.24.00.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 00:31:42 -0800 (PST)
Date:   Wed, 24 Nov 2021 08:31:40 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Ed Schaller <schallee@darkmist.net>
Cc:     linux-gpio@vger.kernel.org
Subject: Re: [PATCH] mfd: intel-lpss: Add Intel Lakefield PCH PCI IDs
Message-ID: <YZ34bDVWS8PLV0yp@google.com>
References: <20211123180114.GA4747@darkmist.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211123180114.GA4747@darkmist.net>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 23 Nov 2021, Ed Schaller wrote:

> Add new IDs of the Intel Lakefield chip to the list of supported
> devices.
> 
> Signed-off-by: Ed Schaller <schallee@darkmist.net>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> ---
>  drivers/mfd/intel-lpss-pci.c | 7 +++++++
>  1 file changed, 7 insertions(+)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
