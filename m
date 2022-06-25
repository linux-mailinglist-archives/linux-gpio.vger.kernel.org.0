Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3998C55AD5C
	for <lists+linux-gpio@lfdr.de>; Sun, 26 Jun 2022 01:09:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233717AbiFYXJH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 25 Jun 2022 19:09:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233322AbiFYXJG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 25 Jun 2022 19:09:06 -0400
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A9D214088
        for <linux-gpio@vger.kernel.org>; Sat, 25 Jun 2022 16:09:05 -0700 (PDT)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-3178ea840easo54552337b3.13
        for <linux-gpio@vger.kernel.org>; Sat, 25 Jun 2022 16:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=O1MXmkDUiw43Z0PqWiIuKVcX086I1aXIxpAimItsCgY=;
        b=qWk6cykw70SFCMI1O1BJLkjsV2zHzeUjcAQBEcUV4R2KGQbs+yjeFhy2GdZHWI6iOp
         dDseFJGmwis0XO7PUzbwGTBccukj2fwzTM3BMgUOhSi4c/8m6bIjLIbXJ0HjOMPerdsq
         FLOuMMpa3siHqfcF02E6ty3uPtSgtDg+uAjXD+SIEQORJPjX1kpcxFHH9Z4hzlZgzYOG
         9h+XfDLl5YDcNMx5PsbrWufrd2wDsStKZfoRDceYzTvObDIrtV6I+dxq0BoAQVvkD0cY
         +XdZQ0CnUoDKMNQVUgdNMsaalHsJc/F+x/pWHOzP4CqpBWtO7o07rK1woQj+O/mEVwnO
         q68w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=O1MXmkDUiw43Z0PqWiIuKVcX086I1aXIxpAimItsCgY=;
        b=bkD64wm9HgpHCKvcuJykKU38uZh6cXe4SvoHs+EL20kMBmFA5x9qkQWMgAxGKXveUE
         V1xroxiy0HepY+bXx2gTJcLnh1GX156HYPvyKkNffa9Kg0PRll+zlsWRawiPUIKFYEXq
         Hy4mYdyhCFiVIHcjVgImZdTkNfDjTrACf4sOXpWWW80SI0o3zGkmJjdNSUkvmBgJBQ1+
         uOSa/fhtJME9GHuOiYQJdxAPEWdpPax4RrWxn4MPrlyKia1uCBAgm+0qPBfqUlvoyTQ2
         8dJS8oD8jLeYpNKqOhDa6DYrfQih864X2qZl9SyqlQj0VfddcycY4K7tDjz8+tdPLHjk
         HO5g==
X-Gm-Message-State: AJIora8Bv9vaTDPHLdfRP2TgGGwE8SJcgQzxedfnOMIdr9ePIgLiCtyY
        dFTc4tTMkc6vkfVU5KaPMan2lrDQVtwnn9W4BrT242fx60E=
X-Google-Smtp-Source: AGRyM1vNlNLKL1bICHSuct3T11AvYCz+HnuVKjSdzzMyBs6oIijdhnwpbjJqdXi5QptR/DL/iDDg26IyU761Rnutypk=
X-Received: by 2002:a0d:cc54:0:b0:317:752c:bcf3 with SMTP id
 o81-20020a0dcc54000000b00317752cbcf3mr6763435ywd.437.1656198544324; Sat, 25
 Jun 2022 16:09:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220615104921.1390138-1-patrick.rudolph@9elements.com> <20220615104921.1390138-3-patrick.rudolph@9elements.com>
In-Reply-To: <20220615104921.1390138-3-patrick.rudolph@9elements.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 26 Jun 2022 01:08:53 +0200
Message-ID: <CACRpkdakd1T9FFfjbSpLnCmOQM-HVLy+UTJBKkpphyDVmZt6yg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] pinctrl: Add Cypress cy8c95x0 support
To:     Patrick Rudolph <patrick.rudolph@9elements.com>
Cc:     Naresh Solanki <naresh.solanki@9elements.com>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 15, 2022 at 12:50 PM Patrick Rudolph
<patrick.rudolph@9elements.com> wrote:

> Add support for cypress I2C GPIO expanders cy8c9520, cy8c9540 and
> cy8c9560. The GPIO expanders feature a PWM mode, thus add it as
> pinctrl driver.
>
> The chip features multiple drive modes for each pin when configured
> as output and multiple bias settings when configured as input.
>
> Tested all three components and verified that all functionality
> is fully working.
>
> Datasheet: https://www.cypress.com/file/37971/download
> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
> Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>

Looks good to me, I see there are still some comments on the bindings,
once that is fixed this is good to go.

Yours,
Linus Walleij
