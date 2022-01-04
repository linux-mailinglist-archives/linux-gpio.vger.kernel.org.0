Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C60D3483D23
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Jan 2022 08:44:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233218AbiADHou (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 4 Jan 2022 02:44:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232279AbiADHou (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Jan 2022 02:44:50 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF37FC061784
        for <linux-gpio@vger.kernel.org>; Mon,  3 Jan 2022 23:44:49 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id x7so79939184lfu.8
        for <linux-gpio@vger.kernel.org>; Mon, 03 Jan 2022 23:44:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CsNGkAuTfXI5FN0re853yKsBlp1/TfiDupH7mdPtEH8=;
        b=iLIudQiTyfDFYG/CACSF02mgQWXC5aLYLwa9g/2H8JEsh1VrCJl6nDz50rIl4zqHUl
         ygOBrnzXzegoATZ+ELlPM94rvvsajU+fBFw8V3JabDkMleG7XsvJhIQea9k8oTFFlpo5
         Yi7VDCdnDnzPtsRb7amOK0sV+skf1qsFsSKWM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CsNGkAuTfXI5FN0re853yKsBlp1/TfiDupH7mdPtEH8=;
        b=5x/RDpmu7+OANe9qkpY/9R0/S4zJ2SvFbeHsT4Bqwl7NgL+XMH0DuCozFf+eKK42vV
         dwqIRW8/7QTWw8g8yU3+c1ZuwKSHK4kW85Si+Go+KxU/rnD0ocU1VlCjd/JVH1VsfS+t
         WAA9xkp/yW69LU4vxZa5aVcOyYFv02wjmZUObegoS6jr7K0ReaJqchW7CEnAVfkNUsuE
         QOwDglakygZ6mkAT7Ufl9hS7n4YGaA3P9snUivPrmqzM/B+BH6ulQrmzmYezAh2sF+Mo
         CJvCTe5lhkoiKbaX9M0FsdE80DbK7rsFnMXGAc2OlKchorU8/ZcjPeZBdzJUIZ0Rz7ou
         wFLw==
X-Gm-Message-State: AOAM5337mlD2R7rnSvhP77ui8FDPHvn0rXeEfbMpueh2gFqxkkUx2C9Q
        7shZQlDlItaXr+tE3GxJW6P/z4vMzvIjZbiwTHcwLA==
X-Google-Smtp-Source: ABdhPJw0YC6U4HEb98OAFpcmS4FVKcETi99MHEMDu4r06NwCCTOcXAZuz1wxcQjSjFJ4W/qnp4p37ec5ZL2rrahOJEo=
X-Received: by 2002:a05:6512:e9a:: with SMTP id bi26mr41350197lfb.371.1641282288318;
 Mon, 03 Jan 2022 23:44:48 -0800 (PST)
MIME-Version: 1.0
References: <20220103101855.17350-1-angelogioacchino.delregno@collabora.com> <20220103101855.17350-2-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220103101855.17350-2-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Tue, 4 Jan 2022 15:44:36 +0800
Message-ID: <CAGXv+5EONgNiQDk0eOVSnVG_U6_=XSpDWADt73x2=tZPt1gL7Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] pinctrl: mediatek: pinctrl-paris: Simplify with dev_err_probe()
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     sean.wang@kernel.org, linus.walleij@linaro.org,
        matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 3, 2022 at 6:19 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Use the dev_err_probe() helper to simplify error handling during probe.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
