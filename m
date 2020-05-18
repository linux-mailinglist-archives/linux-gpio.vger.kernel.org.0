Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BC731D71A6
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2020 09:20:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726957AbgERHUq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 May 2020 03:20:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726127AbgERHUp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 May 2020 03:20:45 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9645C05BD0A
        for <linux-gpio@vger.kernel.org>; Mon, 18 May 2020 00:20:44 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id z22so7115180lfd.0
        for <linux-gpio@vger.kernel.org>; Mon, 18 May 2020 00:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=srjDyr9S0oB/6VDYDy70mCau/zVOnj84hKg9e/vKVUc=;
        b=UmO/e8bHlXbOw6t5litf5UhEV90GLZNKTvruCwSC9H28yYSU/xOoYiclTIFgm3pdnO
         G2mJQ3KyMOKPyxPHdDN0tPhEj22mLv03EN6NEHH+nuquSeVze0Ec3cxhipC/zAyQBbvi
         fNOIkvZANckbPP2uhRAYt7O9BSVI/SbbzeYgycvK4gtnAV+iC6Q0nzy96a5/JGg8E/Ve
         /rtn1LovXJiq6BnEV32NdI6aqSsAOskxgHGNSwF3BdMJLlsPqH2SZfaJ8TJ+2e9pNE7R
         ts0J69gQDaEeKH3Q/j7cgPk+y8d2ApLd5urmJ+WiPGV+0UM70Twzx0MwclzzJc0DIJch
         Hycw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=srjDyr9S0oB/6VDYDy70mCau/zVOnj84hKg9e/vKVUc=;
        b=Mtvs542nB3rcA6fZjXCNUnUvjspiwVy/cloINKM/J3302nb+DpimZwHrbJq91rqakk
         eO8q1ntE7rEd278FR583wFDRBnz+EpokCbO3e1rTOAH6YBrOb9y3d5/PSWSFME/sBnYI
         0rAiowl7mYtL2JM20MUJqSYEyRzrznwfrCRQqywaeqA2i4sN8L/VIVzMoR4Oc8aNPnLa
         NeFWfBAGOsojFzI74Po+sUbxP5A9B/yVbXAmDWSVDhbwX79z1CBMXIfRai7Sfl493u9O
         Pb7PRC0VKpuRLoyWs1cWZv7ni1PmDY6CPv5bG+36y5xG+NuWOs7Yc8sCIsX5v2iSKR12
         lC4Q==
X-Gm-Message-State: AOAM530/Nkqql3oT9I/KJjsHiQC5Y37yFD4LM6EiMed/JzyF4fC6BrqK
        XowA95avDYQdwVzIOpCBRwkWL+p/+CbWaJg2cDFmSw==
X-Google-Smtp-Source: ABdhPJzRfqaofRPumXvphn7M6BnSMfYofnElhrI84EAZ3W5otCYBNBiXOugxiFN46j+QphGtW23HA+cXFzEqTcDNw+s=
X-Received: by 2002:ac2:4823:: with SMTP id 3mr10546757lft.194.1589786443287;
 Mon, 18 May 2020 00:20:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200512203524.7317-1-jbx6244@gmail.com> <20200512203524.7317-2-jbx6244@gmail.com>
In-Reply-To: <20200512203524.7317-2-jbx6244@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 18 May 2020 09:20:32 +0200
Message-ID: <CACRpkdYrDHNp7esSYw9y7CQoZ1aZojWkhAU_MG4uvmk7nVJbOQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: pinctrl: rockchip: update example
To:     Johan Jonker <jbx6244@gmail.com>
Cc:     =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 12, 2020 at 10:35 PM Johan Jonker <jbx6244@gmail.com> wrote:

> The Rockchip dtsi and dts files have been bulk-converted for the
> remaining raw gpio numbers into their descriptive counterparts and
> also got rid of the unhelpful RK_FUNC_x -> x and RK_GPIOx -> x
> mappings, so update the example as well.
>
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>

This patch applied to the pinctrl tree.

Yours,
Linus Walleij
