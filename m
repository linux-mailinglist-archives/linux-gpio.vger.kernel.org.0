Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9FFB4110BC
	for <lists+linux-gpio@lfdr.de>; Thu,  2 May 2019 02:47:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726173AbfEBArB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 May 2019 20:47:01 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:42406 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726126AbfEBArB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 May 2019 20:47:01 -0400
Received: by mail-oi1-f195.google.com with SMTP id k9so334494oig.9;
        Wed, 01 May 2019 17:47:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ZfecKHRTvytAcXcFmOEVdj1Q7ZztnHj3r4gQ49oisAc=;
        b=K3h2fsOPt92gYOisKOF6WDsXhkEMQ5ycQ4xD/lo42da2ZiGLO/J3I/LPgj9KGJwxUZ
         pT4t8TP39YwyEPe0ptbPGCMv3CzPnTMabJHXko/egTjJmBK5aRWeaYUFqt+4eAt+fKNf
         JV5BUhl+YsXHkzlnuxOszPUOq9fxODMDfDTfLSzP9sUSTg20eWdMVAhYWdtpyLbdwbSL
         Q8OG83H5Wev3m3w3TZSz06z+g5EBsRJrBZyMFOOfVBktQXH7pFPsmRP0M0CG90wyWRRI
         78e72cqS/xjTaSisZq3jenayulQHDtPZC1bGXmajSuP8vc7J/7EZNtV628rEkXXTqNDk
         p5Ag==
X-Gm-Message-State: APjAAAUhRbqbwu+jPvalr50DZqrE5YzJ/OFR+xZkDrI9AFy2a+UBPdTY
        GdNmBO8F7X00Uje31a9sOw==
X-Google-Smtp-Source: APXvYqwZOXC3bhODKwX9GdJwJv46yY0GEgdpowddpiAfUtST/M1BCCeX1pmPyLY8GVmBTQHTGjV4YQ==
X-Received: by 2002:a54:4f15:: with SMTP id e21mr722322oiy.122.1556758020405;
        Wed, 01 May 2019 17:47:00 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id w5sm2172745otg.34.2019.05.01.17.46.59
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 May 2019 17:46:59 -0700 (PDT)
Date:   Wed, 1 May 2019 19:46:59 -0500
From:   Rob Herring <robh@kernel.org>
To:     Krishna Yarlagadda <kyarlagadda@nvidia.com>
Cc:     linus.walleij@linaro.org, thierry.reding@gmail.com,
        jonathanh@nvidia.com, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, pdeschrijver@nvidia.com,
        josephl@nvidia.com, smangipudi@nvidia.com, ldewangan@nvidia.com,
        vidyas@nvidia.com, Krishna Yarlagadda <kyarlagadda@nvidia.com>
Subject: Re: [PATCH 1/2] dt-binding: Tegra194 pinctrl support
Message-ID: <20190502004659.GA8049@bogus>
References: <1556247378-3335-1-git-send-email-kyarlagadda@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1556247378-3335-1-git-send-email-kyarlagadda@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 26 Apr 2019 08:26:17 +0530, Krishna Yarlagadda wrote:
> Add new compatible string and other fields used in pinctrl
> driver for Tegra194 in nvidia,tegra210-pinmux.txt
> 
> Signed-off-by: Krishna Yarlagadda <kyarlagadda@nvidia.com>
> ---
>  .../bindings/pinctrl/nvidia,tegra210-pinmux.txt    | 43 +++++++++++++++++++---
>  1 file changed, 38 insertions(+), 5 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
