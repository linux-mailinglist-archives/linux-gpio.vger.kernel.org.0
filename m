Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A80873F4340
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Aug 2021 03:57:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234692AbhHWB6Y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 22 Aug 2021 21:58:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234700AbhHWB6X (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 22 Aug 2021 21:58:23 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1E4DC061575
        for <linux-gpio@vger.kernel.org>; Sun, 22 Aug 2021 18:57:41 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id a25so6913522ejv.6
        for <linux-gpio@vger.kernel.org>; Sun, 22 Aug 2021 18:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pensando.io; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cFpzmqFB9yMMD1KfuKMeohgeAz7Z+gUa98V8V3Wvc2Y=;
        b=4JYF2YdgvMXnbxOW/yTllPVtM0MKS0UMGwBXWi0PyRdh4nlSyYuag8ahq42HkkpBuA
         ELMXNVKWeRW3ZZEk/TTWjQy0YVs+FbkeSu59pB4loOfQT5M9x/PclLiX3fZI+EUFr6Xe
         hGP0ja0rWDuTR6cRRRZdhXYTWLerTWM1rcOLtWJrmORQiIzKlhvh6X7ZZgSCslZjRvCB
         ZmCaSeHxl3E/3Vm6qn1Kl0yt77BZQNQwac3GN25lQJETB9GrFJK88dXNTe6z4ySuSvVg
         jAuDr+40lzVSYOAEUs5WZYxU1YE211PBySjGcngMIY/PCcEw0wjAmG4s5NLuAb25gMbL
         87UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cFpzmqFB9yMMD1KfuKMeohgeAz7Z+gUa98V8V3Wvc2Y=;
        b=L5mxJnRZnNkQUdywQ2HVowA1X4hP6mOd+ARECdsIppc5uV7pXPMzMOIXxR8/H4Fie7
         mdhtNGKPKEGc0mW0pigGCwV04E1cee8nqfWBJGkATN/JVUbptIHACzz6Sxh2ayJCPRiB
         9cUY+fqMRRMUnVk8qLwB2fAFFMiBs+mBDJNQAeVGgzqTexyyvf0hYWZL/YakOWWylyb2
         6RgEznnxziLzxDeFIV7mEGN00E67HPNJDrVRW3dzWmC2wkzeEGnS04Tz1ndnNNAVnFWk
         gRMDNZIc53wht81Ccj7BhY9F6X6WrigNigrDeAhFpPemwMzJjm6Xez5KkhhKRTlB2+uM
         /SYA==
X-Gm-Message-State: AOAM531NaXGsDwoFpRHbYs+i3XoVx6gMGi3LjAXDI+fwS5ohhM8FRRcw
        mXKfHthCDU2i3trusma7ftr/5BNIjTldGu5fw72TNA==
X-Google-Smtp-Source: ABdhPJwJo6/NtT/bvfJ0FK7tHlKmovEqXfs9HK+XjaGlz7pp1sb1VNlXre/DPKVqRMPmnmsgNC7snExXw1W5oieFGM4=
X-Received: by 2002:a17:906:cb11:: with SMTP id lk17mr32572506ejb.271.1629683860510;
 Sun, 22 Aug 2021 18:57:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210329015938.20316-1-brad@pensando.io> <20210329015938.20316-11-brad@pensando.io>
 <20210330111243.ne23j7ycsvy634rw@ti.com>
In-Reply-To: <20210330111243.ne23j7ycsvy634rw@ti.com>
From:   Brad Larson <brad@pensando.io>
Date:   Sun, 22 Aug 2021 18:57:29 -0700
Message-ID: <CAK9rFnx4jBAEMYVcVW+D5bRRzJA22wzYzyaCT9Q+y2Xw638bfQ@mail.gmail.com>
Subject: Re: [PATCH v2 10/13] dt-bindings: spi: cadence-qspi: Add support for
 Pensando Elba SoC
To:     Pratyush Yadav <p.yadav@ti.com>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mark Brown <broonie@kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Olof Johansson <olof@lixom.net>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-spi <linux-spi@vger.kernel.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Pratyush,

On Tue, Mar 30, 2021 at 4:12 AM Pratyush Yadav <p.yadav@ti.com> wrote:
>
> Hi Brad,
>
> On 28/03/21 06:59PM, Brad Larson wrote:
> > Add new vendor Pensando Systems Elba SoC compatible
> > string and convert to json-schema.
> >
> > Signed-off-by: Brad Larson <brad@pensando.io>
> > ---
> >  .../bindings/spi/cadence-quadspi.txt          |  68 --------
> >  .../bindings/spi/cadence-quadspi.yaml         | 153 ++++++++++++++++++
(...)
> > +properties:
> > +  compatible:
> > +    contains:
> > +      enum:
> > +        - cdns,qspi-nor       # Generic default
> > +        - ti,k2g-qspi         # TI 66AK2G SoC
> > +        - ti,am654-ospi       # TI AM654 SoC
> > +        - intel,lgm-qspi      # Intel LGM SoC
> > +        - pensando,cdns-qspi  # Pensando Elba SoC
>
> Wouldn't this allow any combination of all 5 strings? So for example
> this would allow "ti,am654-ospi", "pensando,cdns-qspi" which is
> obviously not correct.
>
> I sent a patch recently [0] that does this correctly and it has gotten
> Rob's blessing. So I suggest you build your patch on top of that.

Thanks for the pointer to the patch that creates yaml binding
spi/cdns,qspi-nor.yaml.  All I will need to do now for the updated
patchset is this

--- a/Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml
+++ b/Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml
@@ -20,6 +20,7 @@ properties:
               - ti,k2g-qspi
               - ti,am654-ospi
               - intel,lgm-qspi
+              - pensando,elba-qspi
           - const: cdns,qspi-nor
       - const: cdns,qspi-nor

Regards,
Brad
