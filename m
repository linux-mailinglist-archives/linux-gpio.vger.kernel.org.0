Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8DCFD64BE39
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Dec 2022 22:09:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235771AbiLMVJY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Dec 2022 16:09:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235382AbiLMVJW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Dec 2022 16:09:22 -0500
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com [IPv6:2607:f8b0:4864:20::e31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 522D91139
        for <linux-gpio@vger.kernel.org>; Tue, 13 Dec 2022 13:09:22 -0800 (PST)
Received: by mail-vs1-xe31.google.com with SMTP id t5so15959443vsh.8
        for <linux-gpio@vger.kernel.org>; Tue, 13 Dec 2022 13:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tnFbRblvIAohtXsS7HtysL40uwtBJKnVhVEm0LDo430=;
        b=dQWkUQxFj3P4omRlo7FZ86ewcpHN7+hUf6yRLTiBKl68oUlZCERjUMbzraBwjOUQxc
         Q4WUyopqarJTZAEbZMxLL9Jcx9WNGUOdxTt3WmGNu3srsxh5TpgLzn8WgxCCyy8vG37C
         WhbqICC+7p95glWwhF9knsew44gEzDXsUGWGA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tnFbRblvIAohtXsS7HtysL40uwtBJKnVhVEm0LDo430=;
        b=Q71xr87dkuje74joi+X9Xz2MkKT9gmHXtu04E2LlDd3ipwOctOQthESpsdIP4LtZ9L
         bbIgEJCS4EKidMn7bXxICP/RXyNx5NoQ4z0EW7l8TraTxUPE2wUPMDjDfFnjuy/1yQpd
         ZgrQvFa3Tgb5jVN3x/hP6gratIdD4+HqRLK/wNAGNsTsA1RhbkaEy1JLM5pooTpQwaN7
         LyDn0GNN/yEpw24QU2Wj7V0l3yVAUchjQZm9CSQ7FS2VD2pFIbvn6/XwtUfARpmPDWyM
         pOXInoMRQ9pyDBmIbBzxNiYXzvZfAPp81N9ATcZgWjq5GrANmZeYJiYJH8CXk8QqVe7X
         rrEQ==
X-Gm-Message-State: ANoB5pkKBdlb0F26SWTSxHE+Yu0l2QT+8vmOc76Y+6FXQhLf+ZeJQB9F
        VZ9d/ynun+uGVp1rJhbt94EFuvY5zqF7Dxtf
X-Google-Smtp-Source: AA0mqf7O5yMhT14QmPeX/8GgwdSfPWU6+raM6VsNaL6Pz1ppLuX6un2wKpEMsl0oiMq+hQvse+XpfA==
X-Received: by 2002:a05:6102:f82:b0:3b3:57dc:9cb1 with SMTP id e2-20020a0561020f8200b003b357dc9cb1mr10085181vsv.4.1670965761146;
        Tue, 13 Dec 2022 13:09:21 -0800 (PST)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com. [209.85.160.173])
        by smtp.gmail.com with ESMTPSA id i8-20020a05620a404800b006feea093006sm8667725qko.124.2022.12.13.13.09.19
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Dec 2022 13:09:20 -0800 (PST)
Received: by mail-qt1-f173.google.com with SMTP id c7so940377qtw.8
        for <linux-gpio@vger.kernel.org>; Tue, 13 Dec 2022 13:09:19 -0800 (PST)
X-Received: by 2002:a05:622a:1745:b0:3a6:8b84:47ce with SMTP id
 l5-20020a05622a174500b003a68b8447cemr33504512qtk.678.1670965759633; Tue, 13
 Dec 2022 13:09:19 -0800 (PST)
MIME-Version: 1.0
References: <CACRpkdYZDXH=_Mgv0u+B8btLjFcCSTboWFXH4u1h9V=WqLEJQA@mail.gmail.com>
In-Reply-To: <CACRpkdYZDXH=_Mgv0u+B8btLjFcCSTboWFXH4u1h9V=WqLEJQA@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 13 Dec 2022 13:09:03 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiK9DDH-sE7V1t_QF89nc=uEMt9mhL=LFR1a3R2AK=_ng@mail.gmail.com>
Message-ID: <CAHk-=wiK9DDH-sE7V1t_QF89nc=uEMt9mhL=LFR1a3R2AK=_ng@mail.gmail.com>
Subject: Re: [GIT PULL] pin control bulk changes for v6.2
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Dec 12, 2022 at 5:16 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> What has however conflicted in linux-next is pinctrl and the SoC tree, see:
> https://lore.kernel.org/linux-next/20221206121336.474457bb@canb.auug.org.au/
> this was caused by a merge path misunderstanding, so now it becomes
> your problem, congratulations.

Heh. That's the spirit! It's the season of giving, after all.

> However as you can see the resolution is fairly trivial and available in linux-next.

Yeah, not a problem, this was a very normal conflict.

                  Linus
