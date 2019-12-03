Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2F3610F76B
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Dec 2019 06:39:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726955AbfLCFjC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Dec 2019 00:39:02 -0500
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:21416 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725907AbfLCFjB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Dec 2019 00:39:01 -0500
IronPort-SDR: 6mbYc1zHsRIcVTA+RPogE1J9l48OEKLVgud4X5TTOBQZu9nriiIs78Py38/1VSXgHOEndNhKqc
 oGR4q/xWmIqKf/ptaVZGE0vj2AFOf+nhPO7heK6VQdI3Uxt9+WI4USGNx8+E5t1Dt0mCkvbmn5
 ALjoGbC1qWF1a714v5yO9mhWRalUWATrbim5TwiO1WL5Lu5guGyjTdDYsJqmaoIdRVioyW6gFR
 3vdtXIf9k8NsyVjr3fpvNKZHyINpsYRtnA24BKd3u8vUMxmKxiuFehQgcE2xknenXvTtRAXBx1
 PkY=
X-IronPort-AV: E=Sophos;i="5.69,272,1571731200"; 
   d="scan'208";a="43706940"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa3.mentor.iphmx.com with ESMTP; 02 Dec 2019 21:39:00 -0800
IronPort-SDR: CS+/PFfMeBEEboWNM9uO8MfkB5+1Jw2If93U9GqifcEak1hYwSyMqw80qtlCDQyGVTVWHHxfc0
 dY4fx5qx2hZcVWxqPasbVxOpZ5KBOx9wobtkmaFZHTfSfZIaS44+kQa5mxpJK+f6B0Y9I7hoVb
 aDUNpiduLHuKhhgObPo0fTv8wecaxveAm95henyvT9wLZMHJEBeHvhTt8XZg022fv0uUPzg31S
 WCX584OWrpCdgRRgexlrBpxMsnWLw19LLxA9T7wb421CTBowqE1cySEw4pDt5Gfq78kmgRknUE
 XnQ=
Subject: Re: [PATCH v3 7/7] MAINTAINERS: Add GPIO Aggregator/Repeater section
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>
CC:     Alexander Graf <graf@amazon.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Phil Reid <preid@electromag.com.au>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Christoffer Dall <christoffer.dall@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        <linux-gpio@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <qemu-devel@nongnu.org>
References: <20191127084253.16356-1-geert+renesas@glider.be>
 <20191127084253.16356-8-geert+renesas@glider.be>
From:   Harish Jenny K N <harish_kandiga@mentor.com>
Message-ID: <58717a28-8599-5f2b-a4fa-de1cce93e975@mentor.com>
Date:   Tue, 3 Dec 2019 11:08:34 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191127084253.16356-8-geert+renesas@glider.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1) To
 svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 27/11/19 2:12 PM, Geert Uytterhoeven wrote:
> Add a maintainership section for the GPIO Aggregator/Repeater, covering
> documentation, Device Tree bindings, and driver source code.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Harish: Do you want to be listed as maintainer, too?


Yes. please.

>
> v3:
>   - New.
> ---
>  MAINTAINERS | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e5949b6827b72f2b..0f12ebdaa8faa76b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7043,6 +7043,14 @@ S:	Maintained
>  F:	Documentation/firmware-guide/acpi/gpio-properties.rst
>  F:	drivers/gpio/gpiolib-acpi.c
>  
> +GPIO AGGREGATOR/REPEATER
> +M:	Geert Uytterhoeven <geert+renesas@glider.be>
> +L:	linux-gpio@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/admin-guide/gpio/gpio-aggregator.rst
> +F:	Documentation/devicetree/bindings/gpio/gpio-repeater.yaml
> +F:	drivers/gpio/gpio-aggregator.c
> +
>  GPIO IR Transmitter
>  M:	Sean Young <sean@mess.org>
>  L:	linux-media@vger.kernel.org
