Return-Path: <linux-gpio+bounces-28931-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA99C76958
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Nov 2025 00:14:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 21990359A75
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Nov 2025 23:14:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C2A8303A1B;
	Thu, 20 Nov 2025 23:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HSC8z5vP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A075A2D6E55
	for <linux-gpio@vger.kernel.org>; Thu, 20 Nov 2025 23:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763680434; cv=none; b=gLrrCTDB/Mz+NLl+iYrnqsQKGRl/5rMIQQVkoWjgf3T6+JpzPTZbGVwrT2p7elIH3SBHsTj462pQfU9TJXWcTajCttbc3w3psdzg70JpqTe/QEvwJ91m24K3hpsCxChhfGm5j1ppfh0jh9eQxyqKZ5DZEsw16eixWMXn2A61w6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763680434; c=relaxed/simple;
	bh=MtLo7QDEeZfj4ZwkzltdqC14HkyT8HuOzsPtI7hgfTQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NL0/iKAeunstenOUc1y5ALDUFhKVbzaKeseFlZn0Vzq4FXnwIg3TfxlRGSAeZ9RwMqBPwaipPIYL75pxizFkSky8WlwX+Kw+IEolw1ZuI41pWWy29pPpfE6J1BjI8hR1pUBLdV8XEJHg18GFhRi+sGL/ZZg8v+dzCihQOTWxq5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HSC8z5vP; arc=none smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-640c857ce02so1382145d50.0
        for <linux-gpio@vger.kernel.org>; Thu, 20 Nov 2025 15:13:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763680431; x=1764285231; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RrDJ+LttxTAxc9ByfcijSY2Gnuni2A6lpzxeapunJfg=;
        b=HSC8z5vPpFkIs9wiwza13sPgItBK5CCrKVS4amKd95CaIw77qV3bwrWvlLuwdV5Q9c
         /zKRIVqUmtCte5OCDtALUxNl2WrESiVkoEzbfUiTzLAjKWVdVYWQNpKyzabk2xjLSmvi
         QzQVa9YxHK3UudOyl0WkXagrZFSKTXWD7U94/b2DS73wRw/Z5Xn+EE1rvncAW/X2EC7K
         f1IPp1HZfsjXoCmZ4GyBL81kCNDR04XzTKeb7/9ia/BUxN/QHyIuewNI6gkqpU9RfwLz
         daVeQyY3Bjjo+vq0CkQ+RCmLR8AsC42runipWHXwq+vTbnPH+hTpWtbDqnN/9nH8lfpN
         Z4lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763680431; x=1764285231;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RrDJ+LttxTAxc9ByfcijSY2Gnuni2A6lpzxeapunJfg=;
        b=graTS9UyFK21YokPnm6rIOtvk63iVbl85AN2Ryj8n3mujLARa0gFEim6aO0JmCDx7b
         VVBHR2cNd5YetBUVk0H1MX6PZl0NimhVgvRSLWzOwDs5gl0dSr255/GXzdyctkiHlfBx
         wJQgl9E4oBC1Fu1sZDDwm9zLLRzPBe1R+zJ/OZHR2i+5n7ziL3CF2KEk0BPo+v2ZY1Gm
         rIu0Hzu1Y+ICHBgJwCoMGUAO+EwAigjGeTUSGVt0uvIFOWdMnfsK/LJUCnCpdKX/X508
         rtSQPi8bo06q2zKPXA6Iytp/MEooO9e9+P0ZekKyOcv6QqcU4HdjvT9o5f5w3ASqNL5i
         GpOw==
X-Forwarded-Encrypted: i=1; AJvYcCWwD1GvX8MdFecLU1gaDmUePDaqsFQYVXPCIaeBCFiuDHSmiUh1F9OvIP+f/aAKUD1NpI2Y19zie+FD@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5MgjK3Zfunl7gKtNLrxaJvyKzKz1zBkX5YDhls0esoX6hfTLH
	tVokue00BCJRBiQm6qm13DSlmy5IuCd3o2NIc0lT54mgLLEM9kqgdt7/VMuFxedLdss8MhKghR0
	b6mhzEhxr9xxSDXWtjV/4ObHhVzvR+BtTr6fB7LRRdg==
X-Gm-Gg: ASbGnctjQSyR7/e9aIEsDoGLzBc1Z5ttuupEYpk/0tlx8WIzTf3u5XdKIzjG8sU0Bi9
	fZ3rbP/Y75kU2K9yvNbqJ6f8e+8WCvsPqMhTH9EgLkUI3jEh0OJdjwR9+t7Iu9rU+uJwGWayoE9
	FHy6cT2WuV0zo2Nt0kgvpBRUKOWXMLeffu3WgaQMo4SjceOY6NiIWikDI94CkpHa0gQQTcpyTjd
	6xVWCjDhyUuFolQLA2UrjJRNRkR7rWjxqH4KpjZ1x9YT3Uy7Qhhq7uGcVI/aqvi6u6xmWQ=
X-Google-Smtp-Source: AGHT+IFk3lW6WYz8IUscpPRT7wsLzXi2rhD8fnUhTOuPCLLQxjXWMBiQYRuQKKWLQJgqGRYdRi8ZCYqCwzD8Nkf3Uvg=
X-Received: by 2002:a05:690c:630e:b0:789:62c5:db2f with SMTP id
 00721157ae682-78a8b545b8fmr892637b3.62.1763680431552; Thu, 20 Nov 2025
 15:13:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112-lantern-sappy-bea86ff2a7f4@spud> <20251112-improving-tassel-06c6301b3e23@spud>
 <CACRpkdYQ2PO0iysd4L7Qzu6UR1ysHhsUWK6HWeL8rJ_SRqkHYA@mail.gmail.com>
 <20251119-bacterium-banana-abcdf5c9fbc5@spud> <CACRpkda3Oz+K1t38QKgWipEseJxxneBSC11sFvzpB7ycnqsjBA@mail.gmail.com>
 <20251120-silicon-oyster-5d973ff822d9@spud>
In-Reply-To: <20251120-silicon-oyster-5d973ff822d9@spud>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 21 Nov 2025 00:13:21 +0100
X-Gm-Features: AWmQ_bkCMWvfrPl6_87QudEHaDYJmg3nQjd2AYmg5zDD6x1lswVcldNmtxZQ4TU
Message-ID: <CACRpkdaM3Hkbxx99uXx6OVdSbdhNNc3voS1FoUsz2oAUEc1-qA@mail.gmail.com>
Subject: Re: [RFC v1 2/4] pinctrl: add polarfire soc mssio pinctrl driver
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	Valentina.FernandezAlanis@microchip.com, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 20, 2025 at 1:26=E2=80=AFAM Conor Dooley <conor@kernel.org> wro=
te:
> On Wed, Nov 19, 2025 at 10:48:07PM +0100, Linus Walleij wrote:
> > On Wed, Nov 19, 2025 at 7:23=E2=80=AFPM Conor Dooley <conor@kernel.org>=
 wrote:

> > I looked at the bindings that look like this and are not 1:1 to the
> > in-kernel configs:
> >
> >   input-schmitt-enable:
> >     type: boolean
> >     description: enable schmitt-trigger mode
> >
> >   input-schmitt-disable:
> >     type: boolean
> >     description: disable schmitt-trigger mode
> >
> >   input-schmitt-microvolt:
> >     description: threshold strength for schmitt-trigger
> >
> > 1. input-schmitt is missing! But it is right there in
> > drivers/pinctrl/pinconf-generic.c ... All DTS files appear to be
> > using input-schmitt-enable/disable and -microvolt.
> >
> > 2. input-schmitt-microvolt should probably be used separately
> > to set the voltage threshold and can be used in conjunction
> > with input-schmitt-enable in the same node. In your case
> > you probably don't want to use it at all and disallow it.
> >
> > They are all treated individually in the parser.
> >
> > Maybe we could patch the docs in pinconf-generic.h to make it clear tha=
t
> > they are all mutually exclusive.
> >
> > The DT parser is a bit primitive for these.
> > For example right now it is fine with the schema
> > to set input-schmitt-enable and input-schmitt-disable at the same time,=
 and
> > the result will be enabled because of parse order :/
>
> > The real trick would be to also make the
> > schema in Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
> > make them at least mutually exclusive and deprecate the
> > input-schmitt that noone is using, maybe that is simpler than I think?
>
> I think that this is probably what to do. Mutual exclusion isn't
> difficult to set up there and if there's no property for "input-schmitt"
> then deprecating it sounds pretty reasonable?

Yeah I agree.

Do you want to look into it?

Otherwise it becomes my problem now that I've noticed it :D

Yours,
Linus Walleij

