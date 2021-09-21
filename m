Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09A91413B45
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Sep 2021 22:24:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234821AbhIUU0W (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Sep 2021 16:26:22 -0400
Received: from mail-oi1-f178.google.com ([209.85.167.178]:35357 "EHLO
        mail-oi1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230348AbhIUU0W (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Sep 2021 16:26:22 -0400
Received: by mail-oi1-f178.google.com with SMTP id r26so1012857oij.2;
        Tue, 21 Sep 2021 13:24:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dIFSllhu5RZTKg1+J7aScUgwk1yG6WTOS7GaD5BDJp4=;
        b=EB6WqMFroMEM/RogdrCcOPj/V+gMSrlK9eOtXnSWsHzh3sBxRchVMKNokvB0LkOh+1
         3p/2yMA0EUeL4v/zDLt6s7pTExppEJEUE6eADEIdUAiR9RJlD5qU/6VSsYLUogml6lcT
         W7U0pRPONEfvLkMMR79h0s2r1/sUIp+CZ6YxByagDx1hvjGSEv/G7ECC3zFSQt3Q2P/F
         LTjZv0YSPny+Xkui4B2UqJ/qanLNIf34mWiXwDCphG5IxZ7QZgjasDT13xlaUiTtnQxv
         +KHb1Umg+Sn2BjNyaXA5PpIyuSvXfo1AMhUfAH4pb4SwFUn8jxFdGcEjA3gcCu6d9BBc
         Uhgw==
X-Gm-Message-State: AOAM531Ol0mHxawWOkltHpPiyr3hk8Eii+/lccWdK1sRerWhQYk02s7n
        ZgciDVElFNO9MNwTk7t65VGvLW/LcA==
X-Google-Smtp-Source: ABdhPJy+agrXXOvysDmIKAzpGN4eome6cAn+hgDkTcueP8wXGl5oxtwNl8lIptqmmSDHT5jrLQaNAA==
X-Received: by 2002:aca:e142:: with SMTP id y63mr5324464oig.112.1632255892809;
        Tue, 21 Sep 2021 13:24:52 -0700 (PDT)
Received: from robh.at.kernel.org (rrcs-192-154-179-36.sw.biz.rr.com. [192.154.179.36])
        by smtp.gmail.com with ESMTPSA id t6sm6800ots.55.2021.09.21.13.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 13:24:52 -0700 (PDT)
Received: (nullmailer pid 3270130 invoked by uid 1000);
        Tue, 21 Sep 2021 20:24:49 -0000
Date:   Tue, 21 Sep 2021 15:24:49 -0500
From:   Rob Herring <robh@kernel.org>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     Loic Poulain <loic.poulain@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: qcom: Add QCM2290 pinctrl
 bindings
Message-ID: <YUo/kTTTT8r5dAAl@robh.at.kernel.org>
References: <20210914074542.12957-1-shawn.guo@linaro.org>
 <20210914074542.12957-2-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210914074542.12957-2-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 14 Sep 2021 15:45:41 +0800, Shawn Guo wrote:
> Add device tree bindings for QCM2290 pinctrl.
> 
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> ---
>  .../pinctrl/qcom,qcm2290-pinctrl.yaml         | 186 ++++++++++++++++++
>  1 file changed, 186 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,qcm2290-pinctrl.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
