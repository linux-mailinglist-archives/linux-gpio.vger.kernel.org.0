Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDE3521DA1A
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2020 17:32:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730049AbgGMPcy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Jul 2020 11:32:54 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:45578 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729846AbgGMPcy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Jul 2020 11:32:54 -0400
Received: by mail-il1-f194.google.com with SMTP id o3so11494916ilo.12;
        Mon, 13 Jul 2020 08:32:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=D1tx9I3fZDjlF0pxo8uh6cSHEqys5YBQnDDIQmH6Gw8=;
        b=aWQXgk+a+3hMUX6tClqQXyCZEoibqPW9ETtNkBR1CjbCNI4dgwf0H7WmC86JM35los
         3nbOVcW3Gm3TEeeUSesOh/V/H97EKccv/DJuwm1P1YbXPhM9QLSiQ4ljxVjqmd5E49AC
         Fya3r9PA7c3wjVSfl8+URViqaGQBxd8Gs065rg6mxq0fA7KbK7npCx5xLbqjgDs8QWzS
         qopDDwPqhf4y+6e+iUDP0LXel9sH5RYR+kPUxmUy4zgHxIxcjnDznhLv7jrc4KmRpAQx
         WA2sp4oXAkq2chmIqMCY/3xJ2FvW24ZVpx32QtjU4ohJAkWo17A6UzlA4szx8tdJtiOI
         xzDQ==
X-Gm-Message-State: AOAM5313youHmHf9UlkC7ImkNuk24/2MYJC5Gn5JKqiAPrX7zyhj0bdd
        NYqyLJEAR17wwExaZs8eemZGe0xvDg==
X-Google-Smtp-Source: ABdhPJxKTHA7bNx4G/OWSSgNsTP8b05VDOnDOIJQcqflQPpRVeP2ky7Ls2heOxKe88WifuGN+VIkRQ==
X-Received: by 2002:a92:40d1:: with SMTP id d78mr266816ill.14.1594654373965;
        Mon, 13 Jul 2020 08:32:53 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id w10sm8450823ilo.10.2020.07.13.08.32.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 08:32:53 -0700 (PDT)
Received: (nullmailer pid 238882 invoked by uid 1000);
        Mon, 13 Jul 2020 15:32:52 -0000
Date:   Mon, 13 Jul 2020 09:32:52 -0600
From:   Rob Herring <robh@kernel.org>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Linus Walleij <linus.walleij@linaro.org>, od@zcrc.me,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v2] dt-bindings: pinctrl: Convert
 ingenic,pinctrl.txt to YAML
Message-ID: <20200713153252.GA234029@bogus>
References: <20200622113740.46450-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200622113740.46450-1-paul@crapouillou.net>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 22, 2020 at 01:37:40PM +0200, Paul Cercueil wrote:
> Convert the ingenic,pinctrl.txt doc file to ingenic,pinctrl.yaml.
> 
> In the process, some compatible strings now require a fallback, as the
> corresponding SoCs are pin-compatible with their fallback variant.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
> 
> Notes:
>     v2: - Use 'pinctrl' instead of 'pin-controller' as the node name
>         - remove 'additionalProperties: false' since we will have pin conf nodes

What do those look like? They need to be described, but that can be a 
follow-up. 

Rob
