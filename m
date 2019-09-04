Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0413A8470
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2019 15:49:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729471AbfIDNYR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Sep 2019 09:24:17 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:41121 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730013AbfIDNYR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Sep 2019 09:24:17 -0400
Received: by mail-lj1-f193.google.com with SMTP id a4so4554751ljk.8
        for <linux-gpio@vger.kernel.org>; Wed, 04 Sep 2019 06:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aqQvklk8YIAFUL9lGcPHiWhtS58FRSlGQcASUQ543l0=;
        b=hrEGXFTiVfl2ayVHe7GhvPWCx/hZhnMQWOnrOquNFJzjQmJEAPbAd5llGrzK8r003L
         ZHW6aH+hIi7aRiRaNelBhwHX/njZzNdJfvYi3+LZB0T1gGwhv4BhpwH/bLi29wt6MP11
         xb1M02zcK4APML8vL+s5X9sgo+cQYF9XGkCEnq9/9CoJO8E7PGaojjQSJqMAkaRdmIT1
         EPaw2wPwkID896IbPq0h/CwUoukxwFp3QUcR7IkHrKaQUn+FaUceBw6gh3sDBf7fiGTq
         bdVqrMPr3nP0UHqmJEKPBA+6F/TBN80bvWhMqJh5fIDnatPnJnFni4NbEm8GCWrHkyWb
         ie7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aqQvklk8YIAFUL9lGcPHiWhtS58FRSlGQcASUQ543l0=;
        b=EMDPJc7NgAt+ueT/UQ89svZMTbtCw5qDDFjvmhXoy9qRyTU9PqbaCBMg65Tdghqn57
         HHmdm050N6zaJPpRAhnLWZx27Hroh0umjU7TOEctZ/OcLDQzPx9P61EViYPRCIDh9ccz
         PDG+4QBGKkhSnqWjtLpFFHOkiYi/GrL7WqjtGHMPkO5Rxsf88UGnxDpIfDNACEx/aEez
         ++0ZdmpyTz9ZL31GgRgK8bw+sAi2sbDk9wzFJAjBr3Q8FBSI3QYX4iBUUe7eFltM9lcd
         78yk55rKQ6vSfNM+flLulV5UGZBq5IAayEb8DAyhf3jG9N7xZ3ioQ2tNePggBT4MHccw
         YZ/Q==
X-Gm-Message-State: APjAAAXuMgjX/10Az7jMY20S1KoZhGBkpe7+HAo33uxv5f2EZHdSVvo1
        5skm4q8Mxx4KBCTb4AgK4hEjX5qQzkAPZiEgOl2kjg==
X-Google-Smtp-Source: APXvYqzzpq0zy/ApTjeKi5jzJDmNcldnYjTPQZRuBnxHCQ1EP/fKYVGvmjJY5Dfa1R8vvE78iBx8GyZjNk6U6GqI/V4=
X-Received: by 2002:a2e:b174:: with SMTP id a20mr23389649ljm.108.1567603455383;
 Wed, 04 Sep 2019 06:24:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190830060227.12792-1-swboyd@chromium.org>
In-Reply-To: <20190830060227.12792-1-swboyd@chromium.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 4 Sep 2019 15:24:03 +0200
Message-ID: <CACRpkdZZ5WX5hMYwv9D4ED+ChD44RG2FEHU0Hi83v8znu1i4dw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: sdm845: Fix UFS_RESET pin
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andy Gross <agross@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Aug 30, 2019 at 8:02 AM Stephen Boyd <swboyd@chromium.org> wrote:

> The UFS_RESET pin is the magical pin #150 now, not 153 per the
> sdm845_groups array declared in this file. Fix the order of pins so that
> UFS_RESET is 150 and the SDC pins follow after.
>
> Fixes: 53a5372ce326 ("pinctrl: qcom: sdm845: Expose ufs_reset as gpio")
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>

Patch applied with Bjorn's ACK.

Yours,
Linus Walleij
