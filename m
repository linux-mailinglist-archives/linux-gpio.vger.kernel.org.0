Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 092D92215D1
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2020 22:12:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727021AbgGOUKk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Jul 2020 16:10:40 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:37967 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726736AbgGOUKj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Jul 2020 16:10:39 -0400
Received: by mail-io1-f66.google.com with SMTP id l1so3625208ioh.5;
        Wed, 15 Jul 2020 13:10:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PZjB8/CMEETpBkbeRKx9ftE2fCGVRM7G1ohhFyo9PMg=;
        b=krlWrOuPvUBKpsqSlMPM9n4x+pvxebZm/Zhi2yIj7xOaagG9Ut7Nx4Gwv7eb9kfTft
         DjviPJXJB2yQ3JK/WL72ytpv3jPq/G6zJb8mUzo6tcGWx/OuL1ZqdWiWqPpmwkA8+HtF
         im/2QPeXzEfSLMsHAT6ldWmjIBBqbAp7YHNXEJ9Jzu8e/z+X4BV0eeWWBvQXVZLiKNZF
         cXFNU5qN45KM6QwfTAp8TKzkndMD85r7mrnx78UGUi+chsWgmif00BobW3hWt4vcI0Fv
         zMh0nZA6psyGOuY8EGRgq//QVhGKMtkfnlPm0k3cypVty/eMaN+IbVTMOtihsTUSgedI
         UGbA==
X-Gm-Message-State: AOAM5338G3Sg5W7DdG1rvewc1RdaSrAyiaQKBKL1H323ewTGsNldYwl3
        wDnqjZQoL5SfESdQIETpQ883ZoKTUg==
X-Google-Smtp-Source: ABdhPJy6W+PX8HhKheesu2WdiQZ34JavrPknF9JZGonu6FiRXX7RyrwS3AnDpAPkyCihjlpTtoY0XA==
X-Received: by 2002:a6b:f012:: with SMTP id w18mr1023275ioc.5.1594843838686;
        Wed, 15 Jul 2020 13:10:38 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id c9sm1509666ilm.57.2020.07.15.13.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2020 13:10:38 -0700 (PDT)
Received: (nullmailer pid 740419 invoked by uid 1000);
        Wed, 15 Jul 2020 20:10:37 -0000
Date:   Wed, 15 Jul 2020 14:10:37 -0600
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Chris Brandt <chris.brandt@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: pinctrl: renesas,rza2-pinctrl: Convert to
 json-schema
Message-ID: <20200715201037.GA740389@bogus>
References: <20200626143638.16512-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200626143638.16512-1-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 26 Jun 2020 16:36:38 +0200, Geert Uytterhoeven wrote:
> Convert the Renesas RZ/A2 combined Pin and GPIO controller Device Tree
> binding documentation to json-schema.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  .../bindings/pinctrl/renesas,rza2-pinctrl.txt |  87 ---------------
>  .../pinctrl/renesas,rza2-pinctrl.yaml         | 100 ++++++++++++++++++
>  2 files changed, 100 insertions(+), 87 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,rza2-pinctrl.txt
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,rza2-pinctrl.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
