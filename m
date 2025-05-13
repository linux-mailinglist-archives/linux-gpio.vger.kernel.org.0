Return-Path: <linux-gpio+bounces-20061-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3681EAB55F9
	for <lists+linux-gpio@lfdr.de>; Tue, 13 May 2025 15:25:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B87481B469DC
	for <lists+linux-gpio@lfdr.de>; Tue, 13 May 2025 13:26:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAD672918F4;
	Tue, 13 May 2025 13:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i/2LWdbn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8195328F936
	for <linux-gpio@vger.kernel.org>; Tue, 13 May 2025 13:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747142735; cv=none; b=I2TEfd6j8Noe+z6ODnhotRpLP1TaDkzUcAqvWzmtil6Lt28gjp7/FoKtWQr86eU4U/IPoxdNIhOaXSZ/fkbcGI9qrFVOBVGxRcAJXG/tJCriAXQdlVswH4iXGg672dSXnBPsNc2iME6ddLKzfujphD49v3RulND4Wa9gxAXkiQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747142735; c=relaxed/simple;
	bh=vr6jWP48yxMylfuZaQtdjlPFLP+Sk0yvaEXfr4dRZmY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZTCari7OfFkicWci8BOB86JxmrTFbp1+EeYHY5X4RHZcp7Fa0alUjQ/IWpTLBO7xsQQmdlmEHQb2z24m0BCp4Js6+pU6X0lHNDOsZt1YD++b8UDebtWYe21iCBiGgHT1WB0GvvvlsJM4uAwZaQJRQVs6fLagugIAALBSnFPiCKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i/2LWdbn; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54afb5fcebaso7271335e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 13 May 2025 06:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747142732; x=1747747532; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vr6jWP48yxMylfuZaQtdjlPFLP+Sk0yvaEXfr4dRZmY=;
        b=i/2LWdbnAflcM5SZ41RLSj7y1Jw7DUynh9ewjfOfjYRPaRzQWgcJvKHN5Cft4SL2rM
         zgGqZTiZkoEvBQURAWM3ZRTSa8hWb3EaCUcZGXm79YVpJ/Vt8d+mkTdtZDywVu5Dhxxb
         dTrbjFccTfPvtRuWQ0nozj0ulwV2vS8T8cV3y2W5IWH7NiiVHHDnLYNKWTsI/tIuWI6r
         eI3/7CP0EHm6xCNt2e4PAj2c50WpQOzptxqDavL84fVNlDXn+gSJIFWX/hHf5sORnv3z
         DFIAot4XvhnAL0D8N4mfLEVdW880gkr2bhaPwDJWD/KwjC0CgIM7me7D5d9cd/gudOtc
         QlEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747142732; x=1747747532;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vr6jWP48yxMylfuZaQtdjlPFLP+Sk0yvaEXfr4dRZmY=;
        b=HPt2BF69Kg1G+4HjCuY/e0/wJVaS10vCpD+Ng2sm8KnvQnUwBp0kChJUznaJ/kpDvS
         Y3Y+1xENp1O99KmUCE7Poz7eJRSEuUD5tGmntXn3t9E3iJgfv0FJyMUqJHpoD663DSQY
         Fz1JQNc8p1KPHUQVLlg0N79aeEr9glWoEDbvJ4JVGmj5awYYFvUGJmRE+vSR2Y+oQjaP
         4SUyayyegZHnyCzRZY/1SYGBeIaKwMMtYSC5qKttf/dULK/C3Qc68nSzw11to78tJBjx
         KCh2FpSWHuIEPb2xyXxKZAKiZs6uA5QiD41UfbwQtS1SbaHYjt7EGY4PDVfHQ0PEDKiU
         9wJA==
X-Forwarded-Encrypted: i=1; AJvYcCWdpDSifRB5hFu20eorjUfVmoD6Zko9urIrzCXUMu4BhGeG3iDtqgzxKUQqqiyuWATrbgEvgqabuwc2@vger.kernel.org
X-Gm-Message-State: AOJu0YyksDuM/zFgsTKGO8aacT4kboPbMdueVOMruMD6+Nrn+14AJnNz
	4vm05tHDmVAP4xRPBuI6unG+W0RR25mb5BbPRB8zadt1gjS7H9mR6p7gcd6VYAaGiMp9nu9D5sV
	OsK8+sQcqCLQhkVe8cC8KRA4MzZ9jE/BpFlJpVw==
X-Gm-Gg: ASbGncuFxxtbagP2qBy0DkTVbmm7CN17yAVlH7/qg58I4mB0xgbDZ+uJnmRxgPWn480
	ZRKPFrdWfQi7lTr0vNsZRpaOO2JBy9L6+VcQk7RryMlFSNUlaiSxi+1tOo4pFRiuxAPH4Bzyu1t
	Qb4uF0QANdcexd7X7m1fpxaqUd7hgpltyR
X-Google-Smtp-Source: AGHT+IE0uPHvi59GKQReP0FS4yIDYcDcoiE56BNfoi9s0ZtA39+qwHxI+HlYyMOtM6ESsG8BIrjV3tSi2Mg5STR1bXk=
X-Received: by 2002:a05:6512:4201:b0:54b:f33:cc16 with SMTP id
 2adb3069b0e04-54fc67bf61dmr5906057e87.16.1747142731593; Tue, 13 May 2025
 06:25:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429-tegra186-pinctrl-v1-0-722c7c42394e@gmail.com> <20250429-tegra186-pinctrl-v1-2-722c7c42394e@gmail.com>
In-Reply-To: <20250429-tegra186-pinctrl-v1-2-722c7c42394e@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 May 2025 15:25:20 +0200
X-Gm-Features: AX0GCFsgSRMFDJQegzrwRWIt-rIi0vhgKArb-MEwIUl7eEY9iod1pr2LmbxZAks
Message-ID: <CACRpkdYyaTaXcz2zdM-13vXvc2JKXKk75=XS9VELDRaDA6=R=Q@mail.gmail.com>
Subject: Re: [PATCH 2/4] dt-bindings: gpio: tegra186: Add gpio-ranges
To: webgeek1234@gmail.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 29, 2025 at 11:33=E2=80=AFPM Aaron Kling via B4 Relay
<devnull+webgeek1234.gmail.com@kernel.org> wrote:

> From: Aaron Kling <webgeek1234@gmail.com>
>
> Add optional gpio-ranges property.
>
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

