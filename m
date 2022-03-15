Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5CA04D923D
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Mar 2022 02:23:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235034AbiCOBYi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Mar 2022 21:24:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245714AbiCOBYh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Mar 2022 21:24:37 -0400
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52961245A2
        for <linux-gpio@vger.kernel.org>; Mon, 14 Mar 2022 18:23:25 -0700 (PDT)
Received: by mail-yb1-xb2a.google.com with SMTP id h126so34409588ybc.1
        for <linux-gpio@vger.kernel.org>; Mon, 14 Mar 2022 18:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DUrggfzVKufzmWoIKvZEPz4GO4OdeAwImi0Sw1cUPLY=;
        b=Pp9U4iBz1c7RdL74LrziYiz0K9sqGHBLLfaiw7yuCobsSclKVyzEwCqiG22sJkP0ga
         swsO3N/Nup5cLeDeza3pXkR4oTq3FVm8FeVlfhRTxrlvcN2DltmKfxQ2lrv0pFdZyi/4
         KwTLKqnuXPMXPHVuNysLSe0n6a6itKcOiQwMOuYJlQZZVRrYznnLIgsa8ZaJBtW5SRXc
         eOKD5h6tt1tikqIrk6zqwZTtljBgVxHfnYNYKeAWO/632CuHRAVakI18zekwRWndDpbT
         DYmmd3dRbCAmcGmvwebbUtivtqCj5CJvBkD0FGRR9BYQehHQPykOwLCJ/k/Vj6OlqawU
         2pDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DUrggfzVKufzmWoIKvZEPz4GO4OdeAwImi0Sw1cUPLY=;
        b=Uln8DIfTZzI+is3qDfFTJMyrfFLFccsioq/yQ8+P67kWVjjVX9dpXZn6MJPivlBLTS
         aZL+JdHxT/BHtrvjCR8+/nite1OR1JYu9A8AVk52Wz6dkqYZGV2gCIEog2zdiFMbkssC
         8d2YpnjMLy6h2wbSGgd5tvl5FrqEeB+g0mXjoY+pacWa6gWAcuV5vVi/AksQn4P9mc84
         YJ1PFNV5O0jWdhVRA4FdMpFmPY0mc0cbw/EOcSgD10YI4gvA9MXX5Htid/fGzAf6+9Ps
         bY3p7FxWp1+v7ENHuP0ltH4x6olFs/EItsCbOwWM7XTDUq4bsLr9HiBIOUseuEfNgLmX
         bw8Q==
X-Gm-Message-State: AOAM533rHADmq7aZo6j4wxpEY6RM0VskJMSn7JtyzBXhJGHMjVUGEPv7
        HezfK4/LexxP4NugzJPDDyiAMdlEZzUioz9aiGMlww==
X-Google-Smtp-Source: ABdhPJxX9wsyLjHJ3JQDqbwra+5cFiaWtJHWVE2dwF0ABfopbXcx0SYg4eBTvzbtxvVMU36vKLIkAriWFyyD5rl/u1A=
X-Received: by 2002:a5b:dc5:0:b0:624:f16d:7069 with SMTP id
 t5-20020a5b0dc5000000b00624f16d7069mr20041868ybr.295.1647307404617; Mon, 14
 Mar 2022 18:23:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220307115116.25316-1-linmq006@gmail.com>
In-Reply-To: <20220307115116.25316-1-linmq006@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 15 Mar 2022 02:23:13 +0100
Message-ID: <CACRpkda0nKuG=ydxHwuV1cNzyFTbdv8FP606GUNTZaBxKQ6Udw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: nomadik: Add missing of_node_put() in nmk_pinctrl_probe
To:     Miaoqian Lin <linmq006@gmail.com>
Cc:     Lee Jones <lee.jones@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,SUSPICIOUS_RECIPS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 7, 2022 at 12:51 PM Miaoqian Lin <linmq006@gmail.com> wrote:

> This node pointer is returned by of_parse_phandle() with refcount
> incremented in this function. Calling of_node_put() to avoid
> the refcount leak.
>
> Fixes: 32e67eee670e ("pinctrl: nomadik: Allow prcm_base to be extracted from Device Tree")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>

Patch applied.

Yours,
Linus Walleij
