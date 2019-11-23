Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A566107BEC
	for <lists+linux-gpio@lfdr.de>; Sat, 23 Nov 2019 01:16:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726690AbfKWAQU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Nov 2019 19:16:20 -0500
Received: from mail-yb1-f194.google.com ([209.85.219.194]:46947 "EHLO
        mail-yb1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726666AbfKWAQU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Nov 2019 19:16:20 -0500
Received: by mail-yb1-f194.google.com with SMTP id v15so3404489ybp.13;
        Fri, 22 Nov 2019 16:16:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=AWbc+0xnr2iQmZkFdWIsFKG7VK+BrYiOiqfXMahXEMs=;
        b=cFse6kS06qpWgFGFc/5kGqC+FlJogobX8tMHPgVshR91tQWYyD77JE983EYu/piUSe
         2p+ovUO3L6Es5pjttECNYHKT+j99cD1ErLyUogl8nODZiENOT7cApsxMJGJgCB48lM7R
         3svF7r58IiTiTnJRCQz0GPjImunz2MZd0V2CjY+U2lctSzQqnkMrWKXjfAiKHhh7nCpy
         PZRzpD/z8PfyXb4KSzzDsZrGxNSlZSZdCg26uQJ83PArv6iXqz9DBjgQogIrqY6kRTb+
         mLle+KgEMKnbyx4wMnjrq9eB4yBvRZqYJj25CUt8S/a3F6O/VHQP33/xkEs+04zAYTd7
         9XVA==
X-Gm-Message-State: APjAAAVEvMg/s5nUniZMKcCE+DMD+KGzpGNZhy+IcObXOXy3MPLd8e1c
        616kHkTM3KTIG3bBbi7rdw==
X-Google-Smtp-Source: APXvYqz/sLrbRW9iMhll2c9BISO6QwOZWioWX9WaKgBH2VVlBP61QPYa8IBQnSEMMKkjvnDGqcxnsA==
X-Received: by 2002:a25:ab87:: with SMTP id v7mr13072126ybi.329.1574468178231;
        Fri, 22 Nov 2019 16:16:18 -0800 (PST)
Received: from localhost ([172.58.139.180])
        by smtp.gmail.com with ESMTPSA id n128sm2333957ywc.99.2019.11.22.16.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2019 16:16:17 -0800 (PST)
Date:   Fri, 22 Nov 2019 18:15:58 -0600
From:   Rob Herring <robh@kernel.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     broonie@kernel.org, lee.jones@linaro.org, linus.walleij@linaro.org,
        vinod.koul@linaro.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        spapothi@codeaurora.org, bgoswami@codeaurora.org,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v4 09/12] dt-bindings: gpio: wcd934x: Add bindings for
 gpio
Message-ID: <20191123001356.GA5528@bogus>
References: <20191121170509.10579-1-srinivas.kandagatla@linaro.org>
 <20191121170509.10579-10-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191121170509.10579-10-srinivas.kandagatla@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 21, 2019 at 05:05:06PM +0000, Srinivas Kandagatla wrote:
> Qualcomm Technologies Inc WCD9340/WCD9341 Audio Codec has integrated
> gpio controller to control 5 gpios on the chip. This patch adds
> required device tree bindings for it.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  .../bindings/gpio/qcom,wcd934x-gpio.yaml      | 47 +++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/qcom,wcd934x-gpio.yaml

Reviewed-by: Rob Herring <robh@kernel.org>

However, this should be referenced from the main file:

gpio@42:
  type: object
  allOf:
    - $ref: ../gpio/qcom,wcd934x-gpio.yaml#

And better to move the example there to be complete.

Rob
