Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFF0829E088
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Oct 2020 02:22:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725838AbgJ2BWu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Oct 2020 21:22:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729923AbgJ1WEX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Oct 2020 18:04:23 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69BDDC0613D1
        for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2020 15:04:23 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id 7so1119947ejm.0
        for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2020 15:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=xtVwlvaWZlHA4dJxYE3dokSjDugC3i0v20/tqR9kT28=;
        b=SKr2/Rrs/9HilxCVQka/YluN5gEkovGrqH85JG+SIy7DEWcMB+9pMO8WzdbzNhh3fJ
         c2pl8xFwM0GZcJ+KeY7CIvJmk3tgZ6dR2Ea10UzUhPTDrk7HYZPs492Nku9mMLVztjug
         0J1wtBL8VjVDvR9zrj+yuJw0pQuDi1B+XVJx9tlsJnD1D6lPx6aB85tobmyJ2otLjigo
         6yywpf6AtsbzlwjR4MdvyUXmynw5e6ofLc1/HtUaqvj1RwM70JQmYwXiPuASmW8QpvJd
         ZF3Dz5z3IP/MTBufdZwGJIH1ahgc4Uw5ev/jPNJChNJb6B6E7UACIoRKDqUMCYka3X4G
         gfzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=xtVwlvaWZlHA4dJxYE3dokSjDugC3i0v20/tqR9kT28=;
        b=kLAJSfaQ8LH17qYCP479PUT21gYdMSlPdPqngwFM5Vd3Dh1K3viqiOIejTddd5k4SV
         3tY909AyIw/NUv+uHFv5liyPDyzgG4YUYr8ZJN0LMeyWgN4RC9g0upi2arq+Cilv3JQX
         u/yJb+8UWWhA72zd7chUk4S41LiA/4WSSmudISy0feonaDl7nJT5LMiKeNczufReZud/
         hrcIfGXSuRKWCeFDfqUzub2kRyXoUxykd3hwEyzhrlpbsfXJ4AuFXFzXdfy25dRnebhF
         FK38z6wtHig3I3MJGanLp0SsrWOJz5HcOVQe29bwWeTC2bTXuhjl8FKcXAfT4hJah+m2
         wmTw==
X-Gm-Message-State: AOAM532tNFMAPHjODYL+nA3KcP34qSWLlRBRiGCIiadgKzeZH70A1+g5
        E6xzuaZ/ONB275YqEy15lqcbTlnK5wfVC7tfG9H0FS56UdEcMw==
X-Google-Smtp-Source: ABdhPJx4logLjoFSvgZOZ7Au5M8nTXfH107v3sJvAOIOntuPqNy1JKkOGxGQcSTQ0MdSQaGiDVoz/fOzuqn8h557lh0=
X-Received: by 2002:a2e:a547:: with SMTP id e7mr3805831ljn.283.1603900516691;
 Wed, 28 Oct 2020 08:55:16 -0700 (PDT)
MIME-Version: 1.0
References: <20201013063731.3618-1-jay.xu@rock-chips.com> <34840448.7XeAIBGaoL@diego>
In-Reply-To: <34840448.7XeAIBGaoL@diego>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 28 Oct 2020 16:55:06 +0100
Message-ID: <CACRpkdY8kRVJptQxCQNzbumjj-H+t-atJdguF39stukmiTfYyA@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] rockchip-pinctrl fixes
To:     =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc:     Jianqun Xu <jay.xu@rock-chips.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 13, 2020 at 10:22 AM Heiko St=C3=BCbner <heiko@sntech.de> wrote=
:

> > Jianqun Xu (3):
> >   pinctrl: rockchip: make driver be tristate module
> >   pinctrl: rockchip: enable gpio pclk for rockchip_gpio_to_irq
> >   pinctrl: rockchip: create irq mapping in gpio_to_irq
>
> looks good to go as fixes.

I record that as Acked-by :)

Yours,
Linus Walleij
