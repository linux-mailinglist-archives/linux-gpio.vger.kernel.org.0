Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24A9C2549EE
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Aug 2020 17:53:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727077AbgH0Pxm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Aug 2020 11:53:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726854AbgH0Pxm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Aug 2020 11:53:42 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93230C06121B
        for <linux-gpio@vger.kernel.org>; Thu, 27 Aug 2020 08:53:41 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id k10so3191316lfm.5
        for <linux-gpio@vger.kernel.org>; Thu, 27 Aug 2020 08:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7/7v0OcLJd+85B4m0F6GgazrXp90bsSaI2++Fve0hkc=;
        b=XRTjWikwCTqOtz9bbWGyp8OyFKmj9u05cm8ItyXDCZfAjMAEDGPs+Ex9Yx2UPe6Dm8
         2cb8Qd2SgkqPNSPhFXuT4pqi0rjEDuCemp9J3oW6hd08gaJykCyddOfpma2cfrRoQE+W
         XCPPaQQVb0tmAN6vg13HZ9o2ovap9IIpoKcbcm9RBwaVzXthorSyyJKmijKsM44EOtdI
         bNo+AlZpZQJBd23E+jbJsKBFTvKWYnL5/i7cOA2T33vv3BciYjMdEdZy0WR5dLDlC8eV
         ZzTLV7SwEO9X6UhfZdMHXsUBIhbhlVbm+kt1Z3od07M/IrU1dlsEIpKN2GXeSrWKR5dX
         f/Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7/7v0OcLJd+85B4m0F6GgazrXp90bsSaI2++Fve0hkc=;
        b=duBYemYnQJO7kTplZ0Dw3POXCvI1P8RYT4pRFp+sGHK14mWta6+MY4qmtKnDSmJUTl
         s9zMVkCioQ/Q32oVQKYg9pFHTfh6mzGnC5WDJn2oSnmGRX850ZVgH4fl5Aty/9UBAXYT
         ARx3K2D+mbav95cBuqGGCFk4eTuTuG9/sTvhztZr/4ZXlhsox1Ibmb1KnLiQxH4Tz1SQ
         0UAuds77iWW0AS+IvixX62BFGZHl8/4rAq/rxX/Kai9KPN2cnKWnPY/5s82ZrBFlPGke
         HYVKNcbF5UIpdDSM4sT7REzActeYpxkxdpAvlVQjCvNFSv3XBlTyAlJPA7Gij/n9yJ2x
         Tjdw==
X-Gm-Message-State: AOAM532vC6QEAwUWBJWwCvVooL8QxheQaGdjG4+qRcfgYfBr14IiZAuj
        vbcHTcEKeRtwS9DReHXmRYDayfWNWLYmxPG5KWbpsw==
X-Google-Smtp-Source: ABdhPJwLrXSTFfL8l6OPWP62eY6kq6VVP22QbZDNnM2HqMybIQf2yJcCQ35jcn6ZYb4WQv+tOKgaMoTY26doX3rNs9s=
X-Received: by 2002:ac2:4d16:: with SMTP id r22mr10168810lfi.21.1598543619936;
 Thu, 27 Aug 2020 08:53:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200827140020.159627-1-warthog618@gmail.com>
In-Reply-To: <20200827140020.159627-1-warthog618@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 27 Aug 2020 17:53:28 +0200
Message-ID: <CACRpkdZZMbfpKy4gcfAzNq53LkYLcL9wm3Qtzyj_K8vkUW9RfQ@mail.gmail.com>
Subject: Re: [PATCH v5 00/20] gpio: cdev: add uAPI v2
To:     Kent Gibson <warthog618@gmail.com>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 27, 2020 at 4:00 PM Kent Gibson <warthog618@gmail.com> wrote:

> This patchset defines and implements a new version of the
> GPIO CDEV uAPI to address existing 32/64-bit alignment issues, add
> support for debounce, event sequence numbers, and allow for requested
> lines with different configurations.
> It provides some future proofing by adding optional configuration fields
> and padding reserved for future use.
>
> The series can be partitioned into three blocks; the first two patches
> are minor fixes that impact later patches, the next eleven contain the
> v2 uAPI definition and implementation, and the final seven port the GPIO
> tools to the v2 uAPI and extend them to use new uAPI features.
>
> The more complicated patches include their own commentary where
> appropriate.

I'm ready to queue this now. Certainly any remaining snags can be
fixed in-tree.

It kind of keeps in tradition with proper software projects "plan to
throw one away" which is what we have traditionally done several
times: the first Bluetooh framework was tossed, JFFS was tossed
for JFFS2, Video4Linux was tossed for V4L2. So let's do this.

Anyone against? I will put it on an immutable branch and then merge
that in for devel.

Yours,
Linus Walleij
