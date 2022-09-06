Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2B8B5AEAFF
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Sep 2022 15:56:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236204AbiIFNsc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Sep 2022 09:48:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238107AbiIFNr3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Sep 2022 09:47:29 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21F3C7A774
        for <linux-gpio@vger.kernel.org>; Tue,  6 Sep 2022 06:39:07 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id cu2so23454958ejb.0
        for <linux-gpio@vger.kernel.org>; Tue, 06 Sep 2022 06:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=8j3iu7+QNQJ23oh0RvmPe+tMoX9hlrqhQYHAMxRoxm4=;
        b=uFWPwn2VJziZW+HA6LrWm6uAZxZ7AAkEK+UCYwcfecyhrX9wQrNd/SDpgXe8m+z3t7
         6UE+A2LZsW+SBWLdVl2r+y1ZFFXIVLFNFRKNgEQ0JLL2NxAp7a30aAGR8OMnqyLAm4qH
         W3eAwkNqm8F0ORnU4nr7hDmsofLT3FJhb/PnrJpUi1uK+6ChvLyvUJXrFADB6z+Q/aNp
         DgpMcpeLzPiNU9nAngfPmEeB/PAtgeMRB1woWEuVEoiLZ9IfKNmGyMfOvBnOrBqkMWQm
         LnwF3ih3RiCFHEe2WFA909cUQrao9AUGlFUucUpF9nYSgXetwgU2g7g6LRAU2CfoGAzC
         tZVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=8j3iu7+QNQJ23oh0RvmPe+tMoX9hlrqhQYHAMxRoxm4=;
        b=VLVbn/Dn+8rS4EPabPZKJudPYFS05wCRsmWp9avwujrxon8MBO+yEVLDhTJT+2X1QE
         AmkJFmyDe6O7KaIZf6pd0hY2fbmkakZkpqMaCsgy3bZ2788N6bEWfWO1mTi3iiad9ekY
         /0t8IjNzldsw0j1kJY/Ro3bs+/66kWgck/Dr0aT60r2NqbKzil113uS8mN9QrIZ/VULB
         y6V+3ZOGwmSX0xhAckt9MKHSqiPo+2SbdMab+zb9zrcthkJdhDsBojgltqLgHqfeL81U
         +6h7rTF+NJHp9jdvpfX1mk8vt1uLQqj4Y0MOKWqEsjUafttVNcirBccXNMABE4IcUDDp
         9Qtg==
X-Gm-Message-State: ACgBeo1iCgUl2jKhIi4svbFbaM8ZiNlbQ+GF7Fz8tMhWHTEPGabau3ip
        CmulAPTycLp0j9w6TAzwgh5JKTOCyRBT8exhdp4mJQ==
X-Google-Smtp-Source: AA6agR5bt19KIJibKb5OfdrwikN7TmkyTEX14efObQx8H0Svbutp2QjRsBLKvv9UqMC3h2dRJxI/ygCQvsNdpS4WJA4=
X-Received: by 2002:a17:906:9b86:b0:73d:72cf:72af with SMTP id
 dd6-20020a1709069b8600b0073d72cf72afmr39902857ejc.440.1662471500115; Tue, 06
 Sep 2022 06:38:20 -0700 (PDT)
MIME-Version: 1.0
References: <YxdInl2qzQWM+3bs@shell.armlinux.org.uk>
In-Reply-To: <YxdInl2qzQWM+3bs@shell.armlinux.org.uk>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 6 Sep 2022 15:38:08 +0200
Message-ID: <CACRpkdaF9s0Qzxa=dhj0k+xg+F9UEteeUuDuwi9XKwz=cVyuiA@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] Add Apple Mac System Management Controller GPIOs
To:     "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc:     Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        asahi@lists.linux.dev, Bartosz Golaszewski <brgl@bgdev.pl>,
        devicetree@vger.kernel.org, Hector Martin <marcan@marcan.st>,
        Jonathan Corbet <corbet@lwn.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-gpio@vger.kernel.org, Petr Mladek <pmladek@suse.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Rob Herring <robh+dt@kernel.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Sven Peter <sven@svenpeter.dev>
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

On Tue, Sep 6, 2022 at 3:18 PM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:

> This series adds support for the Apple Mac GPIO driver. These GPIOs
> are hadled via the System Management Controller.
>
> The first two patches add the DT binding documentation for the new
> drivers. No changes from the first posting (I think there's still
> some discussion going on about how best to handle these.)

The series:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I'm happy with this, and it will be possible to augment
easily for future needs.

Yours,
Linus Walleij
