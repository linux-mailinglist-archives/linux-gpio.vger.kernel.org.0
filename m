Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B82A4DE394
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Mar 2022 22:32:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236545AbiCRVd3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Mar 2022 17:33:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231609AbiCRVd2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Mar 2022 17:33:28 -0400
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1681524F2BA
        for <linux-gpio@vger.kernel.org>; Fri, 18 Mar 2022 14:32:09 -0700 (PDT)
Received: by mail-yb1-xb31.google.com with SMTP id j2so18145830ybu.0
        for <linux-gpio@vger.kernel.org>; Fri, 18 Mar 2022 14:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hX7mSCLACQQ83yXLKQpM8kANhYRmQgnJug/EU8n3tjY=;
        b=OcDxPQcDEMSYLNNtIlj4P2n9CzVwQ7zaJtV5MCV4CQ4iztJb2R+bcT+QfCK0F/Vt+e
         U8reMSuv1Eme1a4sI7qcqec+UcGZxC+Z9xJe1uwMuE1+y1m01cLtjimJ7BpDEB99jhz/
         okX+feBWBpYqRS7ECMdxEqlNvI3dCFrRiThWT6qv0/mJ5vIua/4Q1XS7adGroC9mU2Uh
         8RBEkue7uoO8/wcaKjpjaGm304xDqOJD6tDJPuU7W0epwV44jzKJNRUriE/PCXsjeKUy
         fTEBr6HlQ2lg0uhoNQM4bOWkMD56Y113lbWIVneUOxWIIGTOpN6t+eQxhZo2UoEv3HOC
         0HiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hX7mSCLACQQ83yXLKQpM8kANhYRmQgnJug/EU8n3tjY=;
        b=4LaFfyUpIG6+HhQGmgdHDbQmp2QX9f9YhcEDrmol7bNpZ67By9z5xUG8vPaoVtuxkw
         qpmEk61bOG8hn0NDexuQ/ugG/AXPW87x24xkkxMcrDjrUCaTGY3WYFrGRkcXRlEkqmGl
         EO3qJytR1T5Thi8IaGIZglHOzvpQA49UYWz1TN0+gImZYvzgertSozRu6Is24BsK9ma4
         nfytGJbff4icJLuj1o5X1TgXY9e1QHSuBKMMZW92VcM7zwJmo7SsEjVS9CJLWk2Ilzsd
         HOE9RlkUhob0ia+l0nwBWC8Snkvj3Ga4MbroCZ8d9jyNdFiy32416Cfrx6lze5agwkgv
         75uw==
X-Gm-Message-State: AOAM531btN75AwC5vIR03OfPDTMwL2WNqahJyIZACV4I5lWN7UBUWKgF
        wbmvS4Y+wFRIYM2QovCy/8LMlfXGmt53tsrNSevhaVokj5Y=
X-Google-Smtp-Source: ABdhPJz4CLE/RV8y0AobMf6pKoO0a+Id8c9VwB85wCQWINQ2r8Va5a18MT2Fq+Wc9ljgipqCBzMF2+xql6wrUFgKzjg=
X-Received: by 2002:a5b:dc5:0:b0:624:f16d:7069 with SMTP id
 t5-20020a5b0dc5000000b00624f16d7069mr11758231ybr.295.1647639128330; Fri, 18
 Mar 2022 14:32:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220318121233.7215-1-joey.gouly@arm.com>
In-Reply-To: <20220318121233.7215-1-joey.gouly@arm.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 18 Mar 2022 22:31:57 +0100
Message-ID: <CACRpkdZUbbXEp+w8QM-w7h677LWO-Q3zRNQdQRWhMHfubcCqGw@mail.gmail.com>
Subject: Re: [PATCH -next v1] gpio: Properly document parent data union
To:     Joey Gouly <joey.gouly@arm.com>
Cc:     linux-gpio@vger.kernel.org, nd@arm.com, brgl@bgdev.pl,
        maz@kernel.org, sfr@canb.auug.org.au
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

On Fri, Mar 18, 2022 at 1:12 PM Joey Gouly <joey.gouly@arm.com> wrote:

> Suppress a warning in the html docs by documenting these fields separately.
>
> Signed-off-by: Joey Gouly <joey.gouly@arm.com>
> Link: https://lore.kernel.org/lkml/20211027220118.71a229ab@canb.auug.org.au/
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bartosz Golaszewski <brgl@bgdev.pl>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Stephen Rothwell <sfr@canb.auug.org.au>

Looks good to me!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
