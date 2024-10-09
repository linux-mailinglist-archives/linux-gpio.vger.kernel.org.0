Return-Path: <linux-gpio+bounces-11111-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF2D99712A
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Oct 2024 18:23:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C249828383B
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Oct 2024 16:23:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E0111E3DC3;
	Wed,  9 Oct 2024 16:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E4M/npAg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D8AE1E3785
	for <linux-gpio@vger.kernel.org>; Wed,  9 Oct 2024 16:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728490241; cv=none; b=C/zIvtXH9VNuf3xzbMlrqYyjhb6Vi9xEFuXtXP07aitjnFpIU3RyjUmMtNNPDyIhP5cT6prcv91BBQZrTpG6s0nU/8/cuac2S0vNbhv6NE+DZQeHbBL+7aMK3RRHrFYUWdBzLfOjv2Zif+moB6ufpfh/xV7ewxqeKPb9N6vv2bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728490241; c=relaxed/simple;
	bh=WpPBiJG1FxgVYN0EzMa42iEUZ5HuJEObDWHpDzLify4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=adV5KjjtQ4tWZIkBVYNni93RRFxHQPZg3BnLK9QMjZZOkzPIvcFL9FzWc5uYRkEVT1vnHaqvpOQWY/sOiorBc/BIva/a8U0W6tgDTM4mtXpiAILQ1e0/ZR2Vqy0/nD8nipzUPg0wQd/rjW6ewggG9hPb2VxBk4pEmhqw9U7xWUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E4M/npAg; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e2908e8d45eso343637276.2
        for <linux-gpio@vger.kernel.org>; Wed, 09 Oct 2024 09:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728490239; x=1729095039; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WpPBiJG1FxgVYN0EzMa42iEUZ5HuJEObDWHpDzLify4=;
        b=E4M/npAgBXsh+b572PDy1dpFltu/dHdIkX8gig1NJIbH2nKL7k/1VJXUZkdJ47TbAP
         8nB66TpgWuxVy0vgvDsa9wbWtT80wnOvTeeVMQ6zZeeliYXHG1rNQaeZHAIMChsZzX4Q
         xLwkcS/kkAlsJTW92HYsW9IZYnc/0VhErBCTO5krnWcunKiatowazBCGKTAIE30EDw1q
         8QAvjLowEvJHWZm1HAa1Zv9MqKRoYnqoB+NwaoIur0gRpUgdB7nIkQ7SRK7qbg74btuI
         xl91rWVwB5o0RZZD18s8SZtR+JR0CRb2bDdb4mqoLnyQ+G4t/8pp7EBdDPnd6dhrLSfe
         J43g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728490239; x=1729095039;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WpPBiJG1FxgVYN0EzMa42iEUZ5HuJEObDWHpDzLify4=;
        b=A/8E4hQMkIZvLOIYq2DRC9Ccc7sTImvHXkYQC8i1GGtKengfvKApxAtxozBgWlJN5b
         Fn7F6yUboSIBdD6O9RuFnNQjTaVq3WKO/+aeLGfuAP9sZwaIWomeyzDiNsX53ynJ1Xa8
         uyf73s1CblIHDMI9c+wjjjAJ68SuxiYmVtiI7cZdMQD+Bqo8km0XwPvP7+TEpZsI+g36
         z0voTU8htuywq9aRJS1zFSF0XB1ViDXneqSpysMVp/hwSCMVKbrD7roK9Nc0PJpubDQf
         n+snHSgFNLvL0io1eDwd2P9ZJdYJ00UnMbCtOJg7aC5Cd+Et1LOno9EFi6UP0++5+H+X
         5o0g==
X-Forwarded-Encrypted: i=1; AJvYcCWG4iYtBED7+nvxRPZ5eJQ7fcoL+mKOc/X865zOJnLcp2lvdNDHLl5MX9/j5liDCQn+gToaUaO7VSE3@vger.kernel.org
X-Gm-Message-State: AOJu0Yz45PKQJMHoJPv2QqxqB0wkfp5xtJhdULdOkK+ZL3Oll+vioXQf
	sRQHvgKsN0zvGJEIR5B+RWrxl7HMGL8c2ChFNHY+00ydz1i1yr7Sghdcw7fUhxVui1Nqd5/Cw7V
	u6KC/rLuacWtQVVI+1okFNxePzVg80OkPUT+zdA==
X-Google-Smtp-Source: AGHT+IEFBtpZ3WvYobxGDt8K8UtsEjGBDxxl67J4rgUcLmAq/lDuH7w1eKDsqRKmYjzTWAwbu3KplMgYow0uu5MiGE8=
X-Received: by 2002:a05:6902:168e:b0:e26:5b7:9f95 with SMTP id
 3f1490d57ef6-e28fe407701mr2803138276.35.1728490236507; Wed, 09 Oct 2024
 09:10:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241004-gpio-notify-in-kernel-events-v1-0-8ac29e1df4fe@linaro.org>
 <20241004-gpio-notify-in-kernel-events-v1-3-8ac29e1df4fe@linaro.org>
In-Reply-To: <20241004-gpio-notify-in-kernel-events-v1-3-8ac29e1df4fe@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 9 Oct 2024 18:10:24 +0200
Message-ID: <CACRpkdZpYLq3CH8yhfQhEwFPd88W2S-9ByfP+HsMZpEus0duhg@mail.gmail.com>
Subject: Re: [PATCH 3/5] gpio: cdev: update flags at once when reconfiguring
 from user-space
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 4, 2024 at 4:43=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Make updating the descriptor flags when reconfiguring from user-space
> consistent with the rest of the codebase: read the current state
> atomically, update it according to user's instructions and write it back
> atomically as well.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

