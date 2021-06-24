Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8666D3B380E
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jun 2021 22:43:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229525AbhFXUpy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Jun 2021 16:45:54 -0400
Received: from mail-io1-f43.google.com ([209.85.166.43]:33761 "EHLO
        mail-io1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230116AbhFXUpx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Jun 2021 16:45:53 -0400
Received: by mail-io1-f43.google.com with SMTP id a6so9990253ioe.0;
        Thu, 24 Jun 2021 13:43:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=kT7rK5sc+dKix955eFVx5gPXvat2NwiKhdWbIUjTAuM=;
        b=pHKDwcjqn0oVSnmPWI5unJYZLzlVwYN8Uyv5FoqksEX23BlD+Eh4B4XE4G2D38fnOZ
         NYb3aXfHcU8IagekfFbOjI+MiAHzRJkhQ70tdLHrd1zqsHcPF5pE5p63toNpcVDnn2zo
         hICfL5PCvTrcCXNGjnPcKEV0e7cNo4Ec4LEi6fV4GMufNHVkQIEv798PPfCFcDI4U01g
         IJ2rUc60p07QD8SAF1awswBgpL4PaFN/QDDtkBW189j7MsRGlTKSeRB+Vlr/HMwPGvJj
         hNIL5EwaDVmaAJJ7X6sJ+/wcxqo4nEdqlEQgXlzG8SaZzL6zX7HlxNu3EV/asfsffjjJ
         iNWA==
X-Gm-Message-State: AOAM531+Agzmd3YkCDIfaIp2XwDFwuMVynENYHYo9QGO0iXd1XPPBpVD
        UFAIiXsWoeLoF4RKqkT7RA==
X-Google-Smtp-Source: ABdhPJxE3JC6Ln0Nr0LFkH5NYNUwQkMHm84HO3+NqZ3uBQC2cgcYVYbrRvaK9ruZJaeY1CcqhYqVkw==
X-Received: by 2002:a02:3781:: with SMTP id r123mr3243868jar.26.1624567413103;
        Thu, 24 Jun 2021 13:43:33 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id d2sm683047ioy.33.2021.06.24.13.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jun 2021 13:43:32 -0700 (PDT)
Received: (nullmailer pid 1956153 invoked by uid 1000);
        Thu, 24 Jun 2021 20:43:27 -0000
Date:   Thu, 24 Jun 2021 14:43:27 -0600
From:   Rob Herring <robh@kernel.org>
To:     Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc:     Gregory Clement <gregory.clement@bootlin.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        pali@kernel.org, linux-arm-kernel@lists.infradead.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh+dt@kernel.org>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: [PATCH] pinctrl: armada-37xx: Correct PWM pins definitions
Message-ID: <20210624204327.GA1956119@robh.at.kernel.org>
References: <20210614222527.11237-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210614222527.11237-1-kabel@kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 15 Jun 2021 00:25:27 +0200, Marek Behún wrote:
> The PWM pins on North Bridge on Armada 37xx can be configured into PWM
> or GPIO functions. When in PWM function, each pin can also be configured
> to drive low on 0 and tri-state on 1 (LED mode).
> 
> The current definitions handle this by declaring two pin groups for each
> pin:
> - group "pwmN" with functions "pwm" and "gpio"
> - group "ledN_od" ("od" for open drain) with functions "led" and "gpio"
> 
> This is semantically incorrect. The correct definition for each pin
> should be one group with three functions: "pwm", "led" and "gpio".
> 
> Change the "pwmN" groups to support "led" function.
> 
> Remove "ledN_od" groups. This cannot break backwards compatibility with
> older device trees: no device tree uses it since there is no PWM driver
> for this SOC yet. Also "ledN_od" groups are not even documented.
> 
> Signed-off-by: Marek Behún <kabel@kernel.org>
> ---
>  .../pinctrl/marvell,armada-37xx-pinctrl.txt      |  8 ++++----
>  drivers/pinctrl/mvebu/pinctrl-armada-37xx.c      | 16 ++++++++--------
>  2 files changed, 12 insertions(+), 12 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
