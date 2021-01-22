Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C96483000B3
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Jan 2021 11:52:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727407AbhAVKut (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Jan 2021 05:50:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727069AbhAVKrZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Jan 2021 05:47:25 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ECB5C06174A
        for <linux-gpio@vger.kernel.org>; Fri, 22 Jan 2021 02:46:36 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id dj23so5957916edb.13
        for <linux-gpio@vger.kernel.org>; Fri, 22 Jan 2021 02:46:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zUgwkDZiui+zB5Yrjv+0fbodOC8lUsiB2yWnpczWfwQ=;
        b=1LKpoNG0DAKksTk6VxROmGd9lLPKHrx8fiMlKjaKDlv10KnTm147bKir5EIFKgzzq8
         laXV3ClvxZkIIltcnSdPeKZXD3rynCYGe4rQx5jWPILnfOycgfQHqiu51UGX8ID8lWi5
         HxiyRnL1XGHnkNrcSK5m5jLhmSvewMJH5CnPaRNk9zQ3Ciuswk00DxMO7QkkMb9IcAYp
         vDNxkpil/+wegyY+/IQcuPnvsAz7Py+nKiLQ96ruHPX1TrdTNPW3ZkezMthkMW6Jroc7
         qUHYSVof619BDUVdnsUPBQMU5n5D5OVjXXCXiJq7tBM4rzbqjP/zbR++V8ZHzdagq1Up
         bw8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zUgwkDZiui+zB5Yrjv+0fbodOC8lUsiB2yWnpczWfwQ=;
        b=M1Jv5o7fQ+zbhW5TD1KbYD1pAnp5XpFR6cD3lGxR3hnfT2mT5kcWWAvWHd6KAQBSyT
         kKS8C0utz5ZTVtNgDxFykB1D8j3QI+Vd7sTELwDmfuaMYHPBev8ak5KGtO99qSMzM7ep
         YoKTKqhE5b3A/JJhvDwgZ1Y4LqKhHXdvXeBjcVc6iRcg8IGWRdLVLUTXBTCE6kAPfdQd
         +Pq3mva7CtX3AOGp6uC6FhaTCSz8NnDKOErVx8p4P/VYmN7mPDqN6AsFw5AvgO8k5vqX
         DyF10aZBA23fHiddwDHDUnnymltqsjgCPGAN+d4ph1CMJHPWzyi+R3j1XQQbKd2d6yth
         MrNA==
X-Gm-Message-State: AOAM533og7SVUtuLVrr5CmuriZ2hnyEGfru5EOZHqoZGHgPGK88cR5C7
        KS+fAcEmdcbJUOWGlKJljCS0LrZ2U4rVx5g02ogCYA==
X-Google-Smtp-Source: ABdhPJz0NbfUDsTIsfRmVcVrBlfDAHwGJ/KXMNCkqNNOl8WXB3SAn8xOeU0WykUepmc259bWkYfel4r6mKjd5WKkmlM=
X-Received: by 2002:a50:b742:: with SMTP id g60mr2627470ede.113.1611312395052;
 Fri, 22 Jan 2021 02:46:35 -0800 (PST)
MIME-Version: 1.0
References: <20210120214547.89770-1-andriy.shevchenko@linux.intel.com>
 <20210120214547.89770-5-andriy.shevchenko@linux.intel.com>
 <CACRpkdanZ7yenqB0ThNLzfK0safTK4zgd_nxDkfd+RYPS+KuvA@mail.gmail.com> <YAm1QUjqnW9UbtM6@smile.fi.intel.com>
In-Reply-To: <YAm1QUjqnW9UbtM6@smile.fi.intel.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 22 Jan 2021 11:46:24 +0100
Message-ID: <CAMpxmJVCVyYC8L4noq+NVEidW=5XhQmO9MuO_L9utanyjsXmVA@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] gpio: aggregator: Remove trailing comma in
 terminator entries
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jan 21, 2021 at 6:08 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Jan 21, 2021 at 02:17:47PM +0100, Linus Walleij wrote:
> > On Wed, Jan 20, 2021 at 10:45 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> >
> > > Remove trailing comma in terminator entries to avoid potential
> > > expanding an array behind it.
> > >
> > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> >
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
> Thanks!
>
> Bart, I would like to send this series as a part of my Intel GPIO PR or tell me
> if you wish another approach.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

No that's fine.

Bart
