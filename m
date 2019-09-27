Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00B32C0DE6
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Sep 2019 00:19:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728334AbfI0WQW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Sep 2019 18:16:22 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:35895 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725990AbfI0WQW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Sep 2019 18:16:22 -0400
Received: by mail-oi1-f193.google.com with SMTP id k20so6523109oih.3;
        Fri, 27 Sep 2019 15:16:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Rr4kVsayhPkWRZ0bP0EnubFT+L2ShEWQEZTWxYzPcSY=;
        b=sgYdAHMc/Gr2CZw7QPUpa6Gqrfj/waPifwquUCAxueUp0qgRnXrBuyFvVQasCQK8c/
         VsgrWsN/l/K1WKiZs9clu28lpRzB2YpY5LzbVKakjJ/RWBR9+2ERsGau0xoIGvzFXRhL
         7jL4nVUeDfSzzU/lU0DErkfR0yQu/pXpik0MAgJzoE9NfTPE07ZkDpX6g+zVikvyR8eA
         eEpbPtJR1RPvLtpx2rX/KZ6H3KAOg8BZ/7lPVZTLT4RKhTKz200eMkVvTCDK8tbr4P2b
         sBvf4Uhe6yS2YPfM8HKy78aZeNzLglWm6O5xDXJsBDvl16QHAd0qtJ9imNeIMxofYC0a
         /0og==
X-Gm-Message-State: APjAAAUACOOKG57mwSukjVPl04/1Q9VLE62vhTP9iUCFpZ9nHzYbqypF
        nHlGaZLxtD3Kpd/vHWrrHQ==
X-Google-Smtp-Source: APXvYqzGwkDwe77wSI6KG9cqX8XJOo6OY1O6yTmgoypoPuROn+n53MHijTuqzT/UPDXU30KMreJHoQ==
X-Received: by 2002:aca:4e97:: with SMTP id c145mr8549728oib.145.1569622579975;
        Fri, 27 Sep 2019 15:16:19 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id e9sm1917468oie.58.2019.09.27.15.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2019 15:16:19 -0700 (PDT)
Date:   Fri, 27 Sep 2019 17:16:19 -0500
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
Subject: Re: [PATCH v3 4/5] dt-bindings: gpio: Document the Xylon LogiCVC
 GPIO controller
Message-ID: <20190927221619.GA22004@bogus>
References: <20190927100407.1863293-1-paul.kocialkowski@bootlin.com>
 <20190927100407.1863293-5-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190927100407.1863293-5-paul.kocialkowski@bootlin.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 27 Sep 2019 12:04:06 +0200, Paul Kocialkowski wrote:
> The Xylon LogiCVC display controller exports some GPIOs, which are
> exposed as a separate entity.
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
>  .../bindings/gpio/xylon,logicvc-gpio.yaml     | 69 +++++++++++++++++++
>  1 file changed, 69 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/xylon,logicvc-gpio.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
