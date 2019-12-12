Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D13CB11C9C6
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2019 10:46:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728352AbfLLJpJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Dec 2019 04:45:09 -0500
Received: from mail.kernel.org ([198.145.29.99]:45366 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728292AbfLLJpJ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 12 Dec 2019 04:45:09 -0500
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 72C322173E;
        Thu, 12 Dec 2019 09:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576143908;
        bh=f9Ak9YkcdsVwX35rit8MveYU4mESDVr/WrzqXYx+3tQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=dYazKHmGOA8OjL3TyHejoYsQ3UWGGNpXDFa4p1IrdQe4HAkpH8M36qmu1ixuKvTZB
         OQqg/MRrPgdVWPfBjEQB9OtMs9fjbwSnM38fzAYWosw3qX9OK/E3DOU28DVVFLqLvI
         WsB6VK91RflvrUMmAM5bnp2+u95IbMUF70EGDVns=
Received: by mail-lj1-f176.google.com with SMTP id s22so1518253ljs.7;
        Thu, 12 Dec 2019 01:45:08 -0800 (PST)
X-Gm-Message-State: APjAAAWo0fIPjHU0mob9wcKe8fGe5HUzbvvklO+6xLaS4sPCPIF3WZ00
        wwFPoBXLWhGvsxUVFyu83TeZfe7hy55B6fersek=
X-Google-Smtp-Source: APXvYqwQIBLDBM/LOFWdWY408vZlspPEQyRtjumJP4U2w2tpFn5JsyeZ2XVAe4ydAUifEraE6irZW5dAQ/EgUzp4CvA=
X-Received: by 2002:a2e:9196:: with SMTP id f22mr5323830ljg.18.1576143906674;
 Thu, 12 Dec 2019 01:45:06 -0800 (PST)
MIME-Version: 1.0
References: <20191212092726.41027-1-chenzhou10@huawei.com> <CAJKOXPexCjtPB03kKLzLK+4LdrM1_qNstMa4cJW19OpHsN59eg@mail.gmail.com>
In-Reply-To: <CAJKOXPexCjtPB03kKLzLK+4LdrM1_qNstMa4cJW19OpHsN59eg@mail.gmail.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Thu, 12 Dec 2019 10:44:54 +0100
X-Gmail-Original-Message-ID: <CAJKOXPfW4r92LF4RPiPAEjn++nCj-+EG9OUu8GOT-+9iztP1Ew@mail.gmail.com>
Message-ID: <CAJKOXPfW4r92LF4RPiPAEjn++nCj-+EG9OUu8GOT-+9iztP1Ew@mail.gmail.com>
Subject: Re: [PATCH -next v2] pinctrl: samsung: fix build error without CONFIG_OF_GPIO
To:     Chen Zhou <chenzhou10@huawei.com>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>, s.nawrocki@samsung.com,
        linux-gpio@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Hulk Robot <hulkci@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 12 Dec 2019 at 10:38, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Thu, 12 Dec 2019 at 10:30, Chen Zhou <chenzhou10@huawei.com> wrote:
> >
> > If CONFIG_OF_GPIO is n, build fails:
> >
> > drivers/pinctrl/samsung/pinctrl-samsung.c: In function samsung_gpiolib_register:
> > drivers/pinctrl/samsung/pinctrl-samsung.c:969:5: error: struct gpio_chip has no member named of_node
> >    gc->of_node = bank->of_node;
> >
> > Use #ifdef to guard this.
> >
> > Reported-by: Hulk Robot <hulkci@huawei.com>
> > Signed-off-by: Chen Zhou <chenzhou10@huawei.com>
> > ---
> >  drivers/pinctrl/samsung/pinctrl-samsung.c | 2 ++
> >  1 file changed, 2 insertions(+)
>
> I was thinking about adding OF_GPIO but I could not trigger such case
> as you mention. How can I reproduce this?

OK, I reproduced it with x86_64 + COMPILE_TEST + PINCTRL_S3C64XX. I'll
fix it up with proper dependencies on OF and GPIOLIB. The driver
should not have unnecessary ifdefs.

Thanks for the report!

Best regards,
Krzysztof
