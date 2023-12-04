Return-Path: <linux-gpio+bounces-948-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7205D802F25
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Dec 2023 10:47:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1BADD1F21103
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Dec 2023 09:47:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FAF51DDD9;
	Mon,  4 Dec 2023 09:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zkuwnamv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A64AF5
	for <linux-gpio@vger.kernel.org>; Mon,  4 Dec 2023 01:47:30 -0800 (PST)
Received: by mail-yb1-xb2f.google.com with SMTP id 3f1490d57ef6-dafe04717baso2615798276.1
        for <linux-gpio@vger.kernel.org>; Mon, 04 Dec 2023 01:47:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701683249; x=1702288049; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I/Va0kOOCQXMJr2TQKWKwJ9zWUP7bBtr/H8JK5walkU=;
        b=zkuwnamvBvJpJncHSIT7eWV87jlt1VfEXLXEGuAo8/GRKGsPcChVxAZ9UgKvNgmUes
         R4PO8bnoJRTwVtlqrxJKZwN20ij9jSgCBDDsdbXvWCHUp9XX86+tTFCWQogUfBwWF/Fc
         Gttd3+ITjvX3AqIv4b+St4K4sW84a3RmYjZbJr4CENY7G/m8HwC8zOz/vQ8r+QoXfLbn
         XAo9KXv0g/xexyBdWH4As88DtS1XqC00XbkC4hUf05HyBOxuOCLIqo4yrRf4kNI1mXtg
         Ob4pEnp2AF09w3jRDjC0LfSqKvLcMGLBDbVdthYlDHEZ0p173x9hEueXaa4ino2RWPR5
         LMww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701683249; x=1702288049;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I/Va0kOOCQXMJr2TQKWKwJ9zWUP7bBtr/H8JK5walkU=;
        b=jFPRMRdbKgKUWJDdtX1VqoD+FwLDmVP7DVBY57FCr5f9ASXfiWL9ueobC3eCb5kwdh
         Zee0+X+qKFYKt61yFcj4NfCIEcZX7SYkrcQbEn7hlWmLHbz9bw843EO/O0l5t/JOSfRb
         5sFPsTIXtnADoScL7ZnlLFOlCcbG6p3mggR5+UlErrkkB6IHUT0tO8j+xlHEVhVF2r91
         z59LuvZlaxTtk/1UDuQveT/PqGkST5lcrOvOXLyPSpPT2Zac5AJzt3qPyXZIiVmGQCrH
         Hq9cYvmRIUwir37hkcG/B8mLVs7joVcvFmR1UgNHgpLBWoMknXOlnOiw80AVB1LYasIP
         5FpA==
X-Gm-Message-State: AOJu0YwjRLh7VKisXTqGQFZDOjkrgUbWei/sLYrvOBswPjdfYOfOBLn+
	g9DRZ55I9ZTTdzEQnKyZZKkelTbIsBm8UxTW/haBFw==
X-Google-Smtp-Source: AGHT+IHzmn4R3eDwNqxLIvsLdnuOrMgDl1kyI5pUXW4FtxkQmVJw7pplvdOzdsQmeJxtozIgo/BWo3hmtyPbnRvdWuw=
X-Received: by 2002:a25:824b:0:b0:db7:dacf:6fe4 with SMTP id
 d11-20020a25824b000000b00db7dacf6fe4mr2504494ybn.108.1701683249364; Mon, 04
 Dec 2023 01:47:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231122144744.2222207-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20231122144744.2222207-1-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 4 Dec 2023 10:47:17 +0100
Message-ID: <CACRpkdZtCOwmVa7_vyCfs5i3GVdvopNAGA3rPyij0EeLr8e4MA@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] pinctrl: mediatek: Switch to use no-IRQ PM helpers
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 22, 2023 at 3:49=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Since pm.h provides a helper for system no-IRQ PM callbacks,
> switch the driver to use it instead of open coded variant.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied!

Yours,
Linus Walleij

