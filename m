Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6ECC8393F96
	for <lists+linux-gpio@lfdr.de>; Fri, 28 May 2021 11:11:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230127AbhE1JNO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 May 2021 05:13:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234394AbhE1JNN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 May 2021 05:13:13 -0400
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com [IPv6:2607:f8b0:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E4DFC06174A
        for <linux-gpio@vger.kernel.org>; Fri, 28 May 2021 02:11:35 -0700 (PDT)
Received: by mail-il1-x130.google.com with SMTP id z1so2772900ils.0
        for <linux-gpio@vger.kernel.org>; Fri, 28 May 2021 02:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gIUXlVBGOqZPspzkSPyviaBDLyPSaDvhzeC44ewpxPM=;
        b=fi5Azr0qFURaRzo6mc6Hkid9uTMOG5gmKyG1OokAxJyeV9GDgDGWcDbPAzHwGhMCdN
         OSDz8xznB0MNPzPxAXvV7N90UC2NcBHagcJhMu10gZyG8aSekkerVqLScm+qbMKJ2UhE
         c5HlSWYrs4dWQv8MknJ+AWxiLPwRe35Wlk+jZfmwKV+XvZJmf6Yjwa4Nx+2VPIKh48oC
         C+c7+2ljHgtOyOufxWX9eY9GhZzuv0bfyJHXxqrraylx/u8M3sp7aoZ5DlT4QNWEuNWW
         64G270cl15PRefcyYTZa03mzWTETxgzhYIKmLM3Jn7QIf6SCRcqM7qtefKDFIb0PV8LW
         oTqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gIUXlVBGOqZPspzkSPyviaBDLyPSaDvhzeC44ewpxPM=;
        b=C8e45BuANbP2SrOyRvhJZxRtpkvgFfn5R4bkhbicC2xHrGT7Xvj1c2+p4pX775fx3N
         xmALlTAEpE3aEPXq9nnH7al9i3R9ghB6Hehzv7eLridr61BiKSBs0LO9cI5wRUBlx1v3
         xlmL1DFP1HVARZ9ZLhEISdeCgOteZyyuLOe5/E0w9qAy/eW/Gcb28qYSQ3s3Td9TRaNq
         2ApftfBhEgjcSLjXI1s57WFY6S5zDS8/tRcI6sOVLLPFIznzNQkbgIbT+k7/kUoj3vfB
         47h9csRDLgi+3S9Ups8tYm2PQ7xgJYs7/6yRD6kld5XJ//UIGs1XwK8XTz1ZZE3C7D7k
         tm7Q==
X-Gm-Message-State: AOAM532z38Q4YJMHdMrnuY3FDzPM5hnRd9lxc96FcEUE5xdWIK5TinXc
        4+hxmHQ8BeIDQZLuOFff4J0PJN2lA5GPJz9YJnX1BA==
X-Google-Smtp-Source: ABdhPJzz9rOUDpGPa2k1X+CT6JiP+65z+CY6LsrZEuqJFDmZI8kWeEM5cEjMXBWhdy7/LYK+vuehDuP9GrqspsnMOpk=
X-Received: by 2002:a92:260b:: with SMTP id n11mr6323557ile.134.1622193095281;
 Fri, 28 May 2021 02:11:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210519162409.3755679-1-fparent@baylibre.com>
 <20210519162409.3755679-2-fparent@baylibre.com> <CACRpkdZ70OcbgyFN2cQtLgsXFCTsvstsrBYYt3UY6Wc=NbXuag@mail.gmail.com>
In-Reply-To: <CACRpkdZ70OcbgyFN2cQtLgsXFCTsvstsrBYYt3UY6Wc=NbXuag@mail.gmail.com>
From:   Fabien Parent <fparent@baylibre.com>
Date:   Fri, 28 May 2021 11:11:24 +0200
Message-ID: <CAOwMV_zin4ODuv8pA8_tfVyg3g9=Mrt2Txdk0O2wL8JqDefzog@mail.gmail.com>
Subject: Re: [PATCH 2/3] pinctrl: mediatek: don't hardcode mode encoding in
 common code
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Sean Wang <sean.wang@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mattijs Korpershoek <mkorpershoek@baylibre.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

> Patch applied.

I just noticed an error in my patch:
@@ -135,7 +134,7 @@ static int mtk_pconf_set_ies_smt(struct
mtk_pinctrl *pctl, unsigned pin,
                        pin, pctl->devdata->port_align, value, arg);
        }

-       bit = BIT(pin & 0xf);
+       bit = BIT(offset & pctl->devdata->mode_mask);

I should not have replaced 'pin' by 'offset' here. What do you
recommend me to do here, shall I send a V2 of this series and you will
drop my V1 from your tree, or do you want me to make a new patch that
fixes the error created by this patch?

Thanks,
Fabien
