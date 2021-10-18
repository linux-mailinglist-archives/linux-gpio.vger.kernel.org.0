Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 704474326BA
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Oct 2021 20:40:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232181AbhJRSma (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Oct 2021 14:42:30 -0400
Received: from mail-ot1-f54.google.com ([209.85.210.54]:38487 "EHLO
        mail-ot1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232204AbhJRSm3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Oct 2021 14:42:29 -0400
Received: by mail-ot1-f54.google.com with SMTP id l10-20020a056830154a00b00552b74d629aso995156otp.5;
        Mon, 18 Oct 2021 11:40:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=r3X1ifyviq85D3kYFgE9ZYCvHfqfPnp8hioFYQJaRoM=;
        b=d5FiuE7MrvzPz8g1Dpab3nzMk+9y/J4+JXkZ6S2tWjEGu13tkQGsQTICzfrFITd3bq
         ZWmhiSJugKb+SPnarYrBQkc5Cedl0iP7LfOps7fwzTN0cN/Jzd4NtoSyknJtt284YqLE
         014cZNfuk7mXBBPNBnS0LC8LunrelpHRpyQFWx1Uvkz3a+yTSdHKBGzxW0ejZyoHvFES
         Flxx4qjWuLuax/dkWKvbVsi2zNOrtr63bLZifcE/F7X6AfXjgFJqBChVz9ofbspO5x48
         pIqEERs5sSJWJMAfjXFMhp4XzqwJA//yUOfWyx15Dpcn3lH7vzZAGRf9YC0f2TGDphv3
         gjrw==
X-Gm-Message-State: AOAM531ZTwx+MKq/2vCkokMB4YYAe8ONNmrQqZmgypPJ4omtgSiqABKR
        EMLPtU7qq/AjP4dTlbAmz8mIuH6riA==
X-Google-Smtp-Source: ABdhPJyTISW6vAihjTlJRqFSF5/LmNUGpNgtLZ+xBpIe5B1qpA0fRBu5T1XlOKP4Jr7ckjcEYaOlpg==
X-Received: by 2002:a05:6830:57d:: with SMTP id f29mr1287524otc.285.1634582417871;
        Mon, 18 Oct 2021 11:40:17 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id w9sm3108564otp.64.2021.10.18.11.40.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Oct 2021 11:40:17 -0700 (PDT)
Received: (nullmailer pid 2725898 invoked by uid 1000);
        Mon, 18 Oct 2021 18:40:16 -0000
Date:   Mon, 18 Oct 2021 13:40:16 -0500
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 02/25] dt-bindings: mfd: qcom-pm8xxx: add missing
 child nodes
Message-ID: <YW2/kL2cGgUEqhpJ@robh.at.kernel.org>
References: <20211008012524.481877-1-dmitry.baryshkov@linaro.org>
 <20211008012524.481877-3-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211008012524.481877-3-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 08 Oct 2021 04:25:01 +0300, Dmitry Baryshkov wrote:
> Add gpio@[0-9a-f]+, mpps@[0-9a-f]+ and xoadc@[0-9a-f]+ as possible child
> nodes of qcom,pm8xxx, referencing existint schema files. Schema for
> other possible nodes does not exist yet.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../devicetree/bindings/mfd/qcom-pm8xxx.yaml         | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
