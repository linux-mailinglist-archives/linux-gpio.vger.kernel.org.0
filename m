Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6248840ECF9
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Sep 2021 23:58:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240186AbhIPV7a (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Sep 2021 17:59:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240126AbhIPV73 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Sep 2021 17:59:29 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BF91C061574
        for <linux-gpio@vger.kernel.org>; Thu, 16 Sep 2021 14:58:08 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id i4so24238338lfv.4
        for <linux-gpio@vger.kernel.org>; Thu, 16 Sep 2021 14:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cqdMg3sYEVDu/L73yV5RUtE7bsLAqIyfCVaqqnuicqU=;
        b=r7ZzsngYT50eiYn3C0NVDAmH53vzgUe7T+5Pa172kLSk6H8xrLOD0KxZqHVVQdznmv
         MVTkGfS1VXPMi5hmACiMgQvFG3yHGenMpXZHchcw0wQnJEtZmR7jKNUPP4zSwH3Qnygb
         YabyJiYhWLd+i2VCjOt2rHQFsL1RctZ3ZTM2zFzeJfH0MbnGDkxEXAhVlLNrTL0MrxlE
         UPoS2N5HynoWyetlnKGUQBwPsL4TDxOxEmkLOXoD1QU3bdTnAkS+2S3ANPJwjh0zgdNA
         Ac1LcNe187YnuNTSWPh7oFKS5kfaRiwij4MIyuyqlm9xewEsigjtHtdpY3yhqdqtJV/a
         QuOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cqdMg3sYEVDu/L73yV5RUtE7bsLAqIyfCVaqqnuicqU=;
        b=4oOUtg9nDeRcMAYe1L8v7imPw9pv07y5cw+Xq/A9GftbNtnBq1Qc07eaQySTK4bMSy
         XchgnUp9o+DVo+r2fTVCjI4WkjQPHVGfDd+p97RXYOmKEX1OT1tjh5LOyJdU4vsxLHWx
         L0IVZt/lQjswKpPE72Jfm1Q9uleOIbSH807AWBGSeH9Tt+WB/DWfFamGqf3z4oDbMRkW
         8JbWAbp1GUMHBeRRwKrLP9oCpIOZHnefpcvKZKl+IIlJYRQVONoCwZGcDm8O+OkbVIJv
         d65XPWca/Vs4UcgqDnSYoJO6HXd2iOGRHz8Jt36Nlvka3T6lk8G4cBhKkXilZClyvTLv
         kJVw==
X-Gm-Message-State: AOAM531dE1LPy8lyMTrD7MlhZmRaLhVpMOLSFHbZ/qmIlvOI9Up7KS1M
        6fTEPH/omQLfS+ceI+SmMMo4/waQRvJaEiyKoW9jHQ==
X-Google-Smtp-Source: ABdhPJxm8Qz83s6bxer43QL0FEVGqhTBAM+KokIKmE42yqVfE5lpc5cycJCulEMnYIUcpvnn7JW2aHUv6RY1sp0mrhw=
X-Received: by 2002:a05:6512:e89:: with SMTP id bi9mr5504267lfb.95.1631829487007;
 Thu, 16 Sep 2021 14:58:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210824164801.28896-1-lakshmi.sowjanya.d@intel.com> <20210824164801.28896-14-lakshmi.sowjanya.d@intel.com>
In-Reply-To: <20210824164801.28896-14-lakshmi.sowjanya.d@intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Sep 2021 23:57:56 +0200
Message-ID: <CACRpkdZnWC1qCTqrJvu3H86S9F+jdh0DzR6xwbp=zDCSa2xR_A@mail.gmail.com>
Subject: Re: [RFC PATCH v1 13/20] tools: gpio: Add event count capability to
 event monitor application
To:     "D, Lakshmi Sowjanya" <lakshmi.sowjanya.d@intel.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "Saha, Tamal" <tamal.saha@intel.com>, bala.senthil@intel.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 24, 2021 at 6:48 PM <lakshmi.sowjanya.d@intel.com> wrote:

> From: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
>
> Add -t command line flag requesting event count to the gpio-event-mon
> application. If event count is unsupported an invalid argument error is
> returned by GPIOlib and the application exits with an error. The event
> count is printed with the event type and timestamp.
>
> Co-developed-by: Christopher Hall <christopher.s.hall@intel.com>
> Signed-off-by: Christopher Hall <christopher.s.hall@intel.com>
> Signed-off-by: Tamal Saha <tamal.saha@intel.com>
> Signed-off-by: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
> Reviewed-by: Mark Gross <mgross@linux.intel.com>

This looks wrong.

If this hardware can report timestamped events, which I believe
it does, each event should be reported to userspace uniquely,
ideally using the native timestamp, and using the in-progress HTE
subsystem.

Yours,
Linus Walleij
