Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37570445CF3
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Nov 2021 01:13:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232490AbhKEAQ0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Nov 2021 20:16:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232536AbhKEAQZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Nov 2021 20:16:25 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6ECC7C06120C
        for <linux-gpio@vger.kernel.org>; Thu,  4 Nov 2021 17:13:46 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id j21so27017532edt.11
        for <linux-gpio@vger.kernel.org>; Thu, 04 Nov 2021 17:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pensando.io; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IhgAEkTJECpIqTDL/ENLizRv8mhp9DKt9XOklg+3I0E=;
        b=ZY9tceljvnofycAv9BIK/1dgqJWFJUN15uDkr55E7aCBUrYsVfhBP+wQrXBG7jVNRL
         P8ndUiQ3g9pc/N/1Ve+JjtH7EVHjm/zBNN+1D16sVhvfNoE6OeUxlt40m0spMpv/sO37
         +v7+zxIXXLcU+dyOR3Xs/ZGpIMYxERdoG7pkZrik/61sn1pwziXfgC5ayCDP4YvCqyDf
         0ce08dZjKRZ5vlaGoORvHNycU5ed5fynSbHJrcHJKpgnKrxjYgspNmEggyebv4BcdgVm
         p428yZwYhl8qLMvC+MEndxSuSYaoAxHgmKGYMO+vZuAo25zcyXXZ697UrAqx7Zsu15Fs
         zQ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IhgAEkTJECpIqTDL/ENLizRv8mhp9DKt9XOklg+3I0E=;
        b=JWmnRFpgMsW6ST3Mx2MWWIDzhlbhdpVt/X1AXlzz0CwM2zUQrgBrHffqIFsNgfl+E3
         cModmJuZSBIDw9VAG+KxtUl3MFp5qv+XgUFahwSQl5dXc1cEesUu/qdVUtmJetvpgwXG
         VSV0206wGaJ/RDB5TzOjRflbMpanP5Gf06MyEoK1cDmonIH4LGXQ1eXQhrbmFik7Op+o
         GlMlxtzSs2JUZXpbYuOrrOteNxAt9z9TTptJIMHxH9wLdSPSOQOz4blhWIsetLTR+hYT
         6Xqd929Hj0a09NIfZMvPgqx57998S/MOujA3VzIGMnFH5Yp9B7r0cLsp8cO15OD8AmDn
         5+8A==
X-Gm-Message-State: AOAM5320MaYKeRNRTPEkwPt95B+ly36ir6/PQb5lDEzZUxvh9PZFW78y
        3GZh18jEuPzU8FPv0ex5310EhZoSmLWy1Z/6Q+ogWg==
X-Google-Smtp-Source: ABdhPJxFuIEUo5C+4vx/YHqoFhN3Iksc8LjQ08WNM9GqIe3SHw3kWZZCIQuufKgOtnhH5tSjlXA7ZPWX2h7Zhr4uIlQ=
X-Received: by 2002:a50:9dca:: with SMTP id l10mr73680807edk.61.1636071224938;
 Thu, 04 Nov 2021 17:13:44 -0700 (PDT)
MIME-Version: 1.0
References: <20211025015156.33133-1-brad@pensando.io> <20211025015156.33133-4-brad@pensando.io>
 <1635166454.830065.190977.nullmailer@robh.at.kernel.org>
In-Reply-To: <1635166454.830065.190977.nullmailer@robh.at.kernel.org>
From:   Brad Larson <brad@pensando.io>
Date:   Thu, 4 Nov 2021 17:13:34 -0700
Message-ID: <CAK9rFnwP-7LAZFABrkwMk=jWF=y7+3Y_p3ivbpZQ5dH=9sy6xQ@mail.gmail.com>
Subject: Re: [PATCH v3 03/11] dt-bindings: mmc: Add Pensando Elba SoC binding
To:     Rob Herring <robh@kernel.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mark Brown <broonie@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        linux-spi <linux-spi@vger.kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Olof Johansson <olof@lixom.net>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Rob,

On Mon, Oct 25, 2021 at 5:54 AM Rob Herring <robh@kernel.org> wrote:
>
> On Sun, 24 Oct 2021 18:51:48 -0700, Brad Larson wrote:
> > Pensando Elba ARM 64-bit SoC is integrated with this IP and
> > explicitly controls byte-lane enables resulting in an additional
> > reg property resource.
> >
> > Signed-off-by: Brad Larson <brad@pensando.io>
> > ---
> >  .../devicetree/bindings/mmc/cdns,sdhci.yaml         | 13 ++++++++-----
> >  1 file changed, 8 insertions(+), 5 deletions(-)
> >
>
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>
> yamllint warnings/errors:
> ./Documentation/devicetree/bindings/mmc/cdns,sdhci.yaml:20:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
>
> dtschema/dtc warnings/errors:
>
> doc reference errors (make refcheckdocs):
>
> See https://patchwork.ozlabs.org/patch/1545481
>
> This check can fail if there are any dependencies. The base for a patch
> series is generally the most recent rc1.
>
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>
> pip3 install dtschema --upgrade
>
> Please check and re-submit.
>

yamllint was not installed, it is now and dtschema is updated to run again
before re-submit.

Thanks,
Brad
