Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D61934DC0D
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Mar 2021 00:48:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231623AbhC2Wri (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Mar 2021 18:47:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230361AbhC2Wrf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Mar 2021 18:47:35 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 239B5C061762
        for <linux-gpio@vger.kernel.org>; Mon, 29 Mar 2021 15:47:35 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id n138so20855310lfa.3
        for <linux-gpio@vger.kernel.org>; Mon, 29 Mar 2021 15:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NPLJpg1kyijRAIqSRPF4e5bsA13eZZ2rQngmMg868Wk=;
        b=r574gBT4NYFKO478M/h0qIP6s8OYNb5jIT1LV+rwqb4IWqEoU69W28aRtFrMV4H0G7
         IjXyxpi+zVuTCW7L4btZL9pFFCXXsfXBTc/8/Xy6ptN5DDSTSYO+e+r9DXVJGe6LbJkO
         RETFAQRb34q2Zuoud4kMJtpKDMs+c1d+hFjMhkidI3c7uzzpAZ+FGNZ1MiS5s/dBzgzP
         +w0Dlrbb2xvBJdrZdmmKpmdCDboMMJ5RhiVHeCd1nJWtDzMyWrcjWJBzn41Y6TVVl+d4
         0wOYqtPqnEdlXehBq3DOwzjotjIwpXCUfjeR/K3jZNYBEDK2Bzi2u4QVqRu4P9orUM/N
         loJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NPLJpg1kyijRAIqSRPF4e5bsA13eZZ2rQngmMg868Wk=;
        b=c82G8Ek429PBnJie3kan/GxEf/eIWwjc7XT61BaQt4jMXr6BJmLYCP0mpOT6ZysczC
         LpJnYPF6WT+I2ndj5f9WEEfxcj/OTP3SHtTnE0sg/JHqrOBcTDyAKdCLpeHsDAfTDKdJ
         MyOeUlfHeMfNbta0ARYuJcnuLjWXt357NG584zNDHbcvFJmwgaPMxlZ3N55meSUL2Qg5
         PdmdJL2nVxA2SgXTu5piu5A4fX8lPYNMOTUQjgByU+Cz5BCEJA8vVr387ULj6gUsosDN
         C4FGEmVqF+ENFLd7K/47nFlZUInGZ2MIvbb3KKBm9c77meib0QJOAJ2jgnHggKaJ0HXF
         NqNQ==
X-Gm-Message-State: AOAM531HAmRSF/v90EPkBKjY6hv2VIIpI0EButfuQBk1zsjbl+HB8Rny
        vuibeYBLCFQa6gbMF2VwAwUE5pQ7C0SWCVIGqKmAi331yJa02WwY
X-Google-Smtp-Source: ABdhPJxkYIgCGPAK/8vcqYW6EWy+GouuuZdznb/EUjLHxJOfLMWyujMV/ssFSpW5SEa3IeJDt+W5gCaIGa/dlwi17nc=
X-Received: by 2002:a05:6512:243:: with SMTP id b3mr18145315lfo.529.1617058053704;
 Mon, 29 Mar 2021 15:47:33 -0700 (PDT)
MIME-Version: 1.0
References: <YGHrVgivsEWEiI1X@black.fi.intel.com>
In-Reply-To: <YGHrVgivsEWEiI1X@black.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 30 Mar 2021 00:47:22 +0200
Message-ID: <CACRpkda0znzWd+-k_ZE=cnWZQQbknycm1ffuEqQ-pZR6V-k0mw@mail.gmail.com>
Subject: Re: [GIT PULL] intel-pinctrl for 5.12-3
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linux pin control <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 29, 2021 at 4:59 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> This is material for current, v5.12, cycle. Only one fix for Xen to avoid
> crashes. The other fix already in the fixes branch, so it won't be duplicated
> during the merge.

Thanks, pulled in for fixes!

Yours,
Linus Walleij
