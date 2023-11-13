Return-Path: <linux-gpio+bounces-72-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3227E9E63
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Nov 2023 15:16:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 15BBD280D64
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Nov 2023 14:16:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4779320B0B;
	Mon, 13 Nov 2023 14:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WpKDgd+u"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C9AC20B0C
	for <linux-gpio@vger.kernel.org>; Mon, 13 Nov 2023 14:16:13 +0000 (UTC)
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E14D11715
	for <linux-gpio@vger.kernel.org>; Mon, 13 Nov 2023 06:16:10 -0800 (PST)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-5a822f96aedso53105797b3.2
        for <linux-gpio@vger.kernel.org>; Mon, 13 Nov 2023 06:16:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699884970; x=1700489770; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VsObpwiNRRoDaNBTqnKKwKCtx88JHZeh51II3/PGBnI=;
        b=WpKDgd+uVI58OVzn3e8kkvCc2MG0lGpmQSwcahu7Eyf3MnRjB+FPG9MYSg5xLXU26a
         FT/fjGlunh0ABlb0pd6vjuXUgQm53kPl9/5xlW824g+WPAdMe30vajXMbbvuCXI1/59h
         M4fADNOddQFkhn3THqo+4YyJTN8pCtiuhRXgrQYjFKEDeIl2PwHStx8M6L0td5kvpRhv
         AoQvb13Nqpapq2ZFvm97ERRlm2KcekWL3tgIupr4x9t4qe5XNV0T1q1XO58VjL1EAfBX
         w76PEUCZWtESIJRrlIX7EL9GURRhxbA2PfMK8HRFZLnZUOK8Y+2Jqi912yvtH7qAXqoV
         lE4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699884970; x=1700489770;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VsObpwiNRRoDaNBTqnKKwKCtx88JHZeh51II3/PGBnI=;
        b=S0WW7VNkxnKYtjVPQLjnnWtM9HEpgKkKlrpBOJaIaNJDUYiAqCLF5QpmE9Cga5/MbC
         5+sQMLzEvENMwpflzEr0LQdfGCEj0wh9xd5lxUJ4xA/4tGlHlkF4xpEGQTYS8ISgSnV/
         BCh2l8o8BpeXsqSwkthm/7xOul3MFeMtzmbEhapSfnT2+MfzPtjhU4looHaTNuuupA+c
         zLp6a6+iR7T/o8q5VwXYCMkWg6c3KmOx8gtUjrmcjgnCHXecvGtRZh1o/3k9Ay8v27gZ
         K4qlVq05gRQqMyJ/YRoIXZsXqUvJA8dwynEk84pZioRe42tAUHOdOZ9JK0M4j3o45aPc
         aWag==
X-Gm-Message-State: AOJu0Yx/Gr4CSJYg/z3aX8OYFzhG2P5NByzdhecJYcWvx2c7n6PWvBRo
	UhgbMp3z0EXhb8diGyS04w4eHRYlsg/KzeC+XG1ijg==
X-Google-Smtp-Source: AGHT+IEfo3yjlThVT/1VbEzaAtk/giSVbUC9q6aHRoszCrkPGNGtNlWOQLaQkv5lYlgVl+3GIUdM37qvyenBOQnoLpA=
X-Received: by 2002:a81:8085:0:b0:5a7:e4fe:ea3 with SMTP id
 q127-20020a818085000000b005a7e4fe0ea3mr6865035ywf.22.1699884969990; Mon, 13
 Nov 2023 06:16:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231031015119.29756-1-larry.lai@yunjingtech.com> <20231031015119.29756-3-larry.lai@yunjingtech.com>
In-Reply-To: <20231031015119.29756-3-larry.lai@yunjingtech.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 Nov 2023 15:15:58 +0100
Message-ID: <CACRpkdbPWxQMz_1gG1He5QN65BActhyea_KBv2cyQ_VQxc6Feg@mail.gmail.com>
Subject: Re: [PATCH V7 2/3] pinctrl: Add support pin control for UP board CPLD/FPGA
To: "larry.lai" <larry.lai@yunjingtech.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: lee@kernel.org, pavel@ucw.cz, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-leds@vger.kernel.org, GaryWang@aaeon.com.tw, 
	musa.lin@yunjingtech.com, jack.chang@yunjingtech.com, 
	noah.hung@yunjingtech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Larry, Andy,

On Tue, Oct 31, 2023 at 2:51=E2=80=AFAM larry.lai <larry.lai@yunjingtech.co=
m> wrote:

> The UP Squared board <http://www.upboard.com> implements certain
> features (pin control) through an on-board FPGA.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Gary Wang <garywang@aaeon.com.tw>
> Signed-off-by: larry.lai <larry.lai@yunjingtech.com>
(...)
> +#include "core.h"
> +#include "intel/pinctrl-intel.h"

As mentioned this is using the intel core pin control driver infrastructure
so I want Andy's ACK on this before I merge it.

Yours,
Linus Walleij

