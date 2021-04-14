Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37C2035EE2F
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Apr 2021 09:27:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231480AbhDNHMQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Apr 2021 03:12:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232489AbhDNHMP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Apr 2021 03:12:15 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04875C061574
        for <linux-gpio@vger.kernel.org>; Wed, 14 Apr 2021 00:11:53 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id r8so31340244lfp.10
        for <linux-gpio@vger.kernel.org>; Wed, 14 Apr 2021 00:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/CFTfILqfJh5uZk6ReeOGhwZDRZhRj/gI7BOPGIeuu4=;
        b=Ih3QkoGW6dkE+rXyOwP4ao/9lIPJbwBxfFDiITcYDglNyNW4ozmCUE6sM+j4hXhtmt
         1mTyXcRZftRi3EipiP5sIRj+x/JukCRPAQiB7sZpnFsigQ2DxAa1NokHVweKb2MLi2r1
         91+5Rmj2tlfk9wQJRusvqaa0+d63OxThayYY+9cCHLhehRTPbEaxKLnfM8R5gG1tlqor
         ACqJs5StaiB+ULWhBnL0if0KoglJmF9iN2VltskeaMx5X0cP0Aali/ptqcQ6ZwdP3rkb
         YafI1n/DOffqqkgIMd7WuVyzmWZpxmrmHgAvgBjwEWQOdlpY5m1os6yxIwiWOUe3mRzX
         yb3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/CFTfILqfJh5uZk6ReeOGhwZDRZhRj/gI7BOPGIeuu4=;
        b=Eae8KyH+aTdpd0uH4tLLTZ7BF68nAcnk5tS0t2UGPWWTa87oZggkq57A8lxzKYaXPD
         ctlvRQB1jNUSU/Q65loLlI4jKg5LeI9hTkIPdV6XuXkpOtf1vWxvXHfdi/pzDGeZWIvv
         rcq6qNK2/u7xS9rW5QhlV79hvrrR0iAtV5BvAuBBdU0M2PiRtw+BpedVNHPpdLLP/BdE
         3O+pPxMl8E0nHvBhxtVP20iLmloHE3lIsifSiCmoFK+MftdtuyAFjLbSSlt/dSbs29HP
         eBxJS2g9Pv+waPNwR5f0sZLvAOKerdlyLUcbmWA9vrGdBwJ3Dx/bZMX/4nMUL1BkG0Nc
         /r2Q==
X-Gm-Message-State: AOAM5306mZokXnhKFpq4snPY9qMr8GwrEtUZpD+jgxQy+yauY7BLJeuJ
        IlbPt6h7hTdOVoDhVgYlZY5DdV1RB2dSui7aa6aKDg==
X-Google-Smtp-Source: ABdhPJyRD6M9c5CzR26D4lnJ+lAfjNKiSfM3cwZUqVk5EHpM9X2TvdMGJJFd5lSQ8gWC+dHxSnOziysRgZ17wmp1mAk=
X-Received: by 2002:ac2:529c:: with SMTP id q28mr13761428lfm.586.1618384311564;
 Wed, 14 Apr 2021 00:11:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210414025138.480085-1-julianbraha@gmail.com>
In-Reply-To: <20210414025138.480085-1-julianbraha@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 14 Apr 2021 09:11:40 +0200
Message-ID: <CACRpkdb3o+jA0EfRzz82zG-QdvU4=xZMVFRnJfs==LCtE93vOQ@mail.gmail.com>
Subject: Re: [PATCH v2] drivers: pinctrl: qcom: fix Kconfig dependency on GPIOLIB
To:     Julian Braha <julianbraha@gmail.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Apr 14, 2021 at 4:51 AM Julian Braha <julianbraha@gmail.com> wrote:

> When PINCTRL_MSM is enabled, and GPIOLIB is disabled,
> Kbuild gives the following warning:
>
> WARNING: unmet direct dependencies detected for GPIOLIB_IRQCHIP
>   Depends on [n]: GPIOLIB [=n]
>   Selected by [y]:
>   - PINCTRL_MSM [=y] && PINCTRL [=y] && (ARCH_QCOM || COMPILE_TEST [=y])
>
> This is because PINCTRL_MSM selects GPIOLIB_IRQCHIP,
> without selecting or depending on GPIOLIB, despite
> GPIOLIB_IRQCHIP depending on GPIOLIB. Having PINCTRL_MSM
> select GPIOLIB will cause a recursive dependency error.
>
> Signed-off-by: Julian Braha <julianbraha@gmail.com>

Patch applied.

Yours,
Linus Walleij
