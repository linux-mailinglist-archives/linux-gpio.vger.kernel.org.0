Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79D0A55E40C
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Jun 2022 15:38:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231495AbiF1NKI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Jun 2022 09:10:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229825AbiF1NKH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Jun 2022 09:10:07 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B39B3645A
        for <linux-gpio@vger.kernel.org>; Tue, 28 Jun 2022 06:10:05 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id x184so19373703ybg.12
        for <linux-gpio@vger.kernel.org>; Tue, 28 Jun 2022 06:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0ZW3XqarvTcGhZ4Peie0PakfFooFWkf6ipw6nAT5DK0=;
        b=kCf9o6/0aD5+Onn97DhZLKfxw23aiwSbWQ3wt8mFoCdH+LjvNVVhyHZrAjseX0NWrN
         zimXeTlzcsePfCsKfNUe2CcGIVa/wrTuQYf71uyvPNwYH5Toe8RyOGCqldn+XbJd+eXu
         Hf0DeQ66vCbWLYXux5M2YqXImKJiT37AMwrsS9i5deSkUrYmy22k7VDXkg3CoD9p5DRB
         Z5Mpogjkt5F719HhCMQYv6MEJuJR+ujHXe33gkTF33jPPsX+Eui0zRqLcqEJMHgL1FXw
         cjVcvfn72nIgSfSalkb/FiXX3YPX78N4BM8l8tTsT8dtjsfMK+aH+lkwQGW4Nt2h6hcn
         6p2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0ZW3XqarvTcGhZ4Peie0PakfFooFWkf6ipw6nAT5DK0=;
        b=AKsQTrz5z4LEi6zevdsC8JoI+eOi3gtTH79NRTM1wJeQmiN+6ahb17zDtdp9sxcqRm
         fSAMrmBrWVSAZjrojSYoe+/2bmyfbxS1bqNAqG2OUKN5KaVFzF6NVMaVXu61tmp+ZEJ/
         HPpqUEVXvtSByqzaTUVpih/iEol1rH6StV1D6ARCNHVxTU1/xJuQ4hTx8sIrjHsBXxvm
         mRBUj8Hwf6OkzhY1mAFSLx1sY8sOhE49ymbykJKERKHEWJCa4hLHvnCW8WoHRE5IA9K1
         79wLbS8gs/P/TACEnjvx55K3Wz0+mcCZohd7JsunhwqPKelBYXQeaWcG0NZdL/K0Kg+t
         03AA==
X-Gm-Message-State: AJIora9RV7FOzo+I0Ir7dU8+QgHXZsk+aXOJUM6A3XWoKt3ozdvb3Fyw
        oNDyfzzdBr4AljIbxuR7icDIRvlbKj/yppJm5OX4mA==
X-Google-Smtp-Source: AGRyM1tf6Oi2cTjL5Xen3Ry8mKIsaQdlmT4EjbmjDbOehmH4tttuvrwdwMm9BEXAu/FfRgr09oipji2FOAjmIeuskqo=
X-Received: by 2002:a25:cac5:0:b0:66d:2c32:8593 with SMTP id
 a188-20020a25cac5000000b0066d2c328593mr2891580ybg.626.1656421804675; Tue, 28
 Jun 2022 06:10:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220601070707.3946847-1-saravanak@google.com>
 <20220601070707.3946847-8-saravanak@google.com> <20220622074756.GA1647@pengutronix.de>
 <CACRpkdYe=u9Ozj_dtLVr6GSau8yS5H7LnBNNrQHki1CJ1zST0A@mail.gmail.com> <CAGETcx_qm7DWbNVTLfF9jTgGA8uH8oAQzbPcMDh4L6+5mdRFog@mail.gmail.com>
In-Reply-To: <CAGETcx_qm7DWbNVTLfF9jTgGA8uH8oAQzbPcMDh4L6+5mdRFog@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 28 Jun 2022 15:09:53 +0200
Message-ID: <CACRpkdYkbVWayPEukyKcSQuzMuV=BmhBwBA6GuoNvb3HLWLNUQ@mail.gmail.com>
Subject: Re: [PATCH v2 7/9] driver core: Set fw_devlink.strict=1 by default
To:     Saravana Kannan <saravanak@google.com>
Cc:     Sascha Hauer <sha@pengutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
        David Ahern <dsahern@kernel.org>, kernel-team@android.com,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        iommu@lists.linux-foundation.org, netdev@vger.kernel.org,
        linux-gpio@vger.kernel.org, kernel@pengutronix.de
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

On Wed, Jun 22, 2022 at 9:40 PM Saravana Kannan <saravanak@google.com> wrote:

> Actually, why isn't earlyconsole being used? That doesn't get blocked
> on anything and the main point of that is to have console working from
> really early on.

For Arm (arch/arm) there is a special low-level debug option call low-level
debug, which you find in e.g:
arch/arm/Kconfig.debug
arch/arm/kernel/debug.S

This debug facility can print to the UART fifo before even MMU is up, pretty
much from the first instruction the kernel executes.

The versatility of LL-debug means that developers do not use earlyconsole
much on Arm.

I don't know about arm64 though.

Yours,
Linus Walleij
