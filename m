Return-Path: <linux-gpio+bounces-18482-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B396A805ED
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 14:22:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F9C84A7732
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 12:15:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EEA226AAAA;
	Tue,  8 Apr 2025 12:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Ag+/MKv0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1947726AA9C
	for <linux-gpio@vger.kernel.org>; Tue,  8 Apr 2025 12:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744114347; cv=none; b=l7bj1W1PREvce63AZ997nLrBtnx9mxjfz2VzlktdzUwkOF7rkeybFfeOJuzFEE0W7zuXSTNpsX3BTokKGACp6+tAhFGXogXyIKk8gmUUmUf5k+E4hNRSqPOwZHGSztOumOKnCez4NBKK6/va5Wgq0UJt9Ti51t2A5DmS/LAVYhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744114347; c=relaxed/simple;
	bh=T6AUPajIn+F2nfpZeAdCDfLBKZuZZ8TRAyr9PXK5qRA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cq29LOEh0BfQv8rYJiyTE74U2eOKDTstAAqjOLccdAjsOf7abv05lmzK4kJWgyDpDB1GqAMQ54/ACkfy1fS61TeYCuvFrLPmzwItJvPp7mWLrD5Mplp+fZow4/rKrzTldVx7O+4TkKhLdjPf7lLFXWLIErq2CwygLfBo4+XWGXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Ag+/MKv0; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54996d30bfbso2608510e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 08 Apr 2025 05:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744114344; x=1744719144; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T6AUPajIn+F2nfpZeAdCDfLBKZuZZ8TRAyr9PXK5qRA=;
        b=Ag+/MKv04f2rRqBkfMwCq3zxVjjxiziwaagxXKWJ8a1PPqLVNYLqD2+C8m+J49Iv4D
         uCwaynNEN9+WkF20a6j8FdYTQlghNnUs/51vAVXSEk7+2vIENtuoljobYaRDGu2am3JC
         GHKxZkpH/xEhfBfwGTGRNCsmqpGJ4tnFLAcwcnSMVrQt8evXzb7+Ac+JoUaiNdIu1MfV
         eSKlX4yZxsG6CodTKahZeYIfln2MWYi8e04KFjIDInDqd2j55WsSqQntYFLqAOKmknCy
         6dw0yOd8EUkTR0v2CWwW0iMxFIx7efqI6UPR8WXy42fd4ONsu0XbH0WGz5/QQ2KZZKkR
         XVrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744114344; x=1744719144;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T6AUPajIn+F2nfpZeAdCDfLBKZuZZ8TRAyr9PXK5qRA=;
        b=PXkByBbyz3VEK6NW+pJUYXswtYl7nEoR9IUFVd7jpdUoTOLnyNn3LpDleknAhsxkEc
         aFTR/LZ7gcus3kJ7KSawbJ7T0v3jb7kS3KSP3ixyxrKioG4V+VWOF/+andDGxhBbKHyV
         o3ZZonTa98M8vKIJWDVyxpbklPO8cO8VWkPqqN4841mfOoGu+080xRht1+MVp4sW+iZz
         ue65gU+REa3sSnwWxM/UM2nUum+FW719VcWDho1MrfmpRSe9vopGFLuzN5w3vfOlaG+j
         zrP6wPIXJMych+Gl5tQPBDvjhvNcdsf26piDmvZ1wYX8kveuseuNis1XeYHWyrznraiG
         55bg==
X-Forwarded-Encrypted: i=1; AJvYcCWdhNYt7T/nM06wmg9aezI4TY/naqwD7bqczn9eitcw72qp3QyYjaUdhcHKl8ImGYHRULm1MCqljIWr@vger.kernel.org
X-Gm-Message-State: AOJu0YxbeQD4mHs+p4vfdcGQDpbcufnn8CZpB1I2ud7+JAjkTaFeU8NW
	92eIwqFe/fTww6zF0s+7s1RiTswHe2Hgpq3Vp7MQbYw+WLszm3eMMC6vVTa8yy6of7j7m4sH6N5
	j6OegQ3B8c1FD9zsdCNfh97ze7FKvShzL/983QA==
X-Gm-Gg: ASbGncvbONpBL7djH9gyEinKCVuXA6wxIEzPeX6y/yKbj0WRpE961chOFaoRw3KkmhR
	KI5ySPHULj8Bgd4F61fqgCOXr4gv9Fh8G+VvYdu9CQEKRyDIguDK3GqZ1AYYwaC17jM+pVakpNR
	xZuqJhqe4jTfpHHfQhVHkkouLk16ffjJH6O1d0SQ+D6uiHBX2s9v2ni4hs2D90nYL7h1Ta
X-Google-Smtp-Source: AGHT+IENthHAV5l+KymW3LDJPEDbaINTNIXvJ8Gl40s2FDrufFFpjg080dzcRguD7FiAlFgnXWdvad3pq/qk4qOQGO0=
X-Received: by 2002:a05:6512:3b24:b0:549:8675:c388 with SMTP id
 2adb3069b0e04-54c22808b63mr4893242e87.52.1744114343947; Tue, 08 Apr 2025
 05:12:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407-gpiochip-set-rv-arm-v1-0-9e4a914c7fd4@linaro.org>
 <20250407-gpiochip-set-rv-arm-v1-1-9e4a914c7fd4@linaro.org> <b032eea6-96c9-4511-8085-da9f5655c252@lunn.ch>
In-Reply-To: <b032eea6-96c9-4511-8085-da9f5655c252@lunn.ch>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 8 Apr 2025 14:12:11 +0200
X-Gm-Features: ATxdqUGj5_DJHO53tE5rgfz-8N3LeX0iU314_nS5WJM402uEpv_AgAzVCN_GOkY
Message-ID: <CAMRc=MfC7GukR5ZidkZJA8LMZaVXyqeygdUBz9v3oDmw8k+OPA@mail.gmail.com>
Subject: Re: [PATCH 1/4] ARM: orion/gpio: use new line value setter callbacks
To: Andrew Lunn <andrew@lunn.ch>, Arnd Bergmann <arnd@kernel.org>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Gregory Clement <gregory.clement@bootlin.com>, Russell King <linux@armlinux.org.uk>, 
	Linus Walleij <linus.walleij@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2025 at 2:03=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Mon, Apr 07, 2025 at 09:09:18AM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > struct gpio_chip now has callbacks for setting line values that return
> > an integer, allowing to indicate failures. Convert the driver to using
> > them.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> What is you intended merge path for these? Have arm-soc take them as a
> whole?
>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
>

That would be best, yes. I'm not sure how many of these platforms are
actively maintained.

Arnd: you were not Cc'ed on this (get_maintainer.pl didn't show your
address) but could you take this through the arm-soc tree?

Bart

