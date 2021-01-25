Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A3A7302F4C
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Jan 2021 23:44:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732127AbhAYWni (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 Jan 2021 17:43:38 -0500
Received: from mail-oi1-f179.google.com ([209.85.167.179]:37452 "EHLO
        mail-oi1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732706AbhAYWnP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 Jan 2021 17:43:15 -0500
Received: by mail-oi1-f179.google.com with SMTP id r189so16550431oih.4;
        Mon, 25 Jan 2021 14:42:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RG2OD+U32R5mTlXKaJSdwx5Qmsh0fQnS2Kh57eD3bpA=;
        b=PCQ3L+aWRaaWHPpK59HJmldsA5iV22eykf8SUCkgA8cCXY4m/p9NWGToGkhJmnNzjx
         Hi36aalLC84Rdq2qV0pZ55D2dsMenuiPNXWGzAQa0tpv2mODgKwtts+sNi1bSmMBKWyk
         a2Ox9IckCNycL2uxMnwg0vcMYkutyk9y33d66ZsOarDZD9KeGCH7HGNh0pgh/Z4025H6
         hlWBZqLxgnydN+3XX/3k1nl1IimLHOABTiq7Ow849TQ8aKbp5fYrkAy7yCK1HWh+u/tY
         vwPW6ZlbVMTizW7q3hI/7PNE8m+ckEUoK8FsI4j/d/+rdU2tKbuYsRytClg7IRGEHT2Z
         5oJw==
X-Gm-Message-State: AOAM5317jkJfC8NrZVMpHxw05rcINm2m8BQCGeynauPAbF/XOpDMCifS
        AHwZnDLwMbk+swNOSOctPQ==
X-Google-Smtp-Source: ABdhPJygr0QmXj2Butg7FfRjf1eJch08Q2pQHX10bZEgYH7lmXjrX3IUcvL47V3Bo4WaLw62tqLopg==
X-Received: by 2002:aca:ecc8:: with SMTP id k191mr1485929oih.179.1611614554463;
        Mon, 25 Jan 2021 14:42:34 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id z10sm1559123oid.51.2021.01.25.14.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 14:42:33 -0800 (PST)
Received: (nullmailer pid 1164611 invoked by uid 1000);
        Mon, 25 Jan 2021 22:42:32 -0000
Date:   Mon, 25 Jan 2021 16:42:32 -0600
From:   Rob Herring <robh@kernel.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Gross <agross@kernel.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] pinctrl: qcom-pmic-gpio: Add support for pm8019
Message-ID: <20210125224232.GA1164555@robh.at.kernel.org>
References: <20210115171115.123155-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210115171115.123155-1-konrad.dybcio@somainline.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 15 Jan 2021 18:11:13 +0100, Konrad Dybcio wrote:
> PM8019 provides 6 GPIOs. Add a compatible to support that.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
>  Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt | 1 +
>  drivers/pinctrl/qcom/pinctrl-spmi-gpio.c                     | 1 +
>  2 files changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
