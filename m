Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DBD826C8E2
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Sep 2020 20:59:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728268AbgIPS71 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Sep 2020 14:59:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:42050 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727520AbgIPRvQ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 16 Sep 2020 13:51:16 -0400
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 740AC2220A;
        Wed, 16 Sep 2020 11:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600257375;
        bh=eoaV9szsjFgk7Uijv0L7H5VhZbtE8Hl/Zr7ID+M87nY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=S41QI6QNEwoTFUhPFQbHwcgGYxGkiNeZjlx89US+9eB0ouV5jXDQVbtws8fAeszyA
         TWRVI4D+K+DO/dgAew8K1QnwoRJeTj50wecYRg73J365TMWFBcia/zuujHwFodwzD5
         KMrWVjsw7IXSR27cjO9eEqGuHJvOZG/V81fMmavs=
Received: by mail-ej1-f54.google.com with SMTP id i26so9889834ejb.12;
        Wed, 16 Sep 2020 04:56:15 -0700 (PDT)
X-Gm-Message-State: AOAM533T5gAR4yTs5Gl3wGOvLbiwjUxuAR+L38xQO6EpKxLOV9v8mqit
        JZZaoVGCMJ16MBsHumn9mfzqySS8nVm68D+jsH8=
X-Google-Smtp-Source: ABdhPJxVC4NLF4LipwZPQbtgcVYYzgMLywjdrV+ZxmsIZAFCCtHHjAh+3P/NtChDS4r5OJpcCax05AMA1bTlcwSk55Y=
X-Received: by 2002:a17:906:4a51:: with SMTP id a17mr24651233ejv.381.1600257374080;
 Wed, 16 Sep 2020 04:56:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200904151139.18715-1-krzk@kernel.org> <CACRpkdbGTQTFAWoQtxrODYdADyUJ0JohL-63oCv9aWj53H_0Xw@mail.gmail.com>
In-Reply-To: <CACRpkdbGTQTFAWoQtxrODYdADyUJ0JohL-63oCv9aWj53H_0Xw@mail.gmail.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Wed, 16 Sep 2020 13:56:02 +0200
X-Gmail-Original-Message-ID: <CAJKOXPeSVEU-O_vgkJpCq-zt_DzP5b-1+GvqshvGyK2ChBuyTA@mail.gmail.com>
Message-ID: <CAJKOXPeSVEU-O_vgkJpCq-zt_DzP5b-1+GvqshvGyK2ChBuyTA@mail.gmail.com>
Subject: Re: [GIT PULL] dt-bindings: gpio: fsl-imx-gpio: Cleanup for v5.10
To:     Linus Walleij <linus.walleij@linaro.org>
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

On Sat, 12 Sep 2020 at 11:40, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Fri, Sep 4, 2020 at 5:11 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> > These were on the list for some time. They got review from Rob so I guess they
> > are good to go via subsystem tree.
>
> Pulled in to my devel branch, thanks!
>
> Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml
> looks very, very good.
>
> One thing I was thinking of was to abstract out
> gpio-common.yaml from these bindings as a start, since
> you made the effort to even parse hogs properly.
> That way others could benefit from the work.
>
> Do you want to do it or should I take a stab?

Hi Linus,

I can prepare common bindings.

Best regards,
Krzysztof
