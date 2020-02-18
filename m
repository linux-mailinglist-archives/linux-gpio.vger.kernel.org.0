Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6BC01634DA
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Feb 2020 22:26:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726634AbgBRV0y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Feb 2020 16:26:54 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:35081 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726339AbgBRV0y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Feb 2020 16:26:54 -0500
Received: by mail-ot1-f66.google.com with SMTP id r16so21059709otd.2;
        Tue, 18 Feb 2020 13:26:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=h2K/XZraKn9rsfZd2B0zXYFlvkUJ0wpYcKLlh++3J+s=;
        b=toP5ZrXWlPfWBlMpWLDSJV0L8LipZC0ZrL/j0NzcdaQeNrTBrK4pIZUbJVVaIwGxXT
         pLy2ufFIF/xim5KalJt5hwlOjGhm/MKWRRQA0FrsVgcdWEuGMT1HmJpoopVoK+VvRs+5
         znOYPmzxkgsKUeZVNfqC9hK+BR4RW+degSrEjsf4YqhzR0T+7YO4zau93UopIRZ93et5
         JGnxkcQ/hDFRU3wki9AocKFWOTdzsiy0A6XUJVQNd+zxc+u2mKZEF6EuQo1t3OzUEuZU
         w94MNUncUFns7nncprfolz4Ak9eoCckx17xneXAffFRHjb4YrDlyqBrEMMd6ilFAd+pv
         uklA==
X-Gm-Message-State: APjAAAWxvpraT/peD0m787NfVIEBFqqv1lwDUqCkXpk49OhAktg9qV3i
        sm5UxqHKD6JMnP7aclAMVA==
X-Google-Smtp-Source: APXvYqzbaCZzvfi8Cy+dBrQE5LP4XZSe/Xg6NlqllGYh8sbHW2iC9O4HRQTU/e/DPHz1Tg6BpoIGHg==
X-Received: by 2002:a9d:111:: with SMTP id 17mr17106296otu.256.1582061213266;
        Tue, 18 Feb 2020 13:26:53 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id r13sm15269oic.52.2020.02.18.13.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2020 13:26:52 -0800 (PST)
Received: (nullmailer pid 1306 invoked by uid 1000);
        Tue, 18 Feb 2020 21:26:51 -0000
Date:   Tue, 18 Feb 2020 15:26:51 -0600
From:   Rob Herring <robh@kernel.org>
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     aisheng.dong@nxp.com, festevam@gmail.com, shawnguo@kernel.org,
        stefan@agner.ch, kernel@pengutronix.de, linus.walleij@linaro.org,
        robh+dt@kernel.org, mark.rutland@arm.com, s.hauer@pengutronix.de,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Linux-imx@nxp.com
Subject: Re: [PATCH V4 1/4] dt-bindings: pinctrl: Convert i.MX8MQ to
 json-schema
Message-ID: <20200218212651.GA1209@bogus>
References: <1582012300-30260-1-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1582012300-30260-1-git-send-email-Anson.Huang@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 18 Feb 2020 15:51:37 +0800, Anson Huang wrote:
> Convert the i.MX8MQ pinctrl binding to DT schema format using json-schema
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
> Changes since V3:
> 	- use uint32-matrix instead of uint32-array for fsl,pins.
> ---
>  .../bindings/pinctrl/fsl,imx8mq-pinctrl.txt        | 36 ----------
>  .../bindings/pinctrl/fsl,imx8mq-pinctrl.yaml       | 82 ++++++++++++++++++++++
>  2 files changed, 82 insertions(+), 36 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx8mq-pinctrl.txt
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx8mq-pinctrl.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
