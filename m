Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38E6F332BDC
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Mar 2021 17:23:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230435AbhCIQXW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Mar 2021 11:23:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231133AbhCIQXE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Mar 2021 11:23:04 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81729C06174A
        for <linux-gpio@vger.kernel.org>; Tue,  9 Mar 2021 08:23:04 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id u18so21426141ljd.3
        for <linux-gpio@vger.kernel.org>; Tue, 09 Mar 2021 08:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2VEBPwGiW8iHNDo2S5SALWhYgfg8oMZ+MLjMTN2t4bQ=;
        b=M7a650blRHIys3AP+ZB4N6Xw5LZfQXbQARQmYGkbzzXObRIwssKk1xNaQZ8ASf37H/
         0/ofasF9xPe33mjzsmM8UbVwgsYvc2W5MNYRZX0TlXTldnIwJi4pqeQtN5fs8AxMfPx1
         FJIGigKYLOLsLzZhF4g+bNv/3hpOdHOV1sG6IZ0btEyeAwfHdc4P8iiIKaduQkrAGbZk
         0HB2qqySo2/E4mn5Yod9P6gro8vqK0jAif7K2ONUHC61/mVl7dior9nYQsYo/pP2A1Xh
         /hl5SauEpphhDppEl/ywEkv6OGOO00HQkohE5O8kWhkgo1KTOGcHoZRFFcyL3qcYi3p7
         UCjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2VEBPwGiW8iHNDo2S5SALWhYgfg8oMZ+MLjMTN2t4bQ=;
        b=rUB7oD11FhRn9n1ctozGe3snFH0kMJs6mbrLpxkwndqr1Bv8Syl9ythWa9JL2UZN58
         M13hLdzOhRrkCetSNWueOwb1dbxPoABrznCx0ceRLHL1i/QTVfHs60Un/emjTGqhXE+/
         e69NbdnG2SPhPDYKKsoLHUPsOA03YunL7MY9zK8l45zd0haWkXXu3grYpxeOQYyOF8JT
         3T31MgtOLizFP9kIzWtoKhCU9tBkJSHCdTzXb/OS0B6+ZN/nklfzfVO4vpwRpk5wcqW2
         hUgTtLFXLQ0+x32HYrcZw+0rdsUpp5wo4UahrEaxplrsySV1qqNv5W31J0txOQSh3z5b
         nF3A==
X-Gm-Message-State: AOAM532PJJneFjqSDdYxP3ossfW9Oo+qXGLjX99MDcH6hls/YFgTLNRj
        u8EvqoHIjuGtmWIN478r8ZyYdtUcRCN7t/4unNjqXVxhXZK5rI28
X-Google-Smtp-Source: ABdhPJz5Cp6md++96ogmtHjbwaXEEBMg2J3GkzoBZPbknRZmkETfrorf18UhLVRNVJh9/0K2tZNU7x+zaYfueTwHP+0=
X-Received: by 2002:a05:651c:103a:: with SMTP id w26mr14890455ljm.273.1615306983054;
 Tue, 09 Mar 2021 08:23:03 -0800 (PST)
MIME-Version: 1.0
References: <20210303131858.3976-1-shawn.guo@linaro.org> <YD+iWuLS/9knWLFb@builder.lan>
 <CACRpkdbZNJR5XaNaEWxwKdxED2mXnN_bN+mLjfPRMxyxVP3TVw@mail.gmail.com> <YEDVMpHyCGbZOrmF@smile.fi.intel.com>
In-Reply-To: <YEDVMpHyCGbZOrmF@smile.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 9 Mar 2021 17:22:51 +0100
Message-ID: <CACRpkdaT7e-KhmWONG3ER1id_=g8C3d5MYJzvEkoSadj43fESw@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: qcom: support gpio_chip .set_config call
To:     Andy Shevchenko <andriy.shevchenko@intel.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Shawn Guo <shawn.guo@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 4, 2021 at 1:40 PM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:

> Pin control has been though thru and implemented in the ACPICA, but we have no
> time to fulfil this work to cover pin control subsystem in the Linux kernel.

Oh sweet! I suppose it means that firmware using it could appear,
and at that point it will become a matter of priority to get it done in the
kernel.

Yours,
Linus Walleij
