Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AFA9B187D3
	for <lists+linux-gpio@lfdr.de>; Thu,  9 May 2019 11:33:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726716AbfEIJdp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 May 2019 05:33:45 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:43500 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726526AbfEIJdp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 May 2019 05:33:45 -0400
Received: by mail-wr1-f68.google.com with SMTP id r4so2002801wro.10
        for <linux-gpio@vger.kernel.org>; Thu, 09 May 2019 02:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=o7y1Eq5XE68bwd6aXqoeahdc2GOPTkNRx2HYwO3zXRM=;
        b=MGyl/NoSKew0c+r/VW5jKj8+RY1Be0lr7+iIyBpWo2JyYY2+4Zj0KIOT5UyS2IH7p6
         Xl8Db2PnGHM3+pD5QLCTzzpzGSmEtTFTZ6XOaQOj2ECmn0uQBKyeIxF4HZBVzRqUiJI2
         NEDAmdlp9PxYJcXxwi7whT1QkFYbEdWMx6tV43o4yLEvaQyl/FMlzPKNIZr4j26kLmou
         amPYy2ATk+pcA9Lju+4267nyRZtaBxE1pCly3geHfLV8Bl8qMtI3tyJAkYKyWCIXlAY2
         nu6Mdw5YSWjgkIa1xZ/wflstOgUkvca0cuPgMnpdZ+lPpSfs8EDVYQWEFaBKZ397A7hp
         Bz7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=o7y1Eq5XE68bwd6aXqoeahdc2GOPTkNRx2HYwO3zXRM=;
        b=sZPD020SbvCpxsI1nNOtvth5w+mm1p6H6DYhYkrFIUR0rpFXKrf+VWahTRR2rU1+ru
         S+C1Qv556vGJ5Gl3WVd6XVzlJq0mHCoQK+Nr9zTUUL/SQSEBxsMQ9oO6tEIgSQJCBFTL
         q2ReS8iV+iihG5xfN5sDw44jHsCYPwY8rQ7W2yOPjwZpbIf16u4tpotxfPvHET6jIzTS
         BeuectPJ0/rAWzmBDGFcE9vNQAD2kkM4fHJflgrQ/AjJjpKfw3yorC/aRHLS1OJ3RQjw
         l3hLhvXyquOLCRsLGLTJWdFPB96BNIc84eG0WNIBaKp/8HyrRJsv55YLTI+5QIO7kE3Y
         0PMQ==
X-Gm-Message-State: APjAAAUK/HGDsSDajqeiSNT/QjEOoUuzrvc+XIVqNDLc/sQJkMYgy5z/
        J2QWZOyOTYZkATplyl4kUFiMGw==
X-Google-Smtp-Source: APXvYqyaoHx3f0sqPQbDtBs8Z9JyejUps85iOp6Wh0y/gQuPQM64c/u7mmfNhXTMA9EEM9TWbH/fpA==
X-Received: by 2002:adf:ec51:: with SMTP id w17mr2358350wrn.326.1557394423897;
        Thu, 09 May 2019 02:33:43 -0700 (PDT)
Received: from dell ([2.27.167.43])
        by smtp.gmail.com with ESMTPSA id u8sm1141266wmc.14.2019.05.09.02.33.41
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 May 2019 02:33:43 -0700 (PDT)
Date:   Thu, 9 May 2019 10:33:38 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Amelie Delaunay <amelie.delaunay@st.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v6 2/9] mfd: Add ST Multi-Function eXpander (STMFX) core
 driver
Message-ID: <20190509093338.GW31645@dell>
References: <1557392336-28239-1-git-send-email-amelie.delaunay@st.com>
 <1557392336-28239-3-git-send-email-amelie.delaunay@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1557392336-28239-3-git-send-email-amelie.delaunay@st.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 09 May 2019, Amelie Delaunay wrote:

> STMicroelectronics Multi-Function eXpander (STMFX) is a slave controller
> using I2C for communication with the main MCU. Main features are:
> - 16 fast GPIOs individually configurable in input/output
> - 8 alternate GPIOs individually configurable in input/output when other
> STMFX functions are not used
> - Main MCU IDD measurement
> - Resistive touchscreen controller
> 
> Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
> ---
>  drivers/mfd/Kconfig       |  13 ++
>  drivers/mfd/Makefile      |   2 +-
>  drivers/mfd/stmfx.c       | 545 ++++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/mfd/stmfx.h | 123 +++++++++++
>  4 files changed, 682 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/mfd/stmfx.c
>  create mode 100644 include/linux/mfd/stmfx.h

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
