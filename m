Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45B0732AD0E
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Mar 2021 03:13:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1837370AbhCBVTX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Mar 2021 16:19:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1575710AbhCBPe5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Mar 2021 10:34:57 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 195F5C0698C6
        for <linux-gpio@vger.kernel.org>; Tue,  2 Mar 2021 07:30:26 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id a17so24458710ljq.2
        for <linux-gpio@vger.kernel.org>; Tue, 02 Mar 2021 07:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=W834NQ1vAh6LWdXU80aAvj1G8P2ffq4WwVKe01ihhOs=;
        b=gKyg1Muwq2lNtJ5GXY+ygyJPb/wwpaaAi1kBGRe7mFZmw8B8tViDhbynkysd4lYarJ
         RnUJwn+JNLRcoX2ZYOJQuYMcmTFTmrV9vKERejJTkso//LWx0ulfjhBrT2wygnU5sDA6
         hyzYxssPd9sN3sCntg5mSL47i7uY5gAMqhbxROdUrtN8i27FYVZk+1QtDJ/cSnv/3mE2
         d82H/xfJJXjX4PXAGc4q8my3bF/LseKJNkuG/knSItT5dXHE420CrWGxLWaqgwBy+xfl
         tlIENx5fwOJ3pgfoDAJXaqnVXblnxySTj9Dqep3d4zUXwJmNb8UOccIT9G594r3i9t42
         F9hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=W834NQ1vAh6LWdXU80aAvj1G8P2ffq4WwVKe01ihhOs=;
        b=kaEN/8wLZ/Qr1kMWBodKVvEANaNVgCiXTV4RZ+jeshdHPyZHaXtMX7xsoFxNuZRSrK
         f9FkeFIEAKH3tWFZnuHFvcu1xgAEGvkahCI87yTS/mOE5NkChuc09sbSnu96gBSHfpbK
         Qf6PvOMpBR/jSjZE0wBvZp8xpIM2bHCG97d0ojitTljLJ8XIzpHjtA6dY/A1wtXaGN3l
         yWbX3yV2jGMvS2UjsaGu1+FpVGmeB8igZp0bpJbJ1uxTLI1ig5qpCcrV27q6jfPvfM4o
         V3YjeTFJ3qyc0oHvTHR0v4G0cK61BhXyTtplVAc3uoUHSuxRhWM4FMlfdgg5LUFW4ohy
         SQTQ==
X-Gm-Message-State: AOAM5334v/n2nT7WDMt3Uhi4UD0dkjwcSbfzjKxUOr64HuRT13JMf2Wt
        MNLnxXw0PgTkLDr6m+hL5ivoaPAHtw2QY3siaUnuLw==
X-Google-Smtp-Source: ABdhPJybFFwipXyQWZHYVEaekG+qg6cTGcIeBxjc1+hy1oZItqJ7bLzKK82xiAtjTPHwPwKPsZRGK6FA4Brq8Mg7bXk=
X-Received: by 2002:a2e:700a:: with SMTP id l10mr12496829ljc.368.1614699023063;
 Tue, 02 Mar 2021 07:30:23 -0800 (PST)
MIME-Version: 1.0
References: <20210225164216.21124-1-noltari@gmail.com> <20210225164216.21124-13-noltari@gmail.com>
In-Reply-To: <20210225164216.21124-13-noltari@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 2 Mar 2021 16:30:12 +0100
Message-ID: <CACRpkdamVjNOua1ZVriPnhb6GDerpchMFepqekx_NP40_KH9Ew@mail.gmail.com>
Subject: Re: [PATCH 12/12] pinctrl: add a pincontrol driver for BCM6318
To:     =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Feb 25, 2021 at 5:42 PM =C3=81lvaro Fern=C3=A1ndez Rojas
<noltari@gmail.com> wrote:

> Add a pincontrol driver for BCM6318. BCM6318 allows muxing most GPIOs
> to different functions. BCM6318 is similar to BCM6328 with the addition
> of a pad register, and the GPIO meaning of the mux register changes
> based on the GPIO number.
>
> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>

Same comments as the other drivers.

Looking forward to the next iteration of these drivers!

Yours,
Linus Walleij
