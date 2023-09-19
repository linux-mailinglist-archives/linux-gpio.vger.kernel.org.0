Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4624F7A6147
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Sep 2023 13:33:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231283AbjISLdd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Sep 2023 07:33:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231317AbjISLdd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Sep 2023 07:33:33 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A214F0
        for <linux-gpio@vger.kernel.org>; Tue, 19 Sep 2023 04:33:27 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-99c3c8adb27so733745566b.1
        for <linux-gpio@vger.kernel.org>; Tue, 19 Sep 2023 04:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695123205; x=1695728005; darn=vger.kernel.org;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gifzo1eEyI0ZsRMlllhE1c5xV09V6ZzgBSzm95G1p3A=;
        b=PAOn8TZYhi1Z2t/2DEJOp9KhiSpJicFHLTIT+VLzTxhV83GSZb+/n5dUlzUwXhmqpU
         OuW0l6o46o4s0pjTxKctvh+tpIjzN4FNBZtmAL+sATb5OYUS1Z2i5xX8e3NNdrSsvTvF
         APE5nXkCCwFoU2LlaItbooziuxjsZ8EO3UMcdjlzT7u6iamcApz1RMfHNwGb883Iku8s
         0JX/76Gwa3KZ9ZPsiRE0puOxvEm8H7YJoLhn2gsgicl+7uAVnFAJ18+NR4YoBgbUqyCX
         lBQTDhM+AS7cQNnXbfpi4SVrtugwf9PKrfknWlNnuFrlv00N7AmejVaUHzamv+SELYKh
         nBvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695123205; x=1695728005;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gifzo1eEyI0ZsRMlllhE1c5xV09V6ZzgBSzm95G1p3A=;
        b=V7bdu1cGcodXaJRrNBV9acc1GP+O6wNy1bEDjsbn1E8N5qbFMjzp0tsgNqiMGoQWo+
         YkRFPQLOAB6CsNM8Ms5Ax9EI7wvsaO1bou724DPwciAZwWMHL/z0uu25u8oJ/qwJUodk
         rxRRTEsr+N1BX1OWMKCe7oF7sk0TlA2SqPHmRG0E2gysZpgtl05UYCzrF0+mrLO8x2Bk
         ZBrK8gq2Qa9qw/J+JaRc7PDB1koTWcfBvTcbcQ26cusyLl7PYp4uR2YtNkDFiWB9R39Y
         BcBzq8Ddq3XkmHPnPxy3B+Ydr0DgWE2h82okmNLdd3WcBGap4GioxZYNaWKoM8Zxux4u
         UHxA==
X-Gm-Message-State: AOJu0YzYbz7AqJlDT+GmxHtKBTJKyaImwosXLAxaPe50k8ncWgj2nkC3
        WcbvzeB/YZNdzJ6ICsbpIyJ2MtY5utlVoFiHo54ASw==
X-Google-Smtp-Source: AGHT+IH1Fsq1hdoLaWN3yWBLf2wpCAHnYmFwWMw3HVgQMPbTfBycHCbWC7eF65JQN7pOqF4c2DeN0Q==
X-Received: by 2002:a17:906:74d9:b0:9a1:fc1e:19af with SMTP id z25-20020a17090674d900b009a1fc1e19afmr10097324ejl.36.1695123205641;
        Tue, 19 Sep 2023 04:33:25 -0700 (PDT)
Received: from localhost (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
        by smtp.gmail.com with ESMTPSA id u14-20020a170906068e00b0099ce025f8ccsm7589236ejb.186.2023.09.19.04.33.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Sep 2023 04:33:25 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Tue, 19 Sep 2023 13:33:24 +0200
Message-Id: <CVMV0XSO2QN3.38U1D4717922B@ablu-work>
From:   "Erik Schilling" <erik.schilling@linaro.org>
Subject: Re: [libgpiod][PATCH 3/3] bindings: python: tests: don't use the
 same chip from different threads
Cc:     <linux-gpio@vger.kernel.org>,
        "Bartosz Golaszewski" <bartosz.golaszewski@linaro.org>
To:     "Bartosz Golaszewski" <brgl@bgdev.pl>,
        "Kent Gibson" <warthog618@gmail.com>,
        "Linus Walleij" <linus.walleij@linaro.org>,
        "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
        "Viresh Kumar" <viresh.kumar@linaro.org>
X-Mailer: aerc 0.15.2
References: <20230919093142.85389-1-brgl@bgdev.pl>
 <20230919093142.85389-3-brgl@bgdev.pl>
In-Reply-To: <20230919093142.85389-3-brgl@bgdev.pl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue Sep 19, 2023 at 11:31 AM CEST, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> There are no thread-safety guarantees in libgpiod. Let's not reuse the
> chip object created in one thread to generate info events in another but
> use a global request function instead.
>
> Reported-by: Erik Schilling <erik.schilling@linaro.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Erik Schilling <erik.schilling@linaro.org>

> ---
>  bindings/python/tests/tests_info_event.py | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/bindings/python/tests/tests_info_event.py b/bindings/python/=
tests/tests_info_event.py
> index f3926d9..6bb09d5 100644
> --- a/bindings/python/tests/tests_info_event.py
> +++ b/bindings/python/tests/tests_info_event.py
> @@ -37,9 +37,9 @@ class InfoEventDataclassBehavior(TestCase):
>                      event.line_info =3D 4
> =20
> =20
> -def request_reconfigure_release_line(chip, offset):
> +def request_reconfigure_release_line(chip_path, offset):
>      time.sleep(0.1)
> -    with chip.request_lines(config=3D{offset: None}) as request:
> +    with gpiod.request_lines(chip_path, config=3D{offset: None}) as requ=
est:
>          time.sleep(0.1)
>          request.reconfigure_lines(
>              config=3D{offset: gpiod.LineSettings(direction=3DDirection.O=
UTPUT)}
> @@ -95,7 +95,7 @@ class WatchingInfoEventWorks(TestCase):
>          self.assertEqual(info.direction, Direction.INPUT)
> =20
>          self.thread =3D threading.Thread(
> -            target=3Dpartial(request_reconfigure_release_line, self.chip=
, 7)
> +            target=3Dpartial(request_reconfigure_release_line, self.sim.=
dev_path, 7)
>          )
>          self.thread.start()
> =20

