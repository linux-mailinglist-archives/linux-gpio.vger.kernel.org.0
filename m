Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AD8F21809E
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2020 09:17:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730144AbgGHHQy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jul 2020 03:16:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730049AbgGHHQy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jul 2020 03:16:54 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7333C061755
        for <linux-gpio@vger.kernel.org>; Wed,  8 Jul 2020 00:16:53 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id 9so52884886ljv.5
        for <linux-gpio@vger.kernel.org>; Wed, 08 Jul 2020 00:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QkfJYzPGnOMpKG+ZFcmubOHnwB8gAssiAAxbH64D1Os=;
        b=v23iSweXgVsXKUdOxxg/lno3rnKJT5so4Q1FckB4o54uePZGBH6Bv5dwLjdKxdoHyF
         Ire9DkQ0wSOBZ/6+Jg0AAYC8wtkDKf9/siUYTIZlgUbzqixFTP6895Ra1GAk6YCFuohl
         x+y6i/RbUv3YdzwivmLgScI07z0O8dweZdrBp3weUksD0J3EzNTxc7Hz0lXYE8K+TP3X
         w6vLfF4fvpDjs4j7dxgXrgeMh5hlwNXsGxQgWwtEM83O7OTsu5RiGQhltl1N1vEznQW0
         lGAHJO34oeAR5ItX7GtTa8pCAwAUodck/cFiyzl8m1xuauaxTJ+jdoQUA5tXtLqxzwjR
         Za/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QkfJYzPGnOMpKG+ZFcmubOHnwB8gAssiAAxbH64D1Os=;
        b=M7+5bruVJuRjypYoiXHAeOH9xHHah2rrQlpJ+0q86p0LKMcFcniXrXiBSu4jZJW/BP
         GFTxR/DP9MtJhY7Qd+wTtcFR7bMx31lI6zqBq73JlzGyD8IDl2CVJnG/FLMlsUT8CKZm
         5KAUU8c4UXf4JX+n0JipY2cDE/b9WXCcJIu4zD+dtFjFVYz2DFG3QXXKSxfkILEPQym9
         gKohvkVbQZF7d7If9Ruq0LTUX57vHRj3c7vdXlUuAV4U5t+aX9lLHFb5yZgmsuOAY5OV
         we0NiA4JHi5tqPVniZfWh8VnpxTA5An1crdGWCwffsJzTgCR4JD1U1QifI53DtRjYnHz
         VgqA==
X-Gm-Message-State: AOAM530AhCz0a9H9Eo5xOWKeCsUC2fPjV2t/dP3SxqgtTcwmWphPnxK8
        a5+ta/xjeq7a7uj82BDExVnAMWHL0HHrNSSfKh/k8Q==
X-Google-Smtp-Source: ABdhPJz/BY0ubh5lFlvcwaCxE8m83cbsKbPYMczIH7G8X19q2JkKCkjg6IDxFGQ4sceQqyL82aY2xnRQoeGrU76PwIQ=
X-Received: by 2002:a2e:810a:: with SMTP id d10mr26808667ljg.144.1594192612283;
 Wed, 08 Jul 2020 00:16:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200630133345.2232932-1-lee.jones@linaro.org> <20200630133345.2232932-5-lee.jones@linaro.org>
In-Reply-To: <20200630133345.2232932-5-lee.jones@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 8 Jul 2020 09:16:41 +0200
Message-ID: <CACRpkdbUpWSNur2thrZ4Cea-eNazMopcQRt5uc9cyKOuHX4dBQ@mail.gmail.com>
Subject: Re: [PATCH 04/10] gpio: gpio-pmic-eic-sprd: Fix incorrectly named
 property 'map'
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 30, 2020 at 3:33 PM Lee Jones <lee.jones@linaro.org> wrote:

> A good attempt has been made to properly document 'struct
> sprd_pmic_eic', but 'map' has been incorrectly described as
> 'regmap' since the driver's inception in 2018.
>
> Fixes the following W=1 kernel build warning:
>
>  drivers/gpio/gpio-pmic-eic-sprd.c:65: warning: Function parameter or member 'map' not described in 'sprd_pmic_eic'
>
> Cc: Orson Zhai <orsonzhai@gmail.com>
> Cc: Baolin Wang <baolin.wang7@gmail.com>
> Cc: Chunyan Zhang <zhang.lyra@gmail.com>
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Patch applied!

Yours,
Linus Walleij
