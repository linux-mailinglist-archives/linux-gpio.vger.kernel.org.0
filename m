Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B1F135D1FF
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Apr 2021 22:28:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238866AbhDLU3L (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Apr 2021 16:29:11 -0400
Received: from mail-ot1-f49.google.com ([209.85.210.49]:35684 "EHLO
        mail-ot1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245750AbhDLU3K (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Apr 2021 16:29:10 -0400
Received: by mail-ot1-f49.google.com with SMTP id v24-20020a9d69d80000b02901b9aec33371so14081773oto.2;
        Mon, 12 Apr 2021 13:28:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gmmbo3TN+g8o4ISTYa9CAt/6v37cqafsVydyODiNQ7o=;
        b=G76AWklyf8AUuvhxMFa2RMXpL5nnbiW53XNYhkbWBDJSO77B54jn+2SvMZc8yK+/09
         7lnljxurQ5UFpvt+ISnpBv2N1p4Rqwn2eeDmg8jAZuURJ73vkJcTjO/zz9wCezfeQj0R
         3a60DOobujKL8bmogFlG+8czeZIWIGWWOdL+pQ5gOKsk6Bgl5x/r5iKKiqx5lQ29fDHR
         lH0fOpxxgNyZBZDriDS0ZdqfSj1fqi6lM0Y+DBYbj0NB5FuzMELCiTH2BIEgTnGm/aNt
         HTw4ssdZcn+hulWVtJ/B8Vj3CLrCMUfmpWV0WklDFC6Pt8ytMh6yIuQ6+kl8fiq78V5T
         yMmA==
X-Gm-Message-State: AOAM532iSEi8c/sYd+x2OiPX3MvimZs8193k5UeaOlDYLycqHY9cJvc2
        YaWdrHhkxvZQ/+EBs4xTeQ==
X-Google-Smtp-Source: ABdhPJxtch6LM4lIaaqORQ8JDSlz4d/MX0eMA45yfzohL4ty+Pm27CDjlNgIdUuhG6N65/W1aj4S3w==
X-Received: by 2002:a9d:7a53:: with SMTP id z19mr1905158otm.40.1618259331867;
        Mon, 12 Apr 2021 13:28:51 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id p3sm2406087oif.53.2021.04.12.13.28.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Apr 2021 13:28:50 -0700 (PDT)
Received: (nullmailer pid 120437 invoked by uid 1000);
        Mon, 12 Apr 2021 20:28:49 -0000
Date:   Mon, 12 Apr 2021 15:28:49 -0500
From:   Rob Herring <robh@kernel.org>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Peter Geis <pgwipeout@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-rockchip@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH] dt-bindings: pinctrl: rockchip: add RK3568 SoC support
Message-ID: <20210412202849.GA120386@robh.at.kernel.org>
References: <20210410204500.18091-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210410204500.18091-1-ezequiel@collabora.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, 10 Apr 2021 17:45:00 -0300, Ezequiel Garcia wrote:
> Add RK3568/RK3566 SoC support to pinctrl.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
