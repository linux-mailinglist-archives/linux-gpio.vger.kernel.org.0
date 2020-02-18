Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E1FE1634EB
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Feb 2020 22:27:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727858AbgBRV1m (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Feb 2020 16:27:42 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:43727 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726339AbgBRV1m (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Feb 2020 16:27:42 -0500
Received: by mail-ot1-f65.google.com with SMTP id p8so20968896oth.10;
        Tue, 18 Feb 2020 13:27:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=7refnxEeRm7SYkBQGKPpWsQpWcFL/c9yrl6/7Io+6sU=;
        b=YZWLZjNA9hL+MEemKNuSC1NPqe59FuZqEoH5SHV/bsJjOTHvYtmhVFiBvQifpQurGI
         XAgwOcJ8czveMEKji96VLDu2Iu32SbNY65ihE7MBbQ4YUnifTGxg8OTHgMPlJSvnGYLB
         k3SGsQb1wvfPJvqSaJqNNkJF6cJaXJOOSflqOUol+xYI3M6qwpWXzOKmSxJE1HUveZb6
         k1tKZA2DpvMFhjaSLal6mbdUUgmqWotzJobex01kGna08vUViTCFcTNHUQ0PVpleNc3x
         fyJnp5maw7Q5OVacXtwNz48ojdW/HSozdJYsRMGPpjGePu/O8qL5djxtAI+8B/9FmP+z
         0c5w==
X-Gm-Message-State: APjAAAWvTr6YgOnxkJH5BhypyClidTFys+BKD/g7YZxKCcp2ftKMCBLK
        c3xSpSINQDW2eoWl5k0TkA==
X-Google-Smtp-Source: APXvYqyUJxExdwMUzGxK7lYZeDEF5FhoGMqcJ7+RDmKImqATHWgRyE2lHkfz+pQ+ld+BL6Gee86+zg==
X-Received: by 2002:a9d:6251:: with SMTP id i17mr17699503otk.14.1582061261659;
        Tue, 18 Feb 2020 13:27:41 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id w6sm1749028otp.69.2020.02.18.13.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2020 13:27:40 -0800 (PST)
Received: (nullmailer pid 2645 invoked by uid 1000);
        Tue, 18 Feb 2020 21:27:39 -0000
Date:   Tue, 18 Feb 2020 15:27:39 -0600
From:   Rob Herring <robh@kernel.org>
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     aisheng.dong@nxp.com, festevam@gmail.com, shawnguo@kernel.org,
        stefan@agner.ch, kernel@pengutronix.de, linus.walleij@linaro.org,
        robh+dt@kernel.org, mark.rutland@arm.com, s.hauer@pengutronix.de,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Linux-imx@nxp.com
Subject: Re: [PATCH V4 3/4] dt-bindings: pinctrl: Convert i.MX8MN to
 json-schema
Message-ID: <20200218212739.GA2588@bogus>
References: <1582012300-30260-1-git-send-email-Anson.Huang@nxp.com>
 <1582012300-30260-3-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1582012300-30260-3-git-send-email-Anson.Huang@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 18 Feb 2020 15:51:39 +0800, Anson Huang wrote:
> Convert the i.MX8MN pinctrl binding to DT schema format using json-schema
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
> Changes since V3:
> 	- use uint32-matrix instead of uint32-array for fsl,pins.
> ---
>  .../bindings/pinctrl/fsl,imx8mn-pinctrl.txt        | 39 ----------
>  .../bindings/pinctrl/fsl,imx8mn-pinctrl.yaml       | 82 ++++++++++++++++++++++
>  2 files changed, 82 insertions(+), 39 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx8mn-pinctrl.txt
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx8mn-pinctrl.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
