Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 601C362EF1E
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Nov 2022 09:21:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241211AbiKRIVo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Nov 2022 03:21:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233442AbiKRIVn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Nov 2022 03:21:43 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB6F31182F
        for <linux-gpio@vger.kernel.org>; Fri, 18 Nov 2022 00:21:42 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id n21so11185501ejb.9
        for <linux-gpio@vger.kernel.org>; Fri, 18 Nov 2022 00:21:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XOBpoxeGFT+N+S8ZZV6VxxO3x7hKADG5NqPwjLlemhg=;
        b=oefqe609qs/Yz8W6Ge5l+UwLLRInM1kEhrB1AVTEAStOVl84gZPDB/sXnajjoFxeoz
         zBaXxmelaTxvDiOp/ZwFdD4FCuIdtheaWrZs33BMIMkNGSkio3d9HUU9aNgavGdCBGPJ
         Ra0uTVgGeByJjW+Kh6Rf/42Mb4VT7RXyeSn8C2mPAZY0nj/Q5Tszxph5KF0c9cBmcpmf
         UpshD9NSOCNlrf1nKslTgsBHcb/ldrql8s2sPK5XKXZ5YhW3poWZnNnqY0qTKliF+GFX
         jvCDmhccPDX1Atofg93bFqffB9vqVP3EcSL70BmhIqKm6m1y6x02kZpgObie+2svzqLz
         pVBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XOBpoxeGFT+N+S8ZZV6VxxO3x7hKADG5NqPwjLlemhg=;
        b=RzJQunE0r8wMh37b67imBD4doMNJ48ZlgTBNSSlzNOCYmOzEAWmm3LQ/mOsUvEuT2I
         tONJxE3vsl27Q1prk0LziXRo+7+uKj/mYC6xXqS7qU3xfVs4x5ScyliF0P4JnP2ECb5x
         5euXL8tyeUtJ/yA0l6tYxtde5pikauw4xKN+Y0RKR3e8Ljwsl2n4gxXp5yFv6cTZiCj0
         GNqevYYe2MTFrxMXUHeRgB1OUAMEfLQYMzNvsx6+zCTLEpwaVj2Mo+cN1WC/9nwty8F4
         +C1PkCx9LOv7Rq0LdaPQlknpfFvRe2XyorxMNvJ70gVCbQyDtQVqY+inwa2fU3zOpg+s
         HVeA==
X-Gm-Message-State: ANoB5pmR8g1spUpTtBc4zP6W3fnN9K4SeHw9576ZrA9a9sdQ8krwL+xm
        Eh/Mzpq2/qUs0vO6CwzNWSG2yeRtbC5hxBaDLhxA2nCzXh4=
X-Google-Smtp-Source: AA0mqf4wqJCOY2MrGC4et99WmZvqcm9tXgx995jctvOl0uxL2am6fsb8lQbmwDTSfrpn3ZD6tCsSyOerAvIvAMEUe2w=
X-Received: by 2002:a17:906:7c44:b0:7b2:7096:6c2 with SMTP id
 g4-20020a1709067c4400b007b2709606c2mr5211453ejp.526.1668759701277; Fri, 18
 Nov 2022 00:21:41 -0800 (PST)
MIME-Version: 1.0
References: <Y3YY/m0F/Rh0jUc7@black.fi.intel.com>
In-Reply-To: <Y3YY/m0F/Rh0jUc7@black.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 18 Nov 2022 09:21:29 +0100
Message-ID: <CACRpkdb8UjUWLn-z+CkB40H6y6CGM=XwhQtymQL0wcZpC8_LYQ@mail.gmail.com>
Subject: Re: [GIT PULL] intel-pinctrl for 6.2-1
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linux pin control <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 17, 2022 at 12:20 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> After headers cleanup, this is more focused on the Intel pin control drivers,
> and has been in the Linux Next for a couple of weeks without any problem
> reported. Please pull for v6.2 cycle!

Pulled in! Great work as usual.

Yours,
Linus Walleij
