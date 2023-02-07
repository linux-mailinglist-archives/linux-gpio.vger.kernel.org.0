Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF0A368D254
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Feb 2023 10:15:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231450AbjBGJPI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Feb 2023 04:15:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231439AbjBGJPG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Feb 2023 04:15:06 -0500
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E18683669D
        for <linux-gpio@vger.kernel.org>; Tue,  7 Feb 2023 01:15:05 -0800 (PST)
Received: by mail-yb1-xb35.google.com with SMTP id d189so9604388ybc.0
        for <linux-gpio@vger.kernel.org>; Tue, 07 Feb 2023 01:15:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=q8jBVuw64zr+++4naEUhmf8QMT+GB68ff/CcL3gGnDk=;
        b=NWlZW+1yt6Dn6Z2iU3Hm59DGjYhkWJYoHVsD+bAUodoF+FaamRhb/AUYydjendGFUO
         ZHKaeU/1EyJcdLHBaadRpFCxZ2Mggbg80NX1tmi6vzsFaO5zwCM7mCrnZHD1JjG/B1r6
         bqgOqg5D+H353oCu3RcqkPZoZEW6YxwfCJ2ziCAgsa0Nj8BoVkX3BkjuDW5U3EsvGJGc
         YEXIIqREmxLzUU5hPd15s1Be2EFNFSRdEbfsY9L22U7rW6vMeWywFpRVFwE1lOGXzqVm
         521qqGp8mnebLHZkaK+OaMgMCGH+r1nOx78Vg1Z1qLaLpwShT7tjF+k01pdc0Lk5DwOk
         vncQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q8jBVuw64zr+++4naEUhmf8QMT+GB68ff/CcL3gGnDk=;
        b=c6BLhr87lj+9SizaBexkoskZMTy/kofnpXnoHYQfoH619bRHZeHBEJCIpJgJxdJRPU
         glWuUPPGaosQQRaJGJpijhEObqzdgdTksZ/mBwCDGm2aVmBI/E74nDa4VQI6RhbvnqMp
         s4bJ/LZkWLOFAlGMmBguq6hEuNzBkoKIpsBTpBYQKBTUbmjtO+BoU8Xipa6AUbK971ft
         hiTFcMhP9N31sQMwVuNTwNS14Me3Rl2S/uZVXnr7h1EQTEgTT27hjC7d3mjgx0cf8Net
         4N6qSJ7mL+M6fgjUs4qgjv8k+rStS7UXoGMXGwsmowyk3Kknvv/H340R6fPhGle+Sdo+
         ebyA==
X-Gm-Message-State: AO0yUKWZrqPpB02gFjNRtqwS2HuRBdzggyWBsMQwyYXQzfQKv5uvY5mD
        VgdIgi8JBxAs3x23nGnGYLflGww6R/WxwRwj/lhkbw==
X-Google-Smtp-Source: AK7set+yZ7oot/nLJBhp936PRtnytfQjFAtinpDu6O4RQZtagOF92fdcaz69150IfHZum63k6nVKWxw2gVVw1WaXgSQ=
X-Received: by 2002:a5b:6c5:0:b0:88f:946:bd98 with SMTP id r5-20020a5b06c5000000b0088f0946bd98mr323446ybq.24.1675761305145;
 Tue, 07 Feb 2023 01:15:05 -0800 (PST)
MIME-Version: 1.0
References: <20230206141558.20916-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230206141558.20916-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 Feb 2023 10:14:53 +0100
Message-ID: <CACRpkda+5s3X-g5C=42m3Xh-A=mpR-2hLasht6bMT89L9XBJQg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] pinctrl: intel: Restore the pins that used to be
 in Direct IRQ mode
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Shevchenko <andy@kernel.org>,
        Jim Minter <jimminter@microsoft.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Feb 6, 2023 at 3:16 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> If the firmware mangled the register contents too much,
> check the saved value for the Direct IRQ mode. If it
> matches, we will restore the pin state.
>
> Reported-by: Jim Minter <jimminter@microsoft.com>
> Fixes: 6989ea4881c8 ("pinctrl: intel: Save and restore pins in "direct IRQ" mode")
> Tested-by: Jim Minter <jimminter@microsoft.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied for fixes.

Yours,
Linus Walleij
