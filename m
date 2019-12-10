Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C97D4118F38
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Dec 2019 18:45:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727495AbfLJRpK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Dec 2019 12:45:10 -0500
Received: from mail-il1-f195.google.com ([209.85.166.195]:35046 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727520AbfLJRpJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Dec 2019 12:45:09 -0500
Received: by mail-il1-f195.google.com with SMTP id g12so16912108ild.2
        for <linux-gpio@vger.kernel.org>; Tue, 10 Dec 2019 09:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3s6PdFrRQnx7SzGv98D/hXCGEbh47W792wAg1h//fM4=;
        b=AuawT6Mj8mrvWP8b/48YgIEtZKfz2N00kND2g9zLXj126JqCyPKltrUJb+YGgldS9z
         8ZNm1rZez/YoUNrRd19EzaBSR7Hw5FAN832y4IXw5rZeuF2Wwx19ZXvjUeGJPIqjoyEX
         /4KbFy5Y58GNjX538KsJ3sKAqDiKZdTjWs1Y4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3s6PdFrRQnx7SzGv98D/hXCGEbh47W792wAg1h//fM4=;
        b=o+mLDl1ccPGJ1UAHAec/HHCl7B4uQ2/4mwAGkK0e8pBx9o3pzivYo6RzbslJNylios
         29vd0quE0WLw6uzDJ5RxJIpwUds5NubiRfSDGRAqCMDatd4M/Qmpud20S2u0ze1WVxyc
         num8UOI8LGRtBtSgvuopS0B6TuJL9gnc5aAYfozHyqDl+b797TQ+MDsqkvQxYUDguMYg
         0ykQhO5MqhoDve6aXHdat6oYzbnPgWypxWBPT/Ga9c8phZVEnS3TUxu/JCqvv9Q+uRJu
         UA1iIOmy8hW0cYEe1Oem8+ZOFFRnIuCA9eIGWg3K7LnXPrUnmxLpCoMCzsp5uTmrQ5GA
         lBgA==
X-Gm-Message-State: APjAAAXFZ1KmVvUHNXf/i/S3ZASbJl2N/6VqEDSgIXRZCu7rQediDYTX
        5G/OVUXcGhVzTDNCyTNlHa12Oxdlf2g=
X-Google-Smtp-Source: APXvYqw2lhBZFZ0iEVLcJZMqnPVyOx4wGemS05XhPVc8jfm/4Nu7C8dC0eI6SB4HEdX+CKK2wZ2G+w==
X-Received: by 2002:a92:d38e:: with SMTP id o14mr35632862ilo.238.1575999908736;
        Tue, 10 Dec 2019 09:45:08 -0800 (PST)
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com. [209.85.166.170])
        by smtp.gmail.com with ESMTPSA id j5sm829875ioq.30.2019.12.10.09.45.07
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Dec 2019 09:45:07 -0800 (PST)
Received: by mail-il1-f170.google.com with SMTP id w13so16910296ilo.1
        for <linux-gpio@vger.kernel.org>; Tue, 10 Dec 2019 09:45:07 -0800 (PST)
X-Received: by 2002:a92:1547:: with SMTP id v68mr3619598ilk.58.1575999907357;
 Tue, 10 Dec 2019 09:45:07 -0800 (PST)
MIME-Version: 1.0
References: <0101016eef165cd0-26845355-ff75-416e-99a2-0c4434e18b76-000000@us-west-2.amazonses.com>
In-Reply-To: <0101016eef165cd0-26845355-ff75-416e-99a2-0c4434e18b76-000000@us-west-2.amazonses.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 10 Dec 2019 09:44:55 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XAhSWOOPrHpuhjObi0UpKaeaD4TX1yhTh64cy39E1wyQ@mail.gmail.com>
Message-ID: <CAD=FV=XAhSWOOPrHpuhjObi0UpKaeaD4TX1yhTh64cy39E1wyQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: sc7180: Add new qup functions
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     LinusW <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On Tue, Dec 10, 2019 at 1:14 AM Rajendra Nayak <rnayak@codeaurora.org> wrote:
>
> on sc7180 we have cases where multiple functions from the same
> qup instance share the same pin. This is true for qup02/04/11 and qup13.
> Add new function names to distinguish which qup function to use.
>
> Reported-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---
>  drivers/pinctrl/qcom/pinctrl-sc7180.c | 60 +++++++++++++++++++++++------------
>  1 file changed, 40 insertions(+), 20 deletions(-)

Two overall issues:

1. I think you also need to update the device tree bindings, so this
should be a 2-patch series.  Those list all possible values for
"function" so you need to update.

2. It would be nice if you mentioned in the commit message that this
will break i2c usage on these QUPs for anyone using old device tree
files.  That shouldn't be a problem (AKA no need to provide backward
compatibility) since I think the main sc7180.dtsi hasn't landed
anywhere yet, but if anyone pulled an early patch from the list it
would be good to give them a heads up in your commit message.


> @@ -976,8 +996,8 @@ static const struct msm_pingroup sc7180_groups[] = {
>         [3] = PINGROUP(3, SOUTH, qup01, sp_cmu, dbg_out, qdss_cti, _, _, _, _, _),
>         [4] = PINGROUP(4, NORTH, sdc1_tb, _, qdss_cti, _, _, _, _, _, _),
>         [5] = PINGROUP(5, NORTH, sdc2_tb, _, _, _, _, _, _, _, _),
> -       [6] = PINGROUP(6, NORTH, qup11, qup11, _, _, _, _, _, _, _),
> -       [7] = PINGROUP(7, NORTH, qup11, qup11, ddr_bist, _, _, _, _, _, _),
> +       [6] = PINGROUP(6, NORTH, qup11_i2c, qup11_uart, _, _, _, _, _, _, _),
> +       [7] = PINGROUP(7, NORTH, qup11_i2c, qup11_uart, ddr_bist, _, _, _, _, _, _),

You probably have a more complete document than I have.  ...but the
one I'm looking at shows that for pins 6/7 only i2c is available, not
UART.  Said another way: I see QUP1_L0[1] and QUP1_L1[1] on Func1 but
I don't see anything on Func2.  Of course, my document also doesn't
include "ddr_bist", so maybe it's just incomplete.

-Doug
