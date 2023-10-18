Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F8917CD766
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Oct 2023 11:03:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229441AbjJRJDv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 18 Oct 2023 05:03:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229510AbjJRJDu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 18 Oct 2023 05:03:50 -0400
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com [IPv6:2607:f8b0:4864:20::e31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78F95FD
        for <linux-gpio@vger.kernel.org>; Wed, 18 Oct 2023 02:03:48 -0700 (PDT)
Received: by mail-vs1-xe31.google.com with SMTP id ada2fe7eead31-4576946ce96so2863246137.0
        for <linux-gpio@vger.kernel.org>; Wed, 18 Oct 2023 02:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697619827; x=1698224627; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KZwDxzwTUCVeWQ57tC0xGK7r7gYslGKspBP4QINFgQs=;
        b=XJPTz4CLUKKf1UA96AAuK2raQPQnmT3+K1fPZApQYdi8MYUr/oSTXQbnFhMQuMCOqA
         coS7s+gbcwVuepAdD/OXrlDGMRY103redHtheNjhB0lBjtukkkbbdtIE5bDxiBTB4VMw
         wWPXsof3BEA1DMFdD9oriGAFC7shkoaXg34dkmqAruo4B7sK2X5OYA3gg29uiZU6CsdU
         vr/3k5HF+j9j0flB8+833d/7u2863nNtnj8M/Xd/mrKddkzVPmVrMdbaxm4Wq1vZdOJA
         zNnjUk4r9ekHMGc7Sj3yg+gP8diekQA/bqtu/w4qmtrnRSzvK1O++pyK1TDib+8r5Df6
         Q/CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697619827; x=1698224627;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KZwDxzwTUCVeWQ57tC0xGK7r7gYslGKspBP4QINFgQs=;
        b=LN7PaTITpxUdCO2yoipc8FLifqmuaOOyyNlqUk0BRpFrGVlv1srUv9EilX+SToEGUw
         fzm0qfniolbAkFbBpPDl+x6LRUhBGYWWUhW9RGRJucclBepknEkAkWngkmRyMMU2NohB
         EC5BpK4Xw5+YoZgOp+Ouh4HE28A7WuY3OF4SerrnlERWL35uKcllKdaeRIxukPbULXK3
         qIqUMyO88uG6z7JJUG2hQLd8S0UBu6iNjfIslWdSSUorl2MiEL//pQnprUvmPbo+Y4ae
         Wh4GYFpV/PnZgsEedLHk/Nt0WZzm4sZ/pDDupOWvn9RL27yr99bGhsbYwurJsQj3UdDx
         cgMA==
X-Gm-Message-State: AOJu0Yxk2/4BQuzanm5mCjOgWldrMT8xRjMDeekom0I8H7j23AAFaJ0s
        tTCR6Y+gdjdBGPxiA7G6dFSCC/rUu9NXJlBzGHPjVw==
X-Google-Smtp-Source: AGHT+IGE0shlYTmWTmcqvbWfTsqb2RZdUelBAZab1+gS6FPG24vbQqg/kEwublfB5FaYGfTk6wy8DNcgqTB+tEd6YBA=
X-Received: by 2002:a67:a604:0:b0:455:e14e:79f6 with SMTP id
 p4-20020a67a604000000b00455e14e79f6mr4458185vse.7.1697619827576; Wed, 18 Oct
 2023 02:03:47 -0700 (PDT)
MIME-Version: 1.0
References: <20231017104237.1966094-1-haibo.chen@nxp.com>
In-Reply-To: <20231017104237.1966094-1-haibo.chen@nxp.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 18 Oct 2023 11:03:36 +0200
Message-ID: <CAMRc=Me4vPba0+rhZOBKk6J7vzFEMpb9AsKYSPonCY-5p9b8zQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] few bug fix for vf610 gpio driver
To:     haibo.chen@nxp.com
Cc:     linus.walleij@linaro.org, andy@kernel.org, stefan@agner.ch,
        shawn.guo@freescale.com, aisheng.dong@nxp.com,
        linux-gpio@vger.kernel.org, linux-imx@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 17, 2023 at 12:37=E2=80=AFPM <haibo.chen@nxp.com> wrote:
>
> From: Haibo Chen <haibo.chen@nxp.com>
>
> Change for V2:
>   add the fix tag for each patch.
>
> Haibo Chen (2):
>   gpio: vf610: mask the gpio irq in system suspend and support wakeup
>   gpio: vf610: config the data value before the direction setting to
>     avoid glitch
>
>  drivers/gpio/gpio-vf610.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> --
> 2.34.1
>

Applied, thanks!

Bart
