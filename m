Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 42EB713B679
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jan 2020 01:14:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728884AbgAOAOC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Jan 2020 19:14:02 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:46056 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728759AbgAOAOA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Jan 2020 19:14:00 -0500
Received: by mail-ot1-f66.google.com with SMTP id 59so14488878otp.12
        for <linux-gpio@vger.kernel.org>; Tue, 14 Jan 2020 16:14:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Vm6D/kKtAQPyA/3q2QOxNghbHuIfBqj+2jZduMBeUh4=;
        b=qPruVDmuNQlGCDO1yPdLb6Cn0XxPAFpdZMNsWJ2+1GKo48VCMOzCzX98d5W7u+sSAI
         H0E7oW6+9K9Qt4Mlzs51unP64ng9oNiSIby4U/jVRh28MKMfTtFlq42gcyORrUTKJKGq
         m5DAIwCrlHOr9X73CpRf2s1vgR+nsLlLguv9AIJv6Djmlu7tqRr/rX7Ka5hRhwuxgrpS
         2OfgUfuN7G8PDITxTiULSmFsJSat/8TY4aGB7gTYAFV+gM/KkG6ywE9cxpnIJANvAFdc
         HNu39AjSxqRhuC1tC0JsSLF7VCkP/elEYwvB4INQQkYUJMwufe2UYz9H3/Lt951fm2/o
         6iFQ==
X-Gm-Message-State: APjAAAVDB2oq4QcJ43lwebH5+5VJhlFf0kK9XGm/gO9vCTHXAm8EasO+
        n0y6s7FNZx3V06aJiMQIsd56uzA=
X-Google-Smtp-Source: APXvYqwgthwZNw9sw1AWKGU+3drue3Ep09TeIHVtIGUx8EVTavxGuVNOVp5btt7So9IAbF88F4o5fw==
X-Received: by 2002:a9d:649a:: with SMTP id g26mr784282otl.214.1579047239684;
        Tue, 14 Jan 2020 16:13:59 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 26sm5197200oij.9.2020.01.14.16.13.57
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2020 16:13:58 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 220a2e
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Tue, 14 Jan 2020 18:13:57 -0600
Date:   Tue, 14 Jan 2020 18:13:57 -0600
From:   Rob Herring <robh@kernel.org>
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     aisheng.dong@nxp.com, festevam@gmail.com, shawnguo@kernel.org,
        stefan@agner.ch, kernel@pengutronix.de, linus.walleij@linaro.org,
        mark.rutland@arm.com, s.hauer@pengutronix.de,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Linux-imx@nxp.com
Subject: Re: [PATCH V2 1/3] dt-bindings: pinctrl: Convert i.MX8MQ to
 json-schema
Message-ID: <20200115001357.GA16961@bogus>
References: <1578629120-25793-1-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1578629120-25793-1-git-send-email-Anson.Huang@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jan 10, 2020 at 12:05:18PM +0800, Anson Huang wrote:
> Convert the i.MX8MQ pinctrl binding to DT schema format using json-schema
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
> Changes since V1:
> 	- use "grp$" instead of "-grp$";
> 	- use space instead of tab for "ref$";
> 	- add missed "reg" property;
> 	- remove the "maxItem" for "fsl,pins" to avoid build warning, as the item number is changable.
> ---
>  .../bindings/pinctrl/fsl,imx8mq-pinctrl.txt        | 36 -----------
>  .../bindings/pinctrl/fsl,imx8mq-pinctrl.yaml       | 69 ++++++++++++++++++++++
>  2 files changed, 69 insertions(+), 36 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx8mq-pinctrl.txt
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx8mq-pinctrl.yaml

Actually, it looks like you can combine all 3 into a single schema. The 
only diff is the compatible string.

Rob
