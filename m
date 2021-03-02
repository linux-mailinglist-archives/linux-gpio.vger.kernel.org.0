Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 322CC32AD23
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Mar 2021 03:15:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377863AbhCBVYU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Mar 2021 16:24:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1839714AbhCBQh5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Mar 2021 11:37:57 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B34DFC061A27
        for <linux-gpio@vger.kernel.org>; Tue,  2 Mar 2021 08:25:05 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id a17so24706927ljq.2
        for <linux-gpio@vger.kernel.org>; Tue, 02 Mar 2021 08:25:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NgzcgIB23RMi47QVqd3ju8TPfRDtVMdCk8UEZvI/KOk=;
        b=oCfgGQA0IMiav6FcMToDhsbb8L8fZl0A4rdm2RSIeKLmKD4v23sBbEtqXkGfisoYqP
         Z2WYGGTvNcVzs09UjGiVNCaSpp+l/27BGwk5hWlvB3DOvAZvWit9pT6LLahK9EAf6i9U
         3zilEKSFq4mPZzw5xhrTXu00mk7aII1gw+OoL/Thxo3OfHE0LP8UU6F0Getd/qgTeP6u
         Um9uxExjowErjUNRPmFK/iW4vO0ByRevv8FZ/KR60fQ+XODDZkZDoc8BRZLim1ax3osw
         VWKcyOvQ1ZNrgAcW4FCaeMZjmJLcorURE2UcRNY4ORS1vrfosgAe4Yqf/katbzWLzfSL
         QFXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NgzcgIB23RMi47QVqd3ju8TPfRDtVMdCk8UEZvI/KOk=;
        b=U5fw3BILICRQe5VQeY91OxyEmy+sr0908pvccTpyoYZGcTGraZSwVDB/IHMcQ4DEmA
         chT2E2bwBZI8gvb/SnWoiOpJn+j9XyzjjyLI3xFwQTJcxSxKFt+qBMt+1D4yHj2qrwkK
         HIN5YyIve4krRq84tIqP+5agyl3nSwLSXvKPwAXKTPuMMw5Wnumrsn91FI9eW9zmY3FQ
         MPMR+cNo93kAD6Wed2cizqNrW0bannNchpxuAFgVlmuiOKj2cPwj3jfxt651/dX0WcZt
         eUQtFaV/t1A4SgFTvGbIqqYAfOsmbcT3cj/PsnDcaTKnUHTMlCsDV2gWNV3mZahvV5xG
         NA+w==
X-Gm-Message-State: AOAM5321kwY3M6molecLjsj55Dbrh2YuEtvEUulZghgWiyQ+w3GUNBZ1
        uzNU8ErHICHsQmVg4CxtKLJdabA0VbfRI9pRLxBj7g==
X-Google-Smtp-Source: ABdhPJy+IkGD8KvWzg2c0gA6CgGZv+VLjkXbozOe70ttJzYLpjRi1N2NxIJmy80zw1y0cZQRV1GPl5piB9vX8lMCH78=
X-Received: by 2002:a2e:1649:: with SMTP id 9mr4198706ljw.74.1614702304270;
 Tue, 02 Mar 2021 08:25:04 -0800 (PST)
MIME-Version: 1.0
References: <20210301165932.62352-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20210301165932.62352-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 2 Mar 2021 17:24:53 +0100
Message-ID: <CACRpkdaF4acg2MyKS=nvzPk2gAroUZTiQBixtociqKioFCyPiw@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] lib/cmdline: Export next_arg() for being used in modules
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 1, 2021 at 6:00 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> At least one module will benefit from using next_arg() helper.
> Let's export it for that module and others if they consider it
> helpful.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
