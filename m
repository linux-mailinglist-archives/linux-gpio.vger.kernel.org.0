Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87B712543D3
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Aug 2020 12:36:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727793AbgH0Kgb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Aug 2020 06:36:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726938AbgH0Kg3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Aug 2020 06:36:29 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 184DDC061264;
        Thu, 27 Aug 2020 03:36:29 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id b17so6963506ejq.8;
        Thu, 27 Aug 2020 03:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1Xk5wiWgS4Q5L7/8sOlC4G0IyshqBfwynQzBeqA7JPE=;
        b=V+PGSRJjkoP9yqrqeW5JtPOJ7++ToAOtddXdk1f4AMCthl0NjZLn835pe/L5yg/cVi
         QCzrlqnybm9KdcKh2Rw3L6FIpZgNVQSkY9tLUm3LHGwojPNebQ4avFuV9uzK9YeNRq5B
         eOGC210XDlydv1wAmRizz6EGUKVs00qAUlbaQibJeo7zDMv5bnxhL4G1nmlwkZST5KBC
         8Ri6VHCsuZ1BGeUEt0NGuJiLItQeUuTalgAv9fMBfPEBTJtHko7U5KUTGYO2irBe3/Wq
         B5khHOX5U30vq3NFN29W9hnbrguM5Rpgt5hVQl25fH3lOHH94bdTUTUX+SbrcYhWXSa2
         d1sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1Xk5wiWgS4Q5L7/8sOlC4G0IyshqBfwynQzBeqA7JPE=;
        b=cOTjtpunU5IuOsipD+48CVVf2SZbrrdXxgElKCb+IDOdhmxPfs8Esqn760UtvDqy80
         j1nyjvc/yFSya17/hfW0T1jZ2INexxLHIPyGBPN4E2mGbehF7jnfyt9Xzts8d5NqWyn8
         z7wnf0gXdyHXFp4tugkNX9vQzKBVRjeOYHJOjmbgZ024H4h2wcIJFyrnHCADzPKBrqEe
         P7nspsXbzJK1JAO9U12Y5CI+pijm/AAljkVSAZ0pc/EQBy737IvrAFLsDpjl+Ka3qlLG
         iWOD1VdpMTO667ptH/p8de2xgq0uFPm9s6sTI7M2TKTlkx9zVxJxjYm3zdzziwpZA5dh
         oEWw==
X-Gm-Message-State: AOAM5312Pmi5ivXZ4UbI0H+VkroOGeU8kzBVLevUp6+qNf3Pka+p3Dhq
        VeKTKXeDQZqzx2s4Vwq4Hnc=
X-Google-Smtp-Source: ABdhPJzAQ7QetvG/p+nPUQF+aP8L/3SRAB0Z6KGq9AW284bvSsDywgYkLyJwD3edhjDJBcULRf2nCw==
X-Received: by 2002:a17:906:6146:: with SMTP id p6mr20819305ejl.211.1598524587777;
        Thu, 27 Aug 2020 03:36:27 -0700 (PDT)
Received: from BV030612LT ([188.24.159.61])
        by smtp.gmail.com with ESMTPSA id hk14sm1530688ejb.88.2020.08.27.03.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2020 03:36:27 -0700 (PDT)
Date:   Thu, 27 Aug 2020 13:36:24 +0300
From:   Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-actions@lists.infradead.org
Subject: Re: [PATCH v2 0/3] Add Actions Semi S500 pinctrl support
Message-ID: <20200827103624.GB2451538@BV030612LT>
References: <cover.1596461275.git.cristian.ciocaltea@gmail.com>
 <CACRpkdaE0HZVN6QxMpA5+509iZ8kZ7A5S5XwuiRoyM=0dpGGSw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdaE0HZVN6QxMpA5+509iZ8kZ7A5S5XwuiRoyM=0dpGGSw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 27, 2020 at 10:41:23AM +0200, Linus Walleij wrote:
> On Mon, Aug 3, 2020 at 4:21 PM Cristian Ciocaltea
> <cristian.ciocaltea@gmail.com> wrote:
> 
> > This patchset adds pinctrl support for Actions Semi S500 SoC.
> >
> > Pinmux functions are only accessible for pin groups while pinconf
> > parameters are available for both pin groups and individual pins.
> >
> > The pinctrl driver has been verified using RoseapplePi, the SBC for
> > which an initial support has been provided via:
> > https://lore.kernel.org/lkml/cover.1592123160.git.cristian.ciocaltea@gmail.com/
> 
> No comments on the v2 patch set for more than 2 weeks so patches
> applied. If people find issues we can make incremental
> patches.
> 
> Thanks!
> Linus Walleij

Thanks,
Cristi
