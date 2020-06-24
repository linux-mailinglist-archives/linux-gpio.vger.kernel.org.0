Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 463752074A6
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jun 2020 15:34:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391007AbgFXNeY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Jun 2020 09:34:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390983AbgFXNeX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Jun 2020 09:34:23 -0400
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com [IPv6:2607:f8b0:4864:20::841])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 878FFC0613ED
        for <linux-gpio@vger.kernel.org>; Wed, 24 Jun 2020 06:34:23 -0700 (PDT)
Received: by mail-qt1-x841.google.com with SMTP id u17so1668924qtq.1
        for <linux-gpio@vger.kernel.org>; Wed, 24 Jun 2020 06:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=hK1IldVTAJkUSG2i1NKkDEtiFL1eMHy1/PWV8892Edk=;
        b=ODW6ajaEBcy+/pnOhDn1P1jgUCqjH2F2tkfmbUwgEuXK0Yc9FhQgEeZypfu4LwzTEt
         9ijv6CCflSEt8ZOQPfJ8q96qEBnfVW3fv6zyCIvAfv/O1intnyyWjBdvaNRmjz8kWBCw
         NMN6iyKmO9/lpffcKzqG5lWFB+4PkNWl2EXS3SozDzoZ3Lq7uN+0w+Vnu3BygINcMUj+
         pkGx4nGHRieYLqBLGIZNR7xIJQ/8+eqYhk2YUms2adyyTDXTl51KJxjP7jV3LL1yrxgG
         M1CuMcrSsRG2o7vIXMQzCpVqYdwTu8XNDCSRw/ACfc5XL3Bnjatqm5weYoyqTF3+w/1g
         vBkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=hK1IldVTAJkUSG2i1NKkDEtiFL1eMHy1/PWV8892Edk=;
        b=L363tzTT7uJTE10sENeHmXi5mz7Uc+scE8c6YCF/rQHXSG0SKVvxSZe+Rq4teZCThq
         9l9iHBUSDqZ0XI3aTJKsits0UmjjKuMbm++mCVHJTeQNsNE9iQRuwt7LVrVvMWmM04Nv
         3SROS+YJUMmyWsipsOFEIoYEjjtTkxOZqhybbrnaTPuz/Dyde1FmDVms2YaJgwAFwpaz
         s470+VTYDqxCVPO4kiEzfUGmbKgsFQFc32yBqBxH5gAcIjxxdJku8yOdu/Y2DwBcwCg0
         xocBTRFPHGpNVGRmqhMedq0L6NRX1OM2Asdl2qGJ1nytvnH0qh4ooJeZ8lW4G1aqZGp/
         VZJg==
X-Gm-Message-State: AOAM533u9Zq8z5b/c2xWmQI0KLUQe19YYu+tp31kBzU1wpqD+Jkn8/Bi
        wxCCIbDr2yYAjIBtqF/l2yZk1ZBE9lBq2eEjuRI7Xg==
X-Google-Smtp-Source: ABdhPJxvNF2K7aWqHL5AbnR2LzCQaglgIaehA79sWIBw6uVxFG83CmwovHyaMD/vW8Pf4cokbEgf5RkSOe09JphobP4=
X-Received: by 2002:aed:2684:: with SMTP id q4mr2627101qtd.208.1593005662713;
 Wed, 24 Jun 2020 06:34:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200623040107.22270-1-warthog618@gmail.com> <20200623040107.22270-2-warthog618@gmail.com>
In-Reply-To: <20200623040107.22270-2-warthog618@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 24 Jun 2020 15:34:11 +0200
Message-ID: <CAMpxmJXF94CM4DdnZW+gsjj=qRF7u9bV2Oy+ndznSbtD=eV8UA@mail.gmail.com>
Subject: Re: [PATCH 01/22] gpiolib: move gpiolib-sysfs function declarations
 into their own header
To:     Kent Gibson <warthog618@gmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

wt., 23 cze 2020 o 06:01 Kent Gibson <warthog618@gmail.com> napisa=C5=82(a)=
:
>
> Move gpiolib-sysfs function declarations into their own header.
>
> These functions are in gpiolib-sysfs.c, and are only required by gpiolib.=
c,
> and so should be in a module header, not giolib.h.
>
> This brings gpiolib-sysfs into line with gpiolib-cdev, and is another ste=
p
> towards removing the sysfs inferface.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
>

Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
