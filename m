Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53CCA663A59
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jan 2023 09:02:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229718AbjAJIBv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Jan 2023 03:01:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237825AbjAJIBQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Jan 2023 03:01:16 -0500
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0414012AD5
        for <linux-gpio@vger.kernel.org>; Tue, 10 Jan 2023 00:01:16 -0800 (PST)
Received: by mail-yb1-xb29.google.com with SMTP id 194so8738285ybf.8
        for <linux-gpio@vger.kernel.org>; Tue, 10 Jan 2023 00:01:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Syhe5qiaIjSBFG2Km8sQLkXZ7+IcUvywGS7mxhOdyC8=;
        b=h8msePaVrBumKX97x2B0PSR6TvDOsWe9/8nqh5XihvwDoXTtk9FBZwWi9SGSCEBRhG
         7/DaMnVE7Es9JE+fi/ZufWNRn3SVsefXqDFtOkwD+Ed/1n+1GkLPK41O5WZ9mPWSES2v
         f2r7VoFC/JUpyNH/AjASUjjzFSSJJGSeDu8P0hf/uwWu23QmfIzx2XiqyQ6OJiQN9PHD
         149PqrLlkoAPipdJCnTgOfjLXophHrfOY9gMAuDquWjeOn/L+6h+V67p9U6Kx6n30/4V
         ejnsJ2avQhToeqCtMDJvMa1apShJXDMArCkB71Hc9pSOnNH06CBn68PiiOFiJnzo9oV8
         AhgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Syhe5qiaIjSBFG2Km8sQLkXZ7+IcUvywGS7mxhOdyC8=;
        b=gIn9qtxoQOd54q328Y/rc0gcNoiysCoZTDmlYF7atEhPFYfkBseUjCaE3l/QqiMwea
         yDZnztbPq25bYCvXKsrgKvxvUXn404krIUc8gfkB+XT9f88fp5HD5Ou81KqXTNge7OEZ
         ZwZA0K9GhheMvJiCE6EzRjTG7UpVME3erwPoYQROl6UFkZq4eDiAQZskAtZJ/WpzW4KA
         CoW/o0hcHcGB2sIisNvYbmMJPc9NbC7k+2CSZWFPZf8HPnBz2bSwEkJfHxD91oPYXqXW
         mFbU13SjntvsM5f1PBR44DXNd1Q8g+AlOaIbv1mSDSlNmBTVwpDh57edobKCOTUP8zgL
         jozA==
X-Gm-Message-State: AFqh2kok8KWeifeQU7+sMYmJtzIGjTd1sS3vwY5aw8gTiY+s5v5/1m8j
        0OtzqcTF/LsDQ+85vAiFMO47m/f6A0zsNvDYwj8TtQ==
X-Google-Smtp-Source: AMrXdXuR10boH/lNX1LwBHz0WFKJXh1kKoJB/SGPz+CUqB+rn2oNZjU4enURpt5dnuW7TPgvAxY7C8PahF6RsX7ajp4=
X-Received: by 2002:a25:6982:0:b0:700:e0f1:6335 with SMTP id
 e124-20020a256982000000b00700e0f16335mr5998016ybc.520.1673337675188; Tue, 10
 Jan 2023 00:01:15 -0800 (PST)
MIME-Version: 1.0
References: <20221118224540.619276-1-uwe@kleine-koenig.org> <20221118224540.619276-511-uwe@kleine-koenig.org>
In-Reply-To: <20221118224540.619276-511-uwe@kleine-koenig.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 10 Jan 2023 09:01:04 +0100
Message-ID: <CACRpkdaViC8T5qFRW+=+rGST=nr9beQJqTP7d42OoYUnhPhqig@mail.gmail.com>
Subject: Re: [PATCH 510/606] pinctrl: mcp23s08: Convert to i2c's .probe_new()
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <uwe@kleine-koenig.org>
Cc:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        kernel@pengutronix.de,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 18, 2022 at 11:48 PM Uwe Kleine-K=C3=B6nig <uwe@kleine-koenig.o=
rg> wrote:

> From: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
>
> .probe_new() doesn't get the i2c_device_id * parameter, so determine
> that explicitly in the probe function.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Patch applied!
Thanks for driving this big project.

Yours,
Linus Walleij
