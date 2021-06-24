Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CB4B3B3822
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jun 2021 22:47:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232641AbhFXUtk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Jun 2021 16:49:40 -0400
Received: from mail-io1-f54.google.com ([209.85.166.54]:46071 "EHLO
        mail-io1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229525AbhFXUtj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Jun 2021 16:49:39 -0400
Received: by mail-io1-f54.google.com with SMTP id b7so9908049ioq.12;
        Thu, 24 Jun 2021 13:47:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=F0DM3/whjo1QUGn5QeSRsdPpAyvRUkqg+cmiUQ/A8CI=;
        b=c028ezR7qIfWyd8dGeneNEwIm77vldX5MeTm+wiLSFCwMUiqTVgrtwvEfKCRL07JyM
         jERvcF0nO3N90hzTCH8VdXKqK/DwkbVDdK565CAYZ+SUdeu5Db1F+DRcZczrDnuSUicW
         McsbyY6MZEFCq9GO0ZMPBBVbhFlVdKDVYvp4Lj70VeV1q3gJEHZ3gbM+B9RLmBiXE9Ht
         R6E/MczHGnMTBCJae7acA5IckIqbSBznI58HKajsOOc4wxwUcyZ1u7edT8VDYwOrJCXd
         aH15PzOjXilVbMeg5o0Z9nCi5Tr6Wkg2+Fsq8RX1FmCXrum7NGT33oVo8NnbbXDykBJi
         JI/Q==
X-Gm-Message-State: AOAM530Qlsmmwc4S8wEbtkBBcNB4sqbVVo7K28ZeO8vEctUVnF/1jpDE
        dF43TG+sN0z8Jzz42cpUgw==
X-Google-Smtp-Source: ABdhPJyo+VknNtW7hyFaEwhsaq2IWVPZwEIsJEKawEvFtWCJUVshAn6pJ1BPu4jGxkMBP2aessW+cw==
X-Received: by 2002:a5d:9c02:: with SMTP id 2mr5616637ioe.195.1624567638969;
        Thu, 24 Jun 2021 13:47:18 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id l5sm1889744ion.44.2021.06.24.13.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jun 2021 13:47:18 -0700 (PDT)
Received: (nullmailer pid 1961320 invoked by uid 1000);
        Thu, 24 Jun 2021 20:47:13 -0000
Date:   Thu, 24 Jun 2021 14:47:13 -0600
From:   Rob Herring <robh@kernel.org>
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        linux-gpio@vger.kernel.org, Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>, bhupesh.linux@gmail.com
Subject: Re: [PATCH v2 01/10] dt-bindings: qcom: rpmh-regulator: Add
 compatible for SA8155p-adp board pmic
Message-ID: <20210624204713.GA1961271@robh.at.kernel.org>
References: <20210615074543.26700-1-bhupesh.sharma@linaro.org>
 <20210615074543.26700-2-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210615074543.26700-2-bhupesh.sharma@linaro.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 15 Jun 2021 13:15:34 +0530, Bhupesh Sharma wrote:
> Add compatible string for pmm8155au pmic found on
> the SA8155p-adp board.
> 
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Andy Gross <agross@kernel.org>
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> ---
>  .../devicetree/bindings/regulator/qcom,rpmh-regulator.yaml       | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
