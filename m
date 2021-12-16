Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CBF54768B7
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Dec 2021 04:32:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231145AbhLPDcJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Dec 2021 22:32:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231148AbhLPDcI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Dec 2021 22:32:08 -0500
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C203AC06173E
        for <linux-gpio@vger.kernel.org>; Wed, 15 Dec 2021 19:32:08 -0800 (PST)
Received: by mail-ot1-x335.google.com with SMTP id w6-20020a9d77c6000000b0055e804fa524so27425395otl.3
        for <linux-gpio@vger.kernel.org>; Wed, 15 Dec 2021 19:32:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YHZtPyPCrz/6zDSkUPuOSFaXF/q9gwTp+Eum7rg8N5g=;
        b=g7+5mra2q16Qn/P15sDf+fZRvns35J0VejqA63tSJE5ViwbNWZp/2V7b4WVRDMae/I
         0VuShI+1wzNV+E0VO0bZwsxhaQUE/n78uElivyEvYjBql/mHPKpM5XTto15jYxy0/Ls1
         f0bCEDNtLLeCs1zjzWlGpQ5tL2tQro8WjG5mKCy6AhkdKz6XP5UYv0CFjNiK1UchT8d/
         EcfifwYz7uAiQmVQuY/2cs+0VAnYBF6zDc5AH6kPWR+mW6vK8zhb49PE05l5o8bGlbPL
         0sHy8YuAWVxQm1HX9dHCjJutxsgXUeNa3Xw2tLZc/yxMyUGlXd8fcsmW9XWzPjZKPi53
         0kmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YHZtPyPCrz/6zDSkUPuOSFaXF/q9gwTp+Eum7rg8N5g=;
        b=exytUKZLpUNkT1NbGFvVi+nMHEoNL/LcAZGG/CdnZY+d1HwvgHNCNYnqZzunNFUMzp
         mp5jhWnQNrO/w1bz5DYNevS54lBCCWJ4GO2J4WkbdRZZAHK139QFfdamdn5KC3DDRXUr
         58z8QPyoVuUmITA+zYBMJS+676dMSHEfdMCBfH7jpCHk76AZaQSKr77Q7k5wJ++M4GSL
         2TqjQijqDfUb9O4zkLvG2q6sePnkI19OyAQ+UX50tihdG1KBefmS61DxXYiAeaoSCiwk
         1M+7rGWE3Sgb0O8rFV/shHfBGOrAxGEf2GxbHyq4IXaTQvRIkedb8zgBuok9nq3yhCVy
         3nvA==
X-Gm-Message-State: AOAM530YAG4dJn0DVFhhj854Qtzv9BFnI1IC5jUhY4jrcoqYdX3b7YwQ
        v/AgrFxW21YBGYOiPwTUutjp4H3bIjMqSS0TGMIB7Q==
X-Google-Smtp-Source: ABdhPJzw8d8L3HAROOyL3Uu8asleFj8qGp8qHlgx7ILhqvCGj9qccTkoojgd+VPBIta49to9vmB/2+qHm3wHdhefn84=
X-Received: by 2002:a9d:a42:: with SMTP id 60mr11523032otg.179.1639625527896;
 Wed, 15 Dec 2021 19:32:07 -0800 (PST)
MIME-Version: 1.0
References: <20211206092237.4105895-1-phil@raspberrypi.com>
 <20211206092237.4105895-3-phil@raspberrypi.com> <CGME20211214142139eucas1p1c100b7fd4b8c8ce85bc03e1ce6b783db@eucas1p1.samsung.com>
 <8671ebd8-a853-7394-9864-0457514337e2@samsung.com> <2ce5956f-ce8c-80f0-df9a-492a8da00a08@raspberrypi.com>
 <dbba6665-9688-9a5e-091b-eaa8e92e6886@gmail.com> <83bda801c9be665086f94acce46d44da5d24ba9c.camel@kernel.org>
 <45fa0de1-c2be-84dd-782e-184ab608895f@gmail.com> <CACRpkdbyi4QrHXpPaZvPaZZhuO0-iMwTi=UmVHy5XagSFqJnzQ@mail.gmail.com>
 <e6ba2ec6-6de4-687c-5d50-e3e6ac11ba44@gmail.com>
In-Reply-To: <e6ba2ec6-6de4-687c-5d50-e3e6ac11ba44@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Dec 2021 04:31:56 +0100
Message-ID: <CACRpkdanDLzQOjYcSEKDwi+=6NyWeK-+Xnd0we5JEGWYKXFE_w@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] ARM: dts: gpio-ranges property is now required
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     nicolas saenz julienne <nsaenz@kernel.org>,
        Phil Elwell <phil@raspberrypi.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        bcm-kernel-feedback-list@broadcom.com,
        Thierry Reding <treding@nvidia.com>,
        devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Dec 16, 2021 at 4:28 AM Florian Fainelli <f.fainelli@gmail.com> wrote:
> On 12/15/2021 7:27 PM, Linus Walleij wrote:
> > On Wed, Dec 15, 2021 at 6:14 PM Florian Fainelli <f.fainelli@gmail.com> wrote:
> >> On 12/15/21 1:02 AM, nicolas saenz julienne wrote:
> >
> >>> As for channeling the path, would it make sense for linusw to take it alonside
> >>> GPIO fix?
> >>
> >> That would definitively work, Linus, are you comfortable with doing
> >> that? I will reply to the patch with an Acked-by if that helps.
> >
> > Do you want me to merge this patch (2/2) into the pinctrl tree,
> > where patch (1/2) is already merged?
>
> Yes please merge patch 2 into the pinctrl tree where patch 1 is already
> applied. Thanks!

OK! Patch applied!

Yours,
Linus Walleij
