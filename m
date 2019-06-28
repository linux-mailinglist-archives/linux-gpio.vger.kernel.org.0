Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 359885A2F9
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2019 19:59:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726889AbfF1R7u (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 Jun 2019 13:59:50 -0400
Received: from mail-pg1-f176.google.com ([209.85.215.176]:37376 "EHLO
        mail-pg1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726672AbfF1R7u (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Jun 2019 13:59:50 -0400
Received: by mail-pg1-f176.google.com with SMTP id g15so1021241pgi.4
        for <linux-gpio@vger.kernel.org>; Fri, 28 Jun 2019 10:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=Of1JaN7sHuZfD0NstaLTd2MzqkoQNU+dB9/U+AM5Bdc=;
        b=Hz0aXYf9FNAepuCVFV167R3gAlxBZ41oQ5OOcua47PXfGIdizOWCfV7tUZJE3QgyE/
         rQLoSx180BgnxwlNgVTpQ4Ig+1Xn1VJoIeTgLsNDp2QQxn6WDq1x+YB4YdmWR1WRSEYI
         fWBIw7gApvr5ABgJvq1W+dx/05+xPrT5pRWc28UcKWjgAkPgDOoeyClRAvTuoAUW72Cf
         3dQPhidbgh7UAQ/wW9+OU+yw0I4jRXfps1zfC6+2QY+vRwyd5O8DiX8senYHiYvw9jue
         5l1RCL0un8DiyEfOgErem33EsWOke5gka4sQlT7+fIWwWP3Q/BbUKGSoQb7/N7qJTbea
         brMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=Of1JaN7sHuZfD0NstaLTd2MzqkoQNU+dB9/U+AM5Bdc=;
        b=DWFxDTz2BK+SJDr3MF0T0ser97uXij6DWviuVSEMD/QZchE+oZhqcFtmjdW5VLWilu
         CF7SuT2Z4wSKYhgLyqIOla2hpqLRZN3W/PFy7NuSpulDsKD4UIGbPB2tcO8uNp9r60J/
         AoIY/BrSCg8iqTsvbnNDlfMc/4s4iHwfgVHxb1PcqwUEWpFistFsAX/okQNL4OYhWvFi
         pdjS+htYOrRjkUFpbnYDcEdalq6cJedfpYtFOfss5qGbWVgengWke6mxz8zrQLS7Ch18
         fsSKTza+Ij3yqaLKEX70TGTDq9my5PFpTKBC3YtprwXj3dE8a9/o2L0ndk40bsmly1Oo
         bIHA==
X-Gm-Message-State: APjAAAVaHfoB1wm0S0HVosVMRRMO1wk/T/JpxarlczgOswmzshfBGs25
        b+5h1h72xWWvg0xgChhcBmcpDg==
X-Google-Smtp-Source: APXvYqzVm3ctFoObBMm0Kx/+AEZc0kKotlZRvKqXLokKmAqQl+Yz8kBBvBT8Pkq4aB9NKrit17xIEw==
X-Received: by 2002:a63:3d8d:: with SMTP id k135mr10798175pga.23.1561744789355;
        Fri, 28 Jun 2019 10:59:49 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net. [71.197.186.152])
        by smtp.googlemail.com with ESMTPSA id s66sm2933246pgs.39.2019.06.28.10.59.48
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Jun 2019 10:59:48 -0700 (PDT)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>, jbrunet@baylibre.com
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, martin.blumenstingl@googlemail.com,
        linux-gpio@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [RFC/RFT v2 01/14] pinctrl: meson-g12a: add pwm_a on GPIOE_2 pinmux
In-Reply-To: <20190626090632.7540-2-narmstrong@baylibre.com>
References: <20190626090632.7540-1-narmstrong@baylibre.com> <20190626090632.7540-2-narmstrong@baylibre.com>
Date:   Fri, 28 Jun 2019 10:59:48 -0700
Message-ID: <7hmui1r3or.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> Add the missing pinmux for the pwm_a function on the GPIOE_2 pin.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Reviewed-by: Kevin Hilman <khilman@baylibre.com>
