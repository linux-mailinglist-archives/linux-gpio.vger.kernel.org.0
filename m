Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C8E41BBC5F
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2020 13:27:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726493AbgD1L1l (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Apr 2020 07:27:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726482AbgD1L1l (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Apr 2020 07:27:41 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9945C03C1AB
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2020 04:27:40 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id j3so21007859ljg.8
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2020 04:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=w4DBB5klIf0QGN/n9IvG0hKMODa1zR1xeD/KT5pKouk=;
        b=IlC/VOx7VfCTd5g54ZVjw1O2wowU46ZNSWyKU7C2o/3/+KitIdB8TuO0aNjIEXy/b3
         1CYsDa6aMA5AxnQMibCFECQw+g+U0px/vFoGMbzWNC/cjx3oVVU+3an0ngq/2hnxrMor
         1TRCEwFybe93aUXkf5s3QErJqGxX0H9v90MR4x+K/AKQlHer0jyoCZXIr7J57Kjr31h7
         iXi6D8HBLXmlRPYMg36hO4SczFFUE0PNBb/8EDLDuf0W8rP6Yyg+joeqAyoNORCOVwOE
         1Odn5dRJqRXNdpW6I/EfW4woZUUzM27PsCMtVOGBOikvLw8i2+QgctW5kmr9OUL13ORw
         vOtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=w4DBB5klIf0QGN/n9IvG0hKMODa1zR1xeD/KT5pKouk=;
        b=G3G01qJdXrvMBljCqrFV3wwVq5uIzUfM7aQjHa+7xOfVYWJBqeBOlREK8JFFgoE7Gd
         I9V+dMbswl1M/3oWz41w6nAYT2/GYLtsGqeIOw0m3QyitE8yJk3wcFRTDesAvuJxUEN+
         0jQb2kFrug6bq2CujDHvnoroxKagzdtc/VGwe34nhhickmz/2e9WkKW6rkP1EYaBYfz8
         AOEPyIyl7YO2cMfbId7fVEHkqvtGekp0dpV9A0vJVJw3dcOHoNVN4GQjs2OdIs1KOWio
         og+gMjF1wG3xYmtKZOg1aStdzotyYIZhqKiKG2+GCPkHn9npuJIJ70tAMeVmGCTjZikG
         hJ0Q==
X-Gm-Message-State: AGi0Pub7uSeAAtOGq7OkFTZIc53zSemAxFucG8tNIrxiX+hQ8z/I668Q
        vFab3URaSm0BpfAsVG7Fg29mMSo2awW+7gxFJ42osA==
X-Google-Smtp-Source: APiQypKV704QjuX9brkHXyi9vW51TMuZXm1a3RD2HH//58wkwqAcG575ohaDZ1tUc941Eh8di8C386pjHZ1m4wCHMpE=
X-Received: by 2002:a05:651c:1058:: with SMTP id x24mr17947683ljm.39.1588073259176;
 Tue, 28 Apr 2020 04:27:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200421142402.9524-1-zhengdejin5@gmail.com>
In-Reply-To: <20200421142402.9524-1-zhengdejin5@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 28 Apr 2020 13:27:28 +0200
Message-ID: <CACRpkdaM88YebrRWPF=0navD8P9cEFYfepmEYb2+mw8LyNc5mw@mail.gmail.com>
Subject: Re: [PATCH v3] pinctrl: fix several typos
To:     Dejin Zheng <zhengdejin5@gmail.com>
Cc:     Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Sascha Hauer <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Joe Perches <joe@perches.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Apr 21, 2020 at 4:24 PM Dejin Zheng <zhengdejin5@gmail.com> wrote:

> use codespell to fix lots of typos over frontends.
>
> CC: Andy Shevchenko <andy.shevchenko@gmail.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
> ---
> v2 -> v3:
>         - remove the changed of "thru -> through" in the
>           pinctrl-nomadik-db8500.c by Joe's suggestion.

Patch applied.

Yours,
Linus Walleij
