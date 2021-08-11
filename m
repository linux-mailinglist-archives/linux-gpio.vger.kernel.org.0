Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A30093E925C
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Aug 2021 15:15:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229931AbhHKNQO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Aug 2021 09:16:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231181AbhHKNOQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Aug 2021 09:14:16 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3E94C0613D3
        for <linux-gpio@vger.kernel.org>; Wed, 11 Aug 2021 06:13:52 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id n7so4593200ljq.0
        for <linux-gpio@vger.kernel.org>; Wed, 11 Aug 2021 06:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=q1+L5maAAnYSOSbC9LKjnSxKnH93+JIlIdMu7eEpexE=;
        b=OjRlQpP9cVv52RD0nn7JhPvpcVxyKg+GKPrr8DsAmNXAjJliwDcnmpCIpLncBcu3Nc
         yTEzrwFbRpkGLM570XQvRe9Qpwr6djPLd+9uMy8u6lvd682pCzIRbgR3u+rkBN0lNl9i
         YXV3QhbSiTWM4Q6ciFqMobbzl5gCrbMgONa2mxzcOmbMf8L0NwJ12UF00TCVegG0+XFU
         aRaZTAkrkrRKpr5vP4M5BAc9EYhjfx1eympsP6VsPl4BVAwniQeChDtVtzOIQgYAYbLg
         h1aBPxCcq2cpc28dA3p2V6j4ATpdpd+WUAZnCO0r8VJkgAiAW0jLzAa4lxfV6GYhC2KZ
         Uw7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q1+L5maAAnYSOSbC9LKjnSxKnH93+JIlIdMu7eEpexE=;
        b=mhZAfsar4NGdsEtztRMhG1B4VkWRj4cg0O6ks5wAyYxVQtxp4DfTzwY1pXH4eri8dF
         JG0ZcGgTduqEcnmst1baTimUtDYvEVN3uNP+NinnyLtOPJ04TSFoNAYCeS7r8NcOxZET
         aYKDAtOYpkGLz+QpFGSW5xKKgO7CXXB6cxFWBQoLA2Az74aK/AWEw5J3bkoxsjKTkmDb
         WJUN4VzyDWgXOJTcDqSPl3PkMjzJomomFmiVbN5FZs26bEjWFMfwp9uMmHTimkelemBW
         mx65zj23Oo5Efh113WTVi9750yo6OBU8SStsvwk+X33MUH0m+GKi6ZgQPBFOKqXbnw2a
         xhtQ==
X-Gm-Message-State: AOAM532J/L+IwhTW2cFosgASQqiJWuXzxWUCI15cwVT0MVTCtE+jmx8L
        mM3mq6LAcWH3QCJtAyusX9IqIDf8SZXBu/VSIDuSmw==
X-Google-Smtp-Source: ABdhPJzElwzEiR8zzvMRvJhPG9O5YnRG/KEEhB95WfW4xLAcedlsP/gOJdlbkRQTVj5IQY/FFRHOv95iZsG2HDxxlzs=
X-Received: by 2002:a05:651c:327:: with SMTP id b7mr23751809ljp.74.1628687631127;
 Wed, 11 Aug 2021 06:13:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210806142527.29113-1-lakshmi.sowjanya.d@intel.com>
In-Reply-To: <20210806142527.29113-1-lakshmi.sowjanya.d@intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 11 Aug 2021 15:13:40 +0200
Message-ID: <CACRpkdb2B-=nkp075+DvZzXYKOEXaUDBdktFSTxqRLwTVDg=Ng@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] Add pinctrl support for Intel Keem Bay SoC
To:     "D, Lakshmi Sowjanya" <lakshmi.sowjanya.d@intel.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "Raja Subramanian, Lakshmi Bai" 
        <lakshmi.bai.raja.subramanian@intel.com>,
        "Saha, Tamal" <tamal.saha@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Aug 6, 2021 at 4:25 PM <lakshmi.sowjanya.d@intel.com> wrote:

> This patch set enables the support for the integrated pin controller in
> the Intel Keem Bay SoC.
>
> Patch 1 holds the implementation of pinctrl driver.
> Patch 2 holds the relevant Device Tree bindings documentation and an
> entry in MAINTAINERS file

Patches applied!

Yours,
Linus Walleij
