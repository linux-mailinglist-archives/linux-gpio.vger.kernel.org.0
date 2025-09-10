Return-Path: <linux-gpio+bounces-25892-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7EFB517BC
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Sep 2025 15:18:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 58FE354832A
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Sep 2025 13:18:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ECF61DB34C;
	Wed, 10 Sep 2025 13:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="dDeqcri2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C151B4223
	for <linux-gpio@vger.kernel.org>; Wed, 10 Sep 2025 13:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757510301; cv=none; b=g7dYv3cIMgyx9i7Q2uKlN6ufJu5TxJDNjeZokXC3JrLgs8cSMCrUDWWkhJc/xbuJffGJ+QcaYPgfFQu9adDWe5nuIHoRBUBOXexG/Eg84iYaO2PCzojeY2WjSMzTc2kkpIu72gU2g2gAtHKZeg2hV+wuHBNABgSGBCLyM2/p2A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757510301; c=relaxed/simple;
	bh=WqnILu0cK9Pt1nTcaOj9OS489tPHVa27cWzbkKlbjLA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q/DkJlBB3bcMsvSbopmWHt2y0dE804LPXX0IkIcLDnmJxocOkMZ6pVzmPwTJTu4MCHSXS6tf7MxTZp1YveMTt8SYipMEEKVhhzYvR8TwB8U8SiIcTD4CTAXFW1iotSs/rRiMW0in72t+TddkGs+ZA42c3Jsla04ryKLbVjjWKFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=dDeqcri2; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-55f6ad5146eso6335980e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 10 Sep 2025 06:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757510298; x=1758115098; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WqnILu0cK9Pt1nTcaOj9OS489tPHVa27cWzbkKlbjLA=;
        b=dDeqcri2B5aiq4zY3kndINVe7Iur47TlayD4Oo3bt1vwKz0VzFFTU+8XTXzIk87YO7
         i3/HSNGiM7H6mcgASpUmCbA3jB83H+Sk2UFDjktucJLB3xvf4HXQO5otxDOKU7KPSezn
         ZF9L/xAIRoBatH/GrvS+idD/618DbUIUQvZy4P8KazSIpHGXcf9BeojMrZgkl2wgB6L8
         0GBDqdyqHzluPr1ufw00dC7qanav3qMYtFUk+mYYoh44/k5w5zR1B3tuAMoCOIbK+1D4
         KRWCB1Cb7s3EHkZcq48MgqRd8hAIbgg6Q18W/toNtTihi406CSd2NYjTPnTPV0n1yu2x
         ptrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757510298; x=1758115098;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WqnILu0cK9Pt1nTcaOj9OS489tPHVa27cWzbkKlbjLA=;
        b=eJqWMx+UhA4+djSo5JGtm3rtqOcNQIrwpYjuLDOQba5VszImmO36SpKsXDJH1TokBw
         Mgr59xdVRciH45kj6tZxyyn4ePjX0IQEXYXcWZbxa0HQcNx8fGhZxannaYBH8aQqv3ot
         tBSQ4EoF8Ut22b/s6hb+4gOlT3q06tTYgu9m3q0ORqP1IZVD0Pvoxpu/yoIpF0jW3AjJ
         P3iV1CCL2OnZHLEExenH/KErDgR6rZKDY7j+EX34i6RuHXwlTIytOpOiugHqRmifOaNM
         +Wk7qrTJwm3sVbsYisX1uyxT1u0OeXr8rsLouAbiXVUXtrYsGTrDH5YU4BN8TWkU8ish
         6HJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWY4OgxCPCsHJduKRpSS4RdzInhQy7UsetNUhqe4swQXWI8R2SZb+24TBcuVgKYGHPTZZUkK2MPUS/d@vger.kernel.org
X-Gm-Message-State: AOJu0YwSQVY6/Cix95Gc+W3bD98XioJ42xzPPu6vXmRQahA8rGA09o6n
	09Lzl6k3QOiO7AHW+A3lcARlTFwtGdB5hyPjpG9b+v5hx72mdpx6lP8V3Um2fbHKGO+iSDR1nr8
	B9vVYpnaAU40oTqBtdAckO+Hzs4ccC+mQFOTeCyDhTA==
X-Gm-Gg: ASbGncuxBhRxyEvgOaS+1e9gnwkJ7KbA8zlvea1ARnwgCSIq6eoEvY2+jvYuogOuEYU
	Fqy7Az78mTUZMV83XdMtWJYwkAn2d7YgbnkFbmmXG0u6oDh/JneX5Dx49MUwwbPwcMzjpzhPFna
	FFMg3MkMa37sbkQJnuple+0JK1vJEC2WVaX+0+zUwC04kPt9mrC2BhG3/k82GswNRAs/9cow2mW
	iVfAyaT2tTrGl4F7sHAuTN4+Bl+DABRVy6KGV+0yFxHfEap0w==
X-Google-Smtp-Source: AGHT+IGPnsIvAHQ6X8OaQzgCeZ1+Ksn9h969q91MyXkDth9edmLspz1OjaaijysqOdw2Th6pkgZbD0Bn+w+7F3Y4z2U=
X-Received: by 2002:a05:6512:140d:b0:568:d6b6:b12a with SMTP id
 2adb3069b0e04-568d6b731c6mr1753800e87.21.1757510297762; Wed, 10 Sep 2025
 06:18:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250907175056.47314-1-hansg@kernel.org> <20250907175056.47314-3-hansg@kernel.org>
 <CAMRc=Mcwez1bebe4KBxh2V23+U3A6Fhz3q_dC1XmnT1DfD2Yig@mail.gmail.com> <a77d0593-4001-4315-b8de-22c4b85f213f@kernel.org>
In-Reply-To: <a77d0593-4001-4315-b8de-22c4b85f213f@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 10 Sep 2025 15:18:06 +0200
X-Gm-Features: Ac12FXwK5WtqrcTVPQlmOKeQE41FP2d8FM5zoSikqdemlUwZTgWnphwPSKcS6rI
Message-ID: <CAMRc=MeHefqC-8qY3SZNhXSjyu9VnMnx-N5bWeBxVh0TpwAUOA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] gpio: Add Intel USBIO GPIO driver
To: Hans de Goede <hansg@kernel.org>
Cc: Richard Hughes <rhughes@redhat.com>, linux-i2c@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Israel Cepeda <israel.a.cepeda.lopez@intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Wolfram Sang <wsa@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 10, 2025 at 1:34=E2=80=AFPM Hans de Goede <hansg@kernel.org> wr=
ote:
>
> Thank you I'll go and preparare a standalone v3
> (since the other 2 patches have no reviews yet).
>

Please, don't do this. This is a great way to confuse everyone involved. :(

> As mentioned in the cover-letter it is probably easiest
> if Greg merges the entire series through his usb tree
> once everything has been reviewed.
>
> Once I've send it, can you please ack v3 for merging through
> Greg's USB tree?
>

I would prefer to ack a patch that's part of a proper series, this
split makes no sense.

Bart

