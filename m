Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0721F43BC44
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Oct 2021 23:20:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239510AbhJZVWw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Oct 2021 17:22:52 -0400
Received: from mail-oi1-f169.google.com ([209.85.167.169]:40860 "EHLO
        mail-oi1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239511AbhJZVWv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Oct 2021 17:22:51 -0400
Received: by mail-oi1-f169.google.com with SMTP id n63so515638oif.7;
        Tue, 26 Oct 2021 14:20:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RCbYeBeMvbrHSdyvTDSqkQZ6Yknq+sajMOBXkanmlDk=;
        b=ZoZrfhbJ9B5X+Fpt1BnG4C1NABuXQ12ACG9zjFtC0ayt5ULXQzoHnWPWix41WnmbM/
         1JM8keeYajVyRA7NGFqyFIY2TlDpzQ0GZtzfYdIMi+sC6hrO/3nzMsORbvL3Gpn2s9x5
         1ifAUPQb2KU+pCl4FoJVFdk9fxzI9DrA6+NDQZdldjh/wZ5ukZmdEHbsLXRpmjrFur24
         6F8S9fg4rYmcwisTO6o8mepbVN6q+ueRy6F+meMt4yS4JiHsRHVysHJpZpNdBmnFxzBl
         NAC3DXaLA8vqakn05if134Cn01+O+zI4gYq2ysk3kUOX+Q+9KBHMdZepQW28eVVTwNyS
         hKzQ==
X-Gm-Message-State: AOAM530/H/2UxK+FIn6k+azhXeJ/JzEy5Zd9rQYOSub0l+TrqprW605l
        /ouDLVwSYnHF09IMoZa50g==
X-Google-Smtp-Source: ABdhPJzgvwq+0+tj6wKk+W4DmaR1WDhr/uTub0VlaWK+cK7/K0zwvd3VnE5OeyZGLlSFBGBiYyAqxA==
X-Received: by 2002:a54:418a:: with SMTP id 10mr932031oiy.13.1635283226441;
        Tue, 26 Oct 2021 14:20:26 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id e9sm4924300otr.25.2021.10.26.14.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 14:20:25 -0700 (PDT)
Received: (nullmailer pid 3273688 invoked by uid 1000);
        Tue, 26 Oct 2021 21:20:24 -0000
Date:   Tue, 26 Oct 2021 16:20:24 -0500
From:   Rob Herring <robh@kernel.org>
To:     Michal Simek <michal.simek@xilinx.com>
Cc:     devicetree@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        monstr@monstr.eu, linux-arm-kernel@lists.infradead.org,
        git@xilinx.com, Srinivas Neeli <srinivas.neeli@xilinx.com>,
        Rob Herring <robh+dt@kernel.org>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: gpio: zynq: Describe gpio-line-names
Message-ID: <YXhxGBCmHakfaK1K@robh.at.kernel.org>
References: <4b9db94cdd8ca106feee53f76fab2a23721f7d2a.1634290039.git.michal.simek@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4b9db94cdd8ca106feee53f76fab2a23721f7d2a.1634290039.git.michal.simek@xilinx.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 15 Oct 2021 11:27:23 +0200, Michal Simek wrote:
> Number of lines depends on compatible string from 58 to 174.
> That's why it is checked based on it.
> 
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> ---
> 
>  .../devicetree/bindings/gpio/gpio-zynq.yaml   | 50 +++++++++++++++++++
>  1 file changed, 50 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
