Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D6CA22B898
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Jul 2020 23:27:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726033AbgGWV1j (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Jul 2020 17:27:39 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:45767 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726029AbgGWV1i (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Jul 2020 17:27:38 -0400
Received: by mail-io1-f66.google.com with SMTP id e64so7787076iof.12;
        Thu, 23 Jul 2020 14:27:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KYFhhtmamYnsyMYSO+BlB/DMR9PAgEAn+jEIQggR+2M=;
        b=ACOwJaRAvi6x2jWGEYm2P5GfOJD+wQGe/KDSP3OSHvjsJl0HftohQmTQXFPzbaJScy
         NZATxrVokwKyDZBlvVuc8AqZM3X4BnnGYYNmZYjG2xyFeQh1/ueDLIQGgnCwOFukcoTg
         j0CA7GSvO3wy56AQvderYylzJrjHEGQb26R1pNmRxImSWRgEpiJxBGAWupTMPfV5XXZc
         A0z7RvuqnxaE78F/E/uHxjPY3z7L4Ca5zkA0gxJZfgP5OtefItqPsqWeatt4Jt1xnPF2
         dijVamrnH6752ZZGsDoZBQDWK/dp9T4fnyhYnYfkQHauF6G4BYsgsbNWjIaJZB2LnF3/
         fVYA==
X-Gm-Message-State: AOAM530/TMjo0oSMOK2sksEqwfCPDXY0QYSOXRQ/zBpqxm49Vlgv19sW
        5Adg+8HbCnvkFV8ZsU82Kg==
X-Google-Smtp-Source: ABdhPJy2P/cliBUMZLJlj2ac0NBPBHGJmdewE0jddC969S1669QgUocv7QL6rBDyPR8GjphyefEyXg==
X-Received: by 2002:a02:3402:: with SMTP id x2mr6119892jae.41.1595539657915;
        Thu, 23 Jul 2020 14:27:37 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id f206sm2096532ilh.75.2020.07.23.14.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2020 14:27:37 -0700 (PDT)
Received: (nullmailer pid 888683 invoked by uid 1000);
        Thu, 23 Jul 2020 21:27:36 -0000
Date:   Thu, 23 Jul 2020 15:27:36 -0600
From:   Rob Herring <robh@kernel.org>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Serge Semin <fancer.lancer@gmail.com>,
        Hoan Tran <hoan@os.amperecomputing.com>,
        linux-gpio@vger.kernel.org,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 1/7] dt-bindings: gpio: dwapb: Add ngpios property support
Message-ID: <20200723212736.GA888635@bogus>
References: <20200723013858.10766-1-Sergey.Semin@baikalelectronics.ru>
 <20200723013858.10766-2-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200723013858.10766-2-Sergey.Semin@baikalelectronics.ru>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 23 Jul 2020 04:38:52 +0300, Serge Semin wrote:
> It's redundant to have a vendor-specific property describing a number of
> GPIOS while there is a generic one. Let's mark the former one as
> deprecated and define the "ngpios" property supported with constraints
> of being within [1; 32] range.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> ---
>  .../devicetree/bindings/gpio/snps,dw-apb-gpio.yaml          | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
