Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96E6C43611E
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Oct 2021 14:12:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231346AbhJUMOp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Oct 2021 08:14:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231203AbhJUMOo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Oct 2021 08:14:44 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80D82C06174E
        for <linux-gpio@vger.kernel.org>; Thu, 21 Oct 2021 05:12:28 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id r18so750092wrg.6
        for <linux-gpio@vger.kernel.org>; Thu, 21 Oct 2021 05:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=0vIQqYKkVJx23x9coP48EXe0l28e0ZIhnZSwiowHwyg=;
        b=fjDYojDfUIX7vpR8IADwpgpzztO0mBpWvU65QUoNAhI5h5l4jvmUm9miufICBJ5fu+
         FxiTVlKpiDwYP9RvWlJVzgmCn3rKhVbPBFdp3eV8AhF2NEhLLUTgdfsXR6jOaKfV95yA
         yKh8F+J7jnDhCPp43d4HMm/IFi5aPJNRVnbPhadYav0+2DUOEOyshcveJJlYbHUBBW89
         Gsnd+/3PE0Y4U0MHiH5O9sI0rqUhz35zhF46IeFgbtyqZUXESpSdaHnQMpFL1oUoZCPz
         VcOuC9wOfHlEiiYm1/30+n9HZsc9I3fqsfVUg3Hb9vpiPeZPD4gkJpKPjASc40Nw/YQx
         Tr/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=0vIQqYKkVJx23x9coP48EXe0l28e0ZIhnZSwiowHwyg=;
        b=DTT7m6mtfawrvHOHCUugTqSE3FFICdpiABhNmAxGwYz4X4vbihB0MI4jelArRu0vbg
         mGmu5q42nXOG9HjrfCD/eHT4HNkflyyb0oOSc/WLZKXhKSOH/OXu29AV3qu6xnlFa8Pn
         QkaPoDSQqnMXoHVRvghJcUJi/yowlN3W6Vrggiz7xnUZCWlDKE1oskl6iBg7IiUeXtwG
         7yi8MR3F31lkOBQBtRXjNR5DaKRpZCrp9h303M3e185EQpmjlo/I/xfm+jluZmV7KFKb
         PdQmvoqqpkEX7ua9VhwnDax5yZdw43lKNAVQ5pOXvr97S9ldw7uILjH7vrAiYr/4agmb
         WREA==
X-Gm-Message-State: AOAM530EWQM+8ahvRZQ8njZIVK65zjN44nd7QZ/40K2YsUJnpeFUzBYI
        r4NMxKev0+f/IdQoS14p5pdfmA==
X-Google-Smtp-Source: ABdhPJzQay9dVlMqf3DY2Soi8sHXotsMVqIdyaXQBVCXgXq5JubAhzo8DeCcf5lcsyavZ1roeJjN1g==
X-Received: by 2002:a05:6000:1683:: with SMTP id y3mr6576853wrd.314.1634818346988;
        Thu, 21 Oct 2021 05:12:26 -0700 (PDT)
Received: from google.com ([95.148.6.207])
        by smtp.gmail.com with ESMTPSA id a2sm5200597wrq.9.2021.10.21.05.12.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 05:12:26 -0700 (PDT)
Date:   Thu, 21 Oct 2021 13:12:24 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Chen-Yu Tsai <wens@csie.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 20/23] dt-bindings: mfd: update x-powers,axp152.yaml
 reference
Message-ID: <YXFZKGfFTbjAVCb5@google.com>
References: <cover.1634630485.git.mchehab+huawei@kernel.org>
 <aedef820f4dc9af5d3a3fcce2ad733d75e1ad4f0.1634630486.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aedef820f4dc9af5d3a3fcce2ad733d75e1ad4f0.1634630486.git.mchehab+huawei@kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 19 Oct 2021, Mauro Carvalho Chehab wrote:

> Changeset f38d3e404326 ("dt-bindings: mfd: Convert X-Powers AXP binding to a schema")
> renamed: Documentation/devicetree/bindings/mfd/axp20x.txt
> to: Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml.
> 
> Update its cross-reference accordingly.
> 
> Fixes: f38d3e404326 ("dt-bindings: mfd: Convert X-Powers AXP binding to a schema")
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
> 
> To mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH v3 00/23] at: https://lore.kernel.org/all/cover.1634630485.git.mchehab+huawei@kernel.org/
> 
>  Documentation/devicetree/bindings/gpio/gpio-axp209.txt | 2 +-

This file no longer exists.

If it's still relevant, please rebase onto Linux -next and resubmit.

See this commit for details:

  dt-bindings: gpio: Convert X-Powers AXP209 GPIO binding to a schema

>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-axp209.txt b/Documentation/devicetree/bindings/gpio/gpio-axp209.txt
> index fc42b2caa06d..538f04e60ff9 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio-axp209.txt
> +++ b/Documentation/devicetree/bindings/gpio/gpio-axp209.txt
> @@ -17,7 +17,7 @@ Required properties:
>  - gpio-controller: Marks the device node as a GPIO controller.
>  
>  This node must be a subnode of the axp20x PMIC, documented in
> -Documentation/devicetree/bindings/mfd/axp20x.txt
> +Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
>  
>  Example:
>  

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
