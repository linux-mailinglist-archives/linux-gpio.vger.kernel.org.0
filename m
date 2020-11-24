Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 047CF2C2026
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Nov 2020 09:38:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730553AbgKXIiA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Nov 2020 03:38:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726942AbgKXIh7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 Nov 2020 03:37:59 -0500
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41A3FC0613D6
        for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2020 00:37:59 -0800 (PST)
Received: by mail-lj1-x244.google.com with SMTP id y7so6149396lji.8
        for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2020 00:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2H8XWRLs/cbmJeRBTAh4/48CwYXMne1DsJ3h7TEz2GM=;
        b=j82cKN347mqaeqLKt04crgSBJJhiSMO8zoQY1YHiSWBV5gT/+AAOjpGTyfh+o9Q3mc
         KHFXiUvWy4L8mloe3qazA7AGbiCOUmr9MI79Q8Qorm6PeTTm7W3gZgRNltxjOQjEyIaV
         4yfbQpXwQYNq0j0PqKL1VReBP4VB7paculjpmhWTKHB/ToDqwDyfAMXNgYE7uGXZilfe
         kMDoIaflhclMeVnN++SvYryLZ1aI9eBBg2U4nzuo2aMqgT4KwU/L0BiEvKj/Gh4JQwfY
         hrsNjQFpooCvU9CbZVDQUeFqZLbna0MQ08epM/Lx2YIiHqjlHEYsRgzvYxyfT11OnGue
         MOcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2H8XWRLs/cbmJeRBTAh4/48CwYXMne1DsJ3h7TEz2GM=;
        b=Ylp6SeqJEL4UwsrN0z1JN7HloA0Bm8gUNAGyg2kCDZ6dr8NlXEYHsrWXMrJIoONIc1
         oXe7xttYvlrocEN3JQXtXSmIkiv5UO7GGQS1C4O6G09gNO9RGSYTcS49oWQ+ly65UKlq
         TkqbrqqJsgpYphlwyshJKqznOiJTMN1IOt6m9NgfLIZXppsQ93XXS4Ph24BH0xiqKJEv
         o7x+K+oljbQd4lo1Dgc2ZVD3HFbzXagGvhHnLR6MYnRI+kScvQp6DWjasdtoS5qoxT/S
         oKW/MwIQ/5zanvrLn47d4/b6Axqrlkcz4ypSO7ZCc60+MmX1nSMI+hZmTA977w7w9Sxx
         IgwA==
X-Gm-Message-State: AOAM533CKCMyoqk2IeOZP7CNtMkAikVJwuITU6tu4QKEhjYl4Ym4sQs/
        yl5bdO2J5fIc3nv0wYWh8Zz2jdOOjOq/vAKi1hDdjg==
X-Google-Smtp-Source: ABdhPJxGrELU+sr+1kgkl/qdZ/XZwXL4XRm5dMDFIKZ0RZe+Cq1K9uCu5AlgW+v6i3cT7KOpEXWCGVfu8zUwNKOSIdo=
X-Received: by 2002:a2e:93cd:: with SMTP id p13mr1323677ljh.144.1606207077648;
 Tue, 24 Nov 2020 00:37:57 -0800 (PST)
MIME-Version: 1.0
References: <1604570192-15057-1-git-send-email-rnayak@codeaurora.org>
In-Reply-To: <1604570192-15057-1-git-send-email-rnayak@codeaurora.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 24 Nov 2020 09:37:46 +0100
Message-ID: <CACRpkdYcdrC+xbaoZ6dEePtRcD3hqAdotQq=jddOC8=OMa6EFw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: qcom: Add sc7280 pinctrl bindings
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 5, 2020 at 10:56 AM Rajendra Nayak <rnayak@codeaurora.org> wrote:

> Add device tree binding Documentation details for Qualcomm SC7280
> TLMM block.
>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
> v2: Consolidated functions under phase_flag and qdss

Patch applied.

Yours,
Linus Walleij
