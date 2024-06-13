Return-Path: <linux-gpio+bounces-7414-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A11F49066E1
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Jun 2024 10:35:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2A7FAB20CB8
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Jun 2024 08:35:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E966984A24;
	Thu, 13 Jun 2024 08:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="luL7cXI2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDAB613D50E
	for <linux-gpio@vger.kernel.org>; Thu, 13 Jun 2024 08:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718267418; cv=none; b=Wf4Q+165D8X8EthFYvPbqOlGKsm0Jbm7nPdFVnjKwVZCqZa2694KOu6voLEBIZHQCH22xw7D5kOhddVEJruxNCg6egQSx7HgTMGpUHbMgqKBPIHPSoOylFiekbKECp6Yu+6VOsm3wH0A1aTSpxDs7O3htW40LG9Y2Z7IsEVS/PU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718267418; c=relaxed/simple;
	bh=zam1WrTcB2a6hkMQ4oXaEjlytSYEYESNLp+E26hWmRs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=Y1JGqt6MTflO5FJr0IXDlh9J+K+PeegVh8j28MA1z06CW8t2aPGr1fpdcev8PY37XFhWOLMARdnqF1K6/H+IAoSx5XlIRys+hDx7xPnSGCasmnm6mEfYM+lkLMbvy6LAxbakuYFDlHVGzVinQhnSlb9nCANsCxHoBTk5P6B/oek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=luL7cXI2; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2ebed33cbaeso6686041fa.1
        for <linux-gpio@vger.kernel.org>; Thu, 13 Jun 2024 01:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718267415; x=1718872215; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zam1WrTcB2a6hkMQ4oXaEjlytSYEYESNLp+E26hWmRs=;
        b=luL7cXI2uXReVUpyONbENCMEi7I9yoLTix+iLnOkFpkrA/V4JUuAuSoDMGTWH1Wy8N
         PXxa3LAa/kbSSZny2qmZ0mOJ/365zW4j+kBDKYhrfKvYdnLOAquY1TeRvlck0TZIEEvd
         914TUsc+Yo+49WfyOo8o9uJDDa4P4ICEIPf6viBYg8XEJlqB9B7uz9b1IFEAuOw9NP8s
         XYbCuPk9LtLmsYJxr1Zptm5KYjUbdL7ygzSLDedtaYLEvozmj/tnui8sORAT/7oJDapz
         1Vp9IwKJkqnyKUzP9MT6v1sTZOfcukL9+XkROz6xIBXj0u96Ui3z/5LG4NLzuiMpZnI2
         ZFEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718267415; x=1718872215;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zam1WrTcB2a6hkMQ4oXaEjlytSYEYESNLp+E26hWmRs=;
        b=eZF0p5SrZM55rEXVVwsxsGZHThkprAhURNsOwbAAlXPBVBgcoMAo5ypGD6VyG14wSW
         S4Nh9VTVvweLJBsQeNTGtA/sZy7cNyXVVxWDJKhYYlEZKqdwtzd/hiV6LeoYFMQ9cHaO
         MLqTYD6aTPGD4SYlsWoRWNZfGaOK0+PRfyH8dYNdT+mReMd+/naK2Iq09SZt2W3WEyA1
         JaMvfJvnYMRCRwO4GG5vurQd3HzObYhTtcpm4Vzw78L0wQtBmryMQn9izN3S9DnpzyOO
         6rsSz0sxm9GLyoei1RjzwAZbycpA7VlrZ9SM+3bQMOqxfNz0wPbzjK61bLvNb148lGZW
         Ns+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUxhF3wnG6ILaw6dJS6FHo5YPrQwGTALmes7kIdnX9MWWo8keE/kV1MTvdew9uOiDFN6yDs474LmAkgH85ehpkgDunRSyyWrkz9ZQ==
X-Gm-Message-State: AOJu0YyIqQ4DHoSywxWoCZpFStu/liWAmYAeEbNqOllgZ3+ANlgWUnTh
	r4PGbqfSNw2OoJ6q0h+pc3/sXXAjBSbTOd/9j2Jnau7K4fgEcg1DLiYV+p7GbxBKyzlbi/plMJN
	ClfrqOoTrlXfLichMlT15l+4Z2YinoFqLpnk1MA==
X-Google-Smtp-Source: AGHT+IF9f/c3s4Qe7ACe43UALugVI7gRig0w/mlgAWUWAzqd6KqBUe7rTJtYZn5+66dcrw87a/NrWnfZ6ZkrDnaAHOg=
X-Received: by 2002:a2e:9185:0:b0:2eb:e542:cab0 with SMTP id
 38308e7fff4ca-2ebfc9d020cmr22506241fa.14.1718267415106; Thu, 13 Jun 2024
 01:30:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240610112700.80819-1-wsa+renesas@sang-engineering.com>
 <20240610112700.80819-2-wsa+renesas@sang-engineering.com> <CAMRc=MfZ11U+kAh1+K=DxtJ=QL+cY7Q_sBN4sQDF-RNgjpV0QA@mail.gmail.com>
 <jvnvx7a4pn6evrp5ehfrt4qsiuprq6ogvrue2a3uupwtydmgcm@2rvat7ibvgb4>
In-Reply-To: <jvnvx7a4pn6evrp5ehfrt4qsiuprq6ogvrue2a3uupwtydmgcm@2rvat7ibvgb4>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 13 Jun 2024 10:30:03 +0200
Message-ID: <CACRpkdYYy_0QnzO-qPusYPFK2qFs=NG-t-X=GRjLg5DHX_k82w@mail.gmail.com>
Subject: Re: [PATCH v9 1/1] gpio: add sloppy logic analyzer using polling
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	linux-renesas-soc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Linus Walleij <linus.walleij@linaro.org>, Kent Gibson <warthog618@gmail.com>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 12, 2024 at 6:03=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:

> [Bart]
> > I really dislike drivers being called in an ambiguous way like
> > "simple" or - in this case "sloppy". I understand why it is - in fact
> > - sloppy but can we call it anything else? Like
> > "gpio-logic-analyzer.c"?
>
> Sure, we can if you prefer. I named it like this to make the limitations
> super-clear. And even with that in place, I still got a private email
> where someone wanted to build a 400MHz-RPi-based logic analyzer device
> with it. Which would not only have the latency problems, but also
> likely have a max sampling speed of whopping 400kHz.

What about "gpio-low-fidelity-logic-analyzer.c"

(+/- Kconfig etc adjusted accordingly)

It says what it is, not really sloppy but really low-fi.

Yours,
Linus Walleij

