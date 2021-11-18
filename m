Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF41D456082
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Nov 2021 17:30:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233207AbhKRQd6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 18 Nov 2021 11:33:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232841AbhKRQd6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 18 Nov 2021 11:33:58 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC24CC061574;
        Thu, 18 Nov 2021 08:30:57 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id u3so28766239lfl.2;
        Thu, 18 Nov 2021 08:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=P6Cs05oMd2OpRj6myRO3sxVEhv7HF5q1kH05zj1oWcA=;
        b=T1+ef2jJXAECOChH2guVLhTPNfQjK776PgM7Jj1Y89rmYOnM/mDpjk8rMehdeptza5
         AMXtjaQhI2kWNRfTI7xHNihYUrVCwX9KrookpEAM7ZGm9UxiXBF1YtXZdOzXA+cN4JMm
         n36HFu9x2pzXLWQnzJh1V1yZWXSxYbJiW+ZIetOQiizVt4IKK7yR6Sr/CAXPHNozXAAw
         dZBkoKFzhALhJDR1tf+w+HEULpypgx5tfr/alkIf9TQ79+sDEyjymWEcFcWvqBhGY5Pi
         ehNu1R/LH4Uw9ZDNPbGZYZ9UhA//IkMqQKirZ4dE6d/1NLE0l9AapKcA9KXNcgsQ0m3F
         rtUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=P6Cs05oMd2OpRj6myRO3sxVEhv7HF5q1kH05zj1oWcA=;
        b=ghmyjG8jWgy2en4SEXhb+nPDfNdZlcAYfXKzSFTeQgEBEMisOlxssyZiypwz499eyC
         /FL08drJZ+VMq17vfBVDYe+z9vmo77pyClNfltoq4k5M+qn08yyFqZegOtNAaNOcUQ3i
         Gbjn5u8KjD0J2CMr4F7H0dv7PdBviILjADzcaFdFvHucf7Kt/dUev7G1pa/WhcMb2kRy
         frPE9zfu+Wm21cWwMcWfZwW15q0m6L/2Btv560DXIaCtUqn1Ef7IJWqcQqnfz6r0xP5K
         bvGzqyaHEVVIsMUHfrfE0EZhDJB40PIkXAWuoq/kIr+Pjlo58j3JokcAiJwC5r+a4+vi
         OVZA==
X-Gm-Message-State: AOAM533Tr2zyN2uEiox8Gjfz9+6IEvuOmuwiYVQtsS06N6HiJfhNBAB/
        QE5jfWwDwg1MrdP0GXueZiiSLwXc1jZfNznbfNw=
X-Google-Smtp-Source: ABdhPJxu5SKnDTe+mX+HJrKiOkIbwUD+GWhJIhxlZyGOwcZdtNOaV2fk4BmqDtUsGY8TGPPGYKj2cF7CSgNwmSiDUYk=
X-Received: by 2002:a05:6512:260e:: with SMTP id bt14mr26640077lfb.129.1637253054688;
 Thu, 18 Nov 2021 08:30:54 -0800 (PST)
MIME-Version: 1.0
References: <20211118132152.15722-1-zajec5@gmail.com> <CAHp75VfckgE9VNkYTiJfxdQu66-DntUNOT7ttHr678Rt5fwmFg@mail.gmail.com>
 <c128065a-6039-6469-4c4d-f35e02ff4f54@gmail.com>
In-Reply-To: <c128065a-6039-6469-4c4d-f35e02ff4f54@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 18 Nov 2021 18:30:14 +0200
Message-ID: <CAHp75VfjaeCEbvZtg8pJ-DV2QnaX_fa717Zbw=RxCG9q5MOF5w@mail.gmail.com>
Subject: Re: [PATCH 0/5] pinctrl: allow storing pins, groups & functions in DT
To:     =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 18, 2021 at 3:59 PM Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> =
wrote:
> On 18.11.2021 14:52, Andy Shevchenko wrote:
> > DT is not the only one,
> >
> > So, I would like to see some kind of roadmap / vision on how this can
> > be useful in the ACPI case.
>
> Unfortunately I don't do any ACPI development and I also have zero ACPI
> experience. I'm not sure how to proceed with this. Does ACPI have some
> tables that get translated into DT-like form? Can I emulate that and
> test somehow?
>
> Anyone else willing to help on the ACPI part?

As I elaborated in the subthread of patch 3 you don't need to care
about ACPI _implementation_, only about _design_ that will give no
obstacles to have the ACPI part be implemented. I may do it in case
somebody prepares internal APIs and data structures for the
interaction with FW (descriptions). That said, you don't need to know
the ACPI details at all. Ask questions in case you are in doubt, I
would be happy to help.

--=20
With Best Regards,
Andy Shevchenko
