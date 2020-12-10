Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEB622D5105
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Dec 2020 03:50:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726674AbgLJCuG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Dec 2020 21:50:06 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:39504 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726278AbgLJCuF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2020 21:50:05 -0500
Received: by mail-ot1-f66.google.com with SMTP id d8so3546522otq.6;
        Wed, 09 Dec 2020 18:49:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=AEeqbZiTuqMMPHuLYWCvh5MaAj6so3cry+enVJAecdU=;
        b=FAiMqPwD4MNYK7sbi0LwI8pvkOxfdOIk3VFzVIBlOsfIylHGyxP3Qxvd7PgkOkTaRr
         Befti8JEyq1zS+TPbODzwnieJZ9nb8cYH2uN70FUA8IQK+nBf20KRVudK/1tLO5oQkkI
         jwCFwYP+i8XOi2lhFVP6KMyvD7sqwN4xybF/iQtdhqiFMuQ7TyCvvV1N+1iwvTxXcE3T
         5kA8knT5muT+eKtLWuhIXDIEg1+70A2UoaDoZoV87atGmT67u7gN9MXjE//MJKQLOTa6
         jHBVyay1DlyU9TFfH6mCcxtgpph8bBsvjTnUGHEVpgYjCiE+mhc/cEhR9i65IuknpR6x
         MwVg==
X-Gm-Message-State: AOAM532HCAepWe43oCE3T3yyWJPBWsLw/NksPWbAi0a9z5sTxEmtMv6y
        HC1yxGDCM3cjumy44ap0tw==
X-Google-Smtp-Source: ABdhPJwYeUe2UZduSJ2VLeeZP8ZG959HuqyoW5n4vj1PQwtJeYUFztpo7z0AmT9tDyfT/Wo1D1q0uw==
X-Received: by 2002:a05:6830:3151:: with SMTP id c17mr4423758ots.336.1607568564689;
        Wed, 09 Dec 2020 18:49:24 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id o82sm716174oih.5.2020.12.09.18.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 18:49:23 -0800 (PST)
Received: (nullmailer pid 1542766 invoked by uid 1000);
        Thu, 10 Dec 2020 02:49:22 -0000
Date:   Wed, 9 Dec 2020 20:49:22 -0600
From:   Rob Herring <robh@kernel.org>
To:     Aswath Govindraju <a-govindraju@ti.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sekhar Nori <nsekhar@ti.com>, Keerthy <j-keerthy@ti.com>,
        linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: gpio: Add compatible string for AM64 SoC
Message-ID: <20201210024922.GA1542675@robh.at.kernel.org>
References: <20201209165733.8204-1-a-govindraju@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201209165733.8204-1-a-govindraju@ti.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 09 Dec 2020 22:27:31 +0530, Aswath Govindraju wrote:
> Add compatible string for AM64 SoC in device tree binding of davinci GPIO
> modules as the same IP is used.
> 
> Signed-off-by: Aswath Govindraju <a-govindraju@ti.com>
> ---
>  Documentation/devicetree/bindings/gpio/gpio-davinci.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
