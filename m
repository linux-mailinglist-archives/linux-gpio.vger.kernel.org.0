Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 15470516800
	for <lists+linux-gpio@lfdr.de>; Sun,  1 May 2022 23:27:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237000AbiEAVai (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 1 May 2022 17:30:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233783AbiEAVah (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 1 May 2022 17:30:37 -0400
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3934830F51
        for <linux-gpio@vger.kernel.org>; Sun,  1 May 2022 14:27:11 -0700 (PDT)
Received: by mail-yb1-xb33.google.com with SMTP id w187so23296841ybe.2
        for <linux-gpio@vger.kernel.org>; Sun, 01 May 2022 14:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xAskLmoBXOcHx2RtzTF77xCmBBRnwL5PyD4a1eKKNdI=;
        b=hYV/EhhA2DcuXyipnbt78bMz1dzGRCn5wcMaI6OoOVP96sHoLhcaPCJ0RGRIOGrJAm
         akN8ym/xEl5RrJsPUfiMKwLpUrl0diGOu41mklHmoaSjLl8YtN0M+zkRZ4ap9kQ2hZh1
         iQq36tofaypj/mKFC2FKc0yP07ar7Qd0mLhPdltqDfCnFf3eRe/r5DWLpGiT5y8qvDTt
         GL7z9tExa6U/BM9Wf6zM4+YFtP9EAuI7gVIMlNQghw/8L8ztHTS7Vb4Z4rp2PkDnUETx
         ktBtv1I24NFPbSdl1tEVkgUvlxpfkbZLG+7vLp8cTR9Vps6SwdjRRtgQfvvLtyUUviAu
         5biQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xAskLmoBXOcHx2RtzTF77xCmBBRnwL5PyD4a1eKKNdI=;
        b=Muo/dRjdy56DGcNumYJ9hYtCDVYd7WwCf7I7TpKERxJjrIcR9YKX8Qi/2ZL0HMdiJg
         LeIPl4ODdHjwp13qwl58Jiruy6dtvaHmggA3ce0/UrpC/j3qKr/Y4+vvkJX0+CgZYjFK
         yKOBwhV6zpaUiXL57cFO4CkxiTs+GA1hCyPDFvfcP8ADmJ9HVj1xHDtOcTCqhkIJH1Sv
         1ThC5OXSOZ9SPQtpc4Ex+cpQmjg0/VWrcL9uJp8KtA8K6WDLFfE/za8TTZ/KU82w3nsT
         Svv67dd29/FdWEk3E9fKCVachuhU2GcMwP0m4CHjGNt5JCehHrXRz4WI19oQozK1LegX
         MSUQ==
X-Gm-Message-State: AOAM532H454Y4YluJ9BZsAoTkhWda5md7mcSMV84O4WoeyWSTBvWn0kv
        8klteP80PXmLYapKPaiz+4uO5jN1EAAO95tISwsW/Q==
X-Google-Smtp-Source: ABdhPJzeWejiiOdnxeA3dlJ1w/j6G5MpyiddMmyPKuipFWFSTECeY1MzdZqDUgfy0gPnbsIomcUkhrBhs/zBRuYqvdU=
X-Received: by 2002:a25:e684:0:b0:645:d429:78e9 with SMTP id
 d126-20020a25e684000000b00645d42978e9mr8625979ybh.369.1651440430413; Sun, 01
 May 2022 14:27:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220422143608.226580-1-fabien.dessenne@foss.st.com>
In-Reply-To: <20220422143608.226580-1-fabien.dessenne@foss.st.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 1 May 2022 23:26:59 +0200
Message-ID: <CACRpkdbbUu+hKByGkVh2eR2MfMdgDuVYLFQ-VK+JyK_tRNsxZg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: stm32: improve bank clocks management
To:     Fabien Dessenne <fabien.dessenne@foss.st.com>
Cc:     Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-gpio@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Marek Vasut <marex@denx.de>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Apr 22, 2022 at 4:36 PM Fabien Dessenne
<fabien.dessenne@foss.st.com> wrote:

> Instead of enabling/disabling the clock at each IO configuration update,
> just keep the clock enabled from the probe.
> This makes things simpler and more efficient (e.g. the time required to
> toggle an output IO is drastically decreased) without significantly
> increasing the power consumption.
>
> Signed-off-by: Fabien Dessenne <fabien.dessenne@foss.st.com>

Patch applied after merging in v5.18-rc5 as a prerequisite.

Yours,
Linus Walleij
