Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0EE05A0FF8
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Aug 2022 14:08:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237197AbiHYMIl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Aug 2022 08:08:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234589AbiHYMIk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Aug 2022 08:08:40 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F5EBAA4DC
        for <linux-gpio@vger.kernel.org>; Thu, 25 Aug 2022 05:08:39 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id b16so25831494edd.4
        for <linux-gpio@vger.kernel.org>; Thu, 25 Aug 2022 05:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=TolwNg/wx0BhjmILpbscAwoASK3Z/Nrde9QjMCFbj7Y=;
        b=FU0JAd34mB6ckFxckBeSEVG3DUKXpDBtb+oVBz9x45986hMZ4ClFEzwuqvwWY1ueYz
         uZtrPLDRA+2wnAl0oU44tspm8EEBV+8PV4W87nFDlnxPLFgGN9r8cTCue4trJAbU797y
         pttlot+ScBBj/ktSNbox2r+P8KSUVHceQOiEUqYNVbgd2Z01zWcnjLmZMUd1ONHm4AOV
         g9RD+rJBf8j5oUVbYgxotijsVTyN5zJORRMe2fXTJQxvIKR4FXH8OBzQKSVWoFVwj43r
         uxFJMufxYlHMsn4NI3/qjMmBBm6AkO4zgAQVoadCd0s9MQZ46xrAK1PKz7zjeAv/uAR6
         OaVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=TolwNg/wx0BhjmILpbscAwoASK3Z/Nrde9QjMCFbj7Y=;
        b=5sITSB9Mp1L1llno5T9Rzjsw48rM801KUOz9nn73SClDwlOdUDi7PgXVhFPnAwM2uB
         x0zpe8vSomSXHwoJtrjz0chQKtpbEwr6R/9DoAQLyMpErYsXAfsnV0ZR6kDTWbrkeUKE
         xZtUPQcLci+CU9q/awbM6Y7MB6ip/yACMtotfR/+oJVZYhWv1XU9hGFtT9F4ErT17pND
         CQwrgtOP2dd2N7MMf6ZfoETjyT4jwIb7i50CBD5g42sAcRBBP0yuyupSUMQEFoCkfy/I
         JerFN1eVKD0K/LAEdP8R7FgcYOhMy1nT4NYw/S7VjAjTE3qdDoSfXD08jf/hDPBBT9Oz
         hv5w==
X-Gm-Message-State: ACgBeo2cs9eP9jso5c+AnSn6FCiO1N2DPBvrVy8mjfkTt+vL8m0igBtP
        DbiLdUHX9/qj4Y3C3zrg/LPLdhkaonadu8/2N1vpzg==
X-Google-Smtp-Source: AA6agR4nN1PE1GuW5na5F7GWkxxXtSEWynOGHSi1uR/KtVxpLS+JeugMHolJGMCKawv6M+VDxbHWHMoTccam5p3hfNs=
X-Received: by 2002:aa7:c84f:0:b0:446:2bfb:5a63 with SMTP id
 g15-20020aa7c84f000000b004462bfb5a63mr3013820edt.172.1661429317773; Thu, 25
 Aug 2022 05:08:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220727013349.3056826-1-saravanak@google.com> <49e4f45a-51da-ec4c-9ebb-dfa022bf8a88@linaro.org>
In-Reply-To: <49e4f45a-51da-ec4c-9ebb-dfa022bf8a88@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 25 Aug 2022 14:08:26 +0200
Message-ID: <CACRpkdbS2SGUMktB4a8T-cMW5d=s_BiygrSmAbOix=BUg0JOSw@mail.gmail.com>
Subject: Re: [PATCH v1] pinctrl: samsung: Finish initializing the gpios before
 registering them
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Saravana Kannan <saravanak@google.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>, kernel-team@android.com,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 28, 2022 at 10:32 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> On 27/07/2022 03:33, Saravana Kannan wrote:

> > As soon as a gpio is registered, it should be usable by a consumer. So,
> > do all the initialization before registering the gpios. Without this
> > change, a consumer can request a GPIO IRQ and have the gpio to IRQ
> > mapping fail.
> >
> > Signed-off-by: Saravana Kannan <saravanak@google.com>
>
> Looks good.
>
> Linus,
> It's too late for me to pick it up, so make you could grab it directly?
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> Otherwise it will wait for merge window to finish.

I sadly missed this during the merge window, as the commit message didn't
make it look like a fix or something urgent. (I don't know if it is?)
Just send me the patch as fix or for -next, I let you decide.

Yours,
Linus Walleij
