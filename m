Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A9934D911E
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Mar 2022 01:17:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237561AbiCOAS2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Mar 2022 20:18:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233869AbiCOAS1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Mar 2022 20:18:27 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25F2141617
        for <linux-gpio@vger.kernel.org>; Mon, 14 Mar 2022 17:17:17 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id h126so34182620ybc.1
        for <linux-gpio@vger.kernel.org>; Mon, 14 Mar 2022 17:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=1ArQOZVxzenABbqYZHdwfKyfyMVaevwYMywHZpJf/2c=;
        b=UkQj+FJPHmbwWu93FeD2QPZ0A4J6B+6JMEsDc0esiQoIJHNJtuG4RyGxU2+lfJM040
         p/4A0MliIJ3y3C8BGQd0Efhv3QUlD1jBG90dISCm9c6iV0oLoeE5NIGFA8ivdG71fjoj
         CxlBU2P/LyrsCZWFuITbHFk7WIYiPNTMuDns0C7TUqSvkyiK9s4oOguB/5AZgJZs+VjE
         igr4MruwLNtWN6+b0nb5FkqHbJ2fgXZ2Hh4RQ62LF8VjI4GkYqBEc0QImgoexZvgMdIt
         BswSgrRPFYvdX/f9a9F+ZVAjCcwzMYVdAYwlmEPCrP0CEsSz/Srk8t9yOuslom5Y664O
         m0AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=1ArQOZVxzenABbqYZHdwfKyfyMVaevwYMywHZpJf/2c=;
        b=OzoEuEKACTV3oQ1G3OsRRZk4srmnHyQbGnI9qUCVGh8OZYQO/6jx/vOI39C86M81JY
         QQnjDqNtB70lcNYPI35dJOzTVmbq53Y6IOie4VeS4RSoj3qk1mDOMxg2z9vwQ071QLKR
         yQo3TB1Anutnf3kxSoLXb+TjEheds0UaIyVXNKh7iR0sJUOxLKbs8XO82PsB1VcVhSF6
         T1uQjcecYoWdw4EhnUG/iTgXW5yBnnDfSHgWJHL4jsy80eKmjSNpn1JUt64EoN//izyU
         h8M0hGqtL0vqRwmhWs/tz3YSww+qVRfdHssUvUbwlIZ8W8rc4jlRZdzBaJ3JeTOa53ZF
         5SMA==
X-Gm-Message-State: AOAM533ynUI32cCxAmSyszlKKWZku+P6pWPz3pFnfWsFI6VKCiVqdaG0
        nUMN1NS83n/kDpxO4deMebQFxSpum+FV36pPauudWg==
X-Google-Smtp-Source: ABdhPJz+8PCSwlfdQdIRRiqji2nDXgp0V81YBZrYP89nUdOUaEu7WIwbyG1lPyLfbQKvd4oNQlgu3RKgTq1/HgIJ0hc=
X-Received: by 2002:a25:e710:0:b0:633:67d3:7264 with SMTP id
 e16-20020a25e710000000b0063367d37264mr3428789ybh.291.1647303436407; Mon, 14
 Mar 2022 17:17:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220129115228.2257310-1-j.neuschaefer@gmx.net>
In-Reply-To: <20220129115228.2257310-1-j.neuschaefer@gmx.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 15 Mar 2022 01:17:05 +0100
Message-ID: <CACRpkdahSbWv4q7hoBAm_4+oKPEui9zX5-4m6wvPWfonWpbZUA@mail.gmail.com>
Subject: Re: [PATCH v5 0/9] Nuvoton WPCM450 pinctrl and GPIO driver
To:     =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, openbmc@lists.ozlabs.org,
        Tomer Maimon <tmaimon77@gmail.com>,
        Joel Stanley <joel@jms.id.au>, linux-kernel@vger.kernel.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Avi Fishman <avifishman70@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>
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

On Sat, Jan 29, 2022 at 12:57 PM Jonathan Neusch=C3=A4fer
<j.neuschaefer@gmx.net> wrote:

>   dt-bindings: pinctrl: Add Nuvoton WPCM450
>   pinctrl: nuvoton: Add driver for WPCM450

I applied these two to the pinctrl tree. Sorry for taking forever
to figure out that I needed to do this :/

Yours,
Linus Walleij
