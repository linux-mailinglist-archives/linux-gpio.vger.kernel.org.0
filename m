Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F4B73C7B32
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jul 2021 03:55:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237389AbhGNB6T (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Jul 2021 21:58:19 -0400
Received: from mail-il1-f169.google.com ([209.85.166.169]:39441 "EHLO
        mail-il1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229843AbhGNB6S (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Jul 2021 21:58:18 -0400
Received: by mail-il1-f169.google.com with SMTP id a7so11955iln.6;
        Tue, 13 Jul 2021 18:55:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GyixVvvN8xYoDdReijEmK7j+HPjzKgwZBAHLb0q9B1c=;
        b=QCkXNO/IXcaWz6gPUaz7W+FswU4vgS7sJjvi1fSyx/NZxXIwVsfzg8bSZzcq85jgQi
         oueK7rQjHrcAIP4w6G/q/T+kpcNUcqpLuoFa5dzW9bANCkqavI4g1e2xbA1NCpB90HjW
         SZ3ORRR4lkaK2kTULt/DWsVKUebeon0cA07iHfPovrtRIL56QBAjNHM6IktcPk0+MA1n
         ZSPw4tNk8HSBkHTPX9m0nyumJPCplnct3PqiRFvRCRVGrgDoR4bx4VV4WOPrxyM4FQTJ
         8S32DpaYYWM/qJgucb/wUW2kyxYna0e95YD0UWYg0QAzEtWfp3+4Uvgrqm/Qpn3SCYpC
         0zXQ==
X-Gm-Message-State: AOAM532jmdpU239WSqQySkiQXv4csuF1AgVsYdsBPs+usPUR3dPGNo43
        RxSp+KNcLDwtcIZI2BF+Sg==
X-Google-Smtp-Source: ABdhPJzdi/kxKVUi6wh+3oNlY2WUkI3leixL7fD/UzDBGp79/lDvoIMgifqy9i4sE7opJ7yMSN5Djg==
X-Received: by 2002:a92:360b:: with SMTP id d11mr4929511ila.111.1626227726602;
        Tue, 13 Jul 2021 18:55:26 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id k10sm338422ion.38.2021.07.13.18.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jul 2021 18:55:25 -0700 (PDT)
Received: (nullmailer pid 1280482 invoked by uid 1000);
        Wed, 14 Jul 2021 01:55:21 -0000
Date:   Tue, 13 Jul 2021 19:55:21 -0600
From:   Rob Herring <robh@kernel.org>
To:     Iskren Chernev <iskren.chernev@gmail.com>
Cc:     phone-devel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v5 1/2] dt-bindings: pinctrl: qcom: Add SM6115 pinctrl
 bindings
Message-ID: <20210714015521.GA1280423@robh.at.kernel.org>
References: <20210627185628.691435-1-iskren.chernev@gmail.com>
 <20210627185628.691435-2-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210627185628.691435-2-iskren.chernev@gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, 27 Jun 2021 21:56:27 +0300, Iskren Chernev wrote:
> Add device tree binding Documentation details for Qualcomm SM6115 and
> SM4250 pinctrl.
> 
> Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  .../bindings/pinctrl/qcom,sm6115-pinctrl.yaml | 180 ++++++++++++++++++
>  1 file changed, 180 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sm6115-pinctrl.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
