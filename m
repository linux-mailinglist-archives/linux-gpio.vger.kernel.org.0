Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3CF53EAC35
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Aug 2021 23:07:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231270AbhHLVHa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Aug 2021 17:07:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234500AbhHLVH2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Aug 2021 17:07:28 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07414C061756
        for <linux-gpio@vger.kernel.org>; Thu, 12 Aug 2021 14:07:03 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id z2so15991024lft.1
        for <linux-gpio@vger.kernel.org>; Thu, 12 Aug 2021 14:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6PC9qkv0bT5Q6RXEYPNOhipMKAifPwXWAHn4hf32awA=;
        b=vYBXkKzxA1EduNxnfN1Numn+ttQQ0nz3qIeVUko6iVKC/NjsgH83Zru6BhgsImsWIQ
         8wfmTu1KPc4fLXq5wLA+Z6wIoMIlghED7eGC8Snq2SaAQcKmfzs+4GsQoa+jVCEC5Tie
         C3NOi/XrUgdJIujw5fQY7Ma7EhVidMLYQDELAw1hTUvKEO1CEAkhocKD53L7/qW433kV
         zHR+1kCbSp+kCN00MD+oxygnC/SqGCTYsLkJ9gUjT+0K2yCPCDuBjlli6z97la/+jDR3
         PzK5ZH8iaw/f7OwfQR550zGdcRYr47BJe+D6TEkPpUG36wtjIvX3sAefJo6q1BZaBJob
         5gWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6PC9qkv0bT5Q6RXEYPNOhipMKAifPwXWAHn4hf32awA=;
        b=SZUK6AE5Ooiy3l3WTCc0JGA2OMx2Di2WqpBo4pIXk8Do32CM+DAk13sO1zHX8oJevl
         hLEWQt4hsC/LR782VJJBFBs873JvN9SGIcStevsq4MqnTObNPDb8JV2PhX+auY8kXC/i
         /s3KVq5pVntCyDNju/+SzrvigU/2dSOXLDDvu3Y4V8Ofuoy455mHkQ98GzJDbsJU/MSo
         RFlLm1xUHUF6PvLNmlHxRnP9BclQZJj1G7GtamL062n5SpkSg/qrfvWUcZC4Eu8v9UXc
         hZ+aKsGw3UV2FGkBfWc3bMLkdRaOcNDfYWwdagMgj5sM/dIV34aruB2RoKPtjYpXyDRF
         IhJQ==
X-Gm-Message-State: AOAM532Rgb/xqzMXoHYWKdd4HTvW0QaPQFDPTS1kbMz+rLj+60h5z1nB
        Ky9uu37yzXPDoLkP4SRCu2oIcyhzCwAcKHVaLpaQsA==
X-Google-Smtp-Source: ABdhPJxG7tjf/3lJu727KTAlDk9tbnswuGrxJU9a2UtDAP01GNjfL1zAJjqiqNFgL0ryBoEgKoxD0oLgMGot3sehaiU=
X-Received: by 2002:a05:6512:32a3:: with SMTP id q3mr3709067lfe.157.1628802421338;
 Thu, 12 Aug 2021 14:07:01 -0700 (PDT)
MIME-Version: 1.0
References: <YRUskkALrPLa2cSf@smile.fi.intel.com>
In-Reply-To: <YRUskkALrPLa2cSf@smile.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 12 Aug 2021 23:06:49 +0200
Message-ID: <CACRpkdbAw=+x9vJL7TiqyA+M8J9CA2go+hjuP0EUzzkEZikbbg@mail.gmail.com>
Subject: Re: Possible ACPI abuse in Mellanox BlueField Gigabit Ethernet driver
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linux GPIO <linux-gpio@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        David Thompson <davthompson@nvidia.com>,
        Asmaa Mnebhi <asmaa@nvidia.com>,
        Liming Sun <limings@nvidia.com>,
        "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 12, 2021 at 4:13 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> From time to time I do grep kernel for ACPI_RESOURCE_TYPE_GPIO usage.
> Recently the drivers/net/ethernet/mellanox/mlxbf_gige/mlxbf_gige_gpio.c
> caught my eye.

Thanks for doing this Andy, I wonder if there are other GPIO things we
should be looking out for.

Yours,
Linus Walleij
