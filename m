Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DAE6393174
	for <lists+linux-gpio@lfdr.de>; Thu, 27 May 2021 16:51:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235216AbhE0Own (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 May 2021 10:52:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235160AbhE0Owm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 May 2021 10:52:42 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CBF8C061574
        for <linux-gpio@vger.kernel.org>; Thu, 27 May 2021 07:51:07 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id v5so1146477ljg.12
        for <linux-gpio@vger.kernel.org>; Thu, 27 May 2021 07:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5Hkj7D3yisXHo7avHeTOXBAYwyPzjzn8/NsopImKZfU=;
        b=jxfzSqvqsQppNCC4jriMe8suBFF2JkG5tHxUjUoqonH4hmcrdA01RxNV6aKuZ89Hgq
         bJmXogYdZREKvDr6O9UNpsp4AkzZN3K0QDS+YGDhKrZ2mBNaVZZjBGmyWptxJXeit7AQ
         UUGofWA+VCOQ+0ex0fILBUTwweWCfktrzwnjNLOIwGcIdIn9HVga2ejEXJBSokmvukI4
         EK+LdBxHtFYWhzP1kW+D90tBrVhIwskd14/U7r0WolkbzO4IpPP9DW59J5o/patgcxOa
         JBY+LYuiEqG0/XUEW2dUa7HPAcm/v3ppUPYjqy1aNrQQ0z52TNTy7t0wEllvrNMZ9iVc
         udDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5Hkj7D3yisXHo7avHeTOXBAYwyPzjzn8/NsopImKZfU=;
        b=mgvAGkvGq46wFnuBcUf7PHDXX9KKh9BGDGXFZo/rbzNoj5qa0MGYuX3lWBqZIKB9oZ
         aqqTfOlsA+Rga7a35OwD6/51/puzaIoEUMtThBvUt1RXflKX/b22klYawJYf9F4eO7se
         XXz+CSz9s+RvAJ671+eMzA97YfhdYBKjdoG7h/0IvFDnrHByTmi1KP9SAzNPx0ZAZ6oU
         BpLikEqZRGp7jWskExoxO0JKkvAy2SCGbRndQKeN18XZlWMQFU4euYP7JMhJqqR6dsrW
         x/4zb1sr4foosd66sds0dTK0nIAT+Co4Urk43/RfvkTPnu785JtF4xsLp6SJ16GtF897
         jZxg==
X-Gm-Message-State: AOAM533+3mdm11VnVbFIQnuhURs3NuVyYoxAX4NbZxf+bkl9Az48vQoY
        ZjEVLsWbadRAfhzOYR5JVeWS6n0/cOXbgBDiATEtpA==
X-Google-Smtp-Source: ABdhPJwg78Xrvy83qD7WYkCalpJ/UWyN75gkVXd8WT1+Jgj8iwMYrZV8WIGBYYf04VEaW3pUAkDAhCQ2oPpRuXGX0gU=
X-Received: by 2002:a2e:889a:: with SMTP id k26mr2901127lji.438.1622127065895;
 Thu, 27 May 2021 07:51:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210519162409.3755679-1-fparent@baylibre.com>
In-Reply-To: <20210519162409.3755679-1-fparent@baylibre.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 27 May 2021 16:50:54 +0200
Message-ID: <CACRpkdbXE7LEGzXbp-58OomaqLKXeUEWzkMiG8sppOQY6s0k0A@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: mt65xx: add mt8365 SoC binding
To:     Fabien Parent <fparent@baylibre.com>
Cc:     Sean Wang <sean.wang@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        mkorpershoek@baylibre.com,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, May 19, 2021 at 6:24 PM Fabien Parent <fparent@baylibre.com> wrote:

 Add binding documentation for MT8365 Pin controller.
>
> Signed-off-by: Fabien Parent <fparent@baylibre.com>

Patch applied.

Yours,
Linus Walleij
