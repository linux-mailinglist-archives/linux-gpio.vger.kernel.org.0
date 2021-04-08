Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45D17358F71
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Apr 2021 23:49:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231862AbhDHVtg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Apr 2021 17:49:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232158AbhDHVte (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Apr 2021 17:49:34 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2CCAC061761
        for <linux-gpio@vger.kernel.org>; Thu,  8 Apr 2021 14:49:22 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 12so6336157lfq.13
        for <linux-gpio@vger.kernel.org>; Thu, 08 Apr 2021 14:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gSwI2lrbGQqYSE+wLPKWCV1qT/p0lT6GqXHXDIlQOJc=;
        b=quFQWgR1m8YOd3BwXP4FP8AeaPoqjQcIb4O1u3MDQbNvRUfn+H2tc0pVusbqMAAsKC
         PfpIQMPUHmPKevmIGluYPYdCBdNv7u9SKbkfoqa6pIghBIGA432zJt/BREBZM9r/dvhc
         S80vE7f3xs1PC0GFADzcKR6cf/mBiAVpdt3/7+RV2+Rjv+70x9ZGkORvzHxcUXPwKimP
         hKQSjt8uwNhKFRiBSL+yYzlsKsF182Ji2bCKF4vYO3lW7tvyVy0qcJkuVt/JA68jS74O
         1UeYOufBGbK7VV5t48UK8d0+wI9mHNHNoqluS9Cyv+qvbhnxAMzHKu9+FfdstQ64YTUD
         KOyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gSwI2lrbGQqYSE+wLPKWCV1qT/p0lT6GqXHXDIlQOJc=;
        b=mJIEiTqoW8e4Ss/cZY6DJdTo9U2hpMVkr1LuqRwgE7f4fpcuknxYM3ZQdvghKq17bD
         lcl0Ep6xs9QI0VjjVpq4sU6EKARR9MPIlhfKjiVs6SWsnux3BNJLOphzY6JYiwbrUWZw
         Bn01/6793sQpNjLwqYowtYCXfimcaZGDCl0vtuLCebCfNst9vtuoAeO/SdsIUwyi6jW/
         P+i7Ua4aGza71a7glk7RdIz45E747/VOaAg3aZ5k0vs/cUehzGrPSuHl7iF93qUhJC6y
         Ux5Ka0RWy47SDGJIO8QbUyDh06hFyC3iUlfaOfU6u2U7Z9ZXhrThjQFWSKJVo69tcM4m
         1ySQ==
X-Gm-Message-State: AOAM531jMyAmaIQRIU11Bpi7+uT1gO1alsCDMVJ6jIUzP9RJDp8dwXWV
        1xm9szBNtM9hy2/uyZLCQlBRFgK5bakUW78G8ehMNA==
X-Google-Smtp-Source: ABdhPJw5wsKEEQOsjg/2rKjxW5QNKY8BRxjWlBSbKGQGw3XZ34NjyVYzkj0g0ldiHhLS3mQQdOsxgtpqCEicxcIReaQ=
X-Received: by 2002:a05:6512:c0b:: with SMTP id z11mr8492618lfu.586.1617918561398;
 Thu, 08 Apr 2021 14:49:21 -0700 (PDT)
MIME-Version: 1.0
References: <2be34cc205ae96d40b04a9efdcf9287d5da9d1c0.1617901945.git.gurus@codeaurora.org>
In-Reply-To: <2be34cc205ae96d40b04a9efdcf9287d5da9d1c0.1617901945.git.gurus@codeaurora.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 8 Apr 2021 23:49:10 +0200
Message-ID: <CACRpkdaOj_fdRTqjbYnL7EJo2CKSmw_8k8A_URWVyCs0iSGTmw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: qcom-pmic-gpio: Add pm8008 support
To:     Guru Das Srinagesh <gurus@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 8, 2021 at 7:25 PM Guru Das Srinagesh <gurus@codeaurora.org> wrote:

> Add support for the 2 GPIOs present on Qualcomm Technologies, Inc.
> PM8008.
>
> Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Guru Das Srinagesh <gurus@codeaurora.org>

Patches applied.

Yours,
Linus Walleij
