Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3F317A6145
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Sep 2023 13:33:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231422AbjISLdO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Sep 2023 07:33:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231438AbjISLdN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Sep 2023 07:33:13 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F1C0FB
        for <linux-gpio@vger.kernel.org>; Tue, 19 Sep 2023 04:33:07 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5230a22cfd1so6989460a12.1
        for <linux-gpio@vger.kernel.org>; Tue, 19 Sep 2023 04:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695123186; x=1695727986; darn=vger.kernel.org;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mXtEJraGinSWypEE/y4eCNy6bCGIvsSMm5IugRKuBG8=;
        b=i7cg/O0g9j1HmIbSa1hLCJzE5D/MZmQ2e/VZduaEXoRPGxrsjO4LCmDoM+BQ39532G
         0xyljY1XVvdAoBqP8TuMv01TNxzzVXcJg/8iSg7PTqk6MDmjFaJOBOK61g1e6ZYQdWBI
         B6mQ65nXXODvJw9DAq4sYsQ3VUCDkHIi3OB+o1jcU0ZwujIiisCHTIqVldUwxLfBNhFx
         d1XCyLG4ujnRTwwI9enMb6vIhVckHTTdPmCNlDMrhblPulrtLKc3/mnasCDxpEQja7Sx
         dupdc/ReSaLFebEC+c9wyQUve1k3JsFZcA0HFz8iTiSO/TCQNPIU4kQ9MVYl6yypJRR1
         c4Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695123186; x=1695727986;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mXtEJraGinSWypEE/y4eCNy6bCGIvsSMm5IugRKuBG8=;
        b=LgEIFE+ghiQV+chcpkfIRAYQkJmSAReQ3DSr5341kCiGXMRKQJpEChCvszT2o6iGzj
         MEFO62hVFxFxRCMzT8j7kRY39suTeXOoGkdgj7KAFBXIV5z/x1Ww/NWJEb5IjHWUpgfM
         s/mglwID0SeFqi5/cQpuHn8IZy1w+DFLod+5QXUVeZ6Vr7RMBx245pZQ61iMk3sYt/kG
         axvdj9X6j4Vf+8QUr9dR1a/U9kaS33iMxR+ftK/JU1plMX0yIBHUgk4ICldAcIdAACAA
         Yd3GgoPF7QtH0cPrlIkyVsnWVWvUnh/C1sY8G8FaMjDtHG6lcWZ9oQ3th3N9pWxQABeR
         Hu9A==
X-Gm-Message-State: AOJu0Yx1RuTSp5Uctv4eU5uJyCF7YHq40gW2yjMFsqFN38mvUXfwTLoZ
        aUWkkSoSRjBDyYtChszMjtgLLsG7oAHM4QyGObNxrw==
X-Google-Smtp-Source: AGHT+IEvzUR3k7sF4X37k2rgydn4dc/QWG/uID5TEw0uhXwtqw8zr36E2aRVE+0w3ARrLp554IRdTQ==
X-Received: by 2002:a05:6402:4286:b0:532:5187:f0fc with SMTP id g6-20020a056402428600b005325187f0fcmr3161752edc.33.1695123185787;
        Tue, 19 Sep 2023 04:33:05 -0700 (PDT)
Received: from localhost (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
        by smtp.gmail.com with ESMTPSA id n16-20020a05640204d000b005272523b162sm7231343edw.69.2023.09.19.04.33.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Sep 2023 04:33:05 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Tue, 19 Sep 2023 13:33:04 +0200
Message-Id: <CVMV0OGATW4L.QL7XECWU9KCQ@ablu-work>
Cc:     <linux-gpio@vger.kernel.org>,
        "Bartosz Golaszewski" <bartosz.golaszewski@linaro.org>
To:     "Bartosz Golaszewski" <brgl@bgdev.pl>,
        "Kent Gibson" <warthog618@gmail.com>,
        "Linus Walleij" <linus.walleij@linaro.org>,
        "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
        "Viresh Kumar" <viresh.kumar@linaro.org>
From:   "Erik Schilling" <erik.schilling@linaro.org>
Subject: Re: [libgpiod][PATCH 1/3] tests: don't use the same chip object
 from different threads
X-Mailer: aerc 0.15.2
References: <20230919093142.85389-1-brgl@bgdev.pl>
In-Reply-To: <20230919093142.85389-1-brgl@bgdev.pl>
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
> create a second chip for that purpose instead.
>
> Reported-by: Erik Schilling <erik.schilling@linaro.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Erik Schilling <erik.schilling@linaro.org>

> ---
>  tests/tests-info-event.c | 62 +++++++++++++++++++++-------------------
>  1 file changed, 33 insertions(+), 29 deletions(-)
>
> diff --git a/tests/tests-info-event.c b/tests/tests-info-event.c
> index d069811..cbd9e9e 100644
> --- a/tests/tests-info-event.c
> +++ b/tests/tests-info-event.c
> @@ -49,43 +49,59 @@ GPIOD_TEST_CASE(event_timeout)
>  }
> =20
>  struct request_ctx {
> -	struct gpiod_chip *chip;
> -	struct gpiod_line_config *line_cfg;
> -	struct gpiod_line_settings *settings;
> +	const char *path;
>  	guint offset;
>  };
> =20
>  static gpointer request_reconfigure_release_line(gpointer data)
>  {
> +	g_autoptr(struct_gpiod_line_settings) settings =3D NULL;
> +	g_autoptr(struct_gpiod_line_config) line_cfg =3D NULL;
>  	g_autoptr(struct_gpiod_line_request) request =3D NULL;
> +	g_autoptr(struct_gpiod_chip) chip =3D NULL;
>  	struct request_ctx *ctx =3D data;
>  	gint ret;
> =20
> +	chip =3D gpiod_chip_open(ctx->path);
> +	g_assert_nonnull(chip);
> +	if (g_test_failed())
> +		return NULL;
> +
> +	line_cfg =3D gpiod_line_config_new();
> +	g_assert_nonnull(line_cfg);
> +	if (g_test_failed())
> +		return NULL;
> +
> +	settings =3D gpiod_line_settings_new();
> +	g_assert_nonnull(settings);
> +	if (g_test_failed())
> +		return NULL;
> +
>  	g_usleep(1000);
> =20
> -	ret =3D gpiod_line_config_add_line_settings(ctx->line_cfg, &ctx->offset=
,
> -						  1, ctx->settings);
> +	ret =3D gpiod_line_config_add_line_settings(line_cfg, &ctx->offset,
> +						  1, settings);
>  	g_assert_cmpint(ret, =3D=3D, 0);
>  	if (g_test_failed())
>  		return NULL;
> =20
> -	request =3D gpiod_chip_request_lines(ctx->chip, NULL, ctx->line_cfg);
> +	request =3D gpiod_chip_request_lines(chip, NULL, line_cfg);
>  	g_assert_nonnull(request);
>  	if (g_test_failed())
>  		return NULL;
> =20
>  	g_usleep(1000);
> =20
> -	gpiod_line_config_reset(ctx->line_cfg);
> -	gpiod_line_settings_set_direction(ctx->settings,
> +	gpiod_line_config_reset(line_cfg);
> +	gpiod_line_settings_set_direction(settings,
>  					  GPIOD_LINE_DIRECTION_OUTPUT);
> -	ret =3D gpiod_line_config_add_line_settings(ctx->line_cfg, &ctx->offset=
,
> -						  1, ctx->settings);
> +	ret =3D gpiod_line_config_add_line_settings(line_cfg, &ctx->offset,
> +						  1, settings);
>  	g_assert_cmpint(ret, =3D=3D, 0);
>  	if (g_test_failed())
>  		return NULL;
> =20
> -	ret =3D gpiod_line_request_reconfigure_lines(request, ctx->line_cfg);
> +	ret =3D gpiod_line_request_reconfigure_lines(request, line_cfg);
>  	g_assert_cmpint(ret, =3D=3D, 0);
>  	if (g_test_failed())
>  		return NULL;
> @@ -106,25 +122,19 @@ GPIOD_TEST_CASE(request_reconfigure_release_events)
>  	g_autoptr(struct_gpiod_info_event) request_event =3D NULL;
>  	g_autoptr(struct_gpiod_info_event) reconfigure_event =3D NULL;
>  	g_autoptr(struct_gpiod_info_event) release_event =3D NULL;
> -	g_autoptr(struct_gpiod_line_config) line_cfg =3D NULL;
> -	g_autoptr(struct_gpiod_line_settings) settings =3D NULL;
>  	g_autoptr(GThread) thread =3D NULL;
>  	struct gpiod_line_info *request_info, *reconfigure_info, *release_info;
>  	guint64 request_ts, reconfigure_ts, release_ts;
>  	struct request_ctx ctx;
> +	const char *chip_path =3D g_gpiosim_chip_get_dev_path(sim);
>  	gint ret;
> =20
> -	chip =3D gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim))=
;
> -	line_cfg =3D gpiod_test_create_line_config_or_fail();
> -	settings =3D gpiod_test_create_line_settings_or_fail();
> -
> +	chip =3D gpiod_test_open_chip_or_fail(chip_path);
>  	info =3D gpiod_test_chip_watch_line_info_or_fail(chip, 3);
> =20
>  	g_assert_false(gpiod_line_info_is_used(info));
> =20
> -	ctx.chip =3D chip;
> -	ctx.line_cfg =3D line_cfg;
> -	ctx.settings =3D settings;
> +	ctx.path =3D chip_path;
>  	ctx.offset =3D 3;
> =20
>  	thread =3D g_thread_new("request-release",
> @@ -199,26 +209,20 @@ GPIOD_TEST_CASE(chip_fd_can_be_polled)
>  	g_autoptr(struct_gpiod_chip) chip =3D NULL;
>  	g_autoptr(struct_gpiod_line_info) info =3D NULL;
>  	g_autoptr(struct_gpiod_info_event) event =3D NULL;
> -	g_autoptr(struct_gpiod_line_config) line_cfg =3D NULL;
> -	g_autoptr(struct_gpiod_line_settings) settings =3D NULL;
>  	g_autoptr(GThread) thread =3D NULL;
> +	const char *chip_path =3D g_gpiosim_chip_get_dev_path(sim);
>  	struct gpiod_line_info *evinfo;
>  	struct request_ctx ctx;
>  	struct timespec ts;
>  	struct pollfd pfd;
>  	gint ret, fd;
> =20
> -	chip =3D gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim))=
;
> -	settings =3D gpiod_test_create_line_settings_or_fail();
> -	line_cfg =3D gpiod_test_create_line_config_or_fail();
> -
> +	chip =3D gpiod_test_open_chip_or_fail(chip_path);
>  	info =3D gpiod_test_chip_watch_line_info_or_fail(chip, 3);
> =20
>  	g_assert_false(gpiod_line_info_is_used(info));
> =20
> -	ctx.chip =3D chip;
> -	ctx.line_cfg =3D line_cfg;
> -	ctx.settings =3D settings;
> +	ctx.path =3D chip_path;
>  	ctx.offset =3D 3;
> =20
>  	thread =3D g_thread_new("request-release",

