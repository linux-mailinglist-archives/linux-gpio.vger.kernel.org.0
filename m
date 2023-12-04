Return-Path: <linux-gpio+bounces-970-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FAC0803521
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Dec 2023 14:39:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 37F891F2114A
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Dec 2023 13:39:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D16E425116;
	Mon,  4 Dec 2023 13:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="F8aQ2blY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com [IPv6:2607:f8b0:4864:20::e2e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E98C71727
	for <linux-gpio@vger.kernel.org>; Mon,  4 Dec 2023 05:38:55 -0800 (PST)
Received: by mail-vs1-xe2e.google.com with SMTP id ada2fe7eead31-46486775ad7so513690137.2
        for <linux-gpio@vger.kernel.org>; Mon, 04 Dec 2023 05:38:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1701697135; x=1702301935; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AKB+uMlW5RGX9ZA5gMhf7/cK7rF96At60/fWmnTaGyU=;
        b=F8aQ2blYgefWHcGABhi/Z+Kx0yRP4RtOg5Xz/8jDKVLRHS9H+Bi7ZXlAZB7K9FAgsD
         9roG8gbFuV4rR2FudZgimSR7CJofFqnbqMydbdPubS2LC051Pg92S6ItrpuJe0D/E7HK
         t+7bYkw+dcDz4zbxHj3oAdPqV8RinEP5KIFtxFO+cI3glsgdVjFGICDCO85gqYm8RD5E
         GnZXErVhQ4tj5BDy7e5v4szDJBx+Ze6uvUv6DJVsHGtZi/YQgnXD763vls3SKNatlxha
         A6MgwVsv+QFQ/jb6xf/yT9QTMTeTjdkz1/zFBBDG+maJdbiQFWibPsvK+ClRst+o9IPu
         ZdjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701697135; x=1702301935;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AKB+uMlW5RGX9ZA5gMhf7/cK7rF96At60/fWmnTaGyU=;
        b=NKXhyKFViSLRrm5TvdodkE9CrazzYoSVA1AcsABHXeNO6aKj4HnZE8WKkye5CC2DdI
         vtgYi8FmW4g98zMnRAasq/Mme7i9FS3mmHZ+C02bh11kfR+v1eWIAdQwcOrw6dBMrWzo
         B/OScimPI+gl4u9w+ikFCEjKTBz97rQHGOjkPZx7OnTsEjfvz6OxePyNIolFTJv+ZDB7
         t3u6kkOfj4Aa+roKTtLTZOxbG/3lmQ6mEuGx17Wh7acp3rDXPLO8sm9c9udqUX6x7MLR
         p0v7CEce+wZlSUUb9xKDeh3r2xjNuGsaP/wLOZsB8B6O0Z4LxCourZCWdx76TnyLwEYc
         mX4w==
X-Gm-Message-State: AOJu0YzBMXHEKK6fdSxBIKd6yZtut9Pb/SjZJ0fcIca/zO/IxhVWlmq+
	pN29BY3jTHCELk8QzEhrLrCIlwNyDWsiN4FLiKKN1w==
X-Google-Smtp-Source: AGHT+IFxp/ngB/jWWyxWf6QUNfeJHPSW53ZhCEky4m7MbK0NguMBdPuJ575nZkXXBgcTLxs+HynZzd0S3V9gYSFrylM=
X-Received: by 2002:a67:ff11:0:b0:464:4a8c:783b with SMTP id
 v17-20020a67ff11000000b004644a8c783bmr1717905vsp.12.1701697133511; Mon, 04
 Dec 2023 05:38:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231204093509.19225-1-brgl@bgdev.pl> <20231204093509.19225-8-brgl@bgdev.pl>
 <ZW3RwqZHvRRoYLXn@smile.fi.intel.com>
In-Reply-To: <ZW3RwqZHvRRoYLXn@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 4 Dec 2023 14:38:42 +0100
Message-ID: <CAMRc=Mcgi0_YFG+KSyXgmOTTjM+C+fc6oEGw+mcdv1PQgH6SUA@mail.gmail.com>
Subject: Re: [PATCH v3 07/10] pinctrl: baytrail: use gpiochip_dup_line_label()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 4, 2023 at 2:19=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Dec 04, 2023 at 10:35:06AM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Use the new gpiochip_dup_line_label() helper to safely retrieve the
> > descriptor label.
>
> Fine by me,
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
> Still would be nice to have an immutable tag/branch with the first and
> this patches (at least) that I can incorporate into my pin control tree
> (TBH I do not expect collisions, but just in case).
>

Sure, I said in the cover letter, I will provide one.

Bart

> --
> With Best Regards,
> Andy Shevchenko
>
>

