Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D9BF4167E3
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Sep 2021 00:17:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236039AbhIWWTC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Sep 2021 18:19:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234844AbhIWWTB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Sep 2021 18:19:01 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61DA3C061574;
        Thu, 23 Sep 2021 15:17:29 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id u8so31314318lff.9;
        Thu, 23 Sep 2021 15:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bG1fINzHq+PPw2kM9HMNJ0v4CmBvHSBMAzOq03fbU1g=;
        b=B6FbK/7XZVFlxqHhwRKM11wwuM0Qiy6MWMGmBJ1PAZtUfCTBtcl7cMGyPqCt8mxehp
         f4LJUsY59THUziDpD+N0IwrOBNTwPU9FDkTwi2H4ykQQl/XhGb9FuyFA48sl9sGwe4uQ
         3aEFpRYibvfYV6gIHOmd0AaSaQoID6PbhYx2r5fsdGUJHxkh4Cvow8opuXViMgNwvERD
         raksxTTIIy8AP4UNS8kyF13wNoTFZLiI/to2rtYrgrQDSEe1YKROLPjSXfeB4o6pMS4s
         ysx3I7Hq1v69XdSeZnec0dRRwWAZYWVBjDDs44hEXw+ArOB7N+3rhRs+9vOuqYKsq/vj
         DjNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bG1fINzHq+PPw2kM9HMNJ0v4CmBvHSBMAzOq03fbU1g=;
        b=0lY8YlXiL3poRIpSmlMf7QvMbnT17UDTiPP8MoMK8g0bKoqiPUJ06igcklgAGlqP1U
         6CnAlEkMiB9h0vtdhWDUu1Kx/518L7x+KGeFh+XwRtqiSxodvFS3qMgIXXlzKjmEoAXJ
         quCC2bUDHHhf2M7Py7Wstwq7L9OY8SxJARvhauwG6ct1ZEhFsJHeyfwRR39aYbiW5Q02
         ROsE1iRC1/BO235cIWgjDGUhMgVypHBnMiov8ATRy7c4czxjBj+TpkURTj0Y+6atBB3i
         pDa2I7vLHprYI8nu4cEVbSfGOZ2TpfrLj4gtUZoqXVg/wwTKRn3l5r0aNvRrqHV8ev7R
         aMDA==
X-Gm-Message-State: AOAM530Qi+8hRo2LPxETKkG07ce36BBDNuv/DhYcX8qAu6G/12m54E5M
        PVYdEXsA6k92EepHmS5gOf63MdbEEsaY7QUb6TU=
X-Google-Smtp-Source: ABdhPJw8asmz2c747TmyiiBAF7CiOEyp0VvbT9EUw5iPUTWV12Kiy85GXf0nxeeae9yAiR4ubDkfkaT5W99ckOOIUNg=
X-Received: by 2002:a2e:9d4:: with SMTP id 203mr7560263ljj.228.1632435447793;
 Thu, 23 Sep 2021 15:17:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210825082251.2484-1-caihuoqing@baidu.com> <CAOMZO5DKGv1GQBpwr0ff0YC1yDmCH2A5Xpq7jzUA2h75bmN6eQ@mail.gmail.com>
 <20210918022636.GA18195@LAPTOP-UKSR4ENP.internal.baidu.com>
In-Reply-To: <20210918022636.GA18195@LAPTOP-UKSR4ENP.internal.baidu.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Thu, 23 Sep 2021 19:17:16 -0300
Message-ID: <CAOMZO5Aauz0Kb18xYrBc-4dX-ZAeOOGxraFbbYOz0Lz1LFZJ6A@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: freescale: Add helper dependency on COMPILE_TEST
To:     Cai Huoqing <caihuoqing@baidu.com>
Cc:     Dong Aisheng <aisheng.dong@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Linus Walleij <linus.walleij@linaro.org>,
        GPIO SUBSYSTEM <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Cai,

On Fri, Sep 17, 2021 at 11:26 PM Cai Huoqing <caihuoqing@baidu.com> wrote:

> > I am not sure why you need the && OF, as we have a "select PINCTRL_IMX",
> > that already depends on OF.
> No, it's just an invalid dependency. PINCTRL_IMX can be selected without OF

I don't understand your statement.

From drivers/pinctrl/freescale/Kconfig:

config PINCTRL_IMX
      tristate
      depends on OF

So PINCTRL_IMX depends on OF, which means that it can only be selected
when CONFIG_OF=y.
