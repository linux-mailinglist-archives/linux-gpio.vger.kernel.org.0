Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 289B74307DC
	for <lists+linux-gpio@lfdr.de>; Sun, 17 Oct 2021 12:21:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231839AbhJQKXZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 17 Oct 2021 06:23:25 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:55971 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235834AbhJQKXQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 17 Oct 2021 06:23:16 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 967305C00C8;
        Sun, 17 Oct 2021 06:21:01 -0400 (EDT)
Received: from imap47 ([10.202.2.97])
  by compute1.internal (MEProxy); Sun, 17 Oct 2021 06:21:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
         h=mime-version:message-id:in-reply-to:references:date:from:to
        :cc:subject:content-type; s=fm2; bh=1zE7dgRiYPkvVlRK/NiklHXQgAnC
        4eWlry1ezJUOuT0=; b=GDtXyLozkfx5FE/x6li0YCIDA+LZpRG6I6KptPXQDltu
        mGpDZlo6enIV7gzp5yzERmK8ADJqjwStlznLmR1k3JRbFIysWAWdled3y3Be2Nx3
        IGc9o5GHAj/o6vGJafrWfURxYaWOL5x9FA2PpoR2M4PATZ6z9VEgFAMTbDQSTHW8
        anNtVngqGM9TJn7eHzdB9DHbZ8Cuhd9cNUeNZT4WZDGUl8K7Avoh8VIoYngAAhwM
        z3440R95Zrd9sdmfTP6wjNBI6mW5lDd4sR6LrDwAhynAEM+WO4lU6iIN9p2IhoaF
        rFMa34+WXBeKREbrbHJn1LoL3aeCC8WXkyPKB0+/4g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=1zE7dg
        RiYPkvVlRK/NiklHXQgAnC4eWlry1ezJUOuT0=; b=SVfV94g5D30kaNzPNcsnVs
        /Xg+Cl7eO10seqlWFEL3SbkguIFJHS/PGbmqusNtPMFhe54x6WU8MgDmx6EuMI2f
        K3ESN/DLrbt6XZFk9bhHnQOfSR4qPcHFrhERBLtAq+90D8VTjDWgPRRXij/O0cwA
        mJD3CaHMKXvdFgdN47TjpXbryh5TC63n5meA6uc4ACE8oiqr9eN+6Hy0VpgGNHtN
        b+e+w0XDburl/sCSuC9HM8k//u2RburHVQtejmnOVk4k3n1Regj3GpfT45vsIWpQ
        ux+gVAEXdnxbkp2Wg/XpwJyHYfkIwg5mce4w8mvZ+JIrZcikQStC5AchZwuIGYqQ
        ==
X-ME-Sender: <xms:DPlrYSEjwsaME395ynVpiZs0m5-2b7kHq1wxqPUPS-og8NrOs9QhVg>
    <xme:DPlrYTW3mlTRA-UrqYY4hQzSrgXY_-CGkiBpLXFBtYZTIHyLN51kfKVnLg2hqGg_k
    XRzewPp4jFH08GRqCk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddukedgvdejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdfuvhgv
    nhcurfgvthgvrhdfuceoshhvvghnsehsvhgvnhhpvghtvghrrdguvghvqeenucggtffrrg
    htthgvrhhnpefgieegieffuefhtedtjefgteejteefleefgfefgfdvvddtgffhffduhedv
    feekffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hsvhgvnhesshhvvghnphgvthgvrhdruggvvh
X-ME-Proxy: <xmx:DPlrYcL3tdheinJoY9DgbXpzDYrkEP5tgffe51IDl-OEPrE-Wa2j_g>
    <xmx:DPlrYcE1zqmuufavHsZ_iOuyPxkTPIiHaARDXm3DaIruuj0jB7Sxtg>
    <xmx:DPlrYYUNSLlWi6O9LeyW4RKMoBh3EZXy0m-GPWwoOk0SWdislWaaBA>
    <xmx:DflrYbF4JIdFk6yZXz_pIGi7isA4zFdQRrvSvNJ2R-dHE8xUVZr0gg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 82F8F2740061; Sun, 17 Oct 2021 06:21:00 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-1345-g8441cd7852-fm-20211006.001-g8441cd78
Mime-Version: 1.0
Message-Id: <a842e478-8526-4605-b4cf-df9f1e5dc975@www.fastmail.com>
In-Reply-To: <20211016141839.45460-3-joey.gouly@arm.com>
References: <20211016141839.45460-1-joey.gouly@arm.com>
 <20211016141839.45460-3-joey.gouly@arm.com>
Date:   Sun, 17 Oct 2021 12:20:34 +0200
From:   "Sven Peter" <sven@svenpeter.dev>
To:     "Joey Gouly" <joey.gouly@arm.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Cc:     "Linus Walleij" <linus.walleij@linaro.org>,
        "Hector Martin" <marcan@marcan.st>,
        "Marc Zyngier" <maz@kernel.org>,
        "Alyssa Rosenzweig" <alyssa.rosenzweig@collabora.com>,
        devicetree@vger.kernel.org, "Rob Herring" <robh+dt@kernel.org>,
        "Mark Kettenis" <kettenis@openbsd.org>, nd <nd@arm.com>
Subject: Re: [PATCH v3 2/5] dt-bindings: pinctrl: add #interrupt-cells to apple,pinctrl
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Oct 16, 2021, at 16:18, Joey Gouly wrote:
> The GPIO/pinctrl hardware can act as an interrupt-controller, so add
> the #interrupt-cells property to the binding.
>
> Signed-off-by: Joey Gouly <joey.gouly@arm.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git 
> a/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml 
> b/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
> index d50571affd1f..340be4eabf44 100644
> --- a/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
> @@ -43,6 +43,9 @@ properties:
> 
>    interrupt-controller: true
> 
> +  '#interrupt-cells':
> +    const: 2
> +

thanks for adding this! small nit: could you also add it to the example below?

Reviewed-by: Sven Peter <sven@svenpeter.dev>


Thanks,

Sven
