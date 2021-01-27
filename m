Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D4B3305611
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Jan 2021 09:48:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231286AbhA0IrE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Jan 2021 03:47:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232439AbhA0Iow (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Jan 2021 03:44:52 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B655DC061756
        for <linux-gpio@vger.kernel.org>; Wed, 27 Jan 2021 00:44:00 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id ox12so1515525ejb.2
        for <linux-gpio@vger.kernel.org>; Wed, 27 Jan 2021 00:44:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VBoX9hVLIK+oMgTk+dawfpHrm1ttGvw0qHc2NqmHHf8=;
        b=elkDXousOGGrCcsRX8PGXQELxv21CQthn7MNhBUY6RhzHlJz5eyXpk5Vqet0bfEY0R
         TgAimdqJ+ztzHIDojc9jgK2TSno/AHzKTAdFIEeOvYk6DZDpnzHywc0KYYXJXRwPndOz
         dYxrvbff3oo/PAXeEfOuU218rtraIRrakhx4Ij0CDmhKPUEcDOQcIYjkndmTf1ukwGzD
         fsn406xnUcxhtuW/mrVZuU7vQoGKaoQHqO5BVcbGDOAjCrX2UBwJ0DWTUCAnuOy5jM71
         7Y0b0+9JWgSb/CK98zFez9Cldkcp4IaWA+IE6znpNV9U5LLvEI9AXNXHXM97Lj0wk385
         /iuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VBoX9hVLIK+oMgTk+dawfpHrm1ttGvw0qHc2NqmHHf8=;
        b=acbuIy4FXRBov8+B7oUg2ZDq5a4Oga5kHDS3IXt6d4vhBFYc/i46cefiLv+xeR76aZ
         VH9EAKpKvwqE/wGvBm0w8okpDEwkg9oYxA/1FhdYI8860SzvCLmXK+nLVE80pn6EtE0M
         j64kmzfKwpPl8uQgwgEKoK0VtVDJe489Bo1lckSWGPqDxwRURvTqurEvaRgNyjXJ+m5B
         bL03JnZ/g2SQGIx5SesyEWNyF1Y2a+V2mVwJaZg9VFMYdh+oTK05bVtG/gS+fMVitANe
         GuHwtFm7CaGmjLKpznOu9KhLor5jg5+onXvN8ED01UErLj4HHWejYI0bP9/20xITndk2
         vEuQ==
X-Gm-Message-State: AOAM530SgeOnWtQ6WXqdElvm7M1pWd82ODdMu1CxTsanq5UPOXi5mUVK
        OaWQ/1NC5FXODyfgqRrH0XA73HkhBOsgQ+wPMgGNBA==
X-Google-Smtp-Source: ABdhPJxRGbmBX6Yc8OicV5+mz00/YJkUOHcaOdkdyE5ZXdtl8tF5n6ay1RAg7fhgfwWLA+JF8TsqGlRpAq7cGpEhdIM=
X-Received: by 2002:a17:906:b042:: with SMTP id bj2mr5995258ejb.261.1611737039385;
 Wed, 27 Jan 2021 00:43:59 -0800 (PST)
MIME-Version: 1.0
References: <20210115111311.31601-1-brgl@bgdev.pl> <20210120170032.GA22929@lst.de>
In-Reply-To: <20210120170032.GA22929@lst.de>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 27 Jan 2021 09:43:48 +0100
Message-ID: <CAMRc=MfpX_Ta42bMcOW14zqh+gWm+Sxhrb5abfa52PKXfmQb0w@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] configfs: implement committable items and add
 sample code
To:     Christoph Hellwig <hch@lst.de>, Joel Becker <jlbec@evilplan.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jan 20, 2021 at 6:00 PM Christoph Hellwig <hch@lst.de> wrote:
>
> Joel,
>
> if you are fine with this version I think we should let Bartosz pick
> this up through whatever tree he needs it for.  I'd be more comfortable
> if you ACKed this as you know the original design better than I do.

Hi Joel,

Gentle ping about this series. Since the user facing interface is
mostly agreed upon, I already started working on the module using it -
it would be great if we could get it in for v5.12.

Best Regards,
Bartosz Golaszewski
