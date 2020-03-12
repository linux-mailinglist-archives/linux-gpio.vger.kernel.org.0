Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 397D2183B95
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2020 22:44:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726513AbgCLVol (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Mar 2020 17:44:41 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:46263 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726481AbgCLVol (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Mar 2020 17:44:41 -0400
Received: by mail-ot1-f68.google.com with SMTP id 111so7916033oth.13;
        Thu, 12 Mar 2020 14:44:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=G8Txaf4x0VEll/Y3cymC5B34TdWiNjRuLiaS7lxL2Rk=;
        b=gnshfKkKu2PioU2GRNBmnTwIf0t14XS3eBTSbGEq9Qnv2E86Pp4yI/N6Qt0a6f3igI
         ltgTpj9yZzwY0tBMCh7haIZlRCYIc1iVyHkcXtL0P5devgbyaGe3oiPflnujU6qAZ17x
         VgYIi3kcOQXsxNHrJ5b+VEqsuXkAicywjUffipGzavlp0HWQzUGVljuxuz4813CW5rjc
         AIXQ3AW3TfCZrGLCLxTT9mb69whSsz/+ffvDBPD10GjZ+2QXRkZYJhY0FYeXLIOSAVT5
         yrP0jCFyYae0KlAQjsr5aG4bv52oqNBcn9kVia1qlHl6zZthbmhh8W8GBFLe8ej4B8BG
         YHLg==
X-Gm-Message-State: ANhLgQ3fnHHFubTwWzQbPCT+BOcC9LdUYj26zU5Z7LoMb51Pibn7ytaf
        S4SS7c7/v1pTUfq1ILrjvQ==
X-Google-Smtp-Source: ADFU+vsbiUVffUm+4ApajmRGvkt0ZEjeWR//4ZJaqErX1K21MZ7RS+bxjcqpcSKUcfUHWwllU7uIIw==
X-Received: by 2002:a9d:2215:: with SMTP id o21mr7935579ota.113.1584049478974;
        Thu, 12 Mar 2020 14:44:38 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id m69sm18815828otc.78.2020.03.12.14.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2020 14:44:38 -0700 (PDT)
Received: (nullmailer pid 31846 invoked by uid 1000);
        Thu, 12 Mar 2020 21:44:37 -0000
Date:   Thu, 12 Mar 2020 16:44:37 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sergey.Semin@baikalelectronics.ru
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: gpio: Add DW GPIO debounce clocks
 bindings
Message-ID: <20200312214437.GA31790@bogus>
References: <20200306132448.13917-1-Sergey.Semin@baikalelectronics.ru>
 <20200306132512.46E03803079F@mail.baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200306132512.46E03803079F@mail.baikalelectronics.ru>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 6 Mar 2020 16:24:46 +0300, <Sergey.Semin@baikalelectronics.ru> wrote:
> From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> 
> Port A of the DW GPIO controller may optionally have a debounce
> logic enabled if it was synthesized with corresponding functionality
> enabled. In this case a dedicated reference clocks should be provided
> to the node with "db" clock-names.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Signed-off-by: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: Paul Burton <paulburton@kernel.org>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> ---
>  Documentation/devicetree/bindings/gpio/snps,dw-apb-gpio.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
