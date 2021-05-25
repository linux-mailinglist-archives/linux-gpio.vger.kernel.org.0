Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F67138FDF1
	for <lists+linux-gpio@lfdr.de>; Tue, 25 May 2021 11:34:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232630AbhEYJf5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 May 2021 05:35:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232624AbhEYJf4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 May 2021 05:35:56 -0400
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com [IPv6:2607:f8b0:4864:20::d2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CB1AC061756
        for <linux-gpio@vger.kernel.org>; Tue, 25 May 2021 02:34:26 -0700 (PDT)
Received: by mail-io1-xd2a.google.com with SMTP id e17so18297603iol.7
        for <linux-gpio@vger.kernel.org>; Tue, 25 May 2021 02:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=rGVIBQfA9yaEYKQ7c9uj55/JXYlST++Dmh1T8Dha/l4=;
        b=I2+wijtYwBgrvry710jQZ3rP7NQ43az4kzhNkjPiJtNH5xP3fgAtsU9gkUf/9lZVim
         T3NdpcCP/qy3TOExlpqJ3o3n+Bv1N7F9t53nA+i1h1yFSp3TygMjkqbKup7iDp1MOEgo
         PMSt1hdxuxcDeqpemy2893wnKsVcYneU6P23QZ3oFlWPhMfDoa9K/dOkmb19mswDH3gy
         PzHoF2cbOq9Xbt2bqgQLNHO9gAjpWkEYF+iofGOsRGz26XSkfV4gO/5PsRchya/TOA1H
         ATtPWlmaDpftSklsn23JmxRNytssrPNjc5QUHiBfZPMi5b7QwqtTBCtDUGS/Y1pbvRj7
         aMgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=rGVIBQfA9yaEYKQ7c9uj55/JXYlST++Dmh1T8Dha/l4=;
        b=HXPhQjfXLI1FSF9o5tWLSKpRoQtcjOyV2E8/Qs3z+D0IBXNRACl9j+K+DVVE+BDSOr
         vEYVxe1PvfFFMB/UorVAoavJ8kw8djn8qeOzjrb3c8X/4HtbF74CzajxS2d73YX+z0tH
         GaVda8npt4gyEmGwAIglYdSfNL3ARfInnAo1c13L8DqqsNf1Ddvh4lNwnm0Y03uR/KHn
         SLjSslKNUobCkOVKGfiK4noNKk7bQNEmb2QmWG9fecQtNT+nlXLuCzp/sm9L11Ck2HBS
         s8ZVr3WtKAUHW5HfSKwli0qswjgTWB2E+dDd8BrTljMRsbHOnfWE62LnZ/kDfEzVPuaW
         comQ==
X-Gm-Message-State: AOAM5330oOcCIpsEsRRhIBFOD9lqRbiHcEEuj1vopagErz180i+tBUVg
        xh/6q+zAfO5IKD6cv2C6IB1GhdjtXkeiN3ryZRMJUw==
X-Google-Smtp-Source: ABdhPJyhRwetuxqbSSb5e6pvmDFrqJrDw22vGXVFUtswYnw4/EGcGoFbgXDTHMhwKHDFkyJYEp/drlpV/oEUvD+QBDQ=
X-Received: by 2002:a05:6602:189:: with SMTP id m9mr19947698ioo.88.1621935265730;
 Tue, 25 May 2021 02:34:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210524120539.3267145-1-robert.marko@sartura.hr>
 <20210524120539.3267145-3-robert.marko@sartura.hr> <20210524230940.GA1350504@robh.at.kernel.org>
 <20210525074649.GC4005783@dell>
In-Reply-To: <20210525074649.GC4005783@dell>
From:   Robert Marko <robert.marko@sartura.hr>
Date:   Tue, 25 May 2021 11:34:15 +0200
Message-ID: <CA+HBbNFxCKbitVctbUisuZXJWxaZp0cswNNNTgD0UxQZ1smJbg@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] dt-bindings: mfd: Add Delta TN48M CPLD drivers bindings
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Rob Herring <robh@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        bgolaszewski@baylibre.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Luka Perkov <luka.perkov@sartura.hr>, jmp@epiphyte.org,
        Paul Menzel <pmenzel@molgen.mpg.de>,
        Donald Buczek <buczek@molgen.mpg.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 25, 2021 at 9:46 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> On Mon, 24 May 2021, Rob Herring wrote:
>
> > On Mon, May 24, 2021 at 02:05:38PM +0200, Robert Marko wrote:
> > > Add binding documents for the Delta TN48M CPLD drivers.
> > >
> > > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > > ---
> > > Changes in v2:
> > > * Implement MFD as a simple I2C MFD
> > > * Add GPIO bindings as separate
> >
> > I don't understand why this changed. This doesn't look like an MFD to
> > me. Make your binding complete if there are missing functions.
> > Otherwise, stick with what I already ok'ed.
>
> Right.  What else, besides GPIO, does this do?

It currently does not do anything else as hwmon driver was essentially
NACK-ed for not exposing standard attributes.
The CPLD itself has PSU status-related information, bootstrap related
information,
various resets for the CPU-s, OOB ethernet PHY, information on the exact bo=
ard
model it's running etc.

PSU and model-related info stuff is gonna be exposed via a misc driver
in debugfs as
we have user-space SW depending on that.
I thought we agreed on that as v1 MFD driver was exposing those directly an=
d
not doing anything else.
So I moved to use the simple I2C MFD driver, this is all modeled on the sl2=
8cpld
which currently uses the same driver and then GPIO regmap as I do.

Other stuff like the resets is probably gonna get exposed later when
it's required
to control it directly.

Regards,
Robert
>
> > >  .../bindings/gpio/delta,tn48m-gpio.yaml       | 42 ++++++++++
> > >  .../bindings/mfd/delta,tn48m-cpld.yaml        | 81 +++++++++++++++++=
++
> > >  2 files changed, 123 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/gpio/delta,tn48=
m-gpio.yaml
> > >  create mode 100644 Documentation/devicetree/bindings/mfd/delta,tn48m=
-cpld.yaml
>
> --
> Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]
> Senior Technical Lead - Developer Services
> Linaro.org =E2=94=82 Open source software for Arm SoCs
> Follow Linaro: Facebook | Twitter | Blog



--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura Ltd.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr
