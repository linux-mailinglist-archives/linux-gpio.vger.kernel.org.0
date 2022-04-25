Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D191450E8EF
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Apr 2022 20:56:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244521AbiDYS7f (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 Apr 2022 14:59:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242978AbiDYS7e (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 Apr 2022 14:59:34 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A7B1120D0E
        for <linux-gpio@vger.kernel.org>; Mon, 25 Apr 2022 11:56:29 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id y3so11068595ejo.12
        for <linux-gpio@vger.kernel.org>; Mon, 25 Apr 2022 11:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=eH4fZUS/8H0zJE6k3UUwwgacgjQU4b0T33l32ylwnqY=;
        b=j2RXm5kpqnRsUP3zUQgy4N0o9EBi2S/K0zZh130AUSItHkVyAbaeuEHbfGzTjJL0vr
         OMqD1GGjy/5TI1hspu6+UXm1qoxpY6QCPBjn0PnYeBUTfJ0eX52rZ7WjUDrI6is/vKJl
         s0nVv7XpSG9v+gru4LGtW0QHklPSwT0hEf1cJgtdBmnN/FGW0KXNJEqpDFLTaHWo8Vbt
         tXjknNIfHHSMb9CI9PRX2fPvYhAKPGWFa4lBKRSo2OAyuD9jBmZuLgXevhCdC39CQM8Y
         Cwh80QzBg+XnB3NmsoxGL3ZrLmVDgytWA9rsW/fjpPqC+onV26Mt3fe4K92h+4zpssMj
         JnYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=eH4fZUS/8H0zJE6k3UUwwgacgjQU4b0T33l32ylwnqY=;
        b=z5aO1i5qRbAKjbnPLvzDbSAkgOPeLFbcKGtVDiNMNAcRj7O6w8gwajNPMmdpFeEiRI
         4lTJyXLfjA98E8vz1dCP5bC6YX9cOd8x+hUTN4U1c6x6vqrkRT0ogI4X4VNUKi0HfJpB
         gfmHVrQdnr3YFkAcIC4eFviQqtP0z7zRXqTvtJA8rcljgqw+3vzaeNvxZQ5aNkISeSqn
         UmxMX+cWcLjbZbGMc90/f5ZGxQ043oPI+AOlaMS1Xk6w8qKKCMZxq3dgfUFk2H5qz0mc
         DDtSSqdEa8XcxyrJR/uiqsKbTU67wxEVrUNWbnY13fyjcsOs854RuzoBffyHpZEIQC4u
         eSoA==
X-Gm-Message-State: AOAM532X0zjFKoFH9KDrGyl6MDBwydZhHHcT1Mimjmdrp+d9xm3Z655g
        BUjWc+Afx7SUcUQPmtZ1Og2MQ7uw5evvAWW4repagQ==
X-Google-Smtp-Source: ABdhPJwDC2wJi0of2xyl2CuoMt5ABAzz6Q6Fnb7xunKZZuiurYZiotb3Q4X/CVfUMFPT7hfhMpfltd/rDldiK9dRKvE=
X-Received: by 2002:a17:907:9719:b0:6f0:14b6:33e9 with SMTP id
 jg25-20020a170907971900b006f014b633e9mr18432084ejc.734.1650912987941; Mon, 25
 Apr 2022 11:56:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220425173255.56216-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20220425173255.56216-1-u.kleine-koenig@pengutronix.de>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 25 Apr 2022 20:56:17 +0200
Message-ID: <CAMRc=McBT0R9C4Ke4DBTeUDjFgbkMWm=q_o7diJunjCGe7xHJQ@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: pcf857x: Make teardown callback return void
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Sekhar Nori <nsekhar@ti.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Apr 25, 2022 at 7:33 PM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> All teardown functions return 0. Also there is little sense in returning
> a negative error code from an i2c remove function as this only results in
> emitting an error message but the device is removed nevertheless.
>
> This patch is a preparation for making i2c remove callbacks return void.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
> Changes since (implicit) v1:
>
>  - make it actually compile, thanks to the kernel test robot for
>    pointing that out.
>

Thanks, applied.

Bart
