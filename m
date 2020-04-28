Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4E261BBE28
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2020 14:49:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726620AbgD1Mtx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Apr 2020 08:49:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726787AbgD1Mtv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 28 Apr 2020 08:49:51 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BFBCC03C1A9
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2020 05:49:50 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id k28so16768953lfe.10
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2020 05:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UL/TVs62faF1qHVs/iiuWvqOrsmLsKHyIOog76Ui4vY=;
        b=VVzJkCiuPUgRSo5KUL+WQU5C4r/qwXnkA0/rH3dMnEHBm1e4tgddRH1V/HnB6F5iGK
         6ib22DEAlDbVPG7vXaKfYvHPpXUXg82m/Jl5PNK6yT1oufMeKGeZFqkHKGUG+OQes4IP
         agBRex/tDRgpxy4wUHqJpz1gj+GMHf093SEeP83nm1BXRcMi6+dHfhlG0KcAGHG5r7A/
         wTcuVPeQX1gFZ1n/iZb2/PqbErlG8zUwuEvEKct2LiiC99fi947KLNDpuypP+2ZWrz0m
         NLqhkYR/CKdvqtvHlxp7gVzsJ5fRCBYFmBwEjITSas4Z3RbVgfHXBUykZr4mT9O7fFTd
         7M/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UL/TVs62faF1qHVs/iiuWvqOrsmLsKHyIOog76Ui4vY=;
        b=PId5It0UZVp4SPyptwjgioBvZjQPo1Vb0Sinc+crNoMTVX8D8lyRY5Pk0a171CKqm2
         zEGrvFThtJXhYREwY5dhF65Tz66KZGH0mJyv2eu5g6V1FIKBkvitE/H6F++IIE+4/Q0O
         HM7aTHyWI+hfC9PADgmuukZFeapVhUSmF8FXDHfUxU88Ui1C2Ihsl0nxKCBSmkebr7lI
         EzhXs54NPkrsAOqmcJxktZNqajLLt+3PnxEWCzxpE2MrQQAEJj1Y4mWMURS7bI8Ay0Pl
         UJWpG0879eUlaHGZqLG2KEvpOgylDlWkBquwT7yTCCjbVxHO94jHgMjNR5hUR91MMPw/
         61+g==
X-Gm-Message-State: AGi0PubIA3zq5pwbVVc9RIYu1b2vIzh/kcp05+If5xDlF1M8HXk/FD9M
        rLrifIiMMQkxs3ZFAugccTuBYDSM0gMKTLAuisR0zg==
X-Google-Smtp-Source: APiQypJYIQJ85qOD1cwJ8t3Ko6n/QlAkuFT5C5YrkLuzUTtDUSKQTsPmMdAaXkYcqBPYL//zz5+kD6YQtD4IfGvW0B4=
X-Received: by 2002:a05:6512:685:: with SMTP id t5mr19029129lfe.47.1588078188674;
 Tue, 28 Apr 2020 05:49:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200422072513.8352-1-amelie.delaunay@st.com>
In-Reply-To: <20200422072513.8352-1-amelie.delaunay@st.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 28 Apr 2020 14:49:37 +0200
Message-ID: <CACRpkdaG8PPA13gMXMS62Fow7De5vDaG=gZ+HAEx6yhpOH0sTw@mail.gmail.com>
Subject: Re: [PATCH 1/1] pinctrl: stmfx: stmfx_pinconf_set doesn't require to
 get direction anymore
To:     Amelie Delaunay <amelie.delaunay@st.com>
Cc:     Alexandre Torgue <alexandre.torgue@st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Apr 22, 2020 at 9:26 AM Amelie Delaunay <amelie.delaunay@st.com> wrote:

> Pin direction is not used to set pin configuration.
>
> Fixes: a502b343ebd0 ("pinctrl: stmfx: update pinconf settings")
> Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>

Patch applied.

Yours,
Linus Walleij
