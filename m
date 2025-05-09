Return-Path: <linux-gpio+bounces-19883-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C0EADAB1C4D
	for <lists+linux-gpio@lfdr.de>; Fri,  9 May 2025 20:28:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 22C171C20DD0
	for <lists+linux-gpio@lfdr.de>; Fri,  9 May 2025 18:28:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA70E23E235;
	Fri,  9 May 2025 18:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="AYbnBLQB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1AF238172;
	Fri,  9 May 2025 18:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746815317; cv=none; b=tCNpXEKHnxi0vq7QDTD0xcV/Oloj+fy/KTBupSsximi5Vv+VL86ttrYRXyY1eT8ZwgQZdAlRGdlKDhfI0Vvo2YJ1gsegytpg2HdypLSaid104re2gYGAo2wf9tJUl+pdTYemQXoJioyuNhwqLHCPPA6AmbuKWU+fngHppf280ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746815317; c=relaxed/simple;
	bh=10fWKQkNnHsqIbf/pw3ZTsZtcdW11Mi85qpJNxHdr28=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DfBGKGNd8s302tXyk3PHyaXhAO2qtJbQxa/vQOJyNSG/s89sTbICUVYWRBBLJkBXkDNPG3VdS3Qh0IlnHO0jzzt85G5Vquq3WsdTDSmmzJDyBYRLUxXvIaDGsF3U/V93nEx5B8LqThoCtCEdBxooI67VDvXYLuIM2ZhXboISfV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=AYbnBLQB; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-74248a3359fso564457b3a.2;
        Fri, 09 May 2025 11:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1746815315; x=1747420115; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AVjmITvg5xwQUhBH3cPWu+1Rci6sKZeIVD+X8Tz7B6Y=;
        b=AYbnBLQBGpTjp4qqM5x5rME4jKnQ2sztadWaKg67B7gLiTJGsHIyOaq2cZaKBsInK4
         +i6/D4AXyNsfN/+ACIkd/xx+2Zmave6jUzAOBv460Q7uJhiQVESshau07d4BWOfON8Bs
         0PC957BYTrdAUWnrN6CJqR+20M4Mpo6WS1AOyiSIz4WCDgeJW+vYoo1I/eSI71Q96kP+
         vp4HeqHtau0MACVztknNCnLCLkdCiJ/KRxCuT+gdOC4QSg8fe3b70jTKOnE7wLv0nFIb
         IVqBAkr2B1lfGoqzu7sshrCH7PKhROj9iwORAoisfVInGYmIQvi1z/dFfGLU5NKUePxw
         gepg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746815315; x=1747420115;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AVjmITvg5xwQUhBH3cPWu+1Rci6sKZeIVD+X8Tz7B6Y=;
        b=MTF16kTkDPbRdtqnLS3X9Yybbhy25HxViRimEul2UCqOrP7ZXB3Ry2mgr5JC2x9G0I
         sMn73hApfdpWkBbjPSJy5XUoV65r6aRpZ8PdvcPsUcd9tyNyqxgzSgYpB7uRHYv81+oC
         eC727DpdeZWGUef/xNhoimPgDyHpy9TlcWBIXp3RvhyelfpPFcLnXYSD3xwtT7Ya5Vng
         dZbTjfPkboymGKOGK/lx2NMRjsBcu9hnBHWvulUHxmFrDdg8U2wfhpyFGAJWwRI6ffPT
         S3uv9YEYefBiX6Lpya+V+MSYXpR2cBsR1o8ijBz9OJNZ6iHMZ4KtlDTJVndPmZqQlnKi
         mNSA==
X-Forwarded-Encrypted: i=1; AJvYcCVakknxfzUs/T3StL4pSLbKvc7Xyrb3PSBzH+u7plPaSRTDmyYoYNbwGqHfX0YEn7Z2KJlGqZxMhjPF@vger.kernel.org, AJvYcCVjmLE+cDVjhhKfkrnnTeCgLIezo8sTAYi7hft6WPkvYe4JAMw/GXCU0B5k8i7vj1VudIgI8iWfoVmfHaH+@vger.kernel.org
X-Gm-Message-State: AOJu0YwLPrEnl/UzsN2EKZ28TMQ2PHkWOLwhFbbaF+qA/gyr9B43Yc6P
	0DzYgSIzVxzcxCy69+x37IwbyefVLwgvAzHJ3fICVWYre0PIl+XltbwNG7GK442OpGtBWZ9bMI3
	hrAJm6ZGazUlh5PpXyEQyzcLLB3s=
X-Gm-Gg: ASbGnctuSmJEbQI+mWZwm2Y+ggV/2n3jQN27TP38JfUucwC5NhJ5g0wyC/8GwkN1AM5
	IzdOCzPLeATtxaUASbAuASezBSNsp45pPc1pAehtezFsOY2gkdWVJz9bpANqItlbH4ndTa6Uluj
	KlyuOt3j2RJ3tf5CWK7mYLdOM9fSvXGIldSs+UFJbflpjbjf1YZ1HpIzKLn9Gp1fa5Uw==
X-Google-Smtp-Source: AGHT+IEwd7AiDoJxpDhyTHw6FTDd796IjH1JzgkpmVh4628MtJYKSWng6hqIPivs5wHI5s0eCiBfNcWPOBCx0dc2UHI=
X-Received: by 2002:a17:902:f70a:b0:225:abd2:5e39 with SMTP id
 d9443c01a7336-22fc8c8eac0mr65654585ad.30.1746815315465; Fri, 09 May 2025
 11:28:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250509150114.299962-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250509150114.299962-2-krzysztof.kozlowski@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 9 May 2025 20:28:24 +0200
X-Gm-Features: AX0GCFt7pQHVyrf4n1xvCNGZ9D5D94k38mJZKPZaIgxrW2CstAdBDU6m2wUQANg
Message-ID: <CAFBinCDt1jDv=jhDoW3UtBUL8BuLL8PpJPKjpC1Sf5fifnw+6g@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: meson: Drop unused aml_pctl_find_group_by_name()
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Xianwei Zhao <xianwei.zhao@amlogic.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-amlogic@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 9, 2025 at 5:01=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> aml_pctl_find_group_by_name() is not used anywhere, as reported by W=3D1
> clang build:
>
>   pinctrl-amlogic-a4.c:600:2: error: unused function 'aml_pctl_find_group=
_by_name' [-Werror,-Wunused-function]
>
> Fixes: 6e9be3abb78c ("pinctrl: Add driver support for Amlogic SoCs")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

