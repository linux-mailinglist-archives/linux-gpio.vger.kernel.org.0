Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CB5F35D40B
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Apr 2021 01:43:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239354AbhDLXm4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Apr 2021 19:42:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237567AbhDLXm4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Apr 2021 19:42:56 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7FB5C061574
        for <linux-gpio@vger.kernel.org>; Mon, 12 Apr 2021 16:42:36 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id c17so10223136pfn.6
        for <linux-gpio@vger.kernel.org>; Mon, 12 Apr 2021 16:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Vx/qeduO3aj6lGaE6MP8flMR5bsjyZ7iPoIF3ykjdW4=;
        b=KEfow/ItDh1/G07tgpNFHLmttMShxTwZpcIv89I4chwQ4Qe+isMbhKMROQEFMQ2p4I
         3E/jMGoT+CsCypPdXJOCRKUXS4zdph/Vpy6B70q+HwfSGCEyXnphqh32BdjqUIb6DkNN
         vHSGOLEYmJ5rKgkG0vYKBx+wdHsFslNRMeeS7tnfQ8gGL+GZR7b+uDLpZLVPicg3AfLm
         8y+eAkhcDcE2IFv+kEH7yfJtFg9wfzqs6/9mhbkN8cJM4g/SbEAfvI/p+30Dr8OFVMi3
         tsMrk4GOv11k8d02dQa0IuY7OdjUYnpnBgbNgJ7jqtYFaAWHaJW7jhhdYwssyekLOTGv
         WNqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Vx/qeduO3aj6lGaE6MP8flMR5bsjyZ7iPoIF3ykjdW4=;
        b=JbrFQbnVX1ihffdK136poMSCrXG2c1p7tpwqI2qFGxDF2T1thq01L/77u0ms/RL3ZT
         /sdX7sSeBTkQgdoBOciNGtP65Q4ZQHBJlrqVxKQ1OrywIzgYzgumhNOVWmuYovm2pLNF
         wV3Inc35Jo2MROznNqFZPloRvIktxtN3lbchc84UrzA01Gfl4YH61TEnFUDx9fyE4tMO
         psp9uhjkiRzKRpeYu6T0/JkSiAh45+rXxyv8yryip2yI9V5AoMSfXwjWHl86DcdS7iLg
         6b3hVReQftciFbNf2DTHHwZP83ysfRhnfvssRd16m8X+Ezc6U77d5Z/WcmQybFmyBkEG
         sEOA==
X-Gm-Message-State: AOAM5333gDrU5Ep37omDAxSfI1OIXfifpKbBnKIerunhq8Fc7THPm3v3
        OQ6/VmqvNTapsN8QluVpAxUUGsxs1T/TWQeV/hg=
X-Google-Smtp-Source: ABdhPJxIsgsvdEbrfQbDnobSNKtlsefmehe5gTcPTk20T60Qq28h9nHpE77m5GVPIF8GIUiXBq9K5gYT/yE88P1uvoA=
X-Received: by 2002:a62:5c6:0:b029:24d:e97f:1b1d with SMTP id
 189-20020a6205c60000b029024de97f1b1dmr5552957pff.40.1618270956112; Mon, 12
 Apr 2021 16:42:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210412231759.15474-1-yzhong@purestorage.com>
In-Reply-To: <20210412231759.15474-1-yzhong@purestorage.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 13 Apr 2021 02:42:19 +0300
Message-ID: <CAHp75VcaaJ+j6H0H63CEA2_-p0GXskEUUvywcMkQxW0G_qFGrg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: lewisburg: Update number of pins in community
To:     Yuanyuan Zhong <yzhong@purestorage.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Apr 13, 2021 at 2:18 AM Yuanyuan Zhong <yzhong@purestorage.com> wro=
te:
>
> When updating pin names for Intel Lewisburg, the numbers of pins were
> left behind. Update them accordingly.

Oh l=C3=A1 l=C3=A1, I have to recheck this, thanks.

Btw, have you tested this on real hardware?

--=20
With Best Regards,
Andy Shevchenko
