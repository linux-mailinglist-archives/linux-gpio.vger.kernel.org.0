Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4104E3B3898
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jun 2021 23:23:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232776AbhFXVZ5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Jun 2021 17:25:57 -0400
Received: from mail-io1-f50.google.com ([209.85.166.50]:46945 "EHLO
        mail-io1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232650AbhFXVZ4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Jun 2021 17:25:56 -0400
Received: by mail-io1-f50.google.com with SMTP id b14so10014353iow.13;
        Thu, 24 Jun 2021 14:23:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GbseeE4Nre/7z1KdM5XuCEy4t5uO1SdgTuOn+EKMUA4=;
        b=NcHKTFKPoNwboLpG14t+3WRZiJf36uGQIbHQpGUdIhoqbLJHre5vbkcKKCVbjros0r
         J5s1FMn+XxcOWt6m/5jL+nedWf7ROrbpLSpgdFuGXzPc2IMqqrNOh95Rwbzo5wr0muGt
         a6cVOy5gPtsp5ifhAllH8AG9xVvLYwjtTOVBOS8e1LwwMOYbP29Kno4u6uHLIkgzrRpa
         4ta3p5QuL1qEWTBaIH+EolChy6H/jCF5OooPCLqRafkb4iRSS8QXyBEv1ErNmDRncNlW
         yeFlbSEpnNwkaiuOcvQvWw5fxg5dvAhJh60tVMbyIpYWensk/JG689RduQreuqv10Rui
         Sbyg==
X-Gm-Message-State: AOAM530FTknoldUebn9YFYvVvpVuzhEiMGBNjIU/stWDUNspb92cnKsj
        JhLXGdi5GQ+SByMu/iQgtg==
X-Google-Smtp-Source: ABdhPJxyFoqYu4EOVDPoU1scGeEkUckl7PwRN4LcFHQYynIaHc2DkveIBuFACr57w1TJlyl7aZLpPw==
X-Received: by 2002:a05:6638:3896:: with SMTP id b22mr6478291jav.37.1624569815839;
        Thu, 24 Jun 2021 14:23:35 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id v18sm1993936iom.5.2021.06.24.14.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jun 2021 14:23:34 -0700 (PDT)
Received: (nullmailer pid 2010038 invoked by uid 1000);
        Thu, 24 Jun 2021 21:23:31 -0000
Date:   Thu, 24 Jun 2021 15:23:31 -0600
From:   Rob Herring <robh@kernel.org>
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     lgirdwood@gmail.com, Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org,
        bhupesh.linux@gmail.com, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/5] dt-bindings: regulator: qcom,rpmh-regulator: Add
 compatible for SA8155p-adp board pmic
Message-ID: <20210624212331.GA2009989@robh.at.kernel.org>
References: <20210617051712.345372-1-bhupesh.sharma@linaro.org>
 <20210617051712.345372-3-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210617051712.345372-3-bhupesh.sharma@linaro.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 17 Jun 2021 10:47:09 +0530, Bhupesh Sharma wrote:
> Add compatible string for pmm8155au pmic found on
> the SA8155p-adp board.
> 
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> ---
>  .../devicetree/bindings/regulator/qcom,rpmh-regulator.yaml       | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
