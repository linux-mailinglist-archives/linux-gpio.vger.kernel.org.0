Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8035A1BC118
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2020 16:23:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727918AbgD1OXL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Apr 2020 10:23:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727887AbgD1OXL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 28 Apr 2020 10:23:11 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAE6BC03C1AC
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2020 07:23:10 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id u10so17040864lfo.8
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2020 07:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=e82wrxH8EFgI5d69qDWjt/I8rjbTFp6+0zndATZdTvM=;
        b=ePMdkQkoTfFK+4coY0fnsrGdh2XVrFCg3MRcjHaXYFtBJde4EmsOwmiQMDNbc83Utk
         DtnqX52tdKAnDuLcE8xgCN+ZRkOCsYR5PnNjoAVtRzcSpZkJ/QWirgU2nwENiN9LaHKT
         cky0aj2mwB7g4DVs7vNhD0llKkIuffrZr5xR0M4q5QG3S8P08axzpUXGb2WvYLhOmv0q
         jIZfAXplKOZz56/jesOBK9wEasMhkjBODXTJg2W78lZ/vfjRDVqwLn7f6gUGQJ1ewJJw
         O1OuJowxs+H1svNIFAZA6oj3+zI+4blvZSRno9AUKLLAcKf1qgPKpm3sb6DjpbAeU1os
         8A0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=e82wrxH8EFgI5d69qDWjt/I8rjbTFp6+0zndATZdTvM=;
        b=BdbvTO6KBWAI7zulYQpY1a/g5DvLYVF3jzrmdoJQBdezhbntvgL/UMjhwcJCwFR4Mt
         pS3Y+m/J1R5g2Ii9j0k0LtHDKYheSFRqWwEchQt7/aiqyonsWf3BQUM9mKcDLcRpW6ap
         bma1zJCRQi0QBtuVjca15Ay+nHNW9gF1iOVriw97GA/aPBJwtrBXZWaip2AWpQEnNAm6
         yX2IdWDeu+cQc4ExV3KUlWtt25SbWB5gpnmJB0HICxBgCyzFNyH5QcCLsbbiHM/G9QE8
         UW3iG1oOr/N7DFgJEIoXShMtMhmWIUlHaFnKsTMNLNelMCnFXP8jWsytY+WLtP2XyC35
         la9A==
X-Gm-Message-State: AGi0PuaC25eTRs4OGdB8qKsQQ7odtpcX8ka8z1c5X9+4oNx/DjfL1Jhc
        nwv8dxFNwkJ/WpBSKIrAZzfIKj19GL5W6HACNR8E6Q==
X-Google-Smtp-Source: APiQypJC8bIv/Sn8VoOVg1N3jSzATmQtowcWVRLdelQP+LWb50FFE1SxRsk72d7horaMs4takiRtaRBj8vEXZBFodqI=
X-Received: by 2002:a19:cb41:: with SMTP id b62mr19578339lfg.21.1588083789059;
 Tue, 28 Apr 2020 07:23:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200427232605.11608-1-swarren@wwwdotorg.org>
In-Reply-To: <20200427232605.11608-1-swarren@wwwdotorg.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 28 Apr 2020 16:22:56 +0200
Message-ID: <CACRpkdY6nU4DW-cadbo8+LTsCbL08nrZM4e9DXz2Nxp0PHj=qQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: tegra: mask GPIO IRQs during IRQ shutdown
To:     Stephen Warren <swarren@wwwdotorg.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-tegra@vger.kernel.org, Stephen Warren <swarren@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Apr 28, 2020 at 1:26 AM Stephen Warren <swarren@wwwdotorg.org> wrote:

> From: Stephen Warren <swarren@nvidia.com>
>
> The driver currently leaves GPIO IRQs unmasked even when the GPIO IRQ
> client has released the GPIO IRQ. This allows the HW to raise IRQs, and
> SW to process them, after shutdown. Fix this by masking the IRQ when it's
> shut down. This is usually taken care of by the irqchip core, but since
> this driver has a custom irq_shutdown implementation, it must do this
> explicitly itself.
>
> Signed-off-by: Stephen Warren <swarren@nvidia.com>

Patch applied for fixes.

Yours,
Linus Walleij
