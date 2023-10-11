Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0740D7C5298
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Oct 2023 13:55:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234766AbjJKLzj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Oct 2023 07:55:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232094AbjJKLzh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Oct 2023 07:55:37 -0400
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com [IPv6:2607:f8b0:4864:20::f30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01232A7
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 04:55:34 -0700 (PDT)
Received: by mail-qv1-xf30.google.com with SMTP id 6a1803df08f44-66d01345d73so6222766d6.2
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 04:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697025334; x=1697630134; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7cvXO7x5gI5C47ss6Zq2+fePRAxMCbTat+Dh3Sp9OFA=;
        b=lMydwga41zA6WI8F5LYb5U1SFCCyxLVhOCyfsl0M7MVvaFjkHZtGRbYR/5RBfhOi6J
         wPpd7KrRlAg6Z4Aj7TBaFL6x5Zc3rsMfupoR5SUf/eM0+lY6d/HpvbmA8amtM/AxTGC0
         XIK7vEguyW2miqMSI6MnWZ+0bSQRuSWreKrqgMrDUeuhyJ8v2YveAOQmHj4CwpXVXZ6d
         /iNlBKGn85jZNECaafYe+08y5G4ds49lH6dSB2tLshjeF/bA3dxlgIZyn+ON3ijlRNuj
         ewtJ8fVH9/qJ64RpQ8sW2biMq3z41ZIPktI+CSdSnoADFsNKlpxXRLFwtQgARs88CFhf
         3xuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697025334; x=1697630134;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7cvXO7x5gI5C47ss6Zq2+fePRAxMCbTat+Dh3Sp9OFA=;
        b=U026/CtaB8VTmWk3Wx9YTi/klfMN7W0eC3cyd5roaNthJaEOGkTOUBOWqnzmN6TIz7
         L0d+sgOMpVop0+7ZA9u6twG+pq4iVd7CwpiNp6YSehnadR8jsPSaZMopzah2U7d8j3vq
         A8GkCmyY2fxlI4i7X2cSUmhHEsA6FeSIHgedkVfU1/VgXsv0ZqPHTDHn4JUL/SeSh8hd
         5JsHFbCCBUTfuuEKpb33g5Fg3zm1xKUJGLYKbICuAN+sPMLvrbjAGZNvVhVlLylFR9fP
         1+IY/ivBbyNPZooKzuh94kmXYAbR+FjNaqyLdu0QM1NSOQmtObfv2xMMs5yq0JQ2LTmz
         oj4Q==
X-Gm-Message-State: AOJu0YzEREfK2NDsJu149KzKaWbFrnTlx5BbEFqDBBPcQ9yGmbhPojOt
        mXYZsO0+DzRbfNcNewUem7ZxiCjkuRri7DWVg/a4/w==
X-Google-Smtp-Source: AGHT+IHe2JDHf5GLsILYW0FI9jDBRkvodk/k8lYoYKPnNONC72RAopfMzahZ/vKq9W2HnpUivorIyRfGPJ/qy+LqbFg=
X-Received: by 2002:a05:6214:5010:b0:65b:31df:df76 with SMTP id
 jo16-20020a056214501000b0065b31dfdf76mr27858740qvb.44.1697025333986; Wed, 11
 Oct 2023 04:55:33 -0700 (PDT)
MIME-Version: 1.0
References: <20231010224928.2296997-1-peter.griffin@linaro.org>
 <20231010224928.2296997-9-peter.griffin@linaro.org> <2023101111-banknote-satin-1f77@gregkh>
 <a6c57156-d3a5-4524-8ef8-6f27cf0a2c97@linaro.org> <2023101137-fester-rerun-5c39@gregkh>
 <fe7cf585-622a-420e-8138-10de1cbca511@app.fastmail.com> <2023101126-stash-manor-7162@gregkh>
 <c454503a-8f89-4bcf-949d-4970595540fc@app.fastmail.com>
In-Reply-To: <c454503a-8f89-4bcf-949d-4970595540fc@app.fastmail.com>
From:   Peter Griffin <peter.griffin@linaro.org>
Date:   Wed, 11 Oct 2023 12:55:22 +0100
Message-ID: <CADrjBPq6HVVFRyrqFJhQ5_cj12HRAzCO6yKGW8c3Txmv1vcPhw@mail.gmail.com>
Subject: Re: [PATCH v2 08/20] dt-bindings: serial: samsung: Add
 google-gs101-uart compatible
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        krzysztof.kozlowski+dt@linaro.org,
        Michael Turquette <mturquette@baylibre.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Olof Johansson <olof@lixom.net>,
        Chanwoo Choi <cw00.choi@samsung.com>, andre.draszik@linaro.org,
        semen.protsenko@linaro.org, saravanak@google.com,
        William McVicker <willmcvicker@google.com>, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-watchdog@vger.kernel.org, kernel-team@android.com,
        linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Arnd,

Thanks for your feedback.

On Wed, 11 Oct 2023 at 11:19, Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Wed, Oct 11, 2023, at 11:42, Greg Kroah-Hartman wrote:
> > On Wed, Oct 11, 2023 at 11:30:25AM +0200, Arnd Bergmann wrote:
> >> On Wed, Oct 11, 2023, at 10:57, Greg KH wrote:
> >> >
> >> >> It's not only the IP itself
> >> >> that can differ, it's also the integration of the IP into the final
> >> >> product that could have an influence on the behavior.
> >> >
> >> > This is for the Pixel 6, a device that is no longer even shipping.  The
> >> > "final product" is long stable, so this should not be an issue.
> >>
> >> The driver does have soc specific settings for each compatible
> >> string, in this case it looks like it overrides the FIFO size
> >> based on driver specific data and the order in which the
> >> ports are probed [1]. I don't understand why the driver does
> >> this, but my impression is that if we wanted to change it to no
> >> longer rely on that data, we'd also need a new compatible
> >> string.
> >
> > As I reviewed that patch already, it is just duplicating an existing
> > quirk/device that the driver already supports, so there is no need for
> > any "new device type" to be added to that driver, just use the existing
> > hardware description in the dt and all should be fine.
>
> The thing is, I suspect that the FIFO size override is actually
> wrong for the exynos850 as well, and is almost certainly wrong
> for both exynosautov9 and google-gs101:
>
> - The driver overrides an exynos850 compatible uart to use a
>   256 byte FIFO on whichever port is probed first, 64 byte
>   on the next three ports, and the setting from DT on any
>   later ones, falling back to 16 bytes if the DT does not set
>   anything.
>
> - exynos850 only actually has three of these ports, not
>   four. It does not lists  FIFO size in the dts at all.
>
> - exynosautov9 has a total of 11 ports, each of these
>   compatible with both "samsung,exynosautov9-uart" as
>   the specific value and "samsung,exynos850-uart" as
>   the generic fallback. The DT lists a FIFO size of 256
>   bytes for ports 0, 1, and 6, but lists FIFO size 64
>   for each of the other ones.
>
> - google-gs101 only lists a single uart in the dts,
>   and sets it to a 256 byte FIFO.
>
> - testla-fsd claims to be compatible with exynos4210,
>   which also overrides the first two ports in probe
>   order to 256 and 64 bytes respectively (like exynos850),
>   but it only has two ports.
>
> - artpec8 has a separate compatible string so it overrides
>   all ports to 64 bytes.
>
> I don't know why probe order would have anything to do
> with this, so most likely these are all the same thing
> and should just put a fixed FIFO size into the DT for
> each port instance.

I agree, I just looked again at gs101 and in total we can have
19 uarts on this SoC. 3 of them are 256byte rx/tx fifo and the
other 16 have 64byte tx/rx fifo size, but this is a SoC design
choice and has nothing to do with probe order.

I will update in v3 to get fifo size from DT.

regards,

Peter.
