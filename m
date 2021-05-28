Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B33DD394280
	for <lists+linux-gpio@lfdr.de>; Fri, 28 May 2021 14:25:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233967AbhE1M1D (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 May 2021 08:27:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230056AbhE1M1D (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 May 2021 08:27:03 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A230C06174A
        for <linux-gpio@vger.kernel.org>; Fri, 28 May 2021 05:25:27 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id 131so5029410ljj.3
        for <linux-gpio@vger.kernel.org>; Fri, 28 May 2021 05:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GR4+XGEnGb/GMtCc8X7ZZZxJTBTFj8lYANRXbX45aBo=;
        b=u2XWgYLt0mnuixNgqxxOkuJKAfTF6GXC/1tXYzbCVu8IbuWPH9ITGch8T8kxDneNmZ
         bZaJiEbeuNCZg3hZT9DGQGCNVxey+0NS0alCoFXBtGwcaOxWVChy5rVg6NcrI/57J5ji
         YKZS8oJqTcvr6/ShE/OmbwqPvojxpQl2ZCnvqAFwdHv0IWRz0XmhUY5Fp1JF/iQW6KdK
         Nm8u6O/blXCkm0h/QzL90YtBHRrztFqlR7mFjhwZRFjYuuMAyDkpoMBh2+96tj89qzlt
         2tp/86inLk1Q7p7wtj6pZ0Hq53cCvNKFlWkx+3J7NID4vRf31Uvm2kYXfgDjD4P9MN7w
         vm9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GR4+XGEnGb/GMtCc8X7ZZZxJTBTFj8lYANRXbX45aBo=;
        b=mhrAzeffl2MCWpyiI4lyLBDGljQB8vM6KcRT7SEqkqiMGn6V44IMYdWKmw+QbRjYDm
         /fxqLqFgN/dZtZHTMJrRplyCifMULfkgu1sq7lNebY1PmuXMYr0GLqe/0hWSYl8ZdYiw
         7DcGSybax0xYm97kiLuowMGEWVwbciOTbVbgyO0uxNRkTeNo9Sqki55R3fU7ly6fJEjX
         rFfDyjBgK6tohC73WYGbDPtFpluL6punB7uiPajbB/O8OmkQ7uyxrWZzffdt+pN5sDiG
         yCcTrGo2hgNkAC9SqPD5aWKbBwN+CLrHxW86cZRfRtwHkCxWpEQYIlIoi/E6dy6c12YM
         YDCA==
X-Gm-Message-State: AOAM532hylO/TuxXLSpEFf/Aq8sozMR7rbsTtZOFf22JhH6VG3tul4RK
        Lj39dKNXRN7Cxtmt2aWvFJjz8R6Kg9ZDGbFTPbn0bQ==
X-Google-Smtp-Source: ABdhPJz8sg3ehJGRnx0pq4zYT1I9yc3/uuwMUVt6Gas97zLue6wiQKGi1eB+9eqYy+h4SLVUOsx9wX5WB6fl/SDfAow=
X-Received: by 2002:a2e:b805:: with SMTP id u5mr6611816ljo.74.1622204725533;
 Fri, 28 May 2021 05:25:25 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1622191662.git.geert+renesas@glider.be>
In-Reply-To: <cover.1622191662.git.geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 28 May 2021 14:25:14 +0200
Message-ID: <CACRpkdb_AXFEaNgeE5p8mX64ufOG1VAmT_FY237cWQDQBGS0Vg@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: sh-pfc: Updates for v5.14
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, May 28, 2021 at 12:35 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:
>
>   Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-for-v5.14-tag1
>
> for you to fetch changes up to 904ec4bebc1df908a943bf3178f6c633672ce47b:

Pulled in, thanks!

Yours,
Linus Walleij
