Return-Path: <linux-gpio+bounces-23180-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C2CB023DB
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jul 2025 20:38:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F423BB46843
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jul 2025 18:36:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC9CA2F4324;
	Fri, 11 Jul 2025 18:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YzeykREn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9387F2F4313
	for <linux-gpio@vger.kernel.org>; Fri, 11 Jul 2025 18:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752259041; cv=none; b=oy4MheI8d+eHw7/9yUrah7pkQS5XicFnl23VvTgtGZyrHTq6l9kY6e+IUO9YangdzLNZBHAQ/wpedQIzgctgLjEQCcsr1QVhpgL3AI5VSYV3IdCDiEJiV0A0Sokl6PrIr+Al4ipA9HwV7eVDGlNCafNCbSP6fKJQTKo3FdTjPjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752259041; c=relaxed/simple;
	bh=GCf8INkYZkwdneE2A9LSxUiQ+fJAXd8182xLW+8Tlv4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NAS1lkHhXelGdysrOet+woQw3mj1mi/J5wOUiRp9JkFGonM/hSuU6iL1uvYCQ1DvzeLZmBi9Y9QaTHSgQOZwvCvTaxcXhBbnb2Ome9VdBUsNVh9vHgBjx3RphiKDK6YFCI8PAX6jp3ZYTMatO/8hV7zPyArrKATj1I10mCqL+EM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YzeykREn; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e81f311a86fso2193343276.3
        for <linux-gpio@vger.kernel.org>; Fri, 11 Jul 2025 11:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752259038; x=1752863838; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GCf8INkYZkwdneE2A9LSxUiQ+fJAXd8182xLW+8Tlv4=;
        b=YzeykREnSDumnHnI69/YB7/HpOqUqffv9kuxZjKKZ7zHR/qUEZ4RdTCLBFluf6Ysfq
         Z8AJUhw/0M1fkETJe8jqQl4raHuI26UmI7Gb3xsX+DZYpa14Mu9/mhtt9is6U0bCvfXa
         ehtu4PAeRG4NuM6PsfXTaE+JMROz0csJLMzK4Kgo8Gyqz1gLrl5EX7iw4ndjx3yDUHMA
         Bt/9oLQEdQ8MQxbTonaCMGzyf0+hv2Owrhw99s1IR5VRvAHr19/cKZBLgMTwPCelNMbQ
         mBzqS0Lo1lhkPRflRJiancMNILRNukqXxLf4X2dKsKFpfXGl0O9+L1LWymVW7Qcr5+JQ
         /mqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752259038; x=1752863838;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GCf8INkYZkwdneE2A9LSxUiQ+fJAXd8182xLW+8Tlv4=;
        b=ExjjRc/0Nk252ljb7Ws3G6vDkmjzwTbe5s2envuFMs9/WNqivRGGbIqhTk9Y3W4YtG
         ntUx5AlW+HPudMUHSqt5FyiQVCI+WzbZZZxwpUh+A4n5lqJzEMLcRXRcY6Wy6Tw2v0sz
         90dvP6SFfacEFRwHNh5cDAihTIiVZRpD+lu/YU602F4v3CfKw/O+pqAZOPZT7nImgWx/
         2un7815O7Rr/2OPF5NHesdY2BP7J0d6lUqUAfKrPMOiqducTOBv/94w12QVsLRkGchXx
         9DsBjsTGQH1ndOsHX05jDsChu0ajNtwm/Zt0O6jbKBKShGhyDDKVg6KWc7DLmrp1jBSy
         8XRw==
X-Forwarded-Encrypted: i=1; AJvYcCUTjtga6mOcjoZMJN0fkpN+mr4/Z9hPQoTa8Nh31sMIIl7QeHDxop1kr+3kj8srn10wTuMFzc0TSxK2@vger.kernel.org
X-Gm-Message-State: AOJu0YwU2MkHbNrOPT+LrjxT+O97CwABwiPl2N9IcvyHHT7TVlmtw8uo
	pYbA4DOqi2w4Z1vLI5XxlClwtVD1z7BLEVW/SxUUkX4NrrWg9gGA0OstrruGJZ8ZU5bsTxjMXzJ
	FpkIcfeT0toxsym38hjnKTMh1mH/RAtcvuUxbE5Eqdg==
X-Gm-Gg: ASbGncvbLmT+0TU8gntFZwNWeJP5fiGVjXoroFAQ2e5EjhWetVD6wAhevq4cHBx7uXP
	tmf+auf/ctyWh1cOHAfD8vrHYk/wnLv/HUxo67BM8NpuaggVQdLBdyoJI0e2O2iBlpnG04wbBXi
	fSLQl9UHCau5sQmrVWOL68GbxGeRfPHYN+l3BKcjMNiCaPwsAnh8SiU9Ii7bFEc1mmF5VCyqZYI
	ykLpjY=
X-Google-Smtp-Source: AGHT+IHzkdQtsARg4tgkPF4WasK2Xo6Mfikt+zRNsUMsy8+DUZg6XHckhgK5mt593KfRZFbjIPg2gYdMMhURtB+dxr4=
X-Received: by 2002:a05:690c:f05:b0:710:e7ad:9d41 with SMTP id
 00721157ae682-717d5d7aa0fmr72034937b3.12.1752259038573; Fri, 11 Jul 2025
 11:37:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250709-pinctrl-gpio-pinfuncs-v2-0-b6135149c0d9@linaro.org> <20250709-pinctrl-gpio-pinfuncs-v2-8-b6135149c0d9@linaro.org>
In-Reply-To: <20250709-pinctrl-gpio-pinfuncs-v2-8-b6135149c0d9@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Jul 2025 20:37:05 +0200
X-Gm-Features: Ac12FXzfU1xcaSYLqYAP3dXdgN5KjaQup50oBj2gBIW6fBcQFAAh4KjvNIaCjNI
Message-ID: <CACRpkdYfRv-B=p61tVThFkjoqDGfcqOjmHxmj4wv-NYyky2-kg@mail.gmail.com>
Subject: Re: [PATCH v2 08/12] pinctrl: qcom: use generic pin function helpers
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Alexey Klimov <alexey.klimov@linaro.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Cercueil <paul@crapouillou.net>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 9, 2025 at 4:39=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Use the existing infrastructure for storing and looking up pin functions
> in pinctrl core. Remove hand-crafted callbacks.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Needless to say I'm a big fan of this patch set and it seems only
this patch 8/12 has outstanding comments.

Do you think you can do a quick iteration of it or does it require
a lot of time?

I am tempted to simply apply patches 1-7 to make your life
easier past v6.17, should I do this?

Yours,
Linus Walleij

