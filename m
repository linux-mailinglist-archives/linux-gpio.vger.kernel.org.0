Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEC96392326
	for <lists+linux-gpio@lfdr.de>; Thu, 27 May 2021 01:19:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232782AbhEZXVV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 May 2021 19:21:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232725AbhEZXVV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 May 2021 19:21:21 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D31F9C061574
        for <linux-gpio@vger.kernel.org>; Wed, 26 May 2021 16:19:48 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id r5so5084177lfr.5
        for <linux-gpio@vger.kernel.org>; Wed, 26 May 2021 16:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SzyExkdZDJisG8pysRn2La22AvSF3A+xaAV2oKawjCY=;
        b=K+eT3iOQL6TQoWJ9Eb91W5oaNof5B5a08Ca3OuuyLJHdVjDawZnWQpBBLcLCIazXfW
         FufdORoNlSwGuJDXqRRWNebudGM+IQNavl0OZ3P4fKLf1ieSlWvr1f8Fp0ZKqFtRfIGE
         8TmaX5fKsx2io0idLIpUpgvO0qnVe/Ar9GHZHSsWDQxhbCRJY17+RJpcdTCINmx4eF3o
         5CPN4IxxU0AqPXm1PSjwHMEVCExuTzMDFcMUlkiOaDYrQaZWY0toSPNMEj4orZ6Ombb0
         MehXr8ivP68Cs+BclNy9FQTqrAzoFeMtAjafKmHds1XaBOw5QchxnWAQB2FaXKyCNKec
         OnoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SzyExkdZDJisG8pysRn2La22AvSF3A+xaAV2oKawjCY=;
        b=pEXytPK3MGNQ1Vwj+IZFa1MS5HdWZ3kkIu2/lhogtYffxfKOA1YB7pW9EugFX1h3+8
         Ge+g6tTgZ6nqKRL7TonFmf+McMsoxGlH7zPo9JflmMdbu2EwMXbJJhOu3i9eCUDwfSQK
         PBcWuzDkfPCJBkqz/uvXnPWo+XFstvQY/nn/iv08/jF4uOn12JG0SlB270fsvP20bk1d
         nBZsq6K8Dz+Q0KDklwxOKfRTDx6PidPMvh/BGF7WUfweY2/5u5siEe6hbV0z/1jz7chB
         cNmdoKPYAZ9HXA9TAJ+Ezy3gHM9ctvP7oyOP3LiRtdHVZnurpIjO8ClDPtCZjMd9n8OZ
         ygfg==
X-Gm-Message-State: AOAM530jObTOG6nK6xbhgEhpqzDj6mckj/Y0DNXxUfXQrmhS4vGgZao8
        mIpsIyjsAUsx+zBpIv0TFLzZdHzy6STiOM3D7pElXw==
X-Google-Smtp-Source: ABdhPJzhigcPOSlXhhCd+EdX5+HKhFg1BhywBMb15QQ7B7AC0Bv49e9jVWs2N5AuW/gjWRXWJoKiKq/qXYZWlfr5hqw=
X-Received: by 2002:ac2:544f:: with SMTP id d15mr313552lfn.465.1622071187234;
 Wed, 26 May 2021 16:19:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210524092605.734-1-lakshmi.sowjanya.d@intel.com> <20210524092605.734-2-lakshmi.sowjanya.d@intel.com>
In-Reply-To: <20210524092605.734-2-lakshmi.sowjanya.d@intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 27 May 2021 01:19:36 +0200
Message-ID: <CACRpkdZ2bDDNecLc5sEe36KyJCBqAo5-vZdvwM+V2a33tr4w_g@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: Add bindings for Intel Keembay
 pinctrl driver
To:     lakshmi.sowjanya.d@intel.com,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "Raja Subramanian, Lakshmi Bai" 
        <lakshmi.bai.raja.subramanian@intel.com>, tamal.saha@intel.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 24, 2021 at 11:26 AM <lakshmi.sowjanya.d@intel.com> wrote:

> From: "D, Lakshmi Sowjanya" <lakshmi.sowjanya.d@intel.com>
>
> Add Device Tree bindings documentation for Intel Keem Bay
> SoC's pin controller.
> Add entry for INTEL Keem Bay pinctrl driver in MAINTAINERS file
>
> Signed-off-by: Vineetha G. Jaya Kumaran <vineetha.g.jaya.kumaran@intel.com>
> Signed-off-by: Vijayakannan Ayyathurai <vijayakannan.ayyathurai@intel.com>
> Signed-off-by: D, Lakshmi Sowjanya <lakshmi.sowjanya.d@intel.com>
> Acked-by: Mark Gross <mgross@linux.intel.com>

So since this thing has device tree bindings I suppose it is one
of those intel-but-not-x86-and-not-acpi things that Andy should
not merge through his tree?

I bet he wants to take a look though, so keep Andy posted.

Yours,
Linus Walleij
