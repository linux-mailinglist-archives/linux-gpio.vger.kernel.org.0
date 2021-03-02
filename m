Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D17C32ACF1
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Mar 2021 03:10:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383821AbhCBVS2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Mar 2021 16:18:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351092AbhCBNbJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Mar 2021 08:31:09 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C79B1C061794
        for <linux-gpio@vger.kernel.org>; Tue,  2 Mar 2021 05:16:28 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id a17so23879729ljq.2
        for <linux-gpio@vger.kernel.org>; Tue, 02 Mar 2021 05:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=w7TMxO/D7a8csr+JUQ9kpEy7RKNnYl515YUs0lqH6AQ=;
        b=kpyPJ/xL4he3UejKB1Yg7LMDZ/4N3d/Jv8MsH0eBoX2a1nhUMsqMFENsdePu8i8v+I
         VKgI+BsBfJ3yjbJBWjTlGF1C+bUNJMKawxkz4QqEEA1+AM3gMTxKdknG+MszyKQ/E9kj
         luKyQvs0eSzodLiUNIqS0autQAuSluYfSKIE6+bQ+Fa7ZMqFvc10KYLCQrSxOQnD99Mn
         QYmkKscHuLjwB52OY073RDQS11o0xFLv5vodbmQMPkyMShWhBF2Z5OPFZJ3BzQplrQlI
         X2tBmvi975yCX94IjdKTQpTXQN+ouCCZhH5E2HwsyZhxuUfxYnNhUzshisz2/UYUqQpy
         yzTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=w7TMxO/D7a8csr+JUQ9kpEy7RKNnYl515YUs0lqH6AQ=;
        b=CXtobicgh73zaTgJHwnHDFq1M+sUsDcy+QbVj/8uHOnagEVIITj9gfLKHGakocQzTA
         njo1mgQNVl+UAjhJLKoY/2uifXNSdkJQ53gWPS4foM4kbQ2753GId0TOe5oXPMGOdEnp
         GD+p64fEa9CLtADB04e2VMPVxwDCB95lI6yUFvynbLSfBwrRMdgDc+DduxGrTfFPiFTJ
         eFDYDzYz0KRhV7WJkI06qI3XAbu/T88hB6g62G41Z4N3+xDJZ4Y0NtSdc2C7p+ITiKQ6
         PwPQL7VfbwkAlrCLV1bMYjySYu1UTuI3vtUF3SjRefLlxSkSjxy3kaVXKw6dAanK4Qyf
         RL5w==
X-Gm-Message-State: AOAM5333ZquXNijl13Amkq2gWg9f7RrRm93tOasMbCa1865LuvZnXGiw
        Hp7KmiGwM0JEfaSHb54dwJZC7IdRwPCHp4q9MLOmWA==
X-Google-Smtp-Source: ABdhPJwLz47BG52rBTGPeD1OfU09SQGX018BFmLiaSkLzxHfaN66OaFtwRNIy6YfAjwqwAxOmn5sbqQHJadbpIbGXUI=
X-Received: by 2002:a2e:9754:: with SMTP id f20mr9797729ljj.200.1614690987196;
 Tue, 02 Mar 2021 05:16:27 -0800 (PST)
MIME-Version: 1.0
References: <1613105974-28181-1-git-send-email-rnayak@codeaurora.org>
In-Reply-To: <1613105974-28181-1-git-send-email-rnayak@codeaurora.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 2 Mar 2021 14:16:16 +0100
Message-ID: <CACRpkdbJ=4pctwDX9CSurkQC37TGF9KdUOkvTicspsqqS43kfA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: sc7280: Add GPIO wakeup interrupt map
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Maulik Shah <mkshah@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Feb 12, 2021 at 6:00 AM Rajendra Nayak <rnayak@codeaurora.org> wrote:

> From: Maulik Shah <mkshah@codeaurora.org>
>
> GPIOs that can be configured as wakeup sources, have their
> interrupt lines routed to PDC interrupt controller.
>
> Provide the interrupt map of the GPIO to its wakeup capable
> interrupt parent.
>
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>

Patch applied.

Yours,
Linus Walleij
