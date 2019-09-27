Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49E1EC0CDC
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2019 22:50:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728260AbfI0Ut1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Sep 2019 16:49:27 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:42372 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727965AbfI0Ut0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Sep 2019 16:49:26 -0400
Received: by mail-oi1-f194.google.com with SMTP id i185so6314810oif.9;
        Fri, 27 Sep 2019 13:49:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Csu+S9CExmvQZxWoLiqd8cWChYw+5stkiIYgS0wE0Pk=;
        b=UUw3Py+MeyWz8I7bbJD97TkbZBHol/I5DJxEvsctQ7IX5598hq8kQU4Wd/i7u39I8X
         XvFJro9RjsCZ4sVIdBUumw4pQY7hukrAaSo0BbM9br1qltV+WN8EyjBzX5QmSsFyUwFq
         YHODl/OMHTwbGBb+AuZ3mG/K3NQLQYHKx0irp9ghaEYfXKZzW5HpqjEb4woau1hZyBmi
         CTJncFdL2lQ73YnBj0zYQLR+beDnnW00XxVEkhrrXo/mMSG9KRFlOUGwn/bmQkQWLeV1
         4lPdiYaI1rgjaYXX99YzzdmlAFFj/GkgOYNkfiFm9ULXLR9IylppUitn9Gs0YtNArFC8
         fTtA==
X-Gm-Message-State: APjAAAVCsvGytnz0riqzyLXCqnOaFy/lbPzSG6ZNBXKalNX4CGI8/41o
        EW9258YS33MwdE4t91gPMw==
X-Google-Smtp-Source: APXvYqy4q414kOhKX1y3OP/3MN3/4jIByP73EonOYg81IknG3c7XWbbh/s4H+gYXNq3WZucKaiC1dw==
X-Received: by 2002:aca:b142:: with SMTP id a63mr8316566oif.119.1569617365739;
        Fri, 27 Sep 2019 13:49:25 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id i13sm1367069otj.58.2019.09.27.13.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2019 13:49:25 -0700 (PDT)
Date:   Fri, 27 Sep 2019 15:49:24 -0500
From:   Rob Herring <robh@kernel.org>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lee Jones <lee.jones@linaro.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v3 1/5] dt-bindings: Add Xylon vendor prefix
Message-ID: <20190927204924.GA28620@bogus>
References: <20190927100407.1863293-1-paul.kocialkowski@bootlin.com>
 <20190927100407.1863293-2-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190927100407.1863293-2-paul.kocialkowski@bootlin.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 27 Sep 2019 12:04:03 +0200, Paul Kocialkowski wrote:
> Xylon is an electronics company that produces FPGA hardware block designs
> optimized for Xilinx FPGAs.
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
