Return-Path: <linux-gpio+bounces-9524-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 30FF89681D5
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 10:30:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CFA3B1F21DA8
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 08:30:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DDA41862AE;
	Mon,  2 Sep 2024 08:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oAbeW4gg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DCEE1865F6
	for <linux-gpio@vger.kernel.org>; Mon,  2 Sep 2024 08:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725265743; cv=none; b=pn03fPHVjiqdV9zRWEW2U5uzal5ieXU+Ylji84gVgKMo3sHSkkYA0XJqBJC3p02WY5O2VuKys3CUFeofr24AKhgpa4BgodRRlRhHVszs6sEBqce6aR8w6W8Oi38yhimza/ueHh1WfaBl5sWHwD1a5O8Lo2FVSmMI+jucJebAJ34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725265743; c=relaxed/simple;
	bh=MIaHRBbleOvp5Fm3wN0MH4xZRqewJGpHkVCnZieq1Fc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GjO6xC3+jklh7GVX8/i9qmZY9GhypeXFr8PyoxRNeZwgy2Hmmh8bx9Ec9uUQaGZuRAsjgbwpFrvxkNifnSmfgSk12PewOKi8gR9sG4wjr00ZE6pVrXaa8bCSJiYzR+20PpVA2uPJMlgElrLhOOhJWlXQGzIMnNg4p1CauZp3nGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oAbeW4gg; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2f51e5f0656so43391351fa.1
        for <linux-gpio@vger.kernel.org>; Mon, 02 Sep 2024 01:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725265739; x=1725870539; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MIaHRBbleOvp5Fm3wN0MH4xZRqewJGpHkVCnZieq1Fc=;
        b=oAbeW4ggX0U4yqUs0IosVF8L62fxzOdOxQKGRYvIrHSB2mpCicW40wLgftKlx5WFwb
         bbJzm6eokrSy928Ld+WMT2Q8oPAuMowVAD00HSl1aAEh5l+F/mgnMuB+56CYXLq8Z6Cy
         e+fqTfmIYdVnUU490uF0mPfg7CaftHFGQOxSLKBCnnS4uEQqsh3toV2zu9/SLvwltcMp
         H+rmUKPaqKHyhpSOKNE1W8MuC2LxvUjWyIzmaAmACiyPqmDKAMZ6l+iGYIlVqGlzkauM
         3bwjZm+1PPH4OHOdVuLdkYXwk4YHbizlN2/XN1+SsNirjNtbINujcn2qkysgUR6UF7m1
         ncIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725265739; x=1725870539;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MIaHRBbleOvp5Fm3wN0MH4xZRqewJGpHkVCnZieq1Fc=;
        b=e7h0PH4H4DEsfkc32A4EpeEi70NvuQZFp9xxj17sgx+pbdOYB2ovsb9aAbq0vkwifw
         0HK2Vrv1ab+LdceBOHg1FV3us4J6QpmehXZ5eNokp1ZyW/EVaFeOejPvInKcbjfdFMuc
         DEYG9IuZvCssN/DouSJMMwd13PAjIPCWKkJS/sBeyCGZ8+fqFU6WWcaGjt/i0GRzfnqN
         wIR29/9XMwyEo+bq4k94t1F6Vja+tETeq5gJjAdyefO7E38ccbl9lU2R17U6KJ6oJ4fM
         YxZyFCMG7r/VvOQ+Sy2+G8TMqW4Cww0SiXQ34eW5h+B7rZtXm0Dg3qnCwurY9QKloXuy
         huSg==
X-Forwarded-Encrypted: i=1; AJvYcCVzGQuZ3v0ibS2OSLLS7i+qK0NOKi5cszmqzSzZ67ihVZmTPRdC0topPD2udds2Vb9OU+ynxj44KGAG@vger.kernel.org
X-Gm-Message-State: AOJu0Yz71ArL97OWTegIqRx9Uq896x77Sh2y7nlgLVbt4KZW1F6f3DKW
	VIMRHLgsq6tErI5zXwrBBWTr2ryHg5FXGlBZWBipM56MHI4gNJ153h63/D4GW7yJ4NS64yikyhH
	OD20UaiUmOZ38sq8OAxID+GfqiODbdGibyJEyHQ==
X-Google-Smtp-Source: AGHT+IHPWy3EoCohm4ZQ7Nw+pjtHINUGWbi0iXZ9E+VhoJRrDChfQmlQqhKT7iJcy1rrIoGEA3CKMiarlVi0MZwFT9s=
X-Received: by 2002:ac2:4e06:0:b0:52e:9481:eaa1 with SMTP id
 2adb3069b0e04-53546b25d21mr6803224e87.23.1725265738824; Mon, 02 Sep 2024
 01:28:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240829044835.2047794-1-yanzhen@vivo.com>
In-Reply-To: <20240829044835.2047794-1-yanzhen@vivo.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 2 Sep 2024 10:28:47 +0200
Message-ID: <CACRpkdYMn1FyUFrhGMx=Kq=zK28o1QX-pnJ_tKihduouML4aeg@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: Simplify with dev_err_probe()
To: Yan Zhen <yanzhen@vivo.com>
Cc: ckeepax@opensource.cirrus.com, rf@opensource.cirrus.com, 
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	opensource.kernel@vivo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 29, 2024 at 6:48=E2=80=AFAM Yan Zhen <yanzhen@vivo.com> wrote:

> Switch to use dev_err_probe() to simplify the error path and
> unify a message template.
>
> Using this helper is totally fine even if err is known to never
> be -EPROBE_DEFER.
>
> The benefit compared to a normal dev_err() is the standardized format
> of the error code, it being emitted symbolically and the fact that
> the error code is returned which allows more compact error paths.
>
>
> Signed-off-by: Yan Zhen <yanzhen@vivo.com>

Fixed up the subject and applied the patch.

Yours,
Linus Walleij

