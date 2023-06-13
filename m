Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34CAA72E353
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jun 2023 14:50:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242368AbjFMMun (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Jun 2023 08:50:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240854AbjFMMun (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Jun 2023 08:50:43 -0400
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com [IPv6:2607:f8b0:4864:20::e2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87DBD1981
        for <linux-gpio@vger.kernel.org>; Tue, 13 Jun 2023 05:50:41 -0700 (PDT)
Received: by mail-vs1-xe2e.google.com with SMTP id ada2fe7eead31-43b1cee7e65so275593137.2
        for <linux-gpio@vger.kernel.org>; Tue, 13 Jun 2023 05:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1686660640; x=1689252640;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D3Z+ItFPzUzbFHX86oiJubxxWs8lCfc2q//Oe39uutA=;
        b=qGW5S/J6h4hV6cmYk4/JWcLwir6G2dvWhpVhx0rwX61XLQ7wsQUqz1TsSh12dIkpvi
         50WGJQHqQ0016ehpSTZKuYxaY9HYU/KLBpZqeZVZQ+xo4UK6z6yg1XJSM4LCfHle+yn+
         AumoQssgCxWCcKu5eyH/J8rru1YEGzVnbbcfD8taOiOVD2wadva6hywBm941uCw5e/nS
         NaPJlA5zjkkUhsCZgPehj/AuFJe++6BA512mS3UQKkRa0ryIP1f+ItbQI04rT6Jq1WAG
         I3cPyxC32v6ysC3XITlnYv6wJSqH98QTOvnPjXQ7a9uZnLADlnvklAgOkSb3Dxl15zLn
         aYxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686660640; x=1689252640;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D3Z+ItFPzUzbFHX86oiJubxxWs8lCfc2q//Oe39uutA=;
        b=i37TC8paP5NGDggW7Ky1fQXuvejnh779SicND3Mhb6lsVe9uhPvf3ROw8VZj/ZMYQa
         qwdAAhoKjIUBf2QktZQuHHjNXBHuMw4+xpGc6KO7D+DyQSYzfOpnLKzaDE7ERs5GQXc0
         XLBecw3MLAG5f8e4JCkfiae24Er99xv5jHNz4E55nA5ak5ihsfIb8N0cEF5L/sZnSFvw
         LxXlzw2Il6lNxiQ69ndsPn3exg+7+lfFWZK6QwA9MJCPUxxueQlS9xCIJKK2alirEKho
         1rdUqcoHYd3ImcMzOg088x7rTXobZxDaBaJqi/ps0z2IHOd2K/VTHA3DXYDoG0z05raR
         oEOg==
X-Gm-Message-State: AC+VfDxo76O9jxs83X3v55sAkC559cM6QeJohi5uB9F3PgoBxgno+1e/
        2Mntm9u7XbWyKZKmNGlOQJGjU7zcuqltyFNDLVu5Ew==
X-Google-Smtp-Source: ACHHUZ6/YBa6rHUmlEE015BVBXt/yX/NbbxClSMs7NB3VeUpXNguSosv1hxBEh/LaYfetBPUu07+poY2iZThU3IFup4=
X-Received: by 2002:a67:ef96:0:b0:43b:3be2:87e1 with SMTP id
 r22-20020a67ef96000000b0043b3be287e1mr3649847vsp.23.1686660640621; Tue, 13
 Jun 2023 05:50:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230511-tps65219-add-gpio-support-v5-0-ebb94281c854@baylibre.com>
 <20230511-tps65219-add-gpio-support-v5-1-ebb94281c854@baylibre.com>
In-Reply-To: <20230511-tps65219-add-gpio-support-v5-1-ebb94281c854@baylibre.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 13 Jun 2023 14:50:29 +0200
Message-ID: <CAMRc=MdsGEePA55NSP3A7MBGWY_a-vNH9z8dOfCM_d0MphA4uQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] gpio: tps65219: add GPIO support for TPS65219 PMIC
To:     Jerome Neanne <jneanne@baylibre.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Tony Lindgren <tony@atomide.com>, Lee Jones <lee@kernel.org>,
        khilman@baylibre.com, msp@baylibre.com, francesco@dolcini.it,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-omap@vger.kernel.org,
        Jonathan Cormier <jcormier@criticallink.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 7, 2023 at 4:39=E2=80=AFPM Jerome Neanne <jneanne@baylibre.com>=
 wrote:
>
> Add support for TPS65219 PMICs GPIO interface.
>
> 3 GPIO pins:
> - GPIO0 only is IO but input mode reserved for MULTI_DEVICE_ENABLE usage.
> - GPIO1 and GPIO2 are Output only and referred as GPO1 and GPO2 in spec.
>
> GPIO0 is statically configured as input or output prior to Linux boot.
> it is used for MULTI_DEVICE_ENABLE function.
> This setting is statically configured by NVM.
> GPIO0 can't be used as a generic GPIO (specification Table 8-34).
> It's either a GPO when MULTI_DEVICE_EN=3D0 or a GPI when MULTI_DEVICE_EN=
=3D1.
>
> Datasheet describes specific usage for non standard GPIO.
>
> Datasheet: https://www.ti.com/lit/ds/symlink/tps65219.pdf
> Co-developed-by: Jonathan Cormier <jcormier@criticallink.com>
> Signed-off-by: Jonathan Cormier <jcormier@criticallink.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Jerome Neanne <jneanne@baylibre.com>
> ---

Applied, thanks!

Bart
