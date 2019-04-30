Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 520A3FC86
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Apr 2019 17:12:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726006AbfD3PMu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Apr 2019 11:12:50 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:35156 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725976AbfD3PMu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Apr 2019 11:12:50 -0400
Received: by mail-oi1-f193.google.com with SMTP id w197so11545449oia.2;
        Tue, 30 Apr 2019 08:12:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=7aahexJfH3+ZCWyzwJ4HVTibyUsm/U8CQ+avun/lb8w=;
        b=M5GbafMPEw1FpUNuPjUwms7Cxan/YhI0LBNBnJ1NgEifzyephSGFy7trreF1QLuWZN
         9phJCGSBD9crQT60BJWkeBZS7Be36B4Qpht0y9svV1UC5W42Cwi2JFbAx5R7+fTaWhc6
         ZUJAvGzg5l3HA/3dODChYMIBwoNJKnT2U9yDXYmeTivpKtHxLK98B9Q7jwvqn+sltgUx
         rZYXQUDQUAB0IrO52LJKGp4vmQKYrPwYHgUq7tv2g/5LHZzTBJ5HIjUG0pxyY+ULMkp+
         +PlJ+eUK5NJGibNv0vYV9DkaLrR/mOHxWuoGJZ/0tsm392BWIEIU1stUlXu4ahSz0eHq
         xbXg==
X-Gm-Message-State: APjAAAXGD74hm5RcB9NSOHchEisoAEiBDMOg2gzHg5RjR3IcBeYpu+fv
        ia4I9xI92hsFSxJlr3r+tHCCh9I=
X-Google-Smtp-Source: APXvYqw+7CtQGpDl9egPhX/Ibog5Hs4VhoUaMkukQMspgHXvHnYdx7igDWd16RY8bjIjwyxtwGAzZQ==
X-Received: by 2002:aca:55c1:: with SMTP id j184mr3206627oib.119.1556637164785;
        Tue, 30 Apr 2019 08:12:44 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id o1sm16620919otj.11.2019.04.30.08.12.43
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Apr 2019 08:12:43 -0700 (PDT)
Date:   Tue, 30 Apr 2019 10:12:43 -0500
From:   Rob Herring <robh@kernel.org>
To:     Guillaume La Roque <glaroque@baylibre.com>
Cc:     linus.walleij@linaro.org, mark.rutland@arm.com,
        khilman@baylibre.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: pinctrl: add a 'drive-strength-uA'
 property
Message-ID: <20190430151243.GA6879@bogus>
References: <20190418124758.24022-1-glaroque@baylibre.com>
 <20190418124758.24022-2-glaroque@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190418124758.24022-2-glaroque@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 18, 2019 at 02:47:55PM +0200, Guillaume La Roque wrote:
> This property allow drive-strength parameter in uA instead of mA.
> 
> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
> index cef2b5855d60..fc7018459aa2 100644
> --- a/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
> @@ -258,6 +258,7 @@ drive-push-pull		- drive actively high and low
>  drive-open-drain	- drive with open drain
>  drive-open-source	- drive with open source
>  drive-strength		- sink or source at most X mA
> +drive-strength-uA	- sink or source at most X uA
>  input-enable		- enable input on pin (no effect on output, such as
>  			  enabling an input buffer)
>  input-disable		- disable input on pin (no effect on output, such as
> @@ -326,6 +327,8 @@ arguments are described below.
>  
>  - drive-strength takes as argument the target strength in mA.
>  
> +- drive-strength-uA takes as argument the target strength in uA.
> +

We have standard unit suffixes defined in bindings/property-units.txt. 
Use them please.

Rob
