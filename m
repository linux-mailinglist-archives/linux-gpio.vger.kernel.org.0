Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C4C82DA38E
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Dec 2020 23:41:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439546AbgLNWks (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Dec 2020 17:40:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2439849AbgLNWkp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Dec 2020 17:40:45 -0500
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EE8AC0613D3
        for <linux-gpio@vger.kernel.org>; Mon, 14 Dec 2020 14:40:03 -0800 (PST)
Received: by mail-ej1-x641.google.com with SMTP id g20so24914476ejb.1
        for <linux-gpio@vger.kernel.org>; Mon, 14 Dec 2020 14:40:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BL39H/RUZTWrv2NxltTatWySwCecuBzAbL+C5wKmwX0=;
        b=PDUvsntEZv2KZd4CVk0SjS+5BmBSe7BzVTu5kQ7ZWHyMm9dt/SZj5WX7DR4HIRkuA5
         zvBglur/k2rxM//FscPd+DXmPfY0+ey39/XZ/OPW5nS7LzmRLeblq3Pd5Eany1D1sTkP
         NadoU8OvvWQliIU+TUUbO2RGZAmfnRPTgkye/6NTijkujFQzzmpQXNpiG0Qg0UBSHvCe
         AYGVBa7hz/e6hfNbPfioIwQrnrzyzn/ofiifROXT83WfcUkRBG61+tIesdbCBpp/hXCC
         ohkOvosdPZzW7gq3AX2X4kdXGs0qxA3xXwhhEEp3D/X7/UrTfL3avzr27d4xsaw5ts55
         z68Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BL39H/RUZTWrv2NxltTatWySwCecuBzAbL+C5wKmwX0=;
        b=OfqF/ER8jwNVI/vTe8xdvK3Y9pP2rpIF80DL0F/dgoc2vtwXZv6KvIZnaDNNpo+vMo
         fkMerAaOzivKXsw23/9EK4AakKVpYf/1phGqKARht3wVG1+d3/HdoR+2OQhxGgrQ3VrW
         kC+P7iar3PWaSU/2E1Z6+ybvIw+e+aQmxTvwE3lUzTNF4pB0Y383l/5rhqb3t06pfCC2
         adzQssIr9W9pUqpbQZD+3/nJIXd6TlyO/mPvarOKth8kW5/IMHdA/KAemvxLz/7C9kni
         ScIQL8InouzY8+pm/SldBdUFIv8c1i1G9sy0+mGXBCyrFYPz7RruhhMnekRNkbOBu/SW
         4wzg==
X-Gm-Message-State: AOAM5338w/+2G7KiTAtUPrPh8unfqRI63UWUbo+x5/tnLFbEHTx/qGZ9
        9sFrBdsQuN8vcEWxH/CfUkcI8ZZ9BRthI8oJ37u49A==
X-Google-Smtp-Source: ABdhPJxAQ6Y+c7ptp1jSAajW9pxcPIy8Vr46Vzr/TwP1M08bXsV4BpDxl8NSWinnZtnaDzuHUOy3/k1ky2TOXeLKAC0=
X-Received: by 2002:a17:906:15c7:: with SMTP id l7mr481498ejd.226.1607985601905;
 Mon, 14 Dec 2020 14:40:01 -0800 (PST)
MIME-Version: 1.0
References: <20201212003447.238474-1-linus.walleij@linaro.org> <X9cwahptmETQ5lkL@localhost>
In-Reply-To: <X9cwahptmETQ5lkL@localhost>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 14 Dec 2020 23:39:50 +0100
Message-ID: <CACRpkda5_JwCAB2TisyzdJgb395JmU1AfuDDX0gWTvEj7-Mamw@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: Disallow identical line names in the same chip
To:     Johan Hovold <johan@kernel.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Dec 14, 2020 at 10:29 AM Johan Hovold <johan@kernel.org> wrote:

> As I mentioned earlier, the not-globally unique warning only makes sense
> for cases where all names comes from something like devicetree, and we
> shouldn't warn if we plug in two identical USB devices that provide
> default line names.
>
> Not sure it's even warranted to warn even if those default names collide
> with the names provided in devicetree. Perhaps best to just drop the
> flat-namespace assumption entirely and make sure gpiolib and the
> userspace library can handle that.

You're right. (As usual.)

I dropped the global collision warning when applying.

Yours,
Linus Walleij
