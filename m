Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C69B211E220
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Dec 2019 11:38:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726463AbfLMKi0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Dec 2019 05:38:26 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:38396 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725928AbfLMKiZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Dec 2019 05:38:25 -0500
Received: by mail-wr1-f65.google.com with SMTP id y17so6095782wrh.5
        for <linux-gpio@vger.kernel.org>; Fri, 13 Dec 2019 02:38:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=3PajvE4U89zM4c9b6Z3Ov4BIDK06c8U6cfU/TzH08+0=;
        b=QJtcK5Q98jqQJctfBclFZQgZwwjBBe7trS9gB4hCyVLX3tSbswC2f7apFDXDdc9FCk
         bSiTeoS6TmFJk+AoYOVNAxjSj25sxM3IAj1qt5RBisbzi3o78OJCAe1jJkZGYW/Lqo5C
         DIgWzmDnWmVzjy7AQogXRIMEdKq/kaZjpffj1pcYmTCEHAhkXsezVJYs5b7BDgb4j4Fz
         Mes6GeXbvTrZ1qvmx1RK/WBPqrmY3M7jsf936VM6Bg3ATsNAxkGd5iNk0L6Or7lphiEV
         TU/obVxMZGB6aqGUkXJke/FZofhldvEIfoWJfQWeMudqfsPlxxaPi2IZn6bwJfrEeHC0
         KqZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=3PajvE4U89zM4c9b6Z3Ov4BIDK06c8U6cfU/TzH08+0=;
        b=ormDaThUnx62uS8wIeHwL72SXBEPt4KpPrfh90wlxjZVmn+BkLJivMVFfBgx5fFNQ0
         lu5oyknhbYpdcsfX2IwL86UdJVqMM1CkFtPBH/aGY/ZDOz3a4F93MEvcUBtxt/7F12+D
         AojaFC4v2wBlSNJ8A07oz4JU57aF0Wp8f/BljzF1qA2qiqfTT/N2qSVYw5GktqYznp3E
         /fgj+reJ+ytFvYjRmjlReDsM+OGStVHB5HN89dbV7S8oU9tfDv5Rzkr+nMpz6cKYlH6o
         s+HUTDzE0ju9VcwWXcoDwCrMVR2lAteiPIJRYq2LNlauJkFuykra8eKA46eEVwU6wy9Y
         x0yg==
X-Gm-Message-State: APjAAAWVdWFABb3RPnPd0F45lVoea6JvPvnVtL7X2+vFn2xlRJ2FmyKf
        QV8xS86eMLfsdR7vgk2O2UEdDA==
X-Google-Smtp-Source: APXvYqwSlwN/xryi9wsN+GWdpVYtgcBzeElei/4HaQPkIFno6ZioimPpsoWMIS9mGO3ma6clldo8Og==
X-Received: by 2002:a5d:6390:: with SMTP id p16mr12186910wru.170.1576233504648;
        Fri, 13 Dec 2019 02:38:24 -0800 (PST)
Received: from dell ([95.149.164.71])
        by smtp.gmail.com with ESMTPSA id m7sm9626326wma.39.2019.12.13.02.38.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2019 02:38:24 -0800 (PST)
Date:   Fri, 13 Dec 2019 10:38:21 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     support.opensource@diasemi.com, robh+dt@kernel.org,
        linus.walleij@linaro.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [RESEND PATCH v3 1/3] dt-bindings: mfd: da9062: add gpio bindings
Message-ID: <20191213103821.GC3648@dell>
References: <20191212160413.15232-1-m.felsch@pengutronix.de>
 <20191212160413.15232-2-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191212160413.15232-2-m.felsch@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 12 Dec 2019, Marco Felsch wrote:

> Add gpio device documentation to make the da9062 gpios available for
> users.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
> Changelog:
> 
> v2:
> - remove sub-node documentation
> - squash gpio properties into mfd documentation
> ---
>  Documentation/devicetree/bindings/mfd/da9062.txt | 10 ++++++++++
>  1 file changed, 10 insertions(+)

For my own reference:
  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
