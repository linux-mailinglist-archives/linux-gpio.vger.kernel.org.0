Return-Path: <linux-gpio+bounces-24754-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 149EBB2FAF7
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 15:47:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 68F88AA0485
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 13:40:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D559233A002;
	Thu, 21 Aug 2025 13:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QBkuTnPA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE0B338F41
	for <linux-gpio@vger.kernel.org>; Thu, 21 Aug 2025 13:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755783296; cv=none; b=J0IkIZBluaClKt/9s2oWGVhQACn0wJppaw27XvDjEUUXZBbroQ7dxTOL8QYuz4laMj8ER7fXsmGKhyvFcWD9DZl7fh0PprNR600j7oCNiqc3SDqVUVAxd8EcKjRqcvm8LkSjv2LfswPWJgglXrVFqtgCbCSEvtgAsx+4/Eh6sBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755783296; c=relaxed/simple;
	bh=kv6n6GOVWTADV8kGP5+6GEG5ThL+6nnGm9DljXi3Qxg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=chG+qxJof20N/Hql0YxP2nNkEfmj0Mz5yzaLQTiMCv3faH7LlcEwBFnClzv8JRAPEF7DeZsqHQTZ2haJmZBOVBK77IWg7wzys6evQDNf7T0Y5a6vdhC/5B9ZnFDSKvsXrIayijKwpJD17CrX/g3d5efNxEg47RupoxZv9PFK5Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QBkuTnPA; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-333f918d71eso6914291fa.3
        for <linux-gpio@vger.kernel.org>; Thu, 21 Aug 2025 06:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755783293; x=1756388093; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dnk1CgahWWI41MJxVYInV4yTmBrTqgMN7PmBauKY3jg=;
        b=QBkuTnPANj3BZINlJazP7frVb5LANa77kiv1wlh6sdJ1Rocs65TYZFopzIXJ7Gpo4E
         bt6XHcKCfPzrwWd26qjSGCGOD0OjzXiZTJ0uj5i1lBkPsIxheHzsRJnDnkKWTasUnh98
         w+xweOAbIQHvTKl0Y6B2wJsyMZ7sqxz6Ec85xNOUBKF60rZ2gc3Wc4/5Y/+p8uZtQJUc
         mv1JfcJ0DfZ122AHny8DVZSch22ZlQUos0ZzKopjrYJNr9+PM0BWvZgEet6VbEOQD8sM
         ELG1MnACc3LwbBnbAAYJv8VRmXmQ1e9pB8tUINj6oYmnnxhzxpG9Lr0zW4A9M93/d+y2
         QLPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755783293; x=1756388093;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dnk1CgahWWI41MJxVYInV4yTmBrTqgMN7PmBauKY3jg=;
        b=H3OkSOj25o+m75H4epmwPQ6oOhsdts55NWse4VRI6nLfSaq3OIVfnt+lBgdc/mCi01
         AZX7ppb7+J3Qm9+Duq91g0Mg69y/gLQFbuOj2KuIbzs9qufnkAROqtYpwANLkLAnnqSy
         CYmhpADFwmddiqJ6gVjMllFf6kARBWUAFuBP8rFLEvb02JYvqo9y8popsDmjBzp+sR+J
         8B2g1VvlWzer8Qlj5bHah6BD6yloitTqYs9pYveiS4eY2KDuxhbp0UnmrwjDip3xxV8P
         evNCqgMAUsCkfdnmZprwfcr2R2/QT+GXXXluhTMHRFREINFqA8EonMlJDsHvSpr0lPQx
         RtWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwrFm9t9Ff0ncYgjX00CzPOIkOaVOiF6wkMhm+X3tSubgJNIYuSXZhLAbJlwEGsaIeYuu8toNrOnLQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwvOU3BKeavitGLU1UDw0rIeuevW6AZ7/ycS6wJsCrKo9pPcChH
	AddrKQ2GZJzToiCkJJqTOle+fy8yl9KUiE5nuP3ns/QFCa9GsVyp1fNbYzCa8hrHluk2rRm9BHh
	KmA6wJ0BOCUia+FiAxle/IeGIlqq4xWokBnw5TlWteA==
X-Gm-Gg: ASbGncuWJbA0a/OV//3gdzLo3In6RMfWJIdl0rfRuXrtb4dsacBf7HYmIWmKYlDDTNw
	MMllP6pBlTrTaety1qT/wWLNtAn6DU8OYyAVXAXFF7INxGxPdsh13jcwHkB4iBmtzsIOM5mlSHJ
	3bnJ/hiMtd5QhFun7k+kAczZHrKxo7Et4vF3Ef/hceVBMdv3hBuT0jMF9RGO0D5bu80kK1arJq7
	N+/4MY=
X-Google-Smtp-Source: AGHT+IGKufYc8VS+JVO/RTN7GptvxunMWcIXqzHM88cXAswfPy/+XrvyTDd4OoGPmr6RyZIf76Xo3OAHmqvX/1JjcQo=
X-Received: by 2002:a05:651c:2112:b0:32e:aaa0:b06a with SMTP id
 38308e7fff4ca-33549e41fd1mr7866791fa.8.1755783292895; Thu, 21 Aug 2025
 06:34:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250821044914.710044-1-quic_pkumpatl@quicinc.com>
In-Reply-To: <20250821044914.710044-1-quic_pkumpatl@quicinc.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 21 Aug 2025 15:34:41 +0200
X-Gm-Features: Ac12FXzZfdEuIXlDJunjHifIf2iPhc7L3Fxydb1EWGcglhWvXkLWa6PHYXSvLu0
Message-ID: <CACRpkdYEzbM33HBAhHEmAg9f4Zpi=2WvqPdZ35=M2eVCqcTTFg@mail.gmail.com>
Subject: Re: [PATCH v8 0/9] Enable audio on qcs6490-RB3Gen2 and qcm6490-idp boards
To: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, kernel@oss.qualcomm.com, 
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 21, 2025 at 6:49=E2=80=AFAM Prasad Kumpatla
<quic_pkumpatl@quicinc.com> wrote:

> Mohammad Rafi Shaik (9):
>   dt-bindings: pinctrl: qcom,sc7280-lpass-lpi-pinctrl: Document the
>     clock property

Can I just apply this one patch to the pinctrl tree?

Yours,
Linus Walleij

