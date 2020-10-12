Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55D5728BD49
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Oct 2020 18:10:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390416AbgJLQKl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Oct 2020 12:10:41 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:46670 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389068AbgJLQKl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Oct 2020 12:10:41 -0400
Received: by mail-ot1-f66.google.com with SMTP id m11so16257817otk.13;
        Mon, 12 Oct 2020 09:10:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BwqtUQb1TuiYiJiUyBuouIRpTXF0k6CE+S2geIx75tk=;
        b=Tkp3BXaEnwMWSuabbGY2sBjAGkCuJcYDUCdZwMTQe8Mto6OALYNkWDG4Hf89IUZir3
         rD1GZRLH/TmB1NIi33h3AKzBpms70Sb3yA9XKnyoP4BR7lvfPVlkX0THz6cJRxJYNkti
         HSRfJSbr6TmPsVk0Ff+LSwMLldCwtiJVdcRqgAb240F0BZdVe54kq//XIzsfDlQRmybo
         IuOEQigweOjE9UxeXAkcdAFbCJtcmwi/I+Is/aUuEHf8StMR9UUOe0RC0cLT7c4sZtIk
         Ag7II6l5j/rnrj2RYdwPKD/AzmtPqvio7OnvWh2lqE3pfgwuEFgiQ6rI/7z2Jcygd8Eb
         6ecQ==
X-Gm-Message-State: AOAM530SgmVzXz3pfwi/0IUO9dDfY1OIhN+Hbt3FW0caOahKpTZs1OIg
        Z48mw7AT81fy751s2WAWZQ==
X-Google-Smtp-Source: ABdhPJwnx55yaR1oBqB7YtefKiEOty5pILsY9A1rcmDBuLfjtVHcPGh+YE+waK3LKSpbVmGnKiDAww==
X-Received: by 2002:a9d:65c7:: with SMTP id z7mr11527552oth.327.1602519040715;
        Mon, 12 Oct 2020 09:10:40 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id b7sm1023940oic.36.2020.10.12.09.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2020 09:10:40 -0700 (PDT)
Received: (nullmailer pid 1635109 invoked by uid 1000);
        Mon, 12 Oct 2020 16:10:39 -0000
Date:   Mon, 12 Oct 2020 11:10:39 -0500
From:   Rob Herring <robh@kernel.org>
To:     Daniel Palmer <daniel@0x0f.com>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: gpio: Binding for MStar MSC313 GPIO
 controller
Message-ID: <20201012161039.GA1632962@bogus>
References: <20201011024831.3868571-1-daniel@0x0f.com>
 <20201011024831.3868571-2-daniel@0x0f.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201011024831.3868571-2-daniel@0x0f.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, 11 Oct 2020 11:48:27 +0900, Daniel Palmer wrote:
> Add a binding description for the MStar/SigmaStar GPIO controller
> found in the MSC313 and later ARMv7 SoCs.
> 
> Signed-off-by: Daniel Palmer <daniel@0x0f.com>
> ---
>  .../bindings/gpio/mstar,msc313-gpio.yaml      | 69 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 70 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/mstar,msc313-gpio.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

Documentation/devicetree/bindings/gpio/mstar,msc313-gpio.example.dts:21:18: fatal error: dt-bindings/gpio/msc313-gpio.h: No such file or directory
   21 |         #include <dt-bindings/gpio/msc313-gpio.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:342: Documentation/devicetree/bindings/gpio/mstar,msc313-gpio.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1366: dt_binding_check] Error 2


See https://patchwork.ozlabs.org/patch/1380236

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

