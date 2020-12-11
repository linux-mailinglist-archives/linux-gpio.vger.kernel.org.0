Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 557672D825E
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Dec 2020 23:52:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436815AbgLKWvf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Dec 2020 17:51:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436803AbgLKWvN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Dec 2020 17:51:13 -0500
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E04B5C06179C
        for <linux-gpio@vger.kernel.org>; Fri, 11 Dec 2020 14:50:19 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id m25so15466970lfc.11
        for <linux-gpio@vger.kernel.org>; Fri, 11 Dec 2020 14:50:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QCEgRFr6myAJoXKIh61RLSnwzrl9pjCHJsN5xjectg8=;
        b=WGvdrxN0FmGW2nAkcfb9o44BNCy2Rd8T91o2JiIgrUgWgsOecyDoq9K0efN/yMvpz8
         cKrzfCzhtNNNfmE1u664MpJyNnkGVnp/M5kQ7UWbqBZfinY+LIwnj7M+ZZGORAzu1ts3
         xKgMznYxDBqmFHDwBTQxZeSyZCB1UnC8RVNQNWk3dhforiQGyMlcVxg7qG/IScV+91rX
         399Uz8tDSWPJpS+MW5DhWuVTo0agGwtA/3JpbIGRlOo99HXUqCRtKxFzGv+7f75pQP+g
         ytQdnV7MOmPTAOO48xaYYgnVE1oSQsVZj0basuYJEWN72r2xkeZs/PV9dfZu7wbcFlW+
         uz0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QCEgRFr6myAJoXKIh61RLSnwzrl9pjCHJsN5xjectg8=;
        b=h3NuclnteNP5E8ebkGppa50BhqyDFmxrBC7ZNiskN0KmUdSyfmV2lxNuCmdnn85v+d
         4acDOOmQbrvUAdXojSLdLVNSbyyWbVMrSqiUDHlLdx8MelZaARyt1X6UPX3v55P3Ic2m
         GeIYSGBMojvU48wDiPcfqW/lqyZWAsF0VCZlN7QEnMk6RfteNFW6/RXa2iUjwg9o4fUG
         uAInR6ZXYj7JNfRToA8zXYFWGqPn/Er/mKxyIX3dKAyt195neOlmj6X0OxSojCo7rpQq
         0rtOckxoqiTfOwiGVd4AFQ/KU++A4f8x+uHa9w5JrY24Y7cT2gVIGE+OhZoWSd3CUKIr
         l9eg==
X-Gm-Message-State: AOAM530bgi8E11C38SF6NXMUPQmRcAUa6vLnJdC81wOA3g1cdyg0QckX
        /iuQ3j6REpU6Or0j7qVPnUJgLQKbcyc8EOUuClcEvA==
X-Google-Smtp-Source: ABdhPJyAHe0SLD0TGbDOC6+kq8t57i89K15Pf3SIBn9Ji8wdZCujZS3OXbeJ8D8n2RDoJlVz0LA8ztm6P7MUVtFBnrI=
X-Received: by 2002:a05:6512:74e:: with SMTP id c14mr5510833lfs.529.1607727018445;
 Fri, 11 Dec 2020 14:50:18 -0800 (PST)
MIME-Version: 1.0
References: <20201209142753.683208-1-lars.povlsen@microchip.com> <20201209142753.683208-3-lars.povlsen@microchip.com>
In-Reply-To: <20201209142753.683208-3-lars.povlsen@microchip.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 11 Dec 2020 23:50:07 +0100
Message-ID: <CACRpkdaunj_4FonRMdkQN9YYW46GY+9mdG8zvBauW48+hn0-ww@mail.gmail.com>
Subject: Re: [PATCH -next 2/3] dt-bindings: pinctrl: pinctrl-microchip-sgpio:
 Add irq support
To:     Lars Povlsen <lars.povlsen@microchip.com>
Cc:     Rob Herring <robh@kernel.org>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 9, 2020 at 3:28 PM Lars Povlsen <lars.povlsen@microchip.com> wrote:

> This describe the new bindings for the added IRQ support in the
> pinctrl-microchip-sgpio driver.
>
> Signed-off-by: Lars Povlsen <lars.povlsen@microchip.com>

Patch applied.

Yours,
Linus Walleij
