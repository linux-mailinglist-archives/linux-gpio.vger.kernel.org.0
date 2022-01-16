Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FCAA48FA17
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Jan 2022 02:01:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232755AbiAPBBa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 15 Jan 2022 20:01:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232745AbiAPBBa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 15 Jan 2022 20:01:30 -0500
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com [IPv6:2607:f8b0:4864:20::c2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C603C061574
        for <linux-gpio@vger.kernel.org>; Sat, 15 Jan 2022 17:01:30 -0800 (PST)
Received: by mail-oo1-xc2e.google.com with SMTP id q16-20020a4a3010000000b002dde2463e66so3654825oof.9
        for <linux-gpio@vger.kernel.org>; Sat, 15 Jan 2022 17:01:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=O7bwV/kQQ1CSccwvzJwcaclSjKCp8uGPqm/YmdodneY=;
        b=vlaj0xVUwWTmq79psbQlxZvQGnUAx0Q+HZ+X1BuO3aQqm50PE06LhybkuepLzw5/vV
         HXrhy/kzTH6LtJ98x38m4sX0WP4DdU/uYnRp2orSm/O6GfI7Ubc0wvS8obN2EkDpLCdR
         vb5UgmsG/NPYDCPLDoRbryhXUyAHbng8VaaYRnFRj/PyyWj/fFBFhxtXpSCgGWLcIZuF
         01v4UIHSDyU0DhUa/rc3XxZWfazEdQQroAjGD//++vn6tzrAkO0dpno43PTSWdwTEiGx
         6E245DCI1YKG/TbAti1UCGfL4fjUtpLCGngK1dK8OF71N2RJ0TVDmDW4cK6pNqqY2aWE
         qPLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=O7bwV/kQQ1CSccwvzJwcaclSjKCp8uGPqm/YmdodneY=;
        b=CajrtW+jyeqyTX4PpPykeE2Tej9M2TyoEPf8BaFemGKUVoA3kF048x67T84FLbtE0B
         xMhSmFJ92SmpddijGjn+3xUtIvFtEox47XmDbEAxPE+UbRFRqOhxj4lyfKuaolsCNDxc
         5Uvd9bUpY2EoUKaZWCWZWMoZqrNy4MgXBo5wv2DmGt43G8C2W7tFU1MYx8qTnqPC29cc
         cLJG9GZb+ClgiPZkLdPV7eU/F1AIFuQFmxKVzLnjfep+bcK0UpxXi29FfRWYUKpVB8eP
         G07t52lgk4pqte7RhKMoDh2kklRlYULwEFYFihgDsoKJ6hlF9IM6aMAjUwGxwaiLgl3K
         zxDg==
X-Gm-Message-State: AOAM530q9ikVCdMn/6UhXV0v1d3VSWURpFF0SvZZ8cUmf658QOXLyKjT
        Rvt+8VaVvCp8Tg/1AuCSs23EI4sHq83A3d7K9als2eQBvaA=
X-Google-Smtp-Source: ABdhPJwdk0Q73b2q2AfcTh8TOCWZf2usAMlSqNEkusEZfpOmKYxQaNnd+NCIWwWYl2fjvJQ2v8GNetDUgO1AkKu173A=
X-Received: by 2002:a4a:55cd:: with SMTP id e196mr11054150oob.86.1642294888119;
 Sat, 15 Jan 2022 17:01:28 -0800 (PST)
MIME-Version: 1.0
References: <20220104164238.253142-1-hdegoede@redhat.com> <YdS8X1w7YWizdady@smile.fi.intel.com>
In-Reply-To: <YdS8X1w7YWizdady@smile.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 16 Jan 2022 02:01:16 +0100
Message-ID: <CACRpkdbHwKyJnwYno9OOWrFtapAp=bN_VYLu_p6xG2wMJjQKJA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: cherryview: Trigger hwirq0 for interrupt-lines
 without a mapping
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jan 4, 2022 at 10:31 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> On Tue, Jan 04, 2022 at 05:42:38PM +0100, Hans de Goede wrote:
> > Commit bdfbef2d29dc ("pinctrl: cherryview: Don't use selection 0 to mark
> > an interrupt line as unused") made the code properly differentiate
> > between unset vs (hwirq) 0 entries in the GPIO-controller interrupt-line
> > to GPIO pinnumber/hwirq mapping.
> >
> > This is causing some boards to not boot. This commit restores the old
> > behavior of triggering hwirq 0 when receiving an interrupt on an
> > interrupt-line for which there is no mapping.
>
> Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
> Linus, can you apply this directly for v5.16 release?

Unfortunately I am a bit snowed under by backlog but I have now
applied it for fixes for v5.17.

Should I now also tag it for stable?

Yours,
Linus Walleij
