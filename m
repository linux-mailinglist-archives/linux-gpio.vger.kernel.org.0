Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB26F3C7B93
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jul 2021 04:15:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237422AbhGNCSg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Jul 2021 22:18:36 -0400
Received: from mail-il1-f178.google.com ([209.85.166.178]:37836 "EHLO
        mail-il1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237409AbhGNCSf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Jul 2021 22:18:35 -0400
Received: by mail-il1-f178.google.com with SMTP id o8so53344ilf.4;
        Tue, 13 Jul 2021 19:15:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=aHXe5k9qTuLKL1vCAvh2XJuC8NrcEuiCeyukAPaU+lM=;
        b=iKo8gGKGPOEu2u2ywH9Xws/f8iRo3yLwcVTtlJ4LJrjwBmlLs2wSGmcjy48pYJ1tm+
         APQPmJlIiTZYUPquY5DRLD5GwMCr963PFWT8wzbd3/6RlVAUbz4zYLTZE1SNznleYbl3
         0op5MtinUMDnUk7KPEek8miKFgilK39EzR07FqPHQn3HlCyG2YBRvc1M8lc8eIEfseEM
         lKFgHK0f1q6EUlOhJrBS1kdorNbQigwJdyQs1jd3TpBzjh6qR1xDl4pl+wpkKm/4bygO
         w0J7zxL0FLGcq4HKa2JqgXbECck3o83tVTZonUv0p/iuTdFPfqFYhnm8BbJNz+4l/gmq
         iuDw==
X-Gm-Message-State: AOAM532smtMBEw5GbwPIpK01ZQEODKF8V9y9JCI6M6H3qhaFpSmLoWAT
        HSJe3xuZGan73LupS5jPsMqKbEEb0Q==
X-Google-Smtp-Source: ABdhPJzJcVDnT4+KpvFkWlEjzCbzAaac/R6WLRsVdf1NBnsHybYik0RMCw+WRoVm+PYBLhW1fnAI8A==
X-Received: by 2002:a05:6e02:e02:: with SMTP id a2mr5112646ilk.127.1626228943771;
        Tue, 13 Jul 2021 19:15:43 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id w11sm360135ioj.47.2021.07.13.19.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jul 2021 19:15:42 -0700 (PDT)
Received: (nullmailer pid 1312471 invoked by uid 1000);
        Wed, 14 Jul 2021 02:15:41 -0000
Date:   Tue, 13 Jul 2021 20:15:41 -0600
From:   Rob Herring <robh@kernel.org>
To:     satya priya <skakit@codeaurora.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        linux-gpio@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>, kgunda@codeaurora.org
Subject: Re: [PATCH V5 2/2] dt-bindings: pinctrl: qcom-pmic-gpio: Remove the
 interrupts property
Message-ID: <20210714021541.GA1312437@robh.at.kernel.org>
References: <1625032241-3458-1-git-send-email-skakit@codeaurora.org>
 <1625032241-3458-3-git-send-email-skakit@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1625032241-3458-3-git-send-email-skakit@codeaurora.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 30 Jun 2021 11:20:41 +0530, satya priya wrote:
> Remove the interrupts property as we no longer specify it.
> 
> Signed-off-by: satya priya <skakit@codeaurora.org>
> ---
> Changes in V5:
>  - This is newly added in V5.As per Bjorn's comments on [1]
>    removed the interrupts property as it is no longer used.
> 
>    [1] https://lore.kernel.org/patchwork/patch/1434144/
> 
>  .../bindings/pinctrl/qcom,pmic-gpio.yaml           | 28 ++++------------------
>  1 file changed, 4 insertions(+), 24 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
