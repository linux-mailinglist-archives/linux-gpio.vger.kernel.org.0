Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BE94409D8A
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Sep 2021 21:58:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347687AbhIMT7I (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Sep 2021 15:59:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347656AbhIMT7H (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Sep 2021 15:59:07 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 541D3C061762
        for <linux-gpio@vger.kernel.org>; Mon, 13 Sep 2021 12:57:51 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id c19-20020a9d6153000000b0051829acbfc7so14996171otk.9
        for <linux-gpio@vger.kernel.org>; Mon, 13 Sep 2021 12:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=9YZhWzpxyNUlpJr6t9C7C760t9g71yk4DJVlf+sXdZM=;
        b=hWbEgFUQr0H4+RS43yKtrL13njKGDIJjG7hBi4boLfE5K+40onnCN6rHryoGeN+Uje
         OBy3ICY9wngqcKvkc707AUoV+nEjWLZZ8rDALYis/uYWw7MgsXc4w7915ID7PERll0cx
         tWO8j3WbgXDES18sBHKpdR4JNFbW/TOc1SGm8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=9YZhWzpxyNUlpJr6t9C7C760t9g71yk4DJVlf+sXdZM=;
        b=It2UwhJA7+4og4PW1znuf0shqasa9wUne7hMu0oIcYJ53tmsBJ4e2jYVVF/ibRJ3k0
         LFVwijrOnXloUMyd9Li1WA9qEfIoIcxwRrl0r1qMrkvmQAW7j4DkEtcmKjRiZnQI2Lv9
         u6TfMvWkOTSRL6Ce9efWmPjgJUoiT/Ifu6Lhnq6sgj1U1uLsS/iOlbi9NQHPqJIEsdpR
         BzPbssStN46zhyxwD1lKNBnVH6ZRkCGM5rJOsPZjM4e+mU8FNRv90zMWo9DEJWri4ZEg
         wJUNJxupmfd17/VILU9mSakiGj7agPaIfTL51KGaLUKuQrkG72g2Yz/ojZKTzcdO6JaQ
         evEw==
X-Gm-Message-State: AOAM530Z+jklC1977lAXw/HSDphjS09oahhpQkvxeOHlUVaRLB14SGsj
        4ig7q/FyJgBnVB2oIKrN0WeCtAHfabQQtARQmPiSWw==
X-Google-Smtp-Source: ABdhPJwnpthj3s20/xMB/ipgXHexaFXvqlqJtzTI13dJKskHQx5dndaLmSeRZZ5+JUjj+dET/P9VkISYhGwU5Xiu1HA=
X-Received: by 2002:a05:6830:1212:: with SMTP id r18mr10783901otp.159.1631563070744;
 Mon, 13 Sep 2021 12:57:50 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 13 Sep 2021 12:57:50 -0700
MIME-Version: 1.0
In-Reply-To: <1631167288-27627-2-git-send-email-skakit@codeaurora.org>
References: <1631167288-27627-1-git-send-email-skakit@codeaurora.org> <1631167288-27627-2-git-send-email-skakit@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Mon, 13 Sep 2021 12:57:50 -0700
Message-ID: <CAE-0n50TizsABPRSKp87RD9eU_0Yti+16ND05BX4QFJUoHKuCA@mail.gmail.com>
Subject: Re: [PATCH V3 1/2] pinctrl: qcom: spmi-gpio: correct parent irqspec translation
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        satya priya <skakit@codeaurora.org>
Cc:     David Collins <collinsd@codeaurora.org>, kgunda@codeaurora.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting satya priya (2021-09-08 23:01:27)
> From: David Collins <collinsd@codeaurora.org>
>
> pmic_gpio_child_to_parent_hwirq() and
> gpiochip_populate_parent_fwspec_fourcell() translate a pinctrl-
> spmi-gpio irqspec to an SPMI controller irqspec.  When they do
> this, they use a fixed SPMI slave ID of 0 and a fixed GPIO
> peripheral offset of 0xC0 (corresponding to SPMI address 0xC000).
> This translation results in an incorrect irqspec for secondary
> PMICs that don't have a slave ID of 0 as well as for PMIC chips
> which have GPIO peripherals located at a base address other than
> 0xC000.
>
> Correct this issue by passing the slave ID of the pinctrl-spmi-
> gpio device's parent in the SPMI controller irqspec and by
> calculating the peripheral ID base from the device tree 'reg'
> property of the pinctrl-spmi-gpio device.
>
> Signed-off-by: David Collins <collinsd@codeaurora.org>
> Signed-off-by: satya priya <skakit@codeaurora.org>
> Fixes: ca69e2d165eb ("qcom: spmi-gpio: add support for hierarchical IRQ chip")
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
