Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B662252165
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Aug 2020 21:59:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726697AbgHYT7N (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 Aug 2020 15:59:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726149AbgHYT7K (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Aug 2020 15:59:10 -0400
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com [IPv6:2607:f8b0:4864:20::942])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C229C061755
        for <linux-gpio@vger.kernel.org>; Tue, 25 Aug 2020 12:59:10 -0700 (PDT)
Received: by mail-ua1-x942.google.com with SMTP id u46so3586uau.6
        for <linux-gpio@vger.kernel.org>; Tue, 25 Aug 2020 12:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AyZxIenRzLRb0uRNdBtgusm7ii5Z3WvQsO/+O8B9aLw=;
        b=b+B9hcGB4rLX+gwJzENPKtNLlKGAgqbg52OJSJg1f0lT1z9E4c9rD3zsD6Zs3A/4y6
         cHhV2Z10WGiLIf3VBY6UQvvTeU+eAn8mpZw+QeyjOGm8nzZ6glkmyD4YKNzyo0KH4ngq
         9bN1QNwPEZriPLnpyzBN33I9fBMC/Nnhx1jD0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AyZxIenRzLRb0uRNdBtgusm7ii5Z3WvQsO/+O8B9aLw=;
        b=S6X1Xi43CLd74LWYdaGaLQXHwN89qfEN/3evVuMo1jDnlWEegyV31IrMVPKUPny7fv
         IQZKxxUYV4kCiU9qeF0OrX2z4XVT/tlzYJ8+84Bd/NGE2CKS80mtKIQPOqqQlIdT3nB0
         U8e12bBw/bgwGGKpkcOZDU2J6zYEK32rvZpGxGvlsyEfcvO1u/92fg19VNQmi3EAhvWk
         nROjvY7GUbSAZB8y3Dldy2w1SGgNh53rc8pJI578WdQV0WtTHe7TQlFk6MWqKX4gYUV/
         6yKi+I/pRijgsg6+d7CZwv2BeTgIXKylTw37dKPBiDEfVF1jCql7laWqvsS5RiNZu8n5
         2GNQ==
X-Gm-Message-State: AOAM530APcBT63TebqpC+40NogVpulJipAN7RYSRbYvab/6CCbQkUK3g
        jzBMymk/DkdjOMBnh1RZYU2qwC7+uaHQWQ==
X-Google-Smtp-Source: ABdhPJxuWKyEHvT7F65xFyiy4pj1qPtVzW71x0p5YLAAG4l+Fkn10GqF//7D2cTHINUeG4NQMvwz/Q==
X-Received: by 2002:ab0:21cf:: with SMTP id u15mr5580657uan.85.1598385549088;
        Tue, 25 Aug 2020 12:59:09 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id t65sm349329uat.9.2020.08.25.12.59.07
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2020 12:59:08 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id y2so13164uaq.0
        for <linux-gpio@vger.kernel.org>; Tue, 25 Aug 2020 12:59:07 -0700 (PDT)
X-Received: by 2002:a9f:2966:: with SMTP id t93mr6981969uat.90.1598385547221;
 Tue, 25 Aug 2020 12:59:07 -0700 (PDT)
MIME-Version: 1.0
References: <1598113021-4149-1-git-send-email-mkshah@codeaurora.org> <1598113021-4149-5-git-send-email-mkshah@codeaurora.org>
In-Reply-To: <1598113021-4149-5-git-send-email-mkshah@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 25 Aug 2020 12:58:55 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WMSx4ORdztkb1L-zh+pYEsQOLLALRNjazaZFsEk0Rvkw@mail.gmail.com>
Message-ID: <CAD=FV=WMSx4ORdztkb1L-zh+pYEsQOLLALRNjazaZFsEk0Rvkw@mail.gmail.com>
Subject: Re: [PATCH v5 4/6] pinctrl: qcom: Set IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND
 flag
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        LinusW <linus.walleij@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Srinivas Rao L <lsrao@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On Sat, Aug 22, 2020 at 9:17 AM Maulik Shah <mkshah@codeaurora.org> wrote:
>
> Set IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND flag to enable/unmask the
> wakeirqs during suspend entry.
>
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> ---
>  drivers/pinctrl/qcom/pinctrl-msm.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
