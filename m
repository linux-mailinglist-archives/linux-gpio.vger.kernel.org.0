Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 061192AF8D9
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Nov 2020 20:18:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727535AbgKKTSl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Nov 2020 14:18:41 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:46635 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725955AbgKKTSl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Nov 2020 14:18:41 -0500
Received: by mail-oi1-f193.google.com with SMTP id q206so3379810oif.13;
        Wed, 11 Nov 2020 11:18:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=di89ZznidawI0fMPrCxwKTCrqn1VoBZdN86rMbY1IMU=;
        b=ENz2AS9qObd278EHm1mjKHtmsZvokB9l/x7XeQcajnXck01tyYMd37SReWVE5tzM0m
         rI2q3H/5I4qJuSCUKinHan7lFyjsphBAwBZQ62gHYNovBKzvWzTXpwWs7Nw9imKOViuG
         Vj+513ddz3h3wZwn314poP7rCoYVWGpIcJfmQg5MqUyyh4qQtv2lBwnBvoQWzJg8J6qe
         RIwJ2E9DpfeaMAzBbq2rlwOFInnvQEyfEb4YzCFzb43Av6wbC4+EwHozy6QB/W+plQIC
         WiY0nsP4P0smGMBs/E1jHLzY59n4gmnd2CvAz8lRxZAjufwC/bHR63hQJS8U8N4XKJ1p
         QL9g==
X-Gm-Message-State: AOAM532Y0yaumzkuvtFQA3Vwl8thEmuSi7r1F2PtACwppg6t2JSYMoKB
        bKrFziLEOeMNIpFb3Ee03A==
X-Google-Smtp-Source: ABdhPJzE5izdS/sK8OLSXsE4E3wtRh49ZnaKPqcrf64roQtnapt1kpAeuSbgJ27Zyva0dTwPbTN8vg==
X-Received: by 2002:aca:492:: with SMTP id 140mr3029530oie.108.1605122320334;
        Wed, 11 Nov 2020 11:18:40 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id n15sm693407otj.41.2020.11.11.11.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2020 11:18:39 -0800 (PST)
Received: (nullmailer pid 1861378 invoked by uid 1000);
        Wed, 11 Nov 2020 19:18:38 -0000
Date:   Wed, 11 Nov 2020 13:18:38 -0600
From:   Rob Herring <robh@kernel.org>
To:     Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc:     linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        punit1.agrawal@toshiba.co.jp, linux-arm-kernel@lists.infradead.org,
        yuji2.ishikawa@toshiba.co.jp
Subject: Re: [PATCH 1/4] dt-bindings: gpio: Add bindings for Toshiba Visconti
 GPIO Controller
Message-ID: <20201111191838.GA1860931@bogus>
References: <20201111172553.1369282-1-nobuhiro1.iwamatsu@toshiba.co.jp>
 <20201111172553.1369282-2-nobuhiro1.iwamatsu@toshiba.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201111172553.1369282-2-nobuhiro1.iwamatsu@toshiba.co.jp>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 12 Nov 2020 02:25:50 +0900, Nobuhiro Iwamatsu wrote:
> Add bindings for the Toshiba Visconti GPIO Controller.
> 
> Signed-off-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
> ---
>  .../bindings/gpio/toshiba,gpio-visconti.yaml  | 85 +++++++++++++++++++
>  1 file changed, 85 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/toshiba,gpio-visconti.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/gpio/toshiba,gpio-visconti.yaml: properties:gpio-ranges: 'truei' is not of type 'object', 'boolean'
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/gpio/toshiba,gpio-visconti.yaml: ignoring, error in schema: properties: gpio-ranges
warning: no schema found in file: ./Documentation/devicetree/bindings/gpio/toshiba,gpio-visconti.yaml


See https://patchwork.ozlabs.org/patch/1398028

The base for the patch is generally the last rc1. Any dependencies
should be noted.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

