Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63C7A614496
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Nov 2022 07:20:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229826AbiKAGUn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Nov 2022 02:20:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229544AbiKAGUl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Nov 2022 02:20:41 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 140D611A2F
        for <linux-gpio@vger.kernel.org>; Mon, 31 Oct 2022 23:20:41 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id 17so8382770pfv.4
        for <linux-gpio@vger.kernel.org>; Mon, 31 Oct 2022 23:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MkD/xxnuw0GgTenGbcmw3AVr/END4d5U7VG4R1TARoU=;
        b=bFeRwG8hlbuLO/bCUD4jEyAyFP2SVgNhVNdT/5NkRd5H92OOXB6nERYL8ZHq8uFDWR
         C3XN8gJlFZuRZCnwkc7DxZBHenFGIkByik88nEqVfoZLFjziZpgo/Ky3HYcH0UkVCpvE
         AQ1XB90kBfSVZn5IYbhLCD4wqliT3+ZxBccmmZ7vS26RB5/keVaggpIFK7IX3GKntFJC
         4BZeHERCuGraWfmIwAF0PVNj+Qwddpu9+ioDMHnxynhah2pi+9I2xPbCUXbY8yVOGcCE
         xRblYxfZWzxaTzovm2+ID3Fcdqbq45Zfbnw3JNYR2hUWdoSjVzn3iFkCKOnlQpGEpG1B
         KDlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MkD/xxnuw0GgTenGbcmw3AVr/END4d5U7VG4R1TARoU=;
        b=zbDcUhzjIoidE9olCI7vwNM5b2DPBllisAcDiX/+G3Ql7Fi3YPg2Yu/f1yS6/Kcaga
         pX5SLRy7+ycabhxWkgNpkLV+4j8CQGFbujWr1WHNPe1+UMSmoll0dM6RnF2RwTYfwNlx
         GZwNY3s6Mk3IIB+Gv/GopffgF6cinb7Gs2Tm36IQWpMY/KEQ1Ktf4TDpur94cly2v2C1
         1ErLAIQ3kZfw9yqkSW8oCC9vy70KqutjjtR4exR2ml/je6BcrYl+f0dMAHLmpS0iwlGf
         uIBPKthKOpdb2jhj33lzG9JdKwTdC2FaPL56xCT59rwFzq9CQtcr1J9ZWNhcN+wyY8IS
         O4ig==
X-Gm-Message-State: ACrzQf2edzlUYYd/MXr978w/nw6hCnMfFl7ZN8YKnZd1SWxsMoBAAzx+
        f/FYYaUSmU0FLYIR4CGOdKIzC6yur9zUOAdtvIFjNQ==
X-Google-Smtp-Source: AMsMyM6AR4ITiLmDUPQU1HoAap1WR+dknQ4LQoDLtHS1f24GPxGn2qvLasi1in527JX914XXmHpd8KMyi9Zuhx4Cf+E=
X-Received: by 2002:aa7:8502:0:b0:56c:349e:c18b with SMTP id
 v2-20020aa78502000000b0056c349ec18bmr18171715pfn.1.1667283640583; Mon, 31 Oct
 2022 23:20:40 -0700 (PDT)
MIME-Version: 1.0
References: <20221016121406.co3qixzcbfke4ye7@proprietary-killer.gsrm.network>
In-Reply-To: <20221016121406.co3qixzcbfke4ye7@proprietary-killer.gsrm.network>
From:   Haojian Zhuang <haojian.zhuang@linaro.org>
Date:   Tue, 1 Nov 2022 14:20:27 +0800
Message-ID: <CAD6h2NSahYuqg1T2oW7tHmAeAfqircfeokYhvJYNRVi5TXEDAA@mail.gmail.com>
Subject: Re: pinconf-single: pinctrl-single,bias-pull{up,down} bits help/explanation
To:     "Marty E. Plummer" <hanetzer@startmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, tony@atomide.com,
        linus.walleij@linaro.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, 16 Oct 2022 at 20:14, Marty E. Plummer <hanetzer@startmail.com> wrote:
>
> Greetings.
>
> What I'm having issue with is the pinctrl-single,bias-pull values. From
> commit abe4e4675dfc62b7f2328e2c4bce8b5bdcdff7c0 I get a bit of it, and I
> think I have it mostly figured out:
>
> // <[input] [enabled] [disabled] [mask]>;
> pinctrl-single,bias-pullup = <? 1 0 0x100>;
> pinctrl-single,bias-pulldown = <? 1 0 0x200>;
>
> using mask 0x100 to single out bit 8 and mask 0x200 to single out bit 9,
> enable values being simple binary on/off. What I don't get is how the
> input value is determined/calculated.
>
> Aside from the above mentioned commit for the am335x-pocketbeagle.dts,
> which uses a differing pullup control scheme, the only users I can find
> in the tree are a handful of hisi socs which I don't have a datasheet
> for to map their usage to register definitions and puzzle this out.
>
Excuse me for just noticing the email.

#define  PULL_DIS     0
#define  PULL_UP        0x100
#define  PULL_DOWN  0x200

// <[input] [enabled] [disabled] [mask]>

// If you want to pull-up, configure the pin as below.
pinctrl-single,bias-pullup = <PULL_UP  PULL_UP  0  PULL_UP>
// If you want to disable pull-up, configure the pin as below.
pinctrl-single,bias-pullup = <0  PULL_UP  0  PULL_UP>

It seems that the pin configuration in am335x-pocketbeagle.dts is wrong.
But I don't have the board to verify it.

And you can check the logic in pcs_pinconf_set().

Best Regards
Haojian
