Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94DEE6AE00B
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Mar 2023 14:11:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230386AbjCGNLb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Mar 2023 08:11:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230465AbjCGNLI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Mar 2023 08:11:08 -0500
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA17B8317F
        for <linux-gpio@vger.kernel.org>; Tue,  7 Mar 2023 05:09:49 -0800 (PST)
Received: by mail-yb1-xb2e.google.com with SMTP id c80so4319811ybf.5
        for <linux-gpio@vger.kernel.org>; Tue, 07 Mar 2023 05:09:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678194525;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BUyLL3WLDfVQzfFJ1cTgHx1F2T4l0rvv5mYeuKbfNsQ=;
        b=f0voQHR50eKQn9pWmH4okHQLwspQ+PoKv5Kzdda/RrrkGGfmtex9EAriYrGVMqBdCN
         uIlvDmU4524gP19vJ/EDVqVtcvd12x8mMg1sDcdjLmjnN1IDLRv/NWyV3jxMWbWkviCt
         2JnXueygaWOrmlncuFbWNX2S/wEf+rUAqJBgGl24gAKhvQ2BNsbqXz9w/zPqBna8J7pk
         ISWoMp95GiuXqKWCHNsIOXoMEi6vYl5TtrVPIZ3bIjGuTwHYt4s0yV/EAKUcm6hTmdvM
         LnLG4iHZ1GN/wRShBoZDVs5u14NzL2aqRWB8fc8n5mlYwlQU0waZkSrcomJJ7lQ4+iDg
         u06Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678194525;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BUyLL3WLDfVQzfFJ1cTgHx1F2T4l0rvv5mYeuKbfNsQ=;
        b=e65ezzTQDCaTEWqvZBfusgSF01/0xbh2he94s6ETCtdObli27IMTj/8xmRiOTwiRZp
         Fwso862YP6sxYBYRHpf9k2pKGz/suQPk7SuIef272Ly8RQC2B7kHUEG42EgqhsGI8AZ8
         DVoNuvKYNUvMExjT1nnoB8KC0YiR3CkRJThCLiJbh0Ij3/99r+7ST7/SBQgiEyT9LUIR
         FJmpNKXtS8IfG+RTh/6vDnxRf8Iu5WWYzGfjEDSRtk7lk2eXrkoOG9t5pyAGixPlVUdr
         a9UE9pvfuio2SWudE4D7sjlZTByS24L6W000miGeu6K58VUhwawr4h1YcW/bpaf7qu3E
         xerA==
X-Gm-Message-State: AO0yUKWrSxgWQHmGVEIjfBSvHkLlHPwiW3IcYNJz/O0IrVRhO4D310KO
        bBeWpycasLr/4Jw0WttLN6mrwVp6qJ6z58/rccpX8w==
X-Google-Smtp-Source: AK7set8G15rudyekwE1NLJ2jrqHCuvOJo7nIba762aX7OQEgLIczx/xEM0GURgzlhd1O+RzQzpIcv3hNWRNtZxm2mww=
X-Received: by 2002:a25:8b8f:0:b0:906:307b:1449 with SMTP id
 j15-20020a258b8f000000b00906307b1449mr8597450ybl.5.1678194525710; Tue, 07 Mar
 2023 05:08:45 -0800 (PST)
MIME-Version: 1.0
References: <20230228130215.289081-1-nick.alcock@oracle.com> <20230228130215.289081-3-nick.alcock@oracle.com>
In-Reply-To: <20230228130215.289081-3-nick.alcock@oracle.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 Mar 2023 14:08:34 +0100
Message-ID: <CACRpkdbGS5Gzzz0_LJR7=EOLJxCA6af1wsRWoQCxQau+t+r=pg@mail.gmail.com>
Subject: Re: [PATCH 02/20] pinctrl: amd: remove MODULE_LICENSE in non-modules
To:     Nick Alcock <nick.alcock@oracle.com>
Cc:     mcgrof@kernel.org, linux-modules@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Feb 28, 2023 at 2:02 PM Nick Alcock <nick.alcock@oracle.com> wrote:

> Since commit 8b41fc4454e ("kbuild: create modules.builtin without
> Makefile.modbuiltin or tristate.conf"), MODULE_LICENSE declarations
> are used to identify modules. As a consequence, uses of the macro
> in non-modules will cause modprobe to misidentify their containing
> object file as a module when it is not (false positives), and modprobe
> might succeed rather than failing with a suitable error message.
>
> So remove it in the files in this commit, none of which can be built as
> modules.
>
> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
> Suggested-by: Luis Chamberlain <mcgrof@kernel.org>
> Cc: Luis Chamberlain <mcgrof@kernel.org>
> Cc: linux-modules@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>
> Cc: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> Cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-gpio@vger.kernel.org

Can I just merge the 3 pinctrl patches to the pinctrl tree or are there
any dependencies?

Yours,
Linus Walleij
