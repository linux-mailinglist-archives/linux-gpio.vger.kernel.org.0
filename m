Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB103204BE0
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2020 10:03:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731614AbgFWIDP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Jun 2020 04:03:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731534AbgFWIDO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Jun 2020 04:03:14 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AE9CC061573;
        Tue, 23 Jun 2020 01:03:14 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id h28so3445993edz.0;
        Tue, 23 Jun 2020 01:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2rPds0/G6EcL2nawpDhmBWpfMm0TyFqHBbBHy9o57w0=;
        b=B2bNXSqLuEsu8gf7GVyhIgx9TT8yKSIML+JRlieMW/cGH0XYqBkF6Dxev7Ut9w8CDc
         jTFmGd/3K4PaxRUDlYvMYqR1NpHxdHDxmToLFDI43BWiJPJB5syXRDmNhvt1+uRTQ+y/
         PQVigefkF3mTwJ4TfKt4gs8m8npdbBzsFhJp6fMlaqteyfmGJ/YJCIeUcqdb+uhxMxqT
         19bJKP7hJdrn4dTQ1BtdxaOnKGOyet/61UuMl8Q05HK2Hz9Ar++Z2Y0U8qd1WT+MyyDv
         JxuT2wj1MwtgOtXLHEuhghLdD3TMNwGhr5vKLi6AgoxfKhpZQ6C4UPKCRflguDZkGe25
         C0LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2rPds0/G6EcL2nawpDhmBWpfMm0TyFqHBbBHy9o57w0=;
        b=rflxtQBivgi2zWud7rpEVo4hAxF2L8p3MYeRGZIDkXV/f6snIfD43qTDSCIg4dSvAI
         060avyEhpGXbkqXCw8FI7JgOEJOWOOQgblRPd5QODaf2IkNpcTzFsT56AluS3atimatf
         NHnyXIlWqZidQVrdxZoQnsM/Ezmh46h7HC1TylTAOf/bEV0Np/znajwuDNZJI9f/oIVK
         nxo2g7tABjQsaRsiaafzQxfZAzweGarcZmr2EYIzFu382eBsBb6KtjCuc45QV+B9t+sz
         1NGEpE5v0kezqJRhS4OzdbnrbSTLhLGQ4g5BN3DWsbVsLZTt4X0oYQ4ucPFQtMWcB/pt
         bXNQ==
X-Gm-Message-State: AOAM5301OXq3WKybV5tndxyF0vVYTOF/3NSCRBpoRjPil2o1fTeMLKYm
        /g3jXTXA1Tuoa7Edx/wWoJ6xnX9KEGyV8IPjTgA=
X-Google-Smtp-Source: ABdhPJxnTEC/7IMkbPEIMk4DJSmNqD8oNigmUD2kQb5Tg7dzsWj+iVEI5HhsukquaXBoDUo3B64tHTOC9luNNG2CLmE=
X-Received: by 2002:aa7:c756:: with SMTP id c22mr20940182eds.239.1592899393084;
 Tue, 23 Jun 2020 01:03:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200622192558.152828-1-konradybcio@gmail.com>
 <20200622192558.152828-2-konradybcio@gmail.com> <20200623072624.GY128451@builder.lan>
In-Reply-To: <20200623072624.GY128451@builder.lan>
From:   Konrad Dybcio <konradybcio@gmail.com>
Date:   Tue, 23 Jun 2020 10:02:37 +0200
Message-ID: <CAMS8qEWZ6hg1-n737ZDop6qsL4k3aNLPt_pJJqTwStNtRKhTcA@mail.gmail.com>
Subject: Re: [PATCH v3 1/7] pinctrl: qcom: spmi-gpio: Add pm660(l) compatibility
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     skrzynka@konradybcio.pl, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Yes, you did.

This was a mistake on my end and I realized it
 after sending the v3, but I figured there's no
 point in sending it yet again exclusively for this reason.
Hope you don't mind.

Regards
Konrad
