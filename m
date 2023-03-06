Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F365B6AC324
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Mar 2023 15:25:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230063AbjCFOZm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Mar 2023 09:25:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229852AbjCFOYd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Mar 2023 09:24:33 -0500
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A32ECAD02
        for <linux-gpio@vger.kernel.org>; Mon,  6 Mar 2023 06:23:50 -0800 (PST)
Received: by mail-qv1-f42.google.com with SMTP id ne1so6667763qvb.9
        for <linux-gpio@vger.kernel.org>; Mon, 06 Mar 2023 06:23:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678112487;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vHCoqws6nzCwLWKubM4RZxyDqCdsgMa8R2vUKk4gvJw=;
        b=n6HZz35KMtk+PBNOp4x3JV2cgwYu2jlxfI49aV3oWVOPiqBqoGRixHilDBokyFyWOm
         5X+7RBdek5X+jhEHpqACbmom20/58ijue+So5bnOjVXoGWG3GiuEvFsCwAlwLTbDqjxS
         fWsqlyrnGyGqmPV8P2OhRO5tWx/7X+bk0/TWCgD7/MYn2sIr6geOGmXiHxTR2vjbPgUC
         eO1qUDZjRT+ZFfYeIP7RXEBT8ezyu8rXWn5ye6JGAvFVfF0/shWHAc+UotRGbqwEGiBD
         pOYRtOhTQ5SsdFwo/L/OOrHYl+54cO02KFSHUm2t7RzlBtyG/xEGdyqqeLmjZ0N3cvH7
         904A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678112487;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vHCoqws6nzCwLWKubM4RZxyDqCdsgMa8R2vUKk4gvJw=;
        b=aac6f8Wh+bG1CYIXL0h/NCP9kBoGVaLCob9d8A+3XMtqDtW21GTsV9U4YX9cPjLinl
         oRd5Pdp5j/+YuDvF48yYNch0ujbZ7WYh+mWcO941+mG766FwOlgDny6gKI4QDWUUFwWf
         dXQ/wcOF0rUnS4gFLmj9AgTZuLilkxykWqVmPxC+md2Ra6FQQLlY98yt5qKF095g/tor
         JJIJ0aiB0y4PAFOeyqMGNDrmUDZhwrUvYnuWI+WsfMYDs17ffIBkcEVDFfNc+LwvNUAa
         lIvBlB9OSN+msF2/T+IUDyx7i8VRZ/1Cy/DuDnuTDhO023BInVSNmSh9Su7Cux6S/mwT
         ncsQ==
X-Gm-Message-State: AO0yUKWlDr1oRPLhn2O+EWJqPTOiVbhQTHKH5xqoyKiJcn0n6iR9fYz3
        Y0+1bcirMwphClRUFztZIkbpYH4+GeMc3+RuCif2FYmtKBhhYW7Q
X-Google-Smtp-Source: AK7set/St9kZ5LRoOkmLszQTz/sb64Pi3//k5vU4LxkcQwJNZMnCqiqjT/Yiky4obv8UCmxEUiW0O/BaB4kC8/5bkSs=
X-Received: by 2002:a81:b61a:0:b0:52e:c79a:cda with SMTP id
 u26-20020a81b61a000000b0052ec79a0cdamr6878682ywh.10.1678111987291; Mon, 06
 Mar 2023 06:13:07 -0800 (PST)
MIME-Version: 1.0
References: <cover.1677515341.git.william.gray@linaro.org>
In-Reply-To: <cover.1677515341.git.william.gray@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 6 Mar 2023 15:12:56 +0100
Message-ID: <CACRpkdbAMQ0OAMnxuyf6gMFu8qJakmT=WvRzBTXavXFmnJ9ObA@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] Migrate IDIO-16 GPIO drivers to regmap API
To:     William Breathitt Gray <william.gray@linaro.org>
Cc:     brgl@bgdev.pl, broonie@kernel.org,
        andriy.shevchenko@linux.intel.com, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Feb 27, 2023 at 5:54 PM William Breathitt Gray
<william.gray@linaro.org> wrote:

This looks good to me.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Bartosz, of you merge this you can drop the corresponding
patches to immutable irqchip conversion for these chips
that I will be posting shortly (currently on the build servers).

Yours,
Linus Walleij
