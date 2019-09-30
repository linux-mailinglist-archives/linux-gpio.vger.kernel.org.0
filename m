Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9ED3EC2953
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Oct 2019 00:14:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727220AbfI3WOT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 30 Sep 2019 18:14:19 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:40991 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726350AbfI3WOT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Sep 2019 18:14:19 -0400
Received: by mail-oi1-f195.google.com with SMTP id w17so12591670oiw.8;
        Mon, 30 Sep 2019 15:14:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=3JL07qcEomx/9mlKOqWt2erRCCI5K8JebJ9YmzD5Gcc=;
        b=FtVpnwExQsggMVh7RFhTMB9eCMqn7W81w5JZTHd4RYQqgNt7t3LGGSX/8v3X5EwNMQ
         iyHiSH0v9XJCY35ekbgTklNUFzO0Kn8dgofrdca0r9ayVVuiKPOIzmNgFAcupHqwvxUs
         cT7p5eWGU+1nrElcN70DEVSApc2urM7X9YlrdeQkC2rdRGaGyJUSJ1YcKUF6stEoFZPl
         S5HObIEr2UCXMgKNGTG+bopZgajHUxaSrXR/KXCf79joTtlBEqMiWcrw4BDJPcO0LyGv
         ArHcwuHlx5PaPcm7i6R/J3IBuz+//8RDfldi7+nYu2a1tD2NoVOBJV//HRUNcNi6pcEB
         IKrQ==
X-Gm-Message-State: APjAAAWIpThG9+uwv7P6ZC/eYQgrfq3/SWnjgG3rWZUzOBaX+BxTQ5gu
        dFgdHLDHlMXRUibdEGS6Jg==
X-Google-Smtp-Source: APXvYqxpwQgOYAduUVZFilh7lH0oLGASilH357Tyg+So0faHgnmK5HDGm97eoKIonTvMwBkzrp5Ekw==
X-Received: by 2002:aca:3c55:: with SMTP id j82mr1128598oia.135.1569881658562;
        Mon, 30 Sep 2019 15:14:18 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id v6sm4716139oie.4.2019.09.30.15.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2019 15:14:17 -0700 (PDT)
Date:   Mon, 30 Sep 2019 17:14:16 -0500
From:   Rob Herring <robh@kernel.org>
To:     Lina Iyer <ilina@codeaurora.org>
Cc:     swboyd@chromium.org, evgreen@chromium.org, maz@kernel.org,
        linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org,
        mkshah@codeaurora.org, linux-gpio@vger.kernel.org,
        Lina Iyer <ilina@codeaurora.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH RFC v2 06/14] dt-bindings/interrupt-controller: pdc: add
 SPI config register
Message-ID: <20190930221416.GA2501@bogus>
References: <1568411962-1022-1-git-send-email-ilina@codeaurora.org>
 <1568411962-1022-7-git-send-email-ilina@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1568411962-1022-7-git-send-email-ilina@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 13 Sep 2019 15:59:14 -0600, Lina Iyer wrote:
> In addition to configuring the PDC, additional registers that interface
> the GIC have to be configured to match the GPIO type. The registers on
> some QCOM SoCs are access restricted, while on other SoCs are not. They
> SoCs with access restriction to these SPI registers need to be written
> from the firmware using the SCM interface. Add a flag to indicate if the
> register is to be written using SCM interface.
> 
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Lina Iyer <ilina@codeaurora.org>
> ---
>  .../devicetree/bindings/interrupt-controller/qcom,pdc.txt   | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
