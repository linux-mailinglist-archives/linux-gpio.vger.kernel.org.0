Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83C85302F45
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Jan 2021 23:44:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732149AbhAYWnm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 Jan 2021 17:43:42 -0500
Received: from mail-ot1-f47.google.com ([209.85.210.47]:40828 "EHLO
        mail-ot1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732796AbhAYWnf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 Jan 2021 17:43:35 -0500
Received: by mail-ot1-f47.google.com with SMTP id i20so14447830otl.7;
        Mon, 25 Jan 2021 14:43:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=avsiXZCixrNh+X+692dsqB5esKCpR0Z+YtPJub+uXks=;
        b=l2Ao/R9kYXWFeolaREoIU0TmEb3Dk6Eup9OfHb1RAaU55v/UWzv0BFjbPnpc3P7VjD
         rpjfvpOK3jgEZQI1z/+mrf2SGBQ+rXoVB5Xs744SoWcPdbADOkXOtilW2fcTW2Ef55KC
         6NsBeTt29MdfpiFbXzohjb+x5Pw8zdv8tPLvS8nbZPgavKkUB4DGhRyTkfrWRHiiQupb
         1q7vlTADfzLrAcSwCKeqzyYtz/x+O+3RP6E0N/uKbSABfp9oazOHvf1b8ZtdlY1TBhXu
         swvfWh42cHLO3IsovLKHNZfMB1MPO95FM1tmb+exC20tuhnhlonUPNjrg7bXRIMzSh8X
         HC3w==
X-Gm-Message-State: AOAM531GsJaabgtKdWFD9if6y7MHGOdtZRVI0BU088oIBBGy1JidxY9S
        0GFpSKcP6AoKSxc4YT4x5Q==
X-Google-Smtp-Source: ABdhPJwXPggg/6GY35/nHqsCrO5U86BPSpz+VF3DdYdD3SrfoaJcWgvSj+gIszdzLCetQC2AvbERMQ==
X-Received: by 2002:a9d:6f08:: with SMTP id n8mr1915611otq.137.1611614574170;
        Mon, 25 Jan 2021 14:42:54 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id s69sm3810600oih.38.2021.01.25.14.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 14:42:53 -0800 (PST)
Received: (nullmailer pid 1165319 invoked by uid 1000);
        Mon, 25 Jan 2021 22:42:52 -0000
Date:   Mon, 25 Jan 2021 16:42:52 -0600
From:   Rob Herring <robh@kernel.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        devicetree@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] pinctrl: qcom: spmi-mpp: Add PM8019 compatible
Message-ID: <20210125224252.GA1165239@robh.at.kernel.org>
References: <20210115171115.123155-1-konrad.dybcio@somainline.org>
 <20210115171115.123155-2-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210115171115.123155-2-konrad.dybcio@somainline.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 15 Jan 2021 18:11:14 +0100, Konrad Dybcio wrote:
> PM8019 provides 6 MPPs. Add a compatible to support them.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
>  Documentation/devicetree/bindings/pinctrl/qcom,pmic-mpp.txt | 1 +
>  drivers/pinctrl/qcom/pinctrl-spmi-mpp.c                     | 1 +
>  2 files changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
