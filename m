Return-Path: <linux-gpio+bounces-2833-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA2784485D
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jan 2024 21:03:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 80B511C2327D
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jan 2024 20:02:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 810153EA9C;
	Wed, 31 Jan 2024 20:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gQFT8LE+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5693EA9E
	for <linux-gpio@vger.kernel.org>; Wed, 31 Jan 2024 20:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706731375; cv=none; b=bdm4Guaa5YHTjJytqeATW3DGtEGV6cFmI2D+DnbmZ5hO4f8wAWXQ9HQztH/NNcHCJ0443/mZgElv6NlDUWCFVwPiTfHLksije6aCG0JGW1fMnncsyOXsJBJaybRrFlhvgyeJXUNiUefTNhjzu3PFGWH8KAUEeBXtHuOkM3fk+8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706731375; c=relaxed/simple;
	bh=zprpkozM0tCVIALr5Eipl7GRJJSdJxZD1T2oe3B17e4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LliGY1UYpXvStJgk2jVbG81TL2XCXZZtrx5QFdJXcXvLdwAVRdnYmwxEj2pqeZqVjTtSTOoU0+S2wlPLWzdiV3Q3ZtdcSys9o4WOtO5fx0nh8Z5qivliRSpUBL+VXyexzr6Cw+x/pep5n3tbJ9Bu63uwmuyQ1c3jxu1bdWYkU1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gQFT8LE+; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-60417488f07so1802917b3.1
        for <linux-gpio@vger.kernel.org>; Wed, 31 Jan 2024 12:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706731372; x=1707336172; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zprpkozM0tCVIALr5Eipl7GRJJSdJxZD1T2oe3B17e4=;
        b=gQFT8LE+hXsMJf8MNDJkrJWOBiD5JMqccbtkb2YhWekF/ONUzRABqQTr6mq1luPmvp
         TiARxOOgcPus1ejXpOzQd2zO5283HBLspmoa7NwpEle+mitGNhbvF0R0TF5ZUvVjPihY
         2GhUIYmcQpOc6frqN1vF0VrX3t0PlMLX2gbEdlg0tLe7fKALNpSMUwvG/hX34M7Op0BP
         kRuh9WqJGKj13R9d3ZNEgiM30WpaxaDDTa7oVg806/vxg7+fig4vJfBLPp/8ODWUVHEi
         MiwjUVUGk9xJsxmZfESNHM3PPiC57YWCTZvw/cD0vgS3AcbWdpO42vAUXZMBHbY0d6lB
         ubjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706731372; x=1707336172;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zprpkozM0tCVIALr5Eipl7GRJJSdJxZD1T2oe3B17e4=;
        b=LmeyZEGAvHgzKhheMIu/0FB4gtxaPpcrTvVk3T8nXhX4r8prLQYoG3Bh8oKDJ6Cbi6
         3650FaW89iv/IVk5YpT+1Wwq/UlUJzp9mrTSBnLTOuYvQcIFFecf7HsWG5+r7KATTEQ5
         C/xW8SSFgUZIfD1B/5rxgri56H+Wk7Aoy0YB8oEg9/9go04tR/H6e0/z/BBVsy2tTjlD
         gj73zT6cRdjMug3dDTqtpt8xYJ8PD3FLYYd8kmUsWgphin7yY5SKbOf2BjgtbVLOp3u1
         WOigmjofvEbAYXLLUP3LLfcDDs75TGIiIXlERuVsZgcbE/jBsNKDvrn+OwDFYdjeX/mF
         pTUQ==
X-Gm-Message-State: AOJu0YwDLVII9tfQot1twz169d4V+/565p7ewsIMankwreboG2cFNtc2
	c5dR1Z9hKXcilCY7Ae1wYXqbD03sGXX0cxPxZLCD52VpWxKGSCY3y7Pu27+l4c2OR2d1S9gv0oO
	nJ15Tv5MtSIg7l7g6RbbURGUWuSqPxrZ8R1pQVA==
X-Google-Smtp-Source: AGHT+IHsBOqnKl8Q3AQ240lIC1W7B/6kxdi89ryEJu/r1AOMlJmIiwcyKebUqH3V3E9ZJtNO+TOiXEg0rZALWMSztBA=
X-Received: by 2002:a0d:db55:0:b0:602:d2e8:93ec with SMTP id
 d82-20020a0ddb55000000b00602d2e893ecmr130081ywe.26.1706731372679; Wed, 31 Jan
 2024 12:02:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240130124828.14678-1-brgl@bgdev.pl> <20240130124828.14678-12-brgl@bgdev.pl>
In-Reply-To: <20240130124828.14678-12-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 31 Jan 2024 21:02:41 +0100
Message-ID: <CACRpkdZjpSDsTdnk79gmvCKfugKg4xFMC4m9RLaJXypFNSUotg@mail.gmail.com>
Subject: Re: [PATCH 11/22] gpio: remove unneeded code from gpio_device_get_desc()
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kent Gibson <warthog618@gmail.com>, Alex Elder <elder@linaro.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, "Paul E . McKenney" <paulmck@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Wolfram Sang <wsa@the-dreams.de>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 30, 2024 at 1:48=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> The GPIO chip pointer is unused. Let's remove it.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Oups I think it was used at one point but we probably factored
ourselves away from using it.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

