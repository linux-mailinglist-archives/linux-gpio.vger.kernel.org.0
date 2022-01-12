Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 008AA48CD5E
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Jan 2022 22:03:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230059AbiALVCy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 Jan 2022 16:02:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230010AbiALVCx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Jan 2022 16:02:53 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C242C06173F
        for <linux-gpio@vger.kernel.org>; Wed, 12 Jan 2022 13:02:53 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id o6so15020782edc.4
        for <linux-gpio@vger.kernel.org>; Wed, 12 Jan 2022 13:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=z0y8/DCgq5hZnDJBZZ+unJQ7Ag/9BizfTiSabuR5qJc=;
        b=D5yTq1A/5pRzAQkh38F/fitw9MKfBwSLUBnuqP3TMABFR5E2bfYBaKTkxkuHFZxh+W
         qCPbEdgCAb8npafSnXmf3ElOSiav1Yzph4Iu0/aMQ3ax1lWitYkW3rDQi+N3GDhiurVX
         LDvbHpQwtxo3gE8ztI9ImhSEThcoEL24ZbsCs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=z0y8/DCgq5hZnDJBZZ+unJQ7Ag/9BizfTiSabuR5qJc=;
        b=lCEpHlzjfajeiFWGk4tD6vYdRYjfYAss0fY7iDgtFDHbjYXUx3mmG1LziRGyTKt1rZ
         lQYVNgfUbdR2sADfFzCm+QiiOyeq66XMrgnXBfpRffMoTvDoM57BY5E4K8Bjl/QXVP90
         5tmEDXbov5WHsxVtbgX1UIOeU7gAtUO08cyEatEAODtE1IfWdvSvCRyD8QNsT2Bl3fmL
         6jlW6bX77agLtmDVDevy+Wv53L82wWaQL9L/pFUDMdismguX7XZld5Y70JEZWUN7B6Vv
         pKmfUO2b4Aq1+o/Zc+hN6a/kTdon1E4CHbL9VmoXcOQ4YNV6kJeBWiGSTTCXEvNlHxm3
         b/jA==
X-Gm-Message-State: AOAM5303yM95Hb2mDMHXt8J0ttRwpjXu4QJRbq8kvzu8qMcnhnYmPBT2
        GVEpQr3Kemtimw1xu6aMLy2yDsLXOxyWjPhz
X-Google-Smtp-Source: ABdhPJxVpTsRTjCIBil3Yt2fBPE3VLRa1UJHa43d+DRti5xrizVeWJeoExopamEE2RhtnFfnNbahmQ==
X-Received: by 2002:a17:906:c301:: with SMTP id s1mr1158295ejz.505.1642021371792;
        Wed, 12 Jan 2022 13:02:51 -0800 (PST)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com. [209.85.221.41])
        by smtp.gmail.com with ESMTPSA id h13sm328302edl.96.2022.01.12.13.02.50
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jan 2022 13:02:51 -0800 (PST)
Received: by mail-wr1-f41.google.com with SMTP id k30so6453874wrd.9
        for <linux-gpio@vger.kernel.org>; Wed, 12 Jan 2022 13:02:50 -0800 (PST)
X-Received: by 2002:a05:6000:14e:: with SMTP id r14mr1261616wrx.442.1642021370787;
 Wed, 12 Jan 2022 13:02:50 -0800 (PST)
MIME-Version: 1.0
References: <CACRpkdaVGwu=Bo5bxVQYZXD-k+x++SuOTApGoK2a_S-1M4Q+nQ@mail.gmail.com>
 <CAHk-=whcTsfaQWjNKP+DUSqfo+3rf1o8-N9CpjpogMhAxiJZ=Q@mail.gmail.com>
 <Yd88UBp9uaDSc2qW@smile.fi.intel.com> <Yd9AbO+Id7y1+IY+@smile.fi.intel.com>
In-Reply-To: <Yd9AbO+Id7y1+IY+@smile.fi.intel.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 12 Jan 2022 13:02:34 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgJe8Z7-C23Cn6CWE=zYEO0AazfTohSkpVLJo1SffPgzQ@mail.gmail.com>
Message-ID: <CAHk-=wgJe8Z7-C23Cn6CWE=zYEO0AazfTohSkpVLJo1SffPgzQ@mail.gmail.com>
Subject: Re: [GIT PULL] pin control changes for v5.17
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Arnd Bergmann <arnd@arndb.de>,
        "D, Lakshmi Sowjanya" <lakshmi.sowjanya.d@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jan 12, 2022 at 12:57 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Now you may easily see what happened.

I still have no idea how any sort wouldn't sort that CONFIG_PINCTRL_ST
line first, since even if it's about the following characters, both
')' and '.' would normally sort before any letters at least in ASCII.

So I can only assume it's something that takes  the locale into
account in odd ways, or just has some special rules for non-alpha
sorting.

But I don't find it in myself to care apart from noting the
strangeness of it all.

            Linus
