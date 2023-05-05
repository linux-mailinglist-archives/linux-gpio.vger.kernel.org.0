Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 197E96F8215
	for <lists+linux-gpio@lfdr.de>; Fri,  5 May 2023 13:33:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231200AbjEELdQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 May 2023 07:33:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229591AbjEELdP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 5 May 2023 07:33:15 -0400
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AAED61BF
        for <linux-gpio@vger.kernel.org>; Fri,  5 May 2023 04:33:11 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-b9d8b2e1576so2212033276.2
        for <linux-gpio@vger.kernel.org>; Fri, 05 May 2023 04:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683286390; x=1685878390;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eEGNYX7B4JI4jRGoa7QlhYv74qRqKgnhqCKhkd90O8I=;
        b=HLuZNVVLPwGSb1IXQfiPRGftND/O6MPHi+NOsDa6T/Xe0h78hD+XgvAb+PD4pLNLdt
         V3nSjZP4+MNmZC2/4wSh9Bty8mEGAnsBDNHMONn3rdd+gFLm7XDpOAHvZMuGQlOXdPA8
         ji/sLAPtUMEjI/aoLpnCrTCNVk35XZJ2ARJuqE3Numvoav59aK3jMB6B5jnAtpPrW35K
         2grbl7WO41H2oBsyabxvO/tE43sQ1MDksEdJ+D3ZqHP3heVXqD99hSKLVCCC8ZD7MDWg
         aDtpOZknIeAvX7raWChmTI9g7V/Wfhl0KZKxSe4i5ghOBW43GGZaDwCPoz9mNGkD9crr
         JT8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683286390; x=1685878390;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eEGNYX7B4JI4jRGoa7QlhYv74qRqKgnhqCKhkd90O8I=;
        b=aVUMVZfBzQCwUKSKowzM8nTMy9i5uOWP00pmD2PraBMKH3NMYbk583C/93VpQ4qHME
         6bT0jbv4rW12PB0HaV1Mdx8tjSS2tGjX8yaqBYxYzlurEMqd53SwNs0hygHD0+2B1Uod
         pHRm1fD+dRS+HA167DMs/4eM/lE1XXTsmOUGfZ5UxpQNL1lZjV9Pc4eaHGIJ6kD5dkWq
         m0iVy6zeZt1dQNfcuxbs9/7xQ0HP9vkMIgf/VWFdYjOO/g870jaBXa9+SSgkSF2TtQhZ
         3F9fvM66xmFcaKmJ9XYiXbhiNLBWzJs36d0ZOW2gxcYNkJfvv5PLZuxLWsJN+WOJYRmL
         pg1A==
X-Gm-Message-State: AC+VfDxLdr5QBVvTcH0/ssYT4q80oGZgXXk31QVARYEWBD7q1R8AsiJs
        9qu1pZZVy7IsP6Gl9TyMu/gKbTWmpmNIOc8/X+dRLZC9xtGxeDkLDSc=
X-Google-Smtp-Source: ACHHUZ5MsNzijV3ogn9HObiSYLZ1/52JkQ844uBoOq4FvoSktTDWWTAgjbHZIBwqGAqKxEwSNX9BEoYzA22ixTZC4J0=
X-Received: by 2002:a25:a8a:0:b0:b7e:6685:84a with SMTP id 132-20020a250a8a000000b00b7e6685084amr1274015ybk.1.1683286390567;
 Fri, 05 May 2023 04:33:10 -0700 (PDT)
MIME-Version: 1.0
References: <CA+1hoUVnw7kXB15rzK=tQdX2cyGMoXEgThOiqA=pYDwqF6TAwQ@mail.gmail.com>
In-Reply-To: <CA+1hoUVnw7kXB15rzK=tQdX2cyGMoXEgThOiqA=pYDwqF6TAwQ@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 5 May 2023 13:32:59 +0200
Message-ID: <CACRpkdZ5jq=wCtJs1oRLwvMDysca2ECxGyBoCrxq0GrMXyA37w@mail.gmail.com>
Subject: Re: [PATCH] tools: gpio: fix debounce_period_us output of lsgpio
To:     Milo Spadacini <milo.spadacini@gmail.com>
Cc:     andy.shevchenko@gmail.com, brgl@bgdev.pl,
        linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, May 5, 2023 at 7:57=E2=80=AFAM Milo Spadacini <milo.spadacini@gmail=
.com> wrote:

> Fix incorrect output that could occur when more attributes are used and
>  GPIO_V2_LINE_ATTR_ID_DEBOUNCE is not the first one.

Nice patch! And correct. But hard to apply!
Can you resend:
- Including a Signed-off-by: Milo Spadacini <milo.spadacini@gmail.com> line
- Not using HTML encoding
?

Here is some generic help on sending email to the lists:
https://docs.kernel.org/process/email-clients.html

Yours,
Linus Walleij
