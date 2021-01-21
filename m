Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B18D2FF720
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Jan 2021 22:25:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726484AbhAUVY5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Jan 2021 16:24:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726286AbhAUVYz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Jan 2021 16:24:55 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0EDAC0613D6
        for <linux-gpio@vger.kernel.org>; Thu, 21 Jan 2021 13:16:21 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id o13so4604112lfr.3
        for <linux-gpio@vger.kernel.org>; Thu, 21 Jan 2021 13:16:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AJMbcpqakYgYbSWiFhniHQzFytDPx5jXHRJjSlBJ/6I=;
        b=HzJ15yYZRVTnNP6KMNkvr0vHVmtiez5s0o9FUlPkh4PNTm28WJju3+i7WJXHEIMadw
         C3Yy1c52oyZ5cAH1mad2wr1akRqPTJHTU4dbLa/BPy2M+s5afrU369JtVN0EZKouIhhA
         ZkMVSjldzC5vt0/10ydyvrl3nue2Dv4I2N3QqI0TzHJT8rixU/x3VEdJhBX9doz2n+d4
         nclUAfYCpbBpOIbwYygW6XI1RNXSy0HIc4q3hqjVb6aMW27yMlS8Xsp0kT2VmHIZ5L1T
         khCJrFxEPhPaGhpUoHn/TLcGa+9niID+7Kc0OpqLhZHfSwNUjwpakGT1xB4xn9pVVMW2
         K7vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AJMbcpqakYgYbSWiFhniHQzFytDPx5jXHRJjSlBJ/6I=;
        b=JydEEazo4Da9ylBDBBY28Q8btYR8dMLbAeFQtNGLRHdFCERKBa8E4/0EqzwC6Yi3Jh
         KoOdM3mp8K38vNv8PoYgkT3MzH8t9NbUQYDAz9Z1nyioxvFviXIOKvut76yooABTSFP0
         /NTvu8SVxtJKUIeio+iKdV6hnNVQM/PJUoz/B6968W7kYvxLQ/RKFFcym+LWFqVXatRW
         SbWo0QEZ8PRDt3AVtDkQCJHWIo1zbjwm4UrdVOqdm6ke7sN5UTnc7maGjCduDKtyhAEt
         nfdhj5oOSlMhHCe83y2Ulc8XGUNrBoi99IGfOQCC1t8IZaym7FLFQT81WSiHgRlAeG9T
         iw5g==
X-Gm-Message-State: AOAM533JRbjVFLNOGIc3q81xdFZjtUiEGGu31815YBzkyVQ8SDDeRKOT
        IU9D/V3KWc7tOmr+7msKTZLEMBGwgoULqa0BRxn0JQ==
X-Google-Smtp-Source: ABdhPJyfxfrCCN9TrVg8fCuUhUVMZ9Rx0Lb8R8TFF6VfIZ8lWtlisVhy+Y766IKSgvo4k4zz67AKUahPOB8leCoIWKQ=
X-Received: by 2002:ac2:5c45:: with SMTP id s5mr564739lfp.586.1611263778779;
 Thu, 21 Jan 2021 13:16:18 -0800 (PST)
MIME-Version: 1.0
References: <20210118020848.11721-1-andre.przywara@arm.com> <20210118020848.11721-6-andre.przywara@arm.com>
In-Reply-To: <20210118020848.11721-6-andre.przywara@arm.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 21 Jan 2021 22:16:08 +0100
Message-ID: <CACRpkdbY4V8C-7KXWx700fauUOjyQk04ghKQhKoZ6nxO2FE2nw@mail.gmail.com>
Subject: Re: [PATCH v3 05/21] pinctrl: sunxi: Add support for the Allwinner
 H616-R pin controller
To:     Andre Przywara <andre.przywara@arm.com>
Cc:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Icenowy Zheng <icenowy@aosc.io>, Rob Herring <robh@kernel.org>,
        =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Shuosheng Huang <huangshuosheng@allwinnertech.com>,
        Yangtao Li <tiny.windzz@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 18, 2021 at 3:09 AM Andre Przywara <andre.przywara@arm.com> wrote:

> There are only two pins left now, used to connect to the PMIC via I2C.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Acked-by: Maxime Ripard <mripard@kernel.org>
> Reviewed-by: Jernej Skrabec <jernej.skrabec@siol.net>

Patch applied to the pinctrl tree.

Yours,
Linus Walleij
