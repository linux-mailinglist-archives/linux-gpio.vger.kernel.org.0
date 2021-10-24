Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2AE2438BFD
	for <lists+linux-gpio@lfdr.de>; Sun, 24 Oct 2021 23:04:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231696AbhJXVGe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 24 Oct 2021 17:06:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231259AbhJXVGd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 24 Oct 2021 17:06:33 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94DA7C061745
        for <linux-gpio@vger.kernel.org>; Sun, 24 Oct 2021 14:04:12 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id j21so6721859lfe.0
        for <linux-gpio@vger.kernel.org>; Sun, 24 Oct 2021 14:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rXZiinBB1P7wOrPBY5EXOLhRiRUn4EMUQJBC+p4xV6E=;
        b=wqk0FsTc33l1K46sT2Xr6J8RUxVJh/uxskfmCXujnPnsqk00yE0NSXmAbm/sI7ezoQ
         Sv9PPACt1sGIa2itP3H0vpq0T/XUB8iU9lbCfkvX672BUxotkQmISbTr5EEOE+eTBLXZ
         BiZvlrGw0vfunNxOZGTvhRhFjDn6kYhClJd6VX+ZyGvj0gwO6AFgZ/2FeSje7WXeI35r
         6b6blrGBXF7oSBFZLFOYFAXZFcEQhUx2kcLW/uvB6v5CEFrnUr/ZknJfuaI9mBuWuKQ2
         p5H6rH45jT9U+V9hKA9jjV5V9Pkh/ufWHg4B+PXlCSIpsh3//IYZR+BKE2+QBZDXG1G4
         k/MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rXZiinBB1P7wOrPBY5EXOLhRiRUn4EMUQJBC+p4xV6E=;
        b=s/h5h+F/6rpcLG1EJJLxE4AfDyxEp6fNVybfPr+6WySReol4goZXs39ldYxCRMoS2t
         1UwqX+0z0jDSvYRl+skO4aixB8tIopEgytvKy/8l42knNtXl2c7eBFKXixqHz9HpymDZ
         F7ohW8hhD/t5iv6IWWWO8Kag1HW5kovZtQxG26VM6VAJkB5ul5VMA1C1TbgDWBT2aLq5
         qCZTy1DwgdGRH8tQ1wCi7oRCEyC3x4+2l8rM3WqxuRFzn6ekFashpv7uM7RDgU1+5Y1w
         dJVUomWl6Ne6FHjhAvcb0zvAm3/MSpH2M4ZmvJe6M51CaMxWj7vIX0tfeIbTjT7DGPVv
         iJKQ==
X-Gm-Message-State: AOAM533o6LiDyH5azWudn77n6ASNcEMrOUhoWxOX6LGFbK0YwSfdQrl/
        LJpKO/lET/Zph8VlZpy7SFDx8Ig9zZiX9cAd5wSE1w==
X-Google-Smtp-Source: ABdhPJxNr92QTY2HNT8gRchRvSIpTrojxUxrxZ0hp9tos7pfpHyh5Hyi1phko/4SIzDFMiFX1QLAQUIl+4FTuACoszg=
X-Received: by 2002:ac2:5d4a:: with SMTP id w10mr13034115lfd.584.1635109450097;
 Sun, 24 Oct 2021 14:04:10 -0700 (PDT)
MIME-Version: 1.0
References: <20211018085754.1066056-1-horatiu.vultur@microchip.com>
In-Reply-To: <20211018085754.1066056-1-horatiu.vultur@microchip.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 24 Oct 2021 23:03:59 +0200
Message-ID: <CACRpkdbyY9LPf5una95YE4OW4do9aLp_Vr-ge23RTSu6-7iKjw@mail.gmail.com>
Subject: Re: [PATCH v6 0/2] pinctrl: pinctrl-microchip-sgpio: Extend to call
 reset driver
To:     Horatiu Vultur <horatiu.vultur@microchip.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Lars Povlsen <lars.povlsen@microchip.com>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 18, 2021 at 10:56 AM Horatiu Vultur
<horatiu.vultur@microchip.com> wrote:

> v5->v6:
>  - fix warnings reported by 'make dtbs_check'
>  - add back the name of the reset line

Patch set v6 applied, thanks for working this out!

Yours,
Linus Walleij
