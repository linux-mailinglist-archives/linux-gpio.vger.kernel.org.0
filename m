Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96BFA35B671
	for <lists+linux-gpio@lfdr.de>; Sun, 11 Apr 2021 19:58:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235460AbhDKR7B (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 11 Apr 2021 13:59:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233822AbhDKR7A (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 11 Apr 2021 13:59:00 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC6E9C061574
        for <linux-gpio@vger.kernel.org>; Sun, 11 Apr 2021 10:58:43 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id z1so12328763edb.8
        for <linux-gpio@vger.kernel.org>; Sun, 11 Apr 2021 10:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=3DDCybzO29d1mi7MkAlI+MHdu6EXtztxR3XyGpabuzc=;
        b=mL+YCbdm07+DijtP+F7faKeS3BIjRlH4rFPiYUjtWiij2e8XZa+28V7EYgOeHtyULl
         ZoC0uq4PAOFwtQyqbTKgrV+qKwtIFRwF5lBJRTLpJVgtfCHKYN5ChkzbGqRBmNzYD+QT
         xcMZ+e+bAvDrMg4CjW41ZbPfTARWgJr3KL94qlo/moGR0k38R+IlYIn3tj68U6jTD+yd
         O+xOiXKIfSbrqpkS60EhpkE4I58xjtfsANhVjEftBQNxt5bRvTQ7iDyuG5Ls9Ma+dTLn
         hn09Vy3E+JalNR06gTlM7lJYTidxd6t62b2PJ8vBtIzjuOh8allFd6LegjDKZA/upzJn
         By6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=3DDCybzO29d1mi7MkAlI+MHdu6EXtztxR3XyGpabuzc=;
        b=mNOwGqiNGpXoCahnkg9UxboVp4lhQ6ZGZMUYcyeoRLCaKEnH72GYtcJuyRqk0I+2s/
         MXSP0wSEQYnSRvKfuqTM2uZQJ/bsdprhyWmxAr7SxQksODTWmALNkN11bIqz7PHR6X86
         N3UiYehd3aXlfbUkx5IqdITuqk5YOIv/tB4660+c+q83vKmSvtOEi6LBlGJzyofuRcO0
         Fnh/83QNENAmVbbir9X0tkE75VbmSTK2fVAmazDiYxiJwYW2YQKxY+0lJAwAJ9q6CXBs
         C1rF4sYcVKKpv3RNc+o+Heu47eKh8+3b0KvWZWWQhPUcmSXgdnk1bv8sW9o8xzHcU4Or
         xFjg==
X-Gm-Message-State: AOAM531TqNCL0fsK5RvZ/91tXzYQVhPKaU+1Bmi20VOJxLI08cr5FHlR
        8pq7xJMSBPkGhBQB6yRSoRnQcZTKQH7fg78/9vmNUQ==
X-Google-Smtp-Source: ABdhPJx0wLPSDEzis/809CZGAiecB3Npfoz6bNO1zTPvKX0ti3jySaq8ZHIHK6ywYmJK46uSpOXHAVjkbKVGxIQj3Tk=
X-Received: by 2002:a05:6402:1013:: with SMTP id c19mr26186315edu.213.1618163922543;
 Sun, 11 Apr 2021 10:58:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210411133030.1663936-1-pgwipeout@gmail.com> <20210411133030.1663936-4-pgwipeout@gmail.com>
 <5308a59c-29e9-75a4-2c9a-4aeb3d37bf6e@gmail.com> <3591437.LM0AJKV5NW@diego>
In-Reply-To: <3591437.LM0AJKV5NW@diego>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Sun, 11 Apr 2021 14:58:29 -0300
Message-ID: <CAAEAJfDBLfeRVt3=2jcPS05Tm0t5NWeSAV4EX=acPry_L3L1vQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] gpio: separate gpio driver from pinctrl-rockchip driver
To:     =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc:     Peter Geis <pgwipeout@gmail.com>,
        Jianqun Xu <jay.xu@rock-chips.com>, huangtao@rock-chips.com,
        kever.yang@rock-chips.com,
        Linus Walleij <linus.walleij@linaro.org>,
        Johan Jonker <jbx6244@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Johan,

On Sun, 11 Apr 2021 at 14:57, Heiko St=C3=BCbner <heiko@sntech.de> wrote:
>
> Hi Johan,
>
> Am Sonntag, 11. April 2021, 19:51:52 CEST schrieb Johan Jonker:
> > Hi,
> >
> > When I check "rockchip,gpio-bank" with YAML it turns out that
> > rk3288-veyron-XXX has 'gpio-line-names' as 'extra' property.
> > It is not defined in the "rockchip,pinctrl.txt" document, but in
> > ~/.local/lib/python3.5/site-packages/dtschema/schemas/gpio/gpio.yaml
> >
> > Where is that in use?
> > In this driver or external?
> > Can it be removed from mainline dts?
>
> gpio-line-names gets defined in devicetree/bindings/gpio/gpio.txt
> which isn't converted to yaml yet:
>

On top of what Heiko says, feel free to convert
Documentation/devicetree/bindings/gpio/gpio.txt to YAML :-)

Thanks!
Ezequiel
