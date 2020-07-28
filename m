Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BD7C23052E
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Jul 2020 10:20:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728062AbgG1IUy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Jul 2020 04:20:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727940AbgG1IUx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Jul 2020 04:20:53 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B545C0619D2
        for <linux-gpio@vger.kernel.org>; Tue, 28 Jul 2020 01:20:53 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id 185so9960019ljj.7
        for <linux-gpio@vger.kernel.org>; Tue, 28 Jul 2020 01:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HIQ5RtYMfFI+H7x8RDkaUeKWb3yF02QogFEmqjJTRQ4=;
        b=OHZTyDw3HJ8WOeuBhN+CzaxQQxiiuqbtfgB+RG/0OuulIDrXsUgGPg3j4VkJiPRSea
         oN+y+EK88R3MUlLbaSe6fG5O/eEgE87eos5PwAhIQ5TsNkhmcRR5IeXDgIk3wXu5hzBn
         TDW2F0HI9FmWPGNGG11dUorKGj/px+vz5J21mNrwjN4XWKAJ2ce7zbKGT7zoj+/H/qzV
         6ueaRD/xn6UuplQRgC7a6ZMMrLZZ096a7qzBPfwhkx4jLqJbvMi5+zDhWDWvoDOD6zBQ
         II/biUYt8LlrcmTMeNANqVZM1G+OzbRMOEAnAgmkaFB43x9llVuS5/zJHZ2I6oazmKhK
         uoTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HIQ5RtYMfFI+H7x8RDkaUeKWb3yF02QogFEmqjJTRQ4=;
        b=l44qNwahME/r4wO3FRPyoNN830So9zUS70vLW/k5qfNklzT5vwH04B2y895/T1LupV
         J5xESnFfX77VJOP06Sz/mvygNsZIWxr1RhB0KckH0PZPTju7ysGpP0uQFgp8mUwDy1au
         nc+hJkaM9It38c/UsxVOMYbYURPIaqSvxohXOnBuP0TRQqHsDmIGhUdjrJlBXsR1fTpl
         4+XNV6TYlZ1z2+oeIKpIXOG5Lc2JIEw+HG0+iRj+/E9e28cokgZIYO+OR0jSyhNt73dg
         Ra1jOTxStLwbMC2UOYQpQO8jLf6VlQR7hJd3Gd4BTwLa3E+mtsaJ9BTf5F/RqZbAdQeF
         Tp9w==
X-Gm-Message-State: AOAM531a4MmXMUtHEl3CmEgBqIKpAnG2AaWsGIfmYYVI+ehShVxshaqW
        uvdZ7rhAjw6zKZZgL5xsCotmz7nie2yiuukemTo5Ew==
X-Google-Smtp-Source: ABdhPJxO+CGw7ygWgvu6yceY2CDngQOoDTtutC1EvO9o8y+oLDTzQAs+Bay1PvMuRM431rG23KjX0Xl15Cw6otKstvU=
X-Received: by 2002:a2e:810a:: with SMTP id d10mr11537402ljg.144.1595924451850;
 Tue, 28 Jul 2020 01:20:51 -0700 (PDT)
MIME-Version: 1.0
References: <d15827a3-d0c8-e231-9f61-8507b3d7be3a@infradead.org>
In-Reply-To: <d15827a3-d0c8-e231-9f61-8507b3d7be3a@infradead.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 28 Jul 2020 10:20:41 +0200
Message-ID: <CACRpkdbpEWap7bo1TOpDzX_t_mpisxhhiUuiQqNT+0rdFFAt+Q@mail.gmail.com>
Subject: Re: [PATCH -mmotm] pinctrl: mediatek: fix build for tristate changes
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Sean Wang <sean.wang@kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 28, 2020 at 7:55 AM Randy Dunlap <rdunlap@infradead.org> wrote:

> From: Randy Dunlap <rdunlap@infradead.org>
>
> Export mtk_is_virt_gpio() for the case when
> CONFIG_PINCTRL_MTK=y
> CONFIG_PINCTRL_MTK_V2=y
> CONFIG_PINCTRL_MTK_MOORE=y
> CONFIG_PINCTRL_MTK_PARIS=m
>
> to fix this build error:
>
> ERROR: modpost: "mtk_is_virt_gpio" [drivers/pinctrl/mediatek/pinctrl-paris.ko] undefined!
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Sean Wang <sean.wang@kernel.org>
> Cc: linux-mediatek@lists.infradead.org

Good catch!

Thanks Randy, patch applied.

Yours,
Linus Walleij
