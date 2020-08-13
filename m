Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D7112434CC
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Aug 2020 09:21:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726224AbgHMHVJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 13 Aug 2020 03:21:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726144AbgHMHVJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Aug 2020 03:21:09 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63288C061383
        for <linux-gpio@vger.kernel.org>; Thu, 13 Aug 2020 00:21:09 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id u128so2361147pfb.6
        for <linux-gpio@vger.kernel.org>; Thu, 13 Aug 2020 00:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=Sb/qdUmtKdQcZzhXqvBHC/XQvL7lTUC7aHl/KOqJRQE=;
        b=U+LjHqdsm2Fo1v2iltmwYb6XwNstuN6jBf9ShIKaaSZSsYSdoPLw48TdXRfbxT3G3Y
         wQD4WcP1YNQXI5gbrKqNY4EL2Y+TNhEciZ/GLFlUFr0rgsFt4wQd35C+D2m0uUupNrHC
         52z7YOrrDdtvC37nsKqD2bf3CbWxN8FBzyoFE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=Sb/qdUmtKdQcZzhXqvBHC/XQvL7lTUC7aHl/KOqJRQE=;
        b=QCKLg2UdoD2lLCAkFcCoAV+k6AUeJ39r7+JNYHMEv2+Tlh6SEWDrY8/4id5ZbLdZeD
         moCoevl9o9TXUcQFyhQjmTgo9rOKS1/WIC0/Pa4G+Ou3+I1naC83BuAvfy/z5tzMVrJY
         p0rzn7SXLzD3a9b2qSQ+Q22FJz/MIS0aXg99n+/2aSqDA76UxbHKSGj9BzIXWHx+ZzFd
         cQVLNWKRH0ThNym/QPeL06UQDd3SNEo7GN5e5iaxHCmxAcJaFbNYju74soM2yMPNZSjD
         m7COBNfThOruCpX1CNcHODgyKtgZHmTGPPgBhLtrll4l7dQ/l2C/RZ/9QsLCQvQanqJi
         icBg==
X-Gm-Message-State: AOAM532ALggdyniyBFGkJF9zCdCZ1wLBQSdKPv2RRyXAcZveO3Ahmuga
        G7UfT5fKb7priYDwrWm1xhSAgA==
X-Google-Smtp-Source: ABdhPJy2w+s3WMM+RACGQk4X2svexIeUrVnHXOKY7zentF5GT3o4XhKrgauiSUlyuaaL3GLR2KfA6Q==
X-Received: by 2002:a63:5613:: with SMTP id k19mr2638912pgb.424.1597303268734;
        Thu, 13 Aug 2020 00:21:08 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id r28sm4575088pfg.158.2020.08.13.00.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2020 00:21:08 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <aa506a3d-3e89-08ed-2d66-7098f6e5af91@codeaurora.org>
References: <1597058460-16211-1-git-send-email-mkshah@codeaurora.org> <1597058460-16211-3-git-send-email-mkshah@codeaurora.org> <159717444178.1360974.6520145243224264090@swboyd.mtv.corp.google.com> <aa506a3d-3e89-08ed-2d66-7098f6e5af91@codeaurora.org>
Subject: Re: [PATCH v4 2/7] pinctrl: qcom: Use return value from irq_set_wake call
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, agross@kernel.org, tglx@linutronix.de,
        jason@lakedaemon.net, dianders@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org
To:     Maulik Shah <mkshah@codeaurora.org>, bjorn.andersson@linaro.org,
        evgreen@chromium.org, linus.walleij@linaro.org, maz@kernel.org,
        mka@chromium.org
Date:   Thu, 13 Aug 2020 00:21:06 -0700
Message-ID: <159730326694.33733.15791110829493100948@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting Maulik Shah (2020-08-13 00:17:18)
> Hi,
>=20
> On 8/12/2020 1:04 AM, Stephen Boyd wrote:
> > Quoting Maulik Shah (2020-08-10 04:20:55)
> >> msmgpio irqchip is not using return value of irq_set_wake call.
> >> Start using it.
> > Does this work when the irq parent isn't setup in a hierarchy?
> yes it works fine even when parent isn't setup in hierarchy.
> > I seem to
> > recall that this was written this way because sometimes
> > irq_set_irq_wake() would fail for the summary irq so it was a best
> > effort setting of wake on the summary line.
> Thanks for pointing this.
>=20
> It was written this way since previously GIC driver neither had=20
> IRQCHIP_SKIP_SET_WAKE flag nor it implemented .irq_set_wake callback,
>=20
> so the call to irq_set_irq_wake() to set_irq_wake_real() used to return=20
> error -ENXIO in past.
>=20
> I see this is already taken care now in GIC drivers by adding=20
> IRQCHIP_SKIP_SET_WAKE flag.

Ok, great. Thanks for double checking.

Can you add those details to the commit message so we don't forget? And
then I'm happy to see:=20

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
