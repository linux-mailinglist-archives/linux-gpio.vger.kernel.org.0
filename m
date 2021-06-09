Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF85F3A1225
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jun 2021 13:16:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237306AbhFILSu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Jun 2021 07:18:50 -0400
Received: from mail-lj1-f169.google.com ([209.85.208.169]:41967 "EHLO
        mail-lj1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234508AbhFILSt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Jun 2021 07:18:49 -0400
Received: by mail-lj1-f169.google.com with SMTP id z22so15205101ljh.8
        for <linux-gpio@vger.kernel.org>; Wed, 09 Jun 2021 04:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=olC98MYXFE09NuYvJ2tPm+RNCwhGWVV3/05T5xhu3Uo=;
        b=YH8vcYA/ZwssAN7fISdlBtvdYmubomn+aIrUeOrb6h5HR6KTFux/z5CZKE3EqoTuVJ
         NhAh0PmPC4aCejHrQ+moJ8vtcppENaCRfexCkmn67q0PCyJ9wm2y+URdfyZJ9PoDLFpx
         SrKJrPO8aRmQH2A9mAYoioo/tZCh3fpixvb2PBjaD6pUfA4cfjUiodtkDd+HiF3cGb+u
         /N3JlijaZNUvf/1de0fFSKbv6mPwq9Sbhg0Aky1J1dcahiNTn5TlKPdcHbJugRHzJY6M
         n6ThAuIQJiFlWUvLUKCbSQEkrNAKOwgA39ad2Lb8R4M0V/ZfspVI66apjpqR1TNU5H98
         vouA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=olC98MYXFE09NuYvJ2tPm+RNCwhGWVV3/05T5xhu3Uo=;
        b=gKLTJfrBHi+RDWIxpao5wX7TQnsq2Mj0LzX1y3TFg/wlicnR3G0t061kQD8o+rErLE
         KSBclJfw1YTGg5FEBbucNeHXo+Swm3YQUqhiZme0bz2L7LQyMeCZTnacEADvWD43+v1I
         J1XJP2NKTJ5912d1ASfdQQnQ8xKNvmRXemrFH1cdXzjzK7hdnzElNwV2vG8J1IFi5Wz5
         p88/pUbBeKFb+urLscFUq64j50yP3pCFAsD0F7Bc6yz0gOGiLHdjdd3V2QCcvp9dsdAO
         kSwZ5ecVq8Fk1OFP93JUQKSYj+Vo6j7g1X5NDUdTqp3o2twvjQcqka9RJH2WVxHGRM6u
         f/RQ==
X-Gm-Message-State: AOAM533J36w3/L7roNW21rkN86vCtZpIAtQ7t6/18lXG0ACS9Wd9UWYg
        x99mhJIA57AimH/ghLzPxMT8/lLMI2uByrt4pW3w2Q==
X-Google-Smtp-Source: ABdhPJzZt2f4CMFKxy0STGsifmYNUzF59Rr0w0JqTC4qSDcJkvMUJKmzmZNc3fVhOB/7MclmzbsJLeJg0V/ddbUMUBc=
X-Received: by 2002:a05:651c:1501:: with SMTP id e1mr22755386ljf.74.1623237354584;
 Wed, 09 Jun 2021 04:15:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210608180702.2064253-1-bjorn.andersson@linaro.org>
In-Reply-To: <20210608180702.2064253-1-bjorn.andersson@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 9 Jun 2021 13:15:43 +0200
Message-ID: <CACRpkdbSRWMPRANKNQcuQ8p2V_2BUeXkJ2F=PeLNbyYwTYiV0A@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: Make it possible to select SC8180x TLMM
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 8, 2021 at 8:07 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:

> It's currently not possible to select the SC8180x TLMM driver, due to it
> selecting PINCTRL_MSM, rather than depending on the same. Fix this.
>
> Fixes: 97423113ec4b ("pinctrl: qcom: Add sc8180x TLMM driver")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Patch applied for fixes!

Yours,
Linus Walleij
