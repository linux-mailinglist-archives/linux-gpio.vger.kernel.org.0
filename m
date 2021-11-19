Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15C9D456F5B
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Nov 2021 14:12:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235372AbhKSNPG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 19 Nov 2021 08:15:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235362AbhKSNPG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 19 Nov 2021 08:15:06 -0500
Received: from mail-ua1-x932.google.com (mail-ua1-x932.google.com [IPv6:2607:f8b0:4864:20::932])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6B65C06174A
        for <linux-gpio@vger.kernel.org>; Fri, 19 Nov 2021 05:12:04 -0800 (PST)
Received: by mail-ua1-x932.google.com with SMTP id i6so21094764uae.6
        for <linux-gpio@vger.kernel.org>; Fri, 19 Nov 2021 05:12:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YM8iEZkWj09QdZV0IaAS62/GEXCOf5MjgxwudLjy2dY=;
        b=cAE33cfo/0N63eGgp8XbsF1lNvSCLdfZ1+2RAHHG4RaBBsTG0gitWfyd/tOn+UlXeK
         q0fSYiClNmlpIxW80wl8/1ziXRzBUdaZ6/JDoFb8RP4KfycfDQIdQvvNBvHrqVTYNaXW
         KT+I/Khok9hk9K03fe9/iYTO36bYC08uzLHs4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YM8iEZkWj09QdZV0IaAS62/GEXCOf5MjgxwudLjy2dY=;
        b=bzTf8qM13+8rsaWd2AQqs7jwe+/JtddpwHWU+WrlSy+KaVCW3PrlBiCEOfZsFkEqy4
         qUMr3BkzYZG1ZprmTjTqxDtOPrrKbDpfqpGonAIeKybGh55oz7jfkal1RPCtYdkkAsPr
         XsXTYQP+nrw3ba0G12mR8MebW5X0EAxoQVddY9xu/jPVgNaCcs/stT1sBaLsxCzkHjkh
         ftKWuDBP28xs7KEQOIOk23ICZ/99G4ItWotl5MQf8X3GNYFa7gSeWqQSpBLvKl0DlQ8n
         dUnAIgPl8R1vCsBtWFamPyt4o0OgTdu/gXFXVKOlFqtk3+2qQdah9DXeoSUxD3dBtLf3
         vDKg==
X-Gm-Message-State: AOAM531WkOCnMtc/UQZLcjiLEC7mDCFUPsT4YnsRZImNELmS8EQRvAXg
        DzaqITVBPAi31SxzcbuThMY923KLfhuzw8s6ZeLZxg==
X-Google-Smtp-Source: ABdhPJx8ZxQW/Y4NgqCFDWKYKJOnuOnviKck4eVR5XbNzsqnkFWtVWE2YsNzXL/5+5sd4UipCMXMaZBVMVKVdagJ3lo=
X-Received: by 2002:a05:6102:38c7:: with SMTP id k7mr87839688vst.45.1637327522660;
 Fri, 19 Nov 2021 05:12:02 -0800 (PST)
MIME-Version: 1.0
References: <20210923065500.2284347-1-daniel@0x0f.com>
In-Reply-To: <20210923065500.2284347-1-daniel@0x0f.com>
From:   Daniel Palmer <daniel@0x0f.com>
Date:   Fri, 19 Nov 2021 22:11:52 +0900
Message-ID: <CAFr9PXmPE_vRcHgPkJp3o=d5HnAV52TFuBe-2hf=hKY8y2=BhA@mail.gmail.com>
Subject: Re: [PATCH v2 00/11] gpio: msc313: Add gpio support for ssd20xd
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        pavel@ucw.cz, DTML <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-leds@vger.kernel.org, Romain Perier <romain.perier@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Bartosz,

On Thu, 23 Sept 2021 at 15:55, Daniel Palmer <daniel@0x0f.com> wrote:

> Daniel Palmer (11):
>   dt-bindings: gpio: msc313: Add compatible for ssd20xd
>   dt-bindings: gpio: msc313: Add offsets for ssd20xd
>   gpio: msc313: Code clean ups
>   gpio: msc313: Add support for SSD201 and SSD202D

Would it be possible to get some comment on these commits and/or get
them picked up?
We (Romain and I) have a few bits that are blocked on this.

Thanks,

Daniel
