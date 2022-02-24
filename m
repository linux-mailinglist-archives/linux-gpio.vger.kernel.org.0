Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D6874C33D4
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Feb 2022 18:36:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232111AbiBXRg0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Feb 2022 12:36:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232101AbiBXRg0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Feb 2022 12:36:26 -0500
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2D6E24FB90;
        Thu, 24 Feb 2022 09:35:55 -0800 (PST)
Received: by mail-oi1-f171.google.com with SMTP id z7so3704077oid.4;
        Thu, 24 Feb 2022 09:35:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=klEDg5xaLmwGMmDFj0Syyx96vH8dGFxc+1+/k1n87DE=;
        b=hFGt2/eK/Ge+zQyOacPUHFiduM34rCcteQrsXlaHa/pWeoAR9uvzlPngv+FnCE+t0C
         akkAo3GRZP5QxNVe/PEcw/kdLWTcgksqaME/Ix+6DU1WPO4Y3CY8C0C2/T1YMUfjt7ng
         d1UDz4Ufmuyf7zb9EJcZD6bd7UDZXzAByuI2SNZrQOhw7+JeFEFszZ152mNeTBDQ228x
         JiIfjXFDkqcslipkv7E1xkOVPs/HJ1ybIUx175rGl+VYmWHH5hQoCve/T5PKY9PBm6rV
         PN+9YAIzNpB7zV1h0jgKCUG3W6U+2LZkJ3pLh6RtYUSZo55z9m2Lu70F2RHMPJy8Fc6V
         jIKA==
X-Gm-Message-State: AOAM532lxnHuI3gEbUWv/dpihhF2s/QwZIt/THatK/axa3EKEDZp3H89
        xBZd0SRVQpaHORBu7k3nAKbYEetm7g==
X-Google-Smtp-Source: ABdhPJyFqrMyj2l2hZtHUaFlCpOH25ENijWaXc+YSydXVPDRpl5CSq/kruMJI4YK3dMleFp0J7J52A==
X-Received: by 2002:a05:6870:3:b0:d3:7b0c:ee0d with SMTP id a3-20020a056870000300b000d37b0cee0dmr6601430oaa.195.1645724155205;
        Thu, 24 Feb 2022 09:35:55 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id bl16-20020a056808309000b002d43b28a8bdsm26736oib.14.2022.02.24.09.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 09:35:54 -0800 (PST)
Received: (nullmailer pid 3285581 invoked by uid 1000);
        Thu, 24 Feb 2022 17:35:53 -0000
Date:   Thu, 24 Feb 2022 11:35:53 -0600
From:   Rob Herring <robh@kernel.org>
To:     Aparna M <a-m1@ti.com>
Cc:     bgolaszewski@baylibre.com, linus.walleij@linaro.org,
        a-govindraju@ti.com, robh+dt@kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        grygorii.strashko@ti.com, praneeth@ti.com
Subject: Re: [PATCH v5] dt-bindings: gpio: Convert TI TPIC2810 GPIO
 Controller bindings to YAML
Message-ID: <YhfB+c6zMiCjbE96@robh.at.kernel.org>
References: <20220223174215.17838-1-a-m1@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220223174215.17838-1-a-m1@ti.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 23 Feb 2022 23:12:15 +0530, Aparna M wrote:
> Convert gpio-tpic2810 bindings to yaml format and remove outdated
> bindings in .txt format.
> 
> Signed-off-by: Aparna M <a-m1@ti.com>
> ---
> 
> v4 -> v5: Fix indentation issues
> v3 -> v4: Add gpio-line-names property
> v2 -> v3: Remove redundant descriptions and make minor change in example
> v1 -> v2: Fix identation issues and update commit message
> 
>  .../bindings/gpio/gpio-tpic2810.txt           | 16 ------
>  .../bindings/gpio/gpio-tpic2810.yaml          | 51 +++++++++++++++++++
>  2 files changed, 51 insertions(+), 16 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-tpic2810.txt
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-tpic2810.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
