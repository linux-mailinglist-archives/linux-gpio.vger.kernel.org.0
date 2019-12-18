Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8286125043
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Dec 2019 19:08:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727729AbfLRSIK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 18 Dec 2019 13:08:10 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:39560 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727725AbfLRSIK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 18 Dec 2019 13:08:10 -0500
Received: by mail-oi1-f193.google.com with SMTP id a67so1545698oib.6;
        Wed, 18 Dec 2019 10:08:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=DFlpwK3AxGJVLFi7l3r97G6DWX/N2u0QA0ZvIo1IjIs=;
        b=Cy9elW83IRvo8FqtZwlKeNNyEImOWnbMThpJkjADghFFD52K5+ejZQRarbxDvlsQG7
         RFWkPOQgvgcKFxhlNxPFXIrM+e2ThjU2W9wUII4F1TLuNoyea0ZREOztBPczdXSzfLIP
         Sk1iQNM4DCxuNo0rY+HRL1pi96aydtDfO0L+7PB+N0P+mpFjEno12dFVqMYnIfljg+54
         WFOWHDeeVRoSavIFYMrjibUYbR2LxsdJWPT24m16tCVusNJjF7Vc08tPzVnRB8NqmQoJ
         pjO/k7EnTgemE+d8CxFRlqbymp3N7BkfHzUq3UnslUNLqjPqAxFpT62BKU5NZxCE3qRf
         dflw==
X-Gm-Message-State: APjAAAVTHMrFwebaXcQAmjZFciEHXkHfOA0Fs6aheixhRaXM9yzpH7zY
        /uUF9ATe355JCYklbzfH5g==
X-Google-Smtp-Source: APXvYqxV3PQgsNKWechNRemE0G3OUmYxE4aKcrp20lSkDN5QSvgGAnJKNyOqxoZGsjHlbI5X+3IITw==
X-Received: by 2002:a05:6808:3c5:: with SMTP id o5mr1201077oie.142.1576692489561;
        Wed, 18 Dec 2019 10:08:09 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id m2sm1022649oim.13.2019.12.18.10.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2019 10:08:09 -0800 (PST)
Date:   Wed, 18 Dec 2019 12:08:08 -0600
From:   Rob Herring <robh@kernel.org>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-rtc@vger.kernel.org
Subject: Re: [PATCH v6 03/15] dt-bindings: mfd: Document ROHM BD71828 bindings
Message-ID: <20191218180808.GA6226@bogus>
References: <cover.1576054779.git.matti.vaittinen@fi.rohmeurope.com>
 <c910b9a057e76044291a4d669530ccf19225675f.1576054779.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c910b9a057e76044291a4d669530ccf19225675f.1576054779.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 11 Dec 2019 11:37:59 +0200, Matti Vaittinen wrote:
> ROHM BD71828 Power management IC integrates 7 buck converters, 7 LDOs,
> a real-time clock (RTC), 3 GPO/regulator control pins, HALL input
> and a 32.768 kHz clock gate.
> 
> Document the dt bindings drivers are using.
> 
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> ---
> Changes since v5:
> - Remove regulator run-level properties
> - Change SPDX to dual lisence
> - remove trivial descriptions
> 
>  .../bindings/mfd/rohm,bd71828-pmic.yaml       | 193 ++++++++++++++++++
>  1 file changed, 193 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
