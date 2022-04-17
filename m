Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4A195049E4
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Apr 2022 01:00:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235246AbiDQXDH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 17 Apr 2022 19:03:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230257AbiDQXDG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 17 Apr 2022 19:03:06 -0400
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53961246
        for <linux-gpio@vger.kernel.org>; Sun, 17 Apr 2022 16:00:29 -0700 (PDT)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-2f19fdba41fso493707b3.3
        for <linux-gpio@vger.kernel.org>; Sun, 17 Apr 2022 16:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wz/RMoY3ARZU1t0xI3YNVsz+0DQ/sXlvIpT9q17SrrE=;
        b=vrNUGkV9adpz/M4keDQBJ0lr/X7Z+DmtseSPvEnrOxTeUFx+beMPgFwdz4VKeQTK1E
         3X3cHKCo7g5np1vmSq797doiWfeJkGNn4IwEeegLTps4fZpODDCjRWO1zOm0ifFJgjPL
         VyYZLvjh73D1xGI2HZM6K3ykXzJnTTtZRg9jvMmqFGxH41bR3LKj1oUqnLpGrNBBUPLu
         vd6fjFGTfUPlWdqhUIZ2SlkQSOGLDB2nZwqKxCVLQDcO/3Epu1lF8xPAWuZcS9/DShY4
         xBlYZQzulbhB3ElvZvIylvz4m4aA0rl4Os+ZyIHxpzgJm0OtQ5tbp9nMclFfmmDekm6a
         9Tfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wz/RMoY3ARZU1t0xI3YNVsz+0DQ/sXlvIpT9q17SrrE=;
        b=q7urPSs9I58zKFFk7Vt7JWPlCWRlr0P2uqT084kPbiKX/Y5nypAWRFXuOvjXlKlQY7
         MTylxpYti+MSn1IxcrgYz+WgYSULzjGrFZPZXkOEqexEnPuBpTdnNRHk449exYsksDpI
         H5UVOUy0CEWKbGnc57OInBOK5efsVMJgJsKxn/PH500celF5Jug1BgVTOZBKPD5g+htF
         CbvHDwMGuCK9LYdUqKu3LDHtob+q/C/Gfr5JUO/2W/sNGXHS1S85f7GsN1Ai8/3wesSl
         52mQP1WDoHgOZV/HQqmE0bGBDsLAusb95NvAMERDT2hcCaSCHdwAXO3F5xPhNYMmuF88
         cBiA==
X-Gm-Message-State: AOAM530IzhZDfZOMDbANepiU7rFKlW+Lkniupxp3cCmqx+SUwazjJzHk
        B9dLk1TaaRmptYiv5KppSIlWDiEx7iReIC/prXWCYYI+3ic=
X-Google-Smtp-Source: ABdhPJzq5pe6nDmsrr9nfJ69WHuWmFoVIHwaeJu7A+eNpt+56NjD6TvtgZkG+6L5uSXOfftPqY9pL1hNvpN8dEtUWfE=
X-Received: by 2002:a81:1d48:0:b0:2f1:8ebf:25f3 with SMTP id
 d69-20020a811d48000000b002f18ebf25f3mr2249158ywd.118.1650236428524; Sun, 17
 Apr 2022 16:00:28 -0700 (PDT)
MIME-Version: 1.0
References: <YlQ2vsWcV8MIUZ3X@black.fi.intel.com>
In-Reply-To: <YlQ2vsWcV8MIUZ3X@black.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 18 Apr 2022 01:00:17 +0200
Message-ID: <CACRpkdY8u7OAEyyVbR8bg1sjdUkb5FHYff=JD=jEpf9=CZPoBQ@mail.gmail.com>
Subject: Re: [GIT PULL] intel-pinctrl for 5.18-2
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linux pin control <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Apr 11, 2022 at 4:10 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

 Hi Linux pin control  maintainers,
>
> Single fix for recently submitted driver. No conflicts or regression reports.
> Please, pull

Pulled in, sorry for slowness!

Yours,
Linus Walleij
