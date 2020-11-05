Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13B2F2A7AE3
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Nov 2020 10:44:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726861AbgKEJod (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Nov 2020 04:44:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725468AbgKEJod (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Nov 2020 04:44:33 -0500
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31F8FC0613CF
        for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2020 01:44:33 -0800 (PST)
Received: by mail-lj1-x243.google.com with SMTP id y16so895588ljk.1
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2020 01:44:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KmG557UsK0LM24qhoPDHxaA9P54gMrzELQCeZez5PmY=;
        b=EGdV5r4hHHZbm95UIhr0bF0wUhCgriTY5oz5+NQk7iDyk6oAZmXQVPND54N7OvgE+p
         VI9pspmj6n3Gu7IB7SKrVazqytibpGTL1V3cfZVpdnsZsaLBvl9Igo2yvLoHluMEiJ4u
         tS7ICQXWDtXfcmAcp8pg70Nnsx7pM/DtzCKy28jJFyURuNS2YE/yiZ5sRi/+m/PC/LjD
         ntDwvLZsfWwVU38RMULVuIQ4WdI8f7PawTmjqUnSugnfBZwxjMX97Yf2oMimDjo6Uufm
         7Vokw+dz29UQAm0u6TJ4kegxgeaWqmk908pu3c9xyTwfIXjpozMq/Vjk16PXwVV/YBu+
         0FkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KmG557UsK0LM24qhoPDHxaA9P54gMrzELQCeZez5PmY=;
        b=kHJ1zyVQ6rfdqKq77r63JhPyRbTNoKiPM3UMeO6RQSJSieFJdCwHVfs7qL5g9NHIuf
         xoko+l/uidYuPUD9akYCh04G4dk1fA4G2dKDXZeA34d25qVqquYcsr5PDxNkO8Y+g6Pa
         knuRlP4Tt7WfQp1aAVpUh77dpqJdDBqVKAA/7f3cuFrFFp6/wWDt5BN1kRBTQOp3wPl8
         tUNpOIeFZuPATgtxfhO1QRRZSzggRaYqjRxzpq3hNG418TBYlgPm22MM5tNpCBchecWt
         Zel+mKIqt0yFLCocYizuuQlmLQSk48M7ZpTVi5xFDkuSqOoBH/UNBTJ3ZPptwQpO2F5k
         oiMw==
X-Gm-Message-State: AOAM530lnAMVVQkl2e8jI8JQFPXKT9QHfqdYJ2dOUrdwNjs/CmfQpin9
        NC93OurALa7X9E3qP67FO7mME8hRAZ2tfmI109nodw==
X-Google-Smtp-Source: ABdhPJwF2548k7T7lZlFwbzph6fYCKE9iwMUUZ0IrCUgNwU3JYvZgG5ItD4+UmWzU/sIXRvfD4/6cxM6Mzzx/AZAJO4=
X-Received: by 2002:a2e:86d4:: with SMTP id n20mr604237ljj.293.1604569471715;
 Thu, 05 Nov 2020 01:44:31 -0800 (PST)
MIME-Version: 1.0
References: <20201019141008.871177-1-daniel@0x0f.com> <20201019141008.871177-6-daniel@0x0f.com>
In-Reply-To: <20201019141008.871177-6-daniel@0x0f.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 5 Nov 2020 10:44:21 +0100
Message-ID: <CACRpkdag14pGpu_6RCC9mhVZdsh=CwsT7L+bpeL1UaOjZ6=YZg@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] ARM: mstar: Fill in GPIO controller properties for infinity
To:     Daniel Palmer <daniel@0x0f.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, arm-kernel@lists.infradead.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 19, 2020 at 4:10 PM Daniel Palmer <daniel@0x0f.com> wrote:

> Fill in the properties needed to use the GPIO controller
> in the infinity and infinity3 chips.
>
> Signed-off-by: Daniel Palmer <daniel@0x0f.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
