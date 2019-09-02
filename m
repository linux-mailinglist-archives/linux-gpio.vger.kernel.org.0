Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 507E9A598C
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2019 16:41:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730874AbfIBOk0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Sep 2019 10:40:26 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:45584 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730830AbfIBOk0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Sep 2019 10:40:26 -0400
Received: by mail-wr1-f67.google.com with SMTP id q12so14241135wrj.12;
        Mon, 02 Sep 2019 07:40:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=gF2YRoI6/lwt/TFrMmnLSeITDMeILS4+8zt7lZ2omHo=;
        b=SeD1F11cXtnLnW8M3vBCdD1wlLJ8w/5LP6d+V+4Vlv91+v0XCPwv827KEG8Xo4xYbj
         IohDbp5OyaDgbcpYX4CzKDwebbYrbt6SXQibN+j0BIpKLXRCnwarVW9gfjTdZhiED7cc
         UABBye0tc4hDMMbNsT029lm/CS0Q0lxXaH4sbrreD84gTGu1FCP55UAl3DAhRZnbVlNg
         Yn7XrLKe6tx9OYfknoOG5vTkZtILGU0nDQDCkVyZZi6DwOczbjPXqOmrlv7dNyu78+Za
         5+iC6fy80cQ4utrys9ndpQ3dnETiNtWYGl3gCskoN1SfRW2PjDULxNKODgnmBn6W1Cba
         IuEQ==
X-Gm-Message-State: APjAAAUsaJ0kW3no0/sOtjhkkZPms85IAoFPkic7FeT1zp1RQv7Si4WE
        Xlv9IPBJex9mLGBUqkl3eQ==
X-Google-Smtp-Source: APXvYqzRwSzgzhnfparGWRJaR6tBJvpa7gyFCJoMnUO+USlBgu95jVtD97+bXRcYz9WicR2EhMiC3g==
X-Received: by 2002:a5d:51c7:: with SMTP id n7mr35130945wrv.73.1567435224169;
        Mon, 02 Sep 2019 07:40:24 -0700 (PDT)
Received: from localhost ([212.187.182.166])
        by smtp.gmail.com with ESMTPSA id o193sm14431348wme.39.2019.09.02.07.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2019 07:40:23 -0700 (PDT)
Date:   Mon, 2 Sep 2019 15:40:22 +0100
From:   Rob Herring <robh@kernel.org>
To:     Peter Vernia <peter.vernia@gmail.com>
Cc:     peter.vernia@gmail.com, linus.walleij@linaro.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, poeschel@lemonage.de
Subject: Re: [PATCH] pinctrl-mcp23s08: Fix property-name in dt-example
Message-ID: <20190902144022.GA24928@bogus>
References: <20190828195609.4176-1-peter.vernia@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190828195609.4176-1-peter.vernia@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 28 Aug 2019 15:56:09 -0400, Peter Vernia wrote:
> The device-tree properties documentation-file specifies the property
> "microchip,spi-present-mask" as required for MCP23SXX chips. However,
> the device-tree-source example below it uses only "spi-present-mask".
> Without "microchip," on the front, the driver will print "missing
> spi-present-mask" when it initializes.
> 
> Update the device-tree example with the correct property-name.
> 
> Signed-off-by: Peter Vernia <peter.vernia@gmail.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks.

Rob
