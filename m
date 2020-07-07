Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69E04216B3C
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jul 2020 13:15:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727003AbgGGLPw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jul 2020 07:15:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725944AbgGGLPw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jul 2020 07:15:52 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44E70C061755
        for <linux-gpio@vger.kernel.org>; Tue,  7 Jul 2020 04:15:52 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 9so49380097ljv.5
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jul 2020 04:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IME/GKmb03RMGZjHJLw9fB5q2hWSVThgD6kxOkSv7K4=;
        b=MbMMReVhvU1Ziovve/YFlmTeUU52Pj/orKnR7kX0NlykcVik8u67E66OxRylvX4Oaz
         EklcD2sTe2vWnBBM/OrMJN9XhiXGr9KnB3NO0SaKVMbMRzzmQv0mpSIU3l8usw++6Di/
         YATzyor3V8fa3yajhQQ0JvV+5UyJ2t4+EWpgJquP7iad6/KuBlQkef3UOB+wgdDGi+zi
         M7tRYg96icGx5VqDZulWFiw/mEN+gdLBERSj5VsUwT3xllZrYNq5/vXaDf2h70MBnUa3
         G61L17PrwXwrz72aXhT8lIDpbDP8M5nEucOcfgujb4xoACysDuy4vpC1krs7qL1xDlzN
         BhOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IME/GKmb03RMGZjHJLw9fB5q2hWSVThgD6kxOkSv7K4=;
        b=o4RlzQXiSlX776DOCBzrYmTKZ7KfRB2dj5UCk2qt5FC9MuPg7II7h04tGgDMiOAJxs
         ikcnBU/4lDEHnDO8fqXk6Pk3mQ//87/1b1pkc/a5ClCe/Mkno+1I4KZpeEEl3WQmcOZq
         9NyCYVa+zojMZ39l7aS6y/0YDjEu3+7bHjNuiWd88ah8KqHE3tLnCOd0+CeOLpYBXXSX
         oCKgFM7Pwf4IOuyIsiUQ6YnBb6lYWT4PWJA6uNM3QYFGHj6IXaAg9XWmNbf7hIflgqIn
         kohMtuC3HNZ2xMzepD/LmYNu0MQUS2N5jR4SWcmK7JoedK2jRBimMVGEwa57sOwnS+3F
         oHVw==
X-Gm-Message-State: AOAM533Vtgcvpmoac+ne2AGPbnyeqfxKwqZLs322oTPZpSA3IA9Ak3xJ
        pOEGY4GOgzGYvbieYXh+dy4EIwBqUuTdYtPOdsz7oA==
X-Google-Smtp-Source: ABdhPJwbsoWVmqeN0/WQZpQJHIRzq9HpNh3Mx3xudoIWyjVcuG5GzzrQ0ViAG5GTTFplqmcdl8EFB/wvQqzTDo1sta8=
X-Received: by 2002:a2e:9a4d:: with SMTP id k13mr8480046ljj.283.1594120550675;
 Tue, 07 Jul 2020 04:15:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200618025916.GA19368@home-desktop>
In-Reply-To: <20200618025916.GA19368@home-desktop>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 Jul 2020 13:15:39 +0200
Message-ID: <CACRpkdZqkAXpH83H88=phtVcJRhqh-1865X8gJun_oOqBwzxrw@mail.gmail.com>
Subject: Re: [PATCH] [v2] pinctrl: meson: fix drive strength register and bit calculation
To:     Hyeonki Hong <hhk7734@gmail.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 18, 2020 at 4:59 AM Hyeonki Hong <hhk7734@gmail.com> wrote:

> If a GPIO bank has greater than 16 pins, PAD_DS_REG is split into two
> or more registers. However, when register and bit were calculated, the
> first register defined in the bank was used, and the bit was calculated
> based on the first pin. This causes problems in setting the driving
> strength.
>
> The following method was used to solve this problem:
> A bit is calculated first using predefined strides. Then, If the bit is
> 32 or more, the register is changed by the quotient of the bit divided
> by 32. And the bit is set to the remainder.
>
> Signed-off-by: Hyeonki Hong <hhk7734@gmail.com>

Patch applied.

Yours,
Linus Walleij
