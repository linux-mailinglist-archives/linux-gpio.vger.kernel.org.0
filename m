Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C53E6336825
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Mar 2021 00:54:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234086AbhCJXxG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Mar 2021 18:53:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233927AbhCJXww (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Mar 2021 18:52:52 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A61E0C061761
        for <linux-gpio@vger.kernel.org>; Wed, 10 Mar 2021 15:52:51 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id p21so36560895lfu.11
        for <linux-gpio@vger.kernel.org>; Wed, 10 Mar 2021 15:52:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BzLyvdwWc/rFyWA+5uvLR6r7TwiPqua5jBHXyxktV10=;
        b=F7HoYPZBSxoc8wtgBcb7q9gjm0pGLEMhd4dOgfFbh4d+kziEaBFmGUW7IQCC57nB9g
         Uia4ViDlZWCgsXn19m7QV7xvt5iijW1jRnqUT4amgFXxaZYvqkaQBGh5s6GEWAVkeNgC
         H5D8HYJ6p/KCe91sIrDJD/pm0FobZSOlhPWmUCpaaWfTj8lDASTm9YerYbVF77bnnPSY
         0DUV356Xre9UwSwZo8K+n+7dczmdxkxPMYstid8j8b55H4GzRWhBs12+mVJR/hwCGYjF
         cRGKVeAx4TGhSlsayJG4btr61b64WA/NB/sQbdBe1ee8t5v5jI3ceLan2mlcNkkmTADf
         UYMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BzLyvdwWc/rFyWA+5uvLR6r7TwiPqua5jBHXyxktV10=;
        b=iloXdegQ5ykqE+xIlnm98EBSPiG2SRPMzMeuhPV8fGXrwHo5WHCGDfIeZKq9Nk9Neo
         CjbXS5gR4/bafaLQRkU6zFaoHG3OtSQeOCxJ2zS0RN2/+yfpvdtNOPzyrmEJz18VgL8I
         aBjyj37WhTrdXhZCpcCdwMU/Sh09a0i38PDiNdK66xybCZGz1AhyhX03DUCBxpAxVV3A
         kPdpeye8BpQWFBFui0ngPk9Y8FbiEDLb6iTZ5lyr7Qge0cHPq0dRISvn/+02rehNYOtW
         vLicrv3AjhWfFYjWrJNdHz1YxWpc0MyEhcJhBOK0lfXIQkhjIqCau7l+FLiuM7htSHV6
         7Kqg==
X-Gm-Message-State: AOAM533VkUznxGuDgvRfDImPdkhz+HbUKS9uNrg5aM547zOdxWwSuYoh
        e3Ev3jBlHYcogHUVPAx8z2YC4/aoUSfzOsNGhkNmmA==
X-Google-Smtp-Source: ABdhPJwqs0sxV6VsHR1Hs60DHj4TeJaPb4ZAlv2iodfIoWv0Q3zv5u5E1DAoeZNKR3eBRfEUDKthuC2Ky2XVrDhAzQ0=
X-Received: by 2002:a05:6512:243:: with SMTP id b3mr578154lfo.529.1615420370141;
 Wed, 10 Mar 2021 15:52:50 -0800 (PST)
MIME-Version: 1.0
References: <1614662511-26519-1-git-send-email-rnayak@codeaurora.org>
In-Reply-To: <1614662511-26519-1-git-send-email-rnayak@codeaurora.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 11 Mar 2021 00:52:39 +0100
Message-ID: <CACRpkdbNDMjDo1_gBGaVsVztNCgrHv-t3yuHvtQa4BkPn=NueQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: qcom: sc7280: Fix SDC_QDSD_PINGROUP and
 UFS_RESET offsets
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 2, 2021 at 6:22 AM Rajendra Nayak <rnayak@codeaurora.org> wrote:

> The offsets for SDC_QDSD_PINGROUP and UFS_RESET were off by 0x100000
> due to an issue in the scripts generating the data.
>
> Fixes: ecb454594c43: ("pinctrl: qcom: Add sc7280 pinctrl driver")
>
> Reported-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>

Both patches applied for fixes!

Yours,
Linus Walleij
