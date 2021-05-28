Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFE07393AD4
	for <lists+linux-gpio@lfdr.de>; Fri, 28 May 2021 03:00:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235323AbhE1BBx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 May 2021 21:01:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235119AbhE1BBw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 May 2021 21:01:52 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08C28C061761
        for <linux-gpio@vger.kernel.org>; Thu, 27 May 2021 18:00:16 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id i9so2772835lfe.13
        for <linux-gpio@vger.kernel.org>; Thu, 27 May 2021 18:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=93ZOv3R9w2+gpiXYvaeHU2SNm5IHXD8ACSO8RxCmeVo=;
        b=utgwiFQARWZIqVv2gNQCv48NvaMlBgRbTLoiu5ifn1TgggNANvqvs28/D3NyzYsasH
         3D3vprvEGp5oEBY8OH0SrVuAjX1AdKQIT8Ptvs+CkYKDQzy+1IZ8uE6byPkbkUEqYvM5
         rZRoKVsvzEgu0G1Sjcgq54Ut9S54T6J+b2EcnxZ+6wJ1sU39Ty/8APbkg30e0psAvdj0
         O6UcYLYfNiMXu3pUdy+3/LgIVIzXzmAIS3LdnYsLHUfRVh5PriFgGnwXtdWTCTEnonXV
         MgwbUos+P9zm8vYZgUaf5G3127oPQ0H36eneli3SdATF795s3dftlG93R2DkOijiLx6A
         iuqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=93ZOv3R9w2+gpiXYvaeHU2SNm5IHXD8ACSO8RxCmeVo=;
        b=eoW3Btcgf6C1az41vWX8p6PsK0aHM6rZ4Ei2kq4HzNecQHcjBuBBKJmUWpMdQfdB0T
         y261FgrBn9CplwCtdRkyAChNzWhXEOm4mcjeZe7twsThqaROWnjRUb6NEEbY/B9enk1a
         BTAy0vq7IFUoeIGLdK7bbI+vRlUEAocVsdgYKulcNAPcqS/i6983+p8mAUueWb6ImVrj
         RqQXnP9gciMNnnJDNhy3nIl1UbCZ/G3eJPwMoA7vPestm8tisQSHYl7znNxhF16Dmtdp
         vPcbgBkXcYFcjpWWGTjgHu1k0vs0HJHS0oDGqOphaE8oz6I0A3USq93H+9bL9x1zQvpT
         GiEw==
X-Gm-Message-State: AOAM530/Lpqw1qu0Sg8glw4Kj+BtJWwxFTLJSmwBQCg7PSIKOrcuHopo
        L/Q/EcA1eeJqrr7JCQZnLV8O1UpxofoRGNL/K93NgQ==
X-Google-Smtp-Source: ABdhPJz/iZqKsyRMIIVMsAp4xB7R0e4he4kt4V7WYrUgzGvyGCTNONYwk4jmobdjgXcmekS5X2GNhVm7oLeL3oRdicw=
X-Received: by 2002:ac2:47e6:: with SMTP id b6mr3972932lfp.649.1622163614355;
 Thu, 27 May 2021 18:00:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210527201309.13308-1-dariobin@libero.it>
In-Reply-To: <20210527201309.13308-1-dariobin@libero.it>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 28 May 2021 03:00:03 +0200
Message-ID: <CACRpkdYxakJ-C=uPdh7Wf9P2iPQtcsVkVxxHhsx-24oAreOGoQ@mail.gmail.com>
Subject: Re: [PATCH] docs/pinctrl: fix the reference to the u300 platform
To:     Dario Binacchi <dariobin@libero.it>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, May 27, 2021 at 10:13 PM Dario Binacchi <dariobin@libero.it> wrote:

> With commit ce1380c9f4bc ("ARM: remove u300 platform") it is wrong to
> use arch/arm/mach-u300/Kconfig file as example. Since the u300 platform
> has been replaced by the u8500, let's use its Kconfig as example.
>
> Signed-off-by: Dario Binacchi <dariobin@libero.it>

Patch applied!

Yours,
Linus Walleij
