Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B6A01D9022
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2020 08:33:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726943AbgESGdW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 May 2020 02:33:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726905AbgESGdV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 May 2020 02:33:21 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECD5DC061A0C
        for <linux-gpio@vger.kernel.org>; Mon, 18 May 2020 23:33:19 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id l11so14556363wru.0
        for <linux-gpio@vger.kernel.org>; Mon, 18 May 2020 23:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=6ChqgZ+6GPEY+PFM9dB65sRa2LAKBcnlFTeH72Q2v6s=;
        b=QT7+qxIRSs9dBKB8Vgq6xEPCXkmvXsS6JGpmSuFayPKfLWc75L61+FgAtiS1iLjSnr
         HPL6raPCmEv0PqMH0GsUmuRDoxIYQPRv99epRQOy4aT42eRvXfkWsHBkT1R8fq6WyT4j
         de/qCv3InUy87dS4yhg4obvk0HMgSOHeqpcC23e8cmNNpAOZLkDYZbpX5tMXK0CO1dhO
         0bmyMDPJLWVmRqB2Pa7N/GmQIPrm6gJF7EIUSp407f38/Uyu04maH69a8nLf8SXqDiBx
         lBvWIUJd2qxaApxFyDivePifNlJ8eEzXAKPfUZ+GZdu9NGbtdZ5SZtXx0AbK75EZFHS4
         Hy9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=6ChqgZ+6GPEY+PFM9dB65sRa2LAKBcnlFTeH72Q2v6s=;
        b=sqAyngFYIySSw+5HGOTVy/Y2oBrJgm5Xs8y5znUWBJF1AQlE7mJ9nxpNzuCp0VD3xX
         i8fsyHjF36okM4B/Z7QXJ937ZFY0btUcMydTu8v9jiIkiKLyZQLFkzFkM3uYv3OUPh7q
         kmmX0ICASCK2im8RX6D/3VPIVed2mhte1jH6Q1TdqlfrQWefuaxp1HqTC+4BVq18eqyc
         /tr/dCAnnoPMCTZ0C/giIkp9MQ7XeeB/uJod4o0OMQjPI7IXH2fTnVNOO1PKB5fv7o9l
         F0cwzT/kowNArmf5odLG6PfTgKaru8H6pZn/+ouKE+AGhEqIB82rGrwU0YnKo3ugodNz
         L+nQ==
X-Gm-Message-State: AOAM531AeVTmLLaraybziMqGzUVByDb31Le98vezbuW/dIS2hoolD+Qt
        delhMp7HPJJDDknW8/shwlJKSQ==
X-Google-Smtp-Source: ABdhPJwTASBMlOm27z3rhCi0TSF7DKEgHTCQPmMlXzkX/imEXUkoQnB6cqN46of4co4CdUnxJan/2A==
X-Received: by 2002:a5d:6846:: with SMTP id o6mr23733751wrw.384.1589869998548;
        Mon, 18 May 2020 23:33:18 -0700 (PDT)
Received: from dell ([2.31.163.63])
        by smtp.gmail.com with ESMTPSA id p65sm2545604wmp.36.2020.05.18.23.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 23:33:17 -0700 (PDT)
Date:   Tue, 19 May 2020 07:33:16 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>
Subject: Re: [PATCH v2 4/4] gpio: dwapb: Remove unneeded has_irq member in
 struct dwapb_port_property
Message-ID: <20200519063316.GT271301@dell>
References: <20200518174138.19367-1-andriy.shevchenko@linux.intel.com>
 <20200518174138.19367-4-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200518174138.19367-4-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 18 May 2020, Andy Shevchenko wrote:

> has_irq member of struct dwapb_port_property is used only in one place,
> so, make it local test instead and remove from the structure.
> This local test is using memchr_inv() which is quite effective in comparison
> to the original loop and possible little overhead can be neglected.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Serge Semin <fancer.lancer@gmail.com>
> Cc: Lee Jones <lee.jones@linaro.org>
> ---
> v2:
>  - fixed compilation error (kbuild bot)
>  - added Lee into Cc
>  - moved memchr_inv() here (Serge)
>  drivers/gpio/gpio-dwapb.c                | 14 +++++++-------

>  drivers/mfd/intel_quark_i2c_gpio.c       |  1 -

Acked-by: Lee Jones <lee.jones@linaro.org>

>  include/linux/platform_data/gpio-dwapb.h |  1 -
>  3 files changed, 7 insertions(+), 9 deletions(-)

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
