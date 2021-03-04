Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E474232CEBF
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 09:50:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236650AbhCDIte (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Mar 2021 03:49:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236651AbhCDItK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Mar 2021 03:49:10 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29545C06175F
        for <linux-gpio@vger.kernel.org>; Thu,  4 Mar 2021 00:48:30 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id q25so21641907lfc.8
        for <linux-gpio@vger.kernel.org>; Thu, 04 Mar 2021 00:48:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=H2wbxkZ5EFhhbbOmwBTKlvU1xjWHEm3aG6/6XZryrvM=;
        b=aP2tQTyLBKDPBoAnWKTOPwDqLrDfAzvHWjHRByw8Q2HneMAUDwP/6S3cHX5ozzAxSc
         mr/c++GCpYQcsIn0n4iMZK9iT+3Y7/GTWYLayG5b/NiUHV292Obc1KsdVePmOAGnuFnP
         dLZ/btA6PpMa1U/KMCHGMNAhub4bmozr5RJZbJ75y+St9LLksdz4HQpeMyyM7q0NGTKb
         XJDLW/N8DaA3AIdtaanC7CBGLXPw/Uhx+oOn1uJvR86/6/n8c4BOOsXxLikhMEf/1yeJ
         Ywnj2iLiASEAeh15xadVyP/Dpk+E/MQpIq83p6oFAXLQOHQhWs+U1ByEjbei5Bug16y2
         fJyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H2wbxkZ5EFhhbbOmwBTKlvU1xjWHEm3aG6/6XZryrvM=;
        b=Kxwwa6pGOU1V2wfssxAo23iJ1KPAMKdS1BA8k/zoMOXWF1xi0CmQrdJovzWcDqXYlF
         FgPaq6VWy3uux0D1As+WsRGZTULebbSNiTKLH0caSZ9XfqXLjEIWgSXKRNZX/OV1x++t
         0A4bZ0fjiiwUSM4s3B42qIjLOtFafAz1UbDtoA1vkdIz9xx5Cz2oWa8IaObI9aZPlgZ1
         lRdlW7FdWr+WTaz97hRiAPwDc/9M9ryoECFVKm1CuakGLA1YG5EOFHzR/++YMNxS+6jR
         lCmyke9Doo3aaGLjI3Wdc2SR6y7ASM6NYScT4W+a/XrAt8LzbG8bxLkWZ58UhNbf1sLi
         +NBw==
X-Gm-Message-State: AOAM53253t86CY4ufz63cQ1D/4eNPd8BfAW789UWQWJQAadl3tAGZ5Ko
        Rs6tIYjfzJQuHcBuu8UmgB6sCH44Dv/MEaKIFfdTCA==
X-Google-Smtp-Source: ABdhPJy1+p6e1tWc1GyX6LEEz232ReBa7exSHnMHwCH8+LPQuXuIdaQFmdvSbMVG2X4FN7uvfv/aIVi6+AmRoKuFNHc=
X-Received: by 2002:a05:6512:547:: with SMTP id h7mr1696001lfl.529.1614847708722;
 Thu, 04 Mar 2021 00:48:28 -0800 (PST)
MIME-Version: 1.0
References: <20210304034141.7062-1-brad@pensando.io> <20210304034141.7062-4-brad@pensando.io>
In-Reply-To: <20210304034141.7062-4-brad@pensando.io>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 4 Mar 2021 09:48:18 +0100
Message-ID: <CACRpkdbqkmUXTPyX8OFxBRJahEL-vdxR0wP=rMAWud34bq7tcQ@mail.gmail.com>
Subject: Re: [PATCH 3/8] spi: dw: Add support for Pensando Elba SoC SPI
To:     Brad Larson <brad@pensando.io>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mark Brown <broonie@kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Olof Johansson <olof@lixom.net>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-spi <linux-spi@vger.kernel.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 4, 2021 at 4:42 AM Brad Larson <brad@pensando.io> wrote:

> The Pensando Elba SoC uses a GPIO based chip select
> for two DW SPI busses with each bus having two
> chip selects.
>
> Signed-off-by: Brad Larson <brad@pensando.io>

I agree with Serge's comments here: the existing cs callback should
work for your SoC, you should only need the new compatible string.

I see why you need the special GPIO driver for this now, as that
is obviously driven by totally different hardware.

Yours,
Linus Walleij
