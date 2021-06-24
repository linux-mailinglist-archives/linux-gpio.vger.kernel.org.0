Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B00EA3B38A2
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jun 2021 23:24:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232776AbhFXV05 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Jun 2021 17:26:57 -0400
Received: from mail-io1-f49.google.com ([209.85.166.49]:44996 "EHLO
        mail-io1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232767AbhFXV0z (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Jun 2021 17:26:55 -0400
Received: by mail-io1-f49.google.com with SMTP id h2so10046625iob.11;
        Thu, 24 Jun 2021 14:24:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7yI9P281ZxKG6dmBJj8GGNL9wvsF488zaBaGlQ6/zy4=;
        b=pJPKjfKrAHMAl/c32BfzXW3ert3eaFmK0Y49i9GEPQW0p9NjmzqUGN1ikB6/Mb0Hk7
         ZKy037AZqM0KtG0/CiPn7RNoiiu6VZC00CwWxsqFfl6dSGSPcxj8/xs6oKXFxV45bnte
         mcflBt+o/VumQ1Nok8xYie6dFgqsWs0AmtAByCgBIxjwSi4GmxY4uQuEQEqIPfBrEfRH
         8oSxXQMD7M6k/yoGR0R0z91q3FtK2XnfqhOlMcYp1noApgK6AraherrGcwqhIvJujeXY
         3k8rPdtbHgLZpQZNCIQtMS3AP5UpSMDFNBVzKSa4oWwsBeU1bNDnbnh9g6AoXgmexJKa
         VV/A==
X-Gm-Message-State: AOAM530mi3LbYpsWZ5PPYPveLZhAImARd142VHsPYIRd+/k2gbjwbdpI
        v6qpHOqDlX/T2e1DCJMBew==
X-Google-Smtp-Source: ABdhPJyHVrrLbj0MmOQ6REXC9qGyTsulWdJgY+XivlG8tQf8uooOO8xaCrIC2kb93pfYx5+9yoOdlg==
X-Received: by 2002:a02:9f12:: with SMTP id z18mr6511765jal.54.1624569874814;
        Thu, 24 Jun 2021 14:24:34 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id s9sm2541236ilt.44.2021.06.24.14.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jun 2021 14:24:31 -0700 (PDT)
Received: (nullmailer pid 2011496 invoked by uid 1000);
        Thu, 24 Jun 2021 21:24:29 -0000
Date:   Thu, 24 Jun 2021 15:24:29 -0600
From:   Rob Herring <robh@kernel.org>
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     bhupesh.linux@gmail.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org, lgirdwood@gmail.com,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/4] dt-bindings: pinctrl: qcom,pmic-gpio: Add
 compatible for SA8155p-adp
Message-ID: <20210624212429.GA2011467@robh.at.kernel.org>
References: <20210617053432.350486-1-bhupesh.sharma@linaro.org>
 <20210617053432.350486-3-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210617053432.350486-3-bhupesh.sharma@linaro.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 17 Jun 2021 11:04:30 +0530, Bhupesh Sharma wrote:
> Add pmic-gpio compatible string for pmm8155au pmic
> found on the SA8155p-adp board.
> 
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> ---
>  Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
