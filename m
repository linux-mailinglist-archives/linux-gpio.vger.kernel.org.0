Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14A1C480335
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Dec 2021 19:15:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231538AbhL0SPQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Dec 2021 13:15:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229563AbhL0SPP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Dec 2021 13:15:15 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E79CDC06173E
        for <linux-gpio@vger.kernel.org>; Mon, 27 Dec 2021 10:15:14 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id p7so26173406ljj.1
        for <linux-gpio@vger.kernel.org>; Mon, 27 Dec 2021 10:15:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QePlw89EO/5sfYAaVucIDMIjwFM9+kJMi4TaNo3JnOA=;
        b=mJan/ZUi7CoFG1RPg70ekRe5waKZUSmgRBMCrqjwvLl+yb2C4V0ic+4DZzxsdadXeM
         YcTZJ6XZQOB+V47DB9uIN/EsBKvYtDZFm65kVRaxP1X/I2RDhsXMD75wGDQicxEP+elY
         uZTT3xjZ6zESZE5ZrFORsymdskp6WkQw/vMl3pl6eeDkXa5SIudm1Rzx6KZ5giB07gi5
         Rm6xskXchAgDoBECm/fzNWwPHT1rbd+XZsU9wUBap/ij4XunY80DlDozEwxCzcznwvEV
         YGs3ldtDiXsyNfNzA03tH6eyLBJElQO/6W2atBlJtG1ynl1SjEVC2wUx1xwsX5K6+H1/
         ukPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QePlw89EO/5sfYAaVucIDMIjwFM9+kJMi4TaNo3JnOA=;
        b=axBzbxGwzYX6qdX7OnEy4LDAFWv759KxUDjJbdbqa3NdwJRQHOovlIREG972R6uPn3
         xqSekd3tf7Juzj/Sheq6HJLrRBR6uN4JwTZUjsAuSPMffnDFwsdJCuHvBosM7aWu8ZZq
         dA+EB15vO0HUieoeCoFH4kajewPtuzCVsuwI98LFXFJbScjdewp07KRsxo8AkDpkJs0D
         ovVat0p6D6JErQrzagRa9DfM9a41jjYYuseVq6ASiTSNyaxNDJljkleV3+xb7/LB8yoF
         j4jW+b6BnGh25JcbTCfGBbgc1JAwmOjbhrVNlvwZDaBkGkAU7oz7owQ5NQHLf4EAcNuq
         NtEA==
X-Gm-Message-State: AOAM532H4gxpfT4ij0kWxrKk6tknx0tBn2rgA8LTJFPByqqVHh4cIqtx
        TpAlWHYb1L24lq1yFyfMc0PQRXYses2dRQllIX8=
X-Google-Smtp-Source: ABdhPJxf7Q2Fn/Wu2+EWuxExt+I1gW20WfQutkkcPaU44A8BWZiNzKAY5elXHPtIrFVSg8zmFWhl4rBIYHxrPI/xIYQ=
X-Received: by 2002:a2e:8553:: with SMTP id u19mr11548095ljj.6.1640628911977;
 Mon, 27 Dec 2021 10:15:11 -0800 (PST)
MIME-Version: 1.0
References: <20211227080649.32275-3-qianggui.song@amlogic.com> <202112280001.MfQS59Vr-lkp@intel.com>
In-Reply-To: <202112280001.MfQS59Vr-lkp@intel.com>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Mon, 27 Dec 2021 19:15:00 +0100
Message-ID: <CAFBinCB96pGwxBhUxmwihvW+xWF4ex1C-XYO8u6zm6RsmHKaKg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] pinctrl: meson: add pinctrl driver support for
 Meson-S4 Soc
To:     Qianggui Song <qianggui.song@amlogic.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, llvm@lists.linux.dev,
        kbuild-all@lists.01.org, Neil Armstrong <narmstrong@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org,
        kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello Qianggui,

On Mon, Dec 27, 2021 at 5:16 PM kernel test robot <lkp@intel.com> wrote:
[...]
> >> drivers/pinctrl/meson/pinctrl-meson-s4.c:9:10: fatal error: 'dt-bindings/gpio/meson-s4-gpio.h' file not found
In v1 of this series you also included a patch "dt-bindings: gpio: Add
a header file for Amlogic Meson S4".
Rob gave his Acked-by tag which means that you need to keep the patch
in the series but add his Acked-by above your Signed-off-by line.
Patches should only be dropped from a series if they are not relevant
anymore or if they were already applied to a tree by the maintainer.
In this case Rob just gave his Acked-by but the patch was not applied
by any maintainer yet.

Please send a v3 which adds the header file patch back and includes
Rob's Acked-by in there.


Thank you
Martin
