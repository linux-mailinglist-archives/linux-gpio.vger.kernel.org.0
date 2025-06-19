Return-Path: <linux-gpio+bounces-21838-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4A2ADFE86
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jun 2025 09:18:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0FA2518888BF
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jun 2025 07:18:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C8A1242D6E;
	Thu, 19 Jun 2025 07:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UAO/v+FS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683FE3085BD
	for <linux-gpio@vger.kernel.org>; Thu, 19 Jun 2025 07:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750317506; cv=none; b=AsKw6yi7gTSXKTmNSP136B0XPrKwNugdbsl5PQ2CR6/rJdZ+x9UMZFY88tiWpQTRA3fwn2P90EK0uz8xgA++eqIp67EIuwzt/Zx30YKxIinx44xg1ixeiCl0jhESMKZFjqyO3/uOXO4K+5Ic/VeOTphCDX9C4okNI/s3m6aph4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750317506; c=relaxed/simple;
	bh=s9e/S76+4PkoGcZreeTfA7kCOQWCxD02HdhaGx+Wzhw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Sj4a2vBeHxUJB01oq+Pk61uxDWX5Ns8fZFIPD3IpAtbX5Gk4JWfjduqoMfpqe4yUKpx8RsERc8cjzd/Ve/VXjXUQlyTDohAmy5ACRY80Vy9JtEOAGON3OSDe8y8maM39T2jeSmpwXFpA3fRUyjz8/Efjq/l9B3IunqiiQNzrwfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UAO/v+FS; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-551efd86048so424814e87.3
        for <linux-gpio@vger.kernel.org>; Thu, 19 Jun 2025 00:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750317502; x=1750922302; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s9e/S76+4PkoGcZreeTfA7kCOQWCxD02HdhaGx+Wzhw=;
        b=UAO/v+FSXFOeG3Z/FC6FKz/Vj022UB9Pr8oP0j1JfVyEy+Qx5RF76gkz+Jw3zKlxhk
         DWeL5vKdPT3BPet9Xf6/2OLJrX6FH68i6OgXDh8tyipS4RggTMeY8EGBAEHKuXzEcIbn
         ds7FiTlq5EMKEwC0962IiFqErpHdsW9kgtglYx92MMxd1X7i0xxydxdX7O0ZdK598xAQ
         SklCimWUhmJM8uDF2gUy/X7Nabc0y6nGaa0rwDQ8HrNdqYfUZCDa1BKmQOrh31/Cf86B
         +EqwYpnri6BTNbBM4yel4mDezokJA5qcSLKOjFf7nbix2gl0ibGkoMsFRm2k3N4KxwZ5
         f4hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750317502; x=1750922302;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s9e/S76+4PkoGcZreeTfA7kCOQWCxD02HdhaGx+Wzhw=;
        b=Ss/ZvfhCCmR/cR66H1gpr6+nLicbCRa8iSF50P8uTcTsnTIEyeYJx1wh1mweK0D/Wa
         ZvIy5Otj2bcFbKN3EapPoB2OuGYoT0QUNz80JU13w08NEqiotVWHKeO1RQHiCSAtQGj6
         rOacL4NI6X22tf1MWhCCFpqdzep+CzGWtNiBvGEI9lwr0rFPZfjIw8A8EW5BFkiVH+6H
         nfByfv4GHhCt2geQlpgkKhoqzz0GCDeYo8LzhS9QPZaMlYiKuxxasqN/aa1FBdNLcUgk
         D9pzpMUvxDN4LIVyMGS/sd1cb4GmGeUrQDZQcCwcARVKX0WismOHuLRCjJdzBRrm/tIt
         7UZw==
X-Gm-Message-State: AOJu0Yxh4h2nJ/e55Vga/Z/F/VQh72X9ajo8Hapu/Bsbeirw9fsgECEd
	4SKXYieI9MBrjdiUMxXcmaR9u4liBswDF4oVFfm/VtHZi9/qNs6HX1fKNnTDZQHVkEtizUxI22s
	83bCibdrfvz0o1+JPnzdFtN03YaTdOnT92h/MFPFPBg==
X-Gm-Gg: ASbGncu6JVnqMLWQwS4aIEYjhePMzgXxfiOc1U6Bb0lITLmvnLJgvRDwUkgy8uQWmuo
	fALJPDZhm9VeH6r6Ib8HZrqnsLjPk8iF74UXnkBEIGe37EnxRxN/bft/yioq23+8FQXkkQxoMbN
	lrwy3vMsCVxQN6nD/BWyOksLPe/d+MXgZ9ZY7mjgGbTqg=
X-Google-Smtp-Source: AGHT+IHCzNEss81qFnq7iPWJhwN4PLhP6iP1koJRtgmME+owy4iiirNXP23QLL6kqMN6Ewx/CVVX9xwvUZscA99pK2Y=
X-Received: by 2002:a05:6512:3da3:b0:553:24f4:8736 with SMTP id
 2adb3069b0e04-553b6f51814mr4964277e87.53.1750317502243; Thu, 19 Jun 2025
 00:18:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250619071254.8520-1-brgl@bgdev.pl>
In-Reply-To: <20250619071254.8520-1-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 19 Jun 2025 09:18:10 +0200
X-Gm-Features: AX0GCFunVPtL2_n9hlkcbeADYXvk-lvLOE6NNa6kLZqLeowuBxhypgDhWsqqWYQ
Message-ID: <CACRpkda60dGw5zpc+uMu0keiX+p_NnX8Ui-1mr7woNoyQ3z0vg@mail.gmail.com>
Subject: Re: [GIT PULL] Immutable tag between the GPIO and pinctrl trees for v6.17-rc1
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 19, 2025 at 9:13=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> Please pull the following gpio-mmio change into the pinctrl tree. This
> allows you to apply the rest of the changes from Clement.

Haha I sent an identical pull request yesterday in reply to the thread :D

But this is fine, I pulled it in, let's go with this.

Yours,
Linus Walleij

