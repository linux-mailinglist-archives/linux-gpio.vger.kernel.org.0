Return-Path: <linux-gpio+bounces-20021-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4C8AB4FBC
	for <lists+linux-gpio@lfdr.de>; Tue, 13 May 2025 11:28:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1F1B91670E6
	for <lists+linux-gpio@lfdr.de>; Tue, 13 May 2025 09:28:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54313225A5B;
	Tue, 13 May 2025 09:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xtXHVIrE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D9C202C49
	for <linux-gpio@vger.kernel.org>; Tue, 13 May 2025 09:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747128523; cv=none; b=clOiKWncNnXH6t9w89pJE7HAGjmUmTJSd0kNt8colG8duOkXVGjNtf1VOFaxRmgpzyR0kqyuJdXuH4WHgoyju6cbbRBk9h5QPVbiqf25V0WNeNoHHk33t4nltXQnEoqUlqQTIdSwSBbpJGmMXKm5/wnTITlxWVHKROxeK0UuhAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747128523; c=relaxed/simple;
	bh=sdWO6ko67mqTWcGMEtMgDVXtVTLim084V1a605JGgT8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X5bYptAFGCEN/E0dxDbZFLuNxVRHFOdPRaFZqSi/gJjLpz9ZI/dWFxTW6aq7QNLFssHGVooFFjMlt6VRaGBzgw/8X6OPGjTXc0n5kF4c4pP1UdZwMJmfRTMz9rnSb7Y5ZWDb2OZkk5ER/uy03CjjT2PCpwP8KSZBVoq6IpzMVTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xtXHVIrE; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54fc36323c5so4892261e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 13 May 2025 02:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747128519; x=1747733319; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JBWoBdG3lbXFBJdWTyceAqfFC9xtnHUxGj7C5Wu4R/Y=;
        b=xtXHVIrEJxQpK/jITVVUxFeYQH6C6fVt+60KftrSUEpcV+ZgECys7tjl33Recxr7ZX
         L7cAZzCkuXLXDSq+UBPQxzDwe3EAx6RXkgsGPDSMgJFAPpWug//zhfP9EQ1mMmr089lk
         ON7zUSjCE1WIPfjfoRXGxeJ3Tw4BeKLG9ig0T4ZLxNikNCJ4OQYaGQUXooFKybdpY/T7
         AMm8SHkM9O2FjGJUt8Ci3XHtWKPFztGf1DCdGpPN0gnxkn7sbr5Fz7WtbZo851wbXmpS
         MPDbRY7FwNXBVIJp6/xsgRe24iiSqb0qly7RXgUHdobJjCtrq3hpnrZV91xj2d8Cghkv
         FdsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747128519; x=1747733319;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JBWoBdG3lbXFBJdWTyceAqfFC9xtnHUxGj7C5Wu4R/Y=;
        b=LgRq/J1t5E2QS26eQIRQTfeDcAJw5rj1w2H/K5JSX2vq/Ak8VJqgdGXddJzRgSMYpI
         vWroTOsp6V4tjWf5BtNVN+/jMb8LXJ23oHB6EU7xXOVu3Vv43NhTDNQ/jgSrXNichBrX
         M90xataKoHhuPdjWVPjhRJTVYEkNORZXiLzJgfUxH/HrvmmgAq0+dCQH0mLvH2yV4Vrd
         E0nwXb7GJ2oWfWsHXLzm0dIcGD2c904FVhPv6kMkAgvWFGWIKQoPr8MOesIwLALIdG21
         4r0a5ZlBbD1LkIdkziHyxOoJ7P+E79wM9fIJJD++aKpFF/OVTFOiIJzNKMpD59KddL/K
         i+zA==
X-Forwarded-Encrypted: i=1; AJvYcCWGnym2xidCWB6mJzikMRrUFx4JqmfFCW6Ly74Pbf1eYxA+DWbysP0vH8CIamgi+cNF/WZXSG4gTDgc@vger.kernel.org
X-Gm-Message-State: AOJu0YwUxr8yEQOD/CbI5OWwdYrd/aLrfDLAcJbYcESPYY6V8oIU9TOg
	ah8XLlKv4A/01KOoWQuznJkasiT1qV8Pl3eMx6ou39DZWwKll0iPyaY13sI7lRpWD9lWioh5H1D
	I9YSkuhaLxhdCHRWSku4izfopTWsrE2/YKd4vwQ==
X-Gm-Gg: ASbGncs2ljB5MiSGfG8erzKzyH6KmQ8FkeUeYA2KQjhxyEQlPm4ZEx5PSRuRjbFB4r7
	7ja+jUIdIeKGDcZ9Sncq7D+pDhOeLZLbSEYVOz7u9t4QYn3AJ9iMT/HobYZYHaYOZ9btR1NPEvi
	jmKdS9XO8yJHMGTTB2P3YXA480JODXm81Z
X-Google-Smtp-Source: AGHT+IGPsCaQsVwlbGypFhudSFOc2s4QHLHTEndYHt5ArHEoc7abTls+1/mAIN2RUHgXYU7cdExwVaSdPdvNIIu+maw=
X-Received: by 2002:a05:6512:1385:b0:549:6030:a720 with SMTP id
 2adb3069b0e04-550d0c09efbmr969887e87.23.1747128519475; Tue, 13 May 2025
 02:28:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250503-pinctrl-msm-fix-v1-0-da9b7f6408f4@oss.qualcomm.com>
In-Reply-To: <20250503-pinctrl-msm-fix-v1-0-da9b7f6408f4@oss.qualcomm.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 May 2025 11:28:28 +0200
X-Gm-Features: AX0GCFu5WhS-D41dmYNwbrb5PKy-0pktNjYekORF361g_nOjHNY4p6UTBXBPCbc
Message-ID: <CACRpkdbcm3AkcT9SxWfEYz1tsZQSLMUgY5nmTD9_iEq3Xs+shw@mail.gmail.com>
Subject: Re: [PATCH 0/4] pinctrl: qcom: several fixes for the pinctrl-msm code
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
	Josh Cartwright <joshc@codeaurora.org>, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Matti Vaittinen <mazziesaccount@gmail.com>, Doug Anderson <dianders@chromium.org>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dmitry,

On Sat, May 3, 2025 at 7:32=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:

> Fix/rework several issues in the pinctrl-msm common code. The most
> important fix is the one for the gpio-hog handling.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> Dmitry Baryshkov (4):
>       pinctrl: qcom: don't crash on enabling GPIO HOG pins
>       pinctrl: qcom: switch to devm_register_sys_off_handler()
>       pinctrl: qcom: switch to devm_gpiochip_add_data()
>       pinctrl: qcom: drop msm_pinctrl_remove()

Nice work, since it is core stuff it'd be great if Bjorn could take a look
at the next iteration too. (I'd suggest to ping him on IRC.)

Yours,
Linus Walleij

