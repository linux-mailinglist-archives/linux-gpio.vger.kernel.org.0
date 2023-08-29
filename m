Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B59578BF2F
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Aug 2023 09:26:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229594AbjH2HZn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Aug 2023 03:25:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233666AbjH2HZM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Aug 2023 03:25:12 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14BEBCC0
        for <linux-gpio@vger.kernel.org>; Tue, 29 Aug 2023 00:25:02 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-d77f97a0e72so3971624276.0
        for <linux-gpio@vger.kernel.org>; Tue, 29 Aug 2023 00:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693293901; x=1693898701;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6gABAptbe3cNIzX83nmRa+n9FZIQWm3+cXagmh21f0c=;
        b=rLeK06W+D9FhbZtvII0rx21LSDQ0QR7oIFeDbjPlCDDGX+o2/PsnVbOfrD+737nmyz
         iOb2cxbKytdu+L7eBZ/cvn0cVLLhmc+way4PinBxh7eXCYJKk9TsmIAM3T2IEj0F1F4z
         +whEzpTna4p6SdtMo1zQadRCd7+2PmPcZ0LTNTXEkm1rcGnLnrVblDbgRCmcXCkvQqPN
         n4zavJbVY+Ok//IZmNr7mMDgVRORI2eqp7aBDgJ/cnvrj84IKBB4UVTU6egpeCJ80oDp
         tMcXn6W08DrDPX2zyMyyoPVqw/EPj9AEusqcq/XUINfvWremU/e/Ccj2XKAR00dyUlpA
         MyQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693293901; x=1693898701;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6gABAptbe3cNIzX83nmRa+n9FZIQWm3+cXagmh21f0c=;
        b=iPWtv2NLf746B1xxr1MIqTMLOZhVMeD1HDuJuRz5Awd2TZdELOSPqXPF6hFcSAZ0gJ
         hCu+FS+vfNEaRuiPjOEDLFkwJAiunYJ19IcPDhT2T/+NeLaqbcvCBOF+scwOBXoZPZJQ
         e0EopU5MupE2ab3gmFBGypQGbhltJxL3ioh+SD5kzm5/0WKx1Y2kbEoO/eY0UUffzQ2o
         VrxuWRinWxi4+V+MK3Ns/aTBBugtHv8gfyRMcLsGnT74WcQC/98iNLRSqH1cM4OBFuau
         bfO5AwaAOe3xCK7fh8LLnqniL0sz9W+iGAw5o9dnnZLIGTftsvGLCOmDQ9eUBfh3vCbU
         +Vbw==
X-Gm-Message-State: AOJu0YxPZmZFbUi7vhYBjBDEY7UubQyDcfYlfHWKGl9/VFN9c8bLSSQc
        UbeULjcepq8RiDpk5jP2RGsijzM75CrwXsBijuEftw==
X-Google-Smtp-Source: AGHT+IGkEVGINDawd12lphnq7z4EM50pQtdTtKbH6yI+JoWIbr72Jbu/HUDJGmXgEFTwx6GvHPbIoSsR/GWth5Jo6H4=
X-Received: by 2002:a25:d10a:0:b0:d62:b91b:10e3 with SMTP id
 i10-20020a25d10a000000b00d62b91b10e3mr28670878ybg.48.1693293901302; Tue, 29
 Aug 2023 00:25:01 -0700 (PDT)
MIME-Version: 1.0
References: <13109ef0-9c4c-1990-4580-661f86778923@pengutronix.de>
In-Reply-To: <13109ef0-9c4c-1990-4580-661f86778923@pengutronix.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 29 Aug 2023 09:24:50 +0200
Message-ID: <CACRpkdYPhQq2aR+QsAX7QyGB2V63dOAcf3r-BsG3y3GQ8E4ZKw@mail.gmail.com>
Subject: Re: Getting legacy GPIO index by line name
To:     Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>
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

On Mon, Aug 28, 2023 at 4:21=E2=80=AFPM Ahmad Fatoum <a.fatoum@pengutronix.=
de> wrote:

> Much to my dismay, I've learnt that my script above doesn't work when the=
 same device
> registers multiple GPIO controllers. On my i.MX system with some PCA953x =
GPIO expanders,
> it works ok, but on a STM32MP, were the pinctrl device registers all GPIO=
 chips, the glob
> will expand to more than once device.
>
> So my question is: What better way is there to get a legacy GPIO index fr=
om within
> a shell script (or an alternative way to request a sysfs GPIO by label)?

Don't know if it answers your question, but when there are several GPIO
chips of the same device/driver the way to determine topology ("which
device is which") is to use the topology in sysfs, i.e. the directory path,
where each device will have some unique bus ID (such as the USB
instance number, the device tree address etc).

> P.S: I know that most GPIO fiddling should've kernel driver consumers ins=
tead. That's under
>      way too.

Thanks! :)

> [1]: I appreciate links to any WIP/planned systemd-gpiod or similar patch=
es anyway. While new
>      projects should do more fine grained control of GPIOs, migration of =
most users will
>      likely benefit benefit from a single global consumer.

I think Bartosz was working at a GPIO daemon for central management at one
point, but in a controlled embedded system, I think other (custom) solution=
s for
a central entity are possible.

Yours,
Linus Walleij
