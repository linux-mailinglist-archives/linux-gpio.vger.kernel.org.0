Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 317FA35931B
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Apr 2021 05:38:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233174AbhDIDiL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Apr 2021 23:38:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233203AbhDIDiL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Apr 2021 23:38:11 -0400
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2FA9C061760;
        Thu,  8 Apr 2021 20:37:09 -0700 (PDT)
Received: by mail-qt1-x82c.google.com with SMTP id 1so3269988qtb.0;
        Thu, 08 Apr 2021 20:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8BgGBrR3Xwqw+MMg1YnlfMAUK+I10lyWE+xZkXB1ujs=;
        b=Heia25TgE2vtvJwk4Mye9wUNtKT4LCXFpu3RTd7Litn4l6XDwm58yNf5Xo72WKG1Cb
         Pnh29PYykNQ0Leb0AVytW69/DSGu2rRRdSyPucL7QrMDZjkSbhFQ0sXFxG9k3cGgza9V
         mXSNHoDmBuqB2Dq6N7NZp/gT1iFd9YrggQtWs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8BgGBrR3Xwqw+MMg1YnlfMAUK+I10lyWE+xZkXB1ujs=;
        b=jw6ukamSWVotwCXQrCi9tZaelPWAx/Y/SjK5CiZS4roGgR5IADFLCING9taiHeBMSi
         aAsvGnNP1OI3GRghZccdZULiSFI5Tdhm1VN/yMbtmQCNj/6/cW0gTcGypd6O+/3jmaTf
         X7Mbx6IgE2By+jFWbKcav5F/Ez3hZSfsUkYY9sGL5I8twSIb+/9qFVqyPDxt3OlrfEsM
         2JoZFxF3now+PvznEUfFuGnVIeP0Jdv4XFsZQCnxlt6pSsiT0PqstqNXgKxVUGMAM3Y7
         76BO4EBj1GUP0Alr0oDInj7H66k8iuHXwLJIO8mTml7pL+WmV1z74GVb56yZDPQfsJZm
         /SUw==
X-Gm-Message-State: AOAM533Fqd6UVvNEFKS2uayXq0bzCGkvkZ/tPStRQIDAt2AJMzhdIARr
        apszigu9QX9XuuGeQpW/sXksKLX693guRhVX7d0=
X-Google-Smtp-Source: ABdhPJxpEB1iiCw0U43cwWPFxVnBP2huZ7QxGaGC6NeOvjxLXRAa+ssU2jFErOgTTQKad2+gM3ZDkIo4Ri3biTi/Bas=
X-Received: by 2002:ac8:5f87:: with SMTP id j7mr10494309qta.135.1617939429154;
 Thu, 08 Apr 2021 20:37:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210319062752.145730-1-andrew@aj.id.au> <20210319062752.145730-4-andrew@aj.id.au>
In-Reply-To: <20210319062752.145730-4-andrew@aj.id.au>
From:   Joel Stanley <joel@jms.id.au>
Date:   Fri, 9 Apr 2021 03:36:57 +0000
Message-ID: <CACPK8Xfre_HriZXa10GVRvzxM51_6jkxCrXi-Ofto6cCKcLw4g@mail.gmail.com>
Subject: Re: [PATCH v2 04/21] pinctrl: aspeed-g5: Adapt to new LPC device tree layout
To:     Andrew Jeffery <andrew@aj.id.au>
Cc:     openipmi-developer@lists.sourceforge.net,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        Corey Minyard <minyard@acm.org>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>,
        devicetree <devicetree@vger.kernel.org>,
        Tomer Maimon <tmaimon77@gmail.com>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Avi Fishman <avifishman70@gmail.com>,
        Patrick Venture <venture@google.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Tali Perry <tali.perry1@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Benjamin Fair <benjaminfair@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 19 Mar 2021 at 06:28, Andrew Jeffery <andrew@aj.id.au> wrote:
>
> From: "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>
>
> Add check against LPC device v2 compatible string to
> ensure that the fixed device tree layout is adopted.
> The LPC register offsets are also fixed accordingly.
>
> Signed-off-by: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>
