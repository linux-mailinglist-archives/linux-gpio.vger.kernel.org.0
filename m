Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E16B62CFF8F
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Dec 2020 23:43:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726024AbgLEWmx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 5 Dec 2020 17:42:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726011AbgLEWmw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 5 Dec 2020 17:42:52 -0500
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7814AC0613CF
        for <linux-gpio@vger.kernel.org>; Sat,  5 Dec 2020 14:42:12 -0800 (PST)
Received: by mail-lj1-x242.google.com with SMTP id t22so10854196ljk.0
        for <linux-gpio@vger.kernel.org>; Sat, 05 Dec 2020 14:42:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SHdiYald3SQmfqCELRiteTEWnXp3ZfGfk9SY21N1e8g=;
        b=SVvTOHh4Zs69djwNMYv71qL9oF7RI5QGKvUzmhjReqMHNEYv3E/3qvnh7Wjc+v12Fq
         /9lgY3NUiC1vZSmliAk6cAxMgAw/jIoR2g5JgVAIEIaZabWHuU7eF4p6BkPZUh4VmH+n
         IgHt3ykhvIkFeobCadpgpyTvOrEU917DIn8wO0wF+CJeuRe3uaPJqjjsk5ANUy3bvGG3
         ArBb4PGc1UGPOrYtm67bm+Zkbe7r2Mpu3v7kYYT46QGAqN/qdPEnHIWPxPbTxIgXy8gm
         4V7CHIolpUydfXBVEKYYuMSyXL4FZtZ2fqvlS2LBmXjgI6kfXXDVwi3yb0pwtK6VTIni
         Dl1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SHdiYald3SQmfqCELRiteTEWnXp3ZfGfk9SY21N1e8g=;
        b=LRkCfnjx9fS8fG+FgojS9rfV60O+QV7AgzLSL4qayWQXvt1KnsD/H/wgwfnfw9hbF1
         FiRyLo8P/LoK0MCryDLmP6uI046hL9Gif9pqLJau07YnRJqDfqKpAg5IJ9VP30YfcAw4
         R7NESk/rHC42xm/HpkENatCsR9fmE1rnEG67n937ZX95HtVXr8wxLPAxE/WIFqyRefzB
         Br/WRaVLxQi/ihLmh+J1YOdwvpUekbbuQ+Ml6MXHTJWoLbguDj/2PHFXoa8311wJ9g/g
         lSW10g8TQn5fP4KrgrvG/uudBWHILLvXioLTcQitKoRBvQEyfv2qs5aK27n0PYngoHBG
         ablQ==
X-Gm-Message-State: AOAM530F/YCYdULZd8zEh3K/RCSbw7zbVrsDqREt37YP2GUx4YmSIlvc
        ddIziwIkat21JAlgX5/96B5hxL6qjGdlJm9mW06dDA==
X-Google-Smtp-Source: ABdhPJyYd5vDNBRhwjAFXY+jiuvd5ruyIhMF2BQaOJzsOsIL79wFNP2RZ8cbPi+Bet9s5pYtD5ZWxt0Rir/LH45T2U4=
X-Received: by 2002:a05:651c:c2:: with SMTP id 2mr5741248ljr.104.1607208131024;
 Sat, 05 Dec 2020 14:42:11 -0800 (PST)
MIME-Version: 1.0
References: <20201202135409.13683-1-andre.przywara@arm.com>
 <20201202135409.13683-3-andre.przywara@arm.com> <20201202155241.ml4qnkz7xq5lnjln@gilmour>
In-Reply-To: <20201202155241.ml4qnkz7xq5lnjln@gilmour>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 5 Dec 2020 23:41:59 +0100
Message-ID: <CACRpkdb4NCXcBCv-+D2go7cNK_LLJsN2HAVicMPRnRhOLQb6DA@mail.gmail.com>
Subject: Re: [PATCH 2/8] pinctrl: sunxi: Add support for the Allwinner H616
 pin controller
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Andre Przywara <andre.przywara@arm.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Icenowy Zheng <icenowy@aosc.xyz>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>,
        Rob Herring <robh+dt@kernel.org>,
        Yangtao Li <frank@allwinnertech.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 2, 2020 at 4:52 PM Maxime Ripard <maxime@cerno.tech> wrote:

> There's a bunch of issues with wrapped lines alignment reported by
> checkpatch --patch.
>
> Once fixed,
> Acked-by: Maxime Ripard <mripard@kernel.org>

Andre, if you resend just the two pinctrl patches with the collected
ACKs I can apply them.

No DT binding changes needed?

Yours,
Linus Walleij
