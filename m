Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8ECDA3DADAD
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jul 2021 22:34:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229841AbhG2Ueb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Jul 2021 16:34:31 -0400
Received: from mail-io1-f48.google.com ([209.85.166.48]:37563 "EHLO
        mail-io1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229845AbhG2Ue2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Jul 2021 16:34:28 -0400
Received: by mail-io1-f48.google.com with SMTP id r18so8792295iot.4;
        Thu, 29 Jul 2021 13:34:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=K5V012xL88GFPg0nzzWvkyZK/M/tg+yzd7/vSuHbGEc=;
        b=s2L+M99gKZHQTlYQY6oeVImttWEemN9ajvx5j/M9El4FI6gGmCArsJYeDJSi2Fp148
         KkJAR+cXAMvRqbDLrmNOLuoPkM2C6ASu1kjQPsglFWP9ATyiDjqMupDt770ncT6khRxN
         LW+hkSMikkns/wvrkxIq0MTIHcMgTjSXFtRpRji7ZRLUvj72jcrHtX2o3o7rH1qCuKuO
         IkR1m0Bdc6n3MX9m/KnqqfV4djVnwJ6yOc1yRXP9hovjySzoOayeZUn+NA8uwFNcGH2v
         feZZOBkH4ddy7bZlhH5SwTnxi5FY36meN3EfRSPuLwlIYENHfRLwtcI63ukOKL6lIEZc
         LtJA==
X-Gm-Message-State: AOAM531PpwB+s0K3wb9WTW6LEAtqaCBkZeMGzpC73bCn+OFirpljdcEe
        LNXnzfhLuaS3PZBl6iL2lgyrG4RAAA==
X-Google-Smtp-Source: ABdhPJxJzuYy/bh76WKd2gMGYVNi5fvug8TBfrecWZaqizyLUG0jPn7EJS6HVwIjJFWa5EBPGa6TRg==
X-Received: by 2002:a6b:7a04:: with SMTP id h4mr5563850iom.149.1627590863357;
        Thu, 29 Jul 2021 13:34:23 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id t15sm2476727iln.36.2021.07.29.13.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 13:34:22 -0700 (PDT)
Received: (nullmailer pid 839820 invoked by uid 1000);
        Thu, 29 Jul 2021 20:34:20 -0000
Date:   Thu, 29 Jul 2021 14:34:20 -0600
From:   Rob Herring <robh@kernel.org>
To:     Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-doc@vger.kernel.org, arnd@arndb.de,
        Olof Johansson <olof@lixom.net>, robh+dt@kernel.org,
        linux-gpio@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/7] dt-bindings: pinctrl: stm32: add new compatible for
 STM32MP135 SoC
Message-ID: <YQMQzFXeEJ8FT9dF@robh.at.kernel.org>
References: <20210723132810.25728-1-alexandre.torgue@foss.st.com>
 <20210723132810.25728-2-alexandre.torgue@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210723132810.25728-2-alexandre.torgue@foss.st.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 23 Jul 2021 15:28:04 +0200, Alexandre Torgue wrote:
> New compatible to manage ball out and pin muxing of STM32MP135 SoC.
> 
> Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
> 

Acked-by: Rob Herring <robh@kernel.org>
