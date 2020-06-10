Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B97F11F52FE
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2020 13:20:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728436AbgFJLUf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Jun 2020 07:20:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728434AbgFJLUb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Jun 2020 07:20:31 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BF89C03E96B
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2020 04:20:30 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id 9so1964673ljc.8
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2020 04:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UA+t1x4Dga/tMDaCbSxJN+1nIvqIM3JZf6UcWWk8kmo=;
        b=gdtWK/yZABe0lUpJ9U8mFFE3Vs9yTGzaV1EhCsTzgd6NW5ObciUND4+CGf6z+1Mhql
         ejC5k2E9P7hIBYCtO7+zwlizHH/ra6rBpu/f2+mYyopLdcKVMfCNqFFeXvYBktYpZrOw
         55IjwAx8lXD4cI+nBbGNO6z1BBPSXX1bg0/VY2B+E02NbGWCtvboe9shxa7jw+9mvPM+
         cBgrsVEHN6uDCmEsOYGB1y/Qt4xwKGNWApiJCZWnRJTNZll8OoHtA1bd8qapY0N2DADZ
         gl6sHho/qt+wg5HvTpnAoaxJS/qjNIaMKtc1jI1hoa2K6cdjVOmJeUVS4s+yQDSFPHDX
         dcVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UA+t1x4Dga/tMDaCbSxJN+1nIvqIM3JZf6UcWWk8kmo=;
        b=s2rERb8BUSSvmROyVXf3beJCErH1MGjfbWcW6yXCpj/LBt8qR5/+eOfyymSbCBfBNJ
         7fLGD/dpGVAc+6F/m3h/Wbf3AF91gW8urCRfgm4uqRagnmV6zzlCe+uW8SLF6+Tqe2JK
         uuh6kXjrtbmaWRNUiJ61IJHeRukhQdwYkB+F9DvSYLWJ4eUKlTHZjrk5Z/R5Wef/t4mX
         ePqPdnAtEq6HJoFHXDCiSCs8lkOTqf4X/yQpKUaKjJd6H8GrhkbLyVPTyDuUSRdtqdNy
         EnZQ77JAA2iQJhkZToh5C9nfj5LE4w49bTIjoZbmi38Qc/DVZZo3k2oGlkDoG3/SVsbp
         9iew==
X-Gm-Message-State: AOAM530zlyLQ1P9ty0wsQgm9rFV12HQZQvGUAwkOPRSBptxzVaO7+gAS
        ZgwnggoS4PFBgjAtKGhsVgQl/O1rCYWmwgXN+xw0Mg==
X-Google-Smtp-Source: ABdhPJy6Tchl7ysZwtNi/eEjUPSPNVDD0sa3t6qjCUJamnzcansK7rEyXEHMuknf3B1HTdYvZcf8nmN0ZGLtKe6NFvQ=
X-Received: by 2002:a2e:350a:: with SMTP id z10mr1473467ljz.104.1591788028702;
 Wed, 10 Jun 2020 04:20:28 -0700 (PDT)
MIME-Version: 1.0
References: <1591613742-1768-1-git-send-email-sivaprak@codeaurora.org>
In-Reply-To: <1591613742-1768-1-git-send-email-sivaprak@codeaurora.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 10 Jun 2020 13:20:17 +0200
Message-ID: <CACRpkda7DEr7H4FzP95L_GYeigg1upGd+A0Yx+b4u+MD-mJVCg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: ipq6018 Add missing pins in qpic pin group
To:     Sivaprakash Murugesan <sivaprak@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Selvam Sathappan Periakaruppan <speriaka@codeaurora.org>,
        Sricharan R <sricharan@codeaurora.org>,
        Rajkumar Ayyasamy <arajkuma@codeaurora.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 8, 2020 at 12:55 PM Sivaprakash Murugesan
<sivaprak@codeaurora.org> wrote:

> The patch adds missing qpic data pins to qpic pingroup. These pins are
> necessary for the qpic nand to work.
>
> Fixes: ef1ea54 (pinctrl: qcom: Add ipq6018 pinctrl driver)
> Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>

Patch applied for fixes unless someone has objections it goes in after v5.8-rc1.

Yours,
Linus Walleij
