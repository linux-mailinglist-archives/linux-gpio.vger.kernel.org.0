Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0157D6AE022
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Mar 2023 14:16:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230461AbjCGNQ2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Mar 2023 08:16:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230389AbjCGNQK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Mar 2023 08:16:10 -0500
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C028D158A8
        for <linux-gpio@vger.kernel.org>; Tue,  7 Mar 2023 05:14:39 -0800 (PST)
Received: by mail-yb1-xb29.google.com with SMTP id v101so11331445ybi.2
        for <linux-gpio@vger.kernel.org>; Tue, 07 Mar 2023 05:14:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678194871;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3TZEErplZhG9mXFebMiilSX8989PvB3SCifcTfC0yrQ=;
        b=sJdnuWqTsUMrxN+40otQ3KKmJ6+lNnGM7kTZL/6nIc3T0ncP8Mj0MxcSITCadu+Ptn
         F76OgTs+PuiGOjyb3W5IXlLmbNOt41tPcpFQO5qBVi8KjMqfANeRNuIJu8buG7fWmmPW
         2SRsPmD7j4+S03LI2k/MJXFpHuEJ0z7BfcbdCTIK1ZbqLBPXxU3nGuuQT2UEnqubG88A
         sg1J8OmpIAfSWzb8yrFHEoJMo8kUB5CwJ5A4OgrFV/5TJrZ7FC6CE+o8dNaddGZNUnDM
         B1tr1jpyTGLtzSYPbQQ2ZzJniTpsIyNss69wN/1eft9WFwD8AgnbDG46H37Xr7wA863f
         Y2SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678194871;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3TZEErplZhG9mXFebMiilSX8989PvB3SCifcTfC0yrQ=;
        b=EMaIbGUugD+6W04zPsGS2RAi5lmjXUjO9I/9k4qPgtLzozkpWSNU50stOz3WZoLgwV
         7S3Vd9gRmnudRnZcdW0XLqCXG+r67wdRXOt5S+lwqSn5+5wDNE/yuILwaHEGpmOQlduG
         340hqUn83WmXO51eKLxEdZlP+abcaEu7rLWMMlYxou1+5P7OUpw3713z59/GVLGTJzDv
         RqHwIBRjbvZFj1Mqu1/bBVMzGza5YbQgxRkB1PdqnTjLnyCRqBJSFqU8sG8fFnK4h+Sw
         GQHTTrmvRmmPAEsqtAVSNfFqhJgAEvUpuSIHBMCiWdKOc4b2Bcd2fJjDGvn0HUBA+gok
         WEDg==
X-Gm-Message-State: AO0yUKXGaZjTLD34riXaT2N9Zt9oDuddOdexvTcxlmB8ZdpJ56//9765
        5XG34gGXEhD4UN5f28xwxI5cqnmbJgVl18cIyu6XEA==
X-Google-Smtp-Source: AK7set9taom1EyeB5r1S4ut3DJIs/zUFEhhueQeMKifZ1rFc9YOs6IB40cy4EFihMMDFMy6DkaOW1BtURPmLoUxrYwc=
X-Received: by 2002:a5b:647:0:b0:932:8dcd:3a13 with SMTP id
 o7-20020a5b0647000000b009328dcd3a13mr8676973ybq.5.1678194871585; Tue, 07 Mar
 2023 05:14:31 -0800 (PST)
MIME-Version: 1.0
References: <20230302110116.342486-1-claudiu.beznea@microchip.com>
In-Reply-To: <20230302110116.342486-1-claudiu.beznea@microchip.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 Mar 2023 14:14:20 +0100
Message-ID: <CACRpkda+D-U37LXBd_326gfJhUs+5meOcRH55PsCOEfmFVhBhg@mail.gmail.com>
Subject: Re: [PATCH 0/4] pinctrl: at91-pio4: few cleanups
To:     Claudiu Beznea <claudiu.beznea@microchip.com>
Cc:     ludovic.desroches@microchip.com, nicolas.ferre@microchip.com,
        alexandre.belloni@bootlin.com,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 2, 2023 at 12:01 PM Claudiu Beznea
<claudiu.beznea@microchip.com> wrote:

> Series contains few cleanups for pinctr-at91-pio4 driver.

Patches applied, thank you Caludiu!
I had to manually rebase patch 4 so check the result.

Yours,
Linus Walleij
