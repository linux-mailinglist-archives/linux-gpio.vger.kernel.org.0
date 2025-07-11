Return-Path: <linux-gpio+bounces-23176-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D941B0237D
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jul 2025 20:21:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CEB3617A1ED
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jul 2025 18:21:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E3DF2AEF1;
	Fri, 11 Jul 2025 18:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NU+AYmdS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B26B2F1FF9
	for <linux-gpio@vger.kernel.org>; Fri, 11 Jul 2025 18:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752258072; cv=none; b=CXkjOEzAa6NLC0Rt9K7pk0sfjp8EiHoBFM9veRHO/0Q0zElaFzgg3OhbHXWY6xEiHKUc1IlqAuFo80yVx5S9abjQGkk+08in/Ct2zEkA/kNy3OAKjeCUzYA4MAZacCN2zB4wcWOqmYrZhlXJqpilFsmF91iIgCM7xj5ms/prkmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752258072; c=relaxed/simple;
	bh=9pueYuEIoRhh8Q7SXjsOxjLRBOEiyf+7/9ZBmo6ZPtc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=szDcoaTM8G7DV204nCJfB9MgqKpPG9l9CXBdFpOPW/fd6BDDVzmxFt4yXbBfJ4w2Z1uLdvfrZjmtUNVx7NzMrUGVNE2BPR2cX5Pj6CNjjgiPbpRkO0q9TIgMT0KSJcJ1wXlXu9hvQXkcUopqHg4bGa/2ZoI9bqmj3K5ZMftqCgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NU+AYmdS; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-32b553e33e6so18528631fa.2
        for <linux-gpio@vger.kernel.org>; Fri, 11 Jul 2025 11:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752258068; x=1752862868; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PFonXyBEBu8bBQGRWXHhhJM0VZMeyX0O0WVctxeWjqk=;
        b=NU+AYmdS2Ww6aEAAyX1OFL3gx8fQMdj2FV6y1Bf3NGinK9IoKNI4s/wwdWq1Trt6wM
         Zx0EwUktzxHcXtEplUngRUWRKxGY1nDWp2u2W79DZqKn8t6zv/lUi43WssItoXrnOGrF
         UcB5OxZBwf4sS2l3d+YxdFlf1B/hSCLWarNX6jNDVvKG/i2WPdB9k5NYgp2Z8phscFqV
         GWnf6n8iHEa2VtI5/H9AKNPUue7gblqgGzl2CMLGJVnzABkKTpXH2PqbmX/PKrCoAsjF
         MZBfgpLRR36M/3pczQhVQMozYmPWyRGvX9xDv1hZHHsSq9FNi7rZRK8y9LAmIk27HNqO
         f0XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752258068; x=1752862868;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PFonXyBEBu8bBQGRWXHhhJM0VZMeyX0O0WVctxeWjqk=;
        b=qe9pYHGizDgvN9USnKYOtF7KO7EfL0qLsl1Mi6VjvQKG9YfWJJ/poR+3a0QJY4PhiR
         sNBbR4cOBlRmz0GxkcZD65mKrJTWRJpmST8wBhYbImgDv3c4Bl+8g3w5UVCZbFFdgP3p
         ozBZh42PP2nBYO6pA9mNx166JJkxXvg4eRhNW1vhnLqR3GqDcnwnyPmeCGap/PIjXEaO
         n1WfLPS7UGEh8GiTmj+eXab98cCR0Hgv2RU8Bem37hzRd9K+pP5EcH9y8obLxd3OeXvl
         pDmRVtao9kP7uHFM0C3g+vWJFeAXpQlxjyMigM+WSwJ0X4rRiqopNij16Y1PMWlsH6Um
         DaPw==
X-Forwarded-Encrypted: i=1; AJvYcCXCqBttqLPtFbtXYxHhKfSvH9PLzEtK/qEd2dBc6RXkkGrY+WlCJ5/PhEi94FSgphgipVxjPSXeG2VG@vger.kernel.org
X-Gm-Message-State: AOJu0YzDLbFx+mLD7+Mrrwra8RHnhUOLPZ9NB8fBG+EVOGgCO8LZDcSw
	IioRqcYnkDeWFfSgBtkYMdBgenPgaUXtZac7pJFuvjdodD+mgglDXNZvwbnzOc6j6LeFWjPl3CK
	wMAS6H/MgEW28fb666FmRmWi7tm9hZP90D+xQ94CkXQ==
X-Gm-Gg: ASbGnctH458qgmKD/D8oJ4mq3L3so6DgHrxdcmKzGfuQW6i8ZI9nL9yj4LTlzPZwgkS
	IwRMG9oHe3AzbY+vxShJTpli7HHa5fezu2tBXMhexB3XTxhXhTQhWrliPErJrF53UTgDnK90rif
	pWzCsE1xTuVfk/Y4FQfM1641fN/0gp85e7UgheRKyKSN2MKmXgX3sc7tgosxL7daQ5ClwN0kQVa
	0lts1svVteA5MCANg==
X-Google-Smtp-Source: AGHT+IEvkwHGOLQfSLv38NyMLX/duDgiOrEo48zv9nOud2f/wZg6mazHn+ZXSSe8h4+6KW3mbg6mMV6T7HPqsPw49Lo=
X-Received: by 2002:a2e:a007:0:b0:32a:7d61:ded0 with SMTP id
 38308e7fff4ca-3305341307dmr10521881fa.19.1752258068303; Fri, 11 Jul 2025
 11:21:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250709-sm7635-pmiv0104-v2-0-ebf18895edd6@fairphone.com>
In-Reply-To: <20250709-sm7635-pmiv0104-v2-0-ebf18895edd6@fairphone.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Jul 2025 20:20:57 +0200
X-Gm-Features: Ac12FXwUK_6BkBTiMmf0bIqwdADNOgyJE6d12NaL0C0nqmiCzFyAn5E5nDpYZaI
Message-ID: <CACRpkda-ssTEJqcj=vxnz91rj=qYz_rer5p5Db_b=pSdjUj9Ow@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] Add support for PMIV0104 PMIC
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 9, 2025 at 1:22=E2=80=AFPM Luca Weiss <luca.weiss@fairphone.com=
> wrote:

> Luca Weiss (4):
>       dt-bindings: mfd: qcom,spmi-pmic: Document PMIV0104
>       dt-bindings: pinctrl: qcom,pmic-gpio: Add PMIV0104 support
>       pinctrl: qcom: spmi: Add PMIV0104
>       arm64: dts: qcom: Add PMIV0104 PMIC

Patches 2 & 3 applied to the pinctrl tree.

Yours,
Linus Walleij

