Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D517456776
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Nov 2021 02:28:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233915AbhKSBbi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 18 Nov 2021 20:31:38 -0500
Received: from mail-ot1-f51.google.com ([209.85.210.51]:45647 "EHLO
        mail-ot1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229754AbhKSBbh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 18 Nov 2021 20:31:37 -0500
Received: by mail-ot1-f51.google.com with SMTP id a23-20020a9d4717000000b0056c15d6d0caso14207097otf.12;
        Thu, 18 Nov 2021 17:28:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fR1VJ/80szE87lgDNoz3DRsA8IUgZ2yjTGFOwsF+19Q=;
        b=rXJFIxFjmbnKc+I1h4BDwSuIVX49ksnQOxkRNVOP4nWLX41KYMGeFOImDd2JsMssaA
         COpGSvxrFDYEbYy9uGrYdQkusfJGbb08iBfvzromu5I7trgAwqfWp4ABYDVFg/XLZCD1
         N0cW6nlI2npaxuSlWbdTeDG++iVoxZlxEl6LXGWZR9LwWWjDBG4rJdHet972+FmPiHZy
         2CvTbdwerqaLcBKW5PFL3/jnmptxbxmk8Q7SfIkaFD86xGQMiKRxdNWZA6koPpOuLVls
         yK3n0W8ILXzNda9IA+ln85KGxJVKlnn4SiZUYbxDcZhD6fFMqUEZXm0RDJsJUzrn2afj
         hoAw==
X-Gm-Message-State: AOAM533v1m+EylwMRjZC4NxMIrh5dIBMJP/4hWS0QzdAmpAz1bAbLw/p
        1usFQeecvk45vcWItEalfQ==
X-Google-Smtp-Source: ABdhPJyZcjtKi5Q9Eiyg8OMNrHwgUkBHtBi1oBatMrpiGEMRVgwYftBXoXQyz3wsrf2Pxao+JMemiw==
X-Received: by 2002:a05:6830:34a0:: with SMTP id c32mr1425800otu.379.1637285316373;
        Thu, 18 Nov 2021 17:28:36 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id f25sm286166oog.44.2021.11.18.17.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Nov 2021 17:28:35 -0800 (PST)
Received: (nullmailer pid 2185444 invoked by uid 1000);
        Fri, 19 Nov 2021 01:28:34 -0000
Date:   Thu, 18 Nov 2021 19:28:34 -0600
From:   Rob Herring <robh@kernel.org>
To:     Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Cc:     devicetree@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: pinctrl: uniphier: Add child node
 definitions to describe pin mux and configuration
Message-ID: <YZb9wqhoxTPiS2QW@robh.at.kernel.org>
References: <1636416699-21033-1-git-send-email-hayashi.kunihiko@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1636416699-21033-1-git-send-email-hayashi.kunihiko@socionext.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 09 Nov 2021 09:11:39 +0900, Kunihiko Hayashi wrote:
> In arch/arm/boot/dts/uniphier-pinctrl.dtsi, there are child nodes of
> pinctrl that defines pinmux and pincfg, however, there are no rules about
> that in dt-bindings.
> 
> 'make dtbs_check' results an error with the following message:
> 
>    pinctrl: 'ain1', 'ain2', 'ainiec1', 'aout', 'aout1', 'aout2', ...
>    ... 'usb2', 'usb3' do not match any of the regexes: 'pinctrl-[0-9]+'
> 
> To avoid the issue, add the rules of pinmux and pincfg in each child node
> and grandchild node.
> 
> Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
> ---
> Changes since v2:
> - Describe additionalProperties directly instead of patternProperties
> - Remove unnecessary unevaluatedProperties
> 
> Changes since v1:
> - Replace additionalProperties with unevaluatedProperties
> - Add additionalProperties for child and grandchild nodes
> 
> .../pinctrl/socionext,uniphier-pinctrl.yaml        | 38 ++++++++++++++++++++--
>  1 file changed, 36 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
