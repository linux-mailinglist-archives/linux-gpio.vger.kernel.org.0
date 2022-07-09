Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C17C56CBE6
	for <lists+linux-gpio@lfdr.de>; Sun, 10 Jul 2022 01:10:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229476AbiGIXKC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 9 Jul 2022 19:10:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbiGIXKB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 9 Jul 2022 19:10:01 -0400
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B453167FA
        for <linux-gpio@vger.kernel.org>; Sat,  9 Jul 2022 16:10:00 -0700 (PDT)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-31cac89d8d6so18397017b3.2
        for <linux-gpio@vger.kernel.org>; Sat, 09 Jul 2022 16:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JkWokYXmjMB+GO56Z46uvr8QrCPXsyHR7Lu0241rZa0=;
        b=NlXyB4KjXBUF1nqiSIMRVI2olAK7KzGBJTsgd/cBx2UTFglJ/mxpvuT1W3lSg09HUW
         OwzKCIXFbZ4dX4frI9Gu6wPqmV/9LR3JU6vw9G80PiUQnj+rDclwAEsAYc9BZtxPeOJR
         eUMX09LngSHkxfVkkz34ZlUk5dxPVuY4GPXM2/tMb8IRmN3FPmBml4i0+gdFdZqCcNyd
         f4Be8nJgelMHsU1BFdNq7vFYpchtWdpGMUurbZ7o/3369r0KiXiHxMmNY/MN5m2vQYq+
         LNkoz3e/EVRy2+xY2eB2AI0MMYj4eX9bmf2gWypTE0oMQ3nx7Y2oVRul7OpmcFbLPPw2
         cNyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JkWokYXmjMB+GO56Z46uvr8QrCPXsyHR7Lu0241rZa0=;
        b=FhsNpGh9NQiZu1U3c56vFbqhOQI2l6/ABVE6ocoEFvaTIsAhOxMs/dJoCCwtmKYPGr
         zOyPqTJImDQXqNwofb9g2r7/fel29JjfHgFCE57SRK66rkH++mOf5IDC3dtCDgoWHNeS
         zguhjnLlupM9dSFt9gvbOelvQy1AoEb//Zk953Fko6CM5G91Qw/B0V8EDoKh0RK716jp
         N2m/VD4m4AhZcRTzU8N+wxEbyo7DPP7rBtvUs10tx/NwsYX4ZuHt9zEUAMhaY7ODsIAn
         WNYTUwoQg+0l7PeaJdXJ1Qr1i0HY3RYm77XcX7ntnecqRv1Dzyq1YVy0P2ImSkVypeZr
         GSoQ==
X-Gm-Message-State: AJIora/DDOAAlSiH/DGG/jjxN+sGdzZvNztPOS9Yu1YgGusZ2UPtaG+l
        Tgp9D/HmlyoWpTyZ0mJe9i2DzYhyZFgnA0RVxA5t9wCsQDI=
X-Google-Smtp-Source: AGRyM1vNvQoQ1AtLUCCLgxuRfmqbtdVfPQbzrk4BjnbbXp3Xwubgw0+UoJoMVG2FPa1S6aOzYxUgQdlvMEnbMo1RbFU=
X-Received: by 2002:a81:6cf:0:b0:31c:913c:144c with SMTP id
 198-20020a8106cf000000b0031c913c144cmr12142466ywg.437.1657408199788; Sat, 09
 Jul 2022 16:09:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220613064127.220416-1-Basavaraj.Natikar@amd.com>
In-Reply-To: <20220613064127.220416-1-Basavaraj.Natikar@amd.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 10 Jul 2022 01:09:48 +0200
Message-ID: <CACRpkdaMpeJiLL-n-xGZbUAFNdd49B6EFs7MfBg_7H0XmEXpeQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] Fixes and updates to pinctrl-amd
To:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Cc:     linux-gpio@vger.kernel.org, Shyam-sundar.S-k@amd.com,
        mario.limonciello@amd.com
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

On Mon, Jun 13, 2022 at 8:43 AM Basavaraj Natikar
<Basavaraj.Natikar@amd.com> wrote:

> Changes include use of devm_platform_get_and_ioremap_resource,
> save/restore pending irq bits and removing of
> contact information.

Patches applied!

Yours,
Linus Walleij
