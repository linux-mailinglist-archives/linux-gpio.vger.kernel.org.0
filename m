Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D5156F4D44
	for <lists+linux-gpio@lfdr.de>; Wed,  3 May 2023 00:54:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229799AbjEBWyk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 May 2023 18:54:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230423AbjEBWyf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 May 2023 18:54:35 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6A0C4231
        for <linux-gpio@vger.kernel.org>; Tue,  2 May 2023 15:53:57 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-95369921f8eso726097766b.0
        for <linux-gpio@vger.kernel.org>; Tue, 02 May 2023 15:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1683067971; x=1685659971;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gGYH0ymg0qnLFd82gKT1P94uLDse1D7zbN1XWJORZiw=;
        b=QnXN9O8C34S56M2OAsAlKoXDBRkYb2yIYWuKFXvFx6HmeHm+ce0Oi60SCQtsZzE8B8
         f7xZFiyA1JKY2wk1HIRqk2/OSfha1h/lfH4DcF9LTE9+FM0R0/pU32P8nwyf3TSK4Opy
         7DSQXC4aGiwiwFBSmszy0Sb/KQsTvWJiLNZ5s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683067971; x=1685659971;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gGYH0ymg0qnLFd82gKT1P94uLDse1D7zbN1XWJORZiw=;
        b=YgH0TEtcIpC4spSeEgTWPsKiNMBu3YW4A5/1X6c/F2s3Mv/qhNTGeJwBNtzsL+M0CT
         Y0sy3qdc8vqGZtsv9lnfGmi5bij0+P8hoOfEHnHYP+7CBy4eRBfCcKEKIddY2SQyI3SY
         I5/fiYQxvNXLOiQa/UGURqvBXp8g6l3cHv9/qpcjZB9Y97bAOUyGyjWqn5Tk9dTfUdXO
         4u2W7mtiq7u8We4EbZKU2LCsdsCqjTph6E6AopNqLzMFHVUIwwJXdun+RtGzVPL4IK5r
         Fj97f8IiK6EPxuHHmWxN0OSQippsye02gWCT3mmTodRP0NScnkNHUcB/eLjd1J0+NIq6
         5jiA==
X-Gm-Message-State: AC+VfDy+4FM9QSh3GqGCbrzoNqKyVeqvTBHWpbmvs7hPoUpgC4Vb32o6
        93JztHp5FZsqk8qI93SVSIq4u8rnUzi20s1aNeQh9w==
X-Google-Smtp-Source: ACHHUZ70j3bT/nunlxjsD1wTuSANodBkyMYNMZM2ylkAyKN30LfiYFysxGhIFKTz5Dp/Z7gW1/epkw==
X-Received: by 2002:a05:6402:183:b0:50a:11ce:4d24 with SMTP id r3-20020a056402018300b0050a11ce4d24mr9196457edv.15.1683067524288;
        Tue, 02 May 2023 15:45:24 -0700 (PDT)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com. [209.85.218.51])
        by smtp.gmail.com with ESMTPSA id b18-20020aa7df92000000b0050bd59fd0efsm36240edy.49.2023.05.02.15.45.23
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 May 2023 15:45:23 -0700 (PDT)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-94eee951c70so723516166b.3
        for <linux-gpio@vger.kernel.org>; Tue, 02 May 2023 15:45:23 -0700 (PDT)
X-Received: by 2002:a17:907:608f:b0:94a:71b6:c007 with SMTP id
 ht15-20020a170907608f00b0094a71b6c007mr1579397ejc.8.1683067523093; Tue, 02
 May 2023 15:45:23 -0700 (PDT)
MIME-Version: 1.0
References: <CACRpkdZ=bpsSKKgqGbGThvVAZc8fEx2vStbm9GUaZ5s1p5YGmQ@mail.gmail.com>
In-Reply-To: <CACRpkdZ=bpsSKKgqGbGThvVAZc8fEx2vStbm9GUaZ5s1p5YGmQ@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 2 May 2023 15:45:06 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjznm=EdyP=oeMoGUaTad80RZSOzs-iCWWTHAGJykJLpQ@mail.gmail.com>
Message-ID: <CAHk-=wjznm=EdyP=oeMoGUaTad80RZSOzs-iCWWTHAGJykJLpQ@mail.gmail.com>
Subject: Re: [GIT PULL] pin control bulk changes for v6.4
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 2, 2023 at 1:29=E2=80=AFPM Linus Walleij <linus.walleij@linaro.=
org> wrote:
>
> There will be one conflict, in the at91 pio4 driver, which is against
> a fix I sent in earlier. The version from my tree goes.

No, it's a mix of the two - the dev_err_probe() simplification from
this pull, and the irq domain name removal from your earlier fixes
tree.

                Linus
