Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B646B199EE1
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2020 21:25:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727708AbgCaTZN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 31 Mar 2020 15:25:13 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:44817 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726290AbgCaTZN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 31 Mar 2020 15:25:13 -0400
Received: by mail-io1-f67.google.com with SMTP id r25so11175887ioc.11;
        Tue, 31 Mar 2020 12:25:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=hFuoTfMAYRshOlVhyJLkMqTe2pxmypampOFQnpBLMbE=;
        b=LcUsdr6+37YFM2JfrfAb2Fnms1FO86aHhGTCj2wtMvOJv8LedVX3qzjVERmDJ/Tiii
         fkHR3up1SBxKidey5EAwcX0PTW9/bIt0PeiAMV9vu5/COdqnN/rl+RwPo6xGdxT+qRDp
         toGtNBFEtuK+cbbrBQ5LC+0jGEsUJR9c322Og0CRq36SGApqjCQAQ4r2ikJtYGLSykr1
         JeIcVrn743LyLdfVHnyJ7ziMxlgrYsOsy4qvIql0xQZKXtDQEcE4+Cqb3rR6u/jUh4xg
         t6XwU5DA+NzGgatDy8LUfwbuaArjO+ET21fr7orxdVcG0hOHmTNmnOSNqm5KC7dYeJrO
         eFtQ==
X-Gm-Message-State: ANhLgQ2fDdWrbI3xisQ+03dnJEMq6sVg3WSsfJqn5SFyY/tOWiv3xH5D
        a+BAW81xamfEUOagxB4Z0A==
X-Google-Smtp-Source: ADFU+vvDimakhgAYrLX4Tfl8Ye8W6pH0OSsQYBCZ2OzX0qbRhMfTva1qv0AlJ6Osl1WF3vqOHIrvIA==
X-Received: by 2002:a6b:4905:: with SMTP id u5mr11863656iob.134.1585682712569;
        Tue, 31 Mar 2020 12:25:12 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id x4sm4806894ilj.6.2020.03.31.12.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2020 12:25:12 -0700 (PDT)
Received: (nullmailer pid 20812 invoked by uid 1000);
        Tue, 31 Mar 2020 19:25:08 -0000
Date:   Tue, 31 Mar 2020 13:25:08 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sergey.Semin@baikalelectronics.ru
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Hoan Tran <hoan@os.amperecomputing.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/6] dt-bindings: gpio: Add Sergey Semin to DW APB
 GPIO driver maintainers
Message-ID: <20200331192508.GA20754@bogus>
References: <20200323180632.14119-1-Sergey.Semin@baikalelectronics.ru>
 <20200323195401.30338-1-Sergey.Semin@baikalelectronics.ru>
 <20200323195401.30338-4-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200323195401.30338-4-Sergey.Semin@baikalelectronics.ru>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 23 Mar 2020 22:53:58 +0300, <Sergey.Semin@baikalelectronics.ru> wrote:
> From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> 
> Seeing Hoan has been silent for a long time Linus suggested to me
> to be also maintaining the driver. This patch adds myself to the list
> of maintainers in the DT schema of the driver.
> 
> Suggested-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Cc: Hoan Tran <hoan@os.amperecomputing.com>
> Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: Paul Burton <paulburton@kernel.org>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  Documentation/devicetree/bindings/gpio/snps,dw-apb-gpio.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
