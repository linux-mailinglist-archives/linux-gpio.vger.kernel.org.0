Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61ED13A25C2
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jun 2021 09:47:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229865AbhFJHtB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Jun 2021 03:49:01 -0400
Received: from mail-lf1-f47.google.com ([209.85.167.47]:38492 "EHLO
        mail-lf1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229845AbhFJHtA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Jun 2021 03:49:00 -0400
Received: by mail-lf1-f47.google.com with SMTP id r5so1701471lfr.5
        for <linux-gpio@vger.kernel.org>; Thu, 10 Jun 2021 00:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=udIxG5USSw+Hcr3E1grdoWUuEEeWgk3R6uxO7ub/bPQ=;
        b=sFkI8h5UtbeEw5k28cglEJ3LsGAseFbS9atLFrt9ABqkoOYJlq6O4bRdxG+uKhwphU
         kQVqz32mNenz0I1JIo4R9/zNb/oFemHz45oHIbv/pdIEnp/W60hBTWv0E2jt1FY4ppnW
         +bsnMPJ2fX/vw/pfaT7wMcSSfxDCzTcs+ddLjk4gwVXlXU6V4sJy89AuMm1nT+Nhc4ec
         axGTRcbu0pOZ6h/cDSKLLa0iM64bb90t2YAjlZqGeq67hcyPfEZf3G4LncC5tgZl40OW
         uFTSe50MiCTl2TXQXvg6SBtuWHpW+0LhzBalDeU/KCrWOlYiGql2VS+XXFJbgEQt02lb
         ZDWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=udIxG5USSw+Hcr3E1grdoWUuEEeWgk3R6uxO7ub/bPQ=;
        b=YX9iwtYsCo3A6omTI/fp8KsA+EXwNHEjnbC86s+GOzd5XGHc9dJx10DCVO0dF94aEf
         0bjNLnQ8oxXns+Lo9pqTnfD1v+ezmm5atsnDWfWhKlonx/910NgGiB/sgZpDBpb2FJDT
         mMq7DRATKrHOyeSSl+Ovef01WjwjrhIrVru80Vr7h1G7e/kO1dbevjTg5DbxkZ4rUdVy
         lobPAZdMa4CzuHRqWECyY9aZHAsoCHx5tulC0aHWerLDGaRuMCMEU8O+ewnZp94enCJc
         XJlDonN8aCofV0hwVQoHtgMdFrvbv0EKh29G8SQ+PsPV2uVkQ5eP0/VLxs8SL2cpbkGO
         iaqw==
X-Gm-Message-State: AOAM5311CE0AwdVwwS2Ja8NKiL9WTbCp3/88KpSKihf2zdEmjSh4HeUh
        f73vOjObkD+tDOuCibdooLs4L6FDL0P+PNASf8GyNQ==
X-Google-Smtp-Source: ABdhPJwTaf7BDlzSV8wd1tReN8yNPXxtdIQoWMszkevetT+Bp801TF6XeJPesi9NU+QNjo87y7H+NxG/N+nzdhEjk8U=
X-Received: by 2002:a05:6512:20c9:: with SMTP id u9mr1065275lfr.291.1623311164062;
 Thu, 10 Jun 2021 00:46:04 -0700 (PDT)
MIME-Version: 1.0
References: <1621578615-4613-1-git-send-email-skakit@codeaurora.org>
In-Reply-To: <1621578615-4613-1-git-send-email-skakit@codeaurora.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 10 Jun 2021 09:45:53 +0200
Message-ID: <CACRpkdb=+XOeSco22hXdYr=PTfPS6OFnWArBL3urU5qPf735uQ@mail.gmail.com>
Subject: Re: [PATCH V4] dt-bindings: pinctrl: qcom-pmic-gpio: Convert qcom
 pmic gpio bindings to YAML
To:     satya priya <skakit@codeaurora.org>
Cc:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kiran Gunda <kgunda@codeaurora.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, MSM <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Satya,

On Fri, May 21, 2021 at 8:30 AM satya priya <skakit@codeaurora.org> wrote:

> Convert Qualcomm PMIC GPIO bindings from .txt to .yaml format.
>
> Signed-off-by: satya priya <skakit@codeaurora.org>

For some reason this patch will not apply, I already applied the
two other patches, can you investigate and/or resend just this
YAML conversion patch, including Rob's review tag?

Yours,
Linus Walleij
