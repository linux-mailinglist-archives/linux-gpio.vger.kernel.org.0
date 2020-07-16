Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E135F22268F
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Jul 2020 17:10:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726963AbgGPPKf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Jul 2020 11:10:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728150AbgGPPKe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Jul 2020 11:10:34 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DC21C061755
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2020 08:10:34 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id j4so7405267wrp.10
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2020 08:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=2m1M98EH1nfWkFNzV2VhpZKvvoVfQRllbm5fo3WQqlY=;
        b=LOendPNIH4Ofg8EGJ+B7ht+ifCEDSJEs0Y7UgjXJxJQUVInRrJUX57gDkVZxGHYjsZ
         huOkeoMfVADRZfQ+hxvRIZr+u5Kw73rUxW0y/W4OQO3t7mbSNpedFbhfSUi/CdqiP++F
         dZ8fMAHU7FhFKiF7paIyQ2XQR8qZlSeLOZeQLJCrzL6hVGpAq3BVRID66H3ssWcMrsNP
         ozgidJwcVDai/+ESiQysfhiLSY1ow3zSgzAp8e/bia4rwkV0FH8pPGVHwWFAYZrzFOak
         KfQ1/2F5dOZyvvoSt2ZCqsvWoyRER02JfoX87tgwcHKwMRAHLtZkyFcIzGaHF3A0DdNz
         VxJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=2m1M98EH1nfWkFNzV2VhpZKvvoVfQRllbm5fo3WQqlY=;
        b=Gu17jDhwjh1e0xF/rC8qdBp94vEOsJMcNB/9Dr4a6WA09VRHSZV4YvdXmO38WTpAPt
         +5qTtu/BHXts7x3NbuoxTlBPOPpyL69mQKGGEpr/nwTqxS+Ksbip9V+xlZ3Gimu9r5Tn
         4beKUrTrMS/SnbokxwVVjvBL5Skh4z7IS0+Wfn09zqe9NHjJKSeVHDaXci1y+3QjwTTx
         R9WKWqLK/99eudcF1V8qtXGHRoVDG7jDDgc1QUDW767lRphjy4ocjIaME/q0h6Q+kf4r
         +E6D4lcyVwOWcrtUo0DD+lVaOXtEIchd42T0rr2pihyNyFeAiZEy2FMqvAIivxcpYEsw
         VIkA==
X-Gm-Message-State: AOAM533HRKmu/hyInMP8IXR6RX7jKmKDHWiRyUZZ1QAqS9ZtYSblZdJO
        4G7rvRaVmgIowqqCLIKm47olxQ==
X-Google-Smtp-Source: ABdhPJwBTtAOhrqKUUqfWPZvxA5XjDD38qzwHlXSFn/QJ+SGDyX9onIUUbkdHZL69xzg75el0nUvDw==
X-Received: by 2002:a5d:55ca:: with SMTP id i10mr5507967wrw.225.1594912233054;
        Thu, 16 Jul 2020 08:10:33 -0700 (PDT)
Received: from dell ([2.31.163.61])
        by smtp.gmail.com with ESMTPSA id w7sm8654363wmc.32.2020.07.16.08.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 08:10:32 -0700 (PDT)
Date:   Thu, 16 Jul 2020 16:10:29 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Frank Lee <frank@allwinnertech.com>
Cc:     robh+dt@kernel.org, mripard@kernel.org, wens@csie.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        gregory.clement@bootlin.com, tglx@linutronix.de,
        jason@lakedaemon.net, maz@kernel.org,
        srinivas.kandagatla@linaro.org, linus.walleij@linaro.org,
        anarsoul@gmail.com, tiny.windzz@gmail.com, rui.zhang@intel.com,
        daniel.lezcano@linaro.org, amit.kucheria@verdurent.com,
        p.zabel@pengutronix.de, clabbe@baylibre.com, icenowy@aosc.io,
        megous@megous.com, stefan@olimex.com, bage@linutronix.de,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-pm@vger.kernel.org, huangshuosheng@allwinnertech.com,
        liyong@allwinnertech.com
Subject: Re: [PATCH v3 10/16] mfd: axp20x: Allow the AXP803 to be probed by
 I2C
Message-ID: <20200716151029.GA3165313@dell>
References: <20200708071942.22595-1-frank@allwinnertech.com>
 <20200708071942.22595-11-frank@allwinnertech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200708071942.22595-11-frank@allwinnertech.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 08 Jul 2020, Frank Lee wrote:

> The AXP803 can be used both using the RSB proprietary bus, or a more
> traditional I2C bus.
> 
> Let's add that possibility.
> 
> Signed-off-by: Frank Lee <frank@allwinnertech.com>
> ---
>  drivers/mfd/axp20x-i2c.c | 2 ++
>  1 file changed, 2 insertions(+)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
