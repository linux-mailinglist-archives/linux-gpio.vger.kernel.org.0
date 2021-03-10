Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85721336841
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Mar 2021 01:00:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229544AbhCJX7b (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Mar 2021 18:59:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229675AbhCJX7Y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Mar 2021 18:59:24 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCD8FC061761
        for <linux-gpio@vger.kernel.org>; Wed, 10 Mar 2021 15:59:23 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id d3so36582575lfg.10
        for <linux-gpio@vger.kernel.org>; Wed, 10 Mar 2021 15:59:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=dagZdlJSDk9BSW0IHSKAmSKBHhrpoDiQ1DO3svAoSVA=;
        b=XBeLryR4FhDUUNs0NTaX5cqE4HV9BM84aNyHPkcZP1lriZYH6OvwYjiHWkWo0NU3y+
         R6uoOjkPACcqUKIJOhrlyQs/yW5cggb3TVOGRzZqe5tU94KwZ6P3mI2YZp/0yDQbEcB8
         MBHRQ3dyvp6eTR9W83FVpLkeCZJjkHEfdAnd4mlSOpgHAqhV/yUReYk3XNnAoL9MIZSp
         59trtMWtRzivg6GNH+dVgz6WSuCFbGiR4qeyD8KjgbRkZBS3Hh9Ny8tGbxchuqGVTVNS
         p+e0QSwn1YM7BnoEXASxUy0qV8C/lYPO8qoyTnfQ5KErs/bKdkIw9kWKkYdi1nMbDeo8
         gGqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=dagZdlJSDk9BSW0IHSKAmSKBHhrpoDiQ1DO3svAoSVA=;
        b=N9qv8NZAk6ojcO5lPl/V39RuuFMPDSI5KovvjqGYYC5MunldbGSpDHalHLoflScApg
         TAbve6106P73Lu7Jl10uAmQdzk6qRc36K/N1pvBfHywUXZBY4gf0G1M5GHnOAH3TzR7a
         WAYC7FHQ3ujEt6FfAQSaI54QE3miNld2Ho3/YB5CTlTYahFLUOSeLH9/HMVD0IKCc3vG
         eTsESE7Qy7+wFYmS8+agx9vO+Qy+vFgrujgXukNCRroE7p949jp3pIhFeiOibWeNcZez
         Mg/jKELTGgZxhikycG5hs3YxZHRPJTbwj9ND57u4HDti1usGPn5ZSHoDw+/FxfRRl6JN
         PVEA==
X-Gm-Message-State: AOAM531OhS2ZQOh6sELYw2IoL6QLLYdu3f+9BBPf028nPsjK1TJtfh1Z
        wP56KBR9xj7kugnbD9bVV5GMbhYMbtFjsLzun2mEyA==
X-Google-Smtp-Source: ABdhPJzdEdBi2sdOnSDjlS1DfmctL5wDJBhET4DfhoDIhrBBeoOES5ahoxRNyDKR7g42nmU2eovUzpQkaobRoucA/Ss=
X-Received: by 2002:ac2:4d95:: with SMTP id g21mr612424lfe.29.1615420762141;
 Wed, 10 Mar 2021 15:59:22 -0800 (PST)
MIME-Version: 1.0
References: <20210306155712.4298-1-noltari@gmail.com> <20210306155712.4298-4-noltari@gmail.com>
 <CAHp75VdwqpL0UScR5s+Tf4z7RZQfyo+625uXZtfWV3=xQr6Z2Q@mail.gmail.com> <EC7F8938-63CB-43D9-AE75-644B2E647360@gmail.com>
In-Reply-To: <EC7F8938-63CB-43D9-AE75-644B2E647360@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 11 Mar 2021 00:59:11 +0100
Message-ID: <CACRpkdbP7kAVR9ORQuj7W9iT3EDE1S3iZ-1q+kBoQ8R0TUVMJA@mail.gmail.com>
Subject: Re: [PATCH v5 03/15] pinctrl: bcm: add bcm63xx base code
To:     =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Walle <michael@walle.cc>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 10, 2021 at 8:25 AM =C3=81lvaro Fern=C3=A1ndez Rojas
<noltari@gmail.com> wrote:

> > // for now, since we have not an analogue (yet)

> > node =3D=3D> to_of_node(fwnode)
>
> So you want me to convert everything to fwnode, but then I would need to =
use of_node here=E2=80=A6
> It makes more sense to me to use of_node for now and convert it to fwnode=
 in the future=E2=80=A6
> @Linus, what do you think?

I am aware of the ambition to use fwnode more to more things.

To me it is most important on things that will potentially run with
both OF and ACPI.
Typical example: ARM Qualcomm SoCs. New drivers for Aarch64 platforms.

This is a legacy MIPS platform, and we have tons of legacy platforms for AR=
M
etc which will never get converted to fwnode, sadly.

Is it realistic that these MIPS platforms will run ACPI in addition to
OF? Is ACPI even available on MIPS? Isn't OF the preferred HW description
language for anything MIPS?

Yours,
Linus Walleij
