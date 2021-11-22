Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A07E458755
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Nov 2021 01:08:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231384AbhKVALg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 21 Nov 2021 19:11:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230090AbhKVALg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 21 Nov 2021 19:11:36 -0500
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDED0C061574
        for <linux-gpio@vger.kernel.org>; Sun, 21 Nov 2021 16:08:30 -0800 (PST)
Received: by mail-ot1-x331.google.com with SMTP id w6-20020a9d77c6000000b0055e804fa524so26238706otl.3
        for <linux-gpio@vger.kernel.org>; Sun, 21 Nov 2021 16:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qp8qvP1duE4sps65Ryua2FND+EVymcNt7eeEnZjkT9w=;
        b=Iv6b8LbWkjDNWnKH8fvIb6Oe6siOZd+BVjZno64KhP8n8v1lqYl1vyt2jrCWUX3v/Z
         RMvLzySTb7M+OVGY1Rc+KH0xPgfClvdZ1lLkuBHyGkIff7WOnq257NFNbAVhLhDcaFbB
         ViSoveTiqQQdqIX9f5xXAbIfJbTVA9nAx0ZLcKMWMJxE/duF4cXlNuEaSLNNyJiZqfP7
         VM7vg55IrN/u9OcHbUR8mb3HDDfWbu+LrV2/JDHWEyKEX2kdU3RjMMpUreOCd+ORm49e
         7fKYiOxtOaC1O+czvIb4OGDyLXGozwGppdHfCeaIp0aNdyW+mftBwp5i7ll6e2a+qY+r
         hTcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qp8qvP1duE4sps65Ryua2FND+EVymcNt7eeEnZjkT9w=;
        b=TTAJliiF0Mzg4R+06jsEA4OIWcfH7x90VI2bMXl//M8KXfS1/1vHyHqUcDfGGMPDwE
         QRXGISgY1Hax6p7RjxjWczX+4cYPdb9E+tY9bqq9OsHhn8JhOKbq7YWykRVgvMB4vQJB
         nyvJYLbKaVki9lfeKx+Rmddg5wt7HjDVU1q1K7RcBzODmhS92WTQ7YRqgV3RZSpW4uyx
         NK3RGLENMk3Y1NpWu/Z29xnCYVJQeiOBkqryxpZAJ0Bf8vsOeCzQFPk9MQm/R5yjXi17
         kNHh0iY+PY35a4BaF7vm1sfBPLeIw2oXWYQfP5ier5KSPZyXvzmb0Gewx/kChdoYD5AH
         Gk4A==
X-Gm-Message-State: AOAM532jzdddnA7yJoKJMrkQLrSJSXoiSFqiLj+8/aRM5KVJimuI+YsM
        E437Ib4pPqUvevugBnaYM0jb6VFLUR2AkbjKPxi7sQ==
X-Google-Smtp-Source: ABdhPJxvD0lqe5bwW7jZKcmW+MhtmK8dNWRzRSetu7eKkiJACTRAo/bXNHATiEu80R+mPong6K1cbtOQDP+bs6Bk/3U=
X-Received: by 2002:a9d:a42:: with SMTP id 60mr21620754otg.179.1637539710298;
 Sun, 21 Nov 2021 16:08:30 -0800 (PST)
MIME-Version: 1.0
References: <20211119195928.2498441-1-colin.foster@in-advantage.com>
In-Reply-To: <20211119195928.2498441-1-colin.foster@in-advantage.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 22 Nov 2021 01:08:18 +0100
Message-ID: <CACRpkdad-_annWF2f-aKqTrLdTosO2Q7c0jxknP8jL6kWk9qEA@mail.gmail.com>
Subject: Re: [PATCH v1 net-next 0/4] pinctrl: update drivers to utilize regmap
To:     Colin Foster <colin.foster@in-advantage.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Lars Povlsen <lars.povlsen@microchip.com>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        UNGLinuxDriver@microchip.com,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
        Vladimir Oltean <vladimir.oltean@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 19, 2021 at 8:59 PM Colin Foster
<colin.foster@in-advantage.com> wrote:

> Colin Foster (4):
>   pinctrl: ocelot: combine get resource and ioremap into single call
>   pinctrl: ocelot: update pinctrl to automatic base address
>   pinctrl: ocelot: convert pinctrl to regmap
>   pinctrl: microchip-sgpio: update to support regmap

Patches applied to the pinctrl tree for v5.17!
If reviewers don't like that we can always pull them out or do
some fixes on top.

Yours,
Linus Walleij
