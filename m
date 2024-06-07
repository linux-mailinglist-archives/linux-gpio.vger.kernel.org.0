Return-Path: <linux-gpio+bounces-7265-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE71900D16
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Jun 2024 22:38:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A885CB222CC
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Jun 2024 20:38:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09559153804;
	Fri,  7 Jun 2024 20:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hCpc/3j3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1D21804F
	for <linux-gpio@vger.kernel.org>; Fri,  7 Jun 2024 20:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717792697; cv=none; b=AeidMQZkvTBfjzCmVtF1hrME6YmNwKxqbYgZ8ZwflKuXNLtgiFmW2IYlz8HIRaP6w7S5ib7Ww8tkM3/uPn6GcZ0RQhpfvM6+7zbHX5kYtxPBEuL+/WUPZ3/ZFAom5zi4JLWPgnnuqBwHNPhWPRWt8P9vjvea78Cl4UiFxk+Sh/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717792697; c=relaxed/simple;
	bh=aPBnfdpHuugcMMux2VsK2N47w1DvhnhhGjc/ykm5Dm0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OOTp6uhNYP9L+pep7HYE+LDUlyKcW+IpPW7tTmSl1AtODM4i2HcLHqvOkzr6bOM0+iAYD++xDkHE9CCTZrgWtVbycgedmWP1B6iby5WREPnSIPbeedZAPlISdFD/zp/JFIx4Ad6E3l1Ft0KMiPzMxZSHZnCVqw5JK3K9PjO8cik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hCpc/3j3; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52bc1261e8fso969044e87.0
        for <linux-gpio@vger.kernel.org>; Fri, 07 Jun 2024 13:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717792694; x=1718397494; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aPBnfdpHuugcMMux2VsK2N47w1DvhnhhGjc/ykm5Dm0=;
        b=hCpc/3j3Y81tXVqst8WPs+LcBwL2QEj0oqdkQgRLKAOOAxF+VN3N1kX28IYEkMJsV5
         lYIvpasSfJJ3t1WwntNdvoR2V0wxm2teZTC1OL4mydNGpQrhtsloMdSiot1K1TqmI10f
         hHTDRRKTFc0jOkHSrzfY8BPWI69q/GJzlSTCu2HNDG0dNr2lzRp+Y/0xhnCRXovltZum
         pWsxSj5EmEcAmKLGQ6eMoznltC6xsFL4UVViv0zL+wVRAn7l6AphRgWzVdu/Rab/ER7G
         hwwxYmqTo0b3EaMPqMeqSNZEUkYb3DoJggCHnLJqN551hp4Sh72riaBVTAHKkcQKOm98
         wvfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717792694; x=1718397494;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aPBnfdpHuugcMMux2VsK2N47w1DvhnhhGjc/ykm5Dm0=;
        b=v9jPxT9OFRs8d+eezVfUVjHzo3kEt7QooPBuyjqflFjoPJdVsSr0QsX+gy5ACcUGar
         uu57RGRWfwVZw/sgzEGdS5d/iKG7YiOA1DPeCQWGjNn9wTYj6SYR8Ed8dCfkDCqEV42g
         SS3Afs04biJ3rNA+4mNJIEg7Ob1pAybq2/MFbFFvwLxy4yMLS+xlvTEEtVOYPWbJ38qn
         0oWYOThvkhaMfWXAd9jL9tg8i8dnRGTTSyd90UsJ0x9gQ+nbCeQyBdo3z7f//Jmnr3bh
         fhSDvSvupTHiQgOsfCuOP30doYHADOpZNTdMIHYLtieVqApN4BJFkpJen9FkXP8EZJah
         XTqQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8YgI69OltA9OpoyRWCkVVZBa6Fvo5eqJieRKn76yt9o3vgVVr9mTMv/0xdObhMn2XNrH852TFWbW/PIBCL8OOjJmdrxLxEQ58iQ==
X-Gm-Message-State: AOJu0YwF4aZtICN1JCZD0BBF2+iTVp5rxwa0HbCtbfZlcNDU5+LJvsmT
	ySWstfdTG6Mq+Yl4s8FxpY6u3a5Lrc+tcpieHl9rkbSdtaDJeSoonBSBkI8ALA37VIx4uWx7LRS
	HUniaXDhjfQtqGXnRqg5gRpvWso3HOUwCIsiKsg==
X-Google-Smtp-Source: AGHT+IELMizzwHCbea/o8vQcZT7SdjmJqfcXHq/L7pUA7OdY8fK+DRlYXVEgOA9aViZ0Mim4G1boeQa3cLx5DJkptco=
X-Received: by 2002:ac2:523b:0:b0:51d:3b87:70a4 with SMTP id
 2adb3069b0e04-52bb9f913e8mr2357387e87.36.1717792693887; Fri, 07 Jun 2024
 13:38:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240521152602.1097764-1-patrick.rudolph@9elements.com>
In-Reply-To: <20240521152602.1097764-1-patrick.rudolph@9elements.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 7 Jun 2024 22:38:03 +0200
Message-ID: <CACRpkdaxz2A42V2+oQT9CGGdPmenLj5pvZKzVmnrVkDy8jJQSw@mail.gmail.com>
Subject: Re: [PATCH 1/3] pinctrl: cy8c95x0: Use single I2C lock
To: Patrick Rudolph <patrick.rudolph@9elements.com>
Cc: naresh.solanki@9elements.com, andy.shevchenko@gmail.com, 
	broonie@kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 21, 2024 at 5:26=E2=80=AFPM Patrick Rudolph
<patrick.rudolph@9elements.com> wrote:

> Currently there are 3 locks being used when accessing the chip, one
> in the driver and one in each regmap. Reduce that to one driver only
> lock that protects all regmap and regcache accesses.
>
> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>

All three patches applied, thanks!

(Looking forward to a <linux/cleanup.h> patch!)

Yours,
Linus Walleij

