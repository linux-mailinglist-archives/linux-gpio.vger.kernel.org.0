Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5579337040
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Mar 2021 11:42:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232330AbhCKKlg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 11 Mar 2021 05:41:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232394AbhCKKlF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 11 Mar 2021 05:41:05 -0500
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2803EC061574;
        Thu, 11 Mar 2021 02:41:05 -0800 (PST)
Received: by mail-pg1-x536.google.com with SMTP id w34so12357493pga.8;
        Thu, 11 Mar 2021 02:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oydZva+OV78n4zR3D5VgKTPw+GIHJtMj35CGxxx0cRk=;
        b=n+W8CH6S/QPDxo7OkSllRj9orHmHR64EUWYGKD4qw3nfzRP5zRutO2XZNM/o0iAnu6
         I24Kb8s+e9WxfxZA+YKJuFFhResvxiXIk6rIC4Vs8khjheYryRRbY2Z3e9O1118gg6Sg
         SUD1dRHpd24zBdY3D1qyWm7qwM2dCspx4Wmv7pkQMSoG+ykqgvu9P85XfasobQUAEq8X
         S3p49IgxN55lWXXC1V02DatJmSWQJNmf7VzSzL6xlaeo92luSIv2VmBvmTERHv+x7Shh
         kEAefuINQUw7gYT5T+8HWADSY4LRcmgMxDTXJRcblox+sfxfvPZb/n18xfnCbpbQQsWy
         z4fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oydZva+OV78n4zR3D5VgKTPw+GIHJtMj35CGxxx0cRk=;
        b=qsqwWB1ISz13CK7zxfmshPa86KEddFuBag7I/j7paDOfgn9OMkWlyYj6rNpx3+VVHz
         +ev/LRHwQtpSQU0paYCGfIgEj5mmP2UgUgvf2yQB6V/oLhU4BwOKLfSpWK/aX8VScLLH
         VsWP9LMXQd0B/ZBppGxwIIBAYYFClyALRJrAGrygwYPHgicbg9lGNfeUifKqemrVv7JJ
         O2Yj/9A46kV5Mm5tPHLduKzmryJe7i83heaTyx2PdZD7pVbbBeNZ1IgUsNJwEwAB2ePT
         DX2G9pRxeRycyGTKyIvFnK1pr/krZCUviZvJsY7UkENbW+f5SPWStFo0Ocf6Oi6+GF/0
         K8/Q==
X-Gm-Message-State: AOAM530TVhlk1wDzX8gb/9g2KmhmatEJOhNIm/Ftjw9Hlv5icqLrxnAD
        9pzJLz+/XIrhuk/1M31g1iapILtCtiwPlA8kgxJ0TX1lWuOrsA==
X-Google-Smtp-Source: ABdhPJwdSizxj2HwRjIct+dl6wJ7mtjt+0ZbFH2g3KIQqXRLB1TA44bLbESLIjjy86v3uP4hMC6rpm5Qqhe8No8IRTM=
X-Received: by 2002:a65:4c08:: with SMTP id u8mr6598572pgq.203.1615459264560;
 Thu, 11 Mar 2021 02:41:04 -0800 (PST)
MIME-Version: 1.0
References: <1614662511-26519-1-git-send-email-rnayak@codeaurora.org>
In-Reply-To: <1614662511-26519-1-git-send-email-rnayak@codeaurora.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 11 Mar 2021 12:40:48 +0200
Message-ID: <CAHp75VfJqXQM+L4NnoN8p_iLpdc1SWFkBwFZAq5sHengPKnwJw@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: qcom: sc7280: Fix SDC_QDSD_PINGROUP and
 UFS_RESET offsets
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 2, 2021 at 9:32 PM Rajendra Nayak <rnayak@codeaurora.org> wrote:
>
> The offsets for SDC_QDSD_PINGROUP and UFS_RESET were off by 0x100000
> due to an issue in the scripts generating the data.

> Fixes: ecb454594c43: ("pinctrl: qcom: Add sc7280 pinctrl driver")
>
> Reported-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>

Should be no blank lines in the tag block.


-- 
With Best Regards,
Andy Shevchenko
