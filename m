Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7838042FF3C
	for <lists+linux-gpio@lfdr.de>; Sat, 16 Oct 2021 01:54:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239162AbhJOX4U (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 15 Oct 2021 19:56:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239379AbhJOX4L (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Oct 2021 19:56:11 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0F9BC061776;
        Fri, 15 Oct 2021 16:54:00 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id y12so45725407eda.4;
        Fri, 15 Oct 2021 16:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6VJ+9sIi1sqUsRf5nSziAM0Dhgkx6JgfPmLuGEZTces=;
        b=H63SeNNPhxbZ4wC7PPU0lHqQx61e8P4OAK+AAPDv5gblrGbDXBYKjhgWO57hTx1kVS
         orr3t90pArPAQI1W78i0x9ahucKgECq1IoC1shjPc9u0cAxrgMlfatpXX32sAJi21VUZ
         09I5AKOaQT8di2kM3eN107rMkUQfw9zZ8zqB9wPSQprZke5QM/YJBUTRC+T3vT+kXq/w
         xNU4sjsufpWnOzcGzIeKt1pZFGapPj+NiL+qy7EifGrYqRAQ1KNsmv2Ewfd4sAgQ1ZzU
         vFoQuDByjS4Evg0/htdw6+fcFclHTt3b0/b8T4hwrAwfl4cZ/SR8mIrMVEuER/Q98LEY
         6N/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6VJ+9sIi1sqUsRf5nSziAM0Dhgkx6JgfPmLuGEZTces=;
        b=BB4r7rhPTi5k9NQLq8be2uqeOUczItpgPWBfRgeKSNcs4w1qwqwcUrNwHyR2lfqQsd
         fHMDlfHLu0XGnm2VXwuA8VGal6jDZFwLaF0kjq8DzGMBma3SbgGFudDGWEkq8pJV3sTI
         NnckBmBZf0uHNTe5YJFVU019lSEDGex+o9GgRM7JfqfAoUVPDtbPNC/UdBAQELZ3UWIE
         iy0AF7shYQ5LA932Zy3wdbBktcGw7+F9wU/XKTiT8tvPfwVdqKfPE9Mv+JTJ/+3RKUwB
         yyP+CYJ2yBvmslHor1NH6PFTPGlJp4c3Xf8VM20qsH3+Xf/zfi0DMR164LhT1cO3WXbl
         83MA==
X-Gm-Message-State: AOAM532oRF301u9D73+KcItFOIWWO7vH7RqsoZTPCUcF9U1hFsacX6TG
        elitzVbeZdPPsqqH2u1Qnwo=
X-Google-Smtp-Source: ABdhPJyTrSsc6NLGRHfgdV896wTJdHWXVRCYx5XN2+d4sdnnapwSJ9/SuKFBv81HwNIKcajw1OYtVQ==
X-Received: by 2002:a17:906:f8d0:: with SMTP id lh16mr10030127ejb.367.1634342039511;
        Fri, 15 Oct 2021 16:53:59 -0700 (PDT)
Received: from p14s ([140.238.219.56])
        by smtp.gmail.com with ESMTPSA id nb29sm6357942ejc.54.2021.10.15.16.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 16:53:59 -0700 (PDT)
Date:   Sat, 16 Oct 2021 01:53:56 +0200
From:   Joerie de Gram <j.de.gram@gmail.com>
To:     Mario Limonciello <mario.limonciello@amd.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Nehal Shah <Nehal-bakulchandra.Shah@amd.com>,
        "Rafael J . Wysocki" <rjw@rjwysocki.net>
Subject: Re: [PATCH] pinctrl: amd: Fix wakeups when IRQ is shared with SCI
Message-ID: <YWoUlGFMWAXTvMuR@p14s>
References: <20211015144332.700-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211015144332.700-1-mario.limonciello@amd.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 15, 2021 at 09:43:32AM -0500, Mario Limonciello wrote:
> +			if (irq < 0 && !(regval & BIT(WAKE_STS_OFF)))
> +				return true;

Shouldn't be negated. WAKE_STS_OFF is set on wakeup.

With that change:

Reported-by: Joerie de Gram <j.de.gram@gmail.com>
Tested-by: Joerie de Gram <j.de.gram@gmail.com>
