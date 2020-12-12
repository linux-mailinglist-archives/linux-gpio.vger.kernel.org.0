Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 217FF2D8385
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Dec 2020 01:41:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437765AbgLLAlF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Dec 2020 19:41:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728522AbgLLAkz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Dec 2020 19:40:55 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BB14C0613D6
        for <linux-gpio@vger.kernel.org>; Fri, 11 Dec 2020 16:40:15 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id a8so15887813lfb.3
        for <linux-gpio@vger.kernel.org>; Fri, 11 Dec 2020 16:40:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qr/pDcCO8cCehnbQjTWYMGLriDoYbkYLrbVp2cL1O3w=;
        b=hzojou/hnh+/ewtkPOZkeajzFdG3+n4ZEmlrTlz508XAkwWZEmbs7cG+PB7esQwFn0
         7517RZNM1Qto6X9sYqHtGdTuWLH5os34JHokQdm7MWRiEpgwvZGDsUU3ynotlw/r4A9t
         gpY87yqnHSmqHfxjgOSdcOIHXQDNlL0IxGoOy269Duo602uI97R+wUKJGK+lGrdI4B2D
         N95CRMFZF7/k39Lbd8pMkt/A4GEj1j/ZvIcRPlJP1MvV0WgpEDD+Lx1FY7fEae23dKZd
         FFPdSO7i4/08tyuSXel7ROizepA4KzrzTtbDPTD8WH2DXF93Yj0fgmZwBMMSIkXjVeZY
         7R1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qr/pDcCO8cCehnbQjTWYMGLriDoYbkYLrbVp2cL1O3w=;
        b=D8zWR9iw4XxthX1Sgabm0rD6I7MS0b1dA2LhkR7uNdQ7v82fSKWbmWDnyGml6L20Ei
         Da+yxZsvacjXYKYkI6zO71Kl+NE4blB/ESdA9sWBP4eEXZokjNdwjk10ObolyDZKNhlf
         w97XoTC0WANGSMNutefuO+D5Pu1Je5bJdVlc+xry/T/7yVZjOzbWMP2n5w57uT8ERp10
         Jw3OdXefojlfpS1ENIxyXOjs5u2mawD72cGXAGZ61/ejrenRDCScmaZ2/YW7u0DFptMY
         PgSRaMSmaK1Y+l4lDXDkJv4U8NPj3mpsHXbAwyKnhUR06C//1E3ATP3kFdsQ9moqy8pj
         6yAg==
X-Gm-Message-State: AOAM533zu9ZXORJtPmc5Qonjs6taZIMP/cDzec3PUUgdQEjsAyyptmYh
        NwSWvh7aCpD+1RcoqibxNLu5+gel9Nqp7VfJMqzSWQ==
X-Google-Smtp-Source: ABdhPJzk+c/pwIfHdYIRw+4A24Ev3VSfBOj85++ml4TNmCPZ3se1bPvNGqC7yytJxDMBmF7/yxzR2Kf1v0ly91xFxUM=
X-Received: by 2002:a2e:85d1:: with SMTP id h17mr6167420ljj.438.1607733614050;
 Fri, 11 Dec 2020 16:40:14 -0800 (PST)
MIME-Version: 1.0
References: <20201210135902.1548-1-zhengyongjun3@huawei.com>
In-Reply-To: <20201210135902.1548-1-zhengyongjun3@huawei.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 12 Dec 2020 01:40:03 +0100
Message-ID: <CACRpkdZEZ86ui4c_h2jrESvwDFe3mpHN+T4USuJjDc-tpkVi5g@mail.gmail.com>
Subject: Re: [PATCH -next] pinctrl/mediatek: simplify the return expression of mtk_pinconf_bias_disable_set_rev1()
To:     Zheng Yongjun <zhengyongjun3@huawei.com>
Cc:     Sean Wang <sean.wang@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Dec 10, 2020 at 2:58 PM Zheng Yongjun <zhengyongjun3@huawei.com> wrote:

> Simplify the return expression.
>
> Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>

Patch applied.

Yours,
Linus Walleij
