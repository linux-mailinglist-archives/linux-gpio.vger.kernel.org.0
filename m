Return-Path: <linux-gpio+bounces-7413-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E519066B8
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Jun 2024 10:30:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 359DEB25EC1
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Jun 2024 08:30:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 746D11411F4;
	Thu, 13 Jun 2024 08:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uGRv3Xdo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E46B13DDBD
	for <linux-gpio@vger.kernel.org>; Thu, 13 Jun 2024 08:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718267280; cv=none; b=CNaCGaajccv4tmK4y+iQ5flbkYv056mW/UKX/r8Qv0jIjMJkoMRQ1/hhawzbK6hwEy3/SG9LqVDItI18TNlYn7+E9+KM7da9g8a0uZFGqD93ObYc8vZYZm5iiDwyx5+w/fNMk4V6PycHEgLI4oGKJEkpttOeJUGTp2TBccl//qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718267280; c=relaxed/simple;
	bh=kgwdFkT5jQVkbTkpifsZnVL3/ED3qR6JJb2HD5RT8aU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c77lZGheAnQ8A80emrzHGBNWgCNrz/I22aTAu5XYc9Pr9XRCcoy2c/VPJjaalLOo3mDdNEeJ7LMvZYy4DLBPSrMFqYf5NhEXdo4g+ULg76RkM4EB7xdrEjTra3ZgnxLVmxLPGRti9wGZmZMiXpH0kJ8AeW/fWr5RYh2N4/5aBww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uGRv3Xdo; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2ec002caf3eso9801501fa.1
        for <linux-gpio@vger.kernel.org>; Thu, 13 Jun 2024 01:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718267277; x=1718872077; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kgwdFkT5jQVkbTkpifsZnVL3/ED3qR6JJb2HD5RT8aU=;
        b=uGRv3XdoYYbiI7j635aKGfcIP0UtjnUKUzdm4386EtkGPl804e98RERXJXoqu1IZeK
         XnTJFLPb+HCWj7Ldw4NhodFPQrJurzisZ5fO5PL1IqbeHg+DHPVYvgXNDA8jGxSxUyB1
         8eyYMZ+qi3spfpUcJ9dAcovSnAES/h4FcrjwLX3hJ36LKMqpwA8NSVcsSHLrRQ2q3MeG
         1787AZ3f43fnCX8nCUglolB+skffrqqNA9Ee3/wLhG77KPaSDF5w/r/VjUirX3qr6xND
         ePrnug4ITFThi/EHSsn/+T2TLxsHEXDfNEseKF+O6pD0tPJ4COgnP3oH3Jnvud0sm6Sx
         A+cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718267277; x=1718872077;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kgwdFkT5jQVkbTkpifsZnVL3/ED3qR6JJb2HD5RT8aU=;
        b=tmFRJtHK4DkHobKriPGGsw5m60kV67ohGC3BOqlZ3sJH7t35eIQ8j1RQTtECX1aTyt
         pk0CZO0D/KyuHw/qZZYWEC+YX7PdGLmOvaIeln8dqxbcSF/xzLS/L+5XNqgcgLlZhE7a
         q9rRcQfOAakwVDjXIhSnOp9zv6rVZAB5zl0AvlX4i3e6/tsQd0xowk6dZw3q4tTuAzkG
         LrLEQsVviiuwAlDJ+TX6407prfv6iSUFsi7Qt4VBVped3jqyPhzu0yU9UT+PdvQR5h5i
         4dGstbaCZlQlA+tm/tN7cLRfa8wvalEF6qUsLgjqAzj0LbKBXyhkco4viGcyyvH9LJFa
         F8DQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOF44ZD71IrZuamHp9FovVA9CNTQdJvaD1QdMkKZ1j6thwDobnrch5RkxYyK10mCS5Tn/GVCnGCsIv1iS0Xo87FJWmPdwM8bqMpA==
X-Gm-Message-State: AOJu0YzN5JOHLx3jJgjBbCtWaXSjktx+Vguk+c3Hc9X8yBwalgCGoFJV
	2x9bTkPONOlqkga+Pjf819DkEDuTUwyr4omjgyt235oPOANXh/tTaH5rIdym3V1YaSYvsfvlzeW
	uVphlFdYshn+K45CxXlVR5Aciztc0WmPZvRv6fA==
X-Google-Smtp-Source: AGHT+IG0JvsAd5xth/BC3tgv5lcQ9QX9U+ULp08rdR1sfnVOy3PCLMQDJg6DqKJ9H0ledN+9SoWOONpzWoG9MmPcd48=
X-Received: by 2002:a2e:9b19:0:b0:2ea:e2d2:6231 with SMTP id
 38308e7fff4ca-2ebfca34160mr32949851fa.33.1718267276747; Thu, 13 Jun 2024
 01:27:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240610112700.80819-1-wsa+renesas@sang-engineering.com>
 <20240610112700.80819-2-wsa+renesas@sang-engineering.com> <CAMRc=MfZ11U+kAh1+K=DxtJ=QL+cY7Q_sBN4sQDF-RNgjpV0QA@mail.gmail.com>
 <jvnvx7a4pn6evrp5ehfrt4qsiuprq6ogvrue2a3uupwtydmgcm@2rvat7ibvgb4> <CAMRc=Mc4__0zzJZG3BPnmbua88SLuEbX=Wk=EZnKH5HQvB+JPg@mail.gmail.com>
In-Reply-To: <CAMRc=Mc4__0zzJZG3BPnmbua88SLuEbX=Wk=EZnKH5HQvB+JPg@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 13 Jun 2024 10:27:45 +0200
Message-ID: <CACRpkda==5S75Bw6F3ZLUmf7kwgi_JkByiizR=m-61nrMDWuvQ@mail.gmail.com>
Subject: Re: [PATCH v9 1/1] gpio: add sloppy logic analyzer using polling
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-renesas-soc@vger.kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, Kent Gibson <warthog618@gmail.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 13, 2024 at 10:17=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:

> On second thought
> though: are you sure drivers/gpio/ is the right place for it?

Actually that is something I requested.

I think it fits in drivers/gpio as it is such a clear cut usage of GPIO
lines, and it doesn't really fit into any other subsystem.

> May I suggest moving it over to drivers/misc/?

Misc is a bit...
messy. I remember Arnd being very sceptical about putting stuff there
rather than creating new subsystems, so since I've tried to avoid it,
albeit recently more and more stuff gets merged there again :/

Yours,
Linus Walleij

