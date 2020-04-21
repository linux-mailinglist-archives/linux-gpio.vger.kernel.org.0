Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF03F1B2B71
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Apr 2020 17:43:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728228AbgDUPmp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Apr 2020 11:42:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726335AbgDUPm1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 21 Apr 2020 11:42:27 -0400
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F25B3C061A10
        for <linux-gpio@vger.kernel.org>; Tue, 21 Apr 2020 08:42:25 -0700 (PDT)
Received: by mail-qk1-x741.google.com with SMTP id b62so14948786qkf.6
        for <linux-gpio@vger.kernel.org>; Tue, 21 Apr 2020 08:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=HE8A/YW9uOdkpdkl4fMFPCY5/00Z/p/KrSiGNMcJmwU=;
        b=dsejIxZHEpv9Fril4lf+eZrqZzqBrxeFBfBkQLW0nN1AxjoH2zeFXMiP0NFrl5tvsz
         kuPVFgfRLMmbdJjnMyCyq+H512B/+MPAxVPGerzETFw764xcR+npKgvn7RhK1tX+CPee
         JObJr5scDx2sv2er15ES8emJzVe7VEKvdm8sgs5s4Waj1cLDGKBmBBS7PeqeWj877apG
         xsbT9rVPNp3WDdDRTsJTKAkNuLuivccMyT51uiKfqOjG1p8U7d+m4JM69uUbCfWFqpBI
         ycxn+D+xQi7JxO9yhdEm05XNcINLYrsdNugL7RvHNdWNhvVqbeELF7wzlHRz3K3GEg+j
         etLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=HE8A/YW9uOdkpdkl4fMFPCY5/00Z/p/KrSiGNMcJmwU=;
        b=aVjw/Evt3BVykewKGBZG/AvSYmFMLviFS9LHc7yC9O7R+Eq1aP5ynsos3ImQ9MxVvj
         g/YiolKPb5sEWWvb85JRhF4VGmfvFYnWh/M/NqWLvgPBNhxRx5yCqsp62IHJd7xRoo3x
         pgA4/bvl9GW//J8yFhzcx1O3B6GFQnIQhUcT+SHuTqNlPU2d1IV6e3NRlmSc+MZysmud
         6/73cB4CTGOGr0EbRS1dIqLvuoAo5vIAbn3++/cfXk7fHaEH6VT7eRgP8T72fzcmPTfA
         M67WzzG4ouCvYcARv4dke3ln+9GWxCsCqLnlEBgtmF1CnWFCfCIYcuAmBF8mwncRnF82
         B2mg==
X-Gm-Message-State: AGi0PuZ/k1vlz9JpHyMuj34/sW7ATXCO9NdKB/S1HKL6hFJNnUASAXd+
        IX2uPJV9q/WPZv2P7QjRXRQXpxJkT0Dnn3jzlUd8FA==
X-Google-Smtp-Source: APiQypL4VPzrnvlRdoKVb8iMwhMtdppqm/3iXFwROe+uijDS/TbocR74asAAXAm4c66tX2hHpt8BZ95HGIj1Q/FLOkE=
X-Received: by 2002:a05:620a:1289:: with SMTP id w9mr19964875qki.263.1587483745137;
 Tue, 21 Apr 2020 08:42:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200420172752.33588-1-andriy.shevchenko@linux.intel.com> <20200421130300.GK185537@smile.fi.intel.com>
In-Reply-To: <20200421130300.GK185537@smile.fi.intel.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 21 Apr 2020 17:42:14 +0200
Message-ID: <CAMpxmJVVDUN6ei__wt5z+hOJQ0w0r9TZjhN9HCtpCA8Vrud0qg@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] gpio: pca953x: Rewrite ->get_multiple() function
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Paul Thomas <pthomas8589@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

wt., 21 kwi 2020 o 15:03 Andy Shevchenko
<andriy.shevchenko@linux.intel.com> napisa=C5=82(a):
>
> On Mon, Apr 20, 2020 at 08:27:50PM +0300, Andy Shevchenko wrote:
> > The commit 96d7c7b3e654 ("gpio: gpio-pca953x, Add get_multiple function=
")
> > basically did everything wrong from style and code reuse perspective, i=
.e.
> > - it didn't utilize existing PCA953x internal helpers
> > - it didn't utilize bitmap API
> > - it misses the point that ilog2(), besides that BANK_SFT is useless,
> >   can be used in macros
> > - it has indentation issues.
> >
> > Rewrite the function completely.
>
> Bart, Linus, please, consider this series to be applied, because it has U=
we's fixes.
> We may still discuss the approach with ->get_multiple(), though.
>

Personally I like these patches - if Linus doesn't object in the
coming days I'll pick them up into my tree as a follow-up to Paul's
patch.

Bart

> For the record, should some of us volunteer to be a reviewer for this dri=
ver.
> It's awful that almost every release we get something either ugly or brok=
en in it.
> Uwe, would you like to be a designated reviewer (I would also support)?
