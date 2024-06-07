Return-Path: <linux-gpio+bounces-7269-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A09FF900D41
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Jun 2024 22:54:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 56241284C36
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Jun 2024 20:54:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D35431552F9;
	Fri,  7 Jun 2024 20:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gLhmRyXN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0705014658E
	for <linux-gpio@vger.kernel.org>; Fri,  7 Jun 2024 20:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717793636; cv=none; b=d9RIT78erCpOutbtsc6wNY743ovbdxKKPlIQmHU4k+almroIK2sbX++zoJGZPmgpqBimS55fXnQTNeBDy/YR0AW4DQMp39OnrkXGSIG84QT3LoMfsu5eOP3nGRYg2AFA53Nu8+BKsoTiayinddhvXSwewLnXEISWXfqonb3shrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717793636; c=relaxed/simple;
	bh=p6tMfLMEfPy9ylv7zqzbxmkBmy9bIJ2z7b+jtJTZiz8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZhQ/04vEUHnSPqtspDBKQ3Vrcu1png+PGyQYGuIESg3iAtMFB/I5+cotxvG175f5Pqto4v7yKZlMT0282HLIAsQ8pE3mwbgkKFtcZfmzAphr/65E4IK8haRuH4SRE8jpCN6lv0YII8PWz0OVRUpOCL0o8VgFP3VvF6ow6XbP3oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gLhmRyXN; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52b8b7b8698so3186007e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 07 Jun 2024 13:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717793633; x=1718398433; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p6tMfLMEfPy9ylv7zqzbxmkBmy9bIJ2z7b+jtJTZiz8=;
        b=gLhmRyXNFICiRNwKRwlVTd3iWM7nI6D5b0XVxaN6gpaVl0nTk194vQY9+NTaXN+wOs
         pmnyw9gtY+Glq6/sg/tCVdxPFZ6Ldh8kE3t73SzemLROC8HeKD7d8+bKSzLQJEFr0QVb
         Vy5UTHpjNBzlC1A1GgZPwkRJsjllHN5FFs6cJF5T447c5y8cFRm8gQ71o+Y8+Sp6YCpI
         6n6KA/yqF9KuPOwKSzvmpnHbeoP6WudxUPfLsV8qIhLoJd/v/glSmmusglV7SHRVS7Un
         WttuuyAcrTfgvNi9qE7S8uYxutb2EYTzproqZ5vwG20szuhyJNAhOjhmmlrJneZgagWl
         qr0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717793633; x=1718398433;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p6tMfLMEfPy9ylv7zqzbxmkBmy9bIJ2z7b+jtJTZiz8=;
        b=UrByBsI1PSpF5rRuRcp2Uzd3w8BLaKE9n9LDQDgIZ81lt+Bl7qGSk/vd2jbKuhsjZ6
         DyyTMrArclaAFnSFHPjl7XBq07mkJnb7oSQc19aocFg98vf1/ZwtOh1amAOWN0De+7N3
         5Cf0PYHyA66osZxtC+s1ToJ6r6NFRu/k8GfwVTW0qvHWt2G6Uj5YrLu8S+cqkKihkHT6
         ZLlvJFCeAP0KJaGKaewHkbsNhZDmk4CSzdj0YYnFcfZmVdlQHnjoFGQLHAVr12UGpaUY
         ytQ5JOWYgMqmrK525I+N3JF46Lo/sYQiLSrkCDyndi7k0EYjChmcnoVwyPEziHF7GrKa
         JfTw==
X-Forwarded-Encrypted: i=1; AJvYcCVnbWzgbLRYiJaAsNKr1HXiJFEZAkomisXriPI2mpko8wBZUJsBrL54kKUBbWODgbrWzUtMh/qVvBFmRRzLY1URm5rIPKwUzHLI+w==
X-Gm-Message-State: AOJu0YyMoA/0U6OuOpFOpIfwmbj6Twgz1Hwh7EFbb5dOczmqBXUa/S+n
	qkQV8bv6fNB9zgThBIXqOagM8JyVrLKd1AWmiq0RdfJcR4w9iJoxI0mMOFHu4BD9uKjuTz5v0NV
	xpxD1yEm1KSQ/2H9J1JBhhHHYDccijECJrNQ0Yg==
X-Google-Smtp-Source: AGHT+IEvks17nJR8asjH8PhomcF1cey1wjkOU+SX7E9Lzp4zBUKn/Z+T817IqPLPi5qKBO3N5uckPU9YtHMMXQXgWSI=
X-Received: by 2002:ac2:5588:0:b0:523:a924:3268 with SMTP id
 2adb3069b0e04-52bb9f5d4afmr2200384e87.6.1717793633140; Fri, 07 Jun 2024
 13:53:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240529162958.18081-1-johan+linaro@kernel.org> <20240529162958.18081-10-johan+linaro@kernel.org>
In-Reply-To: <20240529162958.18081-10-johan+linaro@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 7 Jun 2024 22:53:42 +0200
Message-ID: <CACRpkdasVHEgqDLs_CdAJ3YAQPA7k95TsT22ErcU7TwdaSTy6w@mail.gmail.com>
Subject: Re: [PATCH v2 09/14] dt-bindings: pinctrl: qcom,pmic-gpio: drop pm8008
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Das Srinagesh <quic_gurus@quicinc.com>, 
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>, Stephen Boyd <swboyd@chromium.org>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 29, 2024 at 6:30=E2=80=AFPM Johan Hovold <johan+linaro@kernel.o=
rg> wrote:

> The binding for PM8008 is being reworked so that internal details like
> interrupts and register offsets are no longer described. This
> specifically also involves dropping the gpio child node and its
> compatible string which is no longer needed.
>
> Note that there are currently no users of the upstream binding and
> driver.
>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

This patch applied to pinctrl fixes.

Yours,
Linus Walleij

