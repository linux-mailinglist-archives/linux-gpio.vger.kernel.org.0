Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7C3C346C88
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Mar 2021 23:23:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234368AbhCWWXI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Mar 2021 18:23:08 -0400
Received: from mail-il1-f169.google.com ([209.85.166.169]:47064 "EHLO
        mail-il1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234133AbhCWWU0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Mar 2021 18:20:26 -0400
Received: by mail-il1-f169.google.com with SMTP id j11so19602129ilu.13;
        Tue, 23 Mar 2021 15:20:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=EjA9qk/K3B+rwB8TonggFFI1JQIbyV+sRtXcMF0L5PI=;
        b=PTDhB8LrOG8g78qap7IKzt85lnGsYr0t9pn5wLwHrdPZSXUHkGHG9SAxmSrtGYLJhL
         vDPjVydjNqpvRqYVX4V+qwm+3HXquTM7JWE6ZorGK7VKmbC6yPGWbbawctQJcw78BEpJ
         Ei2p9U+cwTVeHL9EYs5vzGTWi3ALYANKM8LVaxUZQyPoyfJrlZjwkk7runZwsq7DFMNd
         po87cFXC/YhId89heNgIsoNaJQzMxQNyJL6mn/Kj/OrllfzTADB7Qe84xu8L9oiIOpK6
         3pcmnwmqJjyHKvr2u5NWGTxIWnnXeo9G2UMB61BPRYHFPHTxE5HtObeVGMZGmKGXlSal
         nt/Q==
X-Gm-Message-State: AOAM5303tyTvrnoEiY0rX5hC5nrjtk28WlvN/7Btq1zqBBlu0KqDw+v7
        2B8XKvTo4vW8U20jSMUNNA==
X-Google-Smtp-Source: ABdhPJwKP0zVlnzC7ELWmQ84J07FquoVZuc/4WYGRlFEYF0Kl/ZZy+kJdY2f5GPvi21Cs08u7eLrwQ==
X-Received: by 2002:a92:ddd0:: with SMTP id d16mr353081ilr.52.1616538026020;
        Tue, 23 Mar 2021 15:20:26 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id n16sm91897ilq.71.2021.03.23.15.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 15:20:25 -0700 (PDT)
Received: (nullmailer pid 1445894 invoked by uid 1000);
        Tue, 23 Mar 2021 22:20:23 -0000
Date:   Tue, 23 Mar 2021 16:20:23 -0600
From:   Rob Herring <robh@kernel.org>
To:     =?iso-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>
Cc:     devicetree@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        bcm-kernel-feedback-list@broadcom.com, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        linux-kernel@vger.kernel.org,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Michael Walle <michael@walle.cc>
Subject: Re: [PATCH v8 09/22] dt-bindings: add BCM6358 GPIO sysctl binding
 documentation
Message-ID: <20210323222023.GA1445842@robh.at.kernel.org>
References: <20210317143803.26127-1-noltari@gmail.com>
 <20210317143803.26127-10-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210317143803.26127-10-noltari@gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 17 Mar 2021 15:37:50 +0100, Álvaro Fernández Rojas wrote:
> Add binding documentation for the GPIO sysctl found in BCM6358 SoCs.
> 
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
> ---
>  v8: add changes suggested by Rob Herring
>  v7: add changes suggested by Rob Herring
> 
>  .../mfd/brcm,bcm6358-gpio-sysctl.yaml         | 130 ++++++++++++++++++
>  1 file changed, 130 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/brcm,bcm6358-gpio-sysctl.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
