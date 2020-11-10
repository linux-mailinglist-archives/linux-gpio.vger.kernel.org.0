Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28C7C2AD92B
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Nov 2020 15:47:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730070AbgKJOrW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Nov 2020 09:47:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730672AbgKJOrV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Nov 2020 09:47:21 -0500
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59D77C0613D4
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 06:47:21 -0800 (PST)
Received: by mail-lf1-x144.google.com with SMTP id i6so17930141lfd.1
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 06:47:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kiWbHwM/Lr8KmmLC2XpYaczHAMgXswVwBOFL89IZblY=;
        b=XZOD1vKezmecxMgGB2KrnL99f6D1FfXpEp38edLi+v6XX+/2DwlTq8GQNRMPlUGcas
         WTmTOsZdFoW/F53Xc4MjByycnOx3skWg7Lw0au4+WC+y+fbxiT1FbuIA2K3TF1ZkM6hX
         sfaq/f+id1NXynG39rkmv2VNdGaoFkt6cx7J2wfOatok+ZvBVD2Ytc3SsqTyLkNOvHBk
         i0no7VAoh9Ty6snnjOyibxmv6PpiNg40TvV5mMylXUrkJUsOY9LRTDcyHLJqT04KgZqN
         Kny7Cje9XUnNHbZ+6YjaD7VdtuKilcGIYHrsqOnNwLspmNYbT1W4Ns+IzTmDKpThPqlR
         YhFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kiWbHwM/Lr8KmmLC2XpYaczHAMgXswVwBOFL89IZblY=;
        b=lYO40TQWiYCZgppopqPZiAL2ceAj2BfUuAwll2TH0Ic1Y+Sg2yYMLeyQrAdv2u/0BU
         cxb/B+h/mJsjuyquQVDXa/ULSwWzsa4/yEFwKKKsMzLuyYEYjLporYNeWGhumZzmvdbd
         SrKwuWjjBnsEj6kNaIWuqMQaQEMShATBMioviXTsXJYruFt6BiP8FD2lT204n/UEbEYP
         q0u7ko8Mw5GJ3bZ/ze8JAqFBm+1dM/JqwcJJKcCDEvCCyzj5gVckkCdMfQUV6XsaGa7w
         toXHP1KrUzOQGCWtpGTL8YrnnKfmgvcAKs32xauSND9fZGwlRpwIKAMNpnmQUmycvvOX
         +J1A==
X-Gm-Message-State: AOAM5318X8zFGC+wZmBVZ0mIrxBWIgMuDFbQQ5ge7xpqkagmsnHbzd5n
        ic1si6WAWG2EDZhSBpwHvH3JThyVgSoUzVUx3Ox/vA==
X-Google-Smtp-Source: ABdhPJyi74cMCtvgB2LhCZiGshSdj4vtK9CzMPI7ALGe90BKtPZD+3vJoENQBsDaxfuy/JxgoF7vPVs3eoY3U4dEbmw=
X-Received: by 2002:ac2:50c1:: with SMTP id h1mr7305358lfm.333.1605019639735;
 Tue, 10 Nov 2020 06:47:19 -0800 (PST)
MIME-Version: 1.0
References: <20201109062620.14566-1-vkoul@kernel.org>
In-Reply-To: <20201109062620.14566-1-vkoul@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 10 Nov 2020 15:47:08 +0100
Message-ID: <CACRpkdY=g4omnvgTzsBP6qwg7s8VYaFwChgAsJciQFS7SJ67jQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] pinctrl: qcom: Add binding and driver for SDX55 pincontrol
To:     Vinod Koul <vkoul@kernel.org>, John Stultz <john.stultz@linaro.org>
Cc:     MSM <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 9, 2020 at 7:26 AM Vinod Koul <vkoul@kernel.org> wrote:

> This series add device tree binding documentation and driver for SDX55 SOC
> pincontroller.
>
> Changes in v3:
>  - Add ack by Bjorn
>  - Fix dt_binding_check errors
>  - Add gpio ranges in binding

Excellent, patches applied for v5.11.

I also just applied John Stultz patches for modularizing the Qualcomm
drivers so there might be some need to patch up so this driver can
also modularize, check the result!

Yours,
Linus Walleij
