Return-Path: <linux-gpio+bounces-4178-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 66BFA8740B8
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Mar 2024 20:46:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 030211F228B7
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Mar 2024 19:46:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 251CD14037C;
	Wed,  6 Mar 2024 19:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BFLVTF+D"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD2813E7ED
	for <linux-gpio@vger.kernel.org>; Wed,  6 Mar 2024 19:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709754385; cv=none; b=Zh1Q5hIGNYB+k5WfVwrI8WOkFKJmpMQivI+Au/qfit5vp7YCDRvh/3yRRW2GD0hTGajfPBUXRUXoq1O0qrrV5s9MrvFy8ZQoXQtCMRh1CR6rEKHRGP6bUX3ON2r3cM/w6X4qtUzRdGxFoGWKmLYyqnt8rSllrhMEp1ZNZVZkvno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709754385; c=relaxed/simple;
	bh=g/834nJbgccApqkytC5h1TgepshFDDgJEufS8q5LBV0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DTbiQ2gYYnxBex8pX4ihnszyw2/aJWopOv516NYYBItlbn9Hl7s6eKlRlOWE1MK1B9SU0XF4M2o/Fc9tUEymzIpKrPeAGzY3igg++a85JcjqD2Gii4lm0Ety8JBYaoKQ93wytp5ZWLstllE5aDBsa4RoWZzeI9INagCYgQp15BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BFLVTF+D; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-dd02fb9a31cso33828276.3
        for <linux-gpio@vger.kernel.org>; Wed, 06 Mar 2024 11:46:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709754382; x=1710359182; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g/834nJbgccApqkytC5h1TgepshFDDgJEufS8q5LBV0=;
        b=BFLVTF+DN+RbT9j866dZK4WTQTTmCO54VHo2kLbhgcIvmGPsmuODaYTKsFUuVtbdNU
         0z9ZavepqLLVVk0bbo3IOcGqlwLL8pbLYv5VB9I0YZeXJQiyop3Sb75X/6F+9uzviAwh
         3+tldH816VnOqLu6W8oZBwFxKw+hnsUHi8p98alqUoxDTmN4qRIFziapx7G8tcUaEHHg
         HLixsmLJGXK2MEuQ1shS+VG4vZ3lxIgHQZgvBH5GTUob0mP9iUpTTVrZhy+ZwbyF9AqO
         WD8U5O95rTawgSeDHFggvCofeGNWUJyvlMaAjdMot2x4J1beG1y2XD2GFpDEeGEE71s6
         ICNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709754382; x=1710359182;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g/834nJbgccApqkytC5h1TgepshFDDgJEufS8q5LBV0=;
        b=Zrkp4L4PTk8nV4RtbhE7UR6jzPQ2LsIjKqYYowAqgD3CtVSEM8YEapcNLM0RFQH/Ku
         liOMSH3RnvtUPDKYyDIsDA4+JUZgjF/LBGZUEHu4YFeH9ZopFWsQHHXjnDtMvXPNxlu4
         sKhMAFPS9K3CxkpMMAhZP1rsuWdYtvxCI/yJF9qNdHb8dM+QyftcL6lhpkt0XYAHlaso
         v8zqARFzsA9m1sdhQTxdts8kvXf2IsHDIOpBM9naf277jZS9XBb8zzTE7gYCSnA2CG6X
         MWsI7kLJurPGv+MQ50KQMs9IrvqdsPUm8kE+j0lJJ1dbaVhE+64T90WVQp+EDWqNqkwp
         Ucjg==
X-Forwarded-Encrypted: i=1; AJvYcCUjyCUv4XFYCGYNQQK7no6/O8rX3j5XZmKOUmr+uVO7JiEenGwveTRPCJgg37e3PO85s6LoHk2n2HcTBtMa+NQp67s4zu8Rv+4EkQ==
X-Gm-Message-State: AOJu0YwLKfe6sXyOof1Pf+8vFqQMpbKjpZM506bdhec7+DgEPAUpzQf1
	UeVt0/Xk6+6e05UKzy63V3ci9PBvvwI+SKciMhwBTVKWCM3K4iwcL4SVaWNp9uNWtVptilXgLi5
	zG+tzlIt4nYBxoxDVJkwxVl6VB3ElGXAOIE9oaw==
X-Google-Smtp-Source: AGHT+IG9k6R2ZbDTnFklSmjDYHekskP2nllcv0Si8zP3zz3T2oI0YuRsLAQIhWnC7+F4r7Xu5M+qMvcXPE8qPKYetaw=
X-Received: by 2002:a25:ac68:0:b0:dca:e4fd:b6d5 with SMTP id
 r40-20020a25ac68000000b00dcae4fdb6d5mr13601157ybd.27.1709754382669; Wed, 06
 Mar 2024 11:46:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240305-fix-nomadik-gpio-v2-1-e5d1fbdc3f5c@linaro.org>
 <CAHp75Vc2+wx=82kx1qMsXH3uWX4tMdDEMXLm=MqB869-=bcGeg@mail.gmail.com>
 <CACRpkdZCXE6VBa3f7asSNYF7Esn5nHnxf0QJfibT7TcfSE52FQ@mail.gmail.com> <CZMRJNWD7F6W.23A8YUXQ6P7H7@bootlin.com>
In-Reply-To: <CZMRJNWD7F6W.23A8YUXQ6P7H7@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 6 Mar 2024 20:46:11 +0100
Message-ID: <CACRpkdbMHxBceNP=GOtU7mwaGO=J+yCeNhswwfBh5DCLCkD=hw@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: nomadik: Back out some managed resources
To: =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 6, 2024 at 4:13=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@bootli=
n.com> wrote:

> > Fixed them both when applying! Thanks!
>
> Format specifier %pe takes a pointer, ie it should be reset and not
> PTR_ERR(reset). See efaa90ed2cff ("gpio: nomadik: Back out some managed
> resources") on linux-pinctrl/ib-nomadik-gpio.

Ooopps of course. Fixed it up.

Yours,
Linus Walleij

