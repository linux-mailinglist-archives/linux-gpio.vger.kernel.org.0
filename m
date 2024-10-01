Return-Path: <linux-gpio+bounces-10634-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2F998BFC2
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Oct 2024 16:22:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8C6941F255B3
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Oct 2024 14:22:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BDDB1C6893;
	Tue,  1 Oct 2024 14:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pjNIQx1H"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B677E1C6F61
	for <linux-gpio@vger.kernel.org>; Tue,  1 Oct 2024 14:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727792473; cv=none; b=TL6tQZV156tEhLRP/qdDshEy521fg18e/jZVb53rmmjqbs5UmAsYbM4D/SABguGgDswOKxqqBO5iPi3zQpErfBhX96hjgG0rh5nUj4dDG00QtZLegTyTv+lMBtY1XWVP0O17Z7wE/ESQCTTDQ7g7JndCgcM1sKm6gnFbH/uAijI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727792473; c=relaxed/simple;
	bh=+fUUg6wXPdekMyvHOeP7/dum9W2P6ZyswtQcSPGP6b0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YR1iN3HsmZqW7iGr8k6B93X5sT78ZXs9ukBKQkPldSOUAbIc1o0gO8KnsJbuJBgA1dqf3AphjSeDehdAF99NIc03qU0JKS+liLY7dJw9Kkwu/czKWgPY0LJUZacwcLriVEoyQMw0aIAx35BlGbCaYR2l+AVSl//7cpUcYbkdbWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pjNIQx1H; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5399651d21aso1935406e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 01 Oct 2024 07:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727792470; x=1728397270; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+fUUg6wXPdekMyvHOeP7/dum9W2P6ZyswtQcSPGP6b0=;
        b=pjNIQx1HOcGcO6rbLm1K3lUOiwcXNtaOZJvaDW5Qn01Sfyfets/hjr0vJX3BvevEKk
         NdcwwBfXaNU3eq5F4CdjVGAV83Wc6M1UlQJtttyhlG6RlyKvpwRxMFbBfvOKJABWk8Ay
         DMygWrB2wcVx8zd3IRZTjYNbkybBZDsj+C1CIsO4vIMdqWSA1W+/LVtsAy3ThVzbE58k
         +hFy3cR4f1OjZiT+6kJ4BV/3GXdHN1ifAAn/9m4rWUvrlJ0l/5p8hQPavW8q4J1mPEFP
         01RntXtE2ZZsrjp6yW2ouZaVS2mixlYjwtbvoNfffT0OqQaJFnmQF+vrVU6faU/UAMmT
         Wx2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727792470; x=1728397270;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+fUUg6wXPdekMyvHOeP7/dum9W2P6ZyswtQcSPGP6b0=;
        b=oYItJSb8mEXwY9Xh83namLBaShwUYISKzaPej+s5S5O/vW75lAbLnuwW9z35EKwQwX
         qslWg6Od6ADOjis0fDVTD+nQ5gJ2rcyVbC+m4I+muJdqEJq/9gZkP6NSVOcb4kwNrOA3
         PGga0pMtR0I/pKtkSoO3rhAyV0IXeOJz4PIG4BYoaXavP56BwyQ3e8rbQkzwx5UzMNCd
         rzxQSjSIJERRWu48FejyLBEvrMUR9d4jD611JLcUuIkpwSKZui+HqHrMYSXL/OxybHOf
         Rjrz5bfJ4TWrZFuZFYQFa9h5AXEysGaQM2rFcBymXr3z2zVYaas3bCBXKmhga3JUUG17
         L9xg==
X-Forwarded-Encrypted: i=1; AJvYcCUdYnXu2s8F8ov9cU2ONRAqrcRKjhQmlmCQ1vIuupW2q6UEo+GWTJtjs804KvelDvuwibl2wF2Z55YL@vger.kernel.org
X-Gm-Message-State: AOJu0YzdgBQ1WBsOK8SBMnh+tv6EWXwuz2s8PjKAhJHTlgRzUJY5Q6HE
	xSMlOd/nrJJ20qe/bniu9YiBM8eU6MIEyasuUTA0YvPM9KWgO5XyWnZmuYqhca1QmI/GbwiDgZj
	uFNpyso8yklmneGvIf4Y3+rOsosEZQSeXpKDzVg==
X-Google-Smtp-Source: AGHT+IF2/1pgO9Ijv3SL5ArOgQgiuCkwW6KgrpuffEXoKgOuDtnnsExK5mXWa+CpP2ivtrYXPlT/oaTNKrKCUU633hU=
X-Received: by 2002:a05:6512:158d:b0:536:545c:bbf6 with SMTP id
 2adb3069b0e04-5389fc30e6dmr8096481e87.1.1727792469890; Tue, 01 Oct 2024
 07:21:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240920-add_qcs615_pinctrl_driver-v2-0-e03c42a9d055@quicinc.com>
In-Reply-To: <20240920-add_qcs615_pinctrl_driver-v2-0-e03c42a9d055@quicinc.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 1 Oct 2024 16:20:58 +0200
Message-ID: <CACRpkdZk1ZvovjbouNxvDXBBf6h3kvMi5z+AdAgxDJMZTvzUUw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] dt-bindings: pinctrl: describe qcs615-tlmm
To: Lijuan Gao <quic_lijuang@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, kernel@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 20, 2024 at 10:00=E2=80=AFAM Lijuan Gao <quic_lijuang@quicinc.c=
om> wrote:

> Introduce Top Level Mode Multiplexer dt-binding and driver for Qualcomm
> QCS615 SoC.
>
> Signed-off-by: lijuang <quic_lijuang@quicinc.com>

Patches applied.

I picked up Rob's ACK from v1 so no need to resend.

Yours,
Linus Walleij

