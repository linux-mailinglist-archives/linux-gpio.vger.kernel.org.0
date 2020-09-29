Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4968D27C790
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Sep 2020 13:55:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731275AbgI2Lyi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Sep 2020 07:54:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730749AbgI2Lps (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Sep 2020 07:45:48 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0100C0613D0
        for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2020 04:45:47 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id k25so3730048ljg.9
        for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2020 04:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qpZdtba0dz/55nEB14IRTcskYiW/6pWMryxp9c80244=;
        b=bn2ioNG8Y3op0LV3est95+r9HuyAYayGq9KICtlsy0PPCjUMxNEjMY6mLsEzZyzShx
         0yk3ul77CTVdfxJqDB2C5dGPnPiSdxdfDCSkh8ww2zUWoS3LbxxpY7L5Q5FPrEV9YH9P
         ctQaXFmvzvi3ATvK+h6B3Vht0dDQyajVW0z6sfszgni6mQ0npSrub4Qm0eIvGHhxcQw2
         PpH8rLYu/kkLWkygcw1A1sKLy4iEAaiQfdW3kiCTshMel6GTYYf5PaqkLInt/xcuJEep
         Onxx6NL6Q3Ea+2479Epk96vhh2EblJtMAe2ayYCX7ok2LqWvPrr4Kp6ntj1qL4kk6nty
         /reQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qpZdtba0dz/55nEB14IRTcskYiW/6pWMryxp9c80244=;
        b=TLWGVxnMQQvhdxmRxCeo64CZaLYQEv+D5CtwNRQc2R+pjtTnhD8x2Sd1ydgsjA7Geb
         qJ+DaPWjQObexKL0eB2KDRyOAln1wZnRWQlcLyfiZL4ZT07TQZBIPDtD/EjIg/kTCkPO
         MnDDWO/2DQwNrDh+WQmNwb8PvKp1S8IkrkIJVN2ZZnKAlC5S9Bq5ABHnc1NXYs6sEKzL
         WdDBw7rwwT9k05pNuvKoU9RTJNFe8N9zQiCvRxUHeNbMzjH4t3S+2TzBF0H/c779C5Up
         /DlbYdSWU2T1ZWUfkMURrpL61zWUPzAIDh6kkGAvcJL0NOEMatm1calMcVHdWwahHVj+
         12tw==
X-Gm-Message-State: AOAM532pj0OYl0EJ/ao7UTUL3gC5NPtujSVg9rzV/95yfOeqXymvfWKk
        p9L/YPcMeOVVUQMl++DPWyRvMrbSPAC8TwykP1RGYw==
X-Google-Smtp-Source: ABdhPJwVrIDFHyNdf0I4UGrZT30gdri5pbkWVvCdfi55BBVMAQ95S27AdVvDU3jgAsR5BTdnpwzdvt7bveYbGt/bJdA=
X-Received: by 2002:a05:651c:107b:: with SMTP id y27mr950638ljm.338.1601379946322;
 Tue, 29 Sep 2020 04:45:46 -0700 (PDT)
MIME-Version: 1.0
References: <1599552721-24872-1-git-send-email-Anson.Huang@nxp.com> <1599552721-24872-3-git-send-email-Anson.Huang@nxp.com>
In-Reply-To: <1599552721-24872-3-git-send-email-Anson.Huang@nxp.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 29 Sep 2020 13:45:35 +0200
Message-ID: <CACRpkdbPP61aB0umannqkj+4cVk4cRHmW_JHWvBQ3=4uTjk0pg@mail.gmail.com>
Subject: Re: [PATCH V4 3/3] pinctrl: imx: Support building i.MX pinctrl core
 driver as module
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Sascha Hauer <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Arnd Bergmann <arnd@arndb.de>,
        NXP Linux Team <Linux-imx@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 8, 2020 at 10:18 AM Anson Huang <Anson.Huang@nxp.com> wrote:

> Change PINCTRL_IMX to tristate to support loadable module build.
>
> And i.MX common pinctrl driver should depend on CONFIG_OF to make sure
> no build error when i.MX common pinctrl driver is enabled for different
> architectures without CONFIG_OF.
>
> Also add module author, description and license.
>
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> Reviewed-by: Dong Aisheng <aisheng.dong@nxp.com>

All three patches applied, thanks a lot for working this out!

Yours,
Linus Walleij
