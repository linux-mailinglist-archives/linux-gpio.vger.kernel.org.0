Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AA3F465B98
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Dec 2021 02:25:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354286AbhLBB3B (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Dec 2021 20:29:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344382AbhLBB3B (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Dec 2021 20:29:01 -0500
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9F00C061748
        for <linux-gpio@vger.kernel.org>; Wed,  1 Dec 2021 17:25:39 -0800 (PST)
Received: by mail-ot1-x334.google.com with SMTP id u18-20020a9d7212000000b00560cb1dc10bso37813340otj.11
        for <linux-gpio@vger.kernel.org>; Wed, 01 Dec 2021 17:25:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MzBxxmck4e22aCPZbpEeNPHu59eaexKB2GZ+l+rjAcE=;
        b=TqMGkprtUvMHzq6Q85I8DY7F2tio6LvLjW7QzKwPUswejdPcjjBvmh/9W85sR540N2
         D8RlFWMFKcT+pHyErENuFVMzfkS+dK3SB3QjaF46oLW7jG0vX4s+GFY2zIN1pvcVClnO
         FRDqzDB62fq84GcDo9JVaA4yhNkV+4jtYzz10H4X6steCB/id/JKSNnW8wYJ8lwI1ZOu
         fSv8hIVo/bftKxcWyJsqw1Kv6GRWN0QLwoTaWy+hm+L6iwFx/5UlRik/K6L7Z0eHEX05
         59OjDo8rZhcE+6gMYp+o2+d3MePltd4Jy06L3aQm4DHNFs8UJYq+K71bgJY3Y3fuo5sw
         siTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MzBxxmck4e22aCPZbpEeNPHu59eaexKB2GZ+l+rjAcE=;
        b=N2jOapt3zoch8aBxcg2nbpgeGUFsAwkvxJVnBT6pKnDNuQZU01ZpI1sCy2Ukrb2ALy
         xCxokSo19jFSG/1maUViNgdt/OnF8amjNzWhGp2JQT3AV1wBsFweEw8Kc8HA15YdV+TC
         6H+bUD72Zo/adXSQsJvtPe5LJ28NvHP23krfRp5aEnWE9+3YyzYhMX3pBrbcMOnTRwAe
         BG5esNIp6p8Kf9ispn6EhE8okwBFOxnnJgFb2KZrXIgRFmuBZUhLjwvd7U8f2gx/8cI7
         BjGlNaZi9mVx/xnbP+OryxhnenwchQ/Kjjulxe1fQMJGFLJVlbAmWmy7MlKqwJ6W5FWq
         2Atw==
X-Gm-Message-State: AOAM530YX/8+JsLqH5S/NeleQcbC9m10SzZvdY/+NCU+8O8R9PrX4lOj
        nglPlfVy813ewpiNefEhRspti/dbzkD0agIdpJDZMUfsQ7s=
X-Google-Smtp-Source: ABdhPJyeWavwWu336TbUC5SxcT/gU4WF764NCIliaR5Spu/P2Rnbn7p8bIQnM2m86oSDPqMuforalVdvO0bOdsZmBv0=
X-Received: by 2002:a9d:74d0:: with SMTP id a16mr8731762otl.237.1638408338988;
 Wed, 01 Dec 2021 17:25:38 -0800 (PST)
MIME-Version: 1.0
References: <20211126151352.1509583-1-john@metanate.com>
In-Reply-To: <20211126151352.1509583-1-john@metanate.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 2 Dec 2021 02:25:27 +0100
Message-ID: <CACRpkdaMB9+-+wfJ7idCzByZyxGmX=uYD5LMuKBVy0oagyhg6A@mail.gmail.com>
Subject: Re: [PATCH] pinctrl/rockchip: fix gpio device creation
To:     John Keeping <john@metanate.com>
Cc:     linux-gpio@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
        Jianqun Xu <jay.xu@rock-chips.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 26, 2021 at 4:14 PM John Keeping <john@metanate.com> wrote:

> GPIO nodes are not themselves busses, so passing rockchip_bank_match
> here is wrong.  Passing NULL instead uses the standard bus match table
> which is more appropriate.
>
> devm_of_platform_populate() shows that this is the normal way to call
> of_platform_populate() from a device driver, so in order to match that
> more closely also add the pinctrl device as the parent for the newly
> created GPIO controllers.
>
> Specifically, using the wrong match here can break dynamic GPIO hogs as
> marking the GPIO bank as a bus means that of_platform_notify() will set
> OF_POPULATED on new child nodes and if this happens before
> of_gpio_notify() is called then the new hog will be skipped as
> OF_POPULATED is already set.
>
> Fixes: 9ce9a02039de ("pinctrl/rockchip: drop the gpio related codes")
> Signed-off-by: John Keeping <john@metanate.com>

Patch applied.

Yours,
Linus Walleij
