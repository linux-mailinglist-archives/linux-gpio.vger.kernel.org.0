Return-Path: <linux-gpio+bounces-10630-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 65BE198BD61
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Oct 2024 15:22:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 002A9B24589
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Oct 2024 13:22:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36F671C3F0A;
	Tue,  1 Oct 2024 13:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w1MnatXU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1BC36C
	for <linux-gpio@vger.kernel.org>; Tue,  1 Oct 2024 13:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727788919; cv=none; b=OWJFyfdFbplm23Fslekry5jIpFwo5tOk9Z1b4wNIxvOLrJW5mbSGf71LVPC6I9s+4cVbEW+wsMoT4NLSkFhjpkZS6kdi28CXs4FBA0ZcT34uhlO+1gn2lc39wJINDCZ/uoo232mHUifEigVA8ZnKTqoUWCMLqdSk0HY3s2SYkPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727788919; c=relaxed/simple;
	bh=cyEcKeEaGeyjn3FmCQILe/HAvSQ7EjvyAoQhRa/81EQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mlzh/fASR8xM+JnT76pgC93byT2q4bvPPk1BwTw0ijiSHwmyDlI5qeEviCdV3eGabatWT85dsMWFEMUZ37UzSdm8HxeUR1UtSn6tNNGpisB4nMr09f+jXa/AQirO5GdAJQHWH/46h3eku1UdKUVcONNl+Pke5WBEIWdlBKYMXNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w1MnatXU; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e25d405f238so4745587276.3
        for <linux-gpio@vger.kernel.org>; Tue, 01 Oct 2024 06:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727788915; x=1728393715; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cyEcKeEaGeyjn3FmCQILe/HAvSQ7EjvyAoQhRa/81EQ=;
        b=w1MnatXUByKr78z7ZGTplGLKVhk/yoQ5iRYII5biH/oiWFP+8YG/ShZybC0BP7nzKL
         i4kQykCpZmFvTZdSr0kC7at6CSoSKOf2nT1bxKaMiodRR6LvlX+aV/XfpokIEyI+0rdj
         RjaWyyDmvyxSebRKsdg6pBnNw93WRNcCt9M29SnNSB1f8yU37Hi7sXiyOQwnQqCaAvH/
         eYeLrkdZaufFDwCf6QVH6ri/j1cxh+HfUx3Yh6k9gPHy7yRZXeBwwrPZdGhIemt+9nUd
         v3z4jcwVwYzXk5F2XNHJmPCNV5dB+NKwiW7znvkGM9FcqyxNO4FBB3FMuHZ9QzmaaYly
         HppA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727788915; x=1728393715;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cyEcKeEaGeyjn3FmCQILe/HAvSQ7EjvyAoQhRa/81EQ=;
        b=F4w4JawOeF/oQ03H58sIs7y0+rB4jCxi3WAr8uVYx/pK1wdYSdGij8zKfV7aW1sl7g
         loISnFli7XLF8SBQaJmSjkx4JkH4Oik039sWz4hjUyx5xLOo7CrFScxnARC2xglqYNZf
         FIzss8fD3RX6N4VO2E+HSuYbIObOsfCotagy0M0WZEm5A8LoH3Qo1C1Ybpsr6yWFN1yx
         OGW2xv+fLFVHDLEyxp2NtnilGD0j6abaYHzbOJ0/+uFPuNrv/OooEtRyxSU5bZaXzyVk
         Vrc6l4QaqT7KoQ4OVy+J2WBaxm684pvRdAhybDoPXWRGU3Eq8TTNISLDTjs4TVb3Vwa4
         vy0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVeM0yJ3H0m7suFyUuN9sZCf28Ea4t4t7ph0WuKrNlERAkad41s5eqGxTOC/2eH+5vwkZzCLGQcMVMS@vger.kernel.org
X-Gm-Message-State: AOJu0Yz43oPpqrTfAE+c9hScM9W8aPwXzqMevMls57JsPoGtUVE1Q6d5
	b24ekURxNUaTS+H+pdYxqq4x2ICngyYLn2shaSleT3L2ozajaxYEiv7KrWX5LtT6b9wsRCjlvpO
	lck382ejD0CNx9doq6BlQXJqQBKOSsXcHyeyLAg==
X-Google-Smtp-Source: AGHT+IFX+RG9oTFLQI1ImSBKJqO6cvjvCh73Pi/+D7i6lN9FLnM4YRXO332XYCzrUNg6/1KlbELqPZKC4ieZWZ8y//E=
X-Received: by 2002:a05:6902:15c3:b0:e26:3659:577c with SMTP id
 3f1490d57ef6-e26365959acmr260283276.49.1727788915541; Tue, 01 Oct 2024
 06:21:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240911-topic-amlogic-arm32-upstream-bindings-fixes-meson-pinctrl-gpio-line-names-v1-1-4345ba336ea4@linaro.org>
In-Reply-To: <20240911-topic-amlogic-arm32-upstream-bindings-fixes-meson-pinctrl-gpio-line-names-v1-1-4345ba336ea4@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 1 Oct 2024 15:21:40 +0200
Message-ID: <CACRpkdau=4jrL5zWCwDOtcggm05XSXCjUrCr0t2MtAUC8TdR3w@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: amlogic,meson-pinctrl: lower
 gpio-line-names minItems for meson8b
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 11, 2024 at 5:24=E2=80=AFPM Neil Armstrong
<neil.armstrong@linaro.org> wrote:

> The Amlogic Meson8b SoC has 83 CBUS GPIOs, thus lower the minItems
> for gpio-line-names to account for it, fixing DTBs check on Meson8b
> based boards.
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Patch applied!

Yours,
Linus Walleij

