Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F16A9204C5A
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2020 10:27:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731716AbgFWI1b (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Jun 2020 04:27:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731840AbgFWI1a (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Jun 2020 04:27:30 -0400
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C61B2C061573
        for <linux-gpio@vger.kernel.org>; Tue, 23 Jun 2020 01:27:29 -0700 (PDT)
Received: by mail-ot1-x344.google.com with SMTP id 18so1085603otv.6
        for <linux-gpio@vger.kernel.org>; Tue, 23 Jun 2020 01:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1w8T7/F/zzQK6+mLiRUlGqNfUSzbiyE+N4rgrxSNcyQ=;
        b=nt+FSmjtuuR2gfva93CkPSRdTyIzNMKWq5TFdhJzKqR6ReuojYI1tVKVMGqX+esjUI
         csO0Hq+K20z0g5ZUGHGWqwuoMvgc4h2A2pTLF7Rzhj/PFvOocxlO4UcgT5FkZ1LYksp/
         tgYj4ax2GXpstH17ZSpJGJRonFJ396uUXL4vitq3z0c06X+dj8MLftTbjxpd1kuL6M+V
         wBKA5urapzbTSsSiOCQIfHS09tuAaOgkNEC92VfxM71lanr4WUJHvOp/plqy4KoFg0Ia
         NjBL41h/Sx/jwaRjxbbew9kGXsh/S/jddnACfPR2ox8RgJiPnlNjRpDNvAeGmVF5+jNU
         ABUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1w8T7/F/zzQK6+mLiRUlGqNfUSzbiyE+N4rgrxSNcyQ=;
        b=qtLxRy3EZMjQ5uab3KwTQggPUsqo/wvWd3QBTIyhBkl9pQymIPvJOCeh1atQDOmdKU
         +NQoFyz5HnwjfAaDSZPsQEmkiiMYyHDE8RzcwWihcHNJqZf2zUWt/EwagfQ5cn24dlSP
         nYzj0y7acpbxPWK38NXWz4RENkxxdZryCamd5XgUDmN88y8AKjj8OMNwHLoZ8NBnIQSV
         KJWubtMZI+gD2aWWwGGuqTcc0K1SDzSdHDzlmK8S3M6BjUb8xedxw1Flj8w6fet7uibB
         MahJc1ogMhp+zDnW4+CyQBRFZMQql7SWoQGqNfOK/78nWYTUbKzcw6OcTCOZKsBTyRnT
         6hbA==
X-Gm-Message-State: AOAM530tYX+GxtDyXEjoZ3XtrukpFf/StUxxTn9lVPyNgs1tn40Tp0/M
        eL5bRtIdJ1eYSXNlpzbzcu2m5Q==
X-Google-Smtp-Source: ABdhPJzthhOVK5MvWkCfDA5TAncN6b76ZHMmGWXiI+riLN4kSRHydmHmQ4t1q4d81EOz8+6v5gdDng==
X-Received: by 2002:a9d:6b0e:: with SMTP id g14mr17537507otp.309.1592900849061;
        Tue, 23 Jun 2020 01:27:29 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id 13sm3826324ois.44.2020.06.23.01.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2020 01:27:28 -0700 (PDT)
Date:   Tue, 23 Jun 2020 01:24:44 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Konrad Dybcio <konradybcio@gmail.com>
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
        linux-gpio@vger.kernel.org, ??ukasz Patron <priv.luk@gmail.com>
Subject: Re: [PATCH v3 5/7] arm64: dts: qcom: Add support for Sony Xperia
 XA2/Plus/Ultra (Nile platform)
Message-ID: <20200623082444.GB128451@builder.lan>
References: <20200622192558.152828-1-konradybcio@gmail.com>
 <20200622192558.152828-6-konradybcio@gmail.com>
 <20200623073515.GA128451@builder.lan>
 <CAMS8qEULN_3_j17-kh9zmX=iJU0XVVj0=nPDj8G1OnZ9Oen0xA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMS8qEULN_3_j17-kh9zmX=iJU0XVVj0=nPDj8G1OnZ9Oen0xA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue 23 Jun 01:08 PDT 2020, Konrad Dybcio wrote:

> Thanks for applying them.
> 
> In case I have some updates to these DTs,
> (they are being rapidly developed!) could I
> submit them now, or should I want for the next
> merge window? I saw that they are already
> applied to qcom/for-next, so I guess the
> former?
> 

You can definitely continue to send patches on top of what has been
merged already.

Particularly useful for this purpose is the linux-next tree [1], which
merges together the content of many maintainer's trees on a regular
basis.

[1] git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git


Looking forward to see more of these devices!

Regards,
Bjorn
