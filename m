Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98E4E2074E7
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jun 2020 15:51:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403924AbgFXNvy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Jun 2020 09:51:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391084AbgFXNvx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Jun 2020 09:51:53 -0400
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 658B4C0613ED
        for <linux-gpio@vger.kernel.org>; Wed, 24 Jun 2020 06:51:52 -0700 (PDT)
Received: by mail-qk1-x743.google.com with SMTP id b4so1807407qkn.11
        for <linux-gpio@vger.kernel.org>; Wed, 24 Jun 2020 06:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=HWNNES+Y818odLI/3gSJ9ckg/fz5YcNui7c90vtLDpI=;
        b=KktHo04ISnCkBtN5rrRmMJ3YEda0xGWhl1b6QYgeUta/PZyM34Y+nxCcstwqzH521y
         qkwp7vYvXrQI4X0H2qE22hkwwEBE9G5ip2cXPNJvnnWNSrjakwlhiHXH4+cimGNtFU/K
         YZp/JrHOmEJ9UsRNOLBSqXJGACLzoDW4blSoxUupyaFcM9MIOjAWv/g2gXgiDf4WSu5U
         B53MQ49Yj0MbA+FlNEUU9gJ8vu6mjihOUqX5vqBEm8beyP5OmFV56ihVEdC8J3DN+zpc
         LJ3DIIXfNtwm7zKaKBt1H2aI9QVs0Kc1xVUnzJlUJ//1HBNh5k7gd4oYUfXp82qv4/ir
         jNmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=HWNNES+Y818odLI/3gSJ9ckg/fz5YcNui7c90vtLDpI=;
        b=swIvlZVXkP4rhYK2Sc2mqRC4PDy1g91QzGZjWFQ3U8mXarwUO0dMlII7K4LB/zsxEZ
         oyW0PHo6KX7g93nB3h611madKh9+ys7XiWIiBWRWXZGrtfa9JamC/q92l04hyYi2RvXo
         W8Kt4hviXtbSVeuKfP2HyXnqkpJ4LaJtMPOetgtODPTplb+pW80xRtQ3ZIoc5bKDiphc
         TlT1GGnIdpK8xJC1mox+c7Nt48E6HEAi1JB9F6ZprXeFY4FFQhS5dzCh51JRNvyzjk7f
         ZXmbuj/9ZShHCfyA05SaCCgXQ/b9FFbdjsG+E8LlWqEmvmlzaVDzGhoeMqg9vCp+5sjm
         x9mg==
X-Gm-Message-State: AOAM531fXzFS0FezU/roTtiae/erSoEX+UXM0l2G2hi19Q2deB2StW6k
        t/ZXGL0MVoiZNWBXfuxayrtniLea7lSjEJyzRW7rkw==
X-Google-Smtp-Source: ABdhPJzH4Dgmup8sCb73pnheO53Gb7G6wtoURv+g92q9yilghYFUERJH/XrvO4SetIxMLaZvn37S10yKdnBRcYdcb+k=
X-Received: by 2002:a05:620a:1114:: with SMTP id o20mr25798514qkk.120.1593006711646;
 Wed, 24 Jun 2020 06:51:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200623040107.22270-1-warthog618@gmail.com> <20200623040107.22270-5-warthog618@gmail.com>
In-Reply-To: <20200623040107.22270-5-warthog618@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 24 Jun 2020 15:51:39 +0200
Message-ID: <CAMpxmJXyuLy-+h5r983fZrAVjm4n+9CwkFWUB9bDb5SuAw8JVA@mail.gmail.com>
Subject: Re: [PATCH 04/22] gpiolib: cdev: refactor gpiohandle_flags_to_desc_flags
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

wt., 23 cze 2020 o 06:02 Kent Gibson <warthog618@gmail.com> napisa=C5=82(a)=
:
>
> Refactor the mapping from handle flags to desc flags into a helper
> function.
>
> The assign_bit is overkill where it is replacing the set_bit cases, as is
> rechecking bits known to be clear in some circumstances, but the DRY
> simplification more than makes up for any performance degradation,
> especially as this is not a hot path.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
>

Agreed and I like the code shrink.

Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
