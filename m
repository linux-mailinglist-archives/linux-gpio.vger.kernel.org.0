Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB8C8287BDD
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Oct 2020 20:44:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729338AbgJHSoU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Oct 2020 14:44:20 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:37468 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729331AbgJHSoT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Oct 2020 14:44:19 -0400
Received: by mail-oi1-f193.google.com with SMTP id t77so7407804oie.4;
        Thu, 08 Oct 2020 11:44:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Nhaf7VstnY9U3VG5uxKi48X4aznhV2MNfNHXbJ6mppE=;
        b=cOsX1+Ribdoa/F+wkyfMkUIQ2THXgCEbmsOp+oA0V8XyxhHbAItmFQQ/MDyH7cfSQZ
         WGnJHysG/RJfwshmlb5OspFwUf9ZcIEI19wD9XlIYe16XFqnu1Xwoxg9uzkP6dtN7AuS
         VGKECsdEKrxja4Jcrs2V6e5/5TEcqp6bx7M+C9F4tD/ireF0taAf3JYA+dhxscPpr1dV
         L+aEFtSr/MkBjbpSG+hkI9LyTgiOHBG+m2WBMbuh6tN/aj8lV80LRgubS9I33dfxIkPR
         yVagwr83zn1re/dv+ijzzIlvFNTJCKsJGLfNFGl8Bpxh/TgAeSFlZoHcAgzotIXmi/3h
         VdqQ==
X-Gm-Message-State: AOAM532+ekTaO2HZ15O2nDGNLJkcHAn10nVwlVY2Xeo2JEkXguBVUz3Z
        4TkwcuuxvXlhJNSLfqOc2H8ogS2119/V
X-Google-Smtp-Source: ABdhPJzZgSafOved2t30rvjMdGvMLMYEG3EKmM30Dj0ir1oV15GOGx3lVl4CTO2MTirABiTeUKRQ8g==
X-Received: by 2002:aca:b554:: with SMTP id e81mr116572oif.105.1602182659228;
        Thu, 08 Oct 2020 11:44:19 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 68sm4623112otu.33.2020.10.08.11.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2020 11:44:18 -0700 (PDT)
Received: (nullmailer pid 2425486 invoked by uid 1000);
        Thu, 08 Oct 2020 18:44:17 -0000
Date:   Thu, 8 Oct 2020 13:44:17 -0500
From:   Rob Herring <robh@kernel.org>
To:     Naoki Hayama <naoki.hayama@lineo.co.jp>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/6] dt-bindings: pinctrl: sirf: Fix typo abitrary
Message-ID: <20201008184417.GA2425438@bogus>
References: <614fe604-ab8e-21cb-0c3a-db6ddeff2a4e@lineo.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <614fe604-ab8e-21cb-0c3a-db6ddeff2a4e@lineo.co.jp>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 08 Oct 2020 17:47:42 +0900, Naoki Hayama wrote:
> Fix comment typo.
> s/abitrary/arbitrary/
> 
> Signed-off-by: Naoki Hayama <naoki.hayama@lineo.co.jp>
> ---
>  Documentation/devicetree/bindings/pinctrl/pinctrl-atlas7.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks!
