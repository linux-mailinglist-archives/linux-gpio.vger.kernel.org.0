Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ACC28196211
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Mar 2020 00:33:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726225AbgC0Xd5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Mar 2020 19:33:57 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:33544 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726065AbgC0Xd4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Mar 2020 19:33:56 -0400
Received: by mail-lj1-f195.google.com with SMTP id f20so12027098ljm.0
        for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2020 16:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=31OCCdsx5Mp+cw9g2eq/fgIixaxEpyfnaxTPFOvJXaY=;
        b=rROi4bYmrya2laI29eBwhRi8+o0B6pv0VQ0S87fTvDSOO1fI2+V4b0Vi3Qd9NE/cXJ
         mMu507vWPOzoHxkFh2PXEEBozO56iynS+gc+aU1gUJabRDrk2QYOHuA/j6obtc63r+sK
         lBRbPiCQBu8h/FWzdqlqAKITKpNDgAXfGSi07YfsXX/K2J4DNy6xR30fZIBi93GTKn1Y
         58Na3pTmM2nCqEvEDt3cI16oM911yve6Zu8EVsJZxVO9ub+FXvBuKgX9nwRB+iHbMBrZ
         gKGbaefg4CamnX8bzITzpgwiRzpSPf0giuE6Y5joLA+AG9CL5gVR3mH01HLuYA9oCTbG
         C88A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=31OCCdsx5Mp+cw9g2eq/fgIixaxEpyfnaxTPFOvJXaY=;
        b=ej5M0AHmX3FhbB9heyUzNJs0N6YNoM9YhOG1G/fYp9gh0vdfpMrkc5TT7mTIgLPBUv
         Nv75yYqELNuvRZS5+cGb5G2DMsdI2BGkssQ8sm29fRJR6zMAVj8ukq45Zw87/QcFmWcY
         s3EiaIHDLN3ZWGTWgv7S81clyv+gW2fWBQck5cOnrXRYGFtZqd4h7l37sNLJavMPK5sz
         7gAWvH1/qW/lCXew1heCMhcshn21JBd8nPlCesZShA9rthJNz0ZFOnXzM1ODJCPBm8EM
         Hmcy3bDT8ARRNWzKAKPZo0NNV2K++eSq5hCTaTHFHdwdAafB6fcHc8X0n+BQwsDi+oZl
         Ld2Q==
X-Gm-Message-State: AGi0PuYw9PCHr0TdU/o0QBd2VYnYguVMcsRKHzdkJ2SW0UijzWyLMemx
        NEvajVaZ9agcccXVxe1U4R2wBPUiamAjA+2ORL+3xbtPnZI=
X-Google-Smtp-Source: APiQypI/NjrojqWxdb8e6IfCyjtcaINz+cXlEUyGidd5WOLU+ClWfg8pCJNKY7+Nnm9MsxpZbuwSJaUnMrtX8Xx3U+Q=
X-Received: by 2002:a05:651c:445:: with SMTP id g5mr723803ljg.125.1585352034393;
 Fri, 27 Mar 2020 16:33:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200327223209.20409-1-ansuelsmth@gmail.com>
In-Reply-To: <20200327223209.20409-1-ansuelsmth@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 28 Mar 2020 00:33:42 +0100
Message-ID: <CACRpkdaemQ_udn=TawvcSrUgmnw4eG0ASpjTC-0hjJCP-hCQ_w@mail.gmail.com>
Subject: Re: [PATCH v3] pinctrl: qcom: use scm_call to route GPIO irq to Apps
To:     Ansuel Smith <ansuelsmth@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Ajay Kishore <akisho@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Mar 27, 2020 at 11:32 PM Ansuel Smith <ansuelsmth@gmail.com> wrote:

> From: Ajay Kishore <akisho@codeaurora.org>
>
> For IPQ806x targets, TZ protects the registers that are used to
> configure the routing of interrupts to a target processor.
> To resolve this, this patch uses scm call to route GPIO interrupts
> to application processor. Also the scm call interface is changed.
>
> Signed-off-by: Ajay Kishore <akisho@codeaurora.org>
> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> ---
> v3:
> * Rename route_to_apps to intr_target_use_scm
> * Follow standard design and rename base_reg to phys_base
> * Add additional comments in route interrupts condition

Patch applied with Bj=C3=B6rn's review tag.

Yours,
Linus Walleij
