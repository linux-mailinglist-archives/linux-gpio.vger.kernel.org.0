Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C82763DBEB0
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jul 2021 21:05:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231124AbhG3TFQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Jul 2021 15:05:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231143AbhG3TFP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Jul 2021 15:05:15 -0400
Received: from mail-ua1-x932.google.com (mail-ua1-x932.google.com [IPv6:2607:f8b0:4864:20::932])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8432C061765
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jul 2021 12:05:09 -0700 (PDT)
Received: by mail-ua1-x932.google.com with SMTP id n15so4384579uao.6
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jul 2021 12:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lI7MSErWXqY8bqPMsLO7ItBW3m+DVtFHrgMs+xiZXJA=;
        b=bD1vPWsa2lKCLWxXOLT+1UnDwNSAZJwXtAOcVDw+V/e40KbH2sue31nkHNrjIfFRB/
         BslMGwza2qlB9k4lB4tO8GZi4lLygpVjJnrgAiTX9A7XBavBoVYpWz3C439RTw40hYb7
         73WS9zbvN0I0GTONPEJId0bIjO6Zedp5S1f6UUSWvz+fMoo07JM1RVxe7VoY2BjtChkG
         tINUW4cLZsSrQXDv/IC1J4t5H4sO1p60pLv1CLwlu7PZSlznBrwaq8HglsTegVI/57/i
         EWGSpjcw2sq4qEWxwTHVfSifkhwulE/3Tp9P4dX00x66yvod5f/3IpJCqOX4iPM3SVa+
         24Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lI7MSErWXqY8bqPMsLO7ItBW3m+DVtFHrgMs+xiZXJA=;
        b=EGfCnRh6GaD4DYme8qliY8qiXZoOLxgU9od1FUPcNOepCpBzqFzfjX9QZc99FbEPav
         AYb6HheaiZmea0GJPF3Oh0hHwvDl3YA3qUjZUamDIOKARb3vTmgIyvzS5Uv95DjsMb2A
         gwg7LztBB7l3MLGp/rR04rYgrlCfPsjOHfgHdED1mY7A0ZV5YeOEv6dO/gA0gFwM11QP
         M6DYXEUHxUXRG6N1i7gDpsovcwsF7z8Srmk8yjwH9QnpT7CctuvHzg5BjWoIiZGx3/rF
         Vv98yoRKKF//WB177Ix09YyXYxXjOmZ7NshxOXlAqxrG07MhNVUCTF7tDuBcEc/r/BpQ
         WUkA==
X-Gm-Message-State: AOAM532JKJRlWDcvUpgAJvcEDoMx+zT7MdAupFeco9SZZY/SwtQJ+RFg
        pkl93eujRpaP3QE9oDUnE8uZ/H9S079CriZ4npec/w==
X-Google-Smtp-Source: ABdhPJxKt0a6oYMaEe+KWlQ+pBTttefGnJsa9zMvoC3nKXiwFjF1SfuJWc7o7a7CAIlZOh6JUnBHXF86ZK2SwHk1TRQ=
X-Received: by 2002:ab0:4e22:: with SMTP id g34mr3841963uah.17.1627671908951;
 Fri, 30 Jul 2021 12:05:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210730144922.29111-1-semen.protsenko@linaro.org>
 <20210730144922.29111-8-semen.protsenko@linaro.org> <45da758c-d32d-293b-f4c7-12b58ebca8ac@canonical.com>
In-Reply-To: <45da758c-d32d-293b-f4c7-12b58ebca8ac@canonical.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Fri, 30 Jul 2021 22:04:57 +0300
Message-ID: <CAPLW+4=xa-cMR-oqOmEV=su6k=pWE8qSupYoq5evaDr=T26aEA@mail.gmail.com>
Subject: Re: [PATCH 07/12] dt-bindings: serial: samsung: Add Exynos850 doc
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Charles Keepax <ckeepax@opensource.wolfsonmicro.com>,
        Ryu Euiyoul <ryu.real@samsung.com>,
        Tom Gall <tom.gall@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 30 Jul 2021 at 19:35, Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> On 30/07/2021 16:49, Sam Protsenko wrote:
> > Add compatible string for Exynos850 SoC.
> >
> > Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> > ---
> >  Documentation/devicetree/bindings/serial/samsung_uart.yaml | 1 +
> >  1 file changed, 1 insertion(+)
>
> Thanks for the patches!
>
> Please put this one before other serial changes but does not have to be
> first in the entire series.
>

Done. Will be present in v2.

> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>
> Best regards,
> Krzysztof
