Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DFDD410A841
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Nov 2019 02:58:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726121AbfK0B6S (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Nov 2019 20:58:18 -0500
Received: from mail.kernel.org ([198.145.29.99]:39460 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726081AbfK0B6S (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 26 Nov 2019 20:58:18 -0500
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8C77F207DD;
        Wed, 27 Nov 2019 01:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1574819897;
        bh=yUbAjVfl4t6YJAMVRmQUHJSbU7woRgvSxyinA20eFYM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=0ZNGcffCJymTkmD+GCOqe68NqvcHxx9oTOOiXzNOkx1yaNP67r6T4TeXgp02Ewifv
         HxjD97jqQqE1rS31Nh2HR41UdfBARkHMMQ1Msg0KzDdgc4Ehm1RHF7rYyLKZVjo6c1
         UepOkE+88NNcDcV0vn96sTXFYJVTPm5PAkcJtTXI=
Received: by mail-lf1-f54.google.com with SMTP id l28so15790561lfj.1;
        Tue, 26 Nov 2019 17:58:17 -0800 (PST)
X-Gm-Message-State: APjAAAXVxuvr00uWe/43bH/tSoQ2H0o8vuV9NCRHVXIJEGajZh6zrCXL
        dzUJ3HcrCpG24dOlaweABMjZuFttUpQ43w/AOEc=
X-Google-Smtp-Source: APXvYqwqQ/PbVuU9oIO70cIYil2g5zlwFyjYkXkGME8+qAz9dLFuBuYWwtL8567qd0a3L5qbl7PDHSoong7wifBfy60=
X-Received: by 2002:a19:7510:: with SMTP id y16mr26681496lfe.24.1574819895739;
 Tue, 26 Nov 2019 17:58:15 -0800 (PST)
MIME-Version: 1.0
References: <CGME20191121072643epcas2p452071a503725c7764acf5084d24425b1@epcas2p4.samsung.com>
 <001001d5a03d$05de1f70$119a5e50$@samsung.com> <CAJKOXPckbRowhCmnJfT8-DT3gYaTpDOf0wVxmxdf-tZpOyM5ew@mail.gmail.com>
 <028901d5a3f6$e2d72310$a8856930$@samsung.com> <CAJKOXPdy=oxkwspt3CpF-qV5XRPMKrupMOpbWXJT3e7trqvXkw@mail.gmail.com>
In-Reply-To: <CAJKOXPdy=oxkwspt3CpF-qV5XRPMKrupMOpbWXJT3e7trqvXkw@mail.gmail.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Wed, 27 Nov 2019 09:58:04 +0800
X-Gmail-Original-Message-ID: <CAJKOXPdDYv2McfMPabmTkhDFFL-68yHqcOOTCw75=+HpCRRHMg@mail.gmail.com>
Message-ID: <CAJKOXPdDYv2McfMPabmTkhDFFL-68yHqcOOTCw75=+HpCRRHMg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: samsung: modularize samsung pinctrl driver
To:     Hyunki Koo <hyunki00.koo@samsung.com>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>, linux-gpio@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 26 Nov 2019 at 14:09, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Tue, 26 Nov 2019 at 09:14, Hyunki Koo <hyunki00.koo@samsung.com> wrote=
:
> >
> > On Thu, 21 Nov 2019 at 16:38, Krzysztof Kozlowski <krzk@kernel.org> wro=
te:
> > > Hi,
> > >
> > > Thanks for the patch. Few comments below:
> > >
> > > On Thu, 21 Nov 2019 at 15:26, =EA=B5=AC=ED=98=84=EA=B8=B0 <hyunki00.k=
oo@samsung.com> wrote:
> > >>
> > >> Enable samsung pinctrl driver to be compiled as modules.
> > >
> > > Why? What's the benefit? Are platforms capable of such boot? Pinctrl =
is needed early - even before mounting rootfs...
> > > What about module unloading? Is it reasonable?
> > > Please answer to all this also in commit message.
> > >
> >
> > Sorry to late and Thank you for your comment, I would like to apply GKI=
 on the pinctrl driver
> > So I would like to cut off dependency from ARCH_EXYNOS.
>
> This is driver for Exynos and S3C so why cutting off the dependency? I
> mean, wait, it is a driver for Exynos so it cannot work on other
> boards...

One more thought about Generic Kernel Image for Android. It implies
that vendor stuff will be in modules... but only for out-of-tree code.
The Exynos pinctrl driver is already in mainline so moving it into
module is not necessary.

As for dependency on ARCH_EXYNOS - I do not get why this is a problem.
ARCH_EXYNOS is multiplatform ready so you can boot multi_v7... What
would be the benefit of removing this dependency?

Best regards,
Krzysztof
