Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A41D38BBF5
	for <lists+linux-gpio@lfdr.de>; Fri, 21 May 2021 03:50:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237773AbhEUBwL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 May 2021 21:52:11 -0400
Received: from mail-oi1-f173.google.com ([209.85.167.173]:36416 "EHLO
        mail-oi1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237755AbhEUBwL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 May 2021 21:52:11 -0400
Received: by mail-oi1-f173.google.com with SMTP id t24so2763244oiw.3;
        Thu, 20 May 2021 18:50:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=AXsW9g32J4m2tS2/friWGcQkqOGGqgj/xyWxyVn2d9s=;
        b=SJeDEj8N3ZPY/YbQPYUb+WMVOUgzQLBeZ0n3MA+GlxEj4ueCsW58+SqkVwx25KHRVS
         5+xVyfcNF/XSQNQxHSuSIuCCLNxF7dFY+LI9WFwDQ71qlMUZyFtn4exEqoGNZZ1aaGCp
         zjWaef8JdE1bgRrd74C9F/+CSAySXgyx2Gm+UUwRws3YycUk6HAiaCm/dYabFWtYIpF6
         22j1XwavvwWyN9afUVrNHBqxVS89NZwjvs4jaWoVnkSllQkFz7dwp+ROOxWD9LwQW/7t
         JGYMNVA5gKLRHwjE8fJhuI+q2qigu9qmeFENDjDhAhI517xOkyNYTHvO8VfETAW2hRsv
         x4ow==
X-Gm-Message-State: AOAM5311wwW1ConcsPJcufvqwa7vXhEmfc2EPFtr0zIgxQLuSn3r9tQb
        kpOU6Vp+09d6J/xAeYMyjQ==
X-Google-Smtp-Source: ABdhPJwt5H0mttXaheTJVZsXKAjWkuhTArX8fHVE98L9x+m9+YSoP7YgGCRQsIHnLe5D4LFn2/jm9w==
X-Received: by 2002:aca:c712:: with SMTP id x18mr290178oif.107.1621561847537;
        Thu, 20 May 2021 18:50:47 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id a71sm929456oib.20.2021.05.20.18.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 18:50:46 -0700 (PDT)
Received: (nullmailer pid 2481383 invoked by uid 1000);
        Fri, 21 May 2021 01:50:45 -0000
Date:   Thu, 20 May 2021 20:50:45 -0500
From:   Rob Herring <robh@kernel.org>
To:     Fabien Parent <fparent@baylibre.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        mkorpershoek@baylibre.com, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-mediatek@lists.infradead.org,
        Sean Wang <sean.wang@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: mt65xx: add mt8365 SoC binding
Message-ID: <20210521015045.GA2481354@robh.at.kernel.org>
References: <20210519162409.3755679-1-fparent@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210519162409.3755679-1-fparent@baylibre.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 19 May 2021 18:24:06 +0200, Fabien Parent wrote:
> Add binding documentation for MT8365 Pin controller.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>  .../bindings/pinctrl/pinctrl-mt65xx.txt       |   1 +
>  include/dt-bindings/pinctrl/mt8365-pinfunc.h  | 858 ++++++++++++++++++
>  2 files changed, 859 insertions(+)
>  create mode 100644 include/dt-bindings/pinctrl/mt8365-pinfunc.h
> 

Acked-by: Rob Herring <robh@kernel.org>
