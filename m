Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 095923DB862
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jul 2021 14:11:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238719AbhG3ML7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Jul 2021 08:11:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238672AbhG3ML7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Jul 2021 08:11:59 -0400
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com [IPv6:2607:f8b0:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4D2BC0613CF
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jul 2021 05:11:53 -0700 (PDT)
Received: by mail-il1-x12e.google.com with SMTP id f8so5878399ilr.4
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jul 2021 05:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4oJIeZcOcOPJ/i4mLzpMBQLS6AE+13Y8avAKoNcxP1k=;
        b=b4hXRZsxrIvCyPKxJq3eohsD6mPpTgbVVsSl0RpV8nR1xxxbYJEKpZQ3dWayQpOsjA
         vpGWfxPgwdMrJik+8vPk1we4h/If4ZARe17ciIzx61mMB4BrieDoxBOIq+5d9lt18jPE
         ol/7Yy5zR0HV7uUPAwCLDNsgO1oVqqN4gXDNE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4oJIeZcOcOPJ/i4mLzpMBQLS6AE+13Y8avAKoNcxP1k=;
        b=tR5L+c2sVTQyZZCY2NMD205zSGWSUlZDPMCKNa24qOvawvH9Zdu0dsSXh4fX4z6BXv
         AaKifsxJHrm0v8YsJappCMU+yBc44BwoNVF7/XOD0GKmbCuBMSjWz6XXLZKrTowrsSS0
         q/RacnIMD2qTK0zB94dciEfE+AdduKp/DHN79imjAwS35xCUPHZn39aAEpEq7gLrs65p
         Mm6ZOznShpLhW3PQ0ZwBjDIKhlw7zf+P5eoykIhlZrq6HQVnsd4jW8SRlnO0k88E7X6N
         wmnxFVj19h/4BcN+Lesr8k6mtBFUoDmITjQR/qGXN07mV/L35x4VWlhbKj5aTiWMDbQw
         3d0Q==
X-Gm-Message-State: AOAM532GH3NgYPxeyAN1MnaEDVcXjy5xuLgdRYn8q8GzNnF8xqCXrTLl
        GaciDgVKidV5/nB0mSBFLF5bVBsznvGbIZ61O4shng==
X-Google-Smtp-Source: ABdhPJzdzY/EkBXtzNbk992cCacQT8oJznIwK+0lfo184G1dL4ZfQrzWixcBHtE9NkEBCuM0gHsmDH2Vwoch4Bq+ytI=
X-Received: by 2002:a92:d441:: with SMTP id r1mr1209740ilm.106.1627647113059;
 Fri, 30 Jul 2021 05:11:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210727110232.2503763-1-hsinyi@chromium.org> <20210727110232.2503763-3-hsinyi@chromium.org>
 <CAL_JsqJT1_TKc9QDxGKZ=WrK8_JGwke9MarMzjUvJJPJD8A5Jg@mail.gmail.com>
In-Reply-To: <CAL_JsqJT1_TKc9QDxGKZ=WrK8_JGwke9MarMzjUvJJPJD8A5Jg@mail.gmail.com>
From:   Hsin-Yi Wang <hsinyi@chromium.org>
Date:   Fri, 30 Jul 2021 20:11:27 +0800
Message-ID: <CAJMQK-jnPg5bzPVRsq=9LEMooUN6CerdMqiXhgY5rZVkuB5UjQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] dt-bindings: mediatek: convert pinctrl to yaml
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Enric Balletbo Serra <eballetbo@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Sean Wang <sean.wang@kernel.org>,
        Andy Teng <andy.teng@mediatek.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Devicetree List <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 28, 2021 at 11:17 PM Rob Herring <robh+dt@kernel.org> wrote:
>
> On Tue, Jul 27, 2021 at 5:02 AM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
> >
> > Convert mt65xx, mt6796, mt7622, mt8183 bindings to yaml.
> >
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > ---
<snip>

thanks for reviewing. All comments addressed in v2.
