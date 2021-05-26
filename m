Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9466B391816
	for <lists+linux-gpio@lfdr.de>; Wed, 26 May 2021 14:56:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234416AbhEZM5q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 May 2021 08:57:46 -0400
Received: from mail-ot1-f41.google.com ([209.85.210.41]:44803 "EHLO
        mail-ot1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234307AbhEZM5q (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 May 2021 08:57:46 -0400
Received: by mail-ot1-f41.google.com with SMTP id r26-20020a056830121ab02902a5ff1c9b81so874632otp.11;
        Wed, 26 May 2021 05:56:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=iXkqXiBQsewY7UKLQHq7T0TF8tElAuseKNt3ptiyGJ4=;
        b=SrrYEGJ+ejyq2JIXhpTL/koZk4GTURSDiMQncNsxMRLk01U/3B3JL7D6aiLK86ToqH
         x2UkCRb6oyCZR8k6G7Wnh8N8lT1yG1iVmVBhX+4himE8mEKvHqDZ3y5WVXVrLNlPpQCG
         dtifcBLKEZt3TLXg2T66QA7M/1DPuuDXdxR3UXpsVwSFMkuyHT6TYsY52NnV045DEmPu
         F2uceJLrpB4aVKrte1V28YM/tohteXJ1jUXSMIpFqcgqS/GjrkHE38A9KurMofRumBH/
         EaPMJrb++Pa558TI7MSvX+1k67TtzkUi/aTQCYepu6P8qGn9gO4Yz5yeplzA3BANMmY/
         qAYA==
X-Gm-Message-State: AOAM531KgqK76cZABUbMFJCRmuHppuWkW5LttOBu3e5I+pAixjMWmdoZ
        MyNRkIPZrEJQ30DaITuxvg==
X-Google-Smtp-Source: ABdhPJx1SX2j4YDypYABA+wb3uBPh/k8hKTtGDCXeEygHSeYOGOPwQMV2VN+T2/oZmGj5M3Tp+Treg==
X-Received: by 2002:a05:6830:2472:: with SMTP id x50mr2212909otr.277.1622033773373;
        Wed, 26 May 2021 05:56:13 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id x65sm4411042otb.59.2021.05.26.05.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 05:56:12 -0700 (PDT)
Received: (nullmailer pid 2377039 invoked by uid 1000);
        Wed, 26 May 2021 12:56:03 -0000
From:   Rob Herring <robh@kernel.org>
To:     Steven Lee <steven_lee@aspeedtech.com>
Cc:     Joel Stanley <joel@jms.id.au>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        billy_tsai@aspeedtech.com,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-aspeed@lists.ozlabs.org>, Hongweiz@ami.com,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>, ryan_chen@aspeedtech.com,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-arm-kernel@lists.infradead.org>,
        Andrew Jeffery <andrew@aj.id.au>,
        Linus Walleij <linus.walleij@linaro.org>
In-Reply-To: <20210526094609.14068-2-steven_lee@aspeedtech.com>
References: <20210526094609.14068-1-steven_lee@aspeedtech.com> <20210526094609.14068-2-steven_lee@aspeedtech.com>
Subject: Re: [PATCH v1 1/4] dt-bindings: aspeed-sgpio: Convert txt bindings to yaml.
Date:   Wed, 26 May 2021 07:56:03 -0500
Message-Id: <1622033763.789353.2377038.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 26 May 2021 17:46:05 +0800, Steven Lee wrote:
> SGPIO bindings should be converted as yaml format.
> In addition to the file conversion, a new property max-ngpios is
> added in the yaml file as well.
> The new property is required by the enhanced sgpio driver for
> making the configuration of the max number of gpio pins more flexible.
> 
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> ---
>  .../bindings/gpio/aspeed,sgpio.yaml           | 91 +++++++++++++++++++
>  .../devicetree/bindings/gpio/sgpio-aspeed.txt | 46 ----------
>  2 files changed, 91 insertions(+), 46 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml
>  delete mode 100644 Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/gpio/aspeed,sgpio.yaml#

See https://patchwork.ozlabs.org/patch/1483966

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

