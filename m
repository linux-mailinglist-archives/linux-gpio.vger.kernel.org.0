Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A84E580E65
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Jul 2022 10:02:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238100AbiGZICh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Jul 2022 04:02:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230370AbiGZICg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Jul 2022 04:02:36 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3FB52D1FB
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jul 2022 01:02:34 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id b11so24655394eju.10
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jul 2022 01:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=tqRCRe4eX+VkGHjaxOX6NtuRPCa/urbMxkt+QthVPS0=;
        b=OWITSNRKHM8Fga2M8WOo5srtID0NrtHoyp47A1Ey1jYEfyBzDqOc8NsHA03D/MAFtn
         iLdackwCJA9q49X5e1VXu0aOlU/R9e6gz1qT+KOIBIVzsr/3j54IwXb18J1BZ12AYy8Q
         lPzXqW7MVb1oCnw3P6+llwraCJCuSTnYWWrJ61LTjl8Xy3UWoNX/avOpzlTHOFKOjyhr
         ZjpYxuyuEOu8/LXS4xkxc6FAb732y1h8csYmfbolGsmNnCQmViIZQQ6Sjb3nSZO9oCQL
         mfKDOXy1kRWb3mxiDXlj0BH2wnyST+SeyltucNcgl4ctzR3Lq+f3qylxWL+4iUaetFcP
         0cfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=tqRCRe4eX+VkGHjaxOX6NtuRPCa/urbMxkt+QthVPS0=;
        b=YkoX8wuy6pRtOXWj/MnLl3rOS9h359jiL2JaEuxBzj+6TyAkZLjQcTk/YOEzD8NzKR
         bEAkCQPiOPdn4H+J/j6LtPyuLrKNS8/QXR4Ja3betct984jIefTJKagGAxk0OWsVfHQ6
         r/kwvCiMrp8AN2A+KAlD7jBzcdKel8rO57hl6dmXOcyitigrmBds0xnSb9qicyOuWB3x
         ZeLO0hBTFxWlVEQmgCGZWMEVE8ZmrCfutul8F/AiHoLQjF0ROD50eENsh4KPsl8QCU3y
         QiDes5YuynuCXnQ9u3jm+Hlk0TH3SDsQsh17bPgNXtC5nJf/yIlYgCX22On16IiBiv0a
         2MlA==
X-Gm-Message-State: AJIora9yESD9/vMaOD3ijH5EWOB4yRQQC3CiBb/dP/6hn1iAvJZuxS27
        yvG9H08K7EbBm7RtIDkOBrm8JvfkhmXOQCnbnRn8kg==
X-Google-Smtp-Source: AGRyM1usXww6QrDgVRlTV20uypXHuu5RtRCNDP8/S0/sCysg10uzzGGC0YEhdHtviVWo89ng+KSkTUQy5BgNPCfu3FE=
X-Received: by 2002:a17:907:a053:b0:72b:3051:b79b with SMTP id
 gz19-20020a170907a05300b0072b3051b79bmr12564833ejc.690.1658822553187; Tue, 26
 Jul 2022 01:02:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220722220810.28894-1-mario.limonciello@amd.com> <20220722220810.28894-2-mario.limonciello@amd.com>
In-Reply-To: <20220722220810.28894-2-mario.limonciello@amd.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 26 Jul 2022 10:02:22 +0200
Message-ID: <CACRpkdZ+2XCSJo336+=k_fxmPxu=M3KZJofKfY5JqPXGoKmnYw@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: amd: Use unicode for debugfs output
To:     Mario Limonciello <mario.limonciello@amd.com>
Cc:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jul 23, 2022 at 12:08 AM Mario Limonciello
<mario.limonciello@amd.com> wrote:

> The output is currently split across two lines making it more
> difficult to parse unless the newlines are removed between pins
> or it's read in by a parser like Libreoffice Calc or Google docs.
>
> To make it easier to follow to the naked eye in a terminal window:
> * drop the newline in the middle of pin definitions
> * shorten all output using unicode characters
> * align all pipe delimitters
> * output the same phrase even for disabled functions
>   (but with a =E2=88=85 character)
>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

That's a bit unorthodox, what happens when someone uses their
old VT100 terminal to look at this file?

BIUT! It is a debugfs file, and you folks at AMD are going to be
using this and I just assume that you folks have aligned internally
that this is how you want things so I just applied this.

We need testing in linux-next for this anyway, the merge window
is close. If the other AMD people don't like it for some reason
I can always pull it out.

Yours,
Linus Walleij
