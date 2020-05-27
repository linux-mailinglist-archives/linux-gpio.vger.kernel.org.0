Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67AD61E3DED
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2020 11:47:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728829AbgE0Jre (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 May 2020 05:47:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728264AbgE0Jre (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 May 2020 05:47:34 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E07DAC03E96E
        for <linux-gpio@vger.kernel.org>; Wed, 27 May 2020 02:47:33 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id w20so6520039pga.6
        for <linux-gpio@vger.kernel.org>; Wed, 27 May 2020 02:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=OLF9lwE2e7f3o0945da1l86g58aoVITOUEe8pjdIEuE=;
        b=WeawMs02Jy51FJdzoYqEttg8/jkn4FfmUv5EVDbRCdQOjiOEcKeQirpE1wqrdNxcwC
         EEmb8GyzPBHsKwF9ew3PbKmO2LUc91/iwPVZbcCZip7ErnfaEN/GL7No/njB4E/BY9na
         U90MwcpoxJsQlD7v7aWP0PfWzgzHGTq8VURtk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=OLF9lwE2e7f3o0945da1l86g58aoVITOUEe8pjdIEuE=;
        b=aOP4neduuhZl6WaOI0ZM/SYZ5CMckmSV/GIgikFAUsxJzNDBb87MJMuxc3UZHidWmg
         EkJTsxYLaSZMeoMhou7bqHqEZAh75hr19y+2niNMkmyo5IO1AYGLyBEmspeI+iQca1hN
         FlpfMUb0xG9TU+4u5rH9dWaY7foTxNakZcB8ODR+eDWiPJy8wv0YV2MtBCZHJQ6kBHVq
         Pi0HcvC3NXcP/SL0v9UyZXuOQ/QHZxGSy07lcFljr0KbXKsGGcOgprKYtiiDdS9heVIR
         Z92Nz7XtyZqfQosYzZq4nE7Mm6xOn9ZS3+9icSpbleUnSHvNuAvagV/Ghor2GhOVINOW
         dY7w==
X-Gm-Message-State: AOAM531d80be+d1BTVDmCBr2K0wXH2TqtO25AbGrUEKdKqpzd5mcWnyJ
        DnNeEIeCj6GzXKypB5ZsqyDccA==
X-Google-Smtp-Source: ABdhPJwyjsJiyOwvaVNB+4wG3UIVuWYeMXY2/2AN1qH2vGamYlPhvf4//LLrFzBFd2CcXp/G4SbucA==
X-Received: by 2002:a62:e419:: with SMTP id r25mr3178210pfh.82.1590572853451;
        Wed, 27 May 2020 02:47:33 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id l25sm1731006pgn.19.2020.05.27.02.47.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2020 02:47:32 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1590253873-11556-4-git-send-email-mkshah@codeaurora.org>
References: <1590253873-11556-1-git-send-email-mkshah@codeaurora.org> <1590253873-11556-4-git-send-email-mkshah@codeaurora.org>
Subject: Re: [PATCH v2 3/4] pinctrl: qcom: Add msmgpio irqchip flags
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, agross@kernel.org, tglx@linutronix.de,
        jason@lakedaemon.net, dianders@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org,
        Maulik Shah <mkshah@codeaurora.org>
To:     Maulik Shah <mkshah@codeaurora.org>, bjorn.andersson@linaro.org,
        evgreen@chromium.org, linus.walleij@linaro.org, maz@kernel.org,
        mka@chromium.org
Date:   Wed, 27 May 2020 02:47:31 -0700
Message-ID: <159057285160.88029.12486371130122290394@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting Maulik Shah (2020-05-23 10:11:12)
> Add irqchip specific flags for msmgpio irqchip to mask non wakeirqs
> during suspend and mask before setting irq type.

Why do we need to mask before setting irq type? Does something go wrong?
Can you explain in the commit text?

>=20
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>

Does this need a Fixes tag?

> ---
>  drivers/pinctrl/qcom/pinctrl-msm.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pi=
nctrl-msm.c
> index 2419023..b909ffe 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -1143,6 +1143,8 @@ static int msm_gpio_init(struct msm_pinctrl *pctrl)
>         pctrl->irq_chip.irq_release_resources =3D msm_gpio_irq_relres;
>         pctrl->irq_chip.irq_set_affinity =3D msm_gpio_irq_set_affinity;
>         pctrl->irq_chip.irq_set_vcpu_affinity =3D msm_gpio_irq_set_vcpu_a=
ffinity;
> +       pctrl->irq_chip.flags =3D IRQCHIP_MASK_ON_SUSPEND

This is sort of sad. We have to set the IRQCHIP_MASK_ON_SUSPEND flag
here so that genirq can call the mask op during suspend for the parent
irqchip (pdc)? Is there some way to not need to do that and instead let
genirq do mask on suspend at the chip level instead of the irq level?

> +                               | IRQCHIP_SET_TYPE_MASKED;
> =20
>         np =3D of_parse_phandle(pctrl->dev->of_node, "wakeup-parent", 0);
>         if (np) {
