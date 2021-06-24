Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 244893B389C
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jun 2021 23:24:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232591AbhFXV0l (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Jun 2021 17:26:41 -0400
Received: from mail-io1-f44.google.com ([209.85.166.44]:40693 "EHLO
        mail-io1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232582AbhFXV0k (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Jun 2021 17:26:40 -0400
Received: by mail-io1-f44.google.com with SMTP id r12so10064606ioa.7;
        Thu, 24 Jun 2021 14:24:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6sZPp1vEoAUryEtDZBeRzAyNas7+xPHiLsPcVOBEa2A=;
        b=URYV6SKcWMeK+OYbysZRHJpQ3hY822QOrg34bwUEp+qF+WE6ojglL/BC6gslNOsJOJ
         tJA1ZayM6VicGjqijRuStx7QO+M78NmJ9MOiDqxOzPnnZb7ikFjuCK9sqh7g1pDrWGAG
         4So6gsHTFUteQimbK2+6rjHzDwvK7dKXRd5RHq7kWr9B2mgwCtPkRtNM51J766eie206
         DeO4Ew8s6nNv3nitSbsEymEJt3jKFU84OPpYxhtCwwhhcMTcjaKAxKnvbQ6o52jNQQtG
         H9+DWzjEUNLBuyxTZCP1bdsjK4Od25ZUkx2w5G5FAVtjoP7W1hsVTp6/uaZj7xrzbdVv
         bVMA==
X-Gm-Message-State: AOAM530mC4qXi5QLZb/J5T/5W4vEGvSTHJ9SZUHrtN5QQw2d4qXH52Uq
        2vbIPuSXBXoZMaWutajGNQ==
X-Google-Smtp-Source: ABdhPJzy7WoYT9SQIRnKQqSmTgtG+88BiyMNg1rCuj3Qncz/CEmSUgJ22wpQL7Y7dITdQ8b7XUvGQQ==
X-Received: by 2002:a6b:e916:: with SMTP id u22mr3216932iof.155.1624569859596;
        Thu, 24 Jun 2021 14:24:19 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id j25sm2009047iog.47.2021.06.24.14.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jun 2021 14:24:19 -0700 (PDT)
Received: (nullmailer pid 2011097 invoked by uid 1000);
        Thu, 24 Jun 2021 21:24:16 -0000
Date:   Thu, 24 Jun 2021 15:24:16 -0600
From:   Rob Herring <robh@kernel.org>
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        bhupesh.linux@gmail.com, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        lgirdwood@gmail.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: pinctrl: qcom,pmic-gpio: Arrange
 compatibles alphabetically
Message-ID: <20210624212416.GA2011063@robh.at.kernel.org>
References: <20210617053432.350486-1-bhupesh.sharma@linaro.org>
 <20210617053432.350486-2-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210617053432.350486-2-bhupesh.sharma@linaro.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 17 Jun 2021 11:04:29 +0530, Bhupesh Sharma wrote:
> Arrange the compatibles inside qcom-pmic gpio device tree
> bindings alphabetically.
> 
> While at it, also make some minor cosmetic changes to allow
> future compatible addition to the bindings simpler.
> 
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> ---
>  .../bindings/pinctrl/qcom,pmic-gpio.txt       | 58 +++++++++----------
>  1 file changed, 29 insertions(+), 29 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
