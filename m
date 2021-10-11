Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 929044299D7
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Oct 2021 01:29:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235720AbhJKXa7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Oct 2021 19:30:59 -0400
Received: from mail-oi1-f176.google.com ([209.85.167.176]:34626 "EHLO
        mail-oi1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235583AbhJKXa5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Oct 2021 19:30:57 -0400
Received: by mail-oi1-f176.google.com with SMTP id z11so26722985oih.1;
        Mon, 11 Oct 2021 16:28:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=BMxAsTofsv3WDnpBBhVvHV/gLjZQt5kRAq+TCbbwUvg=;
        b=kK6CiU6bEG85VpgQOUNGwM/MJUbHq1w3aiizyIMRI59mlbuuhTS5N1YmAdlanNBisz
         AyHP6b2nPY0qCGNxiucBkphnCy00IWOWgkOdAwX+7KlMRIYBvJcP4rmGd5JeDjp7gPGf
         IfJhQfyvy2RzkBy5GVOllKbdrDGjZaRhJvsYVdRPEk0WaB1IEjFFPgFcprNIPoowqYZe
         VGt864bJ7aTYRtUJX2tUXi3lgZyaWuWk61yYOx210i7vEqxFr3X3i6YAkdIhSwCE/2xs
         N9361jsUJCkxrtR7xmQr3bwoU8c1W+7LjF3Mg0J6yGCXYCYEQ5YzV9yL/uwNeUExc+bM
         sBtA==
X-Gm-Message-State: AOAM532hZtWOXV1yowSbAhtHRkaZ05h3BtKJUDx75ChM5aluWzMxPJtm
        Pmy2hABqoAFwDDJYJ5bJjg==
X-Google-Smtp-Source: ABdhPJymqzP4wJ2F76Kxs+QWpFY4OLKMUKqryZmoWB3Tyi4FdM+uUbQy4e+ZeGgmwqm1d3J5BaqErQ==
X-Received: by 2002:aca:4444:: with SMTP id r65mr1415352oia.25.1633994935224;
        Mon, 11 Oct 2021 16:28:55 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id a15sm569630oiw.53.2021.10.11.16.28.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 16:28:54 -0700 (PDT)
Received: (nullmailer pid 1369735 invoked by uid 1000);
        Mon, 11 Oct 2021 23:28:53 -0000
Date:   Mon, 11 Oct 2021 18:28:53 -0500
From:   Rob Herring <robh@kernel.org>
To:     =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH V3 linux-pinctrl 2/3] dt-bindings: pinctrl:
 brcm,ns-pinmux: drop unneeded CRU from example
Message-ID: <YWTItcTOFvcgUrT/@robh.at.kernel.org>
References: <20211008205938.29925-1-zajec5@gmail.com>
 <20211008205938.29925-2-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211008205938.29925-2-zajec5@gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 08, 2021 at 10:59:37PM +0200, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> There is no need to include CRU in example of this binding. It wasn't
> complete / correct anyway. The proper binding can be find in the
> mfd/brcm,cru.yaml .
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
> V3: Add this patch to fix dtschema/dtc warning/error
> ---
>  .../bindings/pinctrl/brcm,ns-pinmux.yaml      | 24 +++++++------------
>  1 file changed, 8 insertions(+), 16 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>

