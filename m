Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32B9A831C1
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Aug 2019 14:49:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731092AbfHFMtI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Aug 2019 08:49:08 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:38493 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729898AbfHFMtI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Aug 2019 08:49:08 -0400
Received: by mail-lf1-f65.google.com with SMTP id h28so60958446lfj.5
        for <linux-gpio@vger.kernel.org>; Tue, 06 Aug 2019 05:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dE5JuDdEA/pQScNByPn3VC+2psga/+uhIp5+6Lpb/IU=;
        b=CfdkpelcPzvwnG1MdqcjcMyI02MUVnNU6luZnIfMDPb2TDvDh/PMhfidkJDiDm5vjw
         TSvW1XIVaisosJn9owSOQNrRfN01cs41uzJMTlM1VsZX0cW6SBzNzVZKo2WGsc7xHA/y
         52dUv8uwgMs+ujW6Xv1T48Zb1XvjfjCWbXCG46cuulJ68eqIsTcpjWkGSqGqJIk/zhKt
         FmDBpMi8Fdr7o1vGrpM/XkRced54b6WwHbfhJBaJgtO7Nxsv4XjRHbsliAGTfPn5nSRH
         4P0r6a4S4hwn0ipXQEhPdnBvxTjgs3aWXnX3Ob+3gbZvc/hC66HkM8kC7oWs5VCWX1de
         wM1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dE5JuDdEA/pQScNByPn3VC+2psga/+uhIp5+6Lpb/IU=;
        b=RobKwa81N01PTMQc5/JDMK2PKbbwAh8e8sBH2Hds1AjkRzNo+E/Bfg+Nkhfbb73ull
         ZeyjMirryS2l2475i0u029XurYk2lqlauJuDLb5aMMXO/Aj3gAs66GjqnPXOrPuFZ1Jz
         bOp1BQcwy9eeE4UN23OAKXfR7C0LLqr3x8efOYBCKD2lpPEJuGHTQhw0NVY9Mgcyhpva
         do4OPbPQXGlYAYh6yW9+TbL/ctecy9n7iMgNM2UERm0bTtx0VGGbB1RY6S3ugp1Mz53K
         rzNALWUz4qJn9EbIEe3WRId7v20fLhW2ertXh83fLIHBzPahkOHjOujkZdHmssB7dDTl
         4cEw==
X-Gm-Message-State: APjAAAXGoc3TxTzA7qxl9fRbpUzZ3FBZ7hrp7qxrhypN5eWJvgpIqDLf
        FGnSDBTYhbXUzGPvpbpNpt2be4SO++zNo3Q9DCmdrg==
X-Google-Smtp-Source: APXvYqw0Wl1Q08gOWskV45KZ1hlu4YydCL1Uqb2v8Dojvc+PSoMPhvxKIqVPTrhNLCBWwALS8FyzMEW+/49Nw/ggfeM=
X-Received: by 2002:ac2:5dd6:: with SMTP id x22mr2349039lfq.92.1565095745984;
 Tue, 06 Aug 2019 05:49:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190806024923.34355-1-hui.song_1@nxp.com>
In-Reply-To: <20190806024923.34355-1-hui.song_1@nxp.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 6 Aug 2019 14:48:54 +0200
Message-ID: <CACRpkdZ7hW+hSC41JqjqfLrwWvRY80+_8sXC89OhN7SwVtU7MA@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: mpc8xxx: Add new platforms GPIO DT node description
To:     Hui Song <hui.song_1@nxp.com>
Cc:     Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Hui,

On Tue, Aug 6, 2019 at 4:59 AM Hui Song <hui.song_1@nxp.com> wrote:

> From: Song Hui <hui.song_1@nxp.com>
>
> Update the NXP GPIO node dt-binding file for QorIQ and
> Layerscape platforms, and add one more example with
> ls1028a GPIO node.
>
> Signed-off-by: Song Hui <hui.song_1@nxp.com>
(...)
> +Example of gpio-controller node for a ls1028a SoC:
> +
> +gpio1: gpio@2300000 {
> +       compatible = "fsl,ls1028a-gpio","fsl,qoriq-gpio";

What you need to do is to add "fsl,ls1028a-gpio" to the list
of compatible values at the top of the file "Required properties".
Please send a v2 with this fixed.

Yours,
Linus Walleij
