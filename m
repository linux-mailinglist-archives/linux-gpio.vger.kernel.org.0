Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02C4326793A
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Sep 2020 11:40:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725820AbgILJks (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 12 Sep 2020 05:40:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725825AbgILJkr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 12 Sep 2020 05:40:47 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D2B4C061573
        for <linux-gpio@vger.kernel.org>; Sat, 12 Sep 2020 02:40:46 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id z19so8326286lfr.4
        for <linux-gpio@vger.kernel.org>; Sat, 12 Sep 2020 02:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Bu21n2a8vd/3CcBVh7nLD8UijbrBObsNdfAHBgEsuAY=;
        b=A8Igbl+Ja4q9/iX9ehDRtvWeB6PaRcMmfmTTdYIxPhyjoDWGzkLtNwN0PDWb+tHE8T
         vdbTEfwoVi1xhuctibXeaP3ImuT/ErlVSSTkuEcBFtbjuze67NW1y9erfHUTNX5AqMlv
         mQtcN5EjWcSo23JmhLtXhQJ5edIAHiSDTmL3JC8r4M4MQwVZ6M9p4H6z8YqJkdfGSdOA
         /0gcjhoT+oF/vIITfmSqKsp0zMGskItEWgaDpRNJRbZDiGBln1G1GlwKAcaSnOCl2tJM
         svPja5c9QsIsPnvfIlTKB+wuN2qDZgQARFbeHIrzkAWW2tQHg6zZ34EGpTNkGGsU00Fu
         Qjeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Bu21n2a8vd/3CcBVh7nLD8UijbrBObsNdfAHBgEsuAY=;
        b=uOJwMfHS0SKEpDE/tLS2N10vyJmloy6hRd4iuAlPss1kZ08G652heRbaCB9oCokY1r
         bhRtHgi+258tgjgB2479mqUFpVaCacY1NflKZvIMCfvekqrHzC9D+DyMri4MxXRrBkKJ
         i2BNa4kHykIdFbtRGaIyH4ESPx2wrwaCZOskSyEYz5h5zOTCp6ksST+OtkeVxcAvpqOt
         nL4XO769d7JG3LKleDyXPuZDUeuEaZB7fQ3SQ8lhcbDQ5DZRFsgWbyFH2EIGneradasb
         GXLFUCh1mr62B/pV5yLGbwUBr4i8h2QeZ4GYvWry0oMt/3HgmkIzbatIL6cpzDm0Zafc
         d4Nw==
X-Gm-Message-State: AOAM531w1s/GWME6TwyifjWW5b12jrZ7a5/jVn2fnqMvkCWswiEXBD0f
        c1bq4S6bfe2aJ1Hzlj1ajzpQjww/97ucNKYtjNxyrQ==
X-Google-Smtp-Source: ABdhPJxtWd61C3gmyIEQJbG14ARIXV82F//JJoP5YZ0xf3J2atBZ/1YczNBpwdDJI7khfzxWiVwXvg0DoNZxLnhgAyc=
X-Received: by 2002:a19:6419:: with SMTP id y25mr1497993lfb.333.1599903644933;
 Sat, 12 Sep 2020 02:40:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200904151139.18715-1-krzk@kernel.org>
In-Reply-To: <20200904151139.18715-1-krzk@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 12 Sep 2020 11:40:34 +0200
Message-ID: <CACRpkdbGTQTFAWoQtxrODYdADyUJ0JohL-63oCv9aWj53H_0Xw@mail.gmail.com>
Subject: Re: [GIT PULL] dt-bindings: gpio: fsl-imx-gpio: Cleanup for v5.10
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 4, 2020 at 5:11 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:

> These were on the list for some time. They got review from Rob so I guess they
> are good to go via subsystem tree.

Pulled in to my devel branch, thanks!

Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml
looks very, very good.

One thing I was thinking of was to abstract out
gpio-common.yaml from these bindings as a start, since
you made the effort to even parse hogs properly.
That way others could benefit from the work.

Do you want to do it or should I take a stab?

Yours,
Linus Walleij
