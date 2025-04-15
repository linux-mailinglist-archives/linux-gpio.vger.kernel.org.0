Return-Path: <linux-gpio+bounces-18806-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5F6A894DC
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 09:23:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 99D403A707D
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 07:23:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AF5E27A122;
	Tue, 15 Apr 2025 07:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s0aWOljH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E33F279907
	for <linux-gpio@vger.kernel.org>; Tue, 15 Apr 2025 07:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744701829; cv=none; b=evj0IYqiRARB/IXf5TDxioDlpOy+8p/g0A6IJ7MqXM+VGUaP79FP9DJ/4URzRvJhEGVneNyk/Xr42Ay8nYEG8kMLXZWEcQff+MEHQMKt/5iC4pT7YBR7kdy1V+Pa9g1/BOu72GtKknGBR3N0wa8BOFvHekmDfj1C+FhFEMm5Gl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744701829; c=relaxed/simple;
	bh=UDj4eAeCiIPS1KrBXrK6pNmhKNCEyzIvzN6l8yfOIt8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uirhfjdDnNZDrpEaigIu3lJw8cJ+om/ZeGFn9OhqzgloCyt+2oILN5IE1iw++JbvdFtKVEWvwsRgbB869SOQ2PqYgIrWiR6poWXBVL8WmQJli7kmJZTYS/qWn/EGWNeQEUW8DdHb579IaoxrEIjq+4HWji2OZOJ1PRE57NTDnRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s0aWOljH; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30bf3f3539dso55281921fa.1
        for <linux-gpio@vger.kernel.org>; Tue, 15 Apr 2025 00:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744701824; x=1745306624; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UDj4eAeCiIPS1KrBXrK6pNmhKNCEyzIvzN6l8yfOIt8=;
        b=s0aWOljHtl3DYidT4aBuJ5RbOxGD9xuVQ7XbynkofVHRGqgSxThq2b/B0pWaoy4maz
         auxxhCx/GtAGSO0VotQQynzt+4gcaYpVSeWmWWYD7mdXYfqz2GJC75tK+MJv5UluprA+
         E6D4Bq1vpEYg92kphPPOahfOs06pLP/evDQK02BnCI6bvavUEMdPlAhpO5LHP6wDHOPF
         ugVSHq4Nhx8ih2HHPLHAJKSN4nzEMWwcPg8u89zEwPFMLlKTlvG8PWaYt97TOsTz3era
         h3BVoZKC3RaadKJ2aI4+Lk8YLjSF85BJTNcuSRg16dWdASx6XTYDusqGbdIYFjK3SBqk
         gkGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744701824; x=1745306624;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UDj4eAeCiIPS1KrBXrK6pNmhKNCEyzIvzN6l8yfOIt8=;
        b=K9KD53ZnwnRPqFcIk1MpZnIxbV73v0Maw0piyJzBsZGRTvPrC91H1mqfQukp3edocC
         0JRoYbOlJEcrye9UzntqSa7BsoMkaOfeDcDfN/ACGsSqF0dPrDFfmuzhDDUhYsZXrOWN
         pRzni27q246TT2A+SMiV7NSmscvVL9yBTKi40P8BXF36E0oP8qVLaT5TnvizWrEA5paV
         gtGxhjhRUgpGUO7UmuTQDjoOLHgSPqMzLoq5rgko8YMLHWK5RKtH9H9GmLix3aGLGNR0
         oqJ6i2FgEzKdMnt2TmBZcfOdE2dyblJjpD7mUzCP69X9wm2S/qJxtIkuUi+IT1PH37CH
         0eLw==
X-Forwarded-Encrypted: i=1; AJvYcCX6GOhbNE0okaJqljtzAlH1X74YYatI5tKpJKLcx0N0KlAMCUe0oVAteo9s91JBuEU0OlxSqus1TuQh@vger.kernel.org
X-Gm-Message-State: AOJu0YwE+XOk8LBXxjSep3ByoZqtERbB8FM+0vxGa7aXN0fDe+Ptfizn
	eq6YuTYSqrfvyQHI/RbixJ7N/jN7VDEca8MuxnzlT566DCemqws296Ab2TCei9SPFM8AIsgNTEs
	ilT7/wU0z5L0DuZEkjYp222UwXAMB7R5EsZnyfw==
X-Gm-Gg: ASbGncsfb5hEFHSKbJ6WpVTTovDv7JOxvSYVgxo5tRlGyjNb3PMabHgRf9eSoiGGxoD
	AyBs+ZD8O28jE0yheuwqQ0TwCixDJfRu/6xo7vmFbkLyD8N48s2Zl0WF6QVB+SntJJIfQmQy7wd
	CUrc09vUN/SseOyEH9MPNrxQ==
X-Google-Smtp-Source: AGHT+IFglWsLuajUozFpVPnPlBh2TjItDXNHlDH6L4EnWFRw+AziSkdH6rFqHcXtAE7NLHbCAo69n7eu1N1+R9UHYqI=
X-Received: by 2002:a05:651c:54c:b0:30b:c36c:ba96 with SMTP id
 38308e7fff4ca-31071c0b5bamr8409831fa.1.1744701824036; Tue, 15 Apr 2025
 00:23:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250325094932.4733-1-hanchunchao@inspur.com>
In-Reply-To: <20250325094932.4733-1-hanchunchao@inspur.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 09:23:32 +0200
X-Gm-Features: ATxdqUE5jF908PdCkX3CIFaPCBX4_mmXl_uxNevSNqAZQBsFJDSR9NbcxEZF5qo
Message-ID: <CACRpkdbWx5u2RBmZ8bjoV-85b3HmQyWHxxwQ12zx_6pAFPPMUQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: tlmm-test: Fix potential null dereference
 in tlmm kunit test
To: Charles Han <hanchunchao@inspur.com>
Cc: andersson@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 25, 2025 at 10:49=E2=80=AFAM Charles Han <hanchunchao@inspur.co=
m> wrote:

> kunit_kzalloc() may return a NULL pointer, dereferencing it without
> NULL check may lead to NULL dereference.
> Add a NULL check for grp.
>
> Fixes: c7984dc0a2b9 ("pinctrl: qcom: Add test case for TLMM interrupt han=
dling")
> Signed-off-by: Charles Han <hanchunchao@inspur.com>

Patch applied.

Yours,
Linus Walleij

