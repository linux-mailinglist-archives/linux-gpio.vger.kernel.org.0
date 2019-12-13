Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 732B311EDAA
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Dec 2019 23:25:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726599AbfLMWXT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Dec 2019 17:23:19 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:43316 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725948AbfLMWXT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Dec 2019 17:23:19 -0500
Received: by mail-ot1-f66.google.com with SMTP id p8so840832oth.10;
        Fri, 13 Dec 2019 14:23:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=WFqftU66d4lywk7YGZ8vQ6KoD9czO0JD1+b7jkC8Eqg=;
        b=rzCSMo2MX00Wdvp9juhU6Koug51XE5NcOQM+yKyLCFNeeRt1zKoDWFYk1WZXipJuEs
         g3yvqd3hS/w6xLtCZDuEEK7uDLR/FTPM8UYSfvtEc/yUaobhG/iE/XqwL4zpHHdDPviC
         JgVkUN4fUgnrMGS0RHnFR3M6N/EHwq/PA4jJBH/CgUtHfcfzUmG65NSKd4iaHrLd8bMs
         KuTZWnevcVkpGNiEqg+iMG25m0IqZu/7zScGzNxlyhb0CwflVvL+PP144jwMPY3esGfz
         jGSDkB29KiZitYYEzZo2scr7s6y8qG2AJkHrA4A7Wj22UJzCjlazST/ER+Jtx6x+CHAa
         Ph2g==
X-Gm-Message-State: APjAAAX5Y6RepbzGnHPj7EzA3GChjhWoON4x344XQRgHAEtYzM3AIzQL
        XKiTr08Wm282ZSSHUil0sg==
X-Google-Smtp-Source: APXvYqy7Ii9i/4Qz6GD0XbnXcIegXItw0XTqvH2+WBespuMeepCyhsU1dWL9fRUGXYM3UeXhG6HziQ==
X-Received: by 2002:a9d:6a8f:: with SMTP id l15mr16702538otq.59.1576275798548;
        Fri, 13 Dec 2019 14:23:18 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id k5sm3780843otp.33.2019.12.13.14.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2019 14:23:17 -0800 (PST)
Date:   Fri, 13 Dec 2019 16:23:17 -0600
From:   Rob Herring <robh@kernel.org>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     support.opensource@diasemi.com, lee.jones@linaro.org,
        robh+dt@kernel.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, joel@jms.id.au, andrew@aj.id.au,
        lgirdwood@gmail.com, broonie@kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
Subject: Re: [PATCH v3 5/6] dt-bindings: mfd: da9062: add regulator gpio
 enable/disable documentation
Message-ID: <20191213222317.GA32740@bogus>
References: <20191129172537.31410-1-m.felsch@pengutronix.de>
 <20191129172537.31410-6-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191129172537.31410-6-m.felsch@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 29 Nov 2019 18:25:36 +0100, Marco Felsch wrote:
> At the gpio-based regulator enable/disable documentation. This property
> can be applied to each subnode within the 'regulators' node so each
> regulator can be configured differently.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
> Changelog:
> v3:
> - adapt binding description
> 
>  Documentation/devicetree/bindings/mfd/da9062.txt | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
