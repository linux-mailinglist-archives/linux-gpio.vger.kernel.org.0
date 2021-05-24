Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEA7E38F68C
	for <lists+linux-gpio@lfdr.de>; Tue, 25 May 2021 01:55:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229912AbhEXX47 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 May 2021 19:56:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229503AbhEXX47 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 May 2021 19:56:59 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75EE1C06138A
        for <linux-gpio@vger.kernel.org>; Mon, 24 May 2021 16:55:29 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id q3so12955487lfu.2
        for <linux-gpio@vger.kernel.org>; Mon, 24 May 2021 16:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=592zjrjs71MnPKYyPd/8Gk+j2UZLngCEKFNFLQ96mQY=;
        b=Hi7md/ohZBbgNkX+gRP/A7hbkMRs56Dn/rd+BvZrdxnMamaGNiflZLG96US3F7f0yw
         1UmztCpe3Rp7VFYMFm1l1VwnRNrT54ENZj0ZwoC7kdx7N8rOmTaEh1K+RfcdsnBiNpk+
         vWOyNBfaty36OI3DinuIPd9/uw1VZ9G89qb1Xw1QwOzpBUZwnYRyyNWokcC6Op7gDim+
         RUTgrZGzXfeU2xGy71lxqxLlLUNa91w9hJy0D+a1hin9uW44SQJ5dJapRN9mCBRqVXvP
         ug7d5hDgNauAHWQ1D7epY8msb6hu1NcAn4mkeP2GaAUx3QcYcgpAomtSNBNBk1vBZ84Y
         iA/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=592zjrjs71MnPKYyPd/8Gk+j2UZLngCEKFNFLQ96mQY=;
        b=r1rZcuwCrs0g2JPA4t/QB6z8YwlyaGuqYbu+zSeUT2LyTGL1lTmxzRG5XjcNXp1DwC
         WKt1GdAL6wU4kW3pxog60LHLXVDmnaP0OKAfu3kWPhONi63W5TVYHLr7nw2B4QtPAMjl
         OIzuQhNTvLN/4k1F6uI1DfdYkhRMAXBIW48CZWptJMVHYSIY00l1KuXrhVC0agOcvrgV
         XwEkcps5TMGztJG8mI7zN4J2+tsnokr8YpQ6e0p3KTJTFZNWNMz/uHQkJIOup6IhG84o
         DYHquT//oRu9/9/TcDlVjPsLPWo9JiXv7HVywSDv7gtNbZUi8qjjIi9luW9CiAkK+C+5
         TCNg==
X-Gm-Message-State: AOAM5303i0qJ5ktJZL6M0012RZZBDf7uYEE/tV7IgGvYJFohnfvMMEKn
        jdtJspvgpErATdcgXK3+jDuSiE6mAyGLGe3OQDIlgw==
X-Google-Smtp-Source: ABdhPJx/e/kNcfBBwSrujRvi50rqAYpED4xQ/1Z1KiwOS/qb69WenvVA5bxXAGKmpbikyGXHTzGCq3bA7YejdGNjNPU=
X-Received: by 2002:a05:6512:11ea:: with SMTP id p10mr11650728lfs.157.1621900527740;
 Mon, 24 May 2021 16:55:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210510063602.505829-1-jay.xu@rock-chips.com> <20210510063602.505829-2-jay.xu@rock-chips.com>
In-Reply-To: <20210510063602.505829-2-jay.xu@rock-chips.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 25 May 2021 01:55:16 +0200
Message-ID: <CACRpkdaWX7OBN=SH3=epQkYyP4nyaYsvC_S3y+hThpR=J-ZAjA@mail.gmail.com>
Subject: Re: [PATCH 1/7] pinctrl/rockchip: separate struct rockchip_pin_bank
 to a head file
To:     Jianqun Xu <jay.xu@rock-chips.com>
Cc:     =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Jianqun,

This series does not apply cleanly on kernel v5.13-rc1, can you rebase and
resend it so I can apply it? I hade some minor comment but overall it is very
good and I think we should apply it to move ahead with this series.

Yours,
Linus Walleij
