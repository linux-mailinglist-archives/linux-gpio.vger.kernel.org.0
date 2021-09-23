Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD5C84167C5
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Sep 2021 23:57:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238517AbhIWV6n (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Sep 2021 17:58:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235831AbhIWV6n (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Sep 2021 17:58:43 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 210E3C061756
        for <linux-gpio@vger.kernel.org>; Thu, 23 Sep 2021 14:57:11 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id e15so31946729lfr.10
        for <linux-gpio@vger.kernel.org>; Thu, 23 Sep 2021 14:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=i7hRdGiC021i/g7N4xWzjVg/GPI6/GDzT+9QzDnFO8Y=;
        b=Pua8W3Kgg6VG8BrtF7eBDdmp5plahxHNaoseKra0+kYMbYVYY3rwpH6/WAxVOiNNx0
         Mg6a4bGR1oeSkG/0r02Rni4fhLjkRb78indwzpQWLYaAO20lJhu9RYu4SpBX7oHILKp+
         wFYgZyFTSwWAUfUwtsjPMXe/ynjeq5jrl+N58kQXfTIa6Ra5kVCVajeFcmcrgTBycnRs
         J5kY8dSxW+zdqMUXkcfcsFKxqZ7Mk3PYuRRW8ViSfbsBc1ZQPMeQmS+iWyfLVFddGqV0
         kdTE450ztbCr81eskwmycMh8ZTtW8Xeh2BrXzmKhUqpXf+6bXpE6EYTVtYpQ0mnzh01W
         9/zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i7hRdGiC021i/g7N4xWzjVg/GPI6/GDzT+9QzDnFO8Y=;
        b=eyppUrGw1r4MFrIx/pkEouPlSE88F53Z3nlQPnlZb4KV7zVqTrQ0HrXCca6nlqF5IZ
         K68hFVx9A/S+5lLPk2auCnmGo+EqjAk6Nx8YhFQpRFUf2r0V0cQS3P/gsbr5Nsr7qPoU
         uVM4fJtkZz5MjEcqC/OcMSfdEkirUdwKKWiToW2IvZhDoBYKp9QmyJKfzJY3AEbFNtPx
         NxD50hHuKnetdXLX1LQOjaS3gHwfdrQhhknqHTgctIAUymO+8wkLMw9AEH2QB20aFOYj
         S/TdpIKlr74FdHHArmB88PAtWYU/CbJVGSO1G88gisMx7gjp8g3Jwmm8NXURAk1L8ty3
         Ll1g==
X-Gm-Message-State: AOAM533cjdZFbr6betUxHgjm/C9ZpoAU0MFaBxo46jVaxj/mL1dj+uWX
        qErcDkpprwxmnvfoufyiLUMgp7HULbOCVV2OhwWAyA==
X-Google-Smtp-Source: ABdhPJzBmuDlnoQWR8jcwCyn+uco4wztn+4HuUBoIiiu9XwVf6gmiepKevdbI0TsquhWmZ4kHEvRUPUak2Zm26FnVM4=
X-Received: by 2002:a05:6512:e82:: with SMTP id bi2mr6233660lfb.95.1632434229490;
 Thu, 23 Sep 2021 14:57:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210918054630.18544-1-caihuoqing@baidu.com>
In-Reply-To: <20210918054630.18544-1-caihuoqing@baidu.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 23 Sep 2021 23:56:58 +0200
Message-ID: <CACRpkdY+AmyhSDMM2hgcnv16+reLJornsQMemd+=8b-jSd8AKg@mail.gmail.com>
Subject: Re: [PATCH v3] pinctrl: intel: Kconfig: Add configuration menu to
 Intel pin control
To:     Cai Huoqing <caihuoqing@baidu.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Sep 18, 2021 at 7:46 AM Cai Huoqing <caihuoqing@baidu.com> wrote:

> Adding a configuration menu to hold many Intel pin control drivers
> helps to make the display more concise.
>
> Acked-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
> ---
> v1->v2: Revert to "select PINCTRL_INTE" for PINCTRL_TIGERLAKE config.
> v2->v3: Update commit message.

Looks good to me, I expect Andy to queue this and send it to me.

Yours,
Linus Walleij
