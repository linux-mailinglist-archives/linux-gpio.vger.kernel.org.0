Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8563C3E5BA4
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Aug 2021 15:30:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230243AbhHJNas (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Aug 2021 09:30:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229663AbhHJNas (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Aug 2021 09:30:48 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 358D4C0613D3
        for <linux-gpio@vger.kernel.org>; Tue, 10 Aug 2021 06:30:26 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id h9so29102622ljq.8
        for <linux-gpio@vger.kernel.org>; Tue, 10 Aug 2021 06:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=e3k641rwlK4MjDsfjkE7+BTpqeUM8sPvABevxA/pIVM=;
        b=i5U4cbLjrYhQspm4zofa6nrbEwE0/197GBiQ6/qBUZCcNpjHttwNIVdfDw2yGu6SKb
         bUNC0n+XD7MXNIcuUMKiNA54afRKgRX6j2CUSuVx37b05Glig/CrWA4A3K16uozbX6iM
         VpWWBJgTyJMwuL4oQLzXAo3DJykGzLWwM4DyG8oDqJ/oi40S9ieTYDqd1LhKawuHYX97
         MrRad2Upe+VZyel12NVI6iypzQ7Ll25dmRvd0phOLHwA4Uv3/yFYnVxaUVHmTBVOCekr
         l+DVQlzPS6tEyY/XlcONbOPQopwaz5/JL6XD6YWy1cn0xzHjtxcRXZZznLnO+P7SNDuX
         7nGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=e3k641rwlK4MjDsfjkE7+BTpqeUM8sPvABevxA/pIVM=;
        b=iW+1xAk9T13S29EgAXEl+n9Dyliuop44PITdni0uGWzVMuAIiYwce6n5LKF6lOuCX4
         j0O2eaTPvMFUFMckiHdIctqN+UN//pDaYVd7BE9K0R+hznRZi/MVg418R0E62W07XRkz
         NdPM8rdoS0G2a4gnT7Cmf/KUL/jQxSPR5+Dy3q/gfYP6qy+Lm2sUyKnpf90D9UnNQWyz
         qB0YGTDRrhupcAqDoSUFgmLawKp93DvWSkb5YFG3cyFP+9eOcnFeB5U+6m+aFA4u0+IN
         8Ch52ttRVi/dmFCWluGgbB6zm3RmNWYBhDK4C1Lwp460AsMo2nznUeIv6FVX36GhVG5Z
         ieQA==
X-Gm-Message-State: AOAM5305UWImcmzLyW4VIfys0CiFNrhMijGJVcNrOdhNwMZBbsZGE4rP
        9Xwbdw2M7yCWO3RQS5ubg6x4Y7s+TMgLAcMZGYvvGg==
X-Google-Smtp-Source: ABdhPJwQMqlYA/iD2LkwYjMyrISm/5VpD00G3ZreRxQPNQedZ6skQPLl6AsFHnOZAHKoQ0C63+sliSuUdCJf7E7plto=
X-Received: by 2002:a2e:888f:: with SMTP id k15mr19654778lji.326.1628602224614;
 Tue, 10 Aug 2021 06:30:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210723034840.8752-1-rdunlap@infradead.org>
In-Reply-To: <20210723034840.8752-1-rdunlap@infradead.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 10 Aug 2021 15:30:13 +0200
Message-ID: <CACRpkdaXWhKNdmWSsoYZnZi_umfvSv7mZvg1JgkG=-k0JGoUTw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: aspeed: placate kernel-doc warnings
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     kernel test robot <lkp@intel.com>,
        Aditya Srivastava <yashsri421@gmail.com>,
        Andrew Jeffery <andrew@aj.id.au>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 23, 2021 at 5:49 AM Randy Dunlap <rdunlap@infradead.org> wrote:

> Eliminate kernel-doc warnings in drivers/pinctrl/aspeed by using
> proper kernel-doc notation.
>
> Fixes these kernel-doc warnings:
>
> drivers/pinctrl/aspeed/pinmux-aspeed.c:61: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>     * Query the enabled or disabled state for a mux function's signal on a pin
> drivers/pinctrl/aspeed/pinctrl-aspeed.c:135: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>     * Search for the signal expression needed to enable the pin's signal for the
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Cc: Aditya Srivastava <yashsri421@gmail.com>
> Cc: Andrew Jeffery <andrew@aj.id.au>
> Cc: linux-aspeed@lists.ozlabs.org
> Cc: openbmc@lists.ozlabs.org
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-gpio@vger.kernel.org

Patch applied.

Yours,
Linus Walleij
