Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D593435A186
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Apr 2021 16:53:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233687AbhDIOxc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Apr 2021 10:53:32 -0400
Received: from mail-ot1-f43.google.com ([209.85.210.43]:46003 "EHLO
        mail-ot1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233019AbhDIOxa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Apr 2021 10:53:30 -0400
Received: by mail-ot1-f43.google.com with SMTP id f75-20020a9d03d10000b0290280def9ab76so822163otf.12;
        Fri, 09 Apr 2021 07:53:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wEUFq75l0cPqrW8PpOEi09xtkWWpE4+uw14yF7Xi3VI=;
        b=TuL4x5lSETn/wcnrLuH3u/uH4eCIT61fY3M9bRH22HbJd9jb2N7EC3deIBFXMhviV+
         SBdRo4xtNV5f7IpU2vlFVAa/zBPiwezcpSqqPE4XZZtt2gx1nAi4TUVok4GF3QFMeTq1
         cHc0XtXMJ1o6K2y56QCZDkIlN9BD3BjFkq2Gcb5BfXQNNTHMlyf1aTCeckV8kcl65Q1J
         Llypivl4f0G8sk+dz0BxisyyJV9pKjRLZuZkqXToeiibsZ0HjKt8xOfOpspNPUdWm2bn
         VSW5byC6d/TK53XDYppcwttUTVV8tfyp0oKJRsbv3pSSEn+S070GRFJhmgI4KjFjDNZ9
         HbMw==
X-Gm-Message-State: AOAM5339zkMYGfz/V2FdkD/S/wn/fGjX428PSGBoNKBxnESwMYR/hRZZ
        PE5eSlLcazdKsKURJYgE6A==
X-Google-Smtp-Source: ABdhPJwYlry7cBcHl3An98IkFAakpdZGXr7d89QYyHIEr/PdgViXwKc3NwNCFvhCD4zPLEKK4EAqIA==
X-Received: by 2002:a9d:d0d:: with SMTP id 13mr12066019oti.134.1617979997370;
        Fri, 09 Apr 2021 07:53:17 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id m14sm658418otn.69.2021.04.09.07.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 07:53:16 -0700 (PDT)
Received: (nullmailer pid 3635689 invoked by uid 1000);
        Fri, 09 Apr 2021 14:53:15 -0000
Date:   Fri, 9 Apr 2021 09:53:15 -0500
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH] dt-bindings: gpio: fairchild,74hc595: Convert to
 json-schema
Message-ID: <20210409145315.GA3635654@robh.at.kernel.org>
References: <df145e77bd124721f28cbc58fb3c58c138f13d86.1617365710.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <df145e77bd124721f28cbc58fb3c58c138f13d86.1617365710.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 02 Apr 2021 14:19:58 +0200, Geert Uytterhoeven wrote:
> Convert the Generic 8-bit shift register Device Tree binding
> documentation to json-schema.
> 
> Rename from gpio-74x164 to fairchild,74hc595, as the former refers to
> the Linux driver, and not to a hardware name.
> Add the missing hog description.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> The original file did not contain license information, so I used the
> most popular/recommended one for DT bindings.
> I listed the original author of the bindings as maintainer.
> ---
>  .../bindings/gpio/fairchild,74hc595.yaml      | 77 +++++++++++++++++++
>  .../devicetree/bindings/gpio/gpio-74x164.txt  | 27 -------
>  2 files changed, 77 insertions(+), 27 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml
>  delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-74x164.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
