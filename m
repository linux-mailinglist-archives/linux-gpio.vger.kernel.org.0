Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B7D4132587
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2020 13:01:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726690AbgAGMBp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jan 2020 07:01:45 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:46814 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727834AbgAGMBn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jan 2020 07:01:43 -0500
Received: by mail-lj1-f195.google.com with SMTP id m26so51967300ljc.13
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jan 2020 04:01:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mLtNFMYZWtPhEKvur4VjuvVAPi0N1wL36Q6jCtiHfeE=;
        b=kzsDCX30f0Ec0JSPVS+j5bCMaV1MEdQdwUvAhfFWwLBYywuqsohIZB/CwqFxo2+Wpd
         xgSPZNnspuxr1JNmr9CTelVTIWd2tj//1wDsUbLSuMFvQWHW+kpfp5MTO0mKFK+Nd6xc
         N+mQPHlQDj8xdAFTBbpJS5dX0nRK5WuOqwauMc8zuJ+Q0Lkik9401WV07qylSSehTbb3
         53EkNPcDR6UzG8NwsunjUL2rrhSUvGL8fofUa1O0ZNw3nApGoUDzETIl+1ohMWhrsR0W
         4mXZE5hT/InAifSSYrra61Lm6c2GabDFSl+9stC08onKuQA5NEiaK+iOYtzd80/5Z9r4
         T0dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mLtNFMYZWtPhEKvur4VjuvVAPi0N1wL36Q6jCtiHfeE=;
        b=OtjkTeJvXp6DY2NNDwg4972qDJPhfdouQ5JRY/55RugzWAXPUIYfUxzN3hTQc8Dh4C
         zYum1YUjhphuikgQs+qG5CfHIqAh938xiGfS2nHVROMq8yojp9XffIs85emSlSEYTWNV
         9mLBR1eB1g2/VV3LyCIOiiR6Uq0ZpXEfDiE724d83qQb3G9obOw8JLpkCB2TSwf4EXqn
         zEUe+eDGV6wIIU9Bxm9AU4Nil/ZJVuaRiQP2BAmVL00+42iaIxkjV0XIjG8aPlWba5FM
         RVvdALqO0qe9aI3ALvDoZ6U3Rw68RrjKZFyAklur4LmtzzYjg39iPYgna3SOBfhiwQM3
         Tcsw==
X-Gm-Message-State: APjAAAWWSuDFXp82cnzuDZx5H8s2gv2jcQVyhqkAvROc0kfocDyqguy9
        0lG9DRGVSs4JSAWOG6+ED8dI8xk4w23yf1+8SDIhL2c/AOI=
X-Google-Smtp-Source: APXvYqxYVYIleP/nRgbENo3Yfgwk8OenCerefUQZlVEJcsgDGSH/BBARur4Ym4DwvHBVMCf6Xow3cwPKUVUV93X9mVk=
X-Received: by 2002:a2e:85cd:: with SMTP id h13mr61458408ljj.191.1578398500619;
 Tue, 07 Jan 2020 04:01:40 -0800 (PST)
MIME-Version: 1.0
References: <20191226191425.3797490-1-martin.blumenstingl@googlemail.com>
In-Reply-To: <20191226191425.3797490-1-martin.blumenstingl@googlemail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 Jan 2020 13:01:29 +0100
Message-ID: <CACRpkdZ3uc30Efwe_2YtNJBK4FTt+dWLbY3pnh1uWSPwGu_-SQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: meson: meson8b: add the GPIOH pinmux settings
 for ETH_RXD{2,3}
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Dec 26, 2019 at 8:14 PM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:

> GPIOH_5 and GPIOH_6 can have two Ethernet related functions:
> - GPIOH_5 can be ETH_TXD1 or ETH_RXD3
> - GPIOH_6 can be ETH_TXD0 or ETH_RXD2
>
> Add the bits for eth_rxd3_h and eth_rxd2_h so the ETH_RXD function can
> be disabled when using the ETH_TXD function of GPIOH_{5,6}. No problem
> was observed so far, but in theory this could lead to two different
> signals being routed to the same pad (which could break Ethernet).
>
> These settings were found in the public "Amlogic Ethernet controller
> user guide":
> http://openlinux.amlogic.com/@api/deki/files/75/=Amlogic_Ethenet_controller_user_Guide.pdf
>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Patch applied with Neil's review tag.

Yours,
Linus Walleij
