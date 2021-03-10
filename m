Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA896334C47
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Mar 2021 00:14:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233271AbhCJXOR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Mar 2021 18:14:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233007AbhCJXOK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Mar 2021 18:14:10 -0500
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEAB4C061761
        for <linux-gpio@vger.kernel.org>; Wed, 10 Mar 2021 15:14:09 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id c19so19552869ljn.12
        for <linux-gpio@vger.kernel.org>; Wed, 10 Mar 2021 15:14:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gKBkQ4taidvPT+w4EteeOYBoZyJgs8TNZ1BWL29YzFc=;
        b=Na0VWH/+PqDpdj52pR54r6QKfmjl0otFfewiwoGPWY7bV4Z9bvdJxvB0OkE/p4WqfJ
         1v7GHpj/rojgQYPqHow4vDV3l3nt0JFX5yhWqzjg/+CmMAJTE1+OIGfQmUwMKOHf+6KZ
         UtrlflzGefkZwhelEQPKARaUYugjC6Rnvcx5SY1T9Q/OL5di0DReCY2AyCXL4ZMyy51Q
         5MNweZBaJvl7t7l//uP/i/O3bPOv2i3I16HRVT3FLBFaD0O64okVhKuzaTe6+RhoS7uD
         fyXOmvauudfuSfA0bfgNXDanTiFL0dR+742do0LbDv3FlNJtyhGDKw3cDZWQ8fr+MWba
         FFaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gKBkQ4taidvPT+w4EteeOYBoZyJgs8TNZ1BWL29YzFc=;
        b=GMAxD6rpuMhfD536PMGVjYD529gvOsVUsX+4kBMQ9JmL2l629kSUQPdfS5SSn8IkGm
         BIct1546bxxIHnX4D1OlbMDmDrHpAphtqubPfH9R9c4+lEgtt5OieNlfm1wwcLHVCFzY
         CHRs8tyMuesGBYFQwLK9uc9tjSKbcEFerqisoRC9PZmyBdX78lX+72vYWm6s8sDVLR0+
         Iu/CCPGfrx4MqnjBTzI81Mb3sh+643lBuAEfZ3X+6FKJ4LdYLHSEtrj/dl5tOqHeHq/G
         yMV0fw8ZZuQ/zwF5MUgOpp1FOHQNszyODfZ9PFFpmw5CgFk78x0p+kfI6w9FDV0B+RQB
         TbnA==
X-Gm-Message-State: AOAM530K+LTThDI7QrBufMiBd/zeaAQ6BheE79t1dFpQurOqGNxcF449
        9Qy6Hp/igTXjO1QQ0eMwUCKDXF07cqXWR7U1fGeD7w==
X-Google-Smtp-Source: ABdhPJzoH1id55M9n/ktJsN7lcUfkG9Te/mK125L6n6433wa+UhQcuZo680G99PeyNnE2FxpoNANEDpH4kd79XP6jRM=
X-Received: by 2002:a2e:9cb:: with SMTP id 194mr3110524ljj.438.1615418048231;
 Wed, 10 Mar 2021 15:14:08 -0800 (PST)
MIME-Version: 1.0
References: <20210304194816.3843-1-jonathan@marek.ca>
In-Reply-To: <20210304194816.3843-1-jonathan@marek.ca>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 11 Mar 2021 00:13:57 +0100
Message-ID: <CACRpkdYn5sau7f4R3uNJe44nB3704pCQqnp0DysDinW1V=ZR-g@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: lpass lpi: use default pullup/strength values
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     MSM <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 4, 2021 at 8:49 PM Jonathan Marek <jonathan@marek.ca> wrote:

> If these fields are not set in dts, the driver will use these variables
> uninitialized to set the fields. Not only will it set garbage values for
> these fields, but it can overflow into other fields and break those.
>
> In the current sm8250 dts, the dmic01 entries do not have a pullup setting,
> and might not work without this change.
>
> Fixes: 6e261d1090d6 ("pinctrl: qcom: Add sm8250 lpass lpi pinctrl driver")
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>

Patch applied for fixes!

Yours,
Linus Walleij
