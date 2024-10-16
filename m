Return-Path: <linux-gpio+bounces-11451-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CADE19A0ED8
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 17:47:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 897D3281E74
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 15:47:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48DDB209F3E;
	Wed, 16 Oct 2024 15:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D3GAkLgI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 032043FBA5;
	Wed, 16 Oct 2024 15:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729093644; cv=none; b=uLRd40fOP0GaeSepK9W3dFF0/Yw7ECkFKM7W4+/19P+X3TTPuXFUziY5/g9On2n44yiv4MNlrUWjWyijQ6CGfhiAH6nw2A9Vll3q0gsxGcrs2YVoXhda/1k4Vl4PBzZ/E8vnzSdS0XFAgXwzuJXX4IA0u4xCYTbNbMVkj8O33Sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729093644; c=relaxed/simple;
	bh=7mlK3AYvgW+xE50G9eGOTHRBwxacE4lQ0GAd9yvb11Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tSuBf1n37fJ808R9iWLdJpdrdUy9jga9dguHhv7O480OSUjK2W6338bXbr0bO2HGrZbjH//jE0GFvD+oRH3uEPIsHwKkleO29zxS1+rweI3fvlAEQe40cPx8y4qYLZjS7w8aTMP8fxsj9g1ELjxCXAxeL7hY99SnazVi0MeUug4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D3GAkLgI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AA1DC4CEC5;
	Wed, 16 Oct 2024 15:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729093643;
	bh=7mlK3AYvgW+xE50G9eGOTHRBwxacE4lQ0GAd9yvb11Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=D3GAkLgIaft3UWyXQQtcS7utIumxbDYdQ1bS+9UMM7Eb2B2emOOb1e20AiYTkM05C
	 kWZixasH9cXl408RRWZAz41n1GXwFRECF3aZKvpc3ZidJOIbSkqzn8o+P2wx1RvKp3
	 CqB/qiEhpx0lRYsYtlBtMrp/POdpTLeAX28hV7aVqMrKGp/DUy+sj3wLblUy4U3A9H
	 Is+TP/1oZgfRLwMukULety7nrxN5ISq6VZt8Ov0lBH2/a9aliiYffHee6k6UeM2tXt
	 NpYO+Vo5+xOabSiqt2n/S/n4DcHknVFpw/Tqx154WOhNFfD+Vgbwz3T8+pDhRRr/Zn
	 rnY9quNRrEDIA==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-539e6c754bdso4061962e87.2;
        Wed, 16 Oct 2024 08:47:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVP+abPtQ8IDLhdtvDJuPama5GgFC+M72byFETvr0iy3wCV5+YF57KklI0vUZs+sEt5FtCZSM5Vo+931g==@vger.kernel.org, AJvYcCWHrSHhUWeOkODIlWyeI15VCW3sUJVwQV4/E+yZfah0h+uTWEaL/vmegmemf4PhwY1mljtCiPGsykb0@vger.kernel.org
X-Gm-Message-State: AOJu0YzhJqWXZ1GINQoVTQID/WJk2xj8VotI4bf9BTJITz/+Mw3DeLPK
	c67XFZIvDmYizlW3K0K9EearP6NrWIpwe4XE7cvBx6apiUqBY/7vPuTNtkWUGcIQ5P2iwMZYO4Z
	+IYie4Bnypd8UrJeCig+wrKpouQ==
X-Google-Smtp-Source: AGHT+IEo5yXHtrex9CiwcatYq3p/jl52IMHY1Z2J7wnho7MZbhvT/ZS80JSHUB7EI7fDqVcVKvqzZzTLU65t/9Q7NYw=
X-Received: by 2002:a05:6512:3ca1:b0:52e:e3c3:643f with SMTP id
 2adb3069b0e04-539da3c1c66mr9141014e87.2.1729093642051; Wed, 16 Oct 2024
 08:47:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241016-gpio-ngpios-v1-0-f16cf154f715@linaro.org> <20241016-gpio-ngpios-v1-1-f16cf154f715@linaro.org>
In-Reply-To: <20241016-gpio-ngpios-v1-1-f16cf154f715@linaro.org>
From: Rob Herring <robh@kernel.org>
Date: Wed, 16 Oct 2024 10:47:08 -0500
X-Gmail-Original-Message-ID: <CAL_JsqK-Nd6izk6RFf4NyoOCkobDwye+QPsRKHBDwovxO9NTDQ@mail.gmail.com>
Message-ID: <CAL_JsqK-Nd6izk6RFf4NyoOCkobDwye+QPsRKHBDwovxO9NTDQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: gpio-mmio: Add ngpios property
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 16, 2024 at 2:21=E2=80=AFAM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> This adds the ngpios property to MMIO GPIO. We restrict the
> property to 1..63 since there is no point in 0 GPIO lines and
> we support up to 64bits wide registers for now.

Why does it need to be restricted? Is something bad going to happen if
for some reason someone tries to control a non-existent GPIO? If there
is, maybe there should be a specific compatible as the h/w is not so
generic.

Rob

