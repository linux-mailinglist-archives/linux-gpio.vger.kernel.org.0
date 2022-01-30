Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF5034A3326
	for <lists+linux-gpio@lfdr.de>; Sun, 30 Jan 2022 02:53:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353726AbiA3Bxa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 29 Jan 2022 20:53:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234657AbiA3Bx3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 29 Jan 2022 20:53:29 -0500
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 911D4C061714
        for <linux-gpio@vger.kernel.org>; Sat, 29 Jan 2022 17:53:29 -0800 (PST)
Received: by mail-yb1-xb34.google.com with SMTP id m6so29795994ybc.9
        for <linux-gpio@vger.kernel.org>; Sat, 29 Jan 2022 17:53:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1etZ9IjDzBTEkVleweIl3YZgotYIhfaP98loFEGM3L0=;
        b=fne/K7NjcoDH90Udswk9Bkj4SURKXd8ywi5QKQOSplbPhtz5kcCCKyEEqe4LSrFMXn
         yDiQpS4gBNbNtNDHUEQDgVrlZPuQFQl0wn3DXJkz6t/RYz2z087qEf+qBabGqqjFLVLV
         Qgf9WOdWJbWYw6AmzyAZMMMM3YVBCeT1WsALzoP7vmKzAcNmrKyc9lKjjuVGS3kDA+FB
         0FIv9gp0Obh5N7gGkfQBOpV4aZajHlH+InYw3SHFLqAiB09Vhx+Hwh6nXO66SazH8dI5
         tPexWNuKVqeFUN8cVXrSiW3mc3rytQNZ4gQ+NQsF34SVp1hig+OVIgrjvm6SAWDSKJW4
         lplA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1etZ9IjDzBTEkVleweIl3YZgotYIhfaP98loFEGM3L0=;
        b=48JseEqucUI/Z5NO1U6INHsJhsbXhddOY941klyB2I0mJKoXEbLiP0hRWMUdfzigP5
         9c+VZ3P0G+hEMe9UUazO7X+LqTPexgQpxIhoUABV/XnmOZigjrGtVMbme7ZKNgrJF1BL
         m5Pajjh1FXmxjLD2NUTHqWcijDsqOsvgN9C5slEkHjtyOYsB9qb5vB7X4oFEk5bDCwvQ
         3/Xi2lzZGHol5psQwD/H6WEeu9TkmbIhefucLkWI5uQhC76mblVzsMhwg2FTfgoUCvZ7
         yP/oB0yc+e8g6twqBfPuAYcLS8CnraYXIN2wlApRJBBRpUn+zxsv3I5zYXpbuM37CAKB
         02Kw==
X-Gm-Message-State: AOAM531v3dlBezZfNFDCQaGDClKlmfdyfDz9nCgdKDPSm8hQa3uODVnE
        LB9IJ284I2/8omQBMcx2atiJ7dAf1zTSja0e2nZ05A==
X-Google-Smtp-Source: ABdhPJyUGH1z2piANbXPGRmAVLBIfBwy5bibCedidrII3JMdMvlOR1lB93EaHTiTq+/7Zp5gY/DXkDLD0XAOPFGMBck=
X-Received: by 2002:a25:5143:: with SMTP id f64mr23745520ybb.520.1643507608742;
 Sat, 29 Jan 2022 17:53:28 -0800 (PST)
MIME-Version: 1.0
References: <20220113031044.2665-1-qianggui.song@amlogic.com>
In-Reply-To: <20220113031044.2665-1-qianggui.song@amlogic.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 30 Jan 2022 02:53:17 +0100
Message-ID: <CACRpkda-jP8m-os6tjXQj3zOykzDq5cfTp9ir+T-H16N4ZAWcg@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] pinctrl: meson-s4: add pinctrl driver
To:     Qianggui Song <qianggui.song@amlogic.com>
Cc:     linux-gpio@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jan 13, 2022 at 4:10 AM Qianggui Song <qianggui.song@amlogic.com> wrote:

> This patchset adds Pin controller driver support for Meson-S4 SoC
> which shares the same register layout with previous Meson-A1
>
> Changes since v3 at [2]:
> - collect Martin's Acked-by and Reviewed-by
> - remove useless empty line

Patches applied for v5.18!

Yours,
Linus Walleij
