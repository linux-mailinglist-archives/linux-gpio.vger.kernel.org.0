Return-Path: <linux-gpio+bounces-17001-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06248A4D6A8
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 09:39:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C9B33AAD72
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 08:38:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94AE01FBE9A;
	Tue,  4 Mar 2025 08:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SKh0nY83"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE17D1DFD8B
	for <linux-gpio@vger.kernel.org>; Tue,  4 Mar 2025 08:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741077540; cv=none; b=JVoNnjV4SVrpEnyGU2WMY/BpqHxNIUTHAcf3ZvLhkAKzEinqA3sp79XLgFHibylm6P8vmFPkdscSStek2wwU93p9nbkBw/dI8RV8ZvkzkcrBdBOe7ihvYBGUHwrFtG53Wa+d3rEjuoNmYpN5F0d0IgIsRWeZYVQRHM0sE+9Hobk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741077540; c=relaxed/simple;
	bh=ZYX5W2qo0J6KDJGUHsyIA03NeMoxJ75oq5Jqbs0b/UM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nORvlOsMtwQBWEVL/RK97Vqn9USV7pUKfysY08X9kT4PpD399NxhvF7NIfBOaeEsf0tC5uIpeD+8O8iYwtOcYpxnMzUXgxoGRY662s3X6p3jCGnn3bHUNw8y1XSn7l4KfSDvLa1Wq2NlGE13NvDpqM4N8SMMcg33K73bKmwbWNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SKh0nY83; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6f666c94285so48033697b3.3
        for <linux-gpio@vger.kernel.org>; Tue, 04 Mar 2025 00:38:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741077538; x=1741682338; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZYX5W2qo0J6KDJGUHsyIA03NeMoxJ75oq5Jqbs0b/UM=;
        b=SKh0nY83PcwUU73o/u1Ezua1EBzHkSuz/y40gKxcOQvHz7XqxDJnHlDpCGHk7+eoMu
         OBzZaVWkiP8PcXsk8ppFzytaT40oTwvcqn+SZtNeBBRIsKM2Pz1pGh0ogAJBstaMZaHw
         meyoBDiUTaN2v+0qvPjfyoYTn+Un7VdBLj62gRfKhSUMbXgPC0rIe5mAxxvYyp0L5TxX
         atHDJz21tDKhj3/HzpSHvg0MIknYgolCS73b0tZxELalfr8e0Qk/20T3tjefiChf+KF9
         x5l2VKbOweUfd3yH74W8AwwbCkuLPoPsYOVg2lljxl5tE/nJhSTPDGZSBO/7Pec7t8/Y
         tjOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741077538; x=1741682338;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZYX5W2qo0J6KDJGUHsyIA03NeMoxJ75oq5Jqbs0b/UM=;
        b=FHu/qT8h0DB/meWzFeynx9t9uA+wYfzxpUKUmLgWHhE9kvmp5tve7Eqgx8nAazIV1P
         Xx7OaI1EHP5gBRy8xY7toSm8nT+CN86UJpKuI+oGRunjk+WG8jFnz2fYX8NrLdj8eJnR
         gYSFCO6jCpXrWi6UO1oskatE9X9JyLhjIjl+QFZ9/7CU5wa0+sWyAT50jGOzQ4Cw/wcL
         YxaB40g0lhlcs+UFb1/08/fDR+EMx1Tq3XSIflgPQk7VNFFgwhV3VVpRrJWOR8kZu3k5
         eGbvFMt8pHk/tN/hC61ATIECynzoiRcD9AK5fLuzPC+hCIzwABRpHDOWJM1PX5sZwd2O
         MBJw==
X-Forwarded-Encrypted: i=1; AJvYcCUiO3Zu9jz8Zl5R+8ix1vr/TuxrnSBUiDnQCW4FVRQC06qnrVPvlyp//gMWIzuEcpH0QnIKupuAENaK@vger.kernel.org
X-Gm-Message-State: AOJu0YwC6IjKiNIA0bo2rl4XN6tpIKfmCmhyIcfvXcNl0q5t08A646Fz
	Yjt595EGye4rFzwQA9NgX/UmtpUD9d+9ZjJRHpfT0M94AHWdkROHB+c1SzuV/ZUngemSQvuZNZM
	z+IT8xuds1mVQpHtCtrm8e+5u0xeBM6EbZ3Dfzg==
X-Gm-Gg: ASbGnctBOXf/iwtCvETvKPQeUx6qtkEqAMh9sKrYqXzpeyJlS+CsGhQIai2EaXlM0YC
	cjoNjoihEFyVtZ0vHnQROY63yacKIvZ89F+tq8lP1OJ69/QGhR7BcJCjFBFywlD+vQ+osw+eo82
	l/Al7vUnT5Hv++GopLSpcT4sphrA==
X-Google-Smtp-Source: AGHT+IFZecsTbEQv8yIQnDTe4qYQxuFWKRYt90hdWjp7tqPlhx0s31g1I22yMpbTlBlWL9JWo4wt1mjIhLHqe4o98d4=
X-Received: by 2002:a05:690c:3341:b0:6fb:a4e6:7d35 with SMTP id
 00721157ae682-6fd4a064164mr198940787b3.9.1741077537823; Tue, 04 Mar 2025
 00:38:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250303-fix-a4-pinctl-v1-1-6579888b4272@amlogic.com>
In-Reply-To: <20250303-fix-a4-pinctl-v1-1-6579888b4272@amlogic.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 4 Mar 2025 09:38:44 +0100
X-Gm-Features: AQ5f1JrqMzIuFFtin-kj4LskcpP2GXBY5HqPRMPuqc5yJUWCwELNnJQsuIXOkVY
Message-ID: <CACRpkdbbD6wLp1-m8WMnW68stz6U5GhxbJxcKAThYXWnH00u1Q@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: meson: fix pin input property for a4
To: xianwei.zhao@amlogic.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 3, 2025 at 8:53=E2=80=AFAM Xianwei Zhao via B4 Relay
<devnull+xianwei.zhao.amlogic.com@kernel.org> wrote:

> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>
> The register of pin input attribute means the opposite.
> value of reigster meaning is 1 for input and 0 for output.
> So fix it.
>
> Fixes: 6e9be3abb78c ("pinctrl: Add driver support for Amlogic SoCs")
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>

Patch applied!

Yours,
Linus Walleij

