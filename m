Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B02E3A4B9F
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Jun 2021 02:08:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230462AbhFLAKF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Jun 2021 20:10:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230103AbhFLAKF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Jun 2021 20:10:05 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5210BC061574
        for <linux-gpio@vger.kernel.org>; Fri, 11 Jun 2021 17:07:57 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id x24so5376040lfr.10
        for <linux-gpio@vger.kernel.org>; Fri, 11 Jun 2021 17:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ppEre27gtFRgGig3TkXUC0tbQLY4TVyqTp6cicpd92Q=;
        b=fRVB2ivrbnamfM+8biPdwCJYeeT+cxjgi5gXm1PjRFIIGXLDfjoEw3SY+Mtw6SdpGZ
         Y+cRE3xpRvo+Re4jeatTiRX2OzZTbGcity0ej7RJKpqXm1p9JGMuArs5fTlRo5MWTgN+
         mWpLiG4/UUHt7/Rpn2pvG7xICQbvw+5KfZT2E9Y/NHWaNh1GfIkFpP+olYUcUf9by7l/
         GU4Sc3dsTPyDM377EnAJwhvh+mIT5sIODCWPa00JweWEZPWI1c9VZOL/ZVW8tRZQctTo
         Y4uyfNk7cnheVKpxPakL5A8aulU49VoPZAV+CQ5QaRzYrB0XeVGBSJMdSi++O8rGKIfv
         29ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ppEre27gtFRgGig3TkXUC0tbQLY4TVyqTp6cicpd92Q=;
        b=kqJCIsz4kbsTEDvzIqVPcj920X7kFg7MGGpxDTpKgw5iF9x9ayMEs5ILHTYx/cB5nN
         phUtSvvyQkbCmo0RvlQfx5sRFaf0J8w1+5ZoLOtDFIGD9YWpEclvdGvTciEkxIl27OYt
         31ldEnLX7leyL4ABzgWgcoXpIyknZX+jcdjkhafzdO+zWYss7L2QTJ5uHnvF8z1HU+gq
         Y25WEEU61KUDKqiXB9U5iCnogHpDEbAK5EiEnd+C9R8LukoVf2CmCcuY2Bu2chUmUVWH
         BNwo7iGvnCTqi51HHmxoBLPWVM8KA8O9wa/1rLDiIQw/bsUQkXasjK44ySkvcdMV1sHg
         bpAA==
X-Gm-Message-State: AOAM530PdNzafvGATHxyYH1xGOBRIl6s9mrnHC7cvECOp/kiqf7+kFPV
        Njawl+QG+Y8fyrIIByuuQuLRtaaMTzTIkH+jH5Ecng==
X-Google-Smtp-Source: ABdhPJyMz2BLs51NlUhpX8WpKPmABESRW7dHKxpz+iUqfe7x85+NK5FqS0Ag1y+xvGCmykEMpcbnve1/i1KxakOMrw4=
X-Received: by 2002:a05:6512:20c9:: with SMTP id u9mr4118847lfr.291.1623456475596;
 Fri, 11 Jun 2021 17:07:55 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1623404609.git.geert+renesas@glider.be>
In-Reply-To: <cover.1623404609.git.geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 12 Jun 2021 02:07:44 +0200
Message-ID: <CACRpkdbwomRRHc=GAh1p_=1V1Xm+yQjvim5577-+wB7ykoMx_g@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: sh-pfc: Updates for v5.14 (take two)
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jun 11, 2021 at 11:47 AM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit 904ec4bebc1df908a943bf3178f6c633672ce47b:
>
>   pinctrl: renesas: r8a779{51,6,65}: Reduce non-functional differences (2021-05-11 10:04:42 +0200)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-for-v5.14-tag2
>
> for you to fetch changes up to c3975a73ca9410519cf62531f640b68d69b0d798:
>
>   pinctrl: renesas: r8a77980: Add bias pinconf support (2021-05-31 10:50:29 +0200)

Pulled in, thanks!
Yours,
Linus Walleij
