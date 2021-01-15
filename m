Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 134D82F70E2
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Jan 2021 04:20:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732460AbhAODUG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 14 Jan 2021 22:20:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729257AbhAODUF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 14 Jan 2021 22:20:05 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E589C0613C1
        for <linux-gpio@vger.kernel.org>; Thu, 14 Jan 2021 19:19:25 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id y12so4280721pji.1
        for <linux-gpio@vger.kernel.org>; Thu, 14 Jan 2021 19:19:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=x4FBc9O82mLwuBIYHsjWOjbvAlD6yiol0Z+T88PC/zQ=;
        b=Qyp8gRZvW/3Drd2bA1Ib8XVZ398D3Q7q2jBLpx01Adj3VlJ1xbADdf/RwhTa528vag
         Rm482dObSn+/simqn8sm+BQRcLViFlbSn4FRPdIEzg/WTFaHjlKJRtDvJaz9VXs/wDRT
         5xU7cWOpnbXwxs9ArDuvkbV7n7oUcJLEpgsbA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=x4FBc9O82mLwuBIYHsjWOjbvAlD6yiol0Z+T88PC/zQ=;
        b=k0bqjUvIUR4DYId3pezZKlt8zv9U04YOmMR00cSGJOlCZ2wzChi/7Q815eXpNYinom
         qcLslrRlL7Uh3hqwmLA+WiH51AzE3ecrHKW2bow+orN9Wncj1cD+ItYUPsWRdzea9zei
         TxMUNbHszBgBqdAn/IZm5EAFkIaomJ1wj2RjzVVA29hqmpvXkiNMP/m5Y+A7B7zGhDaM
         OBdDNd6N5WjyjfAjblBiVNA9JOdzcKOKXQE9FXV/pv4pB5x1Cei5wN5WxI1wC/7QxHdc
         0lPsmR4WW3bdW22r/mnbDsKlb2/H2hb+MFCH+Ggla6+Q6fOul2L/s8cNCpCQVQ/qmhrJ
         9EiA==
X-Gm-Message-State: AOAM532zTaouIHTvV3sT5W/NdNRy2TcVB0xG43Ae5k+3F67p5dYpkEg3
        I7+UWGpl14E2lfRnkJ+5r2hhSQ==
X-Google-Smtp-Source: ABdhPJxJ/FjQHhgUkexO4OnMOFbf52AYYclIrUodYUPvwiumxigQiNUSzUyqXpXhHavHTlVUgsayTg==
X-Received: by 2002:a17:90a:77c1:: with SMTP id e1mr8457773pjs.141.1610680764632;
        Thu, 14 Jan 2021 19:19:24 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id w19sm6432582pgf.23.2021.01.14.19.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 19:19:24 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210114191601.v7.4.I7cf3019783720feb57b958c95c2b684940264cd1@changeid>
References: <20210114191601.v7.1.I3ad184e3423d8e479bc3e86f5b393abb1704a1d1@changeid> <20210114191601.v7.4.I7cf3019783720feb57b958c95c2b684940264cd1@changeid>
Subject: Re: [PATCH v7 4/4] pinctrl: qcom: Don't clear pending interrupts when enabling
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Neeraj Upadhyay <neeraju@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Srinivas Ramana <sramana@codeaurora.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org
To:     Douglas Anderson <dianders@chromium.org>,
        Jason Cooper <jason@lakedaemon.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>
Date:   Thu, 14 Jan 2021 19:19:22 -0800
Message-ID: <161068076244.3661239.337771722271707457@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting Douglas Anderson (2021-01-14 19:16:24)
> In Linux, if a driver does disable_irq() and later does enable_irq()
> on its interrupt, I believe it's expecting these properties:
> * If an interrupt was pending when the driver disabled then it will
>   still be pending after the driver re-enables.
> * If an edge-triggered interrupt comes in while an interrupt is
>   disabled it should assert when the interrupt is re-enabled.
>=20
> If you think that the above sounds a lot like the disable_irq() and
> enable_irq() are supposed to be masking/unmasking the interrupt
> instead of disabling/enabling it then you've made an astute
> observation.  Specifically when talking about interrupts, "mask"
> usually means to stop posting interrupts but keep tracking them and
> "disable" means to fully shut off interrupt detection.  It's
> unfortunate that this is so confusing, but presumably this is all the
> way it is for historical reasons.
>=20
> Perhaps more confusing than the above is that, even though clients of
> IRQs themselves don't have a way to request mask/unmask
> vs. disable/enable calls, IRQ chips themselves can implement both.
> ...and yet more confusing is that if an IRQ chip implements
> disable/enable then they will be called when a client driver calls
> disable_irq() / enable_irq().
>=20
> It does feel like some of the above could be cleared up.  However,
> without any other core interrupt changes it should be clear that when
> an IRQ chip gets a request to "disable" an IRQ that it has to treat it
> like a mask of that IRQ.
>=20
> In any case, after that long interlude you can see that the "unmask
> and clear" can break things.  Maulik tried to fix it so that we no
> longer did "unmask and clear" in commit 71266d9d3936 ("pinctrl: qcom:
> Move clearing pending IRQ to .irq_request_resources callback"), but it
> only handled the PDC case and it had problems (it caused
> sc7180-trogdor devices to fail to suspend).  Let's fix.
>=20
> From my understanding the source of the phantom interrupt in the
> were these two things:
> 1. One that could have been introduced in msm_gpio_irq_set_type()
>    (only for the non-PDC case).
> 2. Edges could have been detected when a GPIO was muxed away.
>=20
> Fixing case #1 is easy.  We can just add a clear in
> msm_gpio_irq_set_type().
>=20
> Fixing case #2 is harder.  Let's use a concrete example.  In
> sc7180-trogdor.dtsi we configure the uart3 to have two pinctrl states,
> sleep and default, and mux between the two during runtime PM and
> system suspend (see geni_se_resources_{on,off}() for more
> details). The difference between the sleep and default state is that
> the RX pin is muxed to a GPIO during sleep and muxed to the UART
> otherwise.
>=20
> As per Qualcomm, when we mux the pin over to the UART function the PDC
> (or the non-PDC interrupt detection logic) is still watching it /
> latching edges.  These edges don't cause interrupts because the
> current code masks the interrupt unless we're entering suspend.
> However, as soon as we enter suspend we unmask the interrupt and it's
> counted as a wakeup.
>=20
> Let's deal with the problem like this:
> * When we mux away, we'll mask our interrupt.  This isn't necessary in
>   the above case since the client already masked us, but it's a good
>   idea in general.
> * When we mux back will clear any interrupts and unmask.
>=20
> Fixes: 4b7618fdc7e6 ("pinctrl: qcom: Add irq_enable callback for msm gpio=
")
> Fixes: 71266d9d3936 ("pinctrl: qcom: Move clearing pending IRQ to .irq_re=
quest_resources callback")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Maulik Shah <mkshah@codeaurora.org>
> Tested-by: Maulik Shah <mkshah@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
