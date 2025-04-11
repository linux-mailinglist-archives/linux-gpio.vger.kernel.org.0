Return-Path: <linux-gpio+bounces-18684-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C3854A85144
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Apr 2025 03:34:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9AF234439E4
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Apr 2025 01:34:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29D33217664;
	Fri, 11 Apr 2025 01:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i+3Tj3rU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780452572
	for <linux-gpio@vger.kernel.org>; Fri, 11 Apr 2025 01:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744335252; cv=none; b=sO0hekNRxj2H8JDPaqw0JQX2gdr/UkHbF/3usioljZkneKw8ygvyOkNOmFV/x1PRwOqzGAlh6sf3GqwqwLvhNYs8j1A4xIaAYEx4hU715wn8Uzx25CcyKQaBYN0XcHp5pH1N6+5eDZZJ55ufnm6QLinCwtjCVDn0XkeSRehwoTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744335252; c=relaxed/simple;
	bh=cQtip98fEhUo81ekSdxTpcxwdDp9Ljx+byTxpIzU8yY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eHBC2e4m1k8B+4veBXZ4xJxJRht6vzIn9Tf2yBwm8QhONelRgEeGeMHCPjwdHQJwx/agAzXkvj2dqXGVT+dgb3/mRWU62HrBM4YGS85Zuon2Lde3Kbap3TXCsbbqArW4kbOZok8cZEhmfm0z1FYq6EMC0yrOuw9pY3W5+q5Gl4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i+3Tj3rU; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-223fd89d036so18906075ad.1
        for <linux-gpio@vger.kernel.org>; Thu, 10 Apr 2025 18:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744335250; x=1744940050; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fd8gBRS7KdSXCppq+uNgRvM7iia/98NvWArGNKufQiQ=;
        b=i+3Tj3rUTCPsTTtoYVBK2o1InuYZnDkM5g98PCZgIUD8LSB4wKeKyZE3HEK578J5wF
         5ufAEFDKvhXJRNEDseTiPHrkXJGimwR/4OlUkuzLDXoXGo6Od0NFtpMs0OdEOVlvFhxL
         W2LcnVdRsZa9fqyFqSfoSosOkum/WfuM1JQBwN/h22Wnh1eRb12ppn8vtK/b3Ev1iZv1
         +WT/8k6CrmoL279VfvTZWVS2hkJuxsI18B1p7E/q6ziZ2SsbEgfi/rN93T+/sxTD5MCO
         Y8QWJFXAEonIUqqP/AdpQJRQsYxkSTfYxUPPCEEQv/RzxOTuwb4Qi6KKE1+tI206hK8F
         /eEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744335250; x=1744940050;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fd8gBRS7KdSXCppq+uNgRvM7iia/98NvWArGNKufQiQ=;
        b=tn/xHsucYo0zHiV9ek7qoeMpt8axuDxDG6GTIO81S6lJuveYzej++OurrMsfg6Kzrp
         AAXOCJWmbrWo2N0VEHwISG/cgFBC/xqs4CGaSOeOZU7hNT/fRW9zLLQRUoelQ3fraeXr
         kAjqe7bHi0ds9Eyq/W7zBGXwbaPoNV/eE9A7uHwx/Pukn32B4gQ182MUQRAzDBQhWE9f
         D74z1MQnReFjoYEM6EMuxTUAaZJHZG0BV/JHf9ni8CJdVfIEfBRgjoYk3gpIVVvQkJj0
         9CTCYo4oVAX7VVzuhPStacCCs8hIOBVFGSPLsk7Pudw6kmEw7s12dGK/xxgURs7cdF3u
         4Rxw==
X-Forwarded-Encrypted: i=1; AJvYcCWf8/cHY7g5UblUqREzUBptvUjATDR4/Jt5yuvcSi/psqRorrkShSz96Mw9MvRjS1aUx79ui/rPpwPY@vger.kernel.org
X-Gm-Message-State: AOJu0YzikXhGOOqtZbzccf63jYyh8h1G3URqb6BZH0D3l43Or4bdZr6H
	6ngL+xRxFwoAhpPGw0X3Ck1r1tGXO3p/XKgQqh0rr2b5ukOOMOHHCnD5HyC2
X-Gm-Gg: ASbGncs/JPBmqY3IXI3XygQ0+vZKYZqwUNEtzqp+rgIpQtYpLxN4t8g1oEqNExsM11k
	6reK5GbmIBC8Fkc1ttJtysSh4uJSOn32Cc8ijdOCQeqENXw3CYuNwDW9OcwDDHiFxjyDN5/RBjL
	KP0Q4vTxeFXlmAc1z+RXs1CiNVDlH8lp4ZEXla9GXM24TkRFQvd4Bn+IyfvfhDKdzgRtKNKtcbH
	tsS47bTORyz5pOwXlGQxlvET0RS9DEmJiCXFvEq3qg8IB0UqOe/W5om/Qtfp6KBq81kfaz/2rAZ
	jwo9FkvFrflm4CfZgwAOdclw2hjMMnlxAw==
X-Google-Smtp-Source: AGHT+IG3W8X2HIftSLIMJCekEV53DK+OYiwW7fW9+ezG/ydjPXWfbp27yw8g/Josk4u7do1IvdSplA==
X-Received: by 2002:a17:903:3a8d:b0:229:1619:ab58 with SMTP id d9443c01a7336-22bea5027dfmr14078385ad.43.1744335249965;
        Thu, 10 Apr 2025 18:34:09 -0700 (PDT)
Received: from rigel ([115.131.241.66])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b8ae95sm37587195ad.61.2025.04.10.18.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 18:34:09 -0700 (PDT)
Date: Fri, 11 Apr 2025 09:33:58 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH libgpiod] tests: uapi: add test-cases for open-drain and
 open-source emulation
Message-ID: <20250411013358.GA47403@rigel>
References: <20250410-open-drain-source-tests-v1-1-a062d2280cc5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410-open-drain-source-tests-v1-1-a062d2280cc5@linaro.org>

On Thu, Apr 10, 2025 at 11:17:47AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> The kernel GPIO subsystem can emulate open-drain and open-source by not
> actively driving the line for active and inactive output values
> respectively. The kernel does it by setting the line to input in these
> cases but this still must be reported as output to user-space. Add new
> test-cases that verify this behavior.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
> Andy's comment on a GPIOLIB patch made me realize it's a good idea to
> add tests for open-drain and open-source emulation in the kernel where
> we don't actively drive the line for active and inactive values
> respectively.
> ---
>  tests/tests-kernel-uapi.c | 87 +++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 87 insertions(+)
>
> diff --git a/tests/tests-kernel-uapi.c b/tests/tests-kernel-uapi.c
> index ff220fc..5955fac 100644
> --- a/tests/tests-kernel-uapi.c
> +++ b/tests/tests-kernel-uapi.c
> @@ -110,3 +110,90 @@ GPIOD_TEST_CASE(enable_debounce_then_edge_detection)
>
>  	g_assert_cmpuint(ts_falling, >, ts_rising);
>  }
> +
> +GPIOD_TEST_CASE(open_drain_emulation)
> +{
> +	static const guint offset = 2;
> +
> +	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
> +	g_autoptr(struct_gpiod_chip) chip = NULL;
> +	g_autoptr(struct_gpiod_line_settings) settings = NULL;
> +	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
> +	g_autoptr(struct_gpiod_line_request) request = NULL;
> +	g_autoptr(struct_gpiod_line_info) info = NULL;
> +	gint ret;
> +
> +	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
> +	settings = gpiod_test_create_line_settings_or_fail();
> +	line_cfg = gpiod_test_create_line_config_or_fail();
> +
> +	gpiod_line_settings_set_direction(settings,
> +					  GPIOD_LINE_DIRECTION_OUTPUT);
> +	gpiod_line_settings_set_drive(settings, GPIOD_LINE_DRIVE_OPEN_DRAIN);
> +	gpiod_test_line_config_add_line_settings_or_fail(line_cfg, &offset, 1,
> +							 settings);
> +	request = gpiod_test_chip_request_lines_or_fail(chip, NULL, line_cfg);
> +
> +	ret = gpiod_line_request_set_value(request, offset,
> +					   GPIOD_LINE_VALUE_ACTIVE);
> +	g_assert_cmpint(ret, ==, 0);
> +	gpiod_test_return_if_failed();
> +
> +	/*
> +	 * The open-drain emulation in the kernel will set the line's direction
> +	 * to input but NOT set FLAG_IS_OUT. Let's verify the direction is
> +	 * still reported as output.
> +	 */

My understanding is that FLAG_IS_OUT is always set for output lines,
even if the direction is set to input for the emulation.

To quote gpiod_direction_output():

set_output_flag:
	/*
	 * When emulating open-source or open-drain functionalities by not
	 * actively driving the line (setting mode to input) we still need to
	 * set the IS_OUT flag or otherwise we won't be able to set the line
	 * value anymore.
	 */
	if (ret == 0)
		set_bit(FLAG_IS_OUT, &desc->flags);
	return ret;

Cheers,
Kent.

