Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D0703E8FF8
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Aug 2021 14:00:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237453AbhHKMA1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Aug 2021 08:00:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236497AbhHKMA1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Aug 2021 08:00:27 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D1E1C061765
        for <linux-gpio@vger.kernel.org>; Wed, 11 Aug 2021 05:00:03 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id c24so5090168lfi.11
        for <linux-gpio@vger.kernel.org>; Wed, 11 Aug 2021 05:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QntYPwFND9ivHl8sCJvuIY4mpIehwKkRWinAMkSwKQI=;
        b=Q0Rl26bYxsSXpjb/CTuzjeMm5nCjftG0kx2CothuzSLlucNNJW0/NiYUD+62g5T/7F
         Z6Kfdw4iijdQB++sg5aqqT5FQ0Tb3T5im+W0cIQIlxEl/a066C0h+hS3qpvE4YxDcHjf
         6jBnQ1Rd6eFzB3xnkAlhaTdmU88Vw6bFzINRxoDxd0bGZTCqRQIG7K+by4B9VecmTBmd
         md+lPrseDhnPsickBg5Ex4+ZC+BL370H+N8yZipMuK1n/5klrHg5Zp8AdANs3POX0LYd
         KR8d5D3i3fl6Lev3XJrkthKG2Y/zZvfBJWQH7X8WGaIvMNexPiteMDzi85vfI244aZFe
         uaFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QntYPwFND9ivHl8sCJvuIY4mpIehwKkRWinAMkSwKQI=;
        b=a9gsfx3QKrvgPMN10RgmczFKhRty2IoBMkWXgrTXX5w06T9v36tmoIVp6loPRvXeRM
         xwV9Umrp7QCYIbc2Jo+9tvtJiyKPMxz8NqIau09sp47+saIUA6H/KwSlKkEGhm0WNezy
         g/Dm4iwrR0MK7T6Bcru/dICTE6lj6c8bQOq/GTB1CqYEdX68CNakUbTvof9znD3ifYzr
         n0mHn3h8wMxxFJOptwO0TJfZD1LWPIPk6FSZcAvXx3AcBtW25iDxJETgtH1Lj5VewT0/
         xkDKMNntXquDNeTSwkBy6dtx9fmcQAS336wR9cdGceVl7stFJjF/lVaGdsKI3lg5yKoU
         D+HQ==
X-Gm-Message-State: AOAM53211VNRG50X4j2JRmG7W20ghr0HKOFLnXmkt8Hx4Ulsns4RkSr0
        ezCV6bdfOqD/KFyYmLg83tlRLsBBmChD4PNemqx7vg==
X-Google-Smtp-Source: ABdhPJzqoMybmK8uaattKPYwTnFX/Xb8AOXz9OVi7tq94+ZUBT0mQ9v5TUujLzeL/jhAn7u4PSiH8KInRYVs+H4KkXk=
X-Received: by 2002:ac2:5d4a:: with SMTP id w10mr25656028lfd.529.1628683201902;
 Wed, 11 Aug 2021 05:00:01 -0700 (PDT)
MIME-Version: 1.0
References: <1627910464-19363-1-git-send-email-skakit@codeaurora.org> <1627910464-19363-4-git-send-email-skakit@codeaurora.org>
In-Reply-To: <1627910464-19363-4-git-send-email-skakit@codeaurora.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 11 Aug 2021 13:59:50 +0200
Message-ID: <CACRpkda6f0QTuW2p13OyPDer4B2NgAMWC5FMN3XrGx5NfL=zUQ@mail.gmail.com>
Subject: Re: [RESEND PATCH V7 3/3] dt-bindings: pinctrl: qcom-pmic-gpio:
 Remove the interrupts property
To:     satya priya <skakit@codeaurora.org>
Cc:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Das Srinagesh <gurus@codeaurora.org>,
        Kiran Gunda <kgunda@codeaurora.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, MSM <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 2, 2021 at 3:22 PM satya priya <skakit@codeaurora.org> wrote:

> Remove the interrupts property as we no longer specify it.
>
> Signed-off-by: satya priya <skakit@codeaurora.org>
> Acked-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Patch applied!

Yours,
Linus Walleij
