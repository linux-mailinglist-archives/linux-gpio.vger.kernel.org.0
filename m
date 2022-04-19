Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93637507C87
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Apr 2022 00:29:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239263AbiDSWcQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Apr 2022 18:32:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357935AbiDSWcO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Apr 2022 18:32:14 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54DD724953
        for <linux-gpio@vger.kernel.org>; Tue, 19 Apr 2022 15:29:30 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id i20so33636104ybj.7
        for <linux-gpio@vger.kernel.org>; Tue, 19 Apr 2022 15:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0zuM8nG3cO/PIrYntUrSlVCavn8HajJfWR83dwgHZAc=;
        b=AEzZ3A+hYTUIe2NVJP4fLIqhDcK5nrkz96aAW5rPNMWVHOL6auQw/UJzivY1DPSTMG
         5Ye5NIqaoNDEg5Tp+k1mWWsOCubuPU+12Oc+ZvK/P3q5bkRKm0rM2mu9MDpIaBz5uuCf
         ZnlZsin2jE0HZBC5+dMstkMb2ifchEVWfHeenolfT0xlWNO/J4IbIDitzDb8vNCmvRF+
         fWrddoLgPMRm0mKXgiNZKqid006Vyc83gK5BGC21epHcKPOE/ovBNDrhQKIcST1Qorw7
         nxsex7fILKVqmsofxa5jVswd2WmpRiR16BR4M+ILpBg7dnx5rFLkD4IFstgTuXeVUTFf
         8c2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0zuM8nG3cO/PIrYntUrSlVCavn8HajJfWR83dwgHZAc=;
        b=UEGpGADi00pTfySe2vjCE79KtOhkM5w1fUOmdhJhHmUVIe3ty1zoJZbEwkKh6tKcoZ
         5X5JpKDg9i63Gkp47MJMqvd5VX3YxmRA/9FLh9hHJAKJYdvdiflOkE0oDw3IMxLDFEAH
         MFlYOLkKEJf12CjuGQmyMSHjv/TO/Jkc+5VDWl9r2vlz5lscxS6AmHDRdvXyzzJxMZFW
         rp0ASY86tnDROUs9Jiqw2htDUX8s829jzGC06HvVAkoL3edgXzJ+20S2JDkyftQttz64
         o7Hh2QZFBIl0RS857xvS+XunHcxLkeJDNv4/OdbRXgSjRTggEFTHZ/3PY/DfB7Jp3iDm
         s90w==
X-Gm-Message-State: AOAM531TUknJ9sZ9WNcPDxHAdzT1+aPQrNpLdRYjcPWv7snFoKT3Eg8I
        +4+f7pmaqY3wZTjSN2BcwHo6O0K4jzpRTR/b3twogw==
X-Google-Smtp-Source: ABdhPJwuKxur01PeTRkyAKAb3csKYu1uHrzCQnsagqH5TZXwlCPlmSMxIVklVK3WVDZu+Blt4aWf1HFMxNUZWH2UJVA=
X-Received: by 2002:a5b:8c8:0:b0:641:e8de:a6f4 with SMTP id
 w8-20020a5b08c8000000b00641e8dea6f4mr17166614ybq.533.1650407369452; Tue, 19
 Apr 2022 15:29:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220326192848.2944519-1-michael@walle.cc>
In-Reply-To: <20220326192848.2944519-1-michael@walle.cc>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 20 Apr 2022 00:29:18 +0200
Message-ID: <CACRpkdY26vNvmcv+NCuoyp9QGXWX0Ad_g39J7XZm94tQAt7P7Q@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] pinctrl: ocelot: add pwm output option for LAN966x
To:     Michael Walle <michael@walle.cc>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Sat, Mar 26, 2022 at 8:29 PM Michael Walle <michael@walle.cc> wrote:

> According to the reference manual, you can mux the PWM output on GPIO27
> and GPIO51. This was missing in the pinmux table. Add it.
>
> Tested on a LAN9668 on GPIO51.
>
> Signed-off-by: Michael Walle <michael@walle.cc>

Patch applied!

Yours,
Linus Walleij
