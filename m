Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8B4C21DFFE
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2020 20:41:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726338AbgGMSlh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Jul 2020 14:41:37 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:35885 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726306AbgGMSlg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Jul 2020 14:41:36 -0400
Received: by mail-io1-f65.google.com with SMTP id y2so14607137ioy.3;
        Mon, 13 Jul 2020 11:41:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oQHMMFsRt1WTWawQeb8TOPkChAd//JEj2G5rYLhtx78=;
        b=myj0USYHy7KAmJO01kK0qdH6eYtSi6hN3z/z+Lv0SHl+jnEQ0sK0K2hueuVL7bVGn/
         Lii6LIEl0Y111RYyQWmz9hwDuAYZawfSOYZvu5CS2iGs8r6iC99b0vDt2QLk+3urA/0b
         PIxUlwGmuWf6/CZ62Iav0gaEQ4CHGIt/E1t/YBZbRBP1tN5oTV4RjP5rdGD5C4yD8bm+
         wjwMhVKq2x9Z/zgGxW6xe4qSS0r51kMR0R3KW3+OJizcPt+PVgeSBCh3xx7A9R1QVkOS
         BRMZMKHphbK3jyGGwDvxP3oB5TZiDRIowKFgwsnHBjwzNjnE6fuHzZoPZXJwikaXJi29
         gYBg==
X-Gm-Message-State: AOAM532koSZkgZ53GczXRvPLb5xRFfQZ2PTsT20Uq29fuTiFohk6xQzd
        7Q/Fr/3FKPT8+KdYXhZ1KQ==
X-Google-Smtp-Source: ABdhPJyfcfCz7kW/Ut28yUJFCLVJtr1iOFLyh9bmH1WtFYUkym3z51+ZzDibT0TTX+JMOPCD6oxluA==
X-Received: by 2002:a02:840e:: with SMTP id k14mr1559046jah.133.1594665695615;
        Mon, 13 Jul 2020 11:41:35 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id d9sm1162144iod.55.2020.07.13.11.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 11:41:35 -0700 (PDT)
Received: (nullmailer pid 517491 invoked by uid 1000);
        Mon, 13 Jul 2020 18:41:34 -0000
Date:   Mon, 13 Jul 2020 12:41:34 -0600
From:   Rob Herring <robh@kernel.org>
To:     Lars Povlsen <lars.povlsen@microchip.com>
Cc:     devicetree@vger.kernel.org, Olof Johansson <olof@lixom.net>,
        SoC Team <soc@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 07/10] dt-bindings: clock: sparx5: Add bindings
 include file
Message-ID: <20200713184134.GA517461@bogus>
References: <20200615133242.24911-1-lars.povlsen@microchip.com>
 <20200615133242.24911-8-lars.povlsen@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200615133242.24911-8-lars.povlsen@microchip.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 15 Jun 2020 15:32:39 +0200, Lars Povlsen wrote:
> The Sparx5 support 9 different clock outputs. This include file has
> defines for each supported clock ordinal.
> 
> Reviewed-by: Stephen Boyd <sboyd@kernel.org>
> Reviewed-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Signed-off-by: Lars Povlsen <lars.povlsen@microchip.com>
> ---
>  include/dt-bindings/clock/microchip,sparx5.h | 23 ++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>  create mode 100644 include/dt-bindings/clock/microchip,sparx5.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
