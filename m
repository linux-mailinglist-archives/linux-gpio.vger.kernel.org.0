Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7266C3C929E
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jul 2021 22:56:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234152AbhGNU7g (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Jul 2021 16:59:36 -0400
Received: from mail-io1-f46.google.com ([209.85.166.46]:44888 "EHLO
        mail-io1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229782AbhGNU7f (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Jul 2021 16:59:35 -0400
Received: by mail-io1-f46.google.com with SMTP id v26so3814367iom.11;
        Wed, 14 Jul 2021 13:56:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zf2RhNz05fNIFckY0kQkShTw8ZYBNokJL+AFOEm4i58=;
        b=Qd7jIiD3wOhfydrCuCa7q5U8lpGEl1UkbmTsbPM/YFHW9QLXP1uPc2z7jF39L7r7s6
         7OHR6h1H+AiWx7v0WQcN9KAwy9RZftj0bcNITCWjxVKxOpCbsouHGyiNAbbTBFNdg19G
         EMG6cE/IqNIvG7KF8P/wgzT1yvoPyYKQVvz9x3bQQV8+hdA7Dh9nKDrJw9EEknGE4LAz
         N1y3N1x7FwoIvFnynhbkyyxDtOItIUfwJAh0lR8BhviPrJS66v6TDWe553vgE0eu7E4k
         frknDYS4l242YjpRw59j+YGyFFRG6eJjFThJkecFp/5NjQrAKMkScBH7wow+HUeZc/3B
         /lgA==
X-Gm-Message-State: AOAM530KhdOoRkKDm4E0tFmc4dHYSfrdc5aXHCJ08idSpQJsmst07R3G
        5AQzoYVi+60lchD4xIJREw==
X-Google-Smtp-Source: ABdhPJwASkvpIiVzj1ASbW61fxJa7NjZnlUa3KsA+3U1bqynlTf2XJy/CRTduCy7UroAfteTgzQ1lg==
X-Received: by 2002:a05:6638:144f:: with SMTP id l15mr152564jad.67.1626296202679;
        Wed, 14 Jul 2021 13:56:42 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id p19sm1849694iob.7.2021.07.14.13.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 13:56:42 -0700 (PDT)
Received: (nullmailer pid 3508255 invoked by uid 1000);
        Wed, 14 Jul 2021 20:56:40 -0000
Date:   Wed, 14 Jul 2021 14:56:40 -0600
From:   Rob Herring <robh@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] pinctrl: qcom: spmi-gpio: Add pmc8180 & pmc8180c
Message-ID: <20210714205640.GA3508199@robh.at.kernel.org>
References: <20210629003851.1787673-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210629003851.1787673-1-bjorn.andersson@linaro.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 28 Jun 2021 17:38:51 -0700, Bjorn Andersson wrote:
> The SC8180x platform comes with PMC8180 and PMC8180c, add support for
> the GPIO controller in these PMICs.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt | 4 ++++
>  drivers/pinctrl/qcom/pinctrl-spmi-gpio.c                     | 2 ++
>  2 files changed, 6 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
