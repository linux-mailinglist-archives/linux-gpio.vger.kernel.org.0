Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13219600C53
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Oct 2022 12:23:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230076AbiJQKXp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Oct 2022 06:23:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230255AbiJQKXf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Oct 2022 06:23:35 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A662A5FF71
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 03:23:30 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id d26so23784301ejc.8
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 03:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tqee7ifY/82cpfDhy+EzyK8BTEtOxszewNmMPAH/KD8=;
        b=w+CEh2VLHTZowHwO2PIC9siQeHDs21c7EtC9P/D2c6V0BoyTYTA8gsKGX8Wh3fmNEc
         V9U70U2o7+3k1YUzu65AECr4lIch7YrIhoNuldYYQDsRSd0XAj1waYEdiIuJYmtVR1hU
         NrxPR+k7SgUBYt57XnYzvjyCitIhJKddXl+WlvwgyDwd+yud3DVrAN7NvTAyKgq/6XeN
         0s2cbgNqAU3L1ZmUSUKqkYfNNyBMFSPJI9gX/AodeZ65VIn0PcLL7RKTrtNu6AGLHytB
         NqIceG7xAqIBX7g2loEAfkd6nheJaY+n+j+vlxgVbACy1ihKkKBk16CIGSzyQ1EgUkji
         RTSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tqee7ifY/82cpfDhy+EzyK8BTEtOxszewNmMPAH/KD8=;
        b=z/UAU6FY5RI+OcRIBNJgBkZ0/8VI7Ez49DdpGWJkGN2sywh43Qix14ExHfr0KCpMxs
         HD7LHW21OpHXrJf5LOX/+/EvMI0CvaYMwMdvN8fRtrEWMjIR3DkU2jwIeYv0DGvZY0uQ
         1vpRf7yN7M87UKJYxlGEydsz37XLyqVsZ+k96yMFLGlFNrhnejHPWsHqRLHe3jhzbORf
         mdIC7GmAd5x6Uu2oyuYnunfBCG5JKZYXU2elDTlk6fiPjisSaZSMM+8jP4dwasQaKn/Q
         kOK4gDFUE4Wiabbi4cUDG1C+VeMTPEC5IuNXqONDbV0DfdH1Xc2MVWhtYeRUOniefc/f
         MBHQ==
X-Gm-Message-State: ACrzQf1k2k3uV/2iMuK0COIuyIfa08SkzJMkeSwhBT5/ekupKBIbw85e
        9+Q2Eui/I5GNtW/SNDCK3UGvKTsjbZPwxBn4X4SMK628ubjCvA==
X-Google-Smtp-Source: AMsMyM7aHKV0MzUn2Ky4OxH4k/wzMa1Mxrxl2xwPbqh4cnl48oML4T721ClFJLoqQRE9kaC1d0AD8d51VRlQ+RFf/08=
X-Received: by 2002:a17:907:a06b:b0:78d:d25f:b726 with SMTP id
 ia11-20020a170907a06b00b0078dd25fb726mr8100720ejc.203.1666002209004; Mon, 17
 Oct 2022 03:23:29 -0700 (PDT)
MIME-Version: 1.0
References: <20221013215946.216184-1-marex@denx.de>
In-Reply-To: <20221013215946.216184-1-marex@denx.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 17 Oct 2022 12:23:17 +0200
Message-ID: <CACRpkdZG4a2SsNiunxz0SHR6kuXLX34LZcYp0dGakDigwbGdHw@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] gpio: mxc: Protect GPIO irqchip RMW with bgpio spinlock
To:     Marek Vasut <marex@denx.de>
Cc:     linux-gpio@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Loic Poulain <loic.poulain@linaro.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 14, 2022 at 12:00 AM Marek Vasut <marex@denx.de> wrote:

> The driver currently performs register read-modify-write without locking
> in its irqchip part, this could lead to a race condition when configuring
> interrupt mode setting. Add the missing bgpio spinlock lock/unlock around
> the register read-modify-write.
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Reviewed-by: Marc Zyngier <maz@kernel.org>
> Fixes: 07bd1a6cc7cbb ("MXC arch: Add gpio support for the whole platform")
> Signed-off-by: Marek Vasut <marex@denx.de>

Unrelated, but Marek can you have a look at this MXC patch since
you're obviously working on the platform:
https://lore.kernel.org/linux-gpio/20221007152853.838136-1-shenwei.wang@nxp.com/

Yours,
Linus Walleij
