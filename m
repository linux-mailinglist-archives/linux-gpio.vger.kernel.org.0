Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD54C48FA1A
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Jan 2022 02:03:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232745AbiAPBDa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 15 Jan 2022 20:03:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230132AbiAPBDa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 15 Jan 2022 20:03:30 -0500
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21DBAC061574
        for <linux-gpio@vger.kernel.org>; Sat, 15 Jan 2022 17:03:30 -0800 (PST)
Received: by mail-oi1-x22d.google.com with SMTP id q186so18093689oih.8
        for <linux-gpio@vger.kernel.org>; Sat, 15 Jan 2022 17:03:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=POoT8lZwdwkVxbrtnXG/2kZ2LyDCImg/KhYjt8hMGj4=;
        b=ImMWHs/t2csAyPe/7X6ixftncpaVAciibtgZoT/rplnNeX4Pfltee6fYOFiHBLes6E
         Bxaou6H9Ak5cSokDSdrfZHw3q2tK4NZba9WZ+yuPgrTtSJx7lpurwM8itnWrk0VJbwAL
         EOtl0Tp4XfO+OCNaKmi6ngD/rysN/lYGD18Y1TmDWOxjztOjzjiVkYRpdxap+ERJgZB8
         cWNZ8v0kxr3J2/iwIxS8zP0O34lynqLcFYjDLuCJckQgy5wUCfuEQQvxw+l2K9nE7RnN
         2ZYM38ba6i14Qh1Ab458gzBjPL9lOgqJK3/TMcJaKltrV+jh4UX9j68lmfJ2rHlEWGJ7
         eQgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=POoT8lZwdwkVxbrtnXG/2kZ2LyDCImg/KhYjt8hMGj4=;
        b=Ru14I4tTo3VbnfUA9qqIqRfqBjEsrqEm6A24rHQRCAcwhiKMbDagbCoOm5RYU+b4g3
         AGaDNENA3TsrdckFBYaYEaFzmZKaMjrXFQgkwGbD6VRK70Ut+ZULLVa1iFK+aixUZftJ
         j4+P9ewm5EsdpM08jeYzR2GOYW31nTHi4LcILhqFJCvF40kIw5PVSacwwxC1bD6uWokk
         5YZuc+niL5e2GnqpVg0KyGy8yiJqXrEHGfgWs9N5DKF78+/O8FmrzmoWPTttMXLzWPcx
         23iCSv/z7vkYFXXJTeDnxAAtPfHsf+Tmar2sko5P1XM1Ba2p2zGcassLSMq/BtbSTCK4
         Tb0A==
X-Gm-Message-State: AOAM532Rki4bcNV0s0i9Qki9oLDYrlCiGxz0MpWeCsJESRwoWsG/gnkZ
        RLZMeTslrDpwV0L9SyJMZFPNQwl8EGrXK30prd8tOJ9wvjY=
X-Google-Smtp-Source: ABdhPJwafqmBY0WphS0TwqHoMtj+/tWMv898aZCQzPJBVKAu0PbBomZDNH+c2p3i/XuChSguAPuDYyYNS0Ri078n69I=
X-Received: by 2002:a05:6808:2097:: with SMTP id s23mr8359331oiw.132.1642295009533;
 Sat, 15 Jan 2022 17:03:29 -0800 (PST)
MIME-Version: 1.0
References: <20220103154616.308376-1-gary.bisson@boundarydevices.com> <20220103154616.308376-2-gary.bisson@boundarydevices.com>
In-Reply-To: <20220103154616.308376-2-gary.bisson@boundarydevices.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 16 Jan 2022 02:03:18 +0100
Message-ID: <CACRpkdZRL8VuY5K_d69VHE6eXCmUb18ZRs5v9shExe4ipmw90Q@mail.gmail.com>
Subject: Re: [PATCH 1/3] pinctrl: meson-g12a: add more pwm_f options
To:     Gary Bisson <gary.bisson@boundarydevices.com>
Cc:     linux-amlogic@lists.infradead.org,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 3, 2022 at 4:46 PM Gary Bisson
<gary.bisson@boundarydevices.com> wrote:

> Add missing PWM_F pin muxing for GPIOA_11 and GPIOZ_12.
>
> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>

This patch 1/3 applied for v5.18.

Yours,
Linus Walleij
