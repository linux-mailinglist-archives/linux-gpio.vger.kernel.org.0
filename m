Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B3AF2D697D
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Dec 2020 22:14:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726878AbgLJVMC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Dec 2020 16:12:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393911AbgLJVLz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2020 16:11:55 -0500
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3E76C0613D3
        for <linux-gpio@vger.kernel.org>; Thu, 10 Dec 2020 13:11:14 -0800 (PST)
Received: by mail-pl1-x643.google.com with SMTP id j1so3438693pld.3
        for <linux-gpio@vger.kernel.org>; Thu, 10 Dec 2020 13:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=VwbWtl7I5SNOkqfVgZBMF+Ns0M8yx5wYS1SIU5pQb/U=;
        b=ihZj7nSGjap4zuU1cvocTPMsVzAcVG+c8r27U7BIAQsJIhQGJHahvDA7mml1atoWOv
         /6jBRBLriIzcyBSmYNt6aY8R8HPhAApld6H74D7uqotaqUmELwXOZ5NsIkMwUdOtee+f
         wb0vVvm2PsSsJQL5NkYzczgswgPD46/5/lE4w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=VwbWtl7I5SNOkqfVgZBMF+Ns0M8yx5wYS1SIU5pQb/U=;
        b=OjrXdOFJjlZz48GZ5MuIkImjS5DBdTY+79ptlSaCqk8CwFveabkWnfndQo6M7ZsA8N
         q3hYiPETcRYIP9s87Z9kLi+eI7oTdDtRcCZ2vvMX0eWT9ZObsXT79HuWhxTbARQlf8Tu
         zI6PVfUxMKr2PkuU6v40Mno96bs8wBAQT4zhWeWFvrRj4zag+shSuKs1UcAjYhWzIBBq
         UgUWcpVmMxtB/foNVGVgUpqsyQktVNXN+geYwBS1OzU8OXQ7EDr3Gk9LxvsN82aT7oY1
         i01wfBM6d7cKveSu7AdaVJytzkXg2vQLhXLHanqj5DXJR4qfkTceoj8TEDgR61+Bjw8q
         ci/w==
X-Gm-Message-State: AOAM532Fcb1tWavcWzhqEX0vV/sxOsog1F7ooSSKMhB+it6jDcoLj0An
        q9qaVJhJtxpGHu3PnrFJrYOfpQ==
X-Google-Smtp-Source: ABdhPJzsLWN8oF/VACejoWTnJtiUEsk4HkfSyYbFZKn2e+Y4Twinla4wH0SCKzt/mRNZ986H55DXVQ==
X-Received: by 2002:a17:902:aa84:b029:da:f114:6022 with SMTP id d4-20020a170902aa84b02900daf1146022mr8011396plr.46.1607634674333;
        Thu, 10 Dec 2020 13:11:14 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id d4sm7171879pfo.127.2020.12.10.13.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 13:11:13 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201209163818.v3.1.I2702919afc253e2a451bebc3b701b462b2d22344@changeid>
References: <20201209163818.v3.1.I2702919afc253e2a451bebc3b701b462b2d22344@changeid>
Subject: Re: [PATCH v3 1/3] irqchip: qcom-pdc: Fix phantom irq when changing between rising/falling
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Srinivas Ramana <sramana@codeaurora.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Neeraj Upadhyay <neeraju@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-gpio@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Archana Sathyakumar <asathyak@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>, linux-kernel@vger.kernel.org
To:     Douglas Anderson <dianders@chromium.org>,
        Jason Cooper <jason@lakedaemon.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>
Date:   Thu, 10 Dec 2020 13:11:12 -0800
Message-ID: <160763467203.1580929.264104038298819006@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting Douglas Anderson (2020-12-09 16:41:01)
> We have a problem if we use gpio-keys and configure wakeups such that
> we only want one edge to wake us up.  AKA:
>   wakeup-event-action =3D <EV_ACT_DEASSERTED>;
>   wakeup-source;
>=20
> Specifically we end up with a phantom interrupt that blocks suspend if
> the line was already high and we want wakeups on rising edges (AKA we
> want the GPIO to go low and then high again before we wake up).  The
> opposite is also problematic.
>=20
> Specifically, here's what's happening today:
> 1. Normally, gpio-keys configures to look for both edges.  Due to the
>    current workaround introduced in commit c3c0c2e18d94 ("pinctrl:
>    qcom: Handle broken/missing PDC dual edge IRQs on sc7180"), if the
>    line was high we'd configure for falling edges.
> 2. At suspend time, we change to look for rising edges.
> 3. After qcom_pdc_gic_set_type() runs, we get a phantom interrupt.
>=20
> We can solve this by just clearing the phantom interrupt.
>=20
> NOTE: it is possible that this could cause problems for a client with
> very specific needs, but there's not much we can do with this
> hardware.  As an example, let's say the interrupt signal is currently
> high and the client is looking for falling edges.  The client now
> changes to look for rising edges.  The client could possibly expect
> that if the line has a short pulse low (and back high) that it would
> always be detected.  Specifically no matter when the pulse happened,
> it should either have tripped the (old) falling edge trigger or the
> (new) rising edge trigger.  We will simply not trip it.  We could
> narrow down the race a bit by polling our parent before changing
> types, but no matter what we do there will still be a period of time
> where we can't tell the difference between a real transition (or more
> than one transition) and the phantom.
>=20
> Fixes: f55c73aef890 ("irqchip/pdc: Add PDC interrupt controller for QCOM =
SoCs")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Maulik Shah <mkshah@codeaurora.org>
> Tested-by: Maulik Shah <mkshah@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
