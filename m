Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FD582A7BE3
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Nov 2020 11:32:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730016AbgKEKce (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Nov 2020 05:32:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729787AbgKEKce (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Nov 2020 05:32:34 -0500
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A556AC0613CF
        for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2020 02:32:33 -0800 (PST)
Received: by mail-lf1-x143.google.com with SMTP id y184so1513201lfa.12
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2020 02:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=U0lJSFXDiBRqIOu+t9WP8o1U+WU55V+7Be2Zx4IYYiY=;
        b=s5vqFz/R2X4Ca/b1npvwgCzzKTXN2Gu4ltyRMYgzRT8pFURbWAbCBUL6SOd9c6q/g9
         u3q7fevbD5FqhA7AuFqQNMx+/NzRZkSrAG0ijoGutGZCHe62AFZz75OPLue32Q6IKfvd
         zaY6VDarwxy45vJ1IyEVO4h9MSQUMtxu/hIMjSsSAM0pV6XGCQ0dl50yzMar1HlX8fQK
         XMZ7zoksLpYvwXf8pXdn2bkN4bIYlcAeDYncOxHNP1i8R8+PWUrDcYNfO2RuzfJQr6dO
         s/05eakvtd4CUqQXF73AC23kDB8PSzsEtsFR4qWz3Z8Fq6ZJXgGS3N+LVSjez0fnnT3+
         707A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=U0lJSFXDiBRqIOu+t9WP8o1U+WU55V+7Be2Zx4IYYiY=;
        b=CGx1kYQKg922SybRgIPPrJ7ggQqn8J8vDThnFznsOMV1rcAQqkrB5Jslx7BrQECvdT
         Lj+mWxA+47+hZhdyzg2l+epUnnjWERLWeHhv92ABNhzuA8cuTouzNAPc3ZVGU3Dy0fwm
         6Wi3h8UnIPiRy6xeUSEtYuM0qJzf/2NiRRevRAZbRT690RLmJHKA5BUQw4tXI6kDOP6/
         V8zMtjXHfuLs4+Y3sjbE5eq+wIIP6jbwcC2QsouTZYQJnfS2rLhEc96pQdhhCdzfNDT8
         qsvTHxuB3er5FshH8OEWfvaM9smXdLjaBtfTM+ihlNqCIj3WtLFE0jAYD1i/dMK978qm
         qtxQ==
X-Gm-Message-State: AOAM53077lVABAjJSKFyHga6FxoVJLFWx5RaVd5Mxrhs/z7yX9HLbvAo
        w+7nvPvRfaOVQaUKFYB+dnQSeFuLj6pt/5ZauUbF9w==
X-Google-Smtp-Source: ABdhPJya9PEa7G1OiJ7aVpDGOrcVVSb+asIw93q4jmnfi017WQVv6puj8OMzYORyzd9Ap62KI6gCMzjiaq0JKJizpoM=
X-Received: by 2002:a05:6512:322d:: with SMTP id f13mr667620lfe.571.1604572352140;
 Thu, 05 Nov 2020 02:32:32 -0800 (PST)
MIME-Version: 1.0
References: <20201026183025.31768-1-khilman@baylibre.com>
In-Reply-To: <20201026183025.31768-1-khilman@baylibre.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 5 Nov 2020 11:32:21 +0100
Message-ID: <CACRpkdYwtvaxL8urR6tUgysM8Svwq48eEi=2eNDp5L084880Tg@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl/meson: enable building as modules
To:     Kevin Hilman <khilman@baylibre.com>
Cc:     "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 26, 2020 at 7:30 PM Kevin Hilman <khilman@baylibre.com> wrote:

> Enable pinctrl drivers for 64-bit Amlogic SoCs to be built as modules.
>
> The default is still built-in, this only adds the option of building
> as modules.
>
> Signed-off-by: Kevin Hilman <khilman@baylibre.com>

Android GKI-inspired?

Patch applied!

Yours,
Linus Walleij
