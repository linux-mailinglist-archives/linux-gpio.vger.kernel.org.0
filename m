Return-Path: <linux-gpio+bounces-7713-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C935917D3D
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2024 12:05:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 18E1D2856CD
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2024 10:05:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E65A176229;
	Wed, 26 Jun 2024 10:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Vm9YDRV5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45607176247
	for <linux-gpio@vger.kernel.org>; Wed, 26 Jun 2024 10:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719396282; cv=none; b=N9u8RwZ17/H2lm4zIbW3xoaFGTKV0ekIGiKWvAYVieVNM/sn/OR1oD9dwa/NOxgkifqxCtjv0268XnCVTGETQ3aTkgOByL2zK4c2OdT65U9xDGOsi2EzbGyY9wi/P3acLeXRhLGps7I3nvqikKVKzgdWjn+xo7rQG1w9Mq8q0uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719396282; c=relaxed/simple;
	bh=wAGGb9nbphDH5JrB+dXV+rNYOi9vDVjsKxMqqIkjMOo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o7Gt4l0hydvdfOlMZ2WJliOmb4uVwbDONre7jrgYZLhL5fBX0QRdc9KE3BPnO0arHoM5wWpUq41SM+anpHpOiafuHfISEimSuu1cdp+cIbYaks/Rwk/O1wulvWA8/By7QqDYyfVtIRphVuQ0sT0uR67nPr0sVKUKqElzsEp86AM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Vm9YDRV5; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52cdf579dd2so4010578e87.3
        for <linux-gpio@vger.kernel.org>; Wed, 26 Jun 2024 03:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719396279; x=1720001079; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wAGGb9nbphDH5JrB+dXV+rNYOi9vDVjsKxMqqIkjMOo=;
        b=Vm9YDRV57apSpdpp2wA7uSKyGiEwLBYtVRur3DGKAp77cCw+WDcvD0FA/TaDRCoplK
         6pRKFxp9qnqV75TNYYQJ6TmKYs7g7Ko8PHDiEqiaaTvIbuN00z/ge7qrkr6pWiKw3pR5
         4bUESsqQFPIAK0MAEBgFWOxY/2D7Cxm7lK5b0yra7obIu+BQg/Bhgke0CLETntZ2Z629
         he6V1deADExy63yvUQG6cwWraJOnaJoIOARtNcLqWMBVrMBqFU1K3Nuf/l8krGMUjwFS
         DnYO/3zcpcxQ+6tCM76ORfH14adqkp9CHbY+fGgVYGW4e8DyYg2WBPedlx68t5uJ3xyD
         XW1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719396279; x=1720001079;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wAGGb9nbphDH5JrB+dXV+rNYOi9vDVjsKxMqqIkjMOo=;
        b=Cf0Rt6w0KXIFXcqLFTw6My7a9LgOmc/JbyZcpqjsOz31ov9ctkbhPK3kbK/lfHK+6P
         IP6/K2xM4zTUVBKmfg1QWyWnQR8OdBZFc6UveBOaSCmPhXczb09YeUrw/ID8gTyJDcAV
         tj9j7x+qIGXhZSxyG6cs8u1viUPNiIO5JcH8bumvyakgmkvSuOyBmXaREy7XUUkCq053
         W+cTEp/xYdiViFDS9t1aPAX5LToBU6MDfYh/1IKETmI1fo5hwx11PGC3tdE5gJ+vx0RW
         rwhqPM+oRuw/Kk+ThkDqCHkTt+iqgAEh2h4ULWt2tcpdcv4G3PolZHU9oTLyI5gBIAyr
         DfEw==
X-Forwarded-Encrypted: i=1; AJvYcCV+Z7yE20GhViY1lZ0ZJearI6GbfQ+a8XooYm8yOB7jZqiyWhAbwbX1tqsAik3/lOf5GSqtrb3VmzGR3HJkYveAD5e/gse7lL6ejg==
X-Gm-Message-State: AOJu0YzjtQ1/9gfnQq8IoRECWcJdpWuqc8maszOn59bJMu4cXCzOM0p3
	tWkPzBQVrb/Nt2Va743o8Cb4oeKIBMuB5awdXVY89q59W/BdICFh6gzWS2+fx4/RglScPOjk76x
	Yg4g2c49PPLjNdk2gXJVphg4mTvcsMKkTMJesfQ==
X-Google-Smtp-Source: AGHT+IH7rPG5U6OeXEnbgIj889fPheKL56AlWQLK2rD9EiaTdNPfPLg1zeaf3Y7+S07mnQaIGk8RVTc0mfDwCJd1S0g=
X-Received: by 2002:ac2:456b:0:b0:52c:df6e:9517 with SMTP id
 2adb3069b0e04-52cdf7e66dfmr6847985e87.11.1719396277395; Wed, 26 Jun 2024
 03:04:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240612-sm4250-lpi-v4-0-a0342e47e21b@linaro.org>
In-Reply-To: <20240612-sm4250-lpi-v4-0-a0342e47e21b@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 26 Jun 2024 12:04:26 +0200
Message-ID: <CACRpkdZyupZmV+e=L0KR8ospH9P=wdUrMFvBnGXyfhLhW3-=PQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] pinctrl: qcom: add sm4250 lpi pinctrl
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, alexey.klimov@linaro.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 22, 2024 at 6:49=E2=80=AFPM Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:

> Add support for sm4250 lpi pinctrl.
>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

No major protests against v4 so patches applied!

Yours,
Linus Walleij

