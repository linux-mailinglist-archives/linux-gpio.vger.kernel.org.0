Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39FAA1FC043
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2020 22:53:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728074AbgFPUws (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Jun 2020 16:52:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726303AbgFPUwq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Jun 2020 16:52:46 -0400
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E37D4C061573
        for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2020 13:52:45 -0700 (PDT)
Received: by mail-ot1-x341.google.com with SMTP id n70so17070661ota.5
        for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2020 13:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1mDaBoAYNlImmGKdCyzs30Ab2CK6GaNdKX0Jt8lvk4Q=;
        b=NlfyTdXcuRk+bHqUw+iSQlY+Yp1tZiUjSeOcpP040ruHIUtzEyafQn2O0GlSn7gYeL
         7zHVQjG9C9jWGTbTF3esb4X57Pwk4YUnUyCBcQkM53dx293ZwGNIXK+ItM/IYIuYFfwi
         Tgh+QD873HT3EHOdSG6ryAhurDSG7jATKMwanI5nOGb4ckZpJDg+8gUZ5AtbgIsACytK
         za71wGu8CC+u6oCoxiGLOUpgt5E91RAOhdv90F6y9lE1VYMGnZ34mU6D9A5ODCBpMhl/
         +wSeCnpZeuB4NhP2YYyHpXgVNoZi6FdoAdKqdqF8ZOxCxXiNu5ob8xDBytu9hCeMnQ9o
         qU+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1mDaBoAYNlImmGKdCyzs30Ab2CK6GaNdKX0Jt8lvk4Q=;
        b=udvVOh7cArYWH0+Kgf3WJYmm7We0aLT/nhMZ13xuuz/mrq7DmfrI8Uzrox5gD0RsjX
         hrCVFcLykk+a3DU2XeNeDUNJlSl7kUznlJB8ZO0dc+d5utjqdl9lkVwPYFzyiUwKD8ZJ
         s7amdm9sTE90LMnVPWOlhMDlkXs+CAgpvaVQEvpj4eJR22PtzT95DuEshTWNnpCmAWvA
         WUTIPHrlmcLz9I1EYfCXP5r7sqjvBAgpvQM7vcGmZGrMv7ICViBW5BEU3BpaTNN7ju/0
         3MeAzEBxxHm/MaUF8T3yftTjG2osK0aBB68E7CxZiEV6ehEdT+uK2Z3JpO5DD4I6M0Xv
         3tng==
X-Gm-Message-State: AOAM532+gLsobHwnYrU2lCEyL7F4XQ2/rLERFcvISyiWPgX28xjefDpt
        cq4Jca4j5gaAECEwsmAEcWqSm/Uh3vzap9cxR1+y6Q==
X-Google-Smtp-Source: ABdhPJwZnDuYF1+ScqyNsWThdN1UjAZVIPE//LsOe27AsBQ3nI7GPtgCaXGfrrPsASezMO6Zgd4KdSIOrpniIxtDmiQ=
X-Received: by 2002:a9d:1296:: with SMTP id g22mr4304025otg.102.1592340765193;
 Tue, 16 Jun 2020 13:52:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200616061338.109499-1-john.stultz@linaro.org>
 <20200616061338.109499-6-john.stultz@linaro.org> <0be86735238a0f8b0c25934e2ed39eee@kernel.org>
In-Reply-To: <0be86735238a0f8b0c25934e2ed39eee@kernel.org>
From:   John Stultz <john.stultz@linaro.org>
Date:   Tue, 16 Jun 2020 13:52:32 -0700
Message-ID: <CALAqxLUZBdiLBRcp1GW9rGxt1KhgNVQ86MuPXZcXdx2wFLZk6w@mail.gmail.com>
Subject: Re: [RFC][PATCH 5/5] firmware: QCOM_SCM: Allow qcom_scm driver to be
 loadable as a permenent module
To:     Marc Zyngier <maz@kernel.org>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Joerg Roedel <joro@8bytes.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Saravana Kannan <saravanak@google.com>,
        Todd Kjos <tkjos@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        iommu@lists.linux-foundation.org, linux-gpio@vger.kernel.org,
        Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 16, 2020 at 12:55 AM Marc Zyngier <maz@kernel.org> wrote:
> On 2020-06-16 07:13, John Stultz wrote:
> > diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
> > index b510f67dfa49..714893535dd2 100644
> > --- a/drivers/iommu/Kconfig
> > +++ b/drivers/iommu/Kconfig
> > @@ -381,6 +381,7 @@ config SPAPR_TCE_IOMMU
> >  config ARM_SMMU
> >       tristate "ARM Ltd. System MMU (SMMU) Support"
> >       depends on (ARM64 || ARM || (COMPILE_TEST && !GENERIC_ATOMIC64)) &&
> > MMU
> > +     depends on QCOM_SCM || !QCOM_SCM #if QCOM_SCM=m this can't be =y
>
> This looks a bit ugly. Could you explain why we need this at the SMMU
> level? I'd have expected the dependency to flow the other way around...

Yea, so the arm-smmu-qcom.c file calls directly into the qcom-scm code
via qcom_scm_qsmmu500_wait_safe_toggle()
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/iommu/arm-smmu-qcom.c?h=v5.8-rc1#n44

So if ARM_SMMU=y and QCOM_SCM=m we get:
drivers/iommu/arm-smmu-qcom.o: In function `qcom_smmu500_reset':
arm-smmu-qcom.c:(.text+0xb4): undefined reference to
`qcom_scm_qsmmu500_wait_safe_toggle'

Do you have a suggestion for an alternative approach?

thanks
-john
