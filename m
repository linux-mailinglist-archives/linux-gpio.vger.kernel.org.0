Return-Path: <linux-gpio+bounces-24375-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F2FB25A29
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Aug 2025 05:58:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7BB041C02E64
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Aug 2025 03:58:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8141C1EB19B;
	Thu, 14 Aug 2025 03:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EKHSha6q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B16B188A3A
	for <linux-gpio@vger.kernel.org>; Thu, 14 Aug 2025 03:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755143875; cv=none; b=E9VMZaVxqydfadjxVIR71REXnM1BKNlWJusW+JdSrIHv3eia6hN5K2I8PRU64u8af9EMfZROb/arbDRiZ0Lp6gQNWZFKx6XdE3LMuxUlju/sNIPXqWMeqAHCFmNvVfzAX9IW4yu7hzCrsmHnSLDh8Se5LN0c+LgEO4KRa3yy2pM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755143875; c=relaxed/simple;
	bh=KuAzkdu+nBeW4XQJu6RSp1V8OBm3suYsUZfkIRqSD68=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YQzT3pzo4obvRlaKGqYu9r4x38eVvQuxaaZG8A7qFUcfWZ6pGXxQykUE4ZnY9TZGcdQeWczcoT8kstJ7C9FloJFsh75CPh+iFOpcVG05dyRommACbeS6foXh/OJT+PcCmNaeIrASCrxO5WbqUjiKPL3+vcbsXlJr7a3uzvmOKik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=EKHSha6q; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-55ce520c9acso526790e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 13 Aug 2025 20:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755143871; x=1755748671; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KuAzkdu+nBeW4XQJu6RSp1V8OBm3suYsUZfkIRqSD68=;
        b=EKHSha6qdcBlsS3gXN4Cw+T6fWwdA1YCyfFc5q8C+8u6tYxjS3yl3WEbF+GocUde6a
         Yr4akzI6BV7tlc0LbiOXzgB/ACP7W21rMCxsdytPp7bq7N3Oot9ZRftp5aDUg4ZN4OKs
         loF7b7jyJYM9Acbf/YX0K99D2wwAo400Usa/0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755143871; x=1755748671;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KuAzkdu+nBeW4XQJu6RSp1V8OBm3suYsUZfkIRqSD68=;
        b=KHx2VY6oLtkkbQ2pfHp1Py0wa0SuLyi74v46lwqijIPhrlgo1ySksEtfpbVLNdSDm+
         hujHQ+0pcG9zFINXb/TaUJLxnzvS25mznJlpKxj0AYIg3C+dDm6uYEp/HQ9bz7hNPkXO
         e2rsiCoka1vdiAfN/5QAPhZ0EIlRPHByeCQwqjDYvVZxNlUWnvAmHnRqLBhyiNry0M8a
         +2Z5Ct5rlQesKDf3fu9HXVEpkI01t/5CZSn4rFgw4NHLQlck6KT5ywMqyHkBkdBSF8IG
         FTtgUzBZR6naTCw0Zc5+5LcJbr0+zRPF/zA5dFp2NrfxBk/gbRNHu6u1/1QzMooMV7m7
         Qntg==
X-Forwarded-Encrypted: i=1; AJvYcCVhMqsxA4rHTuB43h0OCHzt70bm8UZCEcDFlxwQDCRqq00ZnW8Xe+6/Sf+mPXxfAMKS47WQhUFUTn0/@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6dBCq1vNI1RDdhznYNBxTBFdOZLJ6zB8l/rbXeWexUOqdxnin
	rNAZcDzT3L18URF9HMGiKapP58GVc7tlklGRjgyefIDN56+tZ/Ot8hb3iCO1ec1YFfLBQw+ubyz
	QTFQy1PaOtK87vhlGXTrqpzbN3XTkN5AF0EXFl0EY
X-Gm-Gg: ASbGncuYjgdX8JNPVfTLGoMvY/tFBpoqaipLTm8GeAc/q5ScvslJRIpuARd0BU5RDLc
	4YVx/i/jm2OdvdHwYFgiH1UVudsRIGzYfZeR+HCdos5q/x2B9dsgBfLsI6wSVXtMtxo9fI8Ev5z
	PFixDvH1dvvjnI0cbIKpoVeSyudd6IrJFKaBaABwdl+U5EX5Ck1AF6P6KiQzhHcg/8qf40ZvVva
	Bsm4P+/o/ssav7GsrQeFdXIugDWF+SwJLLh737ILRjnqw==
X-Google-Smtp-Source: AGHT+IF+5iKv8rMK9YHb6myK/q855kRCdUIsQfOlyE7uVil4m3zuwOKJ3gr0xAyECxLHg6Jl7SqsZkrMsfX9UPSHH2s=
X-Received: by 2002:a05:6512:b8a:b0:55b:8211:cc88 with SMTP id
 2adb3069b0e04-55ce508ddefmr488807e87.51.1755143871084; Wed, 13 Aug 2025
 20:57:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250812-pinctrl-gpio-pinfuncs-v4-0-bb3906c55e64@linaro.org> <20250812-pinctrl-gpio-pinfuncs-v4-4-bb3906c55e64@linaro.org>
In-Reply-To: <20250812-pinctrl-gpio-pinfuncs-v4-4-bb3906c55e64@linaro.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 14 Aug 2025 11:57:40 +0800
X-Gm-Features: Ac12FXwH4SzGC_raZvHd6w5DhOOOwcWIZ0DYC3dWkFgv22xak8lk2qDrshBunvY
Message-ID: <CAGXv+5EDj4JEKAFC-Sv8kyiBNy8SViEXaepdssG5QTu_HtYQHw@mail.gmail.com>
Subject: Re: [PATCH v4 04/15] pinctrl: mediatek: mt7988: use PINCTRL_PIN_FUNCTION()
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Alexey Klimov <alexey.klimov@linaro.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Tony Lindgren <tony@atomide.com>, 
	Haojian Zhuang <haojian.zhuang@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
	linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 12, 2025 at 8:36=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> We have a dedicated initializer macro for defining pin functions for
> mediatek drivers so use it here.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

