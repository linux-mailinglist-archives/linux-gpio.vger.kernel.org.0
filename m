Return-Path: <linux-gpio+bounces-14442-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A481A000CC
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jan 2025 22:38:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 892993A3700
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jan 2025 21:38:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6BF71BC069;
	Thu,  2 Jan 2025 21:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cJ0Cauj+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D461B85C5
	for <linux-gpio@vger.kernel.org>; Thu,  2 Jan 2025 21:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735853917; cv=none; b=KQWVJ4iPz1UBVFVElmYIuqIW5BKrbN/Gv8GSa3jf8DNhAQYJ9Jgsr9Wfp0drhaMvVbBSpnPlPorNiX5XxuKkSduKkTnwgFyoumvK0ko1zskl5F72rC4afU1FHkqa+TRAx7mVxhhRTBfDYQuoZwfnF8OQz5xX+r+xCfXd4zt9VnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735853917; c=relaxed/simple;
	bh=/QAvkI6HxTL5269JiZxSPsPSVibxMR8kD9bdLWJznEE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c4/BX+Qq8l+VR/tSj5sHAWJFdrD2ewem+9OuacENg6v/vMpMAffnMIgEmF82XbVdM70LCMQiuWok796Jwg4S05Y1vd8rXTq3UOH+8kaEeMnaNGjD4IJqzySu4lE2eIlU6gG94IcJHlKcqekAEoCxdjuxf0DxJ1ODz+qNn2En5+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cJ0Cauj+; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3003943288bso136612111fa.0
        for <linux-gpio@vger.kernel.org>; Thu, 02 Jan 2025 13:38:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735853914; x=1736458714; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/QAvkI6HxTL5269JiZxSPsPSVibxMR8kD9bdLWJznEE=;
        b=cJ0Cauj+jBQqQI2PQDa661APtWMmqRA8XIMiQ6nFRboYf4yY9iIf8scKnIdzcTalBo
         elVkikJH08+jS1mkOlPN0J3rDAZshP2EvVZC5kSw0tMrznz4UGBkLwhvYZNaEPWIk9Bd
         j15723jnh2/TTwomTA1PdQZS4WRA2b3h0S27OQuruy8VbSoElIDwGcfwAz1QApU2gWSS
         b6PBehQ+Y7gx2OtGJ1mHG2XeTxKTwu6mQNWjo0NAn10l1Oo+j32jivcFZzIi5znzDxbG
         tZSB0TnbUnyjduhPdgJOKpjP+qTv/+jNWRoAyQPoGMHq/og7FSTJLwrWiCOQtxtlyNuT
         DxYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735853914; x=1736458714;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/QAvkI6HxTL5269JiZxSPsPSVibxMR8kD9bdLWJznEE=;
        b=nyXNcs68KSfan22Uh7hmQsKKV9R6bu8ue45MKlxeGhpyh1qq4dRoQYgJNLGTGjvzb+
         AKc3D6vacpDrAvwAs9cHrkmTdeKfBaMKzixMK3RqWo8Agf/JdRG4QcEPXOTobX6VUy+0
         YnhhV3PkqvK3HFig0ltvIkK657g2bfkz8ksG7PIZS4dzBgbTa1zp9OEPewDqYwv7XC0h
         a/NplC1pbQIzAPG4viLKnR979f2Gg+PP1rCT88HaZnDpulbQXQ990Sk0+ZFF6O1oATN3
         nrjJ7awLxnd0oN45qsfO35BvhKjkklbcmIPSvIad71yA2NVoq/W3AtTGcSwmsBJLGnkV
         aJXw==
X-Forwarded-Encrypted: i=1; AJvYcCXgmwDL/d7Xj7WgjhXKltewXRF0Z8XSFE5ApGgPkB5pTzrP6QbL1pHldke3JSS5D7H6/TJSbOhY935O@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1DxflT7knvXumaudMeV/nHtrurV9JPOx3CRcbxCUsWabym/qe
	N+1MEJu12QzO+XYCiCdvidCSAmdmisjuT5TRKtOLVcjfq+WJmuNgj80+684Fb7xcIripOqqox7O
	t+fX4XLq6A5ruJqroN3oT0usVuafKqhHhpfAUhw==
X-Gm-Gg: ASbGncv+M3kgC2mOPPnYfx2MH7b/Cm1dEIS9NnD8OVLK9Cyz9nKXgDYGYZZ9ovuims5
	r0d+8cIIII2TMJb/kdUkX1y2FcP7F3VSF6kl3
X-Google-Smtp-Source: AGHT+IGgIsXivWdreYxsNQCB/NDjR4aFqFJyr5ZVnW9Z9Bg0saPdaxlqhTNHFFgWt31bWtKnl3+Z4uC7x6U9BW4+fD8=
X-Received: by 2002:a05:6512:b0d:b0:540:2576:d0d8 with SMTP id
 2adb3069b0e04-54229561a90mr12900419e87.40.1735853913704; Thu, 02 Jan 2025
 13:38:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250102-mpc83xx-v1-0-86f78ba2a7af@posteo.net> <20250102-mpc83xx-v1-13-86f78ba2a7af@posteo.net>
In-Reply-To: <20250102-mpc83xx-v1-13-86f78ba2a7af@posteo.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 2 Jan 2025 22:38:22 +0100
Message-ID: <CACRpkdZVKC9HhUT8LqNnOU5NSE_S-ucuZRWACesEejDWwCyV5w@mail.gmail.com>
Subject: Re: [PATCH 13/19] gpio: mpc8xxx: Add MPC8314 support
To: j.ne@posteo.net
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Frank Li <Frank.Li@nxp.com>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 2, 2025 at 7:32=E2=80=AFPM J. Neusch=C3=A4fer via B4 Relay
<devnull+j.ne.posteo.net@kernel.org> wrote:

> From: "J. Neusch=C3=A4fer" <j.ne@posteo.net>
>
> GPIO input, output, and interrupts have been tested on a MPC8314E board.
>
> Signed-off-by: J. Neusch=C3=A4fer <j.ne@posteo.net>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Can Bartosz simply apply this and the binding patch and get these
two patches off our tail?

Yours,
Linus Walleij

