Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE7FD4BC3FF
	for <lists+linux-gpio@lfdr.de>; Sat, 19 Feb 2022 01:55:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240693AbiBSAzP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Feb 2022 19:55:15 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:39202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240695AbiBSAzP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Feb 2022 19:55:15 -0500
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4D26278284
        for <linux-gpio@vger.kernel.org>; Fri, 18 Feb 2022 16:54:57 -0800 (PST)
Received: by mail-yb1-xb2b.google.com with SMTP id y189so1135440ybe.4
        for <linux-gpio@vger.kernel.org>; Fri, 18 Feb 2022 16:54:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9Vx+WPjk3Jqu/26mjZeRumiFftkfvBsbmk7u8x9gYoY=;
        b=R9puxGJ7+Pr8wR/uUccCrfAZoWcAAi1ZN6s1pGy9Gak7AQvMqOSH8LAhEjcn5CCCOZ
         noZmvNx/A+IjYcwWlom8/Ju1AK19wsZMF9LzmKV8bHUfeuyTMxNArJ0/s1CS30KgXoeU
         VCZHCHAzv7G5GSamfnD23A/TjvvNgrRHcMCMVR5forkuuUPcNXjX6VijmO9+5wbbVjJS
         kQSE1PXZ3paLguxz0QFxj+28GBv0+8jQeSJ4uy9l9CdexXEzbEd03znbqoQgU45/DKUi
         km+AMtEzkSYTV3N0hi7/Q7/ziITi1gP4hM142X+T6oKUw+/gZeUonk4LDW5RR+yFfAk1
         KpaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9Vx+WPjk3Jqu/26mjZeRumiFftkfvBsbmk7u8x9gYoY=;
        b=69QXwgufOiB/6IpnGqlPGKq9Q1Srg7Uq+C0LILR4dWiBbFqdmQQlk7ebPSg08Gs4Yb
         q5UCbfKw9wB7k3NjP8SIJAEjNpBkeDIv4BFlE3RGMkjEOCSB0ZmdQUY4lcDFq5+339X3
         cJ5yqDgwyJxhdyIYFxvnxX7hgSoGotfX1kAu6UxSWUAgF4g86+9jB0ETpjdtUGcObwFL
         qhSQla/3uzaapQoy5Tk4osExYrmS41yatd8AwifV/YlU1olmsb/GImeFAjAFo3SWKrQY
         8Ij4pLAwMoS0snu82mTCVXph120761D6SZkb7CT7EaI+aMv12txWBDLNdG3lgZZuCM45
         yR3A==
X-Gm-Message-State: AOAM5315Ibu0EP9p8k5J4PSJuBgAIE5VedgqBPEWOY283+x/Mnhgbct8
        1ztsJWyoQQA7DL26HBcln1ppVtctj1t3JC+9+IJfmw==
X-Google-Smtp-Source: ABdhPJwQCzUoixTMtsRur9qzlG1qSn+Sx4LgwajsEMFV5UPE5DKIly0PKpV1NusJBRnndSql78KQlyW9+v6HfFngB7A=
X-Received: by 2002:a25:a123:0:b0:623:f539:9b94 with SMTP id
 z32-20020a25a123000000b00623f5399b94mr10088403ybh.291.1645232097187; Fri, 18
 Feb 2022 16:54:57 -0800 (PST)
MIME-Version: 1.0
References: <20220210131210.24605-1-jonathan@marek.ca>
In-Reply-To: <20220210131210.24605-1-jonathan@marek.ca>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 19 Feb 2022 01:54:46 +0100
Message-ID: <CACRpkdYPYJoteTR_zoSr4CZZiCEARu-wE4_ruN6gF8EdT_X6OQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: qcom: sm8450: Add egpio support
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
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

On Thu, Feb 10, 2022 at 2:14 PM Jonathan Marek <jonathan@marek.ca> wrote:

> This mirrors egpio support added for sc7280. This change is necessary for
> gpios 165 to 209 to be driven by APSS.
>
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>

Haven't heard anything for over a week so I just applied the
patches. I assume you know what you're doing.

Yours,
Linus Walleij
