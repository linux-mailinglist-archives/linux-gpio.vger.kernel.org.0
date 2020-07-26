Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDB3D22E31D
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Jul 2020 00:28:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727033AbgGZW2i (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 26 Jul 2020 18:28:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726253AbgGZW2h (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 26 Jul 2020 18:28:37 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6519CC0619D2
        for <linux-gpio@vger.kernel.org>; Sun, 26 Jul 2020 15:28:37 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id r19so15125616ljn.12
        for <linux-gpio@vger.kernel.org>; Sun, 26 Jul 2020 15:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FqpPADHoD6/sFwAG6/8ngJdpFR3zvYVirGl0PSjjtnM=;
        b=UXRpPhP97xX9+CyYF4MJxoc7cM9pLDOOovxeg4qoPWq1Mq9PWWRy/MYtHH66qlAuy1
         xxPvw4xK4+nHah/la8DBT1qEmDyVxoO5WBOanlrVgKGtMv9B66LRUHIk5WTOAkMNQLkv
         of7BbM+1jQYlJLK2FeA90UTFIomdO5vr6vcY4Aumw8KsDeVWwI8K5bDeLi7qoE6Ua2Dk
         1qUeEMuHLg8PpxExiywWCua30nmJCspKO4ckeuMqCAFkOYSClfo18mKEPR8RD0CPGmRn
         WtGRiJac1PDBzm5xr4mTyG9xOXAQ9lLm/aZR8nasYv6r42lKJw3BHWJHosIdk8u0wG69
         Pwcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FqpPADHoD6/sFwAG6/8ngJdpFR3zvYVirGl0PSjjtnM=;
        b=fZAkb2WjqIWxXR4qkBss7VQSFmp7u3OztF9a/5yrFZihssBnKiAo3g4dkK5I/F2wR5
         zpuVdkyb/+ZX3WfSzvjd1tbxoX+PLNaZ40tZd/9HYrjrugzLICJurBe8B+xUdyBYQfPG
         K/edS9foKqdQfz1hNf/vDcHI5vCRoWfA+PoGhmtyreU1T+5b+7QioUULn74bK5RqKhTz
         2RbuQ5QDRrqEqBmTl198BAPeod55MzfpfPtGbh797uBPe1OPmEBdOk6HsEl/7UEotM2i
         cj25Qqb37FgTkRkUE0Y+hr4HCdZR3odRSb/X75PKnLRG72KpYo5iVNbr+su9nKsvXp6s
         6e6g==
X-Gm-Message-State: AOAM531r2xFiVWNy2qKu4ZxIqmaULxz2QVTo7SJFovqxjsNd3q1lP2wR
        7oSkrHXw9cbEFzD46YAtPaYJim1+UiGRWRZxjocwehjrOTY=
X-Google-Smtp-Source: ABdhPJwRZsGa5mQh/euDMWVs6sXQB/+SBOXYPsqutuy+zDm8oazUfD+J8m9j1i1CcecaoorrBWNLRohjADArNpCXym8=
X-Received: by 2002:a05:651c:1291:: with SMTP id 17mr9463017ljc.286.1595802515951;
 Sun, 26 Jul 2020 15:28:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200725232337.27581-1-michael@walle.cc>
In-Reply-To: <20200725232337.27581-1-michael@walle.cc>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 27 Jul 2020 00:28:25 +0200
Message-ID: <CACRpkdbs2Thch4KiBNvSp+92wDKHrCkXKvhn7FKUH5WgbgS3Qg@mail.gmail.com>
Subject: Re: [PATCH] gpio: regmap: fix type clash
To:     Michael Walle <michael@walle.cc>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Jul 26, 2020 at 1:23 AM Michael Walle <michael@walle.cc> wrote:

> GPIO_REGMAP_ADDR_ZERO() cast to unsigned long but the actual config
> parameters are unsigned int. We use unsigned int here because that is
> the type which is used by the underlying regmap.
>
> Fixes: ebe363197e52 ("gpio: add a reusable generic gpio_chip using regmap")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Michael Walle <michael@walle.cc>

Patch applied, thanks!

Yours,
Linus Walleij
