Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A1EE3E91FA
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Aug 2021 14:54:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229617AbhHKMzJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Aug 2021 08:55:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbhHKMzI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Aug 2021 08:55:08 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F062C061765;
        Wed, 11 Aug 2021 05:54:44 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id g30so5520084lfv.4;
        Wed, 11 Aug 2021 05:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dpKp2bS7qI133VLaJizjcD1NjcXaTUS/7ea8ukWQRDg=;
        b=BtcXy7Nr5BnCceBMENJ7zbf/XMiGI0L/a2jlOniAzUD/aN4fV2quVJfLZd6hofnCdR
         UCCImmZo854RsYtNZIxhHMWKb3Cun3EGRm/DOo83saGBoIbyUKKZrlSFxdWsjSDg6Wi0
         oXtMzhl8/Q0fwuAecacBUFxGLHJV+ZwRCoIo5SyQgceiqoHyeJmfbVGOaAYNX/ZmWzLH
         NYBuEMTmB6TAsuHYde4O7S+oEgD/cHOPsZ+Vq5Pv/ryRIL14cSqa1z2U4EwN5nPjyENF
         94XVoZqQUdwulvENFEFxtXS3tAD/L2nv4cpYdTJJ+1a70tygmFy74lrsqFgHC8afsaqD
         pHHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dpKp2bS7qI133VLaJizjcD1NjcXaTUS/7ea8ukWQRDg=;
        b=Q+q+EAIZfxu0EJg3Hj9zl+zLzdyclcVQbHlU6glFEqLL/TNcKRhccz6xpcHT0scsmV
         yK6sRju5cjoh4uH24FLisdsv1vvFy78vrV1xp54zv1nHujapVlwulrsOuj3aqVfTwbq5
         UTj6AKnKABFgOo71Vit4W4lRViySobvs3FZp7WbzFJRjMFecaKmsqwFSHJwbnqJ6sfEi
         P7RjBnOHeS4jqa8RDutrhvJEQhdsdWQ97R+lYdHzAnjHwn8NKe/c3twQdvVoglu99DxO
         f61aHMQp9DXQTwA2yqwPDO5xGjdPWM/qm4EVw2Fw9KvTbv4VH8n7sb1wO3u4GoG/GFiD
         22sw==
X-Gm-Message-State: AOAM530w7R8Rs45b2HKiTMSuZyV0SYJI4s3SoHTLjQL0JUGzhnrCWYR3
        g9excs0L6JamAxe1bdgRee7kuB//RxrvmTkRUw==
X-Google-Smtp-Source: ABdhPJxIT+q6k4x1XUKgMA0xcWXMDXZmX8UgC4OFHTKjkMo/M1c2m8fbk8p7/yiTZn+oKOT4G+tOpthwTKQiUK/10/s=
X-Received: by 2002:a05:6512:3f90:: with SMTP id x16mr5956653lfa.518.1628686482770;
 Wed, 11 Aug 2021 05:54:42 -0700 (PDT)
MIME-Version: 1.0
References: <8ee569d3-7fac-68c6-a1f7-f6457ce0343c@gmail.com> <CACRpkdbYy8jSGmX06i36Xw80ZR4F8M0hqQ=5k6GPXyhtj25o6Q@mail.gmail.com>
In-Reply-To: <CACRpkdbYy8jSGmX06i36Xw80ZR4F8M0hqQ=5k6GPXyhtj25o6Q@mail.gmail.com>
From:   Gabriel C <nix.or.die@googlemail.com>
Date:   Wed, 11 Aug 2021 14:54:16 +0200
Message-ID: <CAEJqkgj0X7+J4Cq5hSBS0Z0uwTm4L3RcUZpJRrcFAPxrXG+EGg@mail.gmail.com>
Subject: Re: [pinctrl-amd] 5.14-rcX, d62bd5ce12d79bcd6a6c3e4381daa7375dc21158
 breaks poweroff/shutdown on ThinkPads
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Raul E Rangel <rrangel@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Am Mi., 11. Aug. 2021 um 14:46 Uhr schrieb Linus Walleij
<linus.walleij@linaro.org>:
>
> Hi Gabriel,
>

Hi Linus,

> On Mon, Aug 2, 2021 at 8:18 PM Gabriel C <nix.or.die@googlemail.com> wrote:
>
> > Reverting d62bd5ce12d79bcd6a6c3e4381daa7375dc21158 fixes the problem.
>
> Maintenance of the AMD pin controller is a constant headache for me.
> The chromium people step in I think out of necessity, I bet there is
> some interesting discussions between Google and AMD about this.


AMD people fixed it, see :

https://lore.kernel.org/linux-gpio/20210809201513.12367-1-mario.limonciello@amd.com/

I tested the fix and can confirm is working fine.


> Yours,
> Linus Walleij

Best Regards,

Gabriel C
