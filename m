Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F90046FF92
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Dec 2021 12:12:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237574AbhLJLPv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 10 Dec 2021 06:15:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237605AbhLJLPt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 10 Dec 2021 06:15:49 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F8BAC061A32;
        Fri, 10 Dec 2021 03:12:14 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id CC207CE2A91;
        Fri, 10 Dec 2021 11:12:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6252C341C8;
        Fri, 10 Dec 2021 11:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639134731;
        bh=TgqAl8ITfVtfwDaQ625BpAv4Rdz1KSLtUuyWsSaIkbY=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=FEvIQYvjN4SHAVlInPu2HL8XALbPobfrV3SS8c7/xrYs21OHgHv3iA+7odMte0J8V
         JmMjarZOf705yUVhjGpI9TeFOEmJP/JTzGbWsXPxzCX53mPYXW3t+CkgcCIKJs8W7c
         RUEWx44L5GqJsjtqeowfaQVJpSDJJwuwj+pYeSxnRB8udOq2WMIKeRVynUBnKLMeBy
         BgTSB6dAoL4gioUEsR0clsFBXD6SxMYKCe0R9tVEUyikLUncTvVKe2xkXsCwfSjUv+
         lDvOohj1UiFJUr8PmeX5l3T7QmLUaY75bpLzw9cbDzdsVbFikOZDmjs6F5FZsQIlTF
         NkpWVkyvu4zsQ==
Message-ID: <9fc29e688951c7afe4504ae787ef7806ee4dbb7f.camel@kernel.org>
Subject: Re: [PATCH v2 2/2] ARM: dts: gpio-ranges property is now required
From:   nicolas saenz julienne <nsaenz@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Phil Elwell <phil@raspberrypi.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Thierry Reding <treding@nvidia.com>,
        devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org
Date:   Fri, 10 Dec 2021 12:12:03 +0100
In-Reply-To: <CACRpkdYJAZcr_PPCGPYcitfcwd9GDFf+7hPJkOmjomqCrruNfw@mail.gmail.com>
References: <20211206092237.4105895-1-phil@raspberrypi.com>
         <20211206092237.4105895-3-phil@raspberrypi.com>
         <CACRpkdYJAZcr_PPCGPYcitfcwd9GDFf+7hPJkOmjomqCrruNfw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.1 (3.42.1-1.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 2021-12-06 at 11:33 +0100, Linus Walleij wrote:
> On Mon, Dec 6, 2021 at 10:22 AM Phil Elwell <phil@raspberrypi.com> wrote:
> 
> > Since [1], added in 5.7, the absence of a gpio-ranges property has
> > prevented GPIOs from being restored to inputs when released.
> > Add those properties for BCM283x and BCM2711 devices.
> > 
> > [1] commit 2ab73c6d8323 ("gpio: Support GPIO controllers without
> >     pin-ranges")
> > 
> > Fixes: 2ab73c6d8323 ("gpio: Support GPIO controllers without pin-ranges")
> > Signed-off-by: Phil Elwell <phil@raspberrypi.com>
> 
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> 
> Please funnel this patch through the SoC tree.

Applied for fixes.

Thanks,
Nicolas
