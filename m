Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35BAE173819
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2020 14:16:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726816AbgB1NQx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 Feb 2020 08:16:53 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:34096 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726752AbgB1NQw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Feb 2020 08:16:52 -0500
Received: by mail-lf1-f67.google.com with SMTP id w27so2098150lfc.1
        for <linux-gpio@vger.kernel.org>; Fri, 28 Feb 2020 05:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=d2j+xwWiY9wlH7AtLJK3OvsykaZ/u5FJZyPROvoiy1g=;
        b=HxJHR12dqabYx6zhDgCZD/hJGDITKwemITUtUDZOyk/Yt7H+qaUfjQtBS/a0AHDTzC
         F9AA33/VUSLG5pULibxByHL4WExkcYA0R5mgTQdjitbAuZ9jivnhui2PTI5d8OFXXBIw
         Sd5Jh0q+CFejsuT54GGnaxVCFCg+fZT38NtsU6g9igX2qJOGrGmMXLehFdtxjurISOhD
         rG5lk92ewSrN83PbluJZfi41RM+GlMWm7cgd5Oc5Rcgx01IwMZr2N30HPz8lo7WOgnqd
         Lx80wMZIZEe9EbHWposU9rNFo4LVI1unkD5T8Pc46K0n+6N5p1DZHyP88AlSVmmYW7pW
         ZSgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d2j+xwWiY9wlH7AtLJK3OvsykaZ/u5FJZyPROvoiy1g=;
        b=Jsq7W/pg1Id9DLi4fCK0IfnEMrwfj1ldLr47SLEN/IHwbmAQucgbrEePN0gZHPq7lQ
         KvUxM8wCJ0rfEajP0RPapNuiYDogL/rKTeuUZvGnws4KDEbhHI5tFXlHQC6v3U/ZCwz0
         ClhzJhi8ZlSRcr1uuo3Jtvt0NpkkT7U0smWTTxrrbDJ+YiR2tt1iINwimeeSFCvmECEv
         ncXqNWADY/DQsnCzRc0dzI+HIk3HTyDSHkg4+lDt/+Wi91PRr29APY3j/NhtzX2WBeiR
         HgUr/pUGAwZM6IKq1zxj66ZrseSCaRKtEhsNmwSjFnLCjNqRE+3JgkblxJKCMEMAJkJt
         5wTA==
X-Gm-Message-State: ANhLgQ3AQM6DtbXb9I+1x7Hb9TU6xFdf88YCk4DykPfDE79NFVOsI3uF
        YxBqLEN5ATdf9vV/q0GCEm9/GSRzr9Prxx3olQ988Q==
X-Google-Smtp-Source: ADFU+vsgVdf5ixS/e74l5Eg9jm2LlOCk+LwWAKinRI2yuiFWgmTOny7+7QQPst2uBqeBcz3Eq8WslUWOUECUikODDqA=
X-Received: by 2002:ac2:5328:: with SMTP id f8mr2636959lfh.47.1582895810190;
 Fri, 28 Feb 2020 05:16:50 -0800 (PST)
MIME-Version: 1.0
References: <20200228040047.14808-1-yuehaibing@huawei.com> <20200228063429.47528-1-yuehaibing@huawei.com>
In-Reply-To: <20200228063429.47528-1-yuehaibing@huawei.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 28 Feb 2020 14:16:39 +0100
Message-ID: <CACRpkda3=z80WY_W3EN=tiYruYfGjxPAHYjBALNj39kqDtjkzA@mail.gmail.com>
Subject: Re: [PATCH v2 -next] pinctrl: da9062: Fix error gpiolib.h path
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     Support Opensource <support.opensource@diasemi.com>,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Feb 28, 2020 at 7:35 AM YueHaibing <yuehaibing@huawei.com> wrote:

> gcc 7.4.0 build fails:
>
> drivers/pinctrl/pinctrl-da9062.c:28:10: fatal error: ../gpio/gpiolib.h: No such file or directory
>  #include <../gpio/gpiolib.h>
>           ^~~~~~~~~~~~~~~~~~~
>
> Fix this wrong include path.
>
> Fixes: 56cc3af4e8c8 ("pinctrl: da9062: add driver support")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
> v2: Fix wrong path

Good catch!

Patch applied with Marco's ACK.

Yours,
Linus Walleij
