Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40901314641
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Feb 2021 03:27:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230054AbhBIC1W (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Feb 2021 21:27:22 -0500
Received: from mail-oi1-f172.google.com ([209.85.167.172]:37580 "EHLO
        mail-oi1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229706AbhBIC1V (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Feb 2021 21:27:21 -0500
Received: by mail-oi1-f172.google.com with SMTP id y199so15881871oia.4;
        Mon, 08 Feb 2021 18:27:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/zVsordftVZTWAI3YzzzkRIve/FqPFfsNUmOZe9rJqc=;
        b=ExbqB9nsQnuXr5CMJdGjqR/BRsTbZ085teETmctFBoFiOgtqmDlszAb8+S+ogTnkd9
         gzQpLUlFxBbqWoM4D8SugvhsbzJeGhpG2QPAbgAwvG3aVXsibhmtgACG51obZjtvHsln
         mfIfXX7oJm1/mlJc6bWr/yb2OYg3IIflMCRgCbXFpCKKwQhON+Bwmhr+HW7BI0yBKyXs
         6ru9UWI6emn/Tsd7csQO5uJ4XIhvSv9dc64eH9oJCqQ48JtxqnYFBgQalHwWci9kdoyn
         JXccCKvWLLC8JEkLkNDyViprkG2S0ysR+IsIEx+3qrtWFXbqpgTds83VJKAsHA3ko5Sn
         18dg==
X-Gm-Message-State: AOAM5302BVddw4F7wYxWb33jQhA0Fri4KGj+wb1kem5fVVtPAoMx3N/6
        JJVNsch9QmjWiTmhaipxksZq3iTuJg==
X-Google-Smtp-Source: ABdhPJzQPON4jmKjw6SUDOl/dMLwFvPz18jUZKBs6P0IlGds5vnE9gviWS2mNEH81anW+KM2W1io6g==
X-Received: by 2002:aca:f1d4:: with SMTP id p203mr1121288oih.46.1612837598414;
        Mon, 08 Feb 2021 18:26:38 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id w7sm3946443oor.27.2021.02.08.18.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Feb 2021 18:26:37 -0800 (PST)
Received: (nullmailer pid 2551957 invoked by uid 1000);
        Tue, 09 Feb 2021 02:26:36 -0000
Date:   Mon, 8 Feb 2021 20:26:36 -0600
From:   Rob Herring <robh@kernel.org>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-power@fi.rohmeurope.com, mazziesaccount@gmail.com,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 07/17] dt_bindings: mfd: Add ROHM BD71815 PMIC
Message-ID: <20210209022636.GA2551904@robh.at.kernel.org>
References: <cover.1611037866.git.matti.vaittinen@fi.rohmeurope.com>
 <5e58cc041572d8540b4f1fbeea7bde955d6b2ea6.1611037866.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5e58cc041572d8540b4f1fbeea7bde955d6b2ea6.1611037866.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 19 Jan 2021 09:21:23 +0200, Matti Vaittinen wrote:
> Document DT bindings for ROHM BD71815.
> 
> BD71815 is a single-chip power management IC mainly for battery-powered
> portable devices. The IC integrates 5 bucks, 7 LDOs, a boost driver for
> LED, a battery charger with a Coulomb counter, a real-time clock, a 32kHz
> clock and two general-purpose outputs although only one is documented by
> the data-sheet.
> 
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> ---
> 
> Changes since v1:
>   - fixed patch ordering to meet ref dependencies
>   - added missing blank lines
>   - clkout-mode changed from string to tristated (uint)
>   - added default for rsense resistor
> 
>  .../bindings/mfd/rohm,bd71815-pmic.yaml       | 202 ++++++++++++++++++
>  1 file changed, 202 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/rohm,bd71815-pmic.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
