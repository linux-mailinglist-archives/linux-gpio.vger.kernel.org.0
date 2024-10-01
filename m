Return-Path: <linux-gpio+bounces-10635-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7965498BFC8
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Oct 2024 16:23:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF998280DFE
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Oct 2024 14:23:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 394C31C6889;
	Tue,  1 Oct 2024 14:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pDZVqBl8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437D819D06E
	for <linux-gpio@vger.kernel.org>; Tue,  1 Oct 2024 14:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727792545; cv=none; b=OZsxpWqV4AWpm0tsD8v9tgPo4ny44UrWqFFPEE7r4vFx9ZvevdrUaKFy142I6PcNkvz9oyZmeIMrbQ0joELcyRhNJSWK3uSgHpj0npPu8BBG/U9TYIS+ANp9jw9EYvV+m2uQiMhoVX8TrOViGmcI9iI4gE6nkL5lJ6DKfVVYVFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727792545; c=relaxed/simple;
	bh=eaNz15ITm14LJdI+Scve2c7AM+uQcy+PpJWBXqzc8Aw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CcjeyCpBtmBsj4srlz/47vDQ3+3b6QBaRnnqtpke+jYm6wfPc6N0ErngDb5xvTc2BnBBA6Ztv9BFx2/egBKQyaNc5PzZcGUw4zcuT+M8SfcEgrupJpxDKHfMVWJwXDj6CRT9YIXEIAGClmkhVQhXdDO4o+HhOVlElI30hdxyDqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pDZVqBl8; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5389917ef34so6465777e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 01 Oct 2024 07:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727792541; x=1728397341; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eaNz15ITm14LJdI+Scve2c7AM+uQcy+PpJWBXqzc8Aw=;
        b=pDZVqBl8T3qGjM6N9AyzM3HEzONBQfdHjIJeKHj6OpYFPxiLOVuolcwpCj1lxHk+gX
         RkLWOSzdnig1B4lLy4d4WLjWJKEbMHVY1PKEMrLNFcA5CdrglgCxbXMCA5yiP3e2lBNV
         1wkkvKSRCq4QK0gmenJtvItlgpsRl3KzLqQAobcdCs5GZCpyBsNps0ysa4bnwumrwDQA
         b+LZ6H6GwMJS7SG0GAfVn06UnprhTd2/JNwRHDZ3/Jp75tB6CWmCKMyk/XbIh/lHVMzr
         y+qCDl8l5vrdYSXVqD8hafM0mHay01YA9muy6Z0ldJH9se0N9NJSXY92yPnDL4yUOZV+
         wSlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727792541; x=1728397341;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eaNz15ITm14LJdI+Scve2c7AM+uQcy+PpJWBXqzc8Aw=;
        b=r/+2zKLG3ybXLLpk1sKnpJubtAFNMSj/KL9kE+EL9Ki9sgtmxL4GjTsASA2iiUAiYp
         RVXZBTW+nLG8i+Q3K9Dhz6EJkTs4U5ScEC6giySLKVM/Kbbk117moJgO4R94VKamuH+7
         ST6Ve3wGvK6wDdDE57lrEzRf++THGxaqVVixFVzXQcfd1TYOVoIQTw6MyauRHZQpAI2+
         8XActsoYOKAbwADLQgyKgT/0Eq8LCH2Qc3P8KKO91+B6kLuzIJk4dMJ4doqQyDyYDLCd
         KqDbFfv80DkwRkGKMtgXxfAkhUAKYu3pwZtE/H83YMT2EWFnIq/o5KS6wAIj3SYTfmIH
         fvcw==
X-Gm-Message-State: AOJu0Ywn+5aIFNVj2BMhHbhKetv9rjCpBVyaua5fphGz9cH/PWMk8QE/
	hRLzFCnY+45wlXpXoT42wWOvotdR0TGCcDevO0SU/zV9zCVucOvrAjgd7Rd7CHmaPltlcRKO2ZO
	ic/CTMWqBmDL6iy46h2HhvtDsLPNxdx7vGaNac7DuOp0fqgXK
X-Google-Smtp-Source: AGHT+IHsBSlI4GmFJFNMYV3iR73H2L/AY6VirwXYp32g6nQnuU5YDSuUEVhZac0rFSlOIWbTBehT8Oscxe8dV2yn39M=
X-Received: by 2002:a05:6512:695:b0:52c:e07d:229c with SMTP id
 2adb3069b0e04-5389fc3673amr8083932e87.22.1727792541263; Tue, 01 Oct 2024
 07:22:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240920153430.503212-13-u.kleine-koenig@baylibre.com>
In-Reply-To: <20240920153430.503212-13-u.kleine-koenig@baylibre.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 1 Oct 2024 16:22:10 +0200
Message-ID: <CACRpkdaee71cL_iWRMNyWYkv++4p+N=atfJ=AwP7wssaGHF_tw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: aw9523: Drop explicit initialization of struct
 i2c_device_id::driver_data to 0
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 20, 2024 at 5:35=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:

> These drivers don't use the driver_data member of struct i2c_device_id,
> so don't explicitly initialize this member.
>
> This prepares putting driver_data in an anonymous union which requires
> either no initialization or named designators. But it's also a nice
> cleanup on its own.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>

Patch applied.

Yours,
Linus Walleij

