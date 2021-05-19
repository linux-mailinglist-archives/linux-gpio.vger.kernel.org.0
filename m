Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1A8A3899E4
	for <lists+linux-gpio@lfdr.de>; Thu, 20 May 2021 01:31:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229518AbhESXcw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 May 2021 19:32:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbhESXcw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 May 2021 19:32:52 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2249C061574
        for <linux-gpio@vger.kernel.org>; Wed, 19 May 2021 16:31:31 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id j6so18948096lfr.11
        for <linux-gpio@vger.kernel.org>; Wed, 19 May 2021 16:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=I7pHaD84RH+wmfU1Hz6WIkc/9DH2orCfEyWSxpF03hY=;
        b=XOvIgE5+36IVg69js9Ats9VUQeIvYUsKS+Ba06ll7KPSB1/LvoDBPtFEckv0BbWPSk
         IiNnemj3AcaEwDDIQy30/2rZukcceiiEy7UMYvOM0c7PfYHYIyPUvcdJVCqJmDdav8AW
         Ksgrf3dbUQ+aiXc/Jf+ph+Xn/o81O92jgfUKkn6faWBVqNoqh2XiBuQX4sjxH6NewpRQ
         A6Y/3n3UHxvD2q3wMh32d6oBFDl6YOR9/8nxgSzjRdBNRkdKCSW2pCN/8qZFN3zq9kLN
         FwNB93fXHxHcSSPnzvp9lID/+JRb36PNOu2b70aKMmdpvt2uqhV9Z+liMAKJqIbQiiSf
         pR/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=I7pHaD84RH+wmfU1Hz6WIkc/9DH2orCfEyWSxpF03hY=;
        b=rbMGlY0divkwkdRWJI5apjCUGgRJDCmgiRZjg9FrZdnHDtkMtM+bRFowNlXRZFN97U
         4h5hWzCN2zmKRCOwfkJWC5326xrU4YSz3ViVtEBTy7LUFQynfAKNlkHOe8CDvVsw1/3A
         V8tXA7I2gNMElAb+18+3tZIranACJ4cbTYDUbDEHbWSxUJ1C6WASPYDlfiEHU5fghCf8
         dqimt95TLAT5fuSlbudJoQQC/EVQ920GEGT8KcH/TrPZIxeHS1PpQyuMYY9w9fE7pQr2
         794EpbtfrNwl6Uflc9YgAnS+CyqWtK5ZTm1zTMkxmlPQgShnIBmH28zV8Gwd17MBPANU
         xN3w==
X-Gm-Message-State: AOAM532zoRjC21azx2DIJ1qMSRAmTU2fZP25n91t8KK+q1GwXEoEkFy7
        I9wg9YQnej+FatlpmRTT87tJoxCChiq1X6e6gzEu9A==
X-Google-Smtp-Source: ABdhPJxVJ47u2mpCm5iJe58vGL6D46bmbHH7WfemMGTnSqN3wFnOPvlhew6YLh1sG8D5fZZM+6t4BKunViM605h9bKE=
X-Received: by 2002:a19:b0b:: with SMTP id 11mr1327639lfl.291.1621467090009;
 Wed, 19 May 2021 16:31:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210510194717.12255-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20210510194717.12255-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 20 May 2021 01:31:19 +0200
Message-ID: <CACRpkdZUBuC6dgQ3WtyRoyQ-PLcXuQWgb5W26Y0UsPgnPRAkAQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] pinctrl: Keep enum pin_config_param ordered by
 name (part 2)
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 10, 2021 at 9:47 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> It seems the ordering is by name. Keep it that way.
> Here updating the entire list (there were two more options not in order).
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied!

Yours,
Linus Walleij
