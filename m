Return-Path: <linux-gpio+bounces-17616-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7848FA60F90
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Mar 2025 12:06:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BBFFB173681
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Mar 2025 11:06:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C3B81FCFFC;
	Fri, 14 Mar 2025 11:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RgZ684Ni"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9719916F271
	for <linux-gpio@vger.kernel.org>; Fri, 14 Mar 2025 11:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741950360; cv=none; b=I5yTeudlnPGZzGR3vRpKLNR8gU1g5Ojen9QXj7d2UsZ03EnyeqBZA80iuX9tXHMbOaOUDW+C7HS3rioUFb/scsfgqvb1IGR18AFJNL3jpmfKK8i84Z9/nZmLkSK3Mo8Gjfz3Ub5YbrfU6DtNoBniXBxs0igQPiqpqwi+rUU9KfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741950360; c=relaxed/simple;
	bh=XxBikUZY8aio3BzZ0PwzUhcA6cIoxXU6nbqOx8gyLzc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gOQ/x3oOygBFaiTjuCwPzae2hJEfe8PATk3RQwRwPb+RpuuKoTAP7dYaRtyBXrHwRaBlu0oQal3ER8LZcLxscRuxwYC9zKgyAsMdb1fN+7vubAwfRtJ8B7twfseSNnAC1/No3AxsZ25uKCXaf0asyDWFoi+u1GXWQGNtpcvRs4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RgZ684Ni; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-549946c5346so2060318e87.2
        for <linux-gpio@vger.kernel.org>; Fri, 14 Mar 2025 04:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741950356; x=1742555156; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XxBikUZY8aio3BzZ0PwzUhcA6cIoxXU6nbqOx8gyLzc=;
        b=RgZ684NiMVxyjEe2ggUmSWm2pHyOHmOvvAZFazNWOrukjHbCWik9Y+T2u1tEIHfN/s
         TtVhc09UAZgtCKrJLijakB4GP22ymg6rW8qf0i3ENDs+83HczkfNXJVyNMzE4WEOEirA
         jSbtVQ1thXolsIbG7YXmhuRjSn1yfV9j8LVjIfudMU+Y1NWbLAVac3+iwrjoB8S1O4Kp
         CLtczlp6cyZ4zsvacrp1niD9jZlL4A95svrv9io+QKyqFx/X9HmU0zsUyUTzYZhRlLui
         Oc6IxH8J9SxIz+RSgCegQKaNVKtzXhjMl3oLCsp5VFyryy1QGCRf/hwA8oFjJIxYaVxQ
         m2oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741950356; x=1742555156;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XxBikUZY8aio3BzZ0PwzUhcA6cIoxXU6nbqOx8gyLzc=;
        b=CNF9W3m95KSVGJaWV9PF7oqudZ91BiErTTwBwsWDmAp0CGT3H4f2JNLnj8S7+jzcC6
         7T/BWYM1PjUexECFFv3v5FIE5GsfkJSAeYJvOROProltH1hTfq9BLtBvdy7KS24N5r7M
         gEDf1YkfUNMolwNrNILcPOsXIAwQQi8J+wrEKq5SlmSUU0YBgZcgfpdU2cnH46iFwnmJ
         sWb0s1KMRvP9RAY57ePx+ZdhSiSfwa2KPsaKvzSNVB8mKPpk+yENM922ka0zWUClHPoj
         jBjJaqJ2mQt1moI9WIxLehvM5PpNtMloexn34jH+j/vD5WVkaKJnqQf0rHCvjkrz84L/
         Mtrg==
X-Forwarded-Encrypted: i=1; AJvYcCX/m8eoebCMV0HNNR3xNOivRqdGnESaiJBztu5LAo5ZyMeXLwX70SRebEo2dk9CfMGIntyNxl9tG+jD@vger.kernel.org
X-Gm-Message-State: AOJu0YznPBqTW6Qd/HiXYHc6gB4AkZuSHzTEoMAes9R0WZ0n9rG4OMpK
	fZhwbPA9uVgCpW528PVxqLHd0WVI9be0dX4dLG0n9fe+Ye2YDXlackLSnbiJgVz7UQiE/4xB8z4
	cDfr2qHElq+xw6cGLTrwUt2bWk5tsSQGy5w70B9KcdP6zuLkX
X-Gm-Gg: ASbGncsowN+AEgUdpZT9QD6HHBxqx/k2FsUt6KN7ugPvFKSa2pTXXqe31UvboaGF4P6
	lT5uE6iIdeXPs9sqMK3/oqjkq5r2j7oz9i2f9BStrE1HN59AbbQvO8i9Ytg5MhZB20VRVGdun6Y
	4FCl8/jjJIsTjsIY5vVOCAyCQ=
X-Google-Smtp-Source: AGHT+IEtWG3hGAPpwZpW2Kb03ek5XF1oybcCjHGNlFQDEQWQLDYho05PNF9pKqd+gnKE83MT+G5mKyZ2nU0ypW9l18U=
X-Received: by 2002:a05:6512:696:b0:549:8b24:9896 with SMTP id
 2adb3069b0e04-549c360f4a4mr746105e87.0.1741950355704; Fri, 14 Mar 2025
 04:05:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250313-tlmm-test-disabled-irq-delivered-v1-1-f0be903732ac@oss.qualcomm.com>
In-Reply-To: <20250313-tlmm-test-disabled-irq-delivered-v1-1-f0be903732ac@oss.qualcomm.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 14 Mar 2025 12:05:44 +0100
X-Gm-Features: AQ5f1JquHlFLF2H3luwsKOipVRgfi7l4qhjJICzwca1VCtyRkDi9-duvsKNCvNc
Message-ID: <CACRpkdaXQ9=9+ec3VNSE1YXADbRttKx2wJQB+o+WHmzaNj5ZVw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: tlmm-test: Validate irq_enable delivers
 edge irqs
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Douglas Anderson <dianders@chromium.org>, 
	Stephan Gerhold <stephan.gerhold@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 13, 2025 at 10:21=E2=80=AFPM Bjorn Andersson
<bjorn.andersson@oss.qualcomm.com> wrote:

> In commit 'cf9d052aa600 ("pinctrl: qcom: Don't clear pending interrupts
> when enabling")' Doug establishes an expectation that edge interrupts
> occurring while an interrupt is disabled should be delivered once the
> interrupt is enabled again.
>
> Implement a test to validate that this is the case.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

Patch applied!

Yours,
Linus Walleij

