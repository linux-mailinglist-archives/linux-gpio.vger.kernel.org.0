Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B9F22FF364
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Jan 2021 19:46:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726852AbhAUInV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Jan 2021 03:43:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727303AbhAUInL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Jan 2021 03:43:11 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E989C061757
        for <linux-gpio@vger.kernel.org>; Thu, 21 Jan 2021 00:42:30 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id n11so1557195lji.5
        for <linux-gpio@vger.kernel.org>; Thu, 21 Jan 2021 00:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pi0sj3/+wConYFVySlKJise6BVe/yIFHbOZK8+wP2Hw=;
        b=M8+7yUnNnT/TdHi3lFSgNku5+tCyTBuqrJhtChIfQx4ntxzPZx3p8LMXIiRlltCAbS
         AMVeJyeiRW6a0x1x1A1yhiMS4yCI1/RhgroDg/wJ5KOyhz0RVk5dXkFkj3zvVwHsaH+c
         A/Xl/K6LEl/TiQ4vJraYpmVFFjDoHlQ3l/sOFbD19ujpTScPQq2W4WRzSls1rXICDpyV
         7LhepZtnv777qQn0yvVAVZSmlzmaJ7/WsYOfAcP8p3HVVw4INFk/csmxUZZa0qqLoh2I
         +VdoRfbTR0Kf+0I71BlTmfA0vHtAKdNHzSosrQqHc+kjY2Xen4IvtQvDk5ELZXzfLMmq
         16nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pi0sj3/+wConYFVySlKJise6BVe/yIFHbOZK8+wP2Hw=;
        b=LSl2UJSQFtqS0s1Vv54EHhqWSW1qWuy9qX6AHX6xdp9VERPgdoZXxrVgC5GHi5B3J+
         qb0jjlD9SrCMVGAPv1A/61qHKkAEX+Y4esvmNYqKDPBLG2a/5pINlcUGxVZQdpNHp9kT
         GQQwwbYG9Ri7DdGAKBGOUfqwX2vQiZPGQrJsqnhm56KFTZvMtPsCLY2bHv/JwYRLyn8e
         jdWrxSme9UdYluMHmaf6lGKVUDw07KdT1R5Gijgs/551oOi9crQtFEI0QA/rAwBxHoAJ
         uKTSKSLN2wicCJ0ey085tGEciusKdKDF7JNw1WeI39BOAUzosvoxzw5GPT8jKqes5IEY
         pk3Q==
X-Gm-Message-State: AOAM533BxqhjZQYDjEhaPm76veo+cH4d9/Ocn+wULP/Ew/Ai5qYJ2KTa
        MfeJZDTbjnYlm21wJXKweah0XcWpcX1aUpnk3voMxQ==
X-Google-Smtp-Source: ABdhPJwWvB7or4JEqq+Rg6Ql5mwu4stBzqNMOJu03il5t/HLMwzoABuVBA2UPpyzwWDiWIjkBM6W5zAAKolt5XCOUaQ=
X-Received: by 2002:a05:651c:205b:: with SMTP id t27mr6306268ljo.368.1611218549062;
 Thu, 21 Jan 2021 00:42:29 -0800 (PST)
MIME-Version: 1.0
References: <20210120132045.2127659-1-arnd@kernel.org> <20210120132045.2127659-2-arnd@kernel.org>
In-Reply-To: <20210120132045.2127659-2-arnd@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 21 Jan 2021 09:42:18 +0100
Message-ID: <CACRpkdZYpS7mkFem_3xLp9HUiB2wtejU-Xu+AKuXvmUmOzixHg@mail.gmail.com>
Subject: Re: [PATCH 1/5] gpio: remove zte zx driver
To:     Arnd Bergmann <arnd@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Jun Nie <jun.nie@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jan 20, 2021 at 2:20 PM Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
>
> The zte zx platform is getting removed, so this driver is no
> longer needed.
>
> Cc: Jun Nie <jun.nie@linaro.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
