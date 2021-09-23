Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1D2241546F
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Sep 2021 02:10:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238669AbhIWAMM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Sep 2021 20:12:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238652AbhIWAML (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Sep 2021 20:12:11 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F54AC061756
        for <linux-gpio@vger.kernel.org>; Wed, 22 Sep 2021 17:10:41 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id g41so18940033lfv.1
        for <linux-gpio@vger.kernel.org>; Wed, 22 Sep 2021 17:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EvOlB0r3FuqDhudXTyF9BaPbYvDMAbce9BxNCnXMzUY=;
        b=cy08gT2CO5xLGpdaFt4dHN5Z3IisOK0kVkLBJOeTlp3itOsIcxG4ABvuKp5pyOsYxg
         bUsXR4cXLnhObVwtRLvM2iixJmK+1l+MN9AZwGE80HzXE7YtI3A6N+JY87BNi9Xr8sM+
         9xPGm3uWJe+/18nWSfbP5LSiIs7iizfFitHI/J6z7oCxMBlAQJ3g5oElJbqmTF/zk3Dn
         ViYFGOza0GyLv1b4RWFQzmvPbdx1uUxPXhmguy289L+PvT8T1LzRx5fRj8zt4ZU87cw2
         Meveez17KcH7NwcpjORrRYdXQQ2hbwmebJTEwf8TYK1OF7AI8ZoLDrbAK22UwUF2PpSI
         r66g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EvOlB0r3FuqDhudXTyF9BaPbYvDMAbce9BxNCnXMzUY=;
        b=rT/9OnSJbpLsDzkE65ssgrLU0uirxLyDxVIWQkTmc5lsJBamILTrUKb95oAFd7fMnO
         ePXDygQBPwhHcXyY+vQ3RES3wH0xJjwwksaV3sIbCMjp3db6frQ3p09r1y5qlHJTXeMH
         2he49somIxmZQI2IP/fxYicIM+OtUJiV6+y+xKZDFba7VL+G1CTVaP8pFMGB8SSm9dku
         cM+ipIlgqiFvoTtdHRqe52k8iVQM5UpIPOTiPcNwa0T24f+2aWGdc1qtVn5L6iddbHLe
         FiguNPhG/nUnyvFFllrqe5k4j/KMQVS2PdympiVHwNutFKUcw/HU/IHgoQ0jkW+wew3F
         zTxQ==
X-Gm-Message-State: AOAM530lz2W6OcayeVgbA25pLemE97gkPs5fWhsWruUTixQ1s0k6UG+l
        hpR0VYYWC+eONJUt154u+4HTJ8jj7KJnGVrzpX7wXQ==
X-Google-Smtp-Source: ABdhPJzfg45la9NSsDEaaeeJhQ8OvJtxhwFWWq0/+tCGrqvAtCG/VDNwY89Ys+R/0FGH7r4mdcu29Y7vpDdiSZJCXzQ=
X-Received: by 2002:a2e:4c19:: with SMTP id z25mr2105723lja.145.1632355839428;
 Wed, 22 Sep 2021 17:10:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210921222956.40719-1-joey.gouly@arm.com>
In-Reply-To: <20210921222956.40719-1-joey.gouly@arm.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 23 Sep 2021 02:10:28 +0200
Message-ID: <CACRpkdbsgb8_VPZhTJpc8Xbx1uo_gH0=uo+YC26HRachLSawxg@mail.gmail.com>
Subject: Re: [PATCH v1 0/1] pinctrl/GPIO driver for Apple SoCs
To:     Joey Gouly <joey.gouly@arm.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Hector Martin <marcan@marcan.st>,
        Marc Zyngier <maz@kernel.org>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Sven Peter <sven@svenpeter.dev>, nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 22, 2021 at 12:30 AM Joey Gouly <joey.gouly@arm.com> wrote:

> I left two defines at the top 'USE_PINMUX_GENERIC_FN' and
> 'USE_PINCTRL_GENERIC_FN', I wasn't sure if I should use the generic functions for
> getting the groups/functions, so I left both approaches in and will remove one
> of them for the next version! Which approach should I use?

I think you should go with generic as far as possible, it usually
gives less code to maintain.

Yours,
Linus Walleij
