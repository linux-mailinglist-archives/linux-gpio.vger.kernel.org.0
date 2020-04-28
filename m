Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 249E51BC041
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2020 15:53:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727823AbgD1Nxw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Apr 2020 09:53:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726900AbgD1Nxw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Apr 2020 09:53:52 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36731C03C1AB
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2020 06:53:52 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id u15so21566006ljd.3
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2020 06:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=J/fWDN7mDDqYLAmmXW/SbuqDdwF/3UMPgZPEucxrYVY=;
        b=CZJiPMCOx7X2ZGByE6u7Xcq1U3WeSVV/3rPPNf+eI8yPxACPZoq5mW+rLc4puGCdc0
         hXqz8KsE3NQyK+f+/3IzUJSk1GDS6h060SWGNs0pBG3vkEhzluDilC0A1gw7UJ/bdQcV
         6SL/C3xnGq5lhZ96SGCCtbIO837Ae5PhSjojqU2aSkA/HO9RpNp8v1VHYBR7DSegcv2g
         oJ9y3KCWU3CQMzGgNEbKaIoMNHfjEIEKqjSSZhu/vcKcnQUPiBhqziDeh/39xK+zHIi2
         LdFHpbFpn1uChvfoMux3xD1CX9cb+wUuot1xP++WFh4Gb/KIOd5w6SjXwbVm7d9BNa1I
         U/Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=J/fWDN7mDDqYLAmmXW/SbuqDdwF/3UMPgZPEucxrYVY=;
        b=i6WdUDmYqYDDUAIhDSAuDkAgII763bmKiU4aAWVUo7RExdabBxgrWEae8XDVC1imT/
         e5X/vKhtRKjYRhsA+d58rguL7StVxHz+wjdM4Zz3gJscIETn4B0kWNhyazJvlmkCz3vc
         +ZuizSPOtB1nJIYdJllOx3ttAn1kkwPcjPVeWYdNH5ssStmX2aJhHQtLUdXvtc9DZP3N
         +XuSd0k+ozMDCEouXX2WJxhStCp85RTRLw9JdOEDlfR/jpXTJ7VckHfmptpltD6x+cTR
         b63SmvU1JSWqCHeUAcvxw2uP41ovA1BNcbM5+PiJwhmwEJhOLfwAkyrVHh2lxp53r2mO
         J5GA==
X-Gm-Message-State: AGi0PuboJY6ocNpm66MNmN1okeCVh+8gEM3TrHmup6jCuv3/C06/zk/G
        baxRX3Gt5ggkQ1nSJRWPpK5V1xwn9LASgCd54Q1APg==
X-Google-Smtp-Source: APiQypLrlOkEwUuaW+ZE2ms70LGWakIPfN/GLVZj8T5r8/WjawDU7q+VAHVoFDhq+cKIoLc65EhT732GDbAVZ+2Z6+s=
X-Received: by 2002:a2e:8087:: with SMTP id i7mr16376560ljg.99.1588082030295;
 Tue, 28 Apr 2020 06:53:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200424154103.10311-1-zhengdejin5@gmail.com> <20200424154103.10311-3-zhengdejin5@gmail.com>
In-Reply-To: <20200424154103.10311-3-zhengdejin5@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 28 Apr 2020 15:53:39 +0200
Message-ID: <CACRpkdY5_+_n8qfUxAGtG16QW_VoVcpSFZuoBR8A6iuCbmsrFw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] gpio: mm-lantiq: Fix small typo
To:     Dejin Zheng <zhengdejin5@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Apr 24, 2020 at 5:41 PM Dejin Zheng <zhengdejin5@gmail.com> wrote:

> Fix a spelling typo in gpio-mm-lantiq.c by codespell
> s/dont/don't/
>
> Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
> ---
> v1 -> v2:
>         - split patch v1 (only one patch) into patches for each driver
>           by Bartosz's suggestion. thanks Bartosz.

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Andy: since this is an Intel product are you picking it up?
I think this Intel-MIPS platform is a bit of a special case so
I can also handle it if you prefer.

Yours,
Linus Walleij
