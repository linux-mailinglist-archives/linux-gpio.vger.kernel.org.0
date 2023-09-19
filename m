Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9ADE07A6146
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Sep 2023 13:33:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231241AbjISLd0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Sep 2023 07:33:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231317AbjISLdZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Sep 2023 07:33:25 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 684BD114
        for <linux-gpio@vger.kernel.org>; Tue, 19 Sep 2023 04:33:18 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-52a49a42353so6867164a12.2
        for <linux-gpio@vger.kernel.org>; Tue, 19 Sep 2023 04:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695123197; x=1695727997; darn=vger.kernel.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fo03UjUC1jhGoKp0j713RHLgJR/4V8ctZxPIJ5e4u2o=;
        b=EkYVsuMSOpsOeqnW4d9QOExZCPccOCRtwZx99jq8q0gbS5V4r+rvq16AkQUFl+OoHL
         f9QphqAUf91O9qe4p6EIH1ZTqcGhDVSL3h0FB6xxTo6uC8z4zMD566fmbyUq+c5lczRI
         c3k+T0nYsFEdYTLlGHihNddiSbAOPTHr36gbmTnGmkSsZmrv8V9GgV+hBrdKtP1me2wj
         Nq4r4q0gyovhYX7Dqvl7Qu3r0+VBkK2yHwUP8v1cxMwh0+3bEu1G0SxcUvfr5qs+N52p
         JpXAT/B02I+v5yQNNogQ4EHILoXvFREaA/QT4B8azlB2aRPV5AbfUUNgnZGugnV8DbaD
         wg4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695123197; x=1695727997;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Fo03UjUC1jhGoKp0j713RHLgJR/4V8ctZxPIJ5e4u2o=;
        b=bFhHZK4o03kNohIKPZVCxpjvovWgHw7lxrWxCcjEBpO6gm5u0lPC1AywcxT1iPKF9u
         aGYntzqum+Llor4tmEmS8vmrQpCqwxffNydN14vNcjJLr6iq/z2kqszqtsTfdhEuPGN8
         2Gs6pp8MOvf2L9UyVhHRXlW8qtJHVRmFfgYes9XI6zhoHNKl6C3bfbs5ajnNPuO7/2xP
         Y4QcjVVQIvUyGsyklHCvWIJJipX9p7rVXf0rhC8MuL1eOCoJ01sxBNH4/2yP/sNVBkBF
         PmW+1hB5BsuuReeMiKuaTK/jknpRbaaW5m/kp37ZQenqXi8RmyoLpBMqo+4nTNzrIgHE
         A9Ew==
X-Gm-Message-State: AOJu0YwgMmRXDSpE1zxgX7+OnYGRa4wA9GuhFc6yELK1YkEGd3gry+aK
        nDBelkoDhJqZWFgTXJNat2YW1Q==
X-Google-Smtp-Source: AGHT+IHPU9q6NgjtEKwNqGmGfgr602S3TCb87Yl77d1gnsZtD/+zwdVrSqdguirOUhasCQQYVq0kww==
X-Received: by 2002:a17:906:1bb2:b0:9aa:63d:9ede with SMTP id r18-20020a1709061bb200b009aa063d9edemr9946229ejg.9.1695123196726;
        Tue, 19 Sep 2023 04:33:16 -0700 (PDT)
Received: from localhost (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
        by smtp.gmail.com with ESMTPSA id u17-20020a1709064ad100b0098ce63e36e9sm7814906ejt.16.2023.09.19.04.33.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Sep 2023 04:33:16 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Tue, 19 Sep 2023 13:33:15 +0200
Message-Id: <CVMV0TQQYGX1.1P90OHRZBIB73@ablu-work>
Subject: Re: [libgpiod][PATCH 2/3] bindings: cxx: tests: don't use the same
 chip from different threads
Cc:     <linux-gpio@vger.kernel.org>,
        "Bartosz Golaszewski" <bartosz.golaszewski@linaro.org>
To:     "Bartosz Golaszewski" <brgl@bgdev.pl>,
        "Kent Gibson" <warthog618@gmail.com>,
        "Linus Walleij" <linus.walleij@linaro.org>,
        "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
        "Viresh Kumar" <viresh.kumar@linaro.org>
From:   "Erik Schilling" <erik.schilling@linaro.org>
X-Mailer: aerc 0.15.2
References: <20230919093142.85389-1-brgl@bgdev.pl>
 <20230919093142.85389-2-brgl@bgdev.pl>
In-Reply-To: <20230919093142.85389-2-brgl@bgdev.pl>
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
>  bindings/cxx/tests/tests-info-event.cpp | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/bindings/cxx/tests/tests-info-event.cpp b/bindings/cxx/tests=
/tests-info-event.cpp
> index 249b1e8..21c0ef0 100644
> --- a/bindings/cxx/tests/tests-info-event.cpp
> +++ b/bindings/cxx/tests/tests-info-event.cpp
> @@ -3,6 +3,7 @@
> =20
>  #include <catch2/catch.hpp>
>  #include <chrono>
> +#include <filesystem>
>  #include <gpiod.hpp>
>  #include <sstream>
>  #include <thread>
> @@ -17,11 +18,11 @@ using event_type =3D ::gpiod::info_event::event_type;
> =20
>  namespace {
> =20
> -void request_reconfigure_release_line(::gpiod::chip& chip)
> +void request_reconfigure_release_line(const ::std::filesystem::path& chi=
p_path)
>  {
>  	::std::this_thread::sleep_for(::std::chrono::milliseconds(10));
> =20
> -	auto request =3D chip
> +	auto request =3D ::gpiod::chip(chip_path)
>  		.prepare_request()
>  		.add_line_settings(7, ::gpiod::line_settings())
>  		.do_request();
> @@ -48,7 +49,9 @@ TEST_CASE("Lines can be watched", "[info-event][chip]")
>  		.set_num_lines(8)
>  		.build();
> =20
> -	::gpiod::chip chip(sim.dev_path());
> +	const auto chip_path =3D sim.dev_path();
> +
> +	::gpiod::chip chip(chip_path);
> =20
>  	SECTION("watch_line_info() returns line info")
>  	{
> @@ -74,7 +77,7 @@ TEST_CASE("Lines can be watched", "[info-event][chip]")
> =20
>  		REQUIRE(info.direction() =3D=3D direction::INPUT);
> =20
> -		::std::thread thread(request_reconfigure_release_line, ::std::ref(chip=
));
> +		::std::thread thread(request_reconfigure_release_line, ::std::ref(chip=
_path));
> =20
>  		REQUIRE(chip.wait_info_event(::std::chrono::seconds(1)));
>  		auto event =3D chip.read_info_event();

