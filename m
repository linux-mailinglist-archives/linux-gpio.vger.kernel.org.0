Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C654B1BBE49
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2020 14:53:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726746AbgD1Mxr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Apr 2020 08:53:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726620AbgD1Mxq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 28 Apr 2020 08:53:46 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65699C03C1A9
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2020 05:53:46 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id g4so21360480ljl.2
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2020 05:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GkyvKjKNK03AzUDznXq6B377jPCAHw2AW858bfdJpEQ=;
        b=rPqZrwnntv3yGBTDEXOqjn7PV6xiz65X/8tbA4PdJ/ugELdB7/tjZA1Oqll1T/2/ad
         P5YZY4EC6os9IJte1fAju3f1wFZgSNqYnDmMiup0szBGBAw4BVotQj9UN6B5deJYmbvF
         hEpNE4aiaUDTpgOihQ0aiXw5nxwmz5fYcdPhEuXfrJLsYj8hy11lAzRT5b4n9/hIhZBf
         kOFX7phtZPAo/XjZj2MFgMS4Yuilkr75Uz8a/xmAE7RhT0wUOSy/CtLKruzNGypJ60RZ
         3QZjXuyrpiUGuvKv3R6NYesLXc/h41kX8RF6LgROYXEjkcLb50/5WhL4FwotTusWdkRs
         hobQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GkyvKjKNK03AzUDznXq6B377jPCAHw2AW858bfdJpEQ=;
        b=XysaleyGTbSmn3XEQJaptEcCU6oXYJPrmPGLn2W+3OTzq31Rg+laVU8CUqvlh6Q1H4
         WpNFEeOX3wXZCllKBDdRAzMTLKBfjf8W6vwxA/0XcGIVs5PtUYygGXAv0B92ozqC+qrq
         y9zv1B0EAKLFrYG4JFkVyqbvg5pu5Sm72sgTJYf9Dt9jWQ7PFAnC2e5vJpNT5OaOOnps
         GwBDH999HE90dNHy8MOhaZ2JiVndMseuDxcB8FFuZYK9xb7lsyMHNXYNMnE84FcjBOY/
         IM2Ttqsp4MthEB64tzqZWS7688xwl8pHI0Do1ar98bY4IYKpWDB8lj8U0sy8wXb5u8AK
         hdTA==
X-Gm-Message-State: AGi0PuYc4cmYr5vUjPRFaE1LSj6inl//CqmOzl3XjypqIGkildmimDVT
        TLE/TcL9wFyDS6vjIqTocJz57MCZuOA3lUGBsATnS4pK
X-Google-Smtp-Source: APiQypJ8qBlnfzDAPIHlciPKNX5ODn9RL+X2g17vXsNNReKqMsV1yCKP1sDRsVuOw5gnPqQg5lwjqJPj3zqxXqbHPN8=
X-Received: by 2002:a2e:2ac2:: with SMTP id q185mr8767479ljq.125.1588078424801;
 Tue, 28 Apr 2020 05:53:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200422110654.23442-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20200422110654.23442-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 28 Apr 2020 14:53:33 +0200
Message-ID: <CACRpkdbxdafkjSJVqSLeafm7N4jQ+D98_GKecA0Atm1KEqMd6Q@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] gpio: dwapb: Get rid of unnecessary conjunction
 over 32-bit value
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Apr 22, 2020 at 1:06 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> When we mask interrupts before sleep, there is no need to have a conjunction
> with 0xffffffff since the accepted by dwapb_write() value is 32-bit.
>
> Cc: Serge Semin <fancer.lancer@gmail.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Both patches applied with Sergey's review tags, thanks!

Yours,
Linus Walleij
