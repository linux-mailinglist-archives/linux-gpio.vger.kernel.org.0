Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 957D32B9B92
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Nov 2020 20:38:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728295AbgKSTei (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Nov 2020 14:34:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727059AbgKSTeh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Nov 2020 14:34:37 -0500
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D21EC0613CF
        for <linux-gpio@vger.kernel.org>; Thu, 19 Nov 2020 11:34:37 -0800 (PST)
Received: by mail-oi1-x243.google.com with SMTP id m13so7607133oih.8
        for <linux-gpio@vger.kernel.org>; Thu, 19 Nov 2020 11:34:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ini9fyEBuHieS2TeRenH8PBPd1ECjmGWhL22ljl8/DA=;
        b=BNEHy/43LYzlP4L5fYi9Rcak3Zh9nsqiweTIIqGxTizitmAgjX/HpVKn5+gJ+VcMqQ
         EZv3buIWPOvbbXlkEMKU8lEUzYz5Kuh/zuFT+6SQqWYU5PNyxv4JDgHUOQNvEnKyztyf
         Luvuu8EcBTrXjuCi0zpz5SM7+xqrqETHkqQjuSk0z0aIPRK1rQDzRqQP9Bwg9JthIRTa
         gNxrW1uvZi0YUiy/4hUskZfwmUNojZAA5VfKJ9kwaTRRX35Fa+eiOXMp1FFcjN/EBzh0
         7eRhodQGqhGACZIY5zBHL2XK/yDehcxySVvHAJGXfjJpWSDjKJZqcPauNJkLEEEbxR1t
         4/nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ini9fyEBuHieS2TeRenH8PBPd1ECjmGWhL22ljl8/DA=;
        b=WBw6+BSc2Gv4Q/D+JDicXgrxA9D2Li1oVb4TeAi1+egG6iv+SgBa5SpX+Mqm3ubneW
         GCnarMxuHcDoo8VXbO3esJKZEi0cYAnJj545GXzSTp427USBvtSzHz85tBIuTylAC6UW
         3vnJ7sVHuUh9rlNGwJLPVdd6/FvVgPEschE8pdOuye+IHNM4LZ+SSnadN9+XSObBdJSn
         fVZlwsjl1xKDE69wp3hhcKqHCAzISCSh/kM5EqsCUYKc6rK0paEvjA2vHMzhS+9FcUi4
         P5BTEoEph96cv/G0pU+K1YneCPeRk00U6xg67p4R+/3hPZuH84IwQX0uXq9NH7OiiT1H
         o3wQ==
X-Gm-Message-State: AOAM532iUCC3bICcyEJmkNAt6K1SDoi4pGq00jeoVLmrzCT8mTCnvLxK
        IZ+xbyp6IEqoaYn2Mde+OLi/ViLSZt/ROLPaMWxPi9ZAmrg=
X-Google-Smtp-Source: ABdhPJw+yUD5lftmKr7oFPOZJ7k7sTngPRGZsXcSNFFYd0zIa6SCobdVOlJwKO/uyOUO+XMpr/9zwwjPldoIXVyO1Dk=
X-Received: by 2002:aca:c3d6:: with SMTP id t205mr4059105oif.10.1605814476585;
 Thu, 19 Nov 2020 11:34:36 -0800 (PST)
MIME-Version: 1.0
References: <20201119174149.3860883-1-thierry.reding@gmail.com>
In-Reply-To: <20201119174149.3860883-1-thierry.reding@gmail.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Thu, 19 Nov 2020 11:34:24 -0800
Message-ID: <CALAqxLUPXZ1qCU9KEt=0wACSzPyF4SRraiqcPh1kFwPHED2kRQ@mail.gmail.com>
Subject: Re: [PATCH] Revert "firmware: QCOM_SCM: Allow qcom_scm driver to be
 loadable as a permenent module"
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Will Deacon <will@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 19, 2020 at 9:41 AM Thierry Reding <thierry.reding@gmail.com> wrote:
>
> From: Thierry Reding <treding@nvidia.com>
>
> Commit d0511b5496c0 ("firmware: QCOM_SCM: Allow qcom_scm driver to be
> loadable as a permenent module") causes the ARM SMMU driver to be built
> as a loadable module when using the Aarch64 default configuration. This
> in turn causes problems because if the loadable module is not shipped
> in an initial ramdisk, then the deferred probe timeout mechanism will
> cause all SMMU masters to probe without SMMU support and fall back to
> just plain DMA ops (not IOMMU-backed).
>
> Once the system has mounted the rootfs, the ARM SMMU driver will then
> be loaded, but since the ARM SMMU driver faults by default, this causes
> a slew of SMMU faults for the SMMU masters that have already been set
> up with plain DMA ops and cause these devices to malfunction.
>
> Revert that commit to unbreak things while we look for an alternative
> solution.
>
> Reported-by: Jon Hunter <jonathanh@nvidia.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Acked-by: John Stultz <john.stultz@linaro.org>

Thanks for sending this Thierry, and sorry again for the troubles.

thanks
-john
