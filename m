Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0FAC79A417
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Sep 2023 09:04:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232108AbjIKHEs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Sep 2023 03:04:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231165AbjIKHEr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Sep 2023 03:04:47 -0400
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com [IPv6:2607:f8b0:4864:20::e35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDA1410C
        for <linux-gpio@vger.kernel.org>; Mon, 11 Sep 2023 00:04:43 -0700 (PDT)
Received: by mail-vs1-xe35.google.com with SMTP id ada2fe7eead31-44e8fc5dc63so1222142137.2
        for <linux-gpio@vger.kernel.org>; Mon, 11 Sep 2023 00:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1694415883; x=1695020683; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2apJdN+NMLv79j0HKupLL2ss8r9Hlf8T7YX8M9wUnJU=;
        b=x3YHVjyOZKYQqZ6gSu8CxXTW2PNuSm0nyIIc+hpQ2kt/C4UlhYNB8CEnI9rj0amjhN
         rlLILb4EjKgl8HY6wJSuCeOXHCFcWtyaJmejhCdbjfoNuh3mxlLn8xtNry0zJ+SVUyxj
         7l9XeUgjrA6qXlHuGLxr1qtQAyHOdnOtVymwMMHnFBO+Fnwz4mp2eRr5deL1itCf1EJ3
         3ZnehZfFtwIP2aaUfrFtss3VkReFj28/Icmv9mR5FtQyPfB2p0Q07HuHRudLJAnrYZDc
         wuGPEs/HW+fqmTQCc+uDuDWK7Kb5x1LDN2GszKWvHEgdIzrz8M+9bGJ3wum2d4hYC7Yb
         fhew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694415883; x=1695020683;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2apJdN+NMLv79j0HKupLL2ss8r9Hlf8T7YX8M9wUnJU=;
        b=UkzBjEiRFJgbSx2Y8GvTcLpp1iSB/qO3BWoUyhH9xFBqruJniu92yVnpWfdNwAoPiA
         uBELu8k5iCRzlQ2SliTSfDpq5dH4u7WwSuqS8XLFBXp4tI8aVvF0vLSqcFA2mIQyFCdc
         pOrZf6dUoUCoManaSl9EBUSbkl6M6efkbHkRi10trhBpwGqPyHbybEGF2Yj9+MeLbDPR
         rxF9m8zRFCU8QeJmbu0YOUnTdWTB6KfmoFx2XxL4bCsej75A3IZkwNXV/PdtwZO5mua4
         yvdd6uwR4wisVm1GHD+tTKsDOm+YjV4bTNVZFY7c5GCHlEdHhmtxS4WWYilHjufzGPbe
         DVsQ==
X-Gm-Message-State: AOJu0Yw3w4ithg1UvRBvZ4+CLOFFTMQ7TgItSEASqHHYkcPbf+PrBLw4
        Mn7+GBUFFQfFIDaBtmSakOhtyPvOYMxOhtridfL85A==
X-Google-Smtp-Source: AGHT+IHN4FSvT1IFvGiagcI0Gn6csDhTZou467hlcA0ZHZuWdaDSW+ykfXhcsUY+8mcnngUuNQVMFeHkqkXKibfG7BE=
X-Received: by 2002:a67:ffc5:0:b0:44e:8610:eefe with SMTP id
 w5-20020a67ffc5000000b0044e8610eefemr5253865vsq.6.1694415882887; Mon, 11 Sep
 2023 00:04:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230529025011.2806-1-xingtong_wu@163.com> <20230529025011.2806-2-xingtong_wu@163.com>
In-Reply-To: <20230529025011.2806-2-xingtong_wu@163.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 11 Sep 2023 09:04:31 +0200
Message-ID: <CAMRc=MdoOAYJ=eQfXGar1sCGiJZUG0XBHTUQ5u5SM8cYTZtMAA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] gpio-f7188x: fix base values conflicts with other
 gpio pins
To:     xingtong_wu@163.com
Cc:     linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, henning.schild@siemens.com,
        xingtong.wu@siemens.com
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

On Mon, May 29, 2023 at 4:55=E2=80=AFAM <xingtong_wu@163.com> wrote:
>
> From: "xingtong.wu" <xingtong.wu@siemens.com>
>
> switch pin base from static to automatic allocation to
> avoid conflicts and align with other gpio chip drivers
>
> Signed-off-by: xingtong.wu <xingtong.wu@siemens.com>
> ---

Applied, thanks!

Bart
