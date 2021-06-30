Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE2EE3B7B15
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Jun 2021 02:40:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235631AbhF3Amn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Jun 2021 20:42:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235617AbhF3Amn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Jun 2021 20:42:43 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 228CBC061760
        for <linux-gpio@vger.kernel.org>; Tue, 29 Jun 2021 17:40:14 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id q16so1716521lfr.4
        for <linux-gpio@vger.kernel.org>; Tue, 29 Jun 2021 17:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=P7Utv4Xv8f3LH8imsHGmptaGmIFWX2rE9yPI15cM4JE=;
        b=BqZ4kuWIKpcEbo5JFvNEWhlCsZTvb34CVpR4i+0+loWhTWPtml6JIFjqg1Qp8qCWPi
         h2JoCr3J3SXpLTSRGzstXsfhOuyoo+sY4paGysoJ4oo6SldinBLQfasOmwLvilO5Sigf
         DEAZat0rj+wquVcEQkELDVxcTxxlu9Nf65+yq9GmhF6eRZLohF8/+NQLA7hiozuyYmc3
         e1R6f6tuPhWTkqMpZFBdgQUDOrFZPv9re5fLiojOIxq+Z1qK3QwZIflDhdB9VUC7XnMI
         kbSgbvA7A/ALiS2S/wDsk8gaslJhBVIX8C+k42aEHl/+My6TBicBp+jVzmxPXsLCEzIz
         cEwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=P7Utv4Xv8f3LH8imsHGmptaGmIFWX2rE9yPI15cM4JE=;
        b=Wzg7gPupU/FXLIpFuTk+uA0lS3VTIs0q4ZV80FlNwNGUsb/NwAN96esLDsbVH21TWs
         qtW6Ek6KrFxfQVqDhUJXC/2P+MUFDGlCdPoYeShVTApMk/cDDXOdbwkytjN1VGOA9yRW
         /pAUOZoJnXsJyKeQWc2W2F82LpOWjWc/dfaYmXwCOlpAfy+59usQtxf8KHIztJn2wDkC
         mRgUYIgqzkj1p71nGQVN0QnLDbDzK8IyrR26+j31IzazXaUuIaOZ5xID7lGjnOWv/7W9
         F1f9dYKgw0aRsKmpuAyyd5I22xlcqw5vOxCDyVF7Dnjgg89oUpNOFskMbZyuZ3yRMtnM
         3bPA==
X-Gm-Message-State: AOAM530+/v3Z0NU3A/5BcMgeVIltc1zZBD42B+DWxPkC33ic55VYL6NU
        B99QpSxxLQYjKCMB+sCD1bhUso2Eq0eOCsU9TK8gUg==
X-Google-Smtp-Source: ABdhPJyX/BDkaV92LQFDyRo8cQnD2mbip2JzER1wKjy13vKvSgKZN5woD1/LHTQqro4rdrfZ3m3SAi82jBj9IF/fbv4=
X-Received: by 2002:ac2:5237:: with SMTP id i23mr26347233lfl.29.1625013612407;
 Tue, 29 Jun 2021 17:40:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210629143407.14703-1-sergio.paracuellos@gmail.com>
In-Reply-To: <20210629143407.14703-1-sergio.paracuellos@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 30 Jun 2021 02:40:01 +0200
Message-ID: <CACRpkdZJjuCMrxka5R2YLgcjwjjXCBEgDP5_+M7nxo5ZX6W4+A@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: ralink: rt305x: add missing include
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 29, 2021 at 4:34 PM Sergio Paracuellos
<sergio.paracuellos@gmail.com> wrote:

> Header 'rt305x.h' is ralink architecture dependent file where
> other general definitions which are in 'ralink_regs.h' are
> being used. This 'rt305x.h' is only being included in two
> different files: 'rt305x.c' and 'pinctrl-rt305x.c'. When
> file 'pinctrl-rt305x.c' is being compiled definitions in
> 'ralink_regs.h' are need to build it properly. Hence, add
> missing include 'ralink_regs.h' in 'pinctrl-rt305x.c'
> source to avoid compilation problems.
>
> Fixes: 3a1b0ca5a83b ("pinctrl: ralink: move RT305X SoC pinmux config into a new 'pinctrl-rt305x.c' file")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Patch applied!

Yours,
Linus Walleij
