Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47CA33E91D0
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Aug 2021 14:47:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229880AbhHKMrY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Aug 2021 08:47:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229721AbhHKMrY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Aug 2021 08:47:24 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8279FC0613D3
        for <linux-gpio@vger.kernel.org>; Wed, 11 Aug 2021 05:47:00 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id x8so5471180lfe.3
        for <linux-gpio@vger.kernel.org>; Wed, 11 Aug 2021 05:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rj94y2JfuX7qcPy6zjJFuxSqjWMshF2nOi2+g7LA8bY=;
        b=F3TUtOjcLErsbQR7veDomHtIzbA6d7E+jFIUKIsFSCb2rLxmegEkIq+QCbnChTydel
         KwTW48kdfRMTRQELo7vkiax5HTSPAvziOcPQdzlLI7Ky2APkl/J4UBkhPjNa+ifr/cY3
         HSZ6hAvzt5ekswjX+YppLOV+cFUAZgFKyZdZohGizCOTtDcniaV2CDg+7r38EvWD4MOH
         n1GH/cjgS/rH6THTYaUmdtPjzo64VSNWEub5pmowm1VaKATO/tqbeR/8YeQq0IjY9hcd
         /WLC8JKwICIhKaZZ83J3OCfmlOWxjWyhe2UamUFG4GixbM1Y6KuM1G8yYrwS5aZo5Op5
         cWOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rj94y2JfuX7qcPy6zjJFuxSqjWMshF2nOi2+g7LA8bY=;
        b=RhVxpojLFoJaC1j+GpDTZStRrZNnkwTLZMrf/7VIQyXBOUXQGyIGdP4WzHUzyqyWVE
         ow0tLHgDOj0/TwgSg96LuwTZbVZksirKWlxcYENRPfq/uAG6PBX4O2aRsGNNEAJCnqla
         Sy5u7zP4+XHOBcLnDyR2AWXEynQBKGArmlRYiAm952X34gFZDw4MkPx74EvMBUpLZuIs
         /I/5SJ/qaqSPiH1h+j7BQ3Y+jgjyFxL5bzbAO0b0xC3CjZK0gU4usEJwcuEl4+wOAr94
         xKQBdyTLXWS4MBc4gzUyoiHBGxUv2Mb+URwcVBYpSnhwx2P5sUc7sRH+gLPHno5Ax2bZ
         s+Tg==
X-Gm-Message-State: AOAM5322xdAG+xRhtW5ejOzGfGeygJRPbJqc2tcx/UbdPtwUs07U9TkG
        ix+ERkJGV2JOIqzjhfANF/C1tkb10HLEC6wLbnZF1Q==
X-Google-Smtp-Source: ABdhPJw1cJwD1KmJCz1WIAG1+s4OaTxheMM1ZK65fMIXjUdMVuRPl4Kuh4jRS/yOvwPU0mTNEFnHsU6hnaPlr+dfwzE=
X-Received: by 2002:a05:6512:1084:: with SMTP id j4mr26142038lfg.586.1628686018878;
 Wed, 11 Aug 2021 05:46:58 -0700 (PDT)
MIME-Version: 1.0
References: <8ee569d3-7fac-68c6-a1f7-f6457ce0343c@gmail.com>
In-Reply-To: <8ee569d3-7fac-68c6-a1f7-f6457ce0343c@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 11 Aug 2021 14:46:47 +0200
Message-ID: <CACRpkdbYy8jSGmX06i36Xw80ZR4F8M0hqQ=5k6GPXyhtj25o6Q@mail.gmail.com>
Subject: Re: [pinctrl-amd] 5.14-rcX, d62bd5ce12d79bcd6a6c3e4381daa7375dc21158
 breaks poweroff/shutdown on ThinkPads
To:     Gabriel C <nix.or.die@googlemail.com>,
        Raul E Rangel <rrangel@chromium.org>,
        Doug Anderson <dianders@chromium.org>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Gabriel,

On Mon, Aug 2, 2021 at 8:18 PM Gabriel C <nix.or.die@googlemail.com> wrote:

> Reverting d62bd5ce12d79bcd6a6c3e4381daa7375dc21158 fixes the problem.

Maintenance of the AMD pin controller is a constant headache for me.
The chromium people step in I think out of necessity, I bet there is
some interesting discussions between Google and AMD about this.

I don't know if Raul if unavailable, let's check with Doug Anderson, I
am sure he knows how to raise awareness about this at Chromium
if Raul is off duty.

If the problem persists, please send a proper revert patch.

Yours,
Linus Walleij
