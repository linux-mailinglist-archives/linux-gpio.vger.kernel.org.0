Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B8D47B3C18
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Sep 2023 23:48:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232834AbjI2Vsu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 29 Sep 2023 17:48:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbjI2Vsu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Sep 2023 17:48:50 -0400
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25E89B7
        for <linux-gpio@vger.kernel.org>; Fri, 29 Sep 2023 14:48:47 -0700 (PDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-59f6e6b206fso126553047b3.3
        for <linux-gpio@vger.kernel.org>; Fri, 29 Sep 2023 14:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696024126; x=1696628926; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d9Y2fSCkcD6jdRglS8aGJ3vVQKyE2EnbQ1TAFzAJFA4=;
        b=QnVibiDBsePGVHKmKJEmFcVrX/9y/tY775zcYtJVRPdepP4npvAhk9nyjVsoZFOHB9
         ms/5hacbxBgLjc/ajo9RRG/CcfC/O0riso3DthdwM2/DNT2yETDnO+g0HFbrM7Gk/jY/
         P3ncwe7r8OLzE/tCDhZmK6hUDcD3iF869OXuMe4ACXres0sbPf2Vok7gNMFvR48qdNBm
         ta7r3HOoP1q9qkraK9x90kEuEltcFD96g0wa73mqlk2n1pLPEVckLovIfEI5Y2B8LmVD
         zn3IoHXr+ftuYmRCu5zENLBSBuJVAZxJ2srJw7DC4qliaoQxkmxZZOu2Ceu5d6LuoY7o
         ok8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696024126; x=1696628926;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d9Y2fSCkcD6jdRglS8aGJ3vVQKyE2EnbQ1TAFzAJFA4=;
        b=bUzdEUpeIstOfhpaji++rw0sexpmbk9JDBf/VHPc34w7KgKKHcSB9FZ6bTwh4tKAB7
         3FzfLK3vq463MNPFNwaAEhZkSiJMJT+AesOH4j7jSN5WN1mdpGui/VTHG/cSlVgnBHcB
         0E7797rn75YCyIrxXyilP0lliSe1b0kCxHhmLx+mgTF5CZSsgjqh9h2WirziHpg4l3XY
         figKv7F/fEmUyJvxuhtswumvohmA1BVbGT6zWQt66ZzLUmt/tenMfEtXEXxKnH1BBfxr
         sPcDAIizzgdZMb7rvUj9ARuaAat1msPNfGiV3YhQyPbbpf4ZHEeeWKBqy7hLlFDDDnTo
         abXQ==
X-Gm-Message-State: AOJu0YxtrhdwugbVR15X1OqtWFtNV1Cb5Gv47b+GK1ybltpeXRm2YddS
        Fe0R+rXGtdSAbrL6XePQbc8l93egsFRUtKbAZ5omzw==
X-Google-Smtp-Source: AGHT+IGMuUapNs4yNU9a9tvc0M51D2PY6cv7TMVefM3fJUMhtTVk+rSQKUmHIfeHIdVCBINeGTuJAZ2WcPIL4LztSNU=
X-Received: by 2002:a0d:eacb:0:b0:586:b686:8234 with SMTP id
 t194-20020a0deacb000000b00586b6868234mr5805526ywe.8.1696024126383; Fri, 29
 Sep 2023 14:48:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230929-pxa-gpio-v3-0-af8d5e5d1f34@skole.hr> <20230929-pxa-gpio-v3-6-af8d5e5d1f34@skole.hr>
In-Reply-To: <20230929-pxa-gpio-v3-6-af8d5e5d1f34@skole.hr>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 29 Sep 2023 23:48:34 +0200
Message-ID: <CACRpkdZr4aRm6ru5FXa-s5Q0HbinTNU+HZd2ach-sUzNDQdyOg@mail.gmail.com>
Subject: Re: [PATCH RFC v3 6/6] ARM: pxa: Convert gumstix Bluetooth to GPIO descriptors
To:     =?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Cc:     Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Russell King <linux@armlinux.org.uk>,
        Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org
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

On Fri, Sep 29, 2023 at 3:15=E2=80=AFPM Duje Mihanovi=C4=87 <duje.mihanovic=
@skole.hr> wrote:

> Gumstix still uses the legacy GPIO interface for resetting the Bluetooth
> device.
>
> Convert it to use the GPIO descriptor interface.
>
> Signed-off-by: Duje Mihanovi=C4=87 <duje.mihanovic@skole.hr>

As far as I can tell the BT UART is registered before the
gpios are added and retrieved, and that should work so:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
