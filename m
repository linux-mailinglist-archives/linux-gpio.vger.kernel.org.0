Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C6151CE355
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2020 20:56:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731216AbgEKSzJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 May 2020 14:55:09 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:44203 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729319AbgEKSzJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 May 2020 14:55:09 -0400
Received: by mail-oi1-f196.google.com with SMTP id a2so15842091oia.11;
        Mon, 11 May 2020 11:55:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=15fqUTBbGkCYYgO6aQ2//ab8dhylYn7tEDS1rTwHFVM=;
        b=Zvq3vWIt4q8RBm26+eh2qBq+amueBZBeY/AVVBUDzuw42dtgPBcMnxlcPMAcAm5c2E
         m1yR67VDSsbP5FZIG9//dYIVPcFyCSBVeITyCFLoSXWbHX20Qvx/oGjjkF/IJNMz7usU
         DhZeHQVd0j0BRlgZo0RD5uJgeTyXdCI/8VultuJObz6yE8+jhXbCUoKLdr/sGWNduZKa
         pCuFixyT2PlaJwcraBrOmK36eMm9zCYHRvRTeDB1VjW1lx6uby4z3v24L8wYtnOmUVDt
         ARYv1g01vyEbE4y8XKowHanjVp4WneLmSti0H84d+kGuK73dcafjcAjzIbref7wNssKk
         VnkA==
X-Gm-Message-State: AGi0PuY3BBPVS74llEr6mKZ3Je+WphkW5FnES6Q/yG5vx3GCoL2r2t/I
        TduepPmTk9ThgEmX3gsj2Q==
X-Google-Smtp-Source: APiQypJUK52Qvz/hH1CBnkScZtXZIATgQ5sOjkBcv7OmmrpsWSUvPZiWoAXmBcreoTsVSEWK7XfpbA==
X-Received: by 2002:aca:3b41:: with SMTP id i62mr2758590oia.101.1589223308498;
        Mon, 11 May 2020 11:55:08 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id f16sm4749433oib.25.2020.05.11.11.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 11:55:07 -0700 (PDT)
Received: (nullmailer pid 31916 invoked by uid 1000);
        Mon, 11 May 2020 18:55:07 -0000
Date:   Mon, 11 May 2020 13:55:07 -0500
From:   Rob Herring <robh@kernel.org>
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     s.hauer@pengutronix.de, robh+dt@kernel.org,
        devicetree@vger.kernel.org, bgolaszewski@baylibre.com,
        festevam@gmail.com, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
        shawnguo@kernel.org, linus.walleij@linaro.org,
        linux-kernel@vger.kernel.org, Linux-imx@nxp.com
Subject: Re: [PATCH V2] dt-bindings: gpio: Convert i.MX to json-schema
Message-ID: <20200511185507.GA31675@bogus>
References: <1587477823-21036-1-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1587477823-21036-1-git-send-email-Anson.Huang@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 21 Apr 2020 22:03:43 +0800, Anson Huang wrote:
> Convert the i.MX GPIO binding to DT schema format using json-schema.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
> Changes since V1:
> 	- improve compatible;
> 	- drop clocks description.
> ---
>  .../devicetree/bindings/gpio/fsl-imx-gpio.txt      | 35 -----------
>  .../devicetree/bindings/gpio/fsl-imx-gpio.yaml     | 68 ++++++++++++++++++++++
>  2 files changed, 68 insertions(+), 35 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/gpio/fsl-imx-gpio.txt
>  create mode 100644 Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml
> 

Applied, thanks!
