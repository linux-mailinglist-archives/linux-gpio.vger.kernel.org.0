Return-Path: <linux-gpio+bounces-14071-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E389F9286
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Dec 2024 13:49:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 335F27A3B61
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Dec 2024 12:49:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A06EF21519B;
	Fri, 20 Dec 2024 12:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="licQdtxO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABFE51C4612
	for <linux-gpio@vger.kernel.org>; Fri, 20 Dec 2024 12:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734698957; cv=none; b=p1eNC4hfhrNFw9rEcy8McAVyskQEGROt168s93LxkZyWNl19CAJQy7qXLWj7WMWeX5NelzWOhgrGyYkVqhWjpJfcjPKgP9QKu+AbodvjdHmUTJQ+/X5RktNX0pItRa8uycJip7LFKOe+OSM9D+Iw9XhaAa/fliak4Iu5NtBu7RE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734698957; c=relaxed/simple;
	bh=atR16LH/ktDR9gBRth9rDJLJVpZpJk8L4PJ7O8vNhPs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cAe7etztBmkdV9rcgAVKqGTDwkKseSr3GY6A55IYVURCCo9bcpZYYg8H7KbAET/SrJcr414NksZq/8cy4c596gOPapfaNl3PzEysBk7F2rS3Arzb3SqF5pMjMvFv5zX1WLdOA6Kmf5haaqDMf+aXB3R4Aru4N5NKSF2gi0R6Wsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=licQdtxO; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-53df19bf6a9so2479983e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 20 Dec 2024 04:49:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734698954; x=1735303754; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=atR16LH/ktDR9gBRth9rDJLJVpZpJk8L4PJ7O8vNhPs=;
        b=licQdtxOOc+kFe/m8lay1punT8+uyghc1PolqeEVDjM2vxYtJH4omyvoeT1SoG4d2v
         dXJ7bXN789ZeATaxNFqJ8pT5as3QMTxBksYSfYv45T3K0jPae668LMScxM0p1xVdv2TH
         PpC878DacD2ZAx2D/b6aZWU+le+Ce1l6JJ0lTR+w3/CwNydSsMpPjeiZyHdujlwz3kQN
         JGoXyWHrcVVMBnpDkL6wRvyLl8id1I1HgIyw0dCLZfCTaZ57LC56H1Wrh90fpEDtB+tb
         tk5WDnBDAKMNkr93GGpVrhgiT+kBc6XCa5TyzcsRkl7iFutqZk1lXhsBJdoG1TINn1TA
         BDmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734698954; x=1735303754;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=atR16LH/ktDR9gBRth9rDJLJVpZpJk8L4PJ7O8vNhPs=;
        b=BAfyJ4afw8e30GJJEIIYaSL/rxflCPg+5+IVe3YlkCil7EI4Q8E/GkIHof1orZvYcx
         L+9V8yPTMgMjpTXxo78OnUldFdxdm5+P5kaO0SQQfkg9USMS+KTrycjEbqebrzmgFSER
         O9TitO4ILRiFx75N0HM0yE0Kig1HHlVo3KkLVAcKgGUZXy5RTuGhe6uZ2egKTEZxotm+
         yl5QuvXC0Z5Hi+/i7ZNue46ROQrBuuzGOWhd2aO4BgJgoWFge7Ixhn4lYTmh75aTb0LT
         y+YSxq1E0KET5FPCTP/EJ+zCHZ2k8z46GFEajDRRd2vOG7dUrt/+2aVIsw3TTrsen+KV
         UTlw==
X-Forwarded-Encrypted: i=1; AJvYcCV3p7Sle3xqe1l5QexiFtxRwJonZj7c1Ol6yQpyhQDH75TpdLwLp6YybNFDKw9Rm11y1kEMi63q//p8@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5wckMlKTioXPU5UYgPbVIcny8r5c4o8zq76pAjwq/WGqD7gfM
	GOLvPoeGjZNk3kn3fhubHfcrlUyf3Tj5u68ZFZs7CojMVphrZZl27fYmyfwLW5mQgdg3zFE5EY4
	xoyqouPVAdVW+Brnf2c+GvSgx+/b9I3vp77q0UQ==
X-Gm-Gg: ASbGncvZWwY6JBiMlK2pp7t72qcpnXL/NEU/5MV0PkZ0apC1LJuFil1S55VXf99FzdV
	VL+m2Kd7DdBCG0TsjLytZqmegjNR5alXGDD5YOA==
X-Google-Smtp-Source: AGHT+IH24FkYw9KreZvkgwUIPynsrrdQBE5v4LbCqrkZlmC/e2aLoJH4ZrC2A8G4zSF2SlfwIJpm2yYPtgwqVc9gPJw=
X-Received: by 2002:a05:6512:1592:b0:542:28e3:2156 with SMTP id
 2adb3069b0e04-5422953feccmr725270e87.25.1734698953857; Fri, 20 Dec 2024
 04:49:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <32edcf0567fffd0b1a219e7e2dad7e0bd8c5aaf4.1734023550.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <32edcf0567fffd0b1a219e7e2dad7e0bd8c5aaf4.1734023550.git.christophe.jaillet@wanadoo.fr>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 20 Dec 2024 13:49:02 +0100
Message-ID: <CACRpkdYvrXm62u1L3Bc3RYramBD081GSfZBqYPamxMSKq5H7gw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: ocelot: Constify some structures
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 12, 2024 at 6:13=E2=80=AFPM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:

> 'struct ocelot_match_data and 'struct irq_chip' are not modified in this
> driver.
>
> Constifying these structures moves some data to a read-only section, so
> increase overall security, especially when the structure holds some
> function pointers.
>
> On a x86_64, with allmodconfig:

Patch applied!

Yours,
Linus Walleij

