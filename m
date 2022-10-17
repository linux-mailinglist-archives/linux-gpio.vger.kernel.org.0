Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7AD2C600C15
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Oct 2022 12:11:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230016AbiJQKLl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Oct 2022 06:11:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229770AbiJQKLk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Oct 2022 06:11:40 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDB9A5E337
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 03:11:39 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id m16so15307698edc.4
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 03:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=G0v1Ihf7IbhRPcZy+imyWJp1IXE2R+G+DgDPALxWRug=;
        b=s9WAOvaxZH8qC9Qd23uPRMTR2p/0qtTgiXbEDYaipH/9GVsaHnfrKn45V/0KjXecYn
         ZniZsacJ+O2IApj4Upoft2sftd34vNWVLMLu3CWA7hZsJYZ4Mii3IkvtvRk9kn+sdONh
         gEid+KHd8iKQoWWEuWXK+gYoUr1/dv2tQ6qlvMlYI1CbV2+dcezHq723vxmO2slelhjk
         OqARm8C5zkCWjAmyIEnnFUsD1z7mqE5iA6W5GtNAQzqLGkulkXBiT5/415kyduH5Lvoe
         i0BIFp2gJsfpPzbUsQqbckTAmny7huIIPjl5rLK0jthx5rKT90rl6TDynv3Na7s6hr2L
         lnfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G0v1Ihf7IbhRPcZy+imyWJp1IXE2R+G+DgDPALxWRug=;
        b=zI/71a0k7E0PUMZ5m6Uu0UwPVh9Q40XcIoQuh/h1upN996H5W+5wUoONu5J8jXGqF8
         7CLgNNn0wbX85HgXSzeQxxxKWKubvySYlVPTDaKKep1X/uel2Ca6N4E4S0Q1d5yKN+xA
         uut4KMketgxhp6DAp2yY4HKQACeXBA5/7AMehyOuGqp3CGGfu0pn+JPYQ/tKmZh4k1Rb
         u8X5dlJ9cEWPiuQ6gkeiv/UTBwpiHaP4H8jzqQeSViGZtEDIk8N39A0BvbyRZ+HzDotE
         RxNRF2nh2CWCzbBH+b8/tLwkLfG7amegCzkUo4ljxY1YUPnFTb44cmE38bA2E2YQl5g6
         zVrg==
X-Gm-Message-State: ACrzQf2KE9adJSJjYKWvJOEn1lB6mWFIGMtjere6xR8y5kZxHiPuiv4n
        roi0DAxXKGaJiszWGqzb3kAwJIOQeswbBcjFKOQZlQ==
X-Google-Smtp-Source: AMsMyM5+YIb5WcPonX3BbSu7QbDjs9NGFO/TiKoL63AIZokQQx4ULc/df59gNSHd9jMlS8R4Ow6RV5vZ3bkDcpbpo60=
X-Received: by 2002:aa7:c98d:0:b0:45c:6451:320e with SMTP id
 c13-20020aa7c98d000000b0045c6451320emr9540860edt.172.1666001498015; Mon, 17
 Oct 2022 03:11:38 -0700 (PDT)
MIME-Version: 1.0
References: <20221010075615.43244-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20221010075615.43244-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 17 Oct 2022 12:11:26 +0200
Message-ID: <CACRpkdY1+COv7FXqJaNBxivbzrCVbnOsYKwhbbm3OG479EAe6g@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] pinctrl: st: Switch to use fwnode instead of of_node
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 10, 2022 at 9:56 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> The OF node in the GPIO library is deprecated and soon
> will be removed.
>
> GPIO library now accepts fwnode as a firmware node, so
> switch the driver to use it.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied!

Yours,
Linus Walleij
