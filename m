Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50CBC1D925A
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2020 10:46:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728273AbgESIqa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 May 2020 04:46:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726121AbgESIqa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 May 2020 04:46:30 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2304AC05BD0A
        for <linux-gpio@vger.kernel.org>; Tue, 19 May 2020 01:46:29 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id k5so6234711lji.11
        for <linux-gpio@vger.kernel.org>; Tue, 19 May 2020 01:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OIpPfUzeki7t2/xOW8D2TwuLm3eUY3xhyGDnwk5Lnu0=;
        b=f7hDNXYiQHSskMCyc0/RCEDU8VzLQOtUQCEKK7X4yLljolNXESh06CRtaosmdsJjMg
         MX89bhm05w2IP6iDp8Zhv8JhB8YKTb2VBgQ26mmkDdbz25KK/PcLzAUkyOWJ4OIiVMbI
         wazGJoU829h1latSrEwsf8EIeuiqqKJBtRhdrg2UEsd97YZjJX3UhtZXNge0uZUx+SrJ
         H1PKlbx5h2OO01B3VProIiBId5oEJxzc+/55C+FxnGVPVAG5VcWu1n3AhCmOjazV4uea
         tnMICKUeCPRVLIQPDFf83zy9+N90igGBK8sZFg0xxlR+yKWVg8FI2bSQHs6P+Dw691Dn
         lqXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OIpPfUzeki7t2/xOW8D2TwuLm3eUY3xhyGDnwk5Lnu0=;
        b=IcJAzE23PvIrtpUxfKwPWOE1Tp8l6rjEKKvq5c1Lic/2oARp9/mWh8PCL84ORpIJ2k
         fos8/GPmPNa9xbog4vpAsjVInuOMQ54IHaLkUMOeJj/03Lrs9KkKVP9z5UgSiBDMseS0
         RwCPl4ylyskEikcmmWajSH0sWZOn8GM1Fe4fPsYrbMibBz89WdUvzwB/M9rw5plnzUfw
         yWHbFZO6EHMG18F4wk/t3vnmmDRqzCdRnbNTo0XE8oYnplbQNJzYxDrpVheyUHaNH9is
         suC47ykVoJc+F34LKQp3lXExqLDms3WZ30IL5688M3juIw0pQjxf627WZfcf7sblEH/u
         8tqQ==
X-Gm-Message-State: AOAM531e6LtTwSNE+EhE6+X3BcxbCOqjeqbZEGyrZyeu+o3oG9XylfY7
        wlsfTAy/i0c9SRFUFVkYr7TAn5n7E1N+KclNoDLeow==
X-Google-Smtp-Source: ABdhPJxxg7dkus/MHWS76IxVh06BJP+0gA2DbuK9i0BMpSDLRuZWDES9DGHBKjU9LMmAdUCXSmLUQqB3/XS9Szv1tXs=
X-Received: by 2002:a2e:b609:: with SMTP id r9mr12750772ljn.125.1589877987494;
 Tue, 19 May 2020 01:46:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200519070240.6510-1-krzk@kernel.org>
In-Reply-To: <20200519070240.6510-1-krzk@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 19 May 2020 10:46:16 +0200
Message-ID: <CACRpkdZbD2BAAs7RgGC4sqaj=wgtNe0td1JCCSyb_Ld11qSSWg@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: samsung: Stuff for v5.8
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 19, 2020 at 9:02 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:

> Minor updates for Samsung pinctrl drivers.

Pulled into my "devel" branch, thanks!

Yours,
Linus Walleij
