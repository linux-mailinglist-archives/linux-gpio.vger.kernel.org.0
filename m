Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B5366AC0B6
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Mar 2023 14:23:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229927AbjCFNXW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Mar 2023 08:23:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229619AbjCFNXV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Mar 2023 08:23:21 -0500
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72AE5DBE8
        for <linux-gpio@vger.kernel.org>; Mon,  6 Mar 2023 05:23:20 -0800 (PST)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-536cb25982eso182898697b3.13
        for <linux-gpio@vger.kernel.org>; Mon, 06 Mar 2023 05:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678108999;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A6UPnvKq09Wou2+IQachtCQ63VCTkOWQC89w6AgtMPM=;
        b=BxnBHQDCamtmwpqCeExj//dagBQrW6HHltyHkLJJEamdTia5Xi3n1MMpVx3WQN3uTR
         ++YezTuGdjOjToEuahsL0RuqU5p3n0m5PcyMnLBFdxYJlMv07cHkeflOgYGHj+U1bJzC
         5o6Hcyf6d4uLkUYn/ZXjxOlQELveWzV6ouKvFCfMQ4oYWN8rZfsPgdymBeKkzD2KHtAb
         UeNdBSMi5GkrILM+YioOmOir9B39Uo/4hHJgZI9AX1n2up1lP/HMwHUKOwKJaYdpSKEj
         3hBlTqD/qdxoHSyUXuHIYg8OK+VQCWZTcGPgT3w+4bHF16ibOB+o63mSYJG1Jh6raUR9
         mMLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678108999;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A6UPnvKq09Wou2+IQachtCQ63VCTkOWQC89w6AgtMPM=;
        b=1IHfJgUp0r7yP8pWSoMrG/MRjiEZ4ttJ9yIFbyCT0bOFCJUmNRYE6SsUuSV+CAH0F3
         BFgTftGeMG441VigjNuHC5Aq4nTxEZn70TqnSWvegpC5o8MuI6MnP+Yqy/2H5+RtUzVI
         UbyG69CtVgm9xw4erSep6lx7TOhwJLVeQC7DNBo1/YQfL2RULW0GrHw8WcQ4BOUei//D
         K3TjSDyWr6h2NslDGqjqqfkAhmR0Zx2aXOc/JtFccgEOdkcrkKTyroLZmg25EPr9TW/y
         9U88GSiKBSXp3HsZs2wyjIC9o/0zUqDoVqlAHtlp6+pUytFqX6YLYDLXqxR5LilCUhlX
         znbg==
X-Gm-Message-State: AO0yUKXfPz+iK5adWX4Dy0nPzOZiRERr217UHyqLZgwhopXbk4b1qhPm
        5iXjvNWwxDYVRmVU9hN9bEEFLQpObnPqoR2Wh6K/tQ==
X-Google-Smtp-Source: AK7set/s6kdSu1VcFIDUDDAjhyT5WX5VXxR9fDOOK3NMP0aCh1mWegJfszBB8kiuEvAwn0UNiI+jPIKsmpqnhlWyXBE=
X-Received: by 2002:a81:b61a:0:b0:52e:cea7:f6e3 with SMTP id
 u26-20020a81b61a000000b0052ecea7f6e3mr6509470ywh.10.1678108999681; Mon, 06
 Mar 2023 05:23:19 -0800 (PST)
MIME-Version: 1.0
References: <20230218065108.8958-1-arinc.unal@arinc9.com>
In-Reply-To: <20230218065108.8958-1-arinc.unal@arinc9.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 6 Mar 2023 14:23:08 +0100
Message-ID: <CACRpkdY1xPVd1dTch1jvP6Wc27977Qm7GJ9fKffzhF9odHWG9Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: mediatek: add missing options to PINCTRL_MT7981
To:     arinc9.unal@gmail.com
Cc:     Sean Wang <sean.wang@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
        linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Daniel Golle <daniel@makrotopia.org>, erkin.bozoglu@xeront.com
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

On Sat, Feb 18, 2023 at 7:51 AM <arinc9.unal@gmail.com> wrote:

> From: Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9.com>
>
> There are options missing from PINCTRL_MT7981 whilst being on every other
> pin controller. Add them.
>
> Signed-off-by: Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9.com>

Patch applied for fixes.

Yours,
Linus Walleij
