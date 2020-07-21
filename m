Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 839B122770D
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jul 2020 05:37:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726998AbgGUDhT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Jul 2020 23:37:19 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:42698 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726135AbgGUDhS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Jul 2020 23:37:18 -0400
Received: by mail-io1-f65.google.com with SMTP id c16so19870934ioi.9;
        Mon, 20 Jul 2020 20:37:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+9qom4iCMnZgg5OUyCqy8rMrulXYpgfPi7u8JdN9+6A=;
        b=tS5IdtYqgv2o44mjHGpOpkpXaamuf3ynj/sXDSyJLFyn6r7G5id6AQuiq2e9HPZzz4
         mCy8iIacwCaDlSFJj0XeyjirEPGK2EhJ0RW2S/xX0HbHa/t9EUVm25D0lOLQTZ5BrCsn
         Um6/lyxuQtAlca3jfIuAI3wfNSJKUCEwunzYkX78vwzO0iaeqYqV6vSAmJyECMhGJWW5
         BkdO3FGhbOV3e3lHxKxY2SE+hL3OANhcq7MQi45TB1GxFtLqLR0RDVQ1n5VCzI7FUj6Z
         fv8GmxrteejTgUtlsIgEtxRJkGjMWBzdj72zmoVN2hAv2hS0ccYBEmFUwFkchRPUIPwN
         ThOQ==
X-Gm-Message-State: AOAM531NraLKP3gcVkIUNvBB3vO9EO6oARxE68Qvho/p1ZaI5+GUxKxt
        dokgj59FfBWW4COve9YhaA==
X-Google-Smtp-Source: ABdhPJxl+n2NOcu3KNd/qL1dRY3dBGjtNr9GskY73pB8dsE/f7YJXe0PSnxF3WpVFTdaHqxHx7XHpA==
X-Received: by 2002:a5e:880f:: with SMTP id l15mr24770541ioj.94.1595302637676;
        Mon, 20 Jul 2020 20:37:17 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id a1sm9761517ilq.50.2020.07.20.20.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2020 20:37:17 -0700 (PDT)
Received: (nullmailer pid 3508431 invoked by uid 1000);
        Tue, 21 Jul 2020 03:37:16 -0000
Date:   Mon, 20 Jul 2020 21:37:16 -0600
From:   Rob Herring <robh@kernel.org>
To:     Bartosz Dudziak <bartosz.dudziak@snejp.pl>
Cc:     linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Gross <agross@kernel.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: qcom: Add msm8226 pinctrl
 bindings
Message-ID: <20200721033716.GA3508379@bogus>
References: <20200716205530.22910-1-bartosz.dudziak@snejp.pl>
 <20200716205530.22910-2-bartosz.dudziak@snejp.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200716205530.22910-2-bartosz.dudziak@snejp.pl>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 16 Jul 2020 22:55:28 +0200, Bartosz Dudziak wrote:
> Add device tree binding Documentation details for Qualcomm msm8226
> pinctrl driver.
> 
> - Bindings documentation was based on qcom,ipq6018-pinctrl.yaml added by
>   Sricharan R <sricharan@codeaurora.org> and then modified for msm8226
>   content
> 
> Signed-off-by: Bartosz Dudziak <bartosz.dudziak@snejp.pl>
> ---
>  .../pinctrl/qcom,msm8226-pinctrl.yaml         | 132 ++++++++++++++++++
>  1 file changed, 132 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
