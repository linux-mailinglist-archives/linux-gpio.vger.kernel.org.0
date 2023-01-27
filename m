Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58A1A67E564
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Jan 2023 13:36:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233893AbjA0Mgg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Jan 2023 07:36:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233618AbjA0Mgg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Jan 2023 07:36:36 -0500
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA56C42BD6
        for <linux-gpio@vger.kernel.org>; Fri, 27 Jan 2023 04:36:34 -0800 (PST)
Received: by mail-yb1-xb30.google.com with SMTP id d8so3849215ybe.9
        for <linux-gpio@vger.kernel.org>; Fri, 27 Jan 2023 04:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wIQgqytbGCGnsLfE32j4FBII/PPntybaWfzlvCNe4UA=;
        b=lwWiN6WOnag9FDYNlfmanvaHGjwBm9MFXdooj5ZSLoPE48Hd3rPGiM7ki3oTnlHLrX
         mt0r9gpwkv/lTWKTNDBSxVmXDiv/vQT3R60ay3xoz/5bfCVDqpO8qGb8fDpGRofzaD5B
         8qXqHvRl+u5Ep2pneD3QvUj80okG6qoh2bGy+xjL8PTOfB8Otf/ki9qKiMMKIljKSI0e
         sP55FD6wj8t2Bep0VecAAQLSLR13LOcFPYxf0pdxwFMq8X9T39QyG1U+VnoHDen64yL0
         mVL0R7OxOAvrb9QtTFxhKucv24yT/R1cetCOuCDIrzsO/KoAMLE4gKlnVhO72oSDtJw9
         F+xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wIQgqytbGCGnsLfE32j4FBII/PPntybaWfzlvCNe4UA=;
        b=up1BeOHom4/wulKGVblHIIrhAyu6kw75o8rkgcF+8dFDEv0a0/N9hXG5N8uICWPdAl
         6Xeu2fN+j98acZKPtOnwat/zdjAgM3/N0amDiz3BfJBCSua3zRMzSAyx/IeyPnHpSJHI
         V1bD1EpxKFK1uftb/OoFa6GJIXwSq+AUOfgMQoSpv+yIjMtEBwOz0iPaga8M6aay+lsZ
         r9nyrLH3bBKKb6cK6+6IZZm/PrcPGGouPq2fzDgi2NeSIKUpHafKbPVdQDVmCAIMf1Bh
         BaG+BJWpmqUil7QWkE1E4It5GhZeDSJTzaYFCKNEGGZYnlA4tVWGNPZghEM3JV6bb2D6
         lmuA==
X-Gm-Message-State: AO0yUKWLdRYaL5SkZub5rTnifeMbUN/kzcBXDnfL44kgAZhiPapRsmEs
        BvbloK28hG25E9YDuqxarc/F22YD3Nv/29ZJY49QISzesYf+jQ==
X-Google-Smtp-Source: AK7set+SGlT6cS6PFZ86U9CRm3F0I0DktW1SMOReWMR7YLwEypf/V//zg3Oqk9kzRSuaCwV0xZD+IB4NPF0AgaruHN8=
X-Received: by 2002:a25:d884:0:b0:80b:66c5:9fc5 with SMTP id
 p126-20020a25d884000000b0080b66c59fc5mr1738328ybg.210.1674822993880; Fri, 27
 Jan 2023 04:36:33 -0800 (PST)
MIME-Version: 1.0
References: <20230119235501.53294-1-joel@jms.id.au> <b565b254-45aa-4f7a-b158-99fb4c66167f@app.fastmail.com>
In-Reply-To: <b565b254-45aa-4f7a-b158-99fb4c66167f@app.fastmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 27 Jan 2023 13:36:22 +0100
Message-ID: <CACRpkdYGG8jA9x8Hb9ByvkhFXgbyG43K=LB5F0t4hLxyXtWKjQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: aspeed-g5: Bypass clock check when fetching regmap
To:     Andrew Jeffery <andrew@aj.id.au>
Cc:     Joel Stanley <joel@jms.id.au>,
        Billy Tsai <billy_tsai@aspeedtech.com>,
        linux-aspeed@lists.ozlabs.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jan 20, 2023 at 3:35 AM Andrew Jeffery <andrew@aj.id.au> wrote:
> On Fri, 20 Jan 2023, at 10:25, Joel Stanley wrote:

> > A recent commit cf517fef601b ("pinctrl: aspeed: Force to disable the
> > function's signal") exposed a problem with fetching the regmap for
> > reading the GFX register.
> >
> > The Romulus machine the device tree contains a gpio hog for GPIO S7.
> > With the patch applied:
> >
> >   Muxing pin 151 for GPIO
> >   Disabling signal VPOB9 for VPO
> >   aspeed-g5-pinctrl 1e6e2080.pinctrl: Failed to acquire regmap for IP block 1
> >   aspeed-g5-pinctrl 1e6e2080.pinctrl: request() failed for pin 151
> >
> > The code path is aspeed-gpio -> pinmux-g5 -> regmap -> clk, and the
> > of_clock code returns an error as it doesn't have a valid struct clk_hw
> > pointer. The regmap call happens because pinmux wants to check the GFX
> > node (IP block 1) to query bits there.
> >
> > For reference, before the offending patch:
> >
> >   Muxing pin 151 for GPIO
> >   Disabling signal VPOB9 for VPO
> >   Want SCU8C[0x00000080]=0x1, got 0x0 from 0x00000000
> >   Disabling signal VPOB9 for VPOOFF1
> >   Want SCU8C[0x00000080]=0x1, got 0x0 from 0x00000000
> >   Disabling signal VPOB9 for VPOOFF2
> >   Want SCU8C[0x00000080]=0x1, got 0x0 from 0x00000000
> >   Enabling signal GPIOS7 for GPIOS7
> >   Muxed pin 151 as GPIOS7
> >   gpio-943 (seq_cont): hogged as output/low
> >
> > As a workaround, skip the clock check to allow pinmux to proceed.
>
> We'd want the clock on and and the device out of reset before this
> makes sense though. We're just assuming the IP is in an operational
> state? Was this just accidentally working because reading the register
> in a bad state is producing 0 instead of other undefined garbage?

This makes sense, can we come up with a resonable patch for this
problem or should this one be merged as an intermediate remedy?

Yours,
Linus Walleij
