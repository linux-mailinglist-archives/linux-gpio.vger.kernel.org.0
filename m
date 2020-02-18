Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 112371634F2
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Feb 2020 22:29:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726595AbgBRV3F (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Feb 2020 16:29:05 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:40637 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726339AbgBRV3E (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Feb 2020 16:29:04 -0500
Received: by mail-ot1-f65.google.com with SMTP id i6so21030913otr.7;
        Tue, 18 Feb 2020 13:29:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=whxmhsnQg5rfeVQ8ZQ6aBPD0ZGe096z7/eTSnisT0kE=;
        b=RyGv/hjBo0zMcfCt4juT9SXvDolxNpOx+jSSvL3sN3XQ5fvtbHDGy8BRJN544hrIjV
         +y7McCvkHoN7x8UhkTEV8jsE2o97SSajhxS76rbEnF+jmtI+WrygildiGAw6VaYsBUKB
         cfR2ZGM9WAsNLc3UN8MO5crv2SzRXppzlq0so6X7JGGcAinRA6P4dc6n+3RWr0pIpC6Q
         THnHr2Z+XlJUHpYbePuI8GaIuEKtVWGpR3EtfvF1IiyTbLLz9Oo5I5FSXLDDyPAZiywF
         Bg+UEwBuzXFeabrvRvUwu9fmKc/1/9B80AsIa+6RM6UiIzGA5Da0eWt+JO4q8vIkwvkw
         9FiA==
X-Gm-Message-State: APjAAAUfk9YVly9IE0NLBKSH8iuCsNhmkOhiqf9j59wMWT45zWYmry8H
        p7CdVbXWwS/cfXiX/UG/JA==
X-Google-Smtp-Source: APXvYqxRtM8ThXtjCCD0M0nTwLEpFE/kUUuYb2tUlDQdcZPWlIjs8Joc8bDnpkG6QuXG2SStNT5Ndg==
X-Received: by 2002:a9d:5885:: with SMTP id x5mr16787058otg.132.1582061342694;
        Tue, 18 Feb 2020 13:29:02 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id r2sm1752661otk.22.2020.02.18.13.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2020 13:29:02 -0800 (PST)
Received: (nullmailer pid 4897 invoked by uid 1000);
        Tue, 18 Feb 2020 21:29:01 -0000
Date:   Tue, 18 Feb 2020 15:29:01 -0600
From:   Rob Herring <robh@kernel.org>
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     aisheng.dong@nxp.com, festevam@gmail.com, shawnguo@kernel.org,
        stefan@agner.ch, kernel@pengutronix.de, linus.walleij@linaro.org,
        robh+dt@kernel.org, mark.rutland@arm.com, s.hauer@pengutronix.de,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Linux-imx@nxp.com
Subject: Re: [PATCH V4 4/4] dt-bindings: pinctrl: imx8mp: Replace the
 uint32-array with uint32-matrix
Message-ID: <20200218212901.GA4859@bogus>
References: <1582012300-30260-1-git-send-email-Anson.Huang@nxp.com>
 <1582012300-30260-4-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1582012300-30260-4-git-send-email-Anson.Huang@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 18 Feb 2020 15:51:40 +0800, Anson Huang wrote:
> The items of mux_reg/conf_reg/input_reg/mux_val/input_val/pad_setting
> should be uint32-matrix instead of uint32-array, fix it and improve the
> schema and example.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
> New patch.
> ---
>  .../bindings/pinctrl/fsl,imx8mp-pinctrl.yaml       | 25 ++++++++++++++++------
>  1 file changed, 19 insertions(+), 6 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
