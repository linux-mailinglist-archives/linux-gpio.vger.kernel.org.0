Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99F8826B258
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Sep 2020 00:46:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727660AbgIOWpm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Sep 2020 18:45:42 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:46835 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727456AbgIOPxx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Sep 2020 11:53:53 -0400
Received: by mail-io1-f67.google.com with SMTP id g7so4562066iov.13;
        Tue, 15 Sep 2020 08:53:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Ffvw1RavwEYs31p6FTUFrJH4oyQnQP2TfpPxRHIwLSQ=;
        b=UaAecggEboeDJmHSAzsNnqK1rgWkCrK29UDrfDXSMyEf+R0VhoehBZKvqgwFmPP/u+
         p2VqEcOwnwAu4JxpthyhPEDPvT6Yax2AccEqiLfonknUnQKsS4yplaAIZ/QrQvrsU9F5
         9TrbqXvM6Zy5hDFdrAzPAZT/PqPAO/gFbLNAvyFn46t0HC+7cUrkk4XyR6m5eL/uyqg4
         liNsQbmE8i94Wpy5FvG8yFQuKipEB9piccEP4s6rTEcs7G3JRt4oyvoforXxzdod5O8U
         n1QexfuOa1oLw5kD9xynGAlK5ylmP7EWgVPJ+JYEY63suX2KesCl+Zmj4ZVDRmlkRFnQ
         1JlA==
X-Gm-Message-State: AOAM533p45Z3yovY1ckkvsXnm7//zzcin1fyfZhQv6K/fk6FWcusbDZo
        Gc/SQVKgZtYrWQugKNuXxQ==
X-Google-Smtp-Source: ABdhPJy+51PIhDeMmQSSuCP2lG9WkD/Av/9uK/A9S1hx/hdiU50eltj4EBryIZvU08/axCmKJ4xtmQ==
X-Received: by 2002:a05:6638:134b:: with SMTP id u11mr18497798jad.18.1600185183409;
        Tue, 15 Sep 2020 08:53:03 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id s13sm8834631ilq.16.2020.09.15.08.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2020 08:53:02 -0700 (PDT)
Received: (nullmailer pid 2017061 invoked by uid 1000);
        Tue, 15 Sep 2020 15:53:01 -0000
Date:   Tue, 15 Sep 2020 09:53:01 -0600
From:   Rob Herring <robh@kernel.org>
To:     Fabien Parent <fparent@baylibre.com>
Cc:     matthias.bgg@gmail.com, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
        robh+dt@kernel.org, sean.wang@kernel.org, linus.walleij@linaro.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] pinctrl: mt65xx: add OF bindings for MT8167
Message-ID: <20200915155301.GA2017005@bogus>
References: <20200907110221.1691168-1-fparent@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200907110221.1691168-1-fparent@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 07 Sep 2020 13:02:20 +0200, Fabien Parent wrote:
> Add binding documentation of pinctrl-mt65xx for MT8167 SoC.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/pinctrl-mt65xx.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
